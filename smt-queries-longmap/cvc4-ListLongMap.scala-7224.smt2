; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92410 () Bool)

(assert start!92410)

(declare-fun b!1050669 () Bool)

(declare-fun res!699796 () Bool)

(declare-fun e!596261 () Bool)

(assert (=> b!1050669 (=> (not res!699796) (not e!596261))))

(declare-datatypes ((array!66211 0))(
  ( (array!66212 (arr!31845 (Array (_ BitVec 32) (_ BitVec 64))) (size!32381 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66211)

(declare-datatypes ((List!22157 0))(
  ( (Nil!22154) (Cons!22153 (h!23362 (_ BitVec 64)) (t!31464 List!22157)) )
))
(declare-fun arrayNoDuplicates!0 (array!66211 (_ BitVec 32) List!22157) Bool)

(assert (=> b!1050669 (= res!699796 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22154))))

(declare-fun b!1050670 () Bool)

(declare-fun e!596262 () Bool)

(assert (=> b!1050670 (= e!596262 (not true))))

(declare-fun lt!464046 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050670 (= (select (store (arr!31845 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464046) k!2747)))

(declare-fun b!1050671 () Bool)

(declare-fun res!699797 () Bool)

(assert (=> b!1050671 (=> (not res!699797) (not e!596261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050671 (= res!699797 (validKeyInArray!0 k!2747))))

(declare-fun b!1050672 () Bool)

(declare-fun e!596263 () Bool)

(assert (=> b!1050672 (= e!596261 e!596263)))

(declare-fun res!699798 () Bool)

(assert (=> b!1050672 (=> (not res!699798) (not e!596263))))

(declare-fun lt!464045 () array!66211)

(declare-fun arrayContainsKey!0 (array!66211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050672 (= res!699798 (arrayContainsKey!0 lt!464045 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050672 (= lt!464045 (array!66212 (store (arr!31845 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32381 a!3488)))))

(declare-fun res!699795 () Bool)

(assert (=> start!92410 (=> (not res!699795) (not e!596261))))

(assert (=> start!92410 (= res!699795 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32381 a!3488)) (bvslt (size!32381 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92410 e!596261))

(assert (=> start!92410 true))

(declare-fun array_inv!24625 (array!66211) Bool)

(assert (=> start!92410 (array_inv!24625 a!3488)))

(declare-fun b!1050673 () Bool)

(assert (=> b!1050673 (= e!596263 e!596262)))

(declare-fun res!699799 () Bool)

(assert (=> b!1050673 (=> (not res!699799) (not e!596262))))

(assert (=> b!1050673 (= res!699799 (not (= lt!464046 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66211 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050673 (= lt!464046 (arrayScanForKey!0 lt!464045 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050674 () Bool)

(declare-fun res!699800 () Bool)

(assert (=> b!1050674 (=> (not res!699800) (not e!596261))))

(assert (=> b!1050674 (= res!699800 (= (select (arr!31845 a!3488) i!1381) k!2747))))

(assert (= (and start!92410 res!699795) b!1050669))

(assert (= (and b!1050669 res!699796) b!1050671))

(assert (= (and b!1050671 res!699797) b!1050674))

(assert (= (and b!1050674 res!699800) b!1050672))

(assert (= (and b!1050672 res!699798) b!1050673))

(assert (= (and b!1050673 res!699799) b!1050670))

(declare-fun m!971341 () Bool)

(assert (=> b!1050669 m!971341))

(declare-fun m!971343 () Bool)

(assert (=> start!92410 m!971343))

(declare-fun m!971345 () Bool)

(assert (=> b!1050672 m!971345))

(declare-fun m!971347 () Bool)

(assert (=> b!1050672 m!971347))

(declare-fun m!971349 () Bool)

(assert (=> b!1050674 m!971349))

(declare-fun m!971351 () Bool)

(assert (=> b!1050673 m!971351))

(declare-fun m!971353 () Bool)

(assert (=> b!1050671 m!971353))

(assert (=> b!1050670 m!971347))

(declare-fun m!971355 () Bool)

(assert (=> b!1050670 m!971355))

(push 1)

(assert (not start!92410))

(assert (not b!1050672))

(assert (not b!1050671))

(assert (not b!1050669))

(assert (not b!1050673))

