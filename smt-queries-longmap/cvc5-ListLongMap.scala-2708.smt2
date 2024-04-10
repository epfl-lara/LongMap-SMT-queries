; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40066 () Bool)

(assert start!40066)

(declare-fun b_free!10333 () Bool)

(declare-fun b_next!10333 () Bool)

(assert (=> start!40066 (= b_free!10333 (not b_next!10333))))

(declare-fun tp!36528 () Bool)

(declare-fun b_and!18301 () Bool)

(assert (=> start!40066 (= tp!36528 b_and!18301)))

(declare-fun b!437348 () Bool)

(declare-fun res!257986 () Bool)

(declare-fun e!258139 () Bool)

(assert (=> b!437348 (=> (not res!257986) (not e!258139))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437348 (= res!257986 (bvsle from!863 i!563))))

(declare-fun b!437350 () Bool)

(declare-fun e!258143 () Bool)

(assert (=> b!437350 (= e!258143 (not true))))

(declare-datatypes ((V!16419 0))(
  ( (V!16420 (val!5787 Int)) )
))
(declare-fun minValue!515 () V!16419)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5399 0))(
  ( (ValueCellFull!5399 (v!8034 V!16419)) (EmptyCell!5399) )
))
(declare-datatypes ((array!26789 0))(
  ( (array!26790 (arr!12844 (Array (_ BitVec 32) ValueCell!5399)) (size!13196 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26789)

(declare-fun zeroValue!515 () V!16419)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26791 0))(
  ( (array!26792 (arr!12845 (Array (_ BitVec 32) (_ BitVec 64))) (size!13197 (_ BitVec 32))) )
))
(declare-fun lt!201619 () array!26791)

(declare-fun v!412 () V!16419)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26791)

(declare-fun lt!201617 () array!26789)

(declare-datatypes ((tuple2!7670 0))(
  ( (tuple2!7671 (_1!3846 (_ BitVec 64)) (_2!3846 V!16419)) )
))
(declare-datatypes ((List!7668 0))(
  ( (Nil!7665) (Cons!7664 (h!8520 tuple2!7670) (t!13424 List!7668)) )
))
(declare-datatypes ((ListLongMap!6583 0))(
  ( (ListLongMap!6584 (toList!3307 List!7668)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1496 (array!26791 array!26789 (_ BitVec 32) (_ BitVec 32) V!16419 V!16419 (_ BitVec 32) Int) ListLongMap!6583)

(declare-fun +!1451 (ListLongMap!6583 tuple2!7670) ListLongMap!6583)

(assert (=> b!437350 (= (getCurrentListMapNoExtraKeys!1496 lt!201619 lt!201617 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1451 (getCurrentListMapNoExtraKeys!1496 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7671 k!794 v!412)))))

(declare-datatypes ((Unit!13006 0))(
  ( (Unit!13007) )
))
(declare-fun lt!201616 () Unit!13006)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!620 (array!26791 array!26789 (_ BitVec 32) (_ BitVec 32) V!16419 V!16419 (_ BitVec 32) (_ BitVec 64) V!16419 (_ BitVec 32) Int) Unit!13006)

(assert (=> b!437350 (= lt!201616 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!620 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437351 () Bool)

(declare-fun res!257997 () Bool)

(declare-fun e!258144 () Bool)

(assert (=> b!437351 (=> (not res!257997) (not e!258144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26791 (_ BitVec 32)) Bool)

(assert (=> b!437351 (= res!257997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437352 () Bool)

(declare-fun res!257994 () Bool)

(assert (=> b!437352 (=> (not res!257994) (not e!258144))))

(assert (=> b!437352 (= res!257994 (and (= (size!13196 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13197 _keys!709) (size!13196 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437353 () Bool)

(assert (=> b!437353 (= e!258139 e!258143)))

(declare-fun res!257995 () Bool)

(assert (=> b!437353 (=> (not res!257995) (not e!258143))))

(assert (=> b!437353 (= res!257995 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201618 () ListLongMap!6583)

(assert (=> b!437353 (= lt!201618 (getCurrentListMapNoExtraKeys!1496 lt!201619 lt!201617 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437353 (= lt!201617 (array!26790 (store (arr!12844 _values!549) i!563 (ValueCellFull!5399 v!412)) (size!13196 _values!549)))))

(declare-fun lt!201620 () ListLongMap!6583)

(assert (=> b!437353 (= lt!201620 (getCurrentListMapNoExtraKeys!1496 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18849 () Bool)

(declare-fun mapRes!18849 () Bool)

(declare-fun tp!36527 () Bool)

(declare-fun e!258138 () Bool)

(assert (=> mapNonEmpty!18849 (= mapRes!18849 (and tp!36527 e!258138))))

(declare-fun mapValue!18849 () ValueCell!5399)

(declare-fun mapRest!18849 () (Array (_ BitVec 32) ValueCell!5399))

(declare-fun mapKey!18849 () (_ BitVec 32))

(assert (=> mapNonEmpty!18849 (= (arr!12844 _values!549) (store mapRest!18849 mapKey!18849 mapValue!18849))))

(declare-fun b!437354 () Bool)

(declare-fun res!257991 () Bool)

(assert (=> b!437354 (=> (not res!257991) (not e!258144))))

(declare-datatypes ((List!7669 0))(
  ( (Nil!7666) (Cons!7665 (h!8521 (_ BitVec 64)) (t!13425 List!7669)) )
))
(declare-fun arrayNoDuplicates!0 (array!26791 (_ BitVec 32) List!7669) Bool)

(assert (=> b!437354 (= res!257991 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7666))))

(declare-fun b!437349 () Bool)

(assert (=> b!437349 (= e!258144 e!258139)))

(declare-fun res!257992 () Bool)

(assert (=> b!437349 (=> (not res!257992) (not e!258139))))

(assert (=> b!437349 (= res!257992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201619 mask!1025))))

(assert (=> b!437349 (= lt!201619 (array!26792 (store (arr!12845 _keys!709) i!563 k!794) (size!13197 _keys!709)))))

(declare-fun res!257989 () Bool)

(assert (=> start!40066 (=> (not res!257989) (not e!258144))))

(assert (=> start!40066 (= res!257989 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13197 _keys!709))))))

(assert (=> start!40066 e!258144))

(declare-fun tp_is_empty!11485 () Bool)

(assert (=> start!40066 tp_is_empty!11485))

(assert (=> start!40066 tp!36528))

(assert (=> start!40066 true))

(declare-fun e!258142 () Bool)

(declare-fun array_inv!9330 (array!26789) Bool)

(assert (=> start!40066 (and (array_inv!9330 _values!549) e!258142)))

(declare-fun array_inv!9331 (array!26791) Bool)

(assert (=> start!40066 (array_inv!9331 _keys!709)))

(declare-fun b!437355 () Bool)

(assert (=> b!437355 (= e!258138 tp_is_empty!11485)))

(declare-fun b!437356 () Bool)

(declare-fun res!257988 () Bool)

(assert (=> b!437356 (=> (not res!257988) (not e!258144))))

(declare-fun arrayContainsKey!0 (array!26791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437356 (= res!257988 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!437357 () Bool)

(declare-fun res!257985 () Bool)

(assert (=> b!437357 (=> (not res!257985) (not e!258144))))

(assert (=> b!437357 (= res!257985 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13197 _keys!709))))))

(declare-fun b!437358 () Bool)

(declare-fun e!258140 () Bool)

(assert (=> b!437358 (= e!258140 tp_is_empty!11485)))

(declare-fun mapIsEmpty!18849 () Bool)

(assert (=> mapIsEmpty!18849 mapRes!18849))

(declare-fun b!437359 () Bool)

(declare-fun res!257993 () Bool)

(assert (=> b!437359 (=> (not res!257993) (not e!258144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437359 (= res!257993 (validMask!0 mask!1025))))

(declare-fun b!437360 () Bool)

(declare-fun res!257996 () Bool)

(assert (=> b!437360 (=> (not res!257996) (not e!258144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437360 (= res!257996 (validKeyInArray!0 k!794))))

(declare-fun b!437361 () Bool)

(declare-fun res!257990 () Bool)

(assert (=> b!437361 (=> (not res!257990) (not e!258139))))

(assert (=> b!437361 (= res!257990 (arrayNoDuplicates!0 lt!201619 #b00000000000000000000000000000000 Nil!7666))))

(declare-fun b!437362 () Bool)

(assert (=> b!437362 (= e!258142 (and e!258140 mapRes!18849))))

(declare-fun condMapEmpty!18849 () Bool)

(declare-fun mapDefault!18849 () ValueCell!5399)

