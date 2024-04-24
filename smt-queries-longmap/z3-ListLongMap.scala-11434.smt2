; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133802 () Bool)

(assert start!133802)

(declare-fun b!1561895 () Bool)

(declare-fun res!1067263 () Bool)

(declare-fun e!870442 () Bool)

(assert (=> b!1561895 (=> (not res!1067263) (not e!870442))))

(declare-datatypes ((List!36377 0))(
  ( (Nil!36374) (Cons!36373 (h!37837 (_ BitVec 64)) (t!51102 List!36377)) )
))
(declare-fun noDuplicate!2661 (List!36377) Bool)

(assert (=> b!1561895 (= res!1067263 (noDuplicate!2661 Nil!36374))))

(declare-fun mapNonEmpty!59100 () Bool)

(declare-fun mapRes!59100 () Bool)

(declare-fun tp!112755 () Bool)

(declare-fun e!870441 () Bool)

(assert (=> mapNonEmpty!59100 (= mapRes!59100 (and tp!112755 e!870441))))

(declare-datatypes ((V!59521 0))(
  ( (V!59522 (val!19326 Int)) )
))
(declare-datatypes ((ValueCell!18212 0))(
  ( (ValueCellFull!18212 (v!22069 V!59521)) (EmptyCell!18212) )
))
(declare-fun mapValue!59100 () ValueCell!18212)

(declare-datatypes ((array!103826 0))(
  ( (array!103827 (arr!50099 (Array (_ BitVec 32) ValueCell!18212)) (size!50650 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103826)

(declare-fun mapKey!59100 () (_ BitVec 32))

(declare-fun mapRest!59100 () (Array (_ BitVec 32) ValueCell!18212))

(assert (=> mapNonEmpty!59100 (= (arr!50099 _values!487) (store mapRest!59100 mapKey!59100 mapValue!59100))))

(declare-fun res!1067260 () Bool)

(assert (=> start!133802 (=> (not res!1067260) (not e!870442))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133802 (= res!1067260 (validMask!0 mask!947))))

(assert (=> start!133802 e!870442))

(assert (=> start!133802 true))

(declare-fun e!870443 () Bool)

(declare-fun array_inv!39205 (array!103826) Bool)

(assert (=> start!133802 (and (array_inv!39205 _values!487) e!870443)))

(declare-datatypes ((array!103828 0))(
  ( (array!103829 (arr!50100 (Array (_ BitVec 32) (_ BitVec 64))) (size!50651 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103828)

(declare-fun array_inv!39206 (array!103828) Bool)

(assert (=> start!133802 (array_inv!39206 _keys!637)))

(declare-fun b!1561896 () Bool)

(declare-fun e!870440 () Bool)

(declare-fun tp_is_empty!38485 () Bool)

(assert (=> b!1561896 (= e!870440 tp_is_empty!38485)))

(declare-fun b!1561897 () Bool)

(declare-fun e!870438 () Bool)

(declare-fun contains!10262 (List!36377 (_ BitVec 64)) Bool)

(assert (=> b!1561897 (= e!870438 (contains!10262 Nil!36374 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1561898 () Bool)

(assert (=> b!1561898 (= e!870442 e!870438)))

(declare-fun res!1067262 () Bool)

(assert (=> b!1561898 (=> res!1067262 e!870438)))

(assert (=> b!1561898 (= res!1067262 (contains!10262 Nil!36374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1561899 () Bool)

(declare-fun res!1067264 () Bool)

(assert (=> b!1561899 (=> (not res!1067264) (not e!870442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103828 (_ BitVec 32)) Bool)

(assert (=> b!1561899 (= res!1067264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59100 () Bool)

(assert (=> mapIsEmpty!59100 mapRes!59100))

(declare-fun b!1561900 () Bool)

(declare-fun res!1067265 () Bool)

(assert (=> b!1561900 (=> (not res!1067265) (not e!870442))))

(assert (=> b!1561900 (= res!1067265 (and (bvsle #b00000000000000000000000000000000 (size!50651 _keys!637)) (bvslt (size!50651 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun b!1561901 () Bool)

(declare-fun res!1067261 () Bool)

(assert (=> b!1561901 (=> (not res!1067261) (not e!870442))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561901 (= res!1067261 (and (= (size!50650 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50651 _keys!637) (size!50650 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561902 () Bool)

(assert (=> b!1561902 (= e!870443 (and e!870440 mapRes!59100))))

(declare-fun condMapEmpty!59100 () Bool)

(declare-fun mapDefault!59100 () ValueCell!18212)

(assert (=> b!1561902 (= condMapEmpty!59100 (= (arr!50099 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18212)) mapDefault!59100)))))

(declare-fun b!1561903 () Bool)

(assert (=> b!1561903 (= e!870441 tp_is_empty!38485)))

(assert (= (and start!133802 res!1067260) b!1561901))

(assert (= (and b!1561901 res!1067261) b!1561899))

(assert (= (and b!1561899 res!1067264) b!1561900))

(assert (= (and b!1561900 res!1067265) b!1561895))

(assert (= (and b!1561895 res!1067263) b!1561898))

(assert (= (and b!1561898 (not res!1067262)) b!1561897))

(assert (= (and b!1561902 condMapEmpty!59100) mapIsEmpty!59100))

(assert (= (and b!1561902 (not condMapEmpty!59100)) mapNonEmpty!59100))

(get-info :version)

(assert (= (and mapNonEmpty!59100 ((_ is ValueCellFull!18212) mapValue!59100)) b!1561903))

(assert (= (and b!1561902 ((_ is ValueCellFull!18212) mapDefault!59100)) b!1561896))

(assert (= start!133802 b!1561902))

(declare-fun m!1437947 () Bool)

(assert (=> b!1561897 m!1437947))

(declare-fun m!1437949 () Bool)

(assert (=> b!1561898 m!1437949))

(declare-fun m!1437951 () Bool)

(assert (=> b!1561895 m!1437951))

(declare-fun m!1437953 () Bool)

(assert (=> b!1561899 m!1437953))

(declare-fun m!1437955 () Bool)

(assert (=> mapNonEmpty!59100 m!1437955))

(declare-fun m!1437957 () Bool)

(assert (=> start!133802 m!1437957))

(declare-fun m!1437959 () Bool)

(assert (=> start!133802 m!1437959))

(declare-fun m!1437961 () Bool)

(assert (=> start!133802 m!1437961))

(check-sat (not start!133802) tp_is_empty!38485 (not b!1561897) (not b!1561899) (not b!1561895) (not b!1561898) (not mapNonEmpty!59100))
(check-sat)
(get-model)

(declare-fun d!163635 () Bool)

(assert (=> d!163635 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133802 d!163635))

(declare-fun d!163637 () Bool)

(assert (=> d!163637 (= (array_inv!39205 _values!487) (bvsge (size!50650 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133802 d!163637))

(declare-fun d!163639 () Bool)

(assert (=> d!163639 (= (array_inv!39206 _keys!637) (bvsge (size!50651 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133802 d!163639))

(declare-fun d!163641 () Bool)

(declare-fun lt!671788 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!797 (List!36377) (InoxSet (_ BitVec 64)))

(assert (=> d!163641 (= lt!671788 (select (content!797 Nil!36374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!870485 () Bool)

(assert (=> d!163641 (= lt!671788 e!870485)))

(declare-fun res!1067306 () Bool)

(assert (=> d!163641 (=> (not res!1067306) (not e!870485))))

(assert (=> d!163641 (= res!1067306 ((_ is Cons!36373) Nil!36374))))

(assert (=> d!163641 (= (contains!10262 Nil!36374 #b1000000000000000000000000000000000000000000000000000000000000000) lt!671788)))

(declare-fun b!1561962 () Bool)

(declare-fun e!870484 () Bool)

(assert (=> b!1561962 (= e!870485 e!870484)))

(declare-fun res!1067307 () Bool)

(assert (=> b!1561962 (=> res!1067307 e!870484)))

(assert (=> b!1561962 (= res!1067307 (= (h!37837 Nil!36374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1561963 () Bool)

(assert (=> b!1561963 (= e!870484 (contains!10262 (t!51102 Nil!36374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163641 res!1067306) b!1561962))

(assert (= (and b!1561962 (not res!1067307)) b!1561963))

(declare-fun m!1437995 () Bool)

(assert (=> d!163641 m!1437995))

(declare-fun m!1437997 () Bool)

(assert (=> d!163641 m!1437997))

(declare-fun m!1437999 () Bool)

(assert (=> b!1561963 m!1437999))

(assert (=> b!1561897 d!163641))

(declare-fun d!163643 () Bool)

(declare-fun res!1067312 () Bool)

(declare-fun e!870490 () Bool)

(assert (=> d!163643 (=> res!1067312 e!870490)))

(assert (=> d!163643 (= res!1067312 ((_ is Nil!36374) Nil!36374))))

(assert (=> d!163643 (= (noDuplicate!2661 Nil!36374) e!870490)))

(declare-fun b!1561968 () Bool)

(declare-fun e!870491 () Bool)

(assert (=> b!1561968 (= e!870490 e!870491)))

(declare-fun res!1067313 () Bool)

(assert (=> b!1561968 (=> (not res!1067313) (not e!870491))))

(assert (=> b!1561968 (= res!1067313 (not (contains!10262 (t!51102 Nil!36374) (h!37837 Nil!36374))))))

(declare-fun b!1561969 () Bool)

(assert (=> b!1561969 (= e!870491 (noDuplicate!2661 (t!51102 Nil!36374)))))

(assert (= (and d!163643 (not res!1067312)) b!1561968))

(assert (= (and b!1561968 res!1067313) b!1561969))

(declare-fun m!1438001 () Bool)

(assert (=> b!1561968 m!1438001))

(declare-fun m!1438003 () Bool)

(assert (=> b!1561969 m!1438003))

(assert (=> b!1561895 d!163643))

(declare-fun bm!71991 () Bool)

(declare-fun call!71994 () Bool)

(assert (=> bm!71991 (= call!71994 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun d!163645 () Bool)

(declare-fun res!1067319 () Bool)

(declare-fun e!870498 () Bool)

(assert (=> d!163645 (=> res!1067319 e!870498)))

(assert (=> d!163645 (= res!1067319 (bvsge #b00000000000000000000000000000000 (size!50651 _keys!637)))))

(assert (=> d!163645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!870498)))

(declare-fun b!1561978 () Bool)

(declare-fun e!870499 () Bool)

(declare-fun e!870500 () Bool)

(assert (=> b!1561978 (= e!870499 e!870500)))

(declare-fun lt!671797 () (_ BitVec 64))

(assert (=> b!1561978 (= lt!671797 (select (arr!50100 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51811 0))(
  ( (Unit!51812) )
))
(declare-fun lt!671795 () Unit!51811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103828 (_ BitVec 64) (_ BitVec 32)) Unit!51811)

(assert (=> b!1561978 (= lt!671795 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671797 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1561978 (arrayContainsKey!0 _keys!637 lt!671797 #b00000000000000000000000000000000)))

(declare-fun lt!671796 () Unit!51811)

(assert (=> b!1561978 (= lt!671796 lt!671795)))

(declare-fun res!1067318 () Bool)

(declare-datatypes ((SeekEntryResult!13468 0))(
  ( (MissingZero!13468 (index!56270 (_ BitVec 32))) (Found!13468 (index!56271 (_ BitVec 32))) (Intermediate!13468 (undefined!14280 Bool) (index!56272 (_ BitVec 32)) (x!139783 (_ BitVec 32))) (Undefined!13468) (MissingVacant!13468 (index!56273 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103828 (_ BitVec 32)) SeekEntryResult!13468)

(assert (=> b!1561978 (= res!1067318 (= (seekEntryOrOpen!0 (select (arr!50100 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13468 #b00000000000000000000000000000000)))))

(assert (=> b!1561978 (=> (not res!1067318) (not e!870500))))

(declare-fun b!1561979 () Bool)

(assert (=> b!1561979 (= e!870500 call!71994)))

(declare-fun b!1561980 () Bool)

(assert (=> b!1561980 (= e!870498 e!870499)))

(declare-fun c!145024 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561980 (= c!145024 (validKeyInArray!0 (select (arr!50100 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1561981 () Bool)

(assert (=> b!1561981 (= e!870499 call!71994)))

(assert (= (and d!163645 (not res!1067319)) b!1561980))

(assert (= (and b!1561980 c!145024) b!1561978))

(assert (= (and b!1561980 (not c!145024)) b!1561981))

(assert (= (and b!1561978 res!1067318) b!1561979))

(assert (= (or b!1561979 b!1561981) bm!71991))

(declare-fun m!1438005 () Bool)

(assert (=> bm!71991 m!1438005))

(declare-fun m!1438007 () Bool)

(assert (=> b!1561978 m!1438007))

(declare-fun m!1438009 () Bool)

(assert (=> b!1561978 m!1438009))

(declare-fun m!1438011 () Bool)

(assert (=> b!1561978 m!1438011))

(assert (=> b!1561978 m!1438007))

(declare-fun m!1438013 () Bool)

(assert (=> b!1561978 m!1438013))

(assert (=> b!1561980 m!1438007))

(assert (=> b!1561980 m!1438007))

(declare-fun m!1438015 () Bool)

(assert (=> b!1561980 m!1438015))

(assert (=> b!1561899 d!163645))

(declare-fun d!163647 () Bool)

(declare-fun lt!671798 () Bool)

(assert (=> d!163647 (= lt!671798 (select (content!797 Nil!36374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!870502 () Bool)

(assert (=> d!163647 (= lt!671798 e!870502)))

(declare-fun res!1067320 () Bool)

(assert (=> d!163647 (=> (not res!1067320) (not e!870502))))

(assert (=> d!163647 (= res!1067320 ((_ is Cons!36373) Nil!36374))))

(assert (=> d!163647 (= (contains!10262 Nil!36374 #b0000000000000000000000000000000000000000000000000000000000000000) lt!671798)))

(declare-fun b!1561982 () Bool)

(declare-fun e!870501 () Bool)

(assert (=> b!1561982 (= e!870502 e!870501)))

(declare-fun res!1067321 () Bool)

(assert (=> b!1561982 (=> res!1067321 e!870501)))

(assert (=> b!1561982 (= res!1067321 (= (h!37837 Nil!36374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1561983 () Bool)

(assert (=> b!1561983 (= e!870501 (contains!10262 (t!51102 Nil!36374) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163647 res!1067320) b!1561982))

(assert (= (and b!1561982 (not res!1067321)) b!1561983))

(assert (=> d!163647 m!1437995))

(declare-fun m!1438017 () Bool)

(assert (=> d!163647 m!1438017))

(declare-fun m!1438019 () Bool)

(assert (=> b!1561983 m!1438019))

(assert (=> b!1561898 d!163647))

(declare-fun b!1561991 () Bool)

(declare-fun e!870508 () Bool)

(assert (=> b!1561991 (= e!870508 tp_is_empty!38485)))

(declare-fun mapIsEmpty!59109 () Bool)

(declare-fun mapRes!59109 () Bool)

(assert (=> mapIsEmpty!59109 mapRes!59109))

(declare-fun mapNonEmpty!59109 () Bool)

(declare-fun tp!112764 () Bool)

(declare-fun e!870507 () Bool)

(assert (=> mapNonEmpty!59109 (= mapRes!59109 (and tp!112764 e!870507))))

(declare-fun mapRest!59109 () (Array (_ BitVec 32) ValueCell!18212))

(declare-fun mapKey!59109 () (_ BitVec 32))

(declare-fun mapValue!59109 () ValueCell!18212)

(assert (=> mapNonEmpty!59109 (= mapRest!59100 (store mapRest!59109 mapKey!59109 mapValue!59109))))

(declare-fun condMapEmpty!59109 () Bool)

(declare-fun mapDefault!59109 () ValueCell!18212)

(assert (=> mapNonEmpty!59100 (= condMapEmpty!59109 (= mapRest!59100 ((as const (Array (_ BitVec 32) ValueCell!18212)) mapDefault!59109)))))

(assert (=> mapNonEmpty!59100 (= tp!112755 (and e!870508 mapRes!59109))))

(declare-fun b!1561990 () Bool)

(assert (=> b!1561990 (= e!870507 tp_is_empty!38485)))

(assert (= (and mapNonEmpty!59100 condMapEmpty!59109) mapIsEmpty!59109))

(assert (= (and mapNonEmpty!59100 (not condMapEmpty!59109)) mapNonEmpty!59109))

(assert (= (and mapNonEmpty!59109 ((_ is ValueCellFull!18212) mapValue!59109)) b!1561990))

(assert (= (and mapNonEmpty!59100 ((_ is ValueCellFull!18212) mapDefault!59109)) b!1561991))

(declare-fun m!1438021 () Bool)

(assert (=> mapNonEmpty!59109 m!1438021))

(check-sat (not b!1561963) tp_is_empty!38485 (not b!1561983) (not b!1561980) (not bm!71991) (not mapNonEmpty!59109) (not b!1561978) (not d!163647) (not b!1561969) (not b!1561968) (not d!163641))
(check-sat)
