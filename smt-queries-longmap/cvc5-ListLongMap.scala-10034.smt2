; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118308 () Bool)

(assert start!118308)

(declare-fun b!1383696 () Bool)

(declare-fun res!925290 () Bool)

(declare-fun e!784175 () Bool)

(assert (=> b!1383696 (=> (not res!925290) (not e!784175))))

(declare-datatypes ((array!94611 0))(
  ( (array!94612 (arr!45683 (Array (_ BitVec 32) (_ BitVec 64))) (size!46233 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94611)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94611 (_ BitVec 32)) Bool)

(assert (=> b!1383696 (= res!925290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383697 () Bool)

(declare-fun res!925293 () Bool)

(assert (=> b!1383697 (=> (not res!925293) (not e!784175))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383697 (= res!925293 (validKeyInArray!0 (select (arr!45683 a!2938) startIndex!16)))))

(declare-fun b!1383698 () Bool)

(declare-fun res!925294 () Bool)

(assert (=> b!1383698 (=> (not res!925294) (not e!784175))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383698 (= res!925294 (validKeyInArray!0 (select (arr!45683 a!2938) i!1065)))))

(declare-fun res!925291 () Bool)

(assert (=> start!118308 (=> (not res!925291) (not e!784175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118308 (= res!925291 (validMask!0 mask!2987))))

(assert (=> start!118308 e!784175))

(assert (=> start!118308 true))

(declare-fun array_inv!34711 (array!94611) Bool)

(assert (=> start!118308 (array_inv!34711 a!2938)))

(declare-fun b!1383699 () Bool)

(assert (=> b!1383699 (= e!784175 (not true))))

(declare-datatypes ((SeekEntryResult!10076 0))(
  ( (MissingZero!10076 (index!42675 (_ BitVec 32))) (Found!10076 (index!42676 (_ BitVec 32))) (Intermediate!10076 (undefined!10888 Bool) (index!42677 (_ BitVec 32)) (x!124189 (_ BitVec 32))) (Undefined!10076) (MissingVacant!10076 (index!42678 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94611 (_ BitVec 32)) SeekEntryResult!10076)

(assert (=> b!1383699 (= (seekEntryOrOpen!0 (select (arr!45683 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45683 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94612 (store (arr!45683 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46233 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46089 0))(
  ( (Unit!46090) )
))
(declare-fun lt!608652 () Unit!46089)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46089)

(assert (=> b!1383699 (= lt!608652 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383700 () Bool)

(declare-fun res!925289 () Bool)

(assert (=> b!1383700 (=> (not res!925289) (not e!784175))))

(declare-datatypes ((List!32211 0))(
  ( (Nil!32208) (Cons!32207 (h!33416 (_ BitVec 64)) (t!46905 List!32211)) )
))
(declare-fun arrayNoDuplicates!0 (array!94611 (_ BitVec 32) List!32211) Bool)

(assert (=> b!1383700 (= res!925289 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32208))))

(declare-fun b!1383701 () Bool)

(declare-fun res!925292 () Bool)

(assert (=> b!1383701 (=> (not res!925292) (not e!784175))))

(assert (=> b!1383701 (= res!925292 (and (= (size!46233 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46233 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46233 a!2938))))))

(declare-fun b!1383702 () Bool)

(declare-fun res!925288 () Bool)

(assert (=> b!1383702 (=> (not res!925288) (not e!784175))))

(assert (=> b!1383702 (= res!925288 (and (not (= (select (arr!45683 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45683 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(assert (= (and start!118308 res!925291) b!1383701))

(assert (= (and b!1383701 res!925292) b!1383698))

(assert (= (and b!1383698 res!925294) b!1383700))

(assert (= (and b!1383700 res!925289) b!1383696))

(assert (= (and b!1383696 res!925290) b!1383702))

(assert (= (and b!1383702 res!925288) b!1383697))

(assert (= (and b!1383697 res!925293) b!1383699))

(declare-fun m!1268853 () Bool)

(assert (=> b!1383696 m!1268853))

(declare-fun m!1268855 () Bool)

(assert (=> b!1383699 m!1268855))

(assert (=> b!1383699 m!1268855))

(declare-fun m!1268857 () Bool)

(assert (=> b!1383699 m!1268857))

(declare-fun m!1268859 () Bool)

(assert (=> b!1383699 m!1268859))

(declare-fun m!1268861 () Bool)

(assert (=> b!1383699 m!1268861))

(declare-fun m!1268863 () Bool)

(assert (=> b!1383699 m!1268863))

(assert (=> b!1383699 m!1268863))

(declare-fun m!1268865 () Bool)

(assert (=> b!1383699 m!1268865))

(assert (=> b!1383697 m!1268863))

(assert (=> b!1383697 m!1268863))

(declare-fun m!1268867 () Bool)

(assert (=> b!1383697 m!1268867))

(declare-fun m!1268869 () Bool)

(assert (=> b!1383700 m!1268869))

(declare-fun m!1268871 () Bool)

(assert (=> b!1383698 m!1268871))

(assert (=> b!1383698 m!1268871))

(declare-fun m!1268873 () Bool)

(assert (=> b!1383698 m!1268873))

(assert (=> b!1383702 m!1268871))

(declare-fun m!1268875 () Bool)

(assert (=> start!118308 m!1268875))

(declare-fun m!1268877 () Bool)

(assert (=> start!118308 m!1268877))

(push 1)

(assert (not b!1383697))

(assert (not b!1383696))

(assert (not b!1383698))

(assert (not b!1383700))

(assert (not start!118308))

(assert (not b!1383699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

