; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119276 () Bool)

(assert start!119276)

(declare-fun b!1390935 () Bool)

(declare-fun res!930949 () Bool)

(declare-fun e!787677 () Bool)

(assert (=> b!1390935 (=> (not res!930949) (not e!787677))))

(declare-datatypes ((array!95162 0))(
  ( (array!95163 (arr!45945 (Array (_ BitVec 32) (_ BitVec 64))) (size!46495 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95162)

(declare-datatypes ((List!32464 0))(
  ( (Nil!32461) (Cons!32460 (h!33681 (_ BitVec 64)) (t!47158 List!32464)) )
))
(declare-fun arrayNoDuplicates!0 (array!95162 (_ BitVec 32) List!32464) Bool)

(assert (=> b!1390935 (= res!930949 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32461))))

(declare-fun b!1390936 () Bool)

(declare-datatypes ((SeekEntryResult!10262 0))(
  ( (MissingZero!10262 (index!43419 (_ BitVec 32))) (Found!10262 (index!43420 (_ BitVec 32))) (Intermediate!10262 (undefined!11074 Bool) (index!43421 (_ BitVec 32)) (x!125098 (_ BitVec 32))) (Undefined!10262) (MissingVacant!10262 (index!43422 (_ BitVec 32))) )
))
(declare-fun lt!611009 () SeekEntryResult!10262)

(declare-fun mask!2840 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1390936 (= e!787677 (not (or (not ((_ is Intermediate!10262) lt!611009)) (undefined!11074 lt!611009) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(declare-fun e!787679 () Bool)

(assert (=> b!1390936 e!787679))

(declare-fun res!930955 () Bool)

(assert (=> b!1390936 (=> (not res!930955) (not e!787679))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95162 (_ BitVec 32)) Bool)

(assert (=> b!1390936 (= res!930955 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46528 0))(
  ( (Unit!46529) )
))
(declare-fun lt!611010 () Unit!46528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46528)

(assert (=> b!1390936 (= lt!611010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95162 (_ BitVec 32)) SeekEntryResult!10262)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390936 (= lt!611009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45945 a!2901) j!112) mask!2840) (select (arr!45945 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390937 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95162 (_ BitVec 32)) SeekEntryResult!10262)

(assert (=> b!1390937 (= e!787679 (= (seekEntryOrOpen!0 (select (arr!45945 a!2901) j!112) a!2901 mask!2840) (Found!10262 j!112)))))

(declare-fun b!1390938 () Bool)

(declare-fun res!930950 () Bool)

(assert (=> b!1390938 (=> (not res!930950) (not e!787677))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390938 (= res!930950 (and (= (size!46495 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46495 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46495 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930951 () Bool)

(assert (=> start!119276 (=> (not res!930951) (not e!787677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119276 (= res!930951 (validMask!0 mask!2840))))

(assert (=> start!119276 e!787677))

(assert (=> start!119276 true))

(declare-fun array_inv!34973 (array!95162) Bool)

(assert (=> start!119276 (array_inv!34973 a!2901)))

(declare-fun b!1390939 () Bool)

(declare-fun res!930953 () Bool)

(assert (=> b!1390939 (=> (not res!930953) (not e!787677))))

(assert (=> b!1390939 (= res!930953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390940 () Bool)

(declare-fun res!930952 () Bool)

(assert (=> b!1390940 (=> (not res!930952) (not e!787677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390940 (= res!930952 (validKeyInArray!0 (select (arr!45945 a!2901) j!112)))))

(declare-fun b!1390941 () Bool)

(declare-fun res!930954 () Bool)

(assert (=> b!1390941 (=> (not res!930954) (not e!787677))))

(assert (=> b!1390941 (= res!930954 (validKeyInArray!0 (select (arr!45945 a!2901) i!1037)))))

(assert (= (and start!119276 res!930951) b!1390938))

(assert (= (and b!1390938 res!930950) b!1390941))

(assert (= (and b!1390941 res!930954) b!1390940))

(assert (= (and b!1390940 res!930952) b!1390939))

(assert (= (and b!1390939 res!930953) b!1390935))

(assert (= (and b!1390935 res!930949) b!1390936))

(assert (= (and b!1390936 res!930955) b!1390937))

(declare-fun m!1276745 () Bool)

(assert (=> start!119276 m!1276745))

(declare-fun m!1276747 () Bool)

(assert (=> start!119276 m!1276747))

(declare-fun m!1276749 () Bool)

(assert (=> b!1390935 m!1276749))

(declare-fun m!1276751 () Bool)

(assert (=> b!1390939 m!1276751))

(declare-fun m!1276753 () Bool)

(assert (=> b!1390936 m!1276753))

(declare-fun m!1276755 () Bool)

(assert (=> b!1390936 m!1276755))

(assert (=> b!1390936 m!1276753))

(declare-fun m!1276757 () Bool)

(assert (=> b!1390936 m!1276757))

(assert (=> b!1390936 m!1276755))

(assert (=> b!1390936 m!1276753))

(declare-fun m!1276759 () Bool)

(assert (=> b!1390936 m!1276759))

(declare-fun m!1276761 () Bool)

(assert (=> b!1390936 m!1276761))

(assert (=> b!1390937 m!1276753))

(assert (=> b!1390937 m!1276753))

(declare-fun m!1276763 () Bool)

(assert (=> b!1390937 m!1276763))

(declare-fun m!1276765 () Bool)

(assert (=> b!1390941 m!1276765))

(assert (=> b!1390941 m!1276765))

(declare-fun m!1276767 () Bool)

(assert (=> b!1390941 m!1276767))

(assert (=> b!1390940 m!1276753))

(assert (=> b!1390940 m!1276753))

(declare-fun m!1276769 () Bool)

(assert (=> b!1390940 m!1276769))

(check-sat (not b!1390941) (not b!1390939) (not b!1390940) (not b!1390936) (not b!1390935) (not b!1390937) (not start!119276))
(check-sat)
