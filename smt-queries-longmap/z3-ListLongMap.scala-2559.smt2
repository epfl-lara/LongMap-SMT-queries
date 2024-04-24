; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39158 () Bool)

(assert start!39158)

(declare-fun b_free!9439 () Bool)

(declare-fun b_next!9439 () Bool)

(assert (=> start!39158 (= b_free!9439 (not b_next!9439))))

(declare-fun tp!33845 () Bool)

(declare-fun b_and!16839 () Bool)

(assert (=> start!39158 (= tp!33845 b_and!16839)))

(declare-fun b!412433 () Bool)

(declare-fun res!239522 () Bool)

(declare-fun e!246796 () Bool)

(assert (=> b!412433 (=> (not res!239522) (not e!246796))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412433 (= res!239522 (bvsle from!863 i!563))))

(declare-fun b!412434 () Bool)

(declare-fun res!239529 () Bool)

(declare-fun e!246795 () Bool)

(assert (=> b!412434 (=> (not res!239529) (not e!246795))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412434 (= res!239529 (validMask!0 mask!1025))))

(declare-fun b!412435 () Bool)

(assert (=> b!412435 (= e!246795 e!246796)))

(declare-fun res!239530 () Bool)

(assert (=> b!412435 (=> (not res!239530) (not e!246796))))

(declare-datatypes ((array!25044 0))(
  ( (array!25045 (arr!11971 (Array (_ BitVec 32) (_ BitVec 64))) (size!12323 (_ BitVec 32))) )
))
(declare-fun lt!189509 () array!25044)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25044 (_ BitVec 32)) Bool)

(assert (=> b!412435 (= res!239530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189509 mask!1025))))

(declare-fun _keys!709 () array!25044)

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!412435 (= lt!189509 (array!25045 (store (arr!11971 _keys!709) i!563 k0!794) (size!12323 _keys!709)))))

(declare-fun b!412436 () Bool)

(declare-fun res!239528 () Bool)

(assert (=> b!412436 (=> (not res!239528) (not e!246795))))

(declare-fun arrayContainsKey!0 (array!25044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412436 (= res!239528 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412437 () Bool)

(declare-fun res!239521 () Bool)

(assert (=> b!412437 (=> (not res!239521) (not e!246796))))

(declare-datatypes ((List!6824 0))(
  ( (Nil!6821) (Cons!6820 (h!7676 (_ BitVec 64)) (t!11990 List!6824)) )
))
(declare-fun arrayNoDuplicates!0 (array!25044 (_ BitVec 32) List!6824) Bool)

(assert (=> b!412437 (= res!239521 (arrayNoDuplicates!0 lt!189509 #b00000000000000000000000000000000 Nil!6821))))

(declare-fun b!412438 () Bool)

(declare-fun res!239524 () Bool)

(assert (=> b!412438 (=> (not res!239524) (not e!246795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412438 (= res!239524 (validKeyInArray!0 k0!794))))

(declare-fun b!412439 () Bool)

(declare-fun res!239531 () Bool)

(assert (=> b!412439 (=> (not res!239531) (not e!246795))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15227 0))(
  ( (V!15228 (val!5340 Int)) )
))
(declare-datatypes ((ValueCell!4952 0))(
  ( (ValueCellFull!4952 (v!7588 V!15227)) (EmptyCell!4952) )
))
(declare-datatypes ((array!25046 0))(
  ( (array!25047 (arr!11972 (Array (_ BitVec 32) ValueCell!4952)) (size!12324 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25046)

(assert (=> b!412439 (= res!239531 (and (= (size!12324 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12323 _keys!709) (size!12324 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17508 () Bool)

(declare-fun mapRes!17508 () Bool)

(assert (=> mapIsEmpty!17508 mapRes!17508))

(declare-fun b!412440 () Bool)

(declare-fun res!239525 () Bool)

(assert (=> b!412440 (=> (not res!239525) (not e!246795))))

(assert (=> b!412440 (= res!239525 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12323 _keys!709))))))

(declare-fun b!412441 () Bool)

(declare-fun e!246794 () Bool)

(declare-fun tp_is_empty!10591 () Bool)

(assert (=> b!412441 (= e!246794 tp_is_empty!10591)))

(declare-fun b!412442 () Bool)

(assert (=> b!412442 (= e!246796 false)))

(declare-fun minValue!515 () V!15227)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15227)

(declare-fun v!412 () V!15227)

(declare-datatypes ((tuple2!6804 0))(
  ( (tuple2!6805 (_1!3413 (_ BitVec 64)) (_2!3413 V!15227)) )
))
(declare-datatypes ((List!6825 0))(
  ( (Nil!6822) (Cons!6821 (h!7677 tuple2!6804) (t!11991 List!6825)) )
))
(declare-datatypes ((ListLongMap!5719 0))(
  ( (ListLongMap!5720 (toList!2875 List!6825)) )
))
(declare-fun lt!189510 () ListLongMap!5719)

(declare-fun getCurrentListMapNoExtraKeys!1127 (array!25044 array!25046 (_ BitVec 32) (_ BitVec 32) V!15227 V!15227 (_ BitVec 32) Int) ListLongMap!5719)

(assert (=> b!412442 (= lt!189510 (getCurrentListMapNoExtraKeys!1127 lt!189509 (array!25047 (store (arr!11972 _values!549) i!563 (ValueCellFull!4952 v!412)) (size!12324 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189508 () ListLongMap!5719)

(assert (=> b!412442 (= lt!189508 (getCurrentListMapNoExtraKeys!1127 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412443 () Bool)

(declare-fun e!246792 () Bool)

(assert (=> b!412443 (= e!246792 tp_is_empty!10591)))

(declare-fun b!412444 () Bool)

(declare-fun res!239532 () Bool)

(assert (=> b!412444 (=> (not res!239532) (not e!246795))))

(assert (=> b!412444 (= res!239532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412445 () Bool)

(declare-fun e!246793 () Bool)

(assert (=> b!412445 (= e!246793 (and e!246794 mapRes!17508))))

(declare-fun condMapEmpty!17508 () Bool)

(declare-fun mapDefault!17508 () ValueCell!4952)

(assert (=> b!412445 (= condMapEmpty!17508 (= (arr!11972 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4952)) mapDefault!17508)))))

(declare-fun b!412446 () Bool)

(declare-fun res!239527 () Bool)

(assert (=> b!412446 (=> (not res!239527) (not e!246795))))

(assert (=> b!412446 (= res!239527 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6821))))

(declare-fun b!412447 () Bool)

(declare-fun res!239526 () Bool)

(assert (=> b!412447 (=> (not res!239526) (not e!246795))))

(assert (=> b!412447 (= res!239526 (or (= (select (arr!11971 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11971 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17508 () Bool)

(declare-fun tp!33846 () Bool)

(assert (=> mapNonEmpty!17508 (= mapRes!17508 (and tp!33846 e!246792))))

(declare-fun mapValue!17508 () ValueCell!4952)

(declare-fun mapKey!17508 () (_ BitVec 32))

(declare-fun mapRest!17508 () (Array (_ BitVec 32) ValueCell!4952))

(assert (=> mapNonEmpty!17508 (= (arr!11972 _values!549) (store mapRest!17508 mapKey!17508 mapValue!17508))))

(declare-fun res!239523 () Bool)

(assert (=> start!39158 (=> (not res!239523) (not e!246795))))

(assert (=> start!39158 (= res!239523 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12323 _keys!709))))))

(assert (=> start!39158 e!246795))

(assert (=> start!39158 tp_is_empty!10591))

(assert (=> start!39158 tp!33845))

(assert (=> start!39158 true))

(declare-fun array_inv!8808 (array!25046) Bool)

(assert (=> start!39158 (and (array_inv!8808 _values!549) e!246793)))

(declare-fun array_inv!8809 (array!25044) Bool)

(assert (=> start!39158 (array_inv!8809 _keys!709)))

(assert (= (and start!39158 res!239523) b!412434))

(assert (= (and b!412434 res!239529) b!412439))

(assert (= (and b!412439 res!239531) b!412444))

(assert (= (and b!412444 res!239532) b!412446))

(assert (= (and b!412446 res!239527) b!412440))

(assert (= (and b!412440 res!239525) b!412438))

(assert (= (and b!412438 res!239524) b!412447))

(assert (= (and b!412447 res!239526) b!412436))

(assert (= (and b!412436 res!239528) b!412435))

(assert (= (and b!412435 res!239530) b!412437))

(assert (= (and b!412437 res!239521) b!412433))

(assert (= (and b!412433 res!239522) b!412442))

(assert (= (and b!412445 condMapEmpty!17508) mapIsEmpty!17508))

(assert (= (and b!412445 (not condMapEmpty!17508)) mapNonEmpty!17508))

(get-info :version)

(assert (= (and mapNonEmpty!17508 ((_ is ValueCellFull!4952) mapValue!17508)) b!412443))

(assert (= (and b!412445 ((_ is ValueCellFull!4952) mapDefault!17508)) b!412441))

(assert (= start!39158 b!412445))

(declare-fun m!402513 () Bool)

(assert (=> start!39158 m!402513))

(declare-fun m!402515 () Bool)

(assert (=> start!39158 m!402515))

(declare-fun m!402517 () Bool)

(assert (=> b!412447 m!402517))

(declare-fun m!402519 () Bool)

(assert (=> b!412442 m!402519))

(declare-fun m!402521 () Bool)

(assert (=> b!412442 m!402521))

(declare-fun m!402523 () Bool)

(assert (=> b!412442 m!402523))

(declare-fun m!402525 () Bool)

(assert (=> b!412435 m!402525))

(declare-fun m!402527 () Bool)

(assert (=> b!412435 m!402527))

(declare-fun m!402529 () Bool)

(assert (=> b!412436 m!402529))

(declare-fun m!402531 () Bool)

(assert (=> b!412437 m!402531))

(declare-fun m!402533 () Bool)

(assert (=> b!412434 m!402533))

(declare-fun m!402535 () Bool)

(assert (=> mapNonEmpty!17508 m!402535))

(declare-fun m!402537 () Bool)

(assert (=> b!412446 m!402537))

(declare-fun m!402539 () Bool)

(assert (=> b!412438 m!402539))

(declare-fun m!402541 () Bool)

(assert (=> b!412444 m!402541))

(check-sat b_and!16839 (not mapNonEmpty!17508) (not b!412437) (not b!412444) tp_is_empty!10591 (not b!412434) (not b_next!9439) (not b!412436) (not start!39158) (not b!412435) (not b!412446) (not b!412438) (not b!412442))
(check-sat b_and!16839 (not b_next!9439))
