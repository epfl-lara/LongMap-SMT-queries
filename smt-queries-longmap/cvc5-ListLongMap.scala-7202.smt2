; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92274 () Bool)

(assert start!92274)

(declare-fun b!1048684 () Bool)

(declare-fun e!594850 () Bool)

(declare-fun e!594849 () Bool)

(assert (=> b!1048684 (= e!594850 e!594849)))

(declare-fun res!697816 () Bool)

(assert (=> b!1048684 (=> res!697816 e!594849)))

(declare-fun lt!463260 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048684 (= res!697816 (bvsle lt!463260 i!1381))))

(declare-fun b!1048685 () Bool)

(declare-fun res!697812 () Bool)

(declare-fun e!594848 () Bool)

(assert (=> b!1048685 (=> (not res!697812) (not e!594848))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048685 (= res!697812 (validKeyInArray!0 k!2747))))

(declare-fun b!1048686 () Bool)

(declare-fun e!594846 () Bool)

(assert (=> b!1048686 (= e!594846 (not true))))

(assert (=> b!1048686 e!594850))

(declare-fun res!697814 () Bool)

(assert (=> b!1048686 (=> (not res!697814) (not e!594850))))

(declare-datatypes ((array!66075 0))(
  ( (array!66076 (arr!31777 (Array (_ BitVec 32) (_ BitVec 64))) (size!32313 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66075)

(assert (=> b!1048686 (= res!697814 (= (select (store (arr!31777 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463260) k!2747))))

(declare-fun b!1048687 () Bool)

(declare-fun e!594845 () Bool)

(assert (=> b!1048687 (= e!594845 e!594846)))

(declare-fun res!697811 () Bool)

(assert (=> b!1048687 (=> (not res!697811) (not e!594846))))

(assert (=> b!1048687 (= res!697811 (not (= lt!463260 i!1381)))))

(declare-fun lt!463259 () array!66075)

(declare-fun arrayScanForKey!0 (array!66075 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048687 (= lt!463260 (arrayScanForKey!0 lt!463259 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048688 () Bool)

(assert (=> b!1048688 (= e!594848 e!594845)))

(declare-fun res!697817 () Bool)

(assert (=> b!1048688 (=> (not res!697817) (not e!594845))))

(declare-fun arrayContainsKey!0 (array!66075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048688 (= res!697817 (arrayContainsKey!0 lt!463259 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048688 (= lt!463259 (array!66076 (store (arr!31777 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32313 a!3488)))))

(declare-fun res!697815 () Bool)

(assert (=> start!92274 (=> (not res!697815) (not e!594848))))

(assert (=> start!92274 (= res!697815 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32313 a!3488)) (bvslt (size!32313 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92274 e!594848))

(assert (=> start!92274 true))

(declare-fun array_inv!24557 (array!66075) Bool)

(assert (=> start!92274 (array_inv!24557 a!3488)))

(declare-fun b!1048689 () Bool)

(declare-fun res!697810 () Bool)

(assert (=> b!1048689 (=> (not res!697810) (not e!594848))))

(assert (=> b!1048689 (= res!697810 (= (select (arr!31777 a!3488) i!1381) k!2747))))

(declare-fun b!1048690 () Bool)

(declare-fun res!697813 () Bool)

(assert (=> b!1048690 (=> (not res!697813) (not e!594848))))

(declare-datatypes ((List!22089 0))(
  ( (Nil!22086) (Cons!22085 (h!23294 (_ BitVec 64)) (t!31396 List!22089)) )
))
(declare-fun arrayNoDuplicates!0 (array!66075 (_ BitVec 32) List!22089) Bool)

(assert (=> b!1048690 (= res!697813 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22086))))

(declare-fun b!1048691 () Bool)

(assert (=> b!1048691 (= e!594849 (arrayContainsKey!0 a!3488 k!2747 lt!463260))))

(assert (= (and start!92274 res!697815) b!1048690))

(assert (= (and b!1048690 res!697813) b!1048685))

(assert (= (and b!1048685 res!697812) b!1048689))

(assert (= (and b!1048689 res!697810) b!1048688))

(assert (= (and b!1048688 res!697817) b!1048687))

(assert (= (and b!1048687 res!697811) b!1048686))

(assert (= (and b!1048686 res!697814) b!1048684))

(assert (= (and b!1048684 (not res!697816)) b!1048691))

(declare-fun m!969593 () Bool)

(assert (=> b!1048688 m!969593))

(declare-fun m!969595 () Bool)

(assert (=> b!1048688 m!969595))

(declare-fun m!969597 () Bool)

(assert (=> start!92274 m!969597))

(declare-fun m!969599 () Bool)

(assert (=> b!1048689 m!969599))

(declare-fun m!969601 () Bool)

(assert (=> b!1048691 m!969601))

(declare-fun m!969603 () Bool)

(assert (=> b!1048685 m!969603))

(declare-fun m!969605 () Bool)

(assert (=> b!1048690 m!969605))

(assert (=> b!1048686 m!969595))

(declare-fun m!969607 () Bool)

(assert (=> b!1048686 m!969607))

(declare-fun m!969609 () Bool)

(assert (=> b!1048687 m!969609))

(push 1)

(assert (not b!1048687))

(assert (not start!92274))

(assert (not b!1048688))

(assert (not b!1048691))

(assert (not b!1048685))

(assert (not b!1048690))

(check-sat)

