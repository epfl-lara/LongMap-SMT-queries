; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131930 () Bool)

(assert start!131930)

(declare-fun b_free!31693 () Bool)

(declare-fun b_next!31693 () Bool)

(assert (=> start!131930 (= b_free!31693 (not b_next!31693))))

(declare-fun tp!111331 () Bool)

(declare-fun b_and!51085 () Bool)

(assert (=> start!131930 (= tp!111331 b_and!51085)))

(declare-fun b!1545760 () Bool)

(declare-fun res!1059956 () Bool)

(declare-fun e!860386 () Bool)

(assert (=> b!1545760 (=> (not res!1059956) (not e!860386))))

(declare-datatypes ((array!103072 0))(
  ( (array!103073 (arr!49739 (Array (_ BitVec 32) (_ BitVec 64))) (size!50291 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103072)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103072 (_ BitVec 32)) Bool)

(assert (=> b!1545760 (= res!1059956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58657 () Bool)

(declare-fun mapRes!58657 () Bool)

(declare-fun tp!111332 () Bool)

(declare-fun e!860382 () Bool)

(assert (=> mapNonEmpty!58657 (= mapRes!58657 (and tp!111332 e!860382))))

(declare-datatypes ((V!59069 0))(
  ( (V!59070 (val!19062 Int)) )
))
(declare-datatypes ((ValueCell!18074 0))(
  ( (ValueCellFull!18074 (v!21859 V!59069)) (EmptyCell!18074) )
))
(declare-fun mapRest!58657 () (Array (_ BitVec 32) ValueCell!18074))

(declare-datatypes ((array!103074 0))(
  ( (array!103075 (arr!49740 (Array (_ BitVec 32) ValueCell!18074)) (size!50292 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103074)

(declare-fun mapKey!58657 () (_ BitVec 32))

(declare-fun mapValue!58657 () ValueCell!18074)

(assert (=> mapNonEmpty!58657 (= (arr!49740 _values!470) (store mapRest!58657 mapKey!58657 mapValue!58657))))

(declare-fun mapIsEmpty!58657 () Bool)

(assert (=> mapIsEmpty!58657 mapRes!58657))

(declare-fun b!1545761 () Bool)

(declare-datatypes ((tuple2!24582 0))(
  ( (tuple2!24583 (_1!12302 (_ BitVec 64)) (_2!12302 V!59069)) )
))
(declare-datatypes ((List!36057 0))(
  ( (Nil!36054) (Cons!36053 (h!37499 tuple2!24582) (t!50743 List!36057)) )
))
(declare-datatypes ((ListLongMap!22191 0))(
  ( (ListLongMap!22192 (toList!11111 List!36057)) )
))
(declare-fun e!860385 () ListLongMap!22191)

(declare-fun call!69392 () ListLongMap!22191)

(assert (=> b!1545761 (= e!860385 call!69392)))

(declare-fun res!1059955 () Bool)

(assert (=> start!131930 (=> (not res!1059955) (not e!860386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131930 (= res!1059955 (validMask!0 mask!926))))

(assert (=> start!131930 e!860386))

(declare-fun array_inv!38881 (array!103072) Bool)

(assert (=> start!131930 (array_inv!38881 _keys!618)))

(declare-fun tp_is_empty!37969 () Bool)

(assert (=> start!131930 tp_is_empty!37969))

(assert (=> start!131930 true))

(assert (=> start!131930 tp!111331))

(declare-fun e!860380 () Bool)

(declare-fun array_inv!38882 (array!103074) Bool)

(assert (=> start!131930 (and (array_inv!38882 _values!470) e!860380)))

(declare-fun b!1545762 () Bool)

(declare-fun res!1059960 () Bool)

(declare-fun e!860387 () Bool)

(assert (=> b!1545762 (=> (not res!1059960) (not e!860387))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545762 (= res!1059960 (validKeyInArray!0 (select (arr!49739 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59069)

(declare-fun c!141660 () Bool)

(declare-fun c!141658 () Bool)

(declare-fun bm!69387 () Bool)

(declare-fun call!69391 () ListLongMap!22191)

(declare-fun call!69394 () ListLongMap!22191)

(declare-fun call!69390 () ListLongMap!22191)

(declare-fun minValue!436 () V!59069)

(declare-fun call!69393 () ListLongMap!22191)

(declare-fun +!4939 (ListLongMap!22191 tuple2!24582) ListLongMap!22191)

(assert (=> bm!69387 (= call!69394 (+!4939 (ite c!141658 call!69393 (ite c!141660 call!69391 call!69390)) (ite (or c!141658 c!141660) (tuple2!24583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545763 () Bool)

(declare-fun e!860383 () Bool)

(assert (=> b!1545763 (= e!860383 tp_is_empty!37969)))

(declare-fun b!1545764 () Bool)

(declare-fun e!860381 () ListLongMap!22191)

(assert (=> b!1545764 (= e!860381 call!69390)))

(declare-fun b!1545765 () Bool)

(declare-fun res!1059957 () Bool)

(assert (=> b!1545765 (=> (not res!1059957) (not e!860386))))

(assert (=> b!1545765 (= res!1059957 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50291 _keys!618))))))

(declare-fun bm!69388 () Bool)

(assert (=> bm!69388 (= call!69390 call!69391)))

(declare-fun bm!69389 () Bool)

(assert (=> bm!69389 (= call!69392 call!69394)))

(declare-fun b!1545766 () Bool)

(declare-fun e!860388 () ListLongMap!22191)

(assert (=> b!1545766 (= e!860388 (+!4939 call!69394 (tuple2!24583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69390 () Bool)

(assert (=> bm!69390 (= call!69391 call!69393)))

(declare-fun b!1545767 () Bool)

(declare-fun c!141659 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666188 () Bool)

(assert (=> b!1545767 (= c!141659 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666188))))

(assert (=> b!1545767 (= e!860385 e!860381)))

(declare-fun b!1545768 () Bool)

(assert (=> b!1545768 (= e!860387 (not true))))

(declare-fun lt!666190 () ListLongMap!22191)

(declare-fun contains!10000 (ListLongMap!22191 (_ BitVec 64)) Bool)

(assert (=> b!1545768 (contains!10000 (+!4939 lt!666190 (tuple2!24583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49739 _keys!618) from!762))))

(declare-datatypes ((Unit!51347 0))(
  ( (Unit!51348) )
))
(declare-fun lt!666187 () Unit!51347)

(declare-fun addStillContains!1223 (ListLongMap!22191 (_ BitVec 64) V!59069 (_ BitVec 64)) Unit!51347)

(assert (=> b!1545768 (= lt!666187 (addStillContains!1223 lt!666190 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49739 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6567 (array!103072 array!103074 (_ BitVec 32) (_ BitVec 32) V!59069 V!59069 (_ BitVec 32) Int) ListLongMap!22191)

(assert (=> b!1545768 (= lt!666190 (getCurrentListMapNoExtraKeys!6567 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545769 () Bool)

(assert (=> b!1545769 (= e!860381 call!69392)))

(declare-fun b!1545770 () Bool)

(assert (=> b!1545770 (= e!860380 (and e!860383 mapRes!58657))))

(declare-fun condMapEmpty!58657 () Bool)

(declare-fun mapDefault!58657 () ValueCell!18074)

(assert (=> b!1545770 (= condMapEmpty!58657 (= (arr!49740 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18074)) mapDefault!58657)))))

(declare-fun bm!69391 () Bool)

(assert (=> bm!69391 (= call!69393 (getCurrentListMapNoExtraKeys!6567 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545771 () Bool)

(declare-fun res!1059959 () Bool)

(assert (=> b!1545771 (=> (not res!1059959) (not e!860386))))

(declare-datatypes ((List!36058 0))(
  ( (Nil!36055) (Cons!36054 (h!37500 (_ BitVec 64)) (t!50744 List!36058)) )
))
(declare-fun arrayNoDuplicates!0 (array!103072 (_ BitVec 32) List!36058) Bool)

(assert (=> b!1545771 (= res!1059959 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36055))))

(declare-fun b!1545772 () Bool)

(assert (=> b!1545772 (= e!860382 tp_is_empty!37969)))

(declare-fun b!1545773 () Bool)

(assert (=> b!1545773 (= e!860388 e!860385)))

(assert (=> b!1545773 (= c!141660 (and (not lt!666188) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545774 () Bool)

(declare-fun res!1059958 () Bool)

(assert (=> b!1545774 (=> (not res!1059958) (not e!860386))))

(assert (=> b!1545774 (= res!1059958 (and (= (size!50292 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50291 _keys!618) (size!50292 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545775 () Bool)

(assert (=> b!1545775 (= e!860386 e!860387)))

(declare-fun res!1059954 () Bool)

(assert (=> b!1545775 (=> (not res!1059954) (not e!860387))))

(assert (=> b!1545775 (= res!1059954 (bvslt from!762 (size!50291 _keys!618)))))

(declare-fun lt!666189 () ListLongMap!22191)

(assert (=> b!1545775 (= lt!666189 e!860388)))

(assert (=> b!1545775 (= c!141658 (and (not lt!666188) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545775 (= lt!666188 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!131930 res!1059955) b!1545774))

(assert (= (and b!1545774 res!1059958) b!1545760))

(assert (= (and b!1545760 res!1059956) b!1545771))

(assert (= (and b!1545771 res!1059959) b!1545765))

(assert (= (and b!1545765 res!1059957) b!1545775))

(assert (= (and b!1545775 c!141658) b!1545766))

(assert (= (and b!1545775 (not c!141658)) b!1545773))

(assert (= (and b!1545773 c!141660) b!1545761))

(assert (= (and b!1545773 (not c!141660)) b!1545767))

(assert (= (and b!1545767 c!141659) b!1545769))

(assert (= (and b!1545767 (not c!141659)) b!1545764))

(assert (= (or b!1545769 b!1545764) bm!69388))

(assert (= (or b!1545761 bm!69388) bm!69390))

(assert (= (or b!1545761 b!1545769) bm!69389))

(assert (= (or b!1545766 bm!69390) bm!69391))

(assert (= (or b!1545766 bm!69389) bm!69387))

(assert (= (and b!1545775 res!1059954) b!1545762))

(assert (= (and b!1545762 res!1059960) b!1545768))

(assert (= (and b!1545770 condMapEmpty!58657) mapIsEmpty!58657))

(assert (= (and b!1545770 (not condMapEmpty!58657)) mapNonEmpty!58657))

(get-info :version)

(assert (= (and mapNonEmpty!58657 ((_ is ValueCellFull!18074) mapValue!58657)) b!1545772))

(assert (= (and b!1545770 ((_ is ValueCellFull!18074) mapDefault!58657)) b!1545763))

(assert (= start!131930 b!1545770))

(declare-fun m!1425231 () Bool)

(assert (=> mapNonEmpty!58657 m!1425231))

(declare-fun m!1425233 () Bool)

(assert (=> b!1545771 m!1425233))

(declare-fun m!1425235 () Bool)

(assert (=> b!1545760 m!1425235))

(declare-fun m!1425237 () Bool)

(assert (=> b!1545762 m!1425237))

(assert (=> b!1545762 m!1425237))

(declare-fun m!1425239 () Bool)

(assert (=> b!1545762 m!1425239))

(assert (=> b!1545768 m!1425237))

(declare-fun m!1425241 () Bool)

(assert (=> b!1545768 m!1425241))

(declare-fun m!1425243 () Bool)

(assert (=> b!1545768 m!1425243))

(assert (=> b!1545768 m!1425237))

(declare-fun m!1425245 () Bool)

(assert (=> b!1545768 m!1425245))

(assert (=> b!1545768 m!1425245))

(assert (=> b!1545768 m!1425237))

(declare-fun m!1425247 () Bool)

(assert (=> b!1545768 m!1425247))

(declare-fun m!1425249 () Bool)

(assert (=> bm!69387 m!1425249))

(assert (=> bm!69391 m!1425243))

(declare-fun m!1425251 () Bool)

(assert (=> b!1545766 m!1425251))

(declare-fun m!1425253 () Bool)

(assert (=> start!131930 m!1425253))

(declare-fun m!1425255 () Bool)

(assert (=> start!131930 m!1425255))

(declare-fun m!1425257 () Bool)

(assert (=> start!131930 m!1425257))

(check-sat (not bm!69387) (not b_next!31693) (not b!1545762) (not b!1545768) (not b!1545771) (not start!131930) b_and!51085 tp_is_empty!37969 (not b!1545766) (not bm!69391) (not b!1545760) (not mapNonEmpty!58657))
(check-sat b_and!51085 (not b_next!31693))
