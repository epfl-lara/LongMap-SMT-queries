; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118624 () Bool)

(assert start!118624)

(declare-fun res!927961 () Bool)

(declare-fun e!785581 () Bool)

(assert (=> start!118624 (=> (not res!927961) (not e!785581))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118624 (= res!927961 (validMask!0 mask!2987))))

(assert (=> start!118624 e!785581))

(assert (=> start!118624 true))

(declare-datatypes ((array!94900 0))(
  ( (array!94901 (arr!45826 (Array (_ BitVec 32) (_ BitVec 64))) (size!46376 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94900)

(declare-fun array_inv!34854 (array!94900) Bool)

(assert (=> start!118624 (array_inv!34854 a!2938)))

(declare-fun b!1386850 () Bool)

(declare-fun res!927964 () Bool)

(assert (=> b!1386850 (=> (not res!927964) (not e!785581))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386850 (= res!927964 (and (= (size!46376 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46376 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46376 a!2938))))))

(declare-fun b!1386851 () Bool)

(declare-fun res!927958 () Bool)

(assert (=> b!1386851 (=> (not res!927958) (not e!785581))))

(assert (=> b!1386851 (= res!927958 (and (not (= (select (arr!45826 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45826 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386852 () Bool)

(assert (=> b!1386852 (= e!785581 false)))

(declare-datatypes ((Unit!46349 0))(
  ( (Unit!46350) )
))
(declare-fun lt!609601 () Unit!46349)

(declare-fun e!785579 () Unit!46349)

(assert (=> b!1386852 (= lt!609601 e!785579)))

(declare-fun c!128886 () Bool)

(declare-fun e!785580 () Bool)

(assert (=> b!1386852 (= c!128886 e!785580)))

(declare-fun res!927962 () Bool)

(assert (=> b!1386852 (=> (not res!927962) (not e!785580))))

(assert (=> b!1386852 (= res!927962 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386853 () Bool)

(declare-fun res!927959 () Bool)

(assert (=> b!1386853 (=> (not res!927959) (not e!785581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386853 (= res!927959 (validKeyInArray!0 (select (arr!45826 a!2938) i!1065)))))

(declare-fun b!1386854 () Bool)

(assert (=> b!1386854 (= e!785580 (validKeyInArray!0 (select (arr!45826 a!2938) startIndex!16)))))

(declare-fun b!1386855 () Bool)

(declare-fun res!927960 () Bool)

(assert (=> b!1386855 (=> (not res!927960) (not e!785581))))

(declare-datatypes ((List!32354 0))(
  ( (Nil!32351) (Cons!32350 (h!33559 (_ BitVec 64)) (t!47048 List!32354)) )
))
(declare-fun arrayNoDuplicates!0 (array!94900 (_ BitVec 32) List!32354) Bool)

(assert (=> b!1386855 (= res!927960 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32351))))

(declare-fun b!1386856 () Bool)

(declare-fun Unit!46351 () Unit!46349)

(assert (=> b!1386856 (= e!785579 Unit!46351)))

(declare-fun b!1386857 () Bool)

(declare-fun lt!609603 () Unit!46349)

(assert (=> b!1386857 (= e!785579 lt!609603)))

(declare-fun lt!609602 () Unit!46349)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46349)

(assert (=> b!1386857 (= lt!609602 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10169 0))(
  ( (MissingZero!10169 (index!43047 (_ BitVec 32))) (Found!10169 (index!43048 (_ BitVec 32))) (Intermediate!10169 (undefined!10981 Bool) (index!43049 (_ BitVec 32)) (x!124658 (_ BitVec 32))) (Undefined!10169) (MissingVacant!10169 (index!43050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94900 (_ BitVec 32)) SeekEntryResult!10169)

(assert (=> b!1386857 (= (seekEntryOrOpen!0 (select (arr!45826 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45826 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94901 (store (arr!45826 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46376 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46349)

(assert (=> b!1386857 (= lt!609603 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94900 (_ BitVec 32)) Bool)

(assert (=> b!1386857 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386858 () Bool)

(declare-fun res!927963 () Bool)

(assert (=> b!1386858 (=> (not res!927963) (not e!785581))))

(assert (=> b!1386858 (= res!927963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118624 res!927961) b!1386850))

(assert (= (and b!1386850 res!927964) b!1386853))

(assert (= (and b!1386853 res!927959) b!1386855))

(assert (= (and b!1386855 res!927960) b!1386858))

(assert (= (and b!1386858 res!927963) b!1386851))

(assert (= (and b!1386851 res!927958) b!1386852))

(assert (= (and b!1386852 res!927962) b!1386854))

(assert (= (and b!1386852 c!128886) b!1386857))

(assert (= (and b!1386852 (not c!128886)) b!1386856))

(declare-fun m!1272261 () Bool)

(assert (=> start!118624 m!1272261))

(declare-fun m!1272263 () Bool)

(assert (=> start!118624 m!1272263))

(declare-fun m!1272265 () Bool)

(assert (=> b!1386855 m!1272265))

(declare-fun m!1272267 () Bool)

(assert (=> b!1386854 m!1272267))

(assert (=> b!1386854 m!1272267))

(declare-fun m!1272269 () Bool)

(assert (=> b!1386854 m!1272269))

(declare-fun m!1272271 () Bool)

(assert (=> b!1386853 m!1272271))

(assert (=> b!1386853 m!1272271))

(declare-fun m!1272273 () Bool)

(assert (=> b!1386853 m!1272273))

(assert (=> b!1386851 m!1272271))

(declare-fun m!1272275 () Bool)

(assert (=> b!1386857 m!1272275))

(declare-fun m!1272277 () Bool)

(assert (=> b!1386857 m!1272277))

(assert (=> b!1386857 m!1272277))

(declare-fun m!1272279 () Bool)

(assert (=> b!1386857 m!1272279))

(declare-fun m!1272281 () Bool)

(assert (=> b!1386857 m!1272281))

(declare-fun m!1272283 () Bool)

(assert (=> b!1386857 m!1272283))

(assert (=> b!1386857 m!1272267))

(declare-fun m!1272285 () Bool)

(assert (=> b!1386857 m!1272285))

(assert (=> b!1386857 m!1272267))

(declare-fun m!1272287 () Bool)

(assert (=> b!1386857 m!1272287))

(declare-fun m!1272289 () Bool)

(assert (=> b!1386858 m!1272289))

(push 1)

(assert (not b!1386855))

(assert (not b!1386857))

(assert (not b!1386854))

(assert (not start!118624))

(assert (not b!1386858))

(assert (not b!1386853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

