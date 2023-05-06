-- CreateTable
CREATE TABLE `copy_tbl_law` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(150) NOT NULL,
    `lawTitle` VARCHAR(200) NOT NULL,
    `description` TEXT NOT NULL,
    `documentFile` TEXT NOT NULL,
    `documentType` TEXT NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `copy_tbl_request_donation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(50) NOT NULL,
    `donationRequestId` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `keys` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `key` VARCHAR(40) NOT NULL,
    `level` INTEGER NOT NULL,
    `ignore_limits` BOOLEAN NOT NULL DEFAULT false,
    `is_private_key` BOOLEAN NOT NULL DEFAULT false,
    `ip_addresses` TEXT NULL,
    `date_created` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_aboutApp` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `privacyPolicy` LONGTEXT NOT NULL,
    `termsConditions` LONGTEXT NOT NULL,
    `aboutUS` LONGTEXT NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_chat` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fromRef` VARCHAR(150) NOT NULL,
    `toRef` VARCHAR(150) NOT NULL,
    `lastMessage` VARCHAR(250) NOT NULL DEFAULT '',
    `lastSender` VARCHAR(250) NOT NULL DEFAULT '',
    `msgCount` INTEGER NOT NULL DEFAULT 0,
    `create_at` DATETIME(0) NOT NULL,
    `update_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_chatHistory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `chatRef` VARCHAR(150) NOT NULL,
    `orderNumber` VARCHAR(150) NOT NULL,
    `senderRef` VARCHAR(150) NOT NULL,
    `receiverRef` VARCHAR(150) NOT NULL,
    `userType` VARCHAR(150) NOT NULL,
    `message` VARCHAR(250) NOT NULL,
    `chatImage` VARCHAR(250) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_comment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `parentCommentId` INTEGER NOT NULL,
    `commentTo` INTEGER NOT NULL,
    `commentFrom` VARCHAR(30) NOT NULL,
    `comment` VARCHAR(200) NOT NULL,
    `conmmentOn` VARCHAR(15) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_comment_like` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `recordId` INTEGER NOT NULL,
    `likeFrom` VARCHAR(50) NOT NULL,
    `type` INTEGER NULL,
    `likeFor` VARCHAR(15) NOT NULL,
    `create_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_debate` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(150) NOT NULL,
    `meetingId` VARCHAR(150) NOT NULL,
    `topic` VARCHAR(150) NOT NULL,
    `title` VARCHAR(150) NOT NULL,
    `message` VARCHAR(200) NOT NULL,
    `areaLimit` VARCHAR(200) NOT NULL DEFAULT '',
    `isPublic` INTEGER NULL DEFAULT 0,
    `hostLive` INTEGER NULL DEFAULT 0,
    `coverImage` VARCHAR(200) NOT NULL,
    `date` DATE NOT NULL,
    `time` TIME(0) NOT NULL,
    `debateDuration` TIME(0) NOT NULL,
    `requestedUsers` TEXT NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_debateWinnerRecord` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `debateId` INTEGER NOT NULL,
    `winnerRef` VARCHAR(100) NOT NULL,
    `rank` INTEGER NOT NULL,
    `debateResult` VARCHAR(15) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_debate_comment` (
    `comment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `comment_from` VARCHAR(255) NULL,
    `comment_to` VARCHAR(255) NULL,
    `debate_id` INTEGER NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` DATETIME(0) NULL,
    `messages` TEXT NULL,
    `optional` TEXT NULL,
    `comment_from_fullName` VARCHAR(255) NULL,

    PRIMARY KEY (`comment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_debate_request` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `debateId` INTEGER NOT NULL,
    `userRefTo` VARCHAR(150) NOT NULL,
    `userRefFrom` VARCHAR(150) NOT NULL,
    `requestStatus` VARCHAR(255) NOT NULL DEFAULT 'requested',
    `isMute` INTEGER NULL DEFAULT 0,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_debaterVote` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `debateId` INTEGER NOT NULL,
    `voteBy` VARCHAR(50) NOT NULL,
    `voteTo` VARCHAR(50) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_donate` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dobavteTo` INTEGER NOT NULL,
    `donnersId` INTEGER NOT NULL,
    `amount` INTEGER NOT NULL,
    `donnerType` VARCHAR(150) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `update_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_donation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `donorRef` VARCHAR(100) NOT NULL,
    `toRef` VARCHAR(100) NOT NULL,
    `receiptId` VARCHAR(150) NOT NULL,
    `amount` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_donationTagPeople` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `donationId` INTEGER NOT NULL,
    `peopleRef` VARCHAR(50) NOT NULL DEFAULT '',
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_event` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(150) NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `price` INTEGER NOT NULL,
    `start_date` DATE NOT NULL,
    `start_time` TIME(0) NOT NULL,
    `end_date` DATE NOT NULL,
    `end_time` TIME(0) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `cover_image` VARCHAR(255) NOT NULL,
    `ent_video` VARCHAR(255) NOT NULL,
    `purchaseCount` INTEGER NOT NULL DEFAULT 0,
    `areaLimit` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_feed` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `recordType` VARCHAR(100) NOT NULL,
    `recordId` INTEGER NOT NULL,
    `userRef` VARCHAR(100) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `filePath` VARCHAR(255) NOT NULL,
    `fileType` VARCHAR(100) NOT NULL,
    `isShared` INTEGER NULL DEFAULT 0,
    `donationGoal` VARCHAR(100) NOT NULL,
    `petitionId` INTEGER NOT NULL,
    `areaLimit` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_follow` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(100) NOT NULL,
    `followRef` VARCHAR(100) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_govtData` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(150) NOT NULL,
    `picture` VARCHAR(250) NOT NULL,
    `party` VARCHAR(150) NOT NULL,
    `state` VARCHAR(150) NOT NULL,
    `role` VARCHAR(150) NOT NULL,
    `contactInfo` VARCHAR(150) NOT NULL DEFAULT '',
    `officeLocation` VARCHAR(250) NOT NULL DEFAULT '',
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_invite` (
    `invite_id` INTEGER NOT NULL AUTO_INCREMENT,
    `invite_topic` VARCHAR(255) NULL,
    `invite_date` DATE NULL,
    `invite_starttime` TIME(0) NULL,
    `invite_endtime` TIME(0) NULL,
    `invite_feature_image` VARCHAR(255) NULL,
    `invite_moderator_style_type` VARCHAR(255) NULL,
    `invite_moderator_style_person` VARCHAR(255) NULL,
    `invite_opposition` VARCHAR(255) NULL,
    `invite_from` VARCHAR(255) NULL,
    `invite_addbysytem` VARCHAR(255) NULL,
    `invite_created` DATETIME(0) NULL,
    `invite_updated` DATETIME(0) NULL,

    PRIMARY KEY (`invite_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_invite_request` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `inviteId` INTEGER NOT NULL,
    `userRefTo` VARCHAR(150) NOT NULL,
    `userRefFrom` VARCHAR(150) NOT NULL,
    `requestStatus` VARCHAR(255) NOT NULL DEFAULT 'requested',
    `isMute` INTEGER NULL DEFAULT 0,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_judicial` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(150) NOT NULL,
    `appointmentBy` VARCHAR(150) NOT NULL,
    `memberPic` VARCHAR(255) NOT NULL,
    `dob` DATE NOT NULL,
    `age` INTEGER NOT NULL,
    `scv` VARCHAR(50) NOT NULL,
    `appointmentDate` DATE NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_like` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `recordId` INTEGER NOT NULL,
    `likeFrom` VARCHAR(50) NOT NULL,
    `type` INTEGER NULL,
    `likeFor` VARCHAR(15) NOT NULL,
    `create_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_msg` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `msg` TEXT NULL,
    `date` DATETIME(0) NULL,
    `status` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_notification` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `notifyTo` VARCHAR(150) NOT NULL,
    `notifyFrom` VARCHAR(150) NOT NULL,
    `notificationText` VARCHAR(250) NOT NULL,
    `seen` INTEGER NOT NULL DEFAULT 1,
    `type` VARCHAR(50) NOT NULL DEFAULT '',
    `create_at` DATETIME(0) NOT NULL,
    `update_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_petition` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(150) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `discription` TEXT NOT NULL,
    `websiteLink` TEXT NOT NULL,
    `signCount` INTEGER NOT NULL DEFAULT 0,
    `getSignCount` INTEGER NOT NULL DEFAULT 0,
    `duration` VARCHAR(20) NOT NULL DEFAULT '',
    `location` VARCHAR(200) NOT NULL DEFAULT '',
    `areaLimit` VARCHAR(255) NULL,
    `petitionMedia` VARCHAR(250) NOT NULL,
    `mediaType` VARCHAR(250) NOT NULL,
    `expiryDate` DATE NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_polling` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createBy` VARCHAR(50) NOT NULL,
    `title` VARCHAR(250) NOT NULL,
    `options` VARCHAR(250) NOT NULL,
    `tillDateTime` DATETIME(0) NOT NULL,
    `areaLimit` VARCHAR(255) NULL,
    `pollEndStatus` INTEGER NULL DEFAULT 0,
    `isPublic` INTEGER NULL DEFAULT 0,
    `isMultiple` INTEGER NULL DEFAULT 0,
    `pollImage` VARCHAR(255) NOT NULL DEFAULT '',
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_pollingResult` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `pollingId` INTEGER NOT NULL,
    `pollByRef` VARCHAR(50) NOT NULL,
    `pollOption` VARCHAR(200) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_purchaseRecord` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productId` INTEGER NOT NULL,
    `userRef` VARCHAR(150) NOT NULL,
    `ticketCount` INTEGER NOT NULL,
    `transactionID` VARCHAR(150) NOT NULL,
    `totalAmt` INTEGER NOT NULL,
    `is_showing` INTEGER NULL,
    `create_at` DATETIME(0) NOT NULL,
    `update_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_reportUser` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_ref` VARCHAR(100) NOT NULL,
    `reported_ref` VARCHAR(100) NOT NULL,
    `is_block` INTEGER NULL,
    `reason` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_signPetitionInfo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(150) NOT NULL,
    `petitionId` INTEGER NOT NULL,
    `signImageUrl` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_social_media_accs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(100) NOT NULL,
    `instagram` VARCHAR(255) NOT NULL DEFAULT '',
    `twitter` VARCHAR(255) NOT NULL DEFAULT '',
    `facebook` VARCHAR(255) NOT NULL DEFAULT '',
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_totalVoteByArea` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userRef` VARCHAR(150) NOT NULL,
    `area` VARCHAR(255) NULL,
    `totalVote` INTEGER NOT NULL,
    `rank` VARCHAR(20) NOT NULL DEFAULT '',
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(255) NULL,
    `userRef` VARCHAR(150) NOT NULL,
    `fullName` VARCHAR(200) NOT NULL,
    `email` VARCHAR(200) NOT NULL,
    `countryCode` VARCHAR(200) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `password` VARCHAR(250) NOT NULL,
    `notification` INTEGER NULL DEFAULT 1,
    `donationsVisible` INTEGER NULL DEFAULT 1,
    `profilePic` VARCHAR(200) NOT NULL,
    `coverPhoto` VARCHAR(200) NOT NULL,
    `about` TEXT NOT NULL,
    `webUrl` VARCHAR(255) NOT NULL,
    `countryName` VARCHAR(150) NOT NULL,
    `stateName` VARCHAR(150) NOT NULL,
    `cityName` VARCHAR(150) NOT NULL,
    `politicalParty` VARCHAR(150) NOT NULL,
    `deviceType` VARCHAR(200) NOT NULL,
    `deviceToken` VARCHAR(200) NOT NULL,
    `loginStatus` INTEGER NULL DEFAULT 0,
    `Is_Active` INTEGER NULL DEFAULT 0,
    `validationCode` VARCHAR(200) NULL,
    `followCount` INTEGER NULL DEFAULT 0,
    `reportCount` INTEGER NULL DEFAULT 0,
    `is_block` INTEGER NULL DEFAULT 0,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_vote` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `voteTo` INTEGER NOT NULL,
    `voteBy` VARCHAR(150) NOT NULL,
    `create_at` DATETIME(0) NOT NULL,
    `update_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tbl_winning` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `debateId` INTEGER NOT NULL,
    `winnerRef` VARCHAR(150) NOT NULL,
    `create_at` DATETIME(0) NOT NULL,
    `update_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
