; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105882 () Bool)

(assert start!105882)

(declare-fun b_free!27427 () Bool)

(declare-fun b_next!27427 () Bool)

(assert (=> start!105882 (= b_free!27427 (not b_next!27427))))

(declare-fun tp!95813 () Bool)

(declare-fun b_and!45317 () Bool)

(assert (=> start!105882 (= tp!95813 b_and!45317)))

(declare-fun b!1261149 () Bool)

(declare-fun e!717755 () Bool)

(declare-fun e!717752 () Bool)

(declare-fun mapRes!50296 () Bool)

(assert (=> b!1261149 (= e!717755 (and e!717752 mapRes!50296))))

(declare-fun condMapEmpty!50296 () Bool)

(declare-datatypes ((V!48471 0))(
  ( (V!48472 (val!16227 Int)) )
))
(declare-datatypes ((ValueCell!15401 0))(
  ( (ValueCellFull!15401 (v!18930 V!48471)) (EmptyCell!15401) )
))
(declare-datatypes ((array!82197 0))(
  ( (array!82198 (arr!39652 (Array (_ BitVec 32) ValueCell!15401)) (size!40190 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82197)

(declare-fun mapDefault!50296 () ValueCell!15401)

(assert (=> b!1261149 (= condMapEmpty!50296 (= (arr!39652 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15401)) mapDefault!50296)))))

(declare-fun b!1261150 () Bool)

(declare-fun res!840417 () Bool)

(declare-fun e!717754 () Bool)

(assert (=> b!1261150 (=> (not res!840417) (not e!717754))))

(declare-datatypes ((array!82199 0))(
  ( (array!82200 (arr!39653 (Array (_ BitVec 32) (_ BitVec 64))) (size!40191 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82199)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82199 (_ BitVec 32)) Bool)

(assert (=> b!1261150 (= res!840417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261151 () Bool)

(declare-fun res!840414 () Bool)

(assert (=> b!1261151 (=> (not res!840414) (not e!717754))))

(declare-datatypes ((List!28273 0))(
  ( (Nil!28270) (Cons!28269 (h!29478 (_ BitVec 64)) (t!41763 List!28273)) )
))
(declare-fun arrayNoDuplicates!0 (array!82199 (_ BitVec 32) List!28273) Bool)

(assert (=> b!1261151 (= res!840414 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28270))))

(declare-fun res!840416 () Bool)

(assert (=> start!105882 (=> (not res!840416) (not e!717754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105882 (= res!840416 (validMask!0 mask!1466))))

(assert (=> start!105882 e!717754))

(assert (=> start!105882 true))

(assert (=> start!105882 tp!95813))

(declare-fun tp_is_empty!32329 () Bool)

(assert (=> start!105882 tp_is_empty!32329))

(declare-fun array_inv!30337 (array!82199) Bool)

(assert (=> start!105882 (array_inv!30337 _keys!1118)))

(declare-fun array_inv!30338 (array!82197) Bool)

(assert (=> start!105882 (and (array_inv!30338 _values!914) e!717755)))

(declare-fun mapIsEmpty!50296 () Bool)

(assert (=> mapIsEmpty!50296 mapRes!50296))

(declare-fun b!1261152 () Bool)

(declare-fun res!840415 () Bool)

(assert (=> b!1261152 (=> (not res!840415) (not e!717754))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1261152 (= res!840415 (and (= (size!40190 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40191 _keys!1118) (size!40190 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261153 () Bool)

(assert (=> b!1261153 (= e!717754 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!21070 0))(
  ( (tuple2!21071 (_1!10546 (_ BitVec 64)) (_2!10546 V!48471)) )
))
(declare-datatypes ((List!28274 0))(
  ( (Nil!28271) (Cons!28270 (h!29479 tuple2!21070) (t!41764 List!28274)) )
))
(declare-datatypes ((ListLongMap!18943 0))(
  ( (ListLongMap!18944 (toList!9487 List!28274)) )
))
(declare-fun lt!571389 () ListLongMap!18943)

(declare-fun minValueAfter!43 () V!48471)

(declare-fun zeroValue!871 () V!48471)

(declare-fun getCurrentListMapNoExtraKeys!5856 (array!82199 array!82197 (_ BitVec 32) (_ BitVec 32) V!48471 V!48471 (_ BitVec 32) Int) ListLongMap!18943)

(assert (=> b!1261153 (= lt!571389 (getCurrentListMapNoExtraKeys!5856 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571390 () ListLongMap!18943)

(declare-fun minValueBefore!43 () V!48471)

(assert (=> b!1261153 (= lt!571390 (getCurrentListMapNoExtraKeys!5856 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50296 () Bool)

(declare-fun tp!95812 () Bool)

(declare-fun e!717753 () Bool)

(assert (=> mapNonEmpty!50296 (= mapRes!50296 (and tp!95812 e!717753))))

(declare-fun mapValue!50296 () ValueCell!15401)

(declare-fun mapKey!50296 () (_ BitVec 32))

(declare-fun mapRest!50296 () (Array (_ BitVec 32) ValueCell!15401))

(assert (=> mapNonEmpty!50296 (= (arr!39652 _values!914) (store mapRest!50296 mapKey!50296 mapValue!50296))))

(declare-fun b!1261154 () Bool)

(assert (=> b!1261154 (= e!717753 tp_is_empty!32329)))

(declare-fun b!1261155 () Bool)

(assert (=> b!1261155 (= e!717752 tp_is_empty!32329)))

(assert (= (and start!105882 res!840416) b!1261152))

(assert (= (and b!1261152 res!840415) b!1261150))

(assert (= (and b!1261150 res!840417) b!1261151))

(assert (= (and b!1261151 res!840414) b!1261153))

(assert (= (and b!1261149 condMapEmpty!50296) mapIsEmpty!50296))

(assert (= (and b!1261149 (not condMapEmpty!50296)) mapNonEmpty!50296))

(get-info :version)

(assert (= (and mapNonEmpty!50296 ((_ is ValueCellFull!15401) mapValue!50296)) b!1261154))

(assert (= (and b!1261149 ((_ is ValueCellFull!15401) mapDefault!50296)) b!1261155))

(assert (= start!105882 b!1261149))

(declare-fun m!1161385 () Bool)

(assert (=> b!1261150 m!1161385))

(declare-fun m!1161387 () Bool)

(assert (=> b!1261153 m!1161387))

(declare-fun m!1161389 () Bool)

(assert (=> b!1261153 m!1161389))

(declare-fun m!1161391 () Bool)

(assert (=> start!105882 m!1161391))

(declare-fun m!1161393 () Bool)

(assert (=> start!105882 m!1161393))

(declare-fun m!1161395 () Bool)

(assert (=> start!105882 m!1161395))

(declare-fun m!1161397 () Bool)

(assert (=> b!1261151 m!1161397))

(declare-fun m!1161399 () Bool)

(assert (=> mapNonEmpty!50296 m!1161399))

(check-sat (not start!105882) b_and!45317 (not b!1261150) (not b!1261151) (not mapNonEmpty!50296) (not b!1261153) tp_is_empty!32329 (not b_next!27427))
(check-sat b_and!45317 (not b_next!27427))
