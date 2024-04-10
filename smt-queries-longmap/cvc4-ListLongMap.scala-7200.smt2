; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92266 () Bool)

(assert start!92266)

(declare-fun b!1048588 () Bool)

(declare-fun e!594776 () Bool)

(declare-fun e!594778 () Bool)

(assert (=> b!1048588 (= e!594776 e!594778)))

(declare-fun res!697721 () Bool)

(assert (=> b!1048588 (=> (not res!697721) (not e!594778))))

(declare-datatypes ((array!66067 0))(
  ( (array!66068 (arr!31773 (Array (_ BitVec 32) (_ BitVec 64))) (size!32309 (_ BitVec 32))) )
))
(declare-fun lt!463235 () array!66067)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048588 (= res!697721 (arrayContainsKey!0 lt!463235 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66067)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048588 (= lt!463235 (array!66068 (store (arr!31773 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32309 a!3488)))))

(declare-fun lt!463236 () (_ BitVec 32))

(declare-fun e!594774 () Bool)

(declare-fun b!1048589 () Bool)

(assert (=> b!1048589 (= e!594774 (arrayContainsKey!0 a!3488 k!2747 lt!463236))))

(declare-fun b!1048590 () Bool)

(declare-fun res!697718 () Bool)

(assert (=> b!1048590 (=> (not res!697718) (not e!594776))))

(assert (=> b!1048590 (= res!697718 (= (select (arr!31773 a!3488) i!1381) k!2747))))

(declare-fun b!1048591 () Bool)

(declare-fun res!697719 () Bool)

(assert (=> b!1048591 (=> (not res!697719) (not e!594776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048591 (= res!697719 (validKeyInArray!0 k!2747))))

(declare-fun res!697714 () Bool)

(assert (=> start!92266 (=> (not res!697714) (not e!594776))))

(assert (=> start!92266 (= res!697714 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32309 a!3488)) (bvslt (size!32309 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92266 e!594776))

(assert (=> start!92266 true))

(declare-fun array_inv!24553 (array!66067) Bool)

(assert (=> start!92266 (array_inv!24553 a!3488)))

(declare-fun b!1048592 () Bool)

(declare-fun e!594775 () Bool)

(assert (=> b!1048592 (= e!594778 e!594775)))

(declare-fun res!697716 () Bool)

(assert (=> b!1048592 (=> (not res!697716) (not e!594775))))

(assert (=> b!1048592 (= res!697716 (not (= lt!463236 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66067 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048592 (= lt!463236 (arrayScanForKey!0 lt!463235 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048593 () Bool)

(declare-fun e!594773 () Bool)

(assert (=> b!1048593 (= e!594773 e!594774)))

(declare-fun res!697715 () Bool)

(assert (=> b!1048593 (=> res!697715 e!594774)))

(assert (=> b!1048593 (= res!697715 (bvsle lt!463236 i!1381))))

(declare-fun b!1048594 () Bool)

(assert (=> b!1048594 (= e!594775 (not true))))

(assert (=> b!1048594 e!594773))

(declare-fun res!697717 () Bool)

(assert (=> b!1048594 (=> (not res!697717) (not e!594773))))

(assert (=> b!1048594 (= res!697717 (= (select (store (arr!31773 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463236) k!2747))))

(declare-fun b!1048595 () Bool)

(declare-fun res!697720 () Bool)

(assert (=> b!1048595 (=> (not res!697720) (not e!594776))))

(declare-datatypes ((List!22085 0))(
  ( (Nil!22082) (Cons!22081 (h!23290 (_ BitVec 64)) (t!31392 List!22085)) )
))
(declare-fun arrayNoDuplicates!0 (array!66067 (_ BitVec 32) List!22085) Bool)

(assert (=> b!1048595 (= res!697720 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22082))))

(assert (= (and start!92266 res!697714) b!1048595))

(assert (= (and b!1048595 res!697720) b!1048591))

(assert (= (and b!1048591 res!697719) b!1048590))

(assert (= (and b!1048590 res!697718) b!1048588))

(assert (= (and b!1048588 res!697721) b!1048592))

(assert (= (and b!1048592 res!697716) b!1048594))

(assert (= (and b!1048594 res!697717) b!1048593))

(assert (= (and b!1048593 (not res!697715)) b!1048589))

(declare-fun m!969521 () Bool)

(assert (=> b!1048592 m!969521))

(declare-fun m!969523 () Bool)

(assert (=> b!1048594 m!969523))

(declare-fun m!969525 () Bool)

(assert (=> b!1048594 m!969525))

(declare-fun m!969527 () Bool)

(assert (=> b!1048595 m!969527))

(declare-fun m!969529 () Bool)

(assert (=> b!1048590 m!969529))

(declare-fun m!969531 () Bool)

(assert (=> b!1048591 m!969531))

(declare-fun m!969533 () Bool)

(assert (=> b!1048588 m!969533))

(assert (=> b!1048588 m!969523))

(declare-fun m!969535 () Bool)

(assert (=> start!92266 m!969535))

(declare-fun m!969537 () Bool)

(assert (=> b!1048589 m!969537))

(push 1)

