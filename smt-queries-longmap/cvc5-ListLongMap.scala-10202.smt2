; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120198 () Bool)

(assert start!120198)

(declare-fun b!1399087 () Bool)

(declare-fun e!792071 () Bool)

(declare-fun e!792070 () Bool)

(assert (=> b!1399087 (= e!792071 (not e!792070))))

(declare-fun res!937836 () Bool)

(assert (=> b!1399087 (=> res!937836 e!792070)))

(declare-datatypes ((SeekEntryResult!10504 0))(
  ( (MissingZero!10504 (index!44390 (_ BitVec 32))) (Found!10504 (index!44391 (_ BitVec 32))) (Intermediate!10504 (undefined!11316 Bool) (index!44392 (_ BitVec 32)) (x!126039 (_ BitVec 32))) (Undefined!10504) (MissingVacant!10504 (index!44393 (_ BitVec 32))) )
))
(declare-fun lt!615318 () SeekEntryResult!10504)

(assert (=> b!1399087 (= res!937836 (or (not (is-Intermediate!10504 lt!615318)) (undefined!11316 lt!615318)))))

(declare-fun e!792069 () Bool)

(assert (=> b!1399087 e!792069))

(declare-fun res!937838 () Bool)

(assert (=> b!1399087 (=> (not res!937838) (not e!792069))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95670 0))(
  ( (array!95671 (arr!46187 (Array (_ BitVec 32) (_ BitVec 64))) (size!46737 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95670)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95670 (_ BitVec 32)) Bool)

(assert (=> b!1399087 (= res!937838 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47012 0))(
  ( (Unit!47013) )
))
(declare-fun lt!615320 () Unit!47012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47012)

(assert (=> b!1399087 (= lt!615320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95670 (_ BitVec 32)) SeekEntryResult!10504)

(assert (=> b!1399087 (= lt!615318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615321 (select (arr!46187 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399087 (= lt!615321 (toIndex!0 (select (arr!46187 a!2901) j!112) mask!2840))))

(declare-fun b!1399088 () Bool)

(declare-fun res!937835 () Bool)

(assert (=> b!1399088 (=> (not res!937835) (not e!792071))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399088 (= res!937835 (validKeyInArray!0 (select (arr!46187 a!2901) i!1037)))))

(declare-fun b!1399089 () Bool)

(declare-fun res!937839 () Bool)

(assert (=> b!1399089 (=> (not res!937839) (not e!792071))))

(declare-datatypes ((List!32706 0))(
  ( (Nil!32703) (Cons!32702 (h!33947 (_ BitVec 64)) (t!47400 List!32706)) )
))
(declare-fun arrayNoDuplicates!0 (array!95670 (_ BitVec 32) List!32706) Bool)

(assert (=> b!1399089 (= res!937839 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32703))))

(declare-fun res!937837 () Bool)

(assert (=> start!120198 (=> (not res!937837) (not e!792071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120198 (= res!937837 (validMask!0 mask!2840))))

(assert (=> start!120198 e!792071))

(assert (=> start!120198 true))

(declare-fun array_inv!35215 (array!95670) Bool)

(assert (=> start!120198 (array_inv!35215 a!2901)))

(declare-fun b!1399090 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95670 (_ BitVec 32)) SeekEntryResult!10504)

(assert (=> b!1399090 (= e!792069 (= (seekEntryOrOpen!0 (select (arr!46187 a!2901) j!112) a!2901 mask!2840) (Found!10504 j!112)))))

(declare-fun b!1399091 () Bool)

(declare-fun e!792067 () Bool)

(assert (=> b!1399091 (= e!792070 e!792067)))

(declare-fun res!937840 () Bool)

(assert (=> b!1399091 (=> res!937840 e!792067)))

(declare-fun lt!615319 () SeekEntryResult!10504)

(assert (=> b!1399091 (= res!937840 (or (= lt!615318 lt!615319) (not (is-Intermediate!10504 lt!615319))))))

(declare-fun lt!615317 () (_ BitVec 64))

(assert (=> b!1399091 (= lt!615319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615317 mask!2840) lt!615317 (array!95671 (store (arr!46187 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46737 a!2901)) mask!2840))))

(assert (=> b!1399091 (= lt!615317 (select (store (arr!46187 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399092 () Bool)

(declare-fun res!937843 () Bool)

(assert (=> b!1399092 (=> (not res!937843) (not e!792071))))

(assert (=> b!1399092 (= res!937843 (validKeyInArray!0 (select (arr!46187 a!2901) j!112)))))

(declare-fun b!1399093 () Bool)

(assert (=> b!1399093 (= e!792067 true)))

(assert (=> b!1399093 (and (not (undefined!11316 lt!615319)) (= (index!44392 lt!615319) i!1037) (bvslt (x!126039 lt!615319) (x!126039 lt!615318)) (= (select (store (arr!46187 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44392 lt!615319)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615316 () Unit!47012)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47012)

(assert (=> b!1399093 (= lt!615316 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615321 (x!126039 lt!615318) (index!44392 lt!615318) (x!126039 lt!615319) (index!44392 lt!615319) (undefined!11316 lt!615319) mask!2840))))

(declare-fun b!1399094 () Bool)

(declare-fun res!937841 () Bool)

(assert (=> b!1399094 (=> (not res!937841) (not e!792071))))

(assert (=> b!1399094 (= res!937841 (and (= (size!46737 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46737 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46737 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399095 () Bool)

(declare-fun res!937842 () Bool)

(assert (=> b!1399095 (=> (not res!937842) (not e!792071))))

(assert (=> b!1399095 (= res!937842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120198 res!937837) b!1399094))

(assert (= (and b!1399094 res!937841) b!1399088))

(assert (= (and b!1399088 res!937835) b!1399092))

(assert (= (and b!1399092 res!937843) b!1399095))

(assert (= (and b!1399095 res!937842) b!1399089))

(assert (= (and b!1399089 res!937839) b!1399087))

(assert (= (and b!1399087 res!937838) b!1399090))

(assert (= (and b!1399087 (not res!937836)) b!1399091))

(assert (= (and b!1399091 (not res!937840)) b!1399093))

(declare-fun m!1286283 () Bool)

(assert (=> b!1399090 m!1286283))

(assert (=> b!1399090 m!1286283))

(declare-fun m!1286285 () Bool)

(assert (=> b!1399090 m!1286285))

(declare-fun m!1286287 () Bool)

(assert (=> b!1399089 m!1286287))

(declare-fun m!1286289 () Bool)

(assert (=> b!1399093 m!1286289))

(declare-fun m!1286291 () Bool)

(assert (=> b!1399093 m!1286291))

(declare-fun m!1286293 () Bool)

(assert (=> b!1399093 m!1286293))

(declare-fun m!1286295 () Bool)

(assert (=> b!1399088 m!1286295))

(assert (=> b!1399088 m!1286295))

(declare-fun m!1286297 () Bool)

(assert (=> b!1399088 m!1286297))

(declare-fun m!1286299 () Bool)

(assert (=> b!1399091 m!1286299))

(assert (=> b!1399091 m!1286289))

(assert (=> b!1399091 m!1286299))

(declare-fun m!1286301 () Bool)

(assert (=> b!1399091 m!1286301))

(declare-fun m!1286303 () Bool)

(assert (=> b!1399091 m!1286303))

(assert (=> b!1399087 m!1286283))

(declare-fun m!1286305 () Bool)

(assert (=> b!1399087 m!1286305))

(assert (=> b!1399087 m!1286283))

(declare-fun m!1286307 () Bool)

(assert (=> b!1399087 m!1286307))

(declare-fun m!1286309 () Bool)

(assert (=> b!1399087 m!1286309))

(assert (=> b!1399087 m!1286283))

(declare-fun m!1286311 () Bool)

(assert (=> b!1399087 m!1286311))

(declare-fun m!1286313 () Bool)

(assert (=> b!1399095 m!1286313))

(assert (=> b!1399092 m!1286283))

(assert (=> b!1399092 m!1286283))

(declare-fun m!1286315 () Bool)

(assert (=> b!1399092 m!1286315))

(declare-fun m!1286317 () Bool)

(assert (=> start!120198 m!1286317))

(declare-fun m!1286319 () Bool)

(assert (=> start!120198 m!1286319))

(push 1)

