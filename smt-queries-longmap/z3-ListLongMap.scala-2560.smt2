; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39164 () Bool)

(assert start!39164)

(declare-fun b_free!9445 () Bool)

(declare-fun b_next!9445 () Bool)

(assert (=> start!39164 (= b_free!9445 (not b_next!9445))))

(declare-fun tp!33863 () Bool)

(declare-fun b_and!16845 () Bool)

(assert (=> start!39164 (= tp!33863 b_and!16845)))

(declare-fun b!412568 () Bool)

(declare-fun res!239631 () Bool)

(declare-fun e!246847 () Bool)

(assert (=> b!412568 (=> (not res!239631) (not e!246847))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25056 0))(
  ( (array!25057 (arr!11977 (Array (_ BitVec 32) (_ BitVec 64))) (size!12329 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25056)

(assert (=> b!412568 (= res!239631 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12329 _keys!709))))))

(declare-fun b!412569 () Bool)

(declare-fun res!239640 () Bool)

(assert (=> b!412569 (=> (not res!239640) (not e!246847))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15235 0))(
  ( (V!15236 (val!5343 Int)) )
))
(declare-datatypes ((ValueCell!4955 0))(
  ( (ValueCellFull!4955 (v!7591 V!15235)) (EmptyCell!4955) )
))
(declare-datatypes ((array!25058 0))(
  ( (array!25059 (arr!11978 (Array (_ BitVec 32) ValueCell!4955)) (size!12330 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25058)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!412569 (= res!239640 (and (= (size!12330 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12329 _keys!709) (size!12330 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412570 () Bool)

(declare-fun e!246846 () Bool)

(assert (=> b!412570 (= e!246846 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15235)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15235)

(declare-fun lt!189536 () array!25056)

(declare-datatypes ((tuple2!6810 0))(
  ( (tuple2!6811 (_1!3416 (_ BitVec 64)) (_2!3416 V!15235)) )
))
(declare-datatypes ((List!6830 0))(
  ( (Nil!6827) (Cons!6826 (h!7682 tuple2!6810) (t!11996 List!6830)) )
))
(declare-datatypes ((ListLongMap!5725 0))(
  ( (ListLongMap!5726 (toList!2878 List!6830)) )
))
(declare-fun lt!189537 () ListLongMap!5725)

(declare-fun v!412 () V!15235)

(declare-fun getCurrentListMapNoExtraKeys!1130 (array!25056 array!25058 (_ BitVec 32) (_ BitVec 32) V!15235 V!15235 (_ BitVec 32) Int) ListLongMap!5725)

(assert (=> b!412570 (= lt!189537 (getCurrentListMapNoExtraKeys!1130 lt!189536 (array!25059 (store (arr!11978 _values!549) i!563 (ValueCellFull!4955 v!412)) (size!12330 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189535 () ListLongMap!5725)

(assert (=> b!412570 (= lt!189535 (getCurrentListMapNoExtraKeys!1130 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412571 () Bool)

(declare-fun e!246848 () Bool)

(declare-fun e!246850 () Bool)

(declare-fun mapRes!17517 () Bool)

(assert (=> b!412571 (= e!246848 (and e!246850 mapRes!17517))))

(declare-fun condMapEmpty!17517 () Bool)

(declare-fun mapDefault!17517 () ValueCell!4955)

(assert (=> b!412571 (= condMapEmpty!17517 (= (arr!11978 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4955)) mapDefault!17517)))))

(declare-fun b!412572 () Bool)

(declare-fun res!239635 () Bool)

(assert (=> b!412572 (=> (not res!239635) (not e!246846))))

(declare-datatypes ((List!6831 0))(
  ( (Nil!6828) (Cons!6827 (h!7683 (_ BitVec 64)) (t!11997 List!6831)) )
))
(declare-fun arrayNoDuplicates!0 (array!25056 (_ BitVec 32) List!6831) Bool)

(assert (=> b!412572 (= res!239635 (arrayNoDuplicates!0 lt!189536 #b00000000000000000000000000000000 Nil!6828))))

(declare-fun b!412573 () Bool)

(declare-fun res!239639 () Bool)

(assert (=> b!412573 (=> (not res!239639) (not e!246846))))

(assert (=> b!412573 (= res!239639 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17517 () Bool)

(declare-fun tp!33864 () Bool)

(declare-fun e!246845 () Bool)

(assert (=> mapNonEmpty!17517 (= mapRes!17517 (and tp!33864 e!246845))))

(declare-fun mapRest!17517 () (Array (_ BitVec 32) ValueCell!4955))

(declare-fun mapKey!17517 () (_ BitVec 32))

(declare-fun mapValue!17517 () ValueCell!4955)

(assert (=> mapNonEmpty!17517 (= (arr!11978 _values!549) (store mapRest!17517 mapKey!17517 mapValue!17517))))

(declare-fun b!412574 () Bool)

(declare-fun tp_is_empty!10597 () Bool)

(assert (=> b!412574 (= e!246845 tp_is_empty!10597)))

(declare-fun b!412575 () Bool)

(declare-fun res!239632 () Bool)

(assert (=> b!412575 (=> (not res!239632) (not e!246847))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412575 (= res!239632 (validKeyInArray!0 k0!794))))

(declare-fun res!239633 () Bool)

(assert (=> start!39164 (=> (not res!239633) (not e!246847))))

(assert (=> start!39164 (= res!239633 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12329 _keys!709))))))

(assert (=> start!39164 e!246847))

(assert (=> start!39164 tp_is_empty!10597))

(assert (=> start!39164 tp!33863))

(assert (=> start!39164 true))

(declare-fun array_inv!8814 (array!25058) Bool)

(assert (=> start!39164 (and (array_inv!8814 _values!549) e!246848)))

(declare-fun array_inv!8815 (array!25056) Bool)

(assert (=> start!39164 (array_inv!8815 _keys!709)))

(declare-fun b!412576 () Bool)

(assert (=> b!412576 (= e!246847 e!246846)))

(declare-fun res!239634 () Bool)

(assert (=> b!412576 (=> (not res!239634) (not e!246846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25056 (_ BitVec 32)) Bool)

(assert (=> b!412576 (= res!239634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189536 mask!1025))))

(assert (=> b!412576 (= lt!189536 (array!25057 (store (arr!11977 _keys!709) i!563 k0!794) (size!12329 _keys!709)))))

(declare-fun b!412577 () Bool)

(declare-fun res!239630 () Bool)

(assert (=> b!412577 (=> (not res!239630) (not e!246847))))

(declare-fun arrayContainsKey!0 (array!25056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412577 (= res!239630 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412578 () Bool)

(declare-fun res!239629 () Bool)

(assert (=> b!412578 (=> (not res!239629) (not e!246847))))

(assert (=> b!412578 (= res!239629 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6828))))

(declare-fun b!412579 () Bool)

(declare-fun res!239637 () Bool)

(assert (=> b!412579 (=> (not res!239637) (not e!246847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412579 (= res!239637 (validMask!0 mask!1025))))

(declare-fun b!412580 () Bool)

(declare-fun res!239638 () Bool)

(assert (=> b!412580 (=> (not res!239638) (not e!246847))))

(assert (=> b!412580 (= res!239638 (or (= (select (arr!11977 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11977 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412581 () Bool)

(declare-fun res!239636 () Bool)

(assert (=> b!412581 (=> (not res!239636) (not e!246847))))

(assert (=> b!412581 (= res!239636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412582 () Bool)

(assert (=> b!412582 (= e!246850 tp_is_empty!10597)))

(declare-fun mapIsEmpty!17517 () Bool)

(assert (=> mapIsEmpty!17517 mapRes!17517))

(assert (= (and start!39164 res!239633) b!412579))

(assert (= (and b!412579 res!239637) b!412569))

(assert (= (and b!412569 res!239640) b!412581))

(assert (= (and b!412581 res!239636) b!412578))

(assert (= (and b!412578 res!239629) b!412568))

(assert (= (and b!412568 res!239631) b!412575))

(assert (= (and b!412575 res!239632) b!412580))

(assert (= (and b!412580 res!239638) b!412577))

(assert (= (and b!412577 res!239630) b!412576))

(assert (= (and b!412576 res!239634) b!412572))

(assert (= (and b!412572 res!239635) b!412573))

(assert (= (and b!412573 res!239639) b!412570))

(assert (= (and b!412571 condMapEmpty!17517) mapIsEmpty!17517))

(assert (= (and b!412571 (not condMapEmpty!17517)) mapNonEmpty!17517))

(get-info :version)

(assert (= (and mapNonEmpty!17517 ((_ is ValueCellFull!4955) mapValue!17517)) b!412574))

(assert (= (and b!412571 ((_ is ValueCellFull!4955) mapDefault!17517)) b!412582))

(assert (= start!39164 b!412571))

(declare-fun m!402603 () Bool)

(assert (=> b!412572 m!402603))

(declare-fun m!402605 () Bool)

(assert (=> b!412580 m!402605))

(declare-fun m!402607 () Bool)

(assert (=> b!412576 m!402607))

(declare-fun m!402609 () Bool)

(assert (=> b!412576 m!402609))

(declare-fun m!402611 () Bool)

(assert (=> b!412577 m!402611))

(declare-fun m!402613 () Bool)

(assert (=> b!412581 m!402613))

(declare-fun m!402615 () Bool)

(assert (=> start!39164 m!402615))

(declare-fun m!402617 () Bool)

(assert (=> start!39164 m!402617))

(declare-fun m!402619 () Bool)

(assert (=> b!412578 m!402619))

(declare-fun m!402621 () Bool)

(assert (=> b!412579 m!402621))

(declare-fun m!402623 () Bool)

(assert (=> b!412575 m!402623))

(declare-fun m!402625 () Bool)

(assert (=> b!412570 m!402625))

(declare-fun m!402627 () Bool)

(assert (=> b!412570 m!402627))

(declare-fun m!402629 () Bool)

(assert (=> b!412570 m!402629))

(declare-fun m!402631 () Bool)

(assert (=> mapNonEmpty!17517 m!402631))

(check-sat (not b!412575) (not b_next!9445) (not b!412570) (not b!412578) (not b!412579) b_and!16845 (not mapNonEmpty!17517) (not start!39164) (not b!412577) (not b!412576) (not b!412572) (not b!412581) tp_is_empty!10597)
(check-sat b_and!16845 (not b_next!9445))
