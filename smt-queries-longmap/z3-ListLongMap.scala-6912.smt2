; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87118 () Bool)

(assert start!87118)

(declare-fun b!1008669 () Bool)

(declare-fun res!676813 () Bool)

(declare-fun e!567782 () Bool)

(assert (=> b!1008669 (=> (not res!676813) (not e!567782))))

(declare-datatypes ((array!63585 0))(
  ( (array!63586 (arr!30607 (Array (_ BitVec 32) (_ BitVec 64))) (size!31110 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63585)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008669 (= res!676813 (validKeyInArray!0 (select (arr!30607 a!3219) j!170)))))

(declare-fun b!1008670 () Bool)

(declare-fun e!567784 () Bool)

(declare-fun e!567783 () Bool)

(assert (=> b!1008670 (= e!567784 e!567783)))

(declare-fun res!676808 () Bool)

(assert (=> b!1008670 (=> (not res!676808) (not e!567783))))

(declare-datatypes ((SeekEntryResult!9475 0))(
  ( (MissingZero!9475 (index!40271 (_ BitVec 32))) (Found!9475 (index!40272 (_ BitVec 32))) (Intermediate!9475 (undefined!10287 Bool) (index!40273 (_ BitVec 32)) (x!87829 (_ BitVec 32))) (Undefined!9475) (MissingVacant!9475 (index!40274 (_ BitVec 32))) )
))
(declare-fun lt!445674 () SeekEntryResult!9475)

(declare-fun lt!445673 () SeekEntryResult!9475)

(assert (=> b!1008670 (= res!676808 (= lt!445674 lt!445673))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008670 (= lt!445673 (Intermediate!9475 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63585 (_ BitVec 32)) SeekEntryResult!9475)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008670 (= lt!445674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30607 a!3219) j!170) mask!3464) (select (arr!30607 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008672 () Bool)

(declare-fun res!676803 () Bool)

(declare-fun e!567786 () Bool)

(assert (=> b!1008672 (=> (not res!676803) (not e!567786))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445670 () array!63585)

(declare-fun lt!445671 () SeekEntryResult!9475)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!445675 () (_ BitVec 64))

(assert (=> b!1008672 (= res!676803 (not (= lt!445671 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445675 lt!445670 mask!3464))))))

(declare-fun b!1008673 () Bool)

(declare-fun res!676801 () Bool)

(assert (=> b!1008673 (=> (not res!676801) (not e!567786))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008673 (= res!676801 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008674 () Bool)

(declare-fun res!676810 () Bool)

(assert (=> b!1008674 (=> (not res!676810) (not e!567784))))

(declare-datatypes ((List!21254 0))(
  ( (Nil!21251) (Cons!21250 (h!22445 (_ BitVec 64)) (t!30247 List!21254)) )
))
(declare-fun arrayNoDuplicates!0 (array!63585 (_ BitVec 32) List!21254) Bool)

(assert (=> b!1008674 (= res!676810 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21251))))

(declare-fun b!1008675 () Bool)

(assert (=> b!1008675 (= e!567782 e!567784)))

(declare-fun res!676812 () Bool)

(assert (=> b!1008675 (=> (not res!676812) (not e!567784))))

(declare-fun lt!445676 () SeekEntryResult!9475)

(assert (=> b!1008675 (= res!676812 (or (= lt!445676 (MissingVacant!9475 i!1194)) (= lt!445676 (MissingZero!9475 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63585 (_ BitVec 32)) SeekEntryResult!9475)

(assert (=> b!1008675 (= lt!445676 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008676 () Bool)

(declare-fun res!676814 () Bool)

(assert (=> b!1008676 (=> (not res!676814) (not e!567782))))

(assert (=> b!1008676 (= res!676814 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008677 () Bool)

(declare-fun res!676805 () Bool)

(assert (=> b!1008677 (=> (not res!676805) (not e!567782))))

(declare-fun arrayContainsKey!0 (array!63585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008677 (= res!676805 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008678 () Bool)

(declare-fun res!676802 () Bool)

(assert (=> b!1008678 (=> (not res!676802) (not e!567784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63585 (_ BitVec 32)) Bool)

(assert (=> b!1008678 (= res!676802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008679 () Bool)

(declare-fun res!676804 () Bool)

(assert (=> b!1008679 (=> (not res!676804) (not e!567784))))

(assert (=> b!1008679 (= res!676804 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31110 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31110 a!3219))))))

(declare-fun b!1008680 () Bool)

(declare-fun res!676807 () Bool)

(assert (=> b!1008680 (=> (not res!676807) (not e!567782))))

(assert (=> b!1008680 (= res!676807 (and (= (size!31110 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31110 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31110 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!676811 () Bool)

(assert (=> start!87118 (=> (not res!676811) (not e!567782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87118 (= res!676811 (validMask!0 mask!3464))))

(assert (=> start!87118 e!567782))

(declare-fun array_inv!23743 (array!63585) Bool)

(assert (=> start!87118 (array_inv!23743 a!3219)))

(assert (=> start!87118 true))

(declare-fun b!1008671 () Bool)

(declare-fun e!567785 () Bool)

(assert (=> b!1008671 (= e!567785 e!567786)))

(declare-fun res!676809 () Bool)

(assert (=> b!1008671 (=> (not res!676809) (not e!567786))))

(assert (=> b!1008671 (= res!676809 (not (= lt!445674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445675 mask!3464) lt!445675 lt!445670 mask!3464))))))

(assert (=> b!1008671 (= lt!445675 (select (store (arr!30607 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008671 (= lt!445670 (array!63586 (store (arr!30607 a!3219) i!1194 k0!2224) (size!31110 a!3219)))))

(declare-fun b!1008681 () Bool)

(assert (=> b!1008681 (= e!567786 false)))

(declare-fun lt!445672 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008681 (= lt!445672 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1008682 () Bool)

(assert (=> b!1008682 (= e!567783 e!567785)))

(declare-fun res!676806 () Bool)

(assert (=> b!1008682 (=> (not res!676806) (not e!567785))))

(assert (=> b!1008682 (= res!676806 (= lt!445671 lt!445673))))

(assert (=> b!1008682 (= lt!445671 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30607 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87118 res!676811) b!1008680))

(assert (= (and b!1008680 res!676807) b!1008669))

(assert (= (and b!1008669 res!676813) b!1008676))

(assert (= (and b!1008676 res!676814) b!1008677))

(assert (= (and b!1008677 res!676805) b!1008675))

(assert (= (and b!1008675 res!676812) b!1008678))

(assert (= (and b!1008678 res!676802) b!1008674))

(assert (= (and b!1008674 res!676810) b!1008679))

(assert (= (and b!1008679 res!676804) b!1008670))

(assert (= (and b!1008670 res!676808) b!1008682))

(assert (= (and b!1008682 res!676806) b!1008671))

(assert (= (and b!1008671 res!676809) b!1008672))

(assert (= (and b!1008672 res!676803) b!1008673))

(assert (= (and b!1008673 res!676801) b!1008681))

(declare-fun m!933839 () Bool)

(assert (=> b!1008672 m!933839))

(declare-fun m!933841 () Bool)

(assert (=> b!1008670 m!933841))

(assert (=> b!1008670 m!933841))

(declare-fun m!933843 () Bool)

(assert (=> b!1008670 m!933843))

(assert (=> b!1008670 m!933843))

(assert (=> b!1008670 m!933841))

(declare-fun m!933845 () Bool)

(assert (=> b!1008670 m!933845))

(assert (=> b!1008682 m!933841))

(assert (=> b!1008682 m!933841))

(declare-fun m!933847 () Bool)

(assert (=> b!1008682 m!933847))

(declare-fun m!933849 () Bool)

(assert (=> b!1008675 m!933849))

(declare-fun m!933851 () Bool)

(assert (=> b!1008678 m!933851))

(declare-fun m!933853 () Bool)

(assert (=> b!1008671 m!933853))

(assert (=> b!1008671 m!933853))

(declare-fun m!933855 () Bool)

(assert (=> b!1008671 m!933855))

(declare-fun m!933857 () Bool)

(assert (=> b!1008671 m!933857))

(declare-fun m!933859 () Bool)

(assert (=> b!1008671 m!933859))

(declare-fun m!933861 () Bool)

(assert (=> b!1008681 m!933861))

(declare-fun m!933863 () Bool)

(assert (=> b!1008677 m!933863))

(declare-fun m!933865 () Bool)

(assert (=> b!1008674 m!933865))

(declare-fun m!933867 () Bool)

(assert (=> start!87118 m!933867))

(declare-fun m!933869 () Bool)

(assert (=> start!87118 m!933869))

(declare-fun m!933871 () Bool)

(assert (=> b!1008676 m!933871))

(assert (=> b!1008669 m!933841))

(assert (=> b!1008669 m!933841))

(declare-fun m!933873 () Bool)

(assert (=> b!1008669 m!933873))

(check-sat (not b!1008682) (not b!1008670) (not b!1008669) (not b!1008681) (not b!1008678) (not b!1008677) (not start!87118) (not b!1008674) (not b!1008676) (not b!1008672) (not b!1008671) (not b!1008675))
(check-sat)
