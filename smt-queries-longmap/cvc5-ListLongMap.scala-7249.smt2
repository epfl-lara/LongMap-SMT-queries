; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92556 () Bool)

(assert start!92556)

(declare-datatypes ((array!66357 0))(
  ( (array!66358 (arr!31918 (Array (_ BitVec 32) (_ BitVec 64))) (size!32454 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66357)

(declare-fun e!597793 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lt!464970 () (_ BitVec 32))

(declare-fun b!1052802 () Bool)

(assert (=> b!1052802 (= e!597793 (not (or (bvsgt lt!464970 i!1381) (bvsgt i!1381 lt!464970) (bvslt #b00000000000000000000000000000000 (size!32454 a!3488)))))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1052802 (= (select (store (arr!31918 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464970) k!2747)))

(declare-fun b!1052803 () Bool)

(declare-fun e!597795 () Bool)

(declare-fun e!597796 () Bool)

(assert (=> b!1052803 (= e!597795 e!597796)))

(declare-fun res!701933 () Bool)

(assert (=> b!1052803 (=> (not res!701933) (not e!597796))))

(declare-fun lt!464969 () array!66357)

(declare-fun arrayContainsKey!0 (array!66357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052803 (= res!701933 (arrayContainsKey!0 lt!464969 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052803 (= lt!464969 (array!66358 (store (arr!31918 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32454 a!3488)))))

(declare-fun b!1052804 () Bool)

(declare-fun res!701931 () Bool)

(assert (=> b!1052804 (=> (not res!701931) (not e!597795))))

(declare-datatypes ((List!22230 0))(
  ( (Nil!22227) (Cons!22226 (h!23435 (_ BitVec 64)) (t!31537 List!22230)) )
))
(declare-fun arrayNoDuplicates!0 (array!66357 (_ BitVec 32) List!22230) Bool)

(assert (=> b!1052804 (= res!701931 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22227))))

(declare-fun res!701930 () Bool)

(assert (=> start!92556 (=> (not res!701930) (not e!597795))))

(assert (=> start!92556 (= res!701930 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32454 a!3488)) (bvslt (size!32454 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92556 e!597795))

(assert (=> start!92556 true))

(declare-fun array_inv!24698 (array!66357) Bool)

(assert (=> start!92556 (array_inv!24698 a!3488)))

(declare-fun b!1052805 () Bool)

(declare-fun res!701929 () Bool)

(assert (=> b!1052805 (=> (not res!701929) (not e!597795))))

(assert (=> b!1052805 (= res!701929 (= (select (arr!31918 a!3488) i!1381) k!2747))))

(declare-fun b!1052806 () Bool)

(assert (=> b!1052806 (= e!597796 e!597793)))

(declare-fun res!701932 () Bool)

(assert (=> b!1052806 (=> (not res!701932) (not e!597793))))

(assert (=> b!1052806 (= res!701932 (not (= lt!464970 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66357 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052806 (= lt!464970 (arrayScanForKey!0 lt!464969 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052807 () Bool)

(declare-fun res!701928 () Bool)

(assert (=> b!1052807 (=> (not res!701928) (not e!597795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052807 (= res!701928 (validKeyInArray!0 k!2747))))

(assert (= (and start!92556 res!701930) b!1052804))

(assert (= (and b!1052804 res!701931) b!1052807))

(assert (= (and b!1052807 res!701928) b!1052805))

(assert (= (and b!1052805 res!701929) b!1052803))

(assert (= (and b!1052803 res!701933) b!1052806))

(assert (= (and b!1052806 res!701932) b!1052802))

(declare-fun m!973205 () Bool)

(assert (=> start!92556 m!973205))

(declare-fun m!973207 () Bool)

(assert (=> b!1052803 m!973207))

(declare-fun m!973209 () Bool)

(assert (=> b!1052803 m!973209))

(assert (=> b!1052802 m!973209))

(declare-fun m!973211 () Bool)

(assert (=> b!1052802 m!973211))

(declare-fun m!973213 () Bool)

(assert (=> b!1052806 m!973213))

(declare-fun m!973215 () Bool)

(assert (=> b!1052805 m!973215))

(declare-fun m!973217 () Bool)

(assert (=> b!1052807 m!973217))

(declare-fun m!973219 () Bool)

(assert (=> b!1052804 m!973219))

(push 1)

