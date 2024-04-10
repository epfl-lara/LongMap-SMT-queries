; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70280 () Bool)

(assert start!70280)

(declare-fun b_free!12655 () Bool)

(declare-fun b_next!12655 () Bool)

(assert (=> start!70280 (= b_free!12655 (not b_next!12655))))

(declare-fun tp!44689 () Bool)

(declare-fun b_and!21455 () Bool)

(assert (=> start!70280 (= tp!44689 b_and!21455)))

(declare-fun b!816487 () Bool)

(declare-fun res!557435 () Bool)

(declare-fun e!452920 () Bool)

(assert (=> b!816487 (=> (not res!557435) (not e!452920))))

(declare-datatypes ((array!44932 0))(
  ( (array!44933 (arr!21523 (Array (_ BitVec 32) (_ BitVec 64))) (size!21944 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44932)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24155 0))(
  ( (V!24156 (val!7230 Int)) )
))
(declare-datatypes ((ValueCell!6767 0))(
  ( (ValueCellFull!6767 (v!9658 V!24155)) (EmptyCell!6767) )
))
(declare-datatypes ((array!44934 0))(
  ( (array!44935 (arr!21524 (Array (_ BitVec 32) ValueCell!6767)) (size!21945 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44934)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816487 (= res!557435 (and (= (size!21945 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21944 _keys!976) (size!21945 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23137 () Bool)

(declare-fun mapRes!23137 () Bool)

(assert (=> mapIsEmpty!23137 mapRes!23137))

(declare-fun b!816488 () Bool)

(declare-fun e!452915 () Bool)

(declare-fun tp_is_empty!14365 () Bool)

(assert (=> b!816488 (= e!452915 tp_is_empty!14365)))

(declare-fun res!557432 () Bool)

(assert (=> start!70280 (=> (not res!557432) (not e!452920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70280 (= res!557432 (validMask!0 mask!1312))))

(assert (=> start!70280 e!452920))

(assert (=> start!70280 tp_is_empty!14365))

(declare-fun array_inv!17223 (array!44932) Bool)

(assert (=> start!70280 (array_inv!17223 _keys!976)))

(assert (=> start!70280 true))

(declare-fun e!452917 () Bool)

(declare-fun array_inv!17224 (array!44934) Bool)

(assert (=> start!70280 (and (array_inv!17224 _values!788) e!452917)))

(assert (=> start!70280 tp!44689))

(declare-fun b!816489 () Bool)

(declare-fun e!452919 () Bool)

(assert (=> b!816489 (= e!452920 (not e!452919))))

(declare-fun res!557433 () Bool)

(assert (=> b!816489 (=> res!557433 e!452919)))

(assert (=> b!816489 (= res!557433 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9500 0))(
  ( (tuple2!9501 (_1!4761 (_ BitVec 64)) (_2!4761 V!24155)) )
))
(declare-datatypes ((List!15329 0))(
  ( (Nil!15326) (Cons!15325 (h!16454 tuple2!9500) (t!21652 List!15329)) )
))
(declare-datatypes ((ListLongMap!8323 0))(
  ( (ListLongMap!8324 (toList!4177 List!15329)) )
))
(declare-fun lt!365707 () ListLongMap!8323)

(declare-fun lt!365703 () ListLongMap!8323)

(assert (=> b!816489 (= lt!365707 lt!365703)))

(declare-fun zeroValueBefore!34 () V!24155)

(declare-fun zeroValueAfter!34 () V!24155)

(declare-fun minValue!754 () V!24155)

(declare-datatypes ((Unit!27842 0))(
  ( (Unit!27843) )
))
(declare-fun lt!365704 () Unit!27842)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!331 (array!44932 array!44934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 V!24155 V!24155 (_ BitVec 32) Int) Unit!27842)

(assert (=> b!816489 (= lt!365704 (lemmaNoChangeToArrayThenSameMapNoExtras!331 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2221 (array!44932 array!44934 (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 (_ BitVec 32) Int) ListLongMap!8323)

(assert (=> b!816489 (= lt!365703 (getCurrentListMapNoExtraKeys!2221 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816489 (= lt!365707 (getCurrentListMapNoExtraKeys!2221 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816490 () Bool)

(assert (=> b!816490 (= e!452919 true)))

(declare-fun lt!365705 () ListLongMap!8323)

(declare-fun getCurrentListMap!2402 (array!44932 array!44934 (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 (_ BitVec 32) Int) ListLongMap!8323)

(assert (=> b!816490 (= lt!365705 (getCurrentListMap!2402 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365706 () ListLongMap!8323)

(declare-fun +!1808 (ListLongMap!8323 tuple2!9500) ListLongMap!8323)

(assert (=> b!816490 (= lt!365706 (+!1808 (getCurrentListMap!2402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816491 () Bool)

(declare-fun res!557436 () Bool)

(assert (=> b!816491 (=> (not res!557436) (not e!452920))))

(declare-datatypes ((List!15330 0))(
  ( (Nil!15327) (Cons!15326 (h!16455 (_ BitVec 64)) (t!21653 List!15330)) )
))
(declare-fun arrayNoDuplicates!0 (array!44932 (_ BitVec 32) List!15330) Bool)

(assert (=> b!816491 (= res!557436 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15327))))

(declare-fun b!816492 () Bool)

(declare-fun res!557434 () Bool)

(assert (=> b!816492 (=> (not res!557434) (not e!452920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44932 (_ BitVec 32)) Bool)

(assert (=> b!816492 (= res!557434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816493 () Bool)

(assert (=> b!816493 (= e!452917 (and e!452915 mapRes!23137))))

(declare-fun condMapEmpty!23137 () Bool)

(declare-fun mapDefault!23137 () ValueCell!6767)

