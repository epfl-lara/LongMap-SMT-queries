; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86508 () Bool)

(assert start!86508)

(declare-fun b!1002115 () Bool)

(declare-fun e!564560 () Bool)

(declare-fun e!564557 () Bool)

(assert (=> b!1002115 (= e!564560 e!564557)))

(declare-fun res!671721 () Bool)

(assert (=> b!1002115 (=> (not res!671721) (not e!564557))))

(declare-datatypes ((SeekEntryResult!9410 0))(
  ( (MissingZero!9410 (index!40011 (_ BitVec 32))) (Found!9410 (index!40012 (_ BitVec 32))) (Intermediate!9410 (undefined!10222 Bool) (index!40013 (_ BitVec 32)) (x!87441 (_ BitVec 32))) (Undefined!9410) (MissingVacant!9410 (index!40014 (_ BitVec 32))) )
))
(declare-fun lt!442891 () SeekEntryResult!9410)

(declare-fun lt!442892 () SeekEntryResult!9410)

(assert (=> b!1002115 (= res!671721 (= lt!442891 lt!442892))))

(declare-datatypes ((array!63256 0))(
  ( (array!63257 (arr!30453 (Array (_ BitVec 32) (_ BitVec 64))) (size!30957 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63256)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63256 (_ BitVec 32)) SeekEntryResult!9410)

(assert (=> b!1002115 (= lt!442891 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30453 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002116 () Bool)

(declare-fun res!671719 () Bool)

(declare-fun e!564555 () Bool)

(assert (=> b!1002116 (=> (not res!671719) (not e!564555))))

(declare-fun lt!442897 () array!63256)

(declare-fun lt!442890 () (_ BitVec 64))

(assert (=> b!1002116 (= res!671719 (not (= lt!442891 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442890 lt!442897 mask!3464))))))

(declare-fun b!1002117 () Bool)

(declare-fun res!671732 () Bool)

(declare-fun e!564559 () Bool)

(assert (=> b!1002117 (=> (not res!671732) (not e!564559))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002117 (= res!671732 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30957 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30957 a!3219))))))

(declare-fun b!1002118 () Bool)

(declare-fun res!671728 () Bool)

(declare-fun e!564556 () Bool)

(assert (=> b!1002118 (=> (not res!671728) (not e!564556))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002118 (= res!671728 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!671720 () Bool)

(assert (=> start!86508 (=> (not res!671720) (not e!564556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86508 (= res!671720 (validMask!0 mask!3464))))

(assert (=> start!86508 e!564556))

(declare-fun array_inv!23596 (array!63256) Bool)

(assert (=> start!86508 (array_inv!23596 a!3219)))

(assert (=> start!86508 true))

(declare-fun b!1002119 () Bool)

(declare-fun e!564558 () Bool)

(assert (=> b!1002119 (= e!564558 false)))

(declare-fun lt!442893 () (_ BitVec 32))

(declare-fun lt!442894 () SeekEntryResult!9410)

(assert (=> b!1002119 (= lt!442894 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442893 lt!442890 lt!442897 mask!3464))))

(declare-fun b!1002120 () Bool)

(declare-fun res!671726 () Bool)

(assert (=> b!1002120 (=> (not res!671726) (not e!564556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002120 (= res!671726 (validKeyInArray!0 (select (arr!30453 a!3219) j!170)))))

(declare-fun b!1002121 () Bool)

(assert (=> b!1002121 (= e!564559 e!564560)))

(declare-fun res!671731 () Bool)

(assert (=> b!1002121 (=> (not res!671731) (not e!564560))))

(declare-fun lt!442895 () SeekEntryResult!9410)

(assert (=> b!1002121 (= res!671731 (= lt!442895 lt!442892))))

(assert (=> b!1002121 (= lt!442892 (Intermediate!9410 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002121 (= lt!442895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30453 a!3219) j!170) mask!3464) (select (arr!30453 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002122 () Bool)

(declare-fun res!671722 () Bool)

(assert (=> b!1002122 (=> (not res!671722) (not e!564555))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002122 (= res!671722 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002123 () Bool)

(declare-fun res!671724 () Bool)

(assert (=> b!1002123 (=> (not res!671724) (not e!564559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63256 (_ BitVec 32)) Bool)

(assert (=> b!1002123 (= res!671724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002124 () Bool)

(declare-fun res!671723 () Bool)

(assert (=> b!1002124 (=> (not res!671723) (not e!564558))))

(assert (=> b!1002124 (= res!671723 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442893 (select (arr!30453 a!3219) j!170) a!3219 mask!3464) lt!442892))))

(declare-fun b!1002125 () Bool)

(declare-fun res!671718 () Bool)

(assert (=> b!1002125 (=> (not res!671718) (not e!564556))))

(assert (=> b!1002125 (= res!671718 (and (= (size!30957 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30957 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30957 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002126 () Bool)

(assert (=> b!1002126 (= e!564557 e!564555)))

(declare-fun res!671727 () Bool)

(assert (=> b!1002126 (=> (not res!671727) (not e!564555))))

(assert (=> b!1002126 (= res!671727 (not (= lt!442895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442890 mask!3464) lt!442890 lt!442897 mask!3464))))))

(assert (=> b!1002126 (= lt!442890 (select (store (arr!30453 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002126 (= lt!442897 (array!63257 (store (arr!30453 a!3219) i!1194 k0!2224) (size!30957 a!3219)))))

(declare-fun b!1002127 () Bool)

(declare-fun res!671730 () Bool)

(assert (=> b!1002127 (=> (not res!671730) (not e!564559))))

(declare-datatypes ((List!21195 0))(
  ( (Nil!21192) (Cons!21191 (h!22368 (_ BitVec 64)) (t!30187 List!21195)) )
))
(declare-fun arrayNoDuplicates!0 (array!63256 (_ BitVec 32) List!21195) Bool)

(assert (=> b!1002127 (= res!671730 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21192))))

(declare-fun b!1002128 () Bool)

(assert (=> b!1002128 (= e!564556 e!564559)))

(declare-fun res!671729 () Bool)

(assert (=> b!1002128 (=> (not res!671729) (not e!564559))))

(declare-fun lt!442896 () SeekEntryResult!9410)

(assert (=> b!1002128 (= res!671729 (or (= lt!442896 (MissingVacant!9410 i!1194)) (= lt!442896 (MissingZero!9410 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63256 (_ BitVec 32)) SeekEntryResult!9410)

(assert (=> b!1002128 (= lt!442896 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002129 () Bool)

(assert (=> b!1002129 (= e!564555 e!564558)))

(declare-fun res!671717 () Bool)

(assert (=> b!1002129 (=> (not res!671717) (not e!564558))))

(assert (=> b!1002129 (= res!671717 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442893 #b00000000000000000000000000000000) (bvslt lt!442893 (size!30957 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002129 (= lt!442893 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002130 () Bool)

(declare-fun res!671725 () Bool)

(assert (=> b!1002130 (=> (not res!671725) (not e!564556))))

(assert (=> b!1002130 (= res!671725 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86508 res!671720) b!1002125))

(assert (= (and b!1002125 res!671718) b!1002120))

(assert (= (and b!1002120 res!671726) b!1002130))

(assert (= (and b!1002130 res!671725) b!1002118))

(assert (= (and b!1002118 res!671728) b!1002128))

(assert (= (and b!1002128 res!671729) b!1002123))

(assert (= (and b!1002123 res!671724) b!1002127))

(assert (= (and b!1002127 res!671730) b!1002117))

(assert (= (and b!1002117 res!671732) b!1002121))

(assert (= (and b!1002121 res!671731) b!1002115))

(assert (= (and b!1002115 res!671721) b!1002126))

(assert (= (and b!1002126 res!671727) b!1002116))

(assert (= (and b!1002116 res!671719) b!1002122))

(assert (= (and b!1002122 res!671722) b!1002129))

(assert (= (and b!1002129 res!671717) b!1002124))

(assert (= (and b!1002124 res!671723) b!1002119))

(declare-fun m!927499 () Bool)

(assert (=> b!1002124 m!927499))

(assert (=> b!1002124 m!927499))

(declare-fun m!927501 () Bool)

(assert (=> b!1002124 m!927501))

(declare-fun m!927503 () Bool)

(assert (=> b!1002116 m!927503))

(declare-fun m!927505 () Bool)

(assert (=> b!1002126 m!927505))

(assert (=> b!1002126 m!927505))

(declare-fun m!927507 () Bool)

(assert (=> b!1002126 m!927507))

(declare-fun m!927509 () Bool)

(assert (=> b!1002126 m!927509))

(declare-fun m!927511 () Bool)

(assert (=> b!1002126 m!927511))

(declare-fun m!927513 () Bool)

(assert (=> b!1002128 m!927513))

(assert (=> b!1002115 m!927499))

(assert (=> b!1002115 m!927499))

(declare-fun m!927515 () Bool)

(assert (=> b!1002115 m!927515))

(declare-fun m!927517 () Bool)

(assert (=> b!1002129 m!927517))

(declare-fun m!927519 () Bool)

(assert (=> b!1002119 m!927519))

(declare-fun m!927521 () Bool)

(assert (=> start!86508 m!927521))

(declare-fun m!927523 () Bool)

(assert (=> start!86508 m!927523))

(declare-fun m!927525 () Bool)

(assert (=> b!1002123 m!927525))

(declare-fun m!927527 () Bool)

(assert (=> b!1002118 m!927527))

(declare-fun m!927529 () Bool)

(assert (=> b!1002130 m!927529))

(assert (=> b!1002121 m!927499))

(assert (=> b!1002121 m!927499))

(declare-fun m!927531 () Bool)

(assert (=> b!1002121 m!927531))

(assert (=> b!1002121 m!927531))

(assert (=> b!1002121 m!927499))

(declare-fun m!927533 () Bool)

(assert (=> b!1002121 m!927533))

(assert (=> b!1002120 m!927499))

(assert (=> b!1002120 m!927499))

(declare-fun m!927535 () Bool)

(assert (=> b!1002120 m!927535))

(declare-fun m!927537 () Bool)

(assert (=> b!1002127 m!927537))

(check-sat (not b!1002119) (not b!1002130) (not b!1002123) (not b!1002126) (not b!1002127) (not start!86508) (not b!1002124) (not b!1002121) (not b!1002129) (not b!1002115) (not b!1002116) (not b!1002128) (not b!1002118) (not b!1002120))
(check-sat)
