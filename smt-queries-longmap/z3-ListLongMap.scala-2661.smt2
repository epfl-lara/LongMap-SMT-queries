; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39770 () Bool)

(assert start!39770)

(declare-fun b_free!10051 () Bool)

(declare-fun b_next!10051 () Bool)

(assert (=> start!39770 (= b_free!10051 (not b_next!10051))))

(declare-fun tp!35681 () Bool)

(declare-fun b_and!17735 () Bool)

(assert (=> start!39770 (= tp!35681 b_and!17735)))

(declare-fun b!428572 () Bool)

(declare-fun e!253916 () Bool)

(assert (=> b!428572 (= e!253916 true)))

(declare-datatypes ((array!26235 0))(
  ( (array!26236 (arr!12567 (Array (_ BitVec 32) (_ BitVec 64))) (size!12920 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26235)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!428572 (not (= (select (arr!12567 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12577 0))(
  ( (Unit!12578) )
))
(declare-fun lt!195730 () Unit!12577)

(declare-fun e!253910 () Unit!12577)

(assert (=> b!428572 (= lt!195730 e!253910)))

(declare-fun c!55341 () Bool)

(assert (=> b!428572 (= c!55341 (= (select (arr!12567 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!16043 0))(
  ( (V!16044 (val!5646 Int)) )
))
(declare-datatypes ((tuple2!7436 0))(
  ( (tuple2!7437 (_1!3729 (_ BitVec 64)) (_2!3729 V!16043)) )
))
(declare-datatypes ((List!7435 0))(
  ( (Nil!7432) (Cons!7431 (h!8287 tuple2!7436) (t!12926 List!7435)) )
))
(declare-datatypes ((ListLongMap!6339 0))(
  ( (ListLongMap!6340 (toList!3185 List!7435)) )
))
(declare-fun lt!195728 () ListLongMap!6339)

(declare-fun lt!195725 () ListLongMap!6339)

(declare-datatypes ((ValueCell!5258 0))(
  ( (ValueCellFull!5258 (v!7887 V!16043)) (EmptyCell!5258) )
))
(declare-datatypes ((array!26237 0))(
  ( (array!26238 (arr!12568 (Array (_ BitVec 32) ValueCell!5258)) (size!12921 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26237)

(declare-fun +!1363 (ListLongMap!6339 tuple2!7436) ListLongMap!6339)

(declare-fun get!6229 (ValueCell!5258 V!16043) V!16043)

(declare-fun dynLambda!761 (Int (_ BitVec 64)) V!16043)

(assert (=> b!428572 (= lt!195728 (+!1363 lt!195725 (tuple2!7437 (select (arr!12567 _keys!709) from!863) (get!6229 (select (arr!12568 _values!549) from!863) (dynLambda!761 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428573 () Bool)

(declare-fun res!251657 () Bool)

(declare-fun e!253915 () Bool)

(assert (=> b!428573 (=> (not res!251657) (not e!253915))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!428573 (= res!251657 (and (= (size!12921 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12920 _keys!709) (size!12921 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428574 () Bool)

(declare-fun res!251660 () Bool)

(declare-fun e!253909 () Bool)

(assert (=> b!428574 (=> (not res!251660) (not e!253909))))

(declare-fun lt!195724 () array!26235)

(declare-datatypes ((List!7436 0))(
  ( (Nil!7433) (Cons!7432 (h!8288 (_ BitVec 64)) (t!12927 List!7436)) )
))
(declare-fun arrayNoDuplicates!0 (array!26235 (_ BitVec 32) List!7436) Bool)

(assert (=> b!428574 (= res!251660 (arrayNoDuplicates!0 lt!195724 #b00000000000000000000000000000000 Nil!7433))))

(declare-fun b!428575 () Bool)

(declare-fun Unit!12579 () Unit!12577)

(assert (=> b!428575 (= e!253910 Unit!12579)))

(declare-fun mapIsEmpty!18426 () Bool)

(declare-fun mapRes!18426 () Bool)

(assert (=> mapIsEmpty!18426 mapRes!18426))

(declare-fun res!251648 () Bool)

(assert (=> start!39770 (=> (not res!251648) (not e!253915))))

(assert (=> start!39770 (= res!251648 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12920 _keys!709))))))

(assert (=> start!39770 e!253915))

(declare-fun tp_is_empty!11203 () Bool)

(assert (=> start!39770 tp_is_empty!11203))

(assert (=> start!39770 tp!35681))

(assert (=> start!39770 true))

(declare-fun e!253914 () Bool)

(declare-fun array_inv!9186 (array!26237) Bool)

(assert (=> start!39770 (and (array_inv!9186 _values!549) e!253914)))

(declare-fun array_inv!9187 (array!26235) Bool)

(assert (=> start!39770 (array_inv!9187 _keys!709)))

(declare-fun b!428576 () Bool)

(declare-fun res!251654 () Bool)

(assert (=> b!428576 (=> (not res!251654) (not e!253915))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428576 (= res!251654 (or (= (select (arr!12567 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12567 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428577 () Bool)

(declare-fun e!253917 () Bool)

(assert (=> b!428577 (= e!253917 (not e!253916))))

(declare-fun res!251649 () Bool)

(assert (=> b!428577 (=> res!251649 e!253916)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428577 (= res!251649 (not (validKeyInArray!0 (select (arr!12567 _keys!709) from!863))))))

(declare-fun lt!195727 () ListLongMap!6339)

(assert (=> b!428577 (= lt!195727 lt!195725)))

(declare-fun lt!195726 () ListLongMap!6339)

(declare-fun v!412 () V!16043)

(assert (=> b!428577 (= lt!195725 (+!1363 lt!195726 (tuple2!7437 k0!794 v!412)))))

(declare-fun minValue!515 () V!16043)

(declare-fun zeroValue!515 () V!16043)

(declare-fun lt!195731 () array!26237)

(declare-fun getCurrentListMapNoExtraKeys!1392 (array!26235 array!26237 (_ BitVec 32) (_ BitVec 32) V!16043 V!16043 (_ BitVec 32) Int) ListLongMap!6339)

(assert (=> b!428577 (= lt!195727 (getCurrentListMapNoExtraKeys!1392 lt!195724 lt!195731 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428577 (= lt!195726 (getCurrentListMapNoExtraKeys!1392 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195722 () Unit!12577)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!528 (array!26235 array!26237 (_ BitVec 32) (_ BitVec 32) V!16043 V!16043 (_ BitVec 32) (_ BitVec 64) V!16043 (_ BitVec 32) Int) Unit!12577)

(assert (=> b!428577 (= lt!195722 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!528 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428578 () Bool)

(assert (=> b!428578 (= e!253915 e!253909)))

(declare-fun res!251661 () Bool)

(assert (=> b!428578 (=> (not res!251661) (not e!253909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26235 (_ BitVec 32)) Bool)

(assert (=> b!428578 (= res!251661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195724 mask!1025))))

(assert (=> b!428578 (= lt!195724 (array!26236 (store (arr!12567 _keys!709) i!563 k0!794) (size!12920 _keys!709)))))

(declare-fun b!428579 () Bool)

(declare-fun res!251652 () Bool)

(assert (=> b!428579 (=> (not res!251652) (not e!253915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428579 (= res!251652 (validMask!0 mask!1025))))

(declare-fun b!428580 () Bool)

(assert (=> b!428580 (= e!253909 e!253917)))

(declare-fun res!251653 () Bool)

(assert (=> b!428580 (=> (not res!251653) (not e!253917))))

(assert (=> b!428580 (= res!251653 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!428580 (= lt!195728 (getCurrentListMapNoExtraKeys!1392 lt!195724 lt!195731 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428580 (= lt!195731 (array!26238 (store (arr!12568 _values!549) i!563 (ValueCellFull!5258 v!412)) (size!12921 _values!549)))))

(declare-fun lt!195729 () ListLongMap!6339)

(assert (=> b!428580 (= lt!195729 (getCurrentListMapNoExtraKeys!1392 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428581 () Bool)

(declare-fun e!253912 () Bool)

(assert (=> b!428581 (= e!253914 (and e!253912 mapRes!18426))))

(declare-fun condMapEmpty!18426 () Bool)

(declare-fun mapDefault!18426 () ValueCell!5258)

(assert (=> b!428581 (= condMapEmpty!18426 (= (arr!12568 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5258)) mapDefault!18426)))))

(declare-fun b!428582 () Bool)

(declare-fun res!251658 () Bool)

(assert (=> b!428582 (=> (not res!251658) (not e!253915))))

(assert (=> b!428582 (= res!251658 (validKeyInArray!0 k0!794))))

(declare-fun b!428583 () Bool)

(declare-fun res!251651 () Bool)

(assert (=> b!428583 (=> (not res!251651) (not e!253915))))

(assert (=> b!428583 (= res!251651 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7433))))

(declare-fun b!428584 () Bool)

(declare-fun Unit!12580 () Unit!12577)

(assert (=> b!428584 (= e!253910 Unit!12580)))

(declare-fun lt!195723 () Unit!12577)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26235 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12577)

(assert (=> b!428584 (= lt!195723 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428584 false))

(declare-fun b!428585 () Bool)

(declare-fun res!251656 () Bool)

(assert (=> b!428585 (=> (not res!251656) (not e!253915))))

(assert (=> b!428585 (= res!251656 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12920 _keys!709))))))

(declare-fun b!428586 () Bool)

(declare-fun res!251650 () Bool)

(assert (=> b!428586 (=> (not res!251650) (not e!253915))))

(assert (=> b!428586 (= res!251650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428587 () Bool)

(declare-fun res!251655 () Bool)

(assert (=> b!428587 (=> (not res!251655) (not e!253909))))

(assert (=> b!428587 (= res!251655 (bvsle from!863 i!563))))

(declare-fun b!428588 () Bool)

(assert (=> b!428588 (= e!253912 tp_is_empty!11203)))

(declare-fun b!428589 () Bool)

(declare-fun res!251659 () Bool)

(assert (=> b!428589 (=> (not res!251659) (not e!253915))))

(declare-fun arrayContainsKey!0 (array!26235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428589 (= res!251659 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428590 () Bool)

(declare-fun e!253911 () Bool)

(assert (=> b!428590 (= e!253911 tp_is_empty!11203)))

(declare-fun mapNonEmpty!18426 () Bool)

(declare-fun tp!35682 () Bool)

(assert (=> mapNonEmpty!18426 (= mapRes!18426 (and tp!35682 e!253911))))

(declare-fun mapValue!18426 () ValueCell!5258)

(declare-fun mapKey!18426 () (_ BitVec 32))

(declare-fun mapRest!18426 () (Array (_ BitVec 32) ValueCell!5258))

(assert (=> mapNonEmpty!18426 (= (arr!12568 _values!549) (store mapRest!18426 mapKey!18426 mapValue!18426))))

(assert (= (and start!39770 res!251648) b!428579))

(assert (= (and b!428579 res!251652) b!428573))

(assert (= (and b!428573 res!251657) b!428586))

(assert (= (and b!428586 res!251650) b!428583))

(assert (= (and b!428583 res!251651) b!428585))

(assert (= (and b!428585 res!251656) b!428582))

(assert (= (and b!428582 res!251658) b!428576))

(assert (= (and b!428576 res!251654) b!428589))

(assert (= (and b!428589 res!251659) b!428578))

(assert (= (and b!428578 res!251661) b!428574))

(assert (= (and b!428574 res!251660) b!428587))

(assert (= (and b!428587 res!251655) b!428580))

(assert (= (and b!428580 res!251653) b!428577))

(assert (= (and b!428577 (not res!251649)) b!428572))

(assert (= (and b!428572 c!55341) b!428584))

(assert (= (and b!428572 (not c!55341)) b!428575))

(assert (= (and b!428581 condMapEmpty!18426) mapIsEmpty!18426))

(assert (= (and b!428581 (not condMapEmpty!18426)) mapNonEmpty!18426))

(get-info :version)

(assert (= (and mapNonEmpty!18426 ((_ is ValueCellFull!5258) mapValue!18426)) b!428590))

(assert (= (and b!428581 ((_ is ValueCellFull!5258) mapDefault!18426)) b!428588))

(assert (= start!39770 b!428581))

(declare-fun b_lambda!9121 () Bool)

(assert (=> (not b_lambda!9121) (not b!428572)))

(declare-fun t!12925 () Bool)

(declare-fun tb!3449 () Bool)

(assert (=> (and start!39770 (= defaultEntry!557 defaultEntry!557) t!12925) tb!3449))

(declare-fun result!6433 () Bool)

(assert (=> tb!3449 (= result!6433 tp_is_empty!11203)))

(assert (=> b!428572 t!12925))

(declare-fun b_and!17737 () Bool)

(assert (= b_and!17735 (and (=> t!12925 result!6433) b_and!17737)))

(declare-fun m!416493 () Bool)

(assert (=> b!428574 m!416493))

(declare-fun m!416495 () Bool)

(assert (=> b!428578 m!416495))

(declare-fun m!416497 () Bool)

(assert (=> b!428578 m!416497))

(declare-fun m!416499 () Bool)

(assert (=> b!428580 m!416499))

(declare-fun m!416501 () Bool)

(assert (=> b!428580 m!416501))

(declare-fun m!416503 () Bool)

(assert (=> b!428580 m!416503))

(declare-fun m!416505 () Bool)

(assert (=> start!39770 m!416505))

(declare-fun m!416507 () Bool)

(assert (=> start!39770 m!416507))

(declare-fun m!416509 () Bool)

(assert (=> b!428577 m!416509))

(declare-fun m!416511 () Bool)

(assert (=> b!428577 m!416511))

(declare-fun m!416513 () Bool)

(assert (=> b!428577 m!416513))

(declare-fun m!416515 () Bool)

(assert (=> b!428577 m!416515))

(declare-fun m!416517 () Bool)

(assert (=> b!428577 m!416517))

(assert (=> b!428577 m!416509))

(declare-fun m!416519 () Bool)

(assert (=> b!428577 m!416519))

(declare-fun m!416521 () Bool)

(assert (=> b!428582 m!416521))

(declare-fun m!416523 () Bool)

(assert (=> b!428589 m!416523))

(declare-fun m!416525 () Bool)

(assert (=> mapNonEmpty!18426 m!416525))

(declare-fun m!416527 () Bool)

(assert (=> b!428583 m!416527))

(assert (=> b!428572 m!416509))

(declare-fun m!416529 () Bool)

(assert (=> b!428572 m!416529))

(declare-fun m!416531 () Bool)

(assert (=> b!428572 m!416531))

(declare-fun m!416533 () Bool)

(assert (=> b!428572 m!416533))

(assert (=> b!428572 m!416531))

(assert (=> b!428572 m!416529))

(declare-fun m!416535 () Bool)

(assert (=> b!428572 m!416535))

(declare-fun m!416537 () Bool)

(assert (=> b!428586 m!416537))

(declare-fun m!416539 () Bool)

(assert (=> b!428576 m!416539))

(declare-fun m!416541 () Bool)

(assert (=> b!428584 m!416541))

(declare-fun m!416543 () Bool)

(assert (=> b!428579 m!416543))

(check-sat (not start!39770) b_and!17737 (not b!428572) (not mapNonEmpty!18426) (not b!428579) (not b!428574) tp_is_empty!11203 (not b_lambda!9121) (not b!428586) (not b!428583) (not b!428577) (not b!428589) (not b_next!10051) (not b!428578) (not b!428582) (not b!428584) (not b!428580))
(check-sat b_and!17737 (not b_next!10051))
