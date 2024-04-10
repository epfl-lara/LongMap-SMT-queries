; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103926 () Bool)

(assert start!103926)

(declare-fun b!1244017 () Bool)

(declare-fun res!829798 () Bool)

(declare-fun e!705092 () Bool)

(assert (=> b!1244017 (=> (not res!829798) (not e!705092))))

(declare-datatypes ((List!27405 0))(
  ( (Nil!27402) (Cons!27401 (h!28610 (_ BitVec 64)) (t!40874 List!27405)) )
))
(declare-fun lt!562546 () List!27405)

(declare-fun contains!7426 (List!27405 (_ BitVec 64)) Bool)

(assert (=> b!1244017 (= res!829798 (not (contains!7426 lt!562546 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244018 () Bool)

(declare-fun res!829804 () Bool)

(assert (=> b!1244018 (=> (not res!829804) (not e!705092))))

(declare-fun subseq!652 (List!27405 List!27405) Bool)

(assert (=> b!1244018 (= res!829804 (subseq!652 Nil!27402 lt!562546))))

(declare-fun b!1244019 () Bool)

(declare-fun res!829794 () Bool)

(assert (=> b!1244019 (=> (not res!829794) (not e!705092))))

(assert (=> b!1244019 (= res!829794 (not (contains!7426 lt!562546 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244020 () Bool)

(declare-fun res!829803 () Bool)

(assert (=> b!1244020 (=> (not res!829803) (not e!705092))))

(declare-fun noDuplicate!2004 (List!27405) Bool)

(assert (=> b!1244020 (= res!829803 (noDuplicate!2004 lt!562546))))

(declare-fun b!1244021 () Bool)

(declare-fun res!829802 () Bool)

(assert (=> b!1244021 (=> (not res!829802) (not e!705092))))

(assert (=> b!1244021 (= res!829802 (not (contains!7426 Nil!27402 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829800 () Bool)

(declare-fun e!705093 () Bool)

(assert (=> start!103926 (=> (not res!829800) (not e!705093))))

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((array!80018 0))(
  ( (array!80019 (arr!38602 (Array (_ BitVec 32) (_ BitVec 64))) (size!39138 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80018)

(assert (=> start!103926 (= res!829800 (and (bvslt (size!39138 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39138 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39138 a!3892))))))

(assert (=> start!103926 e!705093))

(declare-fun array_inv!29450 (array!80018) Bool)

(assert (=> start!103926 (array_inv!29450 a!3892)))

(assert (=> start!103926 true))

(declare-fun b!1244022 () Bool)

(declare-fun res!829801 () Bool)

(assert (=> b!1244022 (=> (not res!829801) (not e!705093))))

(declare-fun arrayNoDuplicates!0 (array!80018 (_ BitVec 32) List!27405) Bool)

(assert (=> b!1244022 (= res!829801 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27402))))

(declare-fun b!1244023 () Bool)

(declare-fun res!829797 () Bool)

(assert (=> b!1244023 (=> (not res!829797) (not e!705093))))

(assert (=> b!1244023 (= res!829797 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39138 a!3892)) (not (= newFrom!287 (size!39138 a!3892)))))))

(declare-fun b!1244024 () Bool)

(assert (=> b!1244024 (= e!705092 false)))

(declare-fun lt!562547 () Bool)

(assert (=> b!1244024 (= lt!562547 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562546))))

(declare-datatypes ((Unit!41313 0))(
  ( (Unit!41314) )
))
(declare-fun lt!562545 () Unit!41313)

(declare-fun noDuplicateSubseq!106 (List!27405 List!27405) Unit!41313)

(assert (=> b!1244024 (= lt!562545 (noDuplicateSubseq!106 Nil!27402 lt!562546))))

(declare-fun b!1244025 () Bool)

(declare-fun res!829796 () Bool)

(assert (=> b!1244025 (=> (not res!829796) (not e!705092))))

(assert (=> b!1244025 (= res!829796 (not (contains!7426 Nil!27402 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244026 () Bool)

(declare-fun res!829799 () Bool)

(assert (=> b!1244026 (=> (not res!829799) (not e!705093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244026 (= res!829799 (validKeyInArray!0 (select (arr!38602 a!3892) from!3270)))))

(declare-fun b!1244027 () Bool)

(assert (=> b!1244027 (= e!705093 e!705092)))

(declare-fun res!829795 () Bool)

(assert (=> b!1244027 (=> (not res!829795) (not e!705092))))

(assert (=> b!1244027 (= res!829795 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1244027 (= lt!562546 (Cons!27401 (select (arr!38602 a!3892) from!3270) Nil!27402))))

(assert (= (and start!103926 res!829800) b!1244022))

(assert (= (and b!1244022 res!829801) b!1244023))

(assert (= (and b!1244023 res!829797) b!1244026))

(assert (= (and b!1244026 res!829799) b!1244027))

(assert (= (and b!1244027 res!829795) b!1244020))

(assert (= (and b!1244020 res!829803) b!1244019))

(assert (= (and b!1244019 res!829794) b!1244017))

(assert (= (and b!1244017 res!829798) b!1244021))

(assert (= (and b!1244021 res!829802) b!1244025))

(assert (= (and b!1244025 res!829796) b!1244018))

(assert (= (and b!1244018 res!829804) b!1244024))

(declare-fun m!1146419 () Bool)

(assert (=> b!1244018 m!1146419))

(declare-fun m!1146421 () Bool)

(assert (=> b!1244019 m!1146421))

(declare-fun m!1146423 () Bool)

(assert (=> b!1244022 m!1146423))

(declare-fun m!1146425 () Bool)

(assert (=> b!1244024 m!1146425))

(declare-fun m!1146427 () Bool)

(assert (=> b!1244024 m!1146427))

(declare-fun m!1146429 () Bool)

(assert (=> b!1244025 m!1146429))

(declare-fun m!1146431 () Bool)

(assert (=> b!1244026 m!1146431))

(assert (=> b!1244026 m!1146431))

(declare-fun m!1146433 () Bool)

(assert (=> b!1244026 m!1146433))

(declare-fun m!1146435 () Bool)

(assert (=> b!1244021 m!1146435))

(declare-fun m!1146437 () Bool)

(assert (=> b!1244017 m!1146437))

(declare-fun m!1146439 () Bool)

(assert (=> start!103926 m!1146439))

(assert (=> b!1244027 m!1146431))

(declare-fun m!1146441 () Bool)

(assert (=> b!1244020 m!1146441))

(push 1)

(assert (not start!103926))

(assert (not b!1244018))

(assert (not b!1244024))

(assert (not b!1244020))

(assert (not b!1244021))

(assert (not b!1244026))

(assert (not b!1244019))

(assert (not b!1244025))

(assert (not b!1244022))

(assert (not b!1244017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

