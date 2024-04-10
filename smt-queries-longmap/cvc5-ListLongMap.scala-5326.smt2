; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71216 () Bool)

(assert start!71216)

(declare-fun b_free!13363 () Bool)

(declare-fun b_next!13363 () Bool)

(assert (=> start!71216 (= b_free!13363 (not b_next!13363))))

(declare-fun tp!46851 () Bool)

(declare-fun b_and!22301 () Bool)

(assert (=> start!71216 (= tp!46851 b_and!22301)))

(declare-fun b!827260 () Bool)

(declare-fun e!460814 () Bool)

(declare-fun tp_is_empty!15073 () Bool)

(assert (=> b!827260 (= e!460814 tp_is_empty!15073)))

(declare-fun b!827261 () Bool)

(declare-fun e!460811 () Bool)

(assert (=> b!827261 (= e!460811 tp_is_empty!15073)))

(declare-fun mapNonEmpty!24238 () Bool)

(declare-fun mapRes!24238 () Bool)

(declare-fun tp!46852 () Bool)

(assert (=> mapNonEmpty!24238 (= mapRes!24238 (and tp!46852 e!460811))))

(declare-datatypes ((V!25099 0))(
  ( (V!25100 (val!7584 Int)) )
))
(declare-datatypes ((ValueCell!7121 0))(
  ( (ValueCellFull!7121 (v!10019 V!25099)) (EmptyCell!7121) )
))
(declare-fun mapValue!24238 () ValueCell!7121)

(declare-datatypes ((array!46324 0))(
  ( (array!46325 (arr!22206 (Array (_ BitVec 32) ValueCell!7121)) (size!22627 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46324)

(declare-fun mapRest!24238 () (Array (_ BitVec 32) ValueCell!7121))

(declare-fun mapKey!24238 () (_ BitVec 32))

(assert (=> mapNonEmpty!24238 (= (arr!22206 _values!788) (store mapRest!24238 mapKey!24238 mapValue!24238))))

(declare-fun b!827262 () Bool)

(declare-fun e!460813 () Bool)

(assert (=> b!827262 (= e!460813 false)))

(declare-datatypes ((tuple2!10054 0))(
  ( (tuple2!10055 (_1!5038 (_ BitVec 64)) (_2!5038 V!25099)) )
))
(declare-datatypes ((List!15850 0))(
  ( (Nil!15847) (Cons!15846 (h!16975 tuple2!10054) (t!22199 List!15850)) )
))
(declare-datatypes ((ListLongMap!8877 0))(
  ( (ListLongMap!8878 (toList!4454 List!15850)) )
))
(declare-fun lt!374855 () ListLongMap!8877)

(declare-datatypes ((array!46326 0))(
  ( (array!46327 (arr!22207 (Array (_ BitVec 32) (_ BitVec 64))) (size!22628 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46326)

(declare-fun zeroValueAfter!34 () V!25099)

(declare-fun minValue!754 () V!25099)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2456 (array!46326 array!46324 (_ BitVec 32) (_ BitVec 32) V!25099 V!25099 (_ BitVec 32) Int) ListLongMap!8877)

(assert (=> b!827262 (= lt!374855 (getCurrentListMapNoExtraKeys!2456 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25099)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374854 () ListLongMap!8877)

(assert (=> b!827262 (= lt!374854 (getCurrentListMapNoExtraKeys!2456 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827263 () Bool)

(declare-fun res!563875 () Bool)

(assert (=> b!827263 (=> (not res!563875) (not e!460813))))

(declare-datatypes ((List!15851 0))(
  ( (Nil!15848) (Cons!15847 (h!16976 (_ BitVec 64)) (t!22200 List!15851)) )
))
(declare-fun arrayNoDuplicates!0 (array!46326 (_ BitVec 32) List!15851) Bool)

(assert (=> b!827263 (= res!563875 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15848))))

(declare-fun b!827264 () Bool)

(declare-fun e!460812 () Bool)

(assert (=> b!827264 (= e!460812 (and e!460814 mapRes!24238))))

(declare-fun condMapEmpty!24238 () Bool)

(declare-fun mapDefault!24238 () ValueCell!7121)

