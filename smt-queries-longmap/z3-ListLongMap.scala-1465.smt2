; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28168 () Bool)

(assert start!28168)

(declare-fun b!288516 () Bool)

(declare-fun res!150119 () Bool)

(declare-fun e!182670 () Bool)

(assert (=> b!288516 (=> (not res!150119) (not e!182670))))

(declare-datatypes ((array!14487 0))(
  ( (array!14488 (arr!6871 (Array (_ BitVec 32) (_ BitVec 64))) (size!7223 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14487)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14487 (_ BitVec 32)) Bool)

(assert (=> b!288516 (= res!150119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288518 () Bool)

(declare-fun res!150115 () Bool)

(declare-fun e!182669 () Bool)

(assert (=> b!288518 (=> (not res!150115) (not e!182669))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288518 (= res!150115 (validKeyInArray!0 k0!2524))))

(declare-fun b!288519 () Bool)

(declare-fun res!150114 () Bool)

(assert (=> b!288519 (=> (not res!150114) (not e!182669))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288519 (= res!150114 (and (= (size!7223 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7223 a!3312))))))

(declare-fun b!288520 () Bool)

(declare-fun e!182671 () Bool)

(assert (=> b!288520 (= e!182670 e!182671)))

(declare-fun res!150117 () Bool)

(assert (=> b!288520 (=> (not res!150117) (not e!182671))))

(declare-fun lt!142163 () Bool)

(assert (=> b!288520 (= res!150117 lt!142163)))

(declare-fun lt!142164 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1985 0))(
  ( (MissingZero!1985 (index!10110 (_ BitVec 32))) (Found!1985 (index!10111 (_ BitVec 32))) (Intermediate!1985 (undefined!2797 Bool) (index!10112 (_ BitVec 32)) (x!28438 (_ BitVec 32))) (Undefined!1985) (MissingVacant!1985 (index!10113 (_ BitVec 32))) )
))
(declare-fun lt!142167 () SeekEntryResult!1985)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14487 (_ BitVec 32)) SeekEntryResult!1985)

(assert (=> b!288520 (= lt!142167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142164 k0!2524 (array!14488 (store (arr!6871 a!3312) i!1256 k0!2524) (size!7223 a!3312)) mask!3809))))

(declare-fun lt!142165 () SeekEntryResult!1985)

(assert (=> b!288520 (= lt!142165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142164 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288520 (= lt!142164 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288521 () Bool)

(declare-fun e!182672 () Bool)

(assert (=> b!288521 (= e!182672 (not true))))

(assert (=> b!288521 (and (= (select (arr!6871 a!3312) (index!10112 lt!142165)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10112 lt!142165) i!1256))))

(declare-fun b!288522 () Bool)

(assert (=> b!288522 (= e!182669 e!182670)))

(declare-fun res!150120 () Bool)

(assert (=> b!288522 (=> (not res!150120) (not e!182670))))

(declare-fun lt!142166 () SeekEntryResult!1985)

(assert (=> b!288522 (= res!150120 (or lt!142163 (= lt!142166 (MissingVacant!1985 i!1256))))))

(assert (=> b!288522 (= lt!142163 (= lt!142166 (MissingZero!1985 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14487 (_ BitVec 32)) SeekEntryResult!1985)

(assert (=> b!288522 (= lt!142166 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288523 () Bool)

(assert (=> b!288523 (= e!182671 e!182672)))

(declare-fun res!150116 () Bool)

(assert (=> b!288523 (=> (not res!150116) (not e!182672))))

(declare-fun lt!142162 () Bool)

(assert (=> b!288523 (= res!150116 (and (or lt!142162 (not (undefined!2797 lt!142165))) (or lt!142162 (not (= (select (arr!6871 a!3312) (index!10112 lt!142165)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142162 (not (= (select (arr!6871 a!3312) (index!10112 lt!142165)) k0!2524))) (not lt!142162)))))

(get-info :version)

(assert (=> b!288523 (= lt!142162 (not ((_ is Intermediate!1985) lt!142165)))))

(declare-fun b!288517 () Bool)

(declare-fun res!150113 () Bool)

(assert (=> b!288517 (=> (not res!150113) (not e!182669))))

(declare-fun arrayContainsKey!0 (array!14487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288517 (= res!150113 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!150118 () Bool)

(assert (=> start!28168 (=> (not res!150118) (not e!182669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28168 (= res!150118 (validMask!0 mask!3809))))

(assert (=> start!28168 e!182669))

(assert (=> start!28168 true))

(declare-fun array_inv!4821 (array!14487) Bool)

(assert (=> start!28168 (array_inv!4821 a!3312)))

(assert (= (and start!28168 res!150118) b!288519))

(assert (= (and b!288519 res!150114) b!288518))

(assert (= (and b!288518 res!150115) b!288517))

(assert (= (and b!288517 res!150113) b!288522))

(assert (= (and b!288522 res!150120) b!288516))

(assert (= (and b!288516 res!150119) b!288520))

(assert (= (and b!288520 res!150117) b!288523))

(assert (= (and b!288523 res!150116) b!288521))

(declare-fun m!302903 () Bool)

(assert (=> b!288516 m!302903))

(declare-fun m!302905 () Bool)

(assert (=> b!288522 m!302905))

(declare-fun m!302907 () Bool)

(assert (=> b!288520 m!302907))

(declare-fun m!302909 () Bool)

(assert (=> b!288520 m!302909))

(declare-fun m!302911 () Bool)

(assert (=> b!288520 m!302911))

(declare-fun m!302913 () Bool)

(assert (=> b!288520 m!302913))

(declare-fun m!302915 () Bool)

(assert (=> b!288517 m!302915))

(declare-fun m!302917 () Bool)

(assert (=> b!288518 m!302917))

(declare-fun m!302919 () Bool)

(assert (=> b!288523 m!302919))

(declare-fun m!302921 () Bool)

(assert (=> start!28168 m!302921))

(declare-fun m!302923 () Bool)

(assert (=> start!28168 m!302923))

(assert (=> b!288521 m!302919))

(check-sat (not b!288520) (not b!288522) (not start!28168) (not b!288517) (not b!288518) (not b!288516))
(check-sat)
