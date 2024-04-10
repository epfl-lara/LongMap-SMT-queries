; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118622 () Bool)

(assert start!118622)

(declare-fun res!927943 () Bool)

(declare-fun e!785570 () Bool)

(assert (=> start!118622 (=> (not res!927943) (not e!785570))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118622 (= res!927943 (validMask!0 mask!2987))))

(assert (=> start!118622 e!785570))

(assert (=> start!118622 true))

(declare-datatypes ((array!94898 0))(
  ( (array!94899 (arr!45825 (Array (_ BitVec 32) (_ BitVec 64))) (size!46375 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94898)

(declare-fun array_inv!34853 (array!94898) Bool)

(assert (=> start!118622 (array_inv!34853 a!2938)))

(declare-fun b!1386823 () Bool)

(declare-fun e!785569 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386823 (= e!785569 (validKeyInArray!0 (select (arr!45825 a!2938) startIndex!16)))))

(declare-fun b!1386824 () Bool)

(declare-datatypes ((Unit!46346 0))(
  ( (Unit!46347) )
))
(declare-fun e!785568 () Unit!46346)

(declare-fun Unit!46348 () Unit!46346)

(assert (=> b!1386824 (= e!785568 Unit!46348)))

(declare-fun b!1386825 () Bool)

(declare-fun lt!609592 () Unit!46346)

(assert (=> b!1386825 (= e!785568 lt!609592)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609594 () Unit!46346)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46346)

(assert (=> b!1386825 (= lt!609594 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10168 0))(
  ( (MissingZero!10168 (index!43043 (_ BitVec 32))) (Found!10168 (index!43044 (_ BitVec 32))) (Intermediate!10168 (undefined!10980 Bool) (index!43045 (_ BitVec 32)) (x!124657 (_ BitVec 32))) (Undefined!10168) (MissingVacant!10168 (index!43046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94898 (_ BitVec 32)) SeekEntryResult!10168)

(assert (=> b!1386825 (= (seekEntryOrOpen!0 (select (arr!45825 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45825 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94899 (store (arr!45825 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46375 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46346)

(assert (=> b!1386825 (= lt!609592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94898 (_ BitVec 32)) Bool)

(assert (=> b!1386825 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386826 () Bool)

(declare-fun res!927941 () Bool)

(assert (=> b!1386826 (=> (not res!927941) (not e!785570))))

(assert (=> b!1386826 (= res!927941 (and (= (size!46375 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46375 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46375 a!2938))))))

(declare-fun b!1386827 () Bool)

(declare-fun res!927938 () Bool)

(assert (=> b!1386827 (=> (not res!927938) (not e!785570))))

(declare-datatypes ((List!32353 0))(
  ( (Nil!32350) (Cons!32349 (h!33558 (_ BitVec 64)) (t!47047 List!32353)) )
))
(declare-fun arrayNoDuplicates!0 (array!94898 (_ BitVec 32) List!32353) Bool)

(assert (=> b!1386827 (= res!927938 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32350))))

(declare-fun b!1386828 () Bool)

(declare-fun res!927942 () Bool)

(assert (=> b!1386828 (=> (not res!927942) (not e!785570))))

(assert (=> b!1386828 (= res!927942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386829 () Bool)

(declare-fun res!927939 () Bool)

(assert (=> b!1386829 (=> (not res!927939) (not e!785570))))

(assert (=> b!1386829 (= res!927939 (and (not (= (select (arr!45825 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45825 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386830 () Bool)

(assert (=> b!1386830 (= e!785570 false)))

(declare-fun lt!609593 () Unit!46346)

(assert (=> b!1386830 (= lt!609593 e!785568)))

(declare-fun c!128883 () Bool)

(assert (=> b!1386830 (= c!128883 e!785569)))

(declare-fun res!927940 () Bool)

(assert (=> b!1386830 (=> (not res!927940) (not e!785569))))

(assert (=> b!1386830 (= res!927940 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386831 () Bool)

(declare-fun res!927937 () Bool)

(assert (=> b!1386831 (=> (not res!927937) (not e!785570))))

(assert (=> b!1386831 (= res!927937 (validKeyInArray!0 (select (arr!45825 a!2938) i!1065)))))

(assert (= (and start!118622 res!927943) b!1386826))

(assert (= (and b!1386826 res!927941) b!1386831))

(assert (= (and b!1386831 res!927937) b!1386827))

(assert (= (and b!1386827 res!927938) b!1386828))

(assert (= (and b!1386828 res!927942) b!1386829))

(assert (= (and b!1386829 res!927939) b!1386830))

(assert (= (and b!1386830 res!927940) b!1386823))

(assert (= (and b!1386830 c!128883) b!1386825))

(assert (= (and b!1386830 (not c!128883)) b!1386824))

(declare-fun m!1272231 () Bool)

(assert (=> start!118622 m!1272231))

(declare-fun m!1272233 () Bool)

(assert (=> start!118622 m!1272233))

(declare-fun m!1272235 () Bool)

(assert (=> b!1386823 m!1272235))

(assert (=> b!1386823 m!1272235))

(declare-fun m!1272237 () Bool)

(assert (=> b!1386823 m!1272237))

(declare-fun m!1272239 () Bool)

(assert (=> b!1386831 m!1272239))

(assert (=> b!1386831 m!1272239))

(declare-fun m!1272241 () Bool)

(assert (=> b!1386831 m!1272241))

(declare-fun m!1272243 () Bool)

(assert (=> b!1386825 m!1272243))

(declare-fun m!1272245 () Bool)

(assert (=> b!1386825 m!1272245))

(assert (=> b!1386825 m!1272245))

(declare-fun m!1272247 () Bool)

(assert (=> b!1386825 m!1272247))

(declare-fun m!1272249 () Bool)

(assert (=> b!1386825 m!1272249))

(declare-fun m!1272251 () Bool)

(assert (=> b!1386825 m!1272251))

(assert (=> b!1386825 m!1272235))

(declare-fun m!1272253 () Bool)

(assert (=> b!1386825 m!1272253))

(assert (=> b!1386825 m!1272235))

(declare-fun m!1272255 () Bool)

(assert (=> b!1386825 m!1272255))

(assert (=> b!1386829 m!1272239))

(declare-fun m!1272257 () Bool)

(assert (=> b!1386827 m!1272257))

(declare-fun m!1272259 () Bool)

(assert (=> b!1386828 m!1272259))

(check-sat (not b!1386831) (not b!1386828) (not start!118622) (not b!1386825) (not b!1386827) (not b!1386823))
