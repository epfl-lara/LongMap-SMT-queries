; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70710 () Bool)

(assert start!70710)

(declare-fun b_free!12983 () Bool)

(declare-fun b_next!12983 () Bool)

(assert (=> start!70710 (= b_free!12983 (not b_next!12983))))

(declare-fun tp!45690 () Bool)

(declare-fun b_and!21845 () Bool)

(assert (=> start!70710 (= tp!45690 b_and!21845)))

(declare-fun b!821313 () Bool)

(declare-fun res!560278 () Bool)

(declare-fun e!456430 () Bool)

(assert (=> b!821313 (=> (not res!560278) (not e!456430))))

(declare-datatypes ((array!45582 0))(
  ( (array!45583 (arr!21842 (Array (_ BitVec 32) (_ BitVec 64))) (size!22263 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45582)

(declare-datatypes ((List!15572 0))(
  ( (Nil!15569) (Cons!15568 (h!16697 (_ BitVec 64)) (t!21907 List!15572)) )
))
(declare-fun arrayNoDuplicates!0 (array!45582 (_ BitVec 32) List!15572) Bool)

(assert (=> b!821313 (= res!560278 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15569))))

(declare-fun b!821314 () Bool)

(declare-fun e!456429 () Bool)

(assert (=> b!821314 (= e!456430 (not e!456429))))

(declare-fun res!560280 () Bool)

(assert (=> b!821314 (=> res!560280 e!456429)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821314 (= res!560280 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24591 0))(
  ( (V!24592 (val!7394 Int)) )
))
(declare-datatypes ((tuple2!9754 0))(
  ( (tuple2!9755 (_1!4888 (_ BitVec 64)) (_2!4888 V!24591)) )
))
(declare-datatypes ((List!15573 0))(
  ( (Nil!15570) (Cons!15569 (h!16698 tuple2!9754) (t!21908 List!15573)) )
))
(declare-datatypes ((ListLongMap!8577 0))(
  ( (ListLongMap!8578 (toList!4304 List!15573)) )
))
(declare-fun lt!369160 () ListLongMap!8577)

(declare-fun lt!369159 () ListLongMap!8577)

(assert (=> b!821314 (= lt!369160 lt!369159)))

(declare-fun zeroValueBefore!34 () V!24591)

(declare-fun zeroValueAfter!34 () V!24591)

(declare-fun minValue!754 () V!24591)

(declare-datatypes ((ValueCell!6931 0))(
  ( (ValueCellFull!6931 (v!9825 V!24591)) (EmptyCell!6931) )
))
(declare-datatypes ((array!45584 0))(
  ( (array!45585 (arr!21843 (Array (_ BitVec 32) ValueCell!6931)) (size!22264 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45584)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28085 0))(
  ( (Unit!28086) )
))
(declare-fun lt!369161 () Unit!28085)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!440 (array!45582 array!45584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24591 V!24591 V!24591 V!24591 (_ BitVec 32) Int) Unit!28085)

(assert (=> b!821314 (= lt!369161 (lemmaNoChangeToArrayThenSameMapNoExtras!440 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2330 (array!45582 array!45584 (_ BitVec 32) (_ BitVec 32) V!24591 V!24591 (_ BitVec 32) Int) ListLongMap!8577)

(assert (=> b!821314 (= lt!369159 (getCurrentListMapNoExtraKeys!2330 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821314 (= lt!369160 (getCurrentListMapNoExtraKeys!2330 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821315 () Bool)

(declare-fun res!560279 () Bool)

(assert (=> b!821315 (=> (not res!560279) (not e!456430))))

(assert (=> b!821315 (= res!560279 (and (= (size!22264 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22263 _keys!976) (size!22264 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821316 () Bool)

(declare-fun e!456434 () Bool)

(declare-fun tp_is_empty!14693 () Bool)

(assert (=> b!821316 (= e!456434 tp_is_empty!14693)))

(declare-fun b!821317 () Bool)

(declare-fun e!456431 () Bool)

(declare-fun mapRes!23647 () Bool)

(assert (=> b!821317 (= e!456431 (and e!456434 mapRes!23647))))

(declare-fun condMapEmpty!23647 () Bool)

(declare-fun mapDefault!23647 () ValueCell!6931)

