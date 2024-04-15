; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38486 () Bool)

(assert start!38486)

(declare-fun mapNonEmpty!16500 () Bool)

(declare-fun mapRes!16500 () Bool)

(declare-fun tp!32295 () Bool)

(declare-fun e!240281 () Bool)

(assert (=> mapNonEmpty!16500 (= mapRes!16500 (and tp!32295 e!240281))))

(declare-datatypes ((V!14331 0))(
  ( (V!14332 (val!5004 Int)) )
))
(declare-datatypes ((ValueCell!4616 0))(
  ( (ValueCellFull!4616 (v!7245 V!14331)) (EmptyCell!4616) )
))
(declare-datatypes ((array!23731 0))(
  ( (array!23732 (arr!11315 (Array (_ BitVec 32) ValueCell!4616)) (size!11668 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23731)

(declare-fun mapValue!16500 () ValueCell!4616)

(declare-fun mapRest!16500 () (Array (_ BitVec 32) ValueCell!4616))

(declare-fun mapKey!16500 () (_ BitVec 32))

(assert (=> mapNonEmpty!16500 (= (arr!11315 _values!549) (store mapRest!16500 mapKey!16500 mapValue!16500))))

(declare-fun b!397375 () Bool)

(declare-fun e!240279 () Bool)

(declare-fun e!240278 () Bool)

(assert (=> b!397375 (= e!240279 e!240278)))

(declare-fun res!228238 () Bool)

(assert (=> b!397375 (=> (not res!228238) (not e!240278))))

(declare-datatypes ((array!23733 0))(
  ( (array!23734 (arr!11316 (Array (_ BitVec 32) (_ BitVec 64))) (size!11669 (_ BitVec 32))) )
))
(declare-fun lt!187102 () array!23733)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23733 (_ BitVec 32)) Bool)

(assert (=> b!397375 (= res!228238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187102 mask!1025))))

(declare-fun _keys!709 () array!23733)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397375 (= lt!187102 (array!23734 (store (arr!11316 _keys!709) i!563 k0!794) (size!11669 _keys!709)))))

(declare-fun b!397376 () Bool)

(declare-fun res!228235 () Bool)

(assert (=> b!397376 (=> (not res!228235) (not e!240279))))

(assert (=> b!397376 (= res!228235 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11669 _keys!709))))))

(declare-fun b!397377 () Bool)

(declare-fun res!228240 () Bool)

(assert (=> b!397377 (=> (not res!228240) (not e!240279))))

(assert (=> b!397377 (= res!228240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397378 () Bool)

(declare-fun res!228232 () Bool)

(assert (=> b!397378 (=> (not res!228232) (not e!240279))))

(declare-fun arrayContainsKey!0 (array!23733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397378 (= res!228232 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16500 () Bool)

(assert (=> mapIsEmpty!16500 mapRes!16500))

(declare-fun b!397379 () Bool)

(declare-fun e!240282 () Bool)

(declare-fun e!240280 () Bool)

(assert (=> b!397379 (= e!240282 (and e!240280 mapRes!16500))))

(declare-fun condMapEmpty!16500 () Bool)

(declare-fun mapDefault!16500 () ValueCell!4616)

(assert (=> b!397379 (= condMapEmpty!16500 (= (arr!11315 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4616)) mapDefault!16500)))))

(declare-fun b!397380 () Bool)

(declare-fun res!228237 () Bool)

(assert (=> b!397380 (=> (not res!228237) (not e!240279))))

(assert (=> b!397380 (= res!228237 (or (= (select (arr!11316 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11316 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397381 () Bool)

(declare-fun res!228231 () Bool)

(assert (=> b!397381 (=> (not res!228231) (not e!240279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397381 (= res!228231 (validMask!0 mask!1025))))

(declare-fun b!397382 () Bool)

(assert (=> b!397382 (= e!240278 false)))

(declare-fun lt!187103 () Bool)

(declare-datatypes ((List!6511 0))(
  ( (Nil!6508) (Cons!6507 (h!7363 (_ BitVec 64)) (t!11676 List!6511)) )
))
(declare-fun arrayNoDuplicates!0 (array!23733 (_ BitVec 32) List!6511) Bool)

(assert (=> b!397382 (= lt!187103 (arrayNoDuplicates!0 lt!187102 #b00000000000000000000000000000000 Nil!6508))))

(declare-fun b!397383 () Bool)

(declare-fun tp_is_empty!9919 () Bool)

(assert (=> b!397383 (= e!240280 tp_is_empty!9919)))

(declare-fun res!228234 () Bool)

(assert (=> start!38486 (=> (not res!228234) (not e!240279))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38486 (= res!228234 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11669 _keys!709))))))

(assert (=> start!38486 e!240279))

(assert (=> start!38486 true))

(declare-fun array_inv!8304 (array!23731) Bool)

(assert (=> start!38486 (and (array_inv!8304 _values!549) e!240282)))

(declare-fun array_inv!8305 (array!23733) Bool)

(assert (=> start!38486 (array_inv!8305 _keys!709)))

(declare-fun b!397384 () Bool)

(declare-fun res!228239 () Bool)

(assert (=> b!397384 (=> (not res!228239) (not e!240279))))

(assert (=> b!397384 (= res!228239 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6508))))

(declare-fun b!397385 () Bool)

(declare-fun res!228236 () Bool)

(assert (=> b!397385 (=> (not res!228236) (not e!240279))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397385 (= res!228236 (and (= (size!11668 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11669 _keys!709) (size!11668 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397386 () Bool)

(assert (=> b!397386 (= e!240281 tp_is_empty!9919)))

(declare-fun b!397387 () Bool)

(declare-fun res!228233 () Bool)

(assert (=> b!397387 (=> (not res!228233) (not e!240279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397387 (= res!228233 (validKeyInArray!0 k0!794))))

(assert (= (and start!38486 res!228234) b!397381))

(assert (= (and b!397381 res!228231) b!397385))

(assert (= (and b!397385 res!228236) b!397377))

(assert (= (and b!397377 res!228240) b!397384))

(assert (= (and b!397384 res!228239) b!397376))

(assert (= (and b!397376 res!228235) b!397387))

(assert (= (and b!397387 res!228233) b!397380))

(assert (= (and b!397380 res!228237) b!397378))

(assert (= (and b!397378 res!228232) b!397375))

(assert (= (and b!397375 res!228238) b!397382))

(assert (= (and b!397379 condMapEmpty!16500) mapIsEmpty!16500))

(assert (= (and b!397379 (not condMapEmpty!16500)) mapNonEmpty!16500))

(get-info :version)

(assert (= (and mapNonEmpty!16500 ((_ is ValueCellFull!4616) mapValue!16500)) b!397386))

(assert (= (and b!397379 ((_ is ValueCellFull!4616) mapDefault!16500)) b!397383))

(assert (= start!38486 b!397379))

(declare-fun m!392091 () Bool)

(assert (=> b!397378 m!392091))

(declare-fun m!392093 () Bool)

(assert (=> b!397375 m!392093))

(declare-fun m!392095 () Bool)

(assert (=> b!397375 m!392095))

(declare-fun m!392097 () Bool)

(assert (=> start!38486 m!392097))

(declare-fun m!392099 () Bool)

(assert (=> start!38486 m!392099))

(declare-fun m!392101 () Bool)

(assert (=> mapNonEmpty!16500 m!392101))

(declare-fun m!392103 () Bool)

(assert (=> b!397381 m!392103))

(declare-fun m!392105 () Bool)

(assert (=> b!397387 m!392105))

(declare-fun m!392107 () Bool)

(assert (=> b!397377 m!392107))

(declare-fun m!392109 () Bool)

(assert (=> b!397380 m!392109))

(declare-fun m!392111 () Bool)

(assert (=> b!397382 m!392111))

(declare-fun m!392113 () Bool)

(assert (=> b!397384 m!392113))

(check-sat (not start!38486) (not b!397375) (not b!397382) (not b!397378) tp_is_empty!9919 (not mapNonEmpty!16500) (not b!397381) (not b!397384) (not b!397387) (not b!397377))
(check-sat)
