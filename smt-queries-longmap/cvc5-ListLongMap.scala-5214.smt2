; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70316 () Bool)

(assert start!70316)

(declare-fun b_free!12691 () Bool)

(declare-fun b_next!12691 () Bool)

(assert (=> start!70316 (= b_free!12691 (not b_next!12691))))

(declare-fun tp!44797 () Bool)

(declare-fun b_and!21491 () Bool)

(assert (=> start!70316 (= tp!44797 b_and!21491)))

(declare-fun mapNonEmpty!23191 () Bool)

(declare-fun mapRes!23191 () Bool)

(declare-fun tp!44796 () Bool)

(declare-fun e!453240 () Bool)

(assert (=> mapNonEmpty!23191 (= mapRes!23191 (and tp!44796 e!453240))))

(declare-datatypes ((V!24203 0))(
  ( (V!24204 (val!7248 Int)) )
))
(declare-datatypes ((ValueCell!6785 0))(
  ( (ValueCellFull!6785 (v!9676 V!24203)) (EmptyCell!6785) )
))
(declare-fun mapValue!23191 () ValueCell!6785)

(declare-datatypes ((array!45000 0))(
  ( (array!45001 (arr!21557 (Array (_ BitVec 32) ValueCell!6785)) (size!21978 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45000)

(declare-fun mapRest!23191 () (Array (_ BitVec 32) ValueCell!6785))

(declare-fun mapKey!23191 () (_ BitVec 32))

(assert (=> mapNonEmpty!23191 (= (arr!21557 _values!788) (store mapRest!23191 mapKey!23191 mapValue!23191))))

(declare-fun b!816921 () Bool)

(declare-fun res!557706 () Bool)

(declare-fun e!453241 () Bool)

(assert (=> b!816921 (=> (not res!557706) (not e!453241))))

(declare-datatypes ((array!45002 0))(
  ( (array!45003 (arr!21558 (Array (_ BitVec 32) (_ BitVec 64))) (size!21979 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45002)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45002 (_ BitVec 32)) Bool)

(assert (=> b!816921 (= res!557706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816922 () Bool)

(declare-fun res!557709 () Bool)

(assert (=> b!816922 (=> (not res!557709) (not e!453241))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816922 (= res!557709 (and (= (size!21978 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21979 _keys!976) (size!21978 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816923 () Bool)

(declare-fun e!453243 () Bool)

(assert (=> b!816923 (= e!453243 (bvsle #b00000000000000000000000000000000 (size!21979 _keys!976)))))

(declare-fun mapIsEmpty!23191 () Bool)

(assert (=> mapIsEmpty!23191 mapRes!23191))

(declare-fun b!816924 () Bool)

(declare-fun tp_is_empty!14401 () Bool)

(assert (=> b!816924 (= e!453240 tp_is_empty!14401)))

(declare-fun b!816925 () Bool)

(assert (=> b!816925 (= e!453241 (not e!453243))))

(declare-fun res!557704 () Bool)

(assert (=> b!816925 (=> res!557704 e!453243)))

(assert (=> b!816925 (= res!557704 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9526 0))(
  ( (tuple2!9527 (_1!4774 (_ BitVec 64)) (_2!4774 V!24203)) )
))
(declare-datatypes ((List!15354 0))(
  ( (Nil!15351) (Cons!15350 (h!16479 tuple2!9526) (t!21677 List!15354)) )
))
(declare-datatypes ((ListLongMap!8349 0))(
  ( (ListLongMap!8350 (toList!4190 List!15354)) )
))
(declare-fun lt!365971 () ListLongMap!8349)

(declare-fun lt!365970 () ListLongMap!8349)

(assert (=> b!816925 (= lt!365971 lt!365970)))

(declare-fun zeroValueAfter!34 () V!24203)

(declare-fun minValue!754 () V!24203)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27862 0))(
  ( (Unit!27863) )
))
(declare-fun lt!365969 () Unit!27862)

(declare-fun zeroValueBefore!34 () V!24203)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!341 (array!45002 array!45000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 V!24203 V!24203 (_ BitVec 32) Int) Unit!27862)

(assert (=> b!816925 (= lt!365969 (lemmaNoChangeToArrayThenSameMapNoExtras!341 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2231 (array!45002 array!45000 (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 (_ BitVec 32) Int) ListLongMap!8349)

(assert (=> b!816925 (= lt!365970 (getCurrentListMapNoExtraKeys!2231 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816925 (= lt!365971 (getCurrentListMapNoExtraKeys!2231 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557708 () Bool)

(assert (=> start!70316 (=> (not res!557708) (not e!453241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70316 (= res!557708 (validMask!0 mask!1312))))

(assert (=> start!70316 e!453241))

(assert (=> start!70316 tp_is_empty!14401))

(declare-fun array_inv!17247 (array!45002) Bool)

(assert (=> start!70316 (array_inv!17247 _keys!976)))

(assert (=> start!70316 true))

(declare-fun e!453242 () Bool)

(declare-fun array_inv!17248 (array!45000) Bool)

(assert (=> start!70316 (and (array_inv!17248 _values!788) e!453242)))

(assert (=> start!70316 tp!44797))

(declare-fun b!816926 () Bool)

(declare-fun res!557707 () Bool)

(assert (=> b!816926 (=> (not res!557707) (not e!453241))))

(declare-datatypes ((List!15355 0))(
  ( (Nil!15352) (Cons!15351 (h!16480 (_ BitVec 64)) (t!21678 List!15355)) )
))
(declare-fun arrayNoDuplicates!0 (array!45002 (_ BitVec 32) List!15355) Bool)

(assert (=> b!816926 (= res!557707 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15352))))

(declare-fun b!816927 () Bool)

(declare-fun e!453239 () Bool)

(assert (=> b!816927 (= e!453242 (and e!453239 mapRes!23191))))

(declare-fun condMapEmpty!23191 () Bool)

(declare-fun mapDefault!23191 () ValueCell!6785)

