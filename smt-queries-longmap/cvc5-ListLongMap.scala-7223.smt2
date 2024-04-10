; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92400 () Bool)

(assert start!92400)

(declare-fun b!1050579 () Bool)

(declare-fun res!699709 () Bool)

(declare-fun e!596203 () Bool)

(assert (=> b!1050579 (=> (not res!699709) (not e!596203))))

(declare-datatypes ((array!66201 0))(
  ( (array!66202 (arr!31840 (Array (_ BitVec 32) (_ BitVec 64))) (size!32376 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66201)

(declare-datatypes ((List!22152 0))(
  ( (Nil!22149) (Cons!22148 (h!23357 (_ BitVec 64)) (t!31459 List!22152)) )
))
(declare-fun arrayNoDuplicates!0 (array!66201 (_ BitVec 32) List!22152) Bool)

(assert (=> b!1050579 (= res!699709 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22149))))

(declare-fun b!1050580 () Bool)

(declare-fun e!596202 () Bool)

(declare-fun e!596200 () Bool)

(assert (=> b!1050580 (= e!596202 e!596200)))

(declare-fun res!699710 () Bool)

(assert (=> b!1050580 (=> (not res!699710) (not e!596200))))

(declare-fun lt!464016 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050580 (= res!699710 (not (= lt!464016 i!1381)))))

(declare-fun lt!464015 () array!66201)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66201 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050580 (= lt!464016 (arrayScanForKey!0 lt!464015 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050581 () Bool)

(declare-fun res!699705 () Bool)

(assert (=> b!1050581 (=> (not res!699705) (not e!596203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050581 (= res!699705 (validKeyInArray!0 k!2747))))

(declare-fun b!1050583 () Bool)

(declare-fun res!699708 () Bool)

(assert (=> b!1050583 (=> (not res!699708) (not e!596203))))

(assert (=> b!1050583 (= res!699708 (= (select (arr!31840 a!3488) i!1381) k!2747))))

(declare-fun b!1050584 () Bool)

(assert (=> b!1050584 (= e!596200 (not true))))

(assert (=> b!1050584 (= (select (store (arr!31840 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464016) k!2747)))

(declare-fun b!1050582 () Bool)

(assert (=> b!1050582 (= e!596203 e!596202)))

(declare-fun res!699706 () Bool)

(assert (=> b!1050582 (=> (not res!699706) (not e!596202))))

(declare-fun arrayContainsKey!0 (array!66201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050582 (= res!699706 (arrayContainsKey!0 lt!464015 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050582 (= lt!464015 (array!66202 (store (arr!31840 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32376 a!3488)))))

(declare-fun res!699707 () Bool)

(assert (=> start!92400 (=> (not res!699707) (not e!596203))))

(assert (=> start!92400 (= res!699707 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32376 a!3488)) (bvslt (size!32376 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92400 e!596203))

(assert (=> start!92400 true))

(declare-fun array_inv!24620 (array!66201) Bool)

(assert (=> start!92400 (array_inv!24620 a!3488)))

(assert (= (and start!92400 res!699707) b!1050579))

(assert (= (and b!1050579 res!699709) b!1050581))

(assert (= (and b!1050581 res!699705) b!1050583))

(assert (= (and b!1050583 res!699708) b!1050582))

(assert (= (and b!1050582 res!699706) b!1050580))

(assert (= (and b!1050580 res!699710) b!1050584))

(declare-fun m!971261 () Bool)

(assert (=> b!1050582 m!971261))

(declare-fun m!971263 () Bool)

(assert (=> b!1050582 m!971263))

(declare-fun m!971265 () Bool)

(assert (=> start!92400 m!971265))

(assert (=> b!1050584 m!971263))

(declare-fun m!971267 () Bool)

(assert (=> b!1050584 m!971267))

(declare-fun m!971269 () Bool)

(assert (=> b!1050583 m!971269))

(declare-fun m!971271 () Bool)

(assert (=> b!1050579 m!971271))

(declare-fun m!971273 () Bool)

(assert (=> b!1050581 m!971273))

(declare-fun m!971275 () Bool)

(assert (=> b!1050580 m!971275))

(push 1)

