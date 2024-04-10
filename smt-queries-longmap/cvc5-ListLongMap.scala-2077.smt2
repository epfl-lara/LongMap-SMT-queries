; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35630 () Bool)

(assert start!35630)

(declare-fun b_free!7885 () Bool)

(declare-fun b_next!7885 () Bool)

(assert (=> start!35630 (= b_free!7885 (not b_next!7885))))

(declare-fun tp!27638 () Bool)

(declare-fun b_and!15127 () Bool)

(assert (=> start!35630 (= tp!27638 b_and!15127)))

(declare-fun mapNonEmpty!13632 () Bool)

(declare-fun mapRes!13632 () Bool)

(declare-fun tp!27639 () Bool)

(declare-fun e!218946 () Bool)

(assert (=> mapNonEmpty!13632 (= mapRes!13632 (and tp!27639 e!218946))))

(declare-datatypes ((V!11755 0))(
  ( (V!11756 (val!4086 Int)) )
))
(declare-datatypes ((ValueCell!3698 0))(
  ( (ValueCellFull!3698 (v!6280 V!11755)) (EmptyCell!3698) )
))
(declare-fun mapRest!13632 () (Array (_ BitVec 32) ValueCell!3698))

(declare-fun mapValue!13632 () ValueCell!3698)

(declare-fun mapKey!13632 () (_ BitVec 32))

(declare-datatypes ((array!19733 0))(
  ( (array!19734 (arr!9360 (Array (_ BitVec 32) ValueCell!3698)) (size!9712 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19733)

(assert (=> mapNonEmpty!13632 (= (arr!9360 _values!1208) (store mapRest!13632 mapKey!13632 mapValue!13632))))

(declare-fun b!357611 () Bool)

(declare-fun tp_is_empty!8083 () Bool)

(assert (=> b!357611 (= e!218946 tp_is_empty!8083)))

(declare-fun b!357612 () Bool)

(declare-fun res!198641 () Bool)

(declare-fun e!218950 () Bool)

(assert (=> b!357612 (=> (not res!198641) (not e!218950))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19735 0))(
  ( (array!19736 (arr!9361 (Array (_ BitVec 32) (_ BitVec 64))) (size!9713 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19735)

(assert (=> b!357612 (= res!198641 (and (= (size!9712 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9713 _keys!1456) (size!9712 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357613 () Bool)

(declare-fun e!218949 () Bool)

(assert (=> b!357613 (= e!218950 (not e!218949))))

(declare-fun res!198642 () Bool)

(assert (=> b!357613 (=> res!198642 e!218949)))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!357613 (= res!198642 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9713 _keys!1456))))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357613 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11755)

(declare-datatypes ((Unit!11022 0))(
  ( (Unit!11023) )
))
(declare-fun lt!166070 () Unit!11022)

(declare-fun zeroValue!1150 () V!11755)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!30 (array!19735 array!19733 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 64) (_ BitVec 32)) Unit!11022)

(assert (=> b!357613 (= lt!166070 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!30 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357614 () Bool)

(declare-fun res!198645 () Bool)

(assert (=> b!357614 (=> (not res!198645) (not e!218950))))

(declare-datatypes ((List!5402 0))(
  ( (Nil!5399) (Cons!5398 (h!6254 (_ BitVec 64)) (t!10552 List!5402)) )
))
(declare-fun arrayNoDuplicates!0 (array!19735 (_ BitVec 32) List!5402) Bool)

(assert (=> b!357614 (= res!198645 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5399))))

(declare-fun b!357615 () Bool)

(declare-fun res!198648 () Bool)

(assert (=> b!357615 (=> (not res!198648) (not e!218950))))

(assert (=> b!357615 (= res!198648 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9713 _keys!1456))))))

(declare-fun b!357616 () Bool)

(declare-fun res!198649 () Bool)

(assert (=> b!357616 (=> (not res!198649) (not e!218950))))

(assert (=> b!357616 (= res!198649 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!357618 () Bool)

(declare-fun res!198644 () Bool)

(assert (=> b!357618 (=> (not res!198644) (not e!218950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19735 (_ BitVec 32)) Bool)

(assert (=> b!357618 (= res!198644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357619 () Bool)

(declare-fun res!198643 () Bool)

(assert (=> b!357619 (=> (not res!198643) (not e!218950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357619 (= res!198643 (validKeyInArray!0 k!1077))))

(declare-fun b!357620 () Bool)

(declare-fun res!198647 () Bool)

(assert (=> b!357620 (=> (not res!198647) (not e!218950))))

(assert (=> b!357620 (= res!198647 (not (= (select (arr!9361 _keys!1456) from!1805) k!1077)))))

(declare-fun mapIsEmpty!13632 () Bool)

(assert (=> mapIsEmpty!13632 mapRes!13632))

(declare-fun b!357621 () Bool)

(assert (=> b!357621 (= e!218949 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5710 0))(
  ( (tuple2!5711 (_1!2866 (_ BitVec 64)) (_2!2866 V!11755)) )
))
(declare-datatypes ((List!5403 0))(
  ( (Nil!5400) (Cons!5399 (h!6255 tuple2!5710) (t!10553 List!5403)) )
))
(declare-datatypes ((ListLongMap!4623 0))(
  ( (ListLongMap!4624 (toList!2327 List!5403)) )
))
(declare-fun contains!2407 (ListLongMap!4623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1848 (array!19735 array!19733 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 32) Int) ListLongMap!4623)

(assert (=> b!357621 (contains!2407 (getCurrentListMap!1848 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-fun lt!166069 () Unit!11022)

(declare-fun lemmaArrayContainsKeyThenInListMap!343 (array!19735 array!19733 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 64) (_ BitVec 32) Int) Unit!11022)

(assert (=> b!357621 (= lt!166069 (lemmaArrayContainsKeyThenInListMap!343 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357622 () Bool)

(declare-fun e!218948 () Bool)

(assert (=> b!357622 (= e!218948 tp_is_empty!8083)))

(declare-fun b!357617 () Bool)

(declare-fun e!218951 () Bool)

(assert (=> b!357617 (= e!218951 (and e!218948 mapRes!13632))))

(declare-fun condMapEmpty!13632 () Bool)

(declare-fun mapDefault!13632 () ValueCell!3698)

