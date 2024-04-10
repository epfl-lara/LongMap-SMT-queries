; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20860 () Bool)

(assert start!20860)

(declare-fun b_free!5513 () Bool)

(declare-fun b_next!5513 () Bool)

(assert (=> start!20860 (= b_free!5513 (not b_next!5513))))

(declare-fun tp!19579 () Bool)

(declare-fun b_and!12259 () Bool)

(assert (=> start!20860 (= tp!19579 b_and!12259)))

(declare-fun b!209360 () Bool)

(declare-fun res!102042 () Bool)

(declare-fun e!136406 () Bool)

(assert (=> b!209360 (=> (not res!102042) (not e!136406))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209360 (= res!102042 (validKeyInArray!0 k!843))))

(declare-fun b!209361 () Bool)

(declare-fun res!102045 () Bool)

(assert (=> b!209361 (=> (not res!102045) (not e!136406))))

(declare-datatypes ((array!9947 0))(
  ( (array!9948 (arr!4724 (Array (_ BitVec 32) (_ BitVec 64))) (size!5049 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9947)

(declare-datatypes ((List!3023 0))(
  ( (Nil!3020) (Cons!3019 (h!3661 (_ BitVec 64)) (t!7954 List!3023)) )
))
(declare-fun arrayNoDuplicates!0 (array!9947 (_ BitVec 32) List!3023) Bool)

(assert (=> b!209361 (= res!102045 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3020))))

(declare-fun mapNonEmpty!9131 () Bool)

(declare-fun mapRes!9131 () Bool)

(declare-fun tp!19580 () Bool)

(declare-fun e!136405 () Bool)

(assert (=> mapNonEmpty!9131 (= mapRes!9131 (and tp!19580 e!136405))))

(declare-datatypes ((V!6813 0))(
  ( (V!6814 (val!2732 Int)) )
))
(declare-datatypes ((ValueCell!2344 0))(
  ( (ValueCellFull!2344 (v!4702 V!6813)) (EmptyCell!2344) )
))
(declare-datatypes ((array!9949 0))(
  ( (array!9950 (arr!4725 (Array (_ BitVec 32) ValueCell!2344)) (size!5050 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9949)

(declare-fun mapRest!9131 () (Array (_ BitVec 32) ValueCell!2344))

(declare-fun mapKey!9131 () (_ BitVec 32))

(declare-fun mapValue!9131 () ValueCell!2344)

(assert (=> mapNonEmpty!9131 (= (arr!4725 _values!649) (store mapRest!9131 mapKey!9131 mapValue!9131))))

(declare-fun b!209362 () Bool)

(declare-fun tp_is_empty!5375 () Bool)

(assert (=> b!209362 (= e!136405 tp_is_empty!5375)))

(declare-fun res!102046 () Bool)

(assert (=> start!20860 (=> (not res!102046) (not e!136406))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20860 (= res!102046 (validMask!0 mask!1149))))

(assert (=> start!20860 e!136406))

(declare-fun e!136407 () Bool)

(declare-fun array_inv!3127 (array!9949) Bool)

(assert (=> start!20860 (and (array_inv!3127 _values!649) e!136407)))

(assert (=> start!20860 true))

(assert (=> start!20860 tp_is_empty!5375))

(declare-fun array_inv!3128 (array!9947) Bool)

(assert (=> start!20860 (array_inv!3128 _keys!825)))

(assert (=> start!20860 tp!19579))

(declare-fun b!209363 () Bool)

(declare-fun res!102044 () Bool)

(assert (=> b!209363 (=> (not res!102044) (not e!136406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9947 (_ BitVec 32)) Bool)

(assert (=> b!209363 (= res!102044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209364 () Bool)

(declare-fun res!102040 () Bool)

(assert (=> b!209364 (=> (not res!102040) (not e!136406))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209364 (= res!102040 (= (select (arr!4724 _keys!825) i!601) k!843))))

(declare-fun b!209365 () Bool)

(declare-fun e!136409 () Bool)

(assert (=> b!209365 (= e!136409 tp_is_empty!5375)))

(declare-fun b!209366 () Bool)

(declare-datatypes ((tuple2!4128 0))(
  ( (tuple2!4129 (_1!2075 (_ BitVec 64)) (_2!2075 V!6813)) )
))
(declare-datatypes ((List!3024 0))(
  ( (Nil!3021) (Cons!3020 (h!3662 tuple2!4128) (t!7955 List!3024)) )
))
(declare-datatypes ((ListLongMap!3041 0))(
  ( (ListLongMap!3042 (toList!1536 List!3024)) )
))
(declare-fun lt!106989 () ListLongMap!3041)

(declare-fun lt!106987 () ListLongMap!3041)

(assert (=> b!209366 (= e!136406 (not (= lt!106989 lt!106987)))))

(assert (=> b!209366 (= lt!106987 lt!106989)))

(declare-fun v!520 () V!6813)

(declare-fun lt!106986 () ListLongMap!3041)

(declare-fun +!539 (ListLongMap!3041 tuple2!4128) ListLongMap!3041)

(assert (=> b!209366 (= lt!106989 (+!539 lt!106986 (tuple2!4129 k!843 v!520)))))

(declare-datatypes ((Unit!6366 0))(
  ( (Unit!6367) )
))
(declare-fun lt!106988 () Unit!6366)

(declare-fun zeroValue!615 () V!6813)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6813)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!192 (array!9947 array!9949 (_ BitVec 32) (_ BitVec 32) V!6813 V!6813 (_ BitVec 32) (_ BitVec 64) V!6813 (_ BitVec 32) Int) Unit!6366)

(assert (=> b!209366 (= lt!106988 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!192 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!477 (array!9947 array!9949 (_ BitVec 32) (_ BitVec 32) V!6813 V!6813 (_ BitVec 32) Int) ListLongMap!3041)

(assert (=> b!209366 (= lt!106987 (getCurrentListMapNoExtraKeys!477 _keys!825 (array!9950 (store (arr!4725 _values!649) i!601 (ValueCellFull!2344 v!520)) (size!5050 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209366 (= lt!106986 (getCurrentListMapNoExtraKeys!477 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9131 () Bool)

(assert (=> mapIsEmpty!9131 mapRes!9131))

(declare-fun b!209367 () Bool)

(declare-fun res!102041 () Bool)

(assert (=> b!209367 (=> (not res!102041) (not e!136406))))

(assert (=> b!209367 (= res!102041 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5049 _keys!825))))))

(declare-fun b!209368 () Bool)

(assert (=> b!209368 (= e!136407 (and e!136409 mapRes!9131))))

(declare-fun condMapEmpty!9131 () Bool)

(declare-fun mapDefault!9131 () ValueCell!2344)

