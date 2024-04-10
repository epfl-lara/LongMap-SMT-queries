; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119886 () Bool)

(assert start!119886)

(declare-fun b!1395906 () Bool)

(declare-fun e!790275 () Bool)

(declare-fun e!790273 () Bool)

(assert (=> b!1395906 (= e!790275 e!790273)))

(declare-fun res!934987 () Bool)

(assert (=> b!1395906 (=> res!934987 e!790273)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95466 0))(
  ( (array!95467 (arr!46088 (Array (_ BitVec 32) (_ BitVec 64))) (size!46638 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95466)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!613180 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10405 0))(
  ( (MissingZero!10405 (index!43991 (_ BitVec 32))) (Found!10405 (index!43992 (_ BitVec 32))) (Intermediate!10405 (undefined!11217 Bool) (index!43993 (_ BitVec 32)) (x!125661 (_ BitVec 32))) (Undefined!10405) (MissingVacant!10405 (index!43994 (_ BitVec 32))) )
))
(declare-fun lt!613181 () SeekEntryResult!10405)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95466 (_ BitVec 32)) SeekEntryResult!10405)

(assert (=> b!1395906 (= res!934987 (= lt!613181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613180 (select (store (arr!46088 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95467 (store (arr!46088 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46638 a!2901)) mask!2840)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395906 (= lt!613180 (toIndex!0 (select (store (arr!46088 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1395907 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395907 (= e!790273 (validKeyInArray!0 (select (store (arr!46088 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1395908 () Bool)

(declare-fun res!934990 () Bool)

(declare-fun e!790276 () Bool)

(assert (=> b!1395908 (=> (not res!934990) (not e!790276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95466 (_ BitVec 32)) Bool)

(assert (=> b!1395908 (= res!934990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395909 () Bool)

(declare-fun res!934993 () Bool)

(assert (=> b!1395909 (=> (not res!934993) (not e!790276))))

(assert (=> b!1395909 (= res!934993 (validKeyInArray!0 (select (arr!46088 a!2901) i!1037)))))

(declare-fun b!1395910 () Bool)

(declare-fun res!934992 () Bool)

(assert (=> b!1395910 (=> (not res!934992) (not e!790276))))

(declare-datatypes ((List!32607 0))(
  ( (Nil!32604) (Cons!32603 (h!33842 (_ BitVec 64)) (t!47301 List!32607)) )
))
(declare-fun arrayNoDuplicates!0 (array!95466 (_ BitVec 32) List!32607) Bool)

(assert (=> b!1395910 (= res!934992 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32604))))

(declare-fun res!934988 () Bool)

(assert (=> start!119886 (=> (not res!934988) (not e!790276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119886 (= res!934988 (validMask!0 mask!2840))))

(assert (=> start!119886 e!790276))

(assert (=> start!119886 true))

(declare-fun array_inv!35116 (array!95466) Bool)

(assert (=> start!119886 (array_inv!35116 a!2901)))

(declare-fun b!1395911 () Bool)

(assert (=> b!1395911 (= e!790276 (not e!790275))))

(declare-fun res!934989 () Bool)

(assert (=> b!1395911 (=> res!934989 e!790275)))

(assert (=> b!1395911 (= res!934989 (or (not (is-Intermediate!10405 lt!613181)) (undefined!11217 lt!613181)))))

(declare-fun e!790274 () Bool)

(assert (=> b!1395911 e!790274))

(declare-fun res!934986 () Bool)

(assert (=> b!1395911 (=> (not res!934986) (not e!790274))))

(assert (=> b!1395911 (= res!934986 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46814 0))(
  ( (Unit!46815) )
))
(declare-fun lt!613182 () Unit!46814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46814)

(assert (=> b!1395911 (= lt!613182 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395911 (= lt!613181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46088 a!2901) j!112) mask!2840) (select (arr!46088 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395912 () Bool)

(declare-fun res!934991 () Bool)

(assert (=> b!1395912 (=> res!934991 e!790273)))

(assert (=> b!1395912 (= res!934991 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!613180 #b00000000000000000000000000000000) (bvsge lt!613180 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(declare-fun b!1395913 () Bool)

(declare-fun res!934985 () Bool)

(assert (=> b!1395913 (=> (not res!934985) (not e!790276))))

(assert (=> b!1395913 (= res!934985 (and (= (size!46638 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46638 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46638 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395914 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95466 (_ BitVec 32)) SeekEntryResult!10405)

(assert (=> b!1395914 (= e!790274 (= (seekEntryOrOpen!0 (select (arr!46088 a!2901) j!112) a!2901 mask!2840) (Found!10405 j!112)))))

(declare-fun b!1395915 () Bool)

(declare-fun res!934984 () Bool)

(assert (=> b!1395915 (=> (not res!934984) (not e!790276))))

(assert (=> b!1395915 (= res!934984 (validKeyInArray!0 (select (arr!46088 a!2901) j!112)))))

(assert (= (and start!119886 res!934988) b!1395913))

(assert (= (and b!1395913 res!934985) b!1395909))

(assert (= (and b!1395909 res!934993) b!1395915))

(assert (= (and b!1395915 res!934984) b!1395908))

(assert (= (and b!1395908 res!934990) b!1395910))

(assert (= (and b!1395910 res!934992) b!1395911))

(assert (= (and b!1395911 res!934986) b!1395914))

(assert (= (and b!1395911 (not res!934989)) b!1395906))

(assert (= (and b!1395906 (not res!934987)) b!1395912))

(assert (= (and b!1395912 (not res!934991)) b!1395907))

(declare-fun m!1282353 () Bool)

(assert (=> b!1395908 m!1282353))

(declare-fun m!1282355 () Bool)

(assert (=> b!1395906 m!1282355))

(declare-fun m!1282357 () Bool)

(assert (=> b!1395906 m!1282357))

(assert (=> b!1395906 m!1282357))

(declare-fun m!1282359 () Bool)

(assert (=> b!1395906 m!1282359))

(assert (=> b!1395906 m!1282357))

(declare-fun m!1282361 () Bool)

(assert (=> b!1395906 m!1282361))

(declare-fun m!1282363 () Bool)

(assert (=> b!1395914 m!1282363))

(assert (=> b!1395914 m!1282363))

(declare-fun m!1282365 () Bool)

(assert (=> b!1395914 m!1282365))

(declare-fun m!1282367 () Bool)

(assert (=> b!1395909 m!1282367))

(assert (=> b!1395909 m!1282367))

(declare-fun m!1282369 () Bool)

(assert (=> b!1395909 m!1282369))

(declare-fun m!1282371 () Bool)

(assert (=> start!119886 m!1282371))

(declare-fun m!1282373 () Bool)

(assert (=> start!119886 m!1282373))

(assert (=> b!1395911 m!1282363))

(declare-fun m!1282375 () Bool)

(assert (=> b!1395911 m!1282375))

(assert (=> b!1395911 m!1282363))

(declare-fun m!1282377 () Bool)

(assert (=> b!1395911 m!1282377))

(assert (=> b!1395911 m!1282375))

(assert (=> b!1395911 m!1282363))

(declare-fun m!1282379 () Bool)

(assert (=> b!1395911 m!1282379))

(declare-fun m!1282381 () Bool)

(assert (=> b!1395911 m!1282381))

(assert (=> b!1395907 m!1282355))

(assert (=> b!1395907 m!1282357))

(assert (=> b!1395907 m!1282357))

(declare-fun m!1282383 () Bool)

(assert (=> b!1395907 m!1282383))

(assert (=> b!1395915 m!1282363))

(assert (=> b!1395915 m!1282363))

(declare-fun m!1282385 () Bool)

(assert (=> b!1395915 m!1282385))

(declare-fun m!1282387 () Bool)

(assert (=> b!1395910 m!1282387))

(push 1)

