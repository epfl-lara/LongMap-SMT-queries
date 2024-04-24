; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78810 () Bool)

(assert start!78810)

(declare-fun b_free!16855 () Bool)

(declare-fun b_next!16855 () Bool)

(assert (=> start!78810 (= b_free!16855 (not b_next!16855))))

(declare-fun tp!59007 () Bool)

(declare-fun b_and!27487 () Bool)

(assert (=> start!78810 (= tp!59007 b_and!27487)))

(declare-fun b!917712 () Bool)

(declare-fun res!618410 () Bool)

(declare-fun e!515264 () Bool)

(assert (=> b!917712 (=> (not res!618410) (not e!515264))))

(declare-datatypes ((array!54759 0))(
  ( (array!54760 (arr!26320 (Array (_ BitVec 32) (_ BitVec 64))) (size!26780 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54759)

(declare-datatypes ((List!18423 0))(
  ( (Nil!18420) (Cons!18419 (h!19571 (_ BitVec 64)) (t!26028 List!18423)) )
))
(declare-fun arrayNoDuplicates!0 (array!54759 (_ BitVec 32) List!18423) Bool)

(assert (=> b!917712 (= res!618410 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18420))))

(declare-fun b!917713 () Bool)

(declare-fun res!618407 () Bool)

(assert (=> b!917713 (=> (not res!618407) (not e!515264))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54759 (_ BitVec 32)) Bool)

(assert (=> b!917713 (= res!618407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!618408 () Bool)

(assert (=> start!78810 (=> (not res!618408) (not e!515264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78810 (= res!618408 (validMask!0 mask!1881))))

(assert (=> start!78810 e!515264))

(assert (=> start!78810 true))

(declare-datatypes ((V!30783 0))(
  ( (V!30784 (val!9732 Int)) )
))
(declare-datatypes ((ValueCell!9200 0))(
  ( (ValueCellFull!9200 (v!12247 V!30783)) (EmptyCell!9200) )
))
(declare-datatypes ((array!54761 0))(
  ( (array!54762 (arr!26321 (Array (_ BitVec 32) ValueCell!9200)) (size!26781 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54761)

(declare-fun e!515266 () Bool)

(declare-fun array_inv!20630 (array!54761) Bool)

(assert (=> start!78810 (and (array_inv!20630 _values!1231) e!515266)))

(assert (=> start!78810 tp!59007))

(declare-fun array_inv!20631 (array!54759) Bool)

(assert (=> start!78810 (array_inv!20631 _keys!1487)))

(declare-fun tp_is_empty!19363 () Bool)

(assert (=> start!78810 tp_is_empty!19363))

(declare-fun mapIsEmpty!30801 () Bool)

(declare-fun mapRes!30801 () Bool)

(assert (=> mapIsEmpty!30801 mapRes!30801))

(declare-fun b!917714 () Bool)

(declare-fun e!515265 () Bool)

(assert (=> b!917714 (= e!515264 e!515265)))

(declare-fun res!618409 () Bool)

(assert (=> b!917714 (=> (not res!618409) (not e!515265))))

(declare-datatypes ((tuple2!12598 0))(
  ( (tuple2!12599 (_1!6310 (_ BitVec 64)) (_2!6310 V!30783)) )
))
(declare-datatypes ((List!18424 0))(
  ( (Nil!18421) (Cons!18420 (h!19572 tuple2!12598) (t!26029 List!18424)) )
))
(declare-datatypes ((ListLongMap!11297 0))(
  ( (ListLongMap!11298 (toList!5664 List!18424)) )
))
(declare-fun lt!412235 () ListLongMap!11297)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4723 (ListLongMap!11297 (_ BitVec 64)) Bool)

(assert (=> b!917714 (= res!618409 (contains!4723 lt!412235 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30783)

(declare-fun minValue!1173 () V!30783)

(declare-fun getCurrentListMap!2920 (array!54759 array!54761 (_ BitVec 32) (_ BitVec 32) V!30783 V!30783 (_ BitVec 32) Int) ListLongMap!11297)

(assert (=> b!917714 (= lt!412235 (getCurrentListMap!2920 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30801 () Bool)

(declare-fun tp!59006 () Bool)

(declare-fun e!515261 () Bool)

(assert (=> mapNonEmpty!30801 (= mapRes!30801 (and tp!59006 e!515261))))

(declare-fun mapKey!30801 () (_ BitVec 32))

(declare-fun mapValue!30801 () ValueCell!9200)

(declare-fun mapRest!30801 () (Array (_ BitVec 32) ValueCell!9200))

(assert (=> mapNonEmpty!30801 (= (arr!26321 _values!1231) (store mapRest!30801 mapKey!30801 mapValue!30801))))

(declare-fun b!917715 () Bool)

(declare-fun e!515262 () Bool)

(assert (=> b!917715 (= e!515262 tp_is_empty!19363)))

(declare-fun b!917716 () Bool)

(declare-fun res!618411 () Bool)

(assert (=> b!917716 (=> (not res!618411) (not e!515264))))

(assert (=> b!917716 (= res!618411 (and (= (size!26781 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26780 _keys!1487) (size!26781 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917717 () Bool)

(assert (=> b!917717 (= e!515266 (and e!515262 mapRes!30801))))

(declare-fun condMapEmpty!30801 () Bool)

(declare-fun mapDefault!30801 () ValueCell!9200)

(assert (=> b!917717 (= condMapEmpty!30801 (= (arr!26321 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9200)) mapDefault!30801)))))

(declare-fun b!917718 () Bool)

(assert (=> b!917718 (= e!515265 false)))

(declare-fun lt!412234 () V!30783)

(declare-fun apply!546 (ListLongMap!11297 (_ BitVec 64)) V!30783)

(assert (=> b!917718 (= lt!412234 (apply!546 lt!412235 k0!1099))))

(declare-fun b!917719 () Bool)

(declare-fun res!618406 () Bool)

(assert (=> b!917719 (=> (not res!618406) (not e!515264))))

(assert (=> b!917719 (= res!618406 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26780 _keys!1487))))))

(declare-fun b!917720 () Bool)

(assert (=> b!917720 (= e!515261 tp_is_empty!19363)))

(assert (= (and start!78810 res!618408) b!917716))

(assert (= (and b!917716 res!618411) b!917713))

(assert (= (and b!917713 res!618407) b!917712))

(assert (= (and b!917712 res!618410) b!917719))

(assert (= (and b!917719 res!618406) b!917714))

(assert (= (and b!917714 res!618409) b!917718))

(assert (= (and b!917717 condMapEmpty!30801) mapIsEmpty!30801))

(assert (= (and b!917717 (not condMapEmpty!30801)) mapNonEmpty!30801))

(get-info :version)

(assert (= (and mapNonEmpty!30801 ((_ is ValueCellFull!9200) mapValue!30801)) b!917720))

(assert (= (and b!917717 ((_ is ValueCellFull!9200) mapDefault!30801)) b!917715))

(assert (= start!78810 b!917717))

(declare-fun m!852007 () Bool)

(assert (=> start!78810 m!852007))

(declare-fun m!852009 () Bool)

(assert (=> start!78810 m!852009))

(declare-fun m!852011 () Bool)

(assert (=> start!78810 m!852011))

(declare-fun m!852013 () Bool)

(assert (=> b!917712 m!852013))

(declare-fun m!852015 () Bool)

(assert (=> b!917714 m!852015))

(declare-fun m!852017 () Bool)

(assert (=> b!917714 m!852017))

(declare-fun m!852019 () Bool)

(assert (=> b!917713 m!852019))

(declare-fun m!852021 () Bool)

(assert (=> mapNonEmpty!30801 m!852021))

(declare-fun m!852023 () Bool)

(assert (=> b!917718 m!852023))

(check-sat tp_is_empty!19363 (not start!78810) (not b!917712) (not b!917713) (not b!917718) (not mapNonEmpty!30801) (not b_next!16855) b_and!27487 (not b!917714))
(check-sat b_and!27487 (not b_next!16855))
