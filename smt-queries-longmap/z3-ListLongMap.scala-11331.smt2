; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131840 () Bool)

(assert start!131840)

(declare-fun b_free!31603 () Bool)

(declare-fun b_next!31603 () Bool)

(assert (=> start!131840 (= b_free!31603 (not b_next!31603))))

(declare-fun tp!111062 () Bool)

(declare-fun b_and!50995 () Bool)

(assert (=> start!131840 (= tp!111062 b_and!50995)))

(declare-fun b!1543740 () Bool)

(declare-datatypes ((V!58949 0))(
  ( (V!58950 (val!19017 Int)) )
))
(declare-datatypes ((tuple2!24494 0))(
  ( (tuple2!24495 (_1!12258 (_ BitVec 64)) (_2!12258 V!58949)) )
))
(declare-datatypes ((List!35986 0))(
  ( (Nil!35983) (Cons!35982 (h!37428 tuple2!24494) (t!50672 List!35986)) )
))
(declare-datatypes ((ListLongMap!22103 0))(
  ( (ListLongMap!22104 (toList!11067 List!35986)) )
))
(declare-fun e!859242 () ListLongMap!22103)

(declare-fun call!68718 () ListLongMap!22103)

(assert (=> b!1543740 (= e!859242 call!68718)))

(declare-fun b!1543741 () Bool)

(declare-fun e!859240 () Bool)

(assert (=> b!1543741 (= e!859240 false)))

(declare-fun lt!665796 () ListLongMap!22103)

(declare-fun e!859241 () ListLongMap!22103)

(assert (=> b!1543741 (= lt!665796 e!859241)))

(declare-fun c!141255 () Bool)

(declare-fun lt!665797 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543741 (= c!141255 (and (not lt!665797) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1543741 (= lt!665797 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1543742 () Bool)

(declare-fun e!859237 () Bool)

(declare-fun e!859238 () Bool)

(declare-fun mapRes!58522 () Bool)

(assert (=> b!1543742 (= e!859237 (and e!859238 mapRes!58522))))

(declare-fun condMapEmpty!58522 () Bool)

(declare-datatypes ((ValueCell!18029 0))(
  ( (ValueCellFull!18029 (v!21814 V!58949)) (EmptyCell!18029) )
))
(declare-datatypes ((array!102900 0))(
  ( (array!102901 (arr!49653 (Array (_ BitVec 32) ValueCell!18029)) (size!50205 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102900)

(declare-fun mapDefault!58522 () ValueCell!18029)

(assert (=> b!1543742 (= condMapEmpty!58522 (= (arr!49653 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18029)) mapDefault!58522)))))

(declare-fun b!1543743 () Bool)

(declare-fun e!859235 () Bool)

(declare-fun tp_is_empty!37879 () Bool)

(assert (=> b!1543743 (= e!859235 tp_is_empty!37879)))

(declare-fun res!1059151 () Bool)

(assert (=> start!131840 (=> (not res!1059151) (not e!859240))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131840 (= res!1059151 (validMask!0 mask!926))))

(assert (=> start!131840 e!859240))

(declare-datatypes ((array!102902 0))(
  ( (array!102903 (arr!49654 (Array (_ BitVec 32) (_ BitVec 64))) (size!50206 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102902)

(declare-fun array_inv!38821 (array!102902) Bool)

(assert (=> start!131840 (array_inv!38821 _keys!618)))

(assert (=> start!131840 tp_is_empty!37879))

(assert (=> start!131840 true))

(assert (=> start!131840 tp!111062))

(declare-fun array_inv!38822 (array!102900) Bool)

(assert (=> start!131840 (and (array_inv!38822 _values!470) e!859237)))

(declare-fun b!1543744 () Bool)

(declare-fun res!1059153 () Bool)

(assert (=> b!1543744 (=> (not res!1059153) (not e!859240))))

(assert (=> b!1543744 (= res!1059153 (and (= (size!50205 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50206 _keys!618) (size!50205 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543745 () Bool)

(declare-fun res!1059152 () Bool)

(assert (=> b!1543745 (=> (not res!1059152) (not e!859240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102902 (_ BitVec 32)) Bool)

(assert (=> b!1543745 (= res!1059152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543746 () Bool)

(declare-fun e!859236 () ListLongMap!22103)

(assert (=> b!1543746 (= e!859236 call!68718)))

(declare-fun b!1543747 () Bool)

(assert (=> b!1543747 (= e!859238 tp_is_empty!37879)))

(declare-fun bm!68712 () Bool)

(declare-fun call!68716 () ListLongMap!22103)

(declare-fun call!68719 () ListLongMap!22103)

(assert (=> bm!68712 (= call!68716 call!68719)))

(declare-fun b!1543748 () Bool)

(assert (=> b!1543748 (= e!859241 e!859242)))

(declare-fun c!141254 () Bool)

(assert (=> b!1543748 (= c!141254 (and (not lt!665797) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58522 () Bool)

(assert (=> mapIsEmpty!58522 mapRes!58522))

(declare-fun call!68715 () ListLongMap!22103)

(declare-fun zeroValue!436 () V!58949)

(declare-fun minValue!436 () V!58949)

(declare-fun call!68717 () ListLongMap!22103)

(declare-fun bm!68713 () Bool)

(declare-fun +!4902 (ListLongMap!22103 tuple2!24494) ListLongMap!22103)

(assert (=> bm!68713 (= call!68717 (+!4902 (ite c!141255 call!68719 (ite c!141254 call!68716 call!68715)) (ite (or c!141255 c!141254) (tuple2!24495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!68714 () Bool)

(assert (=> bm!68714 (= call!68715 call!68716)))

(declare-fun bm!68715 () Bool)

(assert (=> bm!68715 (= call!68718 call!68717)))

(declare-fun b!1543749 () Bool)

(assert (=> b!1543749 (= e!859241 (+!4902 call!68717 (tuple2!24495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1543750 () Bool)

(declare-fun res!1059149 () Bool)

(assert (=> b!1543750 (=> (not res!1059149) (not e!859240))))

(declare-datatypes ((List!35987 0))(
  ( (Nil!35984) (Cons!35983 (h!37429 (_ BitVec 64)) (t!50673 List!35987)) )
))
(declare-fun arrayNoDuplicates!0 (array!102902 (_ BitVec 32) List!35987) Bool)

(assert (=> b!1543750 (= res!1059149 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35984))))

(declare-fun b!1543751 () Bool)

(declare-fun c!141253 () Bool)

(assert (=> b!1543751 (= c!141253 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665797))))

(assert (=> b!1543751 (= e!859242 e!859236)))

(declare-fun b!1543752 () Bool)

(assert (=> b!1543752 (= e!859236 call!68715)))

(declare-fun b!1543753 () Bool)

(declare-fun res!1059150 () Bool)

(assert (=> b!1543753 (=> (not res!1059150) (not e!859240))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1543753 (= res!1059150 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50206 _keys!618))))))

(declare-fun bm!68716 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6538 (array!102902 array!102900 (_ BitVec 32) (_ BitVec 32) V!58949 V!58949 (_ BitVec 32) Int) ListLongMap!22103)

(assert (=> bm!68716 (= call!68719 (getCurrentListMapNoExtraKeys!6538 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58522 () Bool)

(declare-fun tp!111061 () Bool)

(assert (=> mapNonEmpty!58522 (= mapRes!58522 (and tp!111061 e!859235))))

(declare-fun mapValue!58522 () ValueCell!18029)

(declare-fun mapKey!58522 () (_ BitVec 32))

(declare-fun mapRest!58522 () (Array (_ BitVec 32) ValueCell!18029))

(assert (=> mapNonEmpty!58522 (= (arr!49653 _values!470) (store mapRest!58522 mapKey!58522 mapValue!58522))))

(assert (= (and start!131840 res!1059151) b!1543744))

(assert (= (and b!1543744 res!1059153) b!1543745))

(assert (= (and b!1543745 res!1059152) b!1543750))

(assert (= (and b!1543750 res!1059149) b!1543753))

(assert (= (and b!1543753 res!1059150) b!1543741))

(assert (= (and b!1543741 c!141255) b!1543749))

(assert (= (and b!1543741 (not c!141255)) b!1543748))

(assert (= (and b!1543748 c!141254) b!1543740))

(assert (= (and b!1543748 (not c!141254)) b!1543751))

(assert (= (and b!1543751 c!141253) b!1543746))

(assert (= (and b!1543751 (not c!141253)) b!1543752))

(assert (= (or b!1543746 b!1543752) bm!68714))

(assert (= (or b!1543740 bm!68714) bm!68712))

(assert (= (or b!1543740 b!1543746) bm!68715))

(assert (= (or b!1543749 bm!68712) bm!68716))

(assert (= (or b!1543749 bm!68715) bm!68713))

(assert (= (and b!1543742 condMapEmpty!58522) mapIsEmpty!58522))

(assert (= (and b!1543742 (not condMapEmpty!58522)) mapNonEmpty!58522))

(get-info :version)

(assert (= (and mapNonEmpty!58522 ((_ is ValueCellFull!18029) mapValue!58522)) b!1543743))

(assert (= (and b!1543742 ((_ is ValueCellFull!18029) mapDefault!58522)) b!1543747))

(assert (= start!131840 b!1543742))

(declare-fun m!1424223 () Bool)

(assert (=> start!131840 m!1424223))

(declare-fun m!1424225 () Bool)

(assert (=> start!131840 m!1424225))

(declare-fun m!1424227 () Bool)

(assert (=> start!131840 m!1424227))

(declare-fun m!1424229 () Bool)

(assert (=> b!1543749 m!1424229))

(declare-fun m!1424231 () Bool)

(assert (=> bm!68716 m!1424231))

(declare-fun m!1424233 () Bool)

(assert (=> mapNonEmpty!58522 m!1424233))

(declare-fun m!1424235 () Bool)

(assert (=> bm!68713 m!1424235))

(declare-fun m!1424237 () Bool)

(assert (=> b!1543750 m!1424237))

(declare-fun m!1424239 () Bool)

(assert (=> b!1543745 m!1424239))

(check-sat (not b!1543750) (not b!1543749) tp_is_empty!37879 (not b!1543745) (not start!131840) (not bm!68713) (not mapNonEmpty!58522) b_and!50995 (not b_next!31603) (not bm!68716))
(check-sat b_and!50995 (not b_next!31603))
