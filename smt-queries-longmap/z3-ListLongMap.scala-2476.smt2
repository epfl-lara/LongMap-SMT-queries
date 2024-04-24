; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38660 () Bool)

(assert start!38660)

(declare-fun b_free!9211 () Bool)

(declare-fun b_next!9211 () Bool)

(assert (=> start!38660 (= b_free!9211 (not b_next!9211))))

(declare-fun tp!32756 () Bool)

(declare-fun b_and!16611 () Bool)

(assert (=> start!38660 (= tp!32756 b_and!16611)))

(declare-fun b!401790 () Bool)

(declare-fun e!242185 () Bool)

(declare-datatypes ((V!14563 0))(
  ( (V!14564 (val!5091 Int)) )
))
(declare-datatypes ((tuple2!6622 0))(
  ( (tuple2!6623 (_1!3322 (_ BitVec 64)) (_2!3322 V!14563)) )
))
(declare-datatypes ((List!6543 0))(
  ( (Nil!6540) (Cons!6539 (h!7395 tuple2!6622) (t!11709 List!6543)) )
))
(declare-datatypes ((ListLongMap!5537 0))(
  ( (ListLongMap!5538 (toList!2784 List!6543)) )
))
(declare-fun call!28285 () ListLongMap!5537)

(declare-fun call!28284 () ListLongMap!5537)

(assert (=> b!401790 (= e!242185 (= call!28285 call!28284))))

(declare-fun b!401791 () Bool)

(declare-fun e!242190 () Bool)

(declare-fun e!242186 () Bool)

(declare-fun mapRes!16761 () Bool)

(assert (=> b!401791 (= e!242190 (and e!242186 mapRes!16761))))

(declare-fun condMapEmpty!16761 () Bool)

(declare-datatypes ((ValueCell!4703 0))(
  ( (ValueCellFull!4703 (v!7339 V!14563)) (EmptyCell!4703) )
))
(declare-datatypes ((array!24070 0))(
  ( (array!24071 (arr!11484 (Array (_ BitVec 32) ValueCell!4703)) (size!11836 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24070)

(declare-fun mapDefault!16761 () ValueCell!4703)

(assert (=> b!401791 (= condMapEmpty!16761 (= (arr!11484 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4703)) mapDefault!16761)))))

(declare-fun mapNonEmpty!16761 () Bool)

(declare-fun tp!32757 () Bool)

(declare-fun e!242188 () Bool)

(assert (=> mapNonEmpty!16761 (= mapRes!16761 (and tp!32757 e!242188))))

(declare-fun mapKey!16761 () (_ BitVec 32))

(declare-fun mapValue!16761 () ValueCell!4703)

(declare-fun mapRest!16761 () (Array (_ BitVec 32) ValueCell!4703))

(assert (=> mapNonEmpty!16761 (= (arr!11484 _values!549) (store mapRest!16761 mapKey!16761 mapValue!16761))))

(declare-fun res!231371 () Bool)

(declare-fun e!242187 () Bool)

(assert (=> start!38660 (=> (not res!231371) (not e!242187))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24072 0))(
  ( (array!24073 (arr!11485 (Array (_ BitVec 32) (_ BitVec 64))) (size!11837 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24072)

(assert (=> start!38660 (= res!231371 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11837 _keys!709))))))

(assert (=> start!38660 e!242187))

(declare-fun tp_is_empty!10093 () Bool)

(assert (=> start!38660 tp_is_empty!10093))

(assert (=> start!38660 tp!32756))

(assert (=> start!38660 true))

(declare-fun array_inv!8482 (array!24070) Bool)

(assert (=> start!38660 (and (array_inv!8482 _values!549) e!242190)))

(declare-fun array_inv!8483 (array!24072) Bool)

(assert (=> start!38660 (array_inv!8483 _keys!709)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!401792 () Bool)

(declare-fun v!412 () V!14563)

(declare-fun +!1128 (ListLongMap!5537 tuple2!6622) ListLongMap!5537)

(assert (=> b!401792 (= e!242185 (= call!28284 (+!1128 call!28285 (tuple2!6623 k0!794 v!412))))))

(declare-fun minValue!515 () V!14563)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28281 () Bool)

(declare-fun zeroValue!515 () V!14563)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!187877 () array!24072)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54750 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1040 (array!24072 array!24070 (_ BitVec 32) (_ BitVec 32) V!14563 V!14563 (_ BitVec 32) Int) ListLongMap!5537)

(assert (=> bm!28281 (= call!28285 (getCurrentListMapNoExtraKeys!1040 (ite c!54750 _keys!709 lt!187877) (ite c!54750 _values!549 (array!24071 (store (arr!11484 _values!549) i!563 (ValueCellFull!4703 v!412)) (size!11836 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28282 () Bool)

(assert (=> bm!28282 (= call!28284 (getCurrentListMapNoExtraKeys!1040 (ite c!54750 lt!187877 _keys!709) (ite c!54750 (array!24071 (store (arr!11484 _values!549) i!563 (ValueCellFull!4703 v!412)) (size!11836 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401793 () Bool)

(declare-fun res!231367 () Bool)

(assert (=> b!401793 (=> (not res!231367) (not e!242187))))

(declare-fun arrayContainsKey!0 (array!24072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401793 (= res!231367 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16761 () Bool)

(assert (=> mapIsEmpty!16761 mapRes!16761))

(declare-fun b!401794 () Bool)

(assert (=> b!401794 (= e!242186 tp_is_empty!10093)))

(declare-fun b!401795 () Bool)

(declare-fun e!242191 () Bool)

(assert (=> b!401795 (= e!242187 e!242191)))

(declare-fun res!231368 () Bool)

(assert (=> b!401795 (=> (not res!231368) (not e!242191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24072 (_ BitVec 32)) Bool)

(assert (=> b!401795 (= res!231368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187877 mask!1025))))

(assert (=> b!401795 (= lt!187877 (array!24073 (store (arr!11485 _keys!709) i!563 k0!794) (size!11837 _keys!709)))))

(declare-fun b!401796 () Bool)

(declare-fun res!231377 () Bool)

(assert (=> b!401796 (=> (not res!231377) (not e!242187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401796 (= res!231377 (validMask!0 mask!1025))))

(declare-fun b!401797 () Bool)

(declare-fun res!231378 () Bool)

(assert (=> b!401797 (=> (not res!231378) (not e!242187))))

(assert (=> b!401797 (= res!231378 (and (= (size!11836 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11837 _keys!709) (size!11836 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401798 () Bool)

(assert (=> b!401798 (= e!242191 (not true))))

(assert (=> b!401798 e!242185))

(assert (=> b!401798 (= c!54750 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12145 0))(
  ( (Unit!12146) )
))
(declare-fun lt!187878 () Unit!12145)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!340 (array!24072 array!24070 (_ BitVec 32) (_ BitVec 32) V!14563 V!14563 (_ BitVec 32) (_ BitVec 64) V!14563 (_ BitVec 32) Int) Unit!12145)

(assert (=> b!401798 (= lt!187878 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!340 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401799 () Bool)

(declare-fun res!231376 () Bool)

(assert (=> b!401799 (=> (not res!231376) (not e!242191))))

(declare-datatypes ((List!6544 0))(
  ( (Nil!6541) (Cons!6540 (h!7396 (_ BitVec 64)) (t!11710 List!6544)) )
))
(declare-fun arrayNoDuplicates!0 (array!24072 (_ BitVec 32) List!6544) Bool)

(assert (=> b!401799 (= res!231376 (arrayNoDuplicates!0 lt!187877 #b00000000000000000000000000000000 Nil!6541))))

(declare-fun b!401800 () Bool)

(assert (=> b!401800 (= e!242188 tp_is_empty!10093)))

(declare-fun b!401801 () Bool)

(declare-fun res!231372 () Bool)

(assert (=> b!401801 (=> (not res!231372) (not e!242187))))

(assert (=> b!401801 (= res!231372 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6541))))

(declare-fun b!401802 () Bool)

(declare-fun res!231375 () Bool)

(assert (=> b!401802 (=> (not res!231375) (not e!242187))))

(assert (=> b!401802 (= res!231375 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11837 _keys!709))))))

(declare-fun b!401803 () Bool)

(declare-fun res!231369 () Bool)

(assert (=> b!401803 (=> (not res!231369) (not e!242191))))

(assert (=> b!401803 (= res!231369 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11837 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401804 () Bool)

(declare-fun res!231374 () Bool)

(assert (=> b!401804 (=> (not res!231374) (not e!242187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401804 (= res!231374 (validKeyInArray!0 k0!794))))

(declare-fun b!401805 () Bool)

(declare-fun res!231373 () Bool)

(assert (=> b!401805 (=> (not res!231373) (not e!242187))))

(assert (=> b!401805 (= res!231373 (or (= (select (arr!11485 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11485 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401806 () Bool)

(declare-fun res!231370 () Bool)

(assert (=> b!401806 (=> (not res!231370) (not e!242187))))

(assert (=> b!401806 (= res!231370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38660 res!231371) b!401796))

(assert (= (and b!401796 res!231377) b!401797))

(assert (= (and b!401797 res!231378) b!401806))

(assert (= (and b!401806 res!231370) b!401801))

(assert (= (and b!401801 res!231372) b!401802))

(assert (= (and b!401802 res!231375) b!401804))

(assert (= (and b!401804 res!231374) b!401805))

(assert (= (and b!401805 res!231373) b!401793))

(assert (= (and b!401793 res!231367) b!401795))

(assert (= (and b!401795 res!231368) b!401799))

(assert (= (and b!401799 res!231376) b!401803))

(assert (= (and b!401803 res!231369) b!401798))

(assert (= (and b!401798 c!54750) b!401792))

(assert (= (and b!401798 (not c!54750)) b!401790))

(assert (= (or b!401792 b!401790) bm!28282))

(assert (= (or b!401792 b!401790) bm!28281))

(assert (= (and b!401791 condMapEmpty!16761) mapIsEmpty!16761))

(assert (= (and b!401791 (not condMapEmpty!16761)) mapNonEmpty!16761))

(get-info :version)

(assert (= (and mapNonEmpty!16761 ((_ is ValueCellFull!4703) mapValue!16761)) b!401800))

(assert (= (and b!401791 ((_ is ValueCellFull!4703) mapDefault!16761)) b!401794))

(assert (= start!38660 b!401791))

(declare-fun m!395793 () Bool)

(assert (=> b!401801 m!395793))

(declare-fun m!395795 () Bool)

(assert (=> b!401799 m!395795))

(declare-fun m!395797 () Bool)

(assert (=> b!401806 m!395797))

(declare-fun m!395799 () Bool)

(assert (=> b!401804 m!395799))

(declare-fun m!395801 () Bool)

(assert (=> bm!28281 m!395801))

(declare-fun m!395803 () Bool)

(assert (=> bm!28281 m!395803))

(declare-fun m!395805 () Bool)

(assert (=> b!401805 m!395805))

(declare-fun m!395807 () Bool)

(assert (=> b!401796 m!395807))

(assert (=> bm!28282 m!395801))

(declare-fun m!395809 () Bool)

(assert (=> bm!28282 m!395809))

(declare-fun m!395811 () Bool)

(assert (=> b!401793 m!395811))

(declare-fun m!395813 () Bool)

(assert (=> b!401795 m!395813))

(declare-fun m!395815 () Bool)

(assert (=> b!401795 m!395815))

(declare-fun m!395817 () Bool)

(assert (=> b!401792 m!395817))

(declare-fun m!395819 () Bool)

(assert (=> b!401798 m!395819))

(declare-fun m!395821 () Bool)

(assert (=> start!38660 m!395821))

(declare-fun m!395823 () Bool)

(assert (=> start!38660 m!395823))

(declare-fun m!395825 () Bool)

(assert (=> mapNonEmpty!16761 m!395825))

(check-sat b_and!16611 (not b!401795) (not b!401792) (not start!38660) (not mapNonEmpty!16761) tp_is_empty!10093 (not b!401801) (not b!401798) (not b!401796) (not b!401804) (not bm!28281) (not bm!28282) (not b!401806) (not b!401793) (not b!401799) (not b_next!9211))
(check-sat b_and!16611 (not b_next!9211))
