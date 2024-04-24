; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132718 () Bool)

(assert start!132718)

(declare-fun b_free!31933 () Bool)

(declare-fun b_next!31933 () Bool)

(assert (=> start!132718 (= b_free!31933 (not b_next!31933))))

(declare-fun tp!112062 () Bool)

(declare-fun b_and!51373 () Bool)

(assert (=> start!132718 (= tp!112062 b_and!51373)))

(declare-fun b!1554910 () Bool)

(declare-fun e!865778 () Bool)

(declare-fun e!865789 () Bool)

(assert (=> b!1554910 (= e!865778 e!865789)))

(declare-fun c!143797 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1554910 (= c!143797 (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!71421 () Bool)

(declare-datatypes ((V!59389 0))(
  ( (V!59390 (val!19182 Int)) )
))
(declare-datatypes ((tuple2!24794 0))(
  ( (tuple2!24795 (_1!12408 (_ BitVec 64)) (_2!12408 V!59389)) )
))
(declare-datatypes ((List!36242 0))(
  ( (Nil!36239) (Cons!36238 (h!37701 tuple2!24794) (t!50950 List!36242)) )
))
(declare-datatypes ((ListLongMap!22411 0))(
  ( (ListLongMap!22412 (toList!11221 List!36242)) )
))
(declare-fun call!71427 () ListLongMap!22411)

(declare-fun call!71424 () ListLongMap!22411)

(assert (=> bm!71421 (= call!71427 call!71424)))

(declare-fun b!1554911 () Bool)

(declare-fun e!865773 () Bool)

(declare-fun e!865785 () Bool)

(assert (=> b!1554911 (= e!865773 e!865785)))

(declare-fun res!1063717 () Bool)

(declare-fun call!71430 () Bool)

(assert (=> b!1554911 (= res!1063717 (not call!71430))))

(assert (=> b!1554911 (=> res!1063717 e!865785)))

(declare-fun b!1554912 () Bool)

(declare-fun res!1063727 () Bool)

(declare-fun e!865782 () Bool)

(assert (=> b!1554912 (=> (not res!1063727) (not e!865782))))

(declare-datatypes ((array!103746 0))(
  ( (array!103747 (arr!50064 (Array (_ BitVec 32) (_ BitVec 64))) (size!50615 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103746)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103746 (_ BitVec 32)) Bool)

(assert (=> b!1554912 (= res!1063727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1554913 () Bool)

(declare-fun e!865779 () ListLongMap!22411)

(declare-fun e!865774 () ListLongMap!22411)

(assert (=> b!1554913 (= e!865779 e!865774)))

(declare-fun c!143796 () Bool)

(declare-fun lt!670207 () Bool)

(assert (=> b!1554913 (= c!143796 (and (not lt!670207) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1554914 () Bool)

(declare-fun e!865783 () Bool)

(declare-fun e!865776 () Bool)

(assert (=> b!1554914 (= e!865783 e!865776)))

(declare-fun res!1063725 () Bool)

(assert (=> b!1554914 (=> res!1063725 e!865776)))

(declare-fun lt!670211 () ListLongMap!22411)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun contains!10173 (ListLongMap!22411 (_ BitVec 64)) Bool)

(assert (=> b!1554914 (= res!1063725 (not (contains!10173 lt!670211 (select (arr!50064 _keys!618) from!762))))))

(declare-fun b!1554915 () Bool)

(declare-fun res!1063728 () Bool)

(assert (=> b!1554915 (=> (not res!1063728) (not e!865782))))

(assert (=> b!1554915 (= res!1063728 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50615 _keys!618))))))

(declare-fun b!1554916 () Bool)

(assert (=> b!1554916 (= e!865782 e!865778)))

(declare-fun res!1063724 () Bool)

(assert (=> b!1554916 (=> res!1063724 e!865778)))

(assert (=> b!1554916 (= res!1063724 e!865783)))

(declare-fun res!1063718 () Bool)

(assert (=> b!1554916 (=> (not res!1063718) (not e!865783))))

(declare-fun lt!670205 () Bool)

(assert (=> b!1554916 (= res!1063718 (not lt!670205))))

(declare-datatypes ((Unit!51616 0))(
  ( (Unit!51617) )
))
(declare-fun lt!670210 () Unit!51616)

(declare-fun e!865780 () Unit!51616)

(assert (=> b!1554916 (= lt!670210 e!865780)))

(declare-fun c!143793 () Bool)

(assert (=> b!1554916 (= c!143793 (not lt!670205))))

(declare-fun e!865787 () Bool)

(assert (=> b!1554916 (= lt!670205 e!865787)))

(declare-fun res!1063721 () Bool)

(assert (=> b!1554916 (=> res!1063721 e!865787)))

(assert (=> b!1554916 (= res!1063721 (bvsge from!762 (size!50615 _keys!618)))))

(assert (=> b!1554916 (= lt!670211 e!865779)))

(declare-fun c!143794 () Bool)

(assert (=> b!1554916 (= c!143794 (and (not lt!670207) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1554916 (= lt!670207 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1554917 () Bool)

(declare-fun e!865777 () ListLongMap!22411)

(declare-fun call!71428 () ListLongMap!22411)

(assert (=> b!1554917 (= e!865777 call!71428)))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((ValueCell!18194 0))(
  ( (ValueCellFull!18194 (v!21979 V!59389)) (EmptyCell!18194) )
))
(declare-datatypes ((array!103748 0))(
  ( (array!103749 (arr!50065 (Array (_ BitVec 32) ValueCell!18194)) (size!50616 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103748)

(declare-fun b!1554918 () Bool)

(declare-fun apply!1112 (ListLongMap!22411 (_ BitVec 64)) V!59389)

(declare-fun get!26078 (ValueCell!18194 V!59389) V!59389)

(declare-fun dynLambda!3859 (Int (_ BitVec 64)) V!59389)

(assert (=> b!1554918 (= e!865776 (not (= (apply!1112 lt!670211 (select (arr!50064 _keys!618) from!762)) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1554919 () Bool)

(declare-fun e!865775 () Bool)

(assert (=> b!1554919 (= e!865789 e!865775)))

(declare-fun res!1063719 () Bool)

(declare-fun call!71425 () Bool)

(assert (=> b!1554919 (= res!1063719 (not call!71425))))

(assert (=> b!1554919 (=> res!1063719 e!865775)))

(declare-fun b!1554920 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1554920 (= e!865787 (not (validKeyInArray!0 (select (arr!50064 _keys!618) from!762))))))

(declare-fun bm!71422 () Bool)

(assert (=> bm!71422 (= call!71428 call!71427)))

(declare-fun b!1554921 () Bool)

(declare-fun res!1063720 () Bool)

(assert (=> b!1554921 (=> (not res!1063720) (not e!865782))))

(declare-datatypes ((List!36243 0))(
  ( (Nil!36240) (Cons!36239 (h!37702 (_ BitVec 64)) (t!50951 List!36243)) )
))
(declare-fun arrayNoDuplicates!0 (array!103746 (_ BitVec 32) List!36243) Bool)

(assert (=> b!1554921 (= res!1063720 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36240))))

(declare-fun b!1554922 () Bool)

(declare-fun zeroValue!436 () V!59389)

(assert (=> b!1554922 (= e!865785 (not (= (apply!1112 lt!670211 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!436)))))

(declare-fun b!1554923 () Bool)

(declare-fun e!865788 () Bool)

(declare-fun tp_is_empty!38209 () Bool)

(assert (=> b!1554923 (= e!865788 tp_is_empty!38209)))

(declare-fun b!1554924 () Bool)

(declare-fun call!71429 () ListLongMap!22411)

(assert (=> b!1554924 (= e!865774 call!71429)))

(declare-fun b!1554925 () Bool)

(assert (=> b!1554925 (= e!865777 call!71429)))

(declare-fun res!1063722 () Bool)

(assert (=> start!132718 (=> (not res!1063722) (not e!865782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132718 (= res!1063722 (validMask!0 mask!926))))

(assert (=> start!132718 e!865782))

(declare-fun array_inv!39179 (array!103746) Bool)

(assert (=> start!132718 (array_inv!39179 _keys!618)))

(assert (=> start!132718 tp_is_empty!38209))

(assert (=> start!132718 true))

(assert (=> start!132718 tp!112062))

(declare-fun e!865786 () Bool)

(declare-fun array_inv!39180 (array!103748) Bool)

(assert (=> start!132718 (and (array_inv!39180 _values!470) e!865786)))

(declare-fun bm!71423 () Bool)

(declare-fun call!71426 () ListLongMap!22411)

(declare-fun minValue!436 () V!59389)

(declare-fun +!5049 (ListLongMap!22411 tuple2!24794) ListLongMap!22411)

(assert (=> bm!71423 (= call!71426 (+!5049 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1554926 () Bool)

(declare-fun e!865784 () Bool)

(assert (=> b!1554926 (= e!865784 tp_is_empty!38209)))

(declare-fun mapIsEmpty!59029 () Bool)

(declare-fun mapRes!59029 () Bool)

(assert (=> mapIsEmpty!59029 mapRes!59029))

(declare-fun b!1554927 () Bool)

(assert (=> b!1554927 (= e!865775 (not (= (apply!1112 lt!670211 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!436)))))

(declare-fun b!1554928 () Bool)

(declare-fun res!1063726 () Bool)

(assert (=> b!1554928 (=> (not res!1063726) (not e!865782))))

(assert (=> b!1554928 (= res!1063726 (and (= (size!50616 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50615 _keys!618) (size!50616 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1554929 () Bool)

(assert (=> b!1554929 (= e!865786 (and e!865784 mapRes!59029))))

(declare-fun condMapEmpty!59029 () Bool)

(declare-fun mapDefault!59029 () ValueCell!18194)

(assert (=> b!1554929 (= condMapEmpty!59029 (= (arr!50065 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18194)) mapDefault!59029)))))

(declare-fun bm!71424 () Bool)

(assert (=> bm!71424 (= call!71430 (contains!10173 lt!670211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1554930 () Bool)

(declare-fun lt!670213 () Unit!51616)

(assert (=> b!1554930 (= e!865780 lt!670213)))

(declare-fun lt!670212 () ListLongMap!22411)

(declare-fun getCurrentListMapNoExtraKeys!6681 (array!103746 array!103748 (_ BitVec 32) (_ BitVec 32) V!59389 V!59389 (_ BitVec 32) Int) ListLongMap!22411)

(assert (=> b!1554930 (= lt!670212 (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!670209 () Unit!51616)

(declare-fun addStillContains!1304 (ListLongMap!22411 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51616)

(assert (=> b!1554930 (= lt!670209 (addStillContains!1304 lt!670212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670204 () ListLongMap!22411)

(assert (=> b!1554930 (= lt!670204 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1554930 (contains!10173 lt!670204 (select (arr!50064 _keys!618) from!762))))

(declare-fun addApplyDifferent!639 (ListLongMap!22411 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51616)

(assert (=> b!1554930 (= lt!670213 (addApplyDifferent!639 lt!670212 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670206 () V!59389)

(assert (=> b!1554930 (= lt!670206 (apply!1112 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670208 () V!59389)

(assert (=> b!1554930 (= lt!670208 (apply!1112 lt!670212 (select (arr!50064 _keys!618) from!762)))))

(assert (=> b!1554930 (= lt!670206 lt!670208)))

(declare-fun lt!670214 () Unit!51616)

(assert (=> b!1554930 (= lt!670214 (addApplyDifferent!639 lt!670212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50064 _keys!618) from!762)))))

(assert (=> b!1554930 (= (apply!1112 lt!670204 (select (arr!50064 _keys!618) from!762)) lt!670208)))

(declare-fun b!1554931 () Bool)

(assert (=> b!1554931 (= e!865789 call!71425)))

(declare-fun b!1554932 () Bool)

(declare-fun c!143795 () Bool)

(assert (=> b!1554932 (= c!143795 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!670207))))

(assert (=> b!1554932 (= e!865774 e!865777)))

(declare-fun bm!71425 () Bool)

(assert (=> bm!71425 (= call!71424 (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71426 () Bool)

(assert (=> bm!71426 (= call!71429 call!71426)))

(declare-fun b!1554933 () Bool)

(declare-fun res!1063723 () Bool)

(assert (=> b!1554933 (=> res!1063723 e!865778)))

(assert (=> b!1554933 (= res!1063723 e!865773)))

(declare-fun c!143792 () Bool)

(assert (=> b!1554933 (= c!143792 (not lt!670207))))

(declare-fun b!1554934 () Bool)

(assert (=> b!1554934 (= e!865773 call!71430)))

(declare-fun bm!71427 () Bool)

(assert (=> bm!71427 (= call!71425 (contains!10173 lt!670211 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59029 () Bool)

(declare-fun tp!112063 () Bool)

(assert (=> mapNonEmpty!59029 (= mapRes!59029 (and tp!112063 e!865788))))

(declare-fun mapRest!59029 () (Array (_ BitVec 32) ValueCell!18194))

(declare-fun mapKey!59029 () (_ BitVec 32))

(declare-fun mapValue!59029 () ValueCell!18194)

(assert (=> mapNonEmpty!59029 (= (arr!50065 _values!470) (store mapRest!59029 mapKey!59029 mapValue!59029))))

(declare-fun b!1554935 () Bool)

(declare-fun Unit!51618 () Unit!51616)

(assert (=> b!1554935 (= e!865780 Unit!51618)))

(declare-fun b!1554936 () Bool)

(assert (=> b!1554936 (= e!865779 (+!5049 call!71426 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132718 res!1063722) b!1554928))

(assert (= (and b!1554928 res!1063726) b!1554912))

(assert (= (and b!1554912 res!1063727) b!1554921))

(assert (= (and b!1554921 res!1063720) b!1554915))

(assert (= (and b!1554915 res!1063728) b!1554916))

(assert (= (and b!1554916 c!143794) b!1554936))

(assert (= (and b!1554916 (not c!143794)) b!1554913))

(assert (= (and b!1554913 c!143796) b!1554924))

(assert (= (and b!1554913 (not c!143796)) b!1554932))

(assert (= (and b!1554932 c!143795) b!1554925))

(assert (= (and b!1554932 (not c!143795)) b!1554917))

(assert (= (or b!1554925 b!1554917) bm!71422))

(assert (= (or b!1554924 bm!71422) bm!71421))

(assert (= (or b!1554924 b!1554925) bm!71426))

(assert (= (or b!1554936 bm!71421) bm!71425))

(assert (= (or b!1554936 bm!71426) bm!71423))

(assert (= (and b!1554916 (not res!1063721)) b!1554920))

(assert (= (and b!1554916 c!143793) b!1554930))

(assert (= (and b!1554916 (not c!143793)) b!1554935))

(assert (= (and b!1554916 res!1063718) b!1554914))

(assert (= (and b!1554914 (not res!1063725)) b!1554918))

(assert (= (and b!1554916 (not res!1063724)) b!1554933))

(assert (= (and b!1554933 c!143792) b!1554911))

(assert (= (and b!1554933 (not c!143792)) b!1554934))

(assert (= (and b!1554911 (not res!1063717)) b!1554922))

(assert (= (or b!1554911 b!1554934) bm!71424))

(assert (= (and b!1554933 (not res!1063723)) b!1554910))

(assert (= (and b!1554910 c!143797) b!1554919))

(assert (= (and b!1554910 (not c!143797)) b!1554931))

(assert (= (and b!1554919 (not res!1063719)) b!1554927))

(assert (= (or b!1554919 b!1554931) bm!71427))

(assert (= (and b!1554929 condMapEmpty!59029) mapIsEmpty!59029))

(assert (= (and b!1554929 (not condMapEmpty!59029)) mapNonEmpty!59029))

(get-info :version)

(assert (= (and mapNonEmpty!59029 ((_ is ValueCellFull!18194) mapValue!59029)) b!1554923))

(assert (= (and b!1554929 ((_ is ValueCellFull!18194) mapDefault!59029)) b!1554926))

(assert (= start!132718 b!1554929))

(declare-fun b_lambda!24781 () Bool)

(assert (=> (not b_lambda!24781) (not b!1554918)))

(declare-fun t!50949 () Bool)

(declare-fun tb!12475 () Bool)

(assert (=> (and start!132718 (= defaultEntry!478 defaultEntry!478) t!50949) tb!12475))

(declare-fun result!26077 () Bool)

(assert (=> tb!12475 (= result!26077 tp_is_empty!38209)))

(assert (=> b!1554918 t!50949))

(declare-fun b_and!51375 () Bool)

(assert (= b_and!51373 (and (=> t!50949 result!26077) b_and!51375)))

(declare-fun m!1433209 () Bool)

(assert (=> bm!71425 m!1433209))

(declare-fun m!1433211 () Bool)

(assert (=> b!1554922 m!1433211))

(declare-fun m!1433213 () Bool)

(assert (=> b!1554914 m!1433213))

(assert (=> b!1554914 m!1433213))

(declare-fun m!1433215 () Bool)

(assert (=> b!1554914 m!1433215))

(declare-fun m!1433217 () Bool)

(assert (=> bm!71423 m!1433217))

(declare-fun m!1433219 () Bool)

(assert (=> b!1554921 m!1433219))

(assert (=> b!1554930 m!1433213))

(declare-fun m!1433221 () Bool)

(assert (=> b!1554930 m!1433221))

(assert (=> b!1554930 m!1433209))

(assert (=> b!1554930 m!1433213))

(declare-fun m!1433223 () Bool)

(assert (=> b!1554930 m!1433223))

(assert (=> b!1554930 m!1433223))

(assert (=> b!1554930 m!1433213))

(declare-fun m!1433225 () Bool)

(assert (=> b!1554930 m!1433225))

(declare-fun m!1433227 () Bool)

(assert (=> b!1554930 m!1433227))

(assert (=> b!1554930 m!1433213))

(declare-fun m!1433229 () Bool)

(assert (=> b!1554930 m!1433229))

(assert (=> b!1554930 m!1433213))

(declare-fun m!1433231 () Bool)

(assert (=> b!1554930 m!1433231))

(assert (=> b!1554930 m!1433213))

(declare-fun m!1433233 () Bool)

(assert (=> b!1554930 m!1433233))

(assert (=> b!1554930 m!1433213))

(declare-fun m!1433235 () Bool)

(assert (=> b!1554930 m!1433235))

(assert (=> b!1554930 m!1433213))

(declare-fun m!1433237 () Bool)

(assert (=> b!1554930 m!1433237))

(declare-fun m!1433239 () Bool)

(assert (=> bm!71424 m!1433239))

(declare-fun m!1433241 () Bool)

(assert (=> mapNonEmpty!59029 m!1433241))

(declare-fun m!1433243 () Bool)

(assert (=> b!1554927 m!1433243))

(assert (=> b!1554920 m!1433213))

(assert (=> b!1554920 m!1433213))

(declare-fun m!1433245 () Bool)

(assert (=> b!1554920 m!1433245))

(declare-fun m!1433247 () Bool)

(assert (=> b!1554918 m!1433247))

(assert (=> b!1554918 m!1433213))

(assert (=> b!1554918 m!1433213))

(declare-fun m!1433249 () Bool)

(assert (=> b!1554918 m!1433249))

(declare-fun m!1433251 () Bool)

(assert (=> b!1554918 m!1433251))

(assert (=> b!1554918 m!1433247))

(assert (=> b!1554918 m!1433251))

(declare-fun m!1433253 () Bool)

(assert (=> b!1554918 m!1433253))

(declare-fun m!1433255 () Bool)

(assert (=> b!1554912 m!1433255))

(declare-fun m!1433257 () Bool)

(assert (=> bm!71427 m!1433257))

(declare-fun m!1433259 () Bool)

(assert (=> start!132718 m!1433259))

(declare-fun m!1433261 () Bool)

(assert (=> start!132718 m!1433261))

(declare-fun m!1433263 () Bool)

(assert (=> start!132718 m!1433263))

(declare-fun m!1433265 () Bool)

(assert (=> b!1554936 m!1433265))

(check-sat (not b!1554927) (not b!1554912) (not b!1554930) (not b!1554920) tp_is_empty!38209 (not bm!71424) (not b_next!31933) (not b!1554914) (not b_lambda!24781) (not b!1554921) (not b!1554918) (not bm!71423) (not b!1554936) (not mapNonEmpty!59029) (not b!1554922) (not bm!71427) (not bm!71425) b_and!51375 (not start!132718))
(check-sat b_and!51375 (not b_next!31933))
(get-model)

(declare-fun b_lambda!24787 () Bool)

(assert (= b_lambda!24781 (or (and start!132718 b_free!31933) b_lambda!24787)))

(check-sat (not b!1554927) (not b!1554912) (not b!1554930) (not b!1554920) tp_is_empty!38209 (not bm!71424) (not b_next!31933) (not b!1554914) (not b!1554921) (not b!1554918) (not b_lambda!24787) (not bm!71423) (not b!1554936) (not mapNonEmpty!59029) (not b!1554922) (not bm!71427) (not bm!71425) b_and!51375 (not start!132718))
(check-sat b_and!51375 (not b_next!31933))
(get-model)

(declare-fun d!161745 () Bool)

(assert (=> d!161745 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132718 d!161745))

(declare-fun d!161747 () Bool)

(assert (=> d!161747 (= (array_inv!39179 _keys!618) (bvsge (size!50615 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132718 d!161747))

(declare-fun d!161749 () Bool)

(assert (=> d!161749 (= (array_inv!39180 _values!470) (bvsge (size!50616 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132718 d!161749))

(declare-fun d!161751 () Bool)

(declare-datatypes ((Option!803 0))(
  ( (Some!802 (v!21982 V!59389)) (None!801) )
))
(declare-fun get!26081 (Option!803) V!59389)

(declare-fun getValueByKey!728 (List!36242 (_ BitVec 64)) Option!803)

(assert (=> d!161751 (= (apply!1112 lt!670211 (select (arr!50064 _keys!618) from!762)) (get!26081 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762))))))

(declare-fun bs!44619 () Bool)

(assert (= bs!44619 d!161751))

(assert (=> bs!44619 m!1433213))

(declare-fun m!1433383 () Bool)

(assert (=> bs!44619 m!1433383))

(assert (=> bs!44619 m!1433383))

(declare-fun m!1433385 () Bool)

(assert (=> bs!44619 m!1433385))

(assert (=> b!1554918 d!161751))

(declare-fun d!161753 () Bool)

(declare-fun c!143836 () Bool)

(assert (=> d!161753 (= c!143836 ((_ is ValueCellFull!18194) (select (arr!50065 _values!470) from!762)))))

(declare-fun e!865894 () V!59389)

(assert (=> d!161753 (= (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) e!865894)))

(declare-fun b!1555109 () Bool)

(declare-fun get!26082 (ValueCell!18194 V!59389) V!59389)

(assert (=> b!1555109 (= e!865894 (get!26082 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555110 () Bool)

(declare-fun get!26083 (ValueCell!18194 V!59389) V!59389)

(assert (=> b!1555110 (= e!865894 (get!26083 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161753 c!143836) b!1555109))

(assert (= (and d!161753 (not c!143836)) b!1555110))

(assert (=> b!1555109 m!1433247))

(assert (=> b!1555109 m!1433251))

(declare-fun m!1433387 () Bool)

(assert (=> b!1555109 m!1433387))

(assert (=> b!1555110 m!1433247))

(assert (=> b!1555110 m!1433251))

(declare-fun m!1433389 () Bool)

(assert (=> b!1555110 m!1433389))

(assert (=> b!1554918 d!161753))

(declare-fun d!161755 () Bool)

(declare-fun e!865897 () Bool)

(assert (=> d!161755 e!865897))

(declare-fun res!1063806 () Bool)

(assert (=> d!161755 (=> (not res!1063806) (not e!865897))))

(declare-fun lt!670291 () ListLongMap!22411)

(assert (=> d!161755 (= res!1063806 (contains!10173 lt!670291 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!670292 () List!36242)

(assert (=> d!161755 (= lt!670291 (ListLongMap!22412 lt!670292))))

(declare-fun lt!670290 () Unit!51616)

(declare-fun lt!670289 () Unit!51616)

(assert (=> d!161755 (= lt!670290 lt!670289)))

(assert (=> d!161755 (= (getValueByKey!728 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!802 (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!375 (List!36242 (_ BitVec 64) V!59389) Unit!51616)

(assert (=> d!161755 (= lt!670289 (lemmaContainsTupThenGetReturnValue!375 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun insertStrictlySorted!504 (List!36242 (_ BitVec 64) V!59389) List!36242)

(assert (=> d!161755 (= lt!670292 (insertStrictlySorted!504 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161755 (= (+!5049 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670291)))

(declare-fun b!1555115 () Bool)

(declare-fun res!1063805 () Bool)

(assert (=> b!1555115 (=> (not res!1063805) (not e!865897))))

(assert (=> b!1555115 (= res!1063805 (= (getValueByKey!728 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!802 (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555116 () Bool)

(declare-fun contains!10176 (List!36242 tuple2!24794) Bool)

(assert (=> b!1555116 (= e!865897 (contains!10176 (toList!11221 lt!670291) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161755 res!1063806) b!1555115))

(assert (= (and b!1555115 res!1063805) b!1555116))

(declare-fun m!1433391 () Bool)

(assert (=> d!161755 m!1433391))

(declare-fun m!1433393 () Bool)

(assert (=> d!161755 m!1433393))

(declare-fun m!1433395 () Bool)

(assert (=> d!161755 m!1433395))

(declare-fun m!1433397 () Bool)

(assert (=> d!161755 m!1433397))

(declare-fun m!1433399 () Bool)

(assert (=> b!1555115 m!1433399))

(declare-fun m!1433401 () Bool)

(assert (=> b!1555116 m!1433401))

(assert (=> bm!71423 d!161755))

(declare-fun b!1555141 () Bool)

(declare-fun e!865916 () ListLongMap!22411)

(assert (=> b!1555141 (= e!865916 (ListLongMap!22412 Nil!36239))))

(declare-fun b!1555142 () Bool)

(declare-fun e!865917 () ListLongMap!22411)

(declare-fun call!71475 () ListLongMap!22411)

(assert (=> b!1555142 (= e!865917 call!71475)))

(declare-fun b!1555143 () Bool)

(declare-fun e!865918 () Bool)

(declare-fun e!865913 () Bool)

(assert (=> b!1555143 (= e!865918 e!865913)))

(assert (=> b!1555143 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50615 _keys!618)))))

(declare-fun lt!670309 () ListLongMap!22411)

(declare-fun res!1063815 () Bool)

(assert (=> b!1555143 (= res!1063815 (contains!10173 lt!670309 (select (arr!50064 _keys!618) from!762)))))

(assert (=> b!1555143 (=> (not res!1063815) (not e!865913))))

(declare-fun d!161757 () Bool)

(declare-fun e!865914 () Bool)

(assert (=> d!161757 e!865914))

(declare-fun res!1063818 () Bool)

(assert (=> d!161757 (=> (not res!1063818) (not e!865914))))

(assert (=> d!161757 (= res!1063818 (not (contains!10173 lt!670309 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161757 (= lt!670309 e!865916)))

(declare-fun c!143846 () Bool)

(assert (=> d!161757 (= c!143846 (bvsge from!762 (size!50615 _keys!618)))))

(assert (=> d!161757 (validMask!0 mask!926)))

(assert (=> d!161757 (= (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!670309)))

(declare-fun b!1555144 () Bool)

(assert (=> b!1555144 (= e!865916 e!865917)))

(declare-fun c!143845 () Bool)

(assert (=> b!1555144 (= c!143845 (validKeyInArray!0 (select (arr!50064 _keys!618) from!762)))))

(declare-fun bm!71472 () Bool)

(assert (=> bm!71472 (= call!71475 (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1555145 () Bool)

(declare-fun lt!670311 () Unit!51616)

(declare-fun lt!670313 () Unit!51616)

(assert (=> b!1555145 (= lt!670311 lt!670313)))

(declare-fun lt!670310 () V!59389)

(declare-fun lt!670312 () (_ BitVec 64))

(declare-fun lt!670308 () ListLongMap!22411)

(declare-fun lt!670307 () (_ BitVec 64))

(assert (=> b!1555145 (not (contains!10173 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)) lt!670312))))

(declare-fun addStillNotContains!514 (ListLongMap!22411 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51616)

(assert (=> b!1555145 (= lt!670313 (addStillNotContains!514 lt!670308 lt!670307 lt!670310 lt!670312))))

(assert (=> b!1555145 (= lt!670312 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1555145 (= lt!670310 (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1555145 (= lt!670307 (select (arr!50064 _keys!618) from!762))))

(assert (=> b!1555145 (= lt!670308 call!71475)))

(assert (=> b!1555145 (= e!865917 (+!5049 call!71475 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1555146 () Bool)

(assert (=> b!1555146 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50615 _keys!618)))))

(assert (=> b!1555146 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50616 _values!470)))))

(assert (=> b!1555146 (= e!865913 (= (apply!1112 lt!670309 (select (arr!50064 _keys!618) from!762)) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555147 () Bool)

(declare-fun e!865912 () Bool)

(assert (=> b!1555147 (= e!865918 e!865912)))

(declare-fun c!143847 () Bool)

(assert (=> b!1555147 (= c!143847 (bvslt from!762 (size!50615 _keys!618)))))

(declare-fun b!1555148 () Bool)

(declare-fun e!865915 () Bool)

(assert (=> b!1555148 (= e!865915 (validKeyInArray!0 (select (arr!50064 _keys!618) from!762)))))

(assert (=> b!1555148 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1555149 () Bool)

(assert (=> b!1555149 (= e!865914 e!865918)))

(declare-fun c!143848 () Bool)

(assert (=> b!1555149 (= c!143848 e!865915)))

(declare-fun res!1063816 () Bool)

(assert (=> b!1555149 (=> (not res!1063816) (not e!865915))))

(assert (=> b!1555149 (= res!1063816 (bvslt from!762 (size!50615 _keys!618)))))

(declare-fun b!1555150 () Bool)

(declare-fun isEmpty!1135 (ListLongMap!22411) Bool)

(assert (=> b!1555150 (= e!865912 (isEmpty!1135 lt!670309))))

(declare-fun b!1555151 () Bool)

(declare-fun res!1063817 () Bool)

(assert (=> b!1555151 (=> (not res!1063817) (not e!865914))))

(assert (=> b!1555151 (= res!1063817 (not (contains!10173 lt!670309 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555152 () Bool)

(assert (=> b!1555152 (= e!865912 (= lt!670309 (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(assert (= (and d!161757 c!143846) b!1555141))

(assert (= (and d!161757 (not c!143846)) b!1555144))

(assert (= (and b!1555144 c!143845) b!1555145))

(assert (= (and b!1555144 (not c!143845)) b!1555142))

(assert (= (or b!1555145 b!1555142) bm!71472))

(assert (= (and d!161757 res!1063818) b!1555151))

(assert (= (and b!1555151 res!1063817) b!1555149))

(assert (= (and b!1555149 res!1063816) b!1555148))

(assert (= (and b!1555149 c!143848) b!1555143))

(assert (= (and b!1555149 (not c!143848)) b!1555147))

(assert (= (and b!1555143 res!1063815) b!1555146))

(assert (= (and b!1555147 c!143847) b!1555152))

(assert (= (and b!1555147 (not c!143847)) b!1555150))

(declare-fun b_lambda!24789 () Bool)

(assert (=> (not b_lambda!24789) (not b!1555145)))

(assert (=> b!1555145 t!50949))

(declare-fun b_and!51385 () Bool)

(assert (= b_and!51375 (and (=> t!50949 result!26077) b_and!51385)))

(declare-fun b_lambda!24791 () Bool)

(assert (=> (not b_lambda!24791) (not b!1555146)))

(assert (=> b!1555146 t!50949))

(declare-fun b_and!51387 () Bool)

(assert (= b_and!51385 (and (=> t!50949 result!26077) b_and!51387)))

(assert (=> b!1555148 m!1433213))

(assert (=> b!1555148 m!1433213))

(assert (=> b!1555148 m!1433245))

(declare-fun m!1433403 () Bool)

(assert (=> d!161757 m!1433403))

(assert (=> d!161757 m!1433259))

(assert (=> b!1555145 m!1433247))

(assert (=> b!1555145 m!1433251))

(assert (=> b!1555145 m!1433253))

(assert (=> b!1555145 m!1433247))

(declare-fun m!1433405 () Bool)

(assert (=> b!1555145 m!1433405))

(declare-fun m!1433407 () Bool)

(assert (=> b!1555145 m!1433407))

(declare-fun m!1433409 () Bool)

(assert (=> b!1555145 m!1433409))

(assert (=> b!1555145 m!1433407))

(assert (=> b!1555145 m!1433213))

(assert (=> b!1555145 m!1433251))

(declare-fun m!1433411 () Bool)

(assert (=> b!1555145 m!1433411))

(declare-fun m!1433413 () Bool)

(assert (=> b!1555150 m!1433413))

(assert (=> b!1555146 m!1433247))

(assert (=> b!1555146 m!1433251))

(assert (=> b!1555146 m!1433253))

(assert (=> b!1555146 m!1433247))

(assert (=> b!1555146 m!1433251))

(assert (=> b!1555146 m!1433213))

(declare-fun m!1433415 () Bool)

(assert (=> b!1555146 m!1433415))

(assert (=> b!1555146 m!1433213))

(declare-fun m!1433417 () Bool)

(assert (=> bm!71472 m!1433417))

(assert (=> b!1555143 m!1433213))

(assert (=> b!1555143 m!1433213))

(declare-fun m!1433419 () Bool)

(assert (=> b!1555143 m!1433419))

(assert (=> b!1555152 m!1433417))

(assert (=> b!1555144 m!1433213))

(assert (=> b!1555144 m!1433213))

(assert (=> b!1555144 m!1433245))

(declare-fun m!1433421 () Bool)

(assert (=> b!1555151 m!1433421))

(assert (=> bm!71425 d!161757))

(declare-fun d!161759 () Bool)

(declare-fun e!865923 () Bool)

(assert (=> d!161759 e!865923))

(declare-fun res!1063821 () Bool)

(assert (=> d!161759 (=> res!1063821 e!865923)))

(declare-fun lt!670323 () Bool)

(assert (=> d!161759 (= res!1063821 (not lt!670323))))

(declare-fun lt!670324 () Bool)

(assert (=> d!161759 (= lt!670323 lt!670324)))

(declare-fun lt!670325 () Unit!51616)

(declare-fun e!865924 () Unit!51616)

(assert (=> d!161759 (= lt!670325 e!865924)))

(declare-fun c!143851 () Bool)

(assert (=> d!161759 (= c!143851 lt!670324)))

(declare-fun containsKey!754 (List!36242 (_ BitVec 64)) Bool)

(assert (=> d!161759 (= lt!670324 (containsKey!754 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161759 (= (contains!10173 lt!670211 (select (arr!50064 _keys!618) from!762)) lt!670323)))

(declare-fun b!1555159 () Bool)

(declare-fun lt!670322 () Unit!51616)

(assert (=> b!1555159 (= e!865924 lt!670322)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!500 (List!36242 (_ BitVec 64)) Unit!51616)

(assert (=> b!1555159 (= lt!670322 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))

(declare-fun isDefined!546 (Option!803) Bool)

(assert (=> b!1555159 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555160 () Bool)

(declare-fun Unit!51625 () Unit!51616)

(assert (=> b!1555160 (= e!865924 Unit!51625)))

(declare-fun b!1555161 () Bool)

(assert (=> b!1555161 (= e!865923 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762))))))

(assert (= (and d!161759 c!143851) b!1555159))

(assert (= (and d!161759 (not c!143851)) b!1555160))

(assert (= (and d!161759 (not res!1063821)) b!1555161))

(assert (=> d!161759 m!1433213))

(declare-fun m!1433423 () Bool)

(assert (=> d!161759 m!1433423))

(assert (=> b!1555159 m!1433213))

(declare-fun m!1433425 () Bool)

(assert (=> b!1555159 m!1433425))

(assert (=> b!1555159 m!1433213))

(assert (=> b!1555159 m!1433383))

(assert (=> b!1555159 m!1433383))

(declare-fun m!1433427 () Bool)

(assert (=> b!1555159 m!1433427))

(assert (=> b!1555161 m!1433213))

(assert (=> b!1555161 m!1433383))

(assert (=> b!1555161 m!1433383))

(assert (=> b!1555161 m!1433427))

(assert (=> b!1554914 d!161759))

(declare-fun b!1555170 () Bool)

(declare-fun e!865931 () Bool)

(declare-fun e!865932 () Bool)

(assert (=> b!1555170 (= e!865931 e!865932)))

(declare-fun lt!670332 () (_ BitVec 64))

(assert (=> b!1555170 (= lt!670332 (select (arr!50064 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!670334 () Unit!51616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103746 (_ BitVec 64) (_ BitVec 32)) Unit!51616)

(assert (=> b!1555170 (= lt!670334 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!670332 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1555170 (arrayContainsKey!0 _keys!618 lt!670332 #b00000000000000000000000000000000)))

(declare-fun lt!670333 () Unit!51616)

(assert (=> b!1555170 (= lt!670333 lt!670334)))

(declare-fun res!1063827 () Bool)

(declare-datatypes ((SeekEntryResult!13464 0))(
  ( (MissingZero!13464 (index!56254 (_ BitVec 32))) (Found!13464 (index!56255 (_ BitVec 32))) (Intermediate!13464 (undefined!14276 Bool) (index!56256 (_ BitVec 32)) (x!139212 (_ BitVec 32))) (Undefined!13464) (MissingVacant!13464 (index!56257 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103746 (_ BitVec 32)) SeekEntryResult!13464)

(assert (=> b!1555170 (= res!1063827 (= (seekEntryOrOpen!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13464 #b00000000000000000000000000000000)))))

(assert (=> b!1555170 (=> (not res!1063827) (not e!865932))))

(declare-fun b!1555172 () Bool)

(declare-fun e!865933 () Bool)

(assert (=> b!1555172 (= e!865933 e!865931)))

(declare-fun c!143854 () Bool)

(assert (=> b!1555172 (= c!143854 (validKeyInArray!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1555171 () Bool)

(declare-fun call!71478 () Bool)

(assert (=> b!1555171 (= e!865932 call!71478)))

(declare-fun d!161761 () Bool)

(declare-fun res!1063826 () Bool)

(assert (=> d!161761 (=> res!1063826 e!865933)))

(assert (=> d!161761 (= res!1063826 (bvsge #b00000000000000000000000000000000 (size!50615 _keys!618)))))

(assert (=> d!161761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!865933)))

(declare-fun b!1555173 () Bool)

(assert (=> b!1555173 (= e!865931 call!71478)))

(declare-fun bm!71475 () Bool)

(assert (=> bm!71475 (= call!71478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(assert (= (and d!161761 (not res!1063826)) b!1555172))

(assert (= (and b!1555172 c!143854) b!1555170))

(assert (= (and b!1555172 (not c!143854)) b!1555173))

(assert (= (and b!1555170 res!1063827) b!1555171))

(assert (= (or b!1555171 b!1555173) bm!71475))

(declare-fun m!1433429 () Bool)

(assert (=> b!1555170 m!1433429))

(declare-fun m!1433431 () Bool)

(assert (=> b!1555170 m!1433431))

(declare-fun m!1433433 () Bool)

(assert (=> b!1555170 m!1433433))

(assert (=> b!1555170 m!1433429))

(declare-fun m!1433435 () Bool)

(assert (=> b!1555170 m!1433435))

(assert (=> b!1555172 m!1433429))

(assert (=> b!1555172 m!1433429))

(declare-fun m!1433437 () Bool)

(assert (=> b!1555172 m!1433437))

(declare-fun m!1433439 () Bool)

(assert (=> bm!71475 m!1433439))

(assert (=> b!1554912 d!161761))

(declare-fun d!161763 () Bool)

(declare-fun e!865934 () Bool)

(assert (=> d!161763 e!865934))

(declare-fun res!1063829 () Bool)

(assert (=> d!161763 (=> (not res!1063829) (not e!865934))))

(declare-fun lt!670337 () ListLongMap!22411)

(assert (=> d!161763 (= res!1063829 (contains!10173 lt!670337 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!670338 () List!36242)

(assert (=> d!161763 (= lt!670337 (ListLongMap!22412 lt!670338))))

(declare-fun lt!670336 () Unit!51616)

(declare-fun lt!670335 () Unit!51616)

(assert (=> d!161763 (= lt!670336 lt!670335)))

(assert (=> d!161763 (= (getValueByKey!728 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161763 (= lt!670335 (lemmaContainsTupThenGetReturnValue!375 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161763 (= lt!670338 (insertStrictlySorted!504 (toList!11221 call!71426) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161763 (= (+!5049 call!71426 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!670337)))

(declare-fun b!1555174 () Bool)

(declare-fun res!1063828 () Bool)

(assert (=> b!1555174 (=> (not res!1063828) (not e!865934))))

(assert (=> b!1555174 (= res!1063828 (= (getValueByKey!728 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555175 () Bool)

(assert (=> b!1555175 (= e!865934 (contains!10176 (toList!11221 lt!670337) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161763 res!1063829) b!1555174))

(assert (= (and b!1555174 res!1063828) b!1555175))

(declare-fun m!1433441 () Bool)

(assert (=> d!161763 m!1433441))

(declare-fun m!1433443 () Bool)

(assert (=> d!161763 m!1433443))

(declare-fun m!1433445 () Bool)

(assert (=> d!161763 m!1433445))

(declare-fun m!1433447 () Bool)

(assert (=> d!161763 m!1433447))

(declare-fun m!1433449 () Bool)

(assert (=> b!1555174 m!1433449))

(declare-fun m!1433451 () Bool)

(assert (=> b!1555175 m!1433451))

(assert (=> b!1554936 d!161763))

(declare-fun d!161765 () Bool)

(assert (=> d!161765 (= (apply!1112 lt!670211 #b0000000000000000000000000000000000000000000000000000000000000000) (get!26081 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!44620 () Bool)

(assert (= bs!44620 d!161765))

(declare-fun m!1433453 () Bool)

(assert (=> bs!44620 m!1433453))

(assert (=> bs!44620 m!1433453))

(declare-fun m!1433455 () Bool)

(assert (=> bs!44620 m!1433455))

(assert (=> b!1554922 d!161765))

(declare-fun d!161767 () Bool)

(assert (=> d!161767 (contains!10173 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50064 _keys!618) from!762))))

(declare-fun lt!670341 () Unit!51616)

(declare-fun choose!2030 (ListLongMap!22411 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51616)

(assert (=> d!161767 (= lt!670341 (choose!2030 lt!670212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161767 (contains!10173 lt!670212 (select (arr!50064 _keys!618) from!762))))

(assert (=> d!161767 (= (addStillContains!1304 lt!670212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50064 _keys!618) from!762)) lt!670341)))

(declare-fun bs!44621 () Bool)

(assert (= bs!44621 d!161767))

(assert (=> bs!44621 m!1433227))

(assert (=> bs!44621 m!1433227))

(assert (=> bs!44621 m!1433213))

(declare-fun m!1433457 () Bool)

(assert (=> bs!44621 m!1433457))

(assert (=> bs!44621 m!1433213))

(declare-fun m!1433459 () Bool)

(assert (=> bs!44621 m!1433459))

(assert (=> bs!44621 m!1433213))

(declare-fun m!1433461 () Bool)

(assert (=> bs!44621 m!1433461))

(assert (=> b!1554930 d!161767))

(declare-fun d!161769 () Bool)

(declare-fun e!865935 () Bool)

(assert (=> d!161769 e!865935))

(declare-fun res!1063831 () Bool)

(assert (=> d!161769 (=> (not res!1063831) (not e!865935))))

(declare-fun lt!670344 () ListLongMap!22411)

(assert (=> d!161769 (= res!1063831 (contains!10173 lt!670344 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!670345 () List!36242)

(assert (=> d!161769 (= lt!670344 (ListLongMap!22412 lt!670345))))

(declare-fun lt!670343 () Unit!51616)

(declare-fun lt!670342 () Unit!51616)

(assert (=> d!161769 (= lt!670343 lt!670342)))

(assert (=> d!161769 (= (getValueByKey!728 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161769 (= lt!670342 (lemmaContainsTupThenGetReturnValue!375 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161769 (= lt!670345 (insertStrictlySorted!504 (toList!11221 lt!670212) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161769 (= (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!670344)))

(declare-fun b!1555177 () Bool)

(declare-fun res!1063830 () Bool)

(assert (=> b!1555177 (=> (not res!1063830) (not e!865935))))

(assert (=> b!1555177 (= res!1063830 (= (getValueByKey!728 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555178 () Bool)

(assert (=> b!1555178 (= e!865935 (contains!10176 (toList!11221 lt!670344) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161769 res!1063831) b!1555177))

(assert (= (and b!1555177 res!1063830) b!1555178))

(declare-fun m!1433463 () Bool)

(assert (=> d!161769 m!1433463))

(declare-fun m!1433465 () Bool)

(assert (=> d!161769 m!1433465))

(declare-fun m!1433467 () Bool)

(assert (=> d!161769 m!1433467))

(declare-fun m!1433469 () Bool)

(assert (=> d!161769 m!1433469))

(declare-fun m!1433471 () Bool)

(assert (=> b!1555177 m!1433471))

(declare-fun m!1433473 () Bool)

(assert (=> b!1555178 m!1433473))

(assert (=> b!1554930 d!161769))

(declare-fun d!161771 () Bool)

(assert (=> d!161771 (= (apply!1112 lt!670204 (select (arr!50064 _keys!618) from!762)) (get!26081 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762))))))

(declare-fun bs!44622 () Bool)

(assert (= bs!44622 d!161771))

(assert (=> bs!44622 m!1433213))

(declare-fun m!1433475 () Bool)

(assert (=> bs!44622 m!1433475))

(assert (=> bs!44622 m!1433475))

(declare-fun m!1433477 () Bool)

(assert (=> bs!44622 m!1433477))

(assert (=> b!1554930 d!161771))

(assert (=> b!1554930 d!161757))

(declare-fun d!161773 () Bool)

(assert (=> d!161773 (= (apply!1112 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50064 _keys!618) from!762)) (apply!1112 lt!670212 (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670348 () Unit!51616)

(declare-fun choose!2031 (ListLongMap!22411 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51616)

(assert (=> d!161773 (= lt!670348 (choose!2031 lt!670212 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50064 _keys!618) from!762)))))

(declare-fun e!865938 () Bool)

(assert (=> d!161773 e!865938))

(declare-fun res!1063834 () Bool)

(assert (=> d!161773 (=> (not res!1063834) (not e!865938))))

(assert (=> d!161773 (= res!1063834 (contains!10173 lt!670212 (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161773 (= (addApplyDifferent!639 lt!670212 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50064 _keys!618) from!762)) lt!670348)))

(declare-fun b!1555182 () Bool)

(assert (=> b!1555182 (= e!865938 (not (= (select (arr!50064 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161773 res!1063834) b!1555182))

(assert (=> d!161773 m!1433223))

(assert (=> d!161773 m!1433213))

(assert (=> d!161773 m!1433229))

(assert (=> d!161773 m!1433213))

(declare-fun m!1433479 () Bool)

(assert (=> d!161773 m!1433479))

(assert (=> d!161773 m!1433213))

(assert (=> d!161773 m!1433461))

(assert (=> d!161773 m!1433223))

(assert (=> d!161773 m!1433213))

(assert (=> d!161773 m!1433225))

(assert (=> b!1554930 d!161773))

(declare-fun d!161775 () Bool)

(assert (=> d!161775 (= (apply!1112 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50064 _keys!618) from!762)) (apply!1112 lt!670212 (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670349 () Unit!51616)

(assert (=> d!161775 (= lt!670349 (choose!2031 lt!670212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50064 _keys!618) from!762)))))

(declare-fun e!865939 () Bool)

(assert (=> d!161775 e!865939))

(declare-fun res!1063835 () Bool)

(assert (=> d!161775 (=> (not res!1063835) (not e!865939))))

(assert (=> d!161775 (= res!1063835 (contains!10173 lt!670212 (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161775 (= (addApplyDifferent!639 lt!670212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50064 _keys!618) from!762)) lt!670349)))

(declare-fun b!1555183 () Bool)

(assert (=> b!1555183 (= e!865939 (not (= (select (arr!50064 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161775 res!1063835) b!1555183))

(assert (=> d!161775 m!1433227))

(assert (=> d!161775 m!1433213))

(assert (=> d!161775 m!1433229))

(assert (=> d!161775 m!1433213))

(declare-fun m!1433481 () Bool)

(assert (=> d!161775 m!1433481))

(assert (=> d!161775 m!1433213))

(assert (=> d!161775 m!1433461))

(assert (=> d!161775 m!1433227))

(assert (=> d!161775 m!1433213))

(declare-fun m!1433483 () Bool)

(assert (=> d!161775 m!1433483))

(assert (=> b!1554930 d!161775))

(declare-fun d!161777 () Bool)

(assert (=> d!161777 (= (apply!1112 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50064 _keys!618) from!762)) (get!26081 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun bs!44623 () Bool)

(assert (= bs!44623 d!161777))

(assert (=> bs!44623 m!1433213))

(declare-fun m!1433485 () Bool)

(assert (=> bs!44623 m!1433485))

(assert (=> bs!44623 m!1433485))

(declare-fun m!1433487 () Bool)

(assert (=> bs!44623 m!1433487))

(assert (=> b!1554930 d!161777))

(declare-fun d!161779 () Bool)

(assert (=> d!161779 (= (apply!1112 lt!670212 (select (arr!50064 _keys!618) from!762)) (get!26081 (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762))))))

(declare-fun bs!44624 () Bool)

(assert (= bs!44624 d!161779))

(assert (=> bs!44624 m!1433213))

(declare-fun m!1433489 () Bool)

(assert (=> bs!44624 m!1433489))

(assert (=> bs!44624 m!1433489))

(declare-fun m!1433491 () Bool)

(assert (=> bs!44624 m!1433491))

(assert (=> b!1554930 d!161779))

(declare-fun d!161781 () Bool)

(declare-fun e!865940 () Bool)

(assert (=> d!161781 e!865940))

(declare-fun res!1063837 () Bool)

(assert (=> d!161781 (=> (not res!1063837) (not e!865940))))

(declare-fun lt!670352 () ListLongMap!22411)

(assert (=> d!161781 (= res!1063837 (contains!10173 lt!670352 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!670353 () List!36242)

(assert (=> d!161781 (= lt!670352 (ListLongMap!22412 lt!670353))))

(declare-fun lt!670351 () Unit!51616)

(declare-fun lt!670350 () Unit!51616)

(assert (=> d!161781 (= lt!670351 lt!670350)))

(assert (=> d!161781 (= (getValueByKey!728 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161781 (= lt!670350 (lemmaContainsTupThenGetReturnValue!375 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161781 (= lt!670353 (insertStrictlySorted!504 (toList!11221 lt!670212) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161781 (= (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!670352)))

(declare-fun b!1555184 () Bool)

(declare-fun res!1063836 () Bool)

(assert (=> b!1555184 (=> (not res!1063836) (not e!865940))))

(assert (=> b!1555184 (= res!1063836 (= (getValueByKey!728 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555185 () Bool)

(assert (=> b!1555185 (= e!865940 (contains!10176 (toList!11221 lt!670352) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161781 res!1063837) b!1555184))

(assert (= (and b!1555184 res!1063836) b!1555185))

(declare-fun m!1433493 () Bool)

(assert (=> d!161781 m!1433493))

(declare-fun m!1433495 () Bool)

(assert (=> d!161781 m!1433495))

(declare-fun m!1433497 () Bool)

(assert (=> d!161781 m!1433497))

(declare-fun m!1433499 () Bool)

(assert (=> d!161781 m!1433499))

(declare-fun m!1433501 () Bool)

(assert (=> b!1555184 m!1433501))

(declare-fun m!1433503 () Bool)

(assert (=> b!1555185 m!1433503))

(assert (=> b!1554930 d!161781))

(declare-fun d!161783 () Bool)

(declare-fun e!865941 () Bool)

(assert (=> d!161783 e!865941))

(declare-fun res!1063838 () Bool)

(assert (=> d!161783 (=> res!1063838 e!865941)))

(declare-fun lt!670355 () Bool)

(assert (=> d!161783 (= res!1063838 (not lt!670355))))

(declare-fun lt!670356 () Bool)

(assert (=> d!161783 (= lt!670355 lt!670356)))

(declare-fun lt!670357 () Unit!51616)

(declare-fun e!865942 () Unit!51616)

(assert (=> d!161783 (= lt!670357 e!865942)))

(declare-fun c!143855 () Bool)

(assert (=> d!161783 (= c!143855 lt!670356)))

(assert (=> d!161783 (= lt!670356 (containsKey!754 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161783 (= (contains!10173 lt!670204 (select (arr!50064 _keys!618) from!762)) lt!670355)))

(declare-fun b!1555186 () Bool)

(declare-fun lt!670354 () Unit!51616)

(assert (=> b!1555186 (= e!865942 lt!670354)))

(assert (=> b!1555186 (= lt!670354 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))

(assert (=> b!1555186 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555187 () Bool)

(declare-fun Unit!51626 () Unit!51616)

(assert (=> b!1555187 (= e!865942 Unit!51626)))

(declare-fun b!1555188 () Bool)

(assert (=> b!1555188 (= e!865941 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762))))))

(assert (= (and d!161783 c!143855) b!1555186))

(assert (= (and d!161783 (not c!143855)) b!1555187))

(assert (= (and d!161783 (not res!1063838)) b!1555188))

(assert (=> d!161783 m!1433213))

(declare-fun m!1433505 () Bool)

(assert (=> d!161783 m!1433505))

(assert (=> b!1555186 m!1433213))

(declare-fun m!1433507 () Bool)

(assert (=> b!1555186 m!1433507))

(assert (=> b!1555186 m!1433213))

(assert (=> b!1555186 m!1433475))

(assert (=> b!1555186 m!1433475))

(declare-fun m!1433509 () Bool)

(assert (=> b!1555186 m!1433509))

(assert (=> b!1555188 m!1433213))

(assert (=> b!1555188 m!1433475))

(assert (=> b!1555188 m!1433475))

(assert (=> b!1555188 m!1433509))

(assert (=> b!1554930 d!161783))

(declare-fun bm!71478 () Bool)

(declare-fun call!71481 () Bool)

(declare-fun c!143858 () Bool)

(assert (=> bm!71478 (= call!71481 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)))))

(declare-fun b!1555199 () Bool)

(declare-fun e!865951 () Bool)

(assert (=> b!1555199 (= e!865951 call!71481)))

(declare-fun d!161785 () Bool)

(declare-fun res!1063846 () Bool)

(declare-fun e!865953 () Bool)

(assert (=> d!161785 (=> res!1063846 e!865953)))

(assert (=> d!161785 (= res!1063846 (bvsge #b00000000000000000000000000000000 (size!50615 _keys!618)))))

(assert (=> d!161785 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36240) e!865953)))

(declare-fun b!1555200 () Bool)

(declare-fun e!865952 () Bool)

(assert (=> b!1555200 (= e!865953 e!865952)))

(declare-fun res!1063845 () Bool)

(assert (=> b!1555200 (=> (not res!1063845) (not e!865952))))

(declare-fun e!865954 () Bool)

(assert (=> b!1555200 (= res!1063845 (not e!865954))))

(declare-fun res!1063847 () Bool)

(assert (=> b!1555200 (=> (not res!1063847) (not e!865954))))

(assert (=> b!1555200 (= res!1063847 (validKeyInArray!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1555201 () Bool)

(assert (=> b!1555201 (= e!865951 call!71481)))

(declare-fun b!1555202 () Bool)

(declare-fun contains!10177 (List!36243 (_ BitVec 64)) Bool)

(assert (=> b!1555202 (= e!865954 (contains!10177 Nil!36240 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1555203 () Bool)

(assert (=> b!1555203 (= e!865952 e!865951)))

(assert (=> b!1555203 (= c!143858 (validKeyInArray!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!161785 (not res!1063846)) b!1555200))

(assert (= (and b!1555200 res!1063847) b!1555202))

(assert (= (and b!1555200 res!1063845) b!1555203))

(assert (= (and b!1555203 c!143858) b!1555199))

(assert (= (and b!1555203 (not c!143858)) b!1555201))

(assert (= (or b!1555199 b!1555201) bm!71478))

(assert (=> bm!71478 m!1433429))

(declare-fun m!1433511 () Bool)

(assert (=> bm!71478 m!1433511))

(assert (=> b!1555200 m!1433429))

(assert (=> b!1555200 m!1433429))

(assert (=> b!1555200 m!1433437))

(assert (=> b!1555202 m!1433429))

(assert (=> b!1555202 m!1433429))

(declare-fun m!1433513 () Bool)

(assert (=> b!1555202 m!1433513))

(assert (=> b!1555203 m!1433429))

(assert (=> b!1555203 m!1433429))

(assert (=> b!1555203 m!1433437))

(assert (=> b!1554921 d!161785))

(declare-fun d!161787 () Bool)

(declare-fun e!865955 () Bool)

(assert (=> d!161787 e!865955))

(declare-fun res!1063848 () Bool)

(assert (=> d!161787 (=> res!1063848 e!865955)))

(declare-fun lt!670359 () Bool)

(assert (=> d!161787 (= res!1063848 (not lt!670359))))

(declare-fun lt!670360 () Bool)

(assert (=> d!161787 (= lt!670359 lt!670360)))

(declare-fun lt!670361 () Unit!51616)

(declare-fun e!865956 () Unit!51616)

(assert (=> d!161787 (= lt!670361 e!865956)))

(declare-fun c!143859 () Bool)

(assert (=> d!161787 (= c!143859 lt!670360)))

(assert (=> d!161787 (= lt!670360 (containsKey!754 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161787 (= (contains!10173 lt!670211 #b0000000000000000000000000000000000000000000000000000000000000000) lt!670359)))

(declare-fun b!1555204 () Bool)

(declare-fun lt!670358 () Unit!51616)

(assert (=> b!1555204 (= e!865956 lt!670358)))

(assert (=> b!1555204 (= lt!670358 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1555204 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555205 () Bool)

(declare-fun Unit!51627 () Unit!51616)

(assert (=> b!1555205 (= e!865956 Unit!51627)))

(declare-fun b!1555206 () Bool)

(assert (=> b!1555206 (= e!865955 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161787 c!143859) b!1555204))

(assert (= (and d!161787 (not c!143859)) b!1555205))

(assert (= (and d!161787 (not res!1063848)) b!1555206))

(declare-fun m!1433515 () Bool)

(assert (=> d!161787 m!1433515))

(declare-fun m!1433517 () Bool)

(assert (=> b!1555204 m!1433517))

(assert (=> b!1555204 m!1433453))

(assert (=> b!1555204 m!1433453))

(declare-fun m!1433519 () Bool)

(assert (=> b!1555204 m!1433519))

(assert (=> b!1555206 m!1433453))

(assert (=> b!1555206 m!1433453))

(assert (=> b!1555206 m!1433519))

(assert (=> bm!71424 d!161787))

(declare-fun d!161789 () Bool)

(assert (=> d!161789 (= (validKeyInArray!0 (select (arr!50064 _keys!618) from!762)) (and (not (= (select (arr!50064 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50064 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1554920 d!161789))

(declare-fun d!161791 () Bool)

(assert (=> d!161791 (= (apply!1112 lt!670211 #b1000000000000000000000000000000000000000000000000000000000000000) (get!26081 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!44625 () Bool)

(assert (= bs!44625 d!161791))

(declare-fun m!1433521 () Bool)

(assert (=> bs!44625 m!1433521))

(assert (=> bs!44625 m!1433521))

(declare-fun m!1433523 () Bool)

(assert (=> bs!44625 m!1433523))

(assert (=> b!1554927 d!161791))

(declare-fun d!161793 () Bool)

(declare-fun e!865957 () Bool)

(assert (=> d!161793 e!865957))

(declare-fun res!1063849 () Bool)

(assert (=> d!161793 (=> res!1063849 e!865957)))

(declare-fun lt!670363 () Bool)

(assert (=> d!161793 (= res!1063849 (not lt!670363))))

(declare-fun lt!670364 () Bool)

(assert (=> d!161793 (= lt!670363 lt!670364)))

(declare-fun lt!670365 () Unit!51616)

(declare-fun e!865958 () Unit!51616)

(assert (=> d!161793 (= lt!670365 e!865958)))

(declare-fun c!143860 () Bool)

(assert (=> d!161793 (= c!143860 lt!670364)))

(assert (=> d!161793 (= lt!670364 (containsKey!754 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161793 (= (contains!10173 lt!670211 #b1000000000000000000000000000000000000000000000000000000000000000) lt!670363)))

(declare-fun b!1555207 () Bool)

(declare-fun lt!670362 () Unit!51616)

(assert (=> b!1555207 (= e!865958 lt!670362)))

(assert (=> b!1555207 (= lt!670362 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1555207 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555208 () Bool)

(declare-fun Unit!51628 () Unit!51616)

(assert (=> b!1555208 (= e!865958 Unit!51628)))

(declare-fun b!1555209 () Bool)

(assert (=> b!1555209 (= e!865957 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161793 c!143860) b!1555207))

(assert (= (and d!161793 (not c!143860)) b!1555208))

(assert (= (and d!161793 (not res!1063849)) b!1555209))

(declare-fun m!1433525 () Bool)

(assert (=> d!161793 m!1433525))

(declare-fun m!1433527 () Bool)

(assert (=> b!1555207 m!1433527))

(assert (=> b!1555207 m!1433521))

(assert (=> b!1555207 m!1433521))

(declare-fun m!1433529 () Bool)

(assert (=> b!1555207 m!1433529))

(assert (=> b!1555209 m!1433521))

(assert (=> b!1555209 m!1433521))

(assert (=> b!1555209 m!1433529))

(assert (=> bm!71427 d!161793))

(declare-fun b!1555217 () Bool)

(declare-fun e!865963 () Bool)

(assert (=> b!1555217 (= e!865963 tp_is_empty!38209)))

(declare-fun mapNonEmpty!59038 () Bool)

(declare-fun mapRes!59038 () Bool)

(declare-fun tp!112078 () Bool)

(declare-fun e!865964 () Bool)

(assert (=> mapNonEmpty!59038 (= mapRes!59038 (and tp!112078 e!865964))))

(declare-fun mapValue!59038 () ValueCell!18194)

(declare-fun mapRest!59038 () (Array (_ BitVec 32) ValueCell!18194))

(declare-fun mapKey!59038 () (_ BitVec 32))

(assert (=> mapNonEmpty!59038 (= mapRest!59029 (store mapRest!59038 mapKey!59038 mapValue!59038))))

(declare-fun condMapEmpty!59038 () Bool)

(declare-fun mapDefault!59038 () ValueCell!18194)

(assert (=> mapNonEmpty!59029 (= condMapEmpty!59038 (= mapRest!59029 ((as const (Array (_ BitVec 32) ValueCell!18194)) mapDefault!59038)))))

(assert (=> mapNonEmpty!59029 (= tp!112063 (and e!865963 mapRes!59038))))

(declare-fun mapIsEmpty!59038 () Bool)

(assert (=> mapIsEmpty!59038 mapRes!59038))

(declare-fun b!1555216 () Bool)

(assert (=> b!1555216 (= e!865964 tp_is_empty!38209)))

(assert (= (and mapNonEmpty!59029 condMapEmpty!59038) mapIsEmpty!59038))

(assert (= (and mapNonEmpty!59029 (not condMapEmpty!59038)) mapNonEmpty!59038))

(assert (= (and mapNonEmpty!59038 ((_ is ValueCellFull!18194) mapValue!59038)) b!1555216))

(assert (= (and mapNonEmpty!59029 ((_ is ValueCellFull!18194) mapDefault!59038)) b!1555217))

(declare-fun m!1433531 () Bool)

(assert (=> mapNonEmpty!59038 m!1433531))

(declare-fun b_lambda!24793 () Bool)

(assert (= b_lambda!24789 (or (and start!132718 b_free!31933) b_lambda!24793)))

(declare-fun b_lambda!24795 () Bool)

(assert (= b_lambda!24791 (or (and start!132718 b_free!31933) b_lambda!24795)))

(check-sat (not b!1555207) (not b!1555146) (not d!161765) (not d!161779) (not d!161787) (not b!1555151) (not b!1555200) (not bm!71478) (not d!161751) (not b_lambda!24787) (not b!1555152) (not d!161771) (not d!161793) (not b!1555170) (not b!1555209) (not b!1555186) (not d!161769) (not b_lambda!24793) (not b!1555188) (not b!1555109) (not b!1555177) (not b!1555206) (not d!161775) (not d!161759) b_and!51387 (not d!161755) (not b!1555145) (not b!1555143) (not d!161781) tp_is_empty!38209 (not d!161757) (not d!161783) (not d!161767) (not b!1555203) (not b!1555115) (not b!1555150) (not d!161791) (not b!1555185) (not b!1555148) (not b!1555159) (not d!161777) (not b_next!31933) (not d!161763) (not b!1555175) (not bm!71472) (not b!1555178) (not b!1555161) (not b!1555144) (not b!1555202) (not b!1555110) (not b!1555172) (not b!1555184) (not b!1555204) (not mapNonEmpty!59038) (not b_lambda!24795) (not bm!71475) (not b!1555174) (not b!1555116) (not d!161773))
(check-sat b_and!51387 (not b_next!31933))
(get-model)

(declare-fun d!161795 () Bool)

(declare-fun isEmpty!1136 (Option!803) Bool)

(assert (=> d!161795 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun bs!44626 () Bool)

(assert (= bs!44626 d!161795))

(assert (=> bs!44626 m!1433383))

(declare-fun m!1433533 () Bool)

(assert (=> bs!44626 m!1433533))

(assert (=> b!1555161 d!161795))

(declare-fun d!161797 () Bool)

(declare-fun c!143865 () Bool)

(assert (=> d!161797 (= c!143865 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (= (_1!12408 (h!37701 (toList!11221 lt!670211))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!865969 () Option!803)

(assert (=> d!161797 (= (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)) e!865969)))

(declare-fun b!1555228 () Bool)

(declare-fun e!865970 () Option!803)

(assert (=> b!1555228 (= e!865970 (getValueByKey!728 (t!50950 (toList!11221 lt!670211)) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555227 () Bool)

(assert (=> b!1555227 (= e!865969 e!865970)))

(declare-fun c!143866 () Bool)

(assert (=> b!1555227 (= c!143866 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670211))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555226 () Bool)

(assert (=> b!1555226 (= e!865969 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670211)))))))

(declare-fun b!1555229 () Bool)

(assert (=> b!1555229 (= e!865970 None!801)))

(assert (= (and d!161797 c!143865) b!1555226))

(assert (= (and d!161797 (not c!143865)) b!1555227))

(assert (= (and b!1555227 c!143866) b!1555228))

(assert (= (and b!1555227 (not c!143866)) b!1555229))

(assert (=> b!1555228 m!1433213))

(declare-fun m!1433535 () Bool)

(assert (=> b!1555228 m!1433535))

(assert (=> b!1555161 d!161797))

(declare-fun d!161799 () Bool)

(declare-fun c!143867 () Bool)

(assert (=> d!161799 (= c!143867 (and ((_ is Cons!36238) (toList!11221 lt!670344)) (= (_1!12408 (h!37701 (toList!11221 lt!670344))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!865971 () Option!803)

(assert (=> d!161799 (= (getValueByKey!728 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!865971)))

(declare-fun b!1555232 () Bool)

(declare-fun e!865972 () Option!803)

(assert (=> b!1555232 (= e!865972 (getValueByKey!728 (t!50950 (toList!11221 lt!670344)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555231 () Bool)

(assert (=> b!1555231 (= e!865971 e!865972)))

(declare-fun c!143868 () Bool)

(assert (=> b!1555231 (= c!143868 (and ((_ is Cons!36238) (toList!11221 lt!670344)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670344))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555230 () Bool)

(assert (=> b!1555230 (= e!865971 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670344)))))))

(declare-fun b!1555233 () Bool)

(assert (=> b!1555233 (= e!865972 None!801)))

(assert (= (and d!161799 c!143867) b!1555230))

(assert (= (and d!161799 (not c!143867)) b!1555231))

(assert (= (and b!1555231 c!143868) b!1555232))

(assert (= (and b!1555231 (not c!143868)) b!1555233))

(declare-fun m!1433537 () Bool)

(assert (=> b!1555232 m!1433537))

(assert (=> b!1555177 d!161799))

(declare-fun b!1555234 () Bool)

(declare-fun e!865977 () ListLongMap!22411)

(assert (=> b!1555234 (= e!865977 (ListLongMap!22412 Nil!36239))))

(declare-fun b!1555235 () Bool)

(declare-fun e!865978 () ListLongMap!22411)

(declare-fun call!71482 () ListLongMap!22411)

(assert (=> b!1555235 (= e!865978 call!71482)))

(declare-fun b!1555236 () Bool)

(declare-fun e!865979 () Bool)

(declare-fun e!865974 () Bool)

(assert (=> b!1555236 (= e!865979 e!865974)))

(assert (=> b!1555236 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun res!1063850 () Bool)

(declare-fun lt!670368 () ListLongMap!22411)

(assert (=> b!1555236 (= res!1063850 (contains!10173 lt!670368 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1555236 (=> (not res!1063850) (not e!865974))))

(declare-fun d!161801 () Bool)

(declare-fun e!865975 () Bool)

(assert (=> d!161801 e!865975))

(declare-fun res!1063853 () Bool)

(assert (=> d!161801 (=> (not res!1063853) (not e!865975))))

(assert (=> d!161801 (= res!1063853 (not (contains!10173 lt!670368 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161801 (= lt!670368 e!865977)))

(declare-fun c!143870 () Bool)

(assert (=> d!161801 (= c!143870 (bvsge (bvadd from!762 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(assert (=> d!161801 (validMask!0 mask!926)))

(assert (=> d!161801 (= (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478) lt!670368)))

(declare-fun b!1555237 () Bool)

(assert (=> b!1555237 (= e!865977 e!865978)))

(declare-fun c!143869 () Bool)

(assert (=> b!1555237 (= c!143869 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun bm!71479 () Bool)

(assert (=> bm!71479 (= call!71482 (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1555238 () Bool)

(declare-fun lt!670370 () Unit!51616)

(declare-fun lt!670372 () Unit!51616)

(assert (=> b!1555238 (= lt!670370 lt!670372)))

(declare-fun lt!670367 () ListLongMap!22411)

(declare-fun lt!670366 () (_ BitVec 64))

(declare-fun lt!670371 () (_ BitVec 64))

(declare-fun lt!670369 () V!59389)

(assert (=> b!1555238 (not (contains!10173 (+!5049 lt!670367 (tuple2!24795 lt!670366 lt!670369)) lt!670371))))

(assert (=> b!1555238 (= lt!670372 (addStillNotContains!514 lt!670367 lt!670366 lt!670369 lt!670371))))

(assert (=> b!1555238 (= lt!670371 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1555238 (= lt!670369 (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1555238 (= lt!670366 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))

(assert (=> b!1555238 (= lt!670367 call!71482)))

(assert (=> b!1555238 (= e!865978 (+!5049 call!71482 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1555239 () Bool)

(assert (=> b!1555239 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(assert (=> b!1555239 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50616 _values!470)))))

(assert (=> b!1555239 (= e!865974 (= (apply!1112 lt!670368 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555240 () Bool)

(declare-fun e!865973 () Bool)

(assert (=> b!1555240 (= e!865979 e!865973)))

(declare-fun c!143871 () Bool)

(assert (=> b!1555240 (= c!143871 (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun b!1555241 () Bool)

(declare-fun e!865976 () Bool)

(assert (=> b!1555241 (= e!865976 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1555241 (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1555242 () Bool)

(assert (=> b!1555242 (= e!865975 e!865979)))

(declare-fun c!143872 () Bool)

(assert (=> b!1555242 (= c!143872 e!865976)))

(declare-fun res!1063851 () Bool)

(assert (=> b!1555242 (=> (not res!1063851) (not e!865976))))

(assert (=> b!1555242 (= res!1063851 (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun b!1555243 () Bool)

(assert (=> b!1555243 (= e!865973 (isEmpty!1135 lt!670368))))

(declare-fun b!1555244 () Bool)

(declare-fun res!1063852 () Bool)

(assert (=> b!1555244 (=> (not res!1063852) (not e!865975))))

(assert (=> b!1555244 (= res!1063852 (not (contains!10173 lt!670368 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555245 () Bool)

(assert (=> b!1555245 (= e!865973 (= lt!670368 (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478)))))

(assert (= (and d!161801 c!143870) b!1555234))

(assert (= (and d!161801 (not c!143870)) b!1555237))

(assert (= (and b!1555237 c!143869) b!1555238))

(assert (= (and b!1555237 (not c!143869)) b!1555235))

(assert (= (or b!1555238 b!1555235) bm!71479))

(assert (= (and d!161801 res!1063853) b!1555244))

(assert (= (and b!1555244 res!1063852) b!1555242))

(assert (= (and b!1555242 res!1063851) b!1555241))

(assert (= (and b!1555242 c!143872) b!1555236))

(assert (= (and b!1555242 (not c!143872)) b!1555240))

(assert (= (and b!1555236 res!1063850) b!1555239))

(assert (= (and b!1555240 c!143871) b!1555245))

(assert (= (and b!1555240 (not c!143871)) b!1555243))

(declare-fun b_lambda!24797 () Bool)

(assert (=> (not b_lambda!24797) (not b!1555238)))

(assert (=> b!1555238 t!50949))

(declare-fun b_and!51389 () Bool)

(assert (= b_and!51387 (and (=> t!50949 result!26077) b_and!51389)))

(declare-fun b_lambda!24799 () Bool)

(assert (=> (not b_lambda!24799) (not b!1555239)))

(assert (=> b!1555239 t!50949))

(declare-fun b_and!51391 () Bool)

(assert (= b_and!51389 (and (=> t!50949 result!26077) b_and!51391)))

(declare-fun m!1433539 () Bool)

(assert (=> b!1555241 m!1433539))

(assert (=> b!1555241 m!1433539))

(declare-fun m!1433541 () Bool)

(assert (=> b!1555241 m!1433541))

(declare-fun m!1433543 () Bool)

(assert (=> d!161801 m!1433543))

(assert (=> d!161801 m!1433259))

(declare-fun m!1433545 () Bool)

(assert (=> b!1555238 m!1433545))

(assert (=> b!1555238 m!1433251))

(declare-fun m!1433547 () Bool)

(assert (=> b!1555238 m!1433547))

(assert (=> b!1555238 m!1433545))

(declare-fun m!1433549 () Bool)

(assert (=> b!1555238 m!1433549))

(declare-fun m!1433551 () Bool)

(assert (=> b!1555238 m!1433551))

(declare-fun m!1433553 () Bool)

(assert (=> b!1555238 m!1433553))

(assert (=> b!1555238 m!1433551))

(assert (=> b!1555238 m!1433539))

(assert (=> b!1555238 m!1433251))

(declare-fun m!1433555 () Bool)

(assert (=> b!1555238 m!1433555))

(declare-fun m!1433557 () Bool)

(assert (=> b!1555243 m!1433557))

(assert (=> b!1555239 m!1433545))

(assert (=> b!1555239 m!1433251))

(assert (=> b!1555239 m!1433547))

(assert (=> b!1555239 m!1433545))

(assert (=> b!1555239 m!1433251))

(assert (=> b!1555239 m!1433539))

(declare-fun m!1433559 () Bool)

(assert (=> b!1555239 m!1433559))

(assert (=> b!1555239 m!1433539))

(declare-fun m!1433561 () Bool)

(assert (=> bm!71479 m!1433561))

(assert (=> b!1555236 m!1433539))

(assert (=> b!1555236 m!1433539))

(declare-fun m!1433563 () Bool)

(assert (=> b!1555236 m!1433563))

(assert (=> b!1555245 m!1433561))

(assert (=> b!1555237 m!1433539))

(assert (=> b!1555237 m!1433539))

(assert (=> b!1555237 m!1433541))

(declare-fun m!1433565 () Bool)

(assert (=> b!1555244 m!1433565))

(assert (=> b!1555152 d!161801))

(declare-fun d!161803 () Bool)

(assert (=> d!161803 (= (get!26081 (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762))) (v!21982 (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161779 d!161803))

(declare-fun d!161805 () Bool)

(declare-fun c!143873 () Bool)

(assert (=> d!161805 (= c!143873 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (= (_1!12408 (h!37701 (toList!11221 lt!670212))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!865980 () Option!803)

(assert (=> d!161805 (= (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)) e!865980)))

(declare-fun b!1555248 () Bool)

(declare-fun e!865981 () Option!803)

(assert (=> b!1555248 (= e!865981 (getValueByKey!728 (t!50950 (toList!11221 lt!670212)) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555247 () Bool)

(assert (=> b!1555247 (= e!865980 e!865981)))

(declare-fun c!143874 () Bool)

(assert (=> b!1555247 (= c!143874 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670212))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555246 () Bool)

(assert (=> b!1555246 (= e!865980 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670212)))))))

(declare-fun b!1555249 () Bool)

(assert (=> b!1555249 (= e!865981 None!801)))

(assert (= (and d!161805 c!143873) b!1555246))

(assert (= (and d!161805 (not c!143873)) b!1555247))

(assert (= (and b!1555247 c!143874) b!1555248))

(assert (= (and b!1555247 (not c!143874)) b!1555249))

(assert (=> b!1555248 m!1433213))

(declare-fun m!1433567 () Bool)

(assert (=> b!1555248 m!1433567))

(assert (=> d!161779 d!161805))

(declare-fun d!161807 () Bool)

(assert (=> d!161807 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670375 () Unit!51616)

(declare-fun choose!2032 (List!36242 (_ BitVec 64)) Unit!51616)

(assert (=> d!161807 (= lt!670375 (choose!2032 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))

(declare-fun e!865984 () Bool)

(assert (=> d!161807 e!865984))

(declare-fun res!1063856 () Bool)

(assert (=> d!161807 (=> (not res!1063856) (not e!865984))))

(declare-fun isStrictlySorted!875 (List!36242) Bool)

(assert (=> d!161807 (= res!1063856 (isStrictlySorted!875 (toList!11221 lt!670211)))))

(assert (=> d!161807 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)) lt!670375)))

(declare-fun b!1555252 () Bool)

(assert (=> b!1555252 (= e!865984 (containsKey!754 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!161807 res!1063856) b!1555252))

(assert (=> d!161807 m!1433213))

(assert (=> d!161807 m!1433383))

(assert (=> d!161807 m!1433383))

(assert (=> d!161807 m!1433427))

(assert (=> d!161807 m!1433213))

(declare-fun m!1433569 () Bool)

(assert (=> d!161807 m!1433569))

(declare-fun m!1433571 () Bool)

(assert (=> d!161807 m!1433571))

(assert (=> b!1555252 m!1433213))

(assert (=> b!1555252 m!1433423))

(assert (=> b!1555159 d!161807))

(assert (=> b!1555159 d!161795))

(assert (=> b!1555159 d!161797))

(declare-fun d!161809 () Bool)

(assert (=> d!161809 (= (get!26083 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1555110 d!161809))

(declare-fun d!161811 () Bool)

(assert (=> d!161811 (= (get!26081 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762))) (v!21982 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161771 d!161811))

(declare-fun c!143875 () Bool)

(declare-fun d!161813 () Bool)

(assert (=> d!161813 (= c!143875 (and ((_ is Cons!36238) (toList!11221 lt!670204)) (= (_1!12408 (h!37701 (toList!11221 lt!670204))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!865985 () Option!803)

(assert (=> d!161813 (= (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)) e!865985)))

(declare-fun e!865986 () Option!803)

(declare-fun b!1555255 () Bool)

(assert (=> b!1555255 (= e!865986 (getValueByKey!728 (t!50950 (toList!11221 lt!670204)) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555254 () Bool)

(assert (=> b!1555254 (= e!865985 e!865986)))

(declare-fun c!143876 () Bool)

(assert (=> b!1555254 (= c!143876 (and ((_ is Cons!36238) (toList!11221 lt!670204)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670204))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555253 () Bool)

(assert (=> b!1555253 (= e!865985 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670204)))))))

(declare-fun b!1555256 () Bool)

(assert (=> b!1555256 (= e!865986 None!801)))

(assert (= (and d!161813 c!143875) b!1555253))

(assert (= (and d!161813 (not c!143875)) b!1555254))

(assert (= (and b!1555254 c!143876) b!1555255))

(assert (= (and b!1555254 (not c!143876)) b!1555256))

(assert (=> b!1555255 m!1433213))

(declare-fun m!1433573 () Bool)

(assert (=> b!1555255 m!1433573))

(assert (=> d!161771 d!161813))

(declare-fun d!161815 () Bool)

(declare-fun res!1063861 () Bool)

(declare-fun e!865991 () Bool)

(assert (=> d!161815 (=> res!1063861 e!865991)))

(assert (=> d!161815 (= res!1063861 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (= (_1!12408 (h!37701 (toList!11221 lt!670211))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161815 (= (containsKey!754 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000) e!865991)))

(declare-fun b!1555261 () Bool)

(declare-fun e!865992 () Bool)

(assert (=> b!1555261 (= e!865991 e!865992)))

(declare-fun res!1063862 () Bool)

(assert (=> b!1555261 (=> (not res!1063862) (not e!865992))))

(assert (=> b!1555261 (= res!1063862 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670211))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670211))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36238) (toList!11221 lt!670211)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670211))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555262 () Bool)

(assert (=> b!1555262 (= e!865992 (containsKey!754 (t!50950 (toList!11221 lt!670211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161815 (not res!1063861)) b!1555261))

(assert (= (and b!1555261 res!1063862) b!1555262))

(declare-fun m!1433575 () Bool)

(assert (=> b!1555262 m!1433575))

(assert (=> d!161787 d!161815))

(declare-fun d!161817 () Bool)

(declare-fun isEmpty!1137 (List!36242) Bool)

(assert (=> d!161817 (= (isEmpty!1135 lt!670309) (isEmpty!1137 (toList!11221 lt!670309)))))

(declare-fun bs!44627 () Bool)

(assert (= bs!44627 d!161817))

(declare-fun m!1433577 () Bool)

(assert (=> bs!44627 m!1433577))

(assert (=> b!1555150 d!161817))

(declare-fun d!161819 () Bool)

(assert (=> d!161819 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44628 () Bool)

(assert (= bs!44628 d!161819))

(assert (=> bs!44628 m!1433521))

(declare-fun m!1433579 () Bool)

(assert (=> bs!44628 m!1433579))

(assert (=> b!1555209 d!161819))

(declare-fun d!161821 () Bool)

(declare-fun c!143877 () Bool)

(assert (=> d!161821 (= c!143877 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (= (_1!12408 (h!37701 (toList!11221 lt!670211))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!865993 () Option!803)

(assert (=> d!161821 (= (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000) e!865993)))

(declare-fun b!1555265 () Bool)

(declare-fun e!865994 () Option!803)

(assert (=> b!1555265 (= e!865994 (getValueByKey!728 (t!50950 (toList!11221 lt!670211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555264 () Bool)

(assert (=> b!1555264 (= e!865993 e!865994)))

(declare-fun c!143878 () Bool)

(assert (=> b!1555264 (= c!143878 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670211))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555263 () Bool)

(assert (=> b!1555263 (= e!865993 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670211)))))))

(declare-fun b!1555266 () Bool)

(assert (=> b!1555266 (= e!865994 None!801)))

(assert (= (and d!161821 c!143877) b!1555263))

(assert (= (and d!161821 (not c!143877)) b!1555264))

(assert (= (and b!1555264 c!143878) b!1555265))

(assert (= (and b!1555264 (not c!143878)) b!1555266))

(declare-fun m!1433581 () Bool)

(assert (=> b!1555265 m!1433581))

(assert (=> b!1555209 d!161821))

(declare-fun d!161823 () Bool)

(declare-fun c!143879 () Bool)

(assert (=> d!161823 (= c!143879 (and ((_ is Cons!36238) (toList!11221 lt!670337)) (= (_1!12408 (h!37701 (toList!11221 lt!670337))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!865995 () Option!803)

(assert (=> d!161823 (= (getValueByKey!728 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!865995)))

(declare-fun b!1555269 () Bool)

(declare-fun e!865996 () Option!803)

(assert (=> b!1555269 (= e!865996 (getValueByKey!728 (t!50950 (toList!11221 lt!670337)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555268 () Bool)

(assert (=> b!1555268 (= e!865995 e!865996)))

(declare-fun c!143880 () Bool)

(assert (=> b!1555268 (= c!143880 (and ((_ is Cons!36238) (toList!11221 lt!670337)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670337))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555267 () Bool)

(assert (=> b!1555267 (= e!865995 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670337)))))))

(declare-fun b!1555270 () Bool)

(assert (=> b!1555270 (= e!865996 None!801)))

(assert (= (and d!161823 c!143879) b!1555267))

(assert (= (and d!161823 (not c!143879)) b!1555268))

(assert (= (and b!1555268 c!143880) b!1555269))

(assert (= (and b!1555268 (not c!143880)) b!1555270))

(declare-fun m!1433583 () Bool)

(assert (=> b!1555269 m!1433583))

(assert (=> b!1555174 d!161823))

(declare-fun c!143881 () Bool)

(declare-fun d!161825 () Bool)

(assert (=> d!161825 (= c!143881 (and ((_ is Cons!36238) (toList!11221 lt!670291)) (= (_1!12408 (h!37701 (toList!11221 lt!670291))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!865997 () Option!803)

(assert (=> d!161825 (= (getValueByKey!728 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!865997)))

(declare-fun e!865998 () Option!803)

(declare-fun b!1555273 () Bool)

(assert (=> b!1555273 (= e!865998 (getValueByKey!728 (t!50950 (toList!11221 lt!670291)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555272 () Bool)

(assert (=> b!1555272 (= e!865997 e!865998)))

(declare-fun c!143882 () Bool)

(assert (=> b!1555272 (= c!143882 (and ((_ is Cons!36238) (toList!11221 lt!670291)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670291))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1555271 () Bool)

(assert (=> b!1555271 (= e!865997 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670291)))))))

(declare-fun b!1555274 () Bool)

(assert (=> b!1555274 (= e!865998 None!801)))

(assert (= (and d!161825 c!143881) b!1555271))

(assert (= (and d!161825 (not c!143881)) b!1555272))

(assert (= (and b!1555272 c!143882) b!1555273))

(assert (= (and b!1555272 (not c!143882)) b!1555274))

(declare-fun m!1433585 () Bool)

(assert (=> b!1555273 m!1433585))

(assert (=> b!1555115 d!161825))

(declare-fun d!161827 () Bool)

(assert (=> d!161827 (= (apply!1112 lt!670309 (select (arr!50064 _keys!618) from!762)) (get!26081 (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762))))))

(declare-fun bs!44629 () Bool)

(assert (= bs!44629 d!161827))

(assert (=> bs!44629 m!1433213))

(declare-fun m!1433587 () Bool)

(assert (=> bs!44629 m!1433587))

(assert (=> bs!44629 m!1433587))

(declare-fun m!1433589 () Bool)

(assert (=> bs!44629 m!1433589))

(assert (=> b!1555146 d!161827))

(assert (=> b!1555146 d!161753))

(declare-fun d!161829 () Bool)

(declare-fun c!143883 () Bool)

(assert (=> d!161829 (= c!143883 (and ((_ is Cons!36238) (toList!11221 lt!670352)) (= (_1!12408 (h!37701 (toList!11221 lt!670352))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!865999 () Option!803)

(assert (=> d!161829 (= (getValueByKey!728 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!865999)))

(declare-fun b!1555277 () Bool)

(declare-fun e!866000 () Option!803)

(assert (=> b!1555277 (= e!866000 (getValueByKey!728 (t!50950 (toList!11221 lt!670352)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1555276 () Bool)

(assert (=> b!1555276 (= e!865999 e!866000)))

(declare-fun c!143884 () Bool)

(assert (=> b!1555276 (= c!143884 (and ((_ is Cons!36238) (toList!11221 lt!670352)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670352))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun b!1555275 () Bool)

(assert (=> b!1555275 (= e!865999 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670352)))))))

(declare-fun b!1555278 () Bool)

(assert (=> b!1555278 (= e!866000 None!801)))

(assert (= (and d!161829 c!143883) b!1555275))

(assert (= (and d!161829 (not c!143883)) b!1555276))

(assert (= (and b!1555276 c!143884) b!1555277))

(assert (= (and b!1555276 (not c!143884)) b!1555278))

(declare-fun m!1433591 () Bool)

(assert (=> b!1555277 m!1433591))

(assert (=> b!1555184 d!161829))

(assert (=> b!1555148 d!161789))

(declare-fun d!161831 () Bool)

(assert (=> d!161831 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!670376 () Unit!51616)

(assert (=> d!161831 (= lt!670376 (choose!2032 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!866001 () Bool)

(assert (=> d!161831 e!866001))

(declare-fun res!1063863 () Bool)

(assert (=> d!161831 (=> (not res!1063863) (not e!866001))))

(assert (=> d!161831 (= res!1063863 (isStrictlySorted!875 (toList!11221 lt!670211)))))

(assert (=> d!161831 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000) lt!670376)))

(declare-fun b!1555279 () Bool)

(assert (=> b!1555279 (= e!866001 (containsKey!754 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161831 res!1063863) b!1555279))

(assert (=> d!161831 m!1433521))

(assert (=> d!161831 m!1433521))

(assert (=> d!161831 m!1433529))

(declare-fun m!1433593 () Bool)

(assert (=> d!161831 m!1433593))

(assert (=> d!161831 m!1433571))

(assert (=> b!1555279 m!1433525))

(assert (=> b!1555207 d!161831))

(assert (=> b!1555207 d!161819))

(assert (=> b!1555207 d!161821))

(declare-fun d!161833 () Bool)

(assert (=> d!161833 (= (get!26081 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762))) (v!21982 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161751 d!161833))

(assert (=> d!161751 d!161797))

(declare-fun d!161835 () Bool)

(declare-fun e!866002 () Bool)

(assert (=> d!161835 e!866002))

(declare-fun res!1063864 () Bool)

(assert (=> d!161835 (=> res!1063864 e!866002)))

(declare-fun lt!670378 () Bool)

(assert (=> d!161835 (= res!1063864 (not lt!670378))))

(declare-fun lt!670379 () Bool)

(assert (=> d!161835 (= lt!670378 lt!670379)))

(declare-fun lt!670380 () Unit!51616)

(declare-fun e!866003 () Unit!51616)

(assert (=> d!161835 (= lt!670380 e!866003)))

(declare-fun c!143885 () Bool)

(assert (=> d!161835 (= c!143885 lt!670379)))

(assert (=> d!161835 (= lt!670379 (containsKey!754 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161835 (= (contains!10173 lt!670344 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670378)))

(declare-fun b!1555280 () Bool)

(declare-fun lt!670377 () Unit!51616)

(assert (=> b!1555280 (= e!866003 lt!670377)))

(assert (=> b!1555280 (= lt!670377 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> b!1555280 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555281 () Bool)

(declare-fun Unit!51629 () Unit!51616)

(assert (=> b!1555281 (= e!866003 Unit!51629)))

(declare-fun b!1555282 () Bool)

(assert (=> b!1555282 (= e!866002 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161835 c!143885) b!1555280))

(assert (= (and d!161835 (not c!143885)) b!1555281))

(assert (= (and d!161835 (not res!1063864)) b!1555282))

(declare-fun m!1433595 () Bool)

(assert (=> d!161835 m!1433595))

(declare-fun m!1433597 () Bool)

(assert (=> b!1555280 m!1433597))

(assert (=> b!1555280 m!1433471))

(assert (=> b!1555280 m!1433471))

(declare-fun m!1433599 () Bool)

(assert (=> b!1555280 m!1433599))

(assert (=> b!1555282 m!1433471))

(assert (=> b!1555282 m!1433471))

(assert (=> b!1555282 m!1433599))

(assert (=> d!161769 d!161835))

(declare-fun d!161837 () Bool)

(declare-fun c!143886 () Bool)

(assert (=> d!161837 (= c!143886 (and ((_ is Cons!36238) lt!670345) (= (_1!12408 (h!37701 lt!670345)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866004 () Option!803)

(assert (=> d!161837 (= (getValueByKey!728 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866004)))

(declare-fun b!1555285 () Bool)

(declare-fun e!866005 () Option!803)

(assert (=> b!1555285 (= e!866005 (getValueByKey!728 (t!50950 lt!670345) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555284 () Bool)

(assert (=> b!1555284 (= e!866004 e!866005)))

(declare-fun c!143887 () Bool)

(assert (=> b!1555284 (= c!143887 (and ((_ is Cons!36238) lt!670345) (not (= (_1!12408 (h!37701 lt!670345)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555283 () Bool)

(assert (=> b!1555283 (= e!866004 (Some!802 (_2!12408 (h!37701 lt!670345))))))

(declare-fun b!1555286 () Bool)

(assert (=> b!1555286 (= e!866005 None!801)))

(assert (= (and d!161837 c!143886) b!1555283))

(assert (= (and d!161837 (not c!143886)) b!1555284))

(assert (= (and b!1555284 c!143887) b!1555285))

(assert (= (and b!1555284 (not c!143887)) b!1555286))

(declare-fun m!1433601 () Bool)

(assert (=> b!1555285 m!1433601))

(assert (=> d!161769 d!161837))

(declare-fun d!161839 () Bool)

(assert (=> d!161839 (= (getValueByKey!728 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!670383 () Unit!51616)

(declare-fun choose!2033 (List!36242 (_ BitVec 64) V!59389) Unit!51616)

(assert (=> d!161839 (= lt!670383 (choose!2033 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!866008 () Bool)

(assert (=> d!161839 e!866008))

(declare-fun res!1063869 () Bool)

(assert (=> d!161839 (=> (not res!1063869) (not e!866008))))

(assert (=> d!161839 (= res!1063869 (isStrictlySorted!875 lt!670345))))

(assert (=> d!161839 (= (lemmaContainsTupThenGetReturnValue!375 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670383)))

(declare-fun b!1555291 () Bool)

(declare-fun res!1063870 () Bool)

(assert (=> b!1555291 (=> (not res!1063870) (not e!866008))))

(assert (=> b!1555291 (= res!1063870 (containsKey!754 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555292 () Bool)

(assert (=> b!1555292 (= e!866008 (contains!10176 lt!670345 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161839 res!1063869) b!1555291))

(assert (= (and b!1555291 res!1063870) b!1555292))

(assert (=> d!161839 m!1433465))

(declare-fun m!1433603 () Bool)

(assert (=> d!161839 m!1433603))

(declare-fun m!1433605 () Bool)

(assert (=> d!161839 m!1433605))

(declare-fun m!1433607 () Bool)

(assert (=> b!1555291 m!1433607))

(declare-fun m!1433609 () Bool)

(assert (=> b!1555292 m!1433609))

(assert (=> d!161769 d!161839))

(declare-fun b!1555313 () Bool)

(declare-fun e!866022 () List!36242)

(declare-fun call!71489 () List!36242)

(assert (=> b!1555313 (= e!866022 call!71489)))

(declare-fun b!1555314 () Bool)

(declare-fun c!143896 () Bool)

(assert (=> b!1555314 (= c!143896 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (bvsgt (_1!12408 (h!37701 (toList!11221 lt!670212))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866019 () List!36242)

(assert (=> b!1555314 (= e!866019 e!866022)))

(declare-fun b!1555315 () Bool)

(declare-fun e!866023 () List!36242)

(assert (=> b!1555315 (= e!866023 e!866019)))

(declare-fun c!143897 () Bool)

(assert (=> b!1555315 (= c!143897 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (= (_1!12408 (h!37701 (toList!11221 lt!670212))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866021 () List!36242)

(declare-fun b!1555316 () Bool)

(assert (=> b!1555316 (= e!866021 (ite c!143897 (t!50950 (toList!11221 lt!670212)) (ite c!143896 (Cons!36238 (h!37701 (toList!11221 lt!670212)) (t!50950 (toList!11221 lt!670212))) Nil!36239)))))

(declare-fun b!1555317 () Bool)

(declare-fun call!71490 () List!36242)

(assert (=> b!1555317 (= e!866023 call!71490)))

(declare-fun b!1555318 () Bool)

(declare-fun call!71491 () List!36242)

(assert (=> b!1555318 (= e!866019 call!71491)))

(declare-fun b!1555319 () Bool)

(declare-fun res!1063875 () Bool)

(declare-fun e!866020 () Bool)

(assert (=> b!1555319 (=> (not res!1063875) (not e!866020))))

(declare-fun lt!670386 () List!36242)

(assert (=> b!1555319 (= res!1063875 (containsKey!754 lt!670386 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555320 () Bool)

(assert (=> b!1555320 (= e!866022 call!71489)))

(declare-fun d!161841 () Bool)

(assert (=> d!161841 e!866020))

(declare-fun res!1063876 () Bool)

(assert (=> d!161841 (=> (not res!1063876) (not e!866020))))

(assert (=> d!161841 (= res!1063876 (isStrictlySorted!875 lt!670386))))

(assert (=> d!161841 (= lt!670386 e!866023)))

(declare-fun c!143898 () Bool)

(assert (=> d!161841 (= c!143898 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670212))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161841 (isStrictlySorted!875 (toList!11221 lt!670212))))

(assert (=> d!161841 (= (insertStrictlySorted!504 (toList!11221 lt!670212) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670386)))

(declare-fun bm!71486 () Bool)

(assert (=> bm!71486 (= call!71491 call!71490)))

(declare-fun bm!71487 () Bool)

(assert (=> bm!71487 (= call!71489 call!71491)))

(declare-fun b!1555321 () Bool)

(assert (=> b!1555321 (= e!866020 (contains!10176 lt!670386 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555322 () Bool)

(assert (=> b!1555322 (= e!866021 (insertStrictlySorted!504 (t!50950 (toList!11221 lt!670212)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71488 () Bool)

(declare-fun $colon$colon!943 (List!36242 tuple2!24794) List!36242)

(assert (=> bm!71488 (= call!71490 ($colon$colon!943 e!866021 (ite c!143898 (h!37701 (toList!11221 lt!670212)) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143899 () Bool)

(assert (=> bm!71488 (= c!143899 c!143898)))

(assert (= (and d!161841 c!143898) b!1555317))

(assert (= (and d!161841 (not c!143898)) b!1555315))

(assert (= (and b!1555315 c!143897) b!1555318))

(assert (= (and b!1555315 (not c!143897)) b!1555314))

(assert (= (and b!1555314 c!143896) b!1555320))

(assert (= (and b!1555314 (not c!143896)) b!1555313))

(assert (= (or b!1555320 b!1555313) bm!71487))

(assert (= (or b!1555318 bm!71487) bm!71486))

(assert (= (or b!1555317 bm!71486) bm!71488))

(assert (= (and bm!71488 c!143899) b!1555322))

(assert (= (and bm!71488 (not c!143899)) b!1555316))

(assert (= (and d!161841 res!1063876) b!1555319))

(assert (= (and b!1555319 res!1063875) b!1555321))

(declare-fun m!1433611 () Bool)

(assert (=> b!1555321 m!1433611))

(declare-fun m!1433613 () Bool)

(assert (=> bm!71488 m!1433613))

(declare-fun m!1433615 () Bool)

(assert (=> b!1555319 m!1433615))

(declare-fun m!1433617 () Bool)

(assert (=> b!1555322 m!1433617))

(declare-fun m!1433619 () Bool)

(assert (=> d!161841 m!1433619))

(declare-fun m!1433621 () Bool)

(assert (=> d!161841 m!1433621))

(assert (=> d!161769 d!161841))

(assert (=> bm!71472 d!161801))

(declare-fun d!161843 () Bool)

(assert (=> d!161843 (= (get!26081 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21982 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161765 d!161843))

(declare-fun d!161845 () Bool)

(declare-fun c!143900 () Bool)

(assert (=> d!161845 (= c!143900 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (= (_1!12408 (h!37701 (toList!11221 lt!670211))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!866024 () Option!803)

(assert (=> d!161845 (= (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000) e!866024)))

(declare-fun b!1555325 () Bool)

(declare-fun e!866025 () Option!803)

(assert (=> b!1555325 (= e!866025 (getValueByKey!728 (t!50950 (toList!11221 lt!670211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555324 () Bool)

(assert (=> b!1555324 (= e!866024 e!866025)))

(declare-fun c!143901 () Bool)

(assert (=> b!1555324 (= c!143901 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670211))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555323 () Bool)

(assert (=> b!1555323 (= e!866024 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670211)))))))

(declare-fun b!1555326 () Bool)

(assert (=> b!1555326 (= e!866025 None!801)))

(assert (= (and d!161845 c!143900) b!1555323))

(assert (= (and d!161845 (not c!143900)) b!1555324))

(assert (= (and b!1555324 c!143901) b!1555325))

(assert (= (and b!1555324 (not c!143901)) b!1555326))

(declare-fun m!1433623 () Bool)

(assert (=> b!1555325 m!1433623))

(assert (=> d!161765 d!161845))

(declare-fun d!161847 () Bool)

(assert (=> d!161847 (= (validKeyInArray!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)) (and (not (= (select (arr!50064 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50064 _keys!618) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1555203 d!161847))

(declare-fun d!161849 () Bool)

(declare-fun e!866026 () Bool)

(assert (=> d!161849 e!866026))

(declare-fun res!1063877 () Bool)

(assert (=> d!161849 (=> res!1063877 e!866026)))

(declare-fun lt!670388 () Bool)

(assert (=> d!161849 (= res!1063877 (not lt!670388))))

(declare-fun lt!670389 () Bool)

(assert (=> d!161849 (= lt!670388 lt!670389)))

(declare-fun lt!670390 () Unit!51616)

(declare-fun e!866027 () Unit!51616)

(assert (=> d!161849 (= lt!670390 e!866027)))

(declare-fun c!143902 () Bool)

(assert (=> d!161849 (= c!143902 lt!670389)))

(assert (=> d!161849 (= lt!670389 (containsKey!754 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161849 (= (contains!10173 lt!670309 (select (arr!50064 _keys!618) from!762)) lt!670388)))

(declare-fun b!1555327 () Bool)

(declare-fun lt!670387 () Unit!51616)

(assert (=> b!1555327 (= e!866027 lt!670387)))

(assert (=> b!1555327 (= lt!670387 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)))))

(assert (=> b!1555327 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555328 () Bool)

(declare-fun Unit!51630 () Unit!51616)

(assert (=> b!1555328 (= e!866027 Unit!51630)))

(declare-fun b!1555329 () Bool)

(assert (=> b!1555329 (= e!866026 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762))))))

(assert (= (and d!161849 c!143902) b!1555327))

(assert (= (and d!161849 (not c!143902)) b!1555328))

(assert (= (and d!161849 (not res!1063877)) b!1555329))

(assert (=> d!161849 m!1433213))

(declare-fun m!1433625 () Bool)

(assert (=> d!161849 m!1433625))

(assert (=> b!1555327 m!1433213))

(declare-fun m!1433627 () Bool)

(assert (=> b!1555327 m!1433627))

(assert (=> b!1555327 m!1433213))

(assert (=> b!1555327 m!1433587))

(assert (=> b!1555327 m!1433587))

(declare-fun m!1433629 () Bool)

(assert (=> b!1555327 m!1433629))

(assert (=> b!1555329 m!1433213))

(assert (=> b!1555329 m!1433587))

(assert (=> b!1555329 m!1433587))

(assert (=> b!1555329 m!1433629))

(assert (=> b!1555143 d!161849))

(declare-fun d!161851 () Bool)

(declare-fun e!866028 () Bool)

(assert (=> d!161851 e!866028))

(declare-fun res!1063878 () Bool)

(assert (=> d!161851 (=> res!1063878 e!866028)))

(declare-fun lt!670392 () Bool)

(assert (=> d!161851 (= res!1063878 (not lt!670392))))

(declare-fun lt!670393 () Bool)

(assert (=> d!161851 (= lt!670392 lt!670393)))

(declare-fun lt!670394 () Unit!51616)

(declare-fun e!866029 () Unit!51616)

(assert (=> d!161851 (= lt!670394 e!866029)))

(declare-fun c!143903 () Bool)

(assert (=> d!161851 (= c!143903 lt!670393)))

(assert (=> d!161851 (= lt!670393 (containsKey!754 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161851 (= (contains!10173 lt!670337 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670392)))

(declare-fun b!1555330 () Bool)

(declare-fun lt!670391 () Unit!51616)

(assert (=> b!1555330 (= e!866029 lt!670391)))

(assert (=> b!1555330 (= lt!670391 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> b!1555330 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555331 () Bool)

(declare-fun Unit!51631 () Unit!51616)

(assert (=> b!1555331 (= e!866029 Unit!51631)))

(declare-fun b!1555332 () Bool)

(assert (=> b!1555332 (= e!866028 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161851 c!143903) b!1555330))

(assert (= (and d!161851 (not c!143903)) b!1555331))

(assert (= (and d!161851 (not res!1063878)) b!1555332))

(declare-fun m!1433631 () Bool)

(assert (=> d!161851 m!1433631))

(declare-fun m!1433633 () Bool)

(assert (=> b!1555330 m!1433633))

(assert (=> b!1555330 m!1433449))

(assert (=> b!1555330 m!1433449))

(declare-fun m!1433635 () Bool)

(assert (=> b!1555330 m!1433635))

(assert (=> b!1555332 m!1433449))

(assert (=> b!1555332 m!1433449))

(assert (=> b!1555332 m!1433635))

(assert (=> d!161763 d!161851))

(declare-fun d!161853 () Bool)

(declare-fun c!143904 () Bool)

(assert (=> d!161853 (= c!143904 (and ((_ is Cons!36238) lt!670338) (= (_1!12408 (h!37701 lt!670338)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866030 () Option!803)

(assert (=> d!161853 (= (getValueByKey!728 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866030)))

(declare-fun b!1555335 () Bool)

(declare-fun e!866031 () Option!803)

(assert (=> b!1555335 (= e!866031 (getValueByKey!728 (t!50950 lt!670338) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555334 () Bool)

(assert (=> b!1555334 (= e!866030 e!866031)))

(declare-fun c!143905 () Bool)

(assert (=> b!1555334 (= c!143905 (and ((_ is Cons!36238) lt!670338) (not (= (_1!12408 (h!37701 lt!670338)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555333 () Bool)

(assert (=> b!1555333 (= e!866030 (Some!802 (_2!12408 (h!37701 lt!670338))))))

(declare-fun b!1555336 () Bool)

(assert (=> b!1555336 (= e!866031 None!801)))

(assert (= (and d!161853 c!143904) b!1555333))

(assert (= (and d!161853 (not c!143904)) b!1555334))

(assert (= (and b!1555334 c!143905) b!1555335))

(assert (= (and b!1555334 (not c!143905)) b!1555336))

(declare-fun m!1433637 () Bool)

(assert (=> b!1555335 m!1433637))

(assert (=> d!161763 d!161853))

(declare-fun d!161855 () Bool)

(assert (=> d!161855 (= (getValueByKey!728 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!670395 () Unit!51616)

(assert (=> d!161855 (= lt!670395 (choose!2033 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!866032 () Bool)

(assert (=> d!161855 e!866032))

(declare-fun res!1063879 () Bool)

(assert (=> d!161855 (=> (not res!1063879) (not e!866032))))

(assert (=> d!161855 (= res!1063879 (isStrictlySorted!875 lt!670338))))

(assert (=> d!161855 (= (lemmaContainsTupThenGetReturnValue!375 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670395)))

(declare-fun b!1555337 () Bool)

(declare-fun res!1063880 () Bool)

(assert (=> b!1555337 (=> (not res!1063880) (not e!866032))))

(assert (=> b!1555337 (= res!1063880 (containsKey!754 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555338 () Bool)

(assert (=> b!1555338 (= e!866032 (contains!10176 lt!670338 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161855 res!1063879) b!1555337))

(assert (= (and b!1555337 res!1063880) b!1555338))

(assert (=> d!161855 m!1433443))

(declare-fun m!1433639 () Bool)

(assert (=> d!161855 m!1433639))

(declare-fun m!1433641 () Bool)

(assert (=> d!161855 m!1433641))

(declare-fun m!1433643 () Bool)

(assert (=> b!1555337 m!1433643))

(declare-fun m!1433645 () Bool)

(assert (=> b!1555338 m!1433645))

(assert (=> d!161763 d!161855))

(declare-fun b!1555339 () Bool)

(declare-fun e!866036 () List!36242)

(declare-fun call!71492 () List!36242)

(assert (=> b!1555339 (= e!866036 call!71492)))

(declare-fun b!1555340 () Bool)

(declare-fun c!143906 () Bool)

(assert (=> b!1555340 (= c!143906 (and ((_ is Cons!36238) (toList!11221 call!71426)) (bvsgt (_1!12408 (h!37701 (toList!11221 call!71426))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866033 () List!36242)

(assert (=> b!1555340 (= e!866033 e!866036)))

(declare-fun b!1555341 () Bool)

(declare-fun e!866037 () List!36242)

(assert (=> b!1555341 (= e!866037 e!866033)))

(declare-fun c!143907 () Bool)

(assert (=> b!1555341 (= c!143907 (and ((_ is Cons!36238) (toList!11221 call!71426)) (= (_1!12408 (h!37701 (toList!11221 call!71426))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866035 () List!36242)

(declare-fun b!1555342 () Bool)

(assert (=> b!1555342 (= e!866035 (ite c!143907 (t!50950 (toList!11221 call!71426)) (ite c!143906 (Cons!36238 (h!37701 (toList!11221 call!71426)) (t!50950 (toList!11221 call!71426))) Nil!36239)))))

(declare-fun b!1555343 () Bool)

(declare-fun call!71493 () List!36242)

(assert (=> b!1555343 (= e!866037 call!71493)))

(declare-fun b!1555344 () Bool)

(declare-fun call!71494 () List!36242)

(assert (=> b!1555344 (= e!866033 call!71494)))

(declare-fun b!1555345 () Bool)

(declare-fun res!1063881 () Bool)

(declare-fun e!866034 () Bool)

(assert (=> b!1555345 (=> (not res!1063881) (not e!866034))))

(declare-fun lt!670396 () List!36242)

(assert (=> b!1555345 (= res!1063881 (containsKey!754 lt!670396 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555346 () Bool)

(assert (=> b!1555346 (= e!866036 call!71492)))

(declare-fun d!161857 () Bool)

(assert (=> d!161857 e!866034))

(declare-fun res!1063882 () Bool)

(assert (=> d!161857 (=> (not res!1063882) (not e!866034))))

(assert (=> d!161857 (= res!1063882 (isStrictlySorted!875 lt!670396))))

(assert (=> d!161857 (= lt!670396 e!866037)))

(declare-fun c!143908 () Bool)

(assert (=> d!161857 (= c!143908 (and ((_ is Cons!36238) (toList!11221 call!71426)) (bvslt (_1!12408 (h!37701 (toList!11221 call!71426))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161857 (isStrictlySorted!875 (toList!11221 call!71426))))

(assert (=> d!161857 (= (insertStrictlySorted!504 (toList!11221 call!71426) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670396)))

(declare-fun bm!71489 () Bool)

(assert (=> bm!71489 (= call!71494 call!71493)))

(declare-fun bm!71490 () Bool)

(assert (=> bm!71490 (= call!71492 call!71494)))

(declare-fun b!1555347 () Bool)

(assert (=> b!1555347 (= e!866034 (contains!10176 lt!670396 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555348 () Bool)

(assert (=> b!1555348 (= e!866035 (insertStrictlySorted!504 (t!50950 (toList!11221 call!71426)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71491 () Bool)

(assert (=> bm!71491 (= call!71493 ($colon$colon!943 e!866035 (ite c!143908 (h!37701 (toList!11221 call!71426)) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143909 () Bool)

(assert (=> bm!71491 (= c!143909 c!143908)))

(assert (= (and d!161857 c!143908) b!1555343))

(assert (= (and d!161857 (not c!143908)) b!1555341))

(assert (= (and b!1555341 c!143907) b!1555344))

(assert (= (and b!1555341 (not c!143907)) b!1555340))

(assert (= (and b!1555340 c!143906) b!1555346))

(assert (= (and b!1555340 (not c!143906)) b!1555339))

(assert (= (or b!1555346 b!1555339) bm!71490))

(assert (= (or b!1555344 bm!71490) bm!71489))

(assert (= (or b!1555343 bm!71489) bm!71491))

(assert (= (and bm!71491 c!143909) b!1555348))

(assert (= (and bm!71491 (not c!143909)) b!1555342))

(assert (= (and d!161857 res!1063882) b!1555345))

(assert (= (and b!1555345 res!1063881) b!1555347))

(declare-fun m!1433647 () Bool)

(assert (=> b!1555347 m!1433647))

(declare-fun m!1433649 () Bool)

(assert (=> bm!71491 m!1433649))

(declare-fun m!1433651 () Bool)

(assert (=> b!1555345 m!1433651))

(declare-fun m!1433653 () Bool)

(assert (=> b!1555348 m!1433653))

(declare-fun m!1433655 () Bool)

(assert (=> d!161857 m!1433655))

(declare-fun m!1433657 () Bool)

(assert (=> d!161857 m!1433657))

(assert (=> d!161763 d!161857))

(declare-fun d!161859 () Bool)

(declare-fun e!866038 () Bool)

(assert (=> d!161859 e!866038))

(declare-fun res!1063883 () Bool)

(assert (=> d!161859 (=> res!1063883 e!866038)))

(declare-fun lt!670398 () Bool)

(assert (=> d!161859 (= res!1063883 (not lt!670398))))

(declare-fun lt!670399 () Bool)

(assert (=> d!161859 (= lt!670398 lt!670399)))

(declare-fun lt!670400 () Unit!51616)

(declare-fun e!866039 () Unit!51616)

(assert (=> d!161859 (= lt!670400 e!866039)))

(declare-fun c!143910 () Bool)

(assert (=> d!161859 (= c!143910 lt!670399)))

(assert (=> d!161859 (= lt!670399 (containsKey!754 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161859 (= (contains!10173 lt!670352 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!670398)))

(declare-fun b!1555349 () Bool)

(declare-fun lt!670397 () Unit!51616)

(assert (=> b!1555349 (= e!866039 lt!670397)))

(assert (=> b!1555349 (= lt!670397 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> b!1555349 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1555350 () Bool)

(declare-fun Unit!51632 () Unit!51616)

(assert (=> b!1555350 (= e!866039 Unit!51632)))

(declare-fun b!1555351 () Bool)

(assert (=> b!1555351 (= e!866038 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161859 c!143910) b!1555349))

(assert (= (and d!161859 (not c!143910)) b!1555350))

(assert (= (and d!161859 (not res!1063883)) b!1555351))

(declare-fun m!1433659 () Bool)

(assert (=> d!161859 m!1433659))

(declare-fun m!1433661 () Bool)

(assert (=> b!1555349 m!1433661))

(assert (=> b!1555349 m!1433501))

(assert (=> b!1555349 m!1433501))

(declare-fun m!1433663 () Bool)

(assert (=> b!1555349 m!1433663))

(assert (=> b!1555351 m!1433501))

(assert (=> b!1555351 m!1433501))

(assert (=> b!1555351 m!1433663))

(assert (=> d!161781 d!161859))

(declare-fun d!161861 () Bool)

(declare-fun c!143911 () Bool)

(assert (=> d!161861 (= c!143911 (and ((_ is Cons!36238) lt!670353) (= (_1!12408 (h!37701 lt!670353)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!866040 () Option!803)

(assert (=> d!161861 (= (getValueByKey!728 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!866040)))

(declare-fun b!1555354 () Bool)

(declare-fun e!866041 () Option!803)

(assert (=> b!1555354 (= e!866041 (getValueByKey!728 (t!50950 lt!670353) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1555353 () Bool)

(assert (=> b!1555353 (= e!866040 e!866041)))

(declare-fun c!143912 () Bool)

(assert (=> b!1555353 (= c!143912 (and ((_ is Cons!36238) lt!670353) (not (= (_1!12408 (h!37701 lt!670353)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun b!1555352 () Bool)

(assert (=> b!1555352 (= e!866040 (Some!802 (_2!12408 (h!37701 lt!670353))))))

(declare-fun b!1555355 () Bool)

(assert (=> b!1555355 (= e!866041 None!801)))

(assert (= (and d!161861 c!143911) b!1555352))

(assert (= (and d!161861 (not c!143911)) b!1555353))

(assert (= (and b!1555353 c!143912) b!1555354))

(assert (= (and b!1555353 (not c!143912)) b!1555355))

(declare-fun m!1433665 () Bool)

(assert (=> b!1555354 m!1433665))

(assert (=> d!161781 d!161861))

(declare-fun d!161863 () Bool)

(assert (=> d!161863 (= (getValueByKey!728 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!670401 () Unit!51616)

(assert (=> d!161863 (= lt!670401 (choose!2033 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun e!866042 () Bool)

(assert (=> d!161863 e!866042))

(declare-fun res!1063884 () Bool)

(assert (=> d!161863 (=> (not res!1063884) (not e!866042))))

(assert (=> d!161863 (= res!1063884 (isStrictlySorted!875 lt!670353))))

(assert (=> d!161863 (= (lemmaContainsTupThenGetReturnValue!375 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!670401)))

(declare-fun b!1555356 () Bool)

(declare-fun res!1063885 () Bool)

(assert (=> b!1555356 (=> (not res!1063885) (not e!866042))))

(assert (=> b!1555356 (= res!1063885 (containsKey!754 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1555357 () Bool)

(assert (=> b!1555357 (= e!866042 (contains!10176 lt!670353 (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161863 res!1063884) b!1555356))

(assert (= (and b!1555356 res!1063885) b!1555357))

(assert (=> d!161863 m!1433495))

(declare-fun m!1433667 () Bool)

(assert (=> d!161863 m!1433667))

(declare-fun m!1433669 () Bool)

(assert (=> d!161863 m!1433669))

(declare-fun m!1433671 () Bool)

(assert (=> b!1555356 m!1433671))

(declare-fun m!1433673 () Bool)

(assert (=> b!1555357 m!1433673))

(assert (=> d!161781 d!161863))

(declare-fun b!1555358 () Bool)

(declare-fun e!866046 () List!36242)

(declare-fun call!71495 () List!36242)

(assert (=> b!1555358 (= e!866046 call!71495)))

(declare-fun b!1555359 () Bool)

(declare-fun c!143913 () Bool)

(assert (=> b!1555359 (= c!143913 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (bvsgt (_1!12408 (h!37701 (toList!11221 lt!670212))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!866043 () List!36242)

(assert (=> b!1555359 (= e!866043 e!866046)))

(declare-fun b!1555360 () Bool)

(declare-fun e!866047 () List!36242)

(assert (=> b!1555360 (= e!866047 e!866043)))

(declare-fun c!143914 () Bool)

(assert (=> b!1555360 (= c!143914 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (= (_1!12408 (h!37701 (toList!11221 lt!670212))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555361 () Bool)

(declare-fun e!866045 () List!36242)

(assert (=> b!1555361 (= e!866045 (ite c!143914 (t!50950 (toList!11221 lt!670212)) (ite c!143913 (Cons!36238 (h!37701 (toList!11221 lt!670212)) (t!50950 (toList!11221 lt!670212))) Nil!36239)))))

(declare-fun b!1555362 () Bool)

(declare-fun call!71496 () List!36242)

(assert (=> b!1555362 (= e!866047 call!71496)))

(declare-fun b!1555363 () Bool)

(declare-fun call!71497 () List!36242)

(assert (=> b!1555363 (= e!866043 call!71497)))

(declare-fun b!1555364 () Bool)

(declare-fun res!1063886 () Bool)

(declare-fun e!866044 () Bool)

(assert (=> b!1555364 (=> (not res!1063886) (not e!866044))))

(declare-fun lt!670402 () List!36242)

(assert (=> b!1555364 (= res!1063886 (containsKey!754 lt!670402 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1555365 () Bool)

(assert (=> b!1555365 (= e!866046 call!71495)))

(declare-fun d!161865 () Bool)

(assert (=> d!161865 e!866044))

(declare-fun res!1063887 () Bool)

(assert (=> d!161865 (=> (not res!1063887) (not e!866044))))

(assert (=> d!161865 (= res!1063887 (isStrictlySorted!875 lt!670402))))

(assert (=> d!161865 (= lt!670402 e!866047)))

(declare-fun c!143915 () Bool)

(assert (=> d!161865 (= c!143915 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670212))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161865 (isStrictlySorted!875 (toList!11221 lt!670212))))

(assert (=> d!161865 (= (insertStrictlySorted!504 (toList!11221 lt!670212) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!670402)))

(declare-fun bm!71492 () Bool)

(assert (=> bm!71492 (= call!71497 call!71496)))

(declare-fun bm!71493 () Bool)

(assert (=> bm!71493 (= call!71495 call!71497)))

(declare-fun b!1555366 () Bool)

(assert (=> b!1555366 (= e!866044 (contains!10176 lt!670402 (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555367 () Bool)

(assert (=> b!1555367 (= e!866045 (insertStrictlySorted!504 (t!50950 (toList!11221 lt!670212)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun bm!71494 () Bool)

(assert (=> bm!71494 (= call!71496 ($colon$colon!943 e!866045 (ite c!143915 (h!37701 (toList!11221 lt!670212)) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun c!143916 () Bool)

(assert (=> bm!71494 (= c!143916 c!143915)))

(assert (= (and d!161865 c!143915) b!1555362))

(assert (= (and d!161865 (not c!143915)) b!1555360))

(assert (= (and b!1555360 c!143914) b!1555363))

(assert (= (and b!1555360 (not c!143914)) b!1555359))

(assert (= (and b!1555359 c!143913) b!1555365))

(assert (= (and b!1555359 (not c!143913)) b!1555358))

(assert (= (or b!1555365 b!1555358) bm!71493))

(assert (= (or b!1555363 bm!71493) bm!71492))

(assert (= (or b!1555362 bm!71492) bm!71494))

(assert (= (and bm!71494 c!143916) b!1555367))

(assert (= (and bm!71494 (not c!143916)) b!1555361))

(assert (= (and d!161865 res!1063887) b!1555364))

(assert (= (and b!1555364 res!1063886) b!1555366))

(declare-fun m!1433675 () Bool)

(assert (=> b!1555366 m!1433675))

(declare-fun m!1433677 () Bool)

(assert (=> bm!71494 m!1433677))

(declare-fun m!1433679 () Bool)

(assert (=> b!1555364 m!1433679))

(declare-fun m!1433681 () Bool)

(assert (=> b!1555367 m!1433681))

(declare-fun m!1433683 () Bool)

(assert (=> d!161865 m!1433683))

(assert (=> d!161865 m!1433621))

(assert (=> d!161781 d!161865))

(declare-fun d!161867 () Bool)

(assert (=> d!161867 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!670403 () Unit!51616)

(assert (=> d!161867 (= lt!670403 (choose!2032 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!866048 () Bool)

(assert (=> d!161867 e!866048))

(declare-fun res!1063888 () Bool)

(assert (=> d!161867 (=> (not res!1063888) (not e!866048))))

(assert (=> d!161867 (= res!1063888 (isStrictlySorted!875 (toList!11221 lt!670211)))))

(assert (=> d!161867 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000) lt!670403)))

(declare-fun b!1555368 () Bool)

(assert (=> b!1555368 (= e!866048 (containsKey!754 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161867 res!1063888) b!1555368))

(assert (=> d!161867 m!1433453))

(assert (=> d!161867 m!1433453))

(assert (=> d!161867 m!1433519))

(declare-fun m!1433685 () Bool)

(assert (=> d!161867 m!1433685))

(assert (=> d!161867 m!1433571))

(assert (=> b!1555368 m!1433515))

(assert (=> b!1555204 d!161867))

(declare-fun d!161869 () Bool)

(assert (=> d!161869 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44630 () Bool)

(assert (= bs!44630 d!161869))

(assert (=> bs!44630 m!1433453))

(declare-fun m!1433687 () Bool)

(assert (=> bs!44630 m!1433687))

(assert (=> b!1555204 d!161869))

(assert (=> b!1555204 d!161845))

(declare-fun d!161871 () Bool)

(declare-fun e!866049 () Bool)

(assert (=> d!161871 e!866049))

(declare-fun res!1063889 () Bool)

(assert (=> d!161871 (=> res!1063889 e!866049)))

(declare-fun lt!670405 () Bool)

(assert (=> d!161871 (= res!1063889 (not lt!670405))))

(declare-fun lt!670406 () Bool)

(assert (=> d!161871 (= lt!670405 lt!670406)))

(declare-fun lt!670407 () Unit!51616)

(declare-fun e!866050 () Unit!51616)

(assert (=> d!161871 (= lt!670407 e!866050)))

(declare-fun c!143917 () Bool)

(assert (=> d!161871 (= c!143917 lt!670406)))

(assert (=> d!161871 (= lt!670406 (containsKey!754 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161871 (= (contains!10173 lt!670309 #b0000000000000000000000000000000000000000000000000000000000000000) lt!670405)))

(declare-fun b!1555369 () Bool)

(declare-fun lt!670404 () Unit!51616)

(assert (=> b!1555369 (= e!866050 lt!670404)))

(assert (=> b!1555369 (= lt!670404 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1555369 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555370 () Bool)

(declare-fun Unit!51633 () Unit!51616)

(assert (=> b!1555370 (= e!866050 Unit!51633)))

(declare-fun b!1555371 () Bool)

(assert (=> b!1555371 (= e!866049 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161871 c!143917) b!1555369))

(assert (= (and d!161871 (not c!143917)) b!1555370))

(assert (= (and d!161871 (not res!1063889)) b!1555371))

(declare-fun m!1433689 () Bool)

(assert (=> d!161871 m!1433689))

(declare-fun m!1433691 () Bool)

(assert (=> b!1555369 m!1433691))

(declare-fun m!1433693 () Bool)

(assert (=> b!1555369 m!1433693))

(assert (=> b!1555369 m!1433693))

(declare-fun m!1433695 () Bool)

(assert (=> b!1555369 m!1433695))

(assert (=> b!1555371 m!1433693))

(assert (=> b!1555371 m!1433693))

(assert (=> b!1555371 m!1433695))

(assert (=> d!161757 d!161871))

(assert (=> d!161757 d!161745))

(assert (=> b!1555206 d!161869))

(assert (=> b!1555206 d!161845))

(declare-fun d!161873 () Bool)

(declare-fun res!1063890 () Bool)

(declare-fun e!866051 () Bool)

(assert (=> d!161873 (=> res!1063890 e!866051)))

(assert (=> d!161873 (= res!1063890 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (= (_1!12408 (h!37701 (toList!11221 lt!670211))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161873 (= (containsKey!754 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)) e!866051)))

(declare-fun b!1555372 () Bool)

(declare-fun e!866052 () Bool)

(assert (=> b!1555372 (= e!866051 e!866052)))

(declare-fun res!1063891 () Bool)

(assert (=> b!1555372 (=> (not res!1063891) (not e!866052))))

(assert (=> b!1555372 (= res!1063891 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670211))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670211))) (select (arr!50064 _keys!618) from!762))) ((_ is Cons!36238) (toList!11221 lt!670211)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670211))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun b!1555373 () Bool)

(assert (=> b!1555373 (= e!866052 (containsKey!754 (t!50950 (toList!11221 lt!670211)) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!161873 (not res!1063890)) b!1555372))

(assert (= (and b!1555372 res!1063891) b!1555373))

(assert (=> b!1555373 m!1433213))

(declare-fun m!1433697 () Bool)

(assert (=> b!1555373 m!1433697))

(assert (=> d!161759 d!161873))

(declare-fun d!161875 () Bool)

(declare-fun res!1063892 () Bool)

(declare-fun e!866053 () Bool)

(assert (=> d!161875 (=> res!1063892 e!866053)))

(assert (=> d!161875 (= res!1063892 (and ((_ is Cons!36238) (toList!11221 lt!670204)) (= (_1!12408 (h!37701 (toList!11221 lt!670204))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161875 (= (containsKey!754 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)) e!866053)))

(declare-fun b!1555374 () Bool)

(declare-fun e!866054 () Bool)

(assert (=> b!1555374 (= e!866053 e!866054)))

(declare-fun res!1063893 () Bool)

(assert (=> b!1555374 (=> (not res!1063893) (not e!866054))))

(assert (=> b!1555374 (= res!1063893 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670204))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670204))) (select (arr!50064 _keys!618) from!762))) ((_ is Cons!36238) (toList!11221 lt!670204)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670204))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun b!1555375 () Bool)

(assert (=> b!1555375 (= e!866054 (containsKey!754 (t!50950 (toList!11221 lt!670204)) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!161875 (not res!1063892)) b!1555374))

(assert (= (and b!1555374 res!1063893) b!1555375))

(assert (=> b!1555375 m!1433213))

(declare-fun m!1433699 () Bool)

(assert (=> b!1555375 m!1433699))

(assert (=> d!161783 d!161875))

(declare-fun d!161877 () Bool)

(declare-fun lt!670410 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!783 (List!36242) (InoxSet tuple2!24794))

(assert (=> d!161877 (= lt!670410 (select (content!783 (toList!11221 lt!670344)) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!866059 () Bool)

(assert (=> d!161877 (= lt!670410 e!866059)))

(declare-fun res!1063898 () Bool)

(assert (=> d!161877 (=> (not res!1063898) (not e!866059))))

(assert (=> d!161877 (= res!1063898 ((_ is Cons!36238) (toList!11221 lt!670344)))))

(assert (=> d!161877 (= (contains!10176 (toList!11221 lt!670344) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!670410)))

(declare-fun b!1555380 () Bool)

(declare-fun e!866060 () Bool)

(assert (=> b!1555380 (= e!866059 e!866060)))

(declare-fun res!1063899 () Bool)

(assert (=> b!1555380 (=> res!1063899 e!866060)))

(assert (=> b!1555380 (= res!1063899 (= (h!37701 (toList!11221 lt!670344)) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1555381 () Bool)

(assert (=> b!1555381 (= e!866060 (contains!10176 (t!50950 (toList!11221 lt!670344)) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161877 res!1063898) b!1555380))

(assert (= (and b!1555380 (not res!1063899)) b!1555381))

(declare-fun m!1433701 () Bool)

(assert (=> d!161877 m!1433701))

(declare-fun m!1433703 () Bool)

(assert (=> d!161877 m!1433703))

(declare-fun m!1433705 () Bool)

(assert (=> b!1555381 m!1433705))

(assert (=> b!1555178 d!161877))

(assert (=> d!161773 d!161769))

(declare-fun d!161879 () Bool)

(assert (=> d!161879 (= (apply!1112 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50064 _keys!618) from!762)) (apply!1112 lt!670212 (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161879 true))

(declare-fun _$34!1191 () Unit!51616)

(assert (=> d!161879 (= (choose!2031 lt!670212 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50064 _keys!618) from!762)) _$34!1191)))

(declare-fun bs!44631 () Bool)

(assert (= bs!44631 d!161879))

(assert (=> bs!44631 m!1433223))

(assert (=> bs!44631 m!1433223))

(assert (=> bs!44631 m!1433213))

(assert (=> bs!44631 m!1433225))

(assert (=> bs!44631 m!1433213))

(assert (=> bs!44631 m!1433229))

(assert (=> d!161773 d!161879))

(declare-fun d!161881 () Bool)

(declare-fun e!866061 () Bool)

(assert (=> d!161881 e!866061))

(declare-fun res!1063900 () Bool)

(assert (=> d!161881 (=> res!1063900 e!866061)))

(declare-fun lt!670412 () Bool)

(assert (=> d!161881 (= res!1063900 (not lt!670412))))

(declare-fun lt!670413 () Bool)

(assert (=> d!161881 (= lt!670412 lt!670413)))

(declare-fun lt!670414 () Unit!51616)

(declare-fun e!866062 () Unit!51616)

(assert (=> d!161881 (= lt!670414 e!866062)))

(declare-fun c!143918 () Bool)

(assert (=> d!161881 (= c!143918 lt!670413)))

(assert (=> d!161881 (= lt!670413 (containsKey!754 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161881 (= (contains!10173 lt!670212 (select (arr!50064 _keys!618) from!762)) lt!670412)))

(declare-fun b!1555383 () Bool)

(declare-fun lt!670411 () Unit!51616)

(assert (=> b!1555383 (= e!866062 lt!670411)))

(assert (=> b!1555383 (= lt!670411 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)))))

(assert (=> b!1555383 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555384 () Bool)

(declare-fun Unit!51634 () Unit!51616)

(assert (=> b!1555384 (= e!866062 Unit!51634)))

(declare-fun b!1555385 () Bool)

(assert (=> b!1555385 (= e!866061 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762))))))

(assert (= (and d!161881 c!143918) b!1555383))

(assert (= (and d!161881 (not c!143918)) b!1555384))

(assert (= (and d!161881 (not res!1063900)) b!1555385))

(assert (=> d!161881 m!1433213))

(declare-fun m!1433707 () Bool)

(assert (=> d!161881 m!1433707))

(assert (=> b!1555383 m!1433213))

(declare-fun m!1433709 () Bool)

(assert (=> b!1555383 m!1433709))

(assert (=> b!1555383 m!1433213))

(assert (=> b!1555383 m!1433489))

(assert (=> b!1555383 m!1433489))

(declare-fun m!1433711 () Bool)

(assert (=> b!1555383 m!1433711))

(assert (=> b!1555385 m!1433213))

(assert (=> b!1555385 m!1433489))

(assert (=> b!1555385 m!1433489))

(assert (=> b!1555385 m!1433711))

(assert (=> d!161773 d!161881))

(assert (=> d!161773 d!161777))

(assert (=> d!161773 d!161779))

(declare-fun d!161883 () Bool)

(assert (=> d!161883 (= (get!26082 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21979 (select (arr!50065 _values!470) from!762)))))

(assert (=> b!1555109 d!161883))

(declare-fun d!161885 () Bool)

(declare-fun e!866063 () Bool)

(assert (=> d!161885 e!866063))

(declare-fun res!1063901 () Bool)

(assert (=> d!161885 (=> res!1063901 e!866063)))

(declare-fun lt!670416 () Bool)

(assert (=> d!161885 (= res!1063901 (not lt!670416))))

(declare-fun lt!670417 () Bool)

(assert (=> d!161885 (= lt!670416 lt!670417)))

(declare-fun lt!670418 () Unit!51616)

(declare-fun e!866064 () Unit!51616)

(assert (=> d!161885 (= lt!670418 e!866064)))

(declare-fun c!143919 () Bool)

(assert (=> d!161885 (= c!143919 lt!670417)))

(assert (=> d!161885 (= lt!670417 (containsKey!754 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161885 (= (contains!10173 lt!670309 #b1000000000000000000000000000000000000000000000000000000000000000) lt!670416)))

(declare-fun b!1555386 () Bool)

(declare-fun lt!670415 () Unit!51616)

(assert (=> b!1555386 (= e!866064 lt!670415)))

(assert (=> b!1555386 (= lt!670415 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1555386 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555387 () Bool)

(declare-fun Unit!51635 () Unit!51616)

(assert (=> b!1555387 (= e!866064 Unit!51635)))

(declare-fun b!1555388 () Bool)

(assert (=> b!1555388 (= e!866063 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161885 c!143919) b!1555386))

(assert (= (and d!161885 (not c!143919)) b!1555387))

(assert (= (and d!161885 (not res!1063901)) b!1555388))

(declare-fun m!1433713 () Bool)

(assert (=> d!161885 m!1433713))

(declare-fun m!1433715 () Bool)

(assert (=> b!1555386 m!1433715))

(declare-fun m!1433717 () Bool)

(assert (=> b!1555386 m!1433717))

(assert (=> b!1555386 m!1433717))

(declare-fun m!1433719 () Bool)

(assert (=> b!1555386 m!1433719))

(assert (=> b!1555388 m!1433717))

(assert (=> b!1555388 m!1433717))

(assert (=> b!1555388 m!1433719))

(assert (=> b!1555151 d!161885))

(declare-fun d!161887 () Bool)

(assert (=> d!161887 (= (get!26081 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!21982 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161791 d!161887))

(assert (=> d!161791 d!161821))

(declare-fun b!1555389 () Bool)

(declare-fun e!866065 () Bool)

(declare-fun e!866066 () Bool)

(assert (=> b!1555389 (= e!866065 e!866066)))

(declare-fun lt!670419 () (_ BitVec 64))

(assert (=> b!1555389 (= lt!670419 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!670421 () Unit!51616)

(assert (=> b!1555389 (= lt!670421 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!670419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1555389 (arrayContainsKey!0 _keys!618 lt!670419 #b00000000000000000000000000000000)))

(declare-fun lt!670420 () Unit!51616)

(assert (=> b!1555389 (= lt!670420 lt!670421)))

(declare-fun res!1063903 () Bool)

(assert (=> b!1555389 (= res!1063903 (= (seekEntryOrOpen!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926) (Found!13464 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1555389 (=> (not res!1063903) (not e!866066))))

(declare-fun b!1555391 () Bool)

(declare-fun e!866067 () Bool)

(assert (=> b!1555391 (= e!866067 e!866065)))

(declare-fun c!143920 () Bool)

(assert (=> b!1555391 (= c!143920 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1555390 () Bool)

(declare-fun call!71498 () Bool)

(assert (=> b!1555390 (= e!866066 call!71498)))

(declare-fun d!161889 () Bool)

(declare-fun res!1063902 () Bool)

(assert (=> d!161889 (=> res!1063902 e!866067)))

(assert (=> d!161889 (= res!1063902 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(assert (=> d!161889 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926) e!866067)))

(declare-fun b!1555392 () Bool)

(assert (=> b!1555392 (= e!866065 call!71498)))

(declare-fun bm!71495 () Bool)

(assert (=> bm!71495 (= call!71498 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926))))

(assert (= (and d!161889 (not res!1063902)) b!1555391))

(assert (= (and b!1555391 c!143920) b!1555389))

(assert (= (and b!1555391 (not c!143920)) b!1555392))

(assert (= (and b!1555389 res!1063903) b!1555390))

(assert (= (or b!1555390 b!1555392) bm!71495))

(declare-fun m!1433721 () Bool)

(assert (=> b!1555389 m!1433721))

(declare-fun m!1433723 () Bool)

(assert (=> b!1555389 m!1433723))

(declare-fun m!1433725 () Bool)

(assert (=> b!1555389 m!1433725))

(assert (=> b!1555389 m!1433721))

(declare-fun m!1433727 () Bool)

(assert (=> b!1555389 m!1433727))

(assert (=> b!1555391 m!1433721))

(assert (=> b!1555391 m!1433721))

(declare-fun m!1433729 () Bool)

(assert (=> b!1555391 m!1433729))

(declare-fun m!1433731 () Bool)

(assert (=> bm!71495 m!1433731))

(assert (=> bm!71475 d!161889))

(declare-fun d!161891 () Bool)

(assert (=> d!161891 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670422 () Unit!51616)

(assert (=> d!161891 (= lt!670422 (choose!2032 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))

(declare-fun e!866068 () Bool)

(assert (=> d!161891 e!866068))

(declare-fun res!1063904 () Bool)

(assert (=> d!161891 (=> (not res!1063904) (not e!866068))))

(assert (=> d!161891 (= res!1063904 (isStrictlySorted!875 (toList!11221 lt!670204)))))

(assert (=> d!161891 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)) lt!670422)))

(declare-fun b!1555393 () Bool)

(assert (=> b!1555393 (= e!866068 (containsKey!754 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!161891 res!1063904) b!1555393))

(assert (=> d!161891 m!1433213))

(assert (=> d!161891 m!1433475))

(assert (=> d!161891 m!1433475))

(assert (=> d!161891 m!1433509))

(assert (=> d!161891 m!1433213))

(declare-fun m!1433733 () Bool)

(assert (=> d!161891 m!1433733))

(declare-fun m!1433735 () Bool)

(assert (=> d!161891 m!1433735))

(assert (=> b!1555393 m!1433213))

(assert (=> b!1555393 m!1433505))

(assert (=> b!1555186 d!161891))

(declare-fun d!161893 () Bool)

(assert (=> d!161893 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun bs!44632 () Bool)

(assert (= bs!44632 d!161893))

(assert (=> bs!44632 m!1433475))

(declare-fun m!1433737 () Bool)

(assert (=> bs!44632 m!1433737))

(assert (=> b!1555186 d!161893))

(assert (=> b!1555186 d!161813))

(declare-fun d!161895 () Bool)

(declare-fun lt!670423 () Bool)

(assert (=> d!161895 (= lt!670423 (select (content!783 (toList!11221 lt!670337)) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!866069 () Bool)

(assert (=> d!161895 (= lt!670423 e!866069)))

(declare-fun res!1063905 () Bool)

(assert (=> d!161895 (=> (not res!1063905) (not e!866069))))

(assert (=> d!161895 (= res!1063905 ((_ is Cons!36238) (toList!11221 lt!670337)))))

(assert (=> d!161895 (= (contains!10176 (toList!11221 lt!670337) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!670423)))

(declare-fun b!1555394 () Bool)

(declare-fun e!866070 () Bool)

(assert (=> b!1555394 (= e!866069 e!866070)))

(declare-fun res!1063906 () Bool)

(assert (=> b!1555394 (=> res!1063906 e!866070)))

(assert (=> b!1555394 (= res!1063906 (= (h!37701 (toList!11221 lt!670337)) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1555395 () Bool)

(assert (=> b!1555395 (= e!866070 (contains!10176 (t!50950 (toList!11221 lt!670337)) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161895 res!1063905) b!1555394))

(assert (= (and b!1555394 (not res!1063906)) b!1555395))

(declare-fun m!1433739 () Bool)

(assert (=> d!161895 m!1433739))

(declare-fun m!1433741 () Bool)

(assert (=> d!161895 m!1433741))

(declare-fun m!1433743 () Bool)

(assert (=> b!1555395 m!1433743))

(assert (=> b!1555175 d!161895))

(declare-fun d!161897 () Bool)

(declare-fun e!866071 () Bool)

(assert (=> d!161897 e!866071))

(declare-fun res!1063907 () Bool)

(assert (=> d!161897 (=> res!1063907 e!866071)))

(declare-fun lt!670425 () Bool)

(assert (=> d!161897 (= res!1063907 (not lt!670425))))

(declare-fun lt!670426 () Bool)

(assert (=> d!161897 (= lt!670425 lt!670426)))

(declare-fun lt!670427 () Unit!51616)

(declare-fun e!866072 () Unit!51616)

(assert (=> d!161897 (= lt!670427 e!866072)))

(declare-fun c!143921 () Bool)

(assert (=> d!161897 (= c!143921 lt!670426)))

(assert (=> d!161897 (= lt!670426 (containsKey!754 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161897 (= (contains!10173 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50064 _keys!618) from!762)) lt!670425)))

(declare-fun b!1555396 () Bool)

(declare-fun lt!670424 () Unit!51616)

(assert (=> b!1555396 (= e!866072 lt!670424)))

(assert (=> b!1555396 (= lt!670424 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)))))

(assert (=> b!1555396 (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555397 () Bool)

(declare-fun Unit!51636 () Unit!51616)

(assert (=> b!1555397 (= e!866072 Unit!51636)))

(declare-fun b!1555398 () Bool)

(assert (=> b!1555398 (= e!866071 (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762))))))

(assert (= (and d!161897 c!143921) b!1555396))

(assert (= (and d!161897 (not c!143921)) b!1555397))

(assert (= (and d!161897 (not res!1063907)) b!1555398))

(assert (=> d!161897 m!1433213))

(declare-fun m!1433745 () Bool)

(assert (=> d!161897 m!1433745))

(assert (=> b!1555396 m!1433213))

(declare-fun m!1433747 () Bool)

(assert (=> b!1555396 m!1433747))

(assert (=> b!1555396 m!1433213))

(declare-fun m!1433749 () Bool)

(assert (=> b!1555396 m!1433749))

(assert (=> b!1555396 m!1433749))

(declare-fun m!1433751 () Bool)

(assert (=> b!1555396 m!1433751))

(assert (=> b!1555398 m!1433213))

(assert (=> b!1555398 m!1433749))

(assert (=> b!1555398 m!1433749))

(assert (=> b!1555398 m!1433751))

(assert (=> d!161767 d!161897))

(assert (=> d!161767 d!161781))

(declare-fun d!161899 () Bool)

(assert (=> d!161899 (contains!10173 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50064 _keys!618) from!762))))

(assert (=> d!161899 true))

(declare-fun _$35!463 () Unit!51616)

(assert (=> d!161899 (= (choose!2030 lt!670212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50064 _keys!618) from!762)) _$35!463)))

(declare-fun bs!44633 () Bool)

(assert (= bs!44633 d!161899))

(assert (=> bs!44633 m!1433227))

(assert (=> bs!44633 m!1433227))

(assert (=> bs!44633 m!1433213))

(assert (=> bs!44633 m!1433457))

(assert (=> d!161767 d!161899))

(assert (=> d!161767 d!161881))

(assert (=> b!1555188 d!161893))

(assert (=> b!1555188 d!161813))

(declare-fun d!161901 () Bool)

(declare-fun lt!670428 () Bool)

(assert (=> d!161901 (= lt!670428 (select (content!783 (toList!11221 lt!670352)) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun e!866073 () Bool)

(assert (=> d!161901 (= lt!670428 e!866073)))

(declare-fun res!1063908 () Bool)

(assert (=> d!161901 (=> (not res!1063908) (not e!866073))))

(assert (=> d!161901 (= res!1063908 ((_ is Cons!36238) (toList!11221 lt!670352)))))

(assert (=> d!161901 (= (contains!10176 (toList!11221 lt!670352) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!670428)))

(declare-fun b!1555400 () Bool)

(declare-fun e!866074 () Bool)

(assert (=> b!1555400 (= e!866073 e!866074)))

(declare-fun res!1063909 () Bool)

(assert (=> b!1555400 (=> res!1063909 e!866074)))

(assert (=> b!1555400 (= res!1063909 (= (h!37701 (toList!11221 lt!670352)) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun b!1555401 () Bool)

(assert (=> b!1555401 (= e!866074 (contains!10176 (t!50950 (toList!11221 lt!670352)) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161901 res!1063908) b!1555400))

(assert (= (and b!1555400 (not res!1063909)) b!1555401))

(declare-fun m!1433753 () Bool)

(assert (=> d!161901 m!1433753))

(declare-fun m!1433755 () Bool)

(assert (=> d!161901 m!1433755))

(declare-fun m!1433757 () Bool)

(assert (=> b!1555401 m!1433757))

(assert (=> b!1555185 d!161901))

(declare-fun lt!670429 () Bool)

(declare-fun d!161903 () Bool)

(assert (=> d!161903 (= lt!670429 (select (content!783 (toList!11221 lt!670291)) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!866075 () Bool)

(assert (=> d!161903 (= lt!670429 e!866075)))

(declare-fun res!1063910 () Bool)

(assert (=> d!161903 (=> (not res!1063910) (not e!866075))))

(assert (=> d!161903 (= res!1063910 ((_ is Cons!36238) (toList!11221 lt!670291)))))

(assert (=> d!161903 (= (contains!10176 (toList!11221 lt!670291) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670429)))

(declare-fun b!1555402 () Bool)

(declare-fun e!866076 () Bool)

(assert (=> b!1555402 (= e!866075 e!866076)))

(declare-fun res!1063911 () Bool)

(assert (=> b!1555402 (=> res!1063911 e!866076)))

(assert (=> b!1555402 (= res!1063911 (= (h!37701 (toList!11221 lt!670291)) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555403 () Bool)

(assert (=> b!1555403 (= e!866076 (contains!10176 (t!50950 (toList!11221 lt!670291)) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161903 res!1063910) b!1555402))

(assert (= (and b!1555402 (not res!1063911)) b!1555403))

(declare-fun m!1433759 () Bool)

(assert (=> d!161903 m!1433759))

(declare-fun m!1433761 () Bool)

(assert (=> d!161903 m!1433761))

(declare-fun m!1433763 () Bool)

(assert (=> b!1555403 m!1433763))

(assert (=> b!1555116 d!161903))

(assert (=> b!1555172 d!161847))

(assert (=> b!1555144 d!161789))

(declare-fun d!161905 () Bool)

(declare-fun lt!670432 () Bool)

(declare-fun content!784 (List!36243) (InoxSet (_ BitVec 64)))

(assert (=> d!161905 (= lt!670432 (select (content!784 Nil!36240) (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun e!866081 () Bool)

(assert (=> d!161905 (= lt!670432 e!866081)))

(declare-fun res!1063916 () Bool)

(assert (=> d!161905 (=> (not res!1063916) (not e!866081))))

(assert (=> d!161905 (= res!1063916 ((_ is Cons!36239) Nil!36240))))

(assert (=> d!161905 (= (contains!10177 Nil!36240 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)) lt!670432)))

(declare-fun b!1555408 () Bool)

(declare-fun e!866082 () Bool)

(assert (=> b!1555408 (= e!866081 e!866082)))

(declare-fun res!1063917 () Bool)

(assert (=> b!1555408 (=> res!1063917 e!866082)))

(assert (=> b!1555408 (= res!1063917 (= (h!37702 Nil!36240) (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1555409 () Bool)

(assert (=> b!1555409 (= e!866082 (contains!10177 (t!50951 Nil!36240) (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!161905 res!1063916) b!1555408))

(assert (= (and b!1555408 (not res!1063917)) b!1555409))

(declare-fun m!1433765 () Bool)

(assert (=> d!161905 m!1433765))

(assert (=> d!161905 m!1433429))

(declare-fun m!1433767 () Bool)

(assert (=> d!161905 m!1433767))

(assert (=> b!1555409 m!1433429))

(declare-fun m!1433769 () Bool)

(assert (=> b!1555409 m!1433769))

(assert (=> b!1555202 d!161905))

(assert (=> b!1555145 d!161753))

(declare-fun d!161907 () Bool)

(declare-fun e!866083 () Bool)

(assert (=> d!161907 e!866083))

(declare-fun res!1063919 () Bool)

(assert (=> d!161907 (=> (not res!1063919) (not e!866083))))

(declare-fun lt!670435 () ListLongMap!22411)

(assert (=> d!161907 (= res!1063919 (contains!10173 lt!670435 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!670436 () List!36242)

(assert (=> d!161907 (= lt!670435 (ListLongMap!22412 lt!670436))))

(declare-fun lt!670434 () Unit!51616)

(declare-fun lt!670433 () Unit!51616)

(assert (=> d!161907 (= lt!670434 lt!670433)))

(assert (=> d!161907 (= (getValueByKey!728 lt!670436 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!802 (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161907 (= lt!670433 (lemmaContainsTupThenGetReturnValue!375 lt!670436 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161907 (= lt!670436 (insertStrictlySorted!504 (toList!11221 call!71475) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161907 (= (+!5049 call!71475 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!670435)))

(declare-fun b!1555410 () Bool)

(declare-fun res!1063918 () Bool)

(assert (=> b!1555410 (=> (not res!1063918) (not e!866083))))

(assert (=> b!1555410 (= res!1063918 (= (getValueByKey!728 (toList!11221 lt!670435) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!802 (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1555411 () Bool)

(assert (=> b!1555411 (= e!866083 (contains!10176 (toList!11221 lt!670435) (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!161907 res!1063919) b!1555410))

(assert (= (and b!1555410 res!1063918) b!1555411))

(declare-fun m!1433771 () Bool)

(assert (=> d!161907 m!1433771))

(declare-fun m!1433773 () Bool)

(assert (=> d!161907 m!1433773))

(declare-fun m!1433775 () Bool)

(assert (=> d!161907 m!1433775))

(declare-fun m!1433777 () Bool)

(assert (=> d!161907 m!1433777))

(declare-fun m!1433779 () Bool)

(assert (=> b!1555410 m!1433779))

(declare-fun m!1433781 () Bool)

(assert (=> b!1555411 m!1433781))

(assert (=> b!1555145 d!161907))

(declare-fun d!161909 () Bool)

(declare-fun e!866084 () Bool)

(assert (=> d!161909 e!866084))

(declare-fun res!1063920 () Bool)

(assert (=> d!161909 (=> res!1063920 e!866084)))

(declare-fun lt!670438 () Bool)

(assert (=> d!161909 (= res!1063920 (not lt!670438))))

(declare-fun lt!670439 () Bool)

(assert (=> d!161909 (= lt!670438 lt!670439)))

(declare-fun lt!670440 () Unit!51616)

(declare-fun e!866085 () Unit!51616)

(assert (=> d!161909 (= lt!670440 e!866085)))

(declare-fun c!143922 () Bool)

(assert (=> d!161909 (= c!143922 lt!670439)))

(assert (=> d!161909 (= lt!670439 (containsKey!754 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312))))

(assert (=> d!161909 (= (contains!10173 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)) lt!670312) lt!670438)))

(declare-fun b!1555412 () Bool)

(declare-fun lt!670437 () Unit!51616)

(assert (=> b!1555412 (= e!866085 lt!670437)))

(assert (=> b!1555412 (= lt!670437 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312))))

(assert (=> b!1555412 (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312))))

(declare-fun b!1555413 () Bool)

(declare-fun Unit!51637 () Unit!51616)

(assert (=> b!1555413 (= e!866085 Unit!51637)))

(declare-fun b!1555414 () Bool)

(assert (=> b!1555414 (= e!866084 (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312)))))

(assert (= (and d!161909 c!143922) b!1555412))

(assert (= (and d!161909 (not c!143922)) b!1555413))

(assert (= (and d!161909 (not res!1063920)) b!1555414))

(declare-fun m!1433783 () Bool)

(assert (=> d!161909 m!1433783))

(declare-fun m!1433785 () Bool)

(assert (=> b!1555412 m!1433785))

(declare-fun m!1433787 () Bool)

(assert (=> b!1555412 m!1433787))

(assert (=> b!1555412 m!1433787))

(declare-fun m!1433789 () Bool)

(assert (=> b!1555412 m!1433789))

(assert (=> b!1555414 m!1433787))

(assert (=> b!1555414 m!1433787))

(assert (=> b!1555414 m!1433789))

(assert (=> b!1555145 d!161909))

(declare-fun d!161911 () Bool)

(assert (=> d!161911 (not (contains!10173 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)) lt!670312))))

(declare-fun lt!670443 () Unit!51616)

(declare-fun choose!2034 (ListLongMap!22411 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51616)

(assert (=> d!161911 (= lt!670443 (choose!2034 lt!670308 lt!670307 lt!670310 lt!670312))))

(declare-fun e!866088 () Bool)

(assert (=> d!161911 e!866088))

(declare-fun res!1063923 () Bool)

(assert (=> d!161911 (=> (not res!1063923) (not e!866088))))

(assert (=> d!161911 (= res!1063923 (not (contains!10173 lt!670308 lt!670312)))))

(assert (=> d!161911 (= (addStillNotContains!514 lt!670308 lt!670307 lt!670310 lt!670312) lt!670443)))

(declare-fun b!1555418 () Bool)

(assert (=> b!1555418 (= e!866088 (not (= lt!670307 lt!670312)))))

(assert (= (and d!161911 res!1063923) b!1555418))

(assert (=> d!161911 m!1433407))

(assert (=> d!161911 m!1433407))

(assert (=> d!161911 m!1433409))

(declare-fun m!1433791 () Bool)

(assert (=> d!161911 m!1433791))

(declare-fun m!1433793 () Bool)

(assert (=> d!161911 m!1433793))

(assert (=> b!1555145 d!161911))

(declare-fun d!161913 () Bool)

(declare-fun e!866089 () Bool)

(assert (=> d!161913 e!866089))

(declare-fun res!1063925 () Bool)

(assert (=> d!161913 (=> (not res!1063925) (not e!866089))))

(declare-fun lt!670446 () ListLongMap!22411)

(assert (=> d!161913 (= res!1063925 (contains!10173 lt!670446 (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun lt!670447 () List!36242)

(assert (=> d!161913 (= lt!670446 (ListLongMap!22412 lt!670447))))

(declare-fun lt!670445 () Unit!51616)

(declare-fun lt!670444 () Unit!51616)

(assert (=> d!161913 (= lt!670445 lt!670444)))

(assert (=> d!161913 (= (getValueByKey!728 lt!670447 (_1!12408 (tuple2!24795 lt!670307 lt!670310))) (Some!802 (_2!12408 (tuple2!24795 lt!670307 lt!670310))))))

(assert (=> d!161913 (= lt!670444 (lemmaContainsTupThenGetReturnValue!375 lt!670447 (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310))))))

(assert (=> d!161913 (= lt!670447 (insertStrictlySorted!504 (toList!11221 lt!670308) (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310))))))

(assert (=> d!161913 (= (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)) lt!670446)))

(declare-fun b!1555419 () Bool)

(declare-fun res!1063924 () Bool)

(assert (=> b!1555419 (=> (not res!1063924) (not e!866089))))

(assert (=> b!1555419 (= res!1063924 (= (getValueByKey!728 (toList!11221 lt!670446) (_1!12408 (tuple2!24795 lt!670307 lt!670310))) (Some!802 (_2!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(declare-fun b!1555420 () Bool)

(assert (=> b!1555420 (= e!866089 (contains!10176 (toList!11221 lt!670446) (tuple2!24795 lt!670307 lt!670310)))))

(assert (= (and d!161913 res!1063925) b!1555419))

(assert (= (and b!1555419 res!1063924) b!1555420))

(declare-fun m!1433795 () Bool)

(assert (=> d!161913 m!1433795))

(declare-fun m!1433797 () Bool)

(assert (=> d!161913 m!1433797))

(declare-fun m!1433799 () Bool)

(assert (=> d!161913 m!1433799))

(declare-fun m!1433801 () Bool)

(assert (=> d!161913 m!1433801))

(declare-fun m!1433803 () Bool)

(assert (=> b!1555419 m!1433803))

(declare-fun m!1433805 () Bool)

(assert (=> b!1555420 m!1433805))

(assert (=> b!1555145 d!161913))

(declare-fun d!161915 () Bool)

(assert (=> d!161915 (arrayContainsKey!0 _keys!618 lt!670332 #b00000000000000000000000000000000)))

(declare-fun lt!670450 () Unit!51616)

(declare-fun choose!13 (array!103746 (_ BitVec 64) (_ BitVec 32)) Unit!51616)

(assert (=> d!161915 (= lt!670450 (choose!13 _keys!618 lt!670332 #b00000000000000000000000000000000))))

(assert (=> d!161915 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!161915 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!670332 #b00000000000000000000000000000000) lt!670450)))

(declare-fun bs!44634 () Bool)

(assert (= bs!44634 d!161915))

(assert (=> bs!44634 m!1433433))

(declare-fun m!1433807 () Bool)

(assert (=> bs!44634 m!1433807))

(assert (=> b!1555170 d!161915))

(declare-fun d!161917 () Bool)

(declare-fun res!1063930 () Bool)

(declare-fun e!866094 () Bool)

(assert (=> d!161917 (=> res!1063930 e!866094)))

(assert (=> d!161917 (= res!1063930 (= (select (arr!50064 _keys!618) #b00000000000000000000000000000000) lt!670332))))

(assert (=> d!161917 (= (arrayContainsKey!0 _keys!618 lt!670332 #b00000000000000000000000000000000) e!866094)))

(declare-fun b!1555425 () Bool)

(declare-fun e!866095 () Bool)

(assert (=> b!1555425 (= e!866094 e!866095)))

(declare-fun res!1063931 () Bool)

(assert (=> b!1555425 (=> (not res!1063931) (not e!866095))))

(assert (=> b!1555425 (= res!1063931 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun b!1555426 () Bool)

(assert (=> b!1555426 (= e!866095 (arrayContainsKey!0 _keys!618 lt!670332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!161917 (not res!1063930)) b!1555425))

(assert (= (and b!1555425 res!1063931) b!1555426))

(assert (=> d!161917 m!1433429))

(declare-fun m!1433809 () Bool)

(assert (=> b!1555426 m!1433809))

(assert (=> b!1555170 d!161917))

(declare-fun d!161919 () Bool)

(declare-fun lt!670457 () SeekEntryResult!13464)

(assert (=> d!161919 (and (or ((_ is Undefined!13464) lt!670457) (not ((_ is Found!13464) lt!670457)) (and (bvsge (index!56255 lt!670457) #b00000000000000000000000000000000) (bvslt (index!56255 lt!670457) (size!50615 _keys!618)))) (or ((_ is Undefined!13464) lt!670457) ((_ is Found!13464) lt!670457) (not ((_ is MissingZero!13464) lt!670457)) (and (bvsge (index!56254 lt!670457) #b00000000000000000000000000000000) (bvslt (index!56254 lt!670457) (size!50615 _keys!618)))) (or ((_ is Undefined!13464) lt!670457) ((_ is Found!13464) lt!670457) ((_ is MissingZero!13464) lt!670457) (not ((_ is MissingVacant!13464) lt!670457)) (and (bvsge (index!56257 lt!670457) #b00000000000000000000000000000000) (bvslt (index!56257 lt!670457) (size!50615 _keys!618)))) (or ((_ is Undefined!13464) lt!670457) (ite ((_ is Found!13464) lt!670457) (= (select (arr!50064 _keys!618) (index!56255 lt!670457)) (select (arr!50064 _keys!618) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13464) lt!670457) (= (select (arr!50064 _keys!618) (index!56254 lt!670457)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13464) lt!670457) (= (select (arr!50064 _keys!618) (index!56257 lt!670457)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!866103 () SeekEntryResult!13464)

(assert (=> d!161919 (= lt!670457 e!866103)))

(declare-fun c!143929 () Bool)

(declare-fun lt!670458 () SeekEntryResult!13464)

(assert (=> d!161919 (= c!143929 (and ((_ is Intermediate!13464) lt!670458) (undefined!14276 lt!670458)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!103746 (_ BitVec 32)) SeekEntryResult!13464)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!161919 (= lt!670458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) mask!926) (select (arr!50064 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(assert (=> d!161919 (validMask!0 mask!926)))

(assert (=> d!161919 (= (seekEntryOrOpen!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!670457)))

(declare-fun e!866104 () SeekEntryResult!13464)

(declare-fun b!1555439 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!103746 (_ BitVec 32)) SeekEntryResult!13464)

(assert (=> b!1555439 (= e!866104 (seekKeyOrZeroReturnVacant!0 (x!139212 lt!670458) (index!56256 lt!670458) (index!56256 lt!670458) (select (arr!50064 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(declare-fun b!1555440 () Bool)

(declare-fun c!143930 () Bool)

(declare-fun lt!670459 () (_ BitVec 64))

(assert (=> b!1555440 (= c!143930 (= lt!670459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!866102 () SeekEntryResult!13464)

(assert (=> b!1555440 (= e!866102 e!866104)))

(declare-fun b!1555441 () Bool)

(assert (=> b!1555441 (= e!866103 Undefined!13464)))

(declare-fun b!1555442 () Bool)

(assert (=> b!1555442 (= e!866102 (Found!13464 (index!56256 lt!670458)))))

(declare-fun b!1555443 () Bool)

(assert (=> b!1555443 (= e!866104 (MissingZero!13464 (index!56256 lt!670458)))))

(declare-fun b!1555444 () Bool)

(assert (=> b!1555444 (= e!866103 e!866102)))

(assert (=> b!1555444 (= lt!670459 (select (arr!50064 _keys!618) (index!56256 lt!670458)))))

(declare-fun c!143931 () Bool)

(assert (=> b!1555444 (= c!143931 (= lt!670459 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!161919 c!143929) b!1555441))

(assert (= (and d!161919 (not c!143929)) b!1555444))

(assert (= (and b!1555444 c!143931) b!1555442))

(assert (= (and b!1555444 (not c!143931)) b!1555440))

(assert (= (and b!1555440 c!143930) b!1555443))

(assert (= (and b!1555440 (not c!143930)) b!1555439))

(declare-fun m!1433811 () Bool)

(assert (=> d!161919 m!1433811))

(declare-fun m!1433813 () Bool)

(assert (=> d!161919 m!1433813))

(declare-fun m!1433815 () Bool)

(assert (=> d!161919 m!1433815))

(assert (=> d!161919 m!1433429))

(declare-fun m!1433817 () Bool)

(assert (=> d!161919 m!1433817))

(assert (=> d!161919 m!1433429))

(assert (=> d!161919 m!1433815))

(assert (=> d!161919 m!1433259))

(declare-fun m!1433819 () Bool)

(assert (=> d!161919 m!1433819))

(assert (=> b!1555439 m!1433429))

(declare-fun m!1433821 () Bool)

(assert (=> b!1555439 m!1433821))

(declare-fun m!1433823 () Bool)

(assert (=> b!1555444 m!1433823))

(assert (=> b!1555170 d!161919))

(declare-fun d!161921 () Bool)

(assert (=> d!161921 (= (get!26081 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50064 _keys!618) from!762))) (v!21982 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161777 d!161921))

(declare-fun c!143932 () Bool)

(declare-fun d!161923 () Bool)

(assert (=> d!161923 (= c!143932 (and ((_ is Cons!36238) (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (= (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!866105 () Option!803)

(assert (=> d!161923 (= (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50064 _keys!618) from!762)) e!866105)))

(declare-fun b!1555447 () Bool)

(declare-fun e!866106 () Option!803)

(assert (=> b!1555447 (= e!866106 (getValueByKey!728 (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555446 () Bool)

(assert (=> b!1555446 (= e!866105 e!866106)))

(declare-fun c!143933 () Bool)

(assert (=> b!1555446 (= c!143933 (and ((_ is Cons!36238) (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (= (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555445 () Bool)

(assert (=> b!1555445 (= e!866105 (Some!802 (_2!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1555448 () Bool)

(assert (=> b!1555448 (= e!866106 None!801)))

(assert (= (and d!161923 c!143932) b!1555445))

(assert (= (and d!161923 (not c!143932)) b!1555446))

(assert (= (and b!1555446 c!143933) b!1555447))

(assert (= (and b!1555446 (not c!143933)) b!1555448))

(assert (=> b!1555447 m!1433213))

(declare-fun m!1433825 () Bool)

(assert (=> b!1555447 m!1433825))

(assert (=> d!161777 d!161923))

(assert (=> b!1555200 d!161847))

(declare-fun d!161925 () Bool)

(declare-fun res!1063932 () Bool)

(declare-fun e!866107 () Bool)

(assert (=> d!161925 (=> res!1063932 e!866107)))

(assert (=> d!161925 (= res!1063932 (and ((_ is Cons!36238) (toList!11221 lt!670211)) (= (_1!12408 (h!37701 (toList!11221 lt!670211))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161925 (= (containsKey!754 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000) e!866107)))

(declare-fun b!1555449 () Bool)

(declare-fun e!866108 () Bool)

(assert (=> b!1555449 (= e!866107 e!866108)))

(declare-fun res!1063933 () Bool)

(assert (=> b!1555449 (=> (not res!1063933) (not e!866108))))

(assert (=> b!1555449 (= res!1063933 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670211))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670211))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36238) (toList!11221 lt!670211)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670211))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555450 () Bool)

(assert (=> b!1555450 (= e!866108 (containsKey!754 (t!50950 (toList!11221 lt!670211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161925 (not res!1063932)) b!1555449))

(assert (= (and b!1555449 res!1063933) b!1555450))

(declare-fun m!1433827 () Bool)

(assert (=> b!1555450 m!1433827))

(assert (=> d!161793 d!161925))

(declare-fun call!71499 () Bool)

(declare-fun bm!71496 () Bool)

(declare-fun c!143934 () Bool)

(assert (=> bm!71496 (= call!71499 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!143934 (Cons!36239 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240))))))

(declare-fun b!1555451 () Bool)

(declare-fun e!866109 () Bool)

(assert (=> b!1555451 (= e!866109 call!71499)))

(declare-fun d!161927 () Bool)

(declare-fun res!1063935 () Bool)

(declare-fun e!866111 () Bool)

(assert (=> d!161927 (=> res!1063935 e!866111)))

(assert (=> d!161927 (= res!1063935 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(assert (=> d!161927 (= (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) e!866111)))

(declare-fun b!1555452 () Bool)

(declare-fun e!866110 () Bool)

(assert (=> b!1555452 (= e!866111 e!866110)))

(declare-fun res!1063934 () Bool)

(assert (=> b!1555452 (=> (not res!1063934) (not e!866110))))

(declare-fun e!866112 () Bool)

(assert (=> b!1555452 (= res!1063934 (not e!866112))))

(declare-fun res!1063936 () Bool)

(assert (=> b!1555452 (=> (not res!1063936) (not e!866112))))

(assert (=> b!1555452 (= res!1063936 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1555453 () Bool)

(assert (=> b!1555453 (= e!866109 call!71499)))

(declare-fun b!1555454 () Bool)

(assert (=> b!1555454 (= e!866112 (contains!10177 (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1555455 () Bool)

(assert (=> b!1555455 (= e!866110 e!866109)))

(assert (=> b!1555455 (= c!143934 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!161927 (not res!1063935)) b!1555452))

(assert (= (and b!1555452 res!1063936) b!1555454))

(assert (= (and b!1555452 res!1063934) b!1555455))

(assert (= (and b!1555455 c!143934) b!1555451))

(assert (= (and b!1555455 (not c!143934)) b!1555453))

(assert (= (or b!1555451 b!1555453) bm!71496))

(assert (=> bm!71496 m!1433721))

(declare-fun m!1433829 () Bool)

(assert (=> bm!71496 m!1433829))

(assert (=> b!1555452 m!1433721))

(assert (=> b!1555452 m!1433721))

(assert (=> b!1555452 m!1433729))

(assert (=> b!1555454 m!1433721))

(assert (=> b!1555454 m!1433721))

(declare-fun m!1433831 () Bool)

(assert (=> b!1555454 m!1433831))

(assert (=> b!1555455 m!1433721))

(assert (=> b!1555455 m!1433721))

(assert (=> b!1555455 m!1433729))

(assert (=> bm!71478 d!161927))

(assert (=> d!161775 d!161779))

(assert (=> d!161775 d!161881))

(declare-fun d!161929 () Bool)

(assert (=> d!161929 (= (apply!1112 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50064 _keys!618) from!762)) (get!26081 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun bs!44635 () Bool)

(assert (= bs!44635 d!161929))

(assert (=> bs!44635 m!1433213))

(assert (=> bs!44635 m!1433749))

(assert (=> bs!44635 m!1433749))

(declare-fun m!1433833 () Bool)

(assert (=> bs!44635 m!1433833))

(assert (=> d!161775 d!161929))

(declare-fun d!161931 () Bool)

(assert (=> d!161931 (= (apply!1112 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50064 _keys!618) from!762)) (apply!1112 lt!670212 (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!161931 true))

(declare-fun _$34!1192 () Unit!51616)

(assert (=> d!161931 (= (choose!2031 lt!670212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50064 _keys!618) from!762)) _$34!1192)))

(declare-fun bs!44636 () Bool)

(assert (= bs!44636 d!161931))

(assert (=> bs!44636 m!1433227))

(assert (=> bs!44636 m!1433227))

(assert (=> bs!44636 m!1433213))

(assert (=> bs!44636 m!1433483))

(assert (=> bs!44636 m!1433213))

(assert (=> bs!44636 m!1433229))

(assert (=> d!161775 d!161931))

(assert (=> d!161775 d!161781))

(declare-fun d!161933 () Bool)

(declare-fun e!866113 () Bool)

(assert (=> d!161933 e!866113))

(declare-fun res!1063937 () Bool)

(assert (=> d!161933 (=> res!1063937 e!866113)))

(declare-fun lt!670461 () Bool)

(assert (=> d!161933 (= res!1063937 (not lt!670461))))

(declare-fun lt!670462 () Bool)

(assert (=> d!161933 (= lt!670461 lt!670462)))

(declare-fun lt!670463 () Unit!51616)

(declare-fun e!866114 () Unit!51616)

(assert (=> d!161933 (= lt!670463 e!866114)))

(declare-fun c!143935 () Bool)

(assert (=> d!161933 (= c!143935 lt!670462)))

(assert (=> d!161933 (= lt!670462 (containsKey!754 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161933 (= (contains!10173 lt!670291 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670461)))

(declare-fun b!1555456 () Bool)

(declare-fun lt!670460 () Unit!51616)

(assert (=> b!1555456 (= e!866114 lt!670460)))

(assert (=> b!1555456 (= lt!670460 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1555456 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555457 () Bool)

(declare-fun Unit!51638 () Unit!51616)

(assert (=> b!1555457 (= e!866114 Unit!51638)))

(declare-fun b!1555458 () Bool)

(assert (=> b!1555458 (= e!866113 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!161933 c!143935) b!1555456))

(assert (= (and d!161933 (not c!143935)) b!1555457))

(assert (= (and d!161933 (not res!1063937)) b!1555458))

(declare-fun m!1433835 () Bool)

(assert (=> d!161933 m!1433835))

(declare-fun m!1433837 () Bool)

(assert (=> b!1555456 m!1433837))

(assert (=> b!1555456 m!1433399))

(assert (=> b!1555456 m!1433399))

(declare-fun m!1433839 () Bool)

(assert (=> b!1555456 m!1433839))

(assert (=> b!1555458 m!1433399))

(assert (=> b!1555458 m!1433399))

(assert (=> b!1555458 m!1433839))

(assert (=> d!161755 d!161933))

(declare-fun d!161935 () Bool)

(declare-fun c!143936 () Bool)

(assert (=> d!161935 (= c!143936 (and ((_ is Cons!36238) lt!670292) (= (_1!12408 (h!37701 lt!670292)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!866115 () Option!803)

(assert (=> d!161935 (= (getValueByKey!728 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!866115)))

(declare-fun b!1555461 () Bool)

(declare-fun e!866116 () Option!803)

(assert (=> b!1555461 (= e!866116 (getValueByKey!728 (t!50950 lt!670292) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555460 () Bool)

(assert (=> b!1555460 (= e!866115 e!866116)))

(declare-fun c!143937 () Bool)

(assert (=> b!1555460 (= c!143937 (and ((_ is Cons!36238) lt!670292) (not (= (_1!12408 (h!37701 lt!670292)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1555459 () Bool)

(assert (=> b!1555459 (= e!866115 (Some!802 (_2!12408 (h!37701 lt!670292))))))

(declare-fun b!1555462 () Bool)

(assert (=> b!1555462 (= e!866116 None!801)))

(assert (= (and d!161935 c!143936) b!1555459))

(assert (= (and d!161935 (not c!143936)) b!1555460))

(assert (= (and b!1555460 c!143937) b!1555461))

(assert (= (and b!1555460 (not c!143937)) b!1555462))

(declare-fun m!1433841 () Bool)

(assert (=> b!1555461 m!1433841))

(assert (=> d!161755 d!161935))

(declare-fun d!161937 () Bool)

(assert (=> d!161937 (= (getValueByKey!728 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!802 (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!670464 () Unit!51616)

(assert (=> d!161937 (= lt!670464 (choose!2033 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866117 () Bool)

(assert (=> d!161937 e!866117))

(declare-fun res!1063938 () Bool)

(assert (=> d!161937 (=> (not res!1063938) (not e!866117))))

(assert (=> d!161937 (= res!1063938 (isStrictlySorted!875 lt!670292))))

(assert (=> d!161937 (= (lemmaContainsTupThenGetReturnValue!375 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670464)))

(declare-fun b!1555463 () Bool)

(declare-fun res!1063939 () Bool)

(assert (=> b!1555463 (=> (not res!1063939) (not e!866117))))

(assert (=> b!1555463 (= res!1063939 (containsKey!754 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555464 () Bool)

(assert (=> b!1555464 (= e!866117 (contains!10176 lt!670292 (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!161937 res!1063938) b!1555463))

(assert (= (and b!1555463 res!1063939) b!1555464))

(assert (=> d!161937 m!1433393))

(declare-fun m!1433843 () Bool)

(assert (=> d!161937 m!1433843))

(declare-fun m!1433845 () Bool)

(assert (=> d!161937 m!1433845))

(declare-fun m!1433847 () Bool)

(assert (=> b!1555463 m!1433847))

(declare-fun m!1433849 () Bool)

(assert (=> b!1555464 m!1433849))

(assert (=> d!161755 d!161937))

(declare-fun b!1555465 () Bool)

(declare-fun e!866121 () List!36242)

(declare-fun call!71500 () List!36242)

(assert (=> b!1555465 (= e!866121 call!71500)))

(declare-fun b!1555466 () Bool)

(declare-fun c!143938 () Bool)

(assert (=> b!1555466 (= c!143938 (and ((_ is Cons!36238) (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (bvsgt (_1!12408 (h!37701 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!866118 () List!36242)

(assert (=> b!1555466 (= e!866118 e!866121)))

(declare-fun b!1555467 () Bool)

(declare-fun e!866122 () List!36242)

(assert (=> b!1555467 (= e!866122 e!866118)))

(declare-fun c!143939 () Bool)

(assert (=> b!1555467 (= c!143939 (and ((_ is Cons!36238) (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (= (_1!12408 (h!37701 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!866120 () List!36242)

(declare-fun b!1555468 () Bool)

(assert (=> b!1555468 (= e!866120 (ite c!143939 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (ite c!143938 (Cons!36238 (h!37701 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) Nil!36239)))))

(declare-fun b!1555469 () Bool)

(declare-fun call!71501 () List!36242)

(assert (=> b!1555469 (= e!866122 call!71501)))

(declare-fun b!1555470 () Bool)

(declare-fun call!71502 () List!36242)

(assert (=> b!1555470 (= e!866118 call!71502)))

(declare-fun b!1555471 () Bool)

(declare-fun res!1063940 () Bool)

(declare-fun e!866119 () Bool)

(assert (=> b!1555471 (=> (not res!1063940) (not e!866119))))

(declare-fun lt!670465 () List!36242)

(assert (=> b!1555471 (= res!1063940 (containsKey!754 lt!670465 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555472 () Bool)

(assert (=> b!1555472 (= e!866121 call!71500)))

(declare-fun d!161939 () Bool)

(assert (=> d!161939 e!866119))

(declare-fun res!1063941 () Bool)

(assert (=> d!161939 (=> (not res!1063941) (not e!866119))))

(assert (=> d!161939 (= res!1063941 (isStrictlySorted!875 lt!670465))))

(assert (=> d!161939 (= lt!670465 e!866122)))

(declare-fun c!143940 () Bool)

(assert (=> d!161939 (= c!143940 (and ((_ is Cons!36238) (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (bvslt (_1!12408 (h!37701 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161939 (isStrictlySorted!875 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))))

(assert (=> d!161939 (= (insertStrictlySorted!504 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670465)))

(declare-fun bm!71497 () Bool)

(assert (=> bm!71497 (= call!71502 call!71501)))

(declare-fun bm!71498 () Bool)

(assert (=> bm!71498 (= call!71500 call!71502)))

(declare-fun b!1555473 () Bool)

(assert (=> b!1555473 (= e!866119 (contains!10176 lt!670465 (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555474 () Bool)

(assert (=> b!1555474 (= e!866120 (insertStrictlySorted!504 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun bm!71499 () Bool)

(assert (=> bm!71499 (= call!71501 ($colon$colon!943 e!866120 (ite c!143940 (h!37701 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun c!143941 () Bool)

(assert (=> bm!71499 (= c!143941 c!143940)))

(assert (= (and d!161939 c!143940) b!1555469))

(assert (= (and d!161939 (not c!143940)) b!1555467))

(assert (= (and b!1555467 c!143939) b!1555470))

(assert (= (and b!1555467 (not c!143939)) b!1555466))

(assert (= (and b!1555466 c!143938) b!1555472))

(assert (= (and b!1555466 (not c!143938)) b!1555465))

(assert (= (or b!1555472 b!1555465) bm!71498))

(assert (= (or b!1555470 bm!71498) bm!71497))

(assert (= (or b!1555469 bm!71497) bm!71499))

(assert (= (and bm!71499 c!143941) b!1555474))

(assert (= (and bm!71499 (not c!143941)) b!1555468))

(assert (= (and d!161939 res!1063941) b!1555471))

(assert (= (and b!1555471 res!1063940) b!1555473))

(declare-fun m!1433851 () Bool)

(assert (=> b!1555473 m!1433851))

(declare-fun m!1433853 () Bool)

(assert (=> bm!71499 m!1433853))

(declare-fun m!1433855 () Bool)

(assert (=> b!1555471 m!1433855))

(declare-fun m!1433857 () Bool)

(assert (=> b!1555474 m!1433857))

(declare-fun m!1433859 () Bool)

(assert (=> d!161939 m!1433859))

(declare-fun m!1433861 () Bool)

(assert (=> d!161939 m!1433861))

(assert (=> d!161755 d!161939))

(declare-fun b!1555476 () Bool)

(declare-fun e!866123 () Bool)

(assert (=> b!1555476 (= e!866123 tp_is_empty!38209)))

(declare-fun mapNonEmpty!59039 () Bool)

(declare-fun mapRes!59039 () Bool)

(declare-fun tp!112079 () Bool)

(declare-fun e!866124 () Bool)

(assert (=> mapNonEmpty!59039 (= mapRes!59039 (and tp!112079 e!866124))))

(declare-fun mapRest!59039 () (Array (_ BitVec 32) ValueCell!18194))

(declare-fun mapValue!59039 () ValueCell!18194)

(declare-fun mapKey!59039 () (_ BitVec 32))

(assert (=> mapNonEmpty!59039 (= mapRest!59038 (store mapRest!59039 mapKey!59039 mapValue!59039))))

(declare-fun condMapEmpty!59039 () Bool)

(declare-fun mapDefault!59039 () ValueCell!18194)

(assert (=> mapNonEmpty!59038 (= condMapEmpty!59039 (= mapRest!59038 ((as const (Array (_ BitVec 32) ValueCell!18194)) mapDefault!59039)))))

(assert (=> mapNonEmpty!59038 (= tp!112078 (and e!866123 mapRes!59039))))

(declare-fun mapIsEmpty!59039 () Bool)

(assert (=> mapIsEmpty!59039 mapRes!59039))

(declare-fun b!1555475 () Bool)

(assert (=> b!1555475 (= e!866124 tp_is_empty!38209)))

(assert (= (and mapNonEmpty!59038 condMapEmpty!59039) mapIsEmpty!59039))

(assert (= (and mapNonEmpty!59038 (not condMapEmpty!59039)) mapNonEmpty!59039))

(assert (= (and mapNonEmpty!59039 ((_ is ValueCellFull!18194) mapValue!59039)) b!1555475))

(assert (= (and mapNonEmpty!59038 ((_ is ValueCellFull!18194) mapDefault!59039)) b!1555476))

(declare-fun m!1433863 () Bool)

(assert (=> mapNonEmpty!59039 m!1433863))

(declare-fun b_lambda!24801 () Bool)

(assert (= b_lambda!24797 (or (and start!132718 b_free!31933) b_lambda!24801)))

(declare-fun b_lambda!24803 () Bool)

(assert (= b_lambda!24799 (or (and start!132718 b_free!31933) b_lambda!24803)))

(check-sat (not bm!71488) (not b!1555319) (not b!1555410) (not d!161915) (not b!1555386) (not b!1555338) (not b!1555452) (not b!1555329) (not bm!71499) (not d!161885) (not b_lambda!24801) (not d!161939) (not d!161835) (not d!161933) (not b_lambda!24793) (not b!1555463) (not b!1555327) (not b!1555356) (not d!161929) (not b!1555321) (not b!1555357) (not b!1555385) (not d!161839) (not b!1555282) (not b!1555239) (not d!161913) (not d!161863) (not b!1555458) (not b!1555371) (not d!161851) (not b!1555367) (not bm!71495) (not d!161827) (not b!1555273) (not b!1555291) (not bm!71491) (not d!161881) (not b!1555401) (not b!1555285) (not b!1555262) (not d!161897) (not b!1555395) (not d!161895) (not d!161893) (not b!1555409) (not d!161857) (not b!1555381) (not mapNonEmpty!59039) (not d!161903) (not d!161869) (not bm!71496) (not d!161841) (not d!161911) (not d!161859) (not b!1555388) tp_is_empty!38209 (not d!161909) (not b!1555366) (not b!1555455) (not d!161831) (not b!1555419) (not d!161849) (not d!161795) (not b!1555252) (not b!1555228) (not d!161807) (not b!1555375) (not bm!71494) (not b!1555398) (not b!1555373) (not b!1555454) (not b!1555237) (not b!1555368) (not b!1555292) (not b!1555232) (not b!1555383) (not b!1555244) (not b!1555236) (not b!1555269) (not b!1555322) (not b_next!31933) (not b!1555447) (not b!1555474) (not d!161819) (not d!161817) (not d!161919) (not b!1555345) (not b!1555426) (not b!1555241) (not bm!71479) (not b!1555396) (not b!1555238) (not b!1555248) (not b!1555461) (not b!1555347) (not b!1555243) (not b!1555330) (not b!1555411) (not d!161871) (not d!161855) (not b!1555332) (not b!1555403) (not b!1555351) (not d!161867) (not b!1555420) (not b!1555349) (not b!1555473) (not b!1555450) (not d!161937) b_and!51391 (not b!1555456) (not b_lambda!24803) (not d!161905) (not d!161865) (not b!1555439) (not b!1555414) (not b!1555335) (not b!1555325) (not b!1555364) (not b!1555245) (not b!1555280) (not b!1555354) (not b_lambda!24795) (not b!1555391) (not b!1555279) (not d!161877) (not b!1555277) (not b!1555389) (not d!161891) (not d!161901) (not d!161801) (not b!1555369) (not b!1555412) (not b_lambda!24787) (not b!1555348) (not b!1555393) (not b!1555471) (not d!161899) (not b!1555337) (not b!1555265) (not b!1555464) (not b!1555255) (not d!161879) (not d!161931) (not d!161907))
(check-sat b_and!51391 (not b_next!31933))
(get-model)

(declare-fun d!161941 () Bool)

(declare-fun c!143942 () Bool)

(assert (=> d!161941 (= c!143942 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670337))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670337)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866125 () Option!803)

(assert (=> d!161941 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670337)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866125)))

(declare-fun b!1555479 () Bool)

(declare-fun e!866126 () Option!803)

(assert (=> b!1555479 (= e!866126 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670337))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555478 () Bool)

(assert (=> b!1555478 (= e!866125 e!866126)))

(declare-fun c!143943 () Bool)

(assert (=> b!1555478 (= c!143943 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670337))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670337)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555477 () Bool)

(assert (=> b!1555477 (= e!866125 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670337))))))))

(declare-fun b!1555480 () Bool)

(assert (=> b!1555480 (= e!866126 None!801)))

(assert (= (and d!161941 c!143942) b!1555477))

(assert (= (and d!161941 (not c!143942)) b!1555478))

(assert (= (and b!1555478 c!143943) b!1555479))

(assert (= (and b!1555478 (not c!143943)) b!1555480))

(declare-fun m!1433865 () Bool)

(assert (=> b!1555479 m!1433865))

(assert (=> b!1555269 d!161941))

(assert (=> b!1555252 d!161873))

(assert (=> b!1555368 d!161815))

(declare-fun c!143944 () Bool)

(declare-fun d!161943 () Bool)

(assert (=> d!161943 (= c!143944 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670212))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212)))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!866127 () Option!803)

(assert (=> d!161943 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670212)) (select (arr!50064 _keys!618) from!762)) e!866127)))

(declare-fun e!866128 () Option!803)

(declare-fun b!1555483 () Bool)

(assert (=> b!1555483 (= e!866128 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670212))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555482 () Bool)

(assert (=> b!1555482 (= e!866127 e!866128)))

(declare-fun c!143945 () Bool)

(assert (=> b!1555482 (= c!143945 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670212))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212)))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555481 () Bool)

(assert (=> b!1555481 (= e!866127 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670212))))))))

(declare-fun b!1555484 () Bool)

(assert (=> b!1555484 (= e!866128 None!801)))

(assert (= (and d!161943 c!143944) b!1555481))

(assert (= (and d!161943 (not c!143944)) b!1555482))

(assert (= (and b!1555482 c!143945) b!1555483))

(assert (= (and b!1555482 (not c!143945)) b!1555484))

(assert (=> b!1555483 m!1433213))

(declare-fun m!1433867 () Bool)

(assert (=> b!1555483 m!1433867))

(assert (=> b!1555248 d!161943))

(declare-fun d!161945 () Bool)

(declare-fun c!143948 () Bool)

(assert (=> d!161945 (= c!143948 ((_ is Nil!36239) (toList!11221 lt!670352)))))

(declare-fun e!866131 () (InoxSet tuple2!24794))

(assert (=> d!161945 (= (content!783 (toList!11221 lt!670352)) e!866131)))

(declare-fun b!1555489 () Bool)

(assert (=> b!1555489 (= e!866131 ((as const (Array tuple2!24794 Bool)) false))))

(declare-fun b!1555490 () Bool)

(assert (=> b!1555490 (= e!866131 ((_ map or) (store ((as const (Array tuple2!24794 Bool)) false) (h!37701 (toList!11221 lt!670352)) true) (content!783 (t!50950 (toList!11221 lt!670352)))))))

(assert (= (and d!161945 c!143948) b!1555489))

(assert (= (and d!161945 (not c!143948)) b!1555490))

(declare-fun m!1433869 () Bool)

(assert (=> b!1555490 m!1433869))

(declare-fun m!1433871 () Bool)

(assert (=> b!1555490 m!1433871))

(assert (=> d!161901 d!161945))

(declare-fun d!161947 () Bool)

(declare-fun e!866132 () Bool)

(assert (=> d!161947 e!866132))

(declare-fun res!1063942 () Bool)

(assert (=> d!161947 (=> res!1063942 e!866132)))

(declare-fun lt!670467 () Bool)

(assert (=> d!161947 (= res!1063942 (not lt!670467))))

(declare-fun lt!670468 () Bool)

(assert (=> d!161947 (= lt!670467 lt!670468)))

(declare-fun lt!670469 () Unit!51616)

(declare-fun e!866133 () Unit!51616)

(assert (=> d!161947 (= lt!670469 e!866133)))

(declare-fun c!143949 () Bool)

(assert (=> d!161947 (= c!143949 lt!670468)))

(assert (=> d!161947 (= lt!670468 (containsKey!754 (toList!11221 lt!670435) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161947 (= (contains!10173 lt!670435 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!670467)))

(declare-fun b!1555491 () Bool)

(declare-fun lt!670466 () Unit!51616)

(assert (=> b!1555491 (= e!866133 lt!670466)))

(assert (=> b!1555491 (= lt!670466 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670435) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1555491 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670435) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1555492 () Bool)

(declare-fun Unit!51639 () Unit!51616)

(assert (=> b!1555492 (= e!866133 Unit!51639)))

(declare-fun b!1555493 () Bool)

(assert (=> b!1555493 (= e!866132 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670435) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!161947 c!143949) b!1555491))

(assert (= (and d!161947 (not c!143949)) b!1555492))

(assert (= (and d!161947 (not res!1063942)) b!1555493))

(declare-fun m!1433873 () Bool)

(assert (=> d!161947 m!1433873))

(declare-fun m!1433875 () Bool)

(assert (=> b!1555491 m!1433875))

(assert (=> b!1555491 m!1433779))

(assert (=> b!1555491 m!1433779))

(declare-fun m!1433877 () Bool)

(assert (=> b!1555491 m!1433877))

(assert (=> b!1555493 m!1433779))

(assert (=> b!1555493 m!1433779))

(assert (=> b!1555493 m!1433877))

(assert (=> d!161907 d!161947))

(declare-fun d!161949 () Bool)

(declare-fun c!143950 () Bool)

(assert (=> d!161949 (= c!143950 (and ((_ is Cons!36238) lt!670436) (= (_1!12408 (h!37701 lt!670436)) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!866134 () Option!803)

(assert (=> d!161949 (= (getValueByKey!728 lt!670436 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!866134)))

(declare-fun b!1555496 () Bool)

(declare-fun e!866135 () Option!803)

(assert (=> b!1555496 (= e!866135 (getValueByKey!728 (t!50950 lt!670436) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1555495 () Bool)

(assert (=> b!1555495 (= e!866134 e!866135)))

(declare-fun c!143951 () Bool)

(assert (=> b!1555495 (= c!143951 (and ((_ is Cons!36238) lt!670436) (not (= (_1!12408 (h!37701 lt!670436)) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1555494 () Bool)

(assert (=> b!1555494 (= e!866134 (Some!802 (_2!12408 (h!37701 lt!670436))))))

(declare-fun b!1555497 () Bool)

(assert (=> b!1555497 (= e!866135 None!801)))

(assert (= (and d!161949 c!143950) b!1555494))

(assert (= (and d!161949 (not c!143950)) b!1555495))

(assert (= (and b!1555495 c!143951) b!1555496))

(assert (= (and b!1555495 (not c!143951)) b!1555497))

(declare-fun m!1433879 () Bool)

(assert (=> b!1555496 m!1433879))

(assert (=> d!161907 d!161949))

(declare-fun d!161951 () Bool)

(assert (=> d!161951 (= (getValueByKey!728 lt!670436 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!802 (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!670470 () Unit!51616)

(assert (=> d!161951 (= lt!670470 (choose!2033 lt!670436 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!866136 () Bool)

(assert (=> d!161951 e!866136))

(declare-fun res!1063943 () Bool)

(assert (=> d!161951 (=> (not res!1063943) (not e!866136))))

(assert (=> d!161951 (= res!1063943 (isStrictlySorted!875 lt!670436))))

(assert (=> d!161951 (= (lemmaContainsTupThenGetReturnValue!375 lt!670436 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!670470)))

(declare-fun b!1555498 () Bool)

(declare-fun res!1063944 () Bool)

(assert (=> b!1555498 (=> (not res!1063944) (not e!866136))))

(assert (=> b!1555498 (= res!1063944 (containsKey!754 lt!670436 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1555499 () Bool)

(assert (=> b!1555499 (= e!866136 (contains!10176 lt!670436 (tuple2!24795 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!161951 res!1063943) b!1555498))

(assert (= (and b!1555498 res!1063944) b!1555499))

(assert (=> d!161951 m!1433773))

(declare-fun m!1433881 () Bool)

(assert (=> d!161951 m!1433881))

(declare-fun m!1433883 () Bool)

(assert (=> d!161951 m!1433883))

(declare-fun m!1433885 () Bool)

(assert (=> b!1555498 m!1433885))

(declare-fun m!1433887 () Bool)

(assert (=> b!1555499 m!1433887))

(assert (=> d!161907 d!161951))

(declare-fun b!1555500 () Bool)

(declare-fun e!866140 () List!36242)

(declare-fun call!71503 () List!36242)

(assert (=> b!1555500 (= e!866140 call!71503)))

(declare-fun b!1555501 () Bool)

(declare-fun c!143952 () Bool)

(assert (=> b!1555501 (= c!143952 (and ((_ is Cons!36238) (toList!11221 call!71475)) (bvsgt (_1!12408 (h!37701 (toList!11221 call!71475))) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!866137 () List!36242)

(assert (=> b!1555501 (= e!866137 e!866140)))

(declare-fun b!1555502 () Bool)

(declare-fun e!866141 () List!36242)

(assert (=> b!1555502 (= e!866141 e!866137)))

(declare-fun c!143953 () Bool)

(assert (=> b!1555502 (= c!143953 (and ((_ is Cons!36238) (toList!11221 call!71475)) (= (_1!12408 (h!37701 (toList!11221 call!71475))) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1555503 () Bool)

(declare-fun e!866139 () List!36242)

(assert (=> b!1555503 (= e!866139 (ite c!143953 (t!50950 (toList!11221 call!71475)) (ite c!143952 (Cons!36238 (h!37701 (toList!11221 call!71475)) (t!50950 (toList!11221 call!71475))) Nil!36239)))))

(declare-fun b!1555504 () Bool)

(declare-fun call!71504 () List!36242)

(assert (=> b!1555504 (= e!866141 call!71504)))

(declare-fun b!1555505 () Bool)

(declare-fun call!71505 () List!36242)

(assert (=> b!1555505 (= e!866137 call!71505)))

(declare-fun b!1555506 () Bool)

(declare-fun res!1063945 () Bool)

(declare-fun e!866138 () Bool)

(assert (=> b!1555506 (=> (not res!1063945) (not e!866138))))

(declare-fun lt!670471 () List!36242)

(assert (=> b!1555506 (= res!1063945 (containsKey!754 lt!670471 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1555507 () Bool)

(assert (=> b!1555507 (= e!866140 call!71503)))

(declare-fun d!161953 () Bool)

(assert (=> d!161953 e!866138))

(declare-fun res!1063946 () Bool)

(assert (=> d!161953 (=> (not res!1063946) (not e!866138))))

(assert (=> d!161953 (= res!1063946 (isStrictlySorted!875 lt!670471))))

(assert (=> d!161953 (= lt!670471 e!866141)))

(declare-fun c!143954 () Bool)

(assert (=> d!161953 (= c!143954 (and ((_ is Cons!36238) (toList!11221 call!71475)) (bvslt (_1!12408 (h!37701 (toList!11221 call!71475))) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!161953 (isStrictlySorted!875 (toList!11221 call!71475))))

(assert (=> d!161953 (= (insertStrictlySorted!504 (toList!11221 call!71475) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!670471)))

(declare-fun bm!71500 () Bool)

(assert (=> bm!71500 (= call!71505 call!71504)))

(declare-fun bm!71501 () Bool)

(assert (=> bm!71501 (= call!71503 call!71505)))

(declare-fun b!1555508 () Bool)

(assert (=> b!1555508 (= e!866138 (contains!10176 lt!670471 (tuple2!24795 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1555509 () Bool)

(assert (=> b!1555509 (= e!866139 (insertStrictlySorted!504 (t!50950 (toList!11221 call!71475)) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!71502 () Bool)

(assert (=> bm!71502 (= call!71504 ($colon$colon!943 e!866139 (ite c!143954 (h!37701 (toList!11221 call!71475)) (tuple2!24795 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!143955 () Bool)

(assert (=> bm!71502 (= c!143955 c!143954)))

(assert (= (and d!161953 c!143954) b!1555504))

(assert (= (and d!161953 (not c!143954)) b!1555502))

(assert (= (and b!1555502 c!143953) b!1555505))

(assert (= (and b!1555502 (not c!143953)) b!1555501))

(assert (= (and b!1555501 c!143952) b!1555507))

(assert (= (and b!1555501 (not c!143952)) b!1555500))

(assert (= (or b!1555507 b!1555500) bm!71501))

(assert (= (or b!1555505 bm!71501) bm!71500))

(assert (= (or b!1555504 bm!71500) bm!71502))

(assert (= (and bm!71502 c!143955) b!1555509))

(assert (= (and bm!71502 (not c!143955)) b!1555503))

(assert (= (and d!161953 res!1063946) b!1555506))

(assert (= (and b!1555506 res!1063945) b!1555508))

(declare-fun m!1433889 () Bool)

(assert (=> b!1555508 m!1433889))

(declare-fun m!1433891 () Bool)

(assert (=> bm!71502 m!1433891))

(declare-fun m!1433893 () Bool)

(assert (=> b!1555506 m!1433893))

(declare-fun m!1433895 () Bool)

(assert (=> b!1555509 m!1433895))

(declare-fun m!1433897 () Bool)

(assert (=> d!161953 m!1433897))

(declare-fun m!1433899 () Bool)

(assert (=> d!161953 m!1433899))

(assert (=> d!161907 d!161953))

(declare-fun d!161955 () Bool)

(declare-fun c!143956 () Bool)

(assert (=> d!161955 (= c!143956 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670204))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670204)))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!866142 () Option!803)

(assert (=> d!161955 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670204)) (select (arr!50064 _keys!618) from!762)) e!866142)))

(declare-fun e!866143 () Option!803)

(declare-fun b!1555512 () Bool)

(assert (=> b!1555512 (= e!866143 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670204))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555511 () Bool)

(assert (=> b!1555511 (= e!866142 e!866143)))

(declare-fun c!143957 () Bool)

(assert (=> b!1555511 (= c!143957 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670204))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670204)))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555510 () Bool)

(assert (=> b!1555510 (= e!866142 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670204))))))))

(declare-fun b!1555513 () Bool)

(assert (=> b!1555513 (= e!866143 None!801)))

(assert (= (and d!161955 c!143956) b!1555510))

(assert (= (and d!161955 (not c!143956)) b!1555511))

(assert (= (and b!1555511 c!143957) b!1555512))

(assert (= (and b!1555511 (not c!143957)) b!1555513))

(assert (=> b!1555512 m!1433213))

(declare-fun m!1433901 () Bool)

(assert (=> b!1555512 m!1433901))

(assert (=> b!1555255 d!161955))

(declare-fun d!161957 () Bool)

(declare-fun res!1063947 () Bool)

(declare-fun e!866144 () Bool)

(assert (=> d!161957 (=> res!1063947 e!866144)))

(assert (=> d!161957 (= res!1063947 (and ((_ is Cons!36238) lt!670386) (= (_1!12408 (h!37701 lt!670386)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161957 (= (containsKey!754 lt!670386 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866144)))

(declare-fun b!1555514 () Bool)

(declare-fun e!866145 () Bool)

(assert (=> b!1555514 (= e!866144 e!866145)))

(declare-fun res!1063948 () Bool)

(assert (=> b!1555514 (=> (not res!1063948) (not e!866145))))

(assert (=> b!1555514 (= res!1063948 (and (or (not ((_ is Cons!36238) lt!670386)) (bvsle (_1!12408 (h!37701 lt!670386)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36238) lt!670386) (bvslt (_1!12408 (h!37701 lt!670386)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555515 () Bool)

(assert (=> b!1555515 (= e!866145 (containsKey!754 (t!50950 lt!670386) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161957 (not res!1063947)) b!1555514))

(assert (= (and b!1555514 res!1063948) b!1555515))

(declare-fun m!1433903 () Bool)

(assert (=> b!1555515 m!1433903))

(assert (=> b!1555319 d!161957))

(assert (=> d!161867 d!161869))

(assert (=> d!161867 d!161845))

(declare-fun d!161959 () Bool)

(assert (=> d!161959 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161959 true))

(declare-fun _$12!483 () Unit!51616)

(assert (=> d!161959 (= (choose!2032 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000) _$12!483)))

(declare-fun bs!44637 () Bool)

(assert (= bs!44637 d!161959))

(assert (=> bs!44637 m!1433453))

(assert (=> bs!44637 m!1433453))

(assert (=> bs!44637 m!1433519))

(assert (=> d!161867 d!161959))

(declare-fun d!161961 () Bool)

(declare-fun res!1063953 () Bool)

(declare-fun e!866150 () Bool)

(assert (=> d!161961 (=> res!1063953 e!866150)))

(assert (=> d!161961 (= res!1063953 (or ((_ is Nil!36239) (toList!11221 lt!670211)) ((_ is Nil!36239) (t!50950 (toList!11221 lt!670211)))))))

(assert (=> d!161961 (= (isStrictlySorted!875 (toList!11221 lt!670211)) e!866150)))

(declare-fun b!1555520 () Bool)

(declare-fun e!866151 () Bool)

(assert (=> b!1555520 (= e!866150 e!866151)))

(declare-fun res!1063954 () Bool)

(assert (=> b!1555520 (=> (not res!1063954) (not e!866151))))

(assert (=> b!1555520 (= res!1063954 (bvslt (_1!12408 (h!37701 (toList!11221 lt!670211))) (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211))))))))

(declare-fun b!1555521 () Bool)

(assert (=> b!1555521 (= e!866151 (isStrictlySorted!875 (t!50950 (toList!11221 lt!670211))))))

(assert (= (and d!161961 (not res!1063953)) b!1555520))

(assert (= (and b!1555520 res!1063954) b!1555521))

(declare-fun m!1433905 () Bool)

(assert (=> b!1555521 m!1433905))

(assert (=> d!161867 d!161961))

(declare-fun b!1555522 () Bool)

(declare-fun e!866156 () ListLongMap!22411)

(assert (=> b!1555522 (= e!866156 (ListLongMap!22412 Nil!36239))))

(declare-fun b!1555523 () Bool)

(declare-fun e!866157 () ListLongMap!22411)

(declare-fun call!71506 () ListLongMap!22411)

(assert (=> b!1555523 (= e!866157 call!71506)))

(declare-fun b!1555524 () Bool)

(declare-fun e!866158 () Bool)

(declare-fun e!866153 () Bool)

(assert (=> b!1555524 (= e!866158 e!866153)))

(assert (=> b!1555524 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun lt!670474 () ListLongMap!22411)

(declare-fun res!1063955 () Bool)

(assert (=> b!1555524 (= res!1063955 (contains!10173 lt!670474 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1555524 (=> (not res!1063955) (not e!866153))))

(declare-fun d!161963 () Bool)

(declare-fun e!866154 () Bool)

(assert (=> d!161963 e!866154))

(declare-fun res!1063958 () Bool)

(assert (=> d!161963 (=> (not res!1063958) (not e!866154))))

(assert (=> d!161963 (= res!1063958 (not (contains!10173 lt!670474 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161963 (= lt!670474 e!866156)))

(declare-fun c!143959 () Bool)

(assert (=> d!161963 (= c!143959 (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(assert (=> d!161963 (validMask!0 mask!926)))

(assert (=> d!161963 (= (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478) lt!670474)))

(declare-fun b!1555525 () Bool)

(assert (=> b!1555525 (= e!866156 e!866157)))

(declare-fun c!143958 () Bool)

(assert (=> b!1555525 (= c!143958 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!71503 () Bool)

(assert (=> bm!71503 (= call!71506 (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1555526 () Bool)

(declare-fun lt!670476 () Unit!51616)

(declare-fun lt!670478 () Unit!51616)

(assert (=> b!1555526 (= lt!670476 lt!670478)))

(declare-fun lt!670477 () (_ BitVec 64))

(declare-fun lt!670475 () V!59389)

(declare-fun lt!670472 () (_ BitVec 64))

(declare-fun lt!670473 () ListLongMap!22411)

(assert (=> b!1555526 (not (contains!10173 (+!5049 lt!670473 (tuple2!24795 lt!670472 lt!670475)) lt!670477))))

(assert (=> b!1555526 (= lt!670478 (addStillNotContains!514 lt!670473 lt!670472 lt!670475 lt!670477))))

(assert (=> b!1555526 (= lt!670477 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1555526 (= lt!670475 (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1555526 (= lt!670472 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1555526 (= lt!670473 call!71506)))

(assert (=> b!1555526 (= e!866157 (+!5049 call!71506 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1555527 () Bool)

(assert (=> b!1555527 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(assert (=> b!1555527 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50616 _values!470)))))

(assert (=> b!1555527 (= e!866153 (= (apply!1112 lt!670474 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555528 () Bool)

(declare-fun e!866152 () Bool)

(assert (=> b!1555528 (= e!866158 e!866152)))

(declare-fun c!143960 () Bool)

(assert (=> b!1555528 (= c!143960 (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun b!1555529 () Bool)

(declare-fun e!866155 () Bool)

(assert (=> b!1555529 (= e!866155 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1555529 (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1555530 () Bool)

(assert (=> b!1555530 (= e!866154 e!866158)))

(declare-fun c!143961 () Bool)

(assert (=> b!1555530 (= c!143961 e!866155)))

(declare-fun res!1063956 () Bool)

(assert (=> b!1555530 (=> (not res!1063956) (not e!866155))))

(assert (=> b!1555530 (= res!1063956 (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun b!1555531 () Bool)

(assert (=> b!1555531 (= e!866152 (isEmpty!1135 lt!670474))))

(declare-fun b!1555532 () Bool)

(declare-fun res!1063957 () Bool)

(assert (=> b!1555532 (=> (not res!1063957) (not e!866154))))

(assert (=> b!1555532 (= res!1063957 (not (contains!10173 lt!670474 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555533 () Bool)

(assert (=> b!1555533 (= e!866152 (= lt!670474 (getCurrentListMapNoExtraKeys!6681 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478)))))

(assert (= (and d!161963 c!143959) b!1555522))

(assert (= (and d!161963 (not c!143959)) b!1555525))

(assert (= (and b!1555525 c!143958) b!1555526))

(assert (= (and b!1555525 (not c!143958)) b!1555523))

(assert (= (or b!1555526 b!1555523) bm!71503))

(assert (= (and d!161963 res!1063958) b!1555532))

(assert (= (and b!1555532 res!1063957) b!1555530))

(assert (= (and b!1555530 res!1063956) b!1555529))

(assert (= (and b!1555530 c!143961) b!1555524))

(assert (= (and b!1555530 (not c!143961)) b!1555528))

(assert (= (and b!1555524 res!1063955) b!1555527))

(assert (= (and b!1555528 c!143960) b!1555533))

(assert (= (and b!1555528 (not c!143960)) b!1555531))

(declare-fun b_lambda!24805 () Bool)

(assert (=> (not b_lambda!24805) (not b!1555526)))

(assert (=> b!1555526 t!50949))

(declare-fun b_and!51393 () Bool)

(assert (= b_and!51391 (and (=> t!50949 result!26077) b_and!51393)))

(declare-fun b_lambda!24807 () Bool)

(assert (=> (not b_lambda!24807) (not b!1555527)))

(assert (=> b!1555527 t!50949))

(declare-fun b_and!51395 () Bool)

(assert (= b_and!51393 (and (=> t!50949 result!26077) b_and!51395)))

(declare-fun m!1433907 () Bool)

(assert (=> b!1555529 m!1433907))

(assert (=> b!1555529 m!1433907))

(declare-fun m!1433909 () Bool)

(assert (=> b!1555529 m!1433909))

(declare-fun m!1433911 () Bool)

(assert (=> d!161963 m!1433911))

(assert (=> d!161963 m!1433259))

(declare-fun m!1433913 () Bool)

(assert (=> b!1555526 m!1433913))

(assert (=> b!1555526 m!1433251))

(declare-fun m!1433915 () Bool)

(assert (=> b!1555526 m!1433915))

(assert (=> b!1555526 m!1433913))

(declare-fun m!1433917 () Bool)

(assert (=> b!1555526 m!1433917))

(declare-fun m!1433919 () Bool)

(assert (=> b!1555526 m!1433919))

(declare-fun m!1433921 () Bool)

(assert (=> b!1555526 m!1433921))

(assert (=> b!1555526 m!1433919))

(assert (=> b!1555526 m!1433907))

(assert (=> b!1555526 m!1433251))

(declare-fun m!1433923 () Bool)

(assert (=> b!1555526 m!1433923))

(declare-fun m!1433925 () Bool)

(assert (=> b!1555531 m!1433925))

(assert (=> b!1555527 m!1433913))

(assert (=> b!1555527 m!1433251))

(assert (=> b!1555527 m!1433915))

(assert (=> b!1555527 m!1433913))

(assert (=> b!1555527 m!1433251))

(assert (=> b!1555527 m!1433907))

(declare-fun m!1433927 () Bool)

(assert (=> b!1555527 m!1433927))

(assert (=> b!1555527 m!1433907))

(declare-fun m!1433929 () Bool)

(assert (=> bm!71503 m!1433929))

(assert (=> b!1555524 m!1433907))

(assert (=> b!1555524 m!1433907))

(declare-fun m!1433931 () Bool)

(assert (=> b!1555524 m!1433931))

(assert (=> b!1555533 m!1433929))

(assert (=> b!1555525 m!1433907))

(assert (=> b!1555525 m!1433907))

(assert (=> b!1555525 m!1433909))

(declare-fun m!1433933 () Bool)

(assert (=> b!1555532 m!1433933))

(assert (=> b!1555245 d!161963))

(declare-fun d!161965 () Bool)

(assert (=> d!161965 (= (get!26081 (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762))) (v!21982 (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161827 d!161965))

(declare-fun d!161967 () Bool)

(declare-fun c!143962 () Bool)

(assert (=> d!161967 (= c!143962 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (= (_1!12408 (h!37701 (toList!11221 lt!670309))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!866159 () Option!803)

(assert (=> d!161967 (= (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)) e!866159)))

(declare-fun e!866160 () Option!803)

(declare-fun b!1555536 () Bool)

(assert (=> b!1555536 (= e!866160 (getValueByKey!728 (t!50950 (toList!11221 lt!670309)) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555535 () Bool)

(assert (=> b!1555535 (= e!866159 e!866160)))

(declare-fun c!143963 () Bool)

(assert (=> b!1555535 (= c!143963 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670309))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555534 () Bool)

(assert (=> b!1555534 (= e!866159 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670309)))))))

(declare-fun b!1555537 () Bool)

(assert (=> b!1555537 (= e!866160 None!801)))

(assert (= (and d!161967 c!143962) b!1555534))

(assert (= (and d!161967 (not c!143962)) b!1555535))

(assert (= (and b!1555535 c!143963) b!1555536))

(assert (= (and b!1555535 (not c!143963)) b!1555537))

(assert (=> b!1555536 m!1433213))

(declare-fun m!1433935 () Bool)

(assert (=> b!1555536 m!1433935))

(assert (=> d!161827 d!161967))

(declare-fun d!161969 () Bool)

(declare-fun res!1063959 () Bool)

(declare-fun e!866161 () Bool)

(assert (=> d!161969 (=> res!1063959 e!866161)))

(assert (=> d!161969 (= res!1063959 (and ((_ is Cons!36238) (toList!11221 lt!670337)) (= (_1!12408 (h!37701 (toList!11221 lt!670337))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161969 (= (containsKey!754 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866161)))

(declare-fun b!1555538 () Bool)

(declare-fun e!866162 () Bool)

(assert (=> b!1555538 (= e!866161 e!866162)))

(declare-fun res!1063960 () Bool)

(assert (=> b!1555538 (=> (not res!1063960) (not e!866162))))

(assert (=> b!1555538 (= res!1063960 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670337))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670337))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36238) (toList!11221 lt!670337)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670337))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555539 () Bool)

(assert (=> b!1555539 (= e!866162 (containsKey!754 (t!50950 (toList!11221 lt!670337)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161969 (not res!1063959)) b!1555538))

(assert (= (and b!1555538 res!1063960) b!1555539))

(declare-fun m!1433937 () Bool)

(assert (=> b!1555539 m!1433937))

(assert (=> d!161851 d!161969))

(declare-fun d!161971 () Bool)

(declare-fun c!143964 () Bool)

(assert (=> d!161971 (= c!143964 (and ((_ is Cons!36238) (toList!11221 lt!670446)) (= (_1!12408 (h!37701 (toList!11221 lt!670446))) (_1!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(declare-fun e!866163 () Option!803)

(assert (=> d!161971 (= (getValueByKey!728 (toList!11221 lt!670446) (_1!12408 (tuple2!24795 lt!670307 lt!670310))) e!866163)))

(declare-fun e!866164 () Option!803)

(declare-fun b!1555542 () Bool)

(assert (=> b!1555542 (= e!866164 (getValueByKey!728 (t!50950 (toList!11221 lt!670446)) (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun b!1555541 () Bool)

(assert (=> b!1555541 (= e!866163 e!866164)))

(declare-fun c!143965 () Bool)

(assert (=> b!1555541 (= c!143965 (and ((_ is Cons!36238) (toList!11221 lt!670446)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670446))) (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))))

(declare-fun b!1555540 () Bool)

(assert (=> b!1555540 (= e!866163 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670446)))))))

(declare-fun b!1555543 () Bool)

(assert (=> b!1555543 (= e!866164 None!801)))

(assert (= (and d!161971 c!143964) b!1555540))

(assert (= (and d!161971 (not c!143964)) b!1555541))

(assert (= (and b!1555541 c!143965) b!1555542))

(assert (= (and b!1555541 (not c!143965)) b!1555543))

(declare-fun m!1433939 () Bool)

(assert (=> b!1555542 m!1433939))

(assert (=> b!1555419 d!161971))

(declare-fun d!161973 () Bool)

(assert (=> d!161973 (= (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762))) (not ((_ is Some!802) (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))))

(assert (=> d!161795 d!161973))

(declare-fun d!161975 () Bool)

(assert (=> d!161975 (= (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312)) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312))))))

(declare-fun bs!44638 () Bool)

(assert (= bs!44638 d!161975))

(assert (=> bs!44638 m!1433787))

(declare-fun m!1433941 () Bool)

(assert (=> bs!44638 m!1433941))

(assert (=> b!1555414 d!161975))

(declare-fun c!143966 () Bool)

(declare-fun d!161977 () Bool)

(assert (=> d!161977 (= c!143966 (and ((_ is Cons!36238) (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)))) (= (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))))) lt!670312)))))

(declare-fun e!866165 () Option!803)

(assert (=> d!161977 (= (getValueByKey!728 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312) e!866165)))

(declare-fun e!866166 () Option!803)

(declare-fun b!1555546 () Bool)

(assert (=> b!1555546 (= e!866166 (getValueByKey!728 (t!50950 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)))) lt!670312))))

(declare-fun b!1555545 () Bool)

(assert (=> b!1555545 (= e!866165 e!866166)))

(declare-fun c!143967 () Bool)

(assert (=> b!1555545 (= c!143967 (and ((_ is Cons!36238) (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)))) (not (= (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))))) lt!670312))))))

(declare-fun b!1555544 () Bool)

(assert (=> b!1555544 (= e!866165 (Some!802 (_2!12408 (h!37701 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)))))))))

(declare-fun b!1555547 () Bool)

(assert (=> b!1555547 (= e!866166 None!801)))

(assert (= (and d!161977 c!143966) b!1555544))

(assert (= (and d!161977 (not c!143966)) b!1555545))

(assert (= (and b!1555545 c!143967) b!1555546))

(assert (= (and b!1555545 (not c!143967)) b!1555547))

(declare-fun m!1433943 () Bool)

(assert (=> b!1555546 m!1433943))

(assert (=> b!1555414 d!161977))

(declare-fun d!161979 () Bool)

(declare-fun res!1063961 () Bool)

(declare-fun e!866167 () Bool)

(assert (=> d!161979 (=> res!1063961 e!866167)))

(assert (=> d!161979 (= res!1063961 (and ((_ is Cons!36238) lt!670292) (= (_1!12408 (h!37701 lt!670292)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161979 (= (containsKey!754 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!866167)))

(declare-fun b!1555548 () Bool)

(declare-fun e!866168 () Bool)

(assert (=> b!1555548 (= e!866167 e!866168)))

(declare-fun res!1063962 () Bool)

(assert (=> b!1555548 (=> (not res!1063962) (not e!866168))))

(assert (=> b!1555548 (= res!1063962 (and (or (not ((_ is Cons!36238) lt!670292)) (bvsle (_1!12408 (h!37701 lt!670292)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36238) lt!670292) (bvslt (_1!12408 (h!37701 lt!670292)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555549 () Bool)

(assert (=> b!1555549 (= e!866168 (containsKey!754 (t!50950 lt!670292) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161979 (not res!1063961)) b!1555548))

(assert (= (and b!1555548 res!1063962) b!1555549))

(declare-fun m!1433945 () Bool)

(assert (=> b!1555549 m!1433945))

(assert (=> b!1555463 d!161979))

(declare-fun d!161981 () Bool)

(assert (not d!161981))

(assert (=> b!1555409 d!161981))

(declare-fun d!161983 () Bool)

(assert (=> d!161983 (= (content!784 Nil!36240) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!161905 d!161983))

(assert (=> d!161899 d!161897))

(assert (=> d!161899 d!161781))

(declare-fun d!161985 () Bool)

(declare-fun res!1063963 () Bool)

(declare-fun e!866169 () Bool)

(assert (=> d!161985 (=> res!1063963 e!866169)))

(assert (=> d!161985 (= res!1063963 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (= (_1!12408 (h!37701 (toList!11221 lt!670309))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161985 (= (containsKey!754 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000) e!866169)))

(declare-fun b!1555550 () Bool)

(declare-fun e!866170 () Bool)

(assert (=> b!1555550 (= e!866169 e!866170)))

(declare-fun res!1063964 () Bool)

(assert (=> b!1555550 (=> (not res!1063964) (not e!866170))))

(assert (=> b!1555550 (= res!1063964 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670309))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670309))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36238) (toList!11221 lt!670309)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670309))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555551 () Bool)

(assert (=> b!1555551 (= e!866170 (containsKey!754 (t!50950 (toList!11221 lt!670309)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161985 (not res!1063963)) b!1555550))

(assert (= (and b!1555550 res!1063964) b!1555551))

(declare-fun m!1433947 () Bool)

(assert (=> b!1555551 m!1433947))

(assert (=> d!161871 d!161985))

(declare-fun d!161987 () Bool)

(assert (=> d!161987 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!670479 () Unit!51616)

(assert (=> d!161987 (= lt!670479 (choose!2032 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!866171 () Bool)

(assert (=> d!161987 e!866171))

(declare-fun res!1063965 () Bool)

(assert (=> d!161987 (=> (not res!1063965) (not e!866171))))

(assert (=> d!161987 (= res!1063965 (isStrictlySorted!875 (toList!11221 lt!670344)))))

(assert (=> d!161987 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670479)))

(declare-fun b!1555552 () Bool)

(assert (=> b!1555552 (= e!866171 (containsKey!754 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161987 res!1063965) b!1555552))

(assert (=> d!161987 m!1433471))

(assert (=> d!161987 m!1433471))

(assert (=> d!161987 m!1433599))

(declare-fun m!1433949 () Bool)

(assert (=> d!161987 m!1433949))

(declare-fun m!1433951 () Bool)

(assert (=> d!161987 m!1433951))

(assert (=> b!1555552 m!1433595))

(assert (=> b!1555280 d!161987))

(declare-fun d!161989 () Bool)

(assert (=> d!161989 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun bs!44639 () Bool)

(assert (= bs!44639 d!161989))

(assert (=> bs!44639 m!1433471))

(declare-fun m!1433953 () Bool)

(assert (=> bs!44639 m!1433953))

(assert (=> b!1555280 d!161989))

(assert (=> b!1555280 d!161799))

(declare-fun d!161991 () Bool)

(declare-fun lt!670480 () Bool)

(assert (=> d!161991 (= lt!670480 (select (content!783 lt!670353) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!866172 () Bool)

(assert (=> d!161991 (= lt!670480 e!866172)))

(declare-fun res!1063966 () Bool)

(assert (=> d!161991 (=> (not res!1063966) (not e!866172))))

(assert (=> d!161991 (= res!1063966 ((_ is Cons!36238) lt!670353))))

(assert (=> d!161991 (= (contains!10176 lt!670353 (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) lt!670480)))

(declare-fun b!1555553 () Bool)

(declare-fun e!866173 () Bool)

(assert (=> b!1555553 (= e!866172 e!866173)))

(declare-fun res!1063967 () Bool)

(assert (=> b!1555553 (=> res!1063967 e!866173)))

(assert (=> b!1555553 (= res!1063967 (= (h!37701 lt!670353) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555554 () Bool)

(assert (=> b!1555554 (= e!866173 (contains!10176 (t!50950 lt!670353) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161991 res!1063966) b!1555553))

(assert (= (and b!1555553 (not res!1063967)) b!1555554))

(declare-fun m!1433955 () Bool)

(assert (=> d!161991 m!1433955))

(declare-fun m!1433957 () Bool)

(assert (=> d!161991 m!1433957))

(declare-fun m!1433959 () Bool)

(assert (=> b!1555554 m!1433959))

(assert (=> b!1555357 d!161991))

(declare-fun d!161993 () Bool)

(declare-fun res!1063968 () Bool)

(declare-fun e!866174 () Bool)

(assert (=> d!161993 (=> res!1063968 e!866174)))

(assert (=> d!161993 (= res!1063968 (and ((_ is Cons!36238) (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (= (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161993 (= (containsKey!754 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)) e!866174)))

(declare-fun b!1555555 () Bool)

(declare-fun e!866175 () Bool)

(assert (=> b!1555555 (= e!866174 e!866175)))

(declare-fun res!1063969 () Bool)

(assert (=> b!1555555 (=> (not res!1063969) (not e!866175))))

(assert (=> b!1555555 (= res!1063969 (and (or (not ((_ is Cons!36238) (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (bvsle (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50064 _keys!618) from!762))) ((_ is Cons!36238) (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (bvslt (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun b!1555556 () Bool)

(assert (=> b!1555556 (= e!866175 (containsKey!754 (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!161993 (not res!1063968)) b!1555555))

(assert (= (and b!1555555 res!1063969) b!1555556))

(assert (=> b!1555556 m!1433213))

(declare-fun m!1433961 () Bool)

(assert (=> b!1555556 m!1433961))

(assert (=> d!161897 d!161993))

(declare-fun d!161995 () Bool)

(assert (=> d!161995 (= (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (and (not (= (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1555241 d!161995))

(declare-fun d!161997 () Bool)

(declare-fun c!143968 () Bool)

(assert (=> d!161997 (= c!143968 (and ((_ is Cons!36238) (t!50950 lt!670345)) (= (_1!12408 (h!37701 (t!50950 lt!670345))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866176 () Option!803)

(assert (=> d!161997 (= (getValueByKey!728 (t!50950 lt!670345) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866176)))

(declare-fun b!1555559 () Bool)

(declare-fun e!866177 () Option!803)

(assert (=> b!1555559 (= e!866177 (getValueByKey!728 (t!50950 (t!50950 lt!670345)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555558 () Bool)

(assert (=> b!1555558 (= e!866176 e!866177)))

(declare-fun c!143969 () Bool)

(assert (=> b!1555558 (= c!143969 (and ((_ is Cons!36238) (t!50950 lt!670345)) (not (= (_1!12408 (h!37701 (t!50950 lt!670345))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555557 () Bool)

(assert (=> b!1555557 (= e!866176 (Some!802 (_2!12408 (h!37701 (t!50950 lt!670345)))))))

(declare-fun b!1555560 () Bool)

(assert (=> b!1555560 (= e!866177 None!801)))

(assert (= (and d!161997 c!143968) b!1555557))

(assert (= (and d!161997 (not c!143968)) b!1555558))

(assert (= (and b!1555558 c!143969) b!1555559))

(assert (= (and b!1555558 (not c!143969)) b!1555560))

(declare-fun m!1433963 () Bool)

(assert (=> b!1555559 m!1433963))

(assert (=> b!1555285 d!161997))

(declare-fun d!161999 () Bool)

(assert (=> d!161999 (= (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1555391 d!161999))

(assert (=> bm!71479 d!161963))

(declare-fun d!162001 () Bool)

(declare-fun c!143970 () Bool)

(assert (=> d!162001 (= c!143970 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!866178 () Option!803)

(assert (=> d!162001 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670211)) #b1000000000000000000000000000000000000000000000000000000000000000) e!866178)))

(declare-fun b!1555563 () Bool)

(declare-fun e!866179 () Option!803)

(assert (=> b!1555563 (= e!866179 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670211))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555562 () Bool)

(assert (=> b!1555562 (= e!866178 e!866179)))

(declare-fun c!143971 () Bool)

(assert (=> b!1555562 (= c!143971 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555561 () Bool)

(assert (=> b!1555561 (= e!866178 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670211))))))))

(declare-fun b!1555564 () Bool)

(assert (=> b!1555564 (= e!866179 None!801)))

(assert (= (and d!162001 c!143970) b!1555561))

(assert (= (and d!162001 (not c!143970)) b!1555562))

(assert (= (and b!1555562 c!143971) b!1555563))

(assert (= (and b!1555562 (not c!143971)) b!1555564))

(declare-fun m!1433965 () Bool)

(assert (=> b!1555563 m!1433965))

(assert (=> b!1555265 d!162001))

(declare-fun b!1555565 () Bool)

(declare-fun e!866183 () List!36242)

(declare-fun call!71507 () List!36242)

(assert (=> b!1555565 (= e!866183 call!71507)))

(declare-fun b!1555566 () Bool)

(declare-fun c!143972 () Bool)

(assert (=> b!1555566 (= c!143972 (and ((_ is Cons!36238) (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (bvsgt (_1!12408 (h!37701 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!866180 () List!36242)

(assert (=> b!1555566 (= e!866180 e!866183)))

(declare-fun b!1555567 () Bool)

(declare-fun e!866184 () List!36242)

(assert (=> b!1555567 (= e!866184 e!866180)))

(declare-fun c!143973 () Bool)

(assert (=> b!1555567 (= c!143973 (and ((_ is Cons!36238) (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555568 () Bool)

(declare-fun e!866182 () List!36242)

(assert (=> b!1555568 (= e!866182 (ite c!143973 (t!50950 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (ite c!143972 (Cons!36238 (h!37701 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (t!50950 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))))) Nil!36239)))))

(declare-fun b!1555569 () Bool)

(declare-fun call!71508 () List!36242)

(assert (=> b!1555569 (= e!866184 call!71508)))

(declare-fun b!1555570 () Bool)

(declare-fun call!71509 () List!36242)

(assert (=> b!1555570 (= e!866180 call!71509)))

(declare-fun b!1555571 () Bool)

(declare-fun res!1063970 () Bool)

(declare-fun e!866181 () Bool)

(assert (=> b!1555571 (=> (not res!1063970) (not e!866181))))

(declare-fun lt!670481 () List!36242)

(assert (=> b!1555571 (= res!1063970 (containsKey!754 lt!670481 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555572 () Bool)

(assert (=> b!1555572 (= e!866183 call!71507)))

(declare-fun d!162003 () Bool)

(assert (=> d!162003 e!866181))

(declare-fun res!1063971 () Bool)

(assert (=> d!162003 (=> (not res!1063971) (not e!866181))))

(assert (=> d!162003 (= res!1063971 (isStrictlySorted!875 lt!670481))))

(assert (=> d!162003 (= lt!670481 e!866184)))

(declare-fun c!143974 () Bool)

(assert (=> d!162003 (= c!143974 (and ((_ is Cons!36238) (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (bvslt (_1!12408 (h!37701 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!162003 (isStrictlySorted!875 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))))))

(assert (=> d!162003 (= (insertStrictlySorted!504 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670481)))

(declare-fun bm!71504 () Bool)

(assert (=> bm!71504 (= call!71509 call!71508)))

(declare-fun bm!71505 () Bool)

(assert (=> bm!71505 (= call!71507 call!71509)))

(declare-fun b!1555573 () Bool)

(assert (=> b!1555573 (= e!866181 (contains!10176 lt!670481 (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555574 () Bool)

(assert (=> b!1555574 (= e!866182 (insertStrictlySorted!504 (t!50950 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun bm!71506 () Bool)

(assert (=> bm!71506 (= call!71508 ($colon$colon!943 e!866182 (ite c!143974 (h!37701 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun c!143975 () Bool)

(assert (=> bm!71506 (= c!143975 c!143974)))

(assert (= (and d!162003 c!143974) b!1555569))

(assert (= (and d!162003 (not c!143974)) b!1555567))

(assert (= (and b!1555567 c!143973) b!1555570))

(assert (= (and b!1555567 (not c!143973)) b!1555566))

(assert (= (and b!1555566 c!143972) b!1555572))

(assert (= (and b!1555566 (not c!143972)) b!1555565))

(assert (= (or b!1555572 b!1555565) bm!71505))

(assert (= (or b!1555570 bm!71505) bm!71504))

(assert (= (or b!1555569 bm!71504) bm!71506))

(assert (= (and bm!71506 c!143975) b!1555574))

(assert (= (and bm!71506 (not c!143975)) b!1555568))

(assert (= (and d!162003 res!1063971) b!1555571))

(assert (= (and b!1555571 res!1063970) b!1555573))

(declare-fun m!1433967 () Bool)

(assert (=> b!1555573 m!1433967))

(declare-fun m!1433969 () Bool)

(assert (=> bm!71506 m!1433969))

(declare-fun m!1433971 () Bool)

(assert (=> b!1555571 m!1433971))

(declare-fun m!1433973 () Bool)

(assert (=> b!1555574 m!1433973))

(declare-fun m!1433975 () Bool)

(assert (=> d!162003 m!1433975))

(declare-fun m!1433977 () Bool)

(assert (=> d!162003 m!1433977))

(assert (=> b!1555474 d!162003))

(declare-fun d!162005 () Bool)

(declare-fun lt!670482 () Bool)

(assert (=> d!162005 (= lt!670482 (select (content!783 (toList!11221 lt!670435)) (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!866185 () Bool)

(assert (=> d!162005 (= lt!670482 e!866185)))

(declare-fun res!1063972 () Bool)

(assert (=> d!162005 (=> (not res!1063972) (not e!866185))))

(assert (=> d!162005 (= res!1063972 ((_ is Cons!36238) (toList!11221 lt!670435)))))

(assert (=> d!162005 (= (contains!10176 (toList!11221 lt!670435) (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!670482)))

(declare-fun b!1555575 () Bool)

(declare-fun e!866186 () Bool)

(assert (=> b!1555575 (= e!866185 e!866186)))

(declare-fun res!1063973 () Bool)

(assert (=> b!1555575 (=> res!1063973 e!866186)))

(assert (=> b!1555575 (= res!1063973 (= (h!37701 (toList!11221 lt!670435)) (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1555576 () Bool)

(assert (=> b!1555576 (= e!866186 (contains!10176 (t!50950 (toList!11221 lt!670435)) (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!162005 res!1063972) b!1555575))

(assert (= (and b!1555575 (not res!1063973)) b!1555576))

(declare-fun m!1433979 () Bool)

(assert (=> d!162005 m!1433979))

(declare-fun m!1433981 () Bool)

(assert (=> d!162005 m!1433981))

(declare-fun m!1433983 () Bool)

(assert (=> b!1555576 m!1433983))

(assert (=> b!1555411 d!162005))

(declare-fun d!162007 () Bool)

(assert (=> d!162007 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun bs!44640 () Bool)

(assert (= bs!44640 d!162007))

(assert (=> bs!44640 m!1433399))

(declare-fun m!1433985 () Bool)

(assert (=> bs!44640 m!1433985))

(assert (=> b!1555458 d!162007))

(assert (=> b!1555458 d!161825))

(declare-fun d!162009 () Bool)

(assert (=> d!162009 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun bs!44641 () Bool)

(assert (= bs!44641 d!162009))

(assert (=> bs!44641 m!1433587))

(declare-fun m!1433987 () Bool)

(assert (=> bs!44641 m!1433987))

(assert (=> b!1555329 d!162009))

(assert (=> b!1555329 d!161967))

(declare-fun d!162011 () Bool)

(declare-fun e!866187 () Bool)

(assert (=> d!162011 e!866187))

(declare-fun res!1063974 () Bool)

(assert (=> d!162011 (=> res!1063974 e!866187)))

(declare-fun lt!670484 () Bool)

(assert (=> d!162011 (= res!1063974 (not lt!670484))))

(declare-fun lt!670485 () Bool)

(assert (=> d!162011 (= lt!670484 lt!670485)))

(declare-fun lt!670486 () Unit!51616)

(declare-fun e!866188 () Unit!51616)

(assert (=> d!162011 (= lt!670486 e!866188)))

(declare-fun c!143976 () Bool)

(assert (=> d!162011 (= c!143976 lt!670485)))

(assert (=> d!162011 (= lt!670485 (containsKey!754 (toList!11221 lt!670446) (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))

(assert (=> d!162011 (= (contains!10173 lt!670446 (_1!12408 (tuple2!24795 lt!670307 lt!670310))) lt!670484)))

(declare-fun b!1555577 () Bool)

(declare-fun lt!670483 () Unit!51616)

(assert (=> b!1555577 (= e!866188 lt!670483)))

(assert (=> b!1555577 (= lt!670483 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670446) (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))

(assert (=> b!1555577 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670446) (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun b!1555578 () Bool)

(declare-fun Unit!51640 () Unit!51616)

(assert (=> b!1555578 (= e!866188 Unit!51640)))

(declare-fun b!1555579 () Bool)

(assert (=> b!1555579 (= e!866187 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670446) (_1!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(assert (= (and d!162011 c!143976) b!1555577))

(assert (= (and d!162011 (not c!143976)) b!1555578))

(assert (= (and d!162011 (not res!1063974)) b!1555579))

(declare-fun m!1433989 () Bool)

(assert (=> d!162011 m!1433989))

(declare-fun m!1433991 () Bool)

(assert (=> b!1555577 m!1433991))

(assert (=> b!1555577 m!1433803))

(assert (=> b!1555577 m!1433803))

(declare-fun m!1433993 () Bool)

(assert (=> b!1555577 m!1433993))

(assert (=> b!1555579 m!1433803))

(assert (=> b!1555579 m!1433803))

(assert (=> b!1555579 m!1433993))

(assert (=> d!161913 d!162011))

(declare-fun c!143977 () Bool)

(declare-fun d!162013 () Bool)

(assert (=> d!162013 (= c!143977 (and ((_ is Cons!36238) lt!670447) (= (_1!12408 (h!37701 lt!670447)) (_1!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(declare-fun e!866189 () Option!803)

(assert (=> d!162013 (= (getValueByKey!728 lt!670447 (_1!12408 (tuple2!24795 lt!670307 lt!670310))) e!866189)))

(declare-fun e!866190 () Option!803)

(declare-fun b!1555582 () Bool)

(assert (=> b!1555582 (= e!866190 (getValueByKey!728 (t!50950 lt!670447) (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun b!1555581 () Bool)

(assert (=> b!1555581 (= e!866189 e!866190)))

(declare-fun c!143978 () Bool)

(assert (=> b!1555581 (= c!143978 (and ((_ is Cons!36238) lt!670447) (not (= (_1!12408 (h!37701 lt!670447)) (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))))

(declare-fun b!1555580 () Bool)

(assert (=> b!1555580 (= e!866189 (Some!802 (_2!12408 (h!37701 lt!670447))))))

(declare-fun b!1555583 () Bool)

(assert (=> b!1555583 (= e!866190 None!801)))

(assert (= (and d!162013 c!143977) b!1555580))

(assert (= (and d!162013 (not c!143977)) b!1555581))

(assert (= (and b!1555581 c!143978) b!1555582))

(assert (= (and b!1555581 (not c!143978)) b!1555583))

(declare-fun m!1433995 () Bool)

(assert (=> b!1555582 m!1433995))

(assert (=> d!161913 d!162013))

(declare-fun d!162015 () Bool)

(assert (=> d!162015 (= (getValueByKey!728 lt!670447 (_1!12408 (tuple2!24795 lt!670307 lt!670310))) (Some!802 (_2!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun lt!670487 () Unit!51616)

(assert (=> d!162015 (= lt!670487 (choose!2033 lt!670447 (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun e!866191 () Bool)

(assert (=> d!162015 e!866191))

(declare-fun res!1063975 () Bool)

(assert (=> d!162015 (=> (not res!1063975) (not e!866191))))

(assert (=> d!162015 (= res!1063975 (isStrictlySorted!875 lt!670447))))

(assert (=> d!162015 (= (lemmaContainsTupThenGetReturnValue!375 lt!670447 (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310))) lt!670487)))

(declare-fun b!1555584 () Bool)

(declare-fun res!1063976 () Bool)

(assert (=> b!1555584 (=> (not res!1063976) (not e!866191))))

(assert (=> b!1555584 (= res!1063976 (containsKey!754 lt!670447 (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun b!1555585 () Bool)

(assert (=> b!1555585 (= e!866191 (contains!10176 lt!670447 (tuple2!24795 (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(assert (= (and d!162015 res!1063975) b!1555584))

(assert (= (and b!1555584 res!1063976) b!1555585))

(assert (=> d!162015 m!1433797))

(declare-fun m!1433997 () Bool)

(assert (=> d!162015 m!1433997))

(declare-fun m!1433999 () Bool)

(assert (=> d!162015 m!1433999))

(declare-fun m!1434001 () Bool)

(assert (=> b!1555584 m!1434001))

(declare-fun m!1434003 () Bool)

(assert (=> b!1555585 m!1434003))

(assert (=> d!161913 d!162015))

(declare-fun b!1555586 () Bool)

(declare-fun e!866195 () List!36242)

(declare-fun call!71510 () List!36242)

(assert (=> b!1555586 (= e!866195 call!71510)))

(declare-fun b!1555587 () Bool)

(declare-fun c!143979 () Bool)

(assert (=> b!1555587 (= c!143979 (and ((_ is Cons!36238) (toList!11221 lt!670308)) (bvsgt (_1!12408 (h!37701 (toList!11221 lt!670308))) (_1!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(declare-fun e!866192 () List!36242)

(assert (=> b!1555587 (= e!866192 e!866195)))

(declare-fun b!1555588 () Bool)

(declare-fun e!866196 () List!36242)

(assert (=> b!1555588 (= e!866196 e!866192)))

(declare-fun c!143980 () Bool)

(assert (=> b!1555588 (= c!143980 (and ((_ is Cons!36238) (toList!11221 lt!670308)) (= (_1!12408 (h!37701 (toList!11221 lt!670308))) (_1!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(declare-fun b!1555589 () Bool)

(declare-fun e!866194 () List!36242)

(assert (=> b!1555589 (= e!866194 (ite c!143980 (t!50950 (toList!11221 lt!670308)) (ite c!143979 (Cons!36238 (h!37701 (toList!11221 lt!670308)) (t!50950 (toList!11221 lt!670308))) Nil!36239)))))

(declare-fun b!1555590 () Bool)

(declare-fun call!71511 () List!36242)

(assert (=> b!1555590 (= e!866196 call!71511)))

(declare-fun b!1555591 () Bool)

(declare-fun call!71512 () List!36242)

(assert (=> b!1555591 (= e!866192 call!71512)))

(declare-fun b!1555592 () Bool)

(declare-fun res!1063977 () Bool)

(declare-fun e!866193 () Bool)

(assert (=> b!1555592 (=> (not res!1063977) (not e!866193))))

(declare-fun lt!670488 () List!36242)

(assert (=> b!1555592 (= res!1063977 (containsKey!754 lt!670488 (_1!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun b!1555593 () Bool)

(assert (=> b!1555593 (= e!866195 call!71510)))

(declare-fun d!162017 () Bool)

(assert (=> d!162017 e!866193))

(declare-fun res!1063978 () Bool)

(assert (=> d!162017 (=> (not res!1063978) (not e!866193))))

(assert (=> d!162017 (= res!1063978 (isStrictlySorted!875 lt!670488))))

(assert (=> d!162017 (= lt!670488 e!866196)))

(declare-fun c!143981 () Bool)

(assert (=> d!162017 (= c!143981 (and ((_ is Cons!36238) (toList!11221 lt!670308)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670308))) (_1!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(assert (=> d!162017 (isStrictlySorted!875 (toList!11221 lt!670308))))

(assert (=> d!162017 (= (insertStrictlySorted!504 (toList!11221 lt!670308) (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310))) lt!670488)))

(declare-fun bm!71507 () Bool)

(assert (=> bm!71507 (= call!71512 call!71511)))

(declare-fun bm!71508 () Bool)

(assert (=> bm!71508 (= call!71510 call!71512)))

(declare-fun b!1555594 () Bool)

(assert (=> b!1555594 (= e!866193 (contains!10176 lt!670488 (tuple2!24795 (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310)))))))

(declare-fun b!1555595 () Bool)

(assert (=> b!1555595 (= e!866194 (insertStrictlySorted!504 (t!50950 (toList!11221 lt!670308)) (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310))))))

(declare-fun bm!71509 () Bool)

(assert (=> bm!71509 (= call!71511 ($colon$colon!943 e!866194 (ite c!143981 (h!37701 (toList!11221 lt!670308)) (tuple2!24795 (_1!12408 (tuple2!24795 lt!670307 lt!670310)) (_2!12408 (tuple2!24795 lt!670307 lt!670310))))))))

(declare-fun c!143982 () Bool)

(assert (=> bm!71509 (= c!143982 c!143981)))

(assert (= (and d!162017 c!143981) b!1555590))

(assert (= (and d!162017 (not c!143981)) b!1555588))

(assert (= (and b!1555588 c!143980) b!1555591))

(assert (= (and b!1555588 (not c!143980)) b!1555587))

(assert (= (and b!1555587 c!143979) b!1555593))

(assert (= (and b!1555587 (not c!143979)) b!1555586))

(assert (= (or b!1555593 b!1555586) bm!71508))

(assert (= (or b!1555591 bm!71508) bm!71507))

(assert (= (or b!1555590 bm!71507) bm!71509))

(assert (= (and bm!71509 c!143982) b!1555595))

(assert (= (and bm!71509 (not c!143982)) b!1555589))

(assert (= (and d!162017 res!1063978) b!1555592))

(assert (= (and b!1555592 res!1063977) b!1555594))

(declare-fun m!1434005 () Bool)

(assert (=> b!1555594 m!1434005))

(declare-fun m!1434007 () Bool)

(assert (=> bm!71509 m!1434007))

(declare-fun m!1434009 () Bool)

(assert (=> b!1555592 m!1434009))

(declare-fun m!1434011 () Bool)

(assert (=> b!1555595 m!1434011))

(declare-fun m!1434013 () Bool)

(assert (=> d!162017 m!1434013))

(declare-fun m!1434015 () Bool)

(assert (=> d!162017 m!1434015))

(assert (=> d!161913 d!162017))

(assert (=> d!161807 d!161795))

(assert (=> d!161807 d!161797))

(declare-fun d!162019 () Bool)

(assert (=> d!162019 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!162019 true))

(declare-fun _$12!484 () Unit!51616)

(assert (=> d!162019 (= (choose!2032 (toList!11221 lt!670211) (select (arr!50064 _keys!618) from!762)) _$12!484)))

(declare-fun bs!44642 () Bool)

(assert (= bs!44642 d!162019))

(assert (=> bs!44642 m!1433213))

(assert (=> bs!44642 m!1433383))

(assert (=> bs!44642 m!1433383))

(assert (=> bs!44642 m!1433427))

(assert (=> d!161807 d!162019))

(assert (=> d!161807 d!161961))

(declare-fun d!162021 () Bool)

(assert (=> d!162021 (= ($colon$colon!943 e!866045 (ite c!143915 (h!37701 (toList!11221 lt!670212)) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (Cons!36238 (ite c!143915 (h!37701 (toList!11221 lt!670212)) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) e!866045))))

(assert (=> bm!71494 d!162021))

(declare-fun b!1555596 () Bool)

(declare-fun e!866200 () List!36242)

(declare-fun call!71513 () List!36242)

(assert (=> b!1555596 (= e!866200 call!71513)))

(declare-fun b!1555597 () Bool)

(declare-fun c!143983 () Bool)

(assert (=> b!1555597 (= c!143983 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670212))) (bvsgt (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866197 () List!36242)

(assert (=> b!1555597 (= e!866197 e!866200)))

(declare-fun b!1555598 () Bool)

(declare-fun e!866201 () List!36242)

(assert (=> b!1555598 (= e!866201 e!866197)))

(declare-fun c!143984 () Bool)

(assert (=> b!1555598 (= c!143984 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670212))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866199 () List!36242)

(declare-fun b!1555599 () Bool)

(assert (=> b!1555599 (= e!866199 (ite c!143984 (t!50950 (t!50950 (toList!11221 lt!670212))) (ite c!143983 (Cons!36238 (h!37701 (t!50950 (toList!11221 lt!670212))) (t!50950 (t!50950 (toList!11221 lt!670212)))) Nil!36239)))))

(declare-fun b!1555600 () Bool)

(declare-fun call!71514 () List!36242)

(assert (=> b!1555600 (= e!866201 call!71514)))

(declare-fun b!1555601 () Bool)

(declare-fun call!71515 () List!36242)

(assert (=> b!1555601 (= e!866197 call!71515)))

(declare-fun b!1555602 () Bool)

(declare-fun res!1063979 () Bool)

(declare-fun e!866198 () Bool)

(assert (=> b!1555602 (=> (not res!1063979) (not e!866198))))

(declare-fun lt!670489 () List!36242)

(assert (=> b!1555602 (= res!1063979 (containsKey!754 lt!670489 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555603 () Bool)

(assert (=> b!1555603 (= e!866200 call!71513)))

(declare-fun d!162023 () Bool)

(assert (=> d!162023 e!866198))

(declare-fun res!1063980 () Bool)

(assert (=> d!162023 (=> (not res!1063980) (not e!866198))))

(assert (=> d!162023 (= res!1063980 (isStrictlySorted!875 lt!670489))))

(assert (=> d!162023 (= lt!670489 e!866201)))

(declare-fun c!143985 () Bool)

(assert (=> d!162023 (= c!143985 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670212))) (bvslt (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!162023 (isStrictlySorted!875 (t!50950 (toList!11221 lt!670212)))))

(assert (=> d!162023 (= (insertStrictlySorted!504 (t!50950 (toList!11221 lt!670212)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670489)))

(declare-fun bm!71510 () Bool)

(assert (=> bm!71510 (= call!71515 call!71514)))

(declare-fun bm!71511 () Bool)

(assert (=> bm!71511 (= call!71513 call!71515)))

(declare-fun b!1555604 () Bool)

(assert (=> b!1555604 (= e!866198 (contains!10176 lt!670489 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555605 () Bool)

(assert (=> b!1555605 (= e!866199 (insertStrictlySorted!504 (t!50950 (t!50950 (toList!11221 lt!670212))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71512 () Bool)

(assert (=> bm!71512 (= call!71514 ($colon$colon!943 e!866199 (ite c!143985 (h!37701 (t!50950 (toList!11221 lt!670212))) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143986 () Bool)

(assert (=> bm!71512 (= c!143986 c!143985)))

(assert (= (and d!162023 c!143985) b!1555600))

(assert (= (and d!162023 (not c!143985)) b!1555598))

(assert (= (and b!1555598 c!143984) b!1555601))

(assert (= (and b!1555598 (not c!143984)) b!1555597))

(assert (= (and b!1555597 c!143983) b!1555603))

(assert (= (and b!1555597 (not c!143983)) b!1555596))

(assert (= (or b!1555603 b!1555596) bm!71511))

(assert (= (or b!1555601 bm!71511) bm!71510))

(assert (= (or b!1555600 bm!71510) bm!71512))

(assert (= (and bm!71512 c!143986) b!1555605))

(assert (= (and bm!71512 (not c!143986)) b!1555599))

(assert (= (and d!162023 res!1063980) b!1555602))

(assert (= (and b!1555602 res!1063979) b!1555604))

(declare-fun m!1434017 () Bool)

(assert (=> b!1555604 m!1434017))

(declare-fun m!1434019 () Bool)

(assert (=> bm!71512 m!1434019))

(declare-fun m!1434021 () Bool)

(assert (=> b!1555602 m!1434021))

(declare-fun m!1434023 () Bool)

(assert (=> b!1555605 m!1434023))

(declare-fun m!1434025 () Bool)

(assert (=> d!162023 m!1434025))

(declare-fun m!1434027 () Bool)

(assert (=> d!162023 m!1434027))

(assert (=> b!1555322 d!162023))

(declare-fun lt!670490 () Bool)

(declare-fun d!162025 () Bool)

(assert (=> d!162025 (= lt!670490 (select (content!783 (t!50950 (toList!11221 lt!670291))) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!866202 () Bool)

(assert (=> d!162025 (= lt!670490 e!866202)))

(declare-fun res!1063981 () Bool)

(assert (=> d!162025 (=> (not res!1063981) (not e!866202))))

(assert (=> d!162025 (= res!1063981 ((_ is Cons!36238) (t!50950 (toList!11221 lt!670291))))))

(assert (=> d!162025 (= (contains!10176 (t!50950 (toList!11221 lt!670291)) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670490)))

(declare-fun b!1555606 () Bool)

(declare-fun e!866203 () Bool)

(assert (=> b!1555606 (= e!866202 e!866203)))

(declare-fun res!1063982 () Bool)

(assert (=> b!1555606 (=> res!1063982 e!866203)))

(assert (=> b!1555606 (= res!1063982 (= (h!37701 (t!50950 (toList!11221 lt!670291))) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555607 () Bool)

(assert (=> b!1555607 (= e!866203 (contains!10176 (t!50950 (t!50950 (toList!11221 lt!670291))) (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!162025 res!1063981) b!1555606))

(assert (= (and b!1555606 (not res!1063982)) b!1555607))

(declare-fun m!1434029 () Bool)

(assert (=> d!162025 m!1434029))

(declare-fun m!1434031 () Bool)

(assert (=> d!162025 m!1434031))

(declare-fun m!1434033 () Bool)

(assert (=> b!1555607 m!1434033))

(assert (=> b!1555403 d!162025))

(assert (=> b!1555452 d!161999))

(declare-fun d!162027 () Bool)

(declare-fun e!866215 () Bool)

(assert (=> d!162027 e!866215))

(declare-fun c!143994 () Bool)

(declare-fun lt!670495 () SeekEntryResult!13464)

(assert (=> d!162027 (= c!143994 (and ((_ is Intermediate!13464) lt!670495) (undefined!14276 lt!670495)))))

(declare-fun e!866218 () SeekEntryResult!13464)

(assert (=> d!162027 (= lt!670495 e!866218)))

(declare-fun c!143993 () Bool)

(assert (=> d!162027 (= c!143993 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!670496 () (_ BitVec 64))

(assert (=> d!162027 (= lt!670496 (select (arr!50064 _keys!618) (toIndex!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) mask!926)))))

(assert (=> d!162027 (validMask!0 mask!926)))

(assert (=> d!162027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) mask!926) (select (arr!50064 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!670495)))

(declare-fun b!1555626 () Bool)

(declare-fun e!866214 () SeekEntryResult!13464)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1555626 (= e!866214 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) mask!926) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!926) (select (arr!50064 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(declare-fun b!1555627 () Bool)

(assert (=> b!1555627 (= e!866214 (Intermediate!13464 false (toIndex!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) mask!926) #b00000000000000000000000000000000))))

(declare-fun b!1555628 () Bool)

(assert (=> b!1555628 (and (bvsge (index!56256 lt!670495) #b00000000000000000000000000000000) (bvslt (index!56256 lt!670495) (size!50615 _keys!618)))))

(declare-fun res!1063991 () Bool)

(assert (=> b!1555628 (= res!1063991 (= (select (arr!50064 _keys!618) (index!56256 lt!670495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!866216 () Bool)

(assert (=> b!1555628 (=> res!1063991 e!866216)))

(declare-fun b!1555629 () Bool)

(assert (=> b!1555629 (= e!866218 e!866214)))

(declare-fun c!143995 () Bool)

(assert (=> b!1555629 (= c!143995 (or (= lt!670496 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)) (= (bvadd lt!670496 lt!670496) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555630 () Bool)

(declare-fun e!866217 () Bool)

(assert (=> b!1555630 (= e!866215 e!866217)))

(declare-fun res!1063990 () Bool)

(assert (=> b!1555630 (= res!1063990 (and ((_ is Intermediate!13464) lt!670495) (not (undefined!14276 lt!670495)) (bvslt (x!139212 lt!670495) #b01111111111111111111111111111110) (bvsge (x!139212 lt!670495) #b00000000000000000000000000000000) (bvsge (x!139212 lt!670495) #b00000000000000000000000000000000)))))

(assert (=> b!1555630 (=> (not res!1063990) (not e!866217))))

(declare-fun b!1555631 () Bool)

(assert (=> b!1555631 (= e!866215 (bvsge (x!139212 lt!670495) #b01111111111111111111111111111110))))

(declare-fun b!1555632 () Bool)

(assert (=> b!1555632 (= e!866218 (Intermediate!13464 true (toIndex!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) mask!926) #b00000000000000000000000000000000))))

(declare-fun b!1555633 () Bool)

(assert (=> b!1555633 (and (bvsge (index!56256 lt!670495) #b00000000000000000000000000000000) (bvslt (index!56256 lt!670495) (size!50615 _keys!618)))))

(declare-fun res!1063989 () Bool)

(assert (=> b!1555633 (= res!1063989 (= (select (arr!50064 _keys!618) (index!56256 lt!670495)) (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(assert (=> b!1555633 (=> res!1063989 e!866216)))

(assert (=> b!1555633 (= e!866217 e!866216)))

(declare-fun b!1555634 () Bool)

(assert (=> b!1555634 (and (bvsge (index!56256 lt!670495) #b00000000000000000000000000000000) (bvslt (index!56256 lt!670495) (size!50615 _keys!618)))))

(assert (=> b!1555634 (= e!866216 (= (select (arr!50064 _keys!618) (index!56256 lt!670495)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162027 c!143993) b!1555632))

(assert (= (and d!162027 (not c!143993)) b!1555629))

(assert (= (and b!1555629 c!143995) b!1555627))

(assert (= (and b!1555629 (not c!143995)) b!1555626))

(assert (= (and d!162027 c!143994) b!1555631))

(assert (= (and d!162027 (not c!143994)) b!1555630))

(assert (= (and b!1555630 res!1063990) b!1555633))

(assert (= (and b!1555633 (not res!1063989)) b!1555628))

(assert (= (and b!1555628 (not res!1063991)) b!1555634))

(declare-fun m!1434035 () Bool)

(assert (=> b!1555633 m!1434035))

(assert (=> b!1555626 m!1433815))

(declare-fun m!1434037 () Bool)

(assert (=> b!1555626 m!1434037))

(assert (=> b!1555626 m!1434037))

(assert (=> b!1555626 m!1433429))

(declare-fun m!1434039 () Bool)

(assert (=> b!1555626 m!1434039))

(assert (=> d!162027 m!1433815))

(declare-fun m!1434041 () Bool)

(assert (=> d!162027 m!1434041))

(assert (=> d!162027 m!1433259))

(assert (=> b!1555634 m!1434035))

(assert (=> b!1555628 m!1434035))

(assert (=> d!161919 d!162027))

(declare-fun d!162029 () Bool)

(declare-fun lt!670502 () (_ BitVec 32))

(declare-fun lt!670501 () (_ BitVec 32))

(assert (=> d!162029 (= lt!670502 (bvmul (bvxor lt!670501 (bvlshr lt!670501 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!162029 (= lt!670501 ((_ extract 31 0) (bvand (bvxor (select (arr!50064 _keys!618) #b00000000000000000000000000000000) (bvlshr (select (arr!50064 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!162029 (and (bvsge mask!926 #b00000000000000000000000000000000) (let ((res!1063992 (let ((h!37707 ((_ extract 31 0) (bvand (bvxor (select (arr!50064 _keys!618) #b00000000000000000000000000000000) (bvlshr (select (arr!50064 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!139222 (bvmul (bvxor h!37707 (bvlshr h!37707 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!139222 (bvlshr x!139222 #b00000000000000000000000000001101)) mask!926))))) (and (bvslt res!1063992 (bvadd mask!926 #b00000000000000000000000000000001)) (bvsge res!1063992 #b00000000000000000000000000000000))))))

(assert (=> d!162029 (= (toIndex!0 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) mask!926) (bvand (bvxor lt!670502 (bvlshr lt!670502 #b00000000000000000000000000001101)) mask!926))))

(assert (=> d!161919 d!162029))

(assert (=> d!161919 d!161745))

(declare-fun d!162031 () Bool)

(assert (=> d!162031 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44643 () Bool)

(assert (= bs!44643 d!162031))

(assert (=> bs!44643 m!1433717))

(declare-fun m!1434043 () Bool)

(assert (=> bs!44643 m!1434043))

(assert (=> b!1555388 d!162031))

(declare-fun d!162033 () Bool)

(declare-fun c!143996 () Bool)

(assert (=> d!162033 (= c!143996 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (= (_1!12408 (h!37701 (toList!11221 lt!670309))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!866219 () Option!803)

(assert (=> d!162033 (= (getValueByKey!728 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000) e!866219)))

(declare-fun b!1555637 () Bool)

(declare-fun e!866220 () Option!803)

(assert (=> b!1555637 (= e!866220 (getValueByKey!728 (t!50950 (toList!11221 lt!670309)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555636 () Bool)

(assert (=> b!1555636 (= e!866219 e!866220)))

(declare-fun c!143997 () Bool)

(assert (=> b!1555636 (= c!143997 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670309))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555635 () Bool)

(assert (=> b!1555635 (= e!866219 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670309)))))))

(declare-fun b!1555638 () Bool)

(assert (=> b!1555638 (= e!866220 None!801)))

(assert (= (and d!162033 c!143996) b!1555635))

(assert (= (and d!162033 (not c!143996)) b!1555636))

(assert (= (and b!1555636 c!143997) b!1555637))

(assert (= (and b!1555636 (not c!143997)) b!1555638))

(declare-fun m!1434045 () Bool)

(assert (=> b!1555637 m!1434045))

(assert (=> b!1555388 d!162033))

(declare-fun d!162035 () Bool)

(declare-fun res!1063993 () Bool)

(declare-fun e!866221 () Bool)

(assert (=> d!162035 (=> res!1063993 e!866221)))

(assert (=> d!162035 (= res!1063993 (or ((_ is Nil!36239) lt!670386) ((_ is Nil!36239) (t!50950 lt!670386))))))

(assert (=> d!162035 (= (isStrictlySorted!875 lt!670386) e!866221)))

(declare-fun b!1555639 () Bool)

(declare-fun e!866222 () Bool)

(assert (=> b!1555639 (= e!866221 e!866222)))

(declare-fun res!1063994 () Bool)

(assert (=> b!1555639 (=> (not res!1063994) (not e!866222))))

(assert (=> b!1555639 (= res!1063994 (bvslt (_1!12408 (h!37701 lt!670386)) (_1!12408 (h!37701 (t!50950 lt!670386)))))))

(declare-fun b!1555640 () Bool)

(assert (=> b!1555640 (= e!866222 (isStrictlySorted!875 (t!50950 lt!670386)))))

(assert (= (and d!162035 (not res!1063993)) b!1555639))

(assert (= (and b!1555639 res!1063994) b!1555640))

(declare-fun m!1434047 () Bool)

(assert (=> b!1555640 m!1434047))

(assert (=> d!161841 d!162035))

(declare-fun d!162037 () Bool)

(declare-fun res!1063995 () Bool)

(declare-fun e!866223 () Bool)

(assert (=> d!162037 (=> res!1063995 e!866223)))

(assert (=> d!162037 (= res!1063995 (or ((_ is Nil!36239) (toList!11221 lt!670212)) ((_ is Nil!36239) (t!50950 (toList!11221 lt!670212)))))))

(assert (=> d!162037 (= (isStrictlySorted!875 (toList!11221 lt!670212)) e!866223)))

(declare-fun b!1555641 () Bool)

(declare-fun e!866224 () Bool)

(assert (=> b!1555641 (= e!866223 e!866224)))

(declare-fun res!1063996 () Bool)

(assert (=> b!1555641 (=> (not res!1063996) (not e!866224))))

(assert (=> b!1555641 (= res!1063996 (bvslt (_1!12408 (h!37701 (toList!11221 lt!670212))) (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212))))))))

(declare-fun b!1555642 () Bool)

(assert (=> b!1555642 (= e!866224 (isStrictlySorted!875 (t!50950 (toList!11221 lt!670212))))))

(assert (= (and d!162037 (not res!1063995)) b!1555641))

(assert (= (and b!1555641 res!1063996) b!1555642))

(assert (=> b!1555642 m!1434027))

(assert (=> d!161841 d!162037))

(declare-fun d!162039 () Bool)

(declare-fun lt!670503 () Bool)

(assert (=> d!162039 (= lt!670503 (select (content!783 (t!50950 (toList!11221 lt!670337))) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!866225 () Bool)

(assert (=> d!162039 (= lt!670503 e!866225)))

(declare-fun res!1063997 () Bool)

(assert (=> d!162039 (=> (not res!1063997) (not e!866225))))

(assert (=> d!162039 (= res!1063997 ((_ is Cons!36238) (t!50950 (toList!11221 lt!670337))))))

(assert (=> d!162039 (= (contains!10176 (t!50950 (toList!11221 lt!670337)) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!670503)))

(declare-fun b!1555643 () Bool)

(declare-fun e!866226 () Bool)

(assert (=> b!1555643 (= e!866225 e!866226)))

(declare-fun res!1063998 () Bool)

(assert (=> b!1555643 (=> res!1063998 e!866226)))

(assert (=> b!1555643 (= res!1063998 (= (h!37701 (t!50950 (toList!11221 lt!670337))) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1555644 () Bool)

(assert (=> b!1555644 (= e!866226 (contains!10176 (t!50950 (t!50950 (toList!11221 lt!670337))) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!162039 res!1063997) b!1555643))

(assert (= (and b!1555643 (not res!1063998)) b!1555644))

(declare-fun m!1434049 () Bool)

(assert (=> d!162039 m!1434049))

(declare-fun m!1434051 () Bool)

(assert (=> d!162039 m!1434051))

(declare-fun m!1434053 () Bool)

(assert (=> b!1555644 m!1434053))

(assert (=> b!1555395 d!162039))

(declare-fun d!162041 () Bool)

(declare-fun res!1063999 () Bool)

(declare-fun e!866227 () Bool)

(assert (=> d!162041 (=> res!1063999 e!866227)))

(assert (=> d!162041 (= res!1063999 (= (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!670332))))

(assert (=> d!162041 (= (arrayContainsKey!0 _keys!618 lt!670332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!866227)))

(declare-fun b!1555645 () Bool)

(declare-fun e!866228 () Bool)

(assert (=> b!1555645 (= e!866227 e!866228)))

(declare-fun res!1064000 () Bool)

(assert (=> b!1555645 (=> (not res!1064000) (not e!866228))))

(assert (=> b!1555645 (= res!1064000 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun b!1555646 () Bool)

(assert (=> b!1555646 (= e!866228 (arrayContainsKey!0 _keys!618 lt!670332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!162041 (not res!1063999)) b!1555645))

(assert (= (and b!1555645 res!1064000) b!1555646))

(assert (=> d!162041 m!1433721))

(declare-fun m!1434055 () Bool)

(assert (=> b!1555646 m!1434055))

(assert (=> b!1555426 d!162041))

(declare-fun d!162043 () Bool)

(assert (=> d!162043 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun bs!44644 () Bool)

(assert (= bs!44644 d!162043))

(assert (=> bs!44644 m!1433489))

(declare-fun m!1434057 () Bool)

(assert (=> bs!44644 m!1434057))

(assert (=> b!1555385 d!162043))

(assert (=> b!1555385 d!161805))

(declare-fun d!162045 () Bool)

(assert (=> d!162045 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!670504 () Unit!51616)

(assert (=> d!162045 (= lt!670504 (choose!2032 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!866229 () Bool)

(assert (=> d!162045 e!866229))

(declare-fun res!1064001 () Bool)

(assert (=> d!162045 (=> (not res!1064001) (not e!866229))))

(assert (=> d!162045 (= res!1064001 (isStrictlySorted!875 (toList!11221 lt!670337)))))

(assert (=> d!162045 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670504)))

(declare-fun b!1555647 () Bool)

(assert (=> b!1555647 (= e!866229 (containsKey!754 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!162045 res!1064001) b!1555647))

(assert (=> d!162045 m!1433449))

(assert (=> d!162045 m!1433449))

(assert (=> d!162045 m!1433635))

(declare-fun m!1434059 () Bool)

(assert (=> d!162045 m!1434059))

(declare-fun m!1434061 () Bool)

(assert (=> d!162045 m!1434061))

(assert (=> b!1555647 m!1433631))

(assert (=> b!1555330 d!162045))

(declare-fun d!162047 () Bool)

(assert (=> d!162047 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670337) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun bs!44645 () Bool)

(assert (= bs!44645 d!162047))

(assert (=> bs!44645 m!1433449))

(declare-fun m!1434063 () Bool)

(assert (=> bs!44645 m!1434063))

(assert (=> b!1555330 d!162047))

(assert (=> b!1555330 d!161823))

(declare-fun d!162049 () Bool)

(assert (=> d!162049 (= (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!802) (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!161819 d!162049))

(declare-fun d!162051 () Bool)

(declare-fun c!143998 () Bool)

(assert (=> d!162051 (= c!143998 (and ((_ is Cons!36238) (t!50950 lt!670338)) (= (_1!12408 (h!37701 (t!50950 lt!670338))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866230 () Option!803)

(assert (=> d!162051 (= (getValueByKey!728 (t!50950 lt!670338) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866230)))

(declare-fun b!1555650 () Bool)

(declare-fun e!866231 () Option!803)

(assert (=> b!1555650 (= e!866231 (getValueByKey!728 (t!50950 (t!50950 lt!670338)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555649 () Bool)

(assert (=> b!1555649 (= e!866230 e!866231)))

(declare-fun c!143999 () Bool)

(assert (=> b!1555649 (= c!143999 (and ((_ is Cons!36238) (t!50950 lt!670338)) (not (= (_1!12408 (h!37701 (t!50950 lt!670338))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555648 () Bool)

(assert (=> b!1555648 (= e!866230 (Some!802 (_2!12408 (h!37701 (t!50950 lt!670338)))))))

(declare-fun b!1555651 () Bool)

(assert (=> b!1555651 (= e!866231 None!801)))

(assert (= (and d!162051 c!143998) b!1555648))

(assert (= (and d!162051 (not c!143998)) b!1555649))

(assert (= (and b!1555649 c!143999) b!1555650))

(assert (= (and b!1555649 (not c!143999)) b!1555651))

(declare-fun m!1434065 () Bool)

(assert (=> b!1555650 m!1434065))

(assert (=> b!1555335 d!162051))

(declare-fun d!162053 () Bool)

(assert (=> d!162053 (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670505 () Unit!51616)

(assert (=> d!162053 (= lt!670505 (choose!2032 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun e!866232 () Bool)

(assert (=> d!162053 e!866232))

(declare-fun res!1064002 () Bool)

(assert (=> d!162053 (=> (not res!1064002) (not e!866232))))

(assert (=> d!162053 (= res!1064002 (isStrictlySorted!875 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!162053 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)) lt!670505)))

(declare-fun b!1555652 () Bool)

(assert (=> b!1555652 (= e!866232 (containsKey!754 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!162053 res!1064002) b!1555652))

(assert (=> d!162053 m!1433213))

(assert (=> d!162053 m!1433749))

(assert (=> d!162053 m!1433749))

(assert (=> d!162053 m!1433751))

(assert (=> d!162053 m!1433213))

(declare-fun m!1434067 () Bool)

(assert (=> d!162053 m!1434067))

(declare-fun m!1434069 () Bool)

(assert (=> d!162053 m!1434069))

(assert (=> b!1555652 m!1433213))

(assert (=> b!1555652 m!1433745))

(assert (=> b!1555396 d!162053))

(declare-fun d!162055 () Bool)

(assert (=> d!162055 (= (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun bs!44646 () Bool)

(assert (= bs!44646 d!162055))

(assert (=> bs!44646 m!1433749))

(declare-fun m!1434071 () Bool)

(assert (=> bs!44646 m!1434071))

(assert (=> b!1555396 d!162055))

(declare-fun c!144000 () Bool)

(declare-fun d!162057 () Bool)

(assert (=> d!162057 (= c!144000 (and ((_ is Cons!36238) (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (= (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!866233 () Option!803)

(assert (=> d!162057 (= (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762)) e!866233)))

(declare-fun b!1555655 () Bool)

(declare-fun e!866234 () Option!803)

(assert (=> b!1555655 (= e!866234 (getValueByKey!728 (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555654 () Bool)

(assert (=> b!1555654 (= e!866233 e!866234)))

(declare-fun c!144001 () Bool)

(assert (=> b!1555654 (= c!144001 (and ((_ is Cons!36238) (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (not (= (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555653 () Bool)

(assert (=> b!1555653 (= e!866233 (Some!802 (_2!12408 (h!37701 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))))

(declare-fun b!1555656 () Bool)

(assert (=> b!1555656 (= e!866234 None!801)))

(assert (= (and d!162057 c!144000) b!1555653))

(assert (= (and d!162057 (not c!144000)) b!1555654))

(assert (= (and b!1555654 c!144001) b!1555655))

(assert (= (and b!1555654 (not c!144001)) b!1555656))

(assert (=> b!1555655 m!1433213))

(declare-fun m!1434073 () Bool)

(assert (=> b!1555655 m!1434073))

(assert (=> b!1555396 d!162057))

(declare-fun d!162059 () Bool)

(assert (=> d!162059 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!670506 () Unit!51616)

(assert (=> d!162059 (= lt!670506 (choose!2032 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!866235 () Bool)

(assert (=> d!162059 e!866235))

(declare-fun res!1064003 () Bool)

(assert (=> d!162059 (=> (not res!1064003) (not e!866235))))

(assert (=> d!162059 (= res!1064003 (isStrictlySorted!875 (toList!11221 lt!670309)))))

(assert (=> d!162059 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000) lt!670506)))

(declare-fun b!1555657 () Bool)

(assert (=> b!1555657 (= e!866235 (containsKey!754 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162059 res!1064003) b!1555657))

(assert (=> d!162059 m!1433693))

(assert (=> d!162059 m!1433693))

(assert (=> d!162059 m!1433695))

(declare-fun m!1434075 () Bool)

(assert (=> d!162059 m!1434075))

(declare-fun m!1434077 () Bool)

(assert (=> d!162059 m!1434077))

(assert (=> b!1555657 m!1433689))

(assert (=> b!1555369 d!162059))

(declare-fun d!162061 () Bool)

(assert (=> d!162061 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44647 () Bool)

(assert (= bs!44647 d!162061))

(assert (=> bs!44647 m!1433693))

(declare-fun m!1434079 () Bool)

(assert (=> bs!44647 m!1434079))

(assert (=> b!1555369 d!162061))

(declare-fun d!162063 () Bool)

(declare-fun c!144002 () Bool)

(assert (=> d!162063 (= c!144002 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (= (_1!12408 (h!37701 (toList!11221 lt!670309))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!866236 () Option!803)

(assert (=> d!162063 (= (getValueByKey!728 (toList!11221 lt!670309) #b0000000000000000000000000000000000000000000000000000000000000000) e!866236)))

(declare-fun b!1555660 () Bool)

(declare-fun e!866237 () Option!803)

(assert (=> b!1555660 (= e!866237 (getValueByKey!728 (t!50950 (toList!11221 lt!670309)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555659 () Bool)

(assert (=> b!1555659 (= e!866236 e!866237)))

(declare-fun c!144003 () Bool)

(assert (=> b!1555659 (= c!144003 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670309))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555658 () Bool)

(assert (=> b!1555658 (= e!866236 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670309)))))))

(declare-fun b!1555661 () Bool)

(assert (=> b!1555661 (= e!866237 None!801)))

(assert (= (and d!162063 c!144002) b!1555658))

(assert (= (and d!162063 (not c!144002)) b!1555659))

(assert (= (and b!1555659 c!144003) b!1555660))

(assert (= (and b!1555659 (not c!144003)) b!1555661))

(declare-fun m!1434081 () Bool)

(assert (=> b!1555660 m!1434081))

(assert (=> b!1555369 d!162063))

(declare-fun d!162065 () Bool)

(declare-fun c!144004 () Bool)

(assert (=> d!162065 (= c!144004 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670344))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670344)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866238 () Option!803)

(assert (=> d!162065 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670344)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866238)))

(declare-fun b!1555664 () Bool)

(declare-fun e!866239 () Option!803)

(assert (=> b!1555664 (= e!866239 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670344))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555663 () Bool)

(assert (=> b!1555663 (= e!866238 e!866239)))

(declare-fun c!144005 () Bool)

(assert (=> b!1555663 (= c!144005 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670344))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670344)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555662 () Bool)

(assert (=> b!1555662 (= e!866238 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670344))))))))

(declare-fun b!1555665 () Bool)

(assert (=> b!1555665 (= e!866239 None!801)))

(assert (= (and d!162065 c!144004) b!1555662))

(assert (= (and d!162065 (not c!144004)) b!1555663))

(assert (= (and b!1555663 c!144005) b!1555664))

(assert (= (and b!1555663 (not c!144005)) b!1555665))

(declare-fun m!1434083 () Bool)

(assert (=> b!1555664 m!1434083))

(assert (=> b!1555232 d!162065))

(declare-fun d!162067 () Bool)

(declare-fun res!1064004 () Bool)

(declare-fun e!866240 () Bool)

(assert (=> d!162067 (=> res!1064004 e!866240)))

(assert (=> d!162067 (= res!1064004 (or ((_ is Nil!36239) lt!670396) ((_ is Nil!36239) (t!50950 lt!670396))))))

(assert (=> d!162067 (= (isStrictlySorted!875 lt!670396) e!866240)))

(declare-fun b!1555666 () Bool)

(declare-fun e!866241 () Bool)

(assert (=> b!1555666 (= e!866240 e!866241)))

(declare-fun res!1064005 () Bool)

(assert (=> b!1555666 (=> (not res!1064005) (not e!866241))))

(assert (=> b!1555666 (= res!1064005 (bvslt (_1!12408 (h!37701 lt!670396)) (_1!12408 (h!37701 (t!50950 lt!670396)))))))

(declare-fun b!1555667 () Bool)

(assert (=> b!1555667 (= e!866241 (isStrictlySorted!875 (t!50950 lt!670396)))))

(assert (= (and d!162067 (not res!1064004)) b!1555666))

(assert (= (and b!1555666 res!1064005) b!1555667))

(declare-fun m!1434085 () Bool)

(assert (=> b!1555667 m!1434085))

(assert (=> d!161857 d!162067))

(declare-fun d!162069 () Bool)

(declare-fun res!1064006 () Bool)

(declare-fun e!866242 () Bool)

(assert (=> d!162069 (=> res!1064006 e!866242)))

(assert (=> d!162069 (= res!1064006 (or ((_ is Nil!36239) (toList!11221 call!71426)) ((_ is Nil!36239) (t!50950 (toList!11221 call!71426)))))))

(assert (=> d!162069 (= (isStrictlySorted!875 (toList!11221 call!71426)) e!866242)))

(declare-fun b!1555668 () Bool)

(declare-fun e!866243 () Bool)

(assert (=> b!1555668 (= e!866242 e!866243)))

(declare-fun res!1064007 () Bool)

(assert (=> b!1555668 (=> (not res!1064007) (not e!866243))))

(assert (=> b!1555668 (= res!1064007 (bvslt (_1!12408 (h!37701 (toList!11221 call!71426))) (_1!12408 (h!37701 (t!50950 (toList!11221 call!71426))))))))

(declare-fun b!1555669 () Bool)

(assert (=> b!1555669 (= e!866243 (isStrictlySorted!875 (t!50950 (toList!11221 call!71426))))))

(assert (= (and d!162069 (not res!1064006)) b!1555668))

(assert (= (and b!1555668 res!1064007) b!1555669))

(declare-fun m!1434087 () Bool)

(assert (=> b!1555669 m!1434087))

(assert (=> d!161857 d!162069))

(declare-fun d!162071 () Bool)

(declare-fun res!1064008 () Bool)

(declare-fun e!866244 () Bool)

(assert (=> d!162071 (=> res!1064008 e!866244)))

(assert (=> d!162071 (= res!1064008 (and ((_ is Cons!36238) (toList!11221 lt!670352)) (= (_1!12408 (h!37701 (toList!11221 lt!670352))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!162071 (= (containsKey!754 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!866244)))

(declare-fun b!1555670 () Bool)

(declare-fun e!866245 () Bool)

(assert (=> b!1555670 (= e!866244 e!866245)))

(declare-fun res!1064009 () Bool)

(assert (=> b!1555670 (=> (not res!1064009) (not e!866245))))

(assert (=> b!1555670 (= res!1064009 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670352))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670352))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36238) (toList!11221 lt!670352)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670352))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555671 () Bool)

(assert (=> b!1555671 (= e!866245 (containsKey!754 (t!50950 (toList!11221 lt!670352)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!162071 (not res!1064008)) b!1555670))

(assert (= (and b!1555670 res!1064009) b!1555671))

(declare-fun m!1434089 () Bool)

(assert (=> b!1555671 m!1434089))

(assert (=> d!161859 d!162071))

(declare-fun d!162073 () Bool)

(assert (=> d!162073 (= (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762))) (not ((_ is Some!802) (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))))

(assert (=> d!161893 d!162073))

(declare-fun lt!670507 () Bool)

(declare-fun d!162075 () Bool)

(assert (=> d!162075 (= lt!670507 (select (content!783 (toList!11221 lt!670446)) (tuple2!24795 lt!670307 lt!670310)))))

(declare-fun e!866246 () Bool)

(assert (=> d!162075 (= lt!670507 e!866246)))

(declare-fun res!1064010 () Bool)

(assert (=> d!162075 (=> (not res!1064010) (not e!866246))))

(assert (=> d!162075 (= res!1064010 ((_ is Cons!36238) (toList!11221 lt!670446)))))

(assert (=> d!162075 (= (contains!10176 (toList!11221 lt!670446) (tuple2!24795 lt!670307 lt!670310)) lt!670507)))

(declare-fun b!1555672 () Bool)

(declare-fun e!866247 () Bool)

(assert (=> b!1555672 (= e!866246 e!866247)))

(declare-fun res!1064011 () Bool)

(assert (=> b!1555672 (=> res!1064011 e!866247)))

(assert (=> b!1555672 (= res!1064011 (= (h!37701 (toList!11221 lt!670446)) (tuple2!24795 lt!670307 lt!670310)))))

(declare-fun b!1555673 () Bool)

(assert (=> b!1555673 (= e!866247 (contains!10176 (t!50950 (toList!11221 lt!670446)) (tuple2!24795 lt!670307 lt!670310)))))

(assert (= (and d!162075 res!1064010) b!1555672))

(assert (= (and b!1555672 (not res!1064011)) b!1555673))

(declare-fun m!1434091 () Bool)

(assert (=> d!162075 m!1434091))

(declare-fun m!1434093 () Bool)

(assert (=> d!162075 m!1434093))

(declare-fun m!1434095 () Bool)

(assert (=> b!1555673 m!1434095))

(assert (=> b!1555420 d!162075))

(assert (=> d!161839 d!161837))

(declare-fun d!162077 () Bool)

(assert (=> d!162077 (= (getValueByKey!728 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!162077 true))

(declare-fun _$22!586 () Unit!51616)

(assert (=> d!162077 (= (choose!2033 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) _$22!586)))

(declare-fun bs!44648 () Bool)

(assert (= bs!44648 d!162077))

(assert (=> bs!44648 m!1433465))

(assert (=> d!161839 d!162077))

(declare-fun d!162079 () Bool)

(declare-fun res!1064012 () Bool)

(declare-fun e!866248 () Bool)

(assert (=> d!162079 (=> res!1064012 e!866248)))

(assert (=> d!162079 (= res!1064012 (or ((_ is Nil!36239) lt!670345) ((_ is Nil!36239) (t!50950 lt!670345))))))

(assert (=> d!162079 (= (isStrictlySorted!875 lt!670345) e!866248)))

(declare-fun b!1555674 () Bool)

(declare-fun e!866249 () Bool)

(assert (=> b!1555674 (= e!866248 e!866249)))

(declare-fun res!1064013 () Bool)

(assert (=> b!1555674 (=> (not res!1064013) (not e!866249))))

(assert (=> b!1555674 (= res!1064013 (bvslt (_1!12408 (h!37701 lt!670345)) (_1!12408 (h!37701 (t!50950 lt!670345)))))))

(declare-fun b!1555675 () Bool)

(assert (=> b!1555675 (= e!866249 (isStrictlySorted!875 (t!50950 lt!670345)))))

(assert (= (and d!162079 (not res!1064012)) b!1555674))

(assert (= (and b!1555674 res!1064013) b!1555675))

(declare-fun m!1434097 () Bool)

(assert (=> b!1555675 m!1434097))

(assert (=> d!161839 d!162079))

(declare-fun lt!670508 () Bool)

(declare-fun d!162081 () Bool)

(assert (=> d!162081 (= lt!670508 (select (content!783 lt!670292) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!866250 () Bool)

(assert (=> d!162081 (= lt!670508 e!866250)))

(declare-fun res!1064014 () Bool)

(assert (=> d!162081 (=> (not res!1064014) (not e!866250))))

(assert (=> d!162081 (= res!1064014 ((_ is Cons!36238) lt!670292))))

(assert (=> d!162081 (= (contains!10176 lt!670292 (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) lt!670508)))

(declare-fun b!1555676 () Bool)

(declare-fun e!866251 () Bool)

(assert (=> b!1555676 (= e!866250 e!866251)))

(declare-fun res!1064015 () Bool)

(assert (=> b!1555676 (=> res!1064015 e!866251)))

(assert (=> b!1555676 (= res!1064015 (= (h!37701 lt!670292) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555677 () Bool)

(assert (=> b!1555677 (= e!866251 (contains!10176 (t!50950 lt!670292) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!162081 res!1064014) b!1555676))

(assert (= (and b!1555676 (not res!1064015)) b!1555677))

(declare-fun m!1434099 () Bool)

(assert (=> d!162081 m!1434099))

(declare-fun m!1434101 () Bool)

(assert (=> d!162081 m!1434101))

(declare-fun m!1434103 () Bool)

(assert (=> b!1555677 m!1434103))

(assert (=> b!1555464 d!162081))

(declare-fun d!162083 () Bool)

(assert (=> d!162083 (= (isEmpty!1137 (toList!11221 lt!670309)) ((_ is Nil!36239) (toList!11221 lt!670309)))))

(assert (=> d!161817 d!162083))

(declare-fun d!162085 () Bool)

(assert (=> d!162085 (= (get!26081 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762))) (v!21982 (getValueByKey!728 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!161929 d!162085))

(assert (=> d!161929 d!162057))

(declare-fun d!162087 () Bool)

(declare-fun res!1064016 () Bool)

(declare-fun e!866252 () Bool)

(assert (=> d!162087 (=> res!1064016 e!866252)))

(assert (=> d!162087 (= res!1064016 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!162087 (= (containsKey!754 (t!50950 (toList!11221 lt!670211)) #b1000000000000000000000000000000000000000000000000000000000000000) e!866252)))

(declare-fun b!1555678 () Bool)

(declare-fun e!866253 () Bool)

(assert (=> b!1555678 (= e!866252 e!866253)))

(declare-fun res!1064017 () Bool)

(assert (=> b!1555678 (=> (not res!1064017) (not e!866253))))

(assert (=> b!1555678 (= res!1064017 (and (or (not ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211)))) (bvsle (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (bvslt (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555679 () Bool)

(assert (=> b!1555679 (= e!866253 (containsKey!754 (t!50950 (t!50950 (toList!11221 lt!670211))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162087 (not res!1064016)) b!1555678))

(assert (= (and b!1555678 res!1064017) b!1555679))

(declare-fun m!1434105 () Bool)

(assert (=> b!1555679 m!1434105))

(assert (=> b!1555450 d!162087))

(declare-fun d!162089 () Bool)

(declare-fun c!144006 () Bool)

(assert (=> d!162089 (= c!144006 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670352))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670352)))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!866254 () Option!803)

(assert (=> d!162089 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670352)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!866254)))

(declare-fun b!1555682 () Bool)

(declare-fun e!866255 () Option!803)

(assert (=> b!1555682 (= e!866255 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670352))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1555681 () Bool)

(assert (=> b!1555681 (= e!866254 e!866255)))

(declare-fun c!144007 () Bool)

(assert (=> b!1555681 (= c!144007 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670352))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670352)))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun b!1555680 () Bool)

(assert (=> b!1555680 (= e!866254 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670352))))))))

(declare-fun b!1555683 () Bool)

(assert (=> b!1555683 (= e!866255 None!801)))

(assert (= (and d!162089 c!144006) b!1555680))

(assert (= (and d!162089 (not c!144006)) b!1555681))

(assert (= (and b!1555681 c!144007) b!1555682))

(assert (= (and b!1555681 (not c!144007)) b!1555683))

(declare-fun m!1434107 () Bool)

(assert (=> b!1555682 m!1434107))

(assert (=> b!1555277 d!162089))

(declare-fun d!162091 () Bool)

(declare-fun c!144008 () Bool)

(assert (=> d!162091 (= c!144008 ((_ is ValueCellFull!18194) (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun e!866256 () V!59389)

(assert (=> d!162091 (= (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) e!866256)))

(declare-fun b!1555684 () Bool)

(assert (=> b!1555684 (= e!866256 (get!26082 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555685 () Bool)

(assert (=> b!1555685 (= e!866256 (get!26083 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162091 c!144008) b!1555684))

(assert (= (and d!162091 (not c!144008)) b!1555685))

(assert (=> b!1555684 m!1433545))

(assert (=> b!1555684 m!1433251))

(declare-fun m!1434109 () Bool)

(assert (=> b!1555684 m!1434109))

(assert (=> b!1555685 m!1433545))

(assert (=> b!1555685 m!1433251))

(declare-fun m!1434111 () Bool)

(assert (=> b!1555685 m!1434111))

(assert (=> b!1555238 d!162091))

(declare-fun d!162093 () Bool)

(declare-fun e!866257 () Bool)

(assert (=> d!162093 e!866257))

(declare-fun res!1064019 () Bool)

(assert (=> d!162093 (=> (not res!1064019) (not e!866257))))

(declare-fun lt!670511 () ListLongMap!22411)

(assert (=> d!162093 (= res!1064019 (contains!10173 lt!670511 (_1!12408 (tuple2!24795 lt!670366 lt!670369))))))

(declare-fun lt!670512 () List!36242)

(assert (=> d!162093 (= lt!670511 (ListLongMap!22412 lt!670512))))

(declare-fun lt!670510 () Unit!51616)

(declare-fun lt!670509 () Unit!51616)

(assert (=> d!162093 (= lt!670510 lt!670509)))

(assert (=> d!162093 (= (getValueByKey!728 lt!670512 (_1!12408 (tuple2!24795 lt!670366 lt!670369))) (Some!802 (_2!12408 (tuple2!24795 lt!670366 lt!670369))))))

(assert (=> d!162093 (= lt!670509 (lemmaContainsTupThenGetReturnValue!375 lt!670512 (_1!12408 (tuple2!24795 lt!670366 lt!670369)) (_2!12408 (tuple2!24795 lt!670366 lt!670369))))))

(assert (=> d!162093 (= lt!670512 (insertStrictlySorted!504 (toList!11221 lt!670367) (_1!12408 (tuple2!24795 lt!670366 lt!670369)) (_2!12408 (tuple2!24795 lt!670366 lt!670369))))))

(assert (=> d!162093 (= (+!5049 lt!670367 (tuple2!24795 lt!670366 lt!670369)) lt!670511)))

(declare-fun b!1555686 () Bool)

(declare-fun res!1064018 () Bool)

(assert (=> b!1555686 (=> (not res!1064018) (not e!866257))))

(assert (=> b!1555686 (= res!1064018 (= (getValueByKey!728 (toList!11221 lt!670511) (_1!12408 (tuple2!24795 lt!670366 lt!670369))) (Some!802 (_2!12408 (tuple2!24795 lt!670366 lt!670369)))))))

(declare-fun b!1555687 () Bool)

(assert (=> b!1555687 (= e!866257 (contains!10176 (toList!11221 lt!670511) (tuple2!24795 lt!670366 lt!670369)))))

(assert (= (and d!162093 res!1064019) b!1555686))

(assert (= (and b!1555686 res!1064018) b!1555687))

(declare-fun m!1434113 () Bool)

(assert (=> d!162093 m!1434113))

(declare-fun m!1434115 () Bool)

(assert (=> d!162093 m!1434115))

(declare-fun m!1434117 () Bool)

(assert (=> d!162093 m!1434117))

(declare-fun m!1434119 () Bool)

(assert (=> d!162093 m!1434119))

(declare-fun m!1434121 () Bool)

(assert (=> b!1555686 m!1434121))

(declare-fun m!1434123 () Bool)

(assert (=> b!1555687 m!1434123))

(assert (=> b!1555238 d!162093))

(declare-fun d!162095 () Bool)

(assert (=> d!162095 (not (contains!10173 (+!5049 lt!670367 (tuple2!24795 lt!670366 lt!670369)) lt!670371))))

(declare-fun lt!670513 () Unit!51616)

(assert (=> d!162095 (= lt!670513 (choose!2034 lt!670367 lt!670366 lt!670369 lt!670371))))

(declare-fun e!866258 () Bool)

(assert (=> d!162095 e!866258))

(declare-fun res!1064020 () Bool)

(assert (=> d!162095 (=> (not res!1064020) (not e!866258))))

(assert (=> d!162095 (= res!1064020 (not (contains!10173 lt!670367 lt!670371)))))

(assert (=> d!162095 (= (addStillNotContains!514 lt!670367 lt!670366 lt!670369 lt!670371) lt!670513)))

(declare-fun b!1555688 () Bool)

(assert (=> b!1555688 (= e!866258 (not (= lt!670366 lt!670371)))))

(assert (= (and d!162095 res!1064020) b!1555688))

(assert (=> d!162095 m!1433551))

(assert (=> d!162095 m!1433551))

(assert (=> d!162095 m!1433553))

(declare-fun m!1434125 () Bool)

(assert (=> d!162095 m!1434125))

(declare-fun m!1434127 () Bool)

(assert (=> d!162095 m!1434127))

(assert (=> b!1555238 d!162095))

(declare-fun d!162097 () Bool)

(declare-fun e!866259 () Bool)

(assert (=> d!162097 e!866259))

(declare-fun res!1064022 () Bool)

(assert (=> d!162097 (=> (not res!1064022) (not e!866259))))

(declare-fun lt!670516 () ListLongMap!22411)

(assert (=> d!162097 (= res!1064022 (contains!10173 lt!670516 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!670517 () List!36242)

(assert (=> d!162097 (= lt!670516 (ListLongMap!22412 lt!670517))))

(declare-fun lt!670515 () Unit!51616)

(declare-fun lt!670514 () Unit!51616)

(assert (=> d!162097 (= lt!670515 lt!670514)))

(assert (=> d!162097 (= (getValueByKey!728 lt!670517 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!802 (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!162097 (= lt!670514 (lemmaContainsTupThenGetReturnValue!375 lt!670517 (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!162097 (= lt!670517 (insertStrictlySorted!504 (toList!11221 call!71482) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!162097 (= (+!5049 call!71482 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!670516)))

(declare-fun b!1555689 () Bool)

(declare-fun res!1064021 () Bool)

(assert (=> b!1555689 (=> (not res!1064021) (not e!866259))))

(assert (=> b!1555689 (= res!1064021 (= (getValueByKey!728 (toList!11221 lt!670516) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!802 (_2!12408 (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1555690 () Bool)

(assert (=> b!1555690 (= e!866259 (contains!10176 (toList!11221 lt!670516) (tuple2!24795 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26078 (select (arr!50065 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!162097 res!1064022) b!1555689))

(assert (= (and b!1555689 res!1064021) b!1555690))

(declare-fun m!1434129 () Bool)

(assert (=> d!162097 m!1434129))

(declare-fun m!1434131 () Bool)

(assert (=> d!162097 m!1434131))

(declare-fun m!1434133 () Bool)

(assert (=> d!162097 m!1434133))

(declare-fun m!1434135 () Bool)

(assert (=> d!162097 m!1434135))

(declare-fun m!1434137 () Bool)

(assert (=> b!1555689 m!1434137))

(declare-fun m!1434139 () Bool)

(assert (=> b!1555690 m!1434139))

(assert (=> b!1555238 d!162097))

(declare-fun d!162099 () Bool)

(declare-fun e!866260 () Bool)

(assert (=> d!162099 e!866260))

(declare-fun res!1064023 () Bool)

(assert (=> d!162099 (=> res!1064023 e!866260)))

(declare-fun lt!670519 () Bool)

(assert (=> d!162099 (= res!1064023 (not lt!670519))))

(declare-fun lt!670520 () Bool)

(assert (=> d!162099 (= lt!670519 lt!670520)))

(declare-fun lt!670521 () Unit!51616)

(declare-fun e!866261 () Unit!51616)

(assert (=> d!162099 (= lt!670521 e!866261)))

(declare-fun c!144009 () Bool)

(assert (=> d!162099 (= c!144009 lt!670520)))

(assert (=> d!162099 (= lt!670520 (containsKey!754 (toList!11221 (+!5049 lt!670367 (tuple2!24795 lt!670366 lt!670369))) lt!670371))))

(assert (=> d!162099 (= (contains!10173 (+!5049 lt!670367 (tuple2!24795 lt!670366 lt!670369)) lt!670371) lt!670519)))

(declare-fun b!1555691 () Bool)

(declare-fun lt!670518 () Unit!51616)

(assert (=> b!1555691 (= e!866261 lt!670518)))

(assert (=> b!1555691 (= lt!670518 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 (+!5049 lt!670367 (tuple2!24795 lt!670366 lt!670369))) lt!670371))))

(assert (=> b!1555691 (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670367 (tuple2!24795 lt!670366 lt!670369))) lt!670371))))

(declare-fun b!1555692 () Bool)

(declare-fun Unit!51641 () Unit!51616)

(assert (=> b!1555692 (= e!866261 Unit!51641)))

(declare-fun b!1555693 () Bool)

(assert (=> b!1555693 (= e!866260 (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670367 (tuple2!24795 lt!670366 lt!670369))) lt!670371)))))

(assert (= (and d!162099 c!144009) b!1555691))

(assert (= (and d!162099 (not c!144009)) b!1555692))

(assert (= (and d!162099 (not res!1064023)) b!1555693))

(declare-fun m!1434141 () Bool)

(assert (=> d!162099 m!1434141))

(declare-fun m!1434143 () Bool)

(assert (=> b!1555691 m!1434143))

(declare-fun m!1434145 () Bool)

(assert (=> b!1555691 m!1434145))

(assert (=> b!1555691 m!1434145))

(declare-fun m!1434147 () Bool)

(assert (=> b!1555691 m!1434147))

(assert (=> b!1555693 m!1434145))

(assert (=> b!1555693 m!1434145))

(assert (=> b!1555693 m!1434147))

(assert (=> b!1555238 d!162099))

(declare-fun d!162101 () Bool)

(assert (=> d!162101 (= ($colon$colon!943 e!866120 (ite c!143940 (h!37701 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (Cons!36238 (ite c!143940 (h!37701 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) e!866120))))

(assert (=> bm!71499 d!162101))

(declare-fun c!144010 () Bool)

(declare-fun d!162103 () Bool)

(assert (=> d!162103 (= c!144010 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!866262 () Option!803)

(assert (=> d!162103 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670211)) (select (arr!50064 _keys!618) from!762)) e!866262)))

(declare-fun e!866263 () Option!803)

(declare-fun b!1555696 () Bool)

(assert (=> b!1555696 (= e!866263 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670211))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555695 () Bool)

(assert (=> b!1555695 (= e!866262 e!866263)))

(declare-fun c!144011 () Bool)

(assert (=> b!1555695 (= c!144011 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555694 () Bool)

(assert (=> b!1555694 (= e!866262 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670211))))))))

(declare-fun b!1555697 () Bool)

(assert (=> b!1555697 (= e!866263 None!801)))

(assert (= (and d!162103 c!144010) b!1555694))

(assert (= (and d!162103 (not c!144010)) b!1555695))

(assert (= (and b!1555695 c!144011) b!1555696))

(assert (= (and b!1555695 (not c!144011)) b!1555697))

(assert (=> b!1555696 m!1433213))

(declare-fun m!1434149 () Bool)

(assert (=> b!1555696 m!1434149))

(assert (=> b!1555228 d!162103))

(declare-fun d!162105 () Bool)

(assert (=> d!162105 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!670522 () Unit!51616)

(assert (=> d!162105 (= lt!670522 (choose!2032 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun e!866264 () Bool)

(assert (=> d!162105 e!866264))

(declare-fun res!1064024 () Bool)

(assert (=> d!162105 (=> (not res!1064024) (not e!866264))))

(assert (=> d!162105 (= res!1064024 (isStrictlySorted!875 (toList!11221 lt!670352)))))

(assert (=> d!162105 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!670522)))

(declare-fun b!1555698 () Bool)

(assert (=> b!1555698 (= e!866264 (containsKey!754 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!162105 res!1064024) b!1555698))

(assert (=> d!162105 m!1433501))

(assert (=> d!162105 m!1433501))

(assert (=> d!162105 m!1433663))

(declare-fun m!1434151 () Bool)

(assert (=> d!162105 m!1434151))

(declare-fun m!1434153 () Bool)

(assert (=> d!162105 m!1434153))

(assert (=> b!1555698 m!1433659))

(assert (=> b!1555349 d!162105))

(declare-fun d!162107 () Bool)

(assert (=> d!162107 (= (isDefined!546 (getValueByKey!728 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (not (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670352) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun bs!44649 () Bool)

(assert (= bs!44649 d!162107))

(assert (=> bs!44649 m!1433501))

(declare-fun m!1434155 () Bool)

(assert (=> bs!44649 m!1434155))

(assert (=> b!1555349 d!162107))

(assert (=> b!1555349 d!161829))

(declare-fun d!162109 () Bool)

(declare-fun res!1064025 () Bool)

(declare-fun e!866265 () Bool)

(assert (=> d!162109 (=> res!1064025 e!866265)))

(assert (=> d!162109 (= res!1064025 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!162109 (= (containsKey!754 (t!50950 (toList!11221 lt!670211)) #b0000000000000000000000000000000000000000000000000000000000000000) e!866265)))

(declare-fun b!1555699 () Bool)

(declare-fun e!866266 () Bool)

(assert (=> b!1555699 (= e!866265 e!866266)))

(declare-fun res!1064026 () Bool)

(assert (=> b!1555699 (=> (not res!1064026) (not e!866266))))

(assert (=> b!1555699 (= res!1064026 (and (or (not ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211)))) (bvsle (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (bvslt (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555700 () Bool)

(assert (=> b!1555700 (= e!866266 (containsKey!754 (t!50950 (t!50950 (toList!11221 lt!670211))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162109 (not res!1064025)) b!1555699))

(assert (= (and b!1555699 res!1064026) b!1555700))

(declare-fun m!1434157 () Bool)

(assert (=> b!1555700 m!1434157))

(assert (=> b!1555262 d!162109))

(declare-fun d!162111 () Bool)

(assert (=> d!162111 (= ($colon$colon!943 e!866021 (ite c!143898 (h!37701 (toList!11221 lt!670212)) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (Cons!36238 (ite c!143898 (h!37701 (toList!11221 lt!670212)) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!866021))))

(assert (=> bm!71488 d!162111))

(declare-fun d!162113 () Bool)

(declare-fun res!1064027 () Bool)

(declare-fun e!866267 () Bool)

(assert (=> d!162113 (=> res!1064027 e!866267)))

(assert (=> d!162113 (= res!1064027 (and ((_ is Cons!36238) (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)))) (= (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))))) lt!670312)))))

(assert (=> d!162113 (= (containsKey!754 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312) e!866267)))

(declare-fun b!1555701 () Bool)

(declare-fun e!866268 () Bool)

(assert (=> b!1555701 (= e!866267 e!866268)))

(declare-fun res!1064028 () Bool)

(assert (=> b!1555701 (=> (not res!1064028) (not e!866268))))

(assert (=> b!1555701 (= res!1064028 (and (or (not ((_ is Cons!36238) (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))))) (bvsle (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))))) lt!670312)) ((_ is Cons!36238) (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)))) (bvslt (_1!12408 (h!37701 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))))) lt!670312)))))

(declare-fun b!1555702 () Bool)

(assert (=> b!1555702 (= e!866268 (containsKey!754 (t!50950 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)))) lt!670312))))

(assert (= (and d!162113 (not res!1064027)) b!1555701))

(assert (= (and b!1555701 res!1064028) b!1555702))

(declare-fun m!1434159 () Bool)

(assert (=> b!1555702 m!1434159))

(assert (=> d!161909 d!162113))

(assert (=> d!161911 d!161909))

(assert (=> d!161911 d!161913))

(declare-fun d!162115 () Bool)

(assert (=> d!162115 (not (contains!10173 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)) lt!670312))))

(assert (=> d!162115 true))

(declare-fun _$36!385 () Unit!51616)

(assert (=> d!162115 (= (choose!2034 lt!670308 lt!670307 lt!670310 lt!670312) _$36!385)))

(declare-fun bs!44650 () Bool)

(assert (= bs!44650 d!162115))

(assert (=> bs!44650 m!1433407))

(assert (=> bs!44650 m!1433407))

(assert (=> bs!44650 m!1433409))

(assert (=> d!161911 d!162115))

(declare-fun d!162117 () Bool)

(declare-fun e!866269 () Bool)

(assert (=> d!162117 e!866269))

(declare-fun res!1064029 () Bool)

(assert (=> d!162117 (=> res!1064029 e!866269)))

(declare-fun lt!670524 () Bool)

(assert (=> d!162117 (= res!1064029 (not lt!670524))))

(declare-fun lt!670525 () Bool)

(assert (=> d!162117 (= lt!670524 lt!670525)))

(declare-fun lt!670526 () Unit!51616)

(declare-fun e!866270 () Unit!51616)

(assert (=> d!162117 (= lt!670526 e!866270)))

(declare-fun c!144012 () Bool)

(assert (=> d!162117 (= c!144012 lt!670525)))

(assert (=> d!162117 (= lt!670525 (containsKey!754 (toList!11221 lt!670308) lt!670312))))

(assert (=> d!162117 (= (contains!10173 lt!670308 lt!670312) lt!670524)))

(declare-fun b!1555704 () Bool)

(declare-fun lt!670523 () Unit!51616)

(assert (=> b!1555704 (= e!866270 lt!670523)))

(assert (=> b!1555704 (= lt!670523 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670308) lt!670312))))

(assert (=> b!1555704 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670308) lt!670312))))

(declare-fun b!1555705 () Bool)

(declare-fun Unit!51642 () Unit!51616)

(assert (=> b!1555705 (= e!866270 Unit!51642)))

(declare-fun b!1555706 () Bool)

(assert (=> b!1555706 (= e!866269 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670308) lt!670312)))))

(assert (= (and d!162117 c!144012) b!1555704))

(assert (= (and d!162117 (not c!144012)) b!1555705))

(assert (= (and d!162117 (not res!1064029)) b!1555706))

(declare-fun m!1434161 () Bool)

(assert (=> d!162117 m!1434161))

(declare-fun m!1434163 () Bool)

(assert (=> b!1555704 m!1434163))

(declare-fun m!1434165 () Bool)

(assert (=> b!1555704 m!1434165))

(assert (=> b!1555704 m!1434165))

(declare-fun m!1434167 () Bool)

(assert (=> b!1555704 m!1434167))

(assert (=> b!1555706 m!1434165))

(assert (=> b!1555706 m!1434165))

(assert (=> b!1555706 m!1434167))

(assert (=> d!161911 d!162117))

(declare-fun d!162119 () Bool)

(declare-fun res!1064030 () Bool)

(declare-fun e!866271 () Bool)

(assert (=> d!162119 (=> res!1064030 e!866271)))

(assert (=> d!162119 (= res!1064030 (or ((_ is Nil!36239) lt!670402) ((_ is Nil!36239) (t!50950 lt!670402))))))

(assert (=> d!162119 (= (isStrictlySorted!875 lt!670402) e!866271)))

(declare-fun b!1555707 () Bool)

(declare-fun e!866272 () Bool)

(assert (=> b!1555707 (= e!866271 e!866272)))

(declare-fun res!1064031 () Bool)

(assert (=> b!1555707 (=> (not res!1064031) (not e!866272))))

(assert (=> b!1555707 (= res!1064031 (bvslt (_1!12408 (h!37701 lt!670402)) (_1!12408 (h!37701 (t!50950 lt!670402)))))))

(declare-fun b!1555708 () Bool)

(assert (=> b!1555708 (= e!866272 (isStrictlySorted!875 (t!50950 lt!670402)))))

(assert (= (and d!162119 (not res!1064030)) b!1555707))

(assert (= (and b!1555707 res!1064031) b!1555708))

(declare-fun m!1434169 () Bool)

(assert (=> b!1555708 m!1434169))

(assert (=> d!161865 d!162119))

(assert (=> d!161865 d!162037))

(declare-fun d!162121 () Bool)

(declare-fun c!144013 () Bool)

(assert (=> d!162121 (= c!144013 (and ((_ is Cons!36238) (t!50950 lt!670353)) (= (_1!12408 (h!37701 (t!50950 lt!670353))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!866273 () Option!803)

(assert (=> d!162121 (= (getValueByKey!728 (t!50950 lt!670353) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!866273)))

(declare-fun b!1555711 () Bool)

(declare-fun e!866274 () Option!803)

(assert (=> b!1555711 (= e!866274 (getValueByKey!728 (t!50950 (t!50950 lt!670353)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1555710 () Bool)

(assert (=> b!1555710 (= e!866273 e!866274)))

(declare-fun c!144014 () Bool)

(assert (=> b!1555710 (= c!144014 (and ((_ is Cons!36238) (t!50950 lt!670353)) (not (= (_1!12408 (h!37701 (t!50950 lt!670353))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun b!1555709 () Bool)

(assert (=> b!1555709 (= e!866273 (Some!802 (_2!12408 (h!37701 (t!50950 lt!670353)))))))

(declare-fun b!1555712 () Bool)

(assert (=> b!1555712 (= e!866274 None!801)))

(assert (= (and d!162121 c!144013) b!1555709))

(assert (= (and d!162121 (not c!144013)) b!1555710))

(assert (= (and b!1555710 c!144014) b!1555711))

(assert (= (and b!1555710 (not c!144014)) b!1555712))

(declare-fun m!1434171 () Bool)

(assert (=> b!1555711 m!1434171))

(assert (=> b!1555354 d!162121))

(assert (=> d!161855 d!161853))

(declare-fun d!162123 () Bool)

(assert (=> d!162123 (= (getValueByKey!728 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!162123 true))

(declare-fun _$22!587 () Unit!51616)

(assert (=> d!162123 (= (choose!2033 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) _$22!587)))

(declare-fun bs!44651 () Bool)

(assert (= bs!44651 d!162123))

(assert (=> bs!44651 m!1433443))

(assert (=> d!161855 d!162123))

(declare-fun d!162125 () Bool)

(declare-fun res!1064032 () Bool)

(declare-fun e!866275 () Bool)

(assert (=> d!162125 (=> res!1064032 e!866275)))

(assert (=> d!162125 (= res!1064032 (or ((_ is Nil!36239) lt!670338) ((_ is Nil!36239) (t!50950 lt!670338))))))

(assert (=> d!162125 (= (isStrictlySorted!875 lt!670338) e!866275)))

(declare-fun b!1555713 () Bool)

(declare-fun e!866276 () Bool)

(assert (=> b!1555713 (= e!866275 e!866276)))

(declare-fun res!1064033 () Bool)

(assert (=> b!1555713 (=> (not res!1064033) (not e!866276))))

(assert (=> b!1555713 (= res!1064033 (bvslt (_1!12408 (h!37701 lt!670338)) (_1!12408 (h!37701 (t!50950 lt!670338)))))))

(declare-fun b!1555714 () Bool)

(assert (=> b!1555714 (= e!866276 (isStrictlySorted!875 (t!50950 lt!670338)))))

(assert (= (and d!162125 (not res!1064032)) b!1555713))

(assert (= (and b!1555713 res!1064033) b!1555714))

(declare-fun m!1434173 () Bool)

(assert (=> b!1555714 m!1434173))

(assert (=> d!161855 d!162125))

(declare-fun d!162127 () Bool)

(declare-fun e!866277 () Bool)

(assert (=> d!162127 e!866277))

(declare-fun res!1064034 () Bool)

(assert (=> d!162127 (=> res!1064034 e!866277)))

(declare-fun lt!670528 () Bool)

(assert (=> d!162127 (= res!1064034 (not lt!670528))))

(declare-fun lt!670529 () Bool)

(assert (=> d!162127 (= lt!670528 lt!670529)))

(declare-fun lt!670530 () Unit!51616)

(declare-fun e!866278 () Unit!51616)

(assert (=> d!162127 (= lt!670530 e!866278)))

(declare-fun c!144015 () Bool)

(assert (=> d!162127 (= c!144015 lt!670529)))

(assert (=> d!162127 (= lt!670529 (containsKey!754 (toList!11221 lt!670368) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162127 (= (contains!10173 lt!670368 #b0000000000000000000000000000000000000000000000000000000000000000) lt!670528)))

(declare-fun b!1555715 () Bool)

(declare-fun lt!670527 () Unit!51616)

(assert (=> b!1555715 (= e!866278 lt!670527)))

(assert (=> b!1555715 (= lt!670527 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670368) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1555715 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670368) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555716 () Bool)

(declare-fun Unit!51643 () Unit!51616)

(assert (=> b!1555716 (= e!866278 Unit!51643)))

(declare-fun b!1555717 () Bool)

(assert (=> b!1555717 (= e!866277 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670368) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162127 c!144015) b!1555715))

(assert (= (and d!162127 (not c!144015)) b!1555716))

(assert (= (and d!162127 (not res!1064034)) b!1555717))

(declare-fun m!1434175 () Bool)

(assert (=> d!162127 m!1434175))

(declare-fun m!1434177 () Bool)

(assert (=> b!1555715 m!1434177))

(declare-fun m!1434179 () Bool)

(assert (=> b!1555715 m!1434179))

(assert (=> b!1555715 m!1434179))

(declare-fun m!1434181 () Bool)

(assert (=> b!1555715 m!1434181))

(assert (=> b!1555717 m!1434179))

(assert (=> b!1555717 m!1434179))

(assert (=> b!1555717 m!1434181))

(assert (=> d!161801 d!162127))

(assert (=> d!161801 d!161745))

(declare-fun d!162129 () Bool)

(declare-fun lt!670531 () Bool)

(assert (=> d!162129 (= lt!670531 (select (content!783 lt!670396) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866279 () Bool)

(assert (=> d!162129 (= lt!670531 e!866279)))

(declare-fun res!1064035 () Bool)

(assert (=> d!162129 (=> (not res!1064035) (not e!866279))))

(assert (=> d!162129 (= res!1064035 ((_ is Cons!36238) lt!670396))))

(assert (=> d!162129 (= (contains!10176 lt!670396 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670531)))

(declare-fun b!1555718 () Bool)

(declare-fun e!866280 () Bool)

(assert (=> b!1555718 (= e!866279 e!866280)))

(declare-fun res!1064036 () Bool)

(assert (=> b!1555718 (=> res!1064036 e!866280)))

(assert (=> b!1555718 (= res!1064036 (= (h!37701 lt!670396) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555719 () Bool)

(assert (=> b!1555719 (= e!866280 (contains!10176 (t!50950 lt!670396) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!162129 res!1064035) b!1555718))

(assert (= (and b!1555718 (not res!1064036)) b!1555719))

(declare-fun m!1434183 () Bool)

(assert (=> d!162129 m!1434183))

(declare-fun m!1434185 () Bool)

(assert (=> d!162129 m!1434185))

(declare-fun m!1434187 () Bool)

(assert (=> b!1555719 m!1434187))

(assert (=> b!1555347 d!162129))

(assert (=> b!1555279 d!161925))

(declare-fun d!162131 () Bool)

(declare-fun res!1064037 () Bool)

(declare-fun e!866281 () Bool)

(assert (=> d!162131 (=> res!1064037 e!866281)))

(assert (=> d!162131 (= res!1064037 (and ((_ is Cons!36238) lt!670396) (= (_1!12408 (h!37701 lt!670396)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!162131 (= (containsKey!754 lt!670396 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866281)))

(declare-fun b!1555720 () Bool)

(declare-fun e!866282 () Bool)

(assert (=> b!1555720 (= e!866281 e!866282)))

(declare-fun res!1064038 () Bool)

(assert (=> b!1555720 (=> (not res!1064038) (not e!866282))))

(assert (=> b!1555720 (= res!1064038 (and (or (not ((_ is Cons!36238) lt!670396)) (bvsle (_1!12408 (h!37701 lt!670396)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36238) lt!670396) (bvslt (_1!12408 (h!37701 lt!670396)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555721 () Bool)

(assert (=> b!1555721 (= e!866282 (containsKey!754 (t!50950 lt!670396) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!162131 (not res!1064037)) b!1555720))

(assert (= (and b!1555720 res!1064038) b!1555721))

(declare-fun m!1434189 () Bool)

(assert (=> b!1555721 m!1434189))

(assert (=> b!1555345 d!162131))

(declare-fun d!162133 () Bool)

(declare-fun res!1064039 () Bool)

(declare-fun e!866283 () Bool)

(assert (=> d!162133 (=> res!1064039 e!866283)))

(assert (=> d!162133 (= res!1064039 (and ((_ is Cons!36238) (toList!11221 lt!670291)) (= (_1!12408 (h!37701 (toList!11221 lt!670291))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!162133 (= (containsKey!754 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!866283)))

(declare-fun b!1555722 () Bool)

(declare-fun e!866284 () Bool)

(assert (=> b!1555722 (= e!866283 e!866284)))

(declare-fun res!1064040 () Bool)

(assert (=> b!1555722 (=> (not res!1064040) (not e!866284))))

(assert (=> b!1555722 (= res!1064040 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670291))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670291))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36238) (toList!11221 lt!670291)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670291))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555723 () Bool)

(assert (=> b!1555723 (= e!866284 (containsKey!754 (t!50950 (toList!11221 lt!670291)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!162133 (not res!1064039)) b!1555722))

(assert (= (and b!1555722 res!1064040) b!1555723))

(declare-fun m!1434191 () Bool)

(assert (=> b!1555723 m!1434191))

(assert (=> d!161933 d!162133))

(declare-fun d!162135 () Bool)

(declare-fun res!1064041 () Bool)

(declare-fun e!866285 () Bool)

(assert (=> d!162135 (=> res!1064041 e!866285)))

(assert (=> d!162135 (= res!1064041 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!162135 (= (containsKey!754 (t!50950 (toList!11221 lt!670211)) (select (arr!50064 _keys!618) from!762)) e!866285)))

(declare-fun b!1555724 () Bool)

(declare-fun e!866286 () Bool)

(assert (=> b!1555724 (= e!866285 e!866286)))

(declare-fun res!1064042 () Bool)

(assert (=> b!1555724 (=> (not res!1064042) (not e!866286))))

(assert (=> b!1555724 (= res!1064042 (and (or (not ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211)))) (bvsle (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) (select (arr!50064 _keys!618) from!762))) ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (bvslt (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun b!1555725 () Bool)

(assert (=> b!1555725 (= e!866286 (containsKey!754 (t!50950 (t!50950 (toList!11221 lt!670211))) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!162135 (not res!1064041)) b!1555724))

(assert (= (and b!1555724 res!1064042) b!1555725))

(assert (=> b!1555725 m!1433213))

(declare-fun m!1434193 () Bool)

(assert (=> b!1555725 m!1434193))

(assert (=> b!1555373 d!162135))

(declare-fun d!162137 () Bool)

(declare-fun res!1064043 () Bool)

(declare-fun e!866287 () Bool)

(assert (=> d!162137 (=> res!1064043 e!866287)))

(assert (=> d!162137 (= res!1064043 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (= (_1!12408 (h!37701 (toList!11221 lt!670309))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!162137 (= (containsKey!754 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)) e!866287)))

(declare-fun b!1555726 () Bool)

(declare-fun e!866288 () Bool)

(assert (=> b!1555726 (= e!866287 e!866288)))

(declare-fun res!1064044 () Bool)

(assert (=> b!1555726 (=> (not res!1064044) (not e!866288))))

(assert (=> b!1555726 (= res!1064044 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670309))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670309))) (select (arr!50064 _keys!618) from!762))) ((_ is Cons!36238) (toList!11221 lt!670309)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670309))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun b!1555727 () Bool)

(assert (=> b!1555727 (= e!866288 (containsKey!754 (t!50950 (toList!11221 lt!670309)) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!162137 (not res!1064043)) b!1555726))

(assert (= (and b!1555726 res!1064044) b!1555727))

(assert (=> b!1555727 m!1433213))

(declare-fun m!1434195 () Bool)

(assert (=> b!1555727 m!1434195))

(assert (=> d!161849 d!162137))

(assert (=> d!161931 d!161929))

(assert (=> d!161931 d!161781))

(assert (=> d!161931 d!161779))

(declare-fun d!162139 () Bool)

(declare-fun c!144016 () Bool)

(assert (=> d!162139 (= c!144016 ((_ is Nil!36239) (toList!11221 lt!670337)))))

(declare-fun e!866289 () (InoxSet tuple2!24794))

(assert (=> d!162139 (= (content!783 (toList!11221 lt!670337)) e!866289)))

(declare-fun b!1555728 () Bool)

(assert (=> b!1555728 (= e!866289 ((as const (Array tuple2!24794 Bool)) false))))

(declare-fun b!1555729 () Bool)

(assert (=> b!1555729 (= e!866289 ((_ map or) (store ((as const (Array tuple2!24794 Bool)) false) (h!37701 (toList!11221 lt!670337)) true) (content!783 (t!50950 (toList!11221 lt!670337)))))))

(assert (= (and d!162139 c!144016) b!1555728))

(assert (= (and d!162139 (not c!144016)) b!1555729))

(declare-fun m!1434197 () Bool)

(assert (=> b!1555729 m!1434197))

(assert (=> b!1555729 m!1434049))

(assert (=> d!161895 d!162139))

(declare-fun d!162141 () Bool)

(declare-fun c!144017 () Bool)

(assert (=> d!162141 (= c!144017 ((_ is Nil!36239) (toList!11221 lt!670291)))))

(declare-fun e!866290 () (InoxSet tuple2!24794))

(assert (=> d!162141 (= (content!783 (toList!11221 lt!670291)) e!866290)))

(declare-fun b!1555730 () Bool)

(assert (=> b!1555730 (= e!866290 ((as const (Array tuple2!24794 Bool)) false))))

(declare-fun b!1555731 () Bool)

(assert (=> b!1555731 (= e!866290 ((_ map or) (store ((as const (Array tuple2!24794 Bool)) false) (h!37701 (toList!11221 lt!670291)) true) (content!783 (t!50950 (toList!11221 lt!670291)))))))

(assert (= (and d!162141 c!144017) b!1555730))

(assert (= (and d!162141 (not c!144017)) b!1555731))

(declare-fun m!1434199 () Bool)

(assert (=> b!1555731 m!1434199))

(assert (=> b!1555731 m!1434029))

(assert (=> d!161903 d!162141))

(declare-fun d!162143 () Bool)

(assert (=> d!162143 (= (isEmpty!1135 lt!670368) (isEmpty!1137 (toList!11221 lt!670368)))))

(declare-fun bs!44652 () Bool)

(assert (= bs!44652 d!162143))

(declare-fun m!1434201 () Bool)

(assert (=> bs!44652 m!1434201))

(assert (=> b!1555243 d!162143))

(declare-fun d!162145 () Bool)

(declare-fun res!1064045 () Bool)

(declare-fun e!866291 () Bool)

(assert (=> d!162145 (=> res!1064045 e!866291)))

(assert (=> d!162145 (= res!1064045 (and ((_ is Cons!36238) lt!670345) (= (_1!12408 (h!37701 lt!670345)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!162145 (= (containsKey!754 lt!670345 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866291)))

(declare-fun b!1555732 () Bool)

(declare-fun e!866292 () Bool)

(assert (=> b!1555732 (= e!866291 e!866292)))

(declare-fun res!1064046 () Bool)

(assert (=> b!1555732 (=> (not res!1064046) (not e!866292))))

(assert (=> b!1555732 (= res!1064046 (and (or (not ((_ is Cons!36238) lt!670345)) (bvsle (_1!12408 (h!37701 lt!670345)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36238) lt!670345) (bvslt (_1!12408 (h!37701 lt!670345)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555733 () Bool)

(assert (=> b!1555733 (= e!866292 (containsKey!754 (t!50950 lt!670345) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!162145 (not res!1064045)) b!1555732))

(assert (= (and b!1555732 res!1064046) b!1555733))

(declare-fun m!1434203 () Bool)

(assert (=> b!1555733 m!1434203))

(assert (=> b!1555291 d!162145))

(assert (=> d!161831 d!161819))

(assert (=> d!161831 d!161821))

(declare-fun d!162147 () Bool)

(assert (=> d!162147 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162147 true))

(declare-fun _$12!485 () Unit!51616)

(assert (=> d!162147 (= (choose!2032 (toList!11221 lt!670211) #b1000000000000000000000000000000000000000000000000000000000000000) _$12!485)))

(declare-fun bs!44653 () Bool)

(assert (= bs!44653 d!162147))

(assert (=> bs!44653 m!1433521))

(assert (=> bs!44653 m!1433521))

(assert (=> bs!44653 m!1433529))

(assert (=> d!161831 d!162147))

(assert (=> d!161831 d!161961))

(declare-fun d!162149 () Bool)

(declare-fun res!1064047 () Bool)

(declare-fun e!866293 () Bool)

(assert (=> d!162149 (=> res!1064047 e!866293)))

(assert (=> d!162149 (= res!1064047 (and ((_ is Cons!36238) (toList!11221 lt!670309)) (= (_1!12408 (h!37701 (toList!11221 lt!670309))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!162149 (= (containsKey!754 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000) e!866293)))

(declare-fun b!1555734 () Bool)

(declare-fun e!866294 () Bool)

(assert (=> b!1555734 (= e!866293 e!866294)))

(declare-fun res!1064048 () Bool)

(assert (=> b!1555734 (=> (not res!1064048) (not e!866294))))

(assert (=> b!1555734 (= res!1064048 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670309))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670309))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36238) (toList!11221 lt!670309)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670309))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1555735 () Bool)

(assert (=> b!1555735 (= e!866294 (containsKey!754 (t!50950 (toList!11221 lt!670309)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162149 (not res!1064047)) b!1555734))

(assert (= (and b!1555734 res!1064048) b!1555735))

(declare-fun m!1434205 () Bool)

(assert (=> b!1555735 m!1434205))

(assert (=> d!161885 d!162149))

(assert (=> b!1555282 d!161989))

(assert (=> b!1555282 d!161799))

(declare-fun d!162151 () Bool)

(declare-fun res!1064049 () Bool)

(declare-fun e!866295 () Bool)

(assert (=> d!162151 (=> res!1064049 e!866295)))

(assert (=> d!162151 (= res!1064049 (and ((_ is Cons!36238) (toList!11221 lt!670212)) (= (_1!12408 (h!37701 (toList!11221 lt!670212))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!162151 (= (containsKey!754 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)) e!866295)))

(declare-fun b!1555736 () Bool)

(declare-fun e!866296 () Bool)

(assert (=> b!1555736 (= e!866295 e!866296)))

(declare-fun res!1064050 () Bool)

(assert (=> b!1555736 (=> (not res!1064050) (not e!866296))))

(assert (=> b!1555736 (= res!1064050 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670212))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670212))) (select (arr!50064 _keys!618) from!762))) ((_ is Cons!36238) (toList!11221 lt!670212)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670212))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun b!1555737 () Bool)

(assert (=> b!1555737 (= e!866296 (containsKey!754 (t!50950 (toList!11221 lt!670212)) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!162151 (not res!1064049)) b!1555736))

(assert (= (and b!1555736 res!1064050) b!1555737))

(assert (=> b!1555737 m!1433213))

(declare-fun m!1434207 () Bool)

(assert (=> b!1555737 m!1434207))

(assert (=> d!161881 d!162151))

(declare-fun b!1555738 () Bool)

(declare-fun e!866297 () Bool)

(declare-fun e!866298 () Bool)

(assert (=> b!1555738 (= e!866297 e!866298)))

(declare-fun lt!670532 () (_ BitVec 64))

(assert (=> b!1555738 (= lt!670532 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!670534 () Unit!51616)

(assert (=> b!1555738 (= lt!670534 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!670532 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1555738 (arrayContainsKey!0 _keys!618 lt!670532 #b00000000000000000000000000000000)))

(declare-fun lt!670533 () Unit!51616)

(assert (=> b!1555738 (= lt!670533 lt!670534)))

(declare-fun res!1064052 () Bool)

(assert (=> b!1555738 (= res!1064052 (= (seekEntryOrOpen!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!618 mask!926) (Found!13464 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1555738 (=> (not res!1064052) (not e!866298))))

(declare-fun b!1555740 () Bool)

(declare-fun e!866299 () Bool)

(assert (=> b!1555740 (= e!866299 e!866297)))

(declare-fun c!144018 () Bool)

(assert (=> b!1555740 (= c!144018 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1555739 () Bool)

(declare-fun call!71516 () Bool)

(assert (=> b!1555739 (= e!866298 call!71516)))

(declare-fun d!162153 () Bool)

(declare-fun res!1064051 () Bool)

(assert (=> d!162153 (=> res!1064051 e!866299)))

(assert (=> d!162153 (= res!1064051 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(assert (=> d!162153 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926) e!866299)))

(declare-fun b!1555741 () Bool)

(assert (=> b!1555741 (= e!866297 call!71516)))

(declare-fun bm!71513 () Bool)

(assert (=> bm!71513 (= call!71516 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926))))

(assert (= (and d!162153 (not res!1064051)) b!1555740))

(assert (= (and b!1555740 c!144018) b!1555738))

(assert (= (and b!1555740 (not c!144018)) b!1555741))

(assert (= (and b!1555738 res!1064052) b!1555739))

(assert (= (or b!1555739 b!1555741) bm!71513))

(declare-fun m!1434209 () Bool)

(assert (=> b!1555738 m!1434209))

(declare-fun m!1434211 () Bool)

(assert (=> b!1555738 m!1434211))

(declare-fun m!1434213 () Bool)

(assert (=> b!1555738 m!1434213))

(assert (=> b!1555738 m!1434209))

(declare-fun m!1434215 () Bool)

(assert (=> b!1555738 m!1434215))

(assert (=> b!1555740 m!1434209))

(assert (=> b!1555740 m!1434209))

(declare-fun m!1434217 () Bool)

(assert (=> b!1555740 m!1434217))

(declare-fun m!1434219 () Bool)

(assert (=> bm!71513 m!1434219))

(assert (=> bm!71495 d!162153))

(declare-fun d!162155 () Bool)

(assert (=> d!162155 (isDefined!546 (getValueByKey!728 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312))))

(declare-fun lt!670535 () Unit!51616)

(assert (=> d!162155 (= lt!670535 (choose!2032 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312))))

(declare-fun e!866300 () Bool)

(assert (=> d!162155 e!866300))

(declare-fun res!1064053 () Bool)

(assert (=> d!162155 (=> (not res!1064053) (not e!866300))))

(assert (=> d!162155 (= res!1064053 (isStrictlySorted!875 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310)))))))

(assert (=> d!162155 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312) lt!670535)))

(declare-fun b!1555742 () Bool)

(assert (=> b!1555742 (= e!866300 (containsKey!754 (toList!11221 (+!5049 lt!670308 (tuple2!24795 lt!670307 lt!670310))) lt!670312))))

(assert (= (and d!162155 res!1064053) b!1555742))

(assert (=> d!162155 m!1433787))

(assert (=> d!162155 m!1433787))

(assert (=> d!162155 m!1433789))

(declare-fun m!1434221 () Bool)

(assert (=> d!162155 m!1434221))

(declare-fun m!1434223 () Bool)

(assert (=> d!162155 m!1434223))

(assert (=> b!1555742 m!1433783))

(assert (=> b!1555412 d!162155))

(assert (=> b!1555412 d!161975))

(assert (=> b!1555412 d!161977))

(declare-fun d!162157 () Bool)

(assert (=> d!162157 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!670536 () Unit!51616)

(assert (=> d!162157 (= lt!670536 (choose!2032 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866301 () Bool)

(assert (=> d!162157 e!866301))

(declare-fun res!1064054 () Bool)

(assert (=> d!162157 (=> (not res!1064054) (not e!866301))))

(assert (=> d!162157 (= res!1064054 (isStrictlySorted!875 (toList!11221 lt!670291)))))

(assert (=> d!162157 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670536)))

(declare-fun b!1555743 () Bool)

(assert (=> b!1555743 (= e!866301 (containsKey!754 (toList!11221 lt!670291) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!162157 res!1064054) b!1555743))

(assert (=> d!162157 m!1433399))

(assert (=> d!162157 m!1433399))

(assert (=> d!162157 m!1433839))

(declare-fun m!1434225 () Bool)

(assert (=> d!162157 m!1434225))

(declare-fun m!1434227 () Bool)

(assert (=> d!162157 m!1434227))

(assert (=> b!1555743 m!1433835))

(assert (=> b!1555456 d!162157))

(assert (=> b!1555456 d!162007))

(assert (=> b!1555456 d!161825))

(declare-fun b!1555756 () Bool)

(declare-fun e!866310 () SeekEntryResult!13464)

(declare-fun e!866309 () SeekEntryResult!13464)

(assert (=> b!1555756 (= e!866310 e!866309)))

(declare-fun c!144027 () Bool)

(declare-fun lt!670542 () (_ BitVec 64))

(assert (=> b!1555756 (= c!144027 (= lt!670542 (select (arr!50064 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1555757 () Bool)

(assert (=> b!1555757 (= e!866310 Undefined!13464)))

(declare-fun d!162159 () Bool)

(declare-fun lt!670541 () SeekEntryResult!13464)

(assert (=> d!162159 (and (or ((_ is Undefined!13464) lt!670541) (not ((_ is Found!13464) lt!670541)) (and (bvsge (index!56255 lt!670541) #b00000000000000000000000000000000) (bvslt (index!56255 lt!670541) (size!50615 _keys!618)))) (or ((_ is Undefined!13464) lt!670541) ((_ is Found!13464) lt!670541) (not ((_ is MissingVacant!13464) lt!670541)) (not (= (index!56257 lt!670541) (index!56256 lt!670458))) (and (bvsge (index!56257 lt!670541) #b00000000000000000000000000000000) (bvslt (index!56257 lt!670541) (size!50615 _keys!618)))) (or ((_ is Undefined!13464) lt!670541) (ite ((_ is Found!13464) lt!670541) (= (select (arr!50064 _keys!618) (index!56255 lt!670541)) (select (arr!50064 _keys!618) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!13464) lt!670541) (= (index!56257 lt!670541) (index!56256 lt!670458)) (= (select (arr!50064 _keys!618) (index!56257 lt!670541)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!162159 (= lt!670541 e!866310)))

(declare-fun c!144025 () Bool)

(assert (=> d!162159 (= c!144025 (bvsge (x!139212 lt!670458) #b01111111111111111111111111111110))))

(assert (=> d!162159 (= lt!670542 (select (arr!50064 _keys!618) (index!56256 lt!670458)))))

(assert (=> d!162159 (validMask!0 mask!926)))

(assert (=> d!162159 (= (seekKeyOrZeroReturnVacant!0 (x!139212 lt!670458) (index!56256 lt!670458) (index!56256 lt!670458) (select (arr!50064 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!670541)))

(declare-fun b!1555758 () Bool)

(declare-fun c!144026 () Bool)

(assert (=> b!1555758 (= c!144026 (= lt!670542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!866308 () SeekEntryResult!13464)

(assert (=> b!1555758 (= e!866309 e!866308)))

(declare-fun b!1555759 () Bool)

(assert (=> b!1555759 (= e!866308 (MissingVacant!13464 (index!56256 lt!670458)))))

(declare-fun b!1555760 () Bool)

(assert (=> b!1555760 (= e!866308 (seekKeyOrZeroReturnVacant!0 (bvadd (x!139212 lt!670458) #b00000000000000000000000000000001) (nextIndex!0 (index!56256 lt!670458) (bvadd (x!139212 lt!670458) #b00000000000000000000000000000001) mask!926) (index!56256 lt!670458) (select (arr!50064 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(declare-fun b!1555761 () Bool)

(assert (=> b!1555761 (= e!866309 (Found!13464 (index!56256 lt!670458)))))

(assert (= (and d!162159 c!144025) b!1555757))

(assert (= (and d!162159 (not c!144025)) b!1555756))

(assert (= (and b!1555756 c!144027) b!1555761))

(assert (= (and b!1555756 (not c!144027)) b!1555758))

(assert (= (and b!1555758 c!144026) b!1555759))

(assert (= (and b!1555758 (not c!144026)) b!1555760))

(declare-fun m!1434229 () Bool)

(assert (=> d!162159 m!1434229))

(declare-fun m!1434231 () Bool)

(assert (=> d!162159 m!1434231))

(assert (=> d!162159 m!1433823))

(assert (=> d!162159 m!1433259))

(declare-fun m!1434233 () Bool)

(assert (=> b!1555760 m!1434233))

(assert (=> b!1555760 m!1434233))

(assert (=> b!1555760 m!1433429))

(declare-fun m!1434235 () Bool)

(assert (=> b!1555760 m!1434235))

(assert (=> b!1555439 d!162159))

(declare-fun d!162161 () Bool)

(assert (=> d!162161 (= (apply!1112 lt!670368 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (get!26081 (getValueByKey!728 (toList!11221 lt!670368) (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))))

(declare-fun bs!44654 () Bool)

(assert (= bs!44654 d!162161))

(assert (=> bs!44654 m!1433539))

(declare-fun m!1434237 () Bool)

(assert (=> bs!44654 m!1434237))

(assert (=> bs!44654 m!1434237))

(declare-fun m!1434239 () Bool)

(assert (=> bs!44654 m!1434239))

(assert (=> b!1555239 d!162161))

(assert (=> b!1555239 d!162091))

(declare-fun d!162163 () Bool)

(declare-fun lt!670543 () Bool)

(assert (=> d!162163 (= lt!670543 (select (content!783 (t!50950 (toList!11221 lt!670352))) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun e!866311 () Bool)

(assert (=> d!162163 (= lt!670543 e!866311)))

(declare-fun res!1064055 () Bool)

(assert (=> d!162163 (=> (not res!1064055) (not e!866311))))

(assert (=> d!162163 (= res!1064055 ((_ is Cons!36238) (t!50950 (toList!11221 lt!670352))))))

(assert (=> d!162163 (= (contains!10176 (t!50950 (toList!11221 lt!670352)) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!670543)))

(declare-fun b!1555762 () Bool)

(declare-fun e!866312 () Bool)

(assert (=> b!1555762 (= e!866311 e!866312)))

(declare-fun res!1064056 () Bool)

(assert (=> b!1555762 (=> res!1064056 e!866312)))

(assert (=> b!1555762 (= res!1064056 (= (h!37701 (t!50950 (toList!11221 lt!670352))) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun b!1555763 () Bool)

(assert (=> b!1555763 (= e!866312 (contains!10176 (t!50950 (t!50950 (toList!11221 lt!670352))) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!162163 res!1064055) b!1555762))

(assert (= (and b!1555762 (not res!1064056)) b!1555763))

(assert (=> d!162163 m!1433871))

(declare-fun m!1434241 () Bool)

(assert (=> d!162163 m!1434241))

(declare-fun m!1434243 () Bool)

(assert (=> b!1555763 m!1434243))

(assert (=> b!1555401 d!162163))

(assert (=> d!161863 d!161861))

(declare-fun d!162165 () Bool)

(assert (=> d!162165 (= (getValueByKey!728 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!802 (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!162165 true))

(declare-fun _$22!588 () Unit!51616)

(assert (=> d!162165 (= (choose!2033 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) _$22!588)))

(declare-fun bs!44655 () Bool)

(assert (= bs!44655 d!162165))

(assert (=> bs!44655 m!1433495))

(assert (=> d!161863 d!162165))

(declare-fun d!162167 () Bool)

(declare-fun res!1064057 () Bool)

(declare-fun e!866313 () Bool)

(assert (=> d!162167 (=> res!1064057 e!866313)))

(assert (=> d!162167 (= res!1064057 (or ((_ is Nil!36239) lt!670353) ((_ is Nil!36239) (t!50950 lt!670353))))))

(assert (=> d!162167 (= (isStrictlySorted!875 lt!670353) e!866313)))

(declare-fun b!1555764 () Bool)

(declare-fun e!866314 () Bool)

(assert (=> b!1555764 (= e!866313 e!866314)))

(declare-fun res!1064058 () Bool)

(assert (=> b!1555764 (=> (not res!1064058) (not e!866314))))

(assert (=> b!1555764 (= res!1064058 (bvslt (_1!12408 (h!37701 lt!670353)) (_1!12408 (h!37701 (t!50950 lt!670353)))))))

(declare-fun b!1555765 () Bool)

(assert (=> b!1555765 (= e!866314 (isStrictlySorted!875 (t!50950 lt!670353)))))

(assert (= (and d!162167 (not res!1064057)) b!1555764))

(assert (= (and b!1555764 res!1064058) b!1555765))

(declare-fun m!1434245 () Bool)

(assert (=> b!1555765 m!1434245))

(assert (=> d!161863 d!162167))

(declare-fun d!162169 () Bool)

(declare-fun e!866315 () Bool)

(assert (=> d!162169 e!866315))

(declare-fun res!1064059 () Bool)

(assert (=> d!162169 (=> res!1064059 e!866315)))

(declare-fun lt!670545 () Bool)

(assert (=> d!162169 (= res!1064059 (not lt!670545))))

(declare-fun lt!670546 () Bool)

(assert (=> d!162169 (= lt!670545 lt!670546)))

(declare-fun lt!670547 () Unit!51616)

(declare-fun e!866316 () Unit!51616)

(assert (=> d!162169 (= lt!670547 e!866316)))

(declare-fun c!144028 () Bool)

(assert (=> d!162169 (= c!144028 lt!670546)))

(assert (=> d!162169 (= lt!670546 (containsKey!754 (toList!11221 lt!670368) (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> d!162169 (= (contains!10173 lt!670368 (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) lt!670545)))

(declare-fun b!1555766 () Bool)

(declare-fun lt!670544 () Unit!51616)

(assert (=> b!1555766 (= e!866316 lt!670544)))

(assert (=> b!1555766 (= lt!670544 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670368) (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1555766 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670368) (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun b!1555767 () Bool)

(declare-fun Unit!51644 () Unit!51616)

(assert (=> b!1555767 (= e!866316 Unit!51644)))

(declare-fun b!1555768 () Bool)

(assert (=> b!1555768 (= e!866315 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670368) (select (arr!50064 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))))

(assert (= (and d!162169 c!144028) b!1555766))

(assert (= (and d!162169 (not c!144028)) b!1555767))

(assert (= (and d!162169 (not res!1064059)) b!1555768))

(assert (=> d!162169 m!1433539))

(declare-fun m!1434247 () Bool)

(assert (=> d!162169 m!1434247))

(assert (=> b!1555766 m!1433539))

(declare-fun m!1434249 () Bool)

(assert (=> b!1555766 m!1434249))

(assert (=> b!1555766 m!1433539))

(assert (=> b!1555766 m!1434237))

(assert (=> b!1555766 m!1434237))

(declare-fun m!1434251 () Bool)

(assert (=> b!1555766 m!1434251))

(assert (=> b!1555768 m!1433539))

(assert (=> b!1555768 m!1434237))

(assert (=> b!1555768 m!1434237))

(assert (=> b!1555768 m!1434251))

(assert (=> b!1555236 d!162169))

(declare-fun d!162171 () Bool)

(declare-fun lt!670548 () Bool)

(assert (=> d!162171 (= lt!670548 (select (content!783 lt!670402) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!866317 () Bool)

(assert (=> d!162171 (= lt!670548 e!866317)))

(declare-fun res!1064060 () Bool)

(assert (=> d!162171 (=> (not res!1064060) (not e!866317))))

(assert (=> d!162171 (= res!1064060 ((_ is Cons!36238) lt!670402))))

(assert (=> d!162171 (= (contains!10176 lt!670402 (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) lt!670548)))

(declare-fun b!1555769 () Bool)

(declare-fun e!866318 () Bool)

(assert (=> b!1555769 (= e!866317 e!866318)))

(declare-fun res!1064061 () Bool)

(assert (=> b!1555769 (=> res!1064061 e!866318)))

(assert (=> b!1555769 (= res!1064061 (= (h!37701 lt!670402) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555770 () Bool)

(assert (=> b!1555770 (= e!866318 (contains!10176 (t!50950 lt!670402) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!162171 res!1064060) b!1555769))

(assert (= (and b!1555769 (not res!1064061)) b!1555770))

(declare-fun m!1434253 () Bool)

(assert (=> d!162171 m!1434253))

(declare-fun m!1434255 () Bool)

(assert (=> d!162171 m!1434255))

(declare-fun m!1434257 () Bool)

(assert (=> b!1555770 m!1434257))

(assert (=> b!1555366 d!162171))

(declare-fun d!162173 () Bool)

(declare-fun res!1064062 () Bool)

(declare-fun e!866319 () Bool)

(assert (=> d!162173 (=> res!1064062 e!866319)))

(assert (=> d!162173 (= res!1064062 (and ((_ is Cons!36238) lt!670338) (= (_1!12408 (h!37701 lt!670338)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!162173 (= (containsKey!754 lt!670338 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866319)))

(declare-fun b!1555771 () Bool)

(declare-fun e!866320 () Bool)

(assert (=> b!1555771 (= e!866319 e!866320)))

(declare-fun res!1064063 () Bool)

(assert (=> b!1555771 (=> (not res!1064063) (not e!866320))))

(assert (=> b!1555771 (= res!1064063 (and (or (not ((_ is Cons!36238) lt!670338)) (bvsle (_1!12408 (h!37701 lt!670338)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36238) lt!670338) (bvslt (_1!12408 (h!37701 lt!670338)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555772 () Bool)

(assert (=> b!1555772 (= e!866320 (containsKey!754 (t!50950 lt!670338) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!162173 (not res!1064062)) b!1555771))

(assert (= (and b!1555771 res!1064063) b!1555772))

(declare-fun m!1434259 () Bool)

(assert (=> b!1555772 m!1434259))

(assert (=> b!1555337 d!162173))

(assert (=> d!161915 d!161917))

(declare-fun d!162175 () Bool)

(assert (=> d!162175 (arrayContainsKey!0 _keys!618 lt!670332 #b00000000000000000000000000000000)))

(assert (=> d!162175 true))

(declare-fun _$60!454 () Unit!51616)

(assert (=> d!162175 (= (choose!13 _keys!618 lt!670332 #b00000000000000000000000000000000) _$60!454)))

(declare-fun bs!44656 () Bool)

(assert (= bs!44656 d!162175))

(assert (=> bs!44656 m!1433433))

(assert (=> d!161915 d!162175))

(declare-fun d!162177 () Bool)

(assert (=> d!162177 (arrayContainsKey!0 _keys!618 lt!670419 #b00000000000000000000000000000000)))

(declare-fun lt!670549 () Unit!51616)

(assert (=> d!162177 (= lt!670549 (choose!13 _keys!618 lt!670419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!162177 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!162177 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!670419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!670549)))

(declare-fun bs!44657 () Bool)

(assert (= bs!44657 d!162177))

(assert (=> bs!44657 m!1433725))

(declare-fun m!1434261 () Bool)

(assert (=> bs!44657 m!1434261))

(assert (=> b!1555389 d!162177))

(declare-fun d!162179 () Bool)

(declare-fun res!1064064 () Bool)

(declare-fun e!866321 () Bool)

(assert (=> d!162179 (=> res!1064064 e!866321)))

(assert (=> d!162179 (= res!1064064 (= (select (arr!50064 _keys!618) #b00000000000000000000000000000000) lt!670419))))

(assert (=> d!162179 (= (arrayContainsKey!0 _keys!618 lt!670419 #b00000000000000000000000000000000) e!866321)))

(declare-fun b!1555773 () Bool)

(declare-fun e!866322 () Bool)

(assert (=> b!1555773 (= e!866321 e!866322)))

(declare-fun res!1064065 () Bool)

(assert (=> b!1555773 (=> (not res!1064065) (not e!866322))))

(assert (=> b!1555773 (= res!1064065 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(declare-fun b!1555774 () Bool)

(assert (=> b!1555774 (= e!866322 (arrayContainsKey!0 _keys!618 lt!670419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!162179 (not res!1064064)) b!1555773))

(assert (= (and b!1555773 res!1064065) b!1555774))

(assert (=> d!162179 m!1433429))

(declare-fun m!1434263 () Bool)

(assert (=> b!1555774 m!1434263))

(assert (=> b!1555389 d!162179))

(declare-fun d!162181 () Bool)

(declare-fun lt!670550 () SeekEntryResult!13464)

(assert (=> d!162181 (and (or ((_ is Undefined!13464) lt!670550) (not ((_ is Found!13464) lt!670550)) (and (bvsge (index!56255 lt!670550) #b00000000000000000000000000000000) (bvslt (index!56255 lt!670550) (size!50615 _keys!618)))) (or ((_ is Undefined!13464) lt!670550) ((_ is Found!13464) lt!670550) (not ((_ is MissingZero!13464) lt!670550)) (and (bvsge (index!56254 lt!670550) #b00000000000000000000000000000000) (bvslt (index!56254 lt!670550) (size!50615 _keys!618)))) (or ((_ is Undefined!13464) lt!670550) ((_ is Found!13464) lt!670550) ((_ is MissingZero!13464) lt!670550) (not ((_ is MissingVacant!13464) lt!670550)) (and (bvsge (index!56257 lt!670550) #b00000000000000000000000000000000) (bvslt (index!56257 lt!670550) (size!50615 _keys!618)))) (or ((_ is Undefined!13464) lt!670550) (ite ((_ is Found!13464) lt!670550) (= (select (arr!50064 _keys!618) (index!56255 lt!670550)) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!13464) lt!670550) (= (select (arr!50064 _keys!618) (index!56254 lt!670550)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13464) lt!670550) (= (select (arr!50064 _keys!618) (index!56257 lt!670550)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!866324 () SeekEntryResult!13464)

(assert (=> d!162181 (= lt!670550 e!866324)))

(declare-fun c!144029 () Bool)

(declare-fun lt!670551 () SeekEntryResult!13464)

(assert (=> d!162181 (= c!144029 (and ((_ is Intermediate!13464) lt!670551) (undefined!14276 lt!670551)))))

(assert (=> d!162181 (= lt!670551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!926) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926))))

(assert (=> d!162181 (validMask!0 mask!926)))

(assert (=> d!162181 (= (seekEntryOrOpen!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926) lt!670550)))

(declare-fun e!866325 () SeekEntryResult!13464)

(declare-fun b!1555775 () Bool)

(assert (=> b!1555775 (= e!866325 (seekKeyOrZeroReturnVacant!0 (x!139212 lt!670551) (index!56256 lt!670551) (index!56256 lt!670551) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926))))

(declare-fun b!1555776 () Bool)

(declare-fun c!144030 () Bool)

(declare-fun lt!670552 () (_ BitVec 64))

(assert (=> b!1555776 (= c!144030 (= lt!670552 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!866323 () SeekEntryResult!13464)

(assert (=> b!1555776 (= e!866323 e!866325)))

(declare-fun b!1555777 () Bool)

(assert (=> b!1555777 (= e!866324 Undefined!13464)))

(declare-fun b!1555778 () Bool)

(assert (=> b!1555778 (= e!866323 (Found!13464 (index!56256 lt!670551)))))

(declare-fun b!1555779 () Bool)

(assert (=> b!1555779 (= e!866325 (MissingZero!13464 (index!56256 lt!670551)))))

(declare-fun b!1555780 () Bool)

(assert (=> b!1555780 (= e!866324 e!866323)))

(assert (=> b!1555780 (= lt!670552 (select (arr!50064 _keys!618) (index!56256 lt!670551)))))

(declare-fun c!144031 () Bool)

(assert (=> b!1555780 (= c!144031 (= lt!670552 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!162181 c!144029) b!1555777))

(assert (= (and d!162181 (not c!144029)) b!1555780))

(assert (= (and b!1555780 c!144031) b!1555778))

(assert (= (and b!1555780 (not c!144031)) b!1555776))

(assert (= (and b!1555776 c!144030) b!1555779))

(assert (= (and b!1555776 (not c!144030)) b!1555775))

(declare-fun m!1434265 () Bool)

(assert (=> d!162181 m!1434265))

(declare-fun m!1434267 () Bool)

(assert (=> d!162181 m!1434267))

(declare-fun m!1434269 () Bool)

(assert (=> d!162181 m!1434269))

(assert (=> d!162181 m!1433721))

(declare-fun m!1434271 () Bool)

(assert (=> d!162181 m!1434271))

(assert (=> d!162181 m!1433721))

(assert (=> d!162181 m!1434269))

(assert (=> d!162181 m!1433259))

(declare-fun m!1434273 () Bool)

(assert (=> d!162181 m!1434273))

(assert (=> b!1555775 m!1433721))

(declare-fun m!1434275 () Bool)

(assert (=> b!1555775 m!1434275))

(declare-fun m!1434277 () Bool)

(assert (=> b!1555780 m!1434277))

(assert (=> b!1555389 d!162181))

(assert (=> b!1555332 d!162047))

(assert (=> b!1555332 d!161823))

(declare-fun b!1555781 () Bool)

(declare-fun e!866329 () List!36242)

(declare-fun call!71517 () List!36242)

(assert (=> b!1555781 (= e!866329 call!71517)))

(declare-fun b!1555782 () Bool)

(declare-fun c!144032 () Bool)

(assert (=> b!1555782 (= c!144032 (and ((_ is Cons!36238) (t!50950 (toList!11221 call!71426))) (bvsgt (_1!12408 (h!37701 (t!50950 (toList!11221 call!71426)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866326 () List!36242)

(assert (=> b!1555782 (= e!866326 e!866329)))

(declare-fun b!1555783 () Bool)

(declare-fun e!866330 () List!36242)

(assert (=> b!1555783 (= e!866330 e!866326)))

(declare-fun c!144033 () Bool)

(assert (=> b!1555783 (= c!144033 (and ((_ is Cons!36238) (t!50950 (toList!11221 call!71426))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 call!71426)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866328 () List!36242)

(declare-fun b!1555784 () Bool)

(assert (=> b!1555784 (= e!866328 (ite c!144033 (t!50950 (t!50950 (toList!11221 call!71426))) (ite c!144032 (Cons!36238 (h!37701 (t!50950 (toList!11221 call!71426))) (t!50950 (t!50950 (toList!11221 call!71426)))) Nil!36239)))))

(declare-fun b!1555785 () Bool)

(declare-fun call!71518 () List!36242)

(assert (=> b!1555785 (= e!866330 call!71518)))

(declare-fun b!1555786 () Bool)

(declare-fun call!71519 () List!36242)

(assert (=> b!1555786 (= e!866326 call!71519)))

(declare-fun b!1555787 () Bool)

(declare-fun res!1064066 () Bool)

(declare-fun e!866327 () Bool)

(assert (=> b!1555787 (=> (not res!1064066) (not e!866327))))

(declare-fun lt!670553 () List!36242)

(assert (=> b!1555787 (= res!1064066 (containsKey!754 lt!670553 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1555788 () Bool)

(assert (=> b!1555788 (= e!866329 call!71517)))

(declare-fun d!162183 () Bool)

(assert (=> d!162183 e!866327))

(declare-fun res!1064067 () Bool)

(assert (=> d!162183 (=> (not res!1064067) (not e!866327))))

(assert (=> d!162183 (= res!1064067 (isStrictlySorted!875 lt!670553))))

(assert (=> d!162183 (= lt!670553 e!866330)))

(declare-fun c!144034 () Bool)

(assert (=> d!162183 (= c!144034 (and ((_ is Cons!36238) (t!50950 (toList!11221 call!71426))) (bvslt (_1!12408 (h!37701 (t!50950 (toList!11221 call!71426)))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!162183 (isStrictlySorted!875 (t!50950 (toList!11221 call!71426)))))

(assert (=> d!162183 (= (insertStrictlySorted!504 (t!50950 (toList!11221 call!71426)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!670553)))

(declare-fun bm!71514 () Bool)

(assert (=> bm!71514 (= call!71519 call!71518)))

(declare-fun bm!71515 () Bool)

(assert (=> bm!71515 (= call!71517 call!71519)))

(declare-fun b!1555789 () Bool)

(assert (=> b!1555789 (= e!866327 (contains!10176 lt!670553 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555790 () Bool)

(assert (=> b!1555790 (= e!866328 (insertStrictlySorted!504 (t!50950 (t!50950 (toList!11221 call!71426))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71516 () Bool)

(assert (=> bm!71516 (= call!71518 ($colon$colon!943 e!866328 (ite c!144034 (h!37701 (t!50950 (toList!11221 call!71426))) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!144035 () Bool)

(assert (=> bm!71516 (= c!144035 c!144034)))

(assert (= (and d!162183 c!144034) b!1555785))

(assert (= (and d!162183 (not c!144034)) b!1555783))

(assert (= (and b!1555783 c!144033) b!1555786))

(assert (= (and b!1555783 (not c!144033)) b!1555782))

(assert (= (and b!1555782 c!144032) b!1555788))

(assert (= (and b!1555782 (not c!144032)) b!1555781))

(assert (= (or b!1555788 b!1555781) bm!71515))

(assert (= (or b!1555786 bm!71515) bm!71514))

(assert (= (or b!1555785 bm!71514) bm!71516))

(assert (= (and bm!71516 c!144035) b!1555790))

(assert (= (and bm!71516 (not c!144035)) b!1555784))

(assert (= (and d!162183 res!1064067) b!1555787))

(assert (= (and b!1555787 res!1064066) b!1555789))

(declare-fun m!1434279 () Bool)

(assert (=> b!1555789 m!1434279))

(declare-fun m!1434281 () Bool)

(assert (=> bm!71516 m!1434281))

(declare-fun m!1434283 () Bool)

(assert (=> b!1555787 m!1434283))

(declare-fun m!1434285 () Bool)

(assert (=> b!1555790 m!1434285))

(declare-fun m!1434287 () Bool)

(assert (=> d!162183 m!1434287))

(assert (=> d!162183 m!1434087))

(assert (=> b!1555348 d!162183))

(declare-fun d!162185 () Bool)

(declare-fun res!1064068 () Bool)

(declare-fun e!866331 () Bool)

(assert (=> d!162185 (=> res!1064068 e!866331)))

(assert (=> d!162185 (= res!1064068 (or ((_ is Nil!36239) lt!670465) ((_ is Nil!36239) (t!50950 lt!670465))))))

(assert (=> d!162185 (= (isStrictlySorted!875 lt!670465) e!866331)))

(declare-fun b!1555791 () Bool)

(declare-fun e!866332 () Bool)

(assert (=> b!1555791 (= e!866331 e!866332)))

(declare-fun res!1064069 () Bool)

(assert (=> b!1555791 (=> (not res!1064069) (not e!866332))))

(assert (=> b!1555791 (= res!1064069 (bvslt (_1!12408 (h!37701 lt!670465)) (_1!12408 (h!37701 (t!50950 lt!670465)))))))

(declare-fun b!1555792 () Bool)

(assert (=> b!1555792 (= e!866332 (isStrictlySorted!875 (t!50950 lt!670465)))))

(assert (= (and d!162185 (not res!1064068)) b!1555791))

(assert (= (and b!1555791 res!1064069) b!1555792))

(declare-fun m!1434289 () Bool)

(assert (=> b!1555792 m!1434289))

(assert (=> d!161939 d!162185))

(declare-fun d!162187 () Bool)

(declare-fun res!1064070 () Bool)

(declare-fun e!866333 () Bool)

(assert (=> d!162187 (=> res!1064070 e!866333)))

(assert (=> d!162187 (= res!1064070 (or ((_ is Nil!36239) (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) ((_ is Nil!36239) (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))))))))

(assert (=> d!162187 (= (isStrictlySorted!875 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428)))) e!866333)))

(declare-fun b!1555793 () Bool)

(declare-fun e!866334 () Bool)

(assert (=> b!1555793 (= e!866333 e!866334)))

(declare-fun res!1064071 () Bool)

(assert (=> b!1555793 (=> (not res!1064071) (not e!866334))))

(assert (=> b!1555793 (= res!1064071 (bvslt (_1!12408 (h!37701 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))) (_1!12408 (h!37701 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))))))))

(declare-fun b!1555794 () Bool)

(assert (=> b!1555794 (= e!866334 (isStrictlySorted!875 (t!50950 (toList!11221 (ite c!143794 call!71424 (ite c!143796 call!71427 call!71428))))))))

(assert (= (and d!162187 (not res!1064070)) b!1555793))

(assert (= (and b!1555793 res!1064071) b!1555794))

(assert (=> b!1555794 m!1433977))

(assert (=> d!161939 d!162187))

(declare-fun d!162189 () Bool)

(assert (=> d!162189 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!670554 () Unit!51616)

(assert (=> d!162189 (= lt!670554 (choose!2032 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!866335 () Bool)

(assert (=> d!162189 e!866335))

(declare-fun res!1064072 () Bool)

(assert (=> d!162189 (=> (not res!1064072) (not e!866335))))

(assert (=> d!162189 (= res!1064072 (isStrictlySorted!875 (toList!11221 lt!670309)))))

(assert (=> d!162189 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000) lt!670554)))

(declare-fun b!1555795 () Bool)

(assert (=> b!1555795 (= e!866335 (containsKey!754 (toList!11221 lt!670309) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162189 res!1064072) b!1555795))

(assert (=> d!162189 m!1433717))

(assert (=> d!162189 m!1433717))

(assert (=> d!162189 m!1433719))

(declare-fun m!1434291 () Bool)

(assert (=> d!162189 m!1434291))

(assert (=> d!162189 m!1434077))

(assert (=> b!1555795 m!1433713))

(assert (=> b!1555386 d!162189))

(assert (=> b!1555386 d!162031))

(assert (=> b!1555386 d!162033))

(declare-fun d!162191 () Bool)

(declare-fun c!144036 () Bool)

(assert (=> d!162191 (= c!144036 (and ((_ is Cons!36238) (t!50950 lt!670292)) (= (_1!12408 (h!37701 (t!50950 lt!670292))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!866336 () Option!803)

(assert (=> d!162191 (= (getValueByKey!728 (t!50950 lt!670292) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!866336)))

(declare-fun b!1555798 () Bool)

(declare-fun e!866337 () Option!803)

(assert (=> b!1555798 (= e!866337 (getValueByKey!728 (t!50950 (t!50950 lt!670292)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555797 () Bool)

(assert (=> b!1555797 (= e!866336 e!866337)))

(declare-fun c!144037 () Bool)

(assert (=> b!1555797 (= c!144037 (and ((_ is Cons!36238) (t!50950 lt!670292)) (not (= (_1!12408 (h!37701 (t!50950 lt!670292))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1555796 () Bool)

(assert (=> b!1555796 (= e!866336 (Some!802 (_2!12408 (h!37701 (t!50950 lt!670292)))))))

(declare-fun b!1555799 () Bool)

(assert (=> b!1555799 (= e!866337 None!801)))

(assert (= (and d!162191 c!144036) b!1555796))

(assert (= (and d!162191 (not c!144036)) b!1555797))

(assert (= (and b!1555797 c!144037) b!1555798))

(assert (= (and b!1555797 (not c!144037)) b!1555799))

(declare-fun m!1434293 () Bool)

(assert (=> b!1555798 m!1434293))

(assert (=> b!1555461 d!162191))

(declare-fun d!162193 () Bool)

(assert (=> d!162193 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670555 () Unit!51616)

(assert (=> d!162193 (= lt!670555 (choose!2032 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)))))

(declare-fun e!866338 () Bool)

(assert (=> d!162193 e!866338))

(declare-fun res!1064073 () Bool)

(assert (=> d!162193 (=> (not res!1064073) (not e!866338))))

(assert (=> d!162193 (= res!1064073 (isStrictlySorted!875 (toList!11221 lt!670309)))))

(assert (=> d!162193 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)) lt!670555)))

(declare-fun b!1555800 () Bool)

(assert (=> b!1555800 (= e!866338 (containsKey!754 (toList!11221 lt!670309) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!162193 res!1064073) b!1555800))

(assert (=> d!162193 m!1433213))

(assert (=> d!162193 m!1433587))

(assert (=> d!162193 m!1433587))

(assert (=> d!162193 m!1433629))

(assert (=> d!162193 m!1433213))

(declare-fun m!1434295 () Bool)

(assert (=> d!162193 m!1434295))

(assert (=> d!162193 m!1434077))

(assert (=> b!1555800 m!1433213))

(assert (=> b!1555800 m!1433625))

(assert (=> b!1555327 d!162193))

(assert (=> b!1555327 d!162009))

(assert (=> b!1555327 d!161967))

(declare-fun d!162195 () Bool)

(declare-fun lt!670556 () Bool)

(assert (=> d!162195 (= lt!670556 (select (content!784 (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!866339 () Bool)

(assert (=> d!162195 (= lt!670556 e!866339)))

(declare-fun res!1064074 () Bool)

(assert (=> d!162195 (=> (not res!1064074) (not e!866339))))

(assert (=> d!162195 (= res!1064074 ((_ is Cons!36239) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)))))

(assert (=> d!162195 (= (contains!10177 (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!670556)))

(declare-fun b!1555801 () Bool)

(declare-fun e!866340 () Bool)

(assert (=> b!1555801 (= e!866339 e!866340)))

(declare-fun res!1064075 () Bool)

(assert (=> b!1555801 (=> res!1064075 e!866340)))

(assert (=> b!1555801 (= res!1064075 (= (h!37702 (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1555802 () Bool)

(assert (=> b!1555802 (= e!866340 (contains!10177 (t!50951 (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!162195 res!1064074) b!1555801))

(assert (= (and b!1555801 (not res!1064075)) b!1555802))

(declare-fun m!1434297 () Bool)

(assert (=> d!162195 m!1434297))

(assert (=> d!162195 m!1433721))

(declare-fun m!1434299 () Bool)

(assert (=> d!162195 m!1434299))

(assert (=> b!1555802 m!1433721))

(declare-fun m!1434301 () Bool)

(assert (=> b!1555802 m!1434301))

(assert (=> b!1555454 d!162195))

(assert (=> b!1555371 d!162061))

(assert (=> b!1555371 d!162063))

(declare-fun call!71520 () Bool)

(declare-fun c!144038 () Bool)

(declare-fun bm!71517 () Bool)

(assert (=> bm!71517 (= call!71520 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144038 (Cons!36239 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!143934 (Cons!36239 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240))) (ite c!143934 (Cons!36239 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)))))))

(declare-fun b!1555803 () Bool)

(declare-fun e!866341 () Bool)

(assert (=> b!1555803 (= e!866341 call!71520)))

(declare-fun d!162197 () Bool)

(declare-fun res!1064077 () Bool)

(declare-fun e!866343 () Bool)

(assert (=> d!162197 (=> res!1064077 e!866343)))

(assert (=> d!162197 (= res!1064077 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50615 _keys!618)))))

(assert (=> d!162197 (= (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!143934 (Cons!36239 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240))) e!866343)))

(declare-fun b!1555804 () Bool)

(declare-fun e!866342 () Bool)

(assert (=> b!1555804 (= e!866343 e!866342)))

(declare-fun res!1064076 () Bool)

(assert (=> b!1555804 (=> (not res!1064076) (not e!866342))))

(declare-fun e!866344 () Bool)

(assert (=> b!1555804 (= res!1064076 (not e!866344))))

(declare-fun res!1064078 () Bool)

(assert (=> b!1555804 (=> (not res!1064078) (not e!866344))))

(assert (=> b!1555804 (= res!1064078 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1555805 () Bool)

(assert (=> b!1555805 (= e!866341 call!71520)))

(declare-fun b!1555806 () Bool)

(assert (=> b!1555806 (= e!866344 (contains!10177 (ite c!143934 (Cons!36239 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (ite c!143858 (Cons!36239 (select (arr!50064 _keys!618) #b00000000000000000000000000000000) Nil!36240) Nil!36240)) (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1555807 () Bool)

(assert (=> b!1555807 (= e!866342 e!866341)))

(assert (=> b!1555807 (= c!144038 (validKeyInArray!0 (select (arr!50064 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!162197 (not res!1064077)) b!1555804))

(assert (= (and b!1555804 res!1064078) b!1555806))

(assert (= (and b!1555804 res!1064076) b!1555807))

(assert (= (and b!1555807 c!144038) b!1555803))

(assert (= (and b!1555807 (not c!144038)) b!1555805))

(assert (= (or b!1555803 b!1555805) bm!71517))

(assert (=> bm!71517 m!1434209))

(declare-fun m!1434303 () Bool)

(assert (=> bm!71517 m!1434303))

(assert (=> b!1555804 m!1434209))

(assert (=> b!1555804 m!1434209))

(assert (=> b!1555804 m!1434217))

(assert (=> b!1555806 m!1434209))

(assert (=> b!1555806 m!1434209))

(declare-fun m!1434305 () Bool)

(assert (=> b!1555806 m!1434305))

(assert (=> b!1555807 m!1434209))

(assert (=> b!1555807 m!1434209))

(assert (=> b!1555807 m!1434217))

(assert (=> bm!71496 d!162197))

(declare-fun d!162199 () Bool)

(declare-fun res!1064079 () Bool)

(declare-fun e!866345 () Bool)

(assert (=> d!162199 (=> res!1064079 e!866345)))

(assert (=> d!162199 (= res!1064079 (and ((_ is Cons!36238) lt!670402) (= (_1!12408 (h!37701 lt!670402)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!162199 (= (containsKey!754 lt!670402 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!866345)))

(declare-fun b!1555808 () Bool)

(declare-fun e!866346 () Bool)

(assert (=> b!1555808 (= e!866345 e!866346)))

(declare-fun res!1064080 () Bool)

(assert (=> b!1555808 (=> (not res!1064080) (not e!866346))))

(assert (=> b!1555808 (= res!1064080 (and (or (not ((_ is Cons!36238) lt!670402)) (bvsle (_1!12408 (h!37701 lt!670402)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36238) lt!670402) (bvslt (_1!12408 (h!37701 lt!670402)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555809 () Bool)

(assert (=> b!1555809 (= e!866346 (containsKey!754 (t!50950 lt!670402) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!162199 (not res!1064079)) b!1555808))

(assert (= (and b!1555808 res!1064080) b!1555809))

(declare-fun m!1434307 () Bool)

(assert (=> b!1555809 m!1434307))

(assert (=> b!1555364 d!162199))

(assert (=> b!1555398 d!162055))

(assert (=> b!1555398 d!162057))

(declare-fun d!162201 () Bool)

(assert (=> d!162201 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)))))

(declare-fun lt!670557 () Unit!51616)

(assert (=> d!162201 (= lt!670557 (choose!2032 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)))))

(declare-fun e!866347 () Bool)

(assert (=> d!162201 e!866347))

(declare-fun res!1064081 () Bool)

(assert (=> d!162201 (=> (not res!1064081) (not e!866347))))

(assert (=> d!162201 (= res!1064081 (isStrictlySorted!875 (toList!11221 lt!670212)))))

(assert (=> d!162201 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)) lt!670557)))

(declare-fun b!1555810 () Bool)

(assert (=> b!1555810 (= e!866347 (containsKey!754 (toList!11221 lt!670212) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!162201 res!1064081) b!1555810))

(assert (=> d!162201 m!1433213))

(assert (=> d!162201 m!1433489))

(assert (=> d!162201 m!1433489))

(assert (=> d!162201 m!1433711))

(assert (=> d!162201 m!1433213))

(declare-fun m!1434309 () Bool)

(assert (=> d!162201 m!1434309))

(assert (=> d!162201 m!1433621))

(assert (=> b!1555810 m!1433213))

(assert (=> b!1555810 m!1433707))

(assert (=> b!1555383 d!162201))

(assert (=> b!1555383 d!162043))

(assert (=> b!1555383 d!161805))

(assert (=> d!161879 d!161777))

(assert (=> d!161879 d!161769))

(assert (=> d!161879 d!161779))

(declare-fun c!144039 () Bool)

(declare-fun d!162203 () Bool)

(assert (=> d!162203 (= c!144039 (and ((_ is Cons!36238) (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun e!866348 () Option!803)

(assert (=> d!162203 (= (getValueByKey!728 (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (select (arr!50064 _keys!618) from!762)) e!866348)))

(declare-fun b!1555813 () Bool)

(declare-fun e!866349 () Option!803)

(assert (=> b!1555813 (= e!866349 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!50064 _keys!618) from!762)))))

(declare-fun b!1555812 () Bool)

(assert (=> b!1555812 (= e!866348 e!866349)))

(declare-fun c!144040 () Bool)

(assert (=> b!1555812 (= c!144040 (and ((_ is Cons!36238) (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (select (arr!50064 _keys!618) from!762)))))))

(declare-fun b!1555811 () Bool)

(assert (=> b!1555811 (= e!866348 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 (+!5049 lt!670212 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))))

(declare-fun b!1555814 () Bool)

(assert (=> b!1555814 (= e!866349 None!801)))

(assert (= (and d!162203 c!144039) b!1555811))

(assert (= (and d!162203 (not c!144039)) b!1555812))

(assert (= (and b!1555812 c!144040) b!1555813))

(assert (= (and b!1555812 (not c!144040)) b!1555814))

(assert (=> b!1555813 m!1433213))

(declare-fun m!1434311 () Bool)

(assert (=> b!1555813 m!1434311))

(assert (=> b!1555447 d!162203))

(declare-fun d!162205 () Bool)

(declare-fun e!866350 () Bool)

(assert (=> d!162205 e!866350))

(declare-fun res!1064082 () Bool)

(assert (=> d!162205 (=> res!1064082 e!866350)))

(declare-fun lt!670559 () Bool)

(assert (=> d!162205 (= res!1064082 (not lt!670559))))

(declare-fun lt!670560 () Bool)

(assert (=> d!162205 (= lt!670559 lt!670560)))

(declare-fun lt!670561 () Unit!51616)

(declare-fun e!866351 () Unit!51616)

(assert (=> d!162205 (= lt!670561 e!866351)))

(declare-fun c!144041 () Bool)

(assert (=> d!162205 (= c!144041 lt!670560)))

(assert (=> d!162205 (= lt!670560 (containsKey!754 (toList!11221 lt!670368) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162205 (= (contains!10173 lt!670368 #b1000000000000000000000000000000000000000000000000000000000000000) lt!670559)))

(declare-fun b!1555815 () Bool)

(declare-fun lt!670558 () Unit!51616)

(assert (=> b!1555815 (= e!866351 lt!670558)))

(assert (=> b!1555815 (= lt!670558 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11221 lt!670368) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1555815 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670368) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555816 () Bool)

(declare-fun Unit!51645 () Unit!51616)

(assert (=> b!1555816 (= e!866351 Unit!51645)))

(declare-fun b!1555817 () Bool)

(assert (=> b!1555817 (= e!866350 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670368) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162205 c!144041) b!1555815))

(assert (= (and d!162205 (not c!144041)) b!1555816))

(assert (= (and d!162205 (not res!1064082)) b!1555817))

(declare-fun m!1434313 () Bool)

(assert (=> d!162205 m!1434313))

(declare-fun m!1434315 () Bool)

(assert (=> b!1555815 m!1434315))

(declare-fun m!1434317 () Bool)

(assert (=> b!1555815 m!1434317))

(assert (=> b!1555815 m!1434317))

(declare-fun m!1434319 () Bool)

(assert (=> b!1555815 m!1434319))

(assert (=> b!1555817 m!1434317))

(assert (=> b!1555817 m!1434317))

(assert (=> b!1555817 m!1434319))

(assert (=> b!1555244 d!162205))

(declare-fun d!162207 () Bool)

(declare-fun lt!670562 () Bool)

(assert (=> d!162207 (= lt!670562 (select (content!783 lt!670345) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866352 () Bool)

(assert (=> d!162207 (= lt!670562 e!866352)))

(declare-fun res!1064083 () Bool)

(assert (=> d!162207 (=> (not res!1064083) (not e!866352))))

(assert (=> d!162207 (= res!1064083 ((_ is Cons!36238) lt!670345))))

(assert (=> d!162207 (= (contains!10176 lt!670345 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670562)))

(declare-fun b!1555818 () Bool)

(declare-fun e!866353 () Bool)

(assert (=> b!1555818 (= e!866352 e!866353)))

(declare-fun res!1064084 () Bool)

(assert (=> b!1555818 (=> res!1064084 e!866353)))

(assert (=> b!1555818 (= res!1064084 (= (h!37701 lt!670345) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555819 () Bool)

(assert (=> b!1555819 (= e!866353 (contains!10176 (t!50950 lt!670345) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!162207 res!1064083) b!1555818))

(assert (= (and b!1555818 (not res!1064084)) b!1555819))

(declare-fun m!1434321 () Bool)

(assert (=> d!162207 m!1434321))

(declare-fun m!1434323 () Bool)

(assert (=> d!162207 m!1434323))

(declare-fun m!1434325 () Bool)

(assert (=> b!1555819 m!1434325))

(assert (=> b!1555292 d!162207))

(declare-fun d!162209 () Bool)

(declare-fun res!1064085 () Bool)

(declare-fun e!866354 () Bool)

(assert (=> d!162209 (=> res!1064085 e!866354)))

(assert (=> d!162209 (= res!1064085 (and ((_ is Cons!36238) lt!670353) (= (_1!12408 (h!37701 lt!670353)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!162209 (= (containsKey!754 lt!670353 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!866354)))

(declare-fun b!1555820 () Bool)

(declare-fun e!866355 () Bool)

(assert (=> b!1555820 (= e!866354 e!866355)))

(declare-fun res!1064086 () Bool)

(assert (=> b!1555820 (=> (not res!1064086) (not e!866355))))

(assert (=> b!1555820 (= res!1064086 (and (or (not ((_ is Cons!36238) lt!670353)) (bvsle (_1!12408 (h!37701 lt!670353)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36238) lt!670353) (bvslt (_1!12408 (h!37701 lt!670353)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555821 () Bool)

(assert (=> b!1555821 (= e!866355 (containsKey!754 (t!50950 lt!670353) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!162209 (not res!1064085)) b!1555820))

(assert (= (and b!1555820 res!1064086) b!1555821))

(declare-fun m!1434327 () Bool)

(assert (=> b!1555821 m!1434327))

(assert (=> b!1555356 d!162209))

(declare-fun d!162211 () Bool)

(declare-fun c!144042 () Bool)

(assert (=> d!162211 (= c!144042 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670291))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670291)))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!866356 () Option!803)

(assert (=> d!162211 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670291)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!866356)))

(declare-fun b!1555824 () Bool)

(declare-fun e!866357 () Option!803)

(assert (=> b!1555824 (= e!866357 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670291))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555823 () Bool)

(assert (=> b!1555823 (= e!866356 e!866357)))

(declare-fun c!144043 () Bool)

(assert (=> b!1555823 (= c!144043 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670291))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670291)))) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1555822 () Bool)

(assert (=> b!1555822 (= e!866356 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670291))))))))

(declare-fun b!1555825 () Bool)

(assert (=> b!1555825 (= e!866357 None!801)))

(assert (= (and d!162211 c!144042) b!1555822))

(assert (= (and d!162211 (not c!144042)) b!1555823))

(assert (= (and b!1555823 c!144043) b!1555824))

(assert (= (and b!1555823 (not c!144043)) b!1555825))

(declare-fun m!1434329 () Bool)

(assert (=> b!1555824 m!1434329))

(assert (=> b!1555273 d!162211))

(declare-fun d!162213 () Bool)

(declare-fun lt!670563 () Bool)

(assert (=> d!162213 (= lt!670563 (select (content!783 (t!50950 (toList!11221 lt!670344))) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!866358 () Bool)

(assert (=> d!162213 (= lt!670563 e!866358)))

(declare-fun res!1064087 () Bool)

(assert (=> d!162213 (=> (not res!1064087) (not e!866358))))

(assert (=> d!162213 (= res!1064087 ((_ is Cons!36238) (t!50950 (toList!11221 lt!670344))))))

(assert (=> d!162213 (= (contains!10176 (t!50950 (toList!11221 lt!670344)) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!670563)))

(declare-fun b!1555826 () Bool)

(declare-fun e!866359 () Bool)

(assert (=> b!1555826 (= e!866358 e!866359)))

(declare-fun res!1064088 () Bool)

(assert (=> b!1555826 (=> res!1064088 e!866359)))

(assert (=> b!1555826 (= res!1064088 (= (h!37701 (t!50950 (toList!11221 lt!670344))) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1555827 () Bool)

(assert (=> b!1555827 (= e!866359 (contains!10176 (t!50950 (t!50950 (toList!11221 lt!670344))) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!162213 res!1064087) b!1555826))

(assert (= (and b!1555826 (not res!1064088)) b!1555827))

(declare-fun m!1434331 () Bool)

(assert (=> d!162213 m!1434331))

(declare-fun m!1434333 () Bool)

(assert (=> d!162213 m!1434333))

(declare-fun m!1434335 () Bool)

(assert (=> b!1555827 m!1434335))

(assert (=> b!1555381 d!162213))

(declare-fun d!162215 () Bool)

(declare-fun lt!670564 () Bool)

(assert (=> d!162215 (= lt!670564 (select (content!783 lt!670465) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!866360 () Bool)

(assert (=> d!162215 (= lt!670564 e!866360)))

(declare-fun res!1064089 () Bool)

(assert (=> d!162215 (=> (not res!1064089) (not e!866360))))

(assert (=> d!162215 (= res!1064089 ((_ is Cons!36238) lt!670465))))

(assert (=> d!162215 (= (contains!10176 lt!670465 (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) lt!670564)))

(declare-fun b!1555828 () Bool)

(declare-fun e!866361 () Bool)

(assert (=> b!1555828 (= e!866360 e!866361)))

(declare-fun res!1064090 () Bool)

(assert (=> b!1555828 (=> res!1064090 e!866361)))

(assert (=> b!1555828 (= res!1064090 (= (h!37701 lt!670465) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555829 () Bool)

(assert (=> b!1555829 (= e!866361 (contains!10176 (t!50950 lt!670465) (tuple2!24795 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!162215 res!1064089) b!1555828))

(assert (= (and b!1555828 (not res!1064090)) b!1555829))

(declare-fun m!1434337 () Bool)

(assert (=> d!162215 m!1434337))

(declare-fun m!1434339 () Bool)

(assert (=> d!162215 m!1434339))

(declare-fun m!1434341 () Bool)

(assert (=> b!1555829 m!1434341))

(assert (=> b!1555473 d!162215))

(assert (=> d!161937 d!161935))

(declare-fun d!162217 () Bool)

(assert (=> d!162217 (= (getValueByKey!728 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!802 (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!162217 true))

(declare-fun _$22!589 () Unit!51616)

(assert (=> d!162217 (= (choose!2033 lt!670292 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) _$22!589)))

(declare-fun bs!44658 () Bool)

(assert (= bs!44658 d!162217))

(assert (=> bs!44658 m!1433393))

(assert (=> d!161937 d!162217))

(declare-fun d!162219 () Bool)

(declare-fun res!1064091 () Bool)

(declare-fun e!866362 () Bool)

(assert (=> d!162219 (=> res!1064091 e!866362)))

(assert (=> d!162219 (= res!1064091 (or ((_ is Nil!36239) lt!670292) ((_ is Nil!36239) (t!50950 lt!670292))))))

(assert (=> d!162219 (= (isStrictlySorted!875 lt!670292) e!866362)))

(declare-fun b!1555830 () Bool)

(declare-fun e!866363 () Bool)

(assert (=> b!1555830 (= e!866362 e!866363)))

(declare-fun res!1064092 () Bool)

(assert (=> b!1555830 (=> (not res!1064092) (not e!866363))))

(assert (=> b!1555830 (= res!1064092 (bvslt (_1!12408 (h!37701 lt!670292)) (_1!12408 (h!37701 (t!50950 lt!670292)))))))

(declare-fun b!1555831 () Bool)

(assert (=> b!1555831 (= e!866363 (isStrictlySorted!875 (t!50950 lt!670292)))))

(assert (= (and d!162219 (not res!1064091)) b!1555830))

(assert (= (and b!1555830 res!1064092) b!1555831))

(declare-fun m!1434343 () Bool)

(assert (=> b!1555831 m!1434343))

(assert (=> d!161937 d!162219))

(declare-fun d!162221 () Bool)

(declare-fun lt!670565 () Bool)

(assert (=> d!162221 (= lt!670565 (select (content!783 lt!670338) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866364 () Bool)

(assert (=> d!162221 (= lt!670565 e!866364)))

(declare-fun res!1064093 () Bool)

(assert (=> d!162221 (=> (not res!1064093) (not e!866364))))

(assert (=> d!162221 (= res!1064093 ((_ is Cons!36238) lt!670338))))

(assert (=> d!162221 (= (contains!10176 lt!670338 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670565)))

(declare-fun b!1555832 () Bool)

(declare-fun e!866365 () Bool)

(assert (=> b!1555832 (= e!866364 e!866365)))

(declare-fun res!1064094 () Bool)

(assert (=> b!1555832 (=> res!1064094 e!866365)))

(assert (=> b!1555832 (= res!1064094 (= (h!37701 lt!670338) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555833 () Bool)

(assert (=> b!1555833 (= e!866365 (contains!10176 (t!50950 lt!670338) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!162221 res!1064093) b!1555832))

(assert (= (and b!1555832 (not res!1064094)) b!1555833))

(declare-fun m!1434345 () Bool)

(assert (=> d!162221 m!1434345))

(declare-fun m!1434347 () Bool)

(assert (=> d!162221 m!1434347))

(declare-fun m!1434349 () Bool)

(assert (=> b!1555833 m!1434349))

(assert (=> b!1555338 d!162221))

(declare-fun c!144044 () Bool)

(declare-fun d!162223 () Bool)

(assert (=> d!162223 (= c!144044 (and ((_ is Cons!36238) (toList!11221 lt!670435)) (= (_1!12408 (h!37701 (toList!11221 lt!670435))) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!866366 () Option!803)

(assert (=> d!162223 (= (getValueByKey!728 (toList!11221 lt!670435) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!866366)))

(declare-fun e!866367 () Option!803)

(declare-fun b!1555836 () Bool)

(assert (=> b!1555836 (= e!866367 (getValueByKey!728 (t!50950 (toList!11221 lt!670435)) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1555835 () Bool)

(assert (=> b!1555835 (= e!866366 e!866367)))

(declare-fun c!144045 () Bool)

(assert (=> b!1555835 (= c!144045 (and ((_ is Cons!36238) (toList!11221 lt!670435)) (not (= (_1!12408 (h!37701 (toList!11221 lt!670435))) (_1!12408 (tuple2!24795 (select (arr!50064 _keys!618) from!762) (get!26078 (select (arr!50065 _values!470) from!762) (dynLambda!3859 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1555834 () Bool)

(assert (=> b!1555834 (= e!866366 (Some!802 (_2!12408 (h!37701 (toList!11221 lt!670435)))))))

(declare-fun b!1555837 () Bool)

(assert (=> b!1555837 (= e!866367 None!801)))

(assert (= (and d!162223 c!144044) b!1555834))

(assert (= (and d!162223 (not c!144044)) b!1555835))

(assert (= (and b!1555835 c!144045) b!1555836))

(assert (= (and b!1555835 (not c!144045)) b!1555837))

(declare-fun m!1434351 () Bool)

(assert (=> b!1555836 m!1434351))

(assert (=> b!1555410 d!162223))

(declare-fun d!162225 () Bool)

(declare-fun c!144046 () Bool)

(assert (=> d!162225 (= c!144046 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!866368 () Option!803)

(assert (=> d!162225 (= (getValueByKey!728 (t!50950 (toList!11221 lt!670211)) #b0000000000000000000000000000000000000000000000000000000000000000) e!866368)))

(declare-fun b!1555840 () Bool)

(declare-fun e!866369 () Option!803)

(assert (=> b!1555840 (= e!866369 (getValueByKey!728 (t!50950 (t!50950 (toList!11221 lt!670211))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1555839 () Bool)

(assert (=> b!1555839 (= e!866368 e!866369)))

(declare-fun c!144047 () Bool)

(assert (=> b!1555839 (= c!144047 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670211))) (not (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670211)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1555838 () Bool)

(assert (=> b!1555838 (= e!866368 (Some!802 (_2!12408 (h!37701 (t!50950 (toList!11221 lt!670211))))))))

(declare-fun b!1555841 () Bool)

(assert (=> b!1555841 (= e!866369 None!801)))

(assert (= (and d!162225 c!144046) b!1555838))

(assert (= (and d!162225 (not c!144046)) b!1555839))

(assert (= (and b!1555839 c!144047) b!1555840))

(assert (= (and b!1555839 (not c!144047)) b!1555841))

(declare-fun m!1434353 () Bool)

(assert (=> b!1555840 m!1434353))

(assert (=> b!1555325 d!162225))

(declare-fun d!162227 () Bool)

(declare-fun c!144048 () Bool)

(assert (=> d!162227 (= c!144048 ((_ is Nil!36239) (toList!11221 lt!670344)))))

(declare-fun e!866370 () (InoxSet tuple2!24794))

(assert (=> d!162227 (= (content!783 (toList!11221 lt!670344)) e!866370)))

(declare-fun b!1555842 () Bool)

(assert (=> b!1555842 (= e!866370 ((as const (Array tuple2!24794 Bool)) false))))

(declare-fun b!1555843 () Bool)

(assert (=> b!1555843 (= e!866370 ((_ map or) (store ((as const (Array tuple2!24794 Bool)) false) (h!37701 (toList!11221 lt!670344)) true) (content!783 (t!50950 (toList!11221 lt!670344)))))))

(assert (= (and d!162227 c!144048) b!1555842))

(assert (= (and d!162227 (not c!144048)) b!1555843))

(declare-fun m!1434355 () Bool)

(assert (=> b!1555843 m!1434355))

(assert (=> b!1555843 m!1434331))

(assert (=> d!161877 d!162227))

(declare-fun d!162229 () Bool)

(assert (=> d!162229 (= (isEmpty!1136 (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!802) (getValueByKey!728 (toList!11221 lt!670211) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!161869 d!162229))

(assert (=> b!1555455 d!161999))

(declare-fun b!1555844 () Bool)

(declare-fun e!866374 () List!36242)

(declare-fun call!71521 () List!36242)

(assert (=> b!1555844 (= e!866374 call!71521)))

(declare-fun b!1555845 () Bool)

(declare-fun c!144049 () Bool)

(assert (=> b!1555845 (= c!144049 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670212))) (bvsgt (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212)))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!866371 () List!36242)

(assert (=> b!1555845 (= e!866371 e!866374)))

(declare-fun b!1555846 () Bool)

(declare-fun e!866375 () List!36242)

(assert (=> b!1555846 (= e!866375 e!866371)))

(declare-fun c!144050 () Bool)

(assert (=> b!1555846 (= c!144050 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670212))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212)))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555847 () Bool)

(declare-fun e!866373 () List!36242)

(assert (=> b!1555847 (= e!866373 (ite c!144050 (t!50950 (t!50950 (toList!11221 lt!670212))) (ite c!144049 (Cons!36238 (h!37701 (t!50950 (toList!11221 lt!670212))) (t!50950 (t!50950 (toList!11221 lt!670212)))) Nil!36239)))))

(declare-fun b!1555848 () Bool)

(declare-fun call!71522 () List!36242)

(assert (=> b!1555848 (= e!866375 call!71522)))

(declare-fun b!1555849 () Bool)

(declare-fun call!71523 () List!36242)

(assert (=> b!1555849 (= e!866371 call!71523)))

(declare-fun b!1555850 () Bool)

(declare-fun res!1064095 () Bool)

(declare-fun e!866372 () Bool)

(assert (=> b!1555850 (=> (not res!1064095) (not e!866372))))

(declare-fun lt!670566 () List!36242)

(assert (=> b!1555850 (= res!1064095 (containsKey!754 lt!670566 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1555851 () Bool)

(assert (=> b!1555851 (= e!866374 call!71521)))

(declare-fun d!162231 () Bool)

(assert (=> d!162231 e!866372))

(declare-fun res!1064096 () Bool)

(assert (=> d!162231 (=> (not res!1064096) (not e!866372))))

(assert (=> d!162231 (= res!1064096 (isStrictlySorted!875 lt!670566))))

(assert (=> d!162231 (= lt!670566 e!866375)))

(declare-fun c!144051 () Bool)

(assert (=> d!162231 (= c!144051 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670212))) (bvslt (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670212)))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!162231 (isStrictlySorted!875 (t!50950 (toList!11221 lt!670212)))))

(assert (=> d!162231 (= (insertStrictlySorted!504 (t!50950 (toList!11221 lt!670212)) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!670566)))

(declare-fun bm!71518 () Bool)

(assert (=> bm!71518 (= call!71523 call!71522)))

(declare-fun bm!71519 () Bool)

(assert (=> bm!71519 (= call!71521 call!71523)))

(declare-fun b!1555852 () Bool)

(assert (=> b!1555852 (= e!866372 (contains!10176 lt!670566 (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1555853 () Bool)

(assert (=> b!1555853 (= e!866373 (insertStrictlySorted!504 (t!50950 (t!50950 (toList!11221 lt!670212))) (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun bm!71520 () Bool)

(assert (=> bm!71520 (= call!71522 ($colon$colon!943 e!866373 (ite c!144051 (h!37701 (t!50950 (toList!11221 lt!670212))) (tuple2!24795 (_1!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12408 (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun c!144052 () Bool)

(assert (=> bm!71520 (= c!144052 c!144051)))

(assert (= (and d!162231 c!144051) b!1555848))

(assert (= (and d!162231 (not c!144051)) b!1555846))

(assert (= (and b!1555846 c!144050) b!1555849))

(assert (= (and b!1555846 (not c!144050)) b!1555845))

(assert (= (and b!1555845 c!144049) b!1555851))

(assert (= (and b!1555845 (not c!144049)) b!1555844))

(assert (= (or b!1555851 b!1555844) bm!71519))

(assert (= (or b!1555849 bm!71519) bm!71518))

(assert (= (or b!1555848 bm!71518) bm!71520))

(assert (= (and bm!71520 c!144052) b!1555853))

(assert (= (and bm!71520 (not c!144052)) b!1555847))

(assert (= (and d!162231 res!1064096) b!1555850))

(assert (= (and b!1555850 res!1064095) b!1555852))

(declare-fun m!1434357 () Bool)

(assert (=> b!1555852 m!1434357))

(declare-fun m!1434359 () Bool)

(assert (=> bm!71520 m!1434359))

(declare-fun m!1434361 () Bool)

(assert (=> b!1555850 m!1434361))

(declare-fun m!1434363 () Bool)

(assert (=> b!1555853 m!1434363))

(declare-fun m!1434365 () Bool)

(assert (=> d!162231 m!1434365))

(assert (=> d!162231 m!1434027))

(assert (=> b!1555367 d!162231))

(declare-fun d!162233 () Bool)

(declare-fun res!1064097 () Bool)

(declare-fun e!866376 () Bool)

(assert (=> d!162233 (=> res!1064097 e!866376)))

(assert (=> d!162233 (= res!1064097 (and ((_ is Cons!36238) (t!50950 (toList!11221 lt!670204))) (= (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670204)))) (select (arr!50064 _keys!618) from!762))))))

(assert (=> d!162233 (= (containsKey!754 (t!50950 (toList!11221 lt!670204)) (select (arr!50064 _keys!618) from!762)) e!866376)))

(declare-fun b!1555854 () Bool)

(declare-fun e!866377 () Bool)

(assert (=> b!1555854 (= e!866376 e!866377)))

(declare-fun res!1064098 () Bool)

(assert (=> b!1555854 (=> (not res!1064098) (not e!866377))))

(assert (=> b!1555854 (= res!1064098 (and (or (not ((_ is Cons!36238) (t!50950 (toList!11221 lt!670204)))) (bvsle (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670204)))) (select (arr!50064 _keys!618) from!762))) ((_ is Cons!36238) (t!50950 (toList!11221 lt!670204))) (bvslt (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670204)))) (select (arr!50064 _keys!618) from!762))))))

(declare-fun b!1555855 () Bool)

(assert (=> b!1555855 (= e!866377 (containsKey!754 (t!50950 (t!50950 (toList!11221 lt!670204))) (select (arr!50064 _keys!618) from!762)))))

(assert (= (and d!162233 (not res!1064097)) b!1555854))

(assert (= (and b!1555854 res!1064098) b!1555855))

(assert (=> b!1555855 m!1433213))

(declare-fun m!1434367 () Bool)

(assert (=> b!1555855 m!1434367))

(assert (=> b!1555375 d!162233))

(declare-fun d!162235 () Bool)

(declare-fun lt!670567 () Bool)

(assert (=> d!162235 (= lt!670567 (select (content!783 lt!670386) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!866378 () Bool)

(assert (=> d!162235 (= lt!670567 e!866378)))

(declare-fun res!1064099 () Bool)

(assert (=> d!162235 (=> (not res!1064099) (not e!866378))))

(assert (=> d!162235 (= res!1064099 ((_ is Cons!36238) lt!670386))))

(assert (=> d!162235 (= (contains!10176 lt!670386 (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!670567)))

(declare-fun b!1555856 () Bool)

(declare-fun e!866379 () Bool)

(assert (=> b!1555856 (= e!866378 e!866379)))

(declare-fun res!1064100 () Bool)

(assert (=> b!1555856 (=> res!1064100 e!866379)))

(assert (=> b!1555856 (= res!1064100 (= (h!37701 lt!670386) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555857 () Bool)

(assert (=> b!1555857 (= e!866379 (contains!10176 (t!50950 lt!670386) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!162235 res!1064099) b!1555856))

(assert (= (and b!1555856 (not res!1064100)) b!1555857))

(declare-fun m!1434369 () Bool)

(assert (=> d!162235 m!1434369))

(declare-fun m!1434371 () Bool)

(assert (=> d!162235 m!1434371))

(declare-fun m!1434373 () Bool)

(assert (=> b!1555857 m!1434373))

(assert (=> b!1555321 d!162235))

(assert (=> b!1555237 d!161995))

(assert (=> b!1555351 d!162107))

(assert (=> b!1555351 d!161829))

(assert (=> b!1555393 d!161875))

(assert (=> d!161891 d!161893))

(assert (=> d!161891 d!161813))

(declare-fun d!162237 () Bool)

(assert (=> d!162237 (isDefined!546 (getValueByKey!728 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)))))

(assert (=> d!162237 true))

(declare-fun _$12!486 () Unit!51616)

(assert (=> d!162237 (= (choose!2032 (toList!11221 lt!670204) (select (arr!50064 _keys!618) from!762)) _$12!486)))

(declare-fun bs!44659 () Bool)

(assert (= bs!44659 d!162237))

(assert (=> bs!44659 m!1433213))

(assert (=> bs!44659 m!1433475))

(assert (=> bs!44659 m!1433475))

(assert (=> bs!44659 m!1433509))

(assert (=> d!161891 d!162237))

(declare-fun d!162239 () Bool)

(declare-fun res!1064101 () Bool)

(declare-fun e!866380 () Bool)

(assert (=> d!162239 (=> res!1064101 e!866380)))

(assert (=> d!162239 (= res!1064101 (or ((_ is Nil!36239) (toList!11221 lt!670204)) ((_ is Nil!36239) (t!50950 (toList!11221 lt!670204)))))))

(assert (=> d!162239 (= (isStrictlySorted!875 (toList!11221 lt!670204)) e!866380)))

(declare-fun b!1555858 () Bool)

(declare-fun e!866381 () Bool)

(assert (=> b!1555858 (= e!866380 e!866381)))

(declare-fun res!1064102 () Bool)

(assert (=> b!1555858 (=> (not res!1064102) (not e!866381))))

(assert (=> b!1555858 (= res!1064102 (bvslt (_1!12408 (h!37701 (toList!11221 lt!670204))) (_1!12408 (h!37701 (t!50950 (toList!11221 lt!670204))))))))

(declare-fun b!1555859 () Bool)

(assert (=> b!1555859 (= e!866381 (isStrictlySorted!875 (t!50950 (toList!11221 lt!670204))))))

(assert (= (and d!162239 (not res!1064101)) b!1555858))

(assert (= (and b!1555858 res!1064102) b!1555859))

(declare-fun m!1434375 () Bool)

(assert (=> b!1555859 m!1434375))

(assert (=> d!161891 d!162239))

(declare-fun d!162241 () Bool)

(assert (=> d!162241 (= ($colon$colon!943 e!866035 (ite c!143908 (h!37701 (toList!11221 call!71426)) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (Cons!36238 (ite c!143908 (h!37701 (toList!11221 call!71426)) (tuple2!24795 (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!866035))))

(assert (=> bm!71491 d!162241))

(declare-fun d!162243 () Bool)

(declare-fun res!1064103 () Bool)

(declare-fun e!866382 () Bool)

(assert (=> d!162243 (=> res!1064103 e!866382)))

(assert (=> d!162243 (= res!1064103 (and ((_ is Cons!36238) lt!670465) (= (_1!12408 (h!37701 lt!670465)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!162243 (= (containsKey!754 lt!670465 (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!866382)))

(declare-fun b!1555860 () Bool)

(declare-fun e!866383 () Bool)

(assert (=> b!1555860 (= e!866382 e!866383)))

(declare-fun res!1064104 () Bool)

(assert (=> b!1555860 (=> (not res!1064104) (not e!866383))))

(assert (=> b!1555860 (= res!1064104 (and (or (not ((_ is Cons!36238) lt!670465)) (bvsle (_1!12408 (h!37701 lt!670465)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36238) lt!670465) (bvslt (_1!12408 (h!37701 lt!670465)) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1555861 () Bool)

(assert (=> b!1555861 (= e!866383 (containsKey!754 (t!50950 lt!670465) (_1!12408 (ite (or c!143794 c!143796) (tuple2!24795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!162243 (not res!1064103)) b!1555860))

(assert (= (and b!1555860 res!1064104) b!1555861))

(declare-fun m!1434377 () Bool)

(assert (=> b!1555861 m!1434377))

(assert (=> b!1555471 d!162243))

(declare-fun d!162245 () Bool)

(declare-fun res!1064105 () Bool)

(declare-fun e!866384 () Bool)

(assert (=> d!162245 (=> res!1064105 e!866384)))

(assert (=> d!162245 (= res!1064105 (and ((_ is Cons!36238) (toList!11221 lt!670344)) (= (_1!12408 (h!37701 (toList!11221 lt!670344))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!162245 (= (containsKey!754 (toList!11221 lt!670344) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!866384)))

(declare-fun b!1555862 () Bool)

(declare-fun e!866385 () Bool)

(assert (=> b!1555862 (= e!866384 e!866385)))

(declare-fun res!1064106 () Bool)

(assert (=> b!1555862 (=> (not res!1064106) (not e!866385))))

(assert (=> b!1555862 (= res!1064106 (and (or (not ((_ is Cons!36238) (toList!11221 lt!670344))) (bvsle (_1!12408 (h!37701 (toList!11221 lt!670344))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36238) (toList!11221 lt!670344)) (bvslt (_1!12408 (h!37701 (toList!11221 lt!670344))) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1555863 () Bool)

(assert (=> b!1555863 (= e!866385 (containsKey!754 (t!50950 (toList!11221 lt!670344)) (_1!12408 (tuple2!24795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!162245 (not res!1064105)) b!1555862))

(assert (= (and b!1555862 res!1064106) b!1555863))

(declare-fun m!1434379 () Bool)

(assert (=> b!1555863 m!1434379))

(assert (=> d!161835 d!162245))

(declare-fun b!1555865 () Bool)

(declare-fun e!866386 () Bool)

(assert (=> b!1555865 (= e!866386 tp_is_empty!38209)))

(declare-fun mapNonEmpty!59040 () Bool)

(declare-fun mapRes!59040 () Bool)

(declare-fun tp!112080 () Bool)

(declare-fun e!866387 () Bool)

(assert (=> mapNonEmpty!59040 (= mapRes!59040 (and tp!112080 e!866387))))

(declare-fun mapRest!59040 () (Array (_ BitVec 32) ValueCell!18194))

(declare-fun mapKey!59040 () (_ BitVec 32))

(declare-fun mapValue!59040 () ValueCell!18194)

(assert (=> mapNonEmpty!59040 (= mapRest!59039 (store mapRest!59040 mapKey!59040 mapValue!59040))))

(declare-fun condMapEmpty!59040 () Bool)

(declare-fun mapDefault!59040 () ValueCell!18194)

(assert (=> mapNonEmpty!59039 (= condMapEmpty!59040 (= mapRest!59039 ((as const (Array (_ BitVec 32) ValueCell!18194)) mapDefault!59040)))))

(assert (=> mapNonEmpty!59039 (= tp!112079 (and e!866386 mapRes!59040))))

(declare-fun mapIsEmpty!59040 () Bool)

(assert (=> mapIsEmpty!59040 mapRes!59040))

(declare-fun b!1555864 () Bool)

(assert (=> b!1555864 (= e!866387 tp_is_empty!38209)))

(assert (= (and mapNonEmpty!59039 condMapEmpty!59040) mapIsEmpty!59040))

(assert (= (and mapNonEmpty!59039 (not condMapEmpty!59040)) mapNonEmpty!59040))

(assert (= (and mapNonEmpty!59040 ((_ is ValueCellFull!18194) mapValue!59040)) b!1555864))

(assert (= (and mapNonEmpty!59039 ((_ is ValueCellFull!18194) mapDefault!59040)) b!1555865))

(declare-fun m!1434381 () Bool)

(assert (=> mapNonEmpty!59040 m!1434381))

(declare-fun b_lambda!24809 () Bool)

(assert (= b_lambda!24807 (or (and start!132718 b_free!31933) b_lambda!24809)))

(declare-fun b_lambda!24811 () Bool)

(assert (= b_lambda!24805 (or (and start!132718 b_free!31933) b_lambda!24811)))

(check-sat (not b!1555646) (not b!1555594) (not d!162215) (not b!1555833) (not b!1555679) (not b!1555684) (not d!162183) (not b!1555483) (not b!1555706) (not b!1555531) (not b!1555642) (not b!1555579) (not b!1555546) (not d!162117) (not b!1555532) (not b!1555640) (not b_lambda!24809) (not b!1555831) (not b!1555800) (not b_lambda!24801) (not b!1555556) (not b!1555573) (not b!1555809) (not bm!71506) (not b!1555652) (not b!1555493) (not d!162221) (not b!1555687) (not bm!71503) (not b_lambda!24793) (not d!162165) (not b!1555810) (not b!1555770) (not b!1555815) (not b!1555775) (not bm!71520) (not b!1555693) (not b!1555760) (not bm!71513) (not d!162159) (not b!1555552) (not b!1555521) (not d!162143) (not b!1555787) (not d!162193) (not d!162105) (not d!161989) (not b!1555733) (not b!1555577) (not d!162231) (not b!1555819) (not b!1555536) (not b!1555667) (not b!1555508) (not d!161959) (not b!1555696) (not d!161951) (not d!161963) (not b!1555790) (not b!1555602) (not b!1555650) (not b!1555857) (not b!1555657) (not d!162059) (not b!1555855) (not b!1555714) (not d!162095) (not b!1555664) (not b!1555539) (not d!162025) (not b!1555637) (not b!1555551) (not d!162205) tp_is_empty!38209 (not b!1555702) (not d!162213) (not d!162003) (not b!1555850) (not d!161975) (not b!1555585) (not d!162017) (not b!1555525) (not b!1555512) (not d!162127) (not d!162123) (not b!1555794) (not d!162045) (not d!162075) (not b!1555549) (not b!1555804) (not d!162019) (not d!161953) (not bm!71512) (not d!161991) (not b!1555584) (not d!162031) (not b!1555682) b_and!51395 (not b!1555582) (not d!162107) (not b!1555729) (not d!162005) (not b!1555859) (not d!162207) (not b!1555853) (not bm!71509) (not d!162097) (not b!1555700) (not b!1555563) (not b!1555738) (not b!1555740) (not d!162027) (not d!162189) (not d!162175) (not d!162217) (not b!1555795) (not b!1555498) (not d!162201) (not b!1555821) (not d!162015) (not b!1555711) (not b!1555685) (not d!162237) (not b!1555571) (not b!1555768) (not b!1555604) (not b_next!31933) (not d!162157) (not b!1555807) (not b_lambda!24811) (not b!1555717) (not b!1555506) (not d!162161) (not b!1555542) (not b!1555715) (not b!1555766) (not b!1555798) (not b!1555533) (not b!1555655) (not b!1555723) (not b!1555861) (not b!1555647) (not b!1555763) (not b!1555789) (not b!1555843) (not b!1555675) (not b!1555852) (not b!1555686) (not d!161947) (not b!1555836) (not b!1555806) (not b!1555691) (not d!162077) (not b!1555827) (not d!162061) (not d!162039) (not b!1555607) (not b!1555719) (not d!162147) (not b!1555774) (not b!1555559) (not b!1555526) (not d!162011) (not d!162099) (not b!1555499) (not b!1555725) (not b!1555574) (not d!162047) (not b!1555704) (not d!162181) (not b!1555689) (not b!1555673) (not d!161987) (not d!162163) (not b!1555644) (not b!1555626) (not b!1555829) (not d!162043) (not b!1555824) (not b!1555765) (not d!162055) (not bm!71502) (not b!1555792) (not b!1555524) (not b_lambda!24803) (not d!162023) (not b!1555496) (not d!162155) (not b!1555742) (not d!162129) (not b!1555527) (not d!162115) (not d!162081) (not b!1555863) (not b!1555743) (not b!1555592) (not b!1555660) (not d!162195) (not b!1555576) (not b!1555479) (not d!162009) (not b!1555677) (not b!1555802) (not b_lambda!24795) (not b!1555772) (not b!1555698) (not b!1555721) (not b!1555840) (not b!1555605) (not b!1555731) (not b!1555515) (not d!162177) (not d!162235) (not b!1555735) (not d!162053) (not b!1555669) (not b!1555554) (not bm!71516) (not mapNonEmpty!59040) (not b!1555595) (not d!162169) (not b_lambda!24787) (not d!162007) (not b!1555737) (not b!1555671) (not b!1555529) (not b!1555509) (not b!1555727) (not bm!71517) (not b!1555491) (not d!162093) (not d!162171) (not b!1555690) (not b!1555813) (not b!1555817) (not b!1555490) (not b!1555708))
(check-sat b_and!51395 (not b_next!31933))
