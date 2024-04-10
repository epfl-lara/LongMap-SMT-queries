; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38592 () Bool)

(assert start!38592)

(declare-fun b_free!9129 () Bool)

(declare-fun b_next!9129 () Bool)

(assert (=> start!38592 (= b_free!9129 (not b_next!9129))))

(declare-fun tp!32510 () Bool)

(declare-fun b_and!16515 () Bool)

(assert (=> start!38592 (= tp!32510 b_and!16515)))

(declare-fun b!399748 () Bool)

(declare-fun res!229895 () Bool)

(declare-fun e!241361 () Bool)

(assert (=> b!399748 (=> (not res!229895) (not e!241361))))

(declare-datatypes ((array!23933 0))(
  ( (array!23934 (arr!11416 (Array (_ BitVec 32) (_ BitVec 64))) (size!11768 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23933)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399748 (= res!229895 (or (= (select (arr!11416 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11416 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399749 () Bool)

(declare-fun res!229899 () Bool)

(assert (=> b!399749 (=> (not res!229899) (not e!241361))))

(assert (=> b!399749 (= res!229899 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11768 _keys!709))))))

(declare-fun b!399750 () Bool)

(declare-fun e!241359 () Bool)

(declare-fun e!241357 () Bool)

(declare-fun mapRes!16638 () Bool)

(assert (=> b!399750 (= e!241359 (and e!241357 mapRes!16638))))

(declare-fun condMapEmpty!16638 () Bool)

(declare-datatypes ((V!14453 0))(
  ( (V!14454 (val!5050 Int)) )
))
(declare-datatypes ((ValueCell!4662 0))(
  ( (ValueCellFull!4662 (v!7297 V!14453)) (EmptyCell!4662) )
))
(declare-datatypes ((array!23935 0))(
  ( (array!23936 (arr!11417 (Array (_ BitVec 32) ValueCell!4662)) (size!11769 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23935)

(declare-fun mapDefault!16638 () ValueCell!4662)

(assert (=> b!399750 (= condMapEmpty!16638 (= (arr!11417 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4662)) mapDefault!16638)))))

(declare-fun b!399751 () Bool)

(declare-fun e!241362 () Bool)

(assert (=> b!399751 (= e!241362 (not true))))

(declare-fun e!241356 () Bool)

(assert (=> b!399751 e!241356))

(declare-fun c!54650 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!399751 (= c!54650 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14453)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14453)

(declare-fun v!412 () V!14453)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12116 0))(
  ( (Unit!12117) )
))
(declare-fun lt!187613 () Unit!12116)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!316 (array!23933 array!23935 (_ BitVec 32) (_ BitVec 32) V!14453 V!14453 (_ BitVec 32) (_ BitVec 64) V!14453 (_ BitVec 32) Int) Unit!12116)

(assert (=> b!399751 (= lt!187613 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!316 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((tuple2!6688 0))(
  ( (tuple2!6689 (_1!3355 (_ BitVec 64)) (_2!3355 V!14453)) )
))
(declare-datatypes ((List!6614 0))(
  ( (Nil!6611) (Cons!6610 (h!7466 tuple2!6688) (t!11788 List!6614)) )
))
(declare-datatypes ((ListLongMap!5601 0))(
  ( (ListLongMap!5602 (toList!2816 List!6614)) )
))
(declare-fun call!28052 () ListLongMap!5601)

(declare-fun bm!28048 () Bool)

(declare-fun lt!187612 () array!23933)

(declare-fun getCurrentListMapNoExtraKeys!1033 (array!23933 array!23935 (_ BitVec 32) (_ BitVec 32) V!14453 V!14453 (_ BitVec 32) Int) ListLongMap!5601)

(assert (=> bm!28048 (= call!28052 (getCurrentListMapNoExtraKeys!1033 (ite c!54650 lt!187612 _keys!709) (ite c!54650 (array!23936 (store (arr!11417 _values!549) i!563 (ValueCellFull!4662 v!412)) (size!11769 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399752 () Bool)

(declare-fun call!28051 () ListLongMap!5601)

(assert (=> b!399752 (= e!241356 (= call!28051 call!28052))))

(declare-fun b!399753 () Bool)

(declare-fun res!229897 () Bool)

(assert (=> b!399753 (=> (not res!229897) (not e!241362))))

(declare-datatypes ((List!6615 0))(
  ( (Nil!6612) (Cons!6611 (h!7467 (_ BitVec 64)) (t!11789 List!6615)) )
))
(declare-fun arrayNoDuplicates!0 (array!23933 (_ BitVec 32) List!6615) Bool)

(assert (=> b!399753 (= res!229897 (arrayNoDuplicates!0 lt!187612 #b00000000000000000000000000000000 Nil!6612))))

(declare-fun mapNonEmpty!16638 () Bool)

(declare-fun tp!32511 () Bool)

(declare-fun e!241360 () Bool)

(assert (=> mapNonEmpty!16638 (= mapRes!16638 (and tp!32511 e!241360))))

(declare-fun mapKey!16638 () (_ BitVec 32))

(declare-fun mapValue!16638 () ValueCell!4662)

(declare-fun mapRest!16638 () (Array (_ BitVec 32) ValueCell!4662))

(assert (=> mapNonEmpty!16638 (= (arr!11417 _values!549) (store mapRest!16638 mapKey!16638 mapValue!16638))))

(declare-fun b!399754 () Bool)

(declare-fun res!229896 () Bool)

(assert (=> b!399754 (=> (not res!229896) (not e!241361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23933 (_ BitVec 32)) Bool)

(assert (=> b!399754 (= res!229896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399755 () Bool)

(declare-fun res!229900 () Bool)

(assert (=> b!399755 (=> (not res!229900) (not e!241361))))

(assert (=> b!399755 (= res!229900 (and (= (size!11769 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11768 _keys!709) (size!11769 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399757 () Bool)

(declare-fun +!1104 (ListLongMap!5601 tuple2!6688) ListLongMap!5601)

(assert (=> b!399757 (= e!241356 (= call!28052 (+!1104 call!28051 (tuple2!6689 k0!794 v!412))))))

(declare-fun b!399758 () Bool)

(declare-fun tp_is_empty!10011 () Bool)

(assert (=> b!399758 (= e!241357 tp_is_empty!10011)))

(declare-fun bm!28049 () Bool)

(assert (=> bm!28049 (= call!28051 (getCurrentListMapNoExtraKeys!1033 (ite c!54650 _keys!709 lt!187612) (ite c!54650 _values!549 (array!23936 (store (arr!11417 _values!549) i!563 (ValueCellFull!4662 v!412)) (size!11769 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399759 () Bool)

(declare-fun res!229894 () Bool)

(assert (=> b!399759 (=> (not res!229894) (not e!241361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399759 (= res!229894 (validMask!0 mask!1025))))

(declare-fun b!399760 () Bool)

(declare-fun res!229904 () Bool)

(assert (=> b!399760 (=> (not res!229904) (not e!241361))))

(declare-fun arrayContainsKey!0 (array!23933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399760 (= res!229904 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399761 () Bool)

(declare-fun res!229902 () Bool)

(assert (=> b!399761 (=> (not res!229902) (not e!241362))))

(assert (=> b!399761 (= res!229902 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11768 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399762 () Bool)

(assert (=> b!399762 (= e!241360 tp_is_empty!10011)))

(declare-fun b!399763 () Bool)

(declare-fun res!229905 () Bool)

(assert (=> b!399763 (=> (not res!229905) (not e!241361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399763 (= res!229905 (validKeyInArray!0 k0!794))))

(declare-fun res!229898 () Bool)

(assert (=> start!38592 (=> (not res!229898) (not e!241361))))

(assert (=> start!38592 (= res!229898 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11768 _keys!709))))))

(assert (=> start!38592 e!241361))

(assert (=> start!38592 tp_is_empty!10011))

(assert (=> start!38592 tp!32510))

(assert (=> start!38592 true))

(declare-fun array_inv!8364 (array!23935) Bool)

(assert (=> start!38592 (and (array_inv!8364 _values!549) e!241359)))

(declare-fun array_inv!8365 (array!23933) Bool)

(assert (=> start!38592 (array_inv!8365 _keys!709)))

(declare-fun b!399756 () Bool)

(assert (=> b!399756 (= e!241361 e!241362)))

(declare-fun res!229903 () Bool)

(assert (=> b!399756 (=> (not res!229903) (not e!241362))))

(assert (=> b!399756 (= res!229903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187612 mask!1025))))

(assert (=> b!399756 (= lt!187612 (array!23934 (store (arr!11416 _keys!709) i!563 k0!794) (size!11768 _keys!709)))))

(declare-fun mapIsEmpty!16638 () Bool)

(assert (=> mapIsEmpty!16638 mapRes!16638))

(declare-fun b!399764 () Bool)

(declare-fun res!229901 () Bool)

(assert (=> b!399764 (=> (not res!229901) (not e!241361))))

(assert (=> b!399764 (= res!229901 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6612))))

(assert (= (and start!38592 res!229898) b!399759))

(assert (= (and b!399759 res!229894) b!399755))

(assert (= (and b!399755 res!229900) b!399754))

(assert (= (and b!399754 res!229896) b!399764))

(assert (= (and b!399764 res!229901) b!399749))

(assert (= (and b!399749 res!229899) b!399763))

(assert (= (and b!399763 res!229905) b!399748))

(assert (= (and b!399748 res!229895) b!399760))

(assert (= (and b!399760 res!229904) b!399756))

(assert (= (and b!399756 res!229903) b!399753))

(assert (= (and b!399753 res!229897) b!399761))

(assert (= (and b!399761 res!229902) b!399751))

(assert (= (and b!399751 c!54650) b!399757))

(assert (= (and b!399751 (not c!54650)) b!399752))

(assert (= (or b!399757 b!399752) bm!28048))

(assert (= (or b!399757 b!399752) bm!28049))

(assert (= (and b!399750 condMapEmpty!16638) mapIsEmpty!16638))

(assert (= (and b!399750 (not condMapEmpty!16638)) mapNonEmpty!16638))

(get-info :version)

(assert (= (and mapNonEmpty!16638 ((_ is ValueCellFull!4662) mapValue!16638)) b!399762))

(assert (= (and b!399750 ((_ is ValueCellFull!4662) mapDefault!16638)) b!399758))

(assert (= start!38592 b!399750))

(declare-fun m!394169 () Bool)

(assert (=> b!399760 m!394169))

(declare-fun m!394171 () Bool)

(assert (=> bm!28049 m!394171))

(declare-fun m!394173 () Bool)

(assert (=> bm!28049 m!394173))

(declare-fun m!394175 () Bool)

(assert (=> b!399759 m!394175))

(declare-fun m!394177 () Bool)

(assert (=> b!399751 m!394177))

(declare-fun m!394179 () Bool)

(assert (=> start!38592 m!394179))

(declare-fun m!394181 () Bool)

(assert (=> start!38592 m!394181))

(declare-fun m!394183 () Bool)

(assert (=> b!399763 m!394183))

(declare-fun m!394185 () Bool)

(assert (=> b!399757 m!394185))

(assert (=> bm!28048 m!394171))

(declare-fun m!394187 () Bool)

(assert (=> bm!28048 m!394187))

(declare-fun m!394189 () Bool)

(assert (=> b!399753 m!394189))

(declare-fun m!394191 () Bool)

(assert (=> b!399756 m!394191))

(declare-fun m!394193 () Bool)

(assert (=> b!399756 m!394193))

(declare-fun m!394195 () Bool)

(assert (=> mapNonEmpty!16638 m!394195))

(declare-fun m!394197 () Bool)

(assert (=> b!399748 m!394197))

(declare-fun m!394199 () Bool)

(assert (=> b!399764 m!394199))

(declare-fun m!394201 () Bool)

(assert (=> b!399754 m!394201))

(check-sat (not start!38592) (not b!399764) (not b_next!9129) (not bm!28049) (not b!399756) (not b!399751) (not b!399763) (not b!399757) (not b!399759) (not bm!28048) (not mapNonEmpty!16638) (not b!399754) b_and!16515 (not b!399760) (not b!399753) tp_is_empty!10011)
(check-sat b_and!16515 (not b_next!9129))
