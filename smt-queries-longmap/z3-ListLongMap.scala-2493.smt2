; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38762 () Bool)

(assert start!38762)

(declare-fun b!404276 () Bool)

(declare-fun res!233151 () Bool)

(declare-fun e!243232 () Bool)

(assert (=> b!404276 (=> (not res!233151) (not e!243232))))

(declare-datatypes ((array!24272 0))(
  ( (array!24273 (arr!11585 (Array (_ BitVec 32) (_ BitVec 64))) (size!11937 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24272)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404276 (= res!233151 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404277 () Bool)

(declare-fun res!233149 () Bool)

(assert (=> b!404277 (=> (not res!233149) (not e!243232))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404277 (= res!233149 (or (= (select (arr!11585 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11585 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404278 () Bool)

(declare-fun res!233145 () Bool)

(assert (=> b!404278 (=> (not res!233145) (not e!243232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404278 (= res!233145 (validKeyInArray!0 k0!794))))

(declare-fun b!404279 () Bool)

(declare-fun e!243229 () Bool)

(declare-fun tp_is_empty!10195 () Bool)

(assert (=> b!404279 (= e!243229 tp_is_empty!10195)))

(declare-fun b!404280 () Bool)

(declare-fun e!243231 () Bool)

(assert (=> b!404280 (= e!243232 e!243231)))

(declare-fun res!233150 () Bool)

(assert (=> b!404280 (=> (not res!233150) (not e!243231))))

(declare-fun lt!188184 () array!24272)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24272 (_ BitVec 32)) Bool)

(assert (=> b!404280 (= res!233150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188184 mask!1025))))

(assert (=> b!404280 (= lt!188184 (array!24273 (store (arr!11585 _keys!709) i!563 k0!794) (size!11937 _keys!709)))))

(declare-fun b!404281 () Bool)

(declare-fun e!243230 () Bool)

(declare-fun mapRes!16914 () Bool)

(assert (=> b!404281 (= e!243230 (and e!243229 mapRes!16914))))

(declare-fun condMapEmpty!16914 () Bool)

(declare-datatypes ((V!14699 0))(
  ( (V!14700 (val!5142 Int)) )
))
(declare-datatypes ((ValueCell!4754 0))(
  ( (ValueCellFull!4754 (v!7390 V!14699)) (EmptyCell!4754) )
))
(declare-datatypes ((array!24274 0))(
  ( (array!24275 (arr!11586 (Array (_ BitVec 32) ValueCell!4754)) (size!11938 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24274)

(declare-fun mapDefault!16914 () ValueCell!4754)

(assert (=> b!404281 (= condMapEmpty!16914 (= (arr!11586 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4754)) mapDefault!16914)))))

(declare-fun b!404282 () Bool)

(declare-fun res!233153 () Bool)

(assert (=> b!404282 (=> (not res!233153) (not e!243232))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404282 (= res!233153 (and (= (size!11938 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11937 _keys!709) (size!11938 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16914 () Bool)

(assert (=> mapIsEmpty!16914 mapRes!16914))

(declare-fun b!404283 () Bool)

(declare-fun res!233152 () Bool)

(assert (=> b!404283 (=> (not res!233152) (not e!243232))))

(assert (=> b!404283 (= res!233152 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11937 _keys!709))))))

(declare-fun mapNonEmpty!16914 () Bool)

(declare-fun tp!33033 () Bool)

(declare-fun e!243227 () Bool)

(assert (=> mapNonEmpty!16914 (= mapRes!16914 (and tp!33033 e!243227))))

(declare-fun mapValue!16914 () ValueCell!4754)

(declare-fun mapRest!16914 () (Array (_ BitVec 32) ValueCell!4754))

(declare-fun mapKey!16914 () (_ BitVec 32))

(assert (=> mapNonEmpty!16914 (= (arr!11586 _values!549) (store mapRest!16914 mapKey!16914 mapValue!16914))))

(declare-fun res!233148 () Bool)

(assert (=> start!38762 (=> (not res!233148) (not e!243232))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38762 (= res!233148 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11937 _keys!709))))))

(assert (=> start!38762 e!243232))

(assert (=> start!38762 true))

(declare-fun array_inv!8554 (array!24274) Bool)

(assert (=> start!38762 (and (array_inv!8554 _values!549) e!243230)))

(declare-fun array_inv!8555 (array!24272) Bool)

(assert (=> start!38762 (array_inv!8555 _keys!709)))

(declare-fun b!404275 () Bool)

(declare-fun res!233154 () Bool)

(assert (=> b!404275 (=> (not res!233154) (not e!243232))))

(assert (=> b!404275 (= res!233154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404284 () Bool)

(declare-fun res!233147 () Bool)

(assert (=> b!404284 (=> (not res!233147) (not e!243232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404284 (= res!233147 (validMask!0 mask!1025))))

(declare-fun b!404285 () Bool)

(assert (=> b!404285 (= e!243231 false)))

(declare-fun lt!188183 () Bool)

(declare-datatypes ((List!6626 0))(
  ( (Nil!6623) (Cons!6622 (h!7478 (_ BitVec 64)) (t!11792 List!6626)) )
))
(declare-fun arrayNoDuplicates!0 (array!24272 (_ BitVec 32) List!6626) Bool)

(assert (=> b!404285 (= lt!188183 (arrayNoDuplicates!0 lt!188184 #b00000000000000000000000000000000 Nil!6623))))

(declare-fun b!404286 () Bool)

(declare-fun res!233146 () Bool)

(assert (=> b!404286 (=> (not res!233146) (not e!243232))))

(assert (=> b!404286 (= res!233146 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6623))))

(declare-fun b!404287 () Bool)

(assert (=> b!404287 (= e!243227 tp_is_empty!10195)))

(assert (= (and start!38762 res!233148) b!404284))

(assert (= (and b!404284 res!233147) b!404282))

(assert (= (and b!404282 res!233153) b!404275))

(assert (= (and b!404275 res!233154) b!404286))

(assert (= (and b!404286 res!233146) b!404283))

(assert (= (and b!404283 res!233152) b!404278))

(assert (= (and b!404278 res!233145) b!404277))

(assert (= (and b!404277 res!233149) b!404276))

(assert (= (and b!404276 res!233151) b!404280))

(assert (= (and b!404280 res!233150) b!404285))

(assert (= (and b!404281 condMapEmpty!16914) mapIsEmpty!16914))

(assert (= (and b!404281 (not condMapEmpty!16914)) mapNonEmpty!16914))

(get-info :version)

(assert (= (and mapNonEmpty!16914 ((_ is ValueCellFull!4754) mapValue!16914)) b!404287))

(assert (= (and b!404281 ((_ is ValueCellFull!4754) mapDefault!16914)) b!404279))

(assert (= start!38762 b!404281))

(declare-fun m!397437 () Bool)

(assert (=> start!38762 m!397437))

(declare-fun m!397439 () Bool)

(assert (=> start!38762 m!397439))

(declare-fun m!397441 () Bool)

(assert (=> mapNonEmpty!16914 m!397441))

(declare-fun m!397443 () Bool)

(assert (=> b!404278 m!397443))

(declare-fun m!397445 () Bool)

(assert (=> b!404280 m!397445))

(declare-fun m!397447 () Bool)

(assert (=> b!404280 m!397447))

(declare-fun m!397449 () Bool)

(assert (=> b!404284 m!397449))

(declare-fun m!397451 () Bool)

(assert (=> b!404275 m!397451))

(declare-fun m!397453 () Bool)

(assert (=> b!404277 m!397453))

(declare-fun m!397455 () Bool)

(assert (=> b!404285 m!397455))

(declare-fun m!397457 () Bool)

(assert (=> b!404276 m!397457))

(declare-fun m!397459 () Bool)

(assert (=> b!404286 m!397459))

(check-sat (not b!404286) (not b!404278) (not b!404276) (not mapNonEmpty!16914) tp_is_empty!10195 (not b!404285) (not b!404284) (not start!38762) (not b!404280) (not b!404275))
(check-sat)
