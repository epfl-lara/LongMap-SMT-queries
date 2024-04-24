; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92994 () Bool)

(assert start!92994)

(declare-fun b!1054964 () Bool)

(declare-fun res!703143 () Bool)

(declare-fun e!599288 () Bool)

(assert (=> b!1054964 (=> (not res!703143) (not e!599288))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054964 (= res!703143 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054966 () Bool)

(declare-fun res!703142 () Bool)

(assert (=> b!1054966 (=> (not res!703142) (not e!599288))))

(declare-datatypes ((array!66502 0))(
  ( (array!66503 (arr!31978 (Array (_ BitVec 32) (_ BitVec 64))) (size!32515 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66502)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054966 (= res!703142 (= (select (arr!31978 a!3488) i!1381) k0!2747))))

(declare-fun b!1054967 () Bool)

(declare-fun res!703144 () Bool)

(assert (=> b!1054967 (=> (not res!703144) (not e!599288))))

(declare-datatypes ((List!22260 0))(
  ( (Nil!22257) (Cons!22256 (h!23474 (_ BitVec 64)) (t!31559 List!22260)) )
))
(declare-fun arrayNoDuplicates!0 (array!66502 (_ BitVec 32) List!22260) Bool)

(assert (=> b!1054967 (= res!703144 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22257))))

(declare-fun b!1054968 () Bool)

(declare-fun e!599287 () Bool)

(declare-fun e!599290 () Bool)

(assert (=> b!1054968 (= e!599287 e!599290)))

(declare-fun res!703148 () Bool)

(assert (=> b!1054968 (=> res!703148 e!599290)))

(declare-fun lt!465700 () (_ BitVec 32))

(assert (=> b!1054968 (= res!703148 (bvsle lt!465700 i!1381))))

(declare-fun b!1054969 () Bool)

(declare-fun e!599286 () Bool)

(declare-fun e!599289 () Bool)

(assert (=> b!1054969 (= e!599286 e!599289)))

(declare-fun res!703145 () Bool)

(assert (=> b!1054969 (=> (not res!703145) (not e!599289))))

(assert (=> b!1054969 (= res!703145 (not (= lt!465700 i!1381)))))

(declare-fun lt!465701 () array!66502)

(declare-fun arrayScanForKey!0 (array!66502 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054969 (= lt!465700 (arrayScanForKey!0 lt!465701 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054965 () Bool)

(assert (=> b!1054965 (= e!599289 (not true))))

(assert (=> b!1054965 e!599287))

(declare-fun res!703146 () Bool)

(assert (=> b!1054965 (=> (not res!703146) (not e!599287))))

(assert (=> b!1054965 (= res!703146 (= (select (store (arr!31978 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465700) k0!2747))))

(declare-fun res!703147 () Bool)

(assert (=> start!92994 (=> (not res!703147) (not e!599288))))

(assert (=> start!92994 (= res!703147 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32515 a!3488)) (bvslt (size!32515 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92994 e!599288))

(assert (=> start!92994 true))

(declare-fun array_inv!24760 (array!66502) Bool)

(assert (=> start!92994 (array_inv!24760 a!3488)))

(declare-fun b!1054970 () Bool)

(assert (=> b!1054970 (= e!599288 e!599286)))

(declare-fun res!703141 () Bool)

(assert (=> b!1054970 (=> (not res!703141) (not e!599286))))

(declare-fun arrayContainsKey!0 (array!66502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054970 (= res!703141 (arrayContainsKey!0 lt!465701 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054970 (= lt!465701 (array!66503 (store (arr!31978 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32515 a!3488)))))

(declare-fun b!1054971 () Bool)

(assert (=> b!1054971 (= e!599290 (arrayContainsKey!0 a!3488 k0!2747 lt!465700))))

(assert (= (and start!92994 res!703147) b!1054967))

(assert (= (and b!1054967 res!703144) b!1054964))

(assert (= (and b!1054964 res!703143) b!1054966))

(assert (= (and b!1054966 res!703142) b!1054970))

(assert (= (and b!1054970 res!703141) b!1054969))

(assert (= (and b!1054969 res!703145) b!1054965))

(assert (= (and b!1054965 res!703146) b!1054968))

(assert (= (and b!1054968 (not res!703148)) b!1054971))

(declare-fun m!975551 () Bool)

(assert (=> b!1054967 m!975551))

(declare-fun m!975553 () Bool)

(assert (=> b!1054964 m!975553))

(declare-fun m!975555 () Bool)

(assert (=> start!92994 m!975555))

(declare-fun m!975557 () Bool)

(assert (=> b!1054969 m!975557))

(declare-fun m!975559 () Bool)

(assert (=> b!1054966 m!975559))

(declare-fun m!975561 () Bool)

(assert (=> b!1054965 m!975561))

(declare-fun m!975563 () Bool)

(assert (=> b!1054965 m!975563))

(declare-fun m!975565 () Bool)

(assert (=> b!1054971 m!975565))

(declare-fun m!975567 () Bool)

(assert (=> b!1054970 m!975567))

(assert (=> b!1054970 m!975561))

(check-sat (not b!1054969) (not b!1054970) (not start!92994) (not b!1054964) (not b!1054967) (not b!1054971))
(check-sat)
