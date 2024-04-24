; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132326 () Bool)

(assert start!132326)

(declare-fun b_free!31627 () Bool)

(declare-fun b_next!31627 () Bool)

(assert (=> start!132326 (= b_free!31627 (not b_next!31627))))

(declare-fun tp!111132 () Bool)

(declare-fun b_and!51039 () Bool)

(assert (=> start!132326 (= tp!111132 b_and!51039)))

(declare-datatypes ((V!58981 0))(
  ( (V!58982 (val!19029 Int)) )
))
(declare-fun zeroValue!436 () V!58981)

(declare-datatypes ((tuple2!24504 0))(
  ( (tuple2!24505 (_1!12263 (_ BitVec 64)) (_2!12263 V!58981)) )
))
(declare-datatypes ((List!35999 0))(
  ( (Nil!35996) (Cons!35995 (h!37458 tuple2!24504) (t!50685 List!35999)) )
))
(declare-datatypes ((ListLongMap!22121 0))(
  ( (ListLongMap!22122 (toList!11076 List!35999)) )
))
(declare-fun call!69080 () ListLongMap!22121)

(declare-fun minValue!436 () V!58981)

(declare-fun c!142250 () Bool)

(declare-fun bm!69077 () Bool)

(declare-fun call!69083 () ListLongMap!22121)

(declare-fun c!142252 () Bool)

(declare-fun call!69082 () ListLongMap!22121)

(declare-fun call!69084 () ListLongMap!22121)

(declare-fun +!4923 (ListLongMap!22121 tuple2!24504) ListLongMap!22121)

(assert (=> bm!69077 (= call!69080 (+!4923 (ite c!142250 call!69083 (ite c!142252 call!69082 call!69084)) (ite (or c!142250 c!142252) (tuple2!24505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546993 () Bool)

(declare-fun res!1060321 () Bool)

(declare-fun e!861234 () Bool)

(assert (=> b!1546993 (=> (not res!1060321) (not e!861234))))

(declare-datatypes ((array!103138 0))(
  ( (array!103139 (arr!49764 (Array (_ BitVec 32) (_ BitVec 64))) (size!50315 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103138)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103138 (_ BitVec 32)) Bool)

(assert (=> b!1546993 (= res!1060321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546994 () Bool)

(declare-fun e!861233 () ListLongMap!22121)

(declare-fun call!69081 () ListLongMap!22121)

(assert (=> b!1546994 (= e!861233 call!69081)))

(declare-fun bm!69078 () Bool)

(assert (=> bm!69078 (= call!69084 call!69082)))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18041 0))(
  ( (ValueCellFull!18041 (v!21822 V!58981)) (EmptyCell!18041) )
))
(declare-datatypes ((array!103140 0))(
  ( (array!103141 (arr!49765 (Array (_ BitVec 32) ValueCell!18041)) (size!50316 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103140)

(declare-fun bm!69079 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6563 (array!103138 array!103140 (_ BitVec 32) (_ BitVec 32) V!58981 V!58981 (_ BitVec 32) Int) ListLongMap!22121)

(assert (=> bm!69079 (= call!69083 (getCurrentListMapNoExtraKeys!6563 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58558 () Bool)

(declare-fun mapRes!58558 () Bool)

(assert (=> mapIsEmpty!58558 mapRes!58558))

(declare-fun b!1546995 () Bool)

(declare-fun res!1060322 () Bool)

(assert (=> b!1546995 (=> (not res!1060322) (not e!861234))))

(assert (=> b!1546995 (= res!1060322 (and (= (size!50316 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50315 _keys!618) (size!50316 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546996 () Bool)

(declare-fun e!861235 () Bool)

(declare-fun tp_is_empty!37903 () Bool)

(assert (=> b!1546996 (= e!861235 tp_is_empty!37903)))

(declare-fun b!1546997 () Bool)

(declare-fun e!861231 () Bool)

(declare-fun e!861230 () Bool)

(assert (=> b!1546997 (= e!861231 (and e!861230 mapRes!58558))))

(declare-fun condMapEmpty!58558 () Bool)

(declare-fun mapDefault!58558 () ValueCell!18041)

(assert (=> b!1546997 (= condMapEmpty!58558 (= (arr!49765 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18041)) mapDefault!58558)))))

(declare-fun b!1546998 () Bool)

(declare-fun res!1060318 () Bool)

(assert (=> b!1546998 (=> (not res!1060318) (not e!861234))))

(assert (=> b!1546998 (= res!1060318 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50315 _keys!618))))))

(declare-fun b!1546999 () Bool)

(declare-fun e!861237 () ListLongMap!22121)

(assert (=> b!1546999 (= e!861237 call!69081)))

(declare-fun b!1547000 () Bool)

(assert (=> b!1547000 (= e!861230 tp_is_empty!37903)))

(declare-fun b!1547001 () Bool)

(assert (=> b!1547001 (= e!861234 false)))

(declare-fun lt!667062 () ListLongMap!22121)

(declare-fun e!861236 () ListLongMap!22121)

(assert (=> b!1547001 (= lt!667062 e!861236)))

(declare-fun lt!667063 () Bool)

(assert (=> b!1547001 (= c!142250 (and (not lt!667063) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547001 (= lt!667063 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547002 () Bool)

(assert (=> b!1547002 (= e!861233 call!69084)))

(declare-fun b!1547003 () Bool)

(assert (=> b!1547003 (= e!861236 (+!4923 call!69080 (tuple2!24505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58558 () Bool)

(declare-fun tp!111133 () Bool)

(assert (=> mapNonEmpty!58558 (= mapRes!58558 (and tp!111133 e!861235))))

(declare-fun mapValue!58558 () ValueCell!18041)

(declare-fun mapRest!58558 () (Array (_ BitVec 32) ValueCell!18041))

(declare-fun mapKey!58558 () (_ BitVec 32))

(assert (=> mapNonEmpty!58558 (= (arr!49765 _values!470) (store mapRest!58558 mapKey!58558 mapValue!58558))))

(declare-fun res!1060319 () Bool)

(assert (=> start!132326 (=> (not res!1060319) (not e!861234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132326 (= res!1060319 (validMask!0 mask!926))))

(assert (=> start!132326 e!861234))

(declare-fun array_inv!38973 (array!103138) Bool)

(assert (=> start!132326 (array_inv!38973 _keys!618)))

(assert (=> start!132326 tp_is_empty!37903))

(assert (=> start!132326 true))

(assert (=> start!132326 tp!111132))

(declare-fun array_inv!38974 (array!103140) Bool)

(assert (=> start!132326 (and (array_inv!38974 _values!470) e!861231)))

(declare-fun b!1547004 () Bool)

(declare-fun res!1060320 () Bool)

(assert (=> b!1547004 (=> (not res!1060320) (not e!861234))))

(declare-datatypes ((List!36000 0))(
  ( (Nil!35997) (Cons!35996 (h!37459 (_ BitVec 64)) (t!50686 List!36000)) )
))
(declare-fun arrayNoDuplicates!0 (array!103138 (_ BitVec 32) List!36000) Bool)

(assert (=> b!1547004 (= res!1060320 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35997))))

(declare-fun b!1547005 () Bool)

(assert (=> b!1547005 (= e!861236 e!861237)))

(assert (=> b!1547005 (= c!142252 (and (not lt!667063) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69080 () Bool)

(assert (=> bm!69080 (= call!69081 call!69080)))

(declare-fun bm!69081 () Bool)

(assert (=> bm!69081 (= call!69082 call!69083)))

(declare-fun b!1547006 () Bool)

(declare-fun c!142251 () Bool)

(assert (=> b!1547006 (= c!142251 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667063))))

(assert (=> b!1547006 (= e!861237 e!861233)))

(assert (= (and start!132326 res!1060319) b!1546995))

(assert (= (and b!1546995 res!1060322) b!1546993))

(assert (= (and b!1546993 res!1060321) b!1547004))

(assert (= (and b!1547004 res!1060320) b!1546998))

(assert (= (and b!1546998 res!1060318) b!1547001))

(assert (= (and b!1547001 c!142250) b!1547003))

(assert (= (and b!1547001 (not c!142250)) b!1547005))

(assert (= (and b!1547005 c!142252) b!1546999))

(assert (= (and b!1547005 (not c!142252)) b!1547006))

(assert (= (and b!1547006 c!142251) b!1546994))

(assert (= (and b!1547006 (not c!142251)) b!1547002))

(assert (= (or b!1546994 b!1547002) bm!69078))

(assert (= (or b!1546999 bm!69078) bm!69081))

(assert (= (or b!1546999 b!1546994) bm!69080))

(assert (= (or b!1547003 bm!69081) bm!69079))

(assert (= (or b!1547003 bm!69080) bm!69077))

(assert (= (and b!1546997 condMapEmpty!58558) mapIsEmpty!58558))

(assert (= (and b!1546997 (not condMapEmpty!58558)) mapNonEmpty!58558))

(get-info :version)

(assert (= (and mapNonEmpty!58558 ((_ is ValueCellFull!18041) mapValue!58558)) b!1546996))

(assert (= (and b!1546997 ((_ is ValueCellFull!18041) mapDefault!58558)) b!1547000))

(assert (= start!132326 b!1546997))

(declare-fun m!1427589 () Bool)

(assert (=> bm!69079 m!1427589))

(declare-fun m!1427591 () Bool)

(assert (=> bm!69077 m!1427591))

(declare-fun m!1427593 () Bool)

(assert (=> mapNonEmpty!58558 m!1427593))

(declare-fun m!1427595 () Bool)

(assert (=> b!1547003 m!1427595))

(declare-fun m!1427597 () Bool)

(assert (=> start!132326 m!1427597))

(declare-fun m!1427599 () Bool)

(assert (=> start!132326 m!1427599))

(declare-fun m!1427601 () Bool)

(assert (=> start!132326 m!1427601))

(declare-fun m!1427603 () Bool)

(assert (=> b!1547004 m!1427603))

(declare-fun m!1427605 () Bool)

(assert (=> b!1546993 m!1427605))

(check-sat (not b!1547003) (not b!1546993) (not start!132326) (not b!1547004) b_and!51039 (not mapNonEmpty!58558) (not bm!69079) tp_is_empty!37903 (not b_next!31627) (not bm!69077))
(check-sat b_and!51039 (not b_next!31627))
