; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20382 () Bool)

(assert start!20382)

(declare-fun b_free!5041 () Bool)

(declare-fun b_next!5041 () Bool)

(assert (=> start!20382 (= b_free!5041 (not b_next!5041))))

(declare-fun tp!18154 () Bool)

(declare-fun b_and!11787 () Bool)

(assert (=> start!20382 (= tp!18154 b_and!11787)))

(declare-fun b!201366 () Bool)

(declare-fun e!131981 () Bool)

(declare-fun tp_is_empty!4897 () Bool)

(assert (=> b!201366 (= e!131981 tp_is_empty!4897)))

(declare-fun b!201367 () Bool)

(declare-fun e!131982 () Bool)

(assert (=> b!201367 (= e!131982 true)))

(declare-datatypes ((V!6177 0))(
  ( (V!6178 (val!2493 Int)) )
))
(declare-datatypes ((tuple2!3774 0))(
  ( (tuple2!3775 (_1!1898 (_ BitVec 64)) (_2!1898 V!6177)) )
))
(declare-datatypes ((List!2688 0))(
  ( (Nil!2685) (Cons!2684 (h!3326 tuple2!3774) (t!7619 List!2688)) )
))
(declare-datatypes ((ListLongMap!2687 0))(
  ( (ListLongMap!2688 (toList!1359 List!2688)) )
))
(declare-fun lt!100276 () ListLongMap!2687)

(declare-fun lt!100280 () tuple2!3774)

(declare-fun lt!100282 () tuple2!3774)

(declare-fun lt!100273 () ListLongMap!2687)

(declare-fun +!386 (ListLongMap!2687 tuple2!3774) ListLongMap!2687)

(assert (=> b!201367 (= (+!386 lt!100273 lt!100280) (+!386 lt!100276 lt!100282))))

(declare-fun lt!100278 () ListLongMap!2687)

(declare-fun minValue!615 () V!6177)

(declare-datatypes ((Unit!6072 0))(
  ( (Unit!6073) )
))
(declare-fun lt!100272 () Unit!6072)

(declare-fun v!520 () V!6177)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!107 (ListLongMap!2687 (_ BitVec 64) V!6177 (_ BitVec 64) V!6177) Unit!6072)

(assert (=> b!201367 (= lt!100272 (addCommutativeForDiffKeys!107 lt!100278 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201368 () Bool)

(declare-fun res!96198 () Bool)

(declare-fun e!131978 () Bool)

(assert (=> b!201368 (=> (not res!96198) (not e!131978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201368 (= res!96198 (validKeyInArray!0 k!843))))

(declare-fun b!201369 () Bool)

(declare-fun res!96199 () Bool)

(assert (=> b!201369 (=> (not res!96199) (not e!131978))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9023 0))(
  ( (array!9024 (arr!4262 (Array (_ BitVec 32) (_ BitVec 64))) (size!4587 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9023)

(assert (=> b!201369 (= res!96199 (= (select (arr!4262 _keys!825) i!601) k!843))))

(declare-fun b!201370 () Bool)

(declare-fun res!96197 () Bool)

(assert (=> b!201370 (=> (not res!96197) (not e!131978))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2105 0))(
  ( (ValueCellFull!2105 (v!4463 V!6177)) (EmptyCell!2105) )
))
(declare-datatypes ((array!9025 0))(
  ( (array!9026 (arr!4263 (Array (_ BitVec 32) ValueCell!2105)) (size!4588 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9025)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201370 (= res!96197 (and (= (size!4588 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4587 _keys!825) (size!4588 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201371 () Bool)

(declare-fun e!131983 () Bool)

(assert (=> b!201371 (= e!131978 (not e!131983))))

(declare-fun res!96201 () Bool)

(assert (=> b!201371 (=> res!96201 e!131983)))

(assert (=> b!201371 (= res!96201 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!100281 () ListLongMap!2687)

(declare-fun zeroValue!615 () V!6177)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!948 (array!9023 array!9025 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) Int) ListLongMap!2687)

(assert (=> b!201371 (= lt!100281 (getCurrentListMap!948 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100277 () array!9025)

(declare-fun lt!100283 () ListLongMap!2687)

(assert (=> b!201371 (= lt!100283 (getCurrentListMap!948 _keys!825 lt!100277 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100286 () ListLongMap!2687)

(declare-fun lt!100287 () ListLongMap!2687)

(assert (=> b!201371 (and (= lt!100286 lt!100287) (= lt!100287 lt!100286))))

(declare-fun lt!100279 () ListLongMap!2687)

(assert (=> b!201371 (= lt!100287 (+!386 lt!100279 lt!100282))))

(assert (=> b!201371 (= lt!100282 (tuple2!3775 k!843 v!520))))

(declare-fun lt!100285 () Unit!6072)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!61 (array!9023 array!9025 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) (_ BitVec 64) V!6177 (_ BitVec 32) Int) Unit!6072)

(assert (=> b!201371 (= lt!100285 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!61 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!322 (array!9023 array!9025 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) Int) ListLongMap!2687)

(assert (=> b!201371 (= lt!100286 (getCurrentListMapNoExtraKeys!322 _keys!825 lt!100277 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201371 (= lt!100277 (array!9026 (store (arr!4263 _values!649) i!601 (ValueCellFull!2105 v!520)) (size!4588 _values!649)))))

(assert (=> b!201371 (= lt!100279 (getCurrentListMapNoExtraKeys!322 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201372 () Bool)

(declare-fun res!96203 () Bool)

(assert (=> b!201372 (=> (not res!96203) (not e!131978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9023 (_ BitVec 32)) Bool)

(assert (=> b!201372 (= res!96203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201373 () Bool)

(declare-fun e!131979 () Bool)

(assert (=> b!201373 (= e!131979 tp_is_empty!4897)))

(declare-fun b!201374 () Bool)

(declare-fun res!96202 () Bool)

(assert (=> b!201374 (=> (not res!96202) (not e!131978))))

(assert (=> b!201374 (= res!96202 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4587 _keys!825))))))

(declare-fun mapNonEmpty!8414 () Bool)

(declare-fun mapRes!8414 () Bool)

(declare-fun tp!18155 () Bool)

(assert (=> mapNonEmpty!8414 (= mapRes!8414 (and tp!18155 e!131981))))

(declare-fun mapKey!8414 () (_ BitVec 32))

(declare-fun mapValue!8414 () ValueCell!2105)

(declare-fun mapRest!8414 () (Array (_ BitVec 32) ValueCell!2105))

(assert (=> mapNonEmpty!8414 (= (arr!4263 _values!649) (store mapRest!8414 mapKey!8414 mapValue!8414))))

(declare-fun mapIsEmpty!8414 () Bool)

(assert (=> mapIsEmpty!8414 mapRes!8414))

(declare-fun b!201376 () Bool)

(declare-fun e!131984 () Bool)

(assert (=> b!201376 (= e!131984 (and e!131979 mapRes!8414))))

(declare-fun condMapEmpty!8414 () Bool)

(declare-fun mapDefault!8414 () ValueCell!2105)

