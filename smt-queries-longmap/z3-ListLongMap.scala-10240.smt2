; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120488 () Bool)

(assert start!120488)

(declare-fun res!941511 () Bool)

(declare-fun e!794402 () Bool)

(assert (=> start!120488 (=> (not res!941511) (not e!794402))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120488 (= res!941511 (validMask!0 mask!2840))))

(assert (=> start!120488 e!794402))

(assert (=> start!120488 true))

(declare-datatypes ((array!95850 0))(
  ( (array!95851 (arr!46276 (Array (_ BitVec 32) (_ BitVec 64))) (size!46828 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95850)

(declare-fun array_inv!35509 (array!95850) Bool)

(assert (=> start!120488 (array_inv!35509 a!2901)))

(declare-fun b!1402949 () Bool)

(declare-fun res!941516 () Bool)

(assert (=> b!1402949 (=> (not res!941516) (not e!794402))))

(declare-datatypes ((List!32873 0))(
  ( (Nil!32870) (Cons!32869 (h!34117 (_ BitVec 64)) (t!47559 List!32873)) )
))
(declare-fun arrayNoDuplicates!0 (array!95850 (_ BitVec 32) List!32873) Bool)

(assert (=> b!1402949 (= res!941516 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32870))))

(declare-fun b!1402950 () Bool)

(declare-fun res!941518 () Bool)

(assert (=> b!1402950 (=> (not res!941518) (not e!794402))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402950 (= res!941518 (validKeyInArray!0 (select (arr!46276 a!2901) i!1037)))))

(declare-fun b!1402951 () Bool)

(declare-fun res!941515 () Bool)

(assert (=> b!1402951 (=> (not res!941515) (not e!794402))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402951 (= res!941515 (and (= (size!46828 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46828 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46828 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402952 () Bool)

(declare-fun res!941514 () Bool)

(assert (=> b!1402952 (=> (not res!941514) (not e!794402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95850 (_ BitVec 32)) Bool)

(assert (=> b!1402952 (= res!941514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!794401 () Bool)

(declare-fun b!1402953 () Bool)

(declare-datatypes ((SeekEntryResult!10619 0))(
  ( (MissingZero!10619 (index!44853 (_ BitVec 32))) (Found!10619 (index!44854 (_ BitVec 32))) (Intermediate!10619 (undefined!11431 Bool) (index!44855 (_ BitVec 32)) (x!126467 (_ BitVec 32))) (Undefined!10619) (MissingVacant!10619 (index!44856 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95850 (_ BitVec 32)) SeekEntryResult!10619)

(assert (=> b!1402953 (= e!794401 (= (seekEntryOrOpen!0 (select (arr!46276 a!2901) j!112) a!2901 mask!2840) (Found!10619 j!112)))))

(declare-fun b!1402954 () Bool)

(declare-fun e!794399 () Bool)

(assert (=> b!1402954 (= e!794399 true)))

(declare-fun lt!618058 () SeekEntryResult!10619)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95850 (_ BitVec 32)) SeekEntryResult!10619)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402954 (= lt!618058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95851 (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46828 a!2901)) mask!2840))))

(declare-fun b!1402955 () Bool)

(assert (=> b!1402955 (= e!794402 (not e!794399))))

(declare-fun res!941512 () Bool)

(assert (=> b!1402955 (=> res!941512 e!794399)))

(declare-fun lt!618059 () SeekEntryResult!10619)

(get-info :version)

(assert (=> b!1402955 (= res!941512 (or (not ((_ is Intermediate!10619) lt!618059)) (undefined!11431 lt!618059)))))

(assert (=> b!1402955 e!794401))

(declare-fun res!941513 () Bool)

(assert (=> b!1402955 (=> (not res!941513) (not e!794401))))

(assert (=> b!1402955 (= res!941513 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47085 0))(
  ( (Unit!47086) )
))
(declare-fun lt!618057 () Unit!47085)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47085)

(assert (=> b!1402955 (= lt!618057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402955 (= lt!618059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46276 a!2901) j!112) mask!2840) (select (arr!46276 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1402956 () Bool)

(declare-fun res!941517 () Bool)

(assert (=> b!1402956 (=> (not res!941517) (not e!794402))))

(assert (=> b!1402956 (= res!941517 (validKeyInArray!0 (select (arr!46276 a!2901) j!112)))))

(assert (= (and start!120488 res!941511) b!1402951))

(assert (= (and b!1402951 res!941515) b!1402950))

(assert (= (and b!1402950 res!941518) b!1402956))

(assert (= (and b!1402956 res!941517) b!1402952))

(assert (= (and b!1402952 res!941514) b!1402949))

(assert (= (and b!1402949 res!941516) b!1402955))

(assert (= (and b!1402955 res!941513) b!1402953))

(assert (= (and b!1402955 (not res!941512)) b!1402954))

(declare-fun m!1290961 () Bool)

(assert (=> b!1402954 m!1290961))

(declare-fun m!1290963 () Bool)

(assert (=> b!1402954 m!1290963))

(assert (=> b!1402954 m!1290963))

(declare-fun m!1290965 () Bool)

(assert (=> b!1402954 m!1290965))

(assert (=> b!1402954 m!1290965))

(assert (=> b!1402954 m!1290963))

(declare-fun m!1290967 () Bool)

(assert (=> b!1402954 m!1290967))

(declare-fun m!1290969 () Bool)

(assert (=> b!1402949 m!1290969))

(declare-fun m!1290971 () Bool)

(assert (=> b!1402956 m!1290971))

(assert (=> b!1402956 m!1290971))

(declare-fun m!1290973 () Bool)

(assert (=> b!1402956 m!1290973))

(declare-fun m!1290975 () Bool)

(assert (=> b!1402952 m!1290975))

(declare-fun m!1290977 () Bool)

(assert (=> b!1402950 m!1290977))

(assert (=> b!1402950 m!1290977))

(declare-fun m!1290979 () Bool)

(assert (=> b!1402950 m!1290979))

(assert (=> b!1402955 m!1290971))

(declare-fun m!1290981 () Bool)

(assert (=> b!1402955 m!1290981))

(assert (=> b!1402955 m!1290971))

(declare-fun m!1290983 () Bool)

(assert (=> b!1402955 m!1290983))

(assert (=> b!1402955 m!1290981))

(assert (=> b!1402955 m!1290971))

(declare-fun m!1290985 () Bool)

(assert (=> b!1402955 m!1290985))

(declare-fun m!1290987 () Bool)

(assert (=> b!1402955 m!1290987))

(declare-fun m!1290989 () Bool)

(assert (=> start!120488 m!1290989))

(declare-fun m!1290991 () Bool)

(assert (=> start!120488 m!1290991))

(assert (=> b!1402953 m!1290971))

(assert (=> b!1402953 m!1290971))

(declare-fun m!1290993 () Bool)

(assert (=> b!1402953 m!1290993))

(check-sat (not b!1402950) (not b!1402949) (not b!1402952) (not b!1402953) (not start!120488) (not b!1402956) (not b!1402955) (not b!1402954))
(check-sat)
