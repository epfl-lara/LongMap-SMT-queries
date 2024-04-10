; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72242 () Bool)

(assert start!72242)

(declare-fun mapIsEmpty!24566 () Bool)

(declare-fun mapRes!24566 () Bool)

(assert (=> mapIsEmpty!24566 mapRes!24566))

(declare-fun b!837202 () Bool)

(declare-fun e!467219 () Bool)

(declare-fun e!467217 () Bool)

(assert (=> b!837202 (= e!467219 (and e!467217 mapRes!24566))))

(declare-fun condMapEmpty!24566 () Bool)

(declare-datatypes ((V!25467 0))(
  ( (V!25468 (val!7705 Int)) )
))
(declare-datatypes ((ValueCell!7218 0))(
  ( (ValueCellFull!7218 (v!10129 V!25467)) (EmptyCell!7218) )
))
(declare-datatypes ((array!46930 0))(
  ( (array!46931 (arr!22498 (Array (_ BitVec 32) ValueCell!7218)) (size!22938 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46930)

(declare-fun mapDefault!24566 () ValueCell!7218)

(assert (=> b!837202 (= condMapEmpty!24566 (= (arr!22498 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7218)) mapDefault!24566)))))

(declare-fun mapNonEmpty!24566 () Bool)

(declare-fun tp!47560 () Bool)

(declare-fun e!467218 () Bool)

(assert (=> mapNonEmpty!24566 (= mapRes!24566 (and tp!47560 e!467218))))

(declare-fun mapRest!24566 () (Array (_ BitVec 32) ValueCell!7218))

(declare-fun mapValue!24566 () ValueCell!7218)

(declare-fun mapKey!24566 () (_ BitVec 32))

(assert (=> mapNonEmpty!24566 (= (arr!22498 _values!688) (store mapRest!24566 mapKey!24566 mapValue!24566))))

(declare-fun b!837203 () Bool)

(declare-fun e!467216 () Bool)

(declare-datatypes ((List!16021 0))(
  ( (Nil!16018) (Cons!16017 (h!17148 (_ BitVec 64)) (t!22392 List!16021)) )
))
(declare-fun noDuplicate!1295 (List!16021) Bool)

(assert (=> b!837203 (= e!467216 (not (noDuplicate!1295 Nil!16018)))))

(declare-fun b!837204 () Bool)

(declare-fun res!569403 () Bool)

(assert (=> b!837204 (=> (not res!569403) (not e!467216))))

(declare-datatypes ((array!46932 0))(
  ( (array!46933 (arr!22499 (Array (_ BitVec 32) (_ BitVec 64))) (size!22939 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46932)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46932 (_ BitVec 32)) Bool)

(assert (=> b!837204 (= res!569403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837205 () Bool)

(declare-fun res!569399 () Bool)

(assert (=> b!837205 (=> (not res!569399) (not e!467216))))

(assert (=> b!837205 (= res!569399 (and (bvsle #b00000000000000000000000000000000 (size!22939 _keys!868)) (bvslt (size!22939 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun res!569401 () Bool)

(assert (=> start!72242 (=> (not res!569401) (not e!467216))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72242 (= res!569401 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22939 _keys!868))))))

(assert (=> start!72242 e!467216))

(assert (=> start!72242 true))

(declare-fun array_inv!17936 (array!46932) Bool)

(assert (=> start!72242 (array_inv!17936 _keys!868)))

(declare-fun array_inv!17937 (array!46930) Bool)

(assert (=> start!72242 (and (array_inv!17937 _values!688) e!467219)))

(declare-fun b!837206 () Bool)

(declare-fun tp_is_empty!15315 () Bool)

(assert (=> b!837206 (= e!467218 tp_is_empty!15315)))

(declare-fun b!837207 () Bool)

(declare-fun res!569402 () Bool)

(assert (=> b!837207 (=> (not res!569402) (not e!467216))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837207 (= res!569402 (and (= (size!22938 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22939 _keys!868) (size!22938 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837208 () Bool)

(assert (=> b!837208 (= e!467217 tp_is_empty!15315)))

(declare-fun b!837209 () Bool)

(declare-fun res!569400 () Bool)

(assert (=> b!837209 (=> (not res!569400) (not e!467216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837209 (= res!569400 (validMask!0 mask!1196))))

(assert (= (and start!72242 res!569401) b!837209))

(assert (= (and b!837209 res!569400) b!837207))

(assert (= (and b!837207 res!569402) b!837204))

(assert (= (and b!837204 res!569403) b!837205))

(assert (= (and b!837205 res!569399) b!837203))

(assert (= (and b!837202 condMapEmpty!24566) mapIsEmpty!24566))

(assert (= (and b!837202 (not condMapEmpty!24566)) mapNonEmpty!24566))

(get-info :version)

(assert (= (and mapNonEmpty!24566 ((_ is ValueCellFull!7218) mapValue!24566)) b!837206))

(assert (= (and b!837202 ((_ is ValueCellFull!7218) mapDefault!24566)) b!837208))

(assert (= start!72242 b!837202))

(declare-fun m!782147 () Bool)

(assert (=> mapNonEmpty!24566 m!782147))

(declare-fun m!782149 () Bool)

(assert (=> b!837203 m!782149))

(declare-fun m!782151 () Bool)

(assert (=> b!837209 m!782151))

(declare-fun m!782153 () Bool)

(assert (=> b!837204 m!782153))

(declare-fun m!782155 () Bool)

(assert (=> start!72242 m!782155))

(declare-fun m!782157 () Bool)

(assert (=> start!72242 m!782157))

(check-sat (not b!837204) (not b!837203) (not b!837209) (not mapNonEmpty!24566) tp_is_empty!15315 (not start!72242))
(check-sat)
(get-model)

(declare-fun d!107811 () Bool)

(assert (=> d!107811 (= (array_inv!17936 _keys!868) (bvsge (size!22939 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72242 d!107811))

(declare-fun d!107813 () Bool)

(assert (=> d!107813 (= (array_inv!17937 _values!688) (bvsge (size!22938 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72242 d!107813))

(declare-fun d!107815 () Bool)

(declare-fun res!569424 () Bool)

(declare-fun e!467243 () Bool)

(assert (=> d!107815 (=> res!569424 e!467243)))

(assert (=> d!107815 (= res!569424 (bvsge #b00000000000000000000000000000000 (size!22939 _keys!868)))))

(assert (=> d!107815 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467243)))

(declare-fun b!837242 () Bool)

(declare-fun e!467242 () Bool)

(assert (=> b!837242 (= e!467243 e!467242)))

(declare-fun c!91150 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!837242 (= c!91150 (validKeyInArray!0 (select (arr!22499 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!837243 () Bool)

(declare-fun e!467241 () Bool)

(declare-fun call!36818 () Bool)

(assert (=> b!837243 (= e!467241 call!36818)))

(declare-fun bm!36815 () Bool)

(assert (=> bm!36815 (= call!36818 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!837244 () Bool)

(assert (=> b!837244 (= e!467242 call!36818)))

(declare-fun b!837245 () Bool)

(assert (=> b!837245 (= e!467242 e!467241)))

(declare-fun lt!380538 () (_ BitVec 64))

(assert (=> b!837245 (= lt!380538 (select (arr!22499 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28781 0))(
  ( (Unit!28782) )
))
(declare-fun lt!380536 () Unit!28781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46932 (_ BitVec 64) (_ BitVec 32)) Unit!28781)

(assert (=> b!837245 (= lt!380536 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380538 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!837245 (arrayContainsKey!0 _keys!868 lt!380538 #b00000000000000000000000000000000)))

(declare-fun lt!380537 () Unit!28781)

(assert (=> b!837245 (= lt!380537 lt!380536)))

(declare-fun res!569423 () Bool)

(declare-datatypes ((SeekEntryResult!8747 0))(
  ( (MissingZero!8747 (index!37359 (_ BitVec 32))) (Found!8747 (index!37360 (_ BitVec 32))) (Intermediate!8747 (undefined!9559 Bool) (index!37361 (_ BitVec 32)) (x!70722 (_ BitVec 32))) (Undefined!8747) (MissingVacant!8747 (index!37362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46932 (_ BitVec 32)) SeekEntryResult!8747)

(assert (=> b!837245 (= res!569423 (= (seekEntryOrOpen!0 (select (arr!22499 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8747 #b00000000000000000000000000000000)))))

(assert (=> b!837245 (=> (not res!569423) (not e!467241))))

(assert (= (and d!107815 (not res!569424)) b!837242))

(assert (= (and b!837242 c!91150) b!837245))

(assert (= (and b!837242 (not c!91150)) b!837244))

(assert (= (and b!837245 res!569423) b!837243))

(assert (= (or b!837243 b!837244) bm!36815))

(declare-fun m!782171 () Bool)

(assert (=> b!837242 m!782171))

(assert (=> b!837242 m!782171))

(declare-fun m!782173 () Bool)

(assert (=> b!837242 m!782173))

(declare-fun m!782175 () Bool)

(assert (=> bm!36815 m!782175))

(assert (=> b!837245 m!782171))

(declare-fun m!782177 () Bool)

(assert (=> b!837245 m!782177))

(declare-fun m!782179 () Bool)

(assert (=> b!837245 m!782179))

(assert (=> b!837245 m!782171))

(declare-fun m!782181 () Bool)

(assert (=> b!837245 m!782181))

(assert (=> b!837204 d!107815))

(declare-fun d!107817 () Bool)

(assert (=> d!107817 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!837209 d!107817))

(declare-fun d!107819 () Bool)

(declare-fun res!569429 () Bool)

(declare-fun e!467248 () Bool)

(assert (=> d!107819 (=> res!569429 e!467248)))

(assert (=> d!107819 (= res!569429 ((_ is Nil!16018) Nil!16018))))

(assert (=> d!107819 (= (noDuplicate!1295 Nil!16018) e!467248)))

(declare-fun b!837250 () Bool)

(declare-fun e!467249 () Bool)

(assert (=> b!837250 (= e!467248 e!467249)))

(declare-fun res!569430 () Bool)

(assert (=> b!837250 (=> (not res!569430) (not e!467249))))

(declare-fun contains!4214 (List!16021 (_ BitVec 64)) Bool)

(assert (=> b!837250 (= res!569430 (not (contains!4214 (t!22392 Nil!16018) (h!17148 Nil!16018))))))

(declare-fun b!837251 () Bool)

(assert (=> b!837251 (= e!467249 (noDuplicate!1295 (t!22392 Nil!16018)))))

(assert (= (and d!107819 (not res!569429)) b!837250))

(assert (= (and b!837250 res!569430) b!837251))

(declare-fun m!782183 () Bool)

(assert (=> b!837250 m!782183))

(declare-fun m!782185 () Bool)

(assert (=> b!837251 m!782185))

(assert (=> b!837203 d!107819))

(declare-fun condMapEmpty!24572 () Bool)

(declare-fun mapDefault!24572 () ValueCell!7218)

(assert (=> mapNonEmpty!24566 (= condMapEmpty!24572 (= mapRest!24566 ((as const (Array (_ BitVec 32) ValueCell!7218)) mapDefault!24572)))))

(declare-fun e!467255 () Bool)

(declare-fun mapRes!24572 () Bool)

(assert (=> mapNonEmpty!24566 (= tp!47560 (and e!467255 mapRes!24572))))

(declare-fun mapNonEmpty!24572 () Bool)

(declare-fun tp!47566 () Bool)

(declare-fun e!467254 () Bool)

(assert (=> mapNonEmpty!24572 (= mapRes!24572 (and tp!47566 e!467254))))

(declare-fun mapKey!24572 () (_ BitVec 32))

(declare-fun mapRest!24572 () (Array (_ BitVec 32) ValueCell!7218))

(declare-fun mapValue!24572 () ValueCell!7218)

(assert (=> mapNonEmpty!24572 (= mapRest!24566 (store mapRest!24572 mapKey!24572 mapValue!24572))))

(declare-fun mapIsEmpty!24572 () Bool)

(assert (=> mapIsEmpty!24572 mapRes!24572))

(declare-fun b!837259 () Bool)

(assert (=> b!837259 (= e!467255 tp_is_empty!15315)))

(declare-fun b!837258 () Bool)

(assert (=> b!837258 (= e!467254 tp_is_empty!15315)))

(assert (= (and mapNonEmpty!24566 condMapEmpty!24572) mapIsEmpty!24572))

(assert (= (and mapNonEmpty!24566 (not condMapEmpty!24572)) mapNonEmpty!24572))

(assert (= (and mapNonEmpty!24572 ((_ is ValueCellFull!7218) mapValue!24572)) b!837258))

(assert (= (and mapNonEmpty!24566 ((_ is ValueCellFull!7218) mapDefault!24572)) b!837259))

(declare-fun m!782187 () Bool)

(assert (=> mapNonEmpty!24572 m!782187))

(check-sat (not bm!36815) (not b!837251) (not b!837250) (not b!837242) (not mapNonEmpty!24572) tp_is_empty!15315 (not b!837245))
(check-sat)
