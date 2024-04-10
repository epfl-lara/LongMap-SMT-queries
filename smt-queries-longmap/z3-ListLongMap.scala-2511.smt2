; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38886 () Bool)

(assert start!38886)

(declare-fun b!406469 () Bool)

(declare-fun e!244254 () Bool)

(declare-fun e!244250 () Bool)

(declare-fun mapRes!17079 () Bool)

(assert (=> b!406469 (= e!244254 (and e!244250 mapRes!17079))))

(declare-fun condMapEmpty!17079 () Bool)

(declare-datatypes ((V!14845 0))(
  ( (V!14846 (val!5197 Int)) )
))
(declare-datatypes ((ValueCell!4809 0))(
  ( (ValueCellFull!4809 (v!7444 V!14845)) (EmptyCell!4809) )
))
(declare-datatypes ((array!24499 0))(
  ( (array!24500 (arr!11699 (Array (_ BitVec 32) ValueCell!4809)) (size!12051 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24499)

(declare-fun mapDefault!17079 () ValueCell!4809)

(assert (=> b!406469 (= condMapEmpty!17079 (= (arr!11699 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4809)) mapDefault!17079)))))

(declare-fun b!406470 () Bool)

(declare-fun e!244253 () Bool)

(assert (=> b!406470 (= e!244253 false)))

(declare-fun lt!188495 () Bool)

(declare-datatypes ((array!24501 0))(
  ( (array!24502 (arr!11700 (Array (_ BitVec 32) (_ BitVec 64))) (size!12052 (_ BitVec 32))) )
))
(declare-fun lt!188494 () array!24501)

(declare-datatypes ((List!6794 0))(
  ( (Nil!6791) (Cons!6790 (h!7646 (_ BitVec 64)) (t!11968 List!6794)) )
))
(declare-fun arrayNoDuplicates!0 (array!24501 (_ BitVec 32) List!6794) Bool)

(assert (=> b!406470 (= lt!188495 (arrayNoDuplicates!0 lt!188494 #b00000000000000000000000000000000 Nil!6791))))

(declare-fun b!406471 () Bool)

(declare-fun res!234798 () Bool)

(declare-fun e!244252 () Bool)

(assert (=> b!406471 (=> (not res!234798) (not e!244252))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!24501)

(assert (=> b!406471 (= res!234798 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12052 _keys!709))))))

(declare-fun b!406472 () Bool)

(declare-fun e!244249 () Bool)

(declare-fun tp_is_empty!10305 () Bool)

(assert (=> b!406472 (= e!244249 tp_is_empty!10305)))

(declare-fun mapIsEmpty!17079 () Bool)

(assert (=> mapIsEmpty!17079 mapRes!17079))

(declare-fun b!406474 () Bool)

(declare-fun res!234807 () Bool)

(assert (=> b!406474 (=> (not res!234807) (not e!244252))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!406474 (= res!234807 (and (= (size!12051 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12052 _keys!709) (size!12051 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406475 () Bool)

(declare-fun res!234799 () Bool)

(assert (=> b!406475 (=> (not res!234799) (not e!244252))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406475 (= res!234799 (validKeyInArray!0 k0!794))))

(declare-fun b!406476 () Bool)

(declare-fun res!234806 () Bool)

(assert (=> b!406476 (=> (not res!234806) (not e!244252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406476 (= res!234806 (validMask!0 mask!1025))))

(declare-fun b!406477 () Bool)

(declare-fun res!234800 () Bool)

(assert (=> b!406477 (=> (not res!234800) (not e!244252))))

(declare-fun arrayContainsKey!0 (array!24501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406477 (= res!234800 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406478 () Bool)

(assert (=> b!406478 (= e!244252 e!244253)))

(declare-fun res!234803 () Bool)

(assert (=> b!406478 (=> (not res!234803) (not e!244253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24501 (_ BitVec 32)) Bool)

(assert (=> b!406478 (= res!234803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188494 mask!1025))))

(assert (=> b!406478 (= lt!188494 (array!24502 (store (arr!11700 _keys!709) i!563 k0!794) (size!12052 _keys!709)))))

(declare-fun b!406479 () Bool)

(declare-fun res!234805 () Bool)

(assert (=> b!406479 (=> (not res!234805) (not e!244252))))

(assert (=> b!406479 (= res!234805 (or (= (select (arr!11700 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11700 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17079 () Bool)

(declare-fun tp!33198 () Bool)

(assert (=> mapNonEmpty!17079 (= mapRes!17079 (and tp!33198 e!244249))))

(declare-fun mapValue!17079 () ValueCell!4809)

(declare-fun mapKey!17079 () (_ BitVec 32))

(declare-fun mapRest!17079 () (Array (_ BitVec 32) ValueCell!4809))

(assert (=> mapNonEmpty!17079 (= (arr!11699 _values!549) (store mapRest!17079 mapKey!17079 mapValue!17079))))

(declare-fun b!406480 () Bool)

(assert (=> b!406480 (= e!244250 tp_is_empty!10305)))

(declare-fun b!406481 () Bool)

(declare-fun res!234802 () Bool)

(assert (=> b!406481 (=> (not res!234802) (not e!244252))))

(assert (=> b!406481 (= res!234802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!234801 () Bool)

(assert (=> start!38886 (=> (not res!234801) (not e!244252))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38886 (= res!234801 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12052 _keys!709))))))

(assert (=> start!38886 e!244252))

(assert (=> start!38886 true))

(declare-fun array_inv!8542 (array!24499) Bool)

(assert (=> start!38886 (and (array_inv!8542 _values!549) e!244254)))

(declare-fun array_inv!8543 (array!24501) Bool)

(assert (=> start!38886 (array_inv!8543 _keys!709)))

(declare-fun b!406473 () Bool)

(declare-fun res!234804 () Bool)

(assert (=> b!406473 (=> (not res!234804) (not e!244252))))

(assert (=> b!406473 (= res!234804 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6791))))

(assert (= (and start!38886 res!234801) b!406476))

(assert (= (and b!406476 res!234806) b!406474))

(assert (= (and b!406474 res!234807) b!406481))

(assert (= (and b!406481 res!234802) b!406473))

(assert (= (and b!406473 res!234804) b!406471))

(assert (= (and b!406471 res!234798) b!406475))

(assert (= (and b!406475 res!234799) b!406479))

(assert (= (and b!406479 res!234805) b!406477))

(assert (= (and b!406477 res!234800) b!406478))

(assert (= (and b!406478 res!234803) b!406470))

(assert (= (and b!406469 condMapEmpty!17079) mapIsEmpty!17079))

(assert (= (and b!406469 (not condMapEmpty!17079)) mapNonEmpty!17079))

(get-info :version)

(assert (= (and mapNonEmpty!17079 ((_ is ValueCellFull!4809) mapValue!17079)) b!406472))

(assert (= (and b!406469 ((_ is ValueCellFull!4809) mapDefault!17079)) b!406480))

(assert (= start!38886 b!406469))

(declare-fun m!398527 () Bool)

(assert (=> b!406473 m!398527))

(declare-fun m!398529 () Bool)

(assert (=> b!406477 m!398529))

(declare-fun m!398531 () Bool)

(assert (=> b!406475 m!398531))

(declare-fun m!398533 () Bool)

(assert (=> b!406478 m!398533))

(declare-fun m!398535 () Bool)

(assert (=> b!406478 m!398535))

(declare-fun m!398537 () Bool)

(assert (=> b!406481 m!398537))

(declare-fun m!398539 () Bool)

(assert (=> b!406476 m!398539))

(declare-fun m!398541 () Bool)

(assert (=> start!38886 m!398541))

(declare-fun m!398543 () Bool)

(assert (=> start!38886 m!398543))

(declare-fun m!398545 () Bool)

(assert (=> b!406470 m!398545))

(declare-fun m!398547 () Bool)

(assert (=> b!406479 m!398547))

(declare-fun m!398549 () Bool)

(assert (=> mapNonEmpty!17079 m!398549))

(check-sat tp_is_empty!10305 (not b!406476) (not b!406475) (not b!406473) (not b!406478) (not b!406481) (not mapNonEmpty!17079) (not start!38886) (not b!406470) (not b!406477))
(check-sat)
