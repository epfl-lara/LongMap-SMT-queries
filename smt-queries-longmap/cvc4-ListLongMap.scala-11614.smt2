; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135526 () Bool)

(assert start!135526)

(declare-fun res!1075611 () Bool)

(declare-fun e!877981 () Bool)

(assert (=> start!135526 (=> (not res!1075611) (not e!877981))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135526 (= res!1075611 (validMask!0 mask!877))))

(assert (=> start!135526 e!877981))

(assert (=> start!135526 true))

(declare-datatypes ((array!105229 0))(
  ( (array!105230 (arr!50763 (Array (_ BitVec 32) (_ BitVec 64))) (size!51313 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105229)

(declare-fun array_inv!39490 (array!105229) Bool)

(assert (=> start!135526 (array_inv!39490 _keys!591)))

(declare-fun b!1574318 () Bool)

(declare-fun e!877980 () Bool)

(assert (=> b!1574318 (= e!877981 (not e!877980))))

(declare-fun res!1075609 () Bool)

(assert (=> b!1574318 (=> res!1075609 e!877980)))

(declare-fun i!537 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13652 0))(
  ( (MissingZero!13652 (index!57006 (_ BitVec 32))) (Found!13652 (index!57007 (_ BitVec 32))) (Intermediate!13652 (undefined!14464 Bool) (index!57008 (_ BitVec 32)) (x!141887 (_ BitVec 32))) (Undefined!13652) (MissingVacant!13652 (index!57009 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105229 (_ BitVec 32)) SeekEntryResult!13652)

(assert (=> b!1574318 (= res!1075609 (not (= (seekEntryOrOpen!0 (select (arr!50763 _keys!591) i!537) _keys!591 mask!877) (Found!13652 i!537))))))

(declare-fun arrayContainsKey!0 (array!105229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574318 (arrayContainsKey!0 _keys!591 (select (arr!50763 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52172 0))(
  ( (Unit!52173) )
))
(declare-fun lt!674776 () Unit!52172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105229 (_ BitVec 64) (_ BitVec 32)) Unit!52172)

(assert (=> b!1574318 (= lt!674776 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50763 _keys!591) i!537) i!537))))

(declare-fun b!1574317 () Bool)

(declare-fun res!1075610 () Bool)

(assert (=> b!1574317 (=> (not res!1075610) (not e!877981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574317 (= res!1075610 (validKeyInArray!0 (select (arr!50763 _keys!591) i!537)))))

(declare-fun b!1574316 () Bool)

(declare-fun res!1075608 () Bool)

(assert (=> b!1574316 (=> (not res!1075608) (not e!877981))))

(assert (=> b!1574316 (= res!1075608 (and (= (size!51313 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51313 _keys!591)) (bvslt i!537 (size!51313 _keys!591))))))

(declare-fun b!1574319 () Bool)

(assert (=> b!1574319 (= e!877980 (bvslt (bvsub (size!51313 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51313 _keys!591) i!537)))))

(assert (= (and start!135526 res!1075611) b!1574316))

(assert (= (and b!1574316 res!1075608) b!1574317))

(assert (= (and b!1574317 res!1075610) b!1574318))

(assert (= (and b!1574318 (not res!1075609)) b!1574319))

(declare-fun m!1447565 () Bool)

(assert (=> start!135526 m!1447565))

(declare-fun m!1447567 () Bool)

(assert (=> start!135526 m!1447567))

(declare-fun m!1447569 () Bool)

(assert (=> b!1574318 m!1447569))

(assert (=> b!1574318 m!1447569))

(declare-fun m!1447571 () Bool)

(assert (=> b!1574318 m!1447571))

(assert (=> b!1574318 m!1447569))

(declare-fun m!1447573 () Bool)

(assert (=> b!1574318 m!1447573))

(assert (=> b!1574318 m!1447569))

(declare-fun m!1447575 () Bool)

(assert (=> b!1574318 m!1447575))

(assert (=> b!1574317 m!1447569))

(assert (=> b!1574317 m!1447569))

(declare-fun m!1447577 () Bool)

(assert (=> b!1574317 m!1447577))

(push 1)

(assert (not b!1574317))

(assert (not b!1574318))

(assert (not start!135526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

