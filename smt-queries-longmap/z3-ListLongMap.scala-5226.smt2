; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70422 () Bool)

(assert start!70422)

(declare-fun b_free!12765 () Bool)

(declare-fun b_next!12765 () Bool)

(assert (=> start!70422 (= b_free!12765 (not b_next!12765))))

(declare-fun tp!45024 () Bool)

(declare-fun b_and!21585 () Bool)

(assert (=> start!70422 (= tp!45024 b_and!21585)))

(declare-fun b!817995 () Bool)

(declare-fun res!558290 () Bool)

(declare-fun e!453990 () Bool)

(assert (=> b!817995 (=> (not res!558290) (not e!453990))))

(declare-datatypes ((array!45150 0))(
  ( (array!45151 (arr!21630 (Array (_ BitVec 32) (_ BitVec 64))) (size!22051 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45150)

(declare-datatypes ((List!15404 0))(
  ( (Nil!15401) (Cons!15400 (h!16529 (_ BitVec 64)) (t!21731 List!15404)) )
))
(declare-fun arrayNoDuplicates!0 (array!45150 (_ BitVec 32) List!15404) Bool)

(assert (=> b!817995 (= res!558290 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15401))))

(declare-fun b!817996 () Bool)

(declare-fun res!558291 () Bool)

(assert (=> b!817996 (=> (not res!558291) (not e!453990))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24301 0))(
  ( (V!24302 (val!7285 Int)) )
))
(declare-datatypes ((ValueCell!6822 0))(
  ( (ValueCellFull!6822 (v!9714 V!24301)) (EmptyCell!6822) )
))
(declare-datatypes ((array!45152 0))(
  ( (array!45153 (arr!21631 (Array (_ BitVec 32) ValueCell!6822)) (size!22052 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45152)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817996 (= res!558291 (and (= (size!22052 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22051 _keys!976) (size!22052 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817997 () Bool)

(declare-fun e!453994 () Bool)

(declare-fun tp_is_empty!14475 () Bool)

(assert (=> b!817997 (= e!453994 tp_is_empty!14475)))

(declare-fun res!558293 () Bool)

(assert (=> start!70422 (=> (not res!558293) (not e!453990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70422 (= res!558293 (validMask!0 mask!1312))))

(assert (=> start!70422 e!453990))

(assert (=> start!70422 tp_is_empty!14475))

(declare-fun array_inv!17301 (array!45150) Bool)

(assert (=> start!70422 (array_inv!17301 _keys!976)))

(assert (=> start!70422 true))

(declare-fun e!453991 () Bool)

(declare-fun array_inv!17302 (array!45152) Bool)

(assert (=> start!70422 (and (array_inv!17302 _values!788) e!453991)))

(assert (=> start!70422 tp!45024))

(declare-fun mapIsEmpty!23308 () Bool)

(declare-fun mapRes!23308 () Bool)

(assert (=> mapIsEmpty!23308 mapRes!23308))

(declare-fun mapNonEmpty!23308 () Bool)

(declare-fun tp!45025 () Bool)

(declare-fun e!453993 () Bool)

(assert (=> mapNonEmpty!23308 (= mapRes!23308 (and tp!45025 e!453993))))

(declare-fun mapRest!23308 () (Array (_ BitVec 32) ValueCell!6822))

(declare-fun mapKey!23308 () (_ BitVec 32))

(declare-fun mapValue!23308 () ValueCell!6822)

(assert (=> mapNonEmpty!23308 (= (arr!21631 _values!788) (store mapRest!23308 mapKey!23308 mapValue!23308))))

(declare-fun b!817998 () Bool)

(assert (=> b!817998 (= e!453991 (and e!453994 mapRes!23308))))

(declare-fun condMapEmpty!23308 () Bool)

(declare-fun mapDefault!23308 () ValueCell!6822)

(assert (=> b!817998 (= condMapEmpty!23308 (= (arr!21631 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6822)) mapDefault!23308)))))

(declare-fun b!817999 () Bool)

(declare-fun e!453989 () Bool)

(assert (=> b!817999 (= e!453989 true)))

(declare-fun zeroValueBefore!34 () V!24301)

(declare-fun minValue!754 () V!24301)

(declare-datatypes ((tuple2!9576 0))(
  ( (tuple2!9577 (_1!4799 (_ BitVec 64)) (_2!4799 V!24301)) )
))
(declare-datatypes ((List!15405 0))(
  ( (Nil!15402) (Cons!15401 (h!16530 tuple2!9576) (t!21732 List!15405)) )
))
(declare-datatypes ((ListLongMap!8399 0))(
  ( (ListLongMap!8400 (toList!4215 List!15405)) )
))
(declare-fun lt!366506 () ListLongMap!8399)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2421 (array!45150 array!45152 (_ BitVec 32) (_ BitVec 32) V!24301 V!24301 (_ BitVec 32) Int) ListLongMap!8399)

(assert (=> b!817999 (= lt!366506 (getCurrentListMap!2421 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818000 () Bool)

(assert (=> b!818000 (= e!453993 tp_is_empty!14475)))

(declare-fun b!818001 () Bool)

(assert (=> b!818001 (= e!453990 (not e!453989))))

(declare-fun res!558289 () Bool)

(assert (=> b!818001 (=> res!558289 e!453989)))

(assert (=> b!818001 (= res!558289 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366507 () ListLongMap!8399)

(declare-fun lt!366505 () ListLongMap!8399)

(assert (=> b!818001 (= lt!366507 lt!366505)))

(declare-datatypes ((Unit!27914 0))(
  ( (Unit!27915) )
))
(declare-fun lt!366508 () Unit!27914)

(declare-fun zeroValueAfter!34 () V!24301)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!366 (array!45150 array!45152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24301 V!24301 V!24301 V!24301 (_ BitVec 32) Int) Unit!27914)

(assert (=> b!818001 (= lt!366508 (lemmaNoChangeToArrayThenSameMapNoExtras!366 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2256 (array!45150 array!45152 (_ BitVec 32) (_ BitVec 32) V!24301 V!24301 (_ BitVec 32) Int) ListLongMap!8399)

(assert (=> b!818001 (= lt!366505 (getCurrentListMapNoExtraKeys!2256 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818001 (= lt!366507 (getCurrentListMapNoExtraKeys!2256 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818002 () Bool)

(declare-fun res!558292 () Bool)

(assert (=> b!818002 (=> (not res!558292) (not e!453990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45150 (_ BitVec 32)) Bool)

(assert (=> b!818002 (= res!558292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70422 res!558293) b!817996))

(assert (= (and b!817996 res!558291) b!818002))

(assert (= (and b!818002 res!558292) b!817995))

(assert (= (and b!817995 res!558290) b!818001))

(assert (= (and b!818001 (not res!558289)) b!817999))

(assert (= (and b!817998 condMapEmpty!23308) mapIsEmpty!23308))

(assert (= (and b!817998 (not condMapEmpty!23308)) mapNonEmpty!23308))

(get-info :version)

(assert (= (and mapNonEmpty!23308 ((_ is ValueCellFull!6822) mapValue!23308)) b!818000))

(assert (= (and b!817998 ((_ is ValueCellFull!6822) mapDefault!23308)) b!817997))

(assert (= start!70422 b!817998))

(declare-fun m!759485 () Bool)

(assert (=> b!818002 m!759485))

(declare-fun m!759487 () Bool)

(assert (=> b!818001 m!759487))

(declare-fun m!759489 () Bool)

(assert (=> b!818001 m!759489))

(declare-fun m!759491 () Bool)

(assert (=> b!818001 m!759491))

(declare-fun m!759493 () Bool)

(assert (=> start!70422 m!759493))

(declare-fun m!759495 () Bool)

(assert (=> start!70422 m!759495))

(declare-fun m!759497 () Bool)

(assert (=> start!70422 m!759497))

(declare-fun m!759499 () Bool)

(assert (=> b!817995 m!759499))

(declare-fun m!759501 () Bool)

(assert (=> b!817999 m!759501))

(declare-fun m!759503 () Bool)

(assert (=> mapNonEmpty!23308 m!759503))

(check-sat (not b!818002) (not mapNonEmpty!23308) (not b_next!12765) (not b!818001) (not start!70422) b_and!21585 tp_is_empty!14475 (not b!817995) (not b!817999))
(check-sat b_and!21585 (not b_next!12765))
