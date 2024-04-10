; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92764 () Bool)

(assert start!92764)

(declare-fun b!1053697 () Bool)

(declare-fun e!598478 () Bool)

(declare-fun e!598481 () Bool)

(assert (=> b!1053697 (= e!598478 e!598481)))

(declare-fun res!702683 () Bool)

(assert (=> b!1053697 (=> (not res!702683) (not e!598481))))

(declare-fun lt!465198 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053697 (= res!702683 (not (= lt!465198 i!1381)))))

(declare-datatypes ((array!66457 0))(
  ( (array!66458 (arr!31962 (Array (_ BitVec 32) (_ BitVec 64))) (size!32498 (_ BitVec 32))) )
))
(declare-fun lt!465197 () array!66457)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66457 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053697 (= lt!465198 (arrayScanForKey!0 lt!465197 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053698 () Bool)

(declare-fun e!598479 () Bool)

(assert (=> b!1053698 (= e!598479 e!598478)))

(declare-fun res!702684 () Bool)

(assert (=> b!1053698 (=> (not res!702684) (not e!598478))))

(declare-fun arrayContainsKey!0 (array!66457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053698 (= res!702684 (arrayContainsKey!0 lt!465197 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66457)

(assert (=> b!1053698 (= lt!465197 (array!66458 (store (arr!31962 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32498 a!3488)))))

(declare-fun b!1053699 () Bool)

(declare-fun res!702686 () Bool)

(assert (=> b!1053699 (=> (not res!702686) (not e!598479))))

(declare-datatypes ((List!22274 0))(
  ( (Nil!22271) (Cons!22270 (h!23479 (_ BitVec 64)) (t!31581 List!22274)) )
))
(declare-fun arrayNoDuplicates!0 (array!66457 (_ BitVec 32) List!22274) Bool)

(assert (=> b!1053699 (= res!702686 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22271))))

(declare-fun b!1053700 () Bool)

(assert (=> b!1053700 (= e!598481 (not true))))

(declare-fun e!598483 () Bool)

(assert (=> b!1053700 e!598483))

(declare-fun res!702679 () Bool)

(assert (=> b!1053700 (=> (not res!702679) (not e!598483))))

(assert (=> b!1053700 (= res!702679 (= (select (store (arr!31962 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465198) k!2747))))

(declare-fun res!702680 () Bool)

(assert (=> start!92764 (=> (not res!702680) (not e!598479))))

(assert (=> start!92764 (= res!702680 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32498 a!3488)) (bvslt (size!32498 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92764 e!598479))

(assert (=> start!92764 true))

(declare-fun array_inv!24742 (array!66457) Bool)

(assert (=> start!92764 (array_inv!24742 a!3488)))

(declare-fun e!598482 () Bool)

(declare-fun b!1053701 () Bool)

(assert (=> b!1053701 (= e!598482 (arrayContainsKey!0 a!3488 k!2747 lt!465198))))

(declare-fun b!1053702 () Bool)

(declare-fun res!702685 () Bool)

(assert (=> b!1053702 (=> (not res!702685) (not e!598479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053702 (= res!702685 (validKeyInArray!0 k!2747))))

(declare-fun b!1053703 () Bool)

(assert (=> b!1053703 (= e!598483 e!598482)))

(declare-fun res!702681 () Bool)

(assert (=> b!1053703 (=> res!702681 e!598482)))

(assert (=> b!1053703 (= res!702681 (bvsle lt!465198 i!1381))))

(declare-fun b!1053704 () Bool)

(declare-fun res!702682 () Bool)

(assert (=> b!1053704 (=> (not res!702682) (not e!598479))))

(assert (=> b!1053704 (= res!702682 (= (select (arr!31962 a!3488) i!1381) k!2747))))

(assert (= (and start!92764 res!702680) b!1053699))

(assert (= (and b!1053699 res!702686) b!1053702))

(assert (= (and b!1053702 res!702685) b!1053704))

(assert (= (and b!1053704 res!702682) b!1053698))

(assert (= (and b!1053698 res!702684) b!1053697))

(assert (= (and b!1053697 res!702683) b!1053700))

(assert (= (and b!1053700 res!702679) b!1053703))

(assert (= (and b!1053703 (not res!702681)) b!1053701))

(declare-fun m!973919 () Bool)

(assert (=> b!1053704 m!973919))

(declare-fun m!973921 () Bool)

(assert (=> b!1053699 m!973921))

(declare-fun m!973923 () Bool)

(assert (=> b!1053698 m!973923))

(declare-fun m!973925 () Bool)

(assert (=> b!1053698 m!973925))

(declare-fun m!973927 () Bool)

(assert (=> start!92764 m!973927))

(declare-fun m!973929 () Bool)

(assert (=> b!1053702 m!973929))

(assert (=> b!1053700 m!973925))

(declare-fun m!973931 () Bool)

(assert (=> b!1053700 m!973931))

(declare-fun m!973933 () Bool)

(assert (=> b!1053701 m!973933))

(declare-fun m!973935 () Bool)

(assert (=> b!1053697 m!973935))

(push 1)

(assert (not b!1053699))

