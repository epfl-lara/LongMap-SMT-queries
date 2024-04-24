; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108450 () Bool)

(assert start!108450)

(declare-fun b_free!27907 () Bool)

(declare-fun b_next!27907 () Bool)

(assert (=> start!108450 (= b_free!27907 (not b_next!27907))))

(declare-fun tp!98681 () Bool)

(declare-fun b_and!45969 () Bool)

(assert (=> start!108450 (= tp!98681 b_and!45969)))

(declare-fun b!1279246 () Bool)

(declare-fun res!849625 () Bool)

(declare-fun e!730736 () Bool)

(assert (=> b!1279246 (=> (not res!849625) (not e!730736))))

(declare-datatypes ((array!84037 0))(
  ( (array!84038 (arr!40523 (Array (_ BitVec 32) (_ BitVec 64))) (size!41074 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84037)

(declare-datatypes ((List!28764 0))(
  ( (Nil!28761) (Cons!28760 (h!29978 (_ BitVec 64)) (t!42296 List!28764)) )
))
(declare-fun arrayNoDuplicates!0 (array!84037 (_ BitVec 32) List!28764) Bool)

(assert (=> b!1279246 (= res!849625 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28761))))

(declare-fun b!1279247 () Bool)

(declare-fun res!849622 () Bool)

(assert (=> b!1279247 (=> (not res!849622) (not e!730736))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84037 (_ BitVec 32)) Bool)

(assert (=> b!1279247 (= res!849622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51722 () Bool)

(declare-fun mapRes!51722 () Bool)

(assert (=> mapIsEmpty!51722 mapRes!51722))

(declare-fun b!1279248 () Bool)

(declare-fun e!730735 () Bool)

(declare-fun e!730734 () Bool)

(assert (=> b!1279248 (= e!730735 (and e!730734 mapRes!51722))))

(declare-fun condMapEmpty!51722 () Bool)

(declare-datatypes ((V!49713 0))(
  ( (V!49714 (val!16803 Int)) )
))
(declare-datatypes ((ValueCell!15830 0))(
  ( (ValueCellFull!15830 (v!19397 V!49713)) (EmptyCell!15830) )
))
(declare-datatypes ((array!84039 0))(
  ( (array!84040 (arr!40524 (Array (_ BitVec 32) ValueCell!15830)) (size!41075 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84039)

(declare-fun mapDefault!51722 () ValueCell!15830)

(assert (=> b!1279248 (= condMapEmpty!51722 (= (arr!40524 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15830)) mapDefault!51722)))))

(declare-fun b!1279249 () Bool)

(declare-fun tp_is_empty!33457 () Bool)

(assert (=> b!1279249 (= e!730734 tp_is_empty!33457)))

(declare-fun b!1279250 () Bool)

(declare-fun res!849624 () Bool)

(assert (=> b!1279250 (=> (not res!849624) (not e!730736))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1279250 (= res!849624 (and (= (size!41075 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41074 _keys!1427) (size!41075 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!849623 () Bool)

(assert (=> start!108450 (=> (not res!849623) (not e!730736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108450 (= res!849623 (validMask!0 mask!1805))))

(assert (=> start!108450 e!730736))

(assert (=> start!108450 true))

(assert (=> start!108450 tp!98681))

(assert (=> start!108450 tp_is_empty!33457))

(declare-fun array_inv!30971 (array!84039) Bool)

(assert (=> start!108450 (and (array_inv!30971 _values!1187) e!730735)))

(declare-fun array_inv!30972 (array!84037) Bool)

(assert (=> start!108450 (array_inv!30972 _keys!1427)))

(declare-fun b!1279251 () Bool)

(declare-fun e!730738 () Bool)

(assert (=> b!1279251 (= e!730738 tp_is_empty!33457)))

(declare-fun mapNonEmpty!51722 () Bool)

(declare-fun tp!98680 () Bool)

(assert (=> mapNonEmpty!51722 (= mapRes!51722 (and tp!98680 e!730738))))

(declare-fun mapValue!51722 () ValueCell!15830)

(declare-fun mapKey!51722 () (_ BitVec 32))

(declare-fun mapRest!51722 () (Array (_ BitVec 32) ValueCell!15830))

(assert (=> mapNonEmpty!51722 (= (arr!40524 _values!1187) (store mapRest!51722 mapKey!51722 mapValue!51722))))

(declare-fun b!1279252 () Bool)

(assert (=> b!1279252 (= e!730736 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49713)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!576314 () Bool)

(declare-fun zeroValue!1129 () V!49713)

(declare-datatypes ((tuple2!21576 0))(
  ( (tuple2!21577 (_1!10799 (_ BitVec 64)) (_2!10799 V!49713)) )
))
(declare-datatypes ((List!28765 0))(
  ( (Nil!28762) (Cons!28761 (h!29979 tuple2!21576) (t!42297 List!28765)) )
))
(declare-datatypes ((ListLongMap!19241 0))(
  ( (ListLongMap!19242 (toList!9636 List!28765)) )
))
(declare-fun contains!7762 (ListLongMap!19241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4705 (array!84037 array!84039 (_ BitVec 32) (_ BitVec 32) V!49713 V!49713 (_ BitVec 32) Int) ListLongMap!19241)

(assert (=> b!1279252 (= lt!576314 (contains!7762 (getCurrentListMap!4705 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(assert (= (and start!108450 res!849623) b!1279250))

(assert (= (and b!1279250 res!849624) b!1279247))

(assert (= (and b!1279247 res!849622) b!1279246))

(assert (= (and b!1279246 res!849625) b!1279252))

(assert (= (and b!1279248 condMapEmpty!51722) mapIsEmpty!51722))

(assert (= (and b!1279248 (not condMapEmpty!51722)) mapNonEmpty!51722))

(get-info :version)

(assert (= (and mapNonEmpty!51722 ((_ is ValueCellFull!15830) mapValue!51722)) b!1279251))

(assert (= (and b!1279248 ((_ is ValueCellFull!15830) mapDefault!51722)) b!1279249))

(assert (= start!108450 b!1279248))

(declare-fun m!1175045 () Bool)

(assert (=> b!1279247 m!1175045))

(declare-fun m!1175047 () Bool)

(assert (=> mapNonEmpty!51722 m!1175047))

(declare-fun m!1175049 () Bool)

(assert (=> start!108450 m!1175049))

(declare-fun m!1175051 () Bool)

(assert (=> start!108450 m!1175051))

(declare-fun m!1175053 () Bool)

(assert (=> start!108450 m!1175053))

(declare-fun m!1175055 () Bool)

(assert (=> b!1279246 m!1175055))

(declare-fun m!1175057 () Bool)

(assert (=> b!1279252 m!1175057))

(assert (=> b!1279252 m!1175057))

(declare-fun m!1175059 () Bool)

(assert (=> b!1279252 m!1175059))

(check-sat b_and!45969 (not b!1279252) (not b_next!27907) (not b!1279247) (not mapNonEmpty!51722) (not b!1279246) (not start!108450) tp_is_empty!33457)
(check-sat b_and!45969 (not b_next!27907))
