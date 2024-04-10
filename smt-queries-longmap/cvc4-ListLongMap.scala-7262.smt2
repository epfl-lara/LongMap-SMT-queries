; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92758 () Bool)

(assert start!92758)

(declare-fun b!1053625 () Bool)

(declare-fun lt!465180 () (_ BitVec 32))

(declare-datatypes ((array!66451 0))(
  ( (array!66452 (arr!31959 (Array (_ BitVec 32) (_ BitVec 64))) (size!32495 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66451)

(declare-fun e!598428 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053625 (= e!598428 (arrayContainsKey!0 a!3488 k!2747 lt!465180))))

(declare-fun b!1053626 () Bool)

(declare-fun e!598427 () Bool)

(assert (=> b!1053626 (= e!598427 e!598428)))

(declare-fun res!702612 () Bool)

(assert (=> b!1053626 (=> res!702612 e!598428)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053626 (= res!702612 (bvsle lt!465180 i!1381))))

(declare-fun b!1053627 () Bool)

(declare-fun e!598429 () Bool)

(declare-fun e!598425 () Bool)

(assert (=> b!1053627 (= e!598429 e!598425)))

(declare-fun res!702611 () Bool)

(assert (=> b!1053627 (=> (not res!702611) (not e!598425))))

(assert (=> b!1053627 (= res!702611 (not (= lt!465180 i!1381)))))

(declare-fun lt!465179 () array!66451)

(declare-fun arrayScanForKey!0 (array!66451 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053627 (= lt!465180 (arrayScanForKey!0 lt!465179 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053628 () Bool)

(declare-fun res!702609 () Bool)

(declare-fun e!598424 () Bool)

(assert (=> b!1053628 (=> (not res!702609) (not e!598424))))

(assert (=> b!1053628 (= res!702609 (= (select (arr!31959 a!3488) i!1381) k!2747))))

(declare-fun b!1053629 () Bool)

(assert (=> b!1053629 (= e!598425 (not true))))

(assert (=> b!1053629 e!598427))

(declare-fun res!702607 () Bool)

(assert (=> b!1053629 (=> (not res!702607) (not e!598427))))

(assert (=> b!1053629 (= res!702607 (= (select (store (arr!31959 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465180) k!2747))))

(declare-fun res!702613 () Bool)

(assert (=> start!92758 (=> (not res!702613) (not e!598424))))

(assert (=> start!92758 (= res!702613 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32495 a!3488)) (bvslt (size!32495 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92758 e!598424))

(assert (=> start!92758 true))

(declare-fun array_inv!24739 (array!66451) Bool)

(assert (=> start!92758 (array_inv!24739 a!3488)))

(declare-fun b!1053630 () Bool)

(declare-fun res!702608 () Bool)

(assert (=> b!1053630 (=> (not res!702608) (not e!598424))))

(declare-datatypes ((List!22271 0))(
  ( (Nil!22268) (Cons!22267 (h!23476 (_ BitVec 64)) (t!31578 List!22271)) )
))
(declare-fun arrayNoDuplicates!0 (array!66451 (_ BitVec 32) List!22271) Bool)

(assert (=> b!1053630 (= res!702608 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22268))))

(declare-fun b!1053631 () Bool)

(assert (=> b!1053631 (= e!598424 e!598429)))

(declare-fun res!702610 () Bool)

(assert (=> b!1053631 (=> (not res!702610) (not e!598429))))

(assert (=> b!1053631 (= res!702610 (arrayContainsKey!0 lt!465179 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053631 (= lt!465179 (array!66452 (store (arr!31959 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32495 a!3488)))))

(declare-fun b!1053632 () Bool)

(declare-fun res!702614 () Bool)

(assert (=> b!1053632 (=> (not res!702614) (not e!598424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053632 (= res!702614 (validKeyInArray!0 k!2747))))

(assert (= (and start!92758 res!702613) b!1053630))

(assert (= (and b!1053630 res!702608) b!1053632))

(assert (= (and b!1053632 res!702614) b!1053628))

(assert (= (and b!1053628 res!702609) b!1053631))

(assert (= (and b!1053631 res!702610) b!1053627))

(assert (= (and b!1053627 res!702611) b!1053629))

(assert (= (and b!1053629 res!702607) b!1053626))

(assert (= (and b!1053626 (not res!702612)) b!1053625))

(declare-fun m!973865 () Bool)

(assert (=> b!1053630 m!973865))

(declare-fun m!973867 () Bool)

(assert (=> b!1053631 m!973867))

(declare-fun m!973869 () Bool)

(assert (=> b!1053631 m!973869))

(declare-fun m!973871 () Bool)

(assert (=> b!1053625 m!973871))

(assert (=> b!1053629 m!973869))

(declare-fun m!973873 () Bool)

(assert (=> b!1053629 m!973873))

(declare-fun m!973875 () Bool)

(assert (=> start!92758 m!973875))

(declare-fun m!973877 () Bool)

(assert (=> b!1053628 m!973877))

(declare-fun m!973879 () Bool)

(assert (=> b!1053627 m!973879))

(declare-fun m!973881 () Bool)

(assert (=> b!1053632 m!973881))

(push 1)

(assert (not b!1053630))

(assert (not b!1053631))

(assert (not b!1053632))

