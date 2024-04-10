; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118312 () Bool)

(assert start!118312)

(declare-fun b!1383738 () Bool)

(declare-fun res!925333 () Bool)

(declare-fun e!784186 () Bool)

(assert (=> b!1383738 (=> (not res!925333) (not e!784186))))

(declare-datatypes ((array!94615 0))(
  ( (array!94616 (arr!45685 (Array (_ BitVec 32) (_ BitVec 64))) (size!46235 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94615)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383738 (= res!925333 (validKeyInArray!0 (select (arr!45685 a!2938) i!1065)))))

(declare-fun res!925332 () Bool)

(assert (=> start!118312 (=> (not res!925332) (not e!784186))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118312 (= res!925332 (validMask!0 mask!2987))))

(assert (=> start!118312 e!784186))

(assert (=> start!118312 true))

(declare-fun array_inv!34713 (array!94615) Bool)

(assert (=> start!118312 (array_inv!34713 a!2938)))

(declare-fun b!1383739 () Bool)

(declare-fun res!925334 () Bool)

(assert (=> b!1383739 (=> (not res!925334) (not e!784186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94615 (_ BitVec 32)) Bool)

(assert (=> b!1383739 (= res!925334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383740 () Bool)

(declare-fun res!925330 () Bool)

(assert (=> b!1383740 (=> (not res!925330) (not e!784186))))

(declare-datatypes ((List!32213 0))(
  ( (Nil!32210) (Cons!32209 (h!33418 (_ BitVec 64)) (t!46907 List!32213)) )
))
(declare-fun arrayNoDuplicates!0 (array!94615 (_ BitVec 32) List!32213) Bool)

(assert (=> b!1383740 (= res!925330 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32210))))

(declare-fun b!1383741 () Bool)

(declare-fun res!925335 () Bool)

(assert (=> b!1383741 (=> (not res!925335) (not e!784186))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383741 (= res!925335 (and (not (= (select (arr!45685 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45685 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383742 () Bool)

(assert (=> b!1383742 (= e!784186 (not true))))

(declare-datatypes ((SeekEntryResult!10078 0))(
  ( (MissingZero!10078 (index!42683 (_ BitVec 32))) (Found!10078 (index!42684 (_ BitVec 32))) (Intermediate!10078 (undefined!10890 Bool) (index!42685 (_ BitVec 32)) (x!124191 (_ BitVec 32))) (Undefined!10078) (MissingVacant!10078 (index!42686 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94615 (_ BitVec 32)) SeekEntryResult!10078)

(assert (=> b!1383742 (= (seekEntryOrOpen!0 (select (arr!45685 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45685 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94616 (store (arr!45685 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46235 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46093 0))(
  ( (Unit!46094) )
))
(declare-fun lt!608658 () Unit!46093)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46093)

(assert (=> b!1383742 (= lt!608658 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383743 () Bool)

(declare-fun res!925336 () Bool)

(assert (=> b!1383743 (=> (not res!925336) (not e!784186))))

(assert (=> b!1383743 (= res!925336 (validKeyInArray!0 (select (arr!45685 a!2938) startIndex!16)))))

(declare-fun b!1383744 () Bool)

(declare-fun res!925331 () Bool)

(assert (=> b!1383744 (=> (not res!925331) (not e!784186))))

(assert (=> b!1383744 (= res!925331 (and (= (size!46235 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46235 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46235 a!2938))))))

(assert (= (and start!118312 res!925332) b!1383744))

(assert (= (and b!1383744 res!925331) b!1383738))

(assert (= (and b!1383738 res!925333) b!1383740))

(assert (= (and b!1383740 res!925330) b!1383739))

(assert (= (and b!1383739 res!925334) b!1383741))

(assert (= (and b!1383741 res!925335) b!1383743))

(assert (= (and b!1383743 res!925336) b!1383742))

(declare-fun m!1268905 () Bool)

(assert (=> b!1383738 m!1268905))

(assert (=> b!1383738 m!1268905))

(declare-fun m!1268907 () Bool)

(assert (=> b!1383738 m!1268907))

(assert (=> b!1383741 m!1268905))

(declare-fun m!1268909 () Bool)

(assert (=> b!1383739 m!1268909))

(declare-fun m!1268911 () Bool)

(assert (=> start!118312 m!1268911))

(declare-fun m!1268913 () Bool)

(assert (=> start!118312 m!1268913))

(declare-fun m!1268915 () Bool)

(assert (=> b!1383742 m!1268915))

(assert (=> b!1383742 m!1268915))

(declare-fun m!1268917 () Bool)

(assert (=> b!1383742 m!1268917))

(declare-fun m!1268919 () Bool)

(assert (=> b!1383742 m!1268919))

(declare-fun m!1268921 () Bool)

(assert (=> b!1383742 m!1268921))

(declare-fun m!1268923 () Bool)

(assert (=> b!1383742 m!1268923))

(assert (=> b!1383742 m!1268923))

(declare-fun m!1268925 () Bool)

(assert (=> b!1383742 m!1268925))

(assert (=> b!1383743 m!1268923))

(assert (=> b!1383743 m!1268923))

(declare-fun m!1268927 () Bool)

(assert (=> b!1383743 m!1268927))

(declare-fun m!1268929 () Bool)

(assert (=> b!1383740 m!1268929))

(push 1)

(assert (not b!1383740))

(assert (not b!1383739))

(assert (not start!118312))

(assert (not b!1383742))

(assert (not b!1383738))

(assert (not b!1383743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

