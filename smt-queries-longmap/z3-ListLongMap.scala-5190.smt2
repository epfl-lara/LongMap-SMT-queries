; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70142 () Bool)

(assert start!70142)

(declare-fun b_free!12549 () Bool)

(declare-fun b_next!12549 () Bool)

(assert (=> start!70142 (= b_free!12549 (not b_next!12549))))

(declare-fun tp!44365 () Bool)

(declare-fun b_and!21329 () Bool)

(assert (=> start!70142 (= tp!44365 b_and!21329)))

(declare-fun b!815004 () Bool)

(declare-fun e!451854 () Bool)

(declare-fun tp_is_empty!14259 () Bool)

(assert (=> b!815004 (= e!451854 tp_is_empty!14259)))

(declare-fun res!556583 () Bool)

(declare-fun e!451857 () Bool)

(assert (=> start!70142 (=> (not res!556583) (not e!451857))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70142 (= res!556583 (validMask!0 mask!1312))))

(assert (=> start!70142 e!451857))

(assert (=> start!70142 tp_is_empty!14259))

(declare-datatypes ((array!44722 0))(
  ( (array!44723 (arr!21420 (Array (_ BitVec 32) (_ BitVec 64))) (size!21841 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44722)

(declare-fun array_inv!17139 (array!44722) Bool)

(assert (=> start!70142 (array_inv!17139 _keys!976)))

(assert (=> start!70142 true))

(declare-datatypes ((V!24013 0))(
  ( (V!24014 (val!7177 Int)) )
))
(declare-datatypes ((ValueCell!6714 0))(
  ( (ValueCellFull!6714 (v!9604 V!24013)) (EmptyCell!6714) )
))
(declare-datatypes ((array!44724 0))(
  ( (array!44725 (arr!21421 (Array (_ BitVec 32) ValueCell!6714)) (size!21842 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44724)

(declare-fun e!451856 () Bool)

(declare-fun array_inv!17140 (array!44724) Bool)

(assert (=> start!70142 (and (array_inv!17140 _values!788) e!451856)))

(assert (=> start!70142 tp!44365))

(declare-fun b!815005 () Bool)

(declare-fun e!451855 () Bool)

(assert (=> b!815005 (= e!451855 tp_is_empty!14259)))

(declare-fun b!815006 () Bool)

(declare-fun mapRes!22972 () Bool)

(assert (=> b!815006 (= e!451856 (and e!451855 mapRes!22972))))

(declare-fun condMapEmpty!22972 () Bool)

(declare-fun mapDefault!22972 () ValueCell!6714)

(assert (=> b!815006 (= condMapEmpty!22972 (= (arr!21421 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6714)) mapDefault!22972)))))

(declare-fun b!815007 () Bool)

(declare-fun res!556585 () Bool)

(assert (=> b!815007 (=> (not res!556585) (not e!451857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44722 (_ BitVec 32)) Bool)

(assert (=> b!815007 (= res!556585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22972 () Bool)

(declare-fun tp!44364 () Bool)

(assert (=> mapNonEmpty!22972 (= mapRes!22972 (and tp!44364 e!451854))))

(declare-fun mapValue!22972 () ValueCell!6714)

(declare-fun mapRest!22972 () (Array (_ BitVec 32) ValueCell!6714))

(declare-fun mapKey!22972 () (_ BitVec 32))

(assert (=> mapNonEmpty!22972 (= (arr!21421 _values!788) (store mapRest!22972 mapKey!22972 mapValue!22972))))

(declare-fun b!815008 () Bool)

(assert (=> b!815008 (= e!451857 (not true))))

(declare-datatypes ((tuple2!9410 0))(
  ( (tuple2!9411 (_1!4716 (_ BitVec 64)) (_2!4716 V!24013)) )
))
(declare-datatypes ((List!15241 0))(
  ( (Nil!15238) (Cons!15237 (h!16366 tuple2!9410) (t!21560 List!15241)) )
))
(declare-datatypes ((ListLongMap!8233 0))(
  ( (ListLongMap!8234 (toList!4132 List!15241)) )
))
(declare-fun lt!364863 () ListLongMap!8233)

(declare-fun lt!364862 () ListLongMap!8233)

(assert (=> b!815008 (= lt!364863 lt!364862)))

(declare-fun zeroValueBefore!34 () V!24013)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24013)

(declare-fun minValue!754 () V!24013)

(declare-datatypes ((Unit!27762 0))(
  ( (Unit!27763) )
))
(declare-fun lt!364864 () Unit!27762)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!292 (array!44722 array!44724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24013 V!24013 V!24013 V!24013 (_ BitVec 32) Int) Unit!27762)

(assert (=> b!815008 (= lt!364864 (lemmaNoChangeToArrayThenSameMapNoExtras!292 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2182 (array!44722 array!44724 (_ BitVec 32) (_ BitVec 32) V!24013 V!24013 (_ BitVec 32) Int) ListLongMap!8233)

(assert (=> b!815008 (= lt!364862 (getCurrentListMapNoExtraKeys!2182 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815008 (= lt!364863 (getCurrentListMapNoExtraKeys!2182 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22972 () Bool)

(assert (=> mapIsEmpty!22972 mapRes!22972))

(declare-fun b!815009 () Bool)

(declare-fun res!556582 () Bool)

(assert (=> b!815009 (=> (not res!556582) (not e!451857))))

(assert (=> b!815009 (= res!556582 (and (= (size!21842 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21841 _keys!976) (size!21842 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815010 () Bool)

(declare-fun res!556584 () Bool)

(assert (=> b!815010 (=> (not res!556584) (not e!451857))))

(declare-datatypes ((List!15242 0))(
  ( (Nil!15239) (Cons!15238 (h!16367 (_ BitVec 64)) (t!21561 List!15242)) )
))
(declare-fun arrayNoDuplicates!0 (array!44722 (_ BitVec 32) List!15242) Bool)

(assert (=> b!815010 (= res!556584 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15239))))

(assert (= (and start!70142 res!556583) b!815009))

(assert (= (and b!815009 res!556582) b!815007))

(assert (= (and b!815007 res!556585) b!815010))

(assert (= (and b!815010 res!556584) b!815008))

(assert (= (and b!815006 condMapEmpty!22972) mapIsEmpty!22972))

(assert (= (and b!815006 (not condMapEmpty!22972)) mapNonEmpty!22972))

(get-info :version)

(assert (= (and mapNonEmpty!22972 ((_ is ValueCellFull!6714) mapValue!22972)) b!815004))

(assert (= (and b!815006 ((_ is ValueCellFull!6714) mapDefault!22972)) b!815005))

(assert (= start!70142 b!815006))

(declare-fun m!756731 () Bool)

(assert (=> b!815010 m!756731))

(declare-fun m!756733 () Bool)

(assert (=> b!815008 m!756733))

(declare-fun m!756735 () Bool)

(assert (=> b!815008 m!756735))

(declare-fun m!756737 () Bool)

(assert (=> b!815008 m!756737))

(declare-fun m!756739 () Bool)

(assert (=> mapNonEmpty!22972 m!756739))

(declare-fun m!756741 () Bool)

(assert (=> b!815007 m!756741))

(declare-fun m!756743 () Bool)

(assert (=> start!70142 m!756743))

(declare-fun m!756745 () Bool)

(assert (=> start!70142 m!756745))

(declare-fun m!756747 () Bool)

(assert (=> start!70142 m!756747))

(check-sat (not b_next!12549) (not mapNonEmpty!22972) (not start!70142) tp_is_empty!14259 (not b!815008) b_and!21329 (not b!815007) (not b!815010))
(check-sat b_and!21329 (not b_next!12549))
