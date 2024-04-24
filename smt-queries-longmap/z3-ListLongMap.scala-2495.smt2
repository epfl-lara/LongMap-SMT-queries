; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38774 () Bool)

(assert start!38774)

(declare-fun b!404509 () Bool)

(declare-fun res!233333 () Bool)

(declare-fun e!243339 () Bool)

(assert (=> b!404509 (=> (not res!233333) (not e!243339))))

(declare-datatypes ((array!24294 0))(
  ( (array!24295 (arr!11596 (Array (_ BitVec 32) (_ BitVec 64))) (size!11948 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24294)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24294 (_ BitVec 32)) Bool)

(assert (=> b!404509 (= res!233333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!233327 () Bool)

(assert (=> start!38774 (=> (not res!233327) (not e!243339))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38774 (= res!233327 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11948 _keys!709))))))

(assert (=> start!38774 e!243339))

(assert (=> start!38774 true))

(declare-datatypes ((V!14715 0))(
  ( (V!14716 (val!5148 Int)) )
))
(declare-datatypes ((ValueCell!4760 0))(
  ( (ValueCellFull!4760 (v!7396 V!14715)) (EmptyCell!4760) )
))
(declare-datatypes ((array!24296 0))(
  ( (array!24297 (arr!11597 (Array (_ BitVec 32) ValueCell!4760)) (size!11949 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24296)

(declare-fun e!243335 () Bool)

(declare-fun array_inv!8560 (array!24296) Bool)

(assert (=> start!38774 (and (array_inv!8560 _values!549) e!243335)))

(declare-fun array_inv!8561 (array!24294) Bool)

(assert (=> start!38774 (array_inv!8561 _keys!709)))

(declare-fun b!404510 () Bool)

(declare-fun res!233325 () Bool)

(assert (=> b!404510 (=> (not res!233325) (not e!243339))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404510 (= res!233325 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404511 () Bool)

(declare-fun res!233326 () Bool)

(assert (=> b!404511 (=> (not res!233326) (not e!243339))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404511 (= res!233326 (or (= (select (arr!11596 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11596 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404512 () Bool)

(declare-fun e!243340 () Bool)

(assert (=> b!404512 (= e!243339 e!243340)))

(declare-fun res!233332 () Bool)

(assert (=> b!404512 (=> (not res!233332) (not e!243340))))

(declare-fun lt!188219 () array!24294)

(assert (=> b!404512 (= res!233332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188219 mask!1025))))

(assert (=> b!404512 (= lt!188219 (array!24295 (store (arr!11596 _keys!709) i!563 k0!794) (size!11948 _keys!709)))))

(declare-fun b!404513 () Bool)

(declare-fun res!233334 () Bool)

(assert (=> b!404513 (=> (not res!233334) (not e!243339))))

(declare-datatypes ((List!6630 0))(
  ( (Nil!6627) (Cons!6626 (h!7482 (_ BitVec 64)) (t!11796 List!6630)) )
))
(declare-fun arrayNoDuplicates!0 (array!24294 (_ BitVec 32) List!6630) Bool)

(assert (=> b!404513 (= res!233334 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6627))))

(declare-fun b!404514 () Bool)

(declare-fun res!233331 () Bool)

(assert (=> b!404514 (=> (not res!233331) (not e!243339))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404514 (= res!233331 (and (= (size!11949 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11948 _keys!709) (size!11949 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404515 () Bool)

(declare-fun res!233330 () Bool)

(assert (=> b!404515 (=> (not res!233330) (not e!243339))))

(assert (=> b!404515 (= res!233330 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11948 _keys!709))))))

(declare-fun b!404516 () Bool)

(declare-fun e!243337 () Bool)

(declare-fun tp_is_empty!10207 () Bool)

(assert (=> b!404516 (= e!243337 tp_is_empty!10207)))

(declare-fun b!404517 () Bool)

(declare-fun e!243336 () Bool)

(assert (=> b!404517 (= e!243336 tp_is_empty!10207)))

(declare-fun b!404518 () Bool)

(declare-fun mapRes!16932 () Bool)

(assert (=> b!404518 (= e!243335 (and e!243337 mapRes!16932))))

(declare-fun condMapEmpty!16932 () Bool)

(declare-fun mapDefault!16932 () ValueCell!4760)

(assert (=> b!404518 (= condMapEmpty!16932 (= (arr!11597 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4760)) mapDefault!16932)))))

(declare-fun b!404519 () Bool)

(assert (=> b!404519 (= e!243340 false)))

(declare-fun lt!188220 () Bool)

(assert (=> b!404519 (= lt!188220 (arrayNoDuplicates!0 lt!188219 #b00000000000000000000000000000000 Nil!6627))))

(declare-fun b!404520 () Bool)

(declare-fun res!233329 () Bool)

(assert (=> b!404520 (=> (not res!233329) (not e!243339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404520 (= res!233329 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16932 () Bool)

(assert (=> mapIsEmpty!16932 mapRes!16932))

(declare-fun mapNonEmpty!16932 () Bool)

(declare-fun tp!33051 () Bool)

(assert (=> mapNonEmpty!16932 (= mapRes!16932 (and tp!33051 e!243336))))

(declare-fun mapValue!16932 () ValueCell!4760)

(declare-fun mapRest!16932 () (Array (_ BitVec 32) ValueCell!4760))

(declare-fun mapKey!16932 () (_ BitVec 32))

(assert (=> mapNonEmpty!16932 (= (arr!11597 _values!549) (store mapRest!16932 mapKey!16932 mapValue!16932))))

(declare-fun b!404521 () Bool)

(declare-fun res!233328 () Bool)

(assert (=> b!404521 (=> (not res!233328) (not e!243339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404521 (= res!233328 (validKeyInArray!0 k0!794))))

(assert (= (and start!38774 res!233327) b!404520))

(assert (= (and b!404520 res!233329) b!404514))

(assert (= (and b!404514 res!233331) b!404509))

(assert (= (and b!404509 res!233333) b!404513))

(assert (= (and b!404513 res!233334) b!404515))

(assert (= (and b!404515 res!233330) b!404521))

(assert (= (and b!404521 res!233328) b!404511))

(assert (= (and b!404511 res!233326) b!404510))

(assert (= (and b!404510 res!233325) b!404512))

(assert (= (and b!404512 res!233332) b!404519))

(assert (= (and b!404518 condMapEmpty!16932) mapIsEmpty!16932))

(assert (= (and b!404518 (not condMapEmpty!16932)) mapNonEmpty!16932))

(get-info :version)

(assert (= (and mapNonEmpty!16932 ((_ is ValueCellFull!4760) mapValue!16932)) b!404517))

(assert (= (and b!404518 ((_ is ValueCellFull!4760) mapDefault!16932)) b!404516))

(assert (= start!38774 b!404518))

(declare-fun m!397581 () Bool)

(assert (=> b!404513 m!397581))

(declare-fun m!397583 () Bool)

(assert (=> start!38774 m!397583))

(declare-fun m!397585 () Bool)

(assert (=> start!38774 m!397585))

(declare-fun m!397587 () Bool)

(assert (=> b!404521 m!397587))

(declare-fun m!397589 () Bool)

(assert (=> b!404512 m!397589))

(declare-fun m!397591 () Bool)

(assert (=> b!404512 m!397591))

(declare-fun m!397593 () Bool)

(assert (=> mapNonEmpty!16932 m!397593))

(declare-fun m!397595 () Bool)

(assert (=> b!404509 m!397595))

(declare-fun m!397597 () Bool)

(assert (=> b!404520 m!397597))

(declare-fun m!397599 () Bool)

(assert (=> b!404511 m!397599))

(declare-fun m!397601 () Bool)

(assert (=> b!404519 m!397601))

(declare-fun m!397603 () Bool)

(assert (=> b!404510 m!397603))

(check-sat (not b!404519) (not start!38774) (not b!404520) (not b!404512) (not b!404510) (not b!404521) (not b!404509) (not mapNonEmpty!16932) (not b!404513) tp_is_empty!10207)
(check-sat)
