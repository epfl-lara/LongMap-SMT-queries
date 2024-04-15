; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135524 () Bool)

(assert start!135524)

(declare-fun res!1075562 () Bool)

(declare-fun e!877838 () Bool)

(assert (=> start!135524 (=> (not res!1075562) (not e!877838))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135524 (= res!1075562 (validMask!0 mask!898))))

(assert (=> start!135524 e!877838))

(assert (=> start!135524 true))

(declare-datatypes ((array!105180 0))(
  ( (array!105181 (arr!50737 (Array (_ BitVec 32) (_ BitVec 64))) (size!51289 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105180)

(declare-fun array_inv!39673 (array!105180) Bool)

(assert (=> start!135524 (array_inv!39673 _keys!605)))

(declare-fun b!1574085 () Bool)

(declare-fun res!1075561 () Bool)

(assert (=> b!1574085 (=> (not res!1075561) (not e!877838))))

(assert (=> b!1574085 (= res!1075561 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51289 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574086 () Bool)

(declare-fun res!1075563 () Bool)

(assert (=> b!1574086 (=> (not res!1075563) (not e!877838))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574086 (= res!1075563 (validKeyInArray!0 k!761))))

(declare-fun b!1574087 () Bool)

(assert (=> b!1574087 (= e!877838 false)))

(declare-fun lt!674499 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574087 (= lt!674499 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135524 res!1075562) b!1574085))

(assert (= (and b!1574085 res!1075561) b!1574086))

(assert (= (and b!1574086 res!1075563) b!1574087))

(declare-fun m!1446745 () Bool)

(assert (=> start!135524 m!1446745))

(declare-fun m!1446747 () Bool)

(assert (=> start!135524 m!1446747))

(declare-fun m!1446749 () Bool)

(assert (=> b!1574086 m!1446749))

(declare-fun m!1446751 () Bool)

(assert (=> b!1574087 m!1446751))

(push 1)

(assert (not b!1574087))

(assert (not start!135524))

(assert (not b!1574086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

