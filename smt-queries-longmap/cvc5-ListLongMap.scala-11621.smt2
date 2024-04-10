; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135606 () Bool)

(assert start!135606)

(declare-fun res!1075784 () Bool)

(declare-fun e!878096 () Bool)

(assert (=> start!135606 (=> (not res!1075784) (not e!878096))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135606 (= res!1075784 (validMask!0 mask!898))))

(assert (=> start!135606 e!878096))

(assert (=> start!135606 true))

(declare-datatypes ((array!105273 0))(
  ( (array!105274 (arr!50782 (Array (_ BitVec 32) (_ BitVec 64))) (size!51332 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105273)

(declare-fun array_inv!39509 (array!105273) Bool)

(assert (=> start!135606 (array_inv!39509 _keys!605)))

(declare-fun b!1574488 () Bool)

(declare-fun res!1075785 () Bool)

(assert (=> b!1574488 (=> (not res!1075785) (not e!878096))))

(assert (=> b!1574488 (= res!1075785 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51332 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574489 () Bool)

(declare-fun res!1075783 () Bool)

(assert (=> b!1574489 (=> (not res!1075783) (not e!878096))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574489 (= res!1075783 (validKeyInArray!0 k!761))))

(declare-fun b!1574490 () Bool)

(assert (=> b!1574490 (= e!878096 false)))

(declare-fun lt!674833 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574490 (= lt!674833 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135606 res!1075784) b!1574488))

(assert (= (and b!1574488 res!1075785) b!1574489))

(assert (= (and b!1574489 res!1075783) b!1574490))

(declare-fun m!1447717 () Bool)

(assert (=> start!135606 m!1447717))

(declare-fun m!1447719 () Bool)

(assert (=> start!135606 m!1447719))

(declare-fun m!1447721 () Bool)

(assert (=> b!1574489 m!1447721))

(declare-fun m!1447723 () Bool)

(assert (=> b!1574490 m!1447723))

(push 1)

(assert (not b!1574490))

(assert (not start!135606))

(assert (not b!1574489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

