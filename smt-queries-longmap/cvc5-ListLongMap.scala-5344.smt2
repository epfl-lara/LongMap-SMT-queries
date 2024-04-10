; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71426 () Bool)

(assert start!71426)

(declare-fun b_free!13471 () Bool)

(declare-fun b_next!13471 () Bool)

(assert (=> start!71426 (= b_free!13471 (not b_next!13471))))

(declare-fun tp!47194 () Bool)

(declare-fun b_and!22477 () Bool)

(assert (=> start!71426 (= tp!47194 b_and!22477)))

(declare-fun b!829499 () Bool)

(declare-fun res!565065 () Bool)

(declare-fun e!462372 () Bool)

(assert (=> b!829499 (=> (not res!565065) (not e!462372))))

(declare-datatypes ((array!46528 0))(
  ( (array!46529 (arr!22302 (Array (_ BitVec 32) (_ BitVec 64))) (size!22723 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46528)

(declare-datatypes ((List!15922 0))(
  ( (Nil!15919) (Cons!15918 (h!17047 (_ BitVec 64)) (t!22283 List!15922)) )
))
(declare-fun arrayNoDuplicates!0 (array!46528 (_ BitVec 32) List!15922) Bool)

(assert (=> b!829499 (= res!565065 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15919))))

(declare-fun mapNonEmpty!24418 () Bool)

(declare-fun mapRes!24418 () Bool)

(declare-fun tp!47193 () Bool)

(declare-fun e!462369 () Bool)

(assert (=> mapNonEmpty!24418 (= mapRes!24418 (and tp!47193 e!462369))))

(declare-datatypes ((V!25243 0))(
  ( (V!25244 (val!7638 Int)) )
))
(declare-datatypes ((ValueCell!7175 0))(
  ( (ValueCellFull!7175 (v!10078 V!25243)) (EmptyCell!7175) )
))
(declare-fun mapRest!24418 () (Array (_ BitVec 32) ValueCell!7175))

(declare-datatypes ((array!46530 0))(
  ( (array!46531 (arr!22303 (Array (_ BitVec 32) ValueCell!7175)) (size!22724 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46530)

(declare-fun mapValue!24418 () ValueCell!7175)

(declare-fun mapKey!24418 () (_ BitVec 32))

(assert (=> mapNonEmpty!24418 (= (arr!22303 _values!788) (store mapRest!24418 mapKey!24418 mapValue!24418))))

(declare-datatypes ((tuple2!10130 0))(
  ( (tuple2!10131 (_1!5076 (_ BitVec 64)) (_2!5076 V!25243)) )
))
(declare-datatypes ((List!15923 0))(
  ( (Nil!15920) (Cons!15919 (h!17048 tuple2!10130) (t!22284 List!15923)) )
))
(declare-datatypes ((ListLongMap!8953 0))(
  ( (ListLongMap!8954 (toList!4492 List!15923)) )
))
(declare-fun lt!376154 () ListLongMap!8953)

(declare-fun e!462371 () Bool)

(declare-fun b!829500 () Bool)

(declare-fun zeroValueAfter!34 () V!25243)

(declare-fun lt!376156 () ListLongMap!8953)

(declare-fun lt!376155 () tuple2!10130)

(declare-fun +!1973 (ListLongMap!8953 tuple2!10130) ListLongMap!8953)

(assert (=> b!829500 (= e!462371 (= lt!376156 (+!1973 (+!1973 lt!376154 (tuple2!10131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376155)))))

(declare-fun res!565067 () Bool)

(assert (=> start!71426 (=> (not res!565067) (not e!462372))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71426 (= res!565067 (validMask!0 mask!1312))))

(assert (=> start!71426 e!462372))

(declare-fun tp_is_empty!15181 () Bool)

(assert (=> start!71426 tp_is_empty!15181))

(declare-fun array_inv!17763 (array!46528) Bool)

(assert (=> start!71426 (array_inv!17763 _keys!976)))

(assert (=> start!71426 true))

(declare-fun e!462370 () Bool)

(declare-fun array_inv!17764 (array!46530) Bool)

(assert (=> start!71426 (and (array_inv!17764 _values!788) e!462370)))

(assert (=> start!71426 tp!47194))

(declare-fun b!829501 () Bool)

(declare-fun res!565066 () Bool)

(assert (=> b!829501 (=> (not res!565066) (not e!462372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46528 (_ BitVec 32)) Bool)

(assert (=> b!829501 (= res!565066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829502 () Bool)

(assert (=> b!829502 (= e!462369 tp_is_empty!15181)))

(declare-fun b!829503 () Bool)

(declare-fun res!565062 () Bool)

(assert (=> b!829503 (=> (not res!565062) (not e!462372))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829503 (= res!565062 (and (= (size!22724 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22723 _keys!976) (size!22724 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24418 () Bool)

(assert (=> mapIsEmpty!24418 mapRes!24418))

(declare-fun b!829504 () Bool)

(declare-fun e!462367 () Bool)

(assert (=> b!829504 (= e!462370 (and e!462367 mapRes!24418))))

(declare-fun condMapEmpty!24418 () Bool)

(declare-fun mapDefault!24418 () ValueCell!7175)

