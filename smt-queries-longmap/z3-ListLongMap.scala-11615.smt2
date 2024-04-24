; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135952 () Bool)

(assert start!135952)

(declare-fun res!1076480 () Bool)

(declare-fun e!879497 () Bool)

(assert (=> start!135952 (=> (not res!1076480) (not e!879497))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135952 (= res!1076480 (validMask!0 mask!877))))

(assert (=> start!135952 e!879497))

(assert (=> start!135952 true))

(declare-datatypes ((array!105356 0))(
  ( (array!105357 (arr!50818 (Array (_ BitVec 32) (_ BitVec 64))) (size!51369 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105356)

(declare-fun array_inv!39773 (array!105356) Bool)

(assert (=> start!135952 (array_inv!39773 _keys!591)))

(declare-fun b!1576762 () Bool)

(declare-fun res!1076478 () Bool)

(assert (=> b!1576762 (=> (not res!1076478) (not e!879497))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576762 (= res!1076478 (and (= (size!51369 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51369 _keys!591)) (bvslt i!537 (size!51369 _keys!591))))))

(declare-fun b!1576763 () Bool)

(declare-fun res!1076479 () Bool)

(assert (=> b!1576763 (=> (not res!1076479) (not e!879497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576763 (= res!1076479 (not (validKeyInArray!0 (select (arr!50818 _keys!591) i!537))))))

(declare-fun b!1576764 () Bool)

(assert (=> b!1576764 (= e!879497 (bvsge (bvsub (size!51369 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51369 _keys!591) i!537)))))

(assert (= (and start!135952 res!1076480) b!1576762))

(assert (= (and b!1576762 res!1076478) b!1576763))

(assert (= (and b!1576763 res!1076479) b!1576764))

(declare-fun m!1449837 () Bool)

(assert (=> start!135952 m!1449837))

(declare-fun m!1449839 () Bool)

(assert (=> start!135952 m!1449839))

(declare-fun m!1449841 () Bool)

(assert (=> b!1576763 m!1449841))

(assert (=> b!1576763 m!1449841))

(declare-fun m!1449843 () Bool)

(assert (=> b!1576763 m!1449843))

(check-sat (not start!135952) (not b!1576763))
(check-sat)
