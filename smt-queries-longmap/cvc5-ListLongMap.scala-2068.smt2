; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35576 () Bool)

(assert start!35576)

(declare-fun b!356691 () Bool)

(declare-fun e!218514 () Bool)

(assert (=> b!356691 (= e!218514 (not true))))

(declare-datatypes ((array!19627 0))(
  ( (array!19628 (arr!9307 (Array (_ BitVec 32) (_ BitVec 64))) (size!9659 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19627)

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356691 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11683 0))(
  ( (V!11684 (val!4059 Int)) )
))
(declare-fun minValue!1150 () V!11683)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10982 0))(
  ( (Unit!10983) )
))
(declare-fun lt!165959 () Unit!10982)

(declare-datatypes ((ValueCell!3671 0))(
  ( (ValueCellFull!3671 (v!6253 V!11683)) (EmptyCell!3671) )
))
(declare-datatypes ((array!19629 0))(
  ( (array!19630 (arr!9308 (Array (_ BitVec 32) ValueCell!3671)) (size!9660 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19629)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11683)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!10 (array!19627 array!19629 (_ BitVec 32) (_ BitVec 32) V!11683 V!11683 (_ BitVec 64) (_ BitVec 32)) Unit!10982)

(assert (=> b!356691 (= lt!165959 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!10 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun res!197967 () Bool)

(assert (=> start!35576 (=> (not res!197967) (not e!218514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35576 (= res!197967 (validMask!0 mask!1842))))

(assert (=> start!35576 e!218514))

(declare-fun tp_is_empty!8029 () Bool)

(assert (=> start!35576 tp_is_empty!8029))

(assert (=> start!35576 true))

(declare-fun array_inv!6840 (array!19627) Bool)

(assert (=> start!35576 (array_inv!6840 _keys!1456)))

(declare-fun e!218513 () Bool)

(declare-fun array_inv!6841 (array!19629) Bool)

(assert (=> start!35576 (and (array_inv!6841 _values!1208) e!218513)))

(declare-fun b!356692 () Bool)

(declare-fun e!218515 () Bool)

(assert (=> b!356692 (= e!218515 tp_is_empty!8029)))

(declare-fun b!356693 () Bool)

(declare-fun res!197971 () Bool)

(assert (=> b!356693 (=> (not res!197971) (not e!218514))))

(assert (=> b!356693 (= res!197971 (and (= (size!9660 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9659 _keys!1456) (size!9660 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356694 () Bool)

(declare-fun res!197966 () Bool)

(assert (=> b!356694 (=> (not res!197966) (not e!218514))))

(assert (=> b!356694 (= res!197966 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9659 _keys!1456))))))

(declare-fun mapIsEmpty!13551 () Bool)

(declare-fun mapRes!13551 () Bool)

(assert (=> mapIsEmpty!13551 mapRes!13551))

(declare-fun b!356695 () Bool)

(declare-fun e!218516 () Bool)

(assert (=> b!356695 (= e!218513 (and e!218516 mapRes!13551))))

(declare-fun condMapEmpty!13551 () Bool)

(declare-fun mapDefault!13551 () ValueCell!3671)

