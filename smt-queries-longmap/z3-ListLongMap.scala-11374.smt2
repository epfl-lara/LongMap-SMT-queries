; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132098 () Bool)

(assert start!132098)

(declare-fun b_free!31861 () Bool)

(declare-fun b_next!31861 () Bool)

(assert (=> start!132098 (= b_free!31861 (not b_next!31861))))

(declare-fun tp!111836 () Bool)

(declare-fun b_and!51265 () Bool)

(assert (=> start!132098 (= tp!111836 b_and!51265)))

(declare-fun b!1549930 () Bool)

(declare-datatypes ((V!59293 0))(
  ( (V!59294 (val!19146 Int)) )
))
(declare-datatypes ((tuple2!24744 0))(
  ( (tuple2!24745 (_1!12383 (_ BitVec 64)) (_2!12383 V!59293)) )
))
(declare-datatypes ((List!36198 0))(
  ( (Nil!36195) (Cons!36194 (h!37640 tuple2!24744) (t!50896 List!36198)) )
))
(declare-datatypes ((ListLongMap!22353 0))(
  ( (ListLongMap!22354 (toList!11192 List!36198)) )
))
(declare-fun e!862753 () ListLongMap!22353)

(declare-fun call!70661 () ListLongMap!22353)

(assert (=> b!1549930 (= e!862753 call!70661)))

(declare-fun bm!70656 () Bool)

(declare-fun call!70662 () ListLongMap!22353)

(declare-fun call!70663 () ListLongMap!22353)

(assert (=> bm!70656 (= call!70662 call!70663)))

(declare-fun b!1549932 () Bool)

(declare-fun e!862747 () ListLongMap!22353)

(assert (=> b!1549932 (= e!862747 call!70662)))

(declare-fun c!142451 () Bool)

(declare-fun c!142450 () Bool)

(declare-fun call!70659 () ListLongMap!22353)

(declare-fun minValue!436 () V!59293)

(declare-fun zeroValue!436 () V!59293)

(declare-fun call!70660 () ListLongMap!22353)

(declare-fun bm!70657 () Bool)

(declare-fun +!5009 (ListLongMap!22353 tuple2!24744) ListLongMap!22353)

(assert (=> bm!70657 (= call!70660 (+!5009 (ite c!142450 call!70659 (ite c!142451 call!70663 call!70662)) (ite (or c!142450 c!142451) (tuple2!24745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549933 () Bool)

(declare-fun e!862750 () Bool)

(declare-fun e!862751 () Bool)

(declare-fun mapRes!58909 () Bool)

(assert (=> b!1549933 (= e!862750 (and e!862751 mapRes!58909))))

(declare-fun condMapEmpty!58909 () Bool)

(declare-datatypes ((ValueCell!18158 0))(
  ( (ValueCellFull!18158 (v!21943 V!59293)) (EmptyCell!18158) )
))
(declare-datatypes ((array!103394 0))(
  ( (array!103395 (arr!49900 (Array (_ BitVec 32) ValueCell!18158)) (size!50452 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103394)

(declare-fun mapDefault!58909 () ValueCell!18158)

(assert (=> b!1549933 (= condMapEmpty!58909 (= (arr!49900 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18158)) mapDefault!58909)))))

(declare-fun b!1549934 () Bool)

(declare-fun res!1061777 () Bool)

(declare-fun e!862754 () Bool)

(assert (=> b!1549934 (=> (not res!1061777) (not e!862754))))

(declare-datatypes ((array!103396 0))(
  ( (array!103397 (arr!49901 (Array (_ BitVec 32) (_ BitVec 64))) (size!50453 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103396)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103396 (_ BitVec 32)) Bool)

(assert (=> b!1549934 (= res!1061777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549935 () Bool)

(declare-fun e!862748 () Bool)

(assert (=> b!1549935 (= e!862748 false)))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667959 () ListLongMap!22353)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6632 (array!103396 array!103394 (_ BitVec 32) (_ BitVec 32) V!59293 V!59293 (_ BitVec 32) Int) ListLongMap!22353)

(assert (=> b!1549935 (= lt!667959 (getCurrentListMapNoExtraKeys!6632 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70658 () Bool)

(assert (=> bm!70658 (= call!70661 call!70660)))

(declare-fun b!1549936 () Bool)

(declare-fun res!1061778 () Bool)

(assert (=> b!1549936 (=> (not res!1061778) (not e!862748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549936 (= res!1061778 (validKeyInArray!0 (select (arr!49901 _keys!618) from!762)))))

(declare-fun b!1549937 () Bool)

(declare-fun res!1061772 () Bool)

(assert (=> b!1549937 (=> (not res!1061772) (not e!862754))))

(assert (=> b!1549937 (= res!1061772 (and (= (size!50452 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50453 _keys!618) (size!50452 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549938 () Bool)

(declare-fun res!1061773 () Bool)

(assert (=> b!1549938 (=> (not res!1061773) (not e!862754))))

(assert (=> b!1549938 (= res!1061773 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50453 _keys!618))))))

(declare-fun b!1549939 () Bool)

(declare-fun res!1061775 () Bool)

(assert (=> b!1549939 (=> (not res!1061775) (not e!862754))))

(declare-datatypes ((List!36199 0))(
  ( (Nil!36196) (Cons!36195 (h!37641 (_ BitVec 64)) (t!50897 List!36199)) )
))
(declare-fun arrayNoDuplicates!0 (array!103396 (_ BitVec 32) List!36199) Bool)

(assert (=> b!1549939 (= res!1061775 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36196))))

(declare-fun b!1549940 () Bool)

(declare-fun c!142452 () Bool)

(declare-fun lt!667958 () Bool)

(assert (=> b!1549940 (= c!142452 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667958))))

(assert (=> b!1549940 (= e!862753 e!862747)))

(declare-fun bm!70659 () Bool)

(assert (=> bm!70659 (= call!70663 call!70659)))

(declare-fun b!1549941 () Bool)

(declare-fun e!862752 () ListLongMap!22353)

(assert (=> b!1549941 (= e!862752 (+!5009 call!70660 (tuple2!24745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1061774 () Bool)

(assert (=> start!132098 (=> (not res!1061774) (not e!862754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132098 (= res!1061774 (validMask!0 mask!926))))

(assert (=> start!132098 e!862754))

(declare-fun array_inv!39001 (array!103396) Bool)

(assert (=> start!132098 (array_inv!39001 _keys!618)))

(declare-fun tp_is_empty!38137 () Bool)

(assert (=> start!132098 tp_is_empty!38137))

(assert (=> start!132098 true))

(assert (=> start!132098 tp!111836))

(declare-fun array_inv!39002 (array!103394) Bool)

(assert (=> start!132098 (and (array_inv!39002 _values!470) e!862750)))

(declare-fun b!1549931 () Bool)

(assert (=> b!1549931 (= e!862754 e!862748)))

(declare-fun res!1061776 () Bool)

(assert (=> b!1549931 (=> (not res!1061776) (not e!862748))))

(assert (=> b!1549931 (= res!1061776 (bvslt from!762 (size!50453 _keys!618)))))

(declare-fun lt!667960 () ListLongMap!22353)

(assert (=> b!1549931 (= lt!667960 e!862752)))

(assert (=> b!1549931 (= c!142450 (and (not lt!667958) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549931 (= lt!667958 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549942 () Bool)

(assert (=> b!1549942 (= e!862751 tp_is_empty!38137)))

(declare-fun mapIsEmpty!58909 () Bool)

(assert (=> mapIsEmpty!58909 mapRes!58909))

(declare-fun b!1549943 () Bool)

(declare-fun e!862755 () Bool)

(assert (=> b!1549943 (= e!862755 tp_is_empty!38137)))

(declare-fun b!1549944 () Bool)

(assert (=> b!1549944 (= e!862752 e!862753)))

(assert (=> b!1549944 (= c!142451 (and (not lt!667958) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549945 () Bool)

(assert (=> b!1549945 (= e!862747 call!70661)))

(declare-fun bm!70660 () Bool)

(assert (=> bm!70660 (= call!70659 (getCurrentListMapNoExtraKeys!6632 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58909 () Bool)

(declare-fun tp!111835 () Bool)

(assert (=> mapNonEmpty!58909 (= mapRes!58909 (and tp!111835 e!862755))))

(declare-fun mapKey!58909 () (_ BitVec 32))

(declare-fun mapRest!58909 () (Array (_ BitVec 32) ValueCell!18158))

(declare-fun mapValue!58909 () ValueCell!18158)

(assert (=> mapNonEmpty!58909 (= (arr!49900 _values!470) (store mapRest!58909 mapKey!58909 mapValue!58909))))

(assert (= (and start!132098 res!1061774) b!1549937))

(assert (= (and b!1549937 res!1061772) b!1549934))

(assert (= (and b!1549934 res!1061777) b!1549939))

(assert (= (and b!1549939 res!1061775) b!1549938))

(assert (= (and b!1549938 res!1061773) b!1549931))

(assert (= (and b!1549931 c!142450) b!1549941))

(assert (= (and b!1549931 (not c!142450)) b!1549944))

(assert (= (and b!1549944 c!142451) b!1549930))

(assert (= (and b!1549944 (not c!142451)) b!1549940))

(assert (= (and b!1549940 c!142452) b!1549945))

(assert (= (and b!1549940 (not c!142452)) b!1549932))

(assert (= (or b!1549945 b!1549932) bm!70656))

(assert (= (or b!1549930 bm!70656) bm!70659))

(assert (= (or b!1549930 b!1549945) bm!70658))

(assert (= (or b!1549941 bm!70659) bm!70660))

(assert (= (or b!1549941 bm!70658) bm!70657))

(assert (= (and b!1549931 res!1061776) b!1549936))

(assert (= (and b!1549936 res!1061778) b!1549935))

(assert (= (and b!1549933 condMapEmpty!58909) mapIsEmpty!58909))

(assert (= (and b!1549933 (not condMapEmpty!58909)) mapNonEmpty!58909))

(get-info :version)

(assert (= (and mapNonEmpty!58909 ((_ is ValueCellFull!18158) mapValue!58909)) b!1549943))

(assert (= (and b!1549933 ((_ is ValueCellFull!18158) mapDefault!58909)) b!1549942))

(assert (= start!132098 b!1549933))

(declare-fun m!1428369 () Bool)

(assert (=> mapNonEmpty!58909 m!1428369))

(declare-fun m!1428371 () Bool)

(assert (=> b!1549936 m!1428371))

(assert (=> b!1549936 m!1428371))

(declare-fun m!1428373 () Bool)

(assert (=> b!1549936 m!1428373))

(declare-fun m!1428375 () Bool)

(assert (=> bm!70657 m!1428375))

(declare-fun m!1428377 () Bool)

(assert (=> b!1549935 m!1428377))

(declare-fun m!1428379 () Bool)

(assert (=> start!132098 m!1428379))

(declare-fun m!1428381 () Bool)

(assert (=> start!132098 m!1428381))

(declare-fun m!1428383 () Bool)

(assert (=> start!132098 m!1428383))

(declare-fun m!1428385 () Bool)

(assert (=> b!1549934 m!1428385))

(declare-fun m!1428387 () Bool)

(assert (=> b!1549939 m!1428387))

(declare-fun m!1428389 () Bool)

(assert (=> b!1549941 m!1428389))

(assert (=> bm!70660 m!1428377))

(check-sat (not b!1549935) (not b!1549934) (not b!1549941) b_and!51265 (not bm!70657) (not b_next!31861) tp_is_empty!38137 (not mapNonEmpty!58909) (not bm!70660) (not start!132098) (not b!1549939) (not b!1549936))
(check-sat b_and!51265 (not b_next!31861))
