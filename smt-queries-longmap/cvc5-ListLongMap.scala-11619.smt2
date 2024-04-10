; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135570 () Bool)

(assert start!135570)

(declare-fun res!1075727 () Bool)

(declare-fun e!878059 () Bool)

(assert (=> start!135570 (=> (not res!1075727) (not e!878059))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135570 (= res!1075727 (validMask!0 mask!898))))

(assert (=> start!135570 e!878059))

(assert (=> start!135570 true))

(declare-datatypes ((array!105258 0))(
  ( (array!105259 (arr!50776 (Array (_ BitVec 32) (_ BitVec 64))) (size!51326 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105258)

(declare-fun array_inv!39503 (array!105258) Bool)

(assert (=> start!135570 (array_inv!39503 _keys!605)))

(declare-fun b!1574434 () Bool)

(declare-fun res!1075728 () Bool)

(assert (=> b!1574434 (=> (not res!1075728) (not e!878059))))

(assert (=> b!1574434 (= res!1075728 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51326 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574435 () Bool)

(declare-fun res!1075726 () Bool)

(assert (=> b!1574435 (=> (not res!1075726) (not e!878059))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574435 (= res!1075726 (validKeyInArray!0 k!761))))

(declare-fun b!1574436 () Bool)

(assert (=> b!1574436 (= e!878059 false)))

(declare-fun lt!674797 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574436 (= lt!674797 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135570 res!1075727) b!1574434))

(assert (= (and b!1574434 res!1075728) b!1574435))

(assert (= (and b!1574435 res!1075726) b!1574436))

(declare-fun m!1447669 () Bool)

(assert (=> start!135570 m!1447669))

(declare-fun m!1447671 () Bool)

(assert (=> start!135570 m!1447671))

(declare-fun m!1447673 () Bool)

(assert (=> b!1574435 m!1447673))

(declare-fun m!1447675 () Bool)

(assert (=> b!1574436 m!1447675))

(push 1)

(assert (not b!1574436))

(assert (not start!135570))

(assert (not b!1574435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

