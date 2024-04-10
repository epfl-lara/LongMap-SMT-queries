; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92272 () Bool)

(assert start!92272)

(declare-fun b!1048660 () Bool)

(declare-fun e!594828 () Bool)

(declare-fun e!594829 () Bool)

(assert (=> b!1048660 (= e!594828 e!594829)))

(declare-fun res!697791 () Bool)

(assert (=> b!1048660 (=> res!697791 e!594829)))

(declare-fun lt!463253 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048660 (= res!697791 (bvsle lt!463253 i!1381))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-datatypes ((array!66073 0))(
  ( (array!66074 (arr!31776 (Array (_ BitVec 32) (_ BitVec 64))) (size!32312 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66073)

(declare-fun b!1048661 () Bool)

(declare-fun arrayContainsKey!0 (array!66073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048661 (= e!594829 (arrayContainsKey!0 a!3488 k!2747 lt!463253))))

(declare-fun b!1048662 () Bool)

(declare-fun e!594832 () Bool)

(declare-fun e!594830 () Bool)

(assert (=> b!1048662 (= e!594832 e!594830)))

(declare-fun res!697792 () Bool)

(assert (=> b!1048662 (=> (not res!697792) (not e!594830))))

(declare-fun lt!463254 () array!66073)

(assert (=> b!1048662 (= res!697792 (arrayContainsKey!0 lt!463254 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048662 (= lt!463254 (array!66074 (store (arr!31776 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32312 a!3488)))))

(declare-fun b!1048663 () Bool)

(declare-fun res!697790 () Bool)

(assert (=> b!1048663 (=> (not res!697790) (not e!594832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048663 (= res!697790 (validKeyInArray!0 k!2747))))

(declare-fun res!697788 () Bool)

(assert (=> start!92272 (=> (not res!697788) (not e!594832))))

(assert (=> start!92272 (= res!697788 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32312 a!3488)) (bvslt (size!32312 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92272 e!594832))

(assert (=> start!92272 true))

(declare-fun array_inv!24556 (array!66073) Bool)

(assert (=> start!92272 (array_inv!24556 a!3488)))

(declare-fun b!1048664 () Bool)

(declare-fun e!594831 () Bool)

(assert (=> b!1048664 (= e!594831 (not true))))

(assert (=> b!1048664 e!594828))

(declare-fun res!697789 () Bool)

(assert (=> b!1048664 (=> (not res!697789) (not e!594828))))

(assert (=> b!1048664 (= res!697789 (= (select (store (arr!31776 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463253) k!2747))))

(declare-fun b!1048665 () Bool)

(assert (=> b!1048665 (= e!594830 e!594831)))

(declare-fun res!697793 () Bool)

(assert (=> b!1048665 (=> (not res!697793) (not e!594831))))

(assert (=> b!1048665 (= res!697793 (not (= lt!463253 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66073 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048665 (= lt!463253 (arrayScanForKey!0 lt!463254 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048666 () Bool)

(declare-fun res!697787 () Bool)

(assert (=> b!1048666 (=> (not res!697787) (not e!594832))))

(assert (=> b!1048666 (= res!697787 (= (select (arr!31776 a!3488) i!1381) k!2747))))

(declare-fun b!1048667 () Bool)

(declare-fun res!697786 () Bool)

(assert (=> b!1048667 (=> (not res!697786) (not e!594832))))

(declare-datatypes ((List!22088 0))(
  ( (Nil!22085) (Cons!22084 (h!23293 (_ BitVec 64)) (t!31395 List!22088)) )
))
(declare-fun arrayNoDuplicates!0 (array!66073 (_ BitVec 32) List!22088) Bool)

(assert (=> b!1048667 (= res!697786 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22085))))

(assert (= (and start!92272 res!697788) b!1048667))

(assert (= (and b!1048667 res!697786) b!1048663))

(assert (= (and b!1048663 res!697790) b!1048666))

(assert (= (and b!1048666 res!697787) b!1048662))

(assert (= (and b!1048662 res!697792) b!1048665))

(assert (= (and b!1048665 res!697793) b!1048664))

(assert (= (and b!1048664 res!697789) b!1048660))

(assert (= (and b!1048660 (not res!697791)) b!1048661))

(declare-fun m!969575 () Bool)

(assert (=> b!1048665 m!969575))

(declare-fun m!969577 () Bool)

(assert (=> b!1048667 m!969577))

(declare-fun m!969579 () Bool)

(assert (=> b!1048666 m!969579))

(declare-fun m!969581 () Bool)

(assert (=> b!1048662 m!969581))

(declare-fun m!969583 () Bool)

(assert (=> b!1048662 m!969583))

(assert (=> b!1048664 m!969583))

(declare-fun m!969585 () Bool)

(assert (=> b!1048664 m!969585))

(declare-fun m!969587 () Bool)

(assert (=> start!92272 m!969587))

(declare-fun m!969589 () Bool)

(assert (=> b!1048663 m!969589))

(declare-fun m!969591 () Bool)

(assert (=> b!1048661 m!969591))

(push 1)

