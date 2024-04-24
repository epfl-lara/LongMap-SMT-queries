; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86758 () Bool)

(assert start!86758)

(declare-fun b!1003867 () Bool)

(declare-fun e!565616 () Bool)

(assert (=> b!1003867 (= e!565616 false)))

(declare-fun lt!443750 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9376 0))(
  ( (MissingZero!9376 (index!39875 (_ BitVec 32))) (Found!9376 (index!39876 (_ BitVec 32))) (Intermediate!9376 (undefined!10188 Bool) (index!39877 (_ BitVec 32)) (x!87448 (_ BitVec 32))) (Undefined!9376) (MissingVacant!9376 (index!39878 (_ BitVec 32))) )
))
(declare-fun lt!443752 () SeekEntryResult!9376)

(declare-datatypes ((array!63378 0))(
  ( (array!63379 (arr!30508 (Array (_ BitVec 32) (_ BitVec 64))) (size!31011 (_ BitVec 32))) )
))
(declare-fun lt!443747 () array!63378)

(declare-fun lt!443749 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63378 (_ BitVec 32)) SeekEntryResult!9376)

(assert (=> b!1003867 (= lt!443752 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443750 lt!443749 lt!443747 mask!3464))))

(declare-fun b!1003869 () Bool)

(declare-fun e!565618 () Bool)

(assert (=> b!1003869 (= e!565618 e!565616)))

(declare-fun res!672585 () Bool)

(assert (=> b!1003869 (=> (not res!672585) (not e!565616))))

(declare-fun a!3219 () array!63378)

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003869 (= res!672585 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443750 #b00000000000000000000000000000000) (bvslt lt!443750 (size!31011 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003869 (= lt!443750 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1003870 () Bool)

(declare-fun res!672596 () Bool)

(assert (=> b!1003870 (=> (not res!672596) (not e!565618))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003870 (= res!672596 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003871 () Bool)

(declare-fun res!672584 () Bool)

(declare-fun e!565620 () Bool)

(assert (=> b!1003871 (=> (not res!672584) (not e!565620))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003871 (= res!672584 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003872 () Bool)

(declare-fun e!565619 () Bool)

(declare-fun e!565614 () Bool)

(assert (=> b!1003872 (= e!565619 e!565614)))

(declare-fun res!672586 () Bool)

(assert (=> b!1003872 (=> (not res!672586) (not e!565614))))

(declare-fun lt!443746 () SeekEntryResult!9376)

(declare-fun lt!443753 () SeekEntryResult!9376)

(assert (=> b!1003872 (= res!672586 (= lt!443746 lt!443753))))

(assert (=> b!1003872 (= lt!443753 (Intermediate!9376 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003872 (= lt!443746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30508 a!3219) j!170) mask!3464) (select (arr!30508 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003873 () Bool)

(declare-fun res!672592 () Bool)

(assert (=> b!1003873 (=> (not res!672592) (not e!565620))))

(declare-fun arrayContainsKey!0 (array!63378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003873 (= res!672592 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!672588 () Bool)

(assert (=> start!86758 (=> (not res!672588) (not e!565620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86758 (= res!672588 (validMask!0 mask!3464))))

(assert (=> start!86758 e!565620))

(declare-fun array_inv!23644 (array!63378) Bool)

(assert (=> start!86758 (array_inv!23644 a!3219)))

(assert (=> start!86758 true))

(declare-fun b!1003868 () Bool)

(declare-fun res!672594 () Bool)

(assert (=> b!1003868 (=> (not res!672594) (not e!565619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63378 (_ BitVec 32)) Bool)

(assert (=> b!1003868 (= res!672594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003874 () Bool)

(declare-fun res!672593 () Bool)

(assert (=> b!1003874 (=> (not res!672593) (not e!565620))))

(assert (=> b!1003874 (= res!672593 (and (= (size!31011 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31011 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31011 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003875 () Bool)

(declare-fun res!672599 () Bool)

(assert (=> b!1003875 (=> (not res!672599) (not e!565620))))

(assert (=> b!1003875 (= res!672599 (validKeyInArray!0 (select (arr!30508 a!3219) j!170)))))

(declare-fun b!1003876 () Bool)

(declare-fun res!672590 () Bool)

(assert (=> b!1003876 (=> (not res!672590) (not e!565618))))

(declare-fun lt!443751 () SeekEntryResult!9376)

(assert (=> b!1003876 (= res!672590 (not (= lt!443751 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443749 lt!443747 mask!3464))))))

(declare-fun b!1003877 () Bool)

(declare-fun e!565615 () Bool)

(assert (=> b!1003877 (= e!565614 e!565615)))

(declare-fun res!672598 () Bool)

(assert (=> b!1003877 (=> (not res!672598) (not e!565615))))

(assert (=> b!1003877 (= res!672598 (= lt!443751 lt!443753))))

(assert (=> b!1003877 (= lt!443751 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30508 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003878 () Bool)

(declare-fun res!672595 () Bool)

(assert (=> b!1003878 (=> (not res!672595) (not e!565619))))

(assert (=> b!1003878 (= res!672595 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31011 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31011 a!3219))))))

(declare-fun b!1003879 () Bool)

(assert (=> b!1003879 (= e!565620 e!565619)))

(declare-fun res!672589 () Bool)

(assert (=> b!1003879 (=> (not res!672589) (not e!565619))))

(declare-fun lt!443748 () SeekEntryResult!9376)

(assert (=> b!1003879 (= res!672589 (or (= lt!443748 (MissingVacant!9376 i!1194)) (= lt!443748 (MissingZero!9376 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63378 (_ BitVec 32)) SeekEntryResult!9376)

(assert (=> b!1003879 (= lt!443748 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003880 () Bool)

(assert (=> b!1003880 (= e!565615 e!565618)))

(declare-fun res!672587 () Bool)

(assert (=> b!1003880 (=> (not res!672587) (not e!565618))))

(assert (=> b!1003880 (= res!672587 (not (= lt!443746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443749 mask!3464) lt!443749 lt!443747 mask!3464))))))

(assert (=> b!1003880 (= lt!443749 (select (store (arr!30508 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003880 (= lt!443747 (array!63379 (store (arr!30508 a!3219) i!1194 k0!2224) (size!31011 a!3219)))))

(declare-fun b!1003881 () Bool)

(declare-fun res!672597 () Bool)

(assert (=> b!1003881 (=> (not res!672597) (not e!565616))))

(assert (=> b!1003881 (= res!672597 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443750 (select (arr!30508 a!3219) j!170) a!3219 mask!3464) lt!443753))))

(declare-fun b!1003882 () Bool)

(declare-fun res!672591 () Bool)

(assert (=> b!1003882 (=> (not res!672591) (not e!565619))))

(declare-datatypes ((List!21155 0))(
  ( (Nil!21152) (Cons!21151 (h!22337 (_ BitVec 64)) (t!30148 List!21155)) )
))
(declare-fun arrayNoDuplicates!0 (array!63378 (_ BitVec 32) List!21155) Bool)

(assert (=> b!1003882 (= res!672591 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21152))))

(assert (= (and start!86758 res!672588) b!1003874))

(assert (= (and b!1003874 res!672593) b!1003875))

(assert (= (and b!1003875 res!672599) b!1003871))

(assert (= (and b!1003871 res!672584) b!1003873))

(assert (= (and b!1003873 res!672592) b!1003879))

(assert (= (and b!1003879 res!672589) b!1003868))

(assert (= (and b!1003868 res!672594) b!1003882))

(assert (= (and b!1003882 res!672591) b!1003878))

(assert (= (and b!1003878 res!672595) b!1003872))

(assert (= (and b!1003872 res!672586) b!1003877))

(assert (= (and b!1003877 res!672598) b!1003880))

(assert (= (and b!1003880 res!672587) b!1003876))

(assert (= (and b!1003876 res!672590) b!1003870))

(assert (= (and b!1003870 res!672596) b!1003869))

(assert (= (and b!1003869 res!672585) b!1003881))

(assert (= (and b!1003881 res!672597) b!1003867))

(declare-fun m!929993 () Bool)

(assert (=> b!1003869 m!929993))

(declare-fun m!929995 () Bool)

(assert (=> b!1003880 m!929995))

(assert (=> b!1003880 m!929995))

(declare-fun m!929997 () Bool)

(assert (=> b!1003880 m!929997))

(declare-fun m!929999 () Bool)

(assert (=> b!1003880 m!929999))

(declare-fun m!930001 () Bool)

(assert (=> b!1003880 m!930001))

(declare-fun m!930003 () Bool)

(assert (=> b!1003882 m!930003))

(declare-fun m!930005 () Bool)

(assert (=> b!1003867 m!930005))

(declare-fun m!930007 () Bool)

(assert (=> b!1003881 m!930007))

(assert (=> b!1003881 m!930007))

(declare-fun m!930009 () Bool)

(assert (=> b!1003881 m!930009))

(declare-fun m!930011 () Bool)

(assert (=> b!1003879 m!930011))

(assert (=> b!1003872 m!930007))

(assert (=> b!1003872 m!930007))

(declare-fun m!930013 () Bool)

(assert (=> b!1003872 m!930013))

(assert (=> b!1003872 m!930013))

(assert (=> b!1003872 m!930007))

(declare-fun m!930015 () Bool)

(assert (=> b!1003872 m!930015))

(assert (=> b!1003877 m!930007))

(assert (=> b!1003877 m!930007))

(declare-fun m!930017 () Bool)

(assert (=> b!1003877 m!930017))

(declare-fun m!930019 () Bool)

(assert (=> b!1003876 m!930019))

(assert (=> b!1003875 m!930007))

(assert (=> b!1003875 m!930007))

(declare-fun m!930021 () Bool)

(assert (=> b!1003875 m!930021))

(declare-fun m!930023 () Bool)

(assert (=> start!86758 m!930023))

(declare-fun m!930025 () Bool)

(assert (=> start!86758 m!930025))

(declare-fun m!930027 () Bool)

(assert (=> b!1003868 m!930027))

(declare-fun m!930029 () Bool)

(assert (=> b!1003871 m!930029))

(declare-fun m!930031 () Bool)

(assert (=> b!1003873 m!930031))

(check-sat (not b!1003876) (not b!1003873) (not b!1003871) (not b!1003881) (not b!1003882) (not start!86758) (not b!1003867) (not b!1003872) (not b!1003869) (not b!1003880) (not b!1003875) (not b!1003868) (not b!1003879) (not b!1003877))
(check-sat)
