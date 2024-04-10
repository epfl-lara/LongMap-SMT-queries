; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92506 () Bool)

(assert start!92506)

(declare-fun b!1052049 () Bool)

(declare-fun res!701184 () Bool)

(declare-fun e!597265 () Bool)

(assert (=> b!1052049 (=> res!701184 e!597265)))

(declare-datatypes ((List!22205 0))(
  ( (Nil!22202) (Cons!22201 (h!23410 (_ BitVec 64)) (t!31512 List!22205)) )
))
(declare-fun contains!6147 (List!22205 (_ BitVec 64)) Bool)

(assert (=> b!1052049 (= res!701184 (contains!6147 Nil!22202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!701182 () Bool)

(declare-fun e!597269 () Bool)

(assert (=> start!92506 (=> (not res!701182) (not e!597269))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66307 0))(
  ( (array!66308 (arr!31893 (Array (_ BitVec 32) (_ BitVec 64))) (size!32429 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66307)

(assert (=> start!92506 (= res!701182 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32429 a!3488)) (bvslt (size!32429 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92506 e!597269))

(assert (=> start!92506 true))

(declare-fun array_inv!24673 (array!66307) Bool)

(assert (=> start!92506 (array_inv!24673 a!3488)))

(declare-fun b!1052050 () Bool)

(declare-fun res!701180 () Bool)

(assert (=> b!1052050 (=> res!701180 e!597265)))

(declare-fun noDuplicate!1532 (List!22205) Bool)

(assert (=> b!1052050 (= res!701180 (not (noDuplicate!1532 Nil!22202)))))

(declare-fun b!1052051 () Bool)

(assert (=> b!1052051 (= e!597265 true)))

(declare-fun lt!464566 () Bool)

(assert (=> b!1052051 (= lt!464566 (contains!6147 Nil!22202 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052052 () Bool)

(declare-fun e!597271 () Bool)

(declare-fun e!597264 () Bool)

(assert (=> b!1052052 (= e!597271 (not e!597264))))

(declare-fun res!701178 () Bool)

(assert (=> b!1052052 (=> res!701178 e!597264)))

(declare-fun lt!464564 () (_ BitVec 32))

(assert (=> b!1052052 (= res!701178 (or (bvsgt lt!464564 i!1381) (bvsle i!1381 lt!464564)))))

(declare-fun e!597266 () Bool)

(assert (=> b!1052052 e!597266))

(declare-fun res!701181 () Bool)

(assert (=> b!1052052 (=> (not res!701181) (not e!597266))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1052052 (= res!701181 (= (select (store (arr!31893 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464564) k!2747))))

(declare-fun b!1052053 () Bool)

(declare-fun res!701186 () Bool)

(assert (=> b!1052053 (=> (not res!701186) (not e!597269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052053 (= res!701186 (validKeyInArray!0 k!2747))))

(declare-fun b!1052054 () Bool)

(declare-fun res!701175 () Bool)

(assert (=> b!1052054 (=> (not res!701175) (not e!597269))))

(assert (=> b!1052054 (= res!701175 (= (select (arr!31893 a!3488) i!1381) k!2747))))

(declare-fun b!1052055 () Bool)

(declare-fun res!701183 () Bool)

(assert (=> b!1052055 (=> (not res!701183) (not e!597269))))

(declare-fun arrayNoDuplicates!0 (array!66307 (_ BitVec 32) List!22205) Bool)

(assert (=> b!1052055 (= res!701183 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22202))))

(declare-fun b!1052056 () Bool)

(assert (=> b!1052056 (= e!597264 e!597265)))

(declare-fun res!701179 () Bool)

(assert (=> b!1052056 (=> res!701179 e!597265)))

(declare-fun lt!464563 () (_ BitVec 32))

(assert (=> b!1052056 (= res!701179 (or (bvslt lt!464564 #b00000000000000000000000000000000) (bvsge lt!464563 (size!32429 a!3488)) (bvsge lt!464564 (size!32429 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052056 (arrayContainsKey!0 a!3488 k!2747 lt!464563)))

(declare-datatypes ((Unit!34458 0))(
  ( (Unit!34459) )
))
(declare-fun lt!464568 () Unit!34458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66307 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34458)

(assert (=> b!1052056 (= lt!464568 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464563))))

(assert (=> b!1052056 (= lt!464563 (bvadd #b00000000000000000000000000000001 lt!464564))))

(assert (=> b!1052056 (arrayNoDuplicates!0 a!3488 lt!464564 Nil!22202)))

(declare-fun lt!464565 () Unit!34458)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66307 (_ BitVec 32) (_ BitVec 32)) Unit!34458)

(assert (=> b!1052056 (= lt!464565 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464564))))

(declare-fun e!597268 () Bool)

(declare-fun b!1052057 () Bool)

(assert (=> b!1052057 (= e!597268 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052058 () Bool)

(assert (=> b!1052058 (= e!597266 e!597268)))

(declare-fun res!701185 () Bool)

(assert (=> b!1052058 (=> res!701185 e!597268)))

(assert (=> b!1052058 (= res!701185 (or (bvsgt lt!464564 i!1381) (bvsle i!1381 lt!464564)))))

(declare-fun b!1052059 () Bool)

(declare-fun e!597267 () Bool)

(assert (=> b!1052059 (= e!597269 e!597267)))

(declare-fun res!701177 () Bool)

(assert (=> b!1052059 (=> (not res!701177) (not e!597267))))

(declare-fun lt!464567 () array!66307)

(assert (=> b!1052059 (= res!701177 (arrayContainsKey!0 lt!464567 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052059 (= lt!464567 (array!66308 (store (arr!31893 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32429 a!3488)))))

(declare-fun b!1052060 () Bool)

(assert (=> b!1052060 (= e!597267 e!597271)))

(declare-fun res!701176 () Bool)

(assert (=> b!1052060 (=> (not res!701176) (not e!597271))))

(assert (=> b!1052060 (= res!701176 (not (= lt!464564 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66307 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052060 (= lt!464564 (arrayScanForKey!0 lt!464567 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92506 res!701182) b!1052055))

(assert (= (and b!1052055 res!701183) b!1052053))

(assert (= (and b!1052053 res!701186) b!1052054))

(assert (= (and b!1052054 res!701175) b!1052059))

(assert (= (and b!1052059 res!701177) b!1052060))

(assert (= (and b!1052060 res!701176) b!1052052))

(assert (= (and b!1052052 res!701181) b!1052058))

(assert (= (and b!1052058 (not res!701185)) b!1052057))

(assert (= (and b!1052052 (not res!701178)) b!1052056))

(assert (= (and b!1052056 (not res!701179)) b!1052050))

(assert (= (and b!1052050 (not res!701180)) b!1052049))

(assert (= (and b!1052049 (not res!701184)) b!1052051))

(declare-fun m!972471 () Bool)

(assert (=> start!92506 m!972471))

(declare-fun m!972473 () Bool)

(assert (=> b!1052054 m!972473))

(declare-fun m!972475 () Bool)

(assert (=> b!1052057 m!972475))

(declare-fun m!972477 () Bool)

(assert (=> b!1052055 m!972477))

(declare-fun m!972479 () Bool)

(assert (=> b!1052052 m!972479))

(declare-fun m!972481 () Bool)

(assert (=> b!1052052 m!972481))

(declare-fun m!972483 () Bool)

(assert (=> b!1052059 m!972483))

(assert (=> b!1052059 m!972479))

(declare-fun m!972485 () Bool)

(assert (=> b!1052051 m!972485))

(declare-fun m!972487 () Bool)

(assert (=> b!1052056 m!972487))

(declare-fun m!972489 () Bool)

(assert (=> b!1052056 m!972489))

(declare-fun m!972491 () Bool)

(assert (=> b!1052056 m!972491))

(declare-fun m!972493 () Bool)

(assert (=> b!1052056 m!972493))

(declare-fun m!972495 () Bool)

(assert (=> b!1052049 m!972495))

(declare-fun m!972497 () Bool)

(assert (=> b!1052050 m!972497))

(declare-fun m!972499 () Bool)

(assert (=> b!1052053 m!972499))

(declare-fun m!972501 () Bool)

(assert (=> b!1052060 m!972501))

(push 1)

(assert (not start!92506))

(assert (not b!1052057))

(assert (not b!1052053))

(assert (not b!1052060))

(assert (not b!1052051))

(assert (not b!1052059))

(assert (not b!1052050))

