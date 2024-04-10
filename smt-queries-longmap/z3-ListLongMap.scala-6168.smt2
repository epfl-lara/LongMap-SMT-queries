; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79118 () Bool)

(assert start!79118)

(declare-fun b_free!17331 () Bool)

(declare-fun b_next!17331 () Bool)

(assert (=> start!79118 (= b_free!17331 (not b_next!17331))))

(declare-fun tp!60433 () Bool)

(declare-fun b_and!28397 () Bool)

(assert (=> start!79118 (= tp!60433 b_and!28397)))

(declare-fun b!928620 () Bool)

(declare-fun res!625328 () Bool)

(declare-fun e!521407 () Bool)

(assert (=> b!928620 (=> (not res!625328) (not e!521407))))

(declare-datatypes ((array!55638 0))(
  ( (array!55639 (arr!26764 (Array (_ BitVec 32) (_ BitVec 64))) (size!27223 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55638)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55638 (_ BitVec 32)) Bool)

(assert (=> b!928620 (= res!625328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928621 () Bool)

(declare-fun e!521402 () Bool)

(declare-fun e!521405 () Bool)

(declare-fun mapRes!31515 () Bool)

(assert (=> b!928621 (= e!521402 (and e!521405 mapRes!31515))))

(declare-fun condMapEmpty!31515 () Bool)

(declare-datatypes ((V!31417 0))(
  ( (V!31418 (val!9970 Int)) )
))
(declare-datatypes ((ValueCell!9438 0))(
  ( (ValueCellFull!9438 (v!12488 V!31417)) (EmptyCell!9438) )
))
(declare-datatypes ((array!55640 0))(
  ( (array!55641 (arr!26765 (Array (_ BitVec 32) ValueCell!9438)) (size!27224 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55640)

(declare-fun mapDefault!31515 () ValueCell!9438)

(assert (=> b!928621 (= condMapEmpty!31515 (= (arr!26765 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9438)) mapDefault!31515)))))

(declare-fun b!928622 () Bool)

(declare-fun e!521406 () Bool)

(assert (=> b!928622 (= e!521407 e!521406)))

(declare-fun res!625329 () Bool)

(assert (=> b!928622 (=> (not res!625329) (not e!521406))))

(declare-datatypes ((tuple2!13028 0))(
  ( (tuple2!13029 (_1!6525 (_ BitVec 64)) (_2!6525 V!31417)) )
))
(declare-datatypes ((List!18826 0))(
  ( (Nil!18823) (Cons!18822 (h!19968 tuple2!13028) (t!26883 List!18826)) )
))
(declare-datatypes ((ListLongMap!11725 0))(
  ( (ListLongMap!11726 (toList!5878 List!18826)) )
))
(declare-fun lt!418900 () ListLongMap!11725)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4935 (ListLongMap!11725 (_ BitVec 64)) Bool)

(assert (=> b!928622 (= res!625329 (contains!4935 lt!418900 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31417)

(declare-fun minValue!1173 () V!31417)

(declare-fun getCurrentListMap!3126 (array!55638 array!55640 (_ BitVec 32) (_ BitVec 32) V!31417 V!31417 (_ BitVec 32) Int) ListLongMap!11725)

(assert (=> b!928622 (= lt!418900 (getCurrentListMap!3126 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!625325 () Bool)

(assert (=> start!79118 (=> (not res!625325) (not e!521407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79118 (= res!625325 (validMask!0 mask!1881))))

(assert (=> start!79118 e!521407))

(assert (=> start!79118 true))

(declare-fun array_inv!20836 (array!55640) Bool)

(assert (=> start!79118 (and (array_inv!20836 _values!1231) e!521402)))

(assert (=> start!79118 tp!60433))

(declare-fun array_inv!20837 (array!55638) Bool)

(assert (=> start!79118 (array_inv!20837 _keys!1487)))

(declare-fun tp_is_empty!19839 () Bool)

(assert (=> start!79118 tp_is_empty!19839))

(declare-fun b!928623 () Bool)

(declare-fun res!625327 () Bool)

(assert (=> b!928623 (=> (not res!625327) (not e!521407))))

(assert (=> b!928623 (= res!625327 (and (= (size!27224 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27223 _keys!1487) (size!27224 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928624 () Bool)

(assert (=> b!928624 (= e!521406 false)))

(declare-fun lt!418899 () V!31417)

(declare-fun apply!707 (ListLongMap!11725 (_ BitVec 64)) V!31417)

(assert (=> b!928624 (= lt!418899 (apply!707 lt!418900 k0!1099))))

(declare-fun b!928625 () Bool)

(assert (=> b!928625 (= e!521405 tp_is_empty!19839)))

(declare-fun mapIsEmpty!31515 () Bool)

(assert (=> mapIsEmpty!31515 mapRes!31515))

(declare-fun b!928626 () Bool)

(declare-fun res!625330 () Bool)

(assert (=> b!928626 (=> (not res!625330) (not e!521407))))

(declare-datatypes ((List!18827 0))(
  ( (Nil!18824) (Cons!18823 (h!19969 (_ BitVec 64)) (t!26884 List!18827)) )
))
(declare-fun arrayNoDuplicates!0 (array!55638 (_ BitVec 32) List!18827) Bool)

(assert (=> b!928626 (= res!625330 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18824))))

(declare-fun mapNonEmpty!31515 () Bool)

(declare-fun tp!60434 () Bool)

(declare-fun e!521404 () Bool)

(assert (=> mapNonEmpty!31515 (= mapRes!31515 (and tp!60434 e!521404))))

(declare-fun mapKey!31515 () (_ BitVec 32))

(declare-fun mapValue!31515 () ValueCell!9438)

(declare-fun mapRest!31515 () (Array (_ BitVec 32) ValueCell!9438))

(assert (=> mapNonEmpty!31515 (= (arr!26765 _values!1231) (store mapRest!31515 mapKey!31515 mapValue!31515))))

(declare-fun b!928627 () Bool)

(assert (=> b!928627 (= e!521404 tp_is_empty!19839)))

(declare-fun b!928628 () Bool)

(declare-fun res!625326 () Bool)

(assert (=> b!928628 (=> (not res!625326) (not e!521407))))

(assert (=> b!928628 (= res!625326 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27223 _keys!1487))))))

(assert (= (and start!79118 res!625325) b!928623))

(assert (= (and b!928623 res!625327) b!928620))

(assert (= (and b!928620 res!625328) b!928626))

(assert (= (and b!928626 res!625330) b!928628))

(assert (= (and b!928628 res!625326) b!928622))

(assert (= (and b!928622 res!625329) b!928624))

(assert (= (and b!928621 condMapEmpty!31515) mapIsEmpty!31515))

(assert (= (and b!928621 (not condMapEmpty!31515)) mapNonEmpty!31515))

(get-info :version)

(assert (= (and mapNonEmpty!31515 ((_ is ValueCellFull!9438) mapValue!31515)) b!928627))

(assert (= (and b!928621 ((_ is ValueCellFull!9438) mapDefault!31515)) b!928625))

(assert (= start!79118 b!928621))

(declare-fun m!863463 () Bool)

(assert (=> start!79118 m!863463))

(declare-fun m!863465 () Bool)

(assert (=> start!79118 m!863465))

(declare-fun m!863467 () Bool)

(assert (=> start!79118 m!863467))

(declare-fun m!863469 () Bool)

(assert (=> b!928626 m!863469))

(declare-fun m!863471 () Bool)

(assert (=> b!928624 m!863471))

(declare-fun m!863473 () Bool)

(assert (=> mapNonEmpty!31515 m!863473))

(declare-fun m!863475 () Bool)

(assert (=> b!928622 m!863475))

(declare-fun m!863477 () Bool)

(assert (=> b!928622 m!863477))

(declare-fun m!863479 () Bool)

(assert (=> b!928620 m!863479))

(check-sat (not b!928622) (not start!79118) tp_is_empty!19839 (not b_next!17331) (not b!928626) (not mapNonEmpty!31515) b_and!28397 (not b!928624) (not b!928620))
(check-sat b_and!28397 (not b_next!17331))
