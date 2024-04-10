; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38076 () Bool)

(assert start!38076)

(declare-fun b_free!9001 () Bool)

(declare-fun b_next!9001 () Bool)

(assert (=> start!38076 (= b_free!9001 (not b_next!9001))))

(declare-fun tp!31778 () Bool)

(declare-fun b_and!16339 () Bool)

(assert (=> start!38076 (= tp!31778 b_and!16339)))

(declare-fun b!392122 () Bool)

(declare-fun res!224527 () Bool)

(declare-fun e!237469 () Bool)

(assert (=> b!392122 (=> (not res!224527) (not e!237469))))

(declare-datatypes ((array!23251 0))(
  ( (array!23252 (arr!11086 (Array (_ BitVec 32) (_ BitVec 64))) (size!11438 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23251)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23251 (_ BitVec 32)) Bool)

(assert (=> b!392122 (= res!224527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392123 () Bool)

(declare-fun res!224529 () Bool)

(assert (=> b!392123 (=> (not res!224529) (not e!237469))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392123 (= res!224529 (or (= (select (arr!11086 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11086 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392124 () Bool)

(declare-fun res!224526 () Bool)

(assert (=> b!392124 (=> (not res!224526) (not e!237469))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392124 (= res!224526 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!392125 () Bool)

(declare-fun e!237471 () Bool)

(declare-fun tp_is_empty!9673 () Bool)

(assert (=> b!392125 (= e!237471 tp_is_empty!9673)))

(declare-fun b!392126 () Bool)

(declare-fun res!224524 () Bool)

(assert (=> b!392126 (=> (not res!224524) (not e!237469))))

(assert (=> b!392126 (= res!224524 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11438 _keys!658))))))

(declare-fun b!392127 () Bool)

(declare-datatypes ((V!14003 0))(
  ( (V!14004 (val!4881 Int)) )
))
(declare-datatypes ((tuple2!6580 0))(
  ( (tuple2!6581 (_1!3301 (_ BitVec 64)) (_2!3301 V!14003)) )
))
(declare-fun lt!185233 () tuple2!6580)

(declare-datatypes ((List!6434 0))(
  ( (Nil!6431) (Cons!6430 (h!7286 tuple2!6580) (t!11600 List!6434)) )
))
(declare-datatypes ((ListLongMap!5493 0))(
  ( (ListLongMap!5494 (toList!2762 List!6434)) )
))
(declare-fun lt!185231 () ListLongMap!5493)

(declare-fun e!237470 () Bool)

(declare-fun lt!185232 () ListLongMap!5493)

(declare-fun +!1057 (ListLongMap!5493 tuple2!6580) ListLongMap!5493)

(assert (=> b!392127 (= e!237470 (= lt!185231 (+!1057 lt!185232 lt!185233)))))

(declare-fun lt!185235 () ListLongMap!5493)

(assert (=> b!392127 (= lt!185231 (+!1057 lt!185235 lt!185233))))

(declare-fun minValue!472 () V!14003)

(assert (=> b!392127 (= lt!185233 (tuple2!6581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!224521 () Bool)

(assert (=> start!38076 (=> (not res!224521) (not e!237469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38076 (= res!224521 (validMask!0 mask!970))))

(assert (=> start!38076 e!237469))

(declare-datatypes ((ValueCell!4493 0))(
  ( (ValueCellFull!4493 (v!7110 V!14003)) (EmptyCell!4493) )
))
(declare-datatypes ((array!23253 0))(
  ( (array!23254 (arr!11087 (Array (_ BitVec 32) ValueCell!4493)) (size!11439 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23253)

(declare-fun e!237472 () Bool)

(declare-fun array_inv!8144 (array!23253) Bool)

(assert (=> start!38076 (and (array_inv!8144 _values!506) e!237472)))

(assert (=> start!38076 tp!31778))

(assert (=> start!38076 true))

(assert (=> start!38076 tp_is_empty!9673))

(declare-fun array_inv!8145 (array!23251) Bool)

(assert (=> start!38076 (array_inv!8145 _keys!658)))

(declare-fun b!392128 () Bool)

(declare-fun res!224525 () Bool)

(assert (=> b!392128 (=> (not res!224525) (not e!237469))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392128 (= res!224525 (and (= (size!11439 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11438 _keys!658) (size!11439 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392129 () Bool)

(declare-fun res!224523 () Bool)

(assert (=> b!392129 (=> (not res!224523) (not e!237469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392129 (= res!224523 (validKeyInArray!0 k!778))))

(declare-fun b!392130 () Bool)

(declare-fun e!237473 () Bool)

(assert (=> b!392130 (= e!237473 tp_is_empty!9673)))

(declare-fun mapIsEmpty!16098 () Bool)

(declare-fun mapRes!16098 () Bool)

(assert (=> mapIsEmpty!16098 mapRes!16098))

(declare-fun mapNonEmpty!16098 () Bool)

(declare-fun tp!31779 () Bool)

(assert (=> mapNonEmpty!16098 (= mapRes!16098 (and tp!31779 e!237471))))

(declare-fun mapKey!16098 () (_ BitVec 32))

(declare-fun mapValue!16098 () ValueCell!4493)

(declare-fun mapRest!16098 () (Array (_ BitVec 32) ValueCell!4493))

(assert (=> mapNonEmpty!16098 (= (arr!11087 _values!506) (store mapRest!16098 mapKey!16098 mapValue!16098))))

(declare-fun b!392131 () Bool)

(declare-fun e!237474 () Bool)

(assert (=> b!392131 (= e!237474 (not e!237470))))

(declare-fun res!224528 () Bool)

(assert (=> b!392131 (=> res!224528 e!237470)))

(assert (=> b!392131 (= res!224528 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14003)

(declare-fun lt!185238 () ListLongMap!5493)

(declare-fun getCurrentListMap!2104 (array!23251 array!23253 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) Int) ListLongMap!5493)

(assert (=> b!392131 (= lt!185238 (getCurrentListMap!2104 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185237 () array!23251)

(declare-fun lt!185236 () array!23253)

(assert (=> b!392131 (= lt!185231 (getCurrentListMap!2104 lt!185237 lt!185236 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392131 (and (= lt!185235 lt!185232) (= lt!185232 lt!185235))))

(declare-fun v!373 () V!14003)

(declare-fun lt!185230 () ListLongMap!5493)

(assert (=> b!392131 (= lt!185232 (+!1057 lt!185230 (tuple2!6581 k!778 v!373)))))

(declare-datatypes ((Unit!11998 0))(
  ( (Unit!11999) )
))
(declare-fun lt!185234 () Unit!11998)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!268 (array!23251 array!23253 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) (_ BitVec 64) V!14003 (_ BitVec 32) Int) Unit!11998)

(assert (=> b!392131 (= lt!185234 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!268 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!984 (array!23251 array!23253 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) Int) ListLongMap!5493)

(assert (=> b!392131 (= lt!185235 (getCurrentListMapNoExtraKeys!984 lt!185237 lt!185236 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392131 (= lt!185236 (array!23254 (store (arr!11087 _values!506) i!548 (ValueCellFull!4493 v!373)) (size!11439 _values!506)))))

(assert (=> b!392131 (= lt!185230 (getCurrentListMapNoExtraKeys!984 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392132 () Bool)

(assert (=> b!392132 (= e!237472 (and e!237473 mapRes!16098))))

(declare-fun condMapEmpty!16098 () Bool)

(declare-fun mapDefault!16098 () ValueCell!4493)

