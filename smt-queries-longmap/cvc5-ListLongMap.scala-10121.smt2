; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119274 () Bool)

(assert start!119274)

(declare-fun res!930930 () Bool)

(declare-fun e!787669 () Bool)

(assert (=> start!119274 (=> (not res!930930) (not e!787669))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119274 (= res!930930 (validMask!0 mask!2840))))

(assert (=> start!119274 e!787669))

(assert (=> start!119274 true))

(declare-datatypes ((array!95160 0))(
  ( (array!95161 (arr!45944 (Array (_ BitVec 32) (_ BitVec 64))) (size!46494 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95160)

(declare-fun array_inv!34972 (array!95160) Bool)

(assert (=> start!119274 (array_inv!34972 a!2901)))

(declare-fun b!1390914 () Bool)

(declare-fun res!930928 () Bool)

(assert (=> b!1390914 (=> (not res!930928) (not e!787669))))

(declare-datatypes ((List!32463 0))(
  ( (Nil!32460) (Cons!32459 (h!33680 (_ BitVec 64)) (t!47157 List!32463)) )
))
(declare-fun arrayNoDuplicates!0 (array!95160 (_ BitVec 32) List!32463) Bool)

(assert (=> b!1390914 (= res!930928 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32460))))

(declare-fun e!787670 () Bool)

(declare-fun b!1390915 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10261 0))(
  ( (MissingZero!10261 (index!43415 (_ BitVec 32))) (Found!10261 (index!43416 (_ BitVec 32))) (Intermediate!10261 (undefined!11073 Bool) (index!43417 (_ BitVec 32)) (x!125097 (_ BitVec 32))) (Undefined!10261) (MissingVacant!10261 (index!43418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95160 (_ BitVec 32)) SeekEntryResult!10261)

(assert (=> b!1390915 (= e!787670 (= (seekEntryOrOpen!0 (select (arr!45944 a!2901) j!112) a!2901 mask!2840) (Found!10261 j!112)))))

(declare-fun b!1390916 () Bool)

(declare-fun res!930932 () Bool)

(assert (=> b!1390916 (=> (not res!930932) (not e!787669))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390916 (= res!930932 (validKeyInArray!0 (select (arr!45944 a!2901) i!1037)))))

(declare-fun b!1390917 () Bool)

(declare-fun res!930934 () Bool)

(assert (=> b!1390917 (=> (not res!930934) (not e!787669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95160 (_ BitVec 32)) Bool)

(assert (=> b!1390917 (= res!930934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390918 () Bool)

(declare-fun res!930931 () Bool)

(assert (=> b!1390918 (=> (not res!930931) (not e!787669))))

(assert (=> b!1390918 (= res!930931 (validKeyInArray!0 (select (arr!45944 a!2901) j!112)))))

(declare-fun b!1390919 () Bool)

(declare-fun res!930933 () Bool)

(assert (=> b!1390919 (=> (not res!930933) (not e!787669))))

(assert (=> b!1390919 (= res!930933 (and (= (size!46494 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46494 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46494 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390920 () Bool)

(declare-fun lt!611004 () SeekEntryResult!10261)

(assert (=> b!1390920 (= e!787669 (not (or (not (is-Intermediate!10261 lt!611004)) (undefined!11073 lt!611004) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1390920 e!787670))

(declare-fun res!930929 () Bool)

(assert (=> b!1390920 (=> (not res!930929) (not e!787670))))

(assert (=> b!1390920 (= res!930929 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46526 0))(
  ( (Unit!46527) )
))
(declare-fun lt!611003 () Unit!46526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46526)

(assert (=> b!1390920 (= lt!611003 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95160 (_ BitVec 32)) SeekEntryResult!10261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390920 (= lt!611004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45944 a!2901) j!112) mask!2840) (select (arr!45944 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119274 res!930930) b!1390919))

(assert (= (and b!1390919 res!930933) b!1390916))

(assert (= (and b!1390916 res!930932) b!1390918))

(assert (= (and b!1390918 res!930931) b!1390917))

(assert (= (and b!1390917 res!930934) b!1390914))

(assert (= (and b!1390914 res!930928) b!1390920))

(assert (= (and b!1390920 res!930929) b!1390915))

(declare-fun m!1276719 () Bool)

(assert (=> start!119274 m!1276719))

(declare-fun m!1276721 () Bool)

(assert (=> start!119274 m!1276721))

(declare-fun m!1276723 () Bool)

(assert (=> b!1390915 m!1276723))

(assert (=> b!1390915 m!1276723))

(declare-fun m!1276725 () Bool)

(assert (=> b!1390915 m!1276725))

(declare-fun m!1276727 () Bool)

(assert (=> b!1390916 m!1276727))

(assert (=> b!1390916 m!1276727))

(declare-fun m!1276729 () Bool)

(assert (=> b!1390916 m!1276729))

(declare-fun m!1276731 () Bool)

(assert (=> b!1390917 m!1276731))

(assert (=> b!1390918 m!1276723))

(assert (=> b!1390918 m!1276723))

(declare-fun m!1276733 () Bool)

(assert (=> b!1390918 m!1276733))

(assert (=> b!1390920 m!1276723))

(declare-fun m!1276735 () Bool)

(assert (=> b!1390920 m!1276735))

(assert (=> b!1390920 m!1276723))

(declare-fun m!1276737 () Bool)

(assert (=> b!1390920 m!1276737))

(assert (=> b!1390920 m!1276735))

(assert (=> b!1390920 m!1276723))

(declare-fun m!1276739 () Bool)

(assert (=> b!1390920 m!1276739))

(declare-fun m!1276741 () Bool)

(assert (=> b!1390920 m!1276741))

(declare-fun m!1276743 () Bool)

(assert (=> b!1390914 m!1276743))

(push 1)

