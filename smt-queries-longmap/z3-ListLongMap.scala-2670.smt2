; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39840 () Bool)

(assert start!39840)

(declare-fun b_free!10107 () Bool)

(declare-fun b_next!10107 () Bool)

(assert (=> start!39840 (= b_free!10107 (not b_next!10107))))

(declare-fun tp!35850 () Bool)

(declare-fun b_and!17873 () Bool)

(assert (=> start!39840 (= tp!35850 b_and!17873)))

(declare-fun b!430518 () Bool)

(declare-fun e!254862 () Bool)

(declare-fun e!254864 () Bool)

(assert (=> b!430518 (= e!254862 e!254864)))

(declare-fun res!252978 () Bool)

(assert (=> b!430518 (=> (not res!252978) (not e!254864))))

(declare-datatypes ((array!26353 0))(
  ( (array!26354 (arr!12626 (Array (_ BitVec 32) (_ BitVec 64))) (size!12978 (_ BitVec 32))) )
))
(declare-fun lt!196922 () array!26353)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26353 (_ BitVec 32)) Bool)

(assert (=> b!430518 (= res!252978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196922 mask!1025))))

(declare-fun _keys!709 () array!26353)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430518 (= lt!196922 (array!26354 (store (arr!12626 _keys!709) i!563 k0!794) (size!12978 _keys!709)))))

(declare-fun b!430519 () Bool)

(declare-fun res!252981 () Bool)

(assert (=> b!430519 (=> (not res!252981) (not e!254862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430519 (= res!252981 (validKeyInArray!0 k0!794))))

(declare-fun b!430520 () Bool)

(declare-fun e!254870 () Bool)

(declare-fun tp_is_empty!11259 () Bool)

(assert (=> b!430520 (= e!254870 tp_is_empty!11259)))

(declare-fun b!430521 () Bool)

(declare-fun e!254867 () Bool)

(declare-fun e!254869 () Bool)

(assert (=> b!430521 (= e!254867 (not e!254869))))

(declare-fun res!252977 () Bool)

(assert (=> b!430521 (=> res!252977 e!254869)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!430521 (= res!252977 (not (validKeyInArray!0 (select (arr!12626 _keys!709) from!863))))))

(declare-datatypes ((V!16117 0))(
  ( (V!16118 (val!5674 Int)) )
))
(declare-datatypes ((tuple2!7474 0))(
  ( (tuple2!7475 (_1!3748 (_ BitVec 64)) (_2!3748 V!16117)) )
))
(declare-datatypes ((List!7493 0))(
  ( (Nil!7490) (Cons!7489 (h!8345 tuple2!7474) (t!13049 List!7493)) )
))
(declare-datatypes ((ListLongMap!6387 0))(
  ( (ListLongMap!6388 (toList!3209 List!7493)) )
))
(declare-fun lt!196916 () ListLongMap!6387)

(declare-fun lt!196912 () ListLongMap!6387)

(assert (=> b!430521 (= lt!196916 lt!196912)))

(declare-fun lt!196925 () ListLongMap!6387)

(declare-fun lt!196918 () tuple2!7474)

(declare-fun +!1358 (ListLongMap!6387 tuple2!7474) ListLongMap!6387)

(assert (=> b!430521 (= lt!196912 (+!1358 lt!196925 lt!196918))))

(declare-fun minValue!515 () V!16117)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16117)

(declare-datatypes ((ValueCell!5286 0))(
  ( (ValueCellFull!5286 (v!7921 V!16117)) (EmptyCell!5286) )
))
(declare-datatypes ((array!26355 0))(
  ( (array!26356 (arr!12627 (Array (_ BitVec 32) ValueCell!5286)) (size!12979 (_ BitVec 32))) )
))
(declare-fun lt!196920 () array!26355)

(declare-fun getCurrentListMapNoExtraKeys!1411 (array!26353 array!26355 (_ BitVec 32) (_ BitVec 32) V!16117 V!16117 (_ BitVec 32) Int) ListLongMap!6387)

(assert (=> b!430521 (= lt!196916 (getCurrentListMapNoExtraKeys!1411 lt!196922 lt!196920 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16117)

(assert (=> b!430521 (= lt!196918 (tuple2!7475 k0!794 v!412))))

(declare-fun _values!549 () array!26355)

(assert (=> b!430521 (= lt!196925 (getCurrentListMapNoExtraKeys!1411 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12674 0))(
  ( (Unit!12675) )
))
(declare-fun lt!196919 () Unit!12674)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!547 (array!26353 array!26355 (_ BitVec 32) (_ BitVec 32) V!16117 V!16117 (_ BitVec 32) (_ BitVec 64) V!16117 (_ BitVec 32) Int) Unit!12674)

(assert (=> b!430521 (= lt!196919 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!547 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430522 () Bool)

(declare-fun res!252985 () Bool)

(assert (=> b!430522 (=> (not res!252985) (not e!254862))))

(assert (=> b!430522 (= res!252985 (or (= (select (arr!12626 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12626 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430523 () Bool)

(declare-fun e!254865 () Bool)

(assert (=> b!430523 (= e!254865 true)))

(declare-fun lt!196913 () ListLongMap!6387)

(declare-fun lt!196924 () tuple2!7474)

(assert (=> b!430523 (= lt!196913 (+!1358 (+!1358 lt!196925 lt!196924) lt!196918))))

(declare-fun lt!196917 () Unit!12674)

(declare-fun lt!196914 () V!16117)

(declare-fun addCommutativeForDiffKeys!354 (ListLongMap!6387 (_ BitVec 64) V!16117 (_ BitVec 64) V!16117) Unit!12674)

(assert (=> b!430523 (= lt!196917 (addCommutativeForDiffKeys!354 lt!196925 k0!794 v!412 (select (arr!12626 _keys!709) from!863) lt!196914))))

(declare-fun b!430525 () Bool)

(declare-fun e!254863 () Unit!12674)

(declare-fun Unit!12676 () Unit!12674)

(assert (=> b!430525 (= e!254863 Unit!12676)))

(declare-fun lt!196921 () Unit!12674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26353 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12674)

(assert (=> b!430525 (= lt!196921 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430525 false))

(declare-fun b!430526 () Bool)

(declare-fun res!252979 () Bool)

(assert (=> b!430526 (=> (not res!252979) (not e!254864))))

(declare-datatypes ((List!7494 0))(
  ( (Nil!7491) (Cons!7490 (h!8346 (_ BitVec 64)) (t!13050 List!7494)) )
))
(declare-fun arrayNoDuplicates!0 (array!26353 (_ BitVec 32) List!7494) Bool)

(assert (=> b!430526 (= res!252979 (arrayNoDuplicates!0 lt!196922 #b00000000000000000000000000000000 Nil!7491))))

(declare-fun b!430527 () Bool)

(declare-fun res!252987 () Bool)

(assert (=> b!430527 (=> (not res!252987) (not e!254862))))

(assert (=> b!430527 (= res!252987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430528 () Bool)

(assert (=> b!430528 (= e!254869 e!254865)))

(declare-fun res!252982 () Bool)

(assert (=> b!430528 (=> res!252982 e!254865)))

(assert (=> b!430528 (= res!252982 (= k0!794 (select (arr!12626 _keys!709) from!863)))))

(assert (=> b!430528 (not (= (select (arr!12626 _keys!709) from!863) k0!794))))

(declare-fun lt!196911 () Unit!12674)

(assert (=> b!430528 (= lt!196911 e!254863)))

(declare-fun c!55496 () Bool)

(assert (=> b!430528 (= c!55496 (= (select (arr!12626 _keys!709) from!863) k0!794))))

(declare-fun lt!196915 () ListLongMap!6387)

(assert (=> b!430528 (= lt!196915 lt!196913)))

(assert (=> b!430528 (= lt!196913 (+!1358 lt!196912 lt!196924))))

(assert (=> b!430528 (= lt!196924 (tuple2!7475 (select (arr!12626 _keys!709) from!863) lt!196914))))

(declare-fun get!6266 (ValueCell!5286 V!16117) V!16117)

(declare-fun dynLambda!783 (Int (_ BitVec 64)) V!16117)

(assert (=> b!430528 (= lt!196914 (get!6266 (select (arr!12627 _values!549) from!863) (dynLambda!783 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430529 () Bool)

(declare-fun res!252983 () Bool)

(assert (=> b!430529 (=> (not res!252983) (not e!254862))))

(assert (=> b!430529 (= res!252983 (and (= (size!12979 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12978 _keys!709) (size!12979 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430530 () Bool)

(declare-fun res!252980 () Bool)

(assert (=> b!430530 (=> (not res!252980) (not e!254862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430530 (= res!252980 (validMask!0 mask!1025))))

(declare-fun b!430531 () Bool)

(assert (=> b!430531 (= e!254864 e!254867)))

(declare-fun res!252990 () Bool)

(assert (=> b!430531 (=> (not res!252990) (not e!254867))))

(assert (=> b!430531 (= res!252990 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!430531 (= lt!196915 (getCurrentListMapNoExtraKeys!1411 lt!196922 lt!196920 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430531 (= lt!196920 (array!26356 (store (arr!12627 _values!549) i!563 (ValueCellFull!5286 v!412)) (size!12979 _values!549)))))

(declare-fun lt!196923 () ListLongMap!6387)

(assert (=> b!430531 (= lt!196923 (getCurrentListMapNoExtraKeys!1411 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18510 () Bool)

(declare-fun mapRes!18510 () Bool)

(assert (=> mapIsEmpty!18510 mapRes!18510))

(declare-fun b!430532 () Bool)

(declare-fun e!254871 () Bool)

(declare-fun e!254868 () Bool)

(assert (=> b!430532 (= e!254871 (and e!254868 mapRes!18510))))

(declare-fun condMapEmpty!18510 () Bool)

(declare-fun mapDefault!18510 () ValueCell!5286)

(assert (=> b!430532 (= condMapEmpty!18510 (= (arr!12627 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5286)) mapDefault!18510)))))

(declare-fun b!430533 () Bool)

(declare-fun res!252986 () Bool)

(assert (=> b!430533 (=> (not res!252986) (not e!254862))))

(declare-fun arrayContainsKey!0 (array!26353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430533 (= res!252986 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430534 () Bool)

(assert (=> b!430534 (= e!254868 tp_is_empty!11259)))

(declare-fun b!430535 () Bool)

(declare-fun res!252988 () Bool)

(assert (=> b!430535 (=> (not res!252988) (not e!254862))))

(assert (=> b!430535 (= res!252988 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12978 _keys!709))))))

(declare-fun b!430536 () Bool)

(declare-fun res!252989 () Bool)

(assert (=> b!430536 (=> (not res!252989) (not e!254864))))

(assert (=> b!430536 (= res!252989 (bvsle from!863 i!563))))

(declare-fun res!252984 () Bool)

(assert (=> start!39840 (=> (not res!252984) (not e!254862))))

(assert (=> start!39840 (= res!252984 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12978 _keys!709))))))

(assert (=> start!39840 e!254862))

(assert (=> start!39840 tp_is_empty!11259))

(assert (=> start!39840 tp!35850))

(assert (=> start!39840 true))

(declare-fun array_inv!9194 (array!26355) Bool)

(assert (=> start!39840 (and (array_inv!9194 _values!549) e!254871)))

(declare-fun array_inv!9195 (array!26353) Bool)

(assert (=> start!39840 (array_inv!9195 _keys!709)))

(declare-fun b!430524 () Bool)

(declare-fun Unit!12677 () Unit!12674)

(assert (=> b!430524 (= e!254863 Unit!12677)))

(declare-fun mapNonEmpty!18510 () Bool)

(declare-fun tp!35849 () Bool)

(assert (=> mapNonEmpty!18510 (= mapRes!18510 (and tp!35849 e!254870))))

(declare-fun mapValue!18510 () ValueCell!5286)

(declare-fun mapRest!18510 () (Array (_ BitVec 32) ValueCell!5286))

(declare-fun mapKey!18510 () (_ BitVec 32))

(assert (=> mapNonEmpty!18510 (= (arr!12627 _values!549) (store mapRest!18510 mapKey!18510 mapValue!18510))))

(declare-fun b!430537 () Bool)

(declare-fun res!252976 () Bool)

(assert (=> b!430537 (=> (not res!252976) (not e!254862))))

(assert (=> b!430537 (= res!252976 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7491))))

(assert (= (and start!39840 res!252984) b!430530))

(assert (= (and b!430530 res!252980) b!430529))

(assert (= (and b!430529 res!252983) b!430527))

(assert (= (and b!430527 res!252987) b!430537))

(assert (= (and b!430537 res!252976) b!430535))

(assert (= (and b!430535 res!252988) b!430519))

(assert (= (and b!430519 res!252981) b!430522))

(assert (= (and b!430522 res!252985) b!430533))

(assert (= (and b!430533 res!252986) b!430518))

(assert (= (and b!430518 res!252978) b!430526))

(assert (= (and b!430526 res!252979) b!430536))

(assert (= (and b!430536 res!252989) b!430531))

(assert (= (and b!430531 res!252990) b!430521))

(assert (= (and b!430521 (not res!252977)) b!430528))

(assert (= (and b!430528 c!55496) b!430525))

(assert (= (and b!430528 (not c!55496)) b!430524))

(assert (= (and b!430528 (not res!252982)) b!430523))

(assert (= (and b!430532 condMapEmpty!18510) mapIsEmpty!18510))

(assert (= (and b!430532 (not condMapEmpty!18510)) mapNonEmpty!18510))

(get-info :version)

(assert (= (and mapNonEmpty!18510 ((_ is ValueCellFull!5286) mapValue!18510)) b!430520))

(assert (= (and b!430532 ((_ is ValueCellFull!5286) mapDefault!18510)) b!430534))

(assert (= start!39840 b!430532))

(declare-fun b_lambda!9195 () Bool)

(assert (=> (not b_lambda!9195) (not b!430528)))

(declare-fun t!13048 () Bool)

(declare-fun tb!3513 () Bool)

(assert (=> (and start!39840 (= defaultEntry!557 defaultEntry!557) t!13048) tb!3513))

(declare-fun result!6553 () Bool)

(assert (=> tb!3513 (= result!6553 tp_is_empty!11259)))

(assert (=> b!430528 t!13048))

(declare-fun b_and!17875 () Bool)

(assert (= b_and!17873 (and (=> t!13048 result!6553) b_and!17875)))

(declare-fun m!418723 () Bool)

(assert (=> b!430531 m!418723))

(declare-fun m!418725 () Bool)

(assert (=> b!430531 m!418725))

(declare-fun m!418727 () Bool)

(assert (=> b!430531 m!418727))

(declare-fun m!418729 () Bool)

(assert (=> b!430519 m!418729))

(declare-fun m!418731 () Bool)

(assert (=> b!430522 m!418731))

(declare-fun m!418733 () Bool)

(assert (=> b!430537 m!418733))

(declare-fun m!418735 () Bool)

(assert (=> b!430521 m!418735))

(declare-fun m!418737 () Bool)

(assert (=> b!430521 m!418737))

(declare-fun m!418739 () Bool)

(assert (=> b!430521 m!418739))

(declare-fun m!418741 () Bool)

(assert (=> b!430521 m!418741))

(assert (=> b!430521 m!418735))

(declare-fun m!418743 () Bool)

(assert (=> b!430521 m!418743))

(declare-fun m!418745 () Bool)

(assert (=> b!430521 m!418745))

(declare-fun m!418747 () Bool)

(assert (=> b!430530 m!418747))

(declare-fun m!418749 () Bool)

(assert (=> b!430518 m!418749))

(declare-fun m!418751 () Bool)

(assert (=> b!430518 m!418751))

(declare-fun m!418753 () Bool)

(assert (=> b!430523 m!418753))

(assert (=> b!430523 m!418753))

(declare-fun m!418755 () Bool)

(assert (=> b!430523 m!418755))

(assert (=> b!430523 m!418735))

(assert (=> b!430523 m!418735))

(declare-fun m!418757 () Bool)

(assert (=> b!430523 m!418757))

(declare-fun m!418759 () Bool)

(assert (=> mapNonEmpty!18510 m!418759))

(assert (=> b!430528 m!418735))

(declare-fun m!418761 () Bool)

(assert (=> b!430528 m!418761))

(declare-fun m!418763 () Bool)

(assert (=> b!430528 m!418763))

(declare-fun m!418765 () Bool)

(assert (=> b!430528 m!418765))

(assert (=> b!430528 m!418763))

(assert (=> b!430528 m!418761))

(declare-fun m!418767 () Bool)

(assert (=> b!430528 m!418767))

(declare-fun m!418769 () Bool)

(assert (=> b!430533 m!418769))

(declare-fun m!418771 () Bool)

(assert (=> b!430525 m!418771))

(declare-fun m!418773 () Bool)

(assert (=> start!39840 m!418773))

(declare-fun m!418775 () Bool)

(assert (=> start!39840 m!418775))

(declare-fun m!418777 () Bool)

(assert (=> b!430526 m!418777))

(declare-fun m!418779 () Bool)

(assert (=> b!430527 m!418779))

(check-sat b_and!17875 (not b!430526) (not b_lambda!9195) tp_is_empty!11259 (not b!430525) (not b!430523) (not b!430527) (not mapNonEmpty!18510) (not b!430530) (not b!430518) (not b!430519) (not start!39840) (not b!430537) (not b!430533) (not b_next!10107) (not b!430528) (not b!430521) (not b!430531))
(check-sat b_and!17875 (not b_next!10107))
