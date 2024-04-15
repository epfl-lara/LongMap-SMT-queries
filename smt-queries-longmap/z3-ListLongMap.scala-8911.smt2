; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108116 () Bool)

(assert start!108116)

(declare-fun b_free!27829 () Bool)

(declare-fun b_next!27829 () Bool)

(assert (=> start!108116 (= b_free!27829 (not b_next!27829))))

(declare-fun tp!98441 () Bool)

(declare-fun b_and!45867 () Bool)

(assert (=> start!108116 (= tp!98441 b_and!45867)))

(declare-fun res!848450 () Bool)

(declare-fun e!729096 () Bool)

(assert (=> start!108116 (=> (not res!848450) (not e!729096))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108116 (= res!848450 (validMask!0 mask!1805))))

(assert (=> start!108116 e!729096))

(assert (=> start!108116 true))

(assert (=> start!108116 tp!98441))

(declare-fun tp_is_empty!33379 () Bool)

(assert (=> start!108116 tp_is_empty!33379))

(declare-datatypes ((V!49609 0))(
  ( (V!49610 (val!16764 Int)) )
))
(declare-datatypes ((ValueCell!15791 0))(
  ( (ValueCellFull!15791 (v!19360 V!49609)) (EmptyCell!15791) )
))
(declare-datatypes ((array!83749 0))(
  ( (array!83750 (arr!40386 (Array (_ BitVec 32) ValueCell!15791)) (size!40938 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83749)

(declare-fun e!729095 () Bool)

(declare-fun array_inv!30847 (array!83749) Bool)

(assert (=> start!108116 (and (array_inv!30847 _values!1187) e!729095)))

(declare-datatypes ((array!83751 0))(
  ( (array!83752 (arr!40387 (Array (_ BitVec 32) (_ BitVec 64))) (size!40939 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83751)

(declare-fun array_inv!30848 (array!83751) Bool)

(assert (=> start!108116 (array_inv!30848 _keys!1427)))

(declare-fun mapNonEmpty!51599 () Bool)

(declare-fun mapRes!51599 () Bool)

(declare-fun tp!98442 () Bool)

(declare-fun e!729094 () Bool)

(assert (=> mapNonEmpty!51599 (= mapRes!51599 (and tp!98442 e!729094))))

(declare-fun mapValue!51599 () ValueCell!15791)

(declare-fun mapKey!51599 () (_ BitVec 32))

(declare-fun mapRest!51599 () (Array (_ BitVec 32) ValueCell!15791))

(assert (=> mapNonEmpty!51599 (= (arr!40386 _values!1187) (store mapRest!51599 mapKey!51599 mapValue!51599))))

(declare-fun b!1276711 () Bool)

(declare-fun e!729093 () Bool)

(assert (=> b!1276711 (= e!729095 (and e!729093 mapRes!51599))))

(declare-fun condMapEmpty!51599 () Bool)

(declare-fun mapDefault!51599 () ValueCell!15791)

(assert (=> b!1276711 (= condMapEmpty!51599 (= (arr!40386 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15791)) mapDefault!51599)))))

(declare-fun b!1276712 () Bool)

(assert (=> b!1276712 (= e!729096 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!575358 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49609)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49609)

(declare-datatypes ((tuple2!21580 0))(
  ( (tuple2!21581 (_1!10801 (_ BitVec 64)) (_2!10801 V!49609)) )
))
(declare-datatypes ((List!28749 0))(
  ( (Nil!28746) (Cons!28745 (h!29954 tuple2!21580) (t!42277 List!28749)) )
))
(declare-datatypes ((ListLongMap!19237 0))(
  ( (ListLongMap!19238 (toList!9634 List!28749)) )
))
(declare-fun contains!7674 (ListLongMap!19237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4608 (array!83751 array!83749 (_ BitVec 32) (_ BitVec 32) V!49609 V!49609 (_ BitVec 32) Int) ListLongMap!19237)

(assert (=> b!1276712 (= lt!575358 (contains!7674 (getCurrentListMap!4608 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276713 () Bool)

(assert (=> b!1276713 (= e!729094 tp_is_empty!33379)))

(declare-fun b!1276714 () Bool)

(declare-fun res!848451 () Bool)

(assert (=> b!1276714 (=> (not res!848451) (not e!729096))))

(declare-datatypes ((List!28750 0))(
  ( (Nil!28747) (Cons!28746 (h!29955 (_ BitVec 64)) (t!42278 List!28750)) )
))
(declare-fun arrayNoDuplicates!0 (array!83751 (_ BitVec 32) List!28750) Bool)

(assert (=> b!1276714 (= res!848451 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28747))))

(declare-fun b!1276715 () Bool)

(declare-fun res!848449 () Bool)

(assert (=> b!1276715 (=> (not res!848449) (not e!729096))))

(assert (=> b!1276715 (= res!848449 (and (= (size!40938 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40939 _keys!1427) (size!40938 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276716 () Bool)

(declare-fun res!848448 () Bool)

(assert (=> b!1276716 (=> (not res!848448) (not e!729096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83751 (_ BitVec 32)) Bool)

(assert (=> b!1276716 (= res!848448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51599 () Bool)

(assert (=> mapIsEmpty!51599 mapRes!51599))

(declare-fun b!1276717 () Bool)

(assert (=> b!1276717 (= e!729093 tp_is_empty!33379)))

(assert (= (and start!108116 res!848450) b!1276715))

(assert (= (and b!1276715 res!848449) b!1276716))

(assert (= (and b!1276716 res!848448) b!1276714))

(assert (= (and b!1276714 res!848451) b!1276712))

(assert (= (and b!1276711 condMapEmpty!51599) mapIsEmpty!51599))

(assert (= (and b!1276711 (not condMapEmpty!51599)) mapNonEmpty!51599))

(get-info :version)

(assert (= (and mapNonEmpty!51599 ((_ is ValueCellFull!15791) mapValue!51599)) b!1276713))

(assert (= (and b!1276711 ((_ is ValueCellFull!15791) mapDefault!51599)) b!1276717))

(assert (= start!108116 b!1276711))

(declare-fun m!1172109 () Bool)

(assert (=> b!1276714 m!1172109))

(declare-fun m!1172111 () Bool)

(assert (=> b!1276716 m!1172111))

(declare-fun m!1172113 () Bool)

(assert (=> start!108116 m!1172113))

(declare-fun m!1172115 () Bool)

(assert (=> start!108116 m!1172115))

(declare-fun m!1172117 () Bool)

(assert (=> start!108116 m!1172117))

(declare-fun m!1172119 () Bool)

(assert (=> mapNonEmpty!51599 m!1172119))

(declare-fun m!1172121 () Bool)

(assert (=> b!1276712 m!1172121))

(assert (=> b!1276712 m!1172121))

(declare-fun m!1172123 () Bool)

(assert (=> b!1276712 m!1172123))

(check-sat (not mapNonEmpty!51599) b_and!45867 (not b!1276712) tp_is_empty!33379 (not b_next!27829) (not b!1276714) (not start!108116) (not b!1276716))
(check-sat b_and!45867 (not b_next!27829))
