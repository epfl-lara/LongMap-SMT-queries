; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70380 () Bool)

(assert start!70380)

(declare-fun b_free!12737 () Bool)

(declare-fun b_next!12737 () Bool)

(assert (=> start!70380 (= b_free!12737 (not b_next!12737))))

(declare-fun tp!44938 () Bool)

(declare-fun b_and!21549 () Bool)

(assert (=> start!70380 (= tp!44938 b_and!21549)))

(declare-fun b!817593 () Bool)

(declare-fun e!453705 () Bool)

(assert (=> b!817593 (= e!453705 (not true))))

(declare-datatypes ((V!24263 0))(
  ( (V!24264 (val!7271 Int)) )
))
(declare-datatypes ((tuple2!9554 0))(
  ( (tuple2!9555 (_1!4788 (_ BitVec 64)) (_2!4788 V!24263)) )
))
(declare-datatypes ((List!15385 0))(
  ( (Nil!15382) (Cons!15381 (h!16510 tuple2!9554) (t!21710 List!15385)) )
))
(declare-datatypes ((ListLongMap!8377 0))(
  ( (ListLongMap!8378 (toList!4204 List!15385)) )
))
(declare-fun lt!366318 () ListLongMap!8377)

(declare-fun lt!366316 () ListLongMap!8377)

(assert (=> b!817593 (= lt!366318 lt!366316)))

(declare-fun zeroValueBefore!34 () V!24263)

(declare-datatypes ((array!45092 0))(
  ( (array!45093 (arr!21602 (Array (_ BitVec 32) (_ BitVec 64))) (size!22023 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45092)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24263)

(declare-fun minValue!754 () V!24263)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6808 0))(
  ( (ValueCellFull!6808 (v!9700 V!24263)) (EmptyCell!6808) )
))
(declare-datatypes ((array!45094 0))(
  ( (array!45095 (arr!21603 (Array (_ BitVec 32) ValueCell!6808)) (size!22024 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45094)

(declare-datatypes ((Unit!27892 0))(
  ( (Unit!27893) )
))
(declare-fun lt!366317 () Unit!27892)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!355 (array!45092 array!45094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24263 V!24263 V!24263 V!24263 (_ BitVec 32) Int) Unit!27892)

(assert (=> b!817593 (= lt!366317 (lemmaNoChangeToArrayThenSameMapNoExtras!355 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2245 (array!45092 array!45094 (_ BitVec 32) (_ BitVec 32) V!24263 V!24263 (_ BitVec 32) Int) ListLongMap!8377)

(assert (=> b!817593 (= lt!366316 (getCurrentListMapNoExtraKeys!2245 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817593 (= lt!366318 (getCurrentListMapNoExtraKeys!2245 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817594 () Bool)

(declare-fun e!453701 () Bool)

(declare-fun tp_is_empty!14447 () Bool)

(assert (=> b!817594 (= e!453701 tp_is_empty!14447)))

(declare-fun b!817595 () Bool)

(declare-fun res!558069 () Bool)

(assert (=> b!817595 (=> (not res!558069) (not e!453705))))

(assert (=> b!817595 (= res!558069 (and (= (size!22024 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22023 _keys!976) (size!22024 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817596 () Bool)

(declare-fun e!453704 () Bool)

(declare-fun mapRes!23263 () Bool)

(assert (=> b!817596 (= e!453704 (and e!453701 mapRes!23263))))

(declare-fun condMapEmpty!23263 () Bool)

(declare-fun mapDefault!23263 () ValueCell!6808)

