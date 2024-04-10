; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41050 () Bool)

(assert start!41050)

(declare-fun b_free!10963 () Bool)

(declare-fun b_next!10963 () Bool)

(assert (=> start!41050 (= b_free!10963 (not b_next!10963))))

(declare-fun tp!38718 () Bool)

(declare-fun b_and!19133 () Bool)

(assert (=> start!41050 (= tp!38718 b_and!19133)))

(declare-fun b!457561 () Bool)

(declare-fun res!273234 () Bool)

(declare-fun e!267229 () Bool)

(assert (=> b!457561 (=> (not res!273234) (not e!267229))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457561 (= res!273234 (validKeyInArray!0 k!794))))

(declare-fun res!273222 () Bool)

(assert (=> start!41050 (=> (not res!273222) (not e!267229))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28403 0))(
  ( (array!28404 (arr!13644 (Array (_ BitVec 32) (_ BitVec 64))) (size!13996 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28403)

(assert (=> start!41050 (= res!273222 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13996 _keys!709))))))

(assert (=> start!41050 e!267229))

(declare-fun tp_is_empty!12301 () Bool)

(assert (=> start!41050 tp_is_empty!12301))

(assert (=> start!41050 tp!38718))

(assert (=> start!41050 true))

(declare-datatypes ((V!17507 0))(
  ( (V!17508 (val!6195 Int)) )
))
(declare-datatypes ((ValueCell!5807 0))(
  ( (ValueCellFull!5807 (v!8465 V!17507)) (EmptyCell!5807) )
))
(declare-datatypes ((array!28405 0))(
  ( (array!28406 (arr!13645 (Array (_ BitVec 32) ValueCell!5807)) (size!13997 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28405)

(declare-fun e!267233 () Bool)

(declare-fun array_inv!9880 (array!28405) Bool)

(assert (=> start!41050 (and (array_inv!9880 _values!549) e!267233)))

(declare-fun array_inv!9881 (array!28403) Bool)

(assert (=> start!41050 (array_inv!9881 _keys!709)))

(declare-fun b!457562 () Bool)

(declare-fun e!267231 () Bool)

(assert (=> b!457562 (= e!267231 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8160 0))(
  ( (tuple2!8161 (_1!4091 (_ BitVec 64)) (_2!4091 V!17507)) )
))
(declare-datatypes ((List!8233 0))(
  ( (Nil!8230) (Cons!8229 (h!9085 tuple2!8160) (t!14075 List!8233)) )
))
(declare-datatypes ((ListLongMap!7073 0))(
  ( (ListLongMap!7074 (toList!3552 List!8233)) )
))
(declare-fun lt!206970 () ListLongMap!7073)

(declare-fun lt!206969 () ListLongMap!7073)

(declare-fun +!1588 (ListLongMap!7073 tuple2!8160) ListLongMap!7073)

(declare-fun get!6716 (ValueCell!5807 V!17507) V!17507)

(declare-fun dynLambda!878 (Int (_ BitVec 64)) V!17507)

(assert (=> b!457562 (= lt!206969 (+!1588 lt!206970 (tuple2!8161 (select (arr!13644 _keys!709) from!863) (get!6716 (select (arr!13645 _values!549) from!863) (dynLambda!878 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457563 () Bool)

(declare-fun res!273225 () Bool)

(declare-fun e!267227 () Bool)

(assert (=> b!457563 (=> (not res!273225) (not e!267227))))

(declare-fun lt!206975 () array!28403)

(declare-datatypes ((List!8234 0))(
  ( (Nil!8231) (Cons!8230 (h!9086 (_ BitVec 64)) (t!14076 List!8234)) )
))
(declare-fun arrayNoDuplicates!0 (array!28403 (_ BitVec 32) List!8234) Bool)

(assert (=> b!457563 (= res!273225 (arrayNoDuplicates!0 lt!206975 #b00000000000000000000000000000000 Nil!8231))))

(declare-fun b!457564 () Bool)

(declare-fun res!273224 () Bool)

(assert (=> b!457564 (=> (not res!273224) (not e!267229))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457564 (= res!273224 (validMask!0 mask!1025))))

(declare-fun b!457565 () Bool)

(declare-fun res!273223 () Bool)

(assert (=> b!457565 (=> (not res!273223) (not e!267227))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457565 (= res!273223 (bvsle from!863 i!563))))

(declare-fun b!457566 () Bool)

(declare-fun e!267234 () Bool)

(assert (=> b!457566 (= e!267234 tp_is_empty!12301)))

(declare-fun b!457567 () Bool)

(declare-fun res!273232 () Bool)

(assert (=> b!457567 (=> (not res!273232) (not e!267229))))

(assert (=> b!457567 (= res!273232 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13996 _keys!709))))))

(declare-fun b!457568 () Bool)

(declare-fun e!267230 () Bool)

(assert (=> b!457568 (= e!267227 e!267230)))

(declare-fun res!273229 () Bool)

(assert (=> b!457568 (=> (not res!273229) (not e!267230))))

(assert (=> b!457568 (= res!273229 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17507)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!206971 () array!28405)

(declare-fun zeroValue!515 () V!17507)

(declare-fun getCurrentListMapNoExtraKeys!1735 (array!28403 array!28405 (_ BitVec 32) (_ BitVec 32) V!17507 V!17507 (_ BitVec 32) Int) ListLongMap!7073)

(assert (=> b!457568 (= lt!206969 (getCurrentListMapNoExtraKeys!1735 lt!206975 lt!206971 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17507)

(assert (=> b!457568 (= lt!206971 (array!28406 (store (arr!13645 _values!549) i!563 (ValueCellFull!5807 v!412)) (size!13997 _values!549)))))

(declare-fun lt!206972 () ListLongMap!7073)

(assert (=> b!457568 (= lt!206972 (getCurrentListMapNoExtraKeys!1735 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457569 () Bool)

(assert (=> b!457569 (= e!267230 (not e!267231))))

(declare-fun res!273226 () Bool)

(assert (=> b!457569 (=> res!273226 e!267231)))

(assert (=> b!457569 (= res!273226 (not (validKeyInArray!0 (select (arr!13644 _keys!709) from!863))))))

(declare-fun lt!206974 () ListLongMap!7073)

(assert (=> b!457569 (= lt!206974 lt!206970)))

(declare-fun lt!206976 () ListLongMap!7073)

(assert (=> b!457569 (= lt!206970 (+!1588 lt!206976 (tuple2!8161 k!794 v!412)))))

(assert (=> b!457569 (= lt!206974 (getCurrentListMapNoExtraKeys!1735 lt!206975 lt!206971 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457569 (= lt!206976 (getCurrentListMapNoExtraKeys!1735 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13298 0))(
  ( (Unit!13299) )
))
(declare-fun lt!206973 () Unit!13298)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!748 (array!28403 array!28405 (_ BitVec 32) (_ BitVec 32) V!17507 V!17507 (_ BitVec 32) (_ BitVec 64) V!17507 (_ BitVec 32) Int) Unit!13298)

(assert (=> b!457569 (= lt!206973 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!748 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457570 () Bool)

(assert (=> b!457570 (= e!267229 e!267227)))

(declare-fun res!273231 () Bool)

(assert (=> b!457570 (=> (not res!273231) (not e!267227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28403 (_ BitVec 32)) Bool)

(assert (=> b!457570 (= res!273231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206975 mask!1025))))

(assert (=> b!457570 (= lt!206975 (array!28404 (store (arr!13644 _keys!709) i!563 k!794) (size!13996 _keys!709)))))

(declare-fun b!457571 () Bool)

(declare-fun res!273221 () Bool)

(assert (=> b!457571 (=> (not res!273221) (not e!267229))))

(assert (=> b!457571 (= res!273221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457572 () Bool)

(declare-fun e!267228 () Bool)

(assert (=> b!457572 (= e!267228 tp_is_empty!12301)))

(declare-fun b!457573 () Bool)

(declare-fun res!273230 () Bool)

(assert (=> b!457573 (=> (not res!273230) (not e!267229))))

(assert (=> b!457573 (= res!273230 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8231))))

(declare-fun b!457574 () Bool)

(declare-fun res!273233 () Bool)

(assert (=> b!457574 (=> (not res!273233) (not e!267229))))

(assert (=> b!457574 (= res!273233 (and (= (size!13997 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13996 _keys!709) (size!13997 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457575 () Bool)

(declare-fun res!273227 () Bool)

(assert (=> b!457575 (=> (not res!273227) (not e!267229))))

(assert (=> b!457575 (= res!273227 (or (= (select (arr!13644 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13644 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20095 () Bool)

(declare-fun mapRes!20095 () Bool)

(assert (=> mapIsEmpty!20095 mapRes!20095))

(declare-fun mapNonEmpty!20095 () Bool)

(declare-fun tp!38719 () Bool)

(assert (=> mapNonEmpty!20095 (= mapRes!20095 (and tp!38719 e!267228))))

(declare-fun mapValue!20095 () ValueCell!5807)

(declare-fun mapKey!20095 () (_ BitVec 32))

(declare-fun mapRest!20095 () (Array (_ BitVec 32) ValueCell!5807))

(assert (=> mapNonEmpty!20095 (= (arr!13645 _values!549) (store mapRest!20095 mapKey!20095 mapValue!20095))))

(declare-fun b!457576 () Bool)

(declare-fun res!273228 () Bool)

(assert (=> b!457576 (=> (not res!273228) (not e!267229))))

(declare-fun arrayContainsKey!0 (array!28403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457576 (= res!273228 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!457577 () Bool)

(assert (=> b!457577 (= e!267233 (and e!267234 mapRes!20095))))

(declare-fun condMapEmpty!20095 () Bool)

(declare-fun mapDefault!20095 () ValueCell!5807)

