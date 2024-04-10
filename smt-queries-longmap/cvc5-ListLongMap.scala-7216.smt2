; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92358 () Bool)

(assert start!92358)

(declare-fun b!1049970 () Bool)

(declare-fun e!595767 () Bool)

(declare-fun e!595772 () Bool)

(assert (=> b!1049970 (= e!595767 e!595772)))

(declare-fun res!699101 () Bool)

(assert (=> b!1049970 (=> res!699101 e!595772)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66159 0))(
  ( (array!66160 (arr!31819 (Array (_ BitVec 32) (_ BitVec 64))) (size!32355 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66159)

(assert (=> b!1049970 (= res!699101 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32355 a!3488)))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049970 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463737 () (_ BitVec 32))

(declare-datatypes ((Unit!34358 0))(
  ( (Unit!34359) )
))
(declare-fun lt!463733 () Unit!34358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66159 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34358)

(assert (=> b!1049970 (= lt!463733 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463737 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22131 0))(
  ( (Nil!22128) (Cons!22127 (h!23336 (_ BitVec 64)) (t!31438 List!22131)) )
))
(declare-fun arrayNoDuplicates!0 (array!66159 (_ BitVec 32) List!22131) Bool)

(assert (=> b!1049970 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22128)))

(declare-fun lt!463734 () Unit!34358)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66159 (_ BitVec 32) (_ BitVec 32)) Unit!34358)

(assert (=> b!1049970 (= lt!463734 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun e!595768 () Bool)

(declare-fun b!1049971 () Bool)

(assert (=> b!1049971 (= e!595768 (arrayContainsKey!0 a!3488 k!2747 lt!463737))))

(declare-fun b!1049972 () Bool)

(declare-fun e!595774 () Bool)

(assert (=> b!1049972 (= e!595774 (not e!595767))))

(declare-fun res!699096 () Bool)

(assert (=> b!1049972 (=> res!699096 e!595767)))

(assert (=> b!1049972 (= res!699096 (bvsle lt!463737 i!1381))))

(declare-fun e!595770 () Bool)

(assert (=> b!1049972 e!595770))

(declare-fun res!699105 () Bool)

(assert (=> b!1049972 (=> (not res!699105) (not e!595770))))

(assert (=> b!1049972 (= res!699105 (= (select (store (arr!31819 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463737) k!2747))))

(declare-fun b!1049973 () Bool)

(declare-fun e!595769 () Bool)

(assert (=> b!1049973 (= e!595769 e!595774)))

(declare-fun res!699097 () Bool)

(assert (=> b!1049973 (=> (not res!699097) (not e!595774))))

(assert (=> b!1049973 (= res!699097 (not (= lt!463737 i!1381)))))

(declare-fun lt!463735 () array!66159)

(declare-fun arrayScanForKey!0 (array!66159 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049973 (= lt!463737 (arrayScanForKey!0 lt!463735 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049974 () Bool)

(declare-fun res!699104 () Bool)

(declare-fun e!595773 () Bool)

(assert (=> b!1049974 (=> (not res!699104) (not e!595773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049974 (= res!699104 (validKeyInArray!0 k!2747))))

(declare-fun b!1049975 () Bool)

(declare-fun res!699098 () Bool)

(assert (=> b!1049975 (=> (not res!699098) (not e!595773))))

(assert (=> b!1049975 (= res!699098 (= (select (arr!31819 a!3488) i!1381) k!2747))))

(declare-fun b!1049976 () Bool)

(assert (=> b!1049976 (= e!595773 e!595769)))

(declare-fun res!699103 () Bool)

(assert (=> b!1049976 (=> (not res!699103) (not e!595769))))

(assert (=> b!1049976 (= res!699103 (arrayContainsKey!0 lt!463735 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049976 (= lt!463735 (array!66160 (store (arr!31819 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32355 a!3488)))))

(declare-fun b!1049977 () Bool)

(declare-fun res!699102 () Bool)

(assert (=> b!1049977 (=> (not res!699102) (not e!595773))))

(assert (=> b!1049977 (= res!699102 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22128))))

(declare-fun res!699099 () Bool)

(assert (=> start!92358 (=> (not res!699099) (not e!595773))))

(assert (=> start!92358 (= res!699099 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32355 a!3488)) (bvslt (size!32355 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92358 e!595773))

(assert (=> start!92358 true))

(declare-fun array_inv!24599 (array!66159) Bool)

(assert (=> start!92358 (array_inv!24599 a!3488)))

(declare-fun b!1049978 () Bool)

(assert (=> b!1049978 (= e!595770 e!595768)))

(declare-fun res!699107 () Bool)

(assert (=> b!1049978 (=> res!699107 e!595768)))

(assert (=> b!1049978 (= res!699107 (bvsle lt!463737 i!1381))))

(declare-fun b!1049979 () Bool)

(declare-fun res!699100 () Bool)

(assert (=> b!1049979 (=> res!699100 e!595772)))

(declare-fun contains!6124 (List!22131 (_ BitVec 64)) Bool)

(assert (=> b!1049979 (= res!699100 (contains!6124 Nil!22128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049980 () Bool)

(assert (=> b!1049980 (= e!595772 true)))

(declare-fun lt!463736 () Bool)

(assert (=> b!1049980 (= lt!463736 (contains!6124 Nil!22128 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049981 () Bool)

(declare-fun res!699106 () Bool)

(assert (=> b!1049981 (=> res!699106 e!595772)))

(declare-fun noDuplicate!1509 (List!22131) Bool)

(assert (=> b!1049981 (= res!699106 (not (noDuplicate!1509 Nil!22128)))))

(assert (= (and start!92358 res!699099) b!1049977))

(assert (= (and b!1049977 res!699102) b!1049974))

(assert (= (and b!1049974 res!699104) b!1049975))

(assert (= (and b!1049975 res!699098) b!1049976))

(assert (= (and b!1049976 res!699103) b!1049973))

(assert (= (and b!1049973 res!699097) b!1049972))

(assert (= (and b!1049972 res!699105) b!1049978))

(assert (= (and b!1049978 (not res!699107)) b!1049971))

(assert (= (and b!1049972 (not res!699096)) b!1049970))

(assert (= (and b!1049970 (not res!699101)) b!1049981))

(assert (= (and b!1049981 (not res!699106)) b!1049979))

(assert (= (and b!1049979 (not res!699100)) b!1049980))

(declare-fun m!970673 () Bool)

(assert (=> b!1049974 m!970673))

(declare-fun m!970675 () Bool)

(assert (=> b!1049976 m!970675))

(declare-fun m!970677 () Bool)

(assert (=> b!1049976 m!970677))

(declare-fun m!970679 () Bool)

(assert (=> b!1049980 m!970679))

(declare-fun m!970681 () Bool)

(assert (=> b!1049970 m!970681))

(declare-fun m!970683 () Bool)

(assert (=> b!1049970 m!970683))

(declare-fun m!970685 () Bool)

(assert (=> b!1049970 m!970685))

(declare-fun m!970687 () Bool)

(assert (=> b!1049970 m!970687))

(declare-fun m!970689 () Bool)

(assert (=> b!1049977 m!970689))

(declare-fun m!970691 () Bool)

(assert (=> b!1049981 m!970691))

(declare-fun m!970693 () Bool)

(assert (=> b!1049973 m!970693))

(assert (=> b!1049972 m!970677))

(declare-fun m!970695 () Bool)

(assert (=> b!1049972 m!970695))

(declare-fun m!970697 () Bool)

(assert (=> b!1049971 m!970697))

(declare-fun m!970699 () Bool)

(assert (=> start!92358 m!970699))

(declare-fun m!970701 () Bool)

(assert (=> b!1049979 m!970701))

(declare-fun m!970703 () Bool)

(assert (=> b!1049975 m!970703))

(push 1)

(assert (not b!1049971))

(assert (not b!1049976))

(assert (not b!1049974))

(assert (not b!1049979))

(assert (not b!1049977))

(assert (not start!92358))

(assert (not b!1049980))

(assert (not b!1049973))

(assert (not b!1049981))

(assert (not b!1049970))

(check-sat)

(pop 1)

