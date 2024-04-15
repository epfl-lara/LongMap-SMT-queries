; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71442 () Bool)

(assert start!71442)

(declare-fun b_free!13489 () Bool)

(declare-fun b_next!13489 () Bool)

(assert (=> start!71442 (= b_free!13489 (not b_next!13489))))

(declare-fun tp!47251 () Bool)

(declare-fun b_and!22481 () Bool)

(assert (=> start!71442 (= tp!47251 b_and!22481)))

(declare-fun e!462502 () Bool)

(declare-datatypes ((V!25267 0))(
  ( (V!25268 (val!7647 Int)) )
))
(declare-fun zeroValueBefore!34 () V!25267)

(declare-datatypes ((array!46541 0))(
  ( (array!46542 (arr!22308 (Array (_ BitVec 32) (_ BitVec 64))) (size!22729 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46541)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!25267)

(declare-datatypes ((ValueCell!7184 0))(
  ( (ValueCellFull!7184 (v!10082 V!25267)) (EmptyCell!7184) )
))
(declare-datatypes ((array!46543 0))(
  ( (array!46544 (arr!22309 (Array (_ BitVec 32) ValueCell!7184)) (size!22730 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46543)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10156 0))(
  ( (tuple2!10157 (_1!5089 (_ BitVec 64)) (_2!5089 V!25267)) )
))
(declare-datatypes ((List!15940 0))(
  ( (Nil!15937) (Cons!15936 (h!17065 tuple2!10156) (t!22294 List!15940)) )
))
(declare-datatypes ((ListLongMap!8969 0))(
  ( (ListLongMap!8970 (toList!4500 List!15940)) )
))
(declare-fun lt!376227 () ListLongMap!8969)

(declare-fun b!829657 () Bool)

(declare-fun getCurrentListMap!2551 (array!46541 array!46543 (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 (_ BitVec 32) Int) ListLongMap!8969)

(declare-fun +!2008 (ListLongMap!8969 tuple2!10156) ListLongMap!8969)

(assert (=> b!829657 (= e!462502 (= (getCurrentListMap!2551 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!2008 (+!2008 lt!376227 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun zeroValueAfter!34 () V!25267)

(declare-fun lt!376226 () ListLongMap!8969)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun e!462508 () Bool)

(declare-fun b!829658 () Bool)

(assert (=> b!829658 (= e!462508 (= (getCurrentListMap!2551 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!2008 (+!2008 lt!376226 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829659 () Bool)

(declare-fun e!462504 () Bool)

(declare-fun e!462506 () Bool)

(declare-fun mapRes!24448 () Bool)

(assert (=> b!829659 (= e!462504 (and e!462506 mapRes!24448))))

(declare-fun condMapEmpty!24448 () Bool)

(declare-fun mapDefault!24448 () ValueCell!7184)

(assert (=> b!829659 (= condMapEmpty!24448 (= (arr!22309 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7184)) mapDefault!24448)))))

(declare-fun b!829660 () Bool)

(declare-fun tp_is_empty!15199 () Bool)

(assert (=> b!829660 (= e!462506 tp_is_empty!15199)))

(declare-fun mapNonEmpty!24448 () Bool)

(declare-fun tp!47250 () Bool)

(declare-fun e!462503 () Bool)

(assert (=> mapNonEmpty!24448 (= mapRes!24448 (and tp!47250 e!462503))))

(declare-fun mapValue!24448 () ValueCell!7184)

(declare-fun mapKey!24448 () (_ BitVec 32))

(declare-fun mapRest!24448 () (Array (_ BitVec 32) ValueCell!7184))

(assert (=> mapNonEmpty!24448 (= (arr!22309 _values!788) (store mapRest!24448 mapKey!24448 mapValue!24448))))

(declare-fun mapIsEmpty!24448 () Bool)

(assert (=> mapIsEmpty!24448 mapRes!24448))

(declare-fun b!829662 () Bool)

(declare-fun res!565182 () Bool)

(declare-fun e!462505 () Bool)

(assert (=> b!829662 (=> (not res!565182) (not e!462505))))

(declare-datatypes ((List!15941 0))(
  ( (Nil!15938) (Cons!15937 (h!17066 (_ BitVec 64)) (t!22295 List!15941)) )
))
(declare-fun arrayNoDuplicates!0 (array!46541 (_ BitVec 32) List!15941) Bool)

(assert (=> b!829662 (= res!565182 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15938))))

(declare-fun b!829663 () Bool)

(declare-fun e!462507 () Bool)

(assert (=> b!829663 (= e!462507 e!462502)))

(declare-fun res!565181 () Bool)

(assert (=> b!829663 (=> res!565181 e!462502)))

(assert (=> b!829663 (= res!565181 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829664 () Bool)

(assert (=> b!829664 (= e!462503 tp_is_empty!15199)))

(declare-fun b!829665 () Bool)

(assert (=> b!829665 (= e!462505 (not e!462508))))

(declare-fun res!565179 () Bool)

(assert (=> b!829665 (=> res!565179 e!462508)))

(assert (=> b!829665 (= res!565179 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829665 e!462507))

(declare-fun res!565180 () Bool)

(assert (=> b!829665 (=> (not res!565180) (not e!462507))))

(assert (=> b!829665 (= res!565180 (= lt!376227 lt!376226))))

(declare-datatypes ((Unit!28377 0))(
  ( (Unit!28378) )
))
(declare-fun lt!376228 () Unit!28377)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!598 (array!46541 array!46543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 V!25267 V!25267 (_ BitVec 32) Int) Unit!28377)

(assert (=> b!829665 (= lt!376228 (lemmaNoChangeToArrayThenSameMapNoExtras!598 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2528 (array!46541 array!46543 (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 (_ BitVec 32) Int) ListLongMap!8969)

(assert (=> b!829665 (= lt!376226 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829665 (= lt!376227 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829666 () Bool)

(declare-fun res!565178 () Bool)

(assert (=> b!829666 (=> (not res!565178) (not e!462505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46541 (_ BitVec 32)) Bool)

(assert (=> b!829666 (= res!565178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829661 () Bool)

(declare-fun res!565183 () Bool)

(assert (=> b!829661 (=> (not res!565183) (not e!462505))))

(assert (=> b!829661 (= res!565183 (and (= (size!22730 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22729 _keys!976) (size!22730 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!565177 () Bool)

(assert (=> start!71442 (=> (not res!565177) (not e!462505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71442 (= res!565177 (validMask!0 mask!1312))))

(assert (=> start!71442 e!462505))

(assert (=> start!71442 tp_is_empty!15199))

(declare-fun array_inv!17831 (array!46541) Bool)

(assert (=> start!71442 (array_inv!17831 _keys!976)))

(assert (=> start!71442 true))

(declare-fun array_inv!17832 (array!46543) Bool)

(assert (=> start!71442 (and (array_inv!17832 _values!788) e!462504)))

(assert (=> start!71442 tp!47251))

(assert (= (and start!71442 res!565177) b!829661))

(assert (= (and b!829661 res!565183) b!829666))

(assert (= (and b!829666 res!565178) b!829662))

(assert (= (and b!829662 res!565182) b!829665))

(assert (= (and b!829665 res!565180) b!829663))

(assert (= (and b!829663 (not res!565181)) b!829657))

(assert (= (and b!829665 (not res!565179)) b!829658))

(assert (= (and b!829659 condMapEmpty!24448) mapIsEmpty!24448))

(assert (= (and b!829659 (not condMapEmpty!24448)) mapNonEmpty!24448))

(get-info :version)

(assert (= (and mapNonEmpty!24448 ((_ is ValueCellFull!7184) mapValue!24448)) b!829664))

(assert (= (and b!829659 ((_ is ValueCellFull!7184) mapDefault!24448)) b!829660))

(assert (= start!71442 b!829659))

(declare-fun m!772179 () Bool)

(assert (=> mapNonEmpty!24448 m!772179))

(declare-fun m!772181 () Bool)

(assert (=> b!829666 m!772181))

(declare-fun m!772183 () Bool)

(assert (=> b!829658 m!772183))

(declare-fun m!772185 () Bool)

(assert (=> b!829658 m!772185))

(assert (=> b!829658 m!772185))

(declare-fun m!772187 () Bool)

(assert (=> b!829658 m!772187))

(declare-fun m!772189 () Bool)

(assert (=> start!71442 m!772189))

(declare-fun m!772191 () Bool)

(assert (=> start!71442 m!772191))

(declare-fun m!772193 () Bool)

(assert (=> start!71442 m!772193))

(declare-fun m!772195 () Bool)

(assert (=> b!829665 m!772195))

(declare-fun m!772197 () Bool)

(assert (=> b!829665 m!772197))

(declare-fun m!772199 () Bool)

(assert (=> b!829665 m!772199))

(declare-fun m!772201 () Bool)

(assert (=> b!829657 m!772201))

(declare-fun m!772203 () Bool)

(assert (=> b!829657 m!772203))

(assert (=> b!829657 m!772203))

(declare-fun m!772205 () Bool)

(assert (=> b!829657 m!772205))

(declare-fun m!772207 () Bool)

(assert (=> b!829662 m!772207))

(check-sat (not b!829662) (not b!829666) (not mapNonEmpty!24448) tp_is_empty!15199 (not b!829657) (not b!829658) b_and!22481 (not b!829665) (not b_next!13489) (not start!71442))
(check-sat b_and!22481 (not b_next!13489))
(get-model)

(declare-fun lt!376308 () ListLongMap!8969)

(declare-fun e!462583 () Bool)

(declare-fun b!829769 () Bool)

(declare-fun apply!371 (ListLongMap!8969 (_ BitVec 64)) V!25267)

(declare-fun get!11820 (ValueCell!7184 V!25267) V!25267)

(declare-fun dynLambda!985 (Int (_ BitVec 64)) V!25267)

(assert (=> b!829769 (= e!462583 (= (apply!371 lt!376308 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)) (get!11820 (select (arr!22309 _values!788) #b00000000000000000000000000000000) (dynLambda!985 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22730 _values!788)))))

(assert (=> b!829769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun bm!36170 () Bool)

(declare-fun call!36174 () Bool)

(declare-fun contains!4184 (ListLongMap!8969 (_ BitVec 64)) Bool)

(assert (=> bm!36170 (= call!36174 (contains!4184 lt!376308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829770 () Bool)

(declare-fun e!462592 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829770 (= e!462592 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829771 () Bool)

(declare-fun e!462587 () Bool)

(declare-fun e!462593 () Bool)

(assert (=> b!829771 (= e!462587 e!462593)))

(declare-fun c!89767 () Bool)

(assert (=> b!829771 (= c!89767 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829772 () Bool)

(declare-fun e!462584 () Bool)

(assert (=> b!829772 (= e!462584 e!462583)))

(declare-fun res!565250 () Bool)

(assert (=> b!829772 (=> (not res!565250) (not e!462583))))

(assert (=> b!829772 (= res!565250 (contains!4184 lt!376308 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun call!36177 () ListLongMap!8969)

(declare-fun bm!36171 () Bool)

(assert (=> bm!36171 (= call!36177 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829773 () Bool)

(declare-fun res!565251 () Bool)

(assert (=> b!829773 (=> (not res!565251) (not e!462587))))

(declare-fun e!462585 () Bool)

(assert (=> b!829773 (= res!565251 e!462585)))

(declare-fun c!89765 () Bool)

(assert (=> b!829773 (= c!89765 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!36172 () Bool)

(declare-fun call!36173 () ListLongMap!8969)

(assert (=> bm!36172 (= call!36173 call!36177)))

(declare-fun b!829774 () Bool)

(declare-fun e!462588 () Bool)

(assert (=> b!829774 (= e!462593 e!462588)))

(declare-fun res!565245 () Bool)

(declare-fun call!36175 () Bool)

(assert (=> b!829774 (= res!565245 call!36175)))

(assert (=> b!829774 (=> (not res!565245) (not e!462588))))

(declare-fun bm!36173 () Bool)

(assert (=> bm!36173 (= call!36175 (contains!4184 lt!376308 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829776 () Bool)

(assert (=> b!829776 (= e!462585 (not call!36174))))

(declare-fun b!829777 () Bool)

(assert (=> b!829777 (= e!462588 (= (apply!371 lt!376308 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829778 () Bool)

(declare-fun e!462595 () Bool)

(assert (=> b!829778 (= e!462595 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829779 () Bool)

(declare-fun e!462589 () Unit!28377)

(declare-fun lt!376296 () Unit!28377)

(assert (=> b!829779 (= e!462589 lt!376296)))

(declare-fun lt!376305 () ListLongMap!8969)

(assert (=> b!829779 (= lt!376305 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376298 () (_ BitVec 64))

(assert (=> b!829779 (= lt!376298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376299 () (_ BitVec 64))

(assert (=> b!829779 (= lt!376299 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376302 () Unit!28377)

(declare-fun addStillContains!322 (ListLongMap!8969 (_ BitVec 64) V!25267 (_ BitVec 64)) Unit!28377)

(assert (=> b!829779 (= lt!376302 (addStillContains!322 lt!376305 lt!376298 zeroValueAfter!34 lt!376299))))

(assert (=> b!829779 (contains!4184 (+!2008 lt!376305 (tuple2!10157 lt!376298 zeroValueAfter!34)) lt!376299)))

(declare-fun lt!376292 () Unit!28377)

(assert (=> b!829779 (= lt!376292 lt!376302)))

(declare-fun lt!376306 () ListLongMap!8969)

(assert (=> b!829779 (= lt!376306 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376295 () (_ BitVec 64))

(assert (=> b!829779 (= lt!376295 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376301 () (_ BitVec 64))

(assert (=> b!829779 (= lt!376301 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376297 () Unit!28377)

(declare-fun addApplyDifferent!322 (ListLongMap!8969 (_ BitVec 64) V!25267 (_ BitVec 64)) Unit!28377)

(assert (=> b!829779 (= lt!376297 (addApplyDifferent!322 lt!376306 lt!376295 minValue!754 lt!376301))))

(assert (=> b!829779 (= (apply!371 (+!2008 lt!376306 (tuple2!10157 lt!376295 minValue!754)) lt!376301) (apply!371 lt!376306 lt!376301))))

(declare-fun lt!376293 () Unit!28377)

(assert (=> b!829779 (= lt!376293 lt!376297)))

(declare-fun lt!376309 () ListLongMap!8969)

(assert (=> b!829779 (= lt!376309 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376312 () (_ BitVec 64))

(assert (=> b!829779 (= lt!376312 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376303 () (_ BitVec 64))

(assert (=> b!829779 (= lt!376303 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376294 () Unit!28377)

(assert (=> b!829779 (= lt!376294 (addApplyDifferent!322 lt!376309 lt!376312 zeroValueAfter!34 lt!376303))))

(assert (=> b!829779 (= (apply!371 (+!2008 lt!376309 (tuple2!10157 lt!376312 zeroValueAfter!34)) lt!376303) (apply!371 lt!376309 lt!376303))))

(declare-fun lt!376310 () Unit!28377)

(assert (=> b!829779 (= lt!376310 lt!376294)))

(declare-fun lt!376307 () ListLongMap!8969)

(assert (=> b!829779 (= lt!376307 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376311 () (_ BitVec 64))

(assert (=> b!829779 (= lt!376311 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376300 () (_ BitVec 64))

(assert (=> b!829779 (= lt!376300 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829779 (= lt!376296 (addApplyDifferent!322 lt!376307 lt!376311 minValue!754 lt!376300))))

(assert (=> b!829779 (= (apply!371 (+!2008 lt!376307 (tuple2!10157 lt!376311 minValue!754)) lt!376300) (apply!371 lt!376307 lt!376300))))

(declare-fun b!829780 () Bool)

(declare-fun e!462594 () ListLongMap!8969)

(declare-fun call!36178 () ListLongMap!8969)

(assert (=> b!829780 (= e!462594 call!36178)))

(declare-fun bm!36174 () Bool)

(declare-fun c!89764 () Bool)

(declare-fun call!36179 () ListLongMap!8969)

(declare-fun c!89766 () Bool)

(assert (=> bm!36174 (= call!36179 (+!2008 (ite c!89766 call!36177 (ite c!89764 call!36173 call!36178)) (ite (or c!89766 c!89764) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829781 () Bool)

(declare-fun e!462591 () ListLongMap!8969)

(declare-fun call!36176 () ListLongMap!8969)

(assert (=> b!829781 (= e!462591 call!36176)))

(declare-fun b!829782 () Bool)

(declare-fun res!565247 () Bool)

(assert (=> b!829782 (=> (not res!565247) (not e!462587))))

(assert (=> b!829782 (= res!565247 e!462584)))

(declare-fun res!565246 () Bool)

(assert (=> b!829782 (=> res!565246 e!462584)))

(assert (=> b!829782 (= res!565246 (not e!462592))))

(declare-fun res!565249 () Bool)

(assert (=> b!829782 (=> (not res!565249) (not e!462592))))

(assert (=> b!829782 (= res!565249 (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun b!829783 () Bool)

(assert (=> b!829783 (= e!462593 (not call!36175))))

(declare-fun b!829784 () Bool)

(assert (=> b!829784 (= e!462594 call!36176)))

(declare-fun bm!36175 () Bool)

(assert (=> bm!36175 (= call!36176 call!36179)))

(declare-fun b!829785 () Bool)

(declare-fun e!462590 () Bool)

(assert (=> b!829785 (= e!462590 (= (apply!371 lt!376308 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun bm!36176 () Bool)

(assert (=> bm!36176 (= call!36178 call!36173)))

(declare-fun b!829786 () Bool)

(declare-fun e!462586 () ListLongMap!8969)

(assert (=> b!829786 (= e!462586 (+!2008 call!36179 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829775 () Bool)

(assert (=> b!829775 (= e!462586 e!462591)))

(assert (=> b!829775 (= c!89764 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!105111 () Bool)

(assert (=> d!105111 e!462587))

(declare-fun res!565248 () Bool)

(assert (=> d!105111 (=> (not res!565248) (not e!462587))))

(assert (=> d!105111 (= res!565248 (or (bvsge #b00000000000000000000000000000000 (size!22729 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))))

(declare-fun lt!376304 () ListLongMap!8969)

(assert (=> d!105111 (= lt!376308 lt!376304)))

(declare-fun lt!376291 () Unit!28377)

(assert (=> d!105111 (= lt!376291 e!462589)))

(declare-fun c!89768 () Bool)

(assert (=> d!105111 (= c!89768 e!462595)))

(declare-fun res!565252 () Bool)

(assert (=> d!105111 (=> (not res!565252) (not e!462595))))

(assert (=> d!105111 (= res!565252 (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (=> d!105111 (= lt!376304 e!462586)))

(assert (=> d!105111 (= c!89766 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105111 (validMask!0 mask!1312)))

(assert (=> d!105111 (= (getCurrentListMap!2551 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376308)))

(declare-fun b!829787 () Bool)

(declare-fun Unit!28381 () Unit!28377)

(assert (=> b!829787 (= e!462589 Unit!28381)))

(declare-fun b!829788 () Bool)

(assert (=> b!829788 (= e!462585 e!462590)))

(declare-fun res!565244 () Bool)

(assert (=> b!829788 (= res!565244 call!36174)))

(assert (=> b!829788 (=> (not res!565244) (not e!462590))))

(declare-fun b!829789 () Bool)

(declare-fun c!89763 () Bool)

(assert (=> b!829789 (= c!89763 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829789 (= e!462591 e!462594)))

(assert (= (and d!105111 c!89766) b!829786))

(assert (= (and d!105111 (not c!89766)) b!829775))

(assert (= (and b!829775 c!89764) b!829781))

(assert (= (and b!829775 (not c!89764)) b!829789))

(assert (= (and b!829789 c!89763) b!829784))

(assert (= (and b!829789 (not c!89763)) b!829780))

(assert (= (or b!829784 b!829780) bm!36176))

(assert (= (or b!829781 bm!36176) bm!36172))

(assert (= (or b!829781 b!829784) bm!36175))

(assert (= (or b!829786 bm!36172) bm!36171))

(assert (= (or b!829786 bm!36175) bm!36174))

(assert (= (and d!105111 res!565252) b!829778))

(assert (= (and d!105111 c!89768) b!829779))

(assert (= (and d!105111 (not c!89768)) b!829787))

(assert (= (and d!105111 res!565248) b!829782))

(assert (= (and b!829782 res!565249) b!829770))

(assert (= (and b!829782 (not res!565246)) b!829772))

(assert (= (and b!829772 res!565250) b!829769))

(assert (= (and b!829782 res!565247) b!829773))

(assert (= (and b!829773 c!89765) b!829788))

(assert (= (and b!829773 (not c!89765)) b!829776))

(assert (= (and b!829788 res!565244) b!829785))

(assert (= (or b!829788 b!829776) bm!36170))

(assert (= (and b!829773 res!565251) b!829771))

(assert (= (and b!829771 c!89767) b!829774))

(assert (= (and b!829771 (not c!89767)) b!829783))

(assert (= (and b!829774 res!565245) b!829777))

(assert (= (or b!829774 b!829783) bm!36173))

(declare-fun b_lambda!11305 () Bool)

(assert (=> (not b_lambda!11305) (not b!829769)))

(declare-fun t!22299 () Bool)

(declare-fun tb!4215 () Bool)

(assert (=> (and start!71442 (= defaultEntry!796 defaultEntry!796) t!22299) tb!4215))

(declare-fun result!8001 () Bool)

(assert (=> tb!4215 (= result!8001 tp_is_empty!15199)))

(assert (=> b!829769 t!22299))

(declare-fun b_and!22487 () Bool)

(assert (= b_and!22481 (and (=> t!22299 result!8001) b_and!22487)))

(declare-fun m!772269 () Bool)

(assert (=> b!829779 m!772269))

(declare-fun m!772271 () Bool)

(assert (=> b!829779 m!772271))

(declare-fun m!772273 () Bool)

(assert (=> b!829779 m!772273))

(declare-fun m!772275 () Bool)

(assert (=> b!829779 m!772275))

(declare-fun m!772277 () Bool)

(assert (=> b!829779 m!772277))

(declare-fun m!772279 () Bool)

(assert (=> b!829779 m!772279))

(declare-fun m!772281 () Bool)

(assert (=> b!829779 m!772281))

(assert (=> b!829779 m!772197))

(declare-fun m!772283 () Bool)

(assert (=> b!829779 m!772283))

(declare-fun m!772285 () Bool)

(assert (=> b!829779 m!772285))

(declare-fun m!772287 () Bool)

(assert (=> b!829779 m!772287))

(declare-fun m!772289 () Bool)

(assert (=> b!829779 m!772289))

(declare-fun m!772291 () Bool)

(assert (=> b!829779 m!772291))

(assert (=> b!829779 m!772283))

(assert (=> b!829779 m!772275))

(assert (=> b!829779 m!772279))

(declare-fun m!772293 () Bool)

(assert (=> b!829779 m!772293))

(declare-fun m!772295 () Bool)

(assert (=> b!829779 m!772295))

(declare-fun m!772297 () Bool)

(assert (=> b!829779 m!772297))

(assert (=> b!829779 m!772293))

(declare-fun m!772299 () Bool)

(assert (=> b!829779 m!772299))

(declare-fun m!772301 () Bool)

(assert (=> bm!36173 m!772301))

(declare-fun m!772303 () Bool)

(assert (=> b!829785 m!772303))

(assert (=> bm!36171 m!772197))

(declare-fun m!772305 () Bool)

(assert (=> b!829777 m!772305))

(assert (=> b!829778 m!772291))

(assert (=> b!829778 m!772291))

(declare-fun m!772307 () Bool)

(assert (=> b!829778 m!772307))

(declare-fun m!772309 () Bool)

(assert (=> b!829786 m!772309))

(declare-fun m!772311 () Bool)

(assert (=> b!829769 m!772311))

(assert (=> b!829769 m!772291))

(declare-fun m!772313 () Bool)

(assert (=> b!829769 m!772313))

(assert (=> b!829769 m!772291))

(declare-fun m!772315 () Bool)

(assert (=> b!829769 m!772315))

(assert (=> b!829769 m!772311))

(assert (=> b!829769 m!772313))

(declare-fun m!772317 () Bool)

(assert (=> b!829769 m!772317))

(assert (=> b!829772 m!772291))

(assert (=> b!829772 m!772291))

(declare-fun m!772319 () Bool)

(assert (=> b!829772 m!772319))

(declare-fun m!772321 () Bool)

(assert (=> bm!36174 m!772321))

(assert (=> d!105111 m!772189))

(assert (=> b!829770 m!772291))

(assert (=> b!829770 m!772291))

(assert (=> b!829770 m!772307))

(declare-fun m!772323 () Bool)

(assert (=> bm!36170 m!772323))

(assert (=> b!829658 d!105111))

(declare-fun d!105113 () Bool)

(declare-fun e!462598 () Bool)

(assert (=> d!105113 e!462598))

(declare-fun res!565257 () Bool)

(assert (=> d!105113 (=> (not res!565257) (not e!462598))))

(declare-fun lt!376323 () ListLongMap!8969)

(assert (=> d!105113 (= res!565257 (contains!4184 lt!376323 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376324 () List!15940)

(assert (=> d!105113 (= lt!376323 (ListLongMap!8970 lt!376324))))

(declare-fun lt!376321 () Unit!28377)

(declare-fun lt!376322 () Unit!28377)

(assert (=> d!105113 (= lt!376321 lt!376322)))

(declare-datatypes ((Option!418 0))(
  ( (Some!417 (v!10085 V!25267)) (None!416) )
))
(declare-fun getValueByKey!412 (List!15940 (_ BitVec 64)) Option!418)

(assert (=> d!105113 (= (getValueByKey!412 lt!376324 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!229 (List!15940 (_ BitVec 64) V!25267) Unit!28377)

(assert (=> d!105113 (= lt!376322 (lemmaContainsTupThenGetReturnValue!229 lt!376324 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!268 (List!15940 (_ BitVec 64) V!25267) List!15940)

(assert (=> d!105113 (= lt!376324 (insertStrictlySorted!268 (toList!4500 (+!2008 lt!376226 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105113 (= (+!2008 (+!2008 lt!376226 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376323)))

(declare-fun b!829796 () Bool)

(declare-fun res!565258 () Bool)

(assert (=> b!829796 (=> (not res!565258) (not e!462598))))

(assert (=> b!829796 (= res!565258 (= (getValueByKey!412 (toList!4500 lt!376323) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829797 () Bool)

(declare-fun contains!4185 (List!15940 tuple2!10156) Bool)

(assert (=> b!829797 (= e!462598 (contains!4185 (toList!4500 lt!376323) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105113 res!565257) b!829796))

(assert (= (and b!829796 res!565258) b!829797))

(declare-fun m!772325 () Bool)

(assert (=> d!105113 m!772325))

(declare-fun m!772327 () Bool)

(assert (=> d!105113 m!772327))

(declare-fun m!772329 () Bool)

(assert (=> d!105113 m!772329))

(declare-fun m!772331 () Bool)

(assert (=> d!105113 m!772331))

(declare-fun m!772333 () Bool)

(assert (=> b!829796 m!772333))

(declare-fun m!772335 () Bool)

(assert (=> b!829797 m!772335))

(assert (=> b!829658 d!105113))

(declare-fun d!105115 () Bool)

(declare-fun e!462599 () Bool)

(assert (=> d!105115 e!462599))

(declare-fun res!565259 () Bool)

(assert (=> d!105115 (=> (not res!565259) (not e!462599))))

(declare-fun lt!376327 () ListLongMap!8969)

(assert (=> d!105115 (= res!565259 (contains!4184 lt!376327 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376328 () List!15940)

(assert (=> d!105115 (= lt!376327 (ListLongMap!8970 lt!376328))))

(declare-fun lt!376325 () Unit!28377)

(declare-fun lt!376326 () Unit!28377)

(assert (=> d!105115 (= lt!376325 lt!376326)))

(assert (=> d!105115 (= (getValueByKey!412 lt!376328 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!417 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105115 (= lt!376326 (lemmaContainsTupThenGetReturnValue!229 lt!376328 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105115 (= lt!376328 (insertStrictlySorted!268 (toList!4500 lt!376226) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105115 (= (+!2008 lt!376226 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376327)))

(declare-fun b!829798 () Bool)

(declare-fun res!565260 () Bool)

(assert (=> b!829798 (=> (not res!565260) (not e!462599))))

(assert (=> b!829798 (= res!565260 (= (getValueByKey!412 (toList!4500 lt!376327) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!417 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!829799 () Bool)

(assert (=> b!829799 (= e!462599 (contains!4185 (toList!4500 lt!376327) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105115 res!565259) b!829798))

(assert (= (and b!829798 res!565260) b!829799))

(declare-fun m!772337 () Bool)

(assert (=> d!105115 m!772337))

(declare-fun m!772339 () Bool)

(assert (=> d!105115 m!772339))

(declare-fun m!772341 () Bool)

(assert (=> d!105115 m!772341))

(declare-fun m!772343 () Bool)

(assert (=> d!105115 m!772343))

(declare-fun m!772345 () Bool)

(assert (=> b!829798 m!772345))

(declare-fun m!772347 () Bool)

(assert (=> b!829799 m!772347))

(assert (=> b!829658 d!105115))

(declare-fun d!105117 () Bool)

(assert (=> d!105117 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71442 d!105117))

(declare-fun d!105119 () Bool)

(assert (=> d!105119 (= (array_inv!17831 _keys!976) (bvsge (size!22729 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71442 d!105119))

(declare-fun d!105121 () Bool)

(assert (=> d!105121 (= (array_inv!17832 _values!788) (bvsge (size!22730 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71442 d!105121))

(declare-fun bm!36179 () Bool)

(declare-fun call!36182 () Bool)

(assert (=> bm!36179 (= call!36182 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!829808 () Bool)

(declare-fun e!462606 () Bool)

(declare-fun e!462608 () Bool)

(assert (=> b!829808 (= e!462606 e!462608)))

(declare-fun c!89771 () Bool)

(assert (=> b!829808 (= c!89771 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105123 () Bool)

(declare-fun res!565265 () Bool)

(assert (=> d!105123 (=> res!565265 e!462606)))

(assert (=> d!105123 (= res!565265 (bvsge #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (=> d!105123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462606)))

(declare-fun b!829809 () Bool)

(declare-fun e!462607 () Bool)

(assert (=> b!829809 (= e!462608 e!462607)))

(declare-fun lt!376335 () (_ BitVec 64))

(assert (=> b!829809 (= lt!376335 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376336 () Unit!28377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46541 (_ BitVec 64) (_ BitVec 32)) Unit!28377)

(assert (=> b!829809 (= lt!376336 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376335 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829809 (arrayContainsKey!0 _keys!976 lt!376335 #b00000000000000000000000000000000)))

(declare-fun lt!376337 () Unit!28377)

(assert (=> b!829809 (= lt!376337 lt!376336)))

(declare-fun res!565266 () Bool)

(declare-datatypes ((SeekEntryResult!8739 0))(
  ( (MissingZero!8739 (index!37327 (_ BitVec 32))) (Found!8739 (index!37328 (_ BitVec 32))) (Intermediate!8739 (undefined!9551 Bool) (index!37329 (_ BitVec 32)) (x!70080 (_ BitVec 32))) (Undefined!8739) (MissingVacant!8739 (index!37330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46541 (_ BitVec 32)) SeekEntryResult!8739)

(assert (=> b!829809 (= res!565266 (= (seekEntryOrOpen!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8739 #b00000000000000000000000000000000)))))

(assert (=> b!829809 (=> (not res!565266) (not e!462607))))

(declare-fun b!829810 () Bool)

(assert (=> b!829810 (= e!462607 call!36182)))

(declare-fun b!829811 () Bool)

(assert (=> b!829811 (= e!462608 call!36182)))

(assert (= (and d!105123 (not res!565265)) b!829808))

(assert (= (and b!829808 c!89771) b!829809))

(assert (= (and b!829808 (not c!89771)) b!829811))

(assert (= (and b!829809 res!565266) b!829810))

(assert (= (or b!829810 b!829811) bm!36179))

(declare-fun m!772349 () Bool)

(assert (=> bm!36179 m!772349))

(assert (=> b!829808 m!772291))

(assert (=> b!829808 m!772291))

(assert (=> b!829808 m!772307))

(assert (=> b!829809 m!772291))

(declare-fun m!772351 () Bool)

(assert (=> b!829809 m!772351))

(declare-fun m!772353 () Bool)

(assert (=> b!829809 m!772353))

(assert (=> b!829809 m!772291))

(declare-fun m!772355 () Bool)

(assert (=> b!829809 m!772355))

(assert (=> b!829666 d!105123))

(declare-fun e!462609 () Bool)

(declare-fun b!829812 () Bool)

(declare-fun lt!376355 () ListLongMap!8969)

(assert (=> b!829812 (= e!462609 (= (apply!371 lt!376355 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)) (get!11820 (select (arr!22309 _values!788) #b00000000000000000000000000000000) (dynLambda!985 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22730 _values!788)))))

(assert (=> b!829812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun bm!36180 () Bool)

(declare-fun call!36184 () Bool)

(assert (=> bm!36180 (= call!36184 (contains!4184 lt!376355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829813 () Bool)

(declare-fun e!462618 () Bool)

(assert (=> b!829813 (= e!462618 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829814 () Bool)

(declare-fun e!462613 () Bool)

(declare-fun e!462619 () Bool)

(assert (=> b!829814 (= e!462613 e!462619)))

(declare-fun c!89776 () Bool)

(assert (=> b!829814 (= c!89776 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829815 () Bool)

(declare-fun e!462610 () Bool)

(assert (=> b!829815 (= e!462610 e!462609)))

(declare-fun res!565273 () Bool)

(assert (=> b!829815 (=> (not res!565273) (not e!462609))))

(assert (=> b!829815 (= res!565273 (contains!4184 lt!376355 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun call!36187 () ListLongMap!8969)

(declare-fun bm!36181 () Bool)

(assert (=> bm!36181 (= call!36187 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829816 () Bool)

(declare-fun res!565274 () Bool)

(assert (=> b!829816 (=> (not res!565274) (not e!462613))))

(declare-fun e!462611 () Bool)

(assert (=> b!829816 (= res!565274 e!462611)))

(declare-fun c!89774 () Bool)

(assert (=> b!829816 (= c!89774 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!36182 () Bool)

(declare-fun call!36183 () ListLongMap!8969)

(assert (=> bm!36182 (= call!36183 call!36187)))

(declare-fun b!829817 () Bool)

(declare-fun e!462614 () Bool)

(assert (=> b!829817 (= e!462619 e!462614)))

(declare-fun res!565268 () Bool)

(declare-fun call!36185 () Bool)

(assert (=> b!829817 (= res!565268 call!36185)))

(assert (=> b!829817 (=> (not res!565268) (not e!462614))))

(declare-fun bm!36183 () Bool)

(assert (=> bm!36183 (= call!36185 (contains!4184 lt!376355 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829819 () Bool)

(assert (=> b!829819 (= e!462611 (not call!36184))))

(declare-fun b!829820 () Bool)

(assert (=> b!829820 (= e!462614 (= (apply!371 lt!376355 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829821 () Bool)

(declare-fun e!462621 () Bool)

(assert (=> b!829821 (= e!462621 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829822 () Bool)

(declare-fun e!462615 () Unit!28377)

(declare-fun lt!376343 () Unit!28377)

(assert (=> b!829822 (= e!462615 lt!376343)))

(declare-fun lt!376352 () ListLongMap!8969)

(assert (=> b!829822 (= lt!376352 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376345 () (_ BitVec 64))

(assert (=> b!829822 (= lt!376345 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376346 () (_ BitVec 64))

(assert (=> b!829822 (= lt!376346 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376349 () Unit!28377)

(assert (=> b!829822 (= lt!376349 (addStillContains!322 lt!376352 lt!376345 zeroValueBefore!34 lt!376346))))

(assert (=> b!829822 (contains!4184 (+!2008 lt!376352 (tuple2!10157 lt!376345 zeroValueBefore!34)) lt!376346)))

(declare-fun lt!376339 () Unit!28377)

(assert (=> b!829822 (= lt!376339 lt!376349)))

(declare-fun lt!376353 () ListLongMap!8969)

(assert (=> b!829822 (= lt!376353 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376342 () (_ BitVec 64))

(assert (=> b!829822 (= lt!376342 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376348 () (_ BitVec 64))

(assert (=> b!829822 (= lt!376348 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376344 () Unit!28377)

(assert (=> b!829822 (= lt!376344 (addApplyDifferent!322 lt!376353 lt!376342 minValue!754 lt!376348))))

(assert (=> b!829822 (= (apply!371 (+!2008 lt!376353 (tuple2!10157 lt!376342 minValue!754)) lt!376348) (apply!371 lt!376353 lt!376348))))

(declare-fun lt!376340 () Unit!28377)

(assert (=> b!829822 (= lt!376340 lt!376344)))

(declare-fun lt!376356 () ListLongMap!8969)

(assert (=> b!829822 (= lt!376356 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376359 () (_ BitVec 64))

(assert (=> b!829822 (= lt!376359 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376350 () (_ BitVec 64))

(assert (=> b!829822 (= lt!376350 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376341 () Unit!28377)

(assert (=> b!829822 (= lt!376341 (addApplyDifferent!322 lt!376356 lt!376359 zeroValueBefore!34 lt!376350))))

(assert (=> b!829822 (= (apply!371 (+!2008 lt!376356 (tuple2!10157 lt!376359 zeroValueBefore!34)) lt!376350) (apply!371 lt!376356 lt!376350))))

(declare-fun lt!376357 () Unit!28377)

(assert (=> b!829822 (= lt!376357 lt!376341)))

(declare-fun lt!376354 () ListLongMap!8969)

(assert (=> b!829822 (= lt!376354 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376358 () (_ BitVec 64))

(assert (=> b!829822 (= lt!376358 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376347 () (_ BitVec 64))

(assert (=> b!829822 (= lt!376347 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829822 (= lt!376343 (addApplyDifferent!322 lt!376354 lt!376358 minValue!754 lt!376347))))

(assert (=> b!829822 (= (apply!371 (+!2008 lt!376354 (tuple2!10157 lt!376358 minValue!754)) lt!376347) (apply!371 lt!376354 lt!376347))))

(declare-fun b!829823 () Bool)

(declare-fun e!462620 () ListLongMap!8969)

(declare-fun call!36188 () ListLongMap!8969)

(assert (=> b!829823 (= e!462620 call!36188)))

(declare-fun c!89775 () Bool)

(declare-fun call!36189 () ListLongMap!8969)

(declare-fun bm!36184 () Bool)

(declare-fun c!89773 () Bool)

(assert (=> bm!36184 (= call!36189 (+!2008 (ite c!89775 call!36187 (ite c!89773 call!36183 call!36188)) (ite (or c!89775 c!89773) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829824 () Bool)

(declare-fun e!462617 () ListLongMap!8969)

(declare-fun call!36186 () ListLongMap!8969)

(assert (=> b!829824 (= e!462617 call!36186)))

(declare-fun b!829825 () Bool)

(declare-fun res!565270 () Bool)

(assert (=> b!829825 (=> (not res!565270) (not e!462613))))

(assert (=> b!829825 (= res!565270 e!462610)))

(declare-fun res!565269 () Bool)

(assert (=> b!829825 (=> res!565269 e!462610)))

(assert (=> b!829825 (= res!565269 (not e!462618))))

(declare-fun res!565272 () Bool)

(assert (=> b!829825 (=> (not res!565272) (not e!462618))))

(assert (=> b!829825 (= res!565272 (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun b!829826 () Bool)

(assert (=> b!829826 (= e!462619 (not call!36185))))

(declare-fun b!829827 () Bool)

(assert (=> b!829827 (= e!462620 call!36186)))

(declare-fun bm!36185 () Bool)

(assert (=> bm!36185 (= call!36186 call!36189)))

(declare-fun b!829828 () Bool)

(declare-fun e!462616 () Bool)

(assert (=> b!829828 (= e!462616 (= (apply!371 lt!376355 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!36186 () Bool)

(assert (=> bm!36186 (= call!36188 call!36183)))

(declare-fun b!829829 () Bool)

(declare-fun e!462612 () ListLongMap!8969)

(assert (=> b!829829 (= e!462612 (+!2008 call!36189 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829818 () Bool)

(assert (=> b!829818 (= e!462612 e!462617)))

(assert (=> b!829818 (= c!89773 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!105125 () Bool)

(assert (=> d!105125 e!462613))

(declare-fun res!565271 () Bool)

(assert (=> d!105125 (=> (not res!565271) (not e!462613))))

(assert (=> d!105125 (= res!565271 (or (bvsge #b00000000000000000000000000000000 (size!22729 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))))

(declare-fun lt!376351 () ListLongMap!8969)

(assert (=> d!105125 (= lt!376355 lt!376351)))

(declare-fun lt!376338 () Unit!28377)

(assert (=> d!105125 (= lt!376338 e!462615)))

(declare-fun c!89777 () Bool)

(assert (=> d!105125 (= c!89777 e!462621)))

(declare-fun res!565275 () Bool)

(assert (=> d!105125 (=> (not res!565275) (not e!462621))))

(assert (=> d!105125 (= res!565275 (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (=> d!105125 (= lt!376351 e!462612)))

(assert (=> d!105125 (= c!89775 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105125 (validMask!0 mask!1312)))

(assert (=> d!105125 (= (getCurrentListMap!2551 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376355)))

(declare-fun b!829830 () Bool)

(declare-fun Unit!28382 () Unit!28377)

(assert (=> b!829830 (= e!462615 Unit!28382)))

(declare-fun b!829831 () Bool)

(assert (=> b!829831 (= e!462611 e!462616)))

(declare-fun res!565267 () Bool)

(assert (=> b!829831 (= res!565267 call!36184)))

(assert (=> b!829831 (=> (not res!565267) (not e!462616))))

(declare-fun b!829832 () Bool)

(declare-fun c!89772 () Bool)

(assert (=> b!829832 (= c!89772 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829832 (= e!462617 e!462620)))

(assert (= (and d!105125 c!89775) b!829829))

(assert (= (and d!105125 (not c!89775)) b!829818))

(assert (= (and b!829818 c!89773) b!829824))

(assert (= (and b!829818 (not c!89773)) b!829832))

(assert (= (and b!829832 c!89772) b!829827))

(assert (= (and b!829832 (not c!89772)) b!829823))

(assert (= (or b!829827 b!829823) bm!36186))

(assert (= (or b!829824 bm!36186) bm!36182))

(assert (= (or b!829824 b!829827) bm!36185))

(assert (= (or b!829829 bm!36182) bm!36181))

(assert (= (or b!829829 bm!36185) bm!36184))

(assert (= (and d!105125 res!565275) b!829821))

(assert (= (and d!105125 c!89777) b!829822))

(assert (= (and d!105125 (not c!89777)) b!829830))

(assert (= (and d!105125 res!565271) b!829825))

(assert (= (and b!829825 res!565272) b!829813))

(assert (= (and b!829825 (not res!565269)) b!829815))

(assert (= (and b!829815 res!565273) b!829812))

(assert (= (and b!829825 res!565270) b!829816))

(assert (= (and b!829816 c!89774) b!829831))

(assert (= (and b!829816 (not c!89774)) b!829819))

(assert (= (and b!829831 res!565267) b!829828))

(assert (= (or b!829831 b!829819) bm!36180))

(assert (= (and b!829816 res!565274) b!829814))

(assert (= (and b!829814 c!89776) b!829817))

(assert (= (and b!829814 (not c!89776)) b!829826))

(assert (= (and b!829817 res!565268) b!829820))

(assert (= (or b!829817 b!829826) bm!36183))

(declare-fun b_lambda!11307 () Bool)

(assert (=> (not b_lambda!11307) (not b!829812)))

(assert (=> b!829812 t!22299))

(declare-fun b_and!22489 () Bool)

(assert (= b_and!22487 (and (=> t!22299 result!8001) b_and!22489)))

(declare-fun m!772357 () Bool)

(assert (=> b!829822 m!772357))

(declare-fun m!772359 () Bool)

(assert (=> b!829822 m!772359))

(declare-fun m!772361 () Bool)

(assert (=> b!829822 m!772361))

(declare-fun m!772363 () Bool)

(assert (=> b!829822 m!772363))

(declare-fun m!772365 () Bool)

(assert (=> b!829822 m!772365))

(declare-fun m!772367 () Bool)

(assert (=> b!829822 m!772367))

(declare-fun m!772369 () Bool)

(assert (=> b!829822 m!772369))

(assert (=> b!829822 m!772199))

(declare-fun m!772371 () Bool)

(assert (=> b!829822 m!772371))

(declare-fun m!772373 () Bool)

(assert (=> b!829822 m!772373))

(declare-fun m!772375 () Bool)

(assert (=> b!829822 m!772375))

(declare-fun m!772377 () Bool)

(assert (=> b!829822 m!772377))

(assert (=> b!829822 m!772291))

(assert (=> b!829822 m!772371))

(assert (=> b!829822 m!772363))

(assert (=> b!829822 m!772367))

(declare-fun m!772379 () Bool)

(assert (=> b!829822 m!772379))

(declare-fun m!772381 () Bool)

(assert (=> b!829822 m!772381))

(declare-fun m!772383 () Bool)

(assert (=> b!829822 m!772383))

(assert (=> b!829822 m!772379))

(declare-fun m!772385 () Bool)

(assert (=> b!829822 m!772385))

(declare-fun m!772387 () Bool)

(assert (=> bm!36183 m!772387))

(declare-fun m!772389 () Bool)

(assert (=> b!829828 m!772389))

(assert (=> bm!36181 m!772199))

(declare-fun m!772391 () Bool)

(assert (=> b!829820 m!772391))

(assert (=> b!829821 m!772291))

(assert (=> b!829821 m!772291))

(assert (=> b!829821 m!772307))

(declare-fun m!772393 () Bool)

(assert (=> b!829829 m!772393))

(assert (=> b!829812 m!772311))

(assert (=> b!829812 m!772291))

(assert (=> b!829812 m!772313))

(assert (=> b!829812 m!772291))

(declare-fun m!772395 () Bool)

(assert (=> b!829812 m!772395))

(assert (=> b!829812 m!772311))

(assert (=> b!829812 m!772313))

(assert (=> b!829812 m!772317))

(assert (=> b!829815 m!772291))

(assert (=> b!829815 m!772291))

(declare-fun m!772397 () Bool)

(assert (=> b!829815 m!772397))

(declare-fun m!772399 () Bool)

(assert (=> bm!36184 m!772399))

(assert (=> d!105125 m!772189))

(assert (=> b!829813 m!772291))

(assert (=> b!829813 m!772291))

(assert (=> b!829813 m!772307))

(declare-fun m!772401 () Bool)

(assert (=> bm!36180 m!772401))

(assert (=> b!829657 d!105125))

(declare-fun d!105127 () Bool)

(declare-fun e!462622 () Bool)

(assert (=> d!105127 e!462622))

(declare-fun res!565276 () Bool)

(assert (=> d!105127 (=> (not res!565276) (not e!462622))))

(declare-fun lt!376362 () ListLongMap!8969)

(assert (=> d!105127 (= res!565276 (contains!4184 lt!376362 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376363 () List!15940)

(assert (=> d!105127 (= lt!376362 (ListLongMap!8970 lt!376363))))

(declare-fun lt!376360 () Unit!28377)

(declare-fun lt!376361 () Unit!28377)

(assert (=> d!105127 (= lt!376360 lt!376361)))

(assert (=> d!105127 (= (getValueByKey!412 lt!376363 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105127 (= lt!376361 (lemmaContainsTupThenGetReturnValue!229 lt!376363 (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105127 (= lt!376363 (insertStrictlySorted!268 (toList!4500 (+!2008 lt!376227 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105127 (= (+!2008 (+!2008 lt!376227 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376362)))

(declare-fun b!829833 () Bool)

(declare-fun res!565277 () Bool)

(assert (=> b!829833 (=> (not res!565277) (not e!462622))))

(assert (=> b!829833 (= res!565277 (= (getValueByKey!412 (toList!4500 lt!376362) (_1!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5089 (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829834 () Bool)

(assert (=> b!829834 (= e!462622 (contains!4185 (toList!4500 lt!376362) (tuple2!10157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105127 res!565276) b!829833))

(assert (= (and b!829833 res!565277) b!829834))

(declare-fun m!772403 () Bool)

(assert (=> d!105127 m!772403))

(declare-fun m!772405 () Bool)

(assert (=> d!105127 m!772405))

(declare-fun m!772407 () Bool)

(assert (=> d!105127 m!772407))

(declare-fun m!772409 () Bool)

(assert (=> d!105127 m!772409))

(declare-fun m!772411 () Bool)

(assert (=> b!829833 m!772411))

(declare-fun m!772413 () Bool)

(assert (=> b!829834 m!772413))

(assert (=> b!829657 d!105127))

(declare-fun d!105129 () Bool)

(declare-fun e!462623 () Bool)

(assert (=> d!105129 e!462623))

(declare-fun res!565278 () Bool)

(assert (=> d!105129 (=> (not res!565278) (not e!462623))))

(declare-fun lt!376366 () ListLongMap!8969)

(assert (=> d!105129 (= res!565278 (contains!4184 lt!376366 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!376367 () List!15940)

(assert (=> d!105129 (= lt!376366 (ListLongMap!8970 lt!376367))))

(declare-fun lt!376364 () Unit!28377)

(declare-fun lt!376365 () Unit!28377)

(assert (=> d!105129 (= lt!376364 lt!376365)))

(assert (=> d!105129 (= (getValueByKey!412 lt!376367 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!417 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105129 (= lt!376365 (lemmaContainsTupThenGetReturnValue!229 lt!376367 (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105129 (= lt!376367 (insertStrictlySorted!268 (toList!4500 lt!376227) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105129 (= (+!2008 lt!376227 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!376366)))

(declare-fun b!829835 () Bool)

(declare-fun res!565279 () Bool)

(assert (=> b!829835 (=> (not res!565279) (not e!462623))))

(assert (=> b!829835 (= res!565279 (= (getValueByKey!412 (toList!4500 lt!376366) (_1!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!417 (_2!5089 (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!829836 () Bool)

(assert (=> b!829836 (= e!462623 (contains!4185 (toList!4500 lt!376366) (tuple2!10157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105129 res!565278) b!829835))

(assert (= (and b!829835 res!565279) b!829836))

(declare-fun m!772415 () Bool)

(assert (=> d!105129 m!772415))

(declare-fun m!772417 () Bool)

(assert (=> d!105129 m!772417))

(declare-fun m!772419 () Bool)

(assert (=> d!105129 m!772419))

(declare-fun m!772421 () Bool)

(assert (=> d!105129 m!772421))

(declare-fun m!772423 () Bool)

(assert (=> b!829835 m!772423))

(declare-fun m!772425 () Bool)

(assert (=> b!829836 m!772425))

(assert (=> b!829657 d!105129))

(declare-fun d!105131 () Bool)

(assert (=> d!105131 (= (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376370 () Unit!28377)

(declare-fun choose!1424 (array!46541 array!46543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 V!25267 V!25267 (_ BitVec 32) Int) Unit!28377)

(assert (=> d!105131 (= lt!376370 (choose!1424 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105131 (validMask!0 mask!1312)))

(assert (=> d!105131 (= (lemmaNoChangeToArrayThenSameMapNoExtras!598 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376370)))

(declare-fun bs!23148 () Bool)

(assert (= bs!23148 d!105131))

(assert (=> bs!23148 m!772199))

(assert (=> bs!23148 m!772197))

(declare-fun m!772427 () Bool)

(assert (=> bs!23148 m!772427))

(assert (=> bs!23148 m!772189))

(assert (=> b!829665 d!105131))

(declare-fun b!829861 () Bool)

(declare-fun e!462642 () ListLongMap!8969)

(declare-fun e!462640 () ListLongMap!8969)

(assert (=> b!829861 (= e!462642 e!462640)))

(declare-fun c!89787 () Bool)

(assert (=> b!829861 (= c!89787 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829862 () Bool)

(declare-fun lt!376387 () ListLongMap!8969)

(declare-fun e!462638 () Bool)

(assert (=> b!829862 (= e!462638 (= lt!376387 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829863 () Bool)

(declare-fun isEmpty!658 (ListLongMap!8969) Bool)

(assert (=> b!829863 (= e!462638 (isEmpty!658 lt!376387))))

(declare-fun b!829864 () Bool)

(declare-fun call!36192 () ListLongMap!8969)

(assert (=> b!829864 (= e!462640 call!36192)))

(declare-fun bm!36189 () Bool)

(assert (=> bm!36189 (= call!36192 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun d!105133 () Bool)

(declare-fun e!462641 () Bool)

(assert (=> d!105133 e!462641))

(declare-fun res!565291 () Bool)

(assert (=> d!105133 (=> (not res!565291) (not e!462641))))

(assert (=> d!105133 (= res!565291 (not (contains!4184 lt!376387 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105133 (= lt!376387 e!462642)))

(declare-fun c!89788 () Bool)

(assert (=> d!105133 (= c!89788 (bvsge #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (=> d!105133 (validMask!0 mask!1312)))

(assert (=> d!105133 (= (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376387)))

(declare-fun b!829865 () Bool)

(declare-fun e!462644 () Bool)

(assert (=> b!829865 (= e!462644 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829865 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829866 () Bool)

(assert (=> b!829866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (=> b!829866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22730 _values!788)))))

(declare-fun e!462643 () Bool)

(assert (=> b!829866 (= e!462643 (= (apply!371 lt!376387 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)) (get!11820 (select (arr!22309 _values!788) #b00000000000000000000000000000000) (dynLambda!985 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829867 () Bool)

(assert (=> b!829867 (= e!462642 (ListLongMap!8970 Nil!15937))))

(declare-fun b!829868 () Bool)

(declare-fun res!565289 () Bool)

(assert (=> b!829868 (=> (not res!565289) (not e!462641))))

(assert (=> b!829868 (= res!565289 (not (contains!4184 lt!376387 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829869 () Bool)

(declare-fun e!462639 () Bool)

(assert (=> b!829869 (= e!462639 e!462643)))

(assert (=> b!829869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun res!565288 () Bool)

(assert (=> b!829869 (= res!565288 (contains!4184 lt!376387 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829869 (=> (not res!565288) (not e!462643))))

(declare-fun b!829870 () Bool)

(declare-fun lt!376386 () Unit!28377)

(declare-fun lt!376390 () Unit!28377)

(assert (=> b!829870 (= lt!376386 lt!376390)))

(declare-fun lt!376385 () (_ BitVec 64))

(declare-fun lt!376389 () ListLongMap!8969)

(declare-fun lt!376391 () V!25267)

(declare-fun lt!376388 () (_ BitVec 64))

(assert (=> b!829870 (not (contains!4184 (+!2008 lt!376389 (tuple2!10157 lt!376385 lt!376391)) lt!376388))))

(declare-fun addStillNotContains!197 (ListLongMap!8969 (_ BitVec 64) V!25267 (_ BitVec 64)) Unit!28377)

(assert (=> b!829870 (= lt!376390 (addStillNotContains!197 lt!376389 lt!376385 lt!376391 lt!376388))))

(assert (=> b!829870 (= lt!376388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829870 (= lt!376391 (get!11820 (select (arr!22309 _values!788) #b00000000000000000000000000000000) (dynLambda!985 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829870 (= lt!376385 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829870 (= lt!376389 call!36192)))

(assert (=> b!829870 (= e!462640 (+!2008 call!36192 (tuple2!10157 (select (arr!22308 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22309 _values!788) #b00000000000000000000000000000000) (dynLambda!985 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829871 () Bool)

(assert (=> b!829871 (= e!462641 e!462639)))

(declare-fun c!89786 () Bool)

(assert (=> b!829871 (= c!89786 e!462644)))

(declare-fun res!565290 () Bool)

(assert (=> b!829871 (=> (not res!565290) (not e!462644))))

(assert (=> b!829871 (= res!565290 (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun b!829872 () Bool)

(assert (=> b!829872 (= e!462639 e!462638)))

(declare-fun c!89789 () Bool)

(assert (=> b!829872 (= c!89789 (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (= (and d!105133 c!89788) b!829867))

(assert (= (and d!105133 (not c!89788)) b!829861))

(assert (= (and b!829861 c!89787) b!829870))

(assert (= (and b!829861 (not c!89787)) b!829864))

(assert (= (or b!829870 b!829864) bm!36189))

(assert (= (and d!105133 res!565291) b!829868))

(assert (= (and b!829868 res!565289) b!829871))

(assert (= (and b!829871 res!565290) b!829865))

(assert (= (and b!829871 c!89786) b!829869))

(assert (= (and b!829871 (not c!89786)) b!829872))

(assert (= (and b!829869 res!565288) b!829866))

(assert (= (and b!829872 c!89789) b!829862))

(assert (= (and b!829872 (not c!89789)) b!829863))

(declare-fun b_lambda!11309 () Bool)

(assert (=> (not b_lambda!11309) (not b!829866)))

(assert (=> b!829866 t!22299))

(declare-fun b_and!22491 () Bool)

(assert (= b_and!22489 (and (=> t!22299 result!8001) b_and!22491)))

(declare-fun b_lambda!11311 () Bool)

(assert (=> (not b_lambda!11311) (not b!829870)))

(assert (=> b!829870 t!22299))

(declare-fun b_and!22493 () Bool)

(assert (= b_and!22491 (and (=> t!22299 result!8001) b_and!22493)))

(declare-fun m!772429 () Bool)

(assert (=> b!829868 m!772429))

(declare-fun m!772431 () Bool)

(assert (=> d!105133 m!772431))

(assert (=> d!105133 m!772189))

(declare-fun m!772433 () Bool)

(assert (=> b!829862 m!772433))

(assert (=> b!829870 m!772313))

(declare-fun m!772435 () Bool)

(assert (=> b!829870 m!772435))

(assert (=> b!829870 m!772311))

(declare-fun m!772437 () Bool)

(assert (=> b!829870 m!772437))

(declare-fun m!772439 () Bool)

(assert (=> b!829870 m!772439))

(assert (=> b!829870 m!772311))

(assert (=> b!829870 m!772313))

(assert (=> b!829870 m!772317))

(assert (=> b!829870 m!772291))

(assert (=> b!829870 m!772435))

(declare-fun m!772441 () Bool)

(assert (=> b!829870 m!772441))

(declare-fun m!772443 () Bool)

(assert (=> b!829863 m!772443))

(assert (=> bm!36189 m!772433))

(assert (=> b!829866 m!772313))

(assert (=> b!829866 m!772291))

(assert (=> b!829866 m!772311))

(assert (=> b!829866 m!772291))

(declare-fun m!772445 () Bool)

(assert (=> b!829866 m!772445))

(assert (=> b!829866 m!772311))

(assert (=> b!829866 m!772313))

(assert (=> b!829866 m!772317))

(assert (=> b!829865 m!772291))

(assert (=> b!829865 m!772291))

(assert (=> b!829865 m!772307))

(assert (=> b!829861 m!772291))

(assert (=> b!829861 m!772291))

(assert (=> b!829861 m!772307))

(assert (=> b!829869 m!772291))

(assert (=> b!829869 m!772291))

(declare-fun m!772447 () Bool)

(assert (=> b!829869 m!772447))

(assert (=> b!829665 d!105133))

(declare-fun b!829873 () Bool)

(declare-fun e!462649 () ListLongMap!8969)

(declare-fun e!462647 () ListLongMap!8969)

(assert (=> b!829873 (= e!462649 e!462647)))

(declare-fun c!89791 () Bool)

(assert (=> b!829873 (= c!89791 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!376394 () ListLongMap!8969)

(declare-fun e!462645 () Bool)

(declare-fun b!829874 () Bool)

(assert (=> b!829874 (= e!462645 (= lt!376394 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829875 () Bool)

(assert (=> b!829875 (= e!462645 (isEmpty!658 lt!376394))))

(declare-fun b!829876 () Bool)

(declare-fun call!36193 () ListLongMap!8969)

(assert (=> b!829876 (= e!462647 call!36193)))

(declare-fun bm!36190 () Bool)

(assert (=> bm!36190 (= call!36193 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun d!105135 () Bool)

(declare-fun e!462648 () Bool)

(assert (=> d!105135 e!462648))

(declare-fun res!565295 () Bool)

(assert (=> d!105135 (=> (not res!565295) (not e!462648))))

(assert (=> d!105135 (= res!565295 (not (contains!4184 lt!376394 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105135 (= lt!376394 e!462649)))

(declare-fun c!89792 () Bool)

(assert (=> d!105135 (= c!89792 (bvsge #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (=> d!105135 (validMask!0 mask!1312)))

(assert (=> d!105135 (= (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376394)))

(declare-fun b!829877 () Bool)

(declare-fun e!462651 () Bool)

(assert (=> b!829877 (= e!462651 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829877 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829878 () Bool)

(assert (=> b!829878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (=> b!829878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22730 _values!788)))))

(declare-fun e!462650 () Bool)

(assert (=> b!829878 (= e!462650 (= (apply!371 lt!376394 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)) (get!11820 (select (arr!22309 _values!788) #b00000000000000000000000000000000) (dynLambda!985 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829879 () Bool)

(assert (=> b!829879 (= e!462649 (ListLongMap!8970 Nil!15937))))

(declare-fun b!829880 () Bool)

(declare-fun res!565293 () Bool)

(assert (=> b!829880 (=> (not res!565293) (not e!462648))))

(assert (=> b!829880 (= res!565293 (not (contains!4184 lt!376394 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829881 () Bool)

(declare-fun e!462646 () Bool)

(assert (=> b!829881 (= e!462646 e!462650)))

(assert (=> b!829881 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun res!565292 () Bool)

(assert (=> b!829881 (= res!565292 (contains!4184 lt!376394 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829881 (=> (not res!565292) (not e!462650))))

(declare-fun b!829882 () Bool)

(declare-fun lt!376393 () Unit!28377)

(declare-fun lt!376397 () Unit!28377)

(assert (=> b!829882 (= lt!376393 lt!376397)))

(declare-fun lt!376398 () V!25267)

(declare-fun lt!376396 () ListLongMap!8969)

(declare-fun lt!376395 () (_ BitVec 64))

(declare-fun lt!376392 () (_ BitVec 64))

(assert (=> b!829882 (not (contains!4184 (+!2008 lt!376396 (tuple2!10157 lt!376392 lt!376398)) lt!376395))))

(assert (=> b!829882 (= lt!376397 (addStillNotContains!197 lt!376396 lt!376392 lt!376398 lt!376395))))

(assert (=> b!829882 (= lt!376395 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829882 (= lt!376398 (get!11820 (select (arr!22309 _values!788) #b00000000000000000000000000000000) (dynLambda!985 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829882 (= lt!376392 (select (arr!22308 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829882 (= lt!376396 call!36193)))

(assert (=> b!829882 (= e!462647 (+!2008 call!36193 (tuple2!10157 (select (arr!22308 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22309 _values!788) #b00000000000000000000000000000000) (dynLambda!985 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829883 () Bool)

(assert (=> b!829883 (= e!462648 e!462646)))

(declare-fun c!89790 () Bool)

(assert (=> b!829883 (= c!89790 e!462651)))

(declare-fun res!565294 () Bool)

(assert (=> b!829883 (=> (not res!565294) (not e!462651))))

(assert (=> b!829883 (= res!565294 (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(declare-fun b!829884 () Bool)

(assert (=> b!829884 (= e!462646 e!462645)))

(declare-fun c!89793 () Bool)

(assert (=> b!829884 (= c!89793 (bvslt #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (= (and d!105135 c!89792) b!829879))

(assert (= (and d!105135 (not c!89792)) b!829873))

(assert (= (and b!829873 c!89791) b!829882))

(assert (= (and b!829873 (not c!89791)) b!829876))

(assert (= (or b!829882 b!829876) bm!36190))

(assert (= (and d!105135 res!565295) b!829880))

(assert (= (and b!829880 res!565293) b!829883))

(assert (= (and b!829883 res!565294) b!829877))

(assert (= (and b!829883 c!89790) b!829881))

(assert (= (and b!829883 (not c!89790)) b!829884))

(assert (= (and b!829881 res!565292) b!829878))

(assert (= (and b!829884 c!89793) b!829874))

(assert (= (and b!829884 (not c!89793)) b!829875))

(declare-fun b_lambda!11313 () Bool)

(assert (=> (not b_lambda!11313) (not b!829878)))

(assert (=> b!829878 t!22299))

(declare-fun b_and!22495 () Bool)

(assert (= b_and!22493 (and (=> t!22299 result!8001) b_and!22495)))

(declare-fun b_lambda!11315 () Bool)

(assert (=> (not b_lambda!11315) (not b!829882)))

(assert (=> b!829882 t!22299))

(declare-fun b_and!22497 () Bool)

(assert (= b_and!22495 (and (=> t!22299 result!8001) b_and!22497)))

(declare-fun m!772449 () Bool)

(assert (=> b!829880 m!772449))

(declare-fun m!772451 () Bool)

(assert (=> d!105135 m!772451))

(assert (=> d!105135 m!772189))

(declare-fun m!772453 () Bool)

(assert (=> b!829874 m!772453))

(assert (=> b!829882 m!772313))

(declare-fun m!772455 () Bool)

(assert (=> b!829882 m!772455))

(assert (=> b!829882 m!772311))

(declare-fun m!772457 () Bool)

(assert (=> b!829882 m!772457))

(declare-fun m!772459 () Bool)

(assert (=> b!829882 m!772459))

(assert (=> b!829882 m!772311))

(assert (=> b!829882 m!772313))

(assert (=> b!829882 m!772317))

(assert (=> b!829882 m!772291))

(assert (=> b!829882 m!772455))

(declare-fun m!772461 () Bool)

(assert (=> b!829882 m!772461))

(declare-fun m!772463 () Bool)

(assert (=> b!829875 m!772463))

(assert (=> bm!36190 m!772453))

(assert (=> b!829878 m!772313))

(assert (=> b!829878 m!772291))

(assert (=> b!829878 m!772311))

(assert (=> b!829878 m!772291))

(declare-fun m!772465 () Bool)

(assert (=> b!829878 m!772465))

(assert (=> b!829878 m!772311))

(assert (=> b!829878 m!772313))

(assert (=> b!829878 m!772317))

(assert (=> b!829877 m!772291))

(assert (=> b!829877 m!772291))

(assert (=> b!829877 m!772307))

(assert (=> b!829873 m!772291))

(assert (=> b!829873 m!772291))

(assert (=> b!829873 m!772307))

(assert (=> b!829881 m!772291))

(assert (=> b!829881 m!772291))

(declare-fun m!772467 () Bool)

(assert (=> b!829881 m!772467))

(assert (=> b!829665 d!105135))

(declare-fun b!829895 () Bool)

(declare-fun e!462663 () Bool)

(declare-fun call!36196 () Bool)

(assert (=> b!829895 (= e!462663 call!36196)))

(declare-fun d!105137 () Bool)

(declare-fun res!565303 () Bool)

(declare-fun e!462660 () Bool)

(assert (=> d!105137 (=> res!565303 e!462660)))

(assert (=> d!105137 (= res!565303 (bvsge #b00000000000000000000000000000000 (size!22729 _keys!976)))))

(assert (=> d!105137 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15938) e!462660)))

(declare-fun bm!36193 () Bool)

(declare-fun c!89796 () Bool)

(assert (=> bm!36193 (= call!36196 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89796 (Cons!15937 (select (arr!22308 _keys!976) #b00000000000000000000000000000000) Nil!15938) Nil!15938)))))

(declare-fun b!829896 () Bool)

(declare-fun e!462661 () Bool)

(assert (=> b!829896 (= e!462660 e!462661)))

(declare-fun res!565304 () Bool)

(assert (=> b!829896 (=> (not res!565304) (not e!462661))))

(declare-fun e!462662 () Bool)

(assert (=> b!829896 (= res!565304 (not e!462662))))

(declare-fun res!565302 () Bool)

(assert (=> b!829896 (=> (not res!565302) (not e!462662))))

(assert (=> b!829896 (= res!565302 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829897 () Bool)

(declare-fun contains!4186 (List!15941 (_ BitVec 64)) Bool)

(assert (=> b!829897 (= e!462662 (contains!4186 Nil!15938 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829898 () Bool)

(assert (=> b!829898 (= e!462663 call!36196)))

(declare-fun b!829899 () Bool)

(assert (=> b!829899 (= e!462661 e!462663)))

(assert (=> b!829899 (= c!89796 (validKeyInArray!0 (select (arr!22308 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105137 (not res!565303)) b!829896))

(assert (= (and b!829896 res!565302) b!829897))

(assert (= (and b!829896 res!565304) b!829899))

(assert (= (and b!829899 c!89796) b!829898))

(assert (= (and b!829899 (not c!89796)) b!829895))

(assert (= (or b!829898 b!829895) bm!36193))

(assert (=> bm!36193 m!772291))

(declare-fun m!772469 () Bool)

(assert (=> bm!36193 m!772469))

(assert (=> b!829896 m!772291))

(assert (=> b!829896 m!772291))

(assert (=> b!829896 m!772307))

(assert (=> b!829897 m!772291))

(assert (=> b!829897 m!772291))

(declare-fun m!772471 () Bool)

(assert (=> b!829897 m!772471))

(assert (=> b!829899 m!772291))

(assert (=> b!829899 m!772291))

(assert (=> b!829899 m!772307))

(assert (=> b!829662 d!105137))

(declare-fun mapIsEmpty!24457 () Bool)

(declare-fun mapRes!24457 () Bool)

(assert (=> mapIsEmpty!24457 mapRes!24457))

(declare-fun b!829906 () Bool)

(declare-fun e!462668 () Bool)

(assert (=> b!829906 (= e!462668 tp_is_empty!15199)))

(declare-fun condMapEmpty!24457 () Bool)

(declare-fun mapDefault!24457 () ValueCell!7184)

(assert (=> mapNonEmpty!24448 (= condMapEmpty!24457 (= mapRest!24448 ((as const (Array (_ BitVec 32) ValueCell!7184)) mapDefault!24457)))))

(declare-fun e!462669 () Bool)

(assert (=> mapNonEmpty!24448 (= tp!47250 (and e!462669 mapRes!24457))))

(declare-fun mapNonEmpty!24457 () Bool)

(declare-fun tp!47266 () Bool)

(assert (=> mapNonEmpty!24457 (= mapRes!24457 (and tp!47266 e!462668))))

(declare-fun mapValue!24457 () ValueCell!7184)

(declare-fun mapKey!24457 () (_ BitVec 32))

(declare-fun mapRest!24457 () (Array (_ BitVec 32) ValueCell!7184))

(assert (=> mapNonEmpty!24457 (= mapRest!24448 (store mapRest!24457 mapKey!24457 mapValue!24457))))

(declare-fun b!829907 () Bool)

(assert (=> b!829907 (= e!462669 tp_is_empty!15199)))

(assert (= (and mapNonEmpty!24448 condMapEmpty!24457) mapIsEmpty!24457))

(assert (= (and mapNonEmpty!24448 (not condMapEmpty!24457)) mapNonEmpty!24457))

(assert (= (and mapNonEmpty!24457 ((_ is ValueCellFull!7184) mapValue!24457)) b!829906))

(assert (= (and mapNonEmpty!24448 ((_ is ValueCellFull!7184) mapDefault!24457)) b!829907))

(declare-fun m!772473 () Bool)

(assert (=> mapNonEmpty!24457 m!772473))

(declare-fun b_lambda!11317 () Bool)

(assert (= b_lambda!11313 (or (and start!71442 b_free!13489) b_lambda!11317)))

(declare-fun b_lambda!11319 () Bool)

(assert (= b_lambda!11309 (or (and start!71442 b_free!13489) b_lambda!11319)))

(declare-fun b_lambda!11321 () Bool)

(assert (= b_lambda!11315 (or (and start!71442 b_free!13489) b_lambda!11321)))

(declare-fun b_lambda!11323 () Bool)

(assert (= b_lambda!11311 (or (and start!71442 b_free!13489) b_lambda!11323)))

(declare-fun b_lambda!11325 () Bool)

(assert (= b_lambda!11307 (or (and start!71442 b_free!13489) b_lambda!11325)))

(declare-fun b_lambda!11327 () Bool)

(assert (= b_lambda!11305 (or (and start!71442 b_free!13489) b_lambda!11327)))

(check-sat (not b!829796) (not b!829862) (not d!105131) (not b_lambda!11319) (not b!829863) (not b!829812) (not b!829779) (not b!829873) (not b_lambda!11325) (not d!105135) (not bm!36179) (not bm!36181) (not b!829869) (not b!829878) (not d!105113) (not bm!36189) (not b!829881) (not bm!36170) (not b!829880) (not b!829834) (not b!829828) (not b!829866) (not b_lambda!11317) (not bm!36171) (not d!105111) (not b!829770) (not b!829836) (not b!829868) (not d!105133) (not bm!36190) (not bm!36174) (not b!829896) (not b!829809) (not b!829882) (not b!829833) (not bm!36193) (not d!105115) (not b!829815) (not b!829769) (not d!105127) tp_is_empty!15199 (not b!829829) b_and!22497 (not b_lambda!11327) (not b!829875) (not b!829785) (not b!829820) (not b!829897) (not b!829772) (not b!829821) (not mapNonEmpty!24457) (not b!829874) (not b_lambda!11321) (not b!829870) (not d!105129) (not bm!36183) (not b!829798) (not bm!36184) (not b_lambda!11323) (not b!829877) (not b!829861) (not b!829822) (not b_next!13489) (not b!829899) (not b!829778) (not b!829786) (not b!829835) (not bm!36180) (not bm!36173) (not b!829813) (not b!829808) (not b!829777) (not b!829797) (not b!829799) (not b!829865) (not d!105125))
(check-sat b_and!22497 (not b_next!13489))
