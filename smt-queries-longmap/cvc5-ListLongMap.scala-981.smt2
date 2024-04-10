; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21184 () Bool)

(assert start!21184)

(declare-fun b_free!5635 () Bool)

(declare-fun b_next!5635 () Bool)

(assert (=> start!21184 (= b_free!5635 (not b_next!5635))))

(declare-fun tp!19976 () Bool)

(declare-fun b_and!12501 () Bool)

(assert (=> start!21184 (= tp!19976 b_and!12501)))

(declare-fun b!213400 () Bool)

(declare-fun res!104452 () Bool)

(declare-fun e!138792 () Bool)

(assert (=> b!213400 (=> (not res!104452) (not e!138792))))

(declare-datatypes ((array!10197 0))(
  ( (array!10198 (arr!4839 (Array (_ BitVec 32) (_ BitVec 64))) (size!5164 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10197)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10197 (_ BitVec 32)) Bool)

(assert (=> b!213400 (= res!104452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun lt!110280 () Bool)

(declare-fun b!213401 () Bool)

(declare-datatypes ((V!6977 0))(
  ( (V!6978 (val!2793 Int)) )
))
(declare-datatypes ((tuple2!4230 0))(
  ( (tuple2!4231 (_1!2126 (_ BitVec 64)) (_2!2126 V!6977)) )
))
(declare-datatypes ((List!3116 0))(
  ( (Nil!3113) (Cons!3112 (h!3754 tuple2!4230) (t!8067 List!3116)) )
))
(declare-datatypes ((ListLongMap!3143 0))(
  ( (ListLongMap!3144 (toList!1587 List!3116)) )
))
(declare-fun lt!110276 () ListLongMap!3143)

(declare-fun lt!110281 () ListLongMap!3143)

(assert (=> b!213401 (= e!138792 (not (or (and (not lt!110280) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110280) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110280) (= lt!110276 lt!110281))))))

(assert (=> b!213401 (= lt!110280 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!110274 () ListLongMap!3143)

(declare-datatypes ((ValueCell!2405 0))(
  ( (ValueCellFull!2405 (v!4803 V!6977)) (EmptyCell!2405) )
))
(declare-datatypes ((array!10199 0))(
  ( (array!10200 (arr!4840 (Array (_ BitVec 32) ValueCell!2405)) (size!5165 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10199)

(declare-fun zeroValue!615 () V!6977)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6977)

(declare-fun getCurrentListMap!1115 (array!10197 array!10199 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) Int) ListLongMap!3143)

(assert (=> b!213401 (= lt!110274 (getCurrentListMap!1115 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110278 () array!10199)

(assert (=> b!213401 (= lt!110276 (getCurrentListMap!1115 _keys!825 lt!110278 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110277 () ListLongMap!3143)

(assert (=> b!213401 (and (= lt!110281 lt!110277) (= lt!110277 lt!110281))))

(declare-fun v!520 () V!6977)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!110275 () ListLongMap!3143)

(declare-fun +!590 (ListLongMap!3143 tuple2!4230) ListLongMap!3143)

(assert (=> b!213401 (= lt!110277 (+!590 lt!110275 (tuple2!4231 k!843 v!520)))))

(declare-datatypes ((Unit!6472 0))(
  ( (Unit!6473) )
))
(declare-fun lt!110279 () Unit!6472)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!232 (array!10197 array!10199 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) (_ BitVec 64) V!6977 (_ BitVec 32) Int) Unit!6472)

(assert (=> b!213401 (= lt!110279 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!232 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!517 (array!10197 array!10199 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) Int) ListLongMap!3143)

(assert (=> b!213401 (= lt!110281 (getCurrentListMapNoExtraKeys!517 _keys!825 lt!110278 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213401 (= lt!110278 (array!10200 (store (arr!4840 _values!649) i!601 (ValueCellFull!2405 v!520)) (size!5165 _values!649)))))

(assert (=> b!213401 (= lt!110275 (getCurrentListMapNoExtraKeys!517 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213403 () Bool)

(declare-fun e!138794 () Bool)

(declare-fun tp_is_empty!5497 () Bool)

(assert (=> b!213403 (= e!138794 tp_is_empty!5497)))

(declare-fun b!213404 () Bool)

(declare-fun res!104456 () Bool)

(assert (=> b!213404 (=> (not res!104456) (not e!138792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213404 (= res!104456 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!9344 () Bool)

(declare-fun mapRes!9344 () Bool)

(declare-fun tp!19975 () Bool)

(declare-fun e!138791 () Bool)

(assert (=> mapNonEmpty!9344 (= mapRes!9344 (and tp!19975 e!138791))))

(declare-fun mapRest!9344 () (Array (_ BitVec 32) ValueCell!2405))

(declare-fun mapValue!9344 () ValueCell!2405)

(declare-fun mapKey!9344 () (_ BitVec 32))

(assert (=> mapNonEmpty!9344 (= (arr!4840 _values!649) (store mapRest!9344 mapKey!9344 mapValue!9344))))

(declare-fun b!213405 () Bool)

(declare-fun e!138795 () Bool)

(assert (=> b!213405 (= e!138795 (and e!138794 mapRes!9344))))

(declare-fun condMapEmpty!9344 () Bool)

(declare-fun mapDefault!9344 () ValueCell!2405)

