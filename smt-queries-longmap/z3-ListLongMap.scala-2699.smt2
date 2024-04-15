; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39998 () Bool)

(assert start!39998)

(declare-fun b_free!10279 () Bool)

(declare-fun b_next!10279 () Bool)

(assert (=> start!39998 (= b_free!10279 (not b_next!10279))))

(declare-fun tp!36365 () Bool)

(declare-fun b_and!18191 () Bool)

(assert (=> start!39998 (= tp!36365 b_and!18191)))

(declare-fun b!435579 () Bool)

(declare-fun e!257276 () Bool)

(declare-fun e!257268 () Bool)

(assert (=> b!435579 (= e!257276 e!257268)))

(declare-fun res!256722 () Bool)

(assert (=> b!435579 (=> res!256722 e!257268)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26685 0))(
  ( (array!26686 (arr!12792 (Array (_ BitVec 32) (_ BitVec 64))) (size!13145 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26685)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!435579 (= res!256722 (= k0!794 (select (arr!12792 _keys!709) from!863)))))

(assert (=> b!435579 (not (= (select (arr!12792 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12925 0))(
  ( (Unit!12926) )
))
(declare-fun lt!200555 () Unit!12925)

(declare-fun e!257270 () Unit!12925)

(assert (=> b!435579 (= lt!200555 e!257270)))

(declare-fun c!55683 () Bool)

(assert (=> b!435579 (= c!55683 (= (select (arr!12792 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16347 0))(
  ( (V!16348 (val!5760 Int)) )
))
(declare-datatypes ((tuple2!7640 0))(
  ( (tuple2!7641 (_1!3831 (_ BitVec 64)) (_2!3831 V!16347)) )
))
(declare-datatypes ((List!7627 0))(
  ( (Nil!7624) (Cons!7623 (h!8479 tuple2!7640) (t!13346 List!7627)) )
))
(declare-datatypes ((ListLongMap!6543 0))(
  ( (ListLongMap!6544 (toList!3287 List!7627)) )
))
(declare-fun lt!200559 () ListLongMap!6543)

(declare-fun lt!200551 () ListLongMap!6543)

(assert (=> b!435579 (= lt!200559 lt!200551)))

(declare-fun lt!200557 () ListLongMap!6543)

(declare-fun lt!200553 () tuple2!7640)

(declare-fun +!1462 (ListLongMap!6543 tuple2!7640) ListLongMap!6543)

(assert (=> b!435579 (= lt!200551 (+!1462 lt!200557 lt!200553))))

(declare-fun lt!200561 () V!16347)

(assert (=> b!435579 (= lt!200553 (tuple2!7641 (select (arr!12792 _keys!709) from!863) lt!200561))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5372 0))(
  ( (ValueCellFull!5372 (v!8001 V!16347)) (EmptyCell!5372) )
))
(declare-datatypes ((array!26687 0))(
  ( (array!26688 (arr!12793 (Array (_ BitVec 32) ValueCell!5372)) (size!13146 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26687)

(declare-fun get!6382 (ValueCell!5372 V!16347) V!16347)

(declare-fun dynLambda!838 (Int (_ BitVec 64)) V!16347)

(assert (=> b!435579 (= lt!200561 (get!6382 (select (arr!12793 _values!549) from!863) (dynLambda!838 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435580 () Bool)

(declare-fun Unit!12927 () Unit!12925)

(assert (=> b!435580 (= e!257270 Unit!12927)))

(declare-fun lt!200554 () Unit!12925)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12925)

(assert (=> b!435580 (= lt!200554 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435580 false))

(declare-fun b!435581 () Bool)

(declare-fun res!256719 () Bool)

(declare-fun e!257269 () Bool)

(assert (=> b!435581 (=> (not res!256719) (not e!257269))))

(declare-fun arrayContainsKey!0 (array!26685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435581 (= res!256719 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!256720 () Bool)

(assert (=> start!39998 (=> (not res!256720) (not e!257269))))

(assert (=> start!39998 (= res!256720 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13145 _keys!709))))))

(assert (=> start!39998 e!257269))

(declare-fun tp_is_empty!11431 () Bool)

(assert (=> start!39998 tp_is_empty!11431))

(assert (=> start!39998 tp!36365))

(assert (=> start!39998 true))

(declare-fun e!257273 () Bool)

(declare-fun array_inv!9340 (array!26687) Bool)

(assert (=> start!39998 (and (array_inv!9340 _values!549) e!257273)))

(declare-fun array_inv!9341 (array!26685) Bool)

(assert (=> start!39998 (array_inv!9341 _keys!709)))

(declare-fun mapNonEmpty!18768 () Bool)

(declare-fun mapRes!18768 () Bool)

(declare-fun tp!36366 () Bool)

(declare-fun e!257274 () Bool)

(assert (=> mapNonEmpty!18768 (= mapRes!18768 (and tp!36366 e!257274))))

(declare-fun mapRest!18768 () (Array (_ BitVec 32) ValueCell!5372))

(declare-fun mapKey!18768 () (_ BitVec 32))

(declare-fun mapValue!18768 () ValueCell!5372)

(assert (=> mapNonEmpty!18768 (= (arr!12793 _values!549) (store mapRest!18768 mapKey!18768 mapValue!18768))))

(declare-fun mapIsEmpty!18768 () Bool)

(assert (=> mapIsEmpty!18768 mapRes!18768))

(declare-fun b!435582 () Bool)

(declare-fun res!256718 () Bool)

(assert (=> b!435582 (=> (not res!256718) (not e!257269))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435582 (= res!256718 (validMask!0 mask!1025))))

(declare-fun b!435583 () Bool)

(declare-fun e!257277 () Bool)

(assert (=> b!435583 (= e!257273 (and e!257277 mapRes!18768))))

(declare-fun condMapEmpty!18768 () Bool)

(declare-fun mapDefault!18768 () ValueCell!5372)

(assert (=> b!435583 (= condMapEmpty!18768 (= (arr!12793 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5372)) mapDefault!18768)))))

(declare-fun b!435584 () Bool)

(declare-fun e!257272 () Bool)

(assert (=> b!435584 (= e!257269 e!257272)))

(declare-fun res!256726 () Bool)

(assert (=> b!435584 (=> (not res!256726) (not e!257272))))

(declare-fun lt!200550 () array!26685)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26685 (_ BitVec 32)) Bool)

(assert (=> b!435584 (= res!256726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200550 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435584 (= lt!200550 (array!26686 (store (arr!12792 _keys!709) i!563 k0!794) (size!13145 _keys!709)))))

(declare-fun b!435585 () Bool)

(declare-fun res!256721 () Bool)

(assert (=> b!435585 (=> (not res!256721) (not e!257269))))

(assert (=> b!435585 (= res!256721 (or (= (select (arr!12792 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12792 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435586 () Bool)

(declare-fun e!257271 () Bool)

(assert (=> b!435586 (= e!257271 (not e!257276))))

(declare-fun res!256730 () Bool)

(assert (=> b!435586 (=> res!256730 e!257276)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435586 (= res!256730 (not (validKeyInArray!0 (select (arr!12792 _keys!709) from!863))))))

(declare-fun lt!200547 () ListLongMap!6543)

(assert (=> b!435586 (= lt!200547 lt!200557)))

(declare-fun lt!200556 () ListLongMap!6543)

(declare-fun lt!200560 () tuple2!7640)

(assert (=> b!435586 (= lt!200557 (+!1462 lt!200556 lt!200560))))

(declare-fun minValue!515 () V!16347)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16347)

(declare-fun lt!200552 () array!26687)

(declare-fun getCurrentListMapNoExtraKeys!1487 (array!26685 array!26687 (_ BitVec 32) (_ BitVec 32) V!16347 V!16347 (_ BitVec 32) Int) ListLongMap!6543)

(assert (=> b!435586 (= lt!200547 (getCurrentListMapNoExtraKeys!1487 lt!200550 lt!200552 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16347)

(assert (=> b!435586 (= lt!200560 (tuple2!7641 k0!794 v!412))))

(assert (=> b!435586 (= lt!200556 (getCurrentListMapNoExtraKeys!1487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200548 () Unit!12925)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!604 (array!26685 array!26687 (_ BitVec 32) (_ BitVec 32) V!16347 V!16347 (_ BitVec 32) (_ BitVec 64) V!16347 (_ BitVec 32) Int) Unit!12925)

(assert (=> b!435586 (= lt!200548 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!604 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435587 () Bool)

(declare-fun res!256727 () Bool)

(assert (=> b!435587 (=> (not res!256727) (not e!257272))))

(declare-datatypes ((List!7628 0))(
  ( (Nil!7625) (Cons!7624 (h!8480 (_ BitVec 64)) (t!13347 List!7628)) )
))
(declare-fun arrayNoDuplicates!0 (array!26685 (_ BitVec 32) List!7628) Bool)

(assert (=> b!435587 (= res!256727 (arrayNoDuplicates!0 lt!200550 #b00000000000000000000000000000000 Nil!7625))))

(declare-fun b!435588 () Bool)

(declare-fun res!256723 () Bool)

(assert (=> b!435588 (=> (not res!256723) (not e!257269))))

(assert (=> b!435588 (= res!256723 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7625))))

(declare-fun b!435589 () Bool)

(assert (=> b!435589 (= e!257272 e!257271)))

(declare-fun res!256724 () Bool)

(assert (=> b!435589 (=> (not res!256724) (not e!257271))))

(assert (=> b!435589 (= res!256724 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!435589 (= lt!200559 (getCurrentListMapNoExtraKeys!1487 lt!200550 lt!200552 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435589 (= lt!200552 (array!26688 (store (arr!12793 _values!549) i!563 (ValueCellFull!5372 v!412)) (size!13146 _values!549)))))

(declare-fun lt!200549 () ListLongMap!6543)

(assert (=> b!435589 (= lt!200549 (getCurrentListMapNoExtraKeys!1487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435590 () Bool)

(declare-fun res!256731 () Bool)

(assert (=> b!435590 (=> (not res!256731) (not e!257269))))

(assert (=> b!435590 (= res!256731 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13145 _keys!709))))))

(declare-fun b!435591 () Bool)

(declare-fun res!256725 () Bool)

(assert (=> b!435591 (=> (not res!256725) (not e!257269))))

(assert (=> b!435591 (= res!256725 (validKeyInArray!0 k0!794))))

(declare-fun b!435592 () Bool)

(assert (=> b!435592 (= e!257274 tp_is_empty!11431)))

(declare-fun b!435593 () Bool)

(declare-fun Unit!12928 () Unit!12925)

(assert (=> b!435593 (= e!257270 Unit!12928)))

(declare-fun b!435594 () Bool)

(assert (=> b!435594 (= e!257268 true)))

(assert (=> b!435594 (= lt!200551 (+!1462 (+!1462 lt!200556 lt!200553) lt!200560))))

(declare-fun lt!200558 () Unit!12925)

(declare-fun addCommutativeForDiffKeys!412 (ListLongMap!6543 (_ BitVec 64) V!16347 (_ BitVec 64) V!16347) Unit!12925)

(assert (=> b!435594 (= lt!200558 (addCommutativeForDiffKeys!412 lt!200556 k0!794 v!412 (select (arr!12792 _keys!709) from!863) lt!200561))))

(declare-fun b!435595 () Bool)

(assert (=> b!435595 (= e!257277 tp_is_empty!11431)))

(declare-fun b!435596 () Bool)

(declare-fun res!256729 () Bool)

(assert (=> b!435596 (=> (not res!256729) (not e!257269))))

(assert (=> b!435596 (= res!256729 (and (= (size!13146 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13145 _keys!709) (size!13146 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435597 () Bool)

(declare-fun res!256728 () Bool)

(assert (=> b!435597 (=> (not res!256728) (not e!257272))))

(assert (=> b!435597 (= res!256728 (bvsle from!863 i!563))))

(declare-fun b!435598 () Bool)

(declare-fun res!256717 () Bool)

(assert (=> b!435598 (=> (not res!256717) (not e!257269))))

(assert (=> b!435598 (= res!256717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39998 res!256720) b!435582))

(assert (= (and b!435582 res!256718) b!435596))

(assert (= (and b!435596 res!256729) b!435598))

(assert (= (and b!435598 res!256717) b!435588))

(assert (= (and b!435588 res!256723) b!435590))

(assert (= (and b!435590 res!256731) b!435591))

(assert (= (and b!435591 res!256725) b!435585))

(assert (= (and b!435585 res!256721) b!435581))

(assert (= (and b!435581 res!256719) b!435584))

(assert (= (and b!435584 res!256726) b!435587))

(assert (= (and b!435587 res!256727) b!435597))

(assert (= (and b!435597 res!256728) b!435589))

(assert (= (and b!435589 res!256724) b!435586))

(assert (= (and b!435586 (not res!256730)) b!435579))

(assert (= (and b!435579 c!55683) b!435580))

(assert (= (and b!435579 (not c!55683)) b!435593))

(assert (= (and b!435579 (not res!256722)) b!435594))

(assert (= (and b!435583 condMapEmpty!18768) mapIsEmpty!18768))

(assert (= (and b!435583 (not condMapEmpty!18768)) mapNonEmpty!18768))

(get-info :version)

(assert (= (and mapNonEmpty!18768 ((_ is ValueCellFull!5372) mapValue!18768)) b!435592))

(assert (= (and b!435583 ((_ is ValueCellFull!5372) mapDefault!18768)) b!435595))

(assert (= start!39998 b!435583))

(declare-fun b_lambda!9349 () Bool)

(assert (=> (not b_lambda!9349) (not b!435579)))

(declare-fun t!13345 () Bool)

(declare-fun tb!3677 () Bool)

(assert (=> (and start!39998 (= defaultEntry!557 defaultEntry!557) t!13345) tb!3677))

(declare-fun result!6889 () Bool)

(assert (=> tb!3677 (= result!6889 tp_is_empty!11431)))

(assert (=> b!435579 t!13345))

(declare-fun b_and!18193 () Bool)

(assert (= b_and!18191 (and (=> t!13345 result!6889) b_and!18193)))

(declare-fun m!422979 () Bool)

(assert (=> b!435585 m!422979))

(declare-fun m!422981 () Bool)

(assert (=> b!435580 m!422981))

(declare-fun m!422983 () Bool)

(assert (=> b!435591 m!422983))

(declare-fun m!422985 () Bool)

(assert (=> b!435586 m!422985))

(declare-fun m!422987 () Bool)

(assert (=> b!435586 m!422987))

(declare-fun m!422989 () Bool)

(assert (=> b!435586 m!422989))

(assert (=> b!435586 m!422985))

(declare-fun m!422991 () Bool)

(assert (=> b!435586 m!422991))

(declare-fun m!422993 () Bool)

(assert (=> b!435586 m!422993))

(declare-fun m!422995 () Bool)

(assert (=> b!435586 m!422995))

(declare-fun m!422997 () Bool)

(assert (=> b!435584 m!422997))

(declare-fun m!422999 () Bool)

(assert (=> b!435584 m!422999))

(declare-fun m!423001 () Bool)

(assert (=> b!435589 m!423001))

(declare-fun m!423003 () Bool)

(assert (=> b!435589 m!423003))

(declare-fun m!423005 () Bool)

(assert (=> b!435589 m!423005))

(declare-fun m!423007 () Bool)

(assert (=> b!435581 m!423007))

(assert (=> b!435579 m!422985))

(declare-fun m!423009 () Bool)

(assert (=> b!435579 m!423009))

(declare-fun m!423011 () Bool)

(assert (=> b!435579 m!423011))

(declare-fun m!423013 () Bool)

(assert (=> b!435579 m!423013))

(assert (=> b!435579 m!423013))

(assert (=> b!435579 m!423011))

(declare-fun m!423015 () Bool)

(assert (=> b!435579 m!423015))

(declare-fun m!423017 () Bool)

(assert (=> b!435588 m!423017))

(declare-fun m!423019 () Bool)

(assert (=> mapNonEmpty!18768 m!423019))

(declare-fun m!423021 () Bool)

(assert (=> b!435587 m!423021))

(declare-fun m!423023 () Bool)

(assert (=> b!435594 m!423023))

(assert (=> b!435594 m!423023))

(declare-fun m!423025 () Bool)

(assert (=> b!435594 m!423025))

(assert (=> b!435594 m!422985))

(assert (=> b!435594 m!422985))

(declare-fun m!423027 () Bool)

(assert (=> b!435594 m!423027))

(declare-fun m!423029 () Bool)

(assert (=> start!39998 m!423029))

(declare-fun m!423031 () Bool)

(assert (=> start!39998 m!423031))

(declare-fun m!423033 () Bool)

(assert (=> b!435598 m!423033))

(declare-fun m!423035 () Bool)

(assert (=> b!435582 m!423035))

(check-sat (not b!435589) b_and!18193 tp_is_empty!11431 (not b!435588) (not b!435582) (not b!435580) (not b!435594) (not b_next!10279) (not b!435579) (not b!435581) (not mapNonEmpty!18768) (not b!435587) (not b!435584) (not b!435586) (not b!435598) (not b!435591) (not start!39998) (not b_lambda!9349))
(check-sat b_and!18193 (not b_next!10279))
