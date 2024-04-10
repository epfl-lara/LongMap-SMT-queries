; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131982 () Bool)

(assert start!131982)

(declare-fun b_free!31695 () Bool)

(declare-fun b_next!31695 () Bool)

(assert (=> start!131982 (= b_free!31695 (not b_next!31695))))

(declare-fun tp!111336 () Bool)

(declare-fun b_and!51105 () Bool)

(assert (=> start!131982 (= tp!111336 b_and!51105)))

(declare-fun b!1546121 () Bool)

(declare-fun res!1060110 () Bool)

(declare-fun e!860609 () Bool)

(assert (=> b!1546121 (=> (not res!1060110) (not e!860609))))

(declare-datatypes ((array!103148 0))(
  ( (array!103149 (arr!49776 (Array (_ BitVec 32) (_ BitVec 64))) (size!50326 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103148)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546121 (= res!1060110 (validKeyInArray!0 (select (arr!49776 _keys!618) from!762)))))

(declare-datatypes ((V!59071 0))(
  ( (V!59072 (val!19063 Int)) )
))
(declare-fun zeroValue!436 () V!59071)

(declare-datatypes ((tuple2!24508 0))(
  ( (tuple2!24509 (_1!12265 (_ BitVec 64)) (_2!12265 V!59071)) )
))
(declare-datatypes ((List!36015 0))(
  ( (Nil!36012) (Cons!36011 (h!37456 tuple2!24508) (t!50709 List!36015)) )
))
(declare-datatypes ((ListLongMap!22117 0))(
  ( (ListLongMap!22118 (toList!11074 List!36015)) )
))
(declare-fun call!69443 () ListLongMap!22117)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18075 0))(
  ( (ValueCellFull!18075 (v!21864 V!59071)) (EmptyCell!18075) )
))
(declare-datatypes ((array!103150 0))(
  ( (array!103151 (arr!49777 (Array (_ BitVec 32) ValueCell!18075)) (size!50327 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103150)

(declare-fun minValue!436 () V!59071)

(declare-fun bm!69437 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6540 (array!103148 array!103150 (_ BitVec 32) (_ BitVec 32) V!59071 V!59071 (_ BitVec 32) Int) ListLongMap!22117)

(assert (=> bm!69437 (= call!69443 (getCurrentListMapNoExtraKeys!6540 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69438 () Bool)

(declare-fun call!69441 () ListLongMap!22117)

(declare-fun call!69440 () ListLongMap!22117)

(assert (=> bm!69438 (= call!69441 call!69440)))

(declare-fun b!1546122 () Bool)

(declare-fun e!860607 () ListLongMap!22117)

(declare-fun call!69444 () ListLongMap!22117)

(assert (=> b!1546122 (= e!860607 call!69444)))

(declare-fun b!1546123 () Bool)

(declare-fun e!860610 () ListLongMap!22117)

(declare-fun e!860605 () ListLongMap!22117)

(assert (=> b!1546123 (= e!860610 e!860605)))

(declare-fun c!141757 () Bool)

(declare-fun lt!666488 () Bool)

(assert (=> b!1546123 (= c!141757 (and (not lt!666488) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546124 () Bool)

(declare-fun e!860608 () Bool)

(declare-fun e!860612 () Bool)

(declare-fun mapRes!58660 () Bool)

(assert (=> b!1546124 (= e!860608 (and e!860612 mapRes!58660))))

(declare-fun condMapEmpty!58660 () Bool)

(declare-fun mapDefault!58660 () ValueCell!18075)

(assert (=> b!1546124 (= condMapEmpty!58660 (= (arr!49777 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18075)) mapDefault!58660)))))

(declare-fun b!1546125 () Bool)

(declare-fun e!860611 () Bool)

(declare-fun tp_is_empty!37971 () Bool)

(assert (=> b!1546125 (= e!860611 tp_is_empty!37971)))

(declare-fun b!1546126 () Bool)

(assert (=> b!1546126 (= e!860609 (not true))))

(declare-fun lt!666486 () ListLongMap!22117)

(declare-fun contains!10042 (ListLongMap!22117 (_ BitVec 64)) Bool)

(declare-fun +!4909 (ListLongMap!22117 tuple2!24508) ListLongMap!22117)

(assert (=> b!1546126 (contains!10042 (+!4909 lt!666486 (tuple2!24509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49776 _keys!618) from!762))))

(declare-datatypes ((Unit!51520 0))(
  ( (Unit!51521) )
))
(declare-fun lt!666487 () Unit!51520)

(declare-fun addStillContains!1230 (ListLongMap!22117 (_ BitVec 64) V!59071 (_ BitVec 64)) Unit!51520)

(assert (=> b!1546126 (= lt!666487 (addStillContains!1230 lt!666486 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49776 _keys!618) from!762)))))

(assert (=> b!1546126 (= lt!666486 (getCurrentListMapNoExtraKeys!6540 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546127 () Bool)

(declare-fun res!1060106 () Bool)

(declare-fun e!860613 () Bool)

(assert (=> b!1546127 (=> (not res!1060106) (not e!860613))))

(declare-datatypes ((List!36016 0))(
  ( (Nil!36013) (Cons!36012 (h!37457 (_ BitVec 64)) (t!50710 List!36016)) )
))
(declare-fun arrayNoDuplicates!0 (array!103148 (_ BitVec 32) List!36016) Bool)

(assert (=> b!1546127 (= res!1060106 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36013))))

(declare-fun b!1546128 () Bool)

(assert (=> b!1546128 (= e!860613 e!860609)))

(declare-fun res!1060109 () Bool)

(assert (=> b!1546128 (=> (not res!1060109) (not e!860609))))

(assert (=> b!1546128 (= res!1060109 (bvslt from!762 (size!50326 _keys!618)))))

(declare-fun lt!666485 () ListLongMap!22117)

(assert (=> b!1546128 (= lt!666485 e!860610)))

(declare-fun c!141756 () Bool)

(assert (=> b!1546128 (= c!141756 (and (not lt!666488) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546128 (= lt!666488 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69439 () Bool)

(declare-fun call!69442 () ListLongMap!22117)

(assert (=> bm!69439 (= call!69442 (+!4909 (ite c!141756 call!69443 (ite c!141757 call!69440 call!69441)) (ite (or c!141756 c!141757) (tuple2!24509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546129 () Bool)

(assert (=> b!1546129 (= e!860605 call!69444)))

(declare-fun res!1060104 () Bool)

(assert (=> start!131982 (=> (not res!1060104) (not e!860613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131982 (= res!1060104 (validMask!0 mask!926))))

(assert (=> start!131982 e!860613))

(declare-fun array_inv!38715 (array!103148) Bool)

(assert (=> start!131982 (array_inv!38715 _keys!618)))

(assert (=> start!131982 tp_is_empty!37971))

(assert (=> start!131982 true))

(assert (=> start!131982 tp!111336))

(declare-fun array_inv!38716 (array!103150) Bool)

(assert (=> start!131982 (and (array_inv!38716 _values!470) e!860608)))

(declare-fun mapNonEmpty!58660 () Bool)

(declare-fun tp!111337 () Bool)

(assert (=> mapNonEmpty!58660 (= mapRes!58660 (and tp!111337 e!860611))))

(declare-fun mapRest!58660 () (Array (_ BitVec 32) ValueCell!18075))

(declare-fun mapKey!58660 () (_ BitVec 32))

(declare-fun mapValue!58660 () ValueCell!18075)

(assert (=> mapNonEmpty!58660 (= (arr!49777 _values!470) (store mapRest!58660 mapKey!58660 mapValue!58660))))

(declare-fun b!1546130 () Bool)

(declare-fun res!1060107 () Bool)

(assert (=> b!1546130 (=> (not res!1060107) (not e!860613))))

(assert (=> b!1546130 (= res!1060107 (and (= (size!50327 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50326 _keys!618) (size!50327 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546131 () Bool)

(declare-fun res!1060105 () Bool)

(assert (=> b!1546131 (=> (not res!1060105) (not e!860613))))

(assert (=> b!1546131 (= res!1060105 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50326 _keys!618))))))

(declare-fun b!1546132 () Bool)

(assert (=> b!1546132 (= e!860612 tp_is_empty!37971)))

(declare-fun b!1546133 () Bool)

(declare-fun res!1060108 () Bool)

(assert (=> b!1546133 (=> (not res!1060108) (not e!860613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103148 (_ BitVec 32)) Bool)

(assert (=> b!1546133 (= res!1060108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546134 () Bool)

(assert (=> b!1546134 (= e!860610 (+!4909 call!69442 (tuple2!24509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69440 () Bool)

(assert (=> bm!69440 (= call!69444 call!69442)))

(declare-fun mapIsEmpty!58660 () Bool)

(assert (=> mapIsEmpty!58660 mapRes!58660))

(declare-fun b!1546135 () Bool)

(assert (=> b!1546135 (= e!860607 call!69441)))

(declare-fun b!1546136 () Bool)

(declare-fun c!141758 () Bool)

(assert (=> b!1546136 (= c!141758 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666488))))

(assert (=> b!1546136 (= e!860605 e!860607)))

(declare-fun bm!69441 () Bool)

(assert (=> bm!69441 (= call!69440 call!69443)))

(assert (= (and start!131982 res!1060104) b!1546130))

(assert (= (and b!1546130 res!1060107) b!1546133))

(assert (= (and b!1546133 res!1060108) b!1546127))

(assert (= (and b!1546127 res!1060106) b!1546131))

(assert (= (and b!1546131 res!1060105) b!1546128))

(assert (= (and b!1546128 c!141756) b!1546134))

(assert (= (and b!1546128 (not c!141756)) b!1546123))

(assert (= (and b!1546123 c!141757) b!1546129))

(assert (= (and b!1546123 (not c!141757)) b!1546136))

(assert (= (and b!1546136 c!141758) b!1546122))

(assert (= (and b!1546136 (not c!141758)) b!1546135))

(assert (= (or b!1546122 b!1546135) bm!69438))

(assert (= (or b!1546129 bm!69438) bm!69441))

(assert (= (or b!1546129 b!1546122) bm!69440))

(assert (= (or b!1546134 bm!69441) bm!69437))

(assert (= (or b!1546134 bm!69440) bm!69439))

(assert (= (and b!1546128 res!1060109) b!1546121))

(assert (= (and b!1546121 res!1060110) b!1546126))

(assert (= (and b!1546124 condMapEmpty!58660) mapIsEmpty!58660))

(assert (= (and b!1546124 (not condMapEmpty!58660)) mapNonEmpty!58660))

(get-info :version)

(assert (= (and mapNonEmpty!58660 ((_ is ValueCellFull!18075) mapValue!58660)) b!1546125))

(assert (= (and b!1546124 ((_ is ValueCellFull!18075) mapDefault!58660)) b!1546132))

(assert (= start!131982 b!1546124))

(declare-fun m!1426151 () Bool)

(assert (=> bm!69437 m!1426151))

(declare-fun m!1426153 () Bool)

(assert (=> mapNonEmpty!58660 m!1426153))

(declare-fun m!1426155 () Bool)

(assert (=> b!1546134 m!1426155))

(declare-fun m!1426157 () Bool)

(assert (=> b!1546126 m!1426157))

(assert (=> b!1546126 m!1426157))

(declare-fun m!1426159 () Bool)

(assert (=> b!1546126 m!1426159))

(declare-fun m!1426161 () Bool)

(assert (=> b!1546126 m!1426161))

(assert (=> b!1546126 m!1426151))

(assert (=> b!1546126 m!1426161))

(assert (=> b!1546126 m!1426157))

(declare-fun m!1426163 () Bool)

(assert (=> b!1546126 m!1426163))

(declare-fun m!1426165 () Bool)

(assert (=> bm!69439 m!1426165))

(declare-fun m!1426167 () Bool)

(assert (=> start!131982 m!1426167))

(declare-fun m!1426169 () Bool)

(assert (=> start!131982 m!1426169))

(declare-fun m!1426171 () Bool)

(assert (=> start!131982 m!1426171))

(assert (=> b!1546121 m!1426157))

(assert (=> b!1546121 m!1426157))

(declare-fun m!1426173 () Bool)

(assert (=> b!1546121 m!1426173))

(declare-fun m!1426175 () Bool)

(assert (=> b!1546133 m!1426175))

(declare-fun m!1426177 () Bool)

(assert (=> b!1546127 m!1426177))

(check-sat (not mapNonEmpty!58660) b_and!51105 (not bm!69437) (not b!1546126) (not b!1546134) (not b!1546133) (not b!1546121) (not b!1546127) (not bm!69439) (not b_next!31695) (not start!131982) tp_is_empty!37971)
(check-sat b_and!51105 (not b_next!31695))
