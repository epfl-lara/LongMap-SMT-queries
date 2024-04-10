; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79136 () Bool)

(assert start!79136)

(declare-fun b_free!17349 () Bool)

(declare-fun b_next!17349 () Bool)

(assert (=> start!79136 (= b_free!17349 (not b_next!17349))))

(declare-fun tp!60488 () Bool)

(declare-fun b_and!28415 () Bool)

(assert (=> start!79136 (= tp!60488 b_and!28415)))

(declare-fun b!928863 () Bool)

(declare-fun e!521564 () Bool)

(declare-fun tp_is_empty!19857 () Bool)

(assert (=> b!928863 (= e!521564 tp_is_empty!19857)))

(declare-fun mapIsEmpty!31542 () Bool)

(declare-fun mapRes!31542 () Bool)

(assert (=> mapIsEmpty!31542 mapRes!31542))

(declare-fun b!928864 () Bool)

(declare-fun e!521566 () Bool)

(assert (=> b!928864 (= e!521566 false)))

(declare-datatypes ((V!31441 0))(
  ( (V!31442 (val!9979 Int)) )
))
(declare-fun lt!418954 () V!31441)

(declare-datatypes ((tuple2!13040 0))(
  ( (tuple2!13041 (_1!6531 (_ BitVec 64)) (_2!6531 V!31441)) )
))
(declare-datatypes ((List!18837 0))(
  ( (Nil!18834) (Cons!18833 (h!19979 tuple2!13040) (t!26894 List!18837)) )
))
(declare-datatypes ((ListLongMap!11737 0))(
  ( (ListLongMap!11738 (toList!5884 List!18837)) )
))
(declare-fun lt!418953 () ListLongMap!11737)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!713 (ListLongMap!11737 (_ BitVec 64)) V!31441)

(assert (=> b!928864 (= lt!418954 (apply!713 lt!418953 k0!1099))))

(declare-fun res!625491 () Bool)

(declare-fun e!521565 () Bool)

(assert (=> start!79136 (=> (not res!625491) (not e!521565))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79136 (= res!625491 (validMask!0 mask!1881))))

(assert (=> start!79136 e!521565))

(assert (=> start!79136 true))

(declare-datatypes ((ValueCell!9447 0))(
  ( (ValueCellFull!9447 (v!12497 V!31441)) (EmptyCell!9447) )
))
(declare-datatypes ((array!55668 0))(
  ( (array!55669 (arr!26779 (Array (_ BitVec 32) ValueCell!9447)) (size!27238 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55668)

(declare-fun e!521568 () Bool)

(declare-fun array_inv!20844 (array!55668) Bool)

(assert (=> start!79136 (and (array_inv!20844 _values!1231) e!521568)))

(assert (=> start!79136 tp!60488))

(declare-datatypes ((array!55670 0))(
  ( (array!55671 (arr!26780 (Array (_ BitVec 32) (_ BitVec 64))) (size!27239 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55670)

(declare-fun array_inv!20845 (array!55670) Bool)

(assert (=> start!79136 (array_inv!20845 _keys!1487)))

(assert (=> start!79136 tp_is_empty!19857))

(declare-fun b!928865 () Bool)

(declare-fun e!521567 () Bool)

(assert (=> b!928865 (= e!521568 (and e!521567 mapRes!31542))))

(declare-fun condMapEmpty!31542 () Bool)

(declare-fun mapDefault!31542 () ValueCell!9447)

(assert (=> b!928865 (= condMapEmpty!31542 (= (arr!26779 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9447)) mapDefault!31542)))))

(declare-fun b!928866 () Bool)

(declare-fun res!625487 () Bool)

(assert (=> b!928866 (=> (not res!625487) (not e!521565))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928866 (= res!625487 (and (= (size!27238 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27239 _keys!1487) (size!27238 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928867 () Bool)

(declare-fun res!625489 () Bool)

(assert (=> b!928867 (=> (not res!625489) (not e!521565))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928867 (= res!625489 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27239 _keys!1487))))))

(declare-fun mapNonEmpty!31542 () Bool)

(declare-fun tp!60487 () Bool)

(assert (=> mapNonEmpty!31542 (= mapRes!31542 (and tp!60487 e!521564))))

(declare-fun mapKey!31542 () (_ BitVec 32))

(declare-fun mapRest!31542 () (Array (_ BitVec 32) ValueCell!9447))

(declare-fun mapValue!31542 () ValueCell!9447)

(assert (=> mapNonEmpty!31542 (= (arr!26779 _values!1231) (store mapRest!31542 mapKey!31542 mapValue!31542))))

(declare-fun b!928868 () Bool)

(declare-fun res!625490 () Bool)

(assert (=> b!928868 (=> (not res!625490) (not e!521565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55670 (_ BitVec 32)) Bool)

(assert (=> b!928868 (= res!625490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928869 () Bool)

(assert (=> b!928869 (= e!521567 tp_is_empty!19857)))

(declare-fun b!928870 () Bool)

(assert (=> b!928870 (= e!521565 e!521566)))

(declare-fun res!625492 () Bool)

(assert (=> b!928870 (=> (not res!625492) (not e!521566))))

(declare-fun contains!4940 (ListLongMap!11737 (_ BitVec 64)) Bool)

(assert (=> b!928870 (= res!625492 (contains!4940 lt!418953 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31441)

(declare-fun minValue!1173 () V!31441)

(declare-fun getCurrentListMap!3131 (array!55670 array!55668 (_ BitVec 32) (_ BitVec 32) V!31441 V!31441 (_ BitVec 32) Int) ListLongMap!11737)

(assert (=> b!928870 (= lt!418953 (getCurrentListMap!3131 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928871 () Bool)

(declare-fun res!625488 () Bool)

(assert (=> b!928871 (=> (not res!625488) (not e!521565))))

(declare-datatypes ((List!18838 0))(
  ( (Nil!18835) (Cons!18834 (h!19980 (_ BitVec 64)) (t!26895 List!18838)) )
))
(declare-fun arrayNoDuplicates!0 (array!55670 (_ BitVec 32) List!18838) Bool)

(assert (=> b!928871 (= res!625488 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18835))))

(assert (= (and start!79136 res!625491) b!928866))

(assert (= (and b!928866 res!625487) b!928868))

(assert (= (and b!928868 res!625490) b!928871))

(assert (= (and b!928871 res!625488) b!928867))

(assert (= (and b!928867 res!625489) b!928870))

(assert (= (and b!928870 res!625492) b!928864))

(assert (= (and b!928865 condMapEmpty!31542) mapIsEmpty!31542))

(assert (= (and b!928865 (not condMapEmpty!31542)) mapNonEmpty!31542))

(get-info :version)

(assert (= (and mapNonEmpty!31542 ((_ is ValueCellFull!9447) mapValue!31542)) b!928863))

(assert (= (and b!928865 ((_ is ValueCellFull!9447) mapDefault!31542)) b!928869))

(assert (= start!79136 b!928865))

(declare-fun m!863625 () Bool)

(assert (=> b!928868 m!863625))

(declare-fun m!863627 () Bool)

(assert (=> start!79136 m!863627))

(declare-fun m!863629 () Bool)

(assert (=> start!79136 m!863629))

(declare-fun m!863631 () Bool)

(assert (=> start!79136 m!863631))

(declare-fun m!863633 () Bool)

(assert (=> b!928871 m!863633))

(declare-fun m!863635 () Bool)

(assert (=> mapNonEmpty!31542 m!863635))

(declare-fun m!863637 () Bool)

(assert (=> b!928870 m!863637))

(declare-fun m!863639 () Bool)

(assert (=> b!928870 m!863639))

(declare-fun m!863641 () Bool)

(assert (=> b!928864 m!863641))

(check-sat b_and!28415 (not b!928864) (not mapNonEmpty!31542) tp_is_empty!19857 (not b!928871) (not start!79136) (not b!928868) (not b!928870) (not b_next!17349))
(check-sat b_and!28415 (not b_next!17349))
