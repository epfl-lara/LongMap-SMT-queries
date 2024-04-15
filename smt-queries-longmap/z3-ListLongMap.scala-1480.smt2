; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28262 () Bool)

(assert start!28262)

(declare-datatypes ((SeekEntryResult!2060 0))(
  ( (MissingZero!2060 (index!10410 (_ BitVec 32))) (Found!2060 (index!10411 (_ BitVec 32))) (Intermediate!2060 (undefined!2872 Bool) (index!10412 (_ BitVec 32)) (x!28632 (_ BitVec 32))) (Undefined!2060) (MissingVacant!2060 (index!10413 (_ BitVec 32))) )
))
(declare-fun lt!142758 () SeekEntryResult!2060)

(declare-fun b!289462 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14569 0))(
  ( (array!14570 (arr!6912 (Array (_ BitVec 32) (_ BitVec 64))) (size!7265 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14569)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!142753 () SeekEntryResult!2060)

(assert (=> b!289462 (and (= lt!142758 lt!142753) (= (select (store (arr!6912 a!3312) i!1256 k0!2524) (index!10412 lt!142753)) k0!2524))))

(declare-datatypes ((Unit!9060 0))(
  ( (Unit!9061) )
))
(declare-fun lt!142757 () Unit!9060)

(declare-fun lt!142752 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9060)

(assert (=> b!289462 (= lt!142757 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142752 (index!10412 lt!142753) (x!28632 lt!142753) mask!3809))))

(assert (=> b!289462 (and (= (select (arr!6912 a!3312) (index!10412 lt!142753)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10412 lt!142753) i!1256))))

(declare-fun e!183243 () Unit!9060)

(declare-fun Unit!9062 () Unit!9060)

(assert (=> b!289462 (= e!183243 Unit!9062)))

(declare-fun b!289463 () Bool)

(declare-fun e!183242 () Bool)

(declare-fun e!183239 () Bool)

(assert (=> b!289463 (= e!183242 e!183239)))

(declare-fun res!151063 () Bool)

(assert (=> b!289463 (=> (not res!151063) (not e!183239))))

(declare-fun lt!142756 () Bool)

(declare-fun lt!142755 () SeekEntryResult!2060)

(assert (=> b!289463 (= res!151063 (or lt!142756 (= lt!142755 (MissingVacant!2060 i!1256))))))

(assert (=> b!289463 (= lt!142756 (= lt!142755 (MissingZero!2060 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14569 (_ BitVec 32)) SeekEntryResult!2060)

(assert (=> b!289463 (= lt!142755 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!151061 () Bool)

(assert (=> start!28262 (=> (not res!151061) (not e!183242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28262 (= res!151061 (validMask!0 mask!3809))))

(assert (=> start!28262 e!183242))

(assert (=> start!28262 true))

(declare-fun array_inv!4884 (array!14569) Bool)

(assert (=> start!28262 (array_inv!4884 a!3312)))

(declare-fun b!289464 () Bool)

(declare-fun res!151059 () Bool)

(assert (=> b!289464 (=> (not res!151059) (not e!183242))))

(declare-fun arrayContainsKey!0 (array!14569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289464 (= res!151059 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289465 () Bool)

(declare-fun e!183240 () Bool)

(assert (=> b!289465 (= e!183240 false)))

(declare-fun lt!142754 () Unit!9060)

(declare-fun e!183241 () Unit!9060)

(assert (=> b!289465 (= lt!142754 e!183241)))

(declare-fun c!46764 () Bool)

(get-info :version)

(assert (=> b!289465 (= c!46764 (or (and ((_ is Intermediate!2060) lt!142753) (undefined!2872 lt!142753)) (and ((_ is Intermediate!2060) lt!142753) (= (select (arr!6912 a!3312) (index!10412 lt!142753)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2060) lt!142753) (= (select (arr!6912 a!3312) (index!10412 lt!142753)) k0!2524))))))

(declare-fun b!289466 () Bool)

(assert (=> b!289466 (= e!183241 e!183243)))

(declare-fun c!46765 () Bool)

(assert (=> b!289466 (= c!46765 ((_ is Intermediate!2060) lt!142753))))

(declare-fun b!289467 () Bool)

(declare-fun res!151062 () Bool)

(assert (=> b!289467 (=> (not res!151062) (not e!183239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14569 (_ BitVec 32)) Bool)

(assert (=> b!289467 (= res!151062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289468 () Bool)

(assert (=> b!289468 (= e!183239 e!183240)))

(declare-fun res!151057 () Bool)

(assert (=> b!289468 (=> (not res!151057) (not e!183240))))

(assert (=> b!289468 (= res!151057 lt!142756)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14569 (_ BitVec 32)) SeekEntryResult!2060)

(assert (=> b!289468 (= lt!142758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142752 k0!2524 (array!14570 (store (arr!6912 a!3312) i!1256 k0!2524) (size!7265 a!3312)) mask!3809))))

(assert (=> b!289468 (= lt!142753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142752 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289468 (= lt!142752 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289469 () Bool)

(assert (=> b!289469 false))

(declare-fun Unit!9063 () Unit!9060)

(assert (=> b!289469 (= e!183243 Unit!9063)))

(declare-fun b!289470 () Bool)

(declare-fun res!151060 () Bool)

(assert (=> b!289470 (=> (not res!151060) (not e!183242))))

(assert (=> b!289470 (= res!151060 (and (= (size!7265 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7265 a!3312))))))

(declare-fun b!289471 () Bool)

(declare-fun res!151058 () Bool)

(assert (=> b!289471 (=> (not res!151058) (not e!183242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289471 (= res!151058 (validKeyInArray!0 k0!2524))))

(declare-fun b!289472 () Bool)

(declare-fun Unit!9064 () Unit!9060)

(assert (=> b!289472 (= e!183241 Unit!9064)))

(assert (=> b!289472 false))

(assert (= (and start!28262 res!151061) b!289470))

(assert (= (and b!289470 res!151060) b!289471))

(assert (= (and b!289471 res!151058) b!289464))

(assert (= (and b!289464 res!151059) b!289463))

(assert (= (and b!289463 res!151063) b!289467))

(assert (= (and b!289467 res!151062) b!289468))

(assert (= (and b!289468 res!151057) b!289465))

(assert (= (and b!289465 c!46764) b!289472))

(assert (= (and b!289465 (not c!46764)) b!289466))

(assert (= (and b!289466 c!46765) b!289462))

(assert (= (and b!289466 (not c!46765)) b!289469))

(declare-fun m!303119 () Bool)

(assert (=> start!28262 m!303119))

(declare-fun m!303121 () Bool)

(assert (=> start!28262 m!303121))

(declare-fun m!303123 () Bool)

(assert (=> b!289467 m!303123))

(declare-fun m!303125 () Bool)

(assert (=> b!289465 m!303125))

(declare-fun m!303127 () Bool)

(assert (=> b!289464 m!303127))

(declare-fun m!303129 () Bool)

(assert (=> b!289463 m!303129))

(declare-fun m!303131 () Bool)

(assert (=> b!289468 m!303131))

(declare-fun m!303133 () Bool)

(assert (=> b!289468 m!303133))

(declare-fun m!303135 () Bool)

(assert (=> b!289468 m!303135))

(declare-fun m!303137 () Bool)

(assert (=> b!289468 m!303137))

(declare-fun m!303139 () Bool)

(assert (=> b!289471 m!303139))

(assert (=> b!289462 m!303131))

(declare-fun m!303141 () Bool)

(assert (=> b!289462 m!303141))

(declare-fun m!303143 () Bool)

(assert (=> b!289462 m!303143))

(assert (=> b!289462 m!303125))

(check-sat (not start!28262) (not b!289463) (not b!289468) (not b!289471) (not b!289467) (not b!289464) (not b!289462))
(check-sat)
