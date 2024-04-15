; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41820 () Bool)

(assert start!41820)

(declare-fun b_free!11437 () Bool)

(declare-fun b_next!11437 () Bool)

(assert (=> start!41820 (= b_free!11437 (not b_next!11437))))

(declare-fun tp!40321 () Bool)

(declare-fun b_and!19791 () Bool)

(assert (=> start!41820 (= tp!40321 b_and!19791)))

(declare-fun b!466864 () Bool)

(declare-fun e!273044 () Bool)

(declare-fun tp_is_empty!12865 () Bool)

(assert (=> b!466864 (= e!273044 tp_is_empty!12865)))

(declare-fun b!466865 () Bool)

(declare-fun res!279072 () Bool)

(declare-fun e!273043 () Bool)

(assert (=> b!466865 (=> (not res!279072) (not e!273043))))

(declare-datatypes ((array!29507 0))(
  ( (array!29508 (arr!14181 (Array (_ BitVec 32) (_ BitVec 64))) (size!14534 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29507)

(declare-datatypes ((List!8623 0))(
  ( (Nil!8620) (Cons!8619 (h!9475 (_ BitVec 64)) (t!14568 List!8623)) )
))
(declare-fun arrayNoDuplicates!0 (array!29507 (_ BitVec 32) List!8623) Bool)

(assert (=> b!466865 (= res!279072 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8620))))

(declare-fun mapIsEmpty!20986 () Bool)

(declare-fun mapRes!20986 () Bool)

(assert (=> mapIsEmpty!20986 mapRes!20986))

(declare-fun b!466866 () Bool)

(declare-fun res!279074 () Bool)

(assert (=> b!466866 (=> (not res!279074) (not e!273043))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29507 (_ BitVec 32)) Bool)

(assert (=> b!466866 (= res!279074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466867 () Bool)

(declare-fun res!279075 () Bool)

(assert (=> b!466867 (=> (not res!279075) (not e!273043))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18259 0))(
  ( (V!18260 (val!6477 Int)) )
))
(declare-datatypes ((ValueCell!6089 0))(
  ( (ValueCellFull!6089 (v!8760 V!18259)) (EmptyCell!6089) )
))
(declare-datatypes ((array!29509 0))(
  ( (array!29510 (arr!14182 (Array (_ BitVec 32) ValueCell!6089)) (size!14535 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29509)

(assert (=> b!466867 (= res!279075 (and (= (size!14535 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14534 _keys!1025) (size!14535 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466868 () Bool)

(assert (=> b!466868 (= e!273043 (not true))))

(declare-datatypes ((tuple2!8542 0))(
  ( (tuple2!8543 (_1!4282 (_ BitVec 64)) (_2!4282 V!18259)) )
))
(declare-datatypes ((List!8624 0))(
  ( (Nil!8621) (Cons!8620 (h!9476 tuple2!8542) (t!14569 List!8624)) )
))
(declare-datatypes ((ListLongMap!7445 0))(
  ( (ListLongMap!7446 (toList!3738 List!8624)) )
))
(declare-fun lt!210984 () ListLongMap!7445)

(declare-fun lt!210985 () ListLongMap!7445)

(assert (=> b!466868 (= lt!210984 lt!210985)))

(declare-fun minValueBefore!38 () V!18259)

(declare-fun zeroValue!794 () V!18259)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13580 0))(
  ( (Unit!13581) )
))
(declare-fun lt!210986 () Unit!13580)

(declare-fun minValueAfter!38 () V!18259)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!79 (array!29507 array!29509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18259 V!18259 V!18259 V!18259 (_ BitVec 32) Int) Unit!13580)

(assert (=> b!466868 (= lt!210986 (lemmaNoChangeToArrayThenSameMapNoExtras!79 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1922 (array!29507 array!29509 (_ BitVec 32) (_ BitVec 32) V!18259 V!18259 (_ BitVec 32) Int) ListLongMap!7445)

(assert (=> b!466868 (= lt!210985 (getCurrentListMapNoExtraKeys!1922 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466868 (= lt!210984 (getCurrentListMapNoExtraKeys!1922 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20986 () Bool)

(declare-fun tp!40320 () Bool)

(assert (=> mapNonEmpty!20986 (= mapRes!20986 (and tp!40320 e!273044))))

(declare-fun mapKey!20986 () (_ BitVec 32))

(declare-fun mapValue!20986 () ValueCell!6089)

(declare-fun mapRest!20986 () (Array (_ BitVec 32) ValueCell!6089))

(assert (=> mapNonEmpty!20986 (= (arr!14182 _values!833) (store mapRest!20986 mapKey!20986 mapValue!20986))))

(declare-fun b!466869 () Bool)

(declare-fun e!273045 () Bool)

(declare-fun e!273041 () Bool)

(assert (=> b!466869 (= e!273045 (and e!273041 mapRes!20986))))

(declare-fun condMapEmpty!20986 () Bool)

(declare-fun mapDefault!20986 () ValueCell!6089)

(assert (=> b!466869 (= condMapEmpty!20986 (= (arr!14182 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6089)) mapDefault!20986)))))

(declare-fun b!466870 () Bool)

(assert (=> b!466870 (= e!273041 tp_is_empty!12865)))

(declare-fun res!279073 () Bool)

(assert (=> start!41820 (=> (not res!279073) (not e!273043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41820 (= res!279073 (validMask!0 mask!1365))))

(assert (=> start!41820 e!273043))

(assert (=> start!41820 tp_is_empty!12865))

(assert (=> start!41820 tp!40321))

(assert (=> start!41820 true))

(declare-fun array_inv!10324 (array!29507) Bool)

(assert (=> start!41820 (array_inv!10324 _keys!1025)))

(declare-fun array_inv!10325 (array!29509) Bool)

(assert (=> start!41820 (and (array_inv!10325 _values!833) e!273045)))

(assert (= (and start!41820 res!279073) b!466867))

(assert (= (and b!466867 res!279075) b!466866))

(assert (= (and b!466866 res!279074) b!466865))

(assert (= (and b!466865 res!279072) b!466868))

(assert (= (and b!466869 condMapEmpty!20986) mapIsEmpty!20986))

(assert (= (and b!466869 (not condMapEmpty!20986)) mapNonEmpty!20986))

(get-info :version)

(assert (= (and mapNonEmpty!20986 ((_ is ValueCellFull!6089) mapValue!20986)) b!466864))

(assert (= (and b!466869 ((_ is ValueCellFull!6089) mapDefault!20986)) b!466870))

(assert (= start!41820 b!466869))

(declare-fun m!448597 () Bool)

(assert (=> b!466866 m!448597))

(declare-fun m!448599 () Bool)

(assert (=> b!466868 m!448599))

(declare-fun m!448601 () Bool)

(assert (=> b!466868 m!448601))

(declare-fun m!448603 () Bool)

(assert (=> b!466868 m!448603))

(declare-fun m!448605 () Bool)

(assert (=> b!466865 m!448605))

(declare-fun m!448607 () Bool)

(assert (=> mapNonEmpty!20986 m!448607))

(declare-fun m!448609 () Bool)

(assert (=> start!41820 m!448609))

(declare-fun m!448611 () Bool)

(assert (=> start!41820 m!448611))

(declare-fun m!448613 () Bool)

(assert (=> start!41820 m!448613))

(check-sat (not b_next!11437) (not b!466866) (not b!466868) (not mapNonEmpty!20986) (not start!41820) tp_is_empty!12865 (not b!466865) b_and!19791)
(check-sat b_and!19791 (not b_next!11437))
