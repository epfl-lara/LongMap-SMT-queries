; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105738 () Bool)

(assert start!105738)

(declare-fun b_free!27151 () Bool)

(declare-fun b_next!27151 () Bool)

(assert (=> start!105738 (= b_free!27151 (not b_next!27151))))

(declare-fun tp!94970 () Bool)

(declare-fun b_and!45009 () Bool)

(assert (=> start!105738 (= tp!94970 b_and!45009)))

(declare-fun b!1258417 () Bool)

(declare-fun e!715629 () Bool)

(declare-fun tp_is_empty!32053 () Bool)

(assert (=> b!1258417 (= e!715629 tp_is_empty!32053)))

(declare-fun mapNonEmpty!49867 () Bool)

(declare-fun mapRes!49867 () Bool)

(declare-fun tp!94969 () Bool)

(declare-fun e!715633 () Bool)

(assert (=> mapNonEmpty!49867 (= mapRes!49867 (and tp!94969 e!715633))))

(declare-fun mapKey!49867 () (_ BitVec 32))

(declare-datatypes ((V!48103 0))(
  ( (V!48104 (val!16089 Int)) )
))
(declare-datatypes ((ValueCell!15263 0))(
  ( (ValueCellFull!15263 (v!18786 V!48103)) (EmptyCell!15263) )
))
(declare-fun mapValue!49867 () ValueCell!15263)

(declare-fun mapRest!49867 () (Array (_ BitVec 32) ValueCell!15263))

(declare-datatypes ((array!81787 0))(
  ( (array!81788 (arr!39447 (Array (_ BitVec 32) ValueCell!15263)) (size!39984 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81787)

(assert (=> mapNonEmpty!49867 (= (arr!39447 _values!914) (store mapRest!49867 mapKey!49867 mapValue!49867))))

(declare-fun b!1258418 () Bool)

(declare-fun e!715628 () Bool)

(declare-fun e!715632 () Bool)

(assert (=> b!1258418 (= e!715628 (not e!715632))))

(declare-fun res!838543 () Bool)

(assert (=> b!1258418 (=> res!838543 e!715632)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258418 (= res!838543 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20810 0))(
  ( (tuple2!20811 (_1!10416 (_ BitVec 64)) (_2!10416 V!48103)) )
))
(declare-datatypes ((List!28038 0))(
  ( (Nil!28035) (Cons!28034 (h!29252 tuple2!20810) (t!41519 List!28038)) )
))
(declare-datatypes ((ListLongMap!18691 0))(
  ( (ListLongMap!18692 (toList!9361 List!28038)) )
))
(declare-fun lt!569015 () ListLongMap!18691)

(declare-fun lt!569016 () ListLongMap!18691)

(assert (=> b!1258418 (= lt!569015 lt!569016)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48103)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48103)

(declare-datatypes ((array!81789 0))(
  ( (array!81790 (arr!39448 (Array (_ BitVec 32) (_ BitVec 64))) (size!39985 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81789)

(declare-fun minValueBefore!43 () V!48103)

(declare-datatypes ((Unit!41863 0))(
  ( (Unit!41864) )
))
(declare-fun lt!569012 () Unit!41863)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1092 (array!81789 array!81787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48103 V!48103 V!48103 V!48103 (_ BitVec 32) Int) Unit!41863)

(assert (=> b!1258418 (= lt!569012 (lemmaNoChangeToArrayThenSameMapNoExtras!1092 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5778 (array!81789 array!81787 (_ BitVec 32) (_ BitVec 32) V!48103 V!48103 (_ BitVec 32) Int) ListLongMap!18691)

(assert (=> b!1258418 (= lt!569016 (getCurrentListMapNoExtraKeys!5778 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258418 (= lt!569015 (getCurrentListMapNoExtraKeys!5778 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258419 () Bool)

(declare-fun res!838545 () Bool)

(assert (=> b!1258419 (=> (not res!838545) (not e!715628))))

(assert (=> b!1258419 (= res!838545 (and (= (size!39984 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39985 _keys!1118) (size!39984 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258420 () Bool)

(declare-fun e!715631 () Bool)

(assert (=> b!1258420 (= e!715631 (and e!715629 mapRes!49867))))

(declare-fun condMapEmpty!49867 () Bool)

(declare-fun mapDefault!49867 () ValueCell!15263)

(assert (=> b!1258420 (= condMapEmpty!49867 (= (arr!39447 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15263)) mapDefault!49867)))))

(declare-fun b!1258421 () Bool)

(declare-fun e!715630 () Bool)

(assert (=> b!1258421 (= e!715630 true)))

(declare-fun lt!569014 () ListLongMap!18691)

(declare-fun -!2072 (ListLongMap!18691 (_ BitVec 64)) ListLongMap!18691)

(assert (=> b!1258421 (= (-!2072 lt!569014 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569014)))

(declare-fun lt!569013 () Unit!41863)

(declare-fun removeNotPresentStillSame!144 (ListLongMap!18691 (_ BitVec 64)) Unit!41863)

(assert (=> b!1258421 (= lt!569013 (removeNotPresentStillSame!144 lt!569014 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!838541 () Bool)

(assert (=> start!105738 (=> (not res!838541) (not e!715628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105738 (= res!838541 (validMask!0 mask!1466))))

(assert (=> start!105738 e!715628))

(assert (=> start!105738 true))

(assert (=> start!105738 tp!94970))

(assert (=> start!105738 tp_is_empty!32053))

(declare-fun array_inv!30183 (array!81789) Bool)

(assert (=> start!105738 (array_inv!30183 _keys!1118)))

(declare-fun array_inv!30184 (array!81787) Bool)

(assert (=> start!105738 (and (array_inv!30184 _values!914) e!715631)))

(declare-fun b!1258422 () Bool)

(assert (=> b!1258422 (= e!715633 tp_is_empty!32053)))

(declare-fun mapIsEmpty!49867 () Bool)

(assert (=> mapIsEmpty!49867 mapRes!49867))

(declare-fun b!1258423 () Bool)

(declare-fun res!838546 () Bool)

(assert (=> b!1258423 (=> (not res!838546) (not e!715628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81789 (_ BitVec 32)) Bool)

(assert (=> b!1258423 (= res!838546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258424 () Bool)

(assert (=> b!1258424 (= e!715632 e!715630)))

(declare-fun res!838542 () Bool)

(assert (=> b!1258424 (=> res!838542 e!715630)))

(declare-fun contains!7589 (ListLongMap!18691 (_ BitVec 64)) Bool)

(assert (=> b!1258424 (= res!838542 (contains!7589 lt!569014 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4566 (array!81789 array!81787 (_ BitVec 32) (_ BitVec 32) V!48103 V!48103 (_ BitVec 32) Int) ListLongMap!18691)

(assert (=> b!1258424 (= lt!569014 (getCurrentListMap!4566 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258425 () Bool)

(declare-fun res!838544 () Bool)

(assert (=> b!1258425 (=> (not res!838544) (not e!715628))))

(declare-datatypes ((List!28039 0))(
  ( (Nil!28036) (Cons!28035 (h!29253 (_ BitVec 64)) (t!41520 List!28039)) )
))
(declare-fun arrayNoDuplicates!0 (array!81789 (_ BitVec 32) List!28039) Bool)

(assert (=> b!1258425 (= res!838544 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28036))))

(assert (= (and start!105738 res!838541) b!1258419))

(assert (= (and b!1258419 res!838545) b!1258423))

(assert (= (and b!1258423 res!838546) b!1258425))

(assert (= (and b!1258425 res!838544) b!1258418))

(assert (= (and b!1258418 (not res!838543)) b!1258424))

(assert (= (and b!1258424 (not res!838542)) b!1258421))

(assert (= (and b!1258420 condMapEmpty!49867) mapIsEmpty!49867))

(assert (= (and b!1258420 (not condMapEmpty!49867)) mapNonEmpty!49867))

(get-info :version)

(assert (= (and mapNonEmpty!49867 ((_ is ValueCellFull!15263) mapValue!49867)) b!1258422))

(assert (= (and b!1258420 ((_ is ValueCellFull!15263) mapDefault!49867)) b!1258417))

(assert (= start!105738 b!1258420))

(declare-fun m!1159347 () Bool)

(assert (=> mapNonEmpty!49867 m!1159347))

(declare-fun m!1159349 () Bool)

(assert (=> b!1258423 m!1159349))

(declare-fun m!1159351 () Bool)

(assert (=> start!105738 m!1159351))

(declare-fun m!1159353 () Bool)

(assert (=> start!105738 m!1159353))

(declare-fun m!1159355 () Bool)

(assert (=> start!105738 m!1159355))

(declare-fun m!1159357 () Bool)

(assert (=> b!1258425 m!1159357))

(declare-fun m!1159359 () Bool)

(assert (=> b!1258424 m!1159359))

(declare-fun m!1159361 () Bool)

(assert (=> b!1258424 m!1159361))

(declare-fun m!1159363 () Bool)

(assert (=> b!1258421 m!1159363))

(declare-fun m!1159365 () Bool)

(assert (=> b!1258421 m!1159365))

(declare-fun m!1159367 () Bool)

(assert (=> b!1258418 m!1159367))

(declare-fun m!1159369 () Bool)

(assert (=> b!1258418 m!1159369))

(declare-fun m!1159371 () Bool)

(assert (=> b!1258418 m!1159371))

(check-sat (not mapNonEmpty!49867) (not b!1258421) (not b!1258418) b_and!45009 (not b!1258424) tp_is_empty!32053 (not start!105738) (not b!1258423) (not b_next!27151) (not b!1258425))
(check-sat b_and!45009 (not b_next!27151))
