; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120084 () Bool)

(assert start!120084)

(declare-fun b!1398094 () Bool)

(declare-fun e!791497 () Bool)

(declare-fun e!791495 () Bool)

(assert (=> b!1398094 (= e!791497 (not e!791495))))

(declare-fun res!937008 () Bool)

(assert (=> b!1398094 (=> res!937008 e!791495)))

(declare-datatypes ((SeekEntryResult!10477 0))(
  ( (MissingZero!10477 (index!44279 (_ BitVec 32))) (Found!10477 (index!44280 (_ BitVec 32))) (Intermediate!10477 (undefined!11289 Bool) (index!44281 (_ BitVec 32)) (x!125931 (_ BitVec 32))) (Undefined!10477) (MissingVacant!10477 (index!44282 (_ BitVec 32))) )
))
(declare-fun lt!614702 () SeekEntryResult!10477)

(assert (=> b!1398094 (= res!937008 (or (not (is-Intermediate!10477 lt!614702)) (undefined!11289 lt!614702)))))

(declare-fun e!791494 () Bool)

(assert (=> b!1398094 e!791494))

(declare-fun res!937015 () Bool)

(assert (=> b!1398094 (=> (not res!937015) (not e!791494))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95613 0))(
  ( (array!95614 (arr!46160 (Array (_ BitVec 32) (_ BitVec 64))) (size!46710 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95613)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95613 (_ BitVec 32)) Bool)

(assert (=> b!1398094 (= res!937015 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46958 0))(
  ( (Unit!46959) )
))
(declare-fun lt!614701 () Unit!46958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46958)

(assert (=> b!1398094 (= lt!614701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614706 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95613 (_ BitVec 32)) SeekEntryResult!10477)

(assert (=> b!1398094 (= lt!614702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614706 (select (arr!46160 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398094 (= lt!614706 (toIndex!0 (select (arr!46160 a!2901) j!112) mask!2840))))

(declare-fun res!937011 () Bool)

(assert (=> start!120084 (=> (not res!937011) (not e!791497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120084 (= res!937011 (validMask!0 mask!2840))))

(assert (=> start!120084 e!791497))

(assert (=> start!120084 true))

(declare-fun array_inv!35188 (array!95613) Bool)

(assert (=> start!120084 (array_inv!35188 a!2901)))

(declare-fun b!1398095 () Bool)

(declare-fun e!791498 () Bool)

(assert (=> b!1398095 (= e!791498 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614703 () SeekEntryResult!10477)

(assert (=> b!1398095 (and (not (undefined!11289 lt!614703)) (= (index!44281 lt!614703) i!1037) (bvslt (x!125931 lt!614703) (x!125931 lt!614702)) (= (select (store (arr!46160 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44281 lt!614703)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614704 () Unit!46958)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46958)

(assert (=> b!1398095 (= lt!614704 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614706 (x!125931 lt!614702) (index!44281 lt!614702) (x!125931 lt!614703) (index!44281 lt!614703) (undefined!11289 lt!614703) mask!2840))))

(declare-fun b!1398096 () Bool)

(declare-fun res!937007 () Bool)

(assert (=> b!1398096 (=> (not res!937007) (not e!791497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398096 (= res!937007 (validKeyInArray!0 (select (arr!46160 a!2901) j!112)))))

(declare-fun b!1398097 () Bool)

(declare-fun res!937009 () Bool)

(assert (=> b!1398097 (=> (not res!937009) (not e!791497))))

(assert (=> b!1398097 (= res!937009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398098 () Bool)

(assert (=> b!1398098 (= e!791495 e!791498)))

(declare-fun res!937010 () Bool)

(assert (=> b!1398098 (=> res!937010 e!791498)))

(assert (=> b!1398098 (= res!937010 (or (= lt!614702 lt!614703) (not (is-Intermediate!10477 lt!614703))))))

(declare-fun lt!614705 () (_ BitVec 64))

(assert (=> b!1398098 (= lt!614703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614705 mask!2840) lt!614705 (array!95614 (store (arr!46160 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46710 a!2901)) mask!2840))))

(assert (=> b!1398098 (= lt!614705 (select (store (arr!46160 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398099 () Bool)

(declare-fun res!937012 () Bool)

(assert (=> b!1398099 (=> (not res!937012) (not e!791497))))

(assert (=> b!1398099 (= res!937012 (and (= (size!46710 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46710 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46710 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398100 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95613 (_ BitVec 32)) SeekEntryResult!10477)

(assert (=> b!1398100 (= e!791494 (= (seekEntryOrOpen!0 (select (arr!46160 a!2901) j!112) a!2901 mask!2840) (Found!10477 j!112)))))

(declare-fun b!1398101 () Bool)

(declare-fun res!937013 () Bool)

(assert (=> b!1398101 (=> (not res!937013) (not e!791497))))

(declare-datatypes ((List!32679 0))(
  ( (Nil!32676) (Cons!32675 (h!33917 (_ BitVec 64)) (t!47373 List!32679)) )
))
(declare-fun arrayNoDuplicates!0 (array!95613 (_ BitVec 32) List!32679) Bool)

(assert (=> b!1398101 (= res!937013 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32676))))

(declare-fun b!1398102 () Bool)

(declare-fun res!937014 () Bool)

(assert (=> b!1398102 (=> (not res!937014) (not e!791497))))

(assert (=> b!1398102 (= res!937014 (validKeyInArray!0 (select (arr!46160 a!2901) i!1037)))))

(assert (= (and start!120084 res!937011) b!1398099))

(assert (= (and b!1398099 res!937012) b!1398102))

(assert (= (and b!1398102 res!937014) b!1398096))

(assert (= (and b!1398096 res!937007) b!1398097))

(assert (= (and b!1398097 res!937009) b!1398101))

(assert (= (and b!1398101 res!937013) b!1398094))

(assert (= (and b!1398094 res!937015) b!1398100))

(assert (= (and b!1398094 (not res!937008)) b!1398098))

(assert (= (and b!1398098 (not res!937010)) b!1398095))

(declare-fun m!1285089 () Bool)

(assert (=> b!1398096 m!1285089))

(assert (=> b!1398096 m!1285089))

(declare-fun m!1285091 () Bool)

(assert (=> b!1398096 m!1285091))

(assert (=> b!1398100 m!1285089))

(assert (=> b!1398100 m!1285089))

(declare-fun m!1285093 () Bool)

(assert (=> b!1398100 m!1285093))

(declare-fun m!1285095 () Bool)

(assert (=> start!120084 m!1285095))

(declare-fun m!1285097 () Bool)

(assert (=> start!120084 m!1285097))

(declare-fun m!1285099 () Bool)

(assert (=> b!1398102 m!1285099))

(assert (=> b!1398102 m!1285099))

(declare-fun m!1285101 () Bool)

(assert (=> b!1398102 m!1285101))

(declare-fun m!1285103 () Bool)

(assert (=> b!1398098 m!1285103))

(declare-fun m!1285105 () Bool)

(assert (=> b!1398098 m!1285105))

(assert (=> b!1398098 m!1285103))

(declare-fun m!1285107 () Bool)

(assert (=> b!1398098 m!1285107))

(declare-fun m!1285109 () Bool)

(assert (=> b!1398098 m!1285109))

(declare-fun m!1285111 () Bool)

(assert (=> b!1398097 m!1285111))

(declare-fun m!1285113 () Bool)

(assert (=> b!1398101 m!1285113))

(assert (=> b!1398095 m!1285105))

(declare-fun m!1285115 () Bool)

(assert (=> b!1398095 m!1285115))

(declare-fun m!1285117 () Bool)

(assert (=> b!1398095 m!1285117))

(assert (=> b!1398094 m!1285089))

(declare-fun m!1285119 () Bool)

(assert (=> b!1398094 m!1285119))

(declare-fun m!1285121 () Bool)

(assert (=> b!1398094 m!1285121))

(assert (=> b!1398094 m!1285089))

(declare-fun m!1285123 () Bool)

(assert (=> b!1398094 m!1285123))

(assert (=> b!1398094 m!1285089))

(declare-fun m!1285125 () Bool)

(assert (=> b!1398094 m!1285125))

(push 1)

