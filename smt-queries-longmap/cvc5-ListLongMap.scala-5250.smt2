; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70600 () Bool)

(assert start!70600)

(declare-fun b_free!12907 () Bool)

(declare-fun b_next!12907 () Bool)

(assert (=> start!70600 (= b_free!12907 (not b_next!12907))))

(declare-fun tp!45456 () Bool)

(declare-fun b_and!21749 () Bool)

(assert (=> start!70600 (= tp!45456 b_and!21749)))

(declare-fun b!820198 () Bool)

(declare-fun e!455649 () Bool)

(declare-fun tp_is_empty!14617 () Bool)

(assert (=> b!820198 (= e!455649 tp_is_empty!14617)))

(declare-fun b!820199 () Bool)

(declare-fun e!455644 () Bool)

(declare-fun e!455645 () Bool)

(assert (=> b!820199 (= e!455644 (not e!455645))))

(declare-fun res!559663 () Bool)

(assert (=> b!820199 (=> res!559663 e!455645)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820199 (= res!559663 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24491 0))(
  ( (V!24492 (val!7356 Int)) )
))
(declare-datatypes ((tuple2!9690 0))(
  ( (tuple2!9691 (_1!4856 (_ BitVec 64)) (_2!4856 V!24491)) )
))
(declare-datatypes ((List!15513 0))(
  ( (Nil!15510) (Cons!15509 (h!16638 tuple2!9690) (t!21844 List!15513)) )
))
(declare-datatypes ((ListLongMap!8513 0))(
  ( (ListLongMap!8514 (toList!4272 List!15513)) )
))
(declare-fun lt!368552 () ListLongMap!8513)

(declare-fun lt!368551 () ListLongMap!8513)

(assert (=> b!820199 (= lt!368552 lt!368551)))

(declare-fun zeroValueBefore!34 () V!24491)

(declare-datatypes ((array!45428 0))(
  ( (array!45429 (arr!21767 (Array (_ BitVec 32) (_ BitVec 64))) (size!22188 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45428)

(declare-fun zeroValueAfter!34 () V!24491)

(declare-fun minValue!754 () V!24491)

(declare-datatypes ((ValueCell!6893 0))(
  ( (ValueCellFull!6893 (v!9786 V!24491)) (EmptyCell!6893) )
))
(declare-datatypes ((array!45430 0))(
  ( (array!45431 (arr!21768 (Array (_ BitVec 32) ValueCell!6893)) (size!22189 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45430)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28021 0))(
  ( (Unit!28022) )
))
(declare-fun lt!368548 () Unit!28021)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!409 (array!45428 array!45430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 V!24491 V!24491 (_ BitVec 32) Int) Unit!28021)

(assert (=> b!820199 (= lt!368548 (lemmaNoChangeToArrayThenSameMapNoExtras!409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2299 (array!45428 array!45430 (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 (_ BitVec 32) Int) ListLongMap!8513)

(assert (=> b!820199 (= lt!368551 (getCurrentListMapNoExtraKeys!2299 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820199 (= lt!368552 (getCurrentListMapNoExtraKeys!2299 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820200 () Bool)

(declare-fun res!559666 () Bool)

(assert (=> b!820200 (=> (not res!559666) (not e!455644))))

(assert (=> b!820200 (= res!559666 (and (= (size!22189 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22188 _keys!976) (size!22189 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820201 () Bool)

(declare-fun e!455648 () Bool)

(assert (=> b!820201 (= e!455648 (bvsle #b00000000000000000000000000000000 (size!22188 _keys!976)))))

(declare-fun b!820202 () Bool)

(declare-fun e!455642 () Bool)

(declare-fun e!455647 () Bool)

(declare-fun mapRes!23527 () Bool)

(assert (=> b!820202 (= e!455642 (and e!455647 mapRes!23527))))

(declare-fun condMapEmpty!23527 () Bool)

(declare-fun mapDefault!23527 () ValueCell!6893)

