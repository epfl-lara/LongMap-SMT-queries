; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36140 () Bool)

(assert start!36140)

(declare-fun b!362447 () Bool)

(declare-fun e!221979 () Bool)

(assert (=> b!362447 (= e!221979 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lt!166733 () (_ BitVec 32))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-datatypes ((array!20456 0))(
  ( (array!20457 (arr!9710 (Array (_ BitVec 32) (_ BitVec 64))) (size!10062 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20456)

(declare-fun arrayCountValidKeys!0 (array!20456 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362447 (= lt!166733 (arrayCountValidKeys!0 (array!20457 (store (arr!9710 a!4337) i!1478 k0!2980) (size!10062 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166732 () (_ BitVec 32))

(assert (=> b!362447 (= lt!166732 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362444 () Bool)

(declare-fun res!201735 () Bool)

(assert (=> b!362444 (=> (not res!201735) (not e!221979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362444 (= res!201735 (not (validKeyInArray!0 (select (arr!9710 a!4337) i!1478))))))

(declare-fun res!201736 () Bool)

(assert (=> start!36140 (=> (not res!201736) (not e!221979))))

(assert (=> start!36140 (= res!201736 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10062 a!4337))))))

(assert (=> start!36140 e!221979))

(assert (=> start!36140 true))

(declare-fun array_inv!7152 (array!20456) Bool)

(assert (=> start!36140 (array_inv!7152 a!4337)))

(declare-fun b!362445 () Bool)

(declare-fun res!201733 () Bool)

(assert (=> b!362445 (=> (not res!201733) (not e!221979))))

(assert (=> b!362445 (= res!201733 (validKeyInArray!0 k0!2980))))

(declare-fun b!362446 () Bool)

(declare-fun res!201734 () Bool)

(assert (=> b!362446 (=> (not res!201734) (not e!221979))))

(assert (=> b!362446 (= res!201734 (and (bvslt (size!10062 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10062 a!4337))))))

(assert (= (and start!36140 res!201736) b!362444))

(assert (= (and b!362444 res!201735) b!362445))

(assert (= (and b!362445 res!201733) b!362446))

(assert (= (and b!362446 res!201734) b!362447))

(declare-fun m!358981 () Bool)

(assert (=> b!362447 m!358981))

(declare-fun m!358983 () Bool)

(assert (=> b!362447 m!358983))

(declare-fun m!358985 () Bool)

(assert (=> b!362447 m!358985))

(declare-fun m!358987 () Bool)

(assert (=> b!362444 m!358987))

(assert (=> b!362444 m!358987))

(declare-fun m!358989 () Bool)

(assert (=> b!362444 m!358989))

(declare-fun m!358991 () Bool)

(assert (=> start!36140 m!358991))

(declare-fun m!358993 () Bool)

(assert (=> b!362445 m!358993))

(check-sat (not start!36140) (not b!362447) (not b!362445) (not b!362444))
