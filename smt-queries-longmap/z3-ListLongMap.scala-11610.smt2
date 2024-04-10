; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135468 () Bool)

(assert start!135468)

(declare-fun res!1075456 () Bool)

(declare-fun e!877876 () Bool)

(assert (=> start!135468 (=> (not res!1075456) (not e!877876))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135468 (= res!1075456 (validMask!0 mask!877))))

(assert (=> start!135468 e!877876))

(assert (=> start!135468 true))

(declare-datatypes ((array!105199 0))(
  ( (array!105200 (arr!50750 (Array (_ BitVec 32) (_ BitVec 64))) (size!51300 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105199)

(declare-fun array_inv!39477 (array!105199) Bool)

(assert (=> start!135468 (array_inv!39477 _keys!591)))

(declare-fun b!1574164 () Bool)

(declare-fun res!1075457 () Bool)

(assert (=> b!1574164 (=> (not res!1075457) (not e!877876))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574164 (= res!1075457 (and (= (size!51300 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51300 _keys!591)) (bvslt i!537 (size!51300 _keys!591))))))

(declare-fun b!1574165 () Bool)

(declare-fun res!1075458 () Bool)

(assert (=> b!1574165 (=> (not res!1075458) (not e!877876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574165 (= res!1075458 (not (validKeyInArray!0 (select (arr!50750 _keys!591) i!537))))))

(declare-fun b!1574166 () Bool)

(assert (=> b!1574166 (= e!877876 (bvslt (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(assert (= (and start!135468 res!1075456) b!1574164))

(assert (= (and b!1574164 res!1075457) b!1574165))

(assert (= (and b!1574165 res!1075458) b!1574166))

(declare-fun m!1447425 () Bool)

(assert (=> start!135468 m!1447425))

(declare-fun m!1447427 () Bool)

(assert (=> start!135468 m!1447427))

(declare-fun m!1447429 () Bool)

(assert (=> b!1574165 m!1447429))

(assert (=> b!1574165 m!1447429))

(declare-fun m!1447431 () Bool)

(assert (=> b!1574165 m!1447431))

(check-sat (not b!1574165) (not start!135468))
(check-sat)
