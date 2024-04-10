; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118398 () Bool)

(assert start!118398)

(declare-fun b!1384933 () Bool)

(declare-fun res!926275 () Bool)

(declare-fun e!784736 () Bool)

(assert (=> b!1384933 (=> (not res!926275) (not e!784736))))

(declare-datatypes ((array!94701 0))(
  ( (array!94702 (arr!45728 (Array (_ BitVec 32) (_ BitVec 64))) (size!46278 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94701)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384933 (= res!926275 (and (not (= (select (arr!45728 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45728 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384934 () Bool)

(assert (=> b!1384934 (= e!784736 false)))

(declare-datatypes ((Unit!46221 0))(
  ( (Unit!46222) )
))
(declare-fun lt!609117 () Unit!46221)

(declare-fun e!784739 () Unit!46221)

(assert (=> b!1384934 (= lt!609117 e!784739)))

(declare-fun c!128772 () Bool)

(declare-fun e!784737 () Bool)

(assert (=> b!1384934 (= c!128772 e!784737)))

(declare-fun res!926270 () Bool)

(assert (=> b!1384934 (=> (not res!926270) (not e!784737))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384934 (= res!926270 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384935 () Bool)

(declare-fun res!926274 () Bool)

(assert (=> b!1384935 (=> (not res!926274) (not e!784736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384935 (= res!926274 (validKeyInArray!0 (select (arr!45728 a!2938) i!1065)))))

(declare-fun res!926273 () Bool)

(assert (=> start!118398 (=> (not res!926273) (not e!784736))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118398 (= res!926273 (validMask!0 mask!2987))))

(assert (=> start!118398 e!784736))

(assert (=> start!118398 true))

(declare-fun array_inv!34756 (array!94701) Bool)

(assert (=> start!118398 (array_inv!34756 a!2938)))

(declare-fun b!1384936 () Bool)

(declare-fun Unit!46223 () Unit!46221)

(assert (=> b!1384936 (= e!784739 Unit!46223)))

(declare-fun b!1384937 () Bool)

(assert (=> b!1384937 (= e!784737 (validKeyInArray!0 (select (arr!45728 a!2938) startIndex!16)))))

(declare-fun b!1384938 () Bool)

(declare-fun lt!609115 () Unit!46221)

(assert (=> b!1384938 (= e!784739 lt!609115)))

(declare-fun lt!609116 () Unit!46221)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46221)

(assert (=> b!1384938 (= lt!609116 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10121 0))(
  ( (MissingZero!10121 (index!42855 (_ BitVec 32))) (Found!10121 (index!42856 (_ BitVec 32))) (Intermediate!10121 (undefined!10933 Bool) (index!42857 (_ BitVec 32)) (x!124354 (_ BitVec 32))) (Undefined!10121) (MissingVacant!10121 (index!42858 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94701 (_ BitVec 32)) SeekEntryResult!10121)

(assert (=> b!1384938 (= (seekEntryOrOpen!0 (select (arr!45728 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45728 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94702 (store (arr!45728 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46278 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46221)

(assert (=> b!1384938 (= lt!609115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94701 (_ BitVec 32)) Bool)

(assert (=> b!1384938 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384939 () Bool)

(declare-fun res!926272 () Bool)

(assert (=> b!1384939 (=> (not res!926272) (not e!784736))))

(declare-datatypes ((List!32256 0))(
  ( (Nil!32253) (Cons!32252 (h!33461 (_ BitVec 64)) (t!46950 List!32256)) )
))
(declare-fun arrayNoDuplicates!0 (array!94701 (_ BitVec 32) List!32256) Bool)

(assert (=> b!1384939 (= res!926272 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32253))))

(declare-fun b!1384940 () Bool)

(declare-fun res!926271 () Bool)

(assert (=> b!1384940 (=> (not res!926271) (not e!784736))))

(assert (=> b!1384940 (= res!926271 (and (= (size!46278 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46278 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46278 a!2938))))))

(declare-fun b!1384941 () Bool)

(declare-fun res!926269 () Bool)

(assert (=> b!1384941 (=> (not res!926269) (not e!784736))))

(assert (=> b!1384941 (= res!926269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118398 res!926273) b!1384940))

(assert (= (and b!1384940 res!926271) b!1384935))

(assert (= (and b!1384935 res!926274) b!1384939))

(assert (= (and b!1384939 res!926272) b!1384941))

(assert (= (and b!1384941 res!926269) b!1384933))

(assert (= (and b!1384933 res!926275) b!1384934))

(assert (= (and b!1384934 res!926270) b!1384937))

(assert (= (and b!1384934 c!128772) b!1384938))

(assert (= (and b!1384934 (not c!128772)) b!1384936))

(declare-fun m!1270239 () Bool)

(assert (=> b!1384933 m!1270239))

(declare-fun m!1270241 () Bool)

(assert (=> b!1384939 m!1270241))

(declare-fun m!1270243 () Bool)

(assert (=> b!1384941 m!1270243))

(declare-fun m!1270245 () Bool)

(assert (=> b!1384937 m!1270245))

(assert (=> b!1384937 m!1270245))

(declare-fun m!1270247 () Bool)

(assert (=> b!1384937 m!1270247))

(declare-fun m!1270249 () Bool)

(assert (=> start!118398 m!1270249))

(declare-fun m!1270251 () Bool)

(assert (=> start!118398 m!1270251))

(declare-fun m!1270253 () Bool)

(assert (=> b!1384938 m!1270253))

(declare-fun m!1270255 () Bool)

(assert (=> b!1384938 m!1270255))

(assert (=> b!1384938 m!1270255))

(declare-fun m!1270257 () Bool)

(assert (=> b!1384938 m!1270257))

(declare-fun m!1270259 () Bool)

(assert (=> b!1384938 m!1270259))

(declare-fun m!1270261 () Bool)

(assert (=> b!1384938 m!1270261))

(assert (=> b!1384938 m!1270245))

(declare-fun m!1270263 () Bool)

(assert (=> b!1384938 m!1270263))

(assert (=> b!1384938 m!1270245))

(declare-fun m!1270265 () Bool)

(assert (=> b!1384938 m!1270265))

(assert (=> b!1384935 m!1270239))

(assert (=> b!1384935 m!1270239))

(declare-fun m!1270267 () Bool)

(assert (=> b!1384935 m!1270267))

(push 1)

(assert (not b!1384938))

(assert (not start!118398))

(assert (not b!1384935))

(assert (not b!1384939))

(assert (not b!1384937))

(assert (not b!1384941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

