; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135530 () Bool)

(assert start!135530)

(declare-fun res!1075628 () Bool)

(declare-fun e!877993 () Bool)

(assert (=> start!135530 (=> (not res!1075628) (not e!877993))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135530 (= res!1075628 (validMask!0 mask!877))))

(assert (=> start!135530 e!877993))

(assert (=> start!135530 true))

(declare-datatypes ((array!105233 0))(
  ( (array!105234 (arr!50765 (Array (_ BitVec 32) (_ BitVec 64))) (size!51315 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105233)

(declare-fun array_inv!39492 (array!105233) Bool)

(assert (=> start!135530 (array_inv!39492 _keys!591)))

(declare-fun b!1574335 () Bool)

(declare-fun res!1075627 () Bool)

(assert (=> b!1574335 (=> (not res!1075627) (not e!877993))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574335 (= res!1075627 (and (= (size!51315 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51315 _keys!591)) (bvslt i!537 (size!51315 _keys!591))))))

(declare-fun b!1574336 () Bool)

(declare-fun res!1075629 () Bool)

(assert (=> b!1574336 (=> (not res!1075629) (not e!877993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574336 (= res!1075629 (not (validKeyInArray!0 (select (arr!50765 _keys!591) i!537))))))

(declare-fun b!1574337 () Bool)

(assert (=> b!1574337 (= e!877993 (bvsge (bvsub (size!51315 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51315 _keys!591) i!537)))))

(assert (= (and start!135530 res!1075628) b!1574335))

(assert (= (and b!1574335 res!1075627) b!1574336))

(assert (= (and b!1574336 res!1075629) b!1574337))

(declare-fun m!1447587 () Bool)

(assert (=> start!135530 m!1447587))

(declare-fun m!1447589 () Bool)

(assert (=> start!135530 m!1447589))

(declare-fun m!1447591 () Bool)

(assert (=> b!1574336 m!1447591))

(assert (=> b!1574336 m!1447591))

(declare-fun m!1447593 () Bool)

(assert (=> b!1574336 m!1447593))

(check-sat (not start!135530) (not b!1574336))
(check-sat)
