; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39802 () Bool)

(assert start!39802)

(declare-fun b_free!10069 () Bool)

(declare-fun b_next!10069 () Bool)

(assert (=> start!39802 (= b_free!10069 (not b_next!10069))))

(declare-fun tp!35736 () Bool)

(declare-fun b_and!17797 () Bool)

(assert (=> start!39802 (= tp!35736 b_and!17797)))

(declare-fun b!429374 () Bool)

(declare-fun res!252167 () Bool)

(declare-fun e!254332 () Bool)

(assert (=> b!429374 (=> (not res!252167) (not e!254332))))

(declare-datatypes ((array!26277 0))(
  ( (array!26278 (arr!12588 (Array (_ BitVec 32) (_ BitVec 64))) (size!12940 (_ BitVec 32))) )
))
(declare-fun lt!196229 () array!26277)

(declare-datatypes ((List!7461 0))(
  ( (Nil!7458) (Cons!7457 (h!8313 (_ BitVec 64)) (t!12979 List!7461)) )
))
(declare-fun arrayNoDuplicates!0 (array!26277 (_ BitVec 32) List!7461) Bool)

(assert (=> b!429374 (= res!252167 (arrayNoDuplicates!0 lt!196229 #b00000000000000000000000000000000 Nil!7458))))

(declare-fun b!429375 () Bool)

(declare-fun res!252155 () Bool)

(declare-fun e!254326 () Bool)

(assert (=> b!429375 (=> (not res!252155) (not e!254326))))

(declare-fun _keys!709 () array!26277)

(assert (=> b!429375 (= res!252155 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7458))))

(declare-fun b!429376 () Bool)

(declare-fun res!252162 () Bool)

(assert (=> b!429376 (=> (not res!252162) (not e!254332))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429376 (= res!252162 (bvsle from!863 i!563))))

(declare-fun b!429377 () Bool)

(assert (=> b!429377 (= e!254326 e!254332)))

(declare-fun res!252168 () Bool)

(assert (=> b!429377 (=> (not res!252168) (not e!254332))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26277 (_ BitVec 32)) Bool)

(assert (=> b!429377 (= res!252168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196229 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!429377 (= lt!196229 (array!26278 (store (arr!12588 _keys!709) i!563 k!794) (size!12940 _keys!709)))))

(declare-fun b!429378 () Bool)

(declare-datatypes ((Unit!12613 0))(
  ( (Unit!12614) )
))
(declare-fun e!254333 () Unit!12613)

(declare-fun Unit!12615 () Unit!12613)

(assert (=> b!429378 (= e!254333 Unit!12615)))

(declare-fun lt!196235 () Unit!12613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12613)

(assert (=> b!429378 (= lt!196235 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429378 false))

(declare-fun b!429379 () Bool)

(declare-fun e!254327 () Bool)

(assert (=> b!429379 (= e!254332 e!254327)))

(declare-fun res!252163 () Bool)

(assert (=> b!429379 (=> (not res!252163) (not e!254327))))

(assert (=> b!429379 (= res!252163 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16067 0))(
  ( (V!16068 (val!5655 Int)) )
))
(declare-fun minValue!515 () V!16067)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16067)

(declare-datatypes ((tuple2!7446 0))(
  ( (tuple2!7447 (_1!3734 (_ BitVec 64)) (_2!3734 V!16067)) )
))
(declare-datatypes ((List!7462 0))(
  ( (Nil!7459) (Cons!7458 (h!8314 tuple2!7446) (t!12980 List!7462)) )
))
(declare-datatypes ((ListLongMap!6359 0))(
  ( (ListLongMap!6360 (toList!3195 List!7462)) )
))
(declare-fun lt!196227 () ListLongMap!6359)

(declare-datatypes ((ValueCell!5267 0))(
  ( (ValueCellFull!5267 (v!7902 V!16067)) (EmptyCell!5267) )
))
(declare-datatypes ((array!26279 0))(
  ( (array!26280 (arr!12589 (Array (_ BitVec 32) ValueCell!5267)) (size!12941 (_ BitVec 32))) )
))
(declare-fun lt!196234 () array!26279)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1397 (array!26277 array!26279 (_ BitVec 32) (_ BitVec 32) V!16067 V!16067 (_ BitVec 32) Int) ListLongMap!6359)

(assert (=> b!429379 (= lt!196227 (getCurrentListMapNoExtraKeys!1397 lt!196229 lt!196234 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26279)

(declare-fun v!412 () V!16067)

(assert (=> b!429379 (= lt!196234 (array!26280 (store (arr!12589 _values!549) i!563 (ValueCellFull!5267 v!412)) (size!12941 _values!549)))))

(declare-fun lt!196232 () ListLongMap!6359)

(assert (=> b!429379 (= lt!196232 (getCurrentListMapNoExtraKeys!1397 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429380 () Bool)

(declare-fun res!252164 () Bool)

(assert (=> b!429380 (=> (not res!252164) (not e!254326))))

(assert (=> b!429380 (= res!252164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429381 () Bool)

(declare-fun e!254334 () Bool)

(declare-fun tp_is_empty!11221 () Bool)

(assert (=> b!429381 (= e!254334 tp_is_empty!11221)))

(declare-fun b!429382 () Bool)

(declare-fun e!254329 () Bool)

(declare-fun e!254330 () Bool)

(declare-fun mapRes!18453 () Bool)

(assert (=> b!429382 (= e!254329 (and e!254330 mapRes!18453))))

(declare-fun condMapEmpty!18453 () Bool)

(declare-fun mapDefault!18453 () ValueCell!5267)

