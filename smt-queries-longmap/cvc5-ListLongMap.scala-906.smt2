; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20532 () Bool)

(assert start!20532)

(declare-fun b_free!5191 () Bool)

(declare-fun b_next!5191 () Bool)

(assert (=> start!20532 (= b_free!5191 (not b_next!5191))))

(declare-fun tp!18604 () Bool)

(declare-fun b_and!11937 () Bool)

(assert (=> start!20532 (= tp!18604 b_and!11937)))

(declare-fun b!204075 () Bool)

(declare-fun e!133554 () Bool)

(declare-fun tp_is_empty!5047 () Bool)

(assert (=> b!204075 (= e!133554 tp_is_empty!5047)))

(declare-fun res!98237 () Bool)

(declare-fun e!133558 () Bool)

(assert (=> start!20532 (=> (not res!98237) (not e!133558))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20532 (= res!98237 (validMask!0 mask!1149))))

(assert (=> start!20532 e!133558))

(declare-datatypes ((V!6377 0))(
  ( (V!6378 (val!2568 Int)) )
))
(declare-datatypes ((ValueCell!2180 0))(
  ( (ValueCellFull!2180 (v!4538 V!6377)) (EmptyCell!2180) )
))
(declare-datatypes ((array!9313 0))(
  ( (array!9314 (arr!4407 (Array (_ BitVec 32) ValueCell!2180)) (size!4732 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9313)

(declare-fun e!133556 () Bool)

(declare-fun array_inv!2911 (array!9313) Bool)

(assert (=> start!20532 (and (array_inv!2911 _values!649) e!133556)))

(assert (=> start!20532 true))

(assert (=> start!20532 tp_is_empty!5047))

(declare-datatypes ((array!9315 0))(
  ( (array!9316 (arr!4408 (Array (_ BitVec 32) (_ BitVec 64))) (size!4733 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9315)

(declare-fun array_inv!2912 (array!9315) Bool)

(assert (=> start!20532 (array_inv!2912 _keys!825)))

(assert (=> start!20532 tp!18604))

(declare-fun b!204076 () Bool)

(declare-fun e!133555 () Bool)

(assert (=> b!204076 (= e!133558 (not e!133555))))

(declare-fun res!98231 () Bool)

(assert (=> b!204076 (=> res!98231 e!133555)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204076 (= res!98231 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3896 0))(
  ( (tuple2!3897 (_1!1959 (_ BitVec 64)) (_2!1959 V!6377)) )
))
(declare-datatypes ((List!2796 0))(
  ( (Nil!2793) (Cons!2792 (h!3434 tuple2!3896) (t!7727 List!2796)) )
))
(declare-datatypes ((ListLongMap!2809 0))(
  ( (ListLongMap!2810 (toList!1420 List!2796)) )
))
(declare-fun lt!103257 () ListLongMap!2809)

(declare-fun zeroValue!615 () V!6377)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6377)

(declare-fun getCurrentListMap!994 (array!9315 array!9313 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) Int) ListLongMap!2809)

(assert (=> b!204076 (= lt!103257 (getCurrentListMap!994 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103260 () array!9313)

(declare-fun lt!103255 () ListLongMap!2809)

(assert (=> b!204076 (= lt!103255 (getCurrentListMap!994 _keys!825 lt!103260 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103263 () ListLongMap!2809)

(declare-fun lt!103258 () ListLongMap!2809)

(assert (=> b!204076 (and (= lt!103263 lt!103258) (= lt!103258 lt!103263))))

(declare-fun lt!103253 () ListLongMap!2809)

(declare-fun lt!103256 () tuple2!3896)

(declare-fun +!447 (ListLongMap!2809 tuple2!3896) ListLongMap!2809)

(assert (=> b!204076 (= lt!103258 (+!447 lt!103253 lt!103256))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6377)

(assert (=> b!204076 (= lt!103256 (tuple2!3897 k!843 v!520))))

(declare-datatypes ((Unit!6188 0))(
  ( (Unit!6189) )
))
(declare-fun lt!103261 () Unit!6188)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!107 (array!9315 array!9313 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) (_ BitVec 64) V!6377 (_ BitVec 32) Int) Unit!6188)

(assert (=> b!204076 (= lt!103261 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!107 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!368 (array!9315 array!9313 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) Int) ListLongMap!2809)

(assert (=> b!204076 (= lt!103263 (getCurrentListMapNoExtraKeys!368 _keys!825 lt!103260 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204076 (= lt!103260 (array!9314 (store (arr!4407 _values!649) i!601 (ValueCellFull!2180 v!520)) (size!4732 _values!649)))))

(assert (=> b!204076 (= lt!103253 (getCurrentListMapNoExtraKeys!368 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204077 () Bool)

(declare-fun mapRes!8639 () Bool)

(assert (=> b!204077 (= e!133556 (and e!133554 mapRes!8639))))

(declare-fun condMapEmpty!8639 () Bool)

(declare-fun mapDefault!8639 () ValueCell!2180)

