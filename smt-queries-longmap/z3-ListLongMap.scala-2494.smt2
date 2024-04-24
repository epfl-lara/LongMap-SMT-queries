; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38768 () Bool)

(assert start!38768)

(declare-fun mapIsEmpty!16923 () Bool)

(declare-fun mapRes!16923 () Bool)

(assert (=> mapIsEmpty!16923 mapRes!16923))

(declare-fun b!404392 () Bool)

(declare-fun res!233239 () Bool)

(declare-fun e!243283 () Bool)

(assert (=> b!404392 (=> (not res!233239) (not e!243283))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404392 (= res!233239 (validMask!0 mask!1025))))

(declare-fun b!404393 () Bool)

(declare-fun e!243286 () Bool)

(assert (=> b!404393 (= e!243283 e!243286)))

(declare-fun res!233244 () Bool)

(assert (=> b!404393 (=> (not res!233244) (not e!243286))))

(declare-datatypes ((array!24284 0))(
  ( (array!24285 (arr!11591 (Array (_ BitVec 32) (_ BitVec 64))) (size!11943 (_ BitVec 32))) )
))
(declare-fun lt!188202 () array!24284)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24284 (_ BitVec 32)) Bool)

(assert (=> b!404393 (= res!233244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188202 mask!1025))))

(declare-fun _keys!709 () array!24284)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404393 (= lt!188202 (array!24285 (store (arr!11591 _keys!709) i!563 k0!794) (size!11943 _keys!709)))))

(declare-fun b!404394 () Bool)

(declare-fun res!233237 () Bool)

(assert (=> b!404394 (=> (not res!233237) (not e!243283))))

(assert (=> b!404394 (= res!233237 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11943 _keys!709))))))

(declare-fun res!233238 () Bool)

(assert (=> start!38768 (=> (not res!233238) (not e!243283))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38768 (= res!233238 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11943 _keys!709))))))

(assert (=> start!38768 e!243283))

(assert (=> start!38768 true))

(declare-datatypes ((V!14707 0))(
  ( (V!14708 (val!5145 Int)) )
))
(declare-datatypes ((ValueCell!4757 0))(
  ( (ValueCellFull!4757 (v!7393 V!14707)) (EmptyCell!4757) )
))
(declare-datatypes ((array!24286 0))(
  ( (array!24287 (arr!11592 (Array (_ BitVec 32) ValueCell!4757)) (size!11944 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24286)

(declare-fun e!243281 () Bool)

(declare-fun array_inv!8556 (array!24286) Bool)

(assert (=> start!38768 (and (array_inv!8556 _values!549) e!243281)))

(declare-fun array_inv!8557 (array!24284) Bool)

(assert (=> start!38768 (array_inv!8557 _keys!709)))

(declare-fun b!404395 () Bool)

(declare-fun res!233235 () Bool)

(assert (=> b!404395 (=> (not res!233235) (not e!243283))))

(assert (=> b!404395 (= res!233235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404396 () Bool)

(declare-fun res!233236 () Bool)

(assert (=> b!404396 (=> (not res!233236) (not e!243283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404396 (= res!233236 (validKeyInArray!0 k0!794))))

(declare-fun b!404397 () Bool)

(declare-fun e!243285 () Bool)

(assert (=> b!404397 (= e!243281 (and e!243285 mapRes!16923))))

(declare-fun condMapEmpty!16923 () Bool)

(declare-fun mapDefault!16923 () ValueCell!4757)

(assert (=> b!404397 (= condMapEmpty!16923 (= (arr!11592 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4757)) mapDefault!16923)))))

(declare-fun mapNonEmpty!16923 () Bool)

(declare-fun tp!33042 () Bool)

(declare-fun e!243284 () Bool)

(assert (=> mapNonEmpty!16923 (= mapRes!16923 (and tp!33042 e!243284))))

(declare-fun mapKey!16923 () (_ BitVec 32))

(declare-fun mapRest!16923 () (Array (_ BitVec 32) ValueCell!4757))

(declare-fun mapValue!16923 () ValueCell!4757)

(assert (=> mapNonEmpty!16923 (= (arr!11592 _values!549) (store mapRest!16923 mapKey!16923 mapValue!16923))))

(declare-fun b!404398 () Bool)

(declare-fun tp_is_empty!10201 () Bool)

(assert (=> b!404398 (= e!243284 tp_is_empty!10201)))

(declare-fun b!404399 () Bool)

(declare-fun res!233242 () Bool)

(assert (=> b!404399 (=> (not res!233242) (not e!243283))))

(assert (=> b!404399 (= res!233242 (or (= (select (arr!11591 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11591 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404400 () Bool)

(declare-fun res!233240 () Bool)

(assert (=> b!404400 (=> (not res!233240) (not e!243283))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404400 (= res!233240 (and (= (size!11944 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11943 _keys!709) (size!11944 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404401 () Bool)

(declare-fun res!233243 () Bool)

(assert (=> b!404401 (=> (not res!233243) (not e!243283))))

(declare-fun arrayContainsKey!0 (array!24284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404401 (= res!233243 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404402 () Bool)

(assert (=> b!404402 (= e!243286 false)))

(declare-fun lt!188201 () Bool)

(declare-datatypes ((List!6628 0))(
  ( (Nil!6625) (Cons!6624 (h!7480 (_ BitVec 64)) (t!11794 List!6628)) )
))
(declare-fun arrayNoDuplicates!0 (array!24284 (_ BitVec 32) List!6628) Bool)

(assert (=> b!404402 (= lt!188201 (arrayNoDuplicates!0 lt!188202 #b00000000000000000000000000000000 Nil!6625))))

(declare-fun b!404403 () Bool)

(assert (=> b!404403 (= e!243285 tp_is_empty!10201)))

(declare-fun b!404404 () Bool)

(declare-fun res!233241 () Bool)

(assert (=> b!404404 (=> (not res!233241) (not e!243283))))

(assert (=> b!404404 (= res!233241 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6625))))

(assert (= (and start!38768 res!233238) b!404392))

(assert (= (and b!404392 res!233239) b!404400))

(assert (= (and b!404400 res!233240) b!404395))

(assert (= (and b!404395 res!233235) b!404404))

(assert (= (and b!404404 res!233241) b!404394))

(assert (= (and b!404394 res!233237) b!404396))

(assert (= (and b!404396 res!233236) b!404399))

(assert (= (and b!404399 res!233242) b!404401))

(assert (= (and b!404401 res!233243) b!404393))

(assert (= (and b!404393 res!233244) b!404402))

(assert (= (and b!404397 condMapEmpty!16923) mapIsEmpty!16923))

(assert (= (and b!404397 (not condMapEmpty!16923)) mapNonEmpty!16923))

(get-info :version)

(assert (= (and mapNonEmpty!16923 ((_ is ValueCellFull!4757) mapValue!16923)) b!404398))

(assert (= (and b!404397 ((_ is ValueCellFull!4757) mapDefault!16923)) b!404403))

(assert (= start!38768 b!404397))

(declare-fun m!397509 () Bool)

(assert (=> b!404396 m!397509))

(declare-fun m!397511 () Bool)

(assert (=> b!404402 m!397511))

(declare-fun m!397513 () Bool)

(assert (=> mapNonEmpty!16923 m!397513))

(declare-fun m!397515 () Bool)

(assert (=> b!404395 m!397515))

(declare-fun m!397517 () Bool)

(assert (=> b!404393 m!397517))

(declare-fun m!397519 () Bool)

(assert (=> b!404393 m!397519))

(declare-fun m!397521 () Bool)

(assert (=> b!404399 m!397521))

(declare-fun m!397523 () Bool)

(assert (=> b!404401 m!397523))

(declare-fun m!397525 () Bool)

(assert (=> b!404404 m!397525))

(declare-fun m!397527 () Bool)

(assert (=> start!38768 m!397527))

(declare-fun m!397529 () Bool)

(assert (=> start!38768 m!397529))

(declare-fun m!397531 () Bool)

(assert (=> b!404392 m!397531))

(check-sat (not b!404393) (not b!404404) (not start!38768) tp_is_empty!10201 (not b!404402) (not mapNonEmpty!16923) (not b!404396) (not b!404401) (not b!404395) (not b!404392))
(check-sat)
