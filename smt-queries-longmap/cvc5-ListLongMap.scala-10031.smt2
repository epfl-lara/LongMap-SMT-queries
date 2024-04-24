; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118506 () Bool)

(assert start!118506)

(declare-fun b!1384857 () Bool)

(declare-fun res!925660 () Bool)

(declare-fun e!784981 () Bool)

(assert (=> b!1384857 (=> (not res!925660) (not e!784981))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94707 0))(
  ( (array!94708 (arr!45729 (Array (_ BitVec 32) (_ BitVec 64))) (size!46280 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94707)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384857 (= res!925660 (and (= (size!46280 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46280 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46280 a!2938))))))

(declare-fun b!1384858 () Bool)

(declare-fun res!925666 () Bool)

(assert (=> b!1384858 (=> (not res!925666) (not e!784981))))

(declare-datatypes ((List!32244 0))(
  ( (Nil!32241) (Cons!32240 (h!33458 (_ BitVec 64)) (t!46930 List!32244)) )
))
(declare-fun arrayNoDuplicates!0 (array!94707 (_ BitVec 32) List!32244) Bool)

(assert (=> b!1384858 (= res!925666 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32241))))

(declare-fun res!925664 () Bool)

(assert (=> start!118506 (=> (not res!925664) (not e!784981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118506 (= res!925664 (validMask!0 mask!2987))))

(assert (=> start!118506 e!784981))

(assert (=> start!118506 true))

(declare-fun array_inv!35010 (array!94707) Bool)

(assert (=> start!118506 (array_inv!35010 a!2938)))

(declare-fun b!1384859 () Bool)

(declare-fun res!925661 () Bool)

(assert (=> b!1384859 (=> (not res!925661) (not e!784981))))

(assert (=> b!1384859 (= res!925661 (and (not (= (select (arr!45729 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45729 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1384860 () Bool)

(declare-fun res!925663 () Bool)

(assert (=> b!1384860 (=> (not res!925663) (not e!784981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384860 (= res!925663 (validKeyInArray!0 (select (arr!45729 a!2938) startIndex!16)))))

(declare-fun b!1384861 () Bool)

(assert (=> b!1384861 (= e!784981 (not true))))

(declare-datatypes ((SeekEntryResult!10025 0))(
  ( (MissingZero!10025 (index!42471 (_ BitVec 32))) (Found!10025 (index!42472 (_ BitVec 32))) (Intermediate!10025 (undefined!10837 Bool) (index!42473 (_ BitVec 32)) (x!124136 (_ BitVec 32))) (Undefined!10025) (MissingVacant!10025 (index!42474 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94707 (_ BitVec 32)) SeekEntryResult!10025)

(assert (=> b!1384861 (= (seekEntryOrOpen!0 (select (arr!45729 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45729 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94708 (store (arr!45729 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46280 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46014 0))(
  ( (Unit!46015) )
))
(declare-fun lt!609111 () Unit!46014)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46014)

(assert (=> b!1384861 (= lt!609111 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1384862 () Bool)

(declare-fun res!925665 () Bool)

(assert (=> b!1384862 (=> (not res!925665) (not e!784981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94707 (_ BitVec 32)) Bool)

(assert (=> b!1384862 (= res!925665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384863 () Bool)

(declare-fun res!925662 () Bool)

(assert (=> b!1384863 (=> (not res!925662) (not e!784981))))

(assert (=> b!1384863 (= res!925662 (validKeyInArray!0 (select (arr!45729 a!2938) i!1065)))))

(assert (= (and start!118506 res!925664) b!1384857))

(assert (= (and b!1384857 res!925660) b!1384863))

(assert (= (and b!1384863 res!925662) b!1384858))

(assert (= (and b!1384858 res!925666) b!1384862))

(assert (= (and b!1384862 res!925665) b!1384859))

(assert (= (and b!1384859 res!925661) b!1384860))

(assert (= (and b!1384860 res!925663) b!1384861))

(declare-fun m!1270303 () Bool)

(assert (=> b!1384863 m!1270303))

(assert (=> b!1384863 m!1270303))

(declare-fun m!1270305 () Bool)

(assert (=> b!1384863 m!1270305))

(declare-fun m!1270307 () Bool)

(assert (=> b!1384860 m!1270307))

(assert (=> b!1384860 m!1270307))

(declare-fun m!1270309 () Bool)

(assert (=> b!1384860 m!1270309))

(declare-fun m!1270311 () Bool)

(assert (=> b!1384862 m!1270311))

(declare-fun m!1270313 () Bool)

(assert (=> b!1384861 m!1270313))

(assert (=> b!1384861 m!1270313))

(declare-fun m!1270315 () Bool)

(assert (=> b!1384861 m!1270315))

(declare-fun m!1270317 () Bool)

(assert (=> b!1384861 m!1270317))

(declare-fun m!1270319 () Bool)

(assert (=> b!1384861 m!1270319))

(assert (=> b!1384861 m!1270307))

(assert (=> b!1384861 m!1270307))

(declare-fun m!1270321 () Bool)

(assert (=> b!1384861 m!1270321))

(declare-fun m!1270323 () Bool)

(assert (=> start!118506 m!1270323))

(declare-fun m!1270325 () Bool)

(assert (=> start!118506 m!1270325))

(declare-fun m!1270327 () Bool)

(assert (=> b!1384858 m!1270327))

(assert (=> b!1384859 m!1270303))

(push 1)

(assert (not b!1384863))

(assert (not b!1384860))

(assert (not b!1384858))

(assert (not start!118506))

(assert (not b!1384861))

(assert (not b!1384862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

