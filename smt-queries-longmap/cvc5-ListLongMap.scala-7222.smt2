; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92394 () Bool)

(assert start!92394)

(declare-fun b!1050525 () Bool)

(declare-fun e!596164 () Bool)

(assert (=> b!1050525 (= e!596164 (not true))))

(declare-datatypes ((array!66195 0))(
  ( (array!66196 (arr!31837 (Array (_ BitVec 32) (_ BitVec 64))) (size!32373 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66195)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lt!463997 () (_ BitVec 32))

(assert (=> b!1050525 (= (select (store (arr!31837 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463997) k!2747)))

(declare-fun b!1050526 () Bool)

(declare-fun e!596165 () Bool)

(declare-fun e!596166 () Bool)

(assert (=> b!1050526 (= e!596165 e!596166)))

(declare-fun res!699655 () Bool)

(assert (=> b!1050526 (=> (not res!699655) (not e!596166))))

(declare-fun lt!463998 () array!66195)

(declare-fun arrayContainsKey!0 (array!66195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050526 (= res!699655 (arrayContainsKey!0 lt!463998 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050526 (= lt!463998 (array!66196 (store (arr!31837 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32373 a!3488)))))

(declare-fun b!1050527 () Bool)

(assert (=> b!1050527 (= e!596166 e!596164)))

(declare-fun res!699651 () Bool)

(assert (=> b!1050527 (=> (not res!699651) (not e!596164))))

(assert (=> b!1050527 (= res!699651 (not (= lt!463997 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66195 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050527 (= lt!463997 (arrayScanForKey!0 lt!463998 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050528 () Bool)

(declare-fun res!699653 () Bool)

(assert (=> b!1050528 (=> (not res!699653) (not e!596165))))

(declare-datatypes ((List!22149 0))(
  ( (Nil!22146) (Cons!22145 (h!23354 (_ BitVec 64)) (t!31456 List!22149)) )
))
(declare-fun arrayNoDuplicates!0 (array!66195 (_ BitVec 32) List!22149) Bool)

(assert (=> b!1050528 (= res!699653 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22146))))

(declare-fun b!1050529 () Bool)

(declare-fun res!699652 () Bool)

(assert (=> b!1050529 (=> (not res!699652) (not e!596165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050529 (= res!699652 (validKeyInArray!0 k!2747))))

(declare-fun b!1050530 () Bool)

(declare-fun res!699656 () Bool)

(assert (=> b!1050530 (=> (not res!699656) (not e!596165))))

(assert (=> b!1050530 (= res!699656 (= (select (arr!31837 a!3488) i!1381) k!2747))))

(declare-fun res!699654 () Bool)

(assert (=> start!92394 (=> (not res!699654) (not e!596165))))

(assert (=> start!92394 (= res!699654 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32373 a!3488)) (bvslt (size!32373 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92394 e!596165))

(assert (=> start!92394 true))

(declare-fun array_inv!24617 (array!66195) Bool)

(assert (=> start!92394 (array_inv!24617 a!3488)))

(assert (= (and start!92394 res!699654) b!1050528))

(assert (= (and b!1050528 res!699653) b!1050529))

(assert (= (and b!1050529 res!699652) b!1050530))

(assert (= (and b!1050530 res!699656) b!1050526))

(assert (= (and b!1050526 res!699655) b!1050527))

(assert (= (and b!1050527 res!699651) b!1050525))

(declare-fun m!971213 () Bool)

(assert (=> b!1050525 m!971213))

(declare-fun m!971215 () Bool)

(assert (=> b!1050525 m!971215))

(declare-fun m!971217 () Bool)

(assert (=> b!1050526 m!971217))

(assert (=> b!1050526 m!971213))

(declare-fun m!971219 () Bool)

(assert (=> b!1050530 m!971219))

(declare-fun m!971221 () Bool)

(assert (=> start!92394 m!971221))

(declare-fun m!971223 () Bool)

(assert (=> b!1050528 m!971223))

(declare-fun m!971225 () Bool)

(assert (=> b!1050527 m!971225))

(declare-fun m!971227 () Bool)

(assert (=> b!1050529 m!971227))

(push 1)

(assert (not start!92394))

(assert (not b!1050528))

(assert (not b!1050527))

(assert (not b!1050529))

(assert (not b!1050526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

