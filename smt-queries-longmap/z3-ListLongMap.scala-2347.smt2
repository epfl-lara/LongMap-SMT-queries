; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37546 () Bool)

(assert start!37546)

(declare-fun b_free!8673 () Bool)

(declare-fun b_next!8673 () Bool)

(assert (=> start!37546 (= b_free!8673 (not b_next!8673))))

(declare-fun tp!30734 () Bool)

(declare-fun b_and!15915 () Bool)

(assert (=> start!37546 (= tp!30734 b_and!15915)))

(declare-fun b!383410 () Bool)

(declare-fun e!232889 () Bool)

(assert (=> b!383410 (= e!232889 true)))

(declare-datatypes ((V!13533 0))(
  ( (V!13534 (val!4705 Int)) )
))
(declare-datatypes ((tuple2!6328 0))(
  ( (tuple2!6329 (_1!3175 (_ BitVec 64)) (_2!3175 V!13533)) )
))
(declare-datatypes ((List!6163 0))(
  ( (Nil!6160) (Cons!6159 (h!7015 tuple2!6328) (t!11313 List!6163)) )
))
(declare-datatypes ((ListLongMap!5241 0))(
  ( (ListLongMap!5242 (toList!2636 List!6163)) )
))
(declare-fun lt!180097 () ListLongMap!5241)

(declare-fun lt!180101 () ListLongMap!5241)

(declare-fun lt!180099 () tuple2!6328)

(declare-fun +!971 (ListLongMap!5241 tuple2!6328) ListLongMap!5241)

(assert (=> b!383410 (= lt!180097 (+!971 lt!180101 lt!180099))))

(declare-fun lt!180093 () ListLongMap!5241)

(declare-fun lt!180100 () ListLongMap!5241)

(assert (=> b!383410 (= lt!180093 lt!180100)))

(declare-fun mapIsEmpty!15546 () Bool)

(declare-fun mapRes!15546 () Bool)

(assert (=> mapIsEmpty!15546 mapRes!15546))

(declare-fun b!383411 () Bool)

(declare-fun res!218294 () Bool)

(declare-fun e!232888 () Bool)

(assert (=> b!383411 (=> (not res!218294) (not e!232888))))

(declare-datatypes ((array!22549 0))(
  ( (array!22550 (arr!10743 (Array (_ BitVec 32) (_ BitVec 64))) (size!11095 (_ BitVec 32))) )
))
(declare-fun lt!180096 () array!22549)

(declare-datatypes ((List!6164 0))(
  ( (Nil!6161) (Cons!6160 (h!7016 (_ BitVec 64)) (t!11314 List!6164)) )
))
(declare-fun arrayNoDuplicates!0 (array!22549 (_ BitVec 32) List!6164) Bool)

(assert (=> b!383411 (= res!218294 (arrayNoDuplicates!0 lt!180096 #b00000000000000000000000000000000 Nil!6161))))

(declare-fun b!383412 () Bool)

(declare-fun res!218288 () Bool)

(declare-fun e!232887 () Bool)

(assert (=> b!383412 (=> (not res!218288) (not e!232887))))

(declare-fun _keys!658 () array!22549)

(assert (=> b!383412 (= res!218288 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6161))))

(declare-fun b!383413 () Bool)

(assert (=> b!383413 (= e!232887 e!232888)))

(declare-fun res!218290 () Bool)

(assert (=> b!383413 (=> (not res!218290) (not e!232888))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22549 (_ BitVec 32)) Bool)

(assert (=> b!383413 (= res!218290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180096 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383413 (= lt!180096 (array!22550 (store (arr!10743 _keys!658) i!548 k0!778) (size!11095 _keys!658)))))

(declare-fun b!383414 () Bool)

(declare-fun res!218297 () Bool)

(assert (=> b!383414 (=> (not res!218297) (not e!232887))))

(assert (=> b!383414 (= res!218297 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11095 _keys!658))))))

(declare-fun res!218295 () Bool)

(assert (=> start!37546 (=> (not res!218295) (not e!232887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37546 (= res!218295 (validMask!0 mask!970))))

(assert (=> start!37546 e!232887))

(declare-datatypes ((ValueCell!4317 0))(
  ( (ValueCellFull!4317 (v!6902 V!13533)) (EmptyCell!4317) )
))
(declare-datatypes ((array!22551 0))(
  ( (array!22552 (arr!10744 (Array (_ BitVec 32) ValueCell!4317)) (size!11096 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22551)

(declare-fun e!232891 () Bool)

(declare-fun array_inv!7906 (array!22551) Bool)

(assert (=> start!37546 (and (array_inv!7906 _values!506) e!232891)))

(assert (=> start!37546 tp!30734))

(assert (=> start!37546 true))

(declare-fun tp_is_empty!9321 () Bool)

(assert (=> start!37546 tp_is_empty!9321))

(declare-fun array_inv!7907 (array!22549) Bool)

(assert (=> start!37546 (array_inv!7907 _keys!658)))

(declare-fun b!383415 () Bool)

(declare-fun e!232890 () Bool)

(assert (=> b!383415 (= e!232890 tp_is_empty!9321)))

(declare-fun b!383416 () Bool)

(declare-fun res!218296 () Bool)

(assert (=> b!383416 (=> (not res!218296) (not e!232887))))

(assert (=> b!383416 (= res!218296 (or (= (select (arr!10743 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10743 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383417 () Bool)

(declare-fun e!232892 () Bool)

(assert (=> b!383417 (= e!232892 tp_is_empty!9321)))

(declare-fun b!383418 () Bool)

(declare-fun res!218287 () Bool)

(assert (=> b!383418 (=> (not res!218287) (not e!232887))))

(declare-fun arrayContainsKey!0 (array!22549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383418 (= res!218287 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383419 () Bool)

(declare-fun res!218291 () Bool)

(assert (=> b!383419 (=> (not res!218291) (not e!232887))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383419 (= res!218291 (and (= (size!11096 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11095 _keys!658) (size!11096 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15546 () Bool)

(declare-fun tp!30735 () Bool)

(assert (=> mapNonEmpty!15546 (= mapRes!15546 (and tp!30735 e!232892))))

(declare-fun mapKey!15546 () (_ BitVec 32))

(declare-fun mapRest!15546 () (Array (_ BitVec 32) ValueCell!4317))

(declare-fun mapValue!15546 () ValueCell!4317)

(assert (=> mapNonEmpty!15546 (= (arr!10744 _values!506) (store mapRest!15546 mapKey!15546 mapValue!15546))))

(declare-fun b!383420 () Bool)

(assert (=> b!383420 (= e!232888 (not e!232889))))

(declare-fun res!218289 () Bool)

(assert (=> b!383420 (=> res!218289 e!232889)))

(declare-fun lt!180094 () Bool)

(assert (=> b!383420 (= res!218289 (or (and (not lt!180094) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180094) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180094)))))

(assert (=> b!383420 (= lt!180094 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13533)

(declare-fun minValue!472 () V!13533)

(declare-fun getCurrentListMap!2041 (array!22549 array!22551 (_ BitVec 32) (_ BitVec 32) V!13533 V!13533 (_ BitVec 32) Int) ListLongMap!5241)

(assert (=> b!383420 (= lt!180101 (getCurrentListMap!2041 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180092 () array!22551)

(assert (=> b!383420 (= lt!180093 (getCurrentListMap!2041 lt!180096 lt!180092 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180102 () ListLongMap!5241)

(assert (=> b!383420 (and (= lt!180100 lt!180102) (= lt!180102 lt!180100))))

(declare-fun lt!180095 () ListLongMap!5241)

(assert (=> b!383420 (= lt!180102 (+!971 lt!180095 lt!180099))))

(declare-fun v!373 () V!13533)

(assert (=> b!383420 (= lt!180099 (tuple2!6329 k0!778 v!373))))

(declare-datatypes ((Unit!11836 0))(
  ( (Unit!11837) )
))
(declare-fun lt!180098 () Unit!11836)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!199 (array!22549 array!22551 (_ BitVec 32) (_ BitVec 32) V!13533 V!13533 (_ BitVec 32) (_ BitVec 64) V!13533 (_ BitVec 32) Int) Unit!11836)

(assert (=> b!383420 (= lt!180098 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!199 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!875 (array!22549 array!22551 (_ BitVec 32) (_ BitVec 32) V!13533 V!13533 (_ BitVec 32) Int) ListLongMap!5241)

(assert (=> b!383420 (= lt!180100 (getCurrentListMapNoExtraKeys!875 lt!180096 lt!180092 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383420 (= lt!180092 (array!22552 (store (arr!10744 _values!506) i!548 (ValueCellFull!4317 v!373)) (size!11096 _values!506)))))

(assert (=> b!383420 (= lt!180095 (getCurrentListMapNoExtraKeys!875 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383421 () Bool)

(declare-fun res!218293 () Bool)

(assert (=> b!383421 (=> (not res!218293) (not e!232887))))

(assert (=> b!383421 (= res!218293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383422 () Bool)

(assert (=> b!383422 (= e!232891 (and e!232890 mapRes!15546))))

(declare-fun condMapEmpty!15546 () Bool)

(declare-fun mapDefault!15546 () ValueCell!4317)

(assert (=> b!383422 (= condMapEmpty!15546 (= (arr!10744 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4317)) mapDefault!15546)))))

(declare-fun b!383423 () Bool)

(declare-fun res!218292 () Bool)

(assert (=> b!383423 (=> (not res!218292) (not e!232887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383423 (= res!218292 (validKeyInArray!0 k0!778))))

(assert (= (and start!37546 res!218295) b!383419))

(assert (= (and b!383419 res!218291) b!383421))

(assert (= (and b!383421 res!218293) b!383412))

(assert (= (and b!383412 res!218288) b!383414))

(assert (= (and b!383414 res!218297) b!383423))

(assert (= (and b!383423 res!218292) b!383416))

(assert (= (and b!383416 res!218296) b!383418))

(assert (= (and b!383418 res!218287) b!383413))

(assert (= (and b!383413 res!218290) b!383411))

(assert (= (and b!383411 res!218294) b!383420))

(assert (= (and b!383420 (not res!218289)) b!383410))

(assert (= (and b!383422 condMapEmpty!15546) mapIsEmpty!15546))

(assert (= (and b!383422 (not condMapEmpty!15546)) mapNonEmpty!15546))

(get-info :version)

(assert (= (and mapNonEmpty!15546 ((_ is ValueCellFull!4317) mapValue!15546)) b!383417))

(assert (= (and b!383422 ((_ is ValueCellFull!4317) mapDefault!15546)) b!383415))

(assert (= start!37546 b!383422))

(declare-fun m!380155 () Bool)

(assert (=> b!383413 m!380155))

(declare-fun m!380157 () Bool)

(assert (=> b!383413 m!380157))

(declare-fun m!380159 () Bool)

(assert (=> b!383420 m!380159))

(declare-fun m!380161 () Bool)

(assert (=> b!383420 m!380161))

(declare-fun m!380163 () Bool)

(assert (=> b!383420 m!380163))

(declare-fun m!380165 () Bool)

(assert (=> b!383420 m!380165))

(declare-fun m!380167 () Bool)

(assert (=> b!383420 m!380167))

(declare-fun m!380169 () Bool)

(assert (=> b!383420 m!380169))

(declare-fun m!380171 () Bool)

(assert (=> b!383420 m!380171))

(declare-fun m!380173 () Bool)

(assert (=> start!37546 m!380173))

(declare-fun m!380175 () Bool)

(assert (=> start!37546 m!380175))

(declare-fun m!380177 () Bool)

(assert (=> start!37546 m!380177))

(declare-fun m!380179 () Bool)

(assert (=> b!383412 m!380179))

(declare-fun m!380181 () Bool)

(assert (=> b!383411 m!380181))

(declare-fun m!380183 () Bool)

(assert (=> b!383418 m!380183))

(declare-fun m!380185 () Bool)

(assert (=> mapNonEmpty!15546 m!380185))

(declare-fun m!380187 () Bool)

(assert (=> b!383423 m!380187))

(declare-fun m!380189 () Bool)

(assert (=> b!383416 m!380189))

(declare-fun m!380191 () Bool)

(assert (=> b!383421 m!380191))

(declare-fun m!380193 () Bool)

(assert (=> b!383410 m!380193))

(check-sat tp_is_empty!9321 (not b!383413) (not mapNonEmpty!15546) (not b!383410) (not b!383412) (not b!383411) (not start!37546) (not b_next!8673) (not b!383421) (not b!383423) (not b!383418) b_and!15915 (not b!383420))
(check-sat b_and!15915 (not b_next!8673))
