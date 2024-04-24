; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38438 () Bool)

(assert start!38438)

(declare-fun b!396661 () Bool)

(declare-fun res!227640 () Bool)

(declare-fun e!239990 () Bool)

(assert (=> b!396661 (=> (not res!227640) (not e!239990))))

(declare-datatypes ((array!23644 0))(
  ( (array!23645 (arr!11271 (Array (_ BitVec 32) (_ BitVec 64))) (size!11623 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23644)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396661 (= res!227640 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396662 () Bool)

(declare-fun res!227644 () Bool)

(assert (=> b!396662 (=> (not res!227644) (not e!239990))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396662 (= res!227644 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11623 _keys!709))))))

(declare-fun b!396663 () Bool)

(declare-fun res!227643 () Bool)

(assert (=> b!396663 (=> (not res!227643) (not e!239990))))

(declare-datatypes ((List!6399 0))(
  ( (Nil!6396) (Cons!6395 (h!7251 (_ BitVec 64)) (t!11565 List!6399)) )
))
(declare-fun arrayNoDuplicates!0 (array!23644 (_ BitVec 32) List!6399) Bool)

(assert (=> b!396663 (= res!227643 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6396))))

(declare-fun b!396664 () Bool)

(declare-fun e!239987 () Bool)

(declare-fun tp_is_empty!9871 () Bool)

(assert (=> b!396664 (= e!239987 tp_is_empty!9871)))

(declare-fun mapNonEmpty!16428 () Bool)

(declare-fun mapRes!16428 () Bool)

(declare-fun tp!32223 () Bool)

(assert (=> mapNonEmpty!16428 (= mapRes!16428 (and tp!32223 e!239987))))

(declare-datatypes ((V!14267 0))(
  ( (V!14268 (val!4980 Int)) )
))
(declare-datatypes ((ValueCell!4592 0))(
  ( (ValueCellFull!4592 (v!7228 V!14267)) (EmptyCell!4592) )
))
(declare-fun mapRest!16428 () (Array (_ BitVec 32) ValueCell!4592))

(declare-fun mapKey!16428 () (_ BitVec 32))

(declare-datatypes ((array!23646 0))(
  ( (array!23647 (arr!11272 (Array (_ BitVec 32) ValueCell!4592)) (size!11624 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23646)

(declare-fun mapValue!16428 () ValueCell!4592)

(assert (=> mapNonEmpty!16428 (= (arr!11272 _values!549) (store mapRest!16428 mapKey!16428 mapValue!16428))))

(declare-fun b!396665 () Bool)

(declare-fun res!227637 () Bool)

(assert (=> b!396665 (=> (not res!227637) (not e!239990))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396665 (= res!227637 (validMask!0 mask!1025))))

(declare-fun b!396666 () Bool)

(declare-fun res!227638 () Bool)

(assert (=> b!396666 (=> (not res!227638) (not e!239990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396666 (= res!227638 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16428 () Bool)

(assert (=> mapIsEmpty!16428 mapRes!16428))

(declare-fun b!396667 () Bool)

(declare-fun e!239991 () Bool)

(declare-fun e!239988 () Bool)

(assert (=> b!396667 (= e!239991 (and e!239988 mapRes!16428))))

(declare-fun condMapEmpty!16428 () Bool)

(declare-fun mapDefault!16428 () ValueCell!4592)

(assert (=> b!396667 (= condMapEmpty!16428 (= (arr!11272 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4592)) mapDefault!16428)))))

(declare-fun b!396668 () Bool)

(declare-fun res!227642 () Bool)

(assert (=> b!396668 (=> (not res!227642) (not e!239990))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396668 (= res!227642 (and (= (size!11624 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11623 _keys!709) (size!11624 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!227639 () Bool)

(assert (=> start!38438 (=> (not res!227639) (not e!239990))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38438 (= res!227639 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11623 _keys!709))))))

(assert (=> start!38438 e!239990))

(assert (=> start!38438 true))

(declare-fun array_inv!8328 (array!23646) Bool)

(assert (=> start!38438 (and (array_inv!8328 _values!549) e!239991)))

(declare-fun array_inv!8329 (array!23644) Bool)

(assert (=> start!38438 (array_inv!8329 _keys!709)))

(declare-fun b!396669 () Bool)

(declare-fun e!239989 () Bool)

(assert (=> b!396669 (= e!239990 e!239989)))

(declare-fun res!227646 () Bool)

(assert (=> b!396669 (=> (not res!227646) (not e!239989))))

(declare-fun lt!187211 () array!23644)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23644 (_ BitVec 32)) Bool)

(assert (=> b!396669 (= res!227646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187211 mask!1025))))

(assert (=> b!396669 (= lt!187211 (array!23645 (store (arr!11271 _keys!709) i!563 k0!794) (size!11623 _keys!709)))))

(declare-fun b!396670 () Bool)

(assert (=> b!396670 (= e!239988 tp_is_empty!9871)))

(declare-fun b!396671 () Bool)

(declare-fun res!227641 () Bool)

(assert (=> b!396671 (=> (not res!227641) (not e!239990))))

(assert (=> b!396671 (= res!227641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396672 () Bool)

(declare-fun res!227645 () Bool)

(assert (=> b!396672 (=> (not res!227645) (not e!239990))))

(assert (=> b!396672 (= res!227645 (or (= (select (arr!11271 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11271 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396673 () Bool)

(assert (=> b!396673 (= e!239989 false)))

(declare-fun lt!187212 () Bool)

(assert (=> b!396673 (= lt!187212 (arrayNoDuplicates!0 lt!187211 #b00000000000000000000000000000000 Nil!6396))))

(assert (= (and start!38438 res!227639) b!396665))

(assert (= (and b!396665 res!227637) b!396668))

(assert (= (and b!396668 res!227642) b!396671))

(assert (= (and b!396671 res!227641) b!396663))

(assert (= (and b!396663 res!227643) b!396662))

(assert (= (and b!396662 res!227644) b!396666))

(assert (= (and b!396666 res!227638) b!396672))

(assert (= (and b!396672 res!227645) b!396661))

(assert (= (and b!396661 res!227640) b!396669))

(assert (= (and b!396669 res!227646) b!396673))

(assert (= (and b!396667 condMapEmpty!16428) mapIsEmpty!16428))

(assert (= (and b!396667 (not condMapEmpty!16428)) mapNonEmpty!16428))

(get-info :version)

(assert (= (and mapNonEmpty!16428 ((_ is ValueCellFull!4592) mapValue!16428)) b!396664))

(assert (= (and b!396667 ((_ is ValueCellFull!4592) mapDefault!16428)) b!396670))

(assert (= start!38438 b!396667))

(declare-fun m!392469 () Bool)

(assert (=> mapNonEmpty!16428 m!392469))

(declare-fun m!392471 () Bool)

(assert (=> b!396663 m!392471))

(declare-fun m!392473 () Bool)

(assert (=> b!396665 m!392473))

(declare-fun m!392475 () Bool)

(assert (=> b!396672 m!392475))

(declare-fun m!392477 () Bool)

(assert (=> b!396669 m!392477))

(declare-fun m!392479 () Bool)

(assert (=> b!396669 m!392479))

(declare-fun m!392481 () Bool)

(assert (=> b!396661 m!392481))

(declare-fun m!392483 () Bool)

(assert (=> b!396666 m!392483))

(declare-fun m!392485 () Bool)

(assert (=> b!396673 m!392485))

(declare-fun m!392487 () Bool)

(assert (=> b!396671 m!392487))

(declare-fun m!392489 () Bool)

(assert (=> start!38438 m!392489))

(declare-fun m!392491 () Bool)

(assert (=> start!38438 m!392491))

(check-sat (not b!396666) (not b!396673) (not b!396665) (not b!396671) (not start!38438) tp_is_empty!9871 (not b!396663) (not b!396669) (not mapNonEmpty!16428) (not b!396661))
(check-sat)
