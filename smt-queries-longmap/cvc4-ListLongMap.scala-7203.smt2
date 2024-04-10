; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92284 () Bool)

(assert start!92284)

(declare-fun b!1048804 () Bool)

(declare-fun res!697931 () Bool)

(declare-fun e!594938 () Bool)

(assert (=> b!1048804 (=> (not res!697931) (not e!594938))))

(declare-datatypes ((array!66085 0))(
  ( (array!66086 (arr!31782 (Array (_ BitVec 32) (_ BitVec 64))) (size!32318 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66085)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048804 (= res!697931 (= (select (arr!31782 a!3488) i!1381) k!2747))))

(declare-fun b!1048805 () Bool)

(declare-fun res!697936 () Bool)

(assert (=> b!1048805 (=> (not res!697936) (not e!594938))))

(declare-datatypes ((List!22094 0))(
  ( (Nil!22091) (Cons!22090 (h!23299 (_ BitVec 64)) (t!31401 List!22094)) )
))
(declare-fun arrayNoDuplicates!0 (array!66085 (_ BitVec 32) List!22094) Bool)

(assert (=> b!1048805 (= res!697936 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22091))))

(declare-fun b!1048806 () Bool)

(declare-fun e!594939 () Bool)

(declare-fun e!594936 () Bool)

(assert (=> b!1048806 (= e!594939 e!594936)))

(declare-fun res!697937 () Bool)

(assert (=> b!1048806 (=> res!697937 e!594936)))

(declare-fun lt!463289 () (_ BitVec 32))

(assert (=> b!1048806 (= res!697937 (bvsle lt!463289 i!1381))))

(declare-fun b!1048807 () Bool)

(declare-fun e!594937 () Bool)

(declare-fun e!594940 () Bool)

(assert (=> b!1048807 (= e!594937 e!594940)))

(declare-fun res!697932 () Bool)

(assert (=> b!1048807 (=> (not res!697932) (not e!594940))))

(assert (=> b!1048807 (= res!697932 (not (= lt!463289 i!1381)))))

(declare-fun lt!463290 () array!66085)

(declare-fun arrayScanForKey!0 (array!66085 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048807 (= lt!463289 (arrayScanForKey!0 lt!463290 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!697930 () Bool)

(assert (=> start!92284 (=> (not res!697930) (not e!594938))))

(assert (=> start!92284 (= res!697930 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32318 a!3488)) (bvslt (size!32318 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92284 e!594938))

(assert (=> start!92284 true))

(declare-fun array_inv!24562 (array!66085) Bool)

(assert (=> start!92284 (array_inv!24562 a!3488)))

(declare-fun b!1048808 () Bool)

(declare-fun arrayContainsKey!0 (array!66085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048808 (= e!594936 (arrayContainsKey!0 a!3488 k!2747 lt!463289))))

(declare-fun b!1048809 () Bool)

(assert (=> b!1048809 (= e!594938 e!594937)))

(declare-fun res!697935 () Bool)

(assert (=> b!1048809 (=> (not res!697935) (not e!594937))))

(assert (=> b!1048809 (= res!697935 (arrayContainsKey!0 lt!463290 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048809 (= lt!463290 (array!66086 (store (arr!31782 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32318 a!3488)))))

(declare-fun b!1048810 () Bool)

(assert (=> b!1048810 (= e!594940 (not true))))

(assert (=> b!1048810 e!594939))

(declare-fun res!697934 () Bool)

(assert (=> b!1048810 (=> (not res!697934) (not e!594939))))

(assert (=> b!1048810 (= res!697934 (= (select (store (arr!31782 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463289) k!2747))))

(declare-fun b!1048811 () Bool)

(declare-fun res!697933 () Bool)

(assert (=> b!1048811 (=> (not res!697933) (not e!594938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048811 (= res!697933 (validKeyInArray!0 k!2747))))

(assert (= (and start!92284 res!697930) b!1048805))

(assert (= (and b!1048805 res!697936) b!1048811))

(assert (= (and b!1048811 res!697933) b!1048804))

(assert (= (and b!1048804 res!697931) b!1048809))

(assert (= (and b!1048809 res!697935) b!1048807))

(assert (= (and b!1048807 res!697932) b!1048810))

(assert (= (and b!1048810 res!697934) b!1048806))

(assert (= (and b!1048806 (not res!697937)) b!1048808))

(declare-fun m!969683 () Bool)

(assert (=> b!1048807 m!969683))

(declare-fun m!969685 () Bool)

(assert (=> b!1048809 m!969685))

(declare-fun m!969687 () Bool)

(assert (=> b!1048809 m!969687))

(declare-fun m!969689 () Bool)

(assert (=> b!1048804 m!969689))

(declare-fun m!969691 () Bool)

(assert (=> b!1048805 m!969691))

(declare-fun m!969693 () Bool)

(assert (=> b!1048811 m!969693))

(declare-fun m!969695 () Bool)

(assert (=> start!92284 m!969695))

(declare-fun m!969697 () Bool)

(assert (=> b!1048808 m!969697))

(assert (=> b!1048810 m!969687))

(declare-fun m!969699 () Bool)

(assert (=> b!1048810 m!969699))

(push 1)

(assert (not b!1048809))

(assert (not b!1048807))

