; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39174 () Bool)

(assert start!39174)

(declare-fun b_free!9441 () Bool)

(declare-fun b_next!9441 () Bool)

(assert (=> start!39174 (= b_free!9441 (not b_next!9441))))

(declare-fun tp!33851 () Bool)

(declare-fun b_and!16827 () Bool)

(assert (=> start!39174 (= tp!33851 b_and!16827)))

(declare-fun b!412527 () Bool)

(declare-fun res!239560 () Bool)

(declare-fun e!246845 () Bool)

(assert (=> b!412527 (=> (not res!239560) (not e!246845))))

(declare-datatypes ((array!25047 0))(
  ( (array!25048 (arr!11973 (Array (_ BitVec 32) (_ BitVec 64))) (size!12325 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25047)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15229 0))(
  ( (V!15230 (val!5341 Int)) )
))
(declare-datatypes ((ValueCell!4953 0))(
  ( (ValueCellFull!4953 (v!7588 V!15229)) (EmptyCell!4953) )
))
(declare-datatypes ((array!25049 0))(
  ( (array!25050 (arr!11974 (Array (_ BitVec 32) ValueCell!4953)) (size!12326 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25049)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!412527 (= res!239560 (and (= (size!12326 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12325 _keys!709) (size!12326 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!239565 () Bool)

(assert (=> start!39174 (=> (not res!239565) (not e!246845))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39174 (= res!239565 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12325 _keys!709))))))

(assert (=> start!39174 e!246845))

(declare-fun tp_is_empty!10593 () Bool)

(assert (=> start!39174 tp_is_empty!10593))

(assert (=> start!39174 tp!33851))

(assert (=> start!39174 true))

(declare-fun e!246844 () Bool)

(declare-fun array_inv!8730 (array!25049) Bool)

(assert (=> start!39174 (and (array_inv!8730 _values!549) e!246844)))

(declare-fun array_inv!8731 (array!25047) Bool)

(assert (=> start!39174 (array_inv!8731 _keys!709)))

(declare-fun b!412528 () Bool)

(declare-fun e!246846 () Bool)

(assert (=> b!412528 (= e!246845 e!246846)))

(declare-fun res!239568 () Bool)

(assert (=> b!412528 (=> (not res!239568) (not e!246846))))

(declare-fun lt!189499 () array!25047)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25047 (_ BitVec 32)) Bool)

(assert (=> b!412528 (= res!239568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189499 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412528 (= lt!189499 (array!25048 (store (arr!11973 _keys!709) i!563 k0!794) (size!12325 _keys!709)))))

(declare-fun mapNonEmpty!17511 () Bool)

(declare-fun mapRes!17511 () Bool)

(declare-fun tp!33852 () Bool)

(declare-fun e!246843 () Bool)

(assert (=> mapNonEmpty!17511 (= mapRes!17511 (and tp!33852 e!246843))))

(declare-fun mapRest!17511 () (Array (_ BitVec 32) ValueCell!4953))

(declare-fun mapKey!17511 () (_ BitVec 32))

(declare-fun mapValue!17511 () ValueCell!4953)

(assert (=> mapNonEmpty!17511 (= (arr!11974 _values!549) (store mapRest!17511 mapKey!17511 mapValue!17511))))

(declare-fun b!412529 () Bool)

(assert (=> b!412529 (= e!246843 tp_is_empty!10593)))

(declare-fun b!412530 () Bool)

(declare-fun res!239564 () Bool)

(assert (=> b!412530 (=> (not res!239564) (not e!246845))))

(declare-datatypes ((List!6958 0))(
  ( (Nil!6955) (Cons!6954 (h!7810 (_ BitVec 64)) (t!12132 List!6958)) )
))
(declare-fun arrayNoDuplicates!0 (array!25047 (_ BitVec 32) List!6958) Bool)

(assert (=> b!412530 (= res!239564 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6955))))

(declare-fun b!412531 () Bool)

(declare-fun res!239567 () Bool)

(assert (=> b!412531 (=> (not res!239567) (not e!246846))))

(assert (=> b!412531 (= res!239567 (bvsle from!863 i!563))))

(declare-fun b!412532 () Bool)

(declare-fun res!239571 () Bool)

(assert (=> b!412532 (=> (not res!239571) (not e!246846))))

(assert (=> b!412532 (= res!239571 (arrayNoDuplicates!0 lt!189499 #b00000000000000000000000000000000 Nil!6955))))

(declare-fun b!412533 () Bool)

(declare-fun e!246841 () Bool)

(assert (=> b!412533 (= e!246844 (and e!246841 mapRes!17511))))

(declare-fun condMapEmpty!17511 () Bool)

(declare-fun mapDefault!17511 () ValueCell!4953)

(assert (=> b!412533 (= condMapEmpty!17511 (= (arr!11974 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4953)) mapDefault!17511)))))

(declare-fun b!412534 () Bool)

(declare-fun res!239561 () Bool)

(assert (=> b!412534 (=> (not res!239561) (not e!246845))))

(assert (=> b!412534 (= res!239561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412535 () Bool)

(declare-fun res!239563 () Bool)

(assert (=> b!412535 (=> (not res!239563) (not e!246845))))

(assert (=> b!412535 (= res!239563 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12325 _keys!709))))))

(declare-fun b!412536 () Bool)

(declare-fun res!239562 () Bool)

(assert (=> b!412536 (=> (not res!239562) (not e!246845))))

(assert (=> b!412536 (= res!239562 (or (= (select (arr!11973 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11973 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412537 () Bool)

(declare-fun res!239570 () Bool)

(assert (=> b!412537 (=> (not res!239570) (not e!246845))))

(declare-fun arrayContainsKey!0 (array!25047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412537 (= res!239570 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412538 () Bool)

(declare-fun res!239566 () Bool)

(assert (=> b!412538 (=> (not res!239566) (not e!246845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412538 (= res!239566 (validKeyInArray!0 k0!794))))

(declare-fun b!412539 () Bool)

(declare-fun res!239569 () Bool)

(assert (=> b!412539 (=> (not res!239569) (not e!246845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412539 (= res!239569 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17511 () Bool)

(assert (=> mapIsEmpty!17511 mapRes!17511))

(declare-fun b!412540 () Bool)

(assert (=> b!412540 (= e!246846 false)))

(declare-datatypes ((tuple2!6932 0))(
  ( (tuple2!6933 (_1!3477 (_ BitVec 64)) (_2!3477 V!15229)) )
))
(declare-datatypes ((List!6959 0))(
  ( (Nil!6956) (Cons!6955 (h!7811 tuple2!6932) (t!12133 List!6959)) )
))
(declare-datatypes ((ListLongMap!5845 0))(
  ( (ListLongMap!5846 (toList!2938 List!6959)) )
))
(declare-fun lt!189500 () ListLongMap!5845)

(declare-fun minValue!515 () V!15229)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15229)

(declare-fun v!412 () V!15229)

(declare-fun getCurrentListMapNoExtraKeys!1146 (array!25047 array!25049 (_ BitVec 32) (_ BitVec 32) V!15229 V!15229 (_ BitVec 32) Int) ListLongMap!5845)

(assert (=> b!412540 (= lt!189500 (getCurrentListMapNoExtraKeys!1146 lt!189499 (array!25050 (store (arr!11974 _values!549) i!563 (ValueCellFull!4953 v!412)) (size!12326 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189498 () ListLongMap!5845)

(assert (=> b!412540 (= lt!189498 (getCurrentListMapNoExtraKeys!1146 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412541 () Bool)

(assert (=> b!412541 (= e!246841 tp_is_empty!10593)))

(assert (= (and start!39174 res!239565) b!412539))

(assert (= (and b!412539 res!239569) b!412527))

(assert (= (and b!412527 res!239560) b!412534))

(assert (= (and b!412534 res!239561) b!412530))

(assert (= (and b!412530 res!239564) b!412535))

(assert (= (and b!412535 res!239563) b!412538))

(assert (= (and b!412538 res!239566) b!412536))

(assert (= (and b!412536 res!239562) b!412537))

(assert (= (and b!412537 res!239570) b!412528))

(assert (= (and b!412528 res!239568) b!412532))

(assert (= (and b!412532 res!239571) b!412531))

(assert (= (and b!412531 res!239567) b!412540))

(assert (= (and b!412533 condMapEmpty!17511) mapIsEmpty!17511))

(assert (= (and b!412533 (not condMapEmpty!17511)) mapNonEmpty!17511))

(get-info :version)

(assert (= (and mapNonEmpty!17511 ((_ is ValueCellFull!4953) mapValue!17511)) b!412529))

(assert (= (and b!412533 ((_ is ValueCellFull!4953) mapDefault!17511)) b!412541))

(assert (= start!39174 b!412533))

(declare-fun m!402313 () Bool)

(assert (=> b!412530 m!402313))

(declare-fun m!402315 () Bool)

(assert (=> mapNonEmpty!17511 m!402315))

(declare-fun m!402317 () Bool)

(assert (=> start!39174 m!402317))

(declare-fun m!402319 () Bool)

(assert (=> start!39174 m!402319))

(declare-fun m!402321 () Bool)

(assert (=> b!412536 m!402321))

(declare-fun m!402323 () Bool)

(assert (=> b!412539 m!402323))

(declare-fun m!402325 () Bool)

(assert (=> b!412538 m!402325))

(declare-fun m!402327 () Bool)

(assert (=> b!412540 m!402327))

(declare-fun m!402329 () Bool)

(assert (=> b!412540 m!402329))

(declare-fun m!402331 () Bool)

(assert (=> b!412540 m!402331))

(declare-fun m!402333 () Bool)

(assert (=> b!412537 m!402333))

(declare-fun m!402335 () Bool)

(assert (=> b!412528 m!402335))

(declare-fun m!402337 () Bool)

(assert (=> b!412528 m!402337))

(declare-fun m!402339 () Bool)

(assert (=> b!412532 m!402339))

(declare-fun m!402341 () Bool)

(assert (=> b!412534 m!402341))

(check-sat (not b!412530) (not mapNonEmpty!17511) (not b!412539) (not b_next!9441) (not b!412538) b_and!16827 (not b!412528) (not b!412532) (not b!412537) (not start!39174) tp_is_empty!10593 (not b!412540) (not b!412534))
(check-sat b_and!16827 (not b_next!9441))
