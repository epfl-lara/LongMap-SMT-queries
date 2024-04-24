; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86764 () Bool)

(assert start!86764)

(declare-fun b!1004011 () Bool)

(declare-fun res!672742 () Bool)

(declare-fun e!565683 () Bool)

(assert (=> b!1004011 (=> (not res!672742) (not e!565683))))

(declare-datatypes ((array!63384 0))(
  ( (array!63385 (arr!30511 (Array (_ BitVec 32) (_ BitVec 64))) (size!31014 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63384)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004011 (= res!672742 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004012 () Bool)

(declare-fun e!565679 () Bool)

(declare-fun e!565680 () Bool)

(assert (=> b!1004012 (= e!565679 e!565680)))

(declare-fun res!672738 () Bool)

(assert (=> b!1004012 (=> (not res!672738) (not e!565680))))

(declare-datatypes ((SeekEntryResult!9379 0))(
  ( (MissingZero!9379 (index!39887 (_ BitVec 32))) (Found!9379 (index!39888 (_ BitVec 32))) (Intermediate!9379 (undefined!10191 Bool) (index!39889 (_ BitVec 32)) (x!87459 (_ BitVec 32))) (Undefined!9379) (MissingVacant!9379 (index!39890 (_ BitVec 32))) )
))
(declare-fun lt!443825 () SeekEntryResult!9379)

(declare-fun lt!443819 () SeekEntryResult!9379)

(assert (=> b!1004012 (= res!672738 (= lt!443825 lt!443819))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63384 (_ BitVec 32)) SeekEntryResult!9379)

(assert (=> b!1004012 (= lt!443825 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30511 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004013 () Bool)

(declare-fun e!565682 () Bool)

(assert (=> b!1004013 (= e!565683 e!565682)))

(declare-fun res!672734 () Bool)

(assert (=> b!1004013 (=> (not res!672734) (not e!565682))))

(declare-fun lt!443820 () SeekEntryResult!9379)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004013 (= res!672734 (or (= lt!443820 (MissingVacant!9379 i!1194)) (= lt!443820 (MissingZero!9379 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63384 (_ BitVec 32)) SeekEntryResult!9379)

(assert (=> b!1004013 (= lt!443820 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!672733 () Bool)

(assert (=> start!86764 (=> (not res!672733) (not e!565683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86764 (= res!672733 (validMask!0 mask!3464))))

(assert (=> start!86764 e!565683))

(declare-fun array_inv!23647 (array!63384) Bool)

(assert (=> start!86764 (array_inv!23647 a!3219)))

(assert (=> start!86764 true))

(declare-fun b!1004014 () Bool)

(declare-fun res!672730 () Bool)

(assert (=> b!1004014 (=> (not res!672730) (not e!565682))))

(declare-datatypes ((List!21158 0))(
  ( (Nil!21155) (Cons!21154 (h!22340 (_ BitVec 64)) (t!30151 List!21158)) )
))
(declare-fun arrayNoDuplicates!0 (array!63384 (_ BitVec 32) List!21158) Bool)

(assert (=> b!1004014 (= res!672730 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21155))))

(declare-fun b!1004015 () Bool)

(declare-fun res!672741 () Bool)

(assert (=> b!1004015 (=> (not res!672741) (not e!565683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004015 (= res!672741 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004016 () Bool)

(declare-fun res!672743 () Bool)

(declare-fun e!565677 () Bool)

(assert (=> b!1004016 (=> (not res!672743) (not e!565677))))

(declare-fun lt!443823 () (_ BitVec 32))

(assert (=> b!1004016 (= res!672743 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443823 (select (arr!30511 a!3219) j!170) a!3219 mask!3464) lt!443819))))

(declare-fun b!1004017 () Bool)

(declare-fun e!565678 () Bool)

(assert (=> b!1004017 (= e!565678 e!565677)))

(declare-fun res!672736 () Bool)

(assert (=> b!1004017 (=> (not res!672736) (not e!565677))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004017 (= res!672736 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443823 #b00000000000000000000000000000000) (bvslt lt!443823 (size!31014 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004017 (= lt!443823 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1004018 () Bool)

(declare-fun res!672739 () Bool)

(assert (=> b!1004018 (=> (not res!672739) (not e!565682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63384 (_ BitVec 32)) Bool)

(assert (=> b!1004018 (= res!672739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004019 () Bool)

(declare-fun res!672740 () Bool)

(assert (=> b!1004019 (=> (not res!672740) (not e!565683))))

(assert (=> b!1004019 (= res!672740 (validKeyInArray!0 (select (arr!30511 a!3219) j!170)))))

(declare-fun b!1004020 () Bool)

(declare-fun res!672737 () Bool)

(assert (=> b!1004020 (=> (not res!672737) (not e!565678))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1004020 (= res!672737 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004021 () Bool)

(declare-fun res!672732 () Bool)

(assert (=> b!1004021 (=> (not res!672732) (not e!565683))))

(assert (=> b!1004021 (= res!672732 (and (= (size!31014 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31014 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31014 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004022 () Bool)

(declare-fun res!672728 () Bool)

(assert (=> b!1004022 (=> (not res!672728) (not e!565678))))

(declare-fun lt!443824 () (_ BitVec 64))

(declare-fun lt!443822 () array!63384)

(assert (=> b!1004022 (= res!672728 (not (= lt!443825 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443824 lt!443822 mask!3464))))))

(declare-fun b!1004023 () Bool)

(assert (=> b!1004023 (= e!565680 e!565678)))

(declare-fun res!672729 () Bool)

(assert (=> b!1004023 (=> (not res!672729) (not e!565678))))

(declare-fun lt!443821 () SeekEntryResult!9379)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004023 (= res!672729 (not (= lt!443821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443824 mask!3464) lt!443824 lt!443822 mask!3464))))))

(assert (=> b!1004023 (= lt!443824 (select (store (arr!30511 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004023 (= lt!443822 (array!63385 (store (arr!30511 a!3219) i!1194 k0!2224) (size!31014 a!3219)))))

(declare-fun b!1004024 () Bool)

(assert (=> b!1004024 (= e!565677 false)))

(declare-fun lt!443818 () SeekEntryResult!9379)

(assert (=> b!1004024 (= lt!443818 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443823 lt!443824 lt!443822 mask!3464))))

(declare-fun b!1004025 () Bool)

(assert (=> b!1004025 (= e!565682 e!565679)))

(declare-fun res!672735 () Bool)

(assert (=> b!1004025 (=> (not res!672735) (not e!565679))))

(assert (=> b!1004025 (= res!672735 (= lt!443821 lt!443819))))

(assert (=> b!1004025 (= lt!443819 (Intermediate!9379 false resIndex!38 resX!38))))

(assert (=> b!1004025 (= lt!443821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30511 a!3219) j!170) mask!3464) (select (arr!30511 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004026 () Bool)

(declare-fun res!672731 () Bool)

(assert (=> b!1004026 (=> (not res!672731) (not e!565682))))

(assert (=> b!1004026 (= res!672731 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31014 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31014 a!3219))))))

(assert (= (and start!86764 res!672733) b!1004021))

(assert (= (and b!1004021 res!672732) b!1004019))

(assert (= (and b!1004019 res!672740) b!1004015))

(assert (= (and b!1004015 res!672741) b!1004011))

(assert (= (and b!1004011 res!672742) b!1004013))

(assert (= (and b!1004013 res!672734) b!1004018))

(assert (= (and b!1004018 res!672739) b!1004014))

(assert (= (and b!1004014 res!672730) b!1004026))

(assert (= (and b!1004026 res!672731) b!1004025))

(assert (= (and b!1004025 res!672735) b!1004012))

(assert (= (and b!1004012 res!672738) b!1004023))

(assert (= (and b!1004023 res!672729) b!1004022))

(assert (= (and b!1004022 res!672728) b!1004020))

(assert (= (and b!1004020 res!672737) b!1004017))

(assert (= (and b!1004017 res!672736) b!1004016))

(assert (= (and b!1004016 res!672743) b!1004024))

(declare-fun m!930113 () Bool)

(assert (=> b!1004013 m!930113))

(declare-fun m!930115 () Bool)

(assert (=> b!1004024 m!930115))

(declare-fun m!930117 () Bool)

(assert (=> b!1004016 m!930117))

(assert (=> b!1004016 m!930117))

(declare-fun m!930119 () Bool)

(assert (=> b!1004016 m!930119))

(declare-fun m!930121 () Bool)

(assert (=> b!1004015 m!930121))

(assert (=> b!1004025 m!930117))

(assert (=> b!1004025 m!930117))

(declare-fun m!930123 () Bool)

(assert (=> b!1004025 m!930123))

(assert (=> b!1004025 m!930123))

(assert (=> b!1004025 m!930117))

(declare-fun m!930125 () Bool)

(assert (=> b!1004025 m!930125))

(assert (=> b!1004019 m!930117))

(assert (=> b!1004019 m!930117))

(declare-fun m!930127 () Bool)

(assert (=> b!1004019 m!930127))

(declare-fun m!930129 () Bool)

(assert (=> b!1004014 m!930129))

(declare-fun m!930131 () Bool)

(assert (=> b!1004017 m!930131))

(declare-fun m!930133 () Bool)

(assert (=> start!86764 m!930133))

(declare-fun m!930135 () Bool)

(assert (=> start!86764 m!930135))

(assert (=> b!1004012 m!930117))

(assert (=> b!1004012 m!930117))

(declare-fun m!930137 () Bool)

(assert (=> b!1004012 m!930137))

(declare-fun m!930139 () Bool)

(assert (=> b!1004022 m!930139))

(declare-fun m!930141 () Bool)

(assert (=> b!1004018 m!930141))

(declare-fun m!930143 () Bool)

(assert (=> b!1004011 m!930143))

(declare-fun m!930145 () Bool)

(assert (=> b!1004023 m!930145))

(assert (=> b!1004023 m!930145))

(declare-fun m!930147 () Bool)

(assert (=> b!1004023 m!930147))

(declare-fun m!930149 () Bool)

(assert (=> b!1004023 m!930149))

(declare-fun m!930151 () Bool)

(assert (=> b!1004023 m!930151))

(check-sat (not b!1004025) (not b!1004015) (not b!1004019) (not b!1004012) (not b!1004013) (not b!1004016) (not b!1004018) (not b!1004011) (not b!1004017) (not start!86764) (not b!1004024) (not b!1004023) (not b!1004022) (not b!1004014))
(check-sat)
