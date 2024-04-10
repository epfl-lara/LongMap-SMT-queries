; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39726 () Bool)

(assert start!39726)

(declare-fun b_free!9993 () Bool)

(declare-fun b_next!9993 () Bool)

(assert (=> start!39726 (= b_free!9993 (not b_next!9993))))

(declare-fun tp!35508 () Bool)

(declare-fun b_and!17649 () Bool)

(assert (=> start!39726 (= tp!35508 b_and!17649)))

(declare-fun b!427252 () Bool)

(declare-fun e!253360 () Bool)

(declare-fun e!253359 () Bool)

(assert (=> b!427252 (= e!253360 (not e!253359))))

(declare-fun res!250565 () Bool)

(assert (=> b!427252 (=> res!250565 e!253359)))

(declare-datatypes ((array!26127 0))(
  ( (array!26128 (arr!12513 (Array (_ BitVec 32) (_ BitVec 64))) (size!12865 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26127)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427252 (= res!250565 (not (validKeyInArray!0 (select (arr!12513 _keys!709) from!863))))))

(declare-datatypes ((V!15965 0))(
  ( (V!15966 (val!5617 Int)) )
))
(declare-fun minValue!515 () V!15965)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5229 0))(
  ( (ValueCellFull!5229 (v!7864 V!15965)) (EmptyCell!5229) )
))
(declare-datatypes ((array!26129 0))(
  ( (array!26130 (arr!12514 (Array (_ BitVec 32) ValueCell!5229)) (size!12866 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26129)

(declare-fun zeroValue!515 () V!15965)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15965)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!195215 () array!26129)

(declare-fun lt!195214 () array!26127)

(declare-datatypes ((tuple2!7380 0))(
  ( (tuple2!7381 (_1!3701 (_ BitVec 64)) (_2!3701 V!15965)) )
))
(declare-datatypes ((List!7396 0))(
  ( (Nil!7393) (Cons!7392 (h!8248 tuple2!7380) (t!12840 List!7396)) )
))
(declare-datatypes ((ListLongMap!6293 0))(
  ( (ListLongMap!6294 (toList!3162 List!7396)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1366 (array!26127 array!26129 (_ BitVec 32) (_ BitVec 32) V!15965 V!15965 (_ BitVec 32) Int) ListLongMap!6293)

(declare-fun +!1317 (ListLongMap!6293 tuple2!7380) ListLongMap!6293)

(assert (=> b!427252 (= (getCurrentListMapNoExtraKeys!1366 lt!195214 lt!195215 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1317 (getCurrentListMapNoExtraKeys!1366 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7381 k0!794 v!412)))))

(declare-datatypes ((Unit!12536 0))(
  ( (Unit!12537) )
))
(declare-fun lt!195218 () Unit!12536)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!512 (array!26127 array!26129 (_ BitVec 32) (_ BitVec 32) V!15965 V!15965 (_ BitVec 32) (_ BitVec 64) V!15965 (_ BitVec 32) Int) Unit!12536)

(assert (=> b!427252 (= lt!195218 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!512 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427253 () Bool)

(declare-fun res!250561 () Bool)

(declare-fun e!253362 () Bool)

(assert (=> b!427253 (=> (not res!250561) (not e!253362))))

(assert (=> b!427253 (= res!250561 (bvsle from!863 i!563))))

(declare-fun b!427254 () Bool)

(declare-fun res!250567 () Bool)

(declare-fun e!253365 () Bool)

(assert (=> b!427254 (=> (not res!250567) (not e!253365))))

(declare-datatypes ((List!7397 0))(
  ( (Nil!7394) (Cons!7393 (h!8249 (_ BitVec 64)) (t!12841 List!7397)) )
))
(declare-fun arrayNoDuplicates!0 (array!26127 (_ BitVec 32) List!7397) Bool)

(assert (=> b!427254 (= res!250567 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7394))))

(declare-fun b!427255 () Bool)

(assert (=> b!427255 (= e!253362 e!253360)))

(declare-fun res!250569 () Bool)

(assert (=> b!427255 (=> (not res!250569) (not e!253360))))

(assert (=> b!427255 (= res!250569 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195216 () ListLongMap!6293)

(assert (=> b!427255 (= lt!195216 (getCurrentListMapNoExtraKeys!1366 lt!195214 lt!195215 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!427255 (= lt!195215 (array!26130 (store (arr!12514 _values!549) i!563 (ValueCellFull!5229 v!412)) (size!12866 _values!549)))))

(declare-fun lt!195217 () ListLongMap!6293)

(assert (=> b!427255 (= lt!195217 (getCurrentListMapNoExtraKeys!1366 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427256 () Bool)

(declare-fun e!253363 () Bool)

(declare-fun tp_is_empty!11145 () Bool)

(assert (=> b!427256 (= e!253363 tp_is_empty!11145)))

(declare-fun b!427257 () Bool)

(declare-fun res!250564 () Bool)

(assert (=> b!427257 (=> (not res!250564) (not e!253362))))

(assert (=> b!427257 (= res!250564 (arrayNoDuplicates!0 lt!195214 #b00000000000000000000000000000000 Nil!7394))))

(declare-fun b!427258 () Bool)

(declare-fun res!250571 () Bool)

(assert (=> b!427258 (=> (not res!250571) (not e!253365))))

(assert (=> b!427258 (= res!250571 (validKeyInArray!0 k0!794))))

(declare-fun b!427259 () Bool)

(declare-fun res!250568 () Bool)

(assert (=> b!427259 (=> (not res!250568) (not e!253365))))

(assert (=> b!427259 (= res!250568 (or (= (select (arr!12513 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12513 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427260 () Bool)

(declare-fun res!250559 () Bool)

(assert (=> b!427260 (=> (not res!250559) (not e!253365))))

(assert (=> b!427260 (= res!250559 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12865 _keys!709))))))

(declare-fun b!427261 () Bool)

(assert (=> b!427261 (= e!253365 e!253362)))

(declare-fun res!250562 () Bool)

(assert (=> b!427261 (=> (not res!250562) (not e!253362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26127 (_ BitVec 32)) Bool)

(assert (=> b!427261 (= res!250562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195214 mask!1025))))

(assert (=> b!427261 (= lt!195214 (array!26128 (store (arr!12513 _keys!709) i!563 k0!794) (size!12865 _keys!709)))))

(declare-fun b!427262 () Bool)

(assert (=> b!427262 (= e!253359 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12865 _keys!709))))))

(declare-fun b!427263 () Bool)

(declare-fun e!253358 () Bool)

(assert (=> b!427263 (= e!253358 tp_is_empty!11145)))

(declare-fun mapIsEmpty!18339 () Bool)

(declare-fun mapRes!18339 () Bool)

(assert (=> mapIsEmpty!18339 mapRes!18339))

(declare-fun res!250563 () Bool)

(assert (=> start!39726 (=> (not res!250563) (not e!253365))))

(assert (=> start!39726 (= res!250563 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12865 _keys!709))))))

(assert (=> start!39726 e!253365))

(assert (=> start!39726 tp_is_empty!11145))

(assert (=> start!39726 tp!35508))

(assert (=> start!39726 true))

(declare-fun e!253364 () Bool)

(declare-fun array_inv!9118 (array!26129) Bool)

(assert (=> start!39726 (and (array_inv!9118 _values!549) e!253364)))

(declare-fun array_inv!9119 (array!26127) Bool)

(assert (=> start!39726 (array_inv!9119 _keys!709)))

(declare-fun b!427264 () Bool)

(declare-fun res!250572 () Bool)

(assert (=> b!427264 (=> (not res!250572) (not e!253365))))

(assert (=> b!427264 (= res!250572 (and (= (size!12866 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12865 _keys!709) (size!12866 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427265 () Bool)

(declare-fun res!250560 () Bool)

(assert (=> b!427265 (=> (not res!250560) (not e!253365))))

(declare-fun arrayContainsKey!0 (array!26127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427265 (= res!250560 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18339 () Bool)

(declare-fun tp!35507 () Bool)

(assert (=> mapNonEmpty!18339 (= mapRes!18339 (and tp!35507 e!253358))))

(declare-fun mapValue!18339 () ValueCell!5229)

(declare-fun mapKey!18339 () (_ BitVec 32))

(declare-fun mapRest!18339 () (Array (_ BitVec 32) ValueCell!5229))

(assert (=> mapNonEmpty!18339 (= (arr!12514 _values!549) (store mapRest!18339 mapKey!18339 mapValue!18339))))

(declare-fun b!427266 () Bool)

(declare-fun res!250566 () Bool)

(assert (=> b!427266 (=> (not res!250566) (not e!253365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427266 (= res!250566 (validMask!0 mask!1025))))

(declare-fun b!427267 () Bool)

(declare-fun res!250570 () Bool)

(assert (=> b!427267 (=> (not res!250570) (not e!253365))))

(assert (=> b!427267 (= res!250570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427268 () Bool)

(assert (=> b!427268 (= e!253364 (and e!253363 mapRes!18339))))

(declare-fun condMapEmpty!18339 () Bool)

(declare-fun mapDefault!18339 () ValueCell!5229)

(assert (=> b!427268 (= condMapEmpty!18339 (= (arr!12514 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5229)) mapDefault!18339)))))

(assert (= (and start!39726 res!250563) b!427266))

(assert (= (and b!427266 res!250566) b!427264))

(assert (= (and b!427264 res!250572) b!427267))

(assert (= (and b!427267 res!250570) b!427254))

(assert (= (and b!427254 res!250567) b!427260))

(assert (= (and b!427260 res!250559) b!427258))

(assert (= (and b!427258 res!250571) b!427259))

(assert (= (and b!427259 res!250568) b!427265))

(assert (= (and b!427265 res!250560) b!427261))

(assert (= (and b!427261 res!250562) b!427257))

(assert (= (and b!427257 res!250564) b!427253))

(assert (= (and b!427253 res!250561) b!427255))

(assert (= (and b!427255 res!250569) b!427252))

(assert (= (and b!427252 (not res!250565)) b!427262))

(assert (= (and b!427268 condMapEmpty!18339) mapIsEmpty!18339))

(assert (= (and b!427268 (not condMapEmpty!18339)) mapNonEmpty!18339))

(get-info :version)

(assert (= (and mapNonEmpty!18339 ((_ is ValueCellFull!5229) mapValue!18339)) b!427263))

(assert (= (and b!427268 ((_ is ValueCellFull!5229) mapDefault!18339)) b!427256))

(assert (= start!39726 b!427268))

(declare-fun m!415773 () Bool)

(assert (=> b!427254 m!415773))

(declare-fun m!415775 () Bool)

(assert (=> b!427252 m!415775))

(declare-fun m!415777 () Bool)

(assert (=> b!427252 m!415777))

(declare-fun m!415779 () Bool)

(assert (=> b!427252 m!415779))

(assert (=> b!427252 m!415779))

(declare-fun m!415781 () Bool)

(assert (=> b!427252 m!415781))

(assert (=> b!427252 m!415775))

(declare-fun m!415783 () Bool)

(assert (=> b!427252 m!415783))

(declare-fun m!415785 () Bool)

(assert (=> b!427252 m!415785))

(declare-fun m!415787 () Bool)

(assert (=> start!39726 m!415787))

(declare-fun m!415789 () Bool)

(assert (=> start!39726 m!415789))

(declare-fun m!415791 () Bool)

(assert (=> b!427258 m!415791))

(declare-fun m!415793 () Bool)

(assert (=> b!427257 m!415793))

(declare-fun m!415795 () Bool)

(assert (=> b!427261 m!415795))

(declare-fun m!415797 () Bool)

(assert (=> b!427261 m!415797))

(declare-fun m!415799 () Bool)

(assert (=> b!427265 m!415799))

(declare-fun m!415801 () Bool)

(assert (=> b!427266 m!415801))

(declare-fun m!415803 () Bool)

(assert (=> b!427267 m!415803))

(declare-fun m!415805 () Bool)

(assert (=> b!427259 m!415805))

(declare-fun m!415807 () Bool)

(assert (=> mapNonEmpty!18339 m!415807))

(declare-fun m!415809 () Bool)

(assert (=> b!427255 m!415809))

(declare-fun m!415811 () Bool)

(assert (=> b!427255 m!415811))

(declare-fun m!415813 () Bool)

(assert (=> b!427255 m!415813))

(check-sat b_and!17649 (not b!427252) (not b!427261) (not b_next!9993) (not b!427255) tp_is_empty!11145 (not start!39726) (not b!427267) (not b!427254) (not b!427257) (not mapNonEmpty!18339) (not b!427258) (not b!427265) (not b!427266))
(check-sat b_and!17649 (not b_next!9993))
