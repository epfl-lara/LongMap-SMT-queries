; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20508 () Bool)

(assert start!20508)

(declare-fun b_free!5167 () Bool)

(declare-fun b_next!5167 () Bool)

(assert (=> start!20508 (= b_free!5167 (not b_next!5167))))

(declare-fun tp!18532 () Bool)

(declare-fun b_and!11913 () Bool)

(assert (=> start!20508 (= tp!18532 b_and!11913)))

(declare-fun b!203643 () Bool)

(declare-fun e!133302 () Bool)

(declare-fun e!133301 () Bool)

(assert (=> b!203643 (= e!133302 (not e!133301))))

(declare-fun res!97910 () Bool)

(assert (=> b!203643 (=> res!97910 e!133301)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203643 (= res!97910 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6345 0))(
  ( (V!6346 (val!2556 Int)) )
))
(declare-datatypes ((ValueCell!2168 0))(
  ( (ValueCellFull!2168 (v!4526 V!6345)) (EmptyCell!2168) )
))
(declare-datatypes ((array!9269 0))(
  ( (array!9270 (arr!4385 (Array (_ BitVec 32) ValueCell!2168)) (size!4710 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9269)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3878 0))(
  ( (tuple2!3879 (_1!1950 (_ BitVec 64)) (_2!1950 V!6345)) )
))
(declare-datatypes ((List!2780 0))(
  ( (Nil!2777) (Cons!2776 (h!3418 tuple2!3878) (t!7711 List!2780)) )
))
(declare-datatypes ((ListLongMap!2791 0))(
  ( (ListLongMap!2792 (toList!1411 List!2780)) )
))
(declare-fun lt!102825 () ListLongMap!2791)

(declare-fun zeroValue!615 () V!6345)

(declare-datatypes ((array!9271 0))(
  ( (array!9272 (arr!4386 (Array (_ BitVec 32) (_ BitVec 64))) (size!4711 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9271)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6345)

(declare-fun getCurrentListMap!986 (array!9271 array!9269 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) Int) ListLongMap!2791)

(assert (=> b!203643 (= lt!102825 (getCurrentListMap!986 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102823 () ListLongMap!2791)

(declare-fun lt!102827 () array!9269)

(assert (=> b!203643 (= lt!102823 (getCurrentListMap!986 _keys!825 lt!102827 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102828 () ListLongMap!2791)

(declare-fun lt!102831 () ListLongMap!2791)

(assert (=> b!203643 (and (= lt!102828 lt!102831) (= lt!102831 lt!102828))))

(declare-fun lt!102824 () ListLongMap!2791)

(declare-fun lt!102826 () tuple2!3878)

(declare-fun +!438 (ListLongMap!2791 tuple2!3878) ListLongMap!2791)

(assert (=> b!203643 (= lt!102831 (+!438 lt!102824 lt!102826))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6345)

(assert (=> b!203643 (= lt!102826 (tuple2!3879 k!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6170 0))(
  ( (Unit!6171) )
))
(declare-fun lt!102830 () Unit!6170)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!99 (array!9271 array!9269 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) (_ BitVec 64) V!6345 (_ BitVec 32) Int) Unit!6170)

(assert (=> b!203643 (= lt!102830 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!99 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!360 (array!9271 array!9269 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) Int) ListLongMap!2791)

(assert (=> b!203643 (= lt!102828 (getCurrentListMapNoExtraKeys!360 _keys!825 lt!102827 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203643 (= lt!102827 (array!9270 (store (arr!4385 _values!649) i!601 (ValueCellFull!2168 v!520)) (size!4710 _values!649)))))

(assert (=> b!203643 (= lt!102824 (getCurrentListMapNoExtraKeys!360 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203644 () Bool)

(declare-fun e!133303 () Bool)

(declare-fun e!133307 () Bool)

(declare-fun mapRes!8603 () Bool)

(assert (=> b!203644 (= e!133303 (and e!133307 mapRes!8603))))

(declare-fun condMapEmpty!8603 () Bool)

(declare-fun mapDefault!8603 () ValueCell!2168)

