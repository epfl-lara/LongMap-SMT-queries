; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118306 () Bool)

(assert start!118306)

(declare-fun res!925271 () Bool)

(declare-fun e!784168 () Bool)

(assert (=> start!118306 (=> (not res!925271) (not e!784168))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118306 (= res!925271 (validMask!0 mask!2987))))

(assert (=> start!118306 e!784168))

(assert (=> start!118306 true))

(declare-datatypes ((array!94609 0))(
  ( (array!94610 (arr!45682 (Array (_ BitVec 32) (_ BitVec 64))) (size!46232 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94609)

(declare-fun array_inv!34710 (array!94609) Bool)

(assert (=> start!118306 (array_inv!34710 a!2938)))

(declare-fun b!1383675 () Bool)

(declare-fun res!925273 () Bool)

(assert (=> b!1383675 (=> (not res!925273) (not e!784168))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383675 (= res!925273 (and (not (= (select (arr!45682 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45682 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383676 () Bool)

(declare-fun res!925268 () Bool)

(assert (=> b!1383676 (=> (not res!925268) (not e!784168))))

(assert (=> b!1383676 (= res!925268 (and (= (size!46232 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46232 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46232 a!2938))))))

(declare-fun b!1383677 () Bool)

(assert (=> b!1383677 (= e!784168 (not true))))

(declare-datatypes ((SeekEntryResult!10075 0))(
  ( (MissingZero!10075 (index!42671 (_ BitVec 32))) (Found!10075 (index!42672 (_ BitVec 32))) (Intermediate!10075 (undefined!10887 Bool) (index!42673 (_ BitVec 32)) (x!124180 (_ BitVec 32))) (Undefined!10075) (MissingVacant!10075 (index!42674 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94609 (_ BitVec 32)) SeekEntryResult!10075)

(assert (=> b!1383677 (= (seekEntryOrOpen!0 (select (arr!45682 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45682 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94610 (store (arr!45682 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46232 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46087 0))(
  ( (Unit!46088) )
))
(declare-fun lt!608649 () Unit!46087)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46087)

(assert (=> b!1383677 (= lt!608649 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383678 () Bool)

(declare-fun res!925269 () Bool)

(assert (=> b!1383678 (=> (not res!925269) (not e!784168))))

(declare-datatypes ((List!32210 0))(
  ( (Nil!32207) (Cons!32206 (h!33415 (_ BitVec 64)) (t!46904 List!32210)) )
))
(declare-fun arrayNoDuplicates!0 (array!94609 (_ BitVec 32) List!32210) Bool)

(assert (=> b!1383678 (= res!925269 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32207))))

(declare-fun b!1383679 () Bool)

(declare-fun res!925272 () Bool)

(assert (=> b!1383679 (=> (not res!925272) (not e!784168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383679 (= res!925272 (validKeyInArray!0 (select (arr!45682 a!2938) i!1065)))))

(declare-fun b!1383680 () Bool)

(declare-fun res!925267 () Bool)

(assert (=> b!1383680 (=> (not res!925267) (not e!784168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94609 (_ BitVec 32)) Bool)

(assert (=> b!1383680 (= res!925267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383681 () Bool)

(declare-fun res!925270 () Bool)

(assert (=> b!1383681 (=> (not res!925270) (not e!784168))))

(assert (=> b!1383681 (= res!925270 (validKeyInArray!0 (select (arr!45682 a!2938) startIndex!16)))))

(assert (= (and start!118306 res!925271) b!1383676))

(assert (= (and b!1383676 res!925268) b!1383679))

(assert (= (and b!1383679 res!925272) b!1383678))

(assert (= (and b!1383678 res!925269) b!1383680))

(assert (= (and b!1383680 res!925267) b!1383675))

(assert (= (and b!1383675 res!925273) b!1383681))

(assert (= (and b!1383681 res!925270) b!1383677))

(declare-fun m!1268827 () Bool)

(assert (=> b!1383678 m!1268827))

(declare-fun m!1268829 () Bool)

(assert (=> b!1383677 m!1268829))

(assert (=> b!1383677 m!1268829))

(declare-fun m!1268831 () Bool)

(assert (=> b!1383677 m!1268831))

(declare-fun m!1268833 () Bool)

(assert (=> b!1383677 m!1268833))

(declare-fun m!1268835 () Bool)

(assert (=> b!1383677 m!1268835))

(declare-fun m!1268837 () Bool)

(assert (=> b!1383677 m!1268837))

(assert (=> b!1383677 m!1268837))

(declare-fun m!1268839 () Bool)

(assert (=> b!1383677 m!1268839))

(declare-fun m!1268841 () Bool)

(assert (=> start!118306 m!1268841))

(declare-fun m!1268843 () Bool)

(assert (=> start!118306 m!1268843))

(declare-fun m!1268845 () Bool)

(assert (=> b!1383679 m!1268845))

(assert (=> b!1383679 m!1268845))

(declare-fun m!1268847 () Bool)

(assert (=> b!1383679 m!1268847))

(assert (=> b!1383675 m!1268845))

(assert (=> b!1383681 m!1268837))

(assert (=> b!1383681 m!1268837))

(declare-fun m!1268849 () Bool)

(assert (=> b!1383681 m!1268849))

(declare-fun m!1268851 () Bool)

(assert (=> b!1383680 m!1268851))

(push 1)

(assert (not b!1383678))

(assert (not b!1383680))

(assert (not start!118306))

(assert (not b!1383681))

(assert (not b!1383679))

(assert (not b!1383677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

