; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37488 () Bool)

(assert start!37488)

(declare-fun b_free!8615 () Bool)

(declare-fun b_next!8615 () Bool)

(assert (=> start!37488 (= b_free!8615 (not b_next!8615))))

(declare-fun tp!30561 () Bool)

(declare-fun b_and!15857 () Bool)

(assert (=> start!37488 (= tp!30561 b_and!15857)))

(declare-fun b!382192 () Bool)

(declare-fun res!217333 () Bool)

(declare-fun e!232282 () Bool)

(assert (=> b!382192 (=> (not res!217333) (not e!232282))))

(declare-datatypes ((array!22435 0))(
  ( (array!22436 (arr!10686 (Array (_ BitVec 32) (_ BitVec 64))) (size!11038 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22435)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382192 (= res!217333 (or (= (select (arr!10686 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10686 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382193 () Bool)

(declare-fun res!217335 () Bool)

(assert (=> b!382193 (=> (not res!217335) (not e!232282))))

(assert (=> b!382193 (= res!217335 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11038 _keys!658))))))

(declare-fun b!382195 () Bool)

(declare-fun res!217330 () Bool)

(assert (=> b!382195 (=> (not res!217330) (not e!232282))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382195 (= res!217330 (validKeyInArray!0 k!778))))

(declare-fun b!382196 () Bool)

(declare-fun res!217337 () Bool)

(assert (=> b!382196 (=> (not res!217337) (not e!232282))))

(declare-fun arrayContainsKey!0 (array!22435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382196 (= res!217337 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15459 () Bool)

(declare-fun mapRes!15459 () Bool)

(declare-fun tp!30560 () Bool)

(declare-fun e!232283 () Bool)

(assert (=> mapNonEmpty!15459 (= mapRes!15459 (and tp!30560 e!232283))))

(declare-datatypes ((V!13455 0))(
  ( (V!13456 (val!4676 Int)) )
))
(declare-datatypes ((ValueCell!4288 0))(
  ( (ValueCellFull!4288 (v!6873 V!13455)) (EmptyCell!4288) )
))
(declare-datatypes ((array!22437 0))(
  ( (array!22438 (arr!10687 (Array (_ BitVec 32) ValueCell!4288)) (size!11039 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22437)

(declare-fun mapValue!15459 () ValueCell!4288)

(declare-fun mapRest!15459 () (Array (_ BitVec 32) ValueCell!4288))

(declare-fun mapKey!15459 () (_ BitVec 32))

(assert (=> mapNonEmpty!15459 (= (arr!10687 _values!506) (store mapRest!15459 mapKey!15459 mapValue!15459))))

(declare-fun res!217331 () Bool)

(assert (=> start!37488 (=> (not res!217331) (not e!232282))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37488 (= res!217331 (validMask!0 mask!970))))

(assert (=> start!37488 e!232282))

(declare-fun e!232281 () Bool)

(declare-fun array_inv!7868 (array!22437) Bool)

(assert (=> start!37488 (and (array_inv!7868 _values!506) e!232281)))

(assert (=> start!37488 tp!30561))

(assert (=> start!37488 true))

(declare-fun tp_is_empty!9263 () Bool)

(assert (=> start!37488 tp_is_empty!9263))

(declare-fun array_inv!7869 (array!22435) Bool)

(assert (=> start!37488 (array_inv!7869 _keys!658)))

(declare-fun b!382194 () Bool)

(assert (=> b!382194 (= e!232283 tp_is_empty!9263)))

(declare-fun mapIsEmpty!15459 () Bool)

(assert (=> mapIsEmpty!15459 mapRes!15459))

(declare-fun b!382197 () Bool)

(declare-fun e!232280 () Bool)

(declare-fun e!232278 () Bool)

(assert (=> b!382197 (= e!232280 (not e!232278))))

(declare-fun res!217336 () Bool)

(assert (=> b!382197 (=> res!217336 e!232278)))

(declare-fun lt!179270 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382197 (= res!217336 (or (and (not lt!179270) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179270) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179270)))))

(assert (=> b!382197 (= lt!179270 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13455)

(declare-datatypes ((tuple2!6286 0))(
  ( (tuple2!6287 (_1!3154 (_ BitVec 64)) (_2!3154 V!13455)) )
))
(declare-datatypes ((List!6116 0))(
  ( (Nil!6113) (Cons!6112 (h!6968 tuple2!6286) (t!11266 List!6116)) )
))
(declare-datatypes ((ListLongMap!5199 0))(
  ( (ListLongMap!5200 (toList!2615 List!6116)) )
))
(declare-fun lt!179271 () ListLongMap!5199)

(declare-fun minValue!472 () V!13455)

(declare-fun getCurrentListMap!2022 (array!22435 array!22437 (_ BitVec 32) (_ BitVec 32) V!13455 V!13455 (_ BitVec 32) Int) ListLongMap!5199)

(assert (=> b!382197 (= lt!179271 (getCurrentListMap!2022 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179263 () array!22437)

(declare-fun lt!179265 () array!22435)

(declare-fun lt!179268 () ListLongMap!5199)

(assert (=> b!382197 (= lt!179268 (getCurrentListMap!2022 lt!179265 lt!179263 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179269 () ListLongMap!5199)

(declare-fun lt!179267 () ListLongMap!5199)

(assert (=> b!382197 (and (= lt!179269 lt!179267) (= lt!179267 lt!179269))))

(declare-fun lt!179264 () ListLongMap!5199)

(declare-fun v!373 () V!13455)

(declare-fun +!952 (ListLongMap!5199 tuple2!6286) ListLongMap!5199)

(assert (=> b!382197 (= lt!179267 (+!952 lt!179264 (tuple2!6287 k!778 v!373)))))

(declare-datatypes ((Unit!11798 0))(
  ( (Unit!11799) )
))
(declare-fun lt!179266 () Unit!11798)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!180 (array!22435 array!22437 (_ BitVec 32) (_ BitVec 32) V!13455 V!13455 (_ BitVec 32) (_ BitVec 64) V!13455 (_ BitVec 32) Int) Unit!11798)

(assert (=> b!382197 (= lt!179266 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!180 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!856 (array!22435 array!22437 (_ BitVec 32) (_ BitVec 32) V!13455 V!13455 (_ BitVec 32) Int) ListLongMap!5199)

(assert (=> b!382197 (= lt!179269 (getCurrentListMapNoExtraKeys!856 lt!179265 lt!179263 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382197 (= lt!179263 (array!22438 (store (arr!10687 _values!506) i!548 (ValueCellFull!4288 v!373)) (size!11039 _values!506)))))

(assert (=> b!382197 (= lt!179264 (getCurrentListMapNoExtraKeys!856 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382198 () Bool)

(declare-fun res!217332 () Bool)

(assert (=> b!382198 (=> (not res!217332) (not e!232282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22435 (_ BitVec 32)) Bool)

(assert (=> b!382198 (= res!217332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382199 () Bool)

(assert (=> b!382199 (= e!232278 true)))

(assert (=> b!382199 (= lt!179268 lt!179269)))

(declare-fun b!382200 () Bool)

(declare-fun res!217340 () Bool)

(assert (=> b!382200 (=> (not res!217340) (not e!232280))))

(declare-datatypes ((List!6117 0))(
  ( (Nil!6114) (Cons!6113 (h!6969 (_ BitVec 64)) (t!11267 List!6117)) )
))
(declare-fun arrayNoDuplicates!0 (array!22435 (_ BitVec 32) List!6117) Bool)

(assert (=> b!382200 (= res!217340 (arrayNoDuplicates!0 lt!179265 #b00000000000000000000000000000000 Nil!6114))))

(declare-fun b!382201 () Bool)

(declare-fun res!217334 () Bool)

(assert (=> b!382201 (=> (not res!217334) (not e!232282))))

(assert (=> b!382201 (= res!217334 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6114))))

(declare-fun b!382202 () Bool)

(declare-fun res!217339 () Bool)

(assert (=> b!382202 (=> (not res!217339) (not e!232282))))

(assert (=> b!382202 (= res!217339 (and (= (size!11039 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11038 _keys!658) (size!11039 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382203 () Bool)

(assert (=> b!382203 (= e!232282 e!232280)))

(declare-fun res!217338 () Bool)

(assert (=> b!382203 (=> (not res!217338) (not e!232280))))

(assert (=> b!382203 (= res!217338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179265 mask!970))))

(assert (=> b!382203 (= lt!179265 (array!22436 (store (arr!10686 _keys!658) i!548 k!778) (size!11038 _keys!658)))))

(declare-fun b!382204 () Bool)

(declare-fun e!232279 () Bool)

(assert (=> b!382204 (= e!232281 (and e!232279 mapRes!15459))))

(declare-fun condMapEmpty!15459 () Bool)

(declare-fun mapDefault!15459 () ValueCell!4288)

