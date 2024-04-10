; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134190 () Bool)

(assert start!134190)

(declare-datatypes ((array!104722 0))(
  ( (array!104723 (arr!50544 (Array (_ BitVec 32) (_ BitVec 64))) (size!51094 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104722)

(declare-datatypes ((List!36676 0))(
  ( (Nil!36673) (Cons!36672 (h!38119 (_ BitVec 64)) (t!51584 List!36676)) )
))
(declare-fun acc!619 () List!36676)

(declare-fun e!873950 () Bool)

(declare-fun b!1567799 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun contains!10378 (List!36676 (_ BitVec 64)) Bool)

(assert (=> b!1567799 (= e!873950 (not (contains!10378 acc!619 (select (arr!50544 a!3481) from!2856))))))

(declare-fun b!1567800 () Bool)

(declare-fun res!1071491 () Bool)

(declare-fun e!873953 () Bool)

(assert (=> b!1567800 (=> (not res!1071491) (not e!873953))))

(assert (=> b!1567800 (= res!1071491 (not (contains!10378 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567801 () Bool)

(declare-fun res!1071490 () Bool)

(assert (=> b!1567801 (=> (not res!1071490) (not e!873953))))

(assert (=> b!1567801 (= res!1071490 (bvslt from!2856 (size!51094 a!3481)))))

(declare-fun b!1567802 () Bool)

(declare-fun res!1071488 () Bool)

(declare-fun e!873952 () Bool)

(assert (=> b!1567802 (=> (not res!1071488) (not e!873952))))

(declare-fun lt!673048 () Bool)

(assert (=> b!1567802 (= res!1071488 (and (not lt!673048) (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun b!1567803 () Bool)

(declare-fun res!1071492 () Bool)

(assert (=> b!1567803 (=> (not res!1071492) (not e!873953))))

(declare-fun noDuplicate!2650 (List!36676) Bool)

(assert (=> b!1567803 (= res!1071492 (noDuplicate!2650 acc!619))))

(declare-fun res!1071489 () Bool)

(assert (=> start!134190 (=> (not res!1071489) (not e!873953))))

(assert (=> start!134190 (= res!1071489 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51094 a!3481)) (bvslt (size!51094 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134190 e!873953))

(assert (=> start!134190 true))

(declare-fun array_inv!39271 (array!104722) Bool)

(assert (=> start!134190 (array_inv!39271 a!3481)))

(declare-fun b!1567804 () Bool)

(declare-fun res!1071485 () Bool)

(assert (=> b!1567804 (=> (not res!1071485) (not e!873953))))

(assert (=> b!1567804 (= res!1071485 (not (contains!10378 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567805 () Bool)

(assert (=> b!1567805 (= e!873952 (not (noDuplicate!2650 (Cons!36672 (select (arr!50544 a!3481) from!2856) acc!619))))))

(declare-fun b!1567806 () Bool)

(assert (=> b!1567806 (= e!873953 e!873952)))

(declare-fun res!1071486 () Bool)

(assert (=> b!1567806 (=> (not res!1071486) (not e!873952))))

(assert (=> b!1567806 (= res!1071486 e!873950)))

(declare-fun res!1071487 () Bool)

(assert (=> b!1567806 (=> res!1071487 e!873950)))

(assert (=> b!1567806 (= res!1071487 lt!673048)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567806 (= lt!673048 (not (validKeyInArray!0 (select (arr!50544 a!3481) from!2856))))))

(assert (= (and start!134190 res!1071489) b!1567803))

(assert (= (and b!1567803 res!1071492) b!1567804))

(assert (= (and b!1567804 res!1071485) b!1567800))

(assert (= (and b!1567800 res!1071491) b!1567801))

(assert (= (and b!1567801 res!1071490) b!1567806))

(assert (= (and b!1567806 (not res!1071487)) b!1567799))

(assert (= (and b!1567806 res!1071486) b!1567802))

(assert (= (and b!1567802 res!1071488) b!1567805))

(declare-fun m!1442553 () Bool)

(assert (=> b!1567805 m!1442553))

(declare-fun m!1442555 () Bool)

(assert (=> b!1567805 m!1442555))

(declare-fun m!1442557 () Bool)

(assert (=> b!1567803 m!1442557))

(declare-fun m!1442559 () Bool)

(assert (=> b!1567804 m!1442559))

(assert (=> b!1567806 m!1442553))

(assert (=> b!1567806 m!1442553))

(declare-fun m!1442561 () Bool)

(assert (=> b!1567806 m!1442561))

(declare-fun m!1442563 () Bool)

(assert (=> b!1567800 m!1442563))

(assert (=> b!1567799 m!1442553))

(assert (=> b!1567799 m!1442553))

(declare-fun m!1442565 () Bool)

(assert (=> b!1567799 m!1442565))

(declare-fun m!1442567 () Bool)

(assert (=> start!134190 m!1442567))

(push 1)

(assert (not b!1567800))

(assert (not b!1567806))

(assert (not b!1567803))

(assert (not b!1567805))

(assert (not b!1567799))

(assert (not start!134190))

(assert (not b!1567804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!673059 () Bool)

(declare-fun d!163651 () Bool)

(declare-fun content!813 (List!36676) (Set (_ BitVec 64)))

(assert (=> d!163651 (= lt!673059 (member (select (arr!50544 a!3481) from!2856) (content!813 acc!619)))))

(declare-fun e!873991 () Bool)

(assert (=> d!163651 (= lt!673059 e!873991)))

(declare-fun res!1071529 () Bool)

(assert (=> d!163651 (=> (not res!1071529) (not e!873991))))

(assert (=> d!163651 (= res!1071529 (is-Cons!36672 acc!619))))

(assert (=> d!163651 (= (contains!10378 acc!619 (select (arr!50544 a!3481) from!2856)) lt!673059)))

(declare-fun b!1567843 () Bool)

(declare-fun e!873990 () Bool)

(assert (=> b!1567843 (= e!873991 e!873990)))

(declare-fun res!1071530 () Bool)

(assert (=> b!1567843 (=> res!1071530 e!873990)))

(assert (=> b!1567843 (= res!1071530 (= (h!38119 acc!619) (select (arr!50544 a!3481) from!2856)))))

(declare-fun b!1567844 () Bool)

(assert (=> b!1567844 (= e!873990 (contains!10378 (t!51584 acc!619) (select (arr!50544 a!3481) from!2856)))))

(assert (= (and d!163651 res!1071529) b!1567843))

(assert (= (and b!1567843 (not res!1071530)) b!1567844))

(declare-fun m!1442605 () Bool)

(assert (=> d!163651 m!1442605))

(assert (=> d!163651 m!1442553))

(declare-fun m!1442607 () Bool)

(assert (=> d!163651 m!1442607))

(assert (=> b!1567844 m!1442553))

(declare-fun m!1442609 () Bool)

