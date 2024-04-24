; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132046 () Bool)

(assert start!132046)

(declare-fun b!1544201 () Bool)

(declare-fun e!859096 () Bool)

(declare-datatypes ((List!35893 0))(
  ( (Nil!35890) (Cons!35889 (h!37352 (_ BitVec 64)) (t!50579 List!35893)) )
))
(declare-fun noDuplicate!2653 (List!35893) Bool)

(assert (=> b!1544201 (= e!859096 (not (noDuplicate!2653 Nil!35890)))))

(declare-fun mapNonEmpty!58165 () Bool)

(declare-fun mapRes!58165 () Bool)

(declare-fun tp!110692 () Bool)

(declare-fun e!859097 () Bool)

(assert (=> mapNonEmpty!58165 (= mapRes!58165 (and tp!110692 e!859097))))

(declare-datatypes ((V!58637 0))(
  ( (V!58638 (val!18900 Int)) )
))
(declare-datatypes ((ValueCell!17912 0))(
  ( (ValueCellFull!17912 (v!21692 V!58637)) (EmptyCell!17912) )
))
(declare-datatypes ((array!102646 0))(
  ( (array!102647 (arr!49520 (Array (_ BitVec 32) ValueCell!17912)) (size!50071 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102646)

(declare-fun mapRest!58165 () (Array (_ BitVec 32) ValueCell!17912))

(declare-fun mapKey!58165 () (_ BitVec 32))

(declare-fun mapValue!58165 () ValueCell!17912)

(assert (=> mapNonEmpty!58165 (= (arr!49520 _values!470) (store mapRest!58165 mapKey!58165 mapValue!58165))))

(declare-fun b!1544202 () Bool)

(declare-fun res!1058999 () Bool)

(assert (=> b!1544202 (=> (not res!1058999) (not e!859096))))

(declare-datatypes ((array!102648 0))(
  ( (array!102649 (arr!49521 (Array (_ BitVec 32) (_ BitVec 64))) (size!50072 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102648)

(assert (=> b!1544202 (= res!1058999 (and (bvsle #b00000000000000000000000000000000 (size!50072 _keys!618)) (bvslt (size!50072 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1544203 () Bool)

(declare-fun tp_is_empty!37645 () Bool)

(assert (=> b!1544203 (= e!859097 tp_is_empty!37645)))

(declare-fun mapIsEmpty!58165 () Bool)

(assert (=> mapIsEmpty!58165 mapRes!58165))

(declare-fun b!1544204 () Bool)

(declare-fun res!1058997 () Bool)

(assert (=> b!1544204 (=> (not res!1058997) (not e!859096))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1544204 (= res!1058997 (and (= (size!50071 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50072 _keys!618) (size!50071 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544205 () Bool)

(declare-fun e!859099 () Bool)

(declare-fun e!859098 () Bool)

(assert (=> b!1544205 (= e!859099 (and e!859098 mapRes!58165))))

(declare-fun condMapEmpty!58165 () Bool)

(declare-fun mapDefault!58165 () ValueCell!17912)

(assert (=> b!1544205 (= condMapEmpty!58165 (= (arr!49520 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17912)) mapDefault!58165)))))

(declare-fun res!1058998 () Bool)

(assert (=> start!132046 (=> (not res!1058998) (not e!859096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132046 (= res!1058998 (validMask!0 mask!926))))

(assert (=> start!132046 e!859096))

(assert (=> start!132046 true))

(declare-fun array_inv!38793 (array!102646) Bool)

(assert (=> start!132046 (and (array_inv!38793 _values!470) e!859099)))

(declare-fun array_inv!38794 (array!102648) Bool)

(assert (=> start!132046 (array_inv!38794 _keys!618)))

(declare-fun b!1544206 () Bool)

(declare-fun res!1059000 () Bool)

(assert (=> b!1544206 (=> (not res!1059000) (not e!859096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102648 (_ BitVec 32)) Bool)

(assert (=> b!1544206 (= res!1059000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544207 () Bool)

(assert (=> b!1544207 (= e!859098 tp_is_empty!37645)))

(assert (= (and start!132046 res!1058998) b!1544204))

(assert (= (and b!1544204 res!1058997) b!1544206))

(assert (= (and b!1544206 res!1059000) b!1544202))

(assert (= (and b!1544202 res!1058999) b!1544201))

(assert (= (and b!1544205 condMapEmpty!58165) mapIsEmpty!58165))

(assert (= (and b!1544205 (not condMapEmpty!58165)) mapNonEmpty!58165))

(get-info :version)

(assert (= (and mapNonEmpty!58165 ((_ is ValueCellFull!17912) mapValue!58165)) b!1544203))

(assert (= (and b!1544205 ((_ is ValueCellFull!17912) mapDefault!58165)) b!1544207))

(assert (= start!132046 b!1544205))

(declare-fun m!1425893 () Bool)

(assert (=> b!1544201 m!1425893))

(declare-fun m!1425895 () Bool)

(assert (=> mapNonEmpty!58165 m!1425895))

(declare-fun m!1425897 () Bool)

(assert (=> start!132046 m!1425897))

(declare-fun m!1425899 () Bool)

(assert (=> start!132046 m!1425899))

(declare-fun m!1425901 () Bool)

(assert (=> start!132046 m!1425901))

(declare-fun m!1425903 () Bool)

(assert (=> b!1544206 m!1425903))

(check-sat (not start!132046) (not b!1544201) (not mapNonEmpty!58165) tp_is_empty!37645 (not b!1544206))
(check-sat)
(get-model)

(declare-fun d!161415 () Bool)

(declare-fun res!1059029 () Bool)

(declare-fun e!859134 () Bool)

(assert (=> d!161415 (=> res!1059029 e!859134)))

(assert (=> d!161415 (= res!1059029 ((_ is Nil!35890) Nil!35890))))

(assert (=> d!161415 (= (noDuplicate!2653 Nil!35890) e!859134)))

(declare-fun b!1544254 () Bool)

(declare-fun e!859135 () Bool)

(assert (=> b!1544254 (= e!859134 e!859135)))

(declare-fun res!1059030 () Bool)

(assert (=> b!1544254 (=> (not res!1059030) (not e!859135))))

(declare-fun contains!10070 (List!35893 (_ BitVec 64)) Bool)

(assert (=> b!1544254 (= res!1059030 (not (contains!10070 (t!50579 Nil!35890) (h!37352 Nil!35890))))))

(declare-fun b!1544255 () Bool)

(assert (=> b!1544255 (= e!859135 (noDuplicate!2653 (t!50579 Nil!35890)))))

(assert (= (and d!161415 (not res!1059029)) b!1544254))

(assert (= (and b!1544254 res!1059030) b!1544255))

(declare-fun m!1425929 () Bool)

(assert (=> b!1544254 m!1425929))

(declare-fun m!1425931 () Bool)

(assert (=> b!1544255 m!1425931))

(assert (=> b!1544201 d!161415))

(declare-fun d!161417 () Bool)

(assert (=> d!161417 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132046 d!161417))

(declare-fun d!161419 () Bool)

(assert (=> d!161419 (= (array_inv!38793 _values!470) (bvsge (size!50071 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132046 d!161419))

(declare-fun d!161421 () Bool)

(assert (=> d!161421 (= (array_inv!38794 _keys!618) (bvsge (size!50072 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132046 d!161421))

(declare-fun b!1544264 () Bool)

(declare-fun e!859142 () Bool)

(declare-fun call!68841 () Bool)

(assert (=> b!1544264 (= e!859142 call!68841)))

(declare-fun b!1544265 () Bool)

(declare-fun e!859144 () Bool)

(assert (=> b!1544265 (= e!859144 call!68841)))

(declare-fun b!1544266 () Bool)

(declare-fun e!859143 () Bool)

(assert (=> b!1544266 (= e!859143 e!859144)))

(declare-fun c!142105 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1544266 (= c!142105 (validKeyInArray!0 (select (arr!49521 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!161423 () Bool)

(declare-fun res!1059035 () Bool)

(assert (=> d!161423 (=> res!1059035 e!859143)))

(assert (=> d!161423 (= res!1059035 (bvsge #b00000000000000000000000000000000 (size!50072 _keys!618)))))

(assert (=> d!161423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!859143)))

(declare-fun bm!68838 () Bool)

(assert (=> bm!68838 (= call!68841 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1544267 () Bool)

(assert (=> b!1544267 (= e!859144 e!859142)))

(declare-fun lt!666629 () (_ BitVec 64))

(assert (=> b!1544267 (= lt!666629 (select (arr!49521 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51419 0))(
  ( (Unit!51420) )
))
(declare-fun lt!666628 () Unit!51419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102648 (_ BitVec 64) (_ BitVec 32)) Unit!51419)

(assert (=> b!1544267 (= lt!666628 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!666629 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1544267 (arrayContainsKey!0 _keys!618 lt!666629 #b00000000000000000000000000000000)))

(declare-fun lt!666630 () Unit!51419)

(assert (=> b!1544267 (= lt!666630 lt!666628)))

(declare-fun res!1059036 () Bool)

(declare-datatypes ((SeekEntryResult!13458 0))(
  ( (MissingZero!13458 (index!56230 (_ BitVec 32))) (Found!13458 (index!56231 (_ BitVec 32))) (Intermediate!13458 (undefined!14270 Bool) (index!56232 (_ BitVec 32)) (x!138379 (_ BitVec 32))) (Undefined!13458) (MissingVacant!13458 (index!56233 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102648 (_ BitVec 32)) SeekEntryResult!13458)

(assert (=> b!1544267 (= res!1059036 (= (seekEntryOrOpen!0 (select (arr!49521 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13458 #b00000000000000000000000000000000)))))

(assert (=> b!1544267 (=> (not res!1059036) (not e!859142))))

(assert (= (and d!161423 (not res!1059035)) b!1544266))

(assert (= (and b!1544266 c!142105) b!1544267))

(assert (= (and b!1544266 (not c!142105)) b!1544265))

(assert (= (and b!1544267 res!1059036) b!1544264))

(assert (= (or b!1544264 b!1544265) bm!68838))

(declare-fun m!1425933 () Bool)

(assert (=> b!1544266 m!1425933))

(assert (=> b!1544266 m!1425933))

(declare-fun m!1425935 () Bool)

(assert (=> b!1544266 m!1425935))

(declare-fun m!1425937 () Bool)

(assert (=> bm!68838 m!1425937))

(assert (=> b!1544267 m!1425933))

(declare-fun m!1425939 () Bool)

(assert (=> b!1544267 m!1425939))

(declare-fun m!1425941 () Bool)

(assert (=> b!1544267 m!1425941))

(assert (=> b!1544267 m!1425933))

(declare-fun m!1425943 () Bool)

(assert (=> b!1544267 m!1425943))

(assert (=> b!1544206 d!161423))

(declare-fun mapIsEmpty!58174 () Bool)

(declare-fun mapRes!58174 () Bool)

(assert (=> mapIsEmpty!58174 mapRes!58174))

(declare-fun mapNonEmpty!58174 () Bool)

(declare-fun tp!110701 () Bool)

(declare-fun e!859150 () Bool)

(assert (=> mapNonEmpty!58174 (= mapRes!58174 (and tp!110701 e!859150))))

(declare-fun mapValue!58174 () ValueCell!17912)

(declare-fun mapKey!58174 () (_ BitVec 32))

(declare-fun mapRest!58174 () (Array (_ BitVec 32) ValueCell!17912))

(assert (=> mapNonEmpty!58174 (= mapRest!58165 (store mapRest!58174 mapKey!58174 mapValue!58174))))

(declare-fun b!1544275 () Bool)

(declare-fun e!859149 () Bool)

(assert (=> b!1544275 (= e!859149 tp_is_empty!37645)))

(declare-fun b!1544274 () Bool)

(assert (=> b!1544274 (= e!859150 tp_is_empty!37645)))

(declare-fun condMapEmpty!58174 () Bool)

(declare-fun mapDefault!58174 () ValueCell!17912)

(assert (=> mapNonEmpty!58165 (= condMapEmpty!58174 (= mapRest!58165 ((as const (Array (_ BitVec 32) ValueCell!17912)) mapDefault!58174)))))

(assert (=> mapNonEmpty!58165 (= tp!110692 (and e!859149 mapRes!58174))))

(assert (= (and mapNonEmpty!58165 condMapEmpty!58174) mapIsEmpty!58174))

(assert (= (and mapNonEmpty!58165 (not condMapEmpty!58174)) mapNonEmpty!58174))

(assert (= (and mapNonEmpty!58174 ((_ is ValueCellFull!17912) mapValue!58174)) b!1544274))

(assert (= (and mapNonEmpty!58165 ((_ is ValueCellFull!17912) mapDefault!58174)) b!1544275))

(declare-fun m!1425945 () Bool)

(assert (=> mapNonEmpty!58174 m!1425945))

(check-sat (not mapNonEmpty!58174) (not b!1544267) (not b!1544266) (not b!1544254) tp_is_empty!37645 (not b!1544255) (not bm!68838))
(check-sat)
