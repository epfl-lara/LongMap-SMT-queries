; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108178 () Bool)

(assert start!108178)

(declare-fun b_free!27873 () Bool)

(declare-fun b_next!27873 () Bool)

(assert (=> start!108178 (= b_free!27873 (not b_next!27873))))

(declare-fun tp!98575 () Bool)

(declare-fun b_and!45931 () Bool)

(assert (=> start!108178 (= tp!98575 b_and!45931)))

(declare-fun b!1277466 () Bool)

(declare-fun e!729563 () Bool)

(declare-fun tp_is_empty!33423 () Bool)

(assert (=> b!1277466 (= e!729563 tp_is_empty!33423)))

(declare-fun b!1277468 () Bool)

(declare-fun e!729564 () Bool)

(assert (=> b!1277468 (= e!729564 tp_is_empty!33423)))

(declare-fun b!1277469 () Bool)

(declare-fun res!848846 () Bool)

(declare-fun e!729561 () Bool)

(assert (=> b!1277469 (=> (not res!848846) (not e!729561))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83940 0))(
  ( (array!83941 (arr!40480 (Array (_ BitVec 32) (_ BitVec 64))) (size!41030 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83940)

(declare-datatypes ((V!49667 0))(
  ( (V!49668 (val!16786 Int)) )
))
(declare-datatypes ((ValueCell!15813 0))(
  ( (ValueCellFull!15813 (v!19384 V!49667)) (EmptyCell!15813) )
))
(declare-datatypes ((array!83942 0))(
  ( (array!83943 (arr!40481 (Array (_ BitVec 32) ValueCell!15813)) (size!41031 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83942)

(assert (=> b!1277469 (= res!848846 (and (= (size!41031 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41030 _keys!1427) (size!41031 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277470 () Bool)

(declare-fun e!729562 () Bool)

(declare-fun mapRes!51668 () Bool)

(assert (=> b!1277470 (= e!729562 (and e!729563 mapRes!51668))))

(declare-fun condMapEmpty!51668 () Bool)

(declare-fun mapDefault!51668 () ValueCell!15813)

(assert (=> b!1277470 (= condMapEmpty!51668 (= (arr!40481 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15813)) mapDefault!51668)))))

(declare-fun mapNonEmpty!51668 () Bool)

(declare-fun tp!98576 () Bool)

(assert (=> mapNonEmpty!51668 (= mapRes!51668 (and tp!98576 e!729564))))

(declare-fun mapValue!51668 () ValueCell!15813)

(declare-fun mapKey!51668 () (_ BitVec 32))

(declare-fun mapRest!51668 () (Array (_ BitVec 32) ValueCell!15813))

(assert (=> mapNonEmpty!51668 (= (arr!40481 _values!1187) (store mapRest!51668 mapKey!51668 mapValue!51668))))

(declare-fun b!1277471 () Bool)

(assert (=> b!1277471 (= e!729561 false)))

(declare-fun lt!575701 () Bool)

(declare-fun minValue!1129 () V!49667)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49667)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((tuple2!21532 0))(
  ( (tuple2!21533 (_1!10777 (_ BitVec 64)) (_2!10777 V!49667)) )
))
(declare-datatypes ((List!28709 0))(
  ( (Nil!28706) (Cons!28705 (h!29914 tuple2!21532) (t!42247 List!28709)) )
))
(declare-datatypes ((ListLongMap!19189 0))(
  ( (ListLongMap!19190 (toList!9610 List!28709)) )
))
(declare-fun contains!7720 (ListLongMap!19189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4694 (array!83940 array!83942 (_ BitVec 32) (_ BitVec 32) V!49667 V!49667 (_ BitVec 32) Int) ListLongMap!19189)

(assert (=> b!1277471 (= lt!575701 (contains!7720 (getCurrentListMap!4694 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51668 () Bool)

(assert (=> mapIsEmpty!51668 mapRes!51668))

(declare-fun b!1277472 () Bool)

(declare-fun res!848847 () Bool)

(assert (=> b!1277472 (=> (not res!848847) (not e!729561))))

(declare-datatypes ((List!28710 0))(
  ( (Nil!28707) (Cons!28706 (h!29915 (_ BitVec 64)) (t!42248 List!28710)) )
))
(declare-fun arrayNoDuplicates!0 (array!83940 (_ BitVec 32) List!28710) Bool)

(assert (=> b!1277472 (= res!848847 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28707))))

(declare-fun res!848844 () Bool)

(assert (=> start!108178 (=> (not res!848844) (not e!729561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108178 (= res!848844 (validMask!0 mask!1805))))

(assert (=> start!108178 e!729561))

(assert (=> start!108178 true))

(assert (=> start!108178 tp!98575))

(assert (=> start!108178 tp_is_empty!33423))

(declare-fun array_inv!30757 (array!83942) Bool)

(assert (=> start!108178 (and (array_inv!30757 _values!1187) e!729562)))

(declare-fun array_inv!30758 (array!83940) Bool)

(assert (=> start!108178 (array_inv!30758 _keys!1427)))

(declare-fun b!1277467 () Bool)

(declare-fun res!848845 () Bool)

(assert (=> b!1277467 (=> (not res!848845) (not e!729561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83940 (_ BitVec 32)) Bool)

(assert (=> b!1277467 (= res!848845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108178 res!848844) b!1277469))

(assert (= (and b!1277469 res!848846) b!1277467))

(assert (= (and b!1277467 res!848845) b!1277472))

(assert (= (and b!1277472 res!848847) b!1277471))

(assert (= (and b!1277470 condMapEmpty!51668) mapIsEmpty!51668))

(assert (= (and b!1277470 (not condMapEmpty!51668)) mapNonEmpty!51668))

(get-info :version)

(assert (= (and mapNonEmpty!51668 ((_ is ValueCellFull!15813) mapValue!51668)) b!1277468))

(assert (= (and b!1277470 ((_ is ValueCellFull!15813) mapDefault!51668)) b!1277466))

(assert (= start!108178 b!1277470))

(declare-fun m!1173081 () Bool)

(assert (=> mapNonEmpty!51668 m!1173081))

(declare-fun m!1173083 () Bool)

(assert (=> start!108178 m!1173083))

(declare-fun m!1173085 () Bool)

(assert (=> start!108178 m!1173085))

(declare-fun m!1173087 () Bool)

(assert (=> start!108178 m!1173087))

(declare-fun m!1173089 () Bool)

(assert (=> b!1277467 m!1173089))

(declare-fun m!1173091 () Bool)

(assert (=> b!1277471 m!1173091))

(assert (=> b!1277471 m!1173091))

(declare-fun m!1173093 () Bool)

(assert (=> b!1277471 m!1173093))

(declare-fun m!1173095 () Bool)

(assert (=> b!1277472 m!1173095))

(check-sat (not b!1277472) (not mapNonEmpty!51668) (not b!1277467) (not b!1277471) (not b_next!27873) tp_is_empty!33423 (not start!108178) b_and!45931)
(check-sat b_and!45931 (not b_next!27873))
