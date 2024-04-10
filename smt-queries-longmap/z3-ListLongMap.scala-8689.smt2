; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105556 () Bool)

(assert start!105556)

(declare-fun b_free!27171 () Bool)

(declare-fun b_next!27171 () Bool)

(assert (=> start!105556 (= b_free!27171 (not b_next!27171))))

(declare-fun tp!95033 () Bool)

(declare-fun b_and!45037 () Bool)

(assert (=> start!105556 (= tp!95033 b_and!45037)))

(declare-fun mapNonEmpty!49900 () Bool)

(declare-fun mapRes!49900 () Bool)

(declare-fun tp!95032 () Bool)

(declare-fun e!715065 () Bool)

(assert (=> mapNonEmpty!49900 (= mapRes!49900 (and tp!95032 e!715065))))

(declare-fun mapKey!49900 () (_ BitVec 32))

(declare-datatypes ((V!48129 0))(
  ( (V!48130 (val!16099 Int)) )
))
(declare-datatypes ((ValueCell!15273 0))(
  ( (ValueCellFull!15273 (v!18801 V!48129)) (EmptyCell!15273) )
))
(declare-fun mapValue!49900 () ValueCell!15273)

(declare-datatypes ((array!81782 0))(
  ( (array!81783 (arr!39448 (Array (_ BitVec 32) ValueCell!15273)) (size!39984 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81782)

(declare-fun mapRest!49900 () (Array (_ BitVec 32) ValueCell!15273))

(assert (=> mapNonEmpty!49900 (= (arr!39448 _values!914) (store mapRest!49900 mapKey!49900 mapValue!49900))))

(declare-fun b!1257511 () Bool)

(declare-fun e!715066 () Bool)

(assert (=> b!1257511 (= e!715066 (not true))))

(declare-datatypes ((tuple2!20802 0))(
  ( (tuple2!20803 (_1!10412 (_ BitVec 64)) (_2!10412 V!48129)) )
))
(declare-datatypes ((List!28016 0))(
  ( (Nil!28013) (Cons!28012 (h!29221 tuple2!20802) (t!41507 List!28016)) )
))
(declare-datatypes ((ListLongMap!18675 0))(
  ( (ListLongMap!18676 (toList!9353 List!28016)) )
))
(declare-fun lt!568774 () ListLongMap!18675)

(declare-fun lt!568776 () ListLongMap!18675)

(assert (=> b!1257511 (= lt!568774 lt!568776)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48129)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48129)

(declare-datatypes ((array!81784 0))(
  ( (array!81785 (arr!39449 (Array (_ BitVec 32) (_ BitVec 64))) (size!39985 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81784)

(declare-fun minValueBefore!43 () V!48129)

(declare-datatypes ((Unit!41890 0))(
  ( (Unit!41891) )
))
(declare-fun lt!568775 () Unit!41890)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1095 (array!81784 array!81782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48129 V!48129 V!48129 V!48129 (_ BitVec 32) Int) Unit!41890)

(assert (=> b!1257511 (= lt!568775 (lemmaNoChangeToArrayThenSameMapNoExtras!1095 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5731 (array!81784 array!81782 (_ BitVec 32) (_ BitVec 32) V!48129 V!48129 (_ BitVec 32) Int) ListLongMap!18675)

(assert (=> b!1257511 (= lt!568776 (getCurrentListMapNoExtraKeys!5731 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257511 (= lt!568774 (getCurrentListMapNoExtraKeys!5731 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257512 () Bool)

(declare-fun e!715064 () Bool)

(declare-fun tp_is_empty!32073 () Bool)

(assert (=> b!1257512 (= e!715064 tp_is_empty!32073)))

(declare-fun b!1257513 () Bool)

(declare-fun e!715063 () Bool)

(assert (=> b!1257513 (= e!715063 (and e!715064 mapRes!49900))))

(declare-fun condMapEmpty!49900 () Bool)

(declare-fun mapDefault!49900 () ValueCell!15273)

(assert (=> b!1257513 (= condMapEmpty!49900 (= (arr!39448 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15273)) mapDefault!49900)))))

(declare-fun b!1257514 () Bool)

(declare-fun res!838235 () Bool)

(assert (=> b!1257514 (=> (not res!838235) (not e!715066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81784 (_ BitVec 32)) Bool)

(assert (=> b!1257514 (= res!838235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!838237 () Bool)

(assert (=> start!105556 (=> (not res!838237) (not e!715066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105556 (= res!838237 (validMask!0 mask!1466))))

(assert (=> start!105556 e!715066))

(assert (=> start!105556 true))

(assert (=> start!105556 tp!95033))

(assert (=> start!105556 tp_is_empty!32073))

(declare-fun array_inv!30049 (array!81784) Bool)

(assert (=> start!105556 (array_inv!30049 _keys!1118)))

(declare-fun array_inv!30050 (array!81782) Bool)

(assert (=> start!105556 (and (array_inv!30050 _values!914) e!715063)))

(declare-fun b!1257515 () Bool)

(declare-fun res!838236 () Bool)

(assert (=> b!1257515 (=> (not res!838236) (not e!715066))))

(assert (=> b!1257515 (= res!838236 (and (= (size!39984 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39985 _keys!1118) (size!39984 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257516 () Bool)

(declare-fun res!838234 () Bool)

(assert (=> b!1257516 (=> (not res!838234) (not e!715066))))

(declare-datatypes ((List!28017 0))(
  ( (Nil!28014) (Cons!28013 (h!29222 (_ BitVec 64)) (t!41508 List!28017)) )
))
(declare-fun arrayNoDuplicates!0 (array!81784 (_ BitVec 32) List!28017) Bool)

(assert (=> b!1257516 (= res!838234 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28014))))

(declare-fun mapIsEmpty!49900 () Bool)

(assert (=> mapIsEmpty!49900 mapRes!49900))

(declare-fun b!1257517 () Bool)

(assert (=> b!1257517 (= e!715065 tp_is_empty!32073)))

(assert (= (and start!105556 res!838237) b!1257515))

(assert (= (and b!1257515 res!838236) b!1257514))

(assert (= (and b!1257514 res!838235) b!1257516))

(assert (= (and b!1257516 res!838234) b!1257511))

(assert (= (and b!1257513 condMapEmpty!49900) mapIsEmpty!49900))

(assert (= (and b!1257513 (not condMapEmpty!49900)) mapNonEmpty!49900))

(get-info :version)

(assert (= (and mapNonEmpty!49900 ((_ is ValueCellFull!15273) mapValue!49900)) b!1257517))

(assert (= (and b!1257513 ((_ is ValueCellFull!15273) mapDefault!49900)) b!1257512))

(assert (= start!105556 b!1257513))

(declare-fun m!1158089 () Bool)

(assert (=> mapNonEmpty!49900 m!1158089))

(declare-fun m!1158091 () Bool)

(assert (=> b!1257511 m!1158091))

(declare-fun m!1158093 () Bool)

(assert (=> b!1257511 m!1158093))

(declare-fun m!1158095 () Bool)

(assert (=> b!1257511 m!1158095))

(declare-fun m!1158097 () Bool)

(assert (=> b!1257516 m!1158097))

(declare-fun m!1158099 () Bool)

(assert (=> start!105556 m!1158099))

(declare-fun m!1158101 () Bool)

(assert (=> start!105556 m!1158101))

(declare-fun m!1158103 () Bool)

(assert (=> start!105556 m!1158103))

(declare-fun m!1158105 () Bool)

(assert (=> b!1257514 m!1158105))

(check-sat (not b!1257514) (not b!1257516) (not start!105556) (not mapNonEmpty!49900) tp_is_empty!32073 (not b!1257511) (not b_next!27171) b_and!45037)
(check-sat b_and!45037 (not b_next!27171))
