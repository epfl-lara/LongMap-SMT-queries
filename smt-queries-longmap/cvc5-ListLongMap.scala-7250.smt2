; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92562 () Bool)

(assert start!92562)

(declare-fun b!1052856 () Bool)

(declare-fun e!597831 () Bool)

(declare-fun e!597832 () Bool)

(assert (=> b!1052856 (= e!597831 e!597832)))

(declare-fun res!701987 () Bool)

(assert (=> b!1052856 (=> (not res!701987) (not e!597832))))

(declare-fun lt!464988 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052856 (= res!701987 (not (= lt!464988 i!1381)))))

(declare-datatypes ((array!66363 0))(
  ( (array!66364 (arr!31921 (Array (_ BitVec 32) (_ BitVec 64))) (size!32457 (_ BitVec 32))) )
))
(declare-fun lt!464987 () array!66363)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66363 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052856 (= lt!464988 (arrayScanForKey!0 lt!464987 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052857 () Bool)

(declare-fun e!597829 () Bool)

(assert (=> b!1052857 (= e!597829 e!597831)))

(declare-fun res!701982 () Bool)

(assert (=> b!1052857 (=> (not res!701982) (not e!597831))))

(declare-fun arrayContainsKey!0 (array!66363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052857 (= res!701982 (arrayContainsKey!0 lt!464987 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66363)

(assert (=> b!1052857 (= lt!464987 (array!66364 (store (arr!31921 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32457 a!3488)))))

(declare-fun b!1052858 () Bool)

(declare-fun res!701983 () Bool)

(assert (=> b!1052858 (=> (not res!701983) (not e!597829))))

(declare-datatypes ((List!22233 0))(
  ( (Nil!22230) (Cons!22229 (h!23438 (_ BitVec 64)) (t!31540 List!22233)) )
))
(declare-fun arrayNoDuplicates!0 (array!66363 (_ BitVec 32) List!22233) Bool)

(assert (=> b!1052858 (= res!701983 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22230))))

(declare-fun b!1052860 () Bool)

(assert (=> b!1052860 (= e!597832 (not true))))

(assert (=> b!1052860 (= (select (store (arr!31921 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464988) k!2747)))

(declare-fun b!1052861 () Bool)

(declare-fun res!701985 () Bool)

(assert (=> b!1052861 (=> (not res!701985) (not e!597829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052861 (= res!701985 (validKeyInArray!0 k!2747))))

(declare-fun b!1052859 () Bool)

(declare-fun res!701984 () Bool)

(assert (=> b!1052859 (=> (not res!701984) (not e!597829))))

(assert (=> b!1052859 (= res!701984 (= (select (arr!31921 a!3488) i!1381) k!2747))))

(declare-fun res!701986 () Bool)

(assert (=> start!92562 (=> (not res!701986) (not e!597829))))

(assert (=> start!92562 (= res!701986 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32457 a!3488)) (bvslt (size!32457 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92562 e!597829))

(assert (=> start!92562 true))

(declare-fun array_inv!24701 (array!66363) Bool)

(assert (=> start!92562 (array_inv!24701 a!3488)))

(assert (= (and start!92562 res!701986) b!1052858))

(assert (= (and b!1052858 res!701983) b!1052861))

(assert (= (and b!1052861 res!701985) b!1052859))

(assert (= (and b!1052859 res!701984) b!1052857))

(assert (= (and b!1052857 res!701982) b!1052856))

(assert (= (and b!1052856 res!701987) b!1052860))

(declare-fun m!973253 () Bool)

(assert (=> b!1052859 m!973253))

(declare-fun m!973255 () Bool)

(assert (=> b!1052861 m!973255))

(declare-fun m!973257 () Bool)

(assert (=> b!1052860 m!973257))

(declare-fun m!973259 () Bool)

(assert (=> b!1052860 m!973259))

(declare-fun m!973261 () Bool)

(assert (=> b!1052857 m!973261))

(assert (=> b!1052857 m!973257))

(declare-fun m!973263 () Bool)

(assert (=> b!1052858 m!973263))

(declare-fun m!973265 () Bool)

(assert (=> start!92562 m!973265))

(declare-fun m!973267 () Bool)

(assert (=> b!1052856 m!973267))

(push 1)

(assert (not b!1052856))

(assert (not b!1052858))

(assert (not b!1052857))

(assert (not start!92562))

(assert (not b!1052861))

(check-sat)

(pop 1)

