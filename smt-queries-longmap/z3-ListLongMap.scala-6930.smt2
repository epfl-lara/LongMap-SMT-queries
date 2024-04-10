; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87194 () Bool)

(assert start!87194)

(declare-fun b!1010895 () Bool)

(declare-fun res!679079 () Bool)

(declare-fun e!568702 () Bool)

(assert (=> b!1010895 (=> (not res!679079) (not e!568702))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010895 (= res!679079 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010896 () Bool)

(declare-fun e!568704 () Bool)

(assert (=> b!1010896 (= e!568702 e!568704)))

(declare-fun res!679077 () Bool)

(assert (=> b!1010896 (=> (not res!679077) (not e!568704))))

(declare-datatypes ((SeekEntryResult!9576 0))(
  ( (MissingZero!9576 (index!40675 (_ BitVec 32))) (Found!9576 (index!40676 (_ BitVec 32))) (Intermediate!9576 (undefined!10388 Bool) (index!40677 (_ BitVec 32)) (x!88085 (_ BitVec 32))) (Undefined!9576) (MissingVacant!9576 (index!40678 (_ BitVec 32))) )
))
(declare-fun lt!446790 () SeekEntryResult!9576)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010896 (= res!679077 (or (= lt!446790 (MissingVacant!9576 i!1194)) (= lt!446790 (MissingZero!9576 i!1194))))))

(declare-datatypes ((array!63655 0))(
  ( (array!63656 (arr!30644 (Array (_ BitVec 32) (_ BitVec 64))) (size!31146 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63655)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63655 (_ BitVec 32)) SeekEntryResult!9576)

(assert (=> b!1010896 (= lt!446790 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010897 () Bool)

(declare-fun res!679089 () Bool)

(assert (=> b!1010897 (=> (not res!679089) (not e!568702))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1010897 (= res!679089 (and (= (size!31146 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31146 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31146 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010898 () Bool)

(declare-fun res!679086 () Bool)

(assert (=> b!1010898 (=> (not res!679086) (not e!568704))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1010898 (= res!679086 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31146 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31146 a!3219))))))

(declare-fun b!1010899 () Bool)

(declare-fun e!568699 () Bool)

(declare-fun e!568703 () Bool)

(assert (=> b!1010899 (= e!568699 e!568703)))

(declare-fun res!679076 () Bool)

(assert (=> b!1010899 (=> (not res!679076) (not e!568703))))

(declare-fun lt!446794 () SeekEntryResult!9576)

(declare-fun lt!446796 () array!63655)

(declare-fun lt!446789 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63655 (_ BitVec 32)) SeekEntryResult!9576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010899 (= res!679076 (not (= lt!446794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446789 mask!3464) lt!446789 lt!446796 mask!3464))))))

(assert (=> b!1010899 (= lt!446789 (select (store (arr!30644 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010899 (= lt!446796 (array!63656 (store (arr!30644 a!3219) i!1194 k0!2224) (size!31146 a!3219)))))

(declare-fun b!1010901 () Bool)

(declare-fun res!679088 () Bool)

(assert (=> b!1010901 (=> (not res!679088) (not e!568704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63655 (_ BitVec 32)) Bool)

(assert (=> b!1010901 (= res!679088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010902 () Bool)

(declare-fun res!679080 () Bool)

(assert (=> b!1010902 (=> (not res!679080) (not e!568702))))

(declare-fun arrayContainsKey!0 (array!63655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010902 (= res!679080 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010903 () Bool)

(declare-fun res!679075 () Bool)

(assert (=> b!1010903 (=> (not res!679075) (not e!568703))))

(assert (=> b!1010903 (= res!679075 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010904 () Bool)

(declare-fun res!679084 () Bool)

(assert (=> b!1010904 (=> (not res!679084) (not e!568703))))

(declare-fun lt!446792 () SeekEntryResult!9576)

(assert (=> b!1010904 (= res!679084 (not (= lt!446792 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446789 lt!446796 mask!3464))))))

(declare-fun b!1010905 () Bool)

(declare-fun e!568701 () Bool)

(assert (=> b!1010905 (= e!568704 e!568701)))

(declare-fun res!679081 () Bool)

(assert (=> b!1010905 (=> (not res!679081) (not e!568701))))

(declare-fun lt!446795 () SeekEntryResult!9576)

(assert (=> b!1010905 (= res!679081 (= lt!446794 lt!446795))))

(assert (=> b!1010905 (= lt!446795 (Intermediate!9576 false resIndex!38 resX!38))))

(assert (=> b!1010905 (= lt!446794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30644 a!3219) j!170) mask!3464) (select (arr!30644 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010906 () Bool)

(declare-fun e!568700 () Bool)

(assert (=> b!1010906 (= e!568703 e!568700)))

(declare-fun res!679085 () Bool)

(assert (=> b!1010906 (=> (not res!679085) (not e!568700))))

(declare-fun lt!446793 () (_ BitVec 32))

(assert (=> b!1010906 (= res!679085 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446793 #b00000000000000000000000000000000) (bvslt lt!446793 (size!31146 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010906 (= lt!446793 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010907 () Bool)

(assert (=> b!1010907 (= e!568701 e!568699)))

(declare-fun res!679087 () Bool)

(assert (=> b!1010907 (=> (not res!679087) (not e!568699))))

(assert (=> b!1010907 (= res!679087 (= lt!446792 lt!446795))))

(assert (=> b!1010907 (= lt!446792 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30644 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010908 () Bool)

(declare-fun res!679082 () Bool)

(assert (=> b!1010908 (=> (not res!679082) (not e!568702))))

(assert (=> b!1010908 (= res!679082 (validKeyInArray!0 (select (arr!30644 a!3219) j!170)))))

(declare-fun b!1010909 () Bool)

(declare-fun res!679078 () Bool)

(assert (=> b!1010909 (=> (not res!679078) (not e!568704))))

(declare-datatypes ((List!21320 0))(
  ( (Nil!21317) (Cons!21316 (h!22511 (_ BitVec 64)) (t!30321 List!21320)) )
))
(declare-fun arrayNoDuplicates!0 (array!63655 (_ BitVec 32) List!21320) Bool)

(assert (=> b!1010909 (= res!679078 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21317))))

(declare-fun res!679083 () Bool)

(assert (=> start!87194 (=> (not res!679083) (not e!568702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87194 (= res!679083 (validMask!0 mask!3464))))

(assert (=> start!87194 e!568702))

(declare-fun array_inv!23768 (array!63655) Bool)

(assert (=> start!87194 (array_inv!23768 a!3219)))

(assert (=> start!87194 true))

(declare-fun b!1010900 () Bool)

(assert (=> b!1010900 (= e!568700 false)))

(declare-fun lt!446791 () SeekEntryResult!9576)

(assert (=> b!1010900 (= lt!446791 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446793 (select (arr!30644 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87194 res!679083) b!1010897))

(assert (= (and b!1010897 res!679089) b!1010908))

(assert (= (and b!1010908 res!679082) b!1010895))

(assert (= (and b!1010895 res!679079) b!1010902))

(assert (= (and b!1010902 res!679080) b!1010896))

(assert (= (and b!1010896 res!679077) b!1010901))

(assert (= (and b!1010901 res!679088) b!1010909))

(assert (= (and b!1010909 res!679078) b!1010898))

(assert (= (and b!1010898 res!679086) b!1010905))

(assert (= (and b!1010905 res!679081) b!1010907))

(assert (= (and b!1010907 res!679087) b!1010899))

(assert (= (and b!1010899 res!679076) b!1010904))

(assert (= (and b!1010904 res!679084) b!1010903))

(assert (= (and b!1010903 res!679075) b!1010906))

(assert (= (and b!1010906 res!679085) b!1010900))

(declare-fun m!935069 () Bool)

(assert (=> b!1010900 m!935069))

(assert (=> b!1010900 m!935069))

(declare-fun m!935071 () Bool)

(assert (=> b!1010900 m!935071))

(assert (=> b!1010907 m!935069))

(assert (=> b!1010907 m!935069))

(declare-fun m!935073 () Bool)

(assert (=> b!1010907 m!935073))

(declare-fun m!935075 () Bool)

(assert (=> b!1010909 m!935075))

(declare-fun m!935077 () Bool)

(assert (=> b!1010906 m!935077))

(declare-fun m!935079 () Bool)

(assert (=> b!1010904 m!935079))

(declare-fun m!935081 () Bool)

(assert (=> b!1010895 m!935081))

(assert (=> b!1010908 m!935069))

(assert (=> b!1010908 m!935069))

(declare-fun m!935083 () Bool)

(assert (=> b!1010908 m!935083))

(declare-fun m!935085 () Bool)

(assert (=> b!1010901 m!935085))

(declare-fun m!935087 () Bool)

(assert (=> b!1010899 m!935087))

(assert (=> b!1010899 m!935087))

(declare-fun m!935089 () Bool)

(assert (=> b!1010899 m!935089))

(declare-fun m!935091 () Bool)

(assert (=> b!1010899 m!935091))

(declare-fun m!935093 () Bool)

(assert (=> b!1010899 m!935093))

(declare-fun m!935095 () Bool)

(assert (=> b!1010896 m!935095))

(declare-fun m!935097 () Bool)

(assert (=> b!1010902 m!935097))

(assert (=> b!1010905 m!935069))

(assert (=> b!1010905 m!935069))

(declare-fun m!935099 () Bool)

(assert (=> b!1010905 m!935099))

(assert (=> b!1010905 m!935099))

(assert (=> b!1010905 m!935069))

(declare-fun m!935101 () Bool)

(assert (=> b!1010905 m!935101))

(declare-fun m!935103 () Bool)

(assert (=> start!87194 m!935103))

(declare-fun m!935105 () Bool)

(assert (=> start!87194 m!935105))

(check-sat (not b!1010901) (not b!1010907) (not b!1010906) (not start!87194) (not b!1010896) (not b!1010909) (not b!1010905) (not b!1010899) (not b!1010900) (not b!1010904) (not b!1010908) (not b!1010895) (not b!1010902))
(check-sat)
