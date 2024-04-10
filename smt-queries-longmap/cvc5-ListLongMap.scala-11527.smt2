; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134246 () Bool)

(assert start!134246)

(declare-datatypes ((array!104736 0))(
  ( (array!104737 (arr!50548 (Array (_ BitVec 32) (_ BitVec 64))) (size!51098 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104736)

(declare-datatypes ((List!36680 0))(
  ( (Nil!36677) (Cons!36676 (h!38123 (_ BitVec 64)) (t!51588 List!36680)) )
))
(declare-fun acc!619 () List!36680)

(declare-fun b!1568040 () Bool)

(declare-fun e!874139 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun contains!10382 (List!36680 (_ BitVec 64)) Bool)

(assert (=> b!1568040 (= e!874139 (not (contains!10382 acc!619 (select (arr!50548 a!3481) from!2856))))))

(declare-fun b!1568041 () Bool)

(declare-fun e!874138 () Bool)

(declare-fun lt!673105 () Bool)

(assert (=> b!1568041 (= e!874138 (and (not lt!673105) (bvslt (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun b!1568042 () Bool)

(declare-fun e!874137 () Bool)

(assert (=> b!1568042 (= e!874137 e!874138)))

(declare-fun res!1071726 () Bool)

(assert (=> b!1568042 (=> (not res!1071726) (not e!874138))))

(assert (=> b!1568042 (= res!1071726 e!874139)))

(declare-fun res!1071729 () Bool)

(assert (=> b!1568042 (=> res!1071729 e!874139)))

(assert (=> b!1568042 (= res!1071729 (not lt!673105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568042 (= lt!673105 (validKeyInArray!0 (select (arr!50548 a!3481) from!2856)))))

(declare-fun b!1568044 () Bool)

(declare-fun res!1071728 () Bool)

(assert (=> b!1568044 (=> (not res!1071728) (not e!874137))))

(assert (=> b!1568044 (= res!1071728 (not (contains!10382 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568045 () Bool)

(declare-fun res!1071727 () Bool)

(assert (=> b!1568045 (=> (not res!1071727) (not e!874137))))

(assert (=> b!1568045 (= res!1071727 (bvslt from!2856 (size!51098 a!3481)))))

(declare-fun b!1568046 () Bool)

(declare-fun res!1071731 () Bool)

(assert (=> b!1568046 (=> (not res!1071731) (not e!874137))))

(declare-fun noDuplicate!2654 (List!36680) Bool)

(assert (=> b!1568046 (= res!1071731 (noDuplicate!2654 acc!619))))

(declare-fun res!1071732 () Bool)

(assert (=> start!134246 (=> (not res!1071732) (not e!874137))))

(assert (=> start!134246 (= res!1071732 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51098 a!3481)) (bvslt (size!51098 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134246 e!874137))

(assert (=> start!134246 true))

(declare-fun array_inv!39275 (array!104736) Bool)

(assert (=> start!134246 (array_inv!39275 a!3481)))

(declare-fun b!1568043 () Bool)

(declare-fun res!1071730 () Bool)

(assert (=> b!1568043 (=> (not res!1071730) (not e!874137))))

(assert (=> b!1568043 (= res!1071730 (not (contains!10382 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134246 res!1071732) b!1568046))

(assert (= (and b!1568046 res!1071731) b!1568043))

(assert (= (and b!1568043 res!1071730) b!1568044))

(assert (= (and b!1568044 res!1071728) b!1568045))

(assert (= (and b!1568045 res!1071727) b!1568042))

(assert (= (and b!1568042 (not res!1071729)) b!1568040))

(assert (= (and b!1568042 res!1071726) b!1568041))

(declare-fun m!1442791 () Bool)

(assert (=> b!1568044 m!1442791))

(declare-fun m!1442793 () Bool)

(assert (=> start!134246 m!1442793))

(declare-fun m!1442795 () Bool)

(assert (=> b!1568040 m!1442795))

(assert (=> b!1568040 m!1442795))

(declare-fun m!1442797 () Bool)

(assert (=> b!1568040 m!1442797))

(declare-fun m!1442799 () Bool)

(assert (=> b!1568043 m!1442799))

(declare-fun m!1442801 () Bool)

(assert (=> b!1568046 m!1442801))

(assert (=> b!1568042 m!1442795))

(assert (=> b!1568042 m!1442795))

(declare-fun m!1442803 () Bool)

(assert (=> b!1568042 m!1442803))

(push 1)

