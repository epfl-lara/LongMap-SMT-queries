; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72222 () Bool)

(assert start!72222)

(declare-fun b!836939 () Bool)

(declare-fun res!569274 () Bool)

(declare-fun e!467053 () Bool)

(assert (=> b!836939 (=> (not res!569274) (not e!467053))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!46891 0))(
  ( (array!46892 (arr!22479 (Array (_ BitVec 32) (_ BitVec 64))) (size!22921 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46891)

(declare-datatypes ((V!25465 0))(
  ( (V!25466 (val!7704 Int)) )
))
(declare-datatypes ((ValueCell!7217 0))(
  ( (ValueCellFull!7217 (v!10122 V!25465)) (EmptyCell!7217) )
))
(declare-datatypes ((array!46893 0))(
  ( (array!46894 (arr!22480 (Array (_ BitVec 32) ValueCell!7217)) (size!22922 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46893)

(assert (=> b!836939 (= res!569274 (and (= (size!22922 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22921 _keys!868) (size!22922 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!836940 () Bool)

(declare-datatypes ((List!16020 0))(
  ( (Nil!16017) (Cons!16016 (h!17147 (_ BitVec 64)) (t!22382 List!16020)) )
))
(declare-fun noDuplicate!1301 (List!16020) Bool)

(assert (=> b!836940 (= e!467053 (not (noDuplicate!1301 Nil!16017)))))

(declare-fun b!836941 () Bool)

(declare-fun res!569276 () Bool)

(assert (=> b!836941 (=> (not res!569276) (not e!467053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836941 (= res!569276 (validMask!0 mask!1196))))

(declare-fun b!836942 () Bool)

(declare-fun res!569278 () Bool)

(assert (=> b!836942 (=> (not res!569278) (not e!467053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46891 (_ BitVec 32)) Bool)

(assert (=> b!836942 (= res!569278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24563 () Bool)

(declare-fun mapRes!24563 () Bool)

(assert (=> mapIsEmpty!24563 mapRes!24563))

(declare-fun res!569277 () Bool)

(assert (=> start!72222 (=> (not res!569277) (not e!467053))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72222 (= res!569277 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22921 _keys!868))))))

(assert (=> start!72222 e!467053))

(assert (=> start!72222 true))

(declare-fun array_inv!17984 (array!46891) Bool)

(assert (=> start!72222 (array_inv!17984 _keys!868)))

(declare-fun e!467055 () Bool)

(declare-fun array_inv!17985 (array!46893) Bool)

(assert (=> start!72222 (and (array_inv!17985 _values!688) e!467055)))

(declare-fun b!836943 () Bool)

(declare-fun e!467054 () Bool)

(declare-fun tp_is_empty!15313 () Bool)

(assert (=> b!836943 (= e!467054 tp_is_empty!15313)))

(declare-fun b!836944 () Bool)

(declare-fun e!467056 () Bool)

(assert (=> b!836944 (= e!467056 tp_is_empty!15313)))

(declare-fun b!836945 () Bool)

(declare-fun res!569275 () Bool)

(assert (=> b!836945 (=> (not res!569275) (not e!467053))))

(assert (=> b!836945 (= res!569275 (and (bvsle #b00000000000000000000000000000000 (size!22921 _keys!868)) (bvslt (size!22921 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!24563 () Bool)

(declare-fun tp!47558 () Bool)

(assert (=> mapNonEmpty!24563 (= mapRes!24563 (and tp!47558 e!467056))))

(declare-fun mapRest!24563 () (Array (_ BitVec 32) ValueCell!7217))

(declare-fun mapKey!24563 () (_ BitVec 32))

(declare-fun mapValue!24563 () ValueCell!7217)

(assert (=> mapNonEmpty!24563 (= (arr!22480 _values!688) (store mapRest!24563 mapKey!24563 mapValue!24563))))

(declare-fun b!836946 () Bool)

(assert (=> b!836946 (= e!467055 (and e!467054 mapRes!24563))))

(declare-fun condMapEmpty!24563 () Bool)

(declare-fun mapDefault!24563 () ValueCell!7217)

(assert (=> b!836946 (= condMapEmpty!24563 (= (arr!22480 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7217)) mapDefault!24563)))))

(assert (= (and start!72222 res!569277) b!836941))

(assert (= (and b!836941 res!569276) b!836939))

(assert (= (and b!836939 res!569274) b!836942))

(assert (= (and b!836942 res!569278) b!836945))

(assert (= (and b!836945 res!569275) b!836940))

(assert (= (and b!836946 condMapEmpty!24563) mapIsEmpty!24563))

(assert (= (and b!836946 (not condMapEmpty!24563)) mapNonEmpty!24563))

(get-info :version)

(assert (= (and mapNonEmpty!24563 ((_ is ValueCellFull!7217) mapValue!24563)) b!836944))

(assert (= (and b!836946 ((_ is ValueCellFull!7217) mapDefault!24563)) b!836943))

(assert (= start!72222 b!836946))

(declare-fun m!781381 () Bool)

(assert (=> start!72222 m!781381))

(declare-fun m!781383 () Bool)

(assert (=> start!72222 m!781383))

(declare-fun m!781385 () Bool)

(assert (=> b!836942 m!781385))

(declare-fun m!781387 () Bool)

(assert (=> mapNonEmpty!24563 m!781387))

(declare-fun m!781389 () Bool)

(assert (=> b!836940 m!781389))

(declare-fun m!781391 () Bool)

(assert (=> b!836941 m!781391))

(check-sat (not start!72222) (not b!836940) (not b!836942) tp_is_empty!15313 (not b!836941) (not mapNonEmpty!24563))
(check-sat)
(get-model)

(declare-fun d!107613 () Bool)

(assert (=> d!107613 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!836941 d!107613))

(declare-fun bm!36789 () Bool)

(declare-fun call!36792 () Bool)

(assert (=> bm!36789 (= call!36792 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!837003 () Bool)

(declare-fun e!467095 () Bool)

(assert (=> b!837003 (= e!467095 call!36792)))

(declare-fun b!837004 () Bool)

(declare-fun e!467093 () Bool)

(assert (=> b!837004 (= e!467093 e!467095)))

(declare-fun c!91085 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!837004 (= c!91085 (validKeyInArray!0 (select (arr!22479 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!837005 () Bool)

(declare-fun e!467094 () Bool)

(assert (=> b!837005 (= e!467095 e!467094)))

(declare-fun lt!380302 () (_ BitVec 64))

(assert (=> b!837005 (= lt!380302 (select (arr!22479 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28729 0))(
  ( (Unit!28730) )
))
(declare-fun lt!380300 () Unit!28729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46891 (_ BitVec 64) (_ BitVec 32)) Unit!28729)

(assert (=> b!837005 (= lt!380300 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380302 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!837005 (arrayContainsKey!0 _keys!868 lt!380302 #b00000000000000000000000000000000)))

(declare-fun lt!380301 () Unit!28729)

(assert (=> b!837005 (= lt!380301 lt!380300)))

(declare-fun res!569314 () Bool)

(declare-datatypes ((SeekEntryResult!8743 0))(
  ( (MissingZero!8743 (index!37343 (_ BitVec 32))) (Found!8743 (index!37344 (_ BitVec 32))) (Intermediate!8743 (undefined!9555 Bool) (index!37345 (_ BitVec 32)) (x!70713 (_ BitVec 32))) (Undefined!8743) (MissingVacant!8743 (index!37346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46891 (_ BitVec 32)) SeekEntryResult!8743)

(assert (=> b!837005 (= res!569314 (= (seekEntryOrOpen!0 (select (arr!22479 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8743 #b00000000000000000000000000000000)))))

(assert (=> b!837005 (=> (not res!569314) (not e!467094))))

(declare-fun b!837006 () Bool)

(assert (=> b!837006 (= e!467094 call!36792)))

(declare-fun d!107615 () Bool)

(declare-fun res!569313 () Bool)

(assert (=> d!107615 (=> res!569313 e!467093)))

(assert (=> d!107615 (= res!569313 (bvsge #b00000000000000000000000000000000 (size!22921 _keys!868)))))

(assert (=> d!107615 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467093)))

(assert (= (and d!107615 (not res!569313)) b!837004))

(assert (= (and b!837004 c!91085) b!837005))

(assert (= (and b!837004 (not c!91085)) b!837003))

(assert (= (and b!837005 res!569314) b!837006))

(assert (= (or b!837006 b!837003) bm!36789))

(declare-fun m!781417 () Bool)

(assert (=> bm!36789 m!781417))

(declare-fun m!781419 () Bool)

(assert (=> b!837004 m!781419))

(assert (=> b!837004 m!781419))

(declare-fun m!781421 () Bool)

(assert (=> b!837004 m!781421))

(assert (=> b!837005 m!781419))

(declare-fun m!781423 () Bool)

(assert (=> b!837005 m!781423))

(declare-fun m!781425 () Bool)

(assert (=> b!837005 m!781425))

(assert (=> b!837005 m!781419))

(declare-fun m!781427 () Bool)

(assert (=> b!837005 m!781427))

(assert (=> b!836942 d!107615))

(declare-fun d!107617 () Bool)

(assert (=> d!107617 (= (array_inv!17984 _keys!868) (bvsge (size!22921 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72222 d!107617))

(declare-fun d!107619 () Bool)

(assert (=> d!107619 (= (array_inv!17985 _values!688) (bvsge (size!22922 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72222 d!107619))

(declare-fun d!107621 () Bool)

(declare-fun res!569319 () Bool)

(declare-fun e!467100 () Bool)

(assert (=> d!107621 (=> res!569319 e!467100)))

(assert (=> d!107621 (= res!569319 ((_ is Nil!16017) Nil!16017))))

(assert (=> d!107621 (= (noDuplicate!1301 Nil!16017) e!467100)))

(declare-fun b!837011 () Bool)

(declare-fun e!467101 () Bool)

(assert (=> b!837011 (= e!467100 e!467101)))

(declare-fun res!569320 () Bool)

(assert (=> b!837011 (=> (not res!569320) (not e!467101))))

(declare-fun contains!4193 (List!16020 (_ BitVec 64)) Bool)

(assert (=> b!837011 (= res!569320 (not (contains!4193 (t!22382 Nil!16017) (h!17147 Nil!16017))))))

(declare-fun b!837012 () Bool)

(assert (=> b!837012 (= e!467101 (noDuplicate!1301 (t!22382 Nil!16017)))))

(assert (= (and d!107621 (not res!569319)) b!837011))

(assert (= (and b!837011 res!569320) b!837012))

(declare-fun m!781429 () Bool)

(assert (=> b!837011 m!781429))

(declare-fun m!781431 () Bool)

(assert (=> b!837012 m!781431))

(assert (=> b!836940 d!107621))

(declare-fun b!837020 () Bool)

(declare-fun e!467106 () Bool)

(assert (=> b!837020 (= e!467106 tp_is_empty!15313)))

(declare-fun condMapEmpty!24572 () Bool)

(declare-fun mapDefault!24572 () ValueCell!7217)

(assert (=> mapNonEmpty!24563 (= condMapEmpty!24572 (= mapRest!24563 ((as const (Array (_ BitVec 32) ValueCell!7217)) mapDefault!24572)))))

(declare-fun mapRes!24572 () Bool)

(assert (=> mapNonEmpty!24563 (= tp!47558 (and e!467106 mapRes!24572))))

(declare-fun mapIsEmpty!24572 () Bool)

(assert (=> mapIsEmpty!24572 mapRes!24572))

(declare-fun mapNonEmpty!24572 () Bool)

(declare-fun tp!47567 () Bool)

(declare-fun e!467107 () Bool)

(assert (=> mapNonEmpty!24572 (= mapRes!24572 (and tp!47567 e!467107))))

(declare-fun mapKey!24572 () (_ BitVec 32))

(declare-fun mapRest!24572 () (Array (_ BitVec 32) ValueCell!7217))

(declare-fun mapValue!24572 () ValueCell!7217)

(assert (=> mapNonEmpty!24572 (= mapRest!24563 (store mapRest!24572 mapKey!24572 mapValue!24572))))

(declare-fun b!837019 () Bool)

(assert (=> b!837019 (= e!467107 tp_is_empty!15313)))

(assert (= (and mapNonEmpty!24563 condMapEmpty!24572) mapIsEmpty!24572))

(assert (= (and mapNonEmpty!24563 (not condMapEmpty!24572)) mapNonEmpty!24572))

(assert (= (and mapNonEmpty!24572 ((_ is ValueCellFull!7217) mapValue!24572)) b!837019))

(assert (= (and mapNonEmpty!24563 ((_ is ValueCellFull!7217) mapDefault!24572)) b!837020))

(declare-fun m!781433 () Bool)

(assert (=> mapNonEmpty!24572 m!781433))

(check-sat (not b!837012) (not bm!36789) (not b!837004) (not b!837005) tp_is_empty!15313 (not mapNonEmpty!24572) (not b!837011))
(check-sat)
