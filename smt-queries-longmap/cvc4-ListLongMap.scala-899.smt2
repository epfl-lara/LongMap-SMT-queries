; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20494 () Bool)

(assert start!20494)

(declare-fun b_free!5153 () Bool)

(declare-fun b_next!5153 () Bool)

(assert (=> start!20494 (= b_free!5153 (not b_next!5153))))

(declare-fun tp!18490 () Bool)

(declare-fun b_and!11899 () Bool)

(assert (=> start!20494 (= tp!18490 b_and!11899)))

(declare-fun b!203392 () Bool)

(declare-fun res!97719 () Bool)

(declare-fun e!133159 () Bool)

(assert (=> b!203392 (=> (not res!97719) (not e!133159))))

(declare-datatypes ((array!9241 0))(
  ( (array!9242 (arr!4371 (Array (_ BitVec 32) (_ BitVec 64))) (size!4696 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9241)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9241 (_ BitVec 32)) Bool)

(assert (=> b!203392 (= res!97719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203393 () Bool)

(declare-fun e!133154 () Bool)

(assert (=> b!203393 (= e!133159 (not e!133154))))

(declare-fun res!97726 () Bool)

(assert (=> b!203393 (=> res!97726 e!133154)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203393 (= res!97726 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6325 0))(
  ( (V!6326 (val!2549 Int)) )
))
(declare-datatypes ((tuple2!3868 0))(
  ( (tuple2!3869 (_1!1945 (_ BitVec 64)) (_2!1945 V!6325)) )
))
(declare-datatypes ((List!2770 0))(
  ( (Nil!2767) (Cons!2766 (h!3408 tuple2!3868) (t!7701 List!2770)) )
))
(declare-datatypes ((ListLongMap!2781 0))(
  ( (ListLongMap!2782 (toList!1406 List!2770)) )
))
(declare-fun lt!102568 () ListLongMap!2781)

(declare-datatypes ((ValueCell!2161 0))(
  ( (ValueCellFull!2161 (v!4519 V!6325)) (EmptyCell!2161) )
))
(declare-datatypes ((array!9243 0))(
  ( (array!9244 (arr!4372 (Array (_ BitVec 32) ValueCell!2161)) (size!4697 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9243)

(declare-fun zeroValue!615 () V!6325)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6325)

(declare-fun getCurrentListMap!981 (array!9241 array!9243 (_ BitVec 32) (_ BitVec 32) V!6325 V!6325 (_ BitVec 32) Int) ListLongMap!2781)

(assert (=> b!203393 (= lt!102568 (getCurrentListMap!981 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102574 () array!9243)

(declare-fun lt!102579 () ListLongMap!2781)

(assert (=> b!203393 (= lt!102579 (getCurrentListMap!981 _keys!825 lt!102574 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102578 () ListLongMap!2781)

(declare-fun lt!102575 () ListLongMap!2781)

(assert (=> b!203393 (and (= lt!102578 lt!102575) (= lt!102575 lt!102578))))

(declare-fun lt!102576 () ListLongMap!2781)

(declare-fun lt!102577 () tuple2!3868)

(declare-fun +!433 (ListLongMap!2781 tuple2!3868) ListLongMap!2781)

(assert (=> b!203393 (= lt!102575 (+!433 lt!102576 lt!102577))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6325)

(assert (=> b!203393 (= lt!102577 (tuple2!3869 k!843 v!520))))

(declare-datatypes ((Unit!6160 0))(
  ( (Unit!6161) )
))
(declare-fun lt!102573 () Unit!6160)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!94 (array!9241 array!9243 (_ BitVec 32) (_ BitVec 32) V!6325 V!6325 (_ BitVec 32) (_ BitVec 64) V!6325 (_ BitVec 32) Int) Unit!6160)

(assert (=> b!203393 (= lt!102573 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!94 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!355 (array!9241 array!9243 (_ BitVec 32) (_ BitVec 32) V!6325 V!6325 (_ BitVec 32) Int) ListLongMap!2781)

(assert (=> b!203393 (= lt!102578 (getCurrentListMapNoExtraKeys!355 _keys!825 lt!102574 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203393 (= lt!102574 (array!9244 (store (arr!4372 _values!649) i!601 (ValueCellFull!2161 v!520)) (size!4697 _values!649)))))

(assert (=> b!203393 (= lt!102576 (getCurrentListMapNoExtraKeys!355 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8582 () Bool)

(declare-fun mapRes!8582 () Bool)

(assert (=> mapIsEmpty!8582 mapRes!8582))

(declare-fun b!203394 () Bool)

(declare-fun res!97720 () Bool)

(assert (=> b!203394 (=> (not res!97720) (not e!133159))))

(declare-datatypes ((List!2771 0))(
  ( (Nil!2768) (Cons!2767 (h!3409 (_ BitVec 64)) (t!7702 List!2771)) )
))
(declare-fun arrayNoDuplicates!0 (array!9241 (_ BitVec 32) List!2771) Bool)

(assert (=> b!203394 (= res!97720 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2768))))

(declare-fun b!203395 () Bool)

(declare-fun e!133160 () Bool)

(declare-fun e!133155 () Bool)

(assert (=> b!203395 (= e!133160 (and e!133155 mapRes!8582))))

(declare-fun condMapEmpty!8582 () Bool)

(declare-fun mapDefault!8582 () ValueCell!2161)

