; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70512 () Bool)

(assert start!70512)

(declare-fun b_free!12839 () Bool)

(declare-fun b_next!12839 () Bool)

(assert (=> start!70512 (= b_free!12839 (not b_next!12839))))

(declare-fun tp!45250 () Bool)

(declare-fun b_and!21669 () Bool)

(assert (=> start!70512 (= tp!45250 b_and!21669)))

(declare-fun b!819084 () Bool)

(declare-fun res!558959 () Bool)

(declare-fun e!454803 () Bool)

(assert (=> b!819084 (=> (not res!558959) (not e!454803))))

(declare-datatypes ((array!45294 0))(
  ( (array!45295 (arr!21701 (Array (_ BitVec 32) (_ BitVec 64))) (size!22122 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45294)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45294 (_ BitVec 32)) Bool)

(assert (=> b!819084 (= res!558959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819085 () Bool)

(declare-fun res!558957 () Bool)

(assert (=> b!819085 (=> (not res!558957) (not e!454803))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24399 0))(
  ( (V!24400 (val!7322 Int)) )
))
(declare-datatypes ((ValueCell!6859 0))(
  ( (ValueCellFull!6859 (v!9751 V!24399)) (EmptyCell!6859) )
))
(declare-datatypes ((array!45296 0))(
  ( (array!45297 (arr!21702 (Array (_ BitVec 32) ValueCell!6859)) (size!22123 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45296)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819085 (= res!558957 (and (= (size!22123 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22122 _keys!976) (size!22123 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun e!454805 () Bool)

(declare-datatypes ((tuple2!9630 0))(
  ( (tuple2!9631 (_1!4826 (_ BitVec 64)) (_2!4826 V!24399)) )
))
(declare-datatypes ((List!15459 0))(
  ( (Nil!15456) (Cons!15455 (h!16584 tuple2!9630) (t!21788 List!15459)) )
))
(declare-datatypes ((ListLongMap!8453 0))(
  ( (ListLongMap!8454 (toList!4242 List!15459)) )
))
(declare-fun lt!367373 () ListLongMap!8453)

(declare-fun lt!367381 () ListLongMap!8453)

(declare-fun zeroValueAfter!34 () V!24399)

(declare-fun b!819086 () Bool)

(declare-fun +!1839 (ListLongMap!8453 tuple2!9630) ListLongMap!8453)

(assert (=> b!819086 (= e!454805 (= lt!367373 (+!1839 lt!367381 (tuple2!9631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819087 () Bool)

(declare-fun res!558958 () Bool)

(assert (=> b!819087 (=> (not res!558958) (not e!454803))))

(declare-datatypes ((List!15460 0))(
  ( (Nil!15457) (Cons!15456 (h!16585 (_ BitVec 64)) (t!21789 List!15460)) )
))
(declare-fun arrayNoDuplicates!0 (array!45294 (_ BitVec 32) List!15460) Bool)

(assert (=> b!819087 (= res!558958 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15457))))

(declare-fun b!819088 () Bool)

(declare-fun e!454802 () Bool)

(assert (=> b!819088 (= e!454802 true)))

(declare-fun lt!367375 () tuple2!9630)

(declare-fun lt!367382 () tuple2!9630)

(declare-fun lt!367377 () ListLongMap!8453)

(assert (=> b!819088 (= lt!367377 (+!1839 (+!1839 lt!367381 lt!367382) lt!367375))))

(declare-fun lt!367380 () ListLongMap!8453)

(declare-fun lt!367376 () ListLongMap!8453)

(assert (=> b!819088 (= (+!1839 lt!367380 lt!367375) (+!1839 lt!367376 lt!367375))))

(declare-fun zeroValueBefore!34 () V!24399)

(declare-datatypes ((Unit!27963 0))(
  ( (Unit!27964) )
))
(declare-fun lt!367379 () Unit!27963)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!179 (ListLongMap!8453 (_ BitVec 64) V!24399 V!24399) Unit!27963)

(assert (=> b!819088 (= lt!367379 (addSameAsAddTwiceSameKeyDiffValues!179 lt!367380 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819088 (= lt!367375 (tuple2!9631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819088 e!454805))

(declare-fun res!558956 () Bool)

(assert (=> b!819088 (=> (not res!558956) (not e!454805))))

(declare-fun lt!367374 () ListLongMap!8453)

(assert (=> b!819088 (= res!558956 (= lt!367374 lt!367376))))

(assert (=> b!819088 (= lt!367376 (+!1839 lt!367380 lt!367382))))

(assert (=> b!819088 (= lt!367382 (tuple2!9631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24399)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2445 (array!45294 array!45296 (_ BitVec 32) (_ BitVec 32) V!24399 V!24399 (_ BitVec 32) Int) ListLongMap!8453)

(assert (=> b!819088 (= lt!367373 (getCurrentListMap!2445 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819088 (= lt!367374 (getCurrentListMap!2445 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819089 () Bool)

(assert (=> b!819089 (= e!454803 (not e!454802))))

(declare-fun res!558955 () Bool)

(assert (=> b!819089 (=> res!558955 e!454802)))

(assert (=> b!819089 (= res!558955 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819089 (= lt!367380 lt!367381)))

(declare-fun lt!367378 () Unit!27963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!386 (array!45294 array!45296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24399 V!24399 V!24399 V!24399 (_ BitVec 32) Int) Unit!27963)

(assert (=> b!819089 (= lt!367378 (lemmaNoChangeToArrayThenSameMapNoExtras!386 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2276 (array!45294 array!45296 (_ BitVec 32) (_ BitVec 32) V!24399 V!24399 (_ BitVec 32) Int) ListLongMap!8453)

(assert (=> b!819089 (= lt!367381 (getCurrentListMapNoExtraKeys!2276 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819089 (= lt!367380 (getCurrentListMapNoExtraKeys!2276 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819090 () Bool)

(declare-fun e!454804 () Bool)

(declare-fun tp_is_empty!14549 () Bool)

(assert (=> b!819090 (= e!454804 tp_is_empty!14549)))

(declare-fun b!819091 () Bool)

(declare-fun e!454808 () Bool)

(assert (=> b!819091 (= e!454808 tp_is_empty!14549)))

(declare-fun mapNonEmpty!23422 () Bool)

(declare-fun mapRes!23422 () Bool)

(declare-fun tp!45249 () Bool)

(assert (=> mapNonEmpty!23422 (= mapRes!23422 (and tp!45249 e!454804))))

(declare-fun mapValue!23422 () ValueCell!6859)

(declare-fun mapRest!23422 () (Array (_ BitVec 32) ValueCell!6859))

(declare-fun mapKey!23422 () (_ BitVec 32))

(assert (=> mapNonEmpty!23422 (= (arr!21702 _values!788) (store mapRest!23422 mapKey!23422 mapValue!23422))))

(declare-fun res!558960 () Bool)

(assert (=> start!70512 (=> (not res!558960) (not e!454803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70512 (= res!558960 (validMask!0 mask!1312))))

(assert (=> start!70512 e!454803))

(assert (=> start!70512 tp_is_empty!14549))

(declare-fun array_inv!17347 (array!45294) Bool)

(assert (=> start!70512 (array_inv!17347 _keys!976)))

(assert (=> start!70512 true))

(declare-fun e!454806 () Bool)

(declare-fun array_inv!17348 (array!45296) Bool)

(assert (=> start!70512 (and (array_inv!17348 _values!788) e!454806)))

(assert (=> start!70512 tp!45250))

(declare-fun mapIsEmpty!23422 () Bool)

(assert (=> mapIsEmpty!23422 mapRes!23422))

(declare-fun b!819092 () Bool)

(assert (=> b!819092 (= e!454806 (and e!454808 mapRes!23422))))

(declare-fun condMapEmpty!23422 () Bool)

(declare-fun mapDefault!23422 () ValueCell!6859)

