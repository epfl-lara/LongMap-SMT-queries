; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118392 () Bool)

(assert start!118392)

(declare-fun res!926212 () Bool)

(declare-fun e!784703 () Bool)

(assert (=> start!118392 (=> (not res!926212) (not e!784703))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118392 (= res!926212 (validMask!0 mask!2987))))

(assert (=> start!118392 e!784703))

(assert (=> start!118392 true))

(declare-datatypes ((array!94695 0))(
  ( (array!94696 (arr!45725 (Array (_ BitVec 32) (_ BitVec 64))) (size!46275 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94695)

(declare-fun array_inv!34753 (array!94695) Bool)

(assert (=> start!118392 (array_inv!34753 a!2938)))

(declare-fun b!1384852 () Bool)

(declare-fun res!926209 () Bool)

(assert (=> b!1384852 (=> (not res!926209) (not e!784703))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384852 (= res!926209 (and (= (size!46275 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46275 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46275 a!2938))))))

(declare-fun b!1384853 () Bool)

(declare-fun e!784700 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384853 (= e!784700 (validKeyInArray!0 (select (arr!45725 a!2938) startIndex!16)))))

(declare-fun b!1384854 () Bool)

(declare-fun res!926206 () Bool)

(assert (=> b!1384854 (=> (not res!926206) (not e!784703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94695 (_ BitVec 32)) Bool)

(assert (=> b!1384854 (= res!926206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384855 () Bool)

(declare-fun res!926208 () Bool)

(assert (=> b!1384855 (=> (not res!926208) (not e!784703))))

(assert (=> b!1384855 (= res!926208 (validKeyInArray!0 (select (arr!45725 a!2938) i!1065)))))

(declare-fun b!1384856 () Bool)

(assert (=> b!1384856 (= e!784703 false)))

(declare-datatypes ((Unit!46212 0))(
  ( (Unit!46213) )
))
(declare-fun lt!609089 () Unit!46212)

(declare-fun e!784701 () Unit!46212)

(assert (=> b!1384856 (= lt!609089 e!784701)))

(declare-fun c!128763 () Bool)

(assert (=> b!1384856 (= c!128763 e!784700)))

(declare-fun res!926210 () Bool)

(assert (=> b!1384856 (=> (not res!926210) (not e!784700))))

(assert (=> b!1384856 (= res!926210 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384857 () Bool)

(declare-fun Unit!46214 () Unit!46212)

(assert (=> b!1384857 (= e!784701 Unit!46214)))

(declare-fun b!1384858 () Bool)

(declare-fun res!926211 () Bool)

(assert (=> b!1384858 (=> (not res!926211) (not e!784703))))

(declare-datatypes ((List!32253 0))(
  ( (Nil!32250) (Cons!32249 (h!33458 (_ BitVec 64)) (t!46947 List!32253)) )
))
(declare-fun arrayNoDuplicates!0 (array!94695 (_ BitVec 32) List!32253) Bool)

(assert (=> b!1384858 (= res!926211 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32250))))

(declare-fun b!1384859 () Bool)

(declare-fun lt!609090 () Unit!46212)

(assert (=> b!1384859 (= e!784701 lt!609090)))

(declare-fun lt!609088 () Unit!46212)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46212)

(assert (=> b!1384859 (= lt!609088 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10118 0))(
  ( (MissingZero!10118 (index!42843 (_ BitVec 32))) (Found!10118 (index!42844 (_ BitVec 32))) (Intermediate!10118 (undefined!10930 Bool) (index!42845 (_ BitVec 32)) (x!124343 (_ BitVec 32))) (Undefined!10118) (MissingVacant!10118 (index!42846 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94695 (_ BitVec 32)) SeekEntryResult!10118)

(assert (=> b!1384859 (= (seekEntryOrOpen!0 (select (arr!45725 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45725 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94696 (store (arr!45725 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46275 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46212)

(assert (=> b!1384859 (= lt!609090 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384859 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384860 () Bool)

(declare-fun res!926207 () Bool)

(assert (=> b!1384860 (=> (not res!926207) (not e!784703))))

(assert (=> b!1384860 (= res!926207 (and (not (= (select (arr!45725 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45725 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118392 res!926212) b!1384852))

(assert (= (and b!1384852 res!926209) b!1384855))

(assert (= (and b!1384855 res!926208) b!1384858))

(assert (= (and b!1384858 res!926211) b!1384854))

(assert (= (and b!1384854 res!926206) b!1384860))

(assert (= (and b!1384860 res!926207) b!1384856))

(assert (= (and b!1384856 res!926210) b!1384853))

(assert (= (and b!1384856 c!128763) b!1384859))

(assert (= (and b!1384856 (not c!128763)) b!1384857))

(declare-fun m!1270149 () Bool)

(assert (=> b!1384854 m!1270149))

(declare-fun m!1270151 () Bool)

(assert (=> start!118392 m!1270151))

(declare-fun m!1270153 () Bool)

(assert (=> start!118392 m!1270153))

(declare-fun m!1270155 () Bool)

(assert (=> b!1384853 m!1270155))

(assert (=> b!1384853 m!1270155))

(declare-fun m!1270157 () Bool)

(assert (=> b!1384853 m!1270157))

(declare-fun m!1270159 () Bool)

(assert (=> b!1384855 m!1270159))

(assert (=> b!1384855 m!1270159))

(declare-fun m!1270161 () Bool)

(assert (=> b!1384855 m!1270161))

(declare-fun m!1270163 () Bool)

(assert (=> b!1384858 m!1270163))

(declare-fun m!1270165 () Bool)

(assert (=> b!1384859 m!1270165))

(declare-fun m!1270167 () Bool)

(assert (=> b!1384859 m!1270167))

(assert (=> b!1384859 m!1270167))

(declare-fun m!1270169 () Bool)

(assert (=> b!1384859 m!1270169))

(declare-fun m!1270171 () Bool)

(assert (=> b!1384859 m!1270171))

(declare-fun m!1270173 () Bool)

(assert (=> b!1384859 m!1270173))

(assert (=> b!1384859 m!1270155))

(declare-fun m!1270175 () Bool)

(assert (=> b!1384859 m!1270175))

(assert (=> b!1384859 m!1270155))

(declare-fun m!1270177 () Bool)

(assert (=> b!1384859 m!1270177))

(assert (=> b!1384860 m!1270159))

(push 1)

(assert (not b!1384853))

(assert (not b!1384854))

(assert (not b!1384859))

(assert (not start!118392))

(assert (not b!1384858))

(assert (not b!1384855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

