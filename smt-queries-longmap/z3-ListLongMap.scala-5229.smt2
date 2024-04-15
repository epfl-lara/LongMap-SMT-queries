; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70418 () Bool)

(assert start!70418)

(declare-fun b_free!12781 () Bool)

(declare-fun b_next!12781 () Bool)

(assert (=> start!70418 (= b_free!12781 (not b_next!12781))))

(declare-fun tp!45073 () Bool)

(declare-fun b_and!21575 () Bool)

(assert (=> start!70418 (= tp!45073 b_and!21575)))

(declare-fun b!817941 () Bool)

(declare-fun e!453986 () Bool)

(assert (=> b!817941 (= e!453986 true)))

(declare-datatypes ((V!24323 0))(
  ( (V!24324 (val!7293 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24323)

(declare-datatypes ((array!45157 0))(
  ( (array!45158 (arr!21634 (Array (_ BitVec 32) (_ BitVec 64))) (size!22055 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45157)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6830 0))(
  ( (ValueCellFull!6830 (v!9716 V!24323)) (EmptyCell!6830) )
))
(declare-datatypes ((array!45159 0))(
  ( (array!45160 (arr!21635 (Array (_ BitVec 32) ValueCell!6830)) (size!22056 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45159)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun minValue!754 () V!24323)

(declare-datatypes ((tuple2!9606 0))(
  ( (tuple2!9607 (_1!4814 (_ BitVec 64)) (_2!4814 V!24323)) )
))
(declare-datatypes ((List!15430 0))(
  ( (Nil!15427) (Cons!15426 (h!16555 tuple2!9606) (t!21748 List!15430)) )
))
(declare-datatypes ((ListLongMap!8419 0))(
  ( (ListLongMap!8420 (toList!4225 List!15430)) )
))
(declare-fun lt!366360 () ListLongMap!8419)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2378 (array!45157 array!45159 (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 (_ BitVec 32) Int) ListLongMap!8419)

(assert (=> b!817941 (= lt!366360 (getCurrentListMap!2378 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817942 () Bool)

(declare-fun res!558304 () Bool)

(declare-fun e!453984 () Bool)

(assert (=> b!817942 (=> (not res!558304) (not e!453984))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817942 (= res!558304 (and (= (size!22056 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22055 _keys!976) (size!22056 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817943 () Bool)

(assert (=> b!817943 (= e!453984 (not e!453986))))

(declare-fun res!558306 () Bool)

(assert (=> b!817943 (=> res!558306 e!453986)))

(assert (=> b!817943 (= res!558306 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366358 () ListLongMap!8419)

(declare-fun lt!366361 () ListLongMap!8419)

(assert (=> b!817943 (= lt!366358 lt!366361)))

(declare-fun zeroValueAfter!34 () V!24323)

(declare-datatypes ((Unit!27874 0))(
  ( (Unit!27875) )
))
(declare-fun lt!366359 () Unit!27874)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!376 (array!45157 array!45159 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 V!24323 V!24323 (_ BitVec 32) Int) Unit!27874)

(assert (=> b!817943 (= lt!366359 (lemmaNoChangeToArrayThenSameMapNoExtras!376 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2283 (array!45157 array!45159 (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 (_ BitVec 32) Int) ListLongMap!8419)

(assert (=> b!817943 (= lt!366361 (getCurrentListMapNoExtraKeys!2283 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817943 (= lt!366358 (getCurrentListMapNoExtraKeys!2283 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23332 () Bool)

(declare-fun mapRes!23332 () Bool)

(declare-fun tp!45072 () Bool)

(declare-fun e!453987 () Bool)

(assert (=> mapNonEmpty!23332 (= mapRes!23332 (and tp!45072 e!453987))))

(declare-fun mapRest!23332 () (Array (_ BitVec 32) ValueCell!6830))

(declare-fun mapKey!23332 () (_ BitVec 32))

(declare-fun mapValue!23332 () ValueCell!6830)

(assert (=> mapNonEmpty!23332 (= (arr!21635 _values!788) (store mapRest!23332 mapKey!23332 mapValue!23332))))

(declare-fun b!817945 () Bool)

(declare-fun e!453983 () Bool)

(declare-fun tp_is_empty!14491 () Bool)

(assert (=> b!817945 (= e!453983 tp_is_empty!14491)))

(declare-fun mapIsEmpty!23332 () Bool)

(assert (=> mapIsEmpty!23332 mapRes!23332))

(declare-fun b!817946 () Bool)

(declare-fun res!558307 () Bool)

(assert (=> b!817946 (=> (not res!558307) (not e!453984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45157 (_ BitVec 32)) Bool)

(assert (=> b!817946 (= res!558307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817947 () Bool)

(declare-fun res!558305 () Bool)

(assert (=> b!817947 (=> (not res!558305) (not e!453984))))

(declare-datatypes ((List!15431 0))(
  ( (Nil!15428) (Cons!15427 (h!16556 (_ BitVec 64)) (t!21749 List!15431)) )
))
(declare-fun arrayNoDuplicates!0 (array!45157 (_ BitVec 32) List!15431) Bool)

(assert (=> b!817947 (= res!558305 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15428))))

(declare-fun b!817948 () Bool)

(assert (=> b!817948 (= e!453987 tp_is_empty!14491)))

(declare-fun b!817944 () Bool)

(declare-fun e!453988 () Bool)

(assert (=> b!817944 (= e!453988 (and e!453983 mapRes!23332))))

(declare-fun condMapEmpty!23332 () Bool)

(declare-fun mapDefault!23332 () ValueCell!6830)

(assert (=> b!817944 (= condMapEmpty!23332 (= (arr!21635 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6830)) mapDefault!23332)))))

(declare-fun res!558303 () Bool)

(assert (=> start!70418 (=> (not res!558303) (not e!453984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70418 (= res!558303 (validMask!0 mask!1312))))

(assert (=> start!70418 e!453984))

(assert (=> start!70418 tp_is_empty!14491))

(declare-fun array_inv!17369 (array!45157) Bool)

(assert (=> start!70418 (array_inv!17369 _keys!976)))

(assert (=> start!70418 true))

(declare-fun array_inv!17370 (array!45159) Bool)

(assert (=> start!70418 (and (array_inv!17370 _values!788) e!453988)))

(assert (=> start!70418 tp!45073))

(assert (= (and start!70418 res!558303) b!817942))

(assert (= (and b!817942 res!558304) b!817946))

(assert (= (and b!817946 res!558307) b!817947))

(assert (= (and b!817947 res!558305) b!817943))

(assert (= (and b!817943 (not res!558306)) b!817941))

(assert (= (and b!817944 condMapEmpty!23332) mapIsEmpty!23332))

(assert (= (and b!817944 (not condMapEmpty!23332)) mapNonEmpty!23332))

(get-info :version)

(assert (= (and mapNonEmpty!23332 ((_ is ValueCellFull!6830) mapValue!23332)) b!817948))

(assert (= (and b!817944 ((_ is ValueCellFull!6830) mapDefault!23332)) b!817945))

(assert (= start!70418 b!817944))

(declare-fun m!758893 () Bool)

(assert (=> start!70418 m!758893))

(declare-fun m!758895 () Bool)

(assert (=> start!70418 m!758895))

(declare-fun m!758897 () Bool)

(assert (=> start!70418 m!758897))

(declare-fun m!758899 () Bool)

(assert (=> b!817946 m!758899))

(declare-fun m!758901 () Bool)

(assert (=> mapNonEmpty!23332 m!758901))

(declare-fun m!758903 () Bool)

(assert (=> b!817947 m!758903))

(declare-fun m!758905 () Bool)

(assert (=> b!817941 m!758905))

(declare-fun m!758907 () Bool)

(assert (=> b!817943 m!758907))

(declare-fun m!758909 () Bool)

(assert (=> b!817943 m!758909))

(declare-fun m!758911 () Bool)

(assert (=> b!817943 m!758911))

(check-sat (not b!817941) (not start!70418) (not mapNonEmpty!23332) (not b!817947) (not b!817943) tp_is_empty!14491 b_and!21575 (not b_next!12781) (not b!817946))
(check-sat b_and!21575 (not b_next!12781))
