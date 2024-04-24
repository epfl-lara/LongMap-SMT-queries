; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70398 () Bool)

(assert start!70398)

(declare-fun b_free!12625 () Bool)

(declare-fun b_next!12625 () Bool)

(assert (=> start!70398 (= b_free!12625 (not b_next!12625))))

(declare-fun tp!44595 () Bool)

(declare-fun b_and!21423 () Bool)

(assert (=> start!70398 (= tp!44595 b_and!21423)))

(declare-fun mapNonEmpty!23089 () Bool)

(declare-fun mapRes!23089 () Bool)

(declare-fun tp!44596 () Bool)

(declare-fun e!453113 () Bool)

(assert (=> mapNonEmpty!23089 (= mapRes!23089 (and tp!44596 e!453113))))

(declare-datatypes ((V!24115 0))(
  ( (V!24116 (val!7215 Int)) )
))
(declare-datatypes ((ValueCell!6752 0))(
  ( (ValueCellFull!6752 (v!9642 V!24115)) (EmptyCell!6752) )
))
(declare-fun mapValue!23089 () ValueCell!6752)

(declare-fun mapKey!23089 () (_ BitVec 32))

(declare-datatypes ((array!44871 0))(
  ( (array!44872 (arr!21489 (Array (_ BitVec 32) ValueCell!6752)) (size!21909 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44871)

(declare-fun mapRest!23089 () (Array (_ BitVec 32) ValueCell!6752))

(assert (=> mapNonEmpty!23089 (= (arr!21489 _values!788) (store mapRest!23089 mapKey!23089 mapValue!23089))))

(declare-fun res!557475 () Bool)

(declare-fun e!453114 () Bool)

(assert (=> start!70398 (=> (not res!557475) (not e!453114))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70398 (= res!557475 (validMask!0 mask!1312))))

(assert (=> start!70398 e!453114))

(declare-fun tp_is_empty!14335 () Bool)

(assert (=> start!70398 tp_is_empty!14335))

(declare-datatypes ((array!44873 0))(
  ( (array!44874 (arr!21490 (Array (_ BitVec 32) (_ BitVec 64))) (size!21910 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44873)

(declare-fun array_inv!17233 (array!44873) Bool)

(assert (=> start!70398 (array_inv!17233 _keys!976)))

(assert (=> start!70398 true))

(declare-fun e!453118 () Bool)

(declare-fun array_inv!17234 (array!44871) Bool)

(assert (=> start!70398 (and (array_inv!17234 _values!788) e!453118)))

(assert (=> start!70398 tp!44595))

(declare-fun b!816837 () Bool)

(declare-fun e!453117 () Bool)

(assert (=> b!816837 (= e!453117 true)))

(declare-fun zeroValueAfter!34 () V!24115)

(declare-fun minValue!754 () V!24115)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9388 0))(
  ( (tuple2!9389 (_1!4705 (_ BitVec 64)) (_2!4705 V!24115)) )
))
(declare-datatypes ((List!15200 0))(
  ( (Nil!15197) (Cons!15196 (h!16331 tuple2!9388) (t!21513 List!15200)) )
))
(declare-datatypes ((ListLongMap!8213 0))(
  ( (ListLongMap!8214 (toList!4122 List!15200)) )
))
(declare-fun lt!365711 () ListLongMap!8213)

(declare-fun getCurrentListMap!2341 (array!44873 array!44871 (_ BitVec 32) (_ BitVec 32) V!24115 V!24115 (_ BitVec 32) Int) ListLongMap!8213)

(assert (=> b!816837 (= lt!365711 (getCurrentListMap!2341 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24115)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365713 () ListLongMap!8213)

(declare-fun +!1801 (ListLongMap!8213 tuple2!9388) ListLongMap!8213)

(assert (=> b!816837 (= lt!365713 (+!1801 (getCurrentListMap!2341 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816838 () Bool)

(declare-fun e!453115 () Bool)

(assert (=> b!816838 (= e!453115 tp_is_empty!14335)))

(declare-fun b!816839 () Bool)

(assert (=> b!816839 (= e!453118 (and e!453115 mapRes!23089))))

(declare-fun condMapEmpty!23089 () Bool)

(declare-fun mapDefault!23089 () ValueCell!6752)

(assert (=> b!816839 (= condMapEmpty!23089 (= (arr!21489 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6752)) mapDefault!23089)))))

(declare-fun mapIsEmpty!23089 () Bool)

(assert (=> mapIsEmpty!23089 mapRes!23089))

(declare-fun b!816840 () Bool)

(declare-fun res!557473 () Bool)

(assert (=> b!816840 (=> (not res!557473) (not e!453114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44873 (_ BitVec 32)) Bool)

(assert (=> b!816840 (= res!557473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816841 () Bool)

(declare-fun res!557474 () Bool)

(assert (=> b!816841 (=> (not res!557474) (not e!453114))))

(assert (=> b!816841 (= res!557474 (and (= (size!21909 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21910 _keys!976) (size!21909 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816842 () Bool)

(assert (=> b!816842 (= e!453114 (not e!453117))))

(declare-fun res!557472 () Bool)

(assert (=> b!816842 (=> res!557472 e!453117)))

(assert (=> b!816842 (= res!557472 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365710 () ListLongMap!8213)

(declare-fun lt!365712 () ListLongMap!8213)

(assert (=> b!816842 (= lt!365710 lt!365712)))

(declare-datatypes ((Unit!27807 0))(
  ( (Unit!27808) )
))
(declare-fun lt!365714 () Unit!27807)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!315 (array!44873 array!44871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24115 V!24115 V!24115 V!24115 (_ BitVec 32) Int) Unit!27807)

(assert (=> b!816842 (= lt!365714 (lemmaNoChangeToArrayThenSameMapNoExtras!315 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2227 (array!44873 array!44871 (_ BitVec 32) (_ BitVec 32) V!24115 V!24115 (_ BitVec 32) Int) ListLongMap!8213)

(assert (=> b!816842 (= lt!365712 (getCurrentListMapNoExtraKeys!2227 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816842 (= lt!365710 (getCurrentListMapNoExtraKeys!2227 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816843 () Bool)

(assert (=> b!816843 (= e!453113 tp_is_empty!14335)))

(declare-fun b!816844 () Bool)

(declare-fun res!557471 () Bool)

(assert (=> b!816844 (=> (not res!557471) (not e!453114))))

(declare-datatypes ((List!15201 0))(
  ( (Nil!15198) (Cons!15197 (h!16332 (_ BitVec 64)) (t!21514 List!15201)) )
))
(declare-fun arrayNoDuplicates!0 (array!44873 (_ BitVec 32) List!15201) Bool)

(assert (=> b!816844 (= res!557471 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15198))))

(assert (= (and start!70398 res!557475) b!816841))

(assert (= (and b!816841 res!557474) b!816840))

(assert (= (and b!816840 res!557473) b!816844))

(assert (= (and b!816844 res!557471) b!816842))

(assert (= (and b!816842 (not res!557472)) b!816837))

(assert (= (and b!816839 condMapEmpty!23089) mapIsEmpty!23089))

(assert (= (and b!816839 (not condMapEmpty!23089)) mapNonEmpty!23089))

(get-info :version)

(assert (= (and mapNonEmpty!23089 ((_ is ValueCellFull!6752) mapValue!23089)) b!816843))

(assert (= (and b!816839 ((_ is ValueCellFull!6752) mapDefault!23089)) b!816838))

(assert (= start!70398 b!816839))

(declare-fun m!758871 () Bool)

(assert (=> b!816842 m!758871))

(declare-fun m!758873 () Bool)

(assert (=> b!816842 m!758873))

(declare-fun m!758875 () Bool)

(assert (=> b!816842 m!758875))

(declare-fun m!758877 () Bool)

(assert (=> start!70398 m!758877))

(declare-fun m!758879 () Bool)

(assert (=> start!70398 m!758879))

(declare-fun m!758881 () Bool)

(assert (=> start!70398 m!758881))

(declare-fun m!758883 () Bool)

(assert (=> mapNonEmpty!23089 m!758883))

(declare-fun m!758885 () Bool)

(assert (=> b!816840 m!758885))

(declare-fun m!758887 () Bool)

(assert (=> b!816837 m!758887))

(declare-fun m!758889 () Bool)

(assert (=> b!816837 m!758889))

(assert (=> b!816837 m!758889))

(declare-fun m!758891 () Bool)

(assert (=> b!816837 m!758891))

(declare-fun m!758893 () Bool)

(assert (=> b!816844 m!758893))

(check-sat b_and!21423 (not start!70398) (not b_next!12625) tp_is_empty!14335 (not b!816840) (not b!816842) (not b!816837) (not mapNonEmpty!23089) (not b!816844))
(check-sat b_and!21423 (not b_next!12625))
