; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38828 () Bool)

(assert start!38828)

(declare-fun b!405340 () Bool)

(declare-fun e!243682 () Bool)

(declare-fun tp_is_empty!10261 () Bool)

(assert (=> b!405340 (= e!243682 tp_is_empty!10261)))

(declare-fun b!405341 () Bool)

(declare-fun e!243681 () Bool)

(declare-fun mapRes!17013 () Bool)

(assert (=> b!405341 (= e!243681 (and e!243682 mapRes!17013))))

(declare-fun condMapEmpty!17013 () Bool)

(declare-datatypes ((V!14787 0))(
  ( (V!14788 (val!5175 Int)) )
))
(declare-datatypes ((ValueCell!4787 0))(
  ( (ValueCellFull!4787 (v!7416 V!14787)) (EmptyCell!4787) )
))
(declare-datatypes ((array!24397 0))(
  ( (array!24398 (arr!11648 (Array (_ BitVec 32) ValueCell!4787)) (size!12001 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24397)

(declare-fun mapDefault!17013 () ValueCell!4787)

(assert (=> b!405341 (= condMapEmpty!17013 (= (arr!11648 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4787)) mapDefault!17013)))))

(declare-fun b!405342 () Bool)

(declare-fun res!234009 () Bool)

(declare-fun e!243679 () Bool)

(assert (=> b!405342 (=> (not res!234009) (not e!243679))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405342 (= res!234009 (validMask!0 mask!1025))))

(declare-fun b!405343 () Bool)

(declare-fun res!234017 () Bool)

(assert (=> b!405343 (=> (not res!234017) (not e!243679))))

(declare-datatypes ((array!24399 0))(
  ( (array!24400 (arr!11649 (Array (_ BitVec 32) (_ BitVec 64))) (size!12002 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24399)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405343 (= res!234017 (or (= (select (arr!11649 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11649 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405344 () Bool)

(declare-fun res!234012 () Bool)

(assert (=> b!405344 (=> (not res!234012) (not e!243679))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405344 (= res!234012 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17013 () Bool)

(assert (=> mapIsEmpty!17013 mapRes!17013))

(declare-fun b!405346 () Bool)

(declare-fun res!234015 () Bool)

(assert (=> b!405346 (=> (not res!234015) (not e!243679))))

(declare-datatypes ((List!6748 0))(
  ( (Nil!6745) (Cons!6744 (h!7600 (_ BitVec 64)) (t!11913 List!6748)) )
))
(declare-fun arrayNoDuplicates!0 (array!24399 (_ BitVec 32) List!6748) Bool)

(assert (=> b!405346 (= res!234015 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6745))))

(declare-fun b!405347 () Bool)

(declare-fun res!234010 () Bool)

(assert (=> b!405347 (=> (not res!234010) (not e!243679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24399 (_ BitVec 32)) Bool)

(assert (=> b!405347 (= res!234010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405348 () Bool)

(declare-fun e!243683 () Bool)

(assert (=> b!405348 (= e!243679 e!243683)))

(declare-fun res!234011 () Bool)

(assert (=> b!405348 (=> (not res!234011) (not e!243683))))

(declare-fun lt!188129 () array!24399)

(assert (=> b!405348 (= res!234011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188129 mask!1025))))

(assert (=> b!405348 (= lt!188129 (array!24400 (store (arr!11649 _keys!709) i!563 k0!794) (size!12002 _keys!709)))))

(declare-fun b!405349 () Bool)

(assert (=> b!405349 (= e!243683 false)))

(declare-fun lt!188128 () Bool)

(assert (=> b!405349 (= lt!188128 (arrayNoDuplicates!0 lt!188129 #b00000000000000000000000000000000 Nil!6745))))

(declare-fun b!405350 () Bool)

(declare-fun res!234013 () Bool)

(assert (=> b!405350 (=> (not res!234013) (not e!243679))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405350 (= res!234013 (and (= (size!12001 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12002 _keys!709) (size!12001 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405351 () Bool)

(declare-fun e!243684 () Bool)

(assert (=> b!405351 (= e!243684 tp_is_empty!10261)))

(declare-fun mapNonEmpty!17013 () Bool)

(declare-fun tp!33132 () Bool)

(assert (=> mapNonEmpty!17013 (= mapRes!17013 (and tp!33132 e!243684))))

(declare-fun mapRest!17013 () (Array (_ BitVec 32) ValueCell!4787))

(declare-fun mapValue!17013 () ValueCell!4787)

(declare-fun mapKey!17013 () (_ BitVec 32))

(assert (=> mapNonEmpty!17013 (= (arr!11648 _values!549) (store mapRest!17013 mapKey!17013 mapValue!17013))))

(declare-fun b!405352 () Bool)

(declare-fun res!234014 () Bool)

(assert (=> b!405352 (=> (not res!234014) (not e!243679))))

(declare-fun arrayContainsKey!0 (array!24399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405352 (= res!234014 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!234018 () Bool)

(assert (=> start!38828 (=> (not res!234018) (not e!243679))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38828 (= res!234018 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12002 _keys!709))))))

(assert (=> start!38828 e!243679))

(assert (=> start!38828 true))

(declare-fun array_inv!8548 (array!24397) Bool)

(assert (=> start!38828 (and (array_inv!8548 _values!549) e!243681)))

(declare-fun array_inv!8549 (array!24399) Bool)

(assert (=> start!38828 (array_inv!8549 _keys!709)))

(declare-fun b!405345 () Bool)

(declare-fun res!234016 () Bool)

(assert (=> b!405345 (=> (not res!234016) (not e!243679))))

(assert (=> b!405345 (= res!234016 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12002 _keys!709))))))

(assert (= (and start!38828 res!234018) b!405342))

(assert (= (and b!405342 res!234009) b!405350))

(assert (= (and b!405350 res!234013) b!405347))

(assert (= (and b!405347 res!234010) b!405346))

(assert (= (and b!405346 res!234015) b!405345))

(assert (= (and b!405345 res!234016) b!405344))

(assert (= (and b!405344 res!234012) b!405343))

(assert (= (and b!405343 res!234017) b!405352))

(assert (= (and b!405352 res!234014) b!405348))

(assert (= (and b!405348 res!234011) b!405349))

(assert (= (and b!405341 condMapEmpty!17013) mapIsEmpty!17013))

(assert (= (and b!405341 (not condMapEmpty!17013)) mapNonEmpty!17013))

(get-info :version)

(assert (= (and mapNonEmpty!17013 ((_ is ValueCellFull!4787) mapValue!17013)) b!405351))

(assert (= (and b!405341 ((_ is ValueCellFull!4787) mapDefault!17013)) b!405340))

(assert (= start!38828 b!405341))

(declare-fun m!397275 () Bool)

(assert (=> b!405347 m!397275))

(declare-fun m!397277 () Bool)

(assert (=> start!38828 m!397277))

(declare-fun m!397279 () Bool)

(assert (=> start!38828 m!397279))

(declare-fun m!397281 () Bool)

(assert (=> b!405344 m!397281))

(declare-fun m!397283 () Bool)

(assert (=> mapNonEmpty!17013 m!397283))

(declare-fun m!397285 () Bool)

(assert (=> b!405346 m!397285))

(declare-fun m!397287 () Bool)

(assert (=> b!405349 m!397287))

(declare-fun m!397289 () Bool)

(assert (=> b!405342 m!397289))

(declare-fun m!397291 () Bool)

(assert (=> b!405352 m!397291))

(declare-fun m!397293 () Bool)

(assert (=> b!405343 m!397293))

(declare-fun m!397295 () Bool)

(assert (=> b!405348 m!397295))

(declare-fun m!397297 () Bool)

(assert (=> b!405348 m!397297))

(check-sat (not start!38828) (not b!405352) (not b!405346) (not b!405348) (not b!405347) (not b!405342) (not b!405344) tp_is_empty!10261 (not b!405349) (not mapNonEmpty!17013))
(check-sat)
