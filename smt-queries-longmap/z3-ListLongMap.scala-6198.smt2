; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79464 () Bool)

(assert start!79464)

(declare-fun b_free!17509 () Bool)

(declare-fun b_next!17509 () Bool)

(assert (=> start!79464 (= b_free!17509 (not b_next!17509))))

(declare-fun tp!60968 () Bool)

(declare-fun b_and!28585 () Bool)

(assert (=> start!79464 (= tp!60968 b_and!28585)))

(declare-fun b!932187 () Bool)

(declare-fun e!523588 () Bool)

(declare-fun tp_is_empty!20017 () Bool)

(assert (=> b!932187 (= e!523588 tp_is_empty!20017)))

(declare-fun b!932188 () Bool)

(declare-fun e!523591 () Bool)

(assert (=> b!932188 (= e!523591 tp_is_empty!20017)))

(declare-fun b!932189 () Bool)

(declare-fun e!523586 () Bool)

(declare-fun mapRes!31782 () Bool)

(assert (=> b!932189 (= e!523586 (and e!523588 mapRes!31782))))

(declare-fun condMapEmpty!31782 () Bool)

(declare-datatypes ((V!31655 0))(
  ( (V!31656 (val!10059 Int)) )
))
(declare-datatypes ((ValueCell!9527 0))(
  ( (ValueCellFull!9527 (v!12574 V!31655)) (EmptyCell!9527) )
))
(declare-datatypes ((array!56033 0))(
  ( (array!56034 (arr!26957 (Array (_ BitVec 32) ValueCell!9527)) (size!27417 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56033)

(declare-fun mapDefault!31782 () ValueCell!9527)

(assert (=> b!932189 (= condMapEmpty!31782 (= (arr!26957 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9527)) mapDefault!31782)))))

(declare-fun b!932190 () Bool)

(declare-fun res!627536 () Bool)

(declare-fun e!523590 () Bool)

(assert (=> b!932190 (=> (not res!627536) (not e!523590))))

(declare-datatypes ((array!56035 0))(
  ( (array!56036 (arr!26958 (Array (_ BitVec 32) (_ BitVec 64))) (size!27418 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56035)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56035 (_ BitVec 32)) Bool)

(assert (=> b!932190 (= res!627536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932192 () Bool)

(declare-fun e!523589 () Bool)

(assert (=> b!932192 (= e!523590 e!523589)))

(declare-fun res!627537 () Bool)

(assert (=> b!932192 (=> (not res!627537) (not e!523589))))

(declare-datatypes ((tuple2!13164 0))(
  ( (tuple2!13165 (_1!6593 (_ BitVec 64)) (_2!6593 V!31655)) )
))
(declare-datatypes ((List!18951 0))(
  ( (Nil!18948) (Cons!18947 (h!20099 tuple2!13164) (t!27000 List!18951)) )
))
(declare-datatypes ((ListLongMap!11863 0))(
  ( (ListLongMap!11864 (toList!5947 List!18951)) )
))
(declare-fun lt!419758 () ListLongMap!11863)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5012 (ListLongMap!11863 (_ BitVec 64)) Bool)

(assert (=> b!932192 (= res!627537 (contains!5012 lt!419758 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31655)

(declare-fun minValue!1173 () V!31655)

(declare-fun getCurrentListMap!3190 (array!56035 array!56033 (_ BitVec 32) (_ BitVec 32) V!31655 V!31655 (_ BitVec 32) Int) ListLongMap!11863)

(assert (=> b!932192 (= lt!419758 (getCurrentListMap!3190 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31782 () Bool)

(declare-fun tp!60969 () Bool)

(assert (=> mapNonEmpty!31782 (= mapRes!31782 (and tp!60969 e!523591))))

(declare-fun mapKey!31782 () (_ BitVec 32))

(declare-fun mapValue!31782 () ValueCell!9527)

(declare-fun mapRest!31782 () (Array (_ BitVec 32) ValueCell!9527))

(assert (=> mapNonEmpty!31782 (= (arr!26957 _values!1231) (store mapRest!31782 mapKey!31782 mapValue!31782))))

(declare-fun b!932193 () Bool)

(assert (=> b!932193 (= e!523589 false)))

(declare-fun lt!419759 () V!31655)

(declare-fun apply!779 (ListLongMap!11863 (_ BitVec 64)) V!31655)

(assert (=> b!932193 (= lt!419759 (apply!779 lt!419758 k0!1099))))

(declare-fun b!932194 () Bool)

(declare-fun res!627533 () Bool)

(assert (=> b!932194 (=> (not res!627533) (not e!523590))))

(assert (=> b!932194 (= res!627533 (and (= (size!27417 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27418 _keys!1487) (size!27417 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!627534 () Bool)

(assert (=> start!79464 (=> (not res!627534) (not e!523590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79464 (= res!627534 (validMask!0 mask!1881))))

(assert (=> start!79464 e!523590))

(assert (=> start!79464 true))

(declare-fun array_inv!21074 (array!56033) Bool)

(assert (=> start!79464 (and (array_inv!21074 _values!1231) e!523586)))

(assert (=> start!79464 tp!60968))

(declare-fun array_inv!21075 (array!56035) Bool)

(assert (=> start!79464 (array_inv!21075 _keys!1487)))

(assert (=> start!79464 tp_is_empty!20017))

(declare-fun b!932191 () Bool)

(declare-fun res!627532 () Bool)

(assert (=> b!932191 (=> (not res!627532) (not e!523590))))

(assert (=> b!932191 (= res!627532 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27418 _keys!1487))))))

(declare-fun b!932195 () Bool)

(declare-fun res!627535 () Bool)

(assert (=> b!932195 (=> (not res!627535) (not e!523590))))

(declare-datatypes ((List!18952 0))(
  ( (Nil!18949) (Cons!18948 (h!20100 (_ BitVec 64)) (t!27001 List!18952)) )
))
(declare-fun arrayNoDuplicates!0 (array!56035 (_ BitVec 32) List!18952) Bool)

(assert (=> b!932195 (= res!627535 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18949))))

(declare-fun mapIsEmpty!31782 () Bool)

(assert (=> mapIsEmpty!31782 mapRes!31782))

(assert (= (and start!79464 res!627534) b!932194))

(assert (= (and b!932194 res!627533) b!932190))

(assert (= (and b!932190 res!627536) b!932195))

(assert (= (and b!932195 res!627535) b!932191))

(assert (= (and b!932191 res!627532) b!932192))

(assert (= (and b!932192 res!627537) b!932193))

(assert (= (and b!932189 condMapEmpty!31782) mapIsEmpty!31782))

(assert (= (and b!932189 (not condMapEmpty!31782)) mapNonEmpty!31782))

(get-info :version)

(assert (= (and mapNonEmpty!31782 ((_ is ValueCellFull!9527) mapValue!31782)) b!932188))

(assert (= (and b!932189 ((_ is ValueCellFull!9527) mapDefault!31782)) b!932187))

(assert (= start!79464 b!932189))

(declare-fun m!866503 () Bool)

(assert (=> b!932195 m!866503))

(declare-fun m!866505 () Bool)

(assert (=> b!932193 m!866505))

(declare-fun m!866507 () Bool)

(assert (=> b!932192 m!866507))

(declare-fun m!866509 () Bool)

(assert (=> b!932192 m!866509))

(declare-fun m!866511 () Bool)

(assert (=> start!79464 m!866511))

(declare-fun m!866513 () Bool)

(assert (=> start!79464 m!866513))

(declare-fun m!866515 () Bool)

(assert (=> start!79464 m!866515))

(declare-fun m!866517 () Bool)

(assert (=> mapNonEmpty!31782 m!866517))

(declare-fun m!866519 () Bool)

(assert (=> b!932190 m!866519))

(check-sat (not mapNonEmpty!31782) (not b!932193) (not b!932195) tp_is_empty!20017 (not b!932192) (not b_next!17509) (not b!932190) b_and!28585 (not start!79464))
(check-sat b_and!28585 (not b_next!17509))
