; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38516 () Bool)

(assert start!38516)

(declare-fun mapIsEmpty!16545 () Bool)

(declare-fun mapRes!16545 () Bool)

(assert (=> mapIsEmpty!16545 mapRes!16545))

(declare-fun b!397960 () Bool)

(declare-fun res!228688 () Bool)

(declare-fun e!240547 () Bool)

(assert (=> b!397960 (=> (not res!228688) (not e!240547))))

(declare-datatypes ((array!23789 0))(
  ( (array!23790 (arr!11344 (Array (_ BitVec 32) (_ BitVec 64))) (size!11697 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23789)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23789 (_ BitVec 32)) Bool)

(assert (=> b!397960 (= res!228688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397962 () Bool)

(declare-fun e!240549 () Bool)

(declare-fun tp_is_empty!9949 () Bool)

(assert (=> b!397962 (= e!240549 tp_is_empty!9949)))

(declare-fun b!397963 () Bool)

(declare-fun e!240550 () Bool)

(assert (=> b!397963 (= e!240550 (and e!240549 mapRes!16545))))

(declare-fun condMapEmpty!16545 () Bool)

(declare-datatypes ((V!14371 0))(
  ( (V!14372 (val!5019 Int)) )
))
(declare-datatypes ((ValueCell!4631 0))(
  ( (ValueCellFull!4631 (v!7260 V!14371)) (EmptyCell!4631) )
))
(declare-datatypes ((array!23791 0))(
  ( (array!23792 (arr!11345 (Array (_ BitVec 32) ValueCell!4631)) (size!11698 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23791)

(declare-fun mapDefault!16545 () ValueCell!4631)

(assert (=> b!397963 (= condMapEmpty!16545 (= (arr!11345 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4631)) mapDefault!16545)))))

(declare-fun b!397964 () Bool)

(declare-fun res!228685 () Bool)

(assert (=> b!397964 (=> (not res!228685) (not e!240547))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397964 (= res!228685 (validKeyInArray!0 k0!794))))

(declare-fun b!397965 () Bool)

(declare-fun res!228681 () Bool)

(assert (=> b!397965 (=> (not res!228681) (not e!240547))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397965 (= res!228681 (or (= (select (arr!11344 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11344 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397966 () Bool)

(declare-fun res!228690 () Bool)

(assert (=> b!397966 (=> (not res!228690) (not e!240547))))

(assert (=> b!397966 (= res!228690 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11697 _keys!709))))))

(declare-fun b!397967 () Bool)

(declare-fun res!228684 () Bool)

(assert (=> b!397967 (=> (not res!228684) (not e!240547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397967 (= res!228684 (validMask!0 mask!1025))))

(declare-fun res!228683 () Bool)

(assert (=> start!38516 (=> (not res!228683) (not e!240547))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38516 (= res!228683 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11697 _keys!709))))))

(assert (=> start!38516 e!240547))

(assert (=> start!38516 true))

(declare-fun array_inv!8330 (array!23791) Bool)

(assert (=> start!38516 (and (array_inv!8330 _values!549) e!240550)))

(declare-fun array_inv!8331 (array!23789) Bool)

(assert (=> start!38516 (array_inv!8331 _keys!709)))

(declare-fun b!397961 () Bool)

(declare-fun e!240551 () Bool)

(assert (=> b!397961 (= e!240551 tp_is_empty!9949)))

(declare-fun mapNonEmpty!16545 () Bool)

(declare-fun tp!32340 () Bool)

(assert (=> mapNonEmpty!16545 (= mapRes!16545 (and tp!32340 e!240551))))

(declare-fun mapRest!16545 () (Array (_ BitVec 32) ValueCell!4631))

(declare-fun mapKey!16545 () (_ BitVec 32))

(declare-fun mapValue!16545 () ValueCell!4631)

(assert (=> mapNonEmpty!16545 (= (arr!11345 _values!549) (store mapRest!16545 mapKey!16545 mapValue!16545))))

(declare-fun b!397968 () Bool)

(declare-fun e!240548 () Bool)

(assert (=> b!397968 (= e!240547 e!240548)))

(declare-fun res!228686 () Bool)

(assert (=> b!397968 (=> (not res!228686) (not e!240548))))

(declare-fun lt!187193 () array!23789)

(assert (=> b!397968 (= res!228686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187193 mask!1025))))

(assert (=> b!397968 (= lt!187193 (array!23790 (store (arr!11344 _keys!709) i!563 k0!794) (size!11697 _keys!709)))))

(declare-fun b!397969 () Bool)

(declare-fun res!228682 () Bool)

(assert (=> b!397969 (=> (not res!228682) (not e!240547))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397969 (= res!228682 (and (= (size!11698 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11697 _keys!709) (size!11698 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397970 () Bool)

(declare-fun res!228687 () Bool)

(assert (=> b!397970 (=> (not res!228687) (not e!240547))))

(declare-fun arrayContainsKey!0 (array!23789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397970 (= res!228687 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397971 () Bool)

(declare-fun res!228689 () Bool)

(assert (=> b!397971 (=> (not res!228689) (not e!240547))))

(declare-datatypes ((List!6523 0))(
  ( (Nil!6520) (Cons!6519 (h!7375 (_ BitVec 64)) (t!11688 List!6523)) )
))
(declare-fun arrayNoDuplicates!0 (array!23789 (_ BitVec 32) List!6523) Bool)

(assert (=> b!397971 (= res!228689 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6520))))

(declare-fun b!397972 () Bool)

(assert (=> b!397972 (= e!240548 false)))

(declare-fun lt!187192 () Bool)

(assert (=> b!397972 (= lt!187192 (arrayNoDuplicates!0 lt!187193 #b00000000000000000000000000000000 Nil!6520))))

(assert (= (and start!38516 res!228683) b!397967))

(assert (= (and b!397967 res!228684) b!397969))

(assert (= (and b!397969 res!228682) b!397960))

(assert (= (and b!397960 res!228688) b!397971))

(assert (= (and b!397971 res!228689) b!397966))

(assert (= (and b!397966 res!228690) b!397964))

(assert (= (and b!397964 res!228685) b!397965))

(assert (= (and b!397965 res!228681) b!397970))

(assert (= (and b!397970 res!228687) b!397968))

(assert (= (and b!397968 res!228686) b!397972))

(assert (= (and b!397963 condMapEmpty!16545) mapIsEmpty!16545))

(assert (= (and b!397963 (not condMapEmpty!16545)) mapNonEmpty!16545))

(get-info :version)

(assert (= (and mapNonEmpty!16545 ((_ is ValueCellFull!4631) mapValue!16545)) b!397961))

(assert (= (and b!397963 ((_ is ValueCellFull!4631) mapDefault!16545)) b!397962))

(assert (= start!38516 b!397963))

(declare-fun m!392451 () Bool)

(assert (=> mapNonEmpty!16545 m!392451))

(declare-fun m!392453 () Bool)

(assert (=> start!38516 m!392453))

(declare-fun m!392455 () Bool)

(assert (=> start!38516 m!392455))

(declare-fun m!392457 () Bool)

(assert (=> b!397968 m!392457))

(declare-fun m!392459 () Bool)

(assert (=> b!397968 m!392459))

(declare-fun m!392461 () Bool)

(assert (=> b!397970 m!392461))

(declare-fun m!392463 () Bool)

(assert (=> b!397971 m!392463))

(declare-fun m!392465 () Bool)

(assert (=> b!397965 m!392465))

(declare-fun m!392467 () Bool)

(assert (=> b!397960 m!392467))

(declare-fun m!392469 () Bool)

(assert (=> b!397964 m!392469))

(declare-fun m!392471 () Bool)

(assert (=> b!397967 m!392471))

(declare-fun m!392473 () Bool)

(assert (=> b!397972 m!392473))

(check-sat tp_is_empty!9949 (not b!397968) (not b!397967) (not mapNonEmpty!16545) (not b!397960) (not b!397970) (not b!397971) (not b!397964) (not start!38516) (not b!397972))
(check-sat)
