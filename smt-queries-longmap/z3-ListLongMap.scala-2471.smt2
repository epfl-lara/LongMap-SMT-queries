; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38630 () Bool)

(assert start!38630)

(declare-fun b_free!9181 () Bool)

(declare-fun b_next!9181 () Bool)

(assert (=> start!38630 (= b_free!9181 (not b_next!9181))))

(declare-fun tp!32667 () Bool)

(declare-fun b_and!16581 () Bool)

(assert (=> start!38630 (= tp!32667 b_and!16581)))

(declare-fun b!401025 () Bool)

(declare-fun res!230837 () Bool)

(declare-fun e!241873 () Bool)

(assert (=> b!401025 (=> (not res!230837) (not e!241873))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24010 0))(
  ( (array!24011 (arr!11454 (Array (_ BitVec 32) (_ BitVec 64))) (size!11806 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24010)

(assert (=> b!401025 (= res!230837 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11806 _keys!709))))))

(declare-fun b!401026 () Bool)

(declare-fun e!241872 () Bool)

(declare-fun tp_is_empty!10063 () Bool)

(assert (=> b!401026 (= e!241872 tp_is_empty!10063)))

(declare-fun b!401027 () Bool)

(declare-fun res!230827 () Bool)

(declare-fun e!241875 () Bool)

(assert (=> b!401027 (=> (not res!230827) (not e!241875))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401027 (= res!230827 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11806 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401028 () Bool)

(declare-fun res!230835 () Bool)

(assert (=> b!401028 (=> (not res!230835) (not e!241873))))

(assert (=> b!401028 (= res!230835 (or (= (select (arr!11454 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11454 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!230830 () Bool)

(assert (=> start!38630 (=> (not res!230830) (not e!241873))))

(assert (=> start!38630 (= res!230830 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11806 _keys!709))))))

(assert (=> start!38630 e!241873))

(assert (=> start!38630 tp_is_empty!10063))

(assert (=> start!38630 tp!32667))

(assert (=> start!38630 true))

(declare-datatypes ((V!14523 0))(
  ( (V!14524 (val!5076 Int)) )
))
(declare-datatypes ((ValueCell!4688 0))(
  ( (ValueCellFull!4688 (v!7324 V!14523)) (EmptyCell!4688) )
))
(declare-datatypes ((array!24012 0))(
  ( (array!24013 (arr!11455 (Array (_ BitVec 32) ValueCell!4688)) (size!11807 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24012)

(declare-fun e!241871 () Bool)

(declare-fun array_inv!8458 (array!24012) Bool)

(assert (=> start!38630 (and (array_inv!8458 _values!549) e!241871)))

(declare-fun array_inv!8459 (array!24010) Bool)

(assert (=> start!38630 (array_inv!8459 _keys!709)))

(declare-fun b!401029 () Bool)

(declare-fun res!230834 () Bool)

(assert (=> b!401029 (=> (not res!230834) (not e!241873))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401029 (= res!230834 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun minValue!515 () V!14523)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!187787 () array!24010)

(declare-fun zeroValue!515 () V!14523)

(declare-datatypes ((tuple2!6598 0))(
  ( (tuple2!6599 (_1!3310 (_ BitVec 64)) (_2!3310 V!14523)) )
))
(declare-datatypes ((List!6518 0))(
  ( (Nil!6515) (Cons!6514 (h!7370 tuple2!6598) (t!11684 List!6518)) )
))
(declare-datatypes ((ListLongMap!5513 0))(
  ( (ListLongMap!5514 (toList!2772 List!6518)) )
))
(declare-fun call!28195 () ListLongMap!5513)

(declare-fun bm!28191 () Bool)

(declare-fun v!412 () V!14523)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!54705 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1029 (array!24010 array!24012 (_ BitVec 32) (_ BitVec 32) V!14523 V!14523 (_ BitVec 32) Int) ListLongMap!5513)

(assert (=> bm!28191 (= call!28195 (getCurrentListMapNoExtraKeys!1029 (ite c!54705 _keys!709 lt!187787) (ite c!54705 _values!549 (array!24013 (store (arr!11455 _values!549) i!563 (ValueCellFull!4688 v!412)) (size!11807 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28192 () Bool)

(declare-fun call!28194 () ListLongMap!5513)

(assert (=> bm!28192 (= call!28194 (getCurrentListMapNoExtraKeys!1029 (ite c!54705 lt!187787 _keys!709) (ite c!54705 (array!24013 (store (arr!11455 _values!549) i!563 (ValueCellFull!4688 v!412)) (size!11807 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401030 () Bool)

(declare-fun e!241876 () Bool)

(assert (=> b!401030 (= e!241876 (= call!28195 call!28194))))

(declare-fun b!401031 () Bool)

(declare-fun res!230828 () Bool)

(assert (=> b!401031 (=> (not res!230828) (not e!241873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401031 (= res!230828 (validKeyInArray!0 k0!794))))

(declare-fun b!401032 () Bool)

(declare-fun res!230833 () Bool)

(assert (=> b!401032 (=> (not res!230833) (not e!241873))))

(assert (=> b!401032 (= res!230833 (and (= (size!11807 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11806 _keys!709) (size!11807 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401033 () Bool)

(declare-fun +!1117 (ListLongMap!5513 tuple2!6598) ListLongMap!5513)

(assert (=> b!401033 (= e!241876 (= call!28194 (+!1117 call!28195 (tuple2!6599 k0!794 v!412))))))

(declare-fun b!401034 () Bool)

(declare-fun res!230829 () Bool)

(assert (=> b!401034 (=> (not res!230829) (not e!241873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24010 (_ BitVec 32)) Bool)

(assert (=> b!401034 (= res!230829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401035 () Bool)

(declare-fun res!230838 () Bool)

(assert (=> b!401035 (=> (not res!230838) (not e!241875))))

(declare-datatypes ((List!6519 0))(
  ( (Nil!6516) (Cons!6515 (h!7371 (_ BitVec 64)) (t!11685 List!6519)) )
))
(declare-fun arrayNoDuplicates!0 (array!24010 (_ BitVec 32) List!6519) Bool)

(assert (=> b!401035 (= res!230838 (arrayNoDuplicates!0 lt!187787 #b00000000000000000000000000000000 Nil!6516))))

(declare-fun mapIsEmpty!16716 () Bool)

(declare-fun mapRes!16716 () Bool)

(assert (=> mapIsEmpty!16716 mapRes!16716))

(declare-fun b!401036 () Bool)

(assert (=> b!401036 (= e!241875 (not true))))

(assert (=> b!401036 e!241876))

(assert (=> b!401036 (= c!54705 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12121 0))(
  ( (Unit!12122) )
))
(declare-fun lt!187788 () Unit!12121)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!328 (array!24010 array!24012 (_ BitVec 32) (_ BitVec 32) V!14523 V!14523 (_ BitVec 32) (_ BitVec 64) V!14523 (_ BitVec 32) Int) Unit!12121)

(assert (=> b!401036 (= lt!187788 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!328 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401037 () Bool)

(declare-fun e!241874 () Bool)

(assert (=> b!401037 (= e!241871 (and e!241874 mapRes!16716))))

(declare-fun condMapEmpty!16716 () Bool)

(declare-fun mapDefault!16716 () ValueCell!4688)

(assert (=> b!401037 (= condMapEmpty!16716 (= (arr!11455 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4688)) mapDefault!16716)))))

(declare-fun b!401038 () Bool)

(assert (=> b!401038 (= e!241874 tp_is_empty!10063)))

(declare-fun mapNonEmpty!16716 () Bool)

(declare-fun tp!32666 () Bool)

(assert (=> mapNonEmpty!16716 (= mapRes!16716 (and tp!32666 e!241872))))

(declare-fun mapValue!16716 () ValueCell!4688)

(declare-fun mapRest!16716 () (Array (_ BitVec 32) ValueCell!4688))

(declare-fun mapKey!16716 () (_ BitVec 32))

(assert (=> mapNonEmpty!16716 (= (arr!11455 _values!549) (store mapRest!16716 mapKey!16716 mapValue!16716))))

(declare-fun b!401039 () Bool)

(assert (=> b!401039 (= e!241873 e!241875)))

(declare-fun res!230832 () Bool)

(assert (=> b!401039 (=> (not res!230832) (not e!241875))))

(assert (=> b!401039 (= res!230832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187787 mask!1025))))

(assert (=> b!401039 (= lt!187787 (array!24011 (store (arr!11454 _keys!709) i!563 k0!794) (size!11806 _keys!709)))))

(declare-fun b!401040 () Bool)

(declare-fun res!230836 () Bool)

(assert (=> b!401040 (=> (not res!230836) (not e!241873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401040 (= res!230836 (validMask!0 mask!1025))))

(declare-fun b!401041 () Bool)

(declare-fun res!230831 () Bool)

(assert (=> b!401041 (=> (not res!230831) (not e!241873))))

(assert (=> b!401041 (= res!230831 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6516))))

(assert (= (and start!38630 res!230830) b!401040))

(assert (= (and b!401040 res!230836) b!401032))

(assert (= (and b!401032 res!230833) b!401034))

(assert (= (and b!401034 res!230829) b!401041))

(assert (= (and b!401041 res!230831) b!401025))

(assert (= (and b!401025 res!230837) b!401031))

(assert (= (and b!401031 res!230828) b!401028))

(assert (= (and b!401028 res!230835) b!401029))

(assert (= (and b!401029 res!230834) b!401039))

(assert (= (and b!401039 res!230832) b!401035))

(assert (= (and b!401035 res!230838) b!401027))

(assert (= (and b!401027 res!230827) b!401036))

(assert (= (and b!401036 c!54705) b!401033))

(assert (= (and b!401036 (not c!54705)) b!401030))

(assert (= (or b!401033 b!401030) bm!28192))

(assert (= (or b!401033 b!401030) bm!28191))

(assert (= (and b!401037 condMapEmpty!16716) mapIsEmpty!16716))

(assert (= (and b!401037 (not condMapEmpty!16716)) mapNonEmpty!16716))

(get-info :version)

(assert (= (and mapNonEmpty!16716 ((_ is ValueCellFull!4688) mapValue!16716)) b!401026))

(assert (= (and b!401037 ((_ is ValueCellFull!4688) mapDefault!16716)) b!401038))

(assert (= start!38630 b!401037))

(declare-fun m!395283 () Bool)

(assert (=> b!401036 m!395283))

(declare-fun m!395285 () Bool)

(assert (=> bm!28192 m!395285))

(declare-fun m!395287 () Bool)

(assert (=> bm!28192 m!395287))

(declare-fun m!395289 () Bool)

(assert (=> b!401039 m!395289))

(declare-fun m!395291 () Bool)

(assert (=> b!401039 m!395291))

(declare-fun m!395293 () Bool)

(assert (=> mapNonEmpty!16716 m!395293))

(declare-fun m!395295 () Bool)

(assert (=> b!401028 m!395295))

(declare-fun m!395297 () Bool)

(assert (=> b!401031 m!395297))

(declare-fun m!395299 () Bool)

(assert (=> b!401040 m!395299))

(declare-fun m!395301 () Bool)

(assert (=> start!38630 m!395301))

(declare-fun m!395303 () Bool)

(assert (=> start!38630 m!395303))

(declare-fun m!395305 () Bool)

(assert (=> b!401029 m!395305))

(declare-fun m!395307 () Bool)

(assert (=> b!401035 m!395307))

(assert (=> bm!28191 m!395285))

(declare-fun m!395309 () Bool)

(assert (=> bm!28191 m!395309))

(declare-fun m!395311 () Bool)

(assert (=> b!401034 m!395311))

(declare-fun m!395313 () Bool)

(assert (=> b!401033 m!395313))

(declare-fun m!395315 () Bool)

(assert (=> b!401041 m!395315))

(check-sat (not b!401036) (not b!401040) (not b!401031) (not mapNonEmpty!16716) (not b!401029) (not b!401034) (not bm!28191) (not b_next!9181) (not start!38630) (not b!401039) (not bm!28192) (not b!401041) b_and!16581 (not b!401033) tp_is_empty!10063 (not b!401035))
(check-sat b_and!16581 (not b_next!9181))
