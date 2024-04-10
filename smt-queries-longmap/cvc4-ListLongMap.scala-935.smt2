; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20710 () Bool)

(assert start!20710)

(declare-fun b_free!5369 () Bool)

(declare-fun b_next!5369 () Bool)

(assert (=> start!20710 (= b_free!5369 (not b_next!5369))))

(declare-fun tp!19138 () Bool)

(declare-fun b_and!12115 () Bool)

(assert (=> start!20710 (= tp!19138 b_and!12115)))

(declare-fun b!207146 () Bool)

(declare-fun res!100502 () Bool)

(declare-fun e!135284 () Bool)

(assert (=> b!207146 (=> (not res!100502) (not e!135284))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207146 (= res!100502 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!8906 () Bool)

(declare-fun mapRes!8906 () Bool)

(assert (=> mapIsEmpty!8906 mapRes!8906))

(declare-fun b!207147 () Bool)

(declare-fun res!100501 () Bool)

(assert (=> b!207147 (=> (not res!100501) (not e!135284))))

(declare-datatypes ((array!9659 0))(
  ( (array!9660 (arr!4580 (Array (_ BitVec 32) (_ BitVec 64))) (size!4905 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9659)

(declare-datatypes ((List!2925 0))(
  ( (Nil!2922) (Cons!2921 (h!3563 (_ BitVec 64)) (t!7856 List!2925)) )
))
(declare-fun arrayNoDuplicates!0 (array!9659 (_ BitVec 32) List!2925) Bool)

(assert (=> b!207147 (= res!100501 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2922))))

(declare-fun b!207148 () Bool)

(assert (=> b!207148 (= e!135284 (not true))))

(declare-datatypes ((V!6613 0))(
  ( (V!6614 (val!2657 Int)) )
))
(declare-datatypes ((tuple2!4034 0))(
  ( (tuple2!4035 (_1!2028 (_ BitVec 64)) (_2!2028 V!6613)) )
))
(declare-datatypes ((List!2926 0))(
  ( (Nil!2923) (Cons!2922 (h!3564 tuple2!4034) (t!7857 List!2926)) )
))
(declare-datatypes ((ListLongMap!2947 0))(
  ( (ListLongMap!2948 (toList!1489 List!2926)) )
))
(declare-fun lt!106069 () ListLongMap!2947)

(declare-datatypes ((ValueCell!2269 0))(
  ( (ValueCellFull!2269 (v!4627 V!6613)) (EmptyCell!2269) )
))
(declare-datatypes ((array!9661 0))(
  ( (array!9662 (arr!4581 (Array (_ BitVec 32) ValueCell!2269)) (size!4906 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9661)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6613)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6613)

(declare-fun getCurrentListMap!1056 (array!9659 array!9661 (_ BitVec 32) (_ BitVec 32) V!6613 V!6613 (_ BitVec 32) Int) ListLongMap!2947)

(assert (=> b!207148 (= lt!106069 (getCurrentListMap!1056 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106065 () array!9661)

(declare-fun lt!106066 () ListLongMap!2947)

(assert (=> b!207148 (= lt!106066 (getCurrentListMap!1056 _keys!825 lt!106065 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106068 () ListLongMap!2947)

(declare-fun lt!106067 () ListLongMap!2947)

(assert (=> b!207148 (and (= lt!106068 lt!106067) (= lt!106067 lt!106068))))

(declare-fun v!520 () V!6613)

(declare-fun lt!106070 () ListLongMap!2947)

(declare-fun +!516 (ListLongMap!2947 tuple2!4034) ListLongMap!2947)

(assert (=> b!207148 (= lt!106067 (+!516 lt!106070 (tuple2!4035 k!843 v!520)))))

(declare-datatypes ((Unit!6320 0))(
  ( (Unit!6321) )
))
(declare-fun lt!106071 () Unit!6320)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!169 (array!9659 array!9661 (_ BitVec 32) (_ BitVec 32) V!6613 V!6613 (_ BitVec 32) (_ BitVec 64) V!6613 (_ BitVec 32) Int) Unit!6320)

(assert (=> b!207148 (= lt!106071 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!169 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!430 (array!9659 array!9661 (_ BitVec 32) (_ BitVec 32) V!6613 V!6613 (_ BitVec 32) Int) ListLongMap!2947)

(assert (=> b!207148 (= lt!106068 (getCurrentListMapNoExtraKeys!430 _keys!825 lt!106065 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207148 (= lt!106065 (array!9662 (store (arr!4581 _values!649) i!601 (ValueCellFull!2269 v!520)) (size!4906 _values!649)))))

(assert (=> b!207148 (= lt!106070 (getCurrentListMapNoExtraKeys!430 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207149 () Bool)

(declare-fun e!135283 () Bool)

(declare-fun e!135281 () Bool)

(assert (=> b!207149 (= e!135283 (and e!135281 mapRes!8906))))

(declare-fun condMapEmpty!8906 () Bool)

(declare-fun mapDefault!8906 () ValueCell!2269)

