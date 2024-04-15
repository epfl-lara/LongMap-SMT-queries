; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38786 () Bool)

(assert start!38786)

(declare-fun res!233383 () Bool)

(declare-fun e!243305 () Bool)

(assert (=> start!38786 (=> (not res!233383) (not e!243305))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24315 0))(
  ( (array!24316 (arr!11607 (Array (_ BitVec 32) (_ BitVec 64))) (size!11960 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24315)

(assert (=> start!38786 (= res!233383 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11960 _keys!709))))))

(assert (=> start!38786 e!243305))

(assert (=> start!38786 true))

(declare-datatypes ((V!14731 0))(
  ( (V!14732 (val!5154 Int)) )
))
(declare-datatypes ((ValueCell!4766 0))(
  ( (ValueCellFull!4766 (v!7395 V!14731)) (EmptyCell!4766) )
))
(declare-datatypes ((array!24317 0))(
  ( (array!24318 (arr!11608 (Array (_ BitVec 32) ValueCell!4766)) (size!11961 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24317)

(declare-fun e!243302 () Bool)

(declare-fun array_inv!8520 (array!24317) Bool)

(assert (=> start!38786 (and (array_inv!8520 _values!549) e!243302)))

(declare-fun array_inv!8521 (array!24315) Bool)

(assert (=> start!38786 (array_inv!8521 _keys!709)))

(declare-fun b!404521 () Bool)

(declare-fun res!233387 () Bool)

(assert (=> b!404521 (=> (not res!233387) (not e!243305))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404521 (= res!233387 (validMask!0 mask!1025))))

(declare-fun b!404522 () Bool)

(declare-fun e!243303 () Bool)

(declare-fun mapRes!16950 () Bool)

(assert (=> b!404522 (= e!243302 (and e!243303 mapRes!16950))))

(declare-fun condMapEmpty!16950 () Bool)

(declare-fun mapDefault!16950 () ValueCell!4766)

(assert (=> b!404522 (= condMapEmpty!16950 (= (arr!11608 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4766)) mapDefault!16950)))))

(declare-fun b!404523 () Bool)

(declare-fun res!233380 () Bool)

(assert (=> b!404523 (=> (not res!233380) (not e!243305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24315 (_ BitVec 32)) Bool)

(assert (=> b!404523 (= res!233380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16950 () Bool)

(declare-fun tp!33069 () Bool)

(declare-fun e!243301 () Bool)

(assert (=> mapNonEmpty!16950 (= mapRes!16950 (and tp!33069 e!243301))))

(declare-fun mapKey!16950 () (_ BitVec 32))

(declare-fun mapRest!16950 () (Array (_ BitVec 32) ValueCell!4766))

(declare-fun mapValue!16950 () ValueCell!4766)

(assert (=> mapNonEmpty!16950 (= (arr!11608 _values!549) (store mapRest!16950 mapKey!16950 mapValue!16950))))

(declare-fun b!404524 () Bool)

(declare-fun tp_is_empty!10219 () Bool)

(assert (=> b!404524 (= e!243303 tp_is_empty!10219)))

(declare-fun b!404525 () Bool)

(declare-fun res!233384 () Bool)

(assert (=> b!404525 (=> (not res!233384) (not e!243305))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404525 (= res!233384 (validKeyInArray!0 k0!794))))

(declare-fun b!404526 () Bool)

(declare-fun e!243306 () Bool)

(assert (=> b!404526 (= e!243306 false)))

(declare-fun lt!188003 () Bool)

(declare-fun lt!188002 () array!24315)

(declare-datatypes ((List!6732 0))(
  ( (Nil!6729) (Cons!6728 (h!7584 (_ BitVec 64)) (t!11897 List!6732)) )
))
(declare-fun arrayNoDuplicates!0 (array!24315 (_ BitVec 32) List!6732) Bool)

(assert (=> b!404526 (= lt!188003 (arrayNoDuplicates!0 lt!188002 #b00000000000000000000000000000000 Nil!6729))))

(declare-fun b!404527 () Bool)

(declare-fun res!233388 () Bool)

(assert (=> b!404527 (=> (not res!233388) (not e!243305))))

(declare-fun arrayContainsKey!0 (array!24315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404527 (= res!233388 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16950 () Bool)

(assert (=> mapIsEmpty!16950 mapRes!16950))

(declare-fun b!404528 () Bool)

(declare-fun res!233386 () Bool)

(assert (=> b!404528 (=> (not res!233386) (not e!243305))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404528 (= res!233386 (or (= (select (arr!11607 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11607 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404529 () Bool)

(declare-fun res!233381 () Bool)

(assert (=> b!404529 (=> (not res!233381) (not e!243305))))

(assert (=> b!404529 (= res!233381 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6729))))

(declare-fun b!404530 () Bool)

(assert (=> b!404530 (= e!243301 tp_is_empty!10219)))

(declare-fun b!404531 () Bool)

(declare-fun res!233382 () Bool)

(assert (=> b!404531 (=> (not res!233382) (not e!243305))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404531 (= res!233382 (and (= (size!11961 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11960 _keys!709) (size!11961 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404532 () Bool)

(assert (=> b!404532 (= e!243305 e!243306)))

(declare-fun res!233379 () Bool)

(assert (=> b!404532 (=> (not res!233379) (not e!243306))))

(assert (=> b!404532 (= res!233379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188002 mask!1025))))

(assert (=> b!404532 (= lt!188002 (array!24316 (store (arr!11607 _keys!709) i!563 k0!794) (size!11960 _keys!709)))))

(declare-fun b!404533 () Bool)

(declare-fun res!233385 () Bool)

(assert (=> b!404533 (=> (not res!233385) (not e!243305))))

(assert (=> b!404533 (= res!233385 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11960 _keys!709))))))

(assert (= (and start!38786 res!233383) b!404521))

(assert (= (and b!404521 res!233387) b!404531))

(assert (= (and b!404531 res!233382) b!404523))

(assert (= (and b!404523 res!233380) b!404529))

(assert (= (and b!404529 res!233381) b!404533))

(assert (= (and b!404533 res!233385) b!404525))

(assert (= (and b!404525 res!233384) b!404528))

(assert (= (and b!404528 res!233386) b!404527))

(assert (= (and b!404527 res!233388) b!404532))

(assert (= (and b!404532 res!233379) b!404526))

(assert (= (and b!404522 condMapEmpty!16950) mapIsEmpty!16950))

(assert (= (and b!404522 (not condMapEmpty!16950)) mapNonEmpty!16950))

(get-info :version)

(assert (= (and mapNonEmpty!16950 ((_ is ValueCellFull!4766) mapValue!16950)) b!404530))

(assert (= (and b!404522 ((_ is ValueCellFull!4766) mapDefault!16950)) b!404524))

(assert (= start!38786 b!404522))

(declare-fun m!396771 () Bool)

(assert (=> b!404527 m!396771))

(declare-fun m!396773 () Bool)

(assert (=> b!404532 m!396773))

(declare-fun m!396775 () Bool)

(assert (=> b!404532 m!396775))

(declare-fun m!396777 () Bool)

(assert (=> b!404523 m!396777))

(declare-fun m!396779 () Bool)

(assert (=> b!404526 m!396779))

(declare-fun m!396781 () Bool)

(assert (=> b!404529 m!396781))

(declare-fun m!396783 () Bool)

(assert (=> b!404528 m!396783))

(declare-fun m!396785 () Bool)

(assert (=> b!404525 m!396785))

(declare-fun m!396787 () Bool)

(assert (=> b!404521 m!396787))

(declare-fun m!396789 () Bool)

(assert (=> mapNonEmpty!16950 m!396789))

(declare-fun m!396791 () Bool)

(assert (=> start!38786 m!396791))

(declare-fun m!396793 () Bool)

(assert (=> start!38786 m!396793))

(check-sat (not start!38786) (not b!404526) (not mapNonEmpty!16950) tp_is_empty!10219 (not b!404523) (not b!404527) (not b!404521) (not b!404532) (not b!404529) (not b!404525))
(check-sat)
