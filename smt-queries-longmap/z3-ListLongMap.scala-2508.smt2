; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38852 () Bool)

(assert start!38852)

(declare-fun b!406030 () Bool)

(declare-fun res!234496 () Bool)

(declare-fun e!244041 () Bool)

(assert (=> b!406030 (=> (not res!234496) (not e!244041))))

(declare-datatypes ((array!24448 0))(
  ( (array!24449 (arr!11673 (Array (_ BitVec 32) (_ BitVec 64))) (size!12025 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24448)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406030 (= res!234496 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406031 () Bool)

(declare-fun res!234503 () Bool)

(assert (=> b!406031 (=> (not res!234503) (not e!244041))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406031 (= res!234503 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12025 _keys!709))))))

(declare-fun b!406032 () Bool)

(declare-fun e!244039 () Bool)

(assert (=> b!406032 (= e!244041 e!244039)))

(declare-fun res!234500 () Bool)

(assert (=> b!406032 (=> (not res!234500) (not e!244039))))

(declare-fun lt!188454 () array!24448)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24448 (_ BitVec 32)) Bool)

(assert (=> b!406032 (= res!234500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188454 mask!1025))))

(assert (=> b!406032 (= lt!188454 (array!24449 (store (arr!11673 _keys!709) i!563 k0!794) (size!12025 _keys!709)))))

(declare-fun b!406033 () Bool)

(declare-fun res!234499 () Bool)

(assert (=> b!406033 (=> (not res!234499) (not e!244041))))

(assert (=> b!406033 (= res!234499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406034 () Bool)

(declare-fun res!234504 () Bool)

(assert (=> b!406034 (=> (not res!234504) (not e!244041))))

(declare-datatypes ((List!6661 0))(
  ( (Nil!6658) (Cons!6657 (h!7513 (_ BitVec 64)) (t!11827 List!6661)) )
))
(declare-fun arrayNoDuplicates!0 (array!24448 (_ BitVec 32) List!6661) Bool)

(assert (=> b!406034 (= res!234504 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6658))))

(declare-fun b!406035 () Bool)

(declare-fun e!244038 () Bool)

(declare-fun tp_is_empty!10285 () Bool)

(assert (=> b!406035 (= e!244038 tp_is_empty!10285)))

(declare-fun b!406036 () Bool)

(declare-fun e!244037 () Bool)

(assert (=> b!406036 (= e!244037 tp_is_empty!10285)))

(declare-fun b!406037 () Bool)

(assert (=> b!406037 (= e!244039 false)))

(declare-fun lt!188453 () Bool)

(assert (=> b!406037 (= lt!188453 (arrayNoDuplicates!0 lt!188454 #b00000000000000000000000000000000 Nil!6658))))

(declare-fun mapNonEmpty!17049 () Bool)

(declare-fun mapRes!17049 () Bool)

(declare-fun tp!33168 () Bool)

(assert (=> mapNonEmpty!17049 (= mapRes!17049 (and tp!33168 e!244038))))

(declare-datatypes ((V!14819 0))(
  ( (V!14820 (val!5187 Int)) )
))
(declare-datatypes ((ValueCell!4799 0))(
  ( (ValueCellFull!4799 (v!7435 V!14819)) (EmptyCell!4799) )
))
(declare-fun mapValue!17049 () ValueCell!4799)

(declare-datatypes ((array!24450 0))(
  ( (array!24451 (arr!11674 (Array (_ BitVec 32) ValueCell!4799)) (size!12026 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24450)

(declare-fun mapKey!17049 () (_ BitVec 32))

(declare-fun mapRest!17049 () (Array (_ BitVec 32) ValueCell!4799))

(assert (=> mapNonEmpty!17049 (= (arr!11674 _values!549) (store mapRest!17049 mapKey!17049 mapValue!17049))))

(declare-fun res!234497 () Bool)

(assert (=> start!38852 (=> (not res!234497) (not e!244041))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38852 (= res!234497 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12025 _keys!709))))))

(assert (=> start!38852 e!244041))

(assert (=> start!38852 true))

(declare-fun e!244042 () Bool)

(declare-fun array_inv!8620 (array!24450) Bool)

(assert (=> start!38852 (and (array_inv!8620 _values!549) e!244042)))

(declare-fun array_inv!8621 (array!24448) Bool)

(assert (=> start!38852 (array_inv!8621 _keys!709)))

(declare-fun b!406038 () Bool)

(assert (=> b!406038 (= e!244042 (and e!244037 mapRes!17049))))

(declare-fun condMapEmpty!17049 () Bool)

(declare-fun mapDefault!17049 () ValueCell!4799)

(assert (=> b!406038 (= condMapEmpty!17049 (= (arr!11674 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4799)) mapDefault!17049)))))

(declare-fun b!406039 () Bool)

(declare-fun res!234498 () Bool)

(assert (=> b!406039 (=> (not res!234498) (not e!244041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406039 (= res!234498 (validKeyInArray!0 k0!794))))

(declare-fun b!406040 () Bool)

(declare-fun res!234502 () Bool)

(assert (=> b!406040 (=> (not res!234502) (not e!244041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406040 (= res!234502 (validMask!0 mask!1025))))

(declare-fun b!406041 () Bool)

(declare-fun res!234495 () Bool)

(assert (=> b!406041 (=> (not res!234495) (not e!244041))))

(assert (=> b!406041 (= res!234495 (or (= (select (arr!11673 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11673 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17049 () Bool)

(assert (=> mapIsEmpty!17049 mapRes!17049))

(declare-fun b!406042 () Bool)

(declare-fun res!234501 () Bool)

(assert (=> b!406042 (=> (not res!234501) (not e!244041))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406042 (= res!234501 (and (= (size!12026 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12025 _keys!709) (size!12026 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38852 res!234497) b!406040))

(assert (= (and b!406040 res!234502) b!406042))

(assert (= (and b!406042 res!234501) b!406033))

(assert (= (and b!406033 res!234499) b!406034))

(assert (= (and b!406034 res!234504) b!406031))

(assert (= (and b!406031 res!234503) b!406039))

(assert (= (and b!406039 res!234498) b!406041))

(assert (= (and b!406041 res!234495) b!406030))

(assert (= (and b!406030 res!234496) b!406032))

(assert (= (and b!406032 res!234500) b!406037))

(assert (= (and b!406038 condMapEmpty!17049) mapIsEmpty!17049))

(assert (= (and b!406038 (not condMapEmpty!17049)) mapNonEmpty!17049))

(get-info :version)

(assert (= (and mapNonEmpty!17049 ((_ is ValueCellFull!4799) mapValue!17049)) b!406035))

(assert (= (and b!406038 ((_ is ValueCellFull!4799) mapDefault!17049)) b!406036))

(assert (= start!38852 b!406038))

(declare-fun m!398517 () Bool)

(assert (=> b!406040 m!398517))

(declare-fun m!398519 () Bool)

(assert (=> b!406039 m!398519))

(declare-fun m!398521 () Bool)

(assert (=> b!406034 m!398521))

(declare-fun m!398523 () Bool)

(assert (=> mapNonEmpty!17049 m!398523))

(declare-fun m!398525 () Bool)

(assert (=> b!406041 m!398525))

(declare-fun m!398527 () Bool)

(assert (=> b!406030 m!398527))

(declare-fun m!398529 () Bool)

(assert (=> b!406032 m!398529))

(declare-fun m!398531 () Bool)

(assert (=> b!406032 m!398531))

(declare-fun m!398533 () Bool)

(assert (=> b!406037 m!398533))

(declare-fun m!398535 () Bool)

(assert (=> b!406033 m!398535))

(declare-fun m!398537 () Bool)

(assert (=> start!38852 m!398537))

(declare-fun m!398539 () Bool)

(assert (=> start!38852 m!398539))

(check-sat (not b!406037) (not mapNonEmpty!17049) (not b!406034) (not b!406030) tp_is_empty!10285 (not b!406032) (not b!406039) (not start!38852) (not b!406033) (not b!406040))
(check-sat)
