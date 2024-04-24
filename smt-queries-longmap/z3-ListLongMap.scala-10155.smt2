; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119882 () Bool)

(assert start!119882)

(declare-fun b!1395418 () Bool)

(declare-fun res!934150 () Bool)

(declare-fun e!790169 () Bool)

(assert (=> b!1395418 (=> (not res!934150) (not e!790169))))

(declare-datatypes ((array!95486 0))(
  ( (array!95487 (arr!46099 (Array (_ BitVec 32) (_ BitVec 64))) (size!46650 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95486)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395418 (= res!934150 (validKeyInArray!0 (select (arr!46099 a!2901) j!112)))))

(declare-fun b!1395419 () Bool)

(declare-fun e!790171 () Bool)

(declare-fun e!790170 () Bool)

(assert (=> b!1395419 (= e!790171 e!790170)))

(declare-fun res!934149 () Bool)

(assert (=> b!1395419 (=> res!934149 e!790170)))

(declare-fun lt!612747 () array!95486)

(declare-fun lt!612746 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10319 0))(
  ( (MissingZero!10319 (index!43647 (_ BitVec 32))) (Found!10319 (index!43648 (_ BitVec 32))) (Intermediate!10319 (undefined!11131 Bool) (index!43649 (_ BitVec 32)) (x!125470 (_ BitVec 32))) (Undefined!10319) (MissingVacant!10319 (index!43650 (_ BitVec 32))) )
))
(declare-fun lt!612748 () SeekEntryResult!10319)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95486 (_ BitVec 32)) SeekEntryResult!10319)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395419 (= res!934149 (not (= lt!612748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612746 mask!2840) lt!612746 lt!612747 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395419 (= lt!612746 (select (store (arr!46099 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1395419 (= lt!612747 (array!95487 (store (arr!46099 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46650 a!2901)))))

(declare-fun b!1395420 () Bool)

(assert (=> b!1395420 (= e!790169 (not e!790171))))

(declare-fun res!934144 () Bool)

(assert (=> b!1395420 (=> res!934144 e!790171)))

(get-info :version)

(assert (=> b!1395420 (= res!934144 (or (not ((_ is Intermediate!10319) lt!612748)) (undefined!11131 lt!612748)))))

(declare-fun lt!612749 () SeekEntryResult!10319)

(assert (=> b!1395420 (= lt!612749 (Found!10319 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95486 (_ BitVec 32)) SeekEntryResult!10319)

(assert (=> b!1395420 (= lt!612749 (seekEntryOrOpen!0 (select (arr!46099 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95486 (_ BitVec 32)) Bool)

(assert (=> b!1395420 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46669 0))(
  ( (Unit!46670) )
))
(declare-fun lt!612744 () Unit!46669)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46669)

(assert (=> b!1395420 (= lt!612744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!612745 () (_ BitVec 32))

(assert (=> b!1395420 (= lt!612748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612745 (select (arr!46099 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395420 (= lt!612745 (toIndex!0 (select (arr!46099 a!2901) j!112) mask!2840))))

(declare-fun b!1395421 () Bool)

(declare-fun res!934145 () Bool)

(assert (=> b!1395421 (=> res!934145 e!790170)))

(assert (=> b!1395421 (= res!934145 (or (bvslt (x!125470 lt!612748) #b00000000000000000000000000000000) (bvsgt (x!125470 lt!612748) #b01111111111111111111111111111110) (bvslt lt!612745 #b00000000000000000000000000000000) (bvsge lt!612745 (size!46650 a!2901)) (bvslt (index!43649 lt!612748) #b00000000000000000000000000000000) (bvsge (index!43649 lt!612748) (size!46650 a!2901)) (not (= lt!612748 (Intermediate!10319 false (index!43649 lt!612748) (x!125470 lt!612748))))))))

(declare-fun b!1395422 () Bool)

(declare-fun res!934146 () Bool)

(assert (=> b!1395422 (=> (not res!934146) (not e!790169))))

(assert (=> b!1395422 (= res!934146 (validKeyInArray!0 (select (arr!46099 a!2901) i!1037)))))

(declare-fun b!1395423 () Bool)

(declare-fun res!934148 () Bool)

(assert (=> b!1395423 (=> (not res!934148) (not e!790169))))

(declare-datatypes ((List!32605 0))(
  ( (Nil!32602) (Cons!32601 (h!33842 (_ BitVec 64)) (t!47291 List!32605)) )
))
(declare-fun arrayNoDuplicates!0 (array!95486 (_ BitVec 32) List!32605) Bool)

(assert (=> b!1395423 (= res!934148 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32602))))

(declare-fun b!1395424 () Bool)

(assert (=> b!1395424 (= e!790170 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1395424 (= lt!612749 (seekEntryOrOpen!0 lt!612746 lt!612747 mask!2840))))

(declare-fun lt!612743 () Unit!46669)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46669)

(assert (=> b!1395424 (= lt!612743 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612745 (x!125470 lt!612748) (index!43649 lt!612748) mask!2840))))

(declare-fun b!1395425 () Bool)

(declare-fun res!934143 () Bool)

(assert (=> b!1395425 (=> (not res!934143) (not e!790169))))

(assert (=> b!1395425 (= res!934143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!934147 () Bool)

(assert (=> start!119882 (=> (not res!934147) (not e!790169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119882 (= res!934147 (validMask!0 mask!2840))))

(assert (=> start!119882 e!790169))

(assert (=> start!119882 true))

(declare-fun array_inv!35380 (array!95486) Bool)

(assert (=> start!119882 (array_inv!35380 a!2901)))

(declare-fun b!1395426 () Bool)

(declare-fun res!934142 () Bool)

(assert (=> b!1395426 (=> (not res!934142) (not e!790169))))

(assert (=> b!1395426 (= res!934142 (and (= (size!46650 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46650 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46650 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119882 res!934147) b!1395426))

(assert (= (and b!1395426 res!934142) b!1395422))

(assert (= (and b!1395422 res!934146) b!1395418))

(assert (= (and b!1395418 res!934150) b!1395425))

(assert (= (and b!1395425 res!934143) b!1395423))

(assert (= (and b!1395423 res!934148) b!1395420))

(assert (= (and b!1395420 (not res!934144)) b!1395419))

(assert (= (and b!1395419 (not res!934149)) b!1395421))

(assert (= (and b!1395421 (not res!934145)) b!1395424))

(declare-fun m!1281907 () Bool)

(assert (=> start!119882 m!1281907))

(declare-fun m!1281909 () Bool)

(assert (=> start!119882 m!1281909))

(declare-fun m!1281911 () Bool)

(assert (=> b!1395420 m!1281911))

(declare-fun m!1281913 () Bool)

(assert (=> b!1395420 m!1281913))

(assert (=> b!1395420 m!1281911))

(declare-fun m!1281915 () Bool)

(assert (=> b!1395420 m!1281915))

(declare-fun m!1281917 () Bool)

(assert (=> b!1395420 m!1281917))

(assert (=> b!1395420 m!1281911))

(declare-fun m!1281919 () Bool)

(assert (=> b!1395420 m!1281919))

(assert (=> b!1395420 m!1281911))

(declare-fun m!1281921 () Bool)

(assert (=> b!1395420 m!1281921))

(declare-fun m!1281923 () Bool)

(assert (=> b!1395424 m!1281923))

(declare-fun m!1281925 () Bool)

(assert (=> b!1395424 m!1281925))

(declare-fun m!1281927 () Bool)

(assert (=> b!1395425 m!1281927))

(declare-fun m!1281929 () Bool)

(assert (=> b!1395423 m!1281929))

(declare-fun m!1281931 () Bool)

(assert (=> b!1395419 m!1281931))

(assert (=> b!1395419 m!1281931))

(declare-fun m!1281933 () Bool)

(assert (=> b!1395419 m!1281933))

(declare-fun m!1281935 () Bool)

(assert (=> b!1395419 m!1281935))

(declare-fun m!1281937 () Bool)

(assert (=> b!1395419 m!1281937))

(assert (=> b!1395418 m!1281911))

(assert (=> b!1395418 m!1281911))

(declare-fun m!1281939 () Bool)

(assert (=> b!1395418 m!1281939))

(declare-fun m!1281941 () Bool)

(assert (=> b!1395422 m!1281941))

(assert (=> b!1395422 m!1281941))

(declare-fun m!1281943 () Bool)

(assert (=> b!1395422 m!1281943))

(check-sat (not start!119882) (not b!1395419) (not b!1395423) (not b!1395425) (not b!1395418) (not b!1395422) (not b!1395420) (not b!1395424))
(check-sat)
