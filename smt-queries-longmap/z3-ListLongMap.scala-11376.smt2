; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132590 () Bool)

(assert start!132590)

(declare-fun b_free!31873 () Bool)

(declare-fun b_next!31873 () Bool)

(assert (=> start!132590 (= b_free!31873 (not b_next!31873))))

(declare-fun tp!111874 () Bool)

(declare-fun b_and!51301 () Bool)

(assert (=> start!132590 (= tp!111874 b_and!51301)))

(declare-fun b!1553057 () Bool)

(declare-fun e!864677 () Bool)

(declare-fun tp_is_empty!38149 () Bool)

(assert (=> b!1553057 (= e!864677 tp_is_empty!38149)))

(declare-fun b!1553058 () Bool)

(declare-fun e!864678 () Bool)

(assert (=> b!1553058 (= e!864678 (not true))))

(declare-datatypes ((array!103622 0))(
  ( (array!103623 (arr!50005 (Array (_ BitVec 32) (_ BitVec 64))) (size!50556 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103622)

(declare-datatypes ((V!59309 0))(
  ( (V!59310 (val!19152 Int)) )
))
(declare-fun zeroValue!436 () V!59309)

(declare-datatypes ((tuple2!24736 0))(
  ( (tuple2!24737 (_1!12379 (_ BitVec 64)) (_2!12379 V!59309)) )
))
(declare-datatypes ((List!36194 0))(
  ( (Nil!36191) (Cons!36190 (h!37653 tuple2!24736) (t!50894 List!36194)) )
))
(declare-datatypes ((ListLongMap!22353 0))(
  ( (ListLongMap!22354 (toList!11192 List!36194)) )
))
(declare-fun lt!669257 () ListLongMap!22353)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun contains!10149 (ListLongMap!22353 (_ BitVec 64)) Bool)

(declare-fun +!5023 (ListLongMap!22353 tuple2!24736) ListLongMap!22353)

(assert (=> b!1553058 (contains!10149 (+!5023 lt!669257 (tuple2!24737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50005 _keys!618) from!762))))

(declare-datatypes ((Unit!51565 0))(
  ( (Unit!51566) )
))
(declare-fun lt!669258 () Unit!51565)

(declare-fun addStillContains!1286 (ListLongMap!22353 (_ BitVec 64) V!59309 (_ BitVec 64)) Unit!51565)

(assert (=> b!1553058 (= lt!669258 (addStillContains!1286 lt!669257 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50005 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18164 0))(
  ( (ValueCellFull!18164 (v!21946 V!59309)) (EmptyCell!18164) )
))
(declare-datatypes ((array!103624 0))(
  ( (array!103625 (arr!50006 (Array (_ BitVec 32) ValueCell!18164)) (size!50557 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103624)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun minValue!436 () V!59309)

(declare-fun getCurrentListMapNoExtraKeys!6657 (array!103622 array!103624 (_ BitVec 32) (_ BitVec 32) V!59309 V!59309 (_ BitVec 32) Int) ListLongMap!22353)

(assert (=> b!1553058 (= lt!669257 (getCurrentListMapNoExtraKeys!6657 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1553059 () Bool)

(declare-fun c!143416 () Bool)

(declare-fun lt!669259 () Bool)

(assert (=> b!1553059 (= c!143416 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669259))))

(declare-fun e!864680 () ListLongMap!22353)

(declare-fun e!864682 () ListLongMap!22353)

(assert (=> b!1553059 (= e!864680 e!864682)))

(declare-fun res!1062928 () Bool)

(declare-fun e!864676 () Bool)

(assert (=> start!132590 (=> (not res!1062928) (not e!864676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132590 (= res!1062928 (validMask!0 mask!926))))

(assert (=> start!132590 e!864676))

(declare-fun array_inv!39139 (array!103622) Bool)

(assert (=> start!132590 (array_inv!39139 _keys!618)))

(assert (=> start!132590 tp_is_empty!38149))

(assert (=> start!132590 true))

(assert (=> start!132590 tp!111874))

(declare-fun e!864681 () Bool)

(declare-fun array_inv!39140 (array!103624) Bool)

(assert (=> start!132590 (and (array_inv!39140 _values!470) e!864681)))

(declare-fun b!1553060 () Bool)

(declare-fun call!70944 () ListLongMap!22353)

(assert (=> b!1553060 (= e!864682 call!70944)))

(declare-fun b!1553061 () Bool)

(declare-fun call!70945 () ListLongMap!22353)

(assert (=> b!1553061 (= e!864682 call!70945)))

(declare-fun b!1553062 () Bool)

(declare-fun e!864675 () ListLongMap!22353)

(declare-fun call!70947 () ListLongMap!22353)

(assert (=> b!1553062 (= e!864675 (+!5023 call!70947 (tuple2!24737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70940 () Bool)

(declare-fun call!70946 () ListLongMap!22353)

(assert (=> bm!70940 (= call!70946 (getCurrentListMapNoExtraKeys!6657 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1553063 () Bool)

(declare-fun mapRes!58930 () Bool)

(assert (=> b!1553063 (= e!864681 (and e!864677 mapRes!58930))))

(declare-fun condMapEmpty!58930 () Bool)

(declare-fun mapDefault!58930 () ValueCell!18164)

(assert (=> b!1553063 (= condMapEmpty!58930 (= (arr!50006 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18164)) mapDefault!58930)))))

(declare-fun bm!70941 () Bool)

(assert (=> bm!70941 (= call!70945 call!70947)))

(declare-fun b!1553064 () Bool)

(declare-fun res!1062930 () Bool)

(assert (=> b!1553064 (=> (not res!1062930) (not e!864676))))

(assert (=> b!1553064 (= res!1062930 (and (= (size!50557 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50556 _keys!618) (size!50557 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1553065 () Bool)

(assert (=> b!1553065 (= e!864676 e!864678)))

(declare-fun res!1062927 () Bool)

(assert (=> b!1553065 (=> (not res!1062927) (not e!864678))))

(assert (=> b!1553065 (= res!1062927 (bvslt from!762 (size!50556 _keys!618)))))

(declare-fun lt!669260 () ListLongMap!22353)

(assert (=> b!1553065 (= lt!669260 e!864675)))

(declare-fun c!143414 () Bool)

(assert (=> b!1553065 (= c!143414 (and (not lt!669259) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1553065 (= lt!669259 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1553066 () Bool)

(declare-fun res!1062926 () Bool)

(assert (=> b!1553066 (=> (not res!1062926) (not e!864676))))

(declare-datatypes ((List!36195 0))(
  ( (Nil!36192) (Cons!36191 (h!37654 (_ BitVec 64)) (t!50895 List!36195)) )
))
(declare-fun arrayNoDuplicates!0 (array!103622 (_ BitVec 32) List!36195) Bool)

(assert (=> b!1553066 (= res!1062926 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36192))))

(declare-fun b!1553067 () Bool)

(declare-fun res!1062929 () Bool)

(assert (=> b!1553067 (=> (not res!1062929) (not e!864676))))

(assert (=> b!1553067 (= res!1062929 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50556 _keys!618))))))

(declare-fun b!1553068 () Bool)

(assert (=> b!1553068 (= e!864675 e!864680)))

(declare-fun c!143415 () Bool)

(assert (=> b!1553068 (= c!143415 (and (not lt!669259) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70942 () Bool)

(declare-fun call!70943 () ListLongMap!22353)

(assert (=> bm!70942 (= call!70944 call!70943)))

(declare-fun b!1553069 () Bool)

(declare-fun e!864679 () Bool)

(assert (=> b!1553069 (= e!864679 tp_is_empty!38149)))

(declare-fun mapNonEmpty!58930 () Bool)

(declare-fun tp!111873 () Bool)

(assert (=> mapNonEmpty!58930 (= mapRes!58930 (and tp!111873 e!864679))))

(declare-fun mapRest!58930 () (Array (_ BitVec 32) ValueCell!18164))

(declare-fun mapValue!58930 () ValueCell!18164)

(declare-fun mapKey!58930 () (_ BitVec 32))

(assert (=> mapNonEmpty!58930 (= (arr!50006 _values!470) (store mapRest!58930 mapKey!58930 mapValue!58930))))

(declare-fun bm!70943 () Bool)

(assert (=> bm!70943 (= call!70947 (+!5023 (ite c!143414 call!70946 (ite c!143415 call!70943 call!70944)) (ite (or c!143414 c!143415) (tuple2!24737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1553070 () Bool)

(declare-fun res!1062925 () Bool)

(assert (=> b!1553070 (=> (not res!1062925) (not e!864676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103622 (_ BitVec 32)) Bool)

(assert (=> b!1553070 (= res!1062925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70944 () Bool)

(assert (=> bm!70944 (= call!70943 call!70946)))

(declare-fun b!1553071 () Bool)

(assert (=> b!1553071 (= e!864680 call!70945)))

(declare-fun mapIsEmpty!58930 () Bool)

(assert (=> mapIsEmpty!58930 mapRes!58930))

(declare-fun b!1553072 () Bool)

(declare-fun res!1062931 () Bool)

(assert (=> b!1553072 (=> (not res!1062931) (not e!864678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1553072 (= res!1062931 (validKeyInArray!0 (select (arr!50005 _keys!618) from!762)))))

(assert (= (and start!132590 res!1062928) b!1553064))

(assert (= (and b!1553064 res!1062930) b!1553070))

(assert (= (and b!1553070 res!1062925) b!1553066))

(assert (= (and b!1553066 res!1062926) b!1553067))

(assert (= (and b!1553067 res!1062929) b!1553065))

(assert (= (and b!1553065 c!143414) b!1553062))

(assert (= (and b!1553065 (not c!143414)) b!1553068))

(assert (= (and b!1553068 c!143415) b!1553071))

(assert (= (and b!1553068 (not c!143415)) b!1553059))

(assert (= (and b!1553059 c!143416) b!1553061))

(assert (= (and b!1553059 (not c!143416)) b!1553060))

(assert (= (or b!1553061 b!1553060) bm!70942))

(assert (= (or b!1553071 bm!70942) bm!70944))

(assert (= (or b!1553071 b!1553061) bm!70941))

(assert (= (or b!1553062 bm!70944) bm!70940))

(assert (= (or b!1553062 bm!70941) bm!70943))

(assert (= (and b!1553065 res!1062927) b!1553072))

(assert (= (and b!1553072 res!1062931) b!1553058))

(assert (= (and b!1553063 condMapEmpty!58930) mapIsEmpty!58930))

(assert (= (and b!1553063 (not condMapEmpty!58930)) mapNonEmpty!58930))

(get-info :version)

(assert (= (and mapNonEmpty!58930 ((_ is ValueCellFull!18164) mapValue!58930)) b!1553069))

(assert (= (and b!1553063 ((_ is ValueCellFull!18164) mapDefault!58930)) b!1553057))

(assert (= start!132590 b!1553063))

(declare-fun m!1431733 () Bool)

(assert (=> bm!70940 m!1431733))

(declare-fun m!1431735 () Bool)

(assert (=> b!1553066 m!1431735))

(declare-fun m!1431737 () Bool)

(assert (=> start!132590 m!1431737))

(declare-fun m!1431739 () Bool)

(assert (=> start!132590 m!1431739))

(declare-fun m!1431741 () Bool)

(assert (=> start!132590 m!1431741))

(declare-fun m!1431743 () Bool)

(assert (=> b!1553070 m!1431743))

(declare-fun m!1431745 () Bool)

(assert (=> b!1553072 m!1431745))

(assert (=> b!1553072 m!1431745))

(declare-fun m!1431747 () Bool)

(assert (=> b!1553072 m!1431747))

(declare-fun m!1431749 () Bool)

(assert (=> b!1553058 m!1431749))

(assert (=> b!1553058 m!1431733))

(assert (=> b!1553058 m!1431745))

(assert (=> b!1553058 m!1431745))

(declare-fun m!1431751 () Bool)

(assert (=> b!1553058 m!1431751))

(assert (=> b!1553058 m!1431749))

(assert (=> b!1553058 m!1431745))

(declare-fun m!1431753 () Bool)

(assert (=> b!1553058 m!1431753))

(declare-fun m!1431755 () Bool)

(assert (=> bm!70943 m!1431755))

(declare-fun m!1431757 () Bool)

(assert (=> b!1553062 m!1431757))

(declare-fun m!1431759 () Bool)

(assert (=> mapNonEmpty!58930 m!1431759))

(check-sat (not b!1553070) tp_is_empty!38149 (not mapNonEmpty!58930) (not bm!70940) (not b!1553066) (not bm!70943) b_and!51301 (not b!1553058) (not b_next!31873) (not b!1553072) (not b!1553062) (not start!132590))
(check-sat b_and!51301 (not b_next!31873))
