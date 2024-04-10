; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38160 () Bool)

(assert start!38160)

(declare-fun b_free!9041 () Bool)

(declare-fun b_next!9041 () Bool)

(assert (=> start!38160 (= b_free!9041 (not b_next!9041))))

(declare-fun tp!31905 () Bool)

(declare-fun b_and!16403 () Bool)

(assert (=> start!38160 (= tp!31905 b_and!16403)))

(declare-fun b!393418 () Bool)

(declare-fun res!225416 () Bool)

(declare-fun e!238195 () Bool)

(assert (=> b!393418 (=> (not res!225416) (not e!238195))))

(declare-datatypes ((array!23331 0))(
  ( (array!23332 (arr!11124 (Array (_ BitVec 32) (_ BitVec 64))) (size!11476 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23331)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393418 (= res!225416 (or (= (select (arr!11124 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11124 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393419 () Bool)

(declare-fun res!225414 () Bool)

(assert (=> b!393419 (=> (not res!225414) (not e!238195))))

(assert (=> b!393419 (= res!225414 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11476 _keys!658))))))

(declare-fun b!393420 () Bool)

(declare-fun res!225417 () Bool)

(assert (=> b!393420 (=> (not res!225417) (not e!238195))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393420 (= res!225417 (validKeyInArray!0 k!778))))

(declare-fun b!393421 () Bool)

(declare-fun res!225420 () Bool)

(assert (=> b!393421 (=> (not res!225420) (not e!238195))))

(declare-fun arrayContainsKey!0 (array!23331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393421 (= res!225420 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun e!238191 () Bool)

(declare-datatypes ((V!14055 0))(
  ( (V!14056 (val!4901 Int)) )
))
(declare-datatypes ((tuple2!6614 0))(
  ( (tuple2!6615 (_1!3318 (_ BitVec 64)) (_2!3318 V!14055)) )
))
(declare-datatypes ((List!6467 0))(
  ( (Nil!6464) (Cons!6463 (h!7319 tuple2!6614) (t!11637 List!6467)) )
))
(declare-datatypes ((ListLongMap!5527 0))(
  ( (ListLongMap!5528 (toList!2779 List!6467)) )
))
(declare-fun lt!186188 () ListLongMap!5527)

(declare-fun lt!186191 () Bool)

(declare-fun lt!186190 () ListLongMap!5527)

(declare-fun b!393422 () Bool)

(assert (=> b!393422 (= e!238191 (not (or (and (not lt!186191) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186191) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186191) (= lt!186188 lt!186190))))))

(assert (=> b!393422 (= lt!186191 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((ValueCell!4513 0))(
  ( (ValueCellFull!4513 (v!7138 V!14055)) (EmptyCell!4513) )
))
(declare-datatypes ((array!23333 0))(
  ( (array!23334 (arr!11125 (Array (_ BitVec 32) ValueCell!4513)) (size!11477 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23333)

(declare-fun zeroValue!472 () V!14055)

(declare-fun lt!186192 () ListLongMap!5527)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14055)

(declare-fun getCurrentListMap!2120 (array!23331 array!23333 (_ BitVec 32) (_ BitVec 32) V!14055 V!14055 (_ BitVec 32) Int) ListLongMap!5527)

(assert (=> b!393422 (= lt!186192 (getCurrentListMap!2120 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186195 () array!23331)

(declare-fun lt!186194 () array!23333)

(assert (=> b!393422 (= lt!186188 (getCurrentListMap!2120 lt!186195 lt!186194 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186196 () ListLongMap!5527)

(assert (=> b!393422 (and (= lt!186190 lt!186196) (= lt!186196 lt!186190))))

(declare-fun v!373 () V!14055)

(declare-fun lt!186189 () ListLongMap!5527)

(declare-fun +!1074 (ListLongMap!5527 tuple2!6614) ListLongMap!5527)

(assert (=> b!393422 (= lt!186196 (+!1074 lt!186189 (tuple2!6615 k!778 v!373)))))

(declare-datatypes ((Unit!12034 0))(
  ( (Unit!12035) )
))
(declare-fun lt!186193 () Unit!12034)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!284 (array!23331 array!23333 (_ BitVec 32) (_ BitVec 32) V!14055 V!14055 (_ BitVec 32) (_ BitVec 64) V!14055 (_ BitVec 32) Int) Unit!12034)

(assert (=> b!393422 (= lt!186193 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!284 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1000 (array!23331 array!23333 (_ BitVec 32) (_ BitVec 32) V!14055 V!14055 (_ BitVec 32) Int) ListLongMap!5527)

(assert (=> b!393422 (= lt!186190 (getCurrentListMapNoExtraKeys!1000 lt!186195 lt!186194 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393422 (= lt!186194 (array!23334 (store (arr!11125 _values!506) i!548 (ValueCellFull!4513 v!373)) (size!11477 _values!506)))))

(assert (=> b!393422 (= lt!186189 (getCurrentListMapNoExtraKeys!1000 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393423 () Bool)

(declare-fun res!225419 () Bool)

(assert (=> b!393423 (=> (not res!225419) (not e!238195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23331 (_ BitVec 32)) Bool)

(assert (=> b!393423 (= res!225419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393424 () Bool)

(declare-fun res!225411 () Bool)

(assert (=> b!393424 (=> (not res!225411) (not e!238195))))

(assert (=> b!393424 (= res!225411 (and (= (size!11477 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11476 _keys!658) (size!11477 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393425 () Bool)

(declare-fun e!238193 () Bool)

(declare-fun tp_is_empty!9713 () Bool)

(assert (=> b!393425 (= e!238193 tp_is_empty!9713)))

(declare-fun mapNonEmpty!16164 () Bool)

(declare-fun mapRes!16164 () Bool)

(declare-fun tp!31904 () Bool)

(assert (=> mapNonEmpty!16164 (= mapRes!16164 (and tp!31904 e!238193))))

(declare-fun mapValue!16164 () ValueCell!4513)

(declare-fun mapRest!16164 () (Array (_ BitVec 32) ValueCell!4513))

(declare-fun mapKey!16164 () (_ BitVec 32))

(assert (=> mapNonEmpty!16164 (= (arr!11125 _values!506) (store mapRest!16164 mapKey!16164 mapValue!16164))))

(declare-fun mapIsEmpty!16164 () Bool)

(assert (=> mapIsEmpty!16164 mapRes!16164))

(declare-fun b!393427 () Bool)

(declare-fun res!225413 () Bool)

(assert (=> b!393427 (=> (not res!225413) (not e!238195))))

(declare-datatypes ((List!6468 0))(
  ( (Nil!6465) (Cons!6464 (h!7320 (_ BitVec 64)) (t!11638 List!6468)) )
))
(declare-fun arrayNoDuplicates!0 (array!23331 (_ BitVec 32) List!6468) Bool)

(assert (=> b!393427 (= res!225413 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6465))))

(declare-fun b!393428 () Bool)

(declare-fun e!238192 () Bool)

(assert (=> b!393428 (= e!238192 tp_is_empty!9713)))

(declare-fun b!393429 () Bool)

(declare-fun res!225418 () Bool)

(assert (=> b!393429 (=> (not res!225418) (not e!238191))))

(assert (=> b!393429 (= res!225418 (arrayNoDuplicates!0 lt!186195 #b00000000000000000000000000000000 Nil!6465))))

(declare-fun b!393430 () Bool)

(declare-fun e!238190 () Bool)

(assert (=> b!393430 (= e!238190 (and e!238192 mapRes!16164))))

(declare-fun condMapEmpty!16164 () Bool)

(declare-fun mapDefault!16164 () ValueCell!4513)

