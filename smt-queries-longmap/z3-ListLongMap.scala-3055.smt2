; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43136 () Bool)

(assert start!43136)

(declare-fun mapIsEmpty!22030 () Bool)

(declare-fun mapRes!22030 () Bool)

(assert (=> mapIsEmpty!22030 mapRes!22030))

(declare-fun b!478169 () Bool)

(declare-fun res!285319 () Bool)

(declare-fun e!281125 () Bool)

(assert (=> b!478169 (=> (not res!285319) (not e!281125))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30789 0))(
  ( (array!30790 (arr!14804 (Array (_ BitVec 32) (_ BitVec 64))) (size!15163 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30789)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19153 0))(
  ( (V!19154 (val!6828 Int)) )
))
(declare-datatypes ((ValueCell!6419 0))(
  ( (ValueCellFull!6419 (v!9110 V!19153)) (EmptyCell!6419) )
))
(declare-datatypes ((array!30791 0))(
  ( (array!30792 (arr!14805 (Array (_ BitVec 32) ValueCell!6419)) (size!15164 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30791)

(assert (=> b!478169 (= res!285319 (and (= (size!15164 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15163 _keys!1874) (size!15164 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478170 () Bool)

(declare-fun e!281123 () Bool)

(declare-fun tp_is_empty!13561 () Bool)

(assert (=> b!478170 (= e!281123 tp_is_empty!13561)))

(declare-fun b!478171 () Bool)

(declare-fun res!285320 () Bool)

(assert (=> b!478171 (=> (not res!285320) (not e!281125))))

(assert (=> b!478171 (= res!285320 (and (bvsle #b00000000000000000000000000000000 (size!15163 _keys!1874)) (bvslt (size!15163 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun b!478172 () Bool)

(declare-fun e!281122 () Bool)

(assert (=> b!478172 (= e!281122 tp_is_empty!13561)))

(declare-fun b!478173 () Bool)

(declare-fun e!281124 () Bool)

(assert (=> b!478173 (= e!281124 (and e!281123 mapRes!22030))))

(declare-fun condMapEmpty!22030 () Bool)

(declare-fun mapDefault!22030 () ValueCell!6419)

(assert (=> b!478173 (= condMapEmpty!22030 (= (arr!14805 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6419)) mapDefault!22030)))))

(declare-fun res!285321 () Bool)

(assert (=> start!43136 (=> (not res!285321) (not e!281125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43136 (= res!285321 (validMask!0 mask!2352))))

(assert (=> start!43136 e!281125))

(assert (=> start!43136 true))

(declare-fun array_inv!10768 (array!30791) Bool)

(assert (=> start!43136 (and (array_inv!10768 _values!1516) e!281124)))

(declare-fun array_inv!10769 (array!30789) Bool)

(assert (=> start!43136 (array_inv!10769 _keys!1874)))

(declare-fun mapNonEmpty!22030 () Bool)

(declare-fun tp!42505 () Bool)

(assert (=> mapNonEmpty!22030 (= mapRes!22030 (and tp!42505 e!281122))))

(declare-fun mapKey!22030 () (_ BitVec 32))

(declare-fun mapRest!22030 () (Array (_ BitVec 32) ValueCell!6419))

(declare-fun mapValue!22030 () ValueCell!6419)

(assert (=> mapNonEmpty!22030 (= (arr!14805 _values!1516) (store mapRest!22030 mapKey!22030 mapValue!22030))))

(declare-fun b!478174 () Bool)

(declare-datatypes ((List!9104 0))(
  ( (Nil!9101) (Cons!9100 (h!9956 (_ BitVec 64)) (t!15301 List!9104)) )
))
(declare-fun noDuplicate!208 (List!9104) Bool)

(assert (=> b!478174 (= e!281125 (not (noDuplicate!208 Nil!9101)))))

(declare-fun b!478175 () Bool)

(declare-fun res!285322 () Bool)

(assert (=> b!478175 (=> (not res!285322) (not e!281125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30789 (_ BitVec 32)) Bool)

(assert (=> b!478175 (= res!285322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43136 res!285321) b!478169))

(assert (= (and b!478169 res!285319) b!478175))

(assert (= (and b!478175 res!285322) b!478171))

(assert (= (and b!478171 res!285320) b!478174))

(assert (= (and b!478173 condMapEmpty!22030) mapIsEmpty!22030))

(assert (= (and b!478173 (not condMapEmpty!22030)) mapNonEmpty!22030))

(get-info :version)

(assert (= (and mapNonEmpty!22030 ((_ is ValueCellFull!6419) mapValue!22030)) b!478172))

(assert (= (and b!478173 ((_ is ValueCellFull!6419) mapDefault!22030)) b!478170))

(assert (= start!43136 b!478173))

(declare-fun m!459977 () Bool)

(assert (=> start!43136 m!459977))

(declare-fun m!459979 () Bool)

(assert (=> start!43136 m!459979))

(declare-fun m!459981 () Bool)

(assert (=> start!43136 m!459981))

(declare-fun m!459983 () Bool)

(assert (=> mapNonEmpty!22030 m!459983))

(declare-fun m!459985 () Bool)

(assert (=> b!478174 m!459985))

(declare-fun m!459987 () Bool)

(assert (=> b!478175 m!459987))

(check-sat (not b!478174) tp_is_empty!13561 (not mapNonEmpty!22030) (not b!478175) (not start!43136))
(check-sat)
(get-model)

(declare-fun d!76405 () Bool)

(declare-fun res!285351 () Bool)

(declare-fun e!281164 () Bool)

(assert (=> d!76405 (=> res!285351 e!281164)))

(assert (=> d!76405 (= res!285351 (bvsge #b00000000000000000000000000000000 (size!15163 _keys!1874)))))

(assert (=> d!76405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281164)))

(declare-fun b!478226 () Bool)

(declare-fun e!281162 () Bool)

(assert (=> b!478226 (= e!281164 e!281162)))

(declare-fun c!57596 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478226 (= c!57596 (validKeyInArray!0 (select (arr!14804 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30810 () Bool)

(declare-fun call!30813 () Bool)

(assert (=> bm!30810 (= call!30813 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478227 () Bool)

(declare-fun e!281163 () Bool)

(assert (=> b!478227 (= e!281163 call!30813)))

(declare-fun b!478228 () Bool)

(assert (=> b!478228 (= e!281162 call!30813)))

(declare-fun b!478229 () Bool)

(assert (=> b!478229 (= e!281162 e!281163)))

(declare-fun lt!217493 () (_ BitVec 64))

(assert (=> b!478229 (= lt!217493 (select (arr!14804 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14042 0))(
  ( (Unit!14043) )
))
(declare-fun lt!217492 () Unit!14042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30789 (_ BitVec 64) (_ BitVec 32)) Unit!14042)

(assert (=> b!478229 (= lt!217492 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217493 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478229 (arrayContainsKey!0 _keys!1874 lt!217493 #b00000000000000000000000000000000)))

(declare-fun lt!217494 () Unit!14042)

(assert (=> b!478229 (= lt!217494 lt!217492)))

(declare-fun res!285352 () Bool)

(declare-datatypes ((SeekEntryResult!3560 0))(
  ( (MissingZero!3560 (index!16419 (_ BitVec 32))) (Found!3560 (index!16420 (_ BitVec 32))) (Intermediate!3560 (undefined!4372 Bool) (index!16421 (_ BitVec 32)) (x!44895 (_ BitVec 32))) (Undefined!3560) (MissingVacant!3560 (index!16422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30789 (_ BitVec 32)) SeekEntryResult!3560)

(assert (=> b!478229 (= res!285352 (= (seekEntryOrOpen!0 (select (arr!14804 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3560 #b00000000000000000000000000000000)))))

(assert (=> b!478229 (=> (not res!285352) (not e!281163))))

(assert (= (and d!76405 (not res!285351)) b!478226))

(assert (= (and b!478226 c!57596) b!478229))

(assert (= (and b!478226 (not c!57596)) b!478228))

(assert (= (and b!478229 res!285352) b!478227))

(assert (= (or b!478227 b!478228) bm!30810))

(declare-fun m!460013 () Bool)

(assert (=> b!478226 m!460013))

(assert (=> b!478226 m!460013))

(declare-fun m!460015 () Bool)

(assert (=> b!478226 m!460015))

(declare-fun m!460017 () Bool)

(assert (=> bm!30810 m!460017))

(assert (=> b!478229 m!460013))

(declare-fun m!460019 () Bool)

(assert (=> b!478229 m!460019))

(declare-fun m!460021 () Bool)

(assert (=> b!478229 m!460021))

(assert (=> b!478229 m!460013))

(declare-fun m!460023 () Bool)

(assert (=> b!478229 m!460023))

(assert (=> b!478175 d!76405))

(declare-fun d!76407 () Bool)

(declare-fun res!285357 () Bool)

(declare-fun e!281169 () Bool)

(assert (=> d!76407 (=> res!285357 e!281169)))

(assert (=> d!76407 (= res!285357 ((_ is Nil!9101) Nil!9101))))

(assert (=> d!76407 (= (noDuplicate!208 Nil!9101) e!281169)))

(declare-fun b!478234 () Bool)

(declare-fun e!281170 () Bool)

(assert (=> b!478234 (= e!281169 e!281170)))

(declare-fun res!285358 () Bool)

(assert (=> b!478234 (=> (not res!285358) (not e!281170))))

(declare-fun contains!2571 (List!9104 (_ BitVec 64)) Bool)

(assert (=> b!478234 (= res!285358 (not (contains!2571 (t!15301 Nil!9101) (h!9956 Nil!9101))))))

(declare-fun b!478235 () Bool)

(assert (=> b!478235 (= e!281170 (noDuplicate!208 (t!15301 Nil!9101)))))

(assert (= (and d!76407 (not res!285357)) b!478234))

(assert (= (and b!478234 res!285358) b!478235))

(declare-fun m!460025 () Bool)

(assert (=> b!478234 m!460025))

(declare-fun m!460027 () Bool)

(assert (=> b!478235 m!460027))

(assert (=> b!478174 d!76407))

(declare-fun d!76409 () Bool)

(assert (=> d!76409 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43136 d!76409))

(declare-fun d!76411 () Bool)

(assert (=> d!76411 (= (array_inv!10768 _values!1516) (bvsge (size!15164 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43136 d!76411))

(declare-fun d!76413 () Bool)

(assert (=> d!76413 (= (array_inv!10769 _keys!1874) (bvsge (size!15163 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43136 d!76413))

(declare-fun mapIsEmpty!22039 () Bool)

(declare-fun mapRes!22039 () Bool)

(assert (=> mapIsEmpty!22039 mapRes!22039))

(declare-fun b!478243 () Bool)

(declare-fun e!281176 () Bool)

(assert (=> b!478243 (= e!281176 tp_is_empty!13561)))

(declare-fun condMapEmpty!22039 () Bool)

(declare-fun mapDefault!22039 () ValueCell!6419)

(assert (=> mapNonEmpty!22030 (= condMapEmpty!22039 (= mapRest!22030 ((as const (Array (_ BitVec 32) ValueCell!6419)) mapDefault!22039)))))

(assert (=> mapNonEmpty!22030 (= tp!42505 (and e!281176 mapRes!22039))))

(declare-fun mapNonEmpty!22039 () Bool)

(declare-fun tp!42514 () Bool)

(declare-fun e!281175 () Bool)

(assert (=> mapNonEmpty!22039 (= mapRes!22039 (and tp!42514 e!281175))))

(declare-fun mapValue!22039 () ValueCell!6419)

(declare-fun mapKey!22039 () (_ BitVec 32))

(declare-fun mapRest!22039 () (Array (_ BitVec 32) ValueCell!6419))

(assert (=> mapNonEmpty!22039 (= mapRest!22030 (store mapRest!22039 mapKey!22039 mapValue!22039))))

(declare-fun b!478242 () Bool)

(assert (=> b!478242 (= e!281175 tp_is_empty!13561)))

(assert (= (and mapNonEmpty!22030 condMapEmpty!22039) mapIsEmpty!22039))

(assert (= (and mapNonEmpty!22030 (not condMapEmpty!22039)) mapNonEmpty!22039))

(assert (= (and mapNonEmpty!22039 ((_ is ValueCellFull!6419) mapValue!22039)) b!478242))

(assert (= (and mapNonEmpty!22030 ((_ is ValueCellFull!6419) mapDefault!22039)) b!478243))

(declare-fun m!460029 () Bool)

(assert (=> mapNonEmpty!22039 m!460029))

(check-sat (not mapNonEmpty!22039) tp_is_empty!13561 (not bm!30810) (not b!478234) (not b!478226) (not b!478235) (not b!478229))
(check-sat)
