; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92270 () Bool)

(assert start!92270)

(declare-fun b!1048636 () Bool)

(declare-fun res!697769 () Bool)

(declare-fun e!594811 () Bool)

(assert (=> b!1048636 (=> (not res!697769) (not e!594811))))

(declare-datatypes ((array!66071 0))(
  ( (array!66072 (arr!31775 (Array (_ BitVec 32) (_ BitVec 64))) (size!32311 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66071)

(declare-datatypes ((List!22087 0))(
  ( (Nil!22084) (Cons!22083 (h!23292 (_ BitVec 64)) (t!31394 List!22087)) )
))
(declare-fun arrayNoDuplicates!0 (array!66071 (_ BitVec 32) List!22087) Bool)

(assert (=> b!1048636 (= res!697769 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22084))))

(declare-fun e!594809 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!463247 () (_ BitVec 32))

(declare-fun b!1048637 () Bool)

(declare-fun arrayContainsKey!0 (array!66071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048637 (= e!594809 (arrayContainsKey!0 a!3488 k0!2747 lt!463247))))

(declare-fun b!1048638 () Bool)

(declare-fun res!697767 () Bool)

(assert (=> b!1048638 (=> (not res!697767) (not e!594811))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048638 (= res!697767 (= (select (arr!31775 a!3488) i!1381) k0!2747))))

(declare-fun b!1048639 () Bool)

(declare-fun e!594812 () Bool)

(assert (=> b!1048639 (= e!594812 (not true))))

(declare-fun e!594810 () Bool)

(assert (=> b!1048639 e!594810))

(declare-fun res!697763 () Bool)

(assert (=> b!1048639 (=> (not res!697763) (not e!594810))))

(assert (=> b!1048639 (= res!697763 (= (select (store (arr!31775 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463247) k0!2747))))

(declare-fun b!1048641 () Bool)

(declare-fun e!594814 () Bool)

(assert (=> b!1048641 (= e!594814 e!594812)))

(declare-fun res!697766 () Bool)

(assert (=> b!1048641 (=> (not res!697766) (not e!594812))))

(assert (=> b!1048641 (= res!697766 (not (= lt!463247 i!1381)))))

(declare-fun lt!463248 () array!66071)

(declare-fun arrayScanForKey!0 (array!66071 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048641 (= lt!463247 (arrayScanForKey!0 lt!463248 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048642 () Bool)

(assert (=> b!1048642 (= e!594810 e!594809)))

(declare-fun res!697762 () Bool)

(assert (=> b!1048642 (=> res!697762 e!594809)))

(assert (=> b!1048642 (= res!697762 (bvsle lt!463247 i!1381))))

(declare-fun b!1048643 () Bool)

(assert (=> b!1048643 (= e!594811 e!594814)))

(declare-fun res!697765 () Bool)

(assert (=> b!1048643 (=> (not res!697765) (not e!594814))))

(assert (=> b!1048643 (= res!697765 (arrayContainsKey!0 lt!463248 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048643 (= lt!463248 (array!66072 (store (arr!31775 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32311 a!3488)))))

(declare-fun b!1048640 () Bool)

(declare-fun res!697768 () Bool)

(assert (=> b!1048640 (=> (not res!697768) (not e!594811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048640 (= res!697768 (validKeyInArray!0 k0!2747))))

(declare-fun res!697764 () Bool)

(assert (=> start!92270 (=> (not res!697764) (not e!594811))))

(assert (=> start!92270 (= res!697764 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32311 a!3488)) (bvslt (size!32311 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92270 e!594811))

(assert (=> start!92270 true))

(declare-fun array_inv!24555 (array!66071) Bool)

(assert (=> start!92270 (array_inv!24555 a!3488)))

(assert (= (and start!92270 res!697764) b!1048636))

(assert (= (and b!1048636 res!697769) b!1048640))

(assert (= (and b!1048640 res!697768) b!1048638))

(assert (= (and b!1048638 res!697767) b!1048643))

(assert (= (and b!1048643 res!697765) b!1048641))

(assert (= (and b!1048641 res!697766) b!1048639))

(assert (= (and b!1048639 res!697763) b!1048642))

(assert (= (and b!1048642 (not res!697762)) b!1048637))

(declare-fun m!969557 () Bool)

(assert (=> b!1048636 m!969557))

(declare-fun m!969559 () Bool)

(assert (=> b!1048638 m!969559))

(declare-fun m!969561 () Bool)

(assert (=> b!1048639 m!969561))

(declare-fun m!969563 () Bool)

(assert (=> b!1048639 m!969563))

(declare-fun m!969565 () Bool)

(assert (=> b!1048641 m!969565))

(declare-fun m!969567 () Bool)

(assert (=> b!1048640 m!969567))

(declare-fun m!969569 () Bool)

(assert (=> start!92270 m!969569))

(declare-fun m!969571 () Bool)

(assert (=> b!1048637 m!969571))

(declare-fun m!969573 () Bool)

(assert (=> b!1048643 m!969573))

(assert (=> b!1048643 m!969561))

(check-sat (not b!1048640) (not b!1048641) (not b!1048637) (not start!92270) (not b!1048643) (not b!1048636))
(check-sat)
