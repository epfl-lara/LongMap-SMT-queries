; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70312 () Bool)

(assert start!70312)

(declare-fun b_free!12687 () Bool)

(declare-fun b_next!12687 () Bool)

(assert (=> start!70312 (= b_free!12687 (not b_next!12687))))

(declare-fun tp!44785 () Bool)

(declare-fun b_and!21487 () Bool)

(assert (=> start!70312 (= tp!44785 b_and!21487)))

(declare-fun b!816871 () Bool)

(declare-fun e!453206 () Bool)

(declare-fun tp_is_empty!14397 () Bool)

(assert (=> b!816871 (= e!453206 tp_is_empty!14397)))

(declare-fun b!816872 () Bool)

(declare-fun res!557673 () Bool)

(declare-fun e!453208 () Bool)

(assert (=> b!816872 (=> (not res!557673) (not e!453208))))

(declare-datatypes ((array!44992 0))(
  ( (array!44993 (arr!21553 (Array (_ BitVec 32) (_ BitVec 64))) (size!21974 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44992)

(declare-datatypes ((List!15350 0))(
  ( (Nil!15347) (Cons!15346 (h!16475 (_ BitVec 64)) (t!21673 List!15350)) )
))
(declare-fun arrayNoDuplicates!0 (array!44992 (_ BitVec 32) List!15350) Bool)

(assert (=> b!816872 (= res!557673 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15347))))

(declare-fun res!557676 () Bool)

(assert (=> start!70312 (=> (not res!557676) (not e!453208))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70312 (= res!557676 (validMask!0 mask!1312))))

(assert (=> start!70312 e!453208))

(assert (=> start!70312 tp_is_empty!14397))

(declare-fun array_inv!17243 (array!44992) Bool)

(assert (=> start!70312 (array_inv!17243 _keys!976)))

(assert (=> start!70312 true))

(declare-datatypes ((V!24197 0))(
  ( (V!24198 (val!7246 Int)) )
))
(declare-datatypes ((ValueCell!6783 0))(
  ( (ValueCellFull!6783 (v!9674 V!24197)) (EmptyCell!6783) )
))
(declare-datatypes ((array!44994 0))(
  ( (array!44995 (arr!21554 (Array (_ BitVec 32) ValueCell!6783)) (size!21975 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44994)

(declare-fun e!453204 () Bool)

(declare-fun array_inv!17244 (array!44994) Bool)

(assert (=> start!70312 (and (array_inv!17244 _values!788) e!453204)))

(assert (=> start!70312 tp!44785))

(declare-fun mapNonEmpty!23185 () Bool)

(declare-fun mapRes!23185 () Bool)

(declare-fun tp!44784 () Bool)

(assert (=> mapNonEmpty!23185 (= mapRes!23185 (and tp!44784 e!453206))))

(declare-fun mapKey!23185 () (_ BitVec 32))

(declare-fun mapValue!23185 () ValueCell!6783)

(declare-fun mapRest!23185 () (Array (_ BitVec 32) ValueCell!6783))

(assert (=> mapNonEmpty!23185 (= (arr!21554 _values!788) (store mapRest!23185 mapKey!23185 mapValue!23185))))

(declare-fun b!816873 () Bool)

(declare-fun res!557675 () Bool)

(assert (=> b!816873 (=> (not res!557675) (not e!453208))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816873 (= res!557675 (and (= (size!21975 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21974 _keys!976) (size!21975 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816874 () Bool)

(declare-fun res!557672 () Bool)

(assert (=> b!816874 (=> (not res!557672) (not e!453208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44992 (_ BitVec 32)) Bool)

(assert (=> b!816874 (= res!557672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816875 () Bool)

(declare-fun e!453207 () Bool)

(assert (=> b!816875 (= e!453207 true)))

(declare-datatypes ((tuple2!9522 0))(
  ( (tuple2!9523 (_1!4772 (_ BitVec 64)) (_2!4772 V!24197)) )
))
(declare-datatypes ((List!15351 0))(
  ( (Nil!15348) (Cons!15347 (h!16476 tuple2!9522) (t!21674 List!15351)) )
))
(declare-datatypes ((ListLongMap!8345 0))(
  ( (ListLongMap!8346 (toList!4188 List!15351)) )
))
(declare-fun lt!365943 () ListLongMap!8345)

(declare-fun zeroValueAfter!34 () V!24197)

(declare-fun minValue!754 () V!24197)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2412 (array!44992 array!44994 (_ BitVec 32) (_ BitVec 32) V!24197 V!24197 (_ BitVec 32) Int) ListLongMap!8345)

(assert (=> b!816875 (= lt!365943 (getCurrentListMap!2412 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365944 () ListLongMap!8345)

(declare-fun zeroValueBefore!34 () V!24197)

(declare-fun +!1818 (ListLongMap!8345 tuple2!9522) ListLongMap!8345)

(assert (=> b!816875 (= lt!365944 (+!1818 (getCurrentListMap!2412 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816876 () Bool)

(declare-fun e!453205 () Bool)

(assert (=> b!816876 (= e!453205 tp_is_empty!14397)))

(declare-fun b!816877 () Bool)

(assert (=> b!816877 (= e!453204 (and e!453205 mapRes!23185))))

(declare-fun condMapEmpty!23185 () Bool)

(declare-fun mapDefault!23185 () ValueCell!6783)

(assert (=> b!816877 (= condMapEmpty!23185 (= (arr!21554 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6783)) mapDefault!23185)))))

(declare-fun b!816878 () Bool)

(assert (=> b!816878 (= e!453208 (not e!453207))))

(declare-fun res!557674 () Bool)

(assert (=> b!816878 (=> res!557674 e!453207)))

(assert (=> b!816878 (= res!557674 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365946 () ListLongMap!8345)

(declare-fun lt!365945 () ListLongMap!8345)

(assert (=> b!816878 (= lt!365946 lt!365945)))

(declare-datatypes ((Unit!27860 0))(
  ( (Unit!27861) )
))
(declare-fun lt!365947 () Unit!27860)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!340 (array!44992 array!44994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24197 V!24197 V!24197 V!24197 (_ BitVec 32) Int) Unit!27860)

(assert (=> b!816878 (= lt!365947 (lemmaNoChangeToArrayThenSameMapNoExtras!340 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2230 (array!44992 array!44994 (_ BitVec 32) (_ BitVec 32) V!24197 V!24197 (_ BitVec 32) Int) ListLongMap!8345)

(assert (=> b!816878 (= lt!365945 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816878 (= lt!365946 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23185 () Bool)

(assert (=> mapIsEmpty!23185 mapRes!23185))

(assert (= (and start!70312 res!557676) b!816873))

(assert (= (and b!816873 res!557675) b!816874))

(assert (= (and b!816874 res!557672) b!816872))

(assert (= (and b!816872 res!557673) b!816878))

(assert (= (and b!816878 (not res!557674)) b!816875))

(assert (= (and b!816877 condMapEmpty!23185) mapIsEmpty!23185))

(assert (= (and b!816877 (not condMapEmpty!23185)) mapNonEmpty!23185))

(get-info :version)

(assert (= (and mapNonEmpty!23185 ((_ is ValueCellFull!6783) mapValue!23185)) b!816871))

(assert (= (and b!816877 ((_ is ValueCellFull!6783) mapDefault!23185)) b!816876))

(assert (= start!70312 b!816877))

(declare-fun m!758503 () Bool)

(assert (=> b!816872 m!758503))

(declare-fun m!758505 () Bool)

(assert (=> start!70312 m!758505))

(declare-fun m!758507 () Bool)

(assert (=> start!70312 m!758507))

(declare-fun m!758509 () Bool)

(assert (=> start!70312 m!758509))

(declare-fun m!758511 () Bool)

(assert (=> mapNonEmpty!23185 m!758511))

(declare-fun m!758513 () Bool)

(assert (=> b!816874 m!758513))

(declare-fun m!758515 () Bool)

(assert (=> b!816878 m!758515))

(declare-fun m!758517 () Bool)

(assert (=> b!816878 m!758517))

(declare-fun m!758519 () Bool)

(assert (=> b!816878 m!758519))

(declare-fun m!758521 () Bool)

(assert (=> b!816875 m!758521))

(declare-fun m!758523 () Bool)

(assert (=> b!816875 m!758523))

(assert (=> b!816875 m!758523))

(declare-fun m!758525 () Bool)

(assert (=> b!816875 m!758525))

(check-sat (not b!816872) b_and!21487 (not mapNonEmpty!23185) tp_is_empty!14397 (not b!816875) (not b_next!12687) (not b!816874) (not start!70312) (not b!816878))
(check-sat b_and!21487 (not b_next!12687))
