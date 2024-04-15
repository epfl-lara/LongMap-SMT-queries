; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112722 () Bool)

(assert start!112722)

(declare-fun b_free!31033 () Bool)

(declare-fun b_next!31033 () Bool)

(assert (=> start!112722 (= b_free!31033 (not b_next!31033))))

(declare-fun tp!108743 () Bool)

(declare-fun b_and!49993 () Bool)

(assert (=> start!112722 (= tp!108743 b_and!49993)))

(declare-fun b!1337050 () Bool)

(declare-fun res!887301 () Bool)

(declare-fun e!761363 () Bool)

(assert (=> b!1337050 (=> (not res!887301) (not e!761363))))

(declare-datatypes ((array!90691 0))(
  ( (array!90692 (arr!43810 (Array (_ BitVec 32) (_ BitVec 64))) (size!44362 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90691)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90691 (_ BitVec 32)) Bool)

(assert (=> b!1337050 (= res!887301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337051 () Bool)

(declare-fun e!761361 () Bool)

(declare-fun e!761360 () Bool)

(declare-fun mapRes!57095 () Bool)

(assert (=> b!1337051 (= e!761361 (and e!761360 mapRes!57095))))

(declare-fun condMapEmpty!57095 () Bool)

(declare-datatypes ((V!54361 0))(
  ( (V!54362 (val!18546 Int)) )
))
(declare-datatypes ((ValueCell!17573 0))(
  ( (ValueCellFull!17573 (v!21186 V!54361)) (EmptyCell!17573) )
))
(declare-datatypes ((array!90693 0))(
  ( (array!90694 (arr!43811 (Array (_ BitVec 32) ValueCell!17573)) (size!44363 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90693)

(declare-fun mapDefault!57095 () ValueCell!17573)

(assert (=> b!1337051 (= condMapEmpty!57095 (= (arr!43811 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17573)) mapDefault!57095)))))

(declare-fun b!1337052 () Bool)

(declare-fun e!761359 () Bool)

(declare-fun tp_is_empty!36943 () Bool)

(assert (=> b!1337052 (= e!761359 tp_is_empty!36943)))

(declare-fun b!1337053 () Bool)

(declare-fun res!887303 () Bool)

(assert (=> b!1337053 (=> (not res!887303) (not e!761363))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337053 (= res!887303 (and (= (size!44363 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44362 _keys!1590) (size!44363 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337054 () Bool)

(assert (=> b!1337054 (= e!761360 tp_is_empty!36943)))

(declare-fun mapNonEmpty!57095 () Bool)

(declare-fun tp!108744 () Bool)

(assert (=> mapNonEmpty!57095 (= mapRes!57095 (and tp!108744 e!761359))))

(declare-fun mapRest!57095 () (Array (_ BitVec 32) ValueCell!17573))

(declare-fun mapKey!57095 () (_ BitVec 32))

(declare-fun mapValue!57095 () ValueCell!17573)

(assert (=> mapNonEmpty!57095 (= (arr!43811 _values!1320) (store mapRest!57095 mapKey!57095 mapValue!57095))))

(declare-fun res!887304 () Bool)

(assert (=> start!112722 (=> (not res!887304) (not e!761363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112722 (= res!887304 (validMask!0 mask!1998))))

(assert (=> start!112722 e!761363))

(declare-fun array_inv!33233 (array!90693) Bool)

(assert (=> start!112722 (and (array_inv!33233 _values!1320) e!761361)))

(assert (=> start!112722 true))

(declare-fun array_inv!33234 (array!90691) Bool)

(assert (=> start!112722 (array_inv!33234 _keys!1590)))

(assert (=> start!112722 tp!108743))

(assert (=> start!112722 tp_is_empty!36943))

(declare-fun b!1337055 () Bool)

(assert (=> b!1337055 (= e!761363 false)))

(declare-fun lt!592896 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54361)

(declare-fun zeroValue!1262 () V!54361)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23984 0))(
  ( (tuple2!23985 (_1!12003 (_ BitVec 64)) (_2!12003 V!54361)) )
))
(declare-datatypes ((List!31114 0))(
  ( (Nil!31111) (Cons!31110 (h!32319 tuple2!23984) (t!45418 List!31114)) )
))
(declare-datatypes ((ListLongMap!21641 0))(
  ( (ListLongMap!21642 (toList!10836 List!31114)) )
))
(declare-fun contains!8932 (ListLongMap!21641 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5689 (array!90691 array!90693 (_ BitVec 32) (_ BitVec 32) V!54361 V!54361 (_ BitVec 32) Int) ListLongMap!21641)

(assert (=> b!1337055 (= lt!592896 (contains!8932 (getCurrentListMap!5689 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337056 () Bool)

(declare-fun res!887302 () Bool)

(assert (=> b!1337056 (=> (not res!887302) (not e!761363))))

(assert (=> b!1337056 (= res!887302 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44362 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57095 () Bool)

(assert (=> mapIsEmpty!57095 mapRes!57095))

(declare-fun b!1337057 () Bool)

(declare-fun res!887300 () Bool)

(assert (=> b!1337057 (=> (not res!887300) (not e!761363))))

(declare-datatypes ((List!31115 0))(
  ( (Nil!31112) (Cons!31111 (h!32320 (_ BitVec 64)) (t!45419 List!31115)) )
))
(declare-fun arrayNoDuplicates!0 (array!90691 (_ BitVec 32) List!31115) Bool)

(assert (=> b!1337057 (= res!887300 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31112))))

(assert (= (and start!112722 res!887304) b!1337053))

(assert (= (and b!1337053 res!887303) b!1337050))

(assert (= (and b!1337050 res!887301) b!1337057))

(assert (= (and b!1337057 res!887300) b!1337056))

(assert (= (and b!1337056 res!887302) b!1337055))

(assert (= (and b!1337051 condMapEmpty!57095) mapIsEmpty!57095))

(assert (= (and b!1337051 (not condMapEmpty!57095)) mapNonEmpty!57095))

(get-info :version)

(assert (= (and mapNonEmpty!57095 ((_ is ValueCellFull!17573) mapValue!57095)) b!1337052))

(assert (= (and b!1337051 ((_ is ValueCellFull!17573) mapDefault!57095)) b!1337054))

(assert (= start!112722 b!1337051))

(declare-fun m!1224731 () Bool)

(assert (=> b!1337057 m!1224731))

(declare-fun m!1224733 () Bool)

(assert (=> b!1337055 m!1224733))

(assert (=> b!1337055 m!1224733))

(declare-fun m!1224735 () Bool)

(assert (=> b!1337055 m!1224735))

(declare-fun m!1224737 () Bool)

(assert (=> b!1337050 m!1224737))

(declare-fun m!1224739 () Bool)

(assert (=> start!112722 m!1224739))

(declare-fun m!1224741 () Bool)

(assert (=> start!112722 m!1224741))

(declare-fun m!1224743 () Bool)

(assert (=> start!112722 m!1224743))

(declare-fun m!1224745 () Bool)

(assert (=> mapNonEmpty!57095 m!1224745))

(check-sat (not b!1337055) tp_is_empty!36943 (not start!112722) (not b!1337057) (not b_next!31033) (not mapNonEmpty!57095) (not b!1337050) b_and!49993)
(check-sat b_and!49993 (not b_next!31033))
