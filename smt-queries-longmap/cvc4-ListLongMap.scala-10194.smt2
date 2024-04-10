; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120094 () Bool)

(assert start!120094)

(declare-fun b!1398229 () Bool)

(declare-fun res!937150 () Bool)

(declare-fun e!791570 () Bool)

(assert (=> b!1398229 (=> (not res!937150) (not e!791570))))

(declare-datatypes ((array!95623 0))(
  ( (array!95624 (arr!46165 (Array (_ BitVec 32) (_ BitVec 64))) (size!46715 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95623)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95623 (_ BitVec 32)) Bool)

(assert (=> b!1398229 (= res!937150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398230 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!791569 () Bool)

(declare-datatypes ((SeekEntryResult!10482 0))(
  ( (MissingZero!10482 (index!44299 (_ BitVec 32))) (Found!10482 (index!44300 (_ BitVec 32))) (Intermediate!10482 (undefined!11294 Bool) (index!44301 (_ BitVec 32)) (x!125944 (_ BitVec 32))) (Undefined!10482) (MissingVacant!10482 (index!44302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95623 (_ BitVec 32)) SeekEntryResult!10482)

(assert (=> b!1398230 (= e!791569 (= (seekEntryOrOpen!0 (select (arr!46165 a!2901) j!112) a!2901 mask!2840) (Found!10482 j!112)))))

(declare-fun b!1398231 () Bool)

(declare-fun res!937144 () Bool)

(assert (=> b!1398231 (=> (not res!937144) (not e!791570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398231 (= res!937144 (validKeyInArray!0 (select (arr!46165 a!2901) j!112)))))

(declare-fun b!1398232 () Bool)

(declare-fun res!937147 () Bool)

(assert (=> b!1398232 (=> (not res!937147) (not e!791570))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398232 (= res!937147 (validKeyInArray!0 (select (arr!46165 a!2901) i!1037)))))

(declare-fun b!1398233 () Bool)

(declare-fun e!791573 () Bool)

(assert (=> b!1398233 (= e!791573 true)))

(declare-fun lt!614792 () SeekEntryResult!10482)

(declare-fun lt!614795 () SeekEntryResult!10482)

(assert (=> b!1398233 (and (not (undefined!11294 lt!614792)) (= (index!44301 lt!614792) i!1037) (bvslt (x!125944 lt!614792) (x!125944 lt!614795)) (= (select (store (arr!46165 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44301 lt!614792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46968 0))(
  ( (Unit!46969) )
))
(declare-fun lt!614793 () Unit!46968)

(declare-fun lt!614791 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46968)

(assert (=> b!1398233 (= lt!614793 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614791 (x!125944 lt!614795) (index!44301 lt!614795) (x!125944 lt!614792) (index!44301 lt!614792) (undefined!11294 lt!614792) mask!2840))))

(declare-fun b!1398234 () Bool)

(declare-fun e!791571 () Bool)

(assert (=> b!1398234 (= e!791570 (not e!791571))))

(declare-fun res!937146 () Bool)

(assert (=> b!1398234 (=> res!937146 e!791571)))

(assert (=> b!1398234 (= res!937146 (or (not (is-Intermediate!10482 lt!614795)) (undefined!11294 lt!614795)))))

(assert (=> b!1398234 e!791569))

(declare-fun res!937149 () Bool)

(assert (=> b!1398234 (=> (not res!937149) (not e!791569))))

(assert (=> b!1398234 (= res!937149 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614794 () Unit!46968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46968)

(assert (=> b!1398234 (= lt!614794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95623 (_ BitVec 32)) SeekEntryResult!10482)

(assert (=> b!1398234 (= lt!614795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614791 (select (arr!46165 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398234 (= lt!614791 (toIndex!0 (select (arr!46165 a!2901) j!112) mask!2840))))

(declare-fun b!1398235 () Bool)

(declare-fun res!937142 () Bool)

(assert (=> b!1398235 (=> (not res!937142) (not e!791570))))

(assert (=> b!1398235 (= res!937142 (and (= (size!46715 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46715 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46715 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398236 () Bool)

(declare-fun res!937148 () Bool)

(assert (=> b!1398236 (=> (not res!937148) (not e!791570))))

(declare-datatypes ((List!32684 0))(
  ( (Nil!32681) (Cons!32680 (h!33922 (_ BitVec 64)) (t!47378 List!32684)) )
))
(declare-fun arrayNoDuplicates!0 (array!95623 (_ BitVec 32) List!32684) Bool)

(assert (=> b!1398236 (= res!937148 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32681))))

(declare-fun res!937143 () Bool)

(assert (=> start!120094 (=> (not res!937143) (not e!791570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120094 (= res!937143 (validMask!0 mask!2840))))

(assert (=> start!120094 e!791570))

(assert (=> start!120094 true))

(declare-fun array_inv!35193 (array!95623) Bool)

(assert (=> start!120094 (array_inv!35193 a!2901)))

(declare-fun b!1398237 () Bool)

(assert (=> b!1398237 (= e!791571 e!791573)))

(declare-fun res!937145 () Bool)

(assert (=> b!1398237 (=> res!937145 e!791573)))

(assert (=> b!1398237 (= res!937145 (or (= lt!614795 lt!614792) (not (is-Intermediate!10482 lt!614792))))))

(declare-fun lt!614796 () (_ BitVec 64))

(assert (=> b!1398237 (= lt!614792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614796 mask!2840) lt!614796 (array!95624 (store (arr!46165 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46715 a!2901)) mask!2840))))

(assert (=> b!1398237 (= lt!614796 (select (store (arr!46165 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120094 res!937143) b!1398235))

(assert (= (and b!1398235 res!937142) b!1398232))

(assert (= (and b!1398232 res!937147) b!1398231))

(assert (= (and b!1398231 res!937144) b!1398229))

(assert (= (and b!1398229 res!937150) b!1398236))

(assert (= (and b!1398236 res!937148) b!1398234))

(assert (= (and b!1398234 res!937149) b!1398230))

(assert (= (and b!1398234 (not res!937146)) b!1398237))

(assert (= (and b!1398237 (not res!937145)) b!1398233))

(declare-fun m!1285279 () Bool)

(assert (=> b!1398233 m!1285279))

(declare-fun m!1285281 () Bool)

(assert (=> b!1398233 m!1285281))

(declare-fun m!1285283 () Bool)

(assert (=> b!1398233 m!1285283))

(declare-fun m!1285285 () Bool)

(assert (=> b!1398229 m!1285285))

(declare-fun m!1285287 () Bool)

(assert (=> start!120094 m!1285287))

(declare-fun m!1285289 () Bool)

(assert (=> start!120094 m!1285289))

(declare-fun m!1285291 () Bool)

(assert (=> b!1398237 m!1285291))

(assert (=> b!1398237 m!1285279))

(assert (=> b!1398237 m!1285291))

(declare-fun m!1285293 () Bool)

(assert (=> b!1398237 m!1285293))

(declare-fun m!1285295 () Bool)

(assert (=> b!1398237 m!1285295))

(declare-fun m!1285297 () Bool)

(assert (=> b!1398234 m!1285297))

(declare-fun m!1285299 () Bool)

(assert (=> b!1398234 m!1285299))

(assert (=> b!1398234 m!1285297))

(declare-fun m!1285301 () Bool)

(assert (=> b!1398234 m!1285301))

(declare-fun m!1285303 () Bool)

(assert (=> b!1398234 m!1285303))

(assert (=> b!1398234 m!1285297))

(declare-fun m!1285305 () Bool)

(assert (=> b!1398234 m!1285305))

(assert (=> b!1398231 m!1285297))

(assert (=> b!1398231 m!1285297))

(declare-fun m!1285307 () Bool)

(assert (=> b!1398231 m!1285307))

(declare-fun m!1285309 () Bool)

(assert (=> b!1398232 m!1285309))

(assert (=> b!1398232 m!1285309))

(declare-fun m!1285311 () Bool)

(assert (=> b!1398232 m!1285311))

(assert (=> b!1398230 m!1285297))

(assert (=> b!1398230 m!1285297))

(declare-fun m!1285313 () Bool)

(assert (=> b!1398230 m!1285313))

(declare-fun m!1285315 () Bool)

(assert (=> b!1398236 m!1285315))

(push 1)

(assert (not b!1398229))

(assert (not b!1398232))

(assert (not b!1398236))

(assert (not b!1398230))

(assert (not b!1398237))

(assert (not b!1398233))

(assert (not start!120094))

(assert (not b!1398231))

(assert (not b!1398234))

(check-sat)

