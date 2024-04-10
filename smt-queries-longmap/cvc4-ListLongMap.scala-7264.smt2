; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92770 () Bool)

(assert start!92770)

(declare-fun res!702752 () Bool)

(declare-fun e!598532 () Bool)

(assert (=> start!92770 (=> (not res!702752) (not e!598532))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66463 0))(
  ( (array!66464 (arr!31965 (Array (_ BitVec 32) (_ BitVec 64))) (size!32501 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66463)

(assert (=> start!92770 (= res!702752 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32501 a!3488)) (bvslt (size!32501 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92770 e!598532))

(assert (=> start!92770 true))

(declare-fun array_inv!24745 (array!66463) Bool)

(assert (=> start!92770 (array_inv!24745 a!3488)))

(declare-fun b!1053769 () Bool)

(declare-fun e!598537 () Bool)

(declare-fun e!598533 () Bool)

(assert (=> b!1053769 (= e!598537 e!598533)))

(declare-fun res!702753 () Bool)

(assert (=> b!1053769 (=> (not res!702753) (not e!598533))))

(declare-fun lt!465216 () (_ BitVec 32))

(assert (=> b!1053769 (= res!702753 (not (= lt!465216 i!1381)))))

(declare-fun lt!465215 () array!66463)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66463 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053769 (= lt!465216 (arrayScanForKey!0 lt!465215 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053770 () Bool)

(declare-fun res!702755 () Bool)

(assert (=> b!1053770 (=> (not res!702755) (not e!598532))))

(assert (=> b!1053770 (= res!702755 (= (select (arr!31965 a!3488) i!1381) k!2747))))

(declare-fun b!1053771 () Bool)

(assert (=> b!1053771 (= e!598533 (not (or (bvsle lt!465216 i!1381) (bvsle #b00000000000000000000000000000000 (size!32501 a!3488)))))))

(declare-fun e!598535 () Bool)

(assert (=> b!1053771 e!598535))

(declare-fun res!702756 () Bool)

(assert (=> b!1053771 (=> (not res!702756) (not e!598535))))

(assert (=> b!1053771 (= res!702756 (= (select (store (arr!31965 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465216) k!2747))))

(declare-fun b!1053772 () Bool)

(declare-fun res!702751 () Bool)

(assert (=> b!1053772 (=> (not res!702751) (not e!598532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053772 (= res!702751 (validKeyInArray!0 k!2747))))

(declare-fun b!1053773 () Bool)

(assert (=> b!1053773 (= e!598532 e!598537)))

(declare-fun res!702758 () Bool)

(assert (=> b!1053773 (=> (not res!702758) (not e!598537))))

(declare-fun arrayContainsKey!0 (array!66463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053773 (= res!702758 (arrayContainsKey!0 lt!465215 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053773 (= lt!465215 (array!66464 (store (arr!31965 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32501 a!3488)))))

(declare-fun b!1053774 () Bool)

(declare-fun e!598534 () Bool)

(assert (=> b!1053774 (= e!598535 e!598534)))

(declare-fun res!702757 () Bool)

(assert (=> b!1053774 (=> res!702757 e!598534)))

(assert (=> b!1053774 (= res!702757 (bvsle lt!465216 i!1381))))

(declare-fun b!1053775 () Bool)

(assert (=> b!1053775 (= e!598534 (arrayContainsKey!0 a!3488 k!2747 lt!465216))))

(declare-fun b!1053776 () Bool)

(declare-fun res!702754 () Bool)

(assert (=> b!1053776 (=> (not res!702754) (not e!598532))))

(declare-datatypes ((List!22277 0))(
  ( (Nil!22274) (Cons!22273 (h!23482 (_ BitVec 64)) (t!31584 List!22277)) )
))
(declare-fun arrayNoDuplicates!0 (array!66463 (_ BitVec 32) List!22277) Bool)

(assert (=> b!1053776 (= res!702754 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22274))))

(assert (= (and start!92770 res!702752) b!1053776))

(assert (= (and b!1053776 res!702754) b!1053772))

(assert (= (and b!1053772 res!702751) b!1053770))

(assert (= (and b!1053770 res!702755) b!1053773))

(assert (= (and b!1053773 res!702758) b!1053769))

(assert (= (and b!1053769 res!702753) b!1053771))

(assert (= (and b!1053771 res!702756) b!1053774))

(assert (= (and b!1053774 (not res!702757)) b!1053775))

(declare-fun m!973973 () Bool)

(assert (=> b!1053769 m!973973))

(declare-fun m!973975 () Bool)

(assert (=> b!1053776 m!973975))

(declare-fun m!973977 () Bool)

(assert (=> b!1053775 m!973977))

(declare-fun m!973979 () Bool)

(assert (=> start!92770 m!973979))

(declare-fun m!973981 () Bool)

(assert (=> b!1053771 m!973981))

(declare-fun m!973983 () Bool)

(assert (=> b!1053771 m!973983))

(declare-fun m!973985 () Bool)

(assert (=> b!1053772 m!973985))

(declare-fun m!973987 () Bool)

(assert (=> b!1053773 m!973987))

(assert (=> b!1053773 m!973981))

(declare-fun m!973989 () Bool)

(assert (=> b!1053770 m!973989))

(push 1)

(assert (not b!1053776))

