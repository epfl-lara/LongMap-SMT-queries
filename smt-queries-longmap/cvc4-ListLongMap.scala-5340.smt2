; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71370 () Bool)

(assert start!71370)

(declare-fun b_free!13451 () Bool)

(declare-fun b_next!13451 () Bool)

(assert (=> start!71370 (= b_free!13451 (not b_next!13451))))

(declare-fun tp!47127 () Bool)

(declare-fun b_and!22433 () Bool)

(assert (=> start!71370 (= tp!47127 b_and!22433)))

(declare-fun b!828866 () Bool)

(declare-datatypes ((V!25215 0))(
  ( (V!25216 (val!7628 Int)) )
))
(declare-datatypes ((tuple2!10116 0))(
  ( (tuple2!10117 (_1!5069 (_ BitVec 64)) (_2!5069 V!25215)) )
))
(declare-datatypes ((List!15908 0))(
  ( (Nil!15905) (Cons!15904 (h!17033 tuple2!10116) (t!22265 List!15908)) )
))
(declare-datatypes ((ListLongMap!8939 0))(
  ( (ListLongMap!8940 (toList!4485 List!15908)) )
))
(declare-fun lt!375700 () ListLongMap!8939)

(declare-fun e!461930 () Bool)

(declare-fun lt!375705 () tuple2!10116)

(declare-fun lt!375706 () tuple2!10116)

(declare-fun lt!375703 () ListLongMap!8939)

(declare-fun +!1966 (ListLongMap!8939 tuple2!10116) ListLongMap!8939)

(assert (=> b!828866 (= e!461930 (= lt!375700 (+!1966 (+!1966 lt!375703 lt!375706) lt!375705)))))

(declare-fun lt!375701 () ListLongMap!8939)

(declare-fun lt!375702 () ListLongMap!8939)

(assert (=> b!828866 (= (+!1966 lt!375701 lt!375705) (+!1966 lt!375702 lt!375705))))

(declare-fun zeroValueBefore!34 () V!25215)

(declare-fun zeroValueAfter!34 () V!25215)

(declare-datatypes ((Unit!28391 0))(
  ( (Unit!28392) )
))
(declare-fun lt!375704 () Unit!28391)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!238 (ListLongMap!8939 (_ BitVec 64) V!25215 V!25215) Unit!28391)

(assert (=> b!828866 (= lt!375704 (addSameAsAddTwiceSameKeyDiffValues!238 lt!375701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!828866 (= lt!375705 (tuple2!10117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!461928 () Bool)

(assert (=> b!828866 e!461928))

(declare-fun res!564726 () Bool)

(assert (=> b!828866 (=> (not res!564726) (not e!461928))))

(declare-fun lt!375698 () ListLongMap!8939)

(assert (=> b!828866 (= res!564726 (= lt!375698 lt!375702))))

(assert (=> b!828866 (= lt!375702 (+!1966 lt!375701 lt!375706))))

(assert (=> b!828866 (= lt!375706 (tuple2!10117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46488 0))(
  ( (array!46489 (arr!22284 (Array (_ BitVec 32) (_ BitVec 64))) (size!22705 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46488)

(declare-fun minValue!754 () V!25215)

(declare-datatypes ((ValueCell!7165 0))(
  ( (ValueCellFull!7165 (v!10066 V!25215)) (EmptyCell!7165) )
))
(declare-datatypes ((array!46490 0))(
  ( (array!46491 (arr!22285 (Array (_ BitVec 32) ValueCell!7165)) (size!22706 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46490)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2585 (array!46488 array!46490 (_ BitVec 32) (_ BitVec 32) V!25215 V!25215 (_ BitVec 32) Int) ListLongMap!8939)

(assert (=> b!828866 (= lt!375700 (getCurrentListMap!2585 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828866 (= lt!375698 (getCurrentListMap!2585 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24382 () Bool)

(declare-fun mapRes!24382 () Bool)

(declare-fun tp!47128 () Bool)

(declare-fun e!461926 () Bool)

(assert (=> mapNonEmpty!24382 (= mapRes!24382 (and tp!47128 e!461926))))

(declare-fun mapValue!24382 () ValueCell!7165)

(declare-fun mapKey!24382 () (_ BitVec 32))

(declare-fun mapRest!24382 () (Array (_ BitVec 32) ValueCell!7165))

(assert (=> mapNonEmpty!24382 (= (arr!22285 _values!788) (store mapRest!24382 mapKey!24382 mapValue!24382))))

(declare-fun res!564725 () Bool)

(declare-fun e!461927 () Bool)

(assert (=> start!71370 (=> (not res!564725) (not e!461927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71370 (= res!564725 (validMask!0 mask!1312))))

(assert (=> start!71370 e!461927))

(declare-fun tp_is_empty!15161 () Bool)

(assert (=> start!71370 tp_is_empty!15161))

(declare-fun array_inv!17753 (array!46488) Bool)

(assert (=> start!71370 (array_inv!17753 _keys!976)))

(assert (=> start!71370 true))

(declare-fun e!461932 () Bool)

(declare-fun array_inv!17754 (array!46490) Bool)

(assert (=> start!71370 (and (array_inv!17754 _values!788) e!461932)))

(assert (=> start!71370 tp!47127))

(declare-fun b!828867 () Bool)

(declare-fun res!564723 () Bool)

(assert (=> b!828867 (=> (not res!564723) (not e!461927))))

(declare-datatypes ((List!15909 0))(
  ( (Nil!15906) (Cons!15905 (h!17034 (_ BitVec 64)) (t!22266 List!15909)) )
))
(declare-fun arrayNoDuplicates!0 (array!46488 (_ BitVec 32) List!15909) Bool)

(assert (=> b!828867 (= res!564723 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15906))))

(declare-fun b!828868 () Bool)

(assert (=> b!828868 (= e!461927 (not e!461930))))

(declare-fun res!564727 () Bool)

(assert (=> b!828868 (=> res!564727 e!461930)))

(assert (=> b!828868 (= res!564727 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828868 (= lt!375701 lt!375703)))

(declare-fun lt!375699 () Unit!28391)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!574 (array!46488 array!46490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25215 V!25215 V!25215 V!25215 (_ BitVec 32) Int) Unit!28391)

(assert (=> b!828868 (= lt!375699 (lemmaNoChangeToArrayThenSameMapNoExtras!574 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2486 (array!46488 array!46490 (_ BitVec 32) (_ BitVec 32) V!25215 V!25215 (_ BitVec 32) Int) ListLongMap!8939)

(assert (=> b!828868 (= lt!375703 (getCurrentListMapNoExtraKeys!2486 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828868 (= lt!375701 (getCurrentListMapNoExtraKeys!2486 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828869 () Bool)

(declare-fun res!564728 () Bool)

(assert (=> b!828869 (=> (not res!564728) (not e!461927))))

(assert (=> b!828869 (= res!564728 (and (= (size!22706 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22705 _keys!976) (size!22706 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828870 () Bool)

(declare-fun e!461931 () Bool)

(assert (=> b!828870 (= e!461931 tp_is_empty!15161)))

(declare-fun b!828871 () Bool)

(assert (=> b!828871 (= e!461932 (and e!461931 mapRes!24382))))

(declare-fun condMapEmpty!24382 () Bool)

(declare-fun mapDefault!24382 () ValueCell!7165)

