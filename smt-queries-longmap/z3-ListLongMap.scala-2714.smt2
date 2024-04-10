; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40104 () Bool)

(assert start!40104)

(declare-fun b_free!10371 () Bool)

(declare-fun b_next!10371 () Bool)

(assert (=> start!40104 (= b_free!10371 (not b_next!10371))))

(declare-fun tp!36642 () Bool)

(declare-fun b_and!18339 () Bool)

(assert (=> start!40104 (= tp!36642 b_and!18339)))

(declare-fun mapIsEmpty!18906 () Bool)

(declare-fun mapRes!18906 () Bool)

(assert (=> mapIsEmpty!18906 mapRes!18906))

(declare-fun b!438260 () Bool)

(declare-fun res!258735 () Bool)

(declare-fun e!258543 () Bool)

(assert (=> b!438260 (=> (not res!258735) (not e!258543))))

(declare-datatypes ((array!26863 0))(
  ( (array!26864 (arr!12881 (Array (_ BitVec 32) (_ BitVec 64))) (size!13233 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26863)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26863 (_ BitVec 32)) Bool)

(assert (=> b!438260 (= res!258735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438261 () Bool)

(declare-fun res!258736 () Bool)

(declare-fun e!258540 () Bool)

(assert (=> b!438261 (=> (not res!258736) (not e!258540))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438261 (= res!258736 (bvsle from!863 i!563))))

(declare-fun b!438262 () Bool)

(declare-fun e!258542 () Bool)

(assert (=> b!438262 (= e!258540 e!258542)))

(declare-fun res!258730 () Bool)

(assert (=> b!438262 (=> (not res!258730) (not e!258542))))

(assert (=> b!438262 (= res!258730 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16469 0))(
  ( (V!16470 (val!5806 Int)) )
))
(declare-fun minValue!515 () V!16469)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7698 0))(
  ( (tuple2!7699 (_1!3860 (_ BitVec 64)) (_2!3860 V!16469)) )
))
(declare-datatypes ((List!7697 0))(
  ( (Nil!7694) (Cons!7693 (h!8549 tuple2!7698) (t!13453 List!7697)) )
))
(declare-datatypes ((ListLongMap!6611 0))(
  ( (ListLongMap!6612 (toList!3321 List!7697)) )
))
(declare-fun lt!201902 () ListLongMap!6611)

(declare-fun zeroValue!515 () V!16469)

(declare-datatypes ((ValueCell!5418 0))(
  ( (ValueCellFull!5418 (v!8053 V!16469)) (EmptyCell!5418) )
))
(declare-datatypes ((array!26865 0))(
  ( (array!26866 (arr!12882 (Array (_ BitVec 32) ValueCell!5418)) (size!13234 (_ BitVec 32))) )
))
(declare-fun lt!201903 () array!26865)

(declare-fun lt!201901 () array!26863)

(declare-fun getCurrentListMapNoExtraKeys!1510 (array!26863 array!26865 (_ BitVec 32) (_ BitVec 32) V!16469 V!16469 (_ BitVec 32) Int) ListLongMap!6611)

(assert (=> b!438262 (= lt!201902 (getCurrentListMapNoExtraKeys!1510 lt!201901 lt!201903 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26865)

(declare-fun v!412 () V!16469)

(assert (=> b!438262 (= lt!201903 (array!26866 (store (arr!12882 _values!549) i!563 (ValueCellFull!5418 v!412)) (size!13234 _values!549)))))

(declare-fun lt!201904 () ListLongMap!6611)

(assert (=> b!438262 (= lt!201904 (getCurrentListMapNoExtraKeys!1510 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438263 () Bool)

(declare-fun e!258538 () Bool)

(declare-fun e!258539 () Bool)

(assert (=> b!438263 (= e!258538 (and e!258539 mapRes!18906))))

(declare-fun condMapEmpty!18906 () Bool)

(declare-fun mapDefault!18906 () ValueCell!5418)

(assert (=> b!438263 (= condMapEmpty!18906 (= (arr!12882 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5418)) mapDefault!18906)))))

(declare-fun b!438264 () Bool)

(declare-fun res!258727 () Bool)

(assert (=> b!438264 (=> (not res!258727) (not e!258543))))

(assert (=> b!438264 (= res!258727 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13233 _keys!709))))))

(declare-fun b!438265 () Bool)

(declare-fun res!258738 () Bool)

(assert (=> b!438265 (=> (not res!258738) (not e!258543))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438265 (= res!258738 (validKeyInArray!0 k0!794))))

(declare-fun b!438266 () Bool)

(declare-fun e!258541 () Bool)

(declare-fun tp_is_empty!11523 () Bool)

(assert (=> b!438266 (= e!258541 tp_is_empty!11523)))

(declare-fun mapNonEmpty!18906 () Bool)

(declare-fun tp!36641 () Bool)

(assert (=> mapNonEmpty!18906 (= mapRes!18906 (and tp!36641 e!258541))))

(declare-fun mapKey!18906 () (_ BitVec 32))

(declare-fun mapValue!18906 () ValueCell!5418)

(declare-fun mapRest!18906 () (Array (_ BitVec 32) ValueCell!5418))

(assert (=> mapNonEmpty!18906 (= (arr!12882 _values!549) (store mapRest!18906 mapKey!18906 mapValue!18906))))

(declare-fun b!438267 () Bool)

(declare-fun res!258733 () Bool)

(assert (=> b!438267 (=> (not res!258733) (not e!258543))))

(assert (=> b!438267 (= res!258733 (and (= (size!13234 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13233 _keys!709) (size!13234 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438268 () Bool)

(assert (=> b!438268 (= e!258542 (not true))))

(declare-fun +!1465 (ListLongMap!6611 tuple2!7698) ListLongMap!6611)

(assert (=> b!438268 (= (getCurrentListMapNoExtraKeys!1510 lt!201901 lt!201903 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1465 (getCurrentListMapNoExtraKeys!1510 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7699 k0!794 v!412)))))

(declare-datatypes ((Unit!13034 0))(
  ( (Unit!13035) )
))
(declare-fun lt!201905 () Unit!13034)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!634 (array!26863 array!26865 (_ BitVec 32) (_ BitVec 32) V!16469 V!16469 (_ BitVec 32) (_ BitVec 64) V!16469 (_ BitVec 32) Int) Unit!13034)

(assert (=> b!438268 (= lt!201905 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!634 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438269 () Bool)

(declare-fun res!258737 () Bool)

(assert (=> b!438269 (=> (not res!258737) (not e!258540))))

(declare-datatypes ((List!7698 0))(
  ( (Nil!7695) (Cons!7694 (h!8550 (_ BitVec 64)) (t!13454 List!7698)) )
))
(declare-fun arrayNoDuplicates!0 (array!26863 (_ BitVec 32) List!7698) Bool)

(assert (=> b!438269 (= res!258737 (arrayNoDuplicates!0 lt!201901 #b00000000000000000000000000000000 Nil!7695))))

(declare-fun b!438270 () Bool)

(assert (=> b!438270 (= e!258539 tp_is_empty!11523)))

(declare-fun b!438271 () Bool)

(assert (=> b!438271 (= e!258543 e!258540)))

(declare-fun res!258728 () Bool)

(assert (=> b!438271 (=> (not res!258728) (not e!258540))))

(assert (=> b!438271 (= res!258728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201901 mask!1025))))

(assert (=> b!438271 (= lt!201901 (array!26864 (store (arr!12881 _keys!709) i!563 k0!794) (size!13233 _keys!709)))))

(declare-fun b!438272 () Bool)

(declare-fun res!258731 () Bool)

(assert (=> b!438272 (=> (not res!258731) (not e!258543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438272 (= res!258731 (validMask!0 mask!1025))))

(declare-fun b!438273 () Bool)

(declare-fun res!258729 () Bool)

(assert (=> b!438273 (=> (not res!258729) (not e!258543))))

(assert (=> b!438273 (= res!258729 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7695))))

(declare-fun b!438274 () Bool)

(declare-fun res!258732 () Bool)

(assert (=> b!438274 (=> (not res!258732) (not e!258543))))

(assert (=> b!438274 (= res!258732 (or (= (select (arr!12881 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12881 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438275 () Bool)

(declare-fun res!258726 () Bool)

(assert (=> b!438275 (=> (not res!258726) (not e!258543))))

(declare-fun arrayContainsKey!0 (array!26863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438275 (= res!258726 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!258734 () Bool)

(assert (=> start!40104 (=> (not res!258734) (not e!258543))))

(assert (=> start!40104 (= res!258734 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13233 _keys!709))))))

(assert (=> start!40104 e!258543))

(assert (=> start!40104 tp_is_empty!11523))

(assert (=> start!40104 tp!36642))

(assert (=> start!40104 true))

(declare-fun array_inv!9356 (array!26865) Bool)

(assert (=> start!40104 (and (array_inv!9356 _values!549) e!258538)))

(declare-fun array_inv!9357 (array!26863) Bool)

(assert (=> start!40104 (array_inv!9357 _keys!709)))

(assert (= (and start!40104 res!258734) b!438272))

(assert (= (and b!438272 res!258731) b!438267))

(assert (= (and b!438267 res!258733) b!438260))

(assert (= (and b!438260 res!258735) b!438273))

(assert (= (and b!438273 res!258729) b!438264))

(assert (= (and b!438264 res!258727) b!438265))

(assert (= (and b!438265 res!258738) b!438274))

(assert (= (and b!438274 res!258732) b!438275))

(assert (= (and b!438275 res!258726) b!438271))

(assert (= (and b!438271 res!258728) b!438269))

(assert (= (and b!438269 res!258737) b!438261))

(assert (= (and b!438261 res!258736) b!438262))

(assert (= (and b!438262 res!258730) b!438268))

(assert (= (and b!438263 condMapEmpty!18906) mapIsEmpty!18906))

(assert (= (and b!438263 (not condMapEmpty!18906)) mapNonEmpty!18906))

(get-info :version)

(assert (= (and mapNonEmpty!18906 ((_ is ValueCellFull!5418) mapValue!18906)) b!438266))

(assert (= (and b!438263 ((_ is ValueCellFull!5418) mapDefault!18906)) b!438270))

(assert (= start!40104 b!438263))

(declare-fun m!425759 () Bool)

(assert (=> b!438271 m!425759))

(declare-fun m!425761 () Bool)

(assert (=> b!438271 m!425761))

(declare-fun m!425763 () Bool)

(assert (=> b!438274 m!425763))

(declare-fun m!425765 () Bool)

(assert (=> b!438265 m!425765))

(declare-fun m!425767 () Bool)

(assert (=> start!40104 m!425767))

(declare-fun m!425769 () Bool)

(assert (=> start!40104 m!425769))

(declare-fun m!425771 () Bool)

(assert (=> b!438262 m!425771))

(declare-fun m!425773 () Bool)

(assert (=> b!438262 m!425773))

(declare-fun m!425775 () Bool)

(assert (=> b!438262 m!425775))

(declare-fun m!425777 () Bool)

(assert (=> b!438260 m!425777))

(declare-fun m!425779 () Bool)

(assert (=> mapNonEmpty!18906 m!425779))

(declare-fun m!425781 () Bool)

(assert (=> b!438268 m!425781))

(declare-fun m!425783 () Bool)

(assert (=> b!438268 m!425783))

(assert (=> b!438268 m!425783))

(declare-fun m!425785 () Bool)

(assert (=> b!438268 m!425785))

(declare-fun m!425787 () Bool)

(assert (=> b!438268 m!425787))

(declare-fun m!425789 () Bool)

(assert (=> b!438269 m!425789))

(declare-fun m!425791 () Bool)

(assert (=> b!438272 m!425791))

(declare-fun m!425793 () Bool)

(assert (=> b!438275 m!425793))

(declare-fun m!425795 () Bool)

(assert (=> b!438273 m!425795))

(check-sat (not start!40104) (not b!438265) (not mapNonEmpty!18906) (not b!438272) tp_is_empty!11523 (not b!438275) (not b!438260) (not b!438273) (not b!438262) (not b!438271) (not b!438269) (not b_next!10371) b_and!18339 (not b!438268))
(check-sat b_and!18339 (not b_next!10371))
