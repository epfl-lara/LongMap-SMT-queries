; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120302 () Bool)

(assert start!120302)

(declare-fun b!1399648 () Bool)

(declare-fun e!792468 () Bool)

(declare-fun e!792470 () Bool)

(assert (=> b!1399648 (= e!792468 (not e!792470))))

(declare-fun res!937881 () Bool)

(assert (=> b!1399648 (=> res!937881 e!792470)))

(declare-datatypes ((SeekEntryResult!10448 0))(
  ( (MissingZero!10448 (index!44163 (_ BitVec 32))) (Found!10448 (index!44164 (_ BitVec 32))) (Intermediate!10448 (undefined!11260 Bool) (index!44165 (_ BitVec 32)) (x!125961 (_ BitVec 32))) (Undefined!10448) (MissingVacant!10448 (index!44166 (_ BitVec 32))) )
))
(declare-fun lt!615371 () SeekEntryResult!10448)

(get-info :version)

(assert (=> b!1399648 (= res!937881 (or (not ((_ is Intermediate!10448) lt!615371)) (undefined!11260 lt!615371)))))

(declare-fun e!792466 () Bool)

(assert (=> b!1399648 e!792466))

(declare-fun res!937878 () Bool)

(assert (=> b!1399648 (=> (not res!937878) (not e!792466))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95753 0))(
  ( (array!95754 (arr!46228 (Array (_ BitVec 32) (_ BitVec 64))) (size!46779 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95753)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95753 (_ BitVec 32)) Bool)

(assert (=> b!1399648 (= res!937878 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46927 0))(
  ( (Unit!46928) )
))
(declare-fun lt!615373 () Unit!46927)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46927)

(assert (=> b!1399648 (= lt!615373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615372 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95753 (_ BitVec 32)) SeekEntryResult!10448)

(assert (=> b!1399648 (= lt!615371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615372 (select (arr!46228 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399648 (= lt!615372 (toIndex!0 (select (arr!46228 a!2901) j!112) mask!2840))))

(declare-fun b!1399649 () Bool)

(declare-fun res!937882 () Bool)

(assert (=> b!1399649 (=> (not res!937882) (not e!792468))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399649 (= res!937882 (validKeyInArray!0 (select (arr!46228 a!2901) i!1037)))))

(declare-fun b!1399650 () Bool)

(declare-fun res!937879 () Bool)

(assert (=> b!1399650 (=> (not res!937879) (not e!792468))))

(assert (=> b!1399650 (= res!937879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!937885 () Bool)

(assert (=> start!120302 (=> (not res!937885) (not e!792468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120302 (= res!937885 (validMask!0 mask!2840))))

(assert (=> start!120302 e!792468))

(assert (=> start!120302 true))

(declare-fun array_inv!35509 (array!95753) Bool)

(assert (=> start!120302 (array_inv!35509 a!2901)))

(declare-fun b!1399651 () Bool)

(declare-fun e!792467 () Bool)

(assert (=> b!1399651 (= e!792467 true)))

(declare-fun lt!615374 () SeekEntryResult!10448)

(assert (=> b!1399651 (and (not (undefined!11260 lt!615374)) (= (index!44165 lt!615374) i!1037) (bvslt (x!125961 lt!615374) (x!125961 lt!615371)) (= (select (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44165 lt!615374)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615369 () Unit!46927)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46927)

(assert (=> b!1399651 (= lt!615369 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615372 (x!125961 lt!615371) (index!44165 lt!615371) (x!125961 lt!615374) (index!44165 lt!615374) (undefined!11260 lt!615374) mask!2840))))

(declare-fun b!1399652 () Bool)

(declare-fun res!937884 () Bool)

(assert (=> b!1399652 (=> (not res!937884) (not e!792468))))

(assert (=> b!1399652 (= res!937884 (and (= (size!46779 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46779 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46779 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399653 () Bool)

(declare-fun res!937883 () Bool)

(assert (=> b!1399653 (=> (not res!937883) (not e!792468))))

(declare-datatypes ((List!32734 0))(
  ( (Nil!32731) (Cons!32730 (h!33980 (_ BitVec 64)) (t!47420 List!32734)) )
))
(declare-fun arrayNoDuplicates!0 (array!95753 (_ BitVec 32) List!32734) Bool)

(assert (=> b!1399653 (= res!937883 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32731))))

(declare-fun b!1399654 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95753 (_ BitVec 32)) SeekEntryResult!10448)

(assert (=> b!1399654 (= e!792466 (= (seekEntryOrOpen!0 (select (arr!46228 a!2901) j!112) a!2901 mask!2840) (Found!10448 j!112)))))

(declare-fun b!1399655 () Bool)

(assert (=> b!1399655 (= e!792470 e!792467)))

(declare-fun res!937880 () Bool)

(assert (=> b!1399655 (=> res!937880 e!792467)))

(assert (=> b!1399655 (= res!937880 (or (= lt!615371 lt!615374) (not ((_ is Intermediate!10448) lt!615374))))))

(declare-fun lt!615370 () (_ BitVec 64))

(assert (=> b!1399655 (= lt!615374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615370 mask!2840) lt!615370 (array!95754 (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46779 a!2901)) mask!2840))))

(assert (=> b!1399655 (= lt!615370 (select (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399656 () Bool)

(declare-fun res!937877 () Bool)

(assert (=> b!1399656 (=> (not res!937877) (not e!792468))))

(assert (=> b!1399656 (= res!937877 (validKeyInArray!0 (select (arr!46228 a!2901) j!112)))))

(assert (= (and start!120302 res!937885) b!1399652))

(assert (= (and b!1399652 res!937884) b!1399649))

(assert (= (and b!1399649 res!937882) b!1399656))

(assert (= (and b!1399656 res!937877) b!1399650))

(assert (= (and b!1399650 res!937879) b!1399653))

(assert (= (and b!1399653 res!937883) b!1399648))

(assert (= (and b!1399648 res!937878) b!1399654))

(assert (= (and b!1399648 (not res!937881)) b!1399655))

(assert (= (and b!1399655 (not res!937880)) b!1399651))

(declare-fun m!1287037 () Bool)

(assert (=> b!1399655 m!1287037))

(declare-fun m!1287039 () Bool)

(assert (=> b!1399655 m!1287039))

(assert (=> b!1399655 m!1287037))

(declare-fun m!1287041 () Bool)

(assert (=> b!1399655 m!1287041))

(declare-fun m!1287043 () Bool)

(assert (=> b!1399655 m!1287043))

(declare-fun m!1287045 () Bool)

(assert (=> b!1399656 m!1287045))

(assert (=> b!1399656 m!1287045))

(declare-fun m!1287047 () Bool)

(assert (=> b!1399656 m!1287047))

(assert (=> b!1399651 m!1287039))

(declare-fun m!1287049 () Bool)

(assert (=> b!1399651 m!1287049))

(declare-fun m!1287051 () Bool)

(assert (=> b!1399651 m!1287051))

(declare-fun m!1287053 () Bool)

(assert (=> b!1399650 m!1287053))

(assert (=> b!1399654 m!1287045))

(assert (=> b!1399654 m!1287045))

(declare-fun m!1287055 () Bool)

(assert (=> b!1399654 m!1287055))

(assert (=> b!1399648 m!1287045))

(declare-fun m!1287057 () Bool)

(assert (=> b!1399648 m!1287057))

(assert (=> b!1399648 m!1287045))

(declare-fun m!1287059 () Bool)

(assert (=> b!1399648 m!1287059))

(declare-fun m!1287061 () Bool)

(assert (=> b!1399648 m!1287061))

(assert (=> b!1399648 m!1287045))

(declare-fun m!1287063 () Bool)

(assert (=> b!1399648 m!1287063))

(declare-fun m!1287065 () Bool)

(assert (=> start!120302 m!1287065))

(declare-fun m!1287067 () Bool)

(assert (=> start!120302 m!1287067))

(declare-fun m!1287069 () Bool)

(assert (=> b!1399649 m!1287069))

(assert (=> b!1399649 m!1287069))

(declare-fun m!1287071 () Bool)

(assert (=> b!1399649 m!1287071))

(declare-fun m!1287073 () Bool)

(assert (=> b!1399653 m!1287073))

(check-sat (not b!1399648) (not b!1399654) (not b!1399655) (not b!1399651) (not b!1399653) (not b!1399650) (not b!1399656) (not start!120302) (not b!1399649))
(check-sat)
