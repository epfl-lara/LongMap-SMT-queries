; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120434 () Bool)

(assert start!120434)

(declare-fun b!1402152 () Bool)

(declare-fun res!940715 () Bool)

(declare-fun e!793998 () Bool)

(assert (=> b!1402152 (=> (not res!940715) (not e!793998))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95796 0))(
  ( (array!95797 (arr!46249 (Array (_ BitVec 32) (_ BitVec 64))) (size!46801 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95796)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402152 (= res!940715 (and (= (size!46801 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46801 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46801 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402153 () Bool)

(declare-fun res!940714 () Bool)

(declare-fun e!793997 () Bool)

(assert (=> b!1402153 (=> res!940714 e!793997)))

(declare-fun lt!617329 () array!95796)

(declare-datatypes ((SeekEntryResult!10592 0))(
  ( (MissingZero!10592 (index!44745 (_ BitVec 32))) (Found!10592 (index!44746 (_ BitVec 32))) (Intermediate!10592 (undefined!11404 Bool) (index!44747 (_ BitVec 32)) (x!126368 (_ BitVec 32))) (Undefined!10592) (MissingVacant!10592 (index!44748 (_ BitVec 32))) )
))
(declare-fun lt!617331 () SeekEntryResult!10592)

(declare-fun lt!617325 () (_ BitVec 32))

(declare-fun lt!617332 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95796 (_ BitVec 32)) SeekEntryResult!10592)

(assert (=> b!1402153 (= res!940714 (not (= lt!617331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617325 lt!617332 lt!617329 mask!2840))))))

(declare-fun b!1402154 () Bool)

(declare-fun res!940723 () Bool)

(assert (=> b!1402154 (=> (not res!940723) (not e!793998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402154 (= res!940723 (validKeyInArray!0 (select (arr!46249 a!2901) j!112)))))

(declare-fun b!1402155 () Bool)

(declare-fun e!793999 () Bool)

(declare-fun e!794000 () Bool)

(assert (=> b!1402155 (= e!793999 e!794000)))

(declare-fun res!940719 () Bool)

(assert (=> b!1402155 (=> res!940719 e!794000)))

(declare-fun lt!617333 () SeekEntryResult!10592)

(get-info :version)

(assert (=> b!1402155 (= res!940719 (or (= lt!617333 lt!617331) (not ((_ is Intermediate!10592) lt!617331))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402155 (= lt!617331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617332 mask!2840) lt!617332 lt!617329 mask!2840))))

(assert (=> b!1402155 (= lt!617332 (select (store (arr!46249 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402155 (= lt!617329 (array!95797 (store (arr!46249 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46801 a!2901)))))

(declare-fun b!1402156 () Bool)

(assert (=> b!1402156 (= e!794000 e!793997)))

(declare-fun res!940716 () Bool)

(assert (=> b!1402156 (=> res!940716 e!793997)))

(assert (=> b!1402156 (= res!940716 (or (bvslt (x!126368 lt!617333) #b00000000000000000000000000000000) (bvsgt (x!126368 lt!617333) #b01111111111111111111111111111110) (bvslt (x!126368 lt!617331) #b00000000000000000000000000000000) (bvsgt (x!126368 lt!617331) #b01111111111111111111111111111110) (bvslt lt!617325 #b00000000000000000000000000000000) (bvsge lt!617325 (size!46801 a!2901)) (bvslt (index!44747 lt!617333) #b00000000000000000000000000000000) (bvsge (index!44747 lt!617333) (size!46801 a!2901)) (bvslt (index!44747 lt!617331) #b00000000000000000000000000000000) (bvsge (index!44747 lt!617331) (size!46801 a!2901)) (not (= lt!617333 (Intermediate!10592 false (index!44747 lt!617333) (x!126368 lt!617333)))) (not (= lt!617331 (Intermediate!10592 false (index!44747 lt!617331) (x!126368 lt!617331))))))))

(declare-fun lt!617327 () SeekEntryResult!10592)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95796 (_ BitVec 32)) SeekEntryResult!10592)

(assert (=> b!1402156 (= lt!617327 (seekKeyOrZeroReturnVacant!0 (x!126368 lt!617331) (index!44747 lt!617331) (index!44747 lt!617331) (select (arr!46249 a!2901) j!112) lt!617329 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95796 (_ BitVec 32)) SeekEntryResult!10592)

(assert (=> b!1402156 (= lt!617327 (seekEntryOrOpen!0 lt!617332 lt!617329 mask!2840))))

(assert (=> b!1402156 (and (not (undefined!11404 lt!617331)) (= (index!44747 lt!617331) i!1037) (bvslt (x!126368 lt!617331) (x!126368 lt!617333)) (= (select (store (arr!46249 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44747 lt!617331)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47031 0))(
  ( (Unit!47032) )
))
(declare-fun lt!617326 () Unit!47031)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47031)

(assert (=> b!1402156 (= lt!617326 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617325 (x!126368 lt!617333) (index!44747 lt!617333) (x!126368 lt!617331) (index!44747 lt!617331) (undefined!11404 lt!617331) mask!2840))))

(declare-fun b!1402157 () Bool)

(assert (=> b!1402157 (= e!793997 true)))

(declare-fun lt!617330 () SeekEntryResult!10592)

(assert (=> b!1402157 (= lt!617330 lt!617327)))

(declare-fun lt!617324 () Unit!47031)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47031)

(assert (=> b!1402157 (= lt!617324 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617325 (x!126368 lt!617333) (index!44747 lt!617333) (x!126368 lt!617331) (index!44747 lt!617331) mask!2840))))

(declare-fun b!1402158 () Bool)

(assert (=> b!1402158 (= e!793998 (not e!793999))))

(declare-fun res!940721 () Bool)

(assert (=> b!1402158 (=> res!940721 e!793999)))

(assert (=> b!1402158 (= res!940721 (or (not ((_ is Intermediate!10592) lt!617333)) (undefined!11404 lt!617333)))))

(assert (=> b!1402158 (= lt!617330 (Found!10592 j!112))))

(assert (=> b!1402158 (= lt!617330 (seekEntryOrOpen!0 (select (arr!46249 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95796 (_ BitVec 32)) Bool)

(assert (=> b!1402158 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617328 () Unit!47031)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47031)

(assert (=> b!1402158 (= lt!617328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402158 (= lt!617333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617325 (select (arr!46249 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402158 (= lt!617325 (toIndex!0 (select (arr!46249 a!2901) j!112) mask!2840))))

(declare-fun res!940718 () Bool)

(assert (=> start!120434 (=> (not res!940718) (not e!793998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120434 (= res!940718 (validMask!0 mask!2840))))

(assert (=> start!120434 e!793998))

(assert (=> start!120434 true))

(declare-fun array_inv!35482 (array!95796) Bool)

(assert (=> start!120434 (array_inv!35482 a!2901)))

(declare-fun b!1402159 () Bool)

(declare-fun res!940717 () Bool)

(assert (=> b!1402159 (=> (not res!940717) (not e!793998))))

(declare-datatypes ((List!32846 0))(
  ( (Nil!32843) (Cons!32842 (h!34090 (_ BitVec 64)) (t!47532 List!32846)) )
))
(declare-fun arrayNoDuplicates!0 (array!95796 (_ BitVec 32) List!32846) Bool)

(assert (=> b!1402159 (= res!940717 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32843))))

(declare-fun b!1402160 () Bool)

(declare-fun res!940722 () Bool)

(assert (=> b!1402160 (=> (not res!940722) (not e!793998))))

(assert (=> b!1402160 (= res!940722 (validKeyInArray!0 (select (arr!46249 a!2901) i!1037)))))

(declare-fun b!1402161 () Bool)

(declare-fun res!940720 () Bool)

(assert (=> b!1402161 (=> (not res!940720) (not e!793998))))

(assert (=> b!1402161 (= res!940720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120434 res!940718) b!1402152))

(assert (= (and b!1402152 res!940715) b!1402160))

(assert (= (and b!1402160 res!940722) b!1402154))

(assert (= (and b!1402154 res!940723) b!1402161))

(assert (= (and b!1402161 res!940720) b!1402159))

(assert (= (and b!1402159 res!940717) b!1402158))

(assert (= (and b!1402158 (not res!940721)) b!1402155))

(assert (= (and b!1402155 (not res!940719)) b!1402156))

(assert (= (and b!1402156 (not res!940716)) b!1402153))

(assert (= (and b!1402153 (not res!940714)) b!1402157))

(declare-fun m!1289749 () Bool)

(assert (=> b!1402159 m!1289749))

(declare-fun m!1289751 () Bool)

(assert (=> b!1402160 m!1289751))

(assert (=> b!1402160 m!1289751))

(declare-fun m!1289753 () Bool)

(assert (=> b!1402160 m!1289753))

(declare-fun m!1289755 () Bool)

(assert (=> b!1402154 m!1289755))

(assert (=> b!1402154 m!1289755))

(declare-fun m!1289757 () Bool)

(assert (=> b!1402154 m!1289757))

(declare-fun m!1289759 () Bool)

(assert (=> start!120434 m!1289759))

(declare-fun m!1289761 () Bool)

(assert (=> start!120434 m!1289761))

(assert (=> b!1402158 m!1289755))

(declare-fun m!1289763 () Bool)

(assert (=> b!1402158 m!1289763))

(assert (=> b!1402158 m!1289755))

(declare-fun m!1289765 () Bool)

(assert (=> b!1402158 m!1289765))

(assert (=> b!1402158 m!1289755))

(declare-fun m!1289767 () Bool)

(assert (=> b!1402158 m!1289767))

(assert (=> b!1402158 m!1289755))

(declare-fun m!1289769 () Bool)

(assert (=> b!1402158 m!1289769))

(declare-fun m!1289771 () Bool)

(assert (=> b!1402158 m!1289771))

(declare-fun m!1289773 () Bool)

(assert (=> b!1402161 m!1289773))

(declare-fun m!1289775 () Bool)

(assert (=> b!1402156 m!1289775))

(declare-fun m!1289777 () Bool)

(assert (=> b!1402156 m!1289777))

(declare-fun m!1289779 () Bool)

(assert (=> b!1402156 m!1289779))

(declare-fun m!1289781 () Bool)

(assert (=> b!1402156 m!1289781))

(assert (=> b!1402156 m!1289755))

(declare-fun m!1289783 () Bool)

(assert (=> b!1402156 m!1289783))

(assert (=> b!1402156 m!1289755))

(declare-fun m!1289785 () Bool)

(assert (=> b!1402153 m!1289785))

(declare-fun m!1289787 () Bool)

(assert (=> b!1402157 m!1289787))

(declare-fun m!1289789 () Bool)

(assert (=> b!1402155 m!1289789))

(assert (=> b!1402155 m!1289789))

(declare-fun m!1289791 () Bool)

(assert (=> b!1402155 m!1289791))

(assert (=> b!1402155 m!1289781))

(declare-fun m!1289793 () Bool)

(assert (=> b!1402155 m!1289793))

(check-sat (not b!1402154) (not b!1402160) (not b!1402153) (not b!1402159) (not b!1402157) (not b!1402155) (not b!1402158) (not b!1402161) (not start!120434) (not b!1402156))
(check-sat)
