; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87198 () Bool)

(assert start!87198)

(declare-fun b!1010857 () Bool)

(declare-fun e!568673 () Bool)

(declare-fun e!568672 () Bool)

(assert (=> b!1010857 (= e!568673 e!568672)))

(declare-fun res!679117 () Bool)

(assert (=> b!1010857 (=> (not res!679117) (not e!568672))))

(declare-datatypes ((SeekEntryResult!9572 0))(
  ( (MissingZero!9572 (index!40659 (_ BitVec 32))) (Found!9572 (index!40660 (_ BitVec 32))) (Intermediate!9572 (undefined!10384 Bool) (index!40661 (_ BitVec 32)) (x!88086 (_ BitVec 32))) (Undefined!9572) (MissingVacant!9572 (index!40662 (_ BitVec 32))) )
))
(declare-fun lt!446641 () SeekEntryResult!9572)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010857 (= res!679117 (or (= lt!446641 (MissingVacant!9572 i!1194)) (= lt!446641 (MissingZero!9572 i!1194))))))

(declare-datatypes ((array!63598 0))(
  ( (array!63599 (arr!30615 (Array (_ BitVec 32) (_ BitVec 64))) (size!31119 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63598)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63598 (_ BitVec 32)) SeekEntryResult!9572)

(assert (=> b!1010857 (= lt!446641 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010858 () Bool)

(declare-fun res!679121 () Bool)

(assert (=> b!1010858 (=> (not res!679121) (not e!568673))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1010858 (= res!679121 (and (= (size!31119 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31119 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31119 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!679116 () Bool)

(assert (=> start!87198 (=> (not res!679116) (not e!568673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87198 (= res!679116 (validMask!0 mask!3464))))

(assert (=> start!87198 e!568673))

(declare-fun array_inv!23758 (array!63598) Bool)

(assert (=> start!87198 (array_inv!23758 a!3219)))

(assert (=> start!87198 true))

(declare-fun b!1010859 () Bool)

(declare-fun e!568668 () Bool)

(declare-fun e!568667 () Bool)

(assert (=> b!1010859 (= e!568668 e!568667)))

(declare-fun res!679108 () Bool)

(assert (=> b!1010859 (=> (not res!679108) (not e!568667))))

(declare-fun lt!446644 () SeekEntryResult!9572)

(declare-fun lt!446637 () SeekEntryResult!9572)

(assert (=> b!1010859 (= res!679108 (= lt!446644 lt!446637))))

(declare-fun lt!446639 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63598 (_ BitVec 32)) SeekEntryResult!9572)

(assert (=> b!1010859 (= lt!446644 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446639 (select (arr!30615 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010860 () Bool)

(declare-fun res!679111 () Bool)

(assert (=> b!1010860 (=> (not res!679111) (not e!568673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010860 (= res!679111 (validKeyInArray!0 (select (arr!30615 a!3219) j!170)))))

(declare-fun b!1010861 () Bool)

(declare-fun res!679115 () Bool)

(declare-fun e!568670 () Bool)

(assert (=> b!1010861 (=> (not res!679115) (not e!568670))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1010861 (= res!679115 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010862 () Bool)

(declare-fun e!568671 () Bool)

(assert (=> b!1010862 (= e!568671 e!568670)))

(declare-fun res!679107 () Bool)

(assert (=> b!1010862 (=> (not res!679107) (not e!568670))))

(declare-fun lt!446640 () (_ BitVec 64))

(declare-fun lt!446642 () array!63598)

(declare-fun lt!446643 () SeekEntryResult!9572)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010862 (= res!679107 (not (= lt!446643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446640 mask!3464) lt!446640 lt!446642 mask!3464))))))

(assert (=> b!1010862 (= lt!446640 (select (store (arr!30615 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010862 (= lt!446642 (array!63599 (store (arr!30615 a!3219) i!1194 k0!2224) (size!31119 a!3219)))))

(declare-fun b!1010863 () Bool)

(assert (=> b!1010863 (= e!568667 (= lt!446644 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446639 lt!446640 lt!446642 mask!3464)))))

(declare-fun b!1010864 () Bool)

(declare-fun res!679112 () Bool)

(assert (=> b!1010864 (=> (not res!679112) (not e!568672))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010864 (= res!679112 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31119 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31119 a!3219))))))

(declare-fun b!1010865 () Bool)

(declare-fun res!679119 () Bool)

(assert (=> b!1010865 (=> (not res!679119) (not e!568672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63598 (_ BitVec 32)) Bool)

(assert (=> b!1010865 (= res!679119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010866 () Bool)

(declare-fun res!679120 () Bool)

(assert (=> b!1010866 (=> (not res!679120) (not e!568672))))

(declare-datatypes ((List!21357 0))(
  ( (Nil!21354) (Cons!21353 (h!22548 (_ BitVec 64)) (t!30349 List!21357)) )
))
(declare-fun arrayNoDuplicates!0 (array!63598 (_ BitVec 32) List!21357) Bool)

(assert (=> b!1010866 (= res!679120 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21354))))

(declare-fun b!1010867 () Bool)

(declare-fun res!679110 () Bool)

(assert (=> b!1010867 (=> (not res!679110) (not e!568673))))

(assert (=> b!1010867 (= res!679110 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010868 () Bool)

(declare-fun e!568669 () Bool)

(assert (=> b!1010868 (= e!568669 e!568671)))

(declare-fun res!679114 () Bool)

(assert (=> b!1010868 (=> (not res!679114) (not e!568671))))

(declare-fun lt!446638 () SeekEntryResult!9572)

(assert (=> b!1010868 (= res!679114 (= lt!446638 lt!446637))))

(assert (=> b!1010868 (= lt!446638 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30615 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010869 () Bool)

(assert (=> b!1010869 (= e!568670 e!568668)))

(declare-fun res!679113 () Bool)

(assert (=> b!1010869 (=> (not res!679113) (not e!568668))))

(assert (=> b!1010869 (= res!679113 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446639 #b00000000000000000000000000000000) (bvslt lt!446639 (size!31119 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010869 (= lt!446639 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010870 () Bool)

(assert (=> b!1010870 (= e!568672 e!568669)))

(declare-fun res!679106 () Bool)

(assert (=> b!1010870 (=> (not res!679106) (not e!568669))))

(assert (=> b!1010870 (= res!679106 (= lt!446643 lt!446637))))

(assert (=> b!1010870 (= lt!446637 (Intermediate!9572 false resIndex!38 resX!38))))

(assert (=> b!1010870 (= lt!446643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30615 a!3219) j!170) mask!3464) (select (arr!30615 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010871 () Bool)

(declare-fun res!679118 () Bool)

(assert (=> b!1010871 (=> (not res!679118) (not e!568670))))

(assert (=> b!1010871 (= res!679118 (not (= lt!446638 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446640 lt!446642 mask!3464))))))

(declare-fun b!1010872 () Bool)

(declare-fun res!679109 () Bool)

(assert (=> b!1010872 (=> (not res!679109) (not e!568673))))

(declare-fun arrayContainsKey!0 (array!63598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010872 (= res!679109 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87198 res!679116) b!1010858))

(assert (= (and b!1010858 res!679121) b!1010860))

(assert (= (and b!1010860 res!679111) b!1010867))

(assert (= (and b!1010867 res!679110) b!1010872))

(assert (= (and b!1010872 res!679109) b!1010857))

(assert (= (and b!1010857 res!679117) b!1010865))

(assert (= (and b!1010865 res!679119) b!1010866))

(assert (= (and b!1010866 res!679120) b!1010864))

(assert (= (and b!1010864 res!679112) b!1010870))

(assert (= (and b!1010870 res!679106) b!1010868))

(assert (= (and b!1010868 res!679114) b!1010862))

(assert (= (and b!1010862 res!679107) b!1010871))

(assert (= (and b!1010871 res!679118) b!1010861))

(assert (= (and b!1010861 res!679115) b!1010869))

(assert (= (and b!1010869 res!679113) b!1010859))

(assert (= (and b!1010859 res!679108) b!1010863))

(declare-fun m!934507 () Bool)

(assert (=> b!1010862 m!934507))

(assert (=> b!1010862 m!934507))

(declare-fun m!934509 () Bool)

(assert (=> b!1010862 m!934509))

(declare-fun m!934511 () Bool)

(assert (=> b!1010862 m!934511))

(declare-fun m!934513 () Bool)

(assert (=> b!1010862 m!934513))

(declare-fun m!934515 () Bool)

(assert (=> b!1010865 m!934515))

(declare-fun m!934517 () Bool)

(assert (=> b!1010872 m!934517))

(declare-fun m!934519 () Bool)

(assert (=> b!1010857 m!934519))

(declare-fun m!934521 () Bool)

(assert (=> start!87198 m!934521))

(declare-fun m!934523 () Bool)

(assert (=> start!87198 m!934523))

(declare-fun m!934525 () Bool)

(assert (=> b!1010859 m!934525))

(assert (=> b!1010859 m!934525))

(declare-fun m!934527 () Bool)

(assert (=> b!1010859 m!934527))

(declare-fun m!934529 () Bool)

(assert (=> b!1010869 m!934529))

(declare-fun m!934531 () Bool)

(assert (=> b!1010863 m!934531))

(assert (=> b!1010860 m!934525))

(assert (=> b!1010860 m!934525))

(declare-fun m!934533 () Bool)

(assert (=> b!1010860 m!934533))

(assert (=> b!1010868 m!934525))

(assert (=> b!1010868 m!934525))

(declare-fun m!934535 () Bool)

(assert (=> b!1010868 m!934535))

(declare-fun m!934537 () Bool)

(assert (=> b!1010866 m!934537))

(assert (=> b!1010870 m!934525))

(assert (=> b!1010870 m!934525))

(declare-fun m!934539 () Bool)

(assert (=> b!1010870 m!934539))

(assert (=> b!1010870 m!934539))

(assert (=> b!1010870 m!934525))

(declare-fun m!934541 () Bool)

(assert (=> b!1010870 m!934541))

(declare-fun m!934543 () Bool)

(assert (=> b!1010867 m!934543))

(declare-fun m!934545 () Bool)

(assert (=> b!1010871 m!934545))

(check-sat (not b!1010868) (not start!87198) (not b!1010869) (not b!1010862) (not b!1010860) (not b!1010866) (not b!1010867) (not b!1010859) (not b!1010857) (not b!1010871) (not b!1010870) (not b!1010863) (not b!1010865) (not b!1010872))
(check-sat)
(get-model)

(declare-fun b!1010987 () Bool)

(declare-fun e!568732 () SeekEntryResult!9572)

(assert (=> b!1010987 (= e!568732 (Intermediate!9572 true lt!446639 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1010988 () Bool)

(declare-fun lt!446698 () SeekEntryResult!9572)

(assert (=> b!1010988 (and (bvsge (index!40661 lt!446698) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446698) (size!31119 lt!446642)))))

(declare-fun res!679224 () Bool)

(assert (=> b!1010988 (= res!679224 (= (select (arr!30615 lt!446642) (index!40661 lt!446698)) lt!446640))))

(declare-fun e!568736 () Bool)

(assert (=> b!1010988 (=> res!679224 e!568736)))

(declare-fun e!568734 () Bool)

(assert (=> b!1010988 (= e!568734 e!568736)))

(declare-fun b!1010989 () Bool)

(assert (=> b!1010989 (and (bvsge (index!40661 lt!446698) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446698) (size!31119 lt!446642)))))

(assert (=> b!1010989 (= e!568736 (= (select (arr!30615 lt!446642) (index!40661 lt!446698)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010990 () Bool)

(declare-fun e!568735 () SeekEntryResult!9572)

(assert (=> b!1010990 (= e!568735 (Intermediate!9572 false lt!446639 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1010991 () Bool)

(declare-fun e!568733 () Bool)

(assert (=> b!1010991 (= e!568733 e!568734)))

(declare-fun res!679226 () Bool)

(get-info :version)

(assert (=> b!1010991 (= res!679226 (and ((_ is Intermediate!9572) lt!446698) (not (undefined!10384 lt!446698)) (bvslt (x!88086 lt!446698) #b01111111111111111111111111111110) (bvsge (x!88086 lt!446698) #b00000000000000000000000000000000) (bvsge (x!88086 lt!446698) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1010991 (=> (not res!679226) (not e!568734))))

(declare-fun b!1010992 () Bool)

(assert (=> b!1010992 (= e!568732 e!568735)))

(declare-fun c!102045 () Bool)

(declare-fun lt!446697 () (_ BitVec 64))

(assert (=> b!1010992 (= c!102045 (or (= lt!446697 lt!446640) (= (bvadd lt!446697 lt!446697) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010993 () Bool)

(assert (=> b!1010993 (= e!568735 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446639 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) lt!446640 lt!446642 mask!3464))))

(declare-fun b!1010995 () Bool)

(assert (=> b!1010995 (= e!568733 (bvsge (x!88086 lt!446698) #b01111111111111111111111111111110))))

(declare-fun d!119947 () Bool)

(assert (=> d!119947 e!568733))

(declare-fun c!102046 () Bool)

(assert (=> d!119947 (= c!102046 (and ((_ is Intermediate!9572) lt!446698) (undefined!10384 lt!446698)))))

(assert (=> d!119947 (= lt!446698 e!568732)))

(declare-fun c!102044 () Bool)

(assert (=> d!119947 (= c!102044 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!119947 (= lt!446697 (select (arr!30615 lt!446642) lt!446639))))

(assert (=> d!119947 (validMask!0 mask!3464)))

(assert (=> d!119947 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446639 lt!446640 lt!446642 mask!3464) lt!446698)))

(declare-fun b!1010994 () Bool)

(assert (=> b!1010994 (and (bvsge (index!40661 lt!446698) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446698) (size!31119 lt!446642)))))

(declare-fun res!679225 () Bool)

(assert (=> b!1010994 (= res!679225 (= (select (arr!30615 lt!446642) (index!40661 lt!446698)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010994 (=> res!679225 e!568736)))

(assert (= (and d!119947 c!102044) b!1010987))

(assert (= (and d!119947 (not c!102044)) b!1010992))

(assert (= (and b!1010992 c!102045) b!1010990))

(assert (= (and b!1010992 (not c!102045)) b!1010993))

(assert (= (and d!119947 c!102046) b!1010995))

(assert (= (and d!119947 (not c!102046)) b!1010991))

(assert (= (and b!1010991 res!679226) b!1010988))

(assert (= (and b!1010988 (not res!679224)) b!1010994))

(assert (= (and b!1010994 (not res!679225)) b!1010989))

(declare-fun m!934627 () Bool)

(assert (=> d!119947 m!934627))

(assert (=> d!119947 m!934521))

(declare-fun m!934629 () Bool)

(assert (=> b!1010994 m!934629))

(declare-fun m!934631 () Bool)

(assert (=> b!1010993 m!934631))

(assert (=> b!1010993 m!934631))

(declare-fun m!934633 () Bool)

(assert (=> b!1010993 m!934633))

(assert (=> b!1010988 m!934629))

(assert (=> b!1010989 m!934629))

(assert (=> b!1010863 d!119947))

(declare-fun d!119949 () Bool)

(declare-fun res!679231 () Bool)

(declare-fun e!568741 () Bool)

(assert (=> d!119949 (=> res!679231 e!568741)))

(assert (=> d!119949 (= res!679231 (= (select (arr!30615 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119949 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!568741)))

(declare-fun b!1011000 () Bool)

(declare-fun e!568742 () Bool)

(assert (=> b!1011000 (= e!568741 e!568742)))

(declare-fun res!679232 () Bool)

(assert (=> b!1011000 (=> (not res!679232) (not e!568742))))

(assert (=> b!1011000 (= res!679232 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31119 a!3219)))))

(declare-fun b!1011001 () Bool)

(assert (=> b!1011001 (= e!568742 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119949 (not res!679231)) b!1011000))

(assert (= (and b!1011000 res!679232) b!1011001))

(declare-fun m!934635 () Bool)

(assert (=> d!119949 m!934635))

(declare-fun m!934637 () Bool)

(assert (=> b!1011001 m!934637))

(assert (=> b!1010872 d!119949))

(declare-fun b!1011002 () Bool)

(declare-fun e!568743 () SeekEntryResult!9572)

(assert (=> b!1011002 (= e!568743 (Intermediate!9572 true (toIndex!0 lt!446640 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011003 () Bool)

(declare-fun lt!446700 () SeekEntryResult!9572)

(assert (=> b!1011003 (and (bvsge (index!40661 lt!446700) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446700) (size!31119 lt!446642)))))

(declare-fun res!679233 () Bool)

(assert (=> b!1011003 (= res!679233 (= (select (arr!30615 lt!446642) (index!40661 lt!446700)) lt!446640))))

(declare-fun e!568747 () Bool)

(assert (=> b!1011003 (=> res!679233 e!568747)))

(declare-fun e!568745 () Bool)

(assert (=> b!1011003 (= e!568745 e!568747)))

(declare-fun b!1011004 () Bool)

(assert (=> b!1011004 (and (bvsge (index!40661 lt!446700) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446700) (size!31119 lt!446642)))))

(assert (=> b!1011004 (= e!568747 (= (select (arr!30615 lt!446642) (index!40661 lt!446700)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011005 () Bool)

(declare-fun e!568746 () SeekEntryResult!9572)

(assert (=> b!1011005 (= e!568746 (Intermediate!9572 false (toIndex!0 lt!446640 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011006 () Bool)

(declare-fun e!568744 () Bool)

(assert (=> b!1011006 (= e!568744 e!568745)))

(declare-fun res!679235 () Bool)

(assert (=> b!1011006 (= res!679235 (and ((_ is Intermediate!9572) lt!446700) (not (undefined!10384 lt!446700)) (bvslt (x!88086 lt!446700) #b01111111111111111111111111111110) (bvsge (x!88086 lt!446700) #b00000000000000000000000000000000) (bvsge (x!88086 lt!446700) #b00000000000000000000000000000000)))))

(assert (=> b!1011006 (=> (not res!679235) (not e!568745))))

(declare-fun b!1011007 () Bool)

(assert (=> b!1011007 (= e!568743 e!568746)))

(declare-fun c!102048 () Bool)

(declare-fun lt!446699 () (_ BitVec 64))

(assert (=> b!1011007 (= c!102048 (or (= lt!446699 lt!446640) (= (bvadd lt!446699 lt!446699) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011008 () Bool)

(assert (=> b!1011008 (= e!568746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446640 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446640 lt!446642 mask!3464))))

(declare-fun b!1011010 () Bool)

(assert (=> b!1011010 (= e!568744 (bvsge (x!88086 lt!446700) #b01111111111111111111111111111110))))

(declare-fun d!119951 () Bool)

(assert (=> d!119951 e!568744))

(declare-fun c!102049 () Bool)

(assert (=> d!119951 (= c!102049 (and ((_ is Intermediate!9572) lt!446700) (undefined!10384 lt!446700)))))

(assert (=> d!119951 (= lt!446700 e!568743)))

(declare-fun c!102047 () Bool)

(assert (=> d!119951 (= c!102047 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119951 (= lt!446699 (select (arr!30615 lt!446642) (toIndex!0 lt!446640 mask!3464)))))

(assert (=> d!119951 (validMask!0 mask!3464)))

(assert (=> d!119951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446640 mask!3464) lt!446640 lt!446642 mask!3464) lt!446700)))

(declare-fun b!1011009 () Bool)

(assert (=> b!1011009 (and (bvsge (index!40661 lt!446700) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446700) (size!31119 lt!446642)))))

(declare-fun res!679234 () Bool)

(assert (=> b!1011009 (= res!679234 (= (select (arr!30615 lt!446642) (index!40661 lt!446700)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011009 (=> res!679234 e!568747)))

(assert (= (and d!119951 c!102047) b!1011002))

(assert (= (and d!119951 (not c!102047)) b!1011007))

(assert (= (and b!1011007 c!102048) b!1011005))

(assert (= (and b!1011007 (not c!102048)) b!1011008))

(assert (= (and d!119951 c!102049) b!1011010))

(assert (= (and d!119951 (not c!102049)) b!1011006))

(assert (= (and b!1011006 res!679235) b!1011003))

(assert (= (and b!1011003 (not res!679233)) b!1011009))

(assert (= (and b!1011009 (not res!679234)) b!1011004))

(assert (=> d!119951 m!934507))

(declare-fun m!934639 () Bool)

(assert (=> d!119951 m!934639))

(assert (=> d!119951 m!934521))

(declare-fun m!934641 () Bool)

(assert (=> b!1011009 m!934641))

(assert (=> b!1011008 m!934507))

(declare-fun m!934643 () Bool)

(assert (=> b!1011008 m!934643))

(assert (=> b!1011008 m!934643))

(declare-fun m!934645 () Bool)

(assert (=> b!1011008 m!934645))

(assert (=> b!1011003 m!934641))

(assert (=> b!1011004 m!934641))

(assert (=> b!1010862 d!119951))

(declare-fun d!119953 () Bool)

(declare-fun lt!446706 () (_ BitVec 32))

(declare-fun lt!446705 () (_ BitVec 32))

(assert (=> d!119953 (= lt!446706 (bvmul (bvxor lt!446705 (bvlshr lt!446705 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119953 (= lt!446705 ((_ extract 31 0) (bvand (bvxor lt!446640 (bvlshr lt!446640 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119953 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679236 (let ((h!22551 ((_ extract 31 0) (bvand (bvxor lt!446640 (bvlshr lt!446640 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88090 (bvmul (bvxor h!22551 (bvlshr h!22551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88090 (bvlshr x!88090 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679236 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679236 #b00000000000000000000000000000000))))))

(assert (=> d!119953 (= (toIndex!0 lt!446640 mask!3464) (bvand (bvxor lt!446706 (bvlshr lt!446706 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010862 d!119953))

(declare-fun b!1011019 () Bool)

(declare-fun e!568755 () Bool)

(declare-fun call!42403 () Bool)

(assert (=> b!1011019 (= e!568755 call!42403)))

(declare-fun d!119957 () Bool)

(declare-fun res!679241 () Bool)

(declare-fun e!568754 () Bool)

(assert (=> d!119957 (=> res!679241 e!568754)))

(assert (=> d!119957 (= res!679241 (bvsge #b00000000000000000000000000000000 (size!31119 a!3219)))))

(assert (=> d!119957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568754)))

(declare-fun b!1011020 () Bool)

(declare-fun e!568756 () Bool)

(assert (=> b!1011020 (= e!568756 call!42403)))

(declare-fun b!1011021 () Bool)

(assert (=> b!1011021 (= e!568754 e!568755)))

(declare-fun c!102052 () Bool)

(assert (=> b!1011021 (= c!102052 (validKeyInArray!0 (select (arr!30615 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011022 () Bool)

(assert (=> b!1011022 (= e!568755 e!568756)))

(declare-fun lt!446714 () (_ BitVec 64))

(assert (=> b!1011022 (= lt!446714 (select (arr!30615 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32905 0))(
  ( (Unit!32906) )
))
(declare-fun lt!446713 () Unit!32905)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63598 (_ BitVec 64) (_ BitVec 32)) Unit!32905)

(assert (=> b!1011022 (= lt!446713 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446714 #b00000000000000000000000000000000))))

(assert (=> b!1011022 (arrayContainsKey!0 a!3219 lt!446714 #b00000000000000000000000000000000)))

(declare-fun lt!446715 () Unit!32905)

(assert (=> b!1011022 (= lt!446715 lt!446713)))

(declare-fun res!679242 () Bool)

(assert (=> b!1011022 (= res!679242 (= (seekEntryOrOpen!0 (select (arr!30615 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9572 #b00000000000000000000000000000000)))))

(assert (=> b!1011022 (=> (not res!679242) (not e!568756))))

(declare-fun bm!42400 () Bool)

(assert (=> bm!42400 (= call!42403 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119957 (not res!679241)) b!1011021))

(assert (= (and b!1011021 c!102052) b!1011022))

(assert (= (and b!1011021 (not c!102052)) b!1011019))

(assert (= (and b!1011022 res!679242) b!1011020))

(assert (= (or b!1011020 b!1011019) bm!42400))

(assert (=> b!1011021 m!934635))

(assert (=> b!1011021 m!934635))

(declare-fun m!934647 () Bool)

(assert (=> b!1011021 m!934647))

(assert (=> b!1011022 m!934635))

(declare-fun m!934649 () Bool)

(assert (=> b!1011022 m!934649))

(declare-fun m!934651 () Bool)

(assert (=> b!1011022 m!934651))

(assert (=> b!1011022 m!934635))

(declare-fun m!934653 () Bool)

(assert (=> b!1011022 m!934653))

(declare-fun m!934655 () Bool)

(assert (=> bm!42400 m!934655))

(assert (=> b!1010865 d!119957))

(declare-fun b!1011059 () Bool)

(declare-fun e!568781 () Bool)

(declare-fun e!568783 () Bool)

(assert (=> b!1011059 (= e!568781 e!568783)))

(declare-fun c!102063 () Bool)

(assert (=> b!1011059 (= c!102063 (validKeyInArray!0 (select (arr!30615 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011060 () Bool)

(declare-fun e!568782 () Bool)

(declare-fun contains!5868 (List!21357 (_ BitVec 64)) Bool)

(assert (=> b!1011060 (= e!568782 (contains!5868 Nil!21354 (select (arr!30615 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011062 () Bool)

(declare-fun e!568784 () Bool)

(assert (=> b!1011062 (= e!568784 e!568781)))

(declare-fun res!679260 () Bool)

(assert (=> b!1011062 (=> (not res!679260) (not e!568781))))

(assert (=> b!1011062 (= res!679260 (not e!568782))))

(declare-fun res!679261 () Bool)

(assert (=> b!1011062 (=> (not res!679261) (not e!568782))))

(assert (=> b!1011062 (= res!679261 (validKeyInArray!0 (select (arr!30615 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011063 () Bool)

(declare-fun call!42406 () Bool)

(assert (=> b!1011063 (= e!568783 call!42406)))

(declare-fun bm!42403 () Bool)

(assert (=> bm!42403 (= call!42406 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102063 (Cons!21353 (select (arr!30615 a!3219) #b00000000000000000000000000000000) Nil!21354) Nil!21354)))))

(declare-fun b!1011061 () Bool)

(assert (=> b!1011061 (= e!568783 call!42406)))

(declare-fun d!119961 () Bool)

(declare-fun res!679259 () Bool)

(assert (=> d!119961 (=> res!679259 e!568784)))

(assert (=> d!119961 (= res!679259 (bvsge #b00000000000000000000000000000000 (size!31119 a!3219)))))

(assert (=> d!119961 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21354) e!568784)))

(assert (= (and d!119961 (not res!679259)) b!1011062))

(assert (= (and b!1011062 res!679261) b!1011060))

(assert (= (and b!1011062 res!679260) b!1011059))

(assert (= (and b!1011059 c!102063) b!1011061))

(assert (= (and b!1011059 (not c!102063)) b!1011063))

(assert (= (or b!1011061 b!1011063) bm!42403))

(assert (=> b!1011059 m!934635))

(assert (=> b!1011059 m!934635))

(assert (=> b!1011059 m!934647))

(assert (=> b!1011060 m!934635))

(assert (=> b!1011060 m!934635))

(declare-fun m!934657 () Bool)

(assert (=> b!1011060 m!934657))

(assert (=> b!1011062 m!934635))

(assert (=> b!1011062 m!934635))

(assert (=> b!1011062 m!934647))

(assert (=> bm!42403 m!934635))

(declare-fun m!934659 () Bool)

(assert (=> bm!42403 m!934659))

(assert (=> b!1010866 d!119961))

(declare-fun b!1011120 () Bool)

(declare-fun e!568819 () SeekEntryResult!9572)

(declare-fun e!568818 () SeekEntryResult!9572)

(assert (=> b!1011120 (= e!568819 e!568818)))

(declare-fun lt!446750 () (_ BitVec 64))

(declare-fun lt!446749 () SeekEntryResult!9572)

(assert (=> b!1011120 (= lt!446750 (select (arr!30615 a!3219) (index!40661 lt!446749)))))

(declare-fun c!102084 () Bool)

(assert (=> b!1011120 (= c!102084 (= lt!446750 k0!2224))))

(declare-fun b!1011121 () Bool)

(assert (=> b!1011121 (= e!568818 (Found!9572 (index!40661 lt!446749)))))

(declare-fun e!568820 () SeekEntryResult!9572)

(declare-fun b!1011122 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63598 (_ BitVec 32)) SeekEntryResult!9572)

(assert (=> b!1011122 (= e!568820 (seekKeyOrZeroReturnVacant!0 (x!88086 lt!446749) (index!40661 lt!446749) (index!40661 lt!446749) k0!2224 a!3219 mask!3464))))

(declare-fun b!1011123 () Bool)

(assert (=> b!1011123 (= e!568819 Undefined!9572)))

(declare-fun d!119963 () Bool)

(declare-fun lt!446751 () SeekEntryResult!9572)

(assert (=> d!119963 (and (or ((_ is Undefined!9572) lt!446751) (not ((_ is Found!9572) lt!446751)) (and (bvsge (index!40660 lt!446751) #b00000000000000000000000000000000) (bvslt (index!40660 lt!446751) (size!31119 a!3219)))) (or ((_ is Undefined!9572) lt!446751) ((_ is Found!9572) lt!446751) (not ((_ is MissingZero!9572) lt!446751)) (and (bvsge (index!40659 lt!446751) #b00000000000000000000000000000000) (bvslt (index!40659 lt!446751) (size!31119 a!3219)))) (or ((_ is Undefined!9572) lt!446751) ((_ is Found!9572) lt!446751) ((_ is MissingZero!9572) lt!446751) (not ((_ is MissingVacant!9572) lt!446751)) (and (bvsge (index!40662 lt!446751) #b00000000000000000000000000000000) (bvslt (index!40662 lt!446751) (size!31119 a!3219)))) (or ((_ is Undefined!9572) lt!446751) (ite ((_ is Found!9572) lt!446751) (= (select (arr!30615 a!3219) (index!40660 lt!446751)) k0!2224) (ite ((_ is MissingZero!9572) lt!446751) (= (select (arr!30615 a!3219) (index!40659 lt!446751)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9572) lt!446751) (= (select (arr!30615 a!3219) (index!40662 lt!446751)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119963 (= lt!446751 e!568819)))

(declare-fun c!102085 () Bool)

(assert (=> d!119963 (= c!102085 (and ((_ is Intermediate!9572) lt!446749) (undefined!10384 lt!446749)))))

(assert (=> d!119963 (= lt!446749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119963 (validMask!0 mask!3464)))

(assert (=> d!119963 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!446751)))

(declare-fun b!1011124 () Bool)

(assert (=> b!1011124 (= e!568820 (MissingZero!9572 (index!40661 lt!446749)))))

(declare-fun b!1011125 () Bool)

(declare-fun c!102083 () Bool)

(assert (=> b!1011125 (= c!102083 (= lt!446750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011125 (= e!568818 e!568820)))

(assert (= (and d!119963 c!102085) b!1011123))

(assert (= (and d!119963 (not c!102085)) b!1011120))

(assert (= (and b!1011120 c!102084) b!1011121))

(assert (= (and b!1011120 (not c!102084)) b!1011125))

(assert (= (and b!1011125 c!102083) b!1011124))

(assert (= (and b!1011125 (not c!102083)) b!1011122))

(declare-fun m!934691 () Bool)

(assert (=> b!1011120 m!934691))

(declare-fun m!934693 () Bool)

(assert (=> b!1011122 m!934693))

(declare-fun m!934695 () Bool)

(assert (=> d!119963 m!934695))

(declare-fun m!934697 () Bool)

(assert (=> d!119963 m!934697))

(assert (=> d!119963 m!934695))

(declare-fun m!934699 () Bool)

(assert (=> d!119963 m!934699))

(declare-fun m!934701 () Bool)

(assert (=> d!119963 m!934701))

(declare-fun m!934703 () Bool)

(assert (=> d!119963 m!934703))

(assert (=> d!119963 m!934521))

(assert (=> b!1010857 d!119963))

(declare-fun b!1011137 () Bool)

(declare-fun e!568828 () SeekEntryResult!9572)

(assert (=> b!1011137 (= e!568828 (Intermediate!9572 true index!1507 x!1245))))

(declare-fun b!1011138 () Bool)

(declare-fun lt!446755 () SeekEntryResult!9572)

(assert (=> b!1011138 (and (bvsge (index!40661 lt!446755) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446755) (size!31119 a!3219)))))

(declare-fun res!679286 () Bool)

(assert (=> b!1011138 (= res!679286 (= (select (arr!30615 a!3219) (index!40661 lt!446755)) (select (arr!30615 a!3219) j!170)))))

(declare-fun e!568832 () Bool)

(assert (=> b!1011138 (=> res!679286 e!568832)))

(declare-fun e!568830 () Bool)

(assert (=> b!1011138 (= e!568830 e!568832)))

(declare-fun b!1011139 () Bool)

(assert (=> b!1011139 (and (bvsge (index!40661 lt!446755) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446755) (size!31119 a!3219)))))

(assert (=> b!1011139 (= e!568832 (= (select (arr!30615 a!3219) (index!40661 lt!446755)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011140 () Bool)

(declare-fun e!568831 () SeekEntryResult!9572)

(assert (=> b!1011140 (= e!568831 (Intermediate!9572 false index!1507 x!1245))))

(declare-fun b!1011141 () Bool)

(declare-fun e!568829 () Bool)

(assert (=> b!1011141 (= e!568829 e!568830)))

(declare-fun res!679288 () Bool)

(assert (=> b!1011141 (= res!679288 (and ((_ is Intermediate!9572) lt!446755) (not (undefined!10384 lt!446755)) (bvslt (x!88086 lt!446755) #b01111111111111111111111111111110) (bvsge (x!88086 lt!446755) #b00000000000000000000000000000000) (bvsge (x!88086 lt!446755) x!1245)))))

(assert (=> b!1011141 (=> (not res!679288) (not e!568830))))

(declare-fun b!1011142 () Bool)

(assert (=> b!1011142 (= e!568828 e!568831)))

(declare-fun c!102090 () Bool)

(declare-fun lt!446754 () (_ BitVec 64))

(assert (=> b!1011142 (= c!102090 (or (= lt!446754 (select (arr!30615 a!3219) j!170)) (= (bvadd lt!446754 lt!446754) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011143 () Bool)

(assert (=> b!1011143 (= e!568831 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30615 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011145 () Bool)

(assert (=> b!1011145 (= e!568829 (bvsge (x!88086 lt!446755) #b01111111111111111111111111111110))))

(declare-fun d!119979 () Bool)

(assert (=> d!119979 e!568829))

(declare-fun c!102091 () Bool)

(assert (=> d!119979 (= c!102091 (and ((_ is Intermediate!9572) lt!446755) (undefined!10384 lt!446755)))))

(assert (=> d!119979 (= lt!446755 e!568828)))

(declare-fun c!102089 () Bool)

(assert (=> d!119979 (= c!102089 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119979 (= lt!446754 (select (arr!30615 a!3219) index!1507))))

(assert (=> d!119979 (validMask!0 mask!3464)))

(assert (=> d!119979 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30615 a!3219) j!170) a!3219 mask!3464) lt!446755)))

(declare-fun b!1011144 () Bool)

(assert (=> b!1011144 (and (bvsge (index!40661 lt!446755) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446755) (size!31119 a!3219)))))

(declare-fun res!679287 () Bool)

(assert (=> b!1011144 (= res!679287 (= (select (arr!30615 a!3219) (index!40661 lt!446755)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011144 (=> res!679287 e!568832)))

(assert (= (and d!119979 c!102089) b!1011137))

(assert (= (and d!119979 (not c!102089)) b!1011142))

(assert (= (and b!1011142 c!102090) b!1011140))

(assert (= (and b!1011142 (not c!102090)) b!1011143))

(assert (= (and d!119979 c!102091) b!1011145))

(assert (= (and d!119979 (not c!102091)) b!1011141))

(assert (= (and b!1011141 res!679288) b!1011138))

(assert (= (and b!1011138 (not res!679286)) b!1011144))

(assert (= (and b!1011144 (not res!679287)) b!1011139))

(declare-fun m!934713 () Bool)

(assert (=> d!119979 m!934713))

(assert (=> d!119979 m!934521))

(declare-fun m!934715 () Bool)

(assert (=> b!1011144 m!934715))

(assert (=> b!1011143 m!934529))

(assert (=> b!1011143 m!934529))

(assert (=> b!1011143 m!934525))

(declare-fun m!934717 () Bool)

(assert (=> b!1011143 m!934717))

(assert (=> b!1011138 m!934715))

(assert (=> b!1011139 m!934715))

(assert (=> b!1010868 d!119979))

(declare-fun d!119983 () Bool)

(assert (=> d!119983 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87198 d!119983))

(declare-fun d!119999 () Bool)

(assert (=> d!119999 (= (array_inv!23758 a!3219) (bvsge (size!31119 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87198 d!119999))

(declare-fun d!120003 () Bool)

(assert (=> d!120003 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010867 d!120003))

(declare-fun d!120007 () Bool)

(assert (=> d!120007 (= (validKeyInArray!0 (select (arr!30615 a!3219) j!170)) (and (not (= (select (arr!30615 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30615 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010860 d!120007))

(declare-fun b!1011215 () Bool)

(declare-fun e!568875 () SeekEntryResult!9572)

(assert (=> b!1011215 (= e!568875 (Intermediate!9572 true index!1507 x!1245))))

(declare-fun b!1011216 () Bool)

(declare-fun lt!446778 () SeekEntryResult!9572)

(assert (=> b!1011216 (and (bvsge (index!40661 lt!446778) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446778) (size!31119 lt!446642)))))

(declare-fun res!679317 () Bool)

(assert (=> b!1011216 (= res!679317 (= (select (arr!30615 lt!446642) (index!40661 lt!446778)) lt!446640))))

(declare-fun e!568879 () Bool)

(assert (=> b!1011216 (=> res!679317 e!568879)))

(declare-fun e!568877 () Bool)

(assert (=> b!1011216 (= e!568877 e!568879)))

(declare-fun b!1011217 () Bool)

(assert (=> b!1011217 (and (bvsge (index!40661 lt!446778) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446778) (size!31119 lt!446642)))))

(assert (=> b!1011217 (= e!568879 (= (select (arr!30615 lt!446642) (index!40661 lt!446778)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011218 () Bool)

(declare-fun e!568878 () SeekEntryResult!9572)

(assert (=> b!1011218 (= e!568878 (Intermediate!9572 false index!1507 x!1245))))

(declare-fun b!1011219 () Bool)

(declare-fun e!568876 () Bool)

(assert (=> b!1011219 (= e!568876 e!568877)))

(declare-fun res!679319 () Bool)

(assert (=> b!1011219 (= res!679319 (and ((_ is Intermediate!9572) lt!446778) (not (undefined!10384 lt!446778)) (bvslt (x!88086 lt!446778) #b01111111111111111111111111111110) (bvsge (x!88086 lt!446778) #b00000000000000000000000000000000) (bvsge (x!88086 lt!446778) x!1245)))))

(assert (=> b!1011219 (=> (not res!679319) (not e!568877))))

(declare-fun b!1011220 () Bool)

(assert (=> b!1011220 (= e!568875 e!568878)))

(declare-fun c!102114 () Bool)

(declare-fun lt!446777 () (_ BitVec 64))

(assert (=> b!1011220 (= c!102114 (or (= lt!446777 lt!446640) (= (bvadd lt!446777 lt!446777) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011221 () Bool)

(assert (=> b!1011221 (= e!568878 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446640 lt!446642 mask!3464))))

(declare-fun b!1011224 () Bool)

(assert (=> b!1011224 (= e!568876 (bvsge (x!88086 lt!446778) #b01111111111111111111111111111110))))

(declare-fun d!120009 () Bool)

(assert (=> d!120009 e!568876))

(declare-fun c!102115 () Bool)

(assert (=> d!120009 (= c!102115 (and ((_ is Intermediate!9572) lt!446778) (undefined!10384 lt!446778)))))

(assert (=> d!120009 (= lt!446778 e!568875)))

(declare-fun c!102113 () Bool)

(assert (=> d!120009 (= c!102113 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120009 (= lt!446777 (select (arr!30615 lt!446642) index!1507))))

(assert (=> d!120009 (validMask!0 mask!3464)))

(assert (=> d!120009 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446640 lt!446642 mask!3464) lt!446778)))

(declare-fun b!1011222 () Bool)

(assert (=> b!1011222 (and (bvsge (index!40661 lt!446778) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446778) (size!31119 lt!446642)))))

(declare-fun res!679318 () Bool)

(assert (=> b!1011222 (= res!679318 (= (select (arr!30615 lt!446642) (index!40661 lt!446778)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011222 (=> res!679318 e!568879)))

(assert (= (and d!120009 c!102113) b!1011215))

(assert (= (and d!120009 (not c!102113)) b!1011220))

(assert (= (and b!1011220 c!102114) b!1011218))

(assert (= (and b!1011220 (not c!102114)) b!1011221))

(assert (= (and d!120009 c!102115) b!1011224))

(assert (= (and d!120009 (not c!102115)) b!1011219))

(assert (= (and b!1011219 res!679319) b!1011216))

(assert (= (and b!1011216 (not res!679317)) b!1011222))

(assert (= (and b!1011222 (not res!679318)) b!1011217))

(declare-fun m!934768 () Bool)

(assert (=> d!120009 m!934768))

(assert (=> d!120009 m!934521))

(declare-fun m!934773 () Bool)

(assert (=> b!1011222 m!934773))

(assert (=> b!1011221 m!934529))

(assert (=> b!1011221 m!934529))

(declare-fun m!934775 () Bool)

(assert (=> b!1011221 m!934775))

(assert (=> b!1011216 m!934773))

(assert (=> b!1011217 m!934773))

(assert (=> b!1010871 d!120009))

(declare-fun d!120015 () Bool)

(declare-fun lt!446787 () (_ BitVec 32))

(assert (=> d!120015 (and (bvsge lt!446787 #b00000000000000000000000000000000) (bvslt lt!446787 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120015 (= lt!446787 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!120015 (validMask!0 mask!3464)))

(assert (=> d!120015 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446787)))

(declare-fun bs!28706 () Bool)

(assert (= bs!28706 d!120015))

(declare-fun m!934787 () Bool)

(assert (=> bs!28706 m!934787))

(assert (=> bs!28706 m!934521))

(assert (=> b!1010869 d!120015))

(declare-fun b!1011242 () Bool)

(declare-fun e!568890 () SeekEntryResult!9572)

(assert (=> b!1011242 (= e!568890 (Intermediate!9572 true lt!446639 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011243 () Bool)

(declare-fun lt!446789 () SeekEntryResult!9572)

(assert (=> b!1011243 (and (bvsge (index!40661 lt!446789) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446789) (size!31119 a!3219)))))

(declare-fun res!679326 () Bool)

(assert (=> b!1011243 (= res!679326 (= (select (arr!30615 a!3219) (index!40661 lt!446789)) (select (arr!30615 a!3219) j!170)))))

(declare-fun e!568894 () Bool)

(assert (=> b!1011243 (=> res!679326 e!568894)))

(declare-fun e!568892 () Bool)

(assert (=> b!1011243 (= e!568892 e!568894)))

(declare-fun b!1011244 () Bool)

(assert (=> b!1011244 (and (bvsge (index!40661 lt!446789) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446789) (size!31119 a!3219)))))

(assert (=> b!1011244 (= e!568894 (= (select (arr!30615 a!3219) (index!40661 lt!446789)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011245 () Bool)

(declare-fun e!568893 () SeekEntryResult!9572)

(assert (=> b!1011245 (= e!568893 (Intermediate!9572 false lt!446639 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011246 () Bool)

(declare-fun e!568891 () Bool)

(assert (=> b!1011246 (= e!568891 e!568892)))

(declare-fun res!679328 () Bool)

(assert (=> b!1011246 (= res!679328 (and ((_ is Intermediate!9572) lt!446789) (not (undefined!10384 lt!446789)) (bvslt (x!88086 lt!446789) #b01111111111111111111111111111110) (bvsge (x!88086 lt!446789) #b00000000000000000000000000000000) (bvsge (x!88086 lt!446789) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1011246 (=> (not res!679328) (not e!568892))))

(declare-fun b!1011247 () Bool)

(assert (=> b!1011247 (= e!568890 e!568893)))

(declare-fun lt!446788 () (_ BitVec 64))

(declare-fun c!102123 () Bool)

(assert (=> b!1011247 (= c!102123 (or (= lt!446788 (select (arr!30615 a!3219) j!170)) (= (bvadd lt!446788 lt!446788) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011248 () Bool)

(assert (=> b!1011248 (= e!568893 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446639 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) (select (arr!30615 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011250 () Bool)

(assert (=> b!1011250 (= e!568891 (bvsge (x!88086 lt!446789) #b01111111111111111111111111111110))))

(declare-fun d!120023 () Bool)

(assert (=> d!120023 e!568891))

(declare-fun c!102124 () Bool)

(assert (=> d!120023 (= c!102124 (and ((_ is Intermediate!9572) lt!446789) (undefined!10384 lt!446789)))))

(assert (=> d!120023 (= lt!446789 e!568890)))

(declare-fun c!102122 () Bool)

(assert (=> d!120023 (= c!102122 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120023 (= lt!446788 (select (arr!30615 a!3219) lt!446639))))

(assert (=> d!120023 (validMask!0 mask!3464)))

(assert (=> d!120023 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446639 (select (arr!30615 a!3219) j!170) a!3219 mask!3464) lt!446789)))

(declare-fun b!1011249 () Bool)

(assert (=> b!1011249 (and (bvsge (index!40661 lt!446789) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446789) (size!31119 a!3219)))))

(declare-fun res!679327 () Bool)

(assert (=> b!1011249 (= res!679327 (= (select (arr!30615 a!3219) (index!40661 lt!446789)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011249 (=> res!679327 e!568894)))

(assert (= (and d!120023 c!102122) b!1011242))

(assert (= (and d!120023 (not c!102122)) b!1011247))

(assert (= (and b!1011247 c!102123) b!1011245))

(assert (= (and b!1011247 (not c!102123)) b!1011248))

(assert (= (and d!120023 c!102124) b!1011250))

(assert (= (and d!120023 (not c!102124)) b!1011246))

(assert (= (and b!1011246 res!679328) b!1011243))

(assert (= (and b!1011243 (not res!679326)) b!1011249))

(assert (= (and b!1011249 (not res!679327)) b!1011244))

(declare-fun m!934789 () Bool)

(assert (=> d!120023 m!934789))

(assert (=> d!120023 m!934521))

(declare-fun m!934791 () Bool)

(assert (=> b!1011249 m!934791))

(assert (=> b!1011248 m!934631))

(assert (=> b!1011248 m!934631))

(assert (=> b!1011248 m!934525))

(declare-fun m!934793 () Bool)

(assert (=> b!1011248 m!934793))

(assert (=> b!1011243 m!934791))

(assert (=> b!1011244 m!934791))

(assert (=> b!1010859 d!120023))

(declare-fun b!1011251 () Bool)

(declare-fun e!568895 () SeekEntryResult!9572)

(assert (=> b!1011251 (= e!568895 (Intermediate!9572 true (toIndex!0 (select (arr!30615 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011252 () Bool)

(declare-fun lt!446791 () SeekEntryResult!9572)

(assert (=> b!1011252 (and (bvsge (index!40661 lt!446791) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446791) (size!31119 a!3219)))))

(declare-fun res!679329 () Bool)

(assert (=> b!1011252 (= res!679329 (= (select (arr!30615 a!3219) (index!40661 lt!446791)) (select (arr!30615 a!3219) j!170)))))

(declare-fun e!568899 () Bool)

(assert (=> b!1011252 (=> res!679329 e!568899)))

(declare-fun e!568897 () Bool)

(assert (=> b!1011252 (= e!568897 e!568899)))

(declare-fun b!1011253 () Bool)

(assert (=> b!1011253 (and (bvsge (index!40661 lt!446791) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446791) (size!31119 a!3219)))))

(assert (=> b!1011253 (= e!568899 (= (select (arr!30615 a!3219) (index!40661 lt!446791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568898 () SeekEntryResult!9572)

(declare-fun b!1011254 () Bool)

(assert (=> b!1011254 (= e!568898 (Intermediate!9572 false (toIndex!0 (select (arr!30615 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011255 () Bool)

(declare-fun e!568896 () Bool)

(assert (=> b!1011255 (= e!568896 e!568897)))

(declare-fun res!679331 () Bool)

(assert (=> b!1011255 (= res!679331 (and ((_ is Intermediate!9572) lt!446791) (not (undefined!10384 lt!446791)) (bvslt (x!88086 lt!446791) #b01111111111111111111111111111110) (bvsge (x!88086 lt!446791) #b00000000000000000000000000000000) (bvsge (x!88086 lt!446791) #b00000000000000000000000000000000)))))

(assert (=> b!1011255 (=> (not res!679331) (not e!568897))))

(declare-fun b!1011256 () Bool)

(assert (=> b!1011256 (= e!568895 e!568898)))

(declare-fun c!102126 () Bool)

(declare-fun lt!446790 () (_ BitVec 64))

(assert (=> b!1011256 (= c!102126 (or (= lt!446790 (select (arr!30615 a!3219) j!170)) (= (bvadd lt!446790 lt!446790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011257 () Bool)

(assert (=> b!1011257 (= e!568898 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30615 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30615 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011259 () Bool)

(assert (=> b!1011259 (= e!568896 (bvsge (x!88086 lt!446791) #b01111111111111111111111111111110))))

(declare-fun d!120025 () Bool)

(assert (=> d!120025 e!568896))

(declare-fun c!102127 () Bool)

(assert (=> d!120025 (= c!102127 (and ((_ is Intermediate!9572) lt!446791) (undefined!10384 lt!446791)))))

(assert (=> d!120025 (= lt!446791 e!568895)))

(declare-fun c!102125 () Bool)

(assert (=> d!120025 (= c!102125 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120025 (= lt!446790 (select (arr!30615 a!3219) (toIndex!0 (select (arr!30615 a!3219) j!170) mask!3464)))))

(assert (=> d!120025 (validMask!0 mask!3464)))

(assert (=> d!120025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30615 a!3219) j!170) mask!3464) (select (arr!30615 a!3219) j!170) a!3219 mask!3464) lt!446791)))

(declare-fun b!1011258 () Bool)

(assert (=> b!1011258 (and (bvsge (index!40661 lt!446791) #b00000000000000000000000000000000) (bvslt (index!40661 lt!446791) (size!31119 a!3219)))))

(declare-fun res!679330 () Bool)

(assert (=> b!1011258 (= res!679330 (= (select (arr!30615 a!3219) (index!40661 lt!446791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011258 (=> res!679330 e!568899)))

(assert (= (and d!120025 c!102125) b!1011251))

(assert (= (and d!120025 (not c!102125)) b!1011256))

(assert (= (and b!1011256 c!102126) b!1011254))

(assert (= (and b!1011256 (not c!102126)) b!1011257))

(assert (= (and d!120025 c!102127) b!1011259))

(assert (= (and d!120025 (not c!102127)) b!1011255))

(assert (= (and b!1011255 res!679331) b!1011252))

(assert (= (and b!1011252 (not res!679329)) b!1011258))

(assert (= (and b!1011258 (not res!679330)) b!1011253))

(assert (=> d!120025 m!934539))

(declare-fun m!934795 () Bool)

(assert (=> d!120025 m!934795))

(assert (=> d!120025 m!934521))

(declare-fun m!934797 () Bool)

(assert (=> b!1011258 m!934797))

(assert (=> b!1011257 m!934539))

(declare-fun m!934799 () Bool)

(assert (=> b!1011257 m!934799))

(assert (=> b!1011257 m!934799))

(assert (=> b!1011257 m!934525))

(declare-fun m!934801 () Bool)

(assert (=> b!1011257 m!934801))

(assert (=> b!1011252 m!934797))

(assert (=> b!1011253 m!934797))

(assert (=> b!1010870 d!120025))

(declare-fun d!120027 () Bool)

(declare-fun lt!446793 () (_ BitVec 32))

(declare-fun lt!446792 () (_ BitVec 32))

(assert (=> d!120027 (= lt!446793 (bvmul (bvxor lt!446792 (bvlshr lt!446792 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120027 (= lt!446792 ((_ extract 31 0) (bvand (bvxor (select (arr!30615 a!3219) j!170) (bvlshr (select (arr!30615 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120027 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679236 (let ((h!22551 ((_ extract 31 0) (bvand (bvxor (select (arr!30615 a!3219) j!170) (bvlshr (select (arr!30615 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88090 (bvmul (bvxor h!22551 (bvlshr h!22551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88090 (bvlshr x!88090 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679236 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679236 #b00000000000000000000000000000000))))))

(assert (=> d!120027 (= (toIndex!0 (select (arr!30615 a!3219) j!170) mask!3464) (bvand (bvxor lt!446793 (bvlshr lt!446793 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010870 d!120027))

(check-sat (not d!120015) (not bm!42400) (not b!1011221) (not b!1010993) (not b!1011021) (not d!119947) (not d!119979) (not b!1011022) (not b!1011062) (not d!120009) (not d!119963) (not b!1011122) (not b!1011008) (not b!1011001) (not bm!42403) (not d!119951) (not b!1011248) (not b!1011059) (not b!1011143) (not b!1011060) (not d!120025) (not d!120023) (not b!1011257))
(check-sat)
