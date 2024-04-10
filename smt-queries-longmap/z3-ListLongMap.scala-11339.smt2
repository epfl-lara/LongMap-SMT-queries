; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131940 () Bool)

(assert start!131940)

(declare-fun b_free!31653 () Bool)

(declare-fun b_next!31653 () Bool)

(assert (=> start!131940 (= b_free!31653 (not b_next!31653))))

(declare-fun tp!111210 () Bool)

(declare-fun b_and!51063 () Bool)

(assert (=> start!131940 (= tp!111210 b_and!51063)))

(declare-fun b!1545113 () Bool)

(declare-datatypes ((V!59015 0))(
  ( (V!59016 (val!19042 Int)) )
))
(declare-datatypes ((tuple2!24468 0))(
  ( (tuple2!24469 (_1!12245 (_ BitVec 64)) (_2!12245 V!59015)) )
))
(declare-datatypes ((List!35979 0))(
  ( (Nil!35976) (Cons!35975 (h!37420 tuple2!24468) (t!50673 List!35979)) )
))
(declare-datatypes ((ListLongMap!22077 0))(
  ( (ListLongMap!22078 (toList!11054 List!35979)) )
))
(declare-fun e!860045 () ListLongMap!22077)

(declare-fun call!69125 () ListLongMap!22077)

(assert (=> b!1545113 (= e!860045 call!69125)))

(declare-fun bm!69122 () Bool)

(declare-fun call!69129 () ListLongMap!22077)

(declare-fun call!69128 () ListLongMap!22077)

(assert (=> bm!69122 (= call!69129 call!69128)))

(declare-fun b!1545114 () Bool)

(declare-fun e!860038 () Bool)

(declare-fun e!860039 () Bool)

(assert (=> b!1545114 (= e!860038 e!860039)))

(declare-fun res!1059663 () Bool)

(assert (=> b!1545114 (=> (not res!1059663) (not e!860039))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103066 0))(
  ( (array!103067 (arr!49735 (Array (_ BitVec 32) (_ BitVec 64))) (size!50285 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103066)

(assert (=> b!1545114 (= res!1059663 (bvslt from!762 (size!50285 _keys!618)))))

(declare-fun lt!666237 () ListLongMap!22077)

(declare-fun e!860046 () ListLongMap!22077)

(assert (=> b!1545114 (= lt!666237 e!860046)))

(declare-fun c!141567 () Bool)

(declare-fun lt!666238 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545114 (= c!141567 (and (not lt!666238) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545114 (= lt!666238 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!436 () V!59015)

(declare-fun bm!69123 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18054 0))(
  ( (ValueCellFull!18054 (v!21843 V!59015)) (EmptyCell!18054) )
))
(declare-datatypes ((array!103068 0))(
  ( (array!103069 (arr!49736 (Array (_ BitVec 32) ValueCell!18054)) (size!50286 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103068)

(declare-fun minValue!436 () V!59015)

(declare-fun call!69126 () ListLongMap!22077)

(declare-fun getCurrentListMapNoExtraKeys!6523 (array!103066 array!103068 (_ BitVec 32) (_ BitVec 32) V!59015 V!59015 (_ BitVec 32) Int) ListLongMap!22077)

(assert (=> bm!69123 (= call!69126 (getCurrentListMapNoExtraKeys!6523 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545115 () Bool)

(declare-fun e!860040 () Bool)

(declare-fun e!860042 () Bool)

(declare-fun mapRes!58597 () Bool)

(assert (=> b!1545115 (= e!860040 (and e!860042 mapRes!58597))))

(declare-fun condMapEmpty!58597 () Bool)

(declare-fun mapDefault!58597 () ValueCell!18054)

(assert (=> b!1545115 (= condMapEmpty!58597 (= (arr!49736 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18054)) mapDefault!58597)))))

(declare-fun mapNonEmpty!58597 () Bool)

(declare-fun tp!111211 () Bool)

(declare-fun e!860043 () Bool)

(assert (=> mapNonEmpty!58597 (= mapRes!58597 (and tp!111211 e!860043))))

(declare-fun mapKey!58597 () (_ BitVec 32))

(declare-fun mapRest!58597 () (Array (_ BitVec 32) ValueCell!18054))

(declare-fun mapValue!58597 () ValueCell!18054)

(assert (=> mapNonEmpty!58597 (= (arr!49736 _values!470) (store mapRest!58597 mapKey!58597 mapValue!58597))))

(declare-fun c!141568 () Bool)

(declare-fun bm!69124 () Bool)

(declare-fun call!69127 () ListLongMap!22077)

(declare-fun +!4890 (ListLongMap!22077 tuple2!24468) ListLongMap!22077)

(assert (=> bm!69124 (= call!69128 (+!4890 (ite c!141567 call!69126 (ite c!141568 call!69127 call!69125)) (ite (or c!141567 c!141568) (tuple2!24469 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24469 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545116 () Bool)

(assert (=> b!1545116 (= e!860046 (+!4890 call!69128 (tuple2!24469 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545117 () Bool)

(declare-fun res!1059667 () Bool)

(assert (=> b!1545117 (=> (not res!1059667) (not e!860038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103066 (_ BitVec 32)) Bool)

(assert (=> b!1545117 (= res!1059667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545118 () Bool)

(declare-fun res!1059668 () Bool)

(assert (=> b!1545118 (=> (not res!1059668) (not e!860039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545118 (= res!1059668 (validKeyInArray!0 (select (arr!49735 _keys!618) from!762)))))

(declare-fun b!1545119 () Bool)

(declare-fun tp_is_empty!37929 () Bool)

(assert (=> b!1545119 (= e!860042 tp_is_empty!37929)))

(declare-fun mapIsEmpty!58597 () Bool)

(assert (=> mapIsEmpty!58597 mapRes!58597))

(declare-fun b!1545120 () Bool)

(declare-fun e!860044 () ListLongMap!22077)

(assert (=> b!1545120 (= e!860044 call!69129)))

(declare-fun b!1545122 () Bool)

(declare-fun c!141569 () Bool)

(assert (=> b!1545122 (= c!141569 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666238))))

(assert (=> b!1545122 (= e!860044 e!860045)))

(declare-fun b!1545123 () Bool)

(declare-fun res!1059666 () Bool)

(assert (=> b!1545123 (=> (not res!1059666) (not e!860038))))

(assert (=> b!1545123 (= res!1059666 (and (= (size!50286 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50285 _keys!618) (size!50286 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69125 () Bool)

(assert (=> bm!69125 (= call!69125 call!69127)))

(declare-fun b!1545124 () Bool)

(assert (=> b!1545124 (= e!860045 call!69129)))

(declare-fun bm!69126 () Bool)

(assert (=> bm!69126 (= call!69127 call!69126)))

(declare-fun b!1545125 () Bool)

(declare-fun res!1059664 () Bool)

(assert (=> b!1545125 (=> (not res!1059664) (not e!860038))))

(assert (=> b!1545125 (= res!1059664 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50285 _keys!618))))))

(declare-fun b!1545126 () Bool)

(assert (=> b!1545126 (= e!860043 tp_is_empty!37929)))

(declare-fun b!1545127 () Bool)

(assert (=> b!1545127 (= e!860046 e!860044)))

(assert (=> b!1545127 (= c!141568 (and (not lt!666238) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545128 () Bool)

(declare-fun res!1059665 () Bool)

(assert (=> b!1545128 (=> (not res!1059665) (not e!860038))))

(declare-datatypes ((List!35980 0))(
  ( (Nil!35977) (Cons!35976 (h!37421 (_ BitVec 64)) (t!50674 List!35980)) )
))
(declare-fun arrayNoDuplicates!0 (array!103066 (_ BitVec 32) List!35980) Bool)

(assert (=> b!1545128 (= res!1059665 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35977))))

(declare-fun res!1059669 () Bool)

(assert (=> start!131940 (=> (not res!1059669) (not e!860038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131940 (= res!1059669 (validMask!0 mask!926))))

(assert (=> start!131940 e!860038))

(declare-fun array_inv!38685 (array!103066) Bool)

(assert (=> start!131940 (array_inv!38685 _keys!618)))

(assert (=> start!131940 tp_is_empty!37929))

(assert (=> start!131940 true))

(assert (=> start!131940 tp!111210))

(declare-fun array_inv!38686 (array!103068) Bool)

(assert (=> start!131940 (and (array_inv!38686 _values!470) e!860040)))

(declare-fun b!1545121 () Bool)

(assert (=> b!1545121 (= e!860039 false)))

(declare-fun lt!666239 () Bool)

(declare-fun contains!10027 (ListLongMap!22077 (_ BitVec 64)) Bool)

(assert (=> b!1545121 (= lt!666239 (contains!10027 (getCurrentListMapNoExtraKeys!6523 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49735 _keys!618) from!762)))))

(assert (= (and start!131940 res!1059669) b!1545123))

(assert (= (and b!1545123 res!1059666) b!1545117))

(assert (= (and b!1545117 res!1059667) b!1545128))

(assert (= (and b!1545128 res!1059665) b!1545125))

(assert (= (and b!1545125 res!1059664) b!1545114))

(assert (= (and b!1545114 c!141567) b!1545116))

(assert (= (and b!1545114 (not c!141567)) b!1545127))

(assert (= (and b!1545127 c!141568) b!1545120))

(assert (= (and b!1545127 (not c!141568)) b!1545122))

(assert (= (and b!1545122 c!141569) b!1545124))

(assert (= (and b!1545122 (not c!141569)) b!1545113))

(assert (= (or b!1545124 b!1545113) bm!69125))

(assert (= (or b!1545120 bm!69125) bm!69126))

(assert (= (or b!1545120 b!1545124) bm!69122))

(assert (= (or b!1545116 bm!69126) bm!69123))

(assert (= (or b!1545116 bm!69122) bm!69124))

(assert (= (and b!1545114 res!1059663) b!1545118))

(assert (= (and b!1545118 res!1059668) b!1545121))

(assert (= (and b!1545115 condMapEmpty!58597) mapIsEmpty!58597))

(assert (= (and b!1545115 (not condMapEmpty!58597)) mapNonEmpty!58597))

(get-info :version)

(assert (= (and mapNonEmpty!58597 ((_ is ValueCellFull!18054) mapValue!58597)) b!1545126))

(assert (= (and b!1545115 ((_ is ValueCellFull!18054) mapDefault!58597)) b!1545119))

(assert (= start!131940 b!1545115))

(declare-fun m!1425571 () Bool)

(assert (=> b!1545117 m!1425571))

(declare-fun m!1425573 () Bool)

(assert (=> start!131940 m!1425573))

(declare-fun m!1425575 () Bool)

(assert (=> start!131940 m!1425575))

(declare-fun m!1425577 () Bool)

(assert (=> start!131940 m!1425577))

(declare-fun m!1425579 () Bool)

(assert (=> b!1545128 m!1425579))

(declare-fun m!1425581 () Bool)

(assert (=> b!1545121 m!1425581))

(declare-fun m!1425583 () Bool)

(assert (=> b!1545121 m!1425583))

(assert (=> b!1545121 m!1425581))

(assert (=> b!1545121 m!1425583))

(declare-fun m!1425585 () Bool)

(assert (=> b!1545121 m!1425585))

(declare-fun m!1425587 () Bool)

(assert (=> mapNonEmpty!58597 m!1425587))

(declare-fun m!1425589 () Bool)

(assert (=> bm!69124 m!1425589))

(assert (=> b!1545118 m!1425583))

(assert (=> b!1545118 m!1425583))

(declare-fun m!1425591 () Bool)

(assert (=> b!1545118 m!1425591))

(assert (=> bm!69123 m!1425581))

(declare-fun m!1425593 () Bool)

(assert (=> b!1545116 m!1425593))

(check-sat (not b!1545116) (not bm!69124) (not b!1545117) (not b!1545121) (not mapNonEmpty!58597) (not start!131940) (not b!1545128) (not b!1545118) (not b_next!31653) (not bm!69123) tp_is_empty!37929 b_and!51063)
(check-sat b_and!51063 (not b_next!31653))
