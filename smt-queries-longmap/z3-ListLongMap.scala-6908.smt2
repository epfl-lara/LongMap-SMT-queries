; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86812 () Bool)

(assert start!86812)

(declare-fun b!1006659 () Bool)

(declare-fun e!566586 () Bool)

(declare-fun e!566585 () Bool)

(assert (=> b!1006659 (= e!566586 e!566585)))

(declare-fun res!675751 () Bool)

(assert (=> b!1006659 (=> (not res!675751) (not e!566585))))

(declare-datatypes ((SeekEntryResult!9510 0))(
  ( (MissingZero!9510 (index!40411 (_ BitVec 32))) (Found!9510 (index!40412 (_ BitVec 32))) (Intermediate!9510 (undefined!10322 Bool) (index!40413 (_ BitVec 32)) (x!87806 (_ BitVec 32))) (Undefined!9510) (MissingVacant!9510 (index!40414 (_ BitVec 32))) )
))
(declare-fun lt!444861 () SeekEntryResult!9510)

(declare-fun lt!444859 () SeekEntryResult!9510)

(assert (=> b!1006659 (= res!675751 (= lt!444861 lt!444859))))

(declare-datatypes ((array!63511 0))(
  ( (array!63512 (arr!30578 (Array (_ BitVec 32) (_ BitVec 64))) (size!31080 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63511)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63511 (_ BitVec 32)) SeekEntryResult!9510)

(assert (=> b!1006659 (= lt!444861 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30578 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006660 () Bool)

(declare-fun res!675747 () Bool)

(declare-fun e!566587 () Bool)

(assert (=> b!1006660 (=> (not res!675747) (not e!566587))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006660 (= res!675747 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006661 () Bool)

(declare-fun e!566584 () Bool)

(assert (=> b!1006661 (= e!566584 e!566586)))

(declare-fun res!675757 () Bool)

(assert (=> b!1006661 (=> (not res!675757) (not e!566586))))

(declare-fun lt!444862 () SeekEntryResult!9510)

(assert (=> b!1006661 (= res!675757 (= lt!444862 lt!444859))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006661 (= lt!444859 (Intermediate!9510 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006661 (= lt!444862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30578 a!3219) j!170) mask!3464) (select (arr!30578 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006662 () Bool)

(assert (=> b!1006662 (= e!566587 e!566584)))

(declare-fun res!675756 () Bool)

(assert (=> b!1006662 (=> (not res!675756) (not e!566584))))

(declare-fun lt!444863 () SeekEntryResult!9510)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006662 (= res!675756 (or (= lt!444863 (MissingVacant!9510 i!1194)) (= lt!444863 (MissingZero!9510 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63511 (_ BitVec 32)) SeekEntryResult!9510)

(assert (=> b!1006662 (= lt!444863 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006663 () Bool)

(declare-fun res!675758 () Bool)

(assert (=> b!1006663 (=> (not res!675758) (not e!566587))))

(assert (=> b!1006663 (= res!675758 (and (= (size!31080 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31080 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31080 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!675755 () Bool)

(assert (=> start!86812 (=> (not res!675755) (not e!566587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86812 (= res!675755 (validMask!0 mask!3464))))

(assert (=> start!86812 e!566587))

(declare-fun array_inv!23702 (array!63511) Bool)

(assert (=> start!86812 (array_inv!23702 a!3219)))

(assert (=> start!86812 true))

(declare-fun b!1006664 () Bool)

(declare-fun res!675748 () Bool)

(assert (=> b!1006664 (=> (not res!675748) (not e!566587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006664 (= res!675748 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006665 () Bool)

(declare-fun res!675749 () Bool)

(assert (=> b!1006665 (=> (not res!675749) (not e!566584))))

(declare-datatypes ((List!21254 0))(
  ( (Nil!21251) (Cons!21250 (h!22433 (_ BitVec 64)) (t!30255 List!21254)) )
))
(declare-fun arrayNoDuplicates!0 (array!63511 (_ BitVec 32) List!21254) Bool)

(assert (=> b!1006665 (= res!675749 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21251))))

(declare-fun b!1006666 () Bool)

(declare-fun res!675754 () Bool)

(assert (=> b!1006666 (=> (not res!675754) (not e!566587))))

(assert (=> b!1006666 (= res!675754 (validKeyInArray!0 (select (arr!30578 a!3219) j!170)))))

(declare-fun b!1006667 () Bool)

(declare-fun e!566582 () Bool)

(assert (=> b!1006667 (= e!566585 e!566582)))

(declare-fun res!675752 () Bool)

(assert (=> b!1006667 (=> (not res!675752) (not e!566582))))

(declare-fun lt!444858 () (_ BitVec 64))

(declare-fun lt!444860 () array!63511)

(assert (=> b!1006667 (= res!675752 (not (= lt!444862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444858 mask!3464) lt!444858 lt!444860 mask!3464))))))

(assert (=> b!1006667 (= lt!444858 (select (store (arr!30578 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1006667 (= lt!444860 (array!63512 (store (arr!30578 a!3219) i!1194 k0!2224) (size!31080 a!3219)))))

(declare-fun b!1006668 () Bool)

(declare-fun res!675753 () Bool)

(assert (=> b!1006668 (=> (not res!675753) (not e!566582))))

(assert (=> b!1006668 (= res!675753 (not (= lt!444861 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444858 lt!444860 mask!3464))))))

(declare-fun b!1006669 () Bool)

(declare-fun res!675750 () Bool)

(assert (=> b!1006669 (=> (not res!675750) (not e!566584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63511 (_ BitVec 32)) Bool)

(assert (=> b!1006669 (= res!675750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006670 () Bool)

(assert (=> b!1006670 (= e!566582 (bvslt (bvsub #b01111111111111111111111111111110 x!1245) #b00000000000000000000000000000000))))

(declare-fun b!1006671 () Bool)

(declare-fun res!675759 () Bool)

(assert (=> b!1006671 (=> (not res!675759) (not e!566584))))

(assert (=> b!1006671 (= res!675759 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31080 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31080 a!3219))))))

(assert (= (and start!86812 res!675755) b!1006663))

(assert (= (and b!1006663 res!675758) b!1006666))

(assert (= (and b!1006666 res!675754) b!1006664))

(assert (= (and b!1006664 res!675748) b!1006660))

(assert (= (and b!1006660 res!675747) b!1006662))

(assert (= (and b!1006662 res!675756) b!1006669))

(assert (= (and b!1006669 res!675750) b!1006665))

(assert (= (and b!1006665 res!675749) b!1006671))

(assert (= (and b!1006671 res!675759) b!1006661))

(assert (= (and b!1006661 res!675757) b!1006659))

(assert (= (and b!1006659 res!675751) b!1006667))

(assert (= (and b!1006667 res!675752) b!1006668))

(assert (= (and b!1006668 res!675753) b!1006670))

(declare-fun m!931743 () Bool)

(assert (=> b!1006664 m!931743))

(declare-fun m!931745 () Bool)

(assert (=> start!86812 m!931745))

(declare-fun m!931747 () Bool)

(assert (=> start!86812 m!931747))

(declare-fun m!931749 () Bool)

(assert (=> b!1006661 m!931749))

(assert (=> b!1006661 m!931749))

(declare-fun m!931751 () Bool)

(assert (=> b!1006661 m!931751))

(assert (=> b!1006661 m!931751))

(assert (=> b!1006661 m!931749))

(declare-fun m!931753 () Bool)

(assert (=> b!1006661 m!931753))

(declare-fun m!931755 () Bool)

(assert (=> b!1006667 m!931755))

(assert (=> b!1006667 m!931755))

(declare-fun m!931757 () Bool)

(assert (=> b!1006667 m!931757))

(declare-fun m!931759 () Bool)

(assert (=> b!1006667 m!931759))

(declare-fun m!931761 () Bool)

(assert (=> b!1006667 m!931761))

(declare-fun m!931763 () Bool)

(assert (=> b!1006665 m!931763))

(assert (=> b!1006666 m!931749))

(assert (=> b!1006666 m!931749))

(declare-fun m!931765 () Bool)

(assert (=> b!1006666 m!931765))

(declare-fun m!931767 () Bool)

(assert (=> b!1006662 m!931767))

(declare-fun m!931769 () Bool)

(assert (=> b!1006668 m!931769))

(declare-fun m!931771 () Bool)

(assert (=> b!1006669 m!931771))

(declare-fun m!931773 () Bool)

(assert (=> b!1006660 m!931773))

(assert (=> b!1006659 m!931749))

(assert (=> b!1006659 m!931749))

(declare-fun m!931775 () Bool)

(assert (=> b!1006659 m!931775))

(check-sat (not b!1006667) (not b!1006666) (not b!1006669) (not b!1006660) (not start!86812) (not b!1006662) (not b!1006659) (not b!1006668) (not b!1006664) (not b!1006661) (not b!1006665))
(check-sat)
