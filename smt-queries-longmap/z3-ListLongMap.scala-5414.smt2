; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72238 () Bool)

(assert start!72238)

(declare-fun b!837041 () Bool)

(declare-fun res!569335 () Bool)

(declare-fun e!467124 () Bool)

(assert (=> b!837041 (=> (not res!569335) (not e!467124))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837041 (= res!569335 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24575 () Bool)

(declare-fun mapRes!24575 () Bool)

(assert (=> mapIsEmpty!24575 mapRes!24575))

(declare-fun b!837042 () Bool)

(declare-fun res!569338 () Bool)

(assert (=> b!837042 (=> (not res!569338) (not e!467124))))

(declare-datatypes ((array!46905 0))(
  ( (array!46906 (arr!22485 (Array (_ BitVec 32) (_ BitVec 64))) (size!22927 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46905)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46905 (_ BitVec 32)) Bool)

(assert (=> b!837042 (= res!569338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837043 () Bool)

(declare-fun e!467122 () Bool)

(declare-fun e!467120 () Bool)

(assert (=> b!837043 (= e!467122 (and e!467120 mapRes!24575))))

(declare-fun condMapEmpty!24575 () Bool)

(declare-datatypes ((V!25473 0))(
  ( (V!25474 (val!7707 Int)) )
))
(declare-datatypes ((ValueCell!7220 0))(
  ( (ValueCellFull!7220 (v!10125 V!25473)) (EmptyCell!7220) )
))
(declare-datatypes ((array!46907 0))(
  ( (array!46908 (arr!22486 (Array (_ BitVec 32) ValueCell!7220)) (size!22928 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46907)

(declare-fun mapDefault!24575 () ValueCell!7220)

(assert (=> b!837043 (= condMapEmpty!24575 (= (arr!22486 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7220)) mapDefault!24575)))))

(declare-fun res!569339 () Bool)

(assert (=> start!72238 (=> (not res!569339) (not e!467124))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72238 (= res!569339 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22927 _keys!868))))))

(assert (=> start!72238 e!467124))

(assert (=> start!72238 true))

(declare-fun array_inv!17988 (array!46905) Bool)

(assert (=> start!72238 (array_inv!17988 _keys!868)))

(declare-fun array_inv!17989 (array!46907) Bool)

(assert (=> start!72238 (and (array_inv!17989 _values!688) e!467122)))

(declare-fun b!837044 () Bool)

(declare-fun res!569336 () Bool)

(assert (=> b!837044 (=> (not res!569336) (not e!467124))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837044 (= res!569336 (and (= (size!22928 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22927 _keys!868) (size!22928 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837045 () Bool)

(declare-fun e!467121 () Bool)

(assert (=> b!837045 (= e!467124 e!467121)))

(declare-fun res!569340 () Bool)

(assert (=> b!837045 (=> res!569340 e!467121)))

(declare-datatypes ((List!16023 0))(
  ( (Nil!16020) (Cons!16019 (h!17150 (_ BitVec 64)) (t!22385 List!16023)) )
))
(declare-fun contains!4194 (List!16023 (_ BitVec 64)) Bool)

(assert (=> b!837045 (= res!569340 (contains!4194 Nil!16020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!837046 () Bool)

(assert (=> b!837046 (= e!467121 (contains!4194 Nil!16020 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!837047 () Bool)

(declare-fun res!569337 () Bool)

(assert (=> b!837047 (=> (not res!569337) (not e!467124))))

(declare-fun noDuplicate!1304 (List!16023) Bool)

(assert (=> b!837047 (= res!569337 (noDuplicate!1304 Nil!16020))))

(declare-fun mapNonEmpty!24575 () Bool)

(declare-fun tp!47570 () Bool)

(declare-fun e!467123 () Bool)

(assert (=> mapNonEmpty!24575 (= mapRes!24575 (and tp!47570 e!467123))))

(declare-fun mapValue!24575 () ValueCell!7220)

(declare-fun mapRest!24575 () (Array (_ BitVec 32) ValueCell!7220))

(declare-fun mapKey!24575 () (_ BitVec 32))

(assert (=> mapNonEmpty!24575 (= (arr!22486 _values!688) (store mapRest!24575 mapKey!24575 mapValue!24575))))

(declare-fun b!837048 () Bool)

(declare-fun tp_is_empty!15319 () Bool)

(assert (=> b!837048 (= e!467120 tp_is_empty!15319)))

(declare-fun b!837049 () Bool)

(assert (=> b!837049 (= e!467123 tp_is_empty!15319)))

(declare-fun b!837050 () Bool)

(declare-fun res!569341 () Bool)

(assert (=> b!837050 (=> (not res!569341) (not e!467124))))

(assert (=> b!837050 (= res!569341 (and (bvsle #b00000000000000000000000000000000 (size!22927 _keys!868)) (bvslt (size!22927 _keys!868) #b01111111111111111111111111111111)))))

(assert (= (and start!72238 res!569339) b!837041))

(assert (= (and b!837041 res!569335) b!837044))

(assert (= (and b!837044 res!569336) b!837042))

(assert (= (and b!837042 res!569338) b!837050))

(assert (= (and b!837050 res!569341) b!837047))

(assert (= (and b!837047 res!569337) b!837045))

(assert (= (and b!837045 (not res!569340)) b!837046))

(assert (= (and b!837043 condMapEmpty!24575) mapIsEmpty!24575))

(assert (= (and b!837043 (not condMapEmpty!24575)) mapNonEmpty!24575))

(get-info :version)

(assert (= (and mapNonEmpty!24575 ((_ is ValueCellFull!7220) mapValue!24575)) b!837049))

(assert (= (and b!837043 ((_ is ValueCellFull!7220) mapDefault!24575)) b!837048))

(assert (= start!72238 b!837043))

(declare-fun m!781435 () Bool)

(assert (=> b!837042 m!781435))

(declare-fun m!781437 () Bool)

(assert (=> b!837045 m!781437))

(declare-fun m!781439 () Bool)

(assert (=> start!72238 m!781439))

(declare-fun m!781441 () Bool)

(assert (=> start!72238 m!781441))

(declare-fun m!781443 () Bool)

(assert (=> b!837041 m!781443))

(declare-fun m!781445 () Bool)

(assert (=> b!837046 m!781445))

(declare-fun m!781447 () Bool)

(assert (=> mapNonEmpty!24575 m!781447))

(declare-fun m!781449 () Bool)

(assert (=> b!837047 m!781449))

(check-sat (not mapNonEmpty!24575) (not b!837046) tp_is_empty!15319 (not b!837041) (not b!837047) (not b!837045) (not start!72238) (not b!837042))
(check-sat)
(get-model)

(declare-fun bm!36792 () Bool)

(declare-fun call!36795 () Bool)

(assert (=> bm!36792 (= call!36795 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!837119 () Bool)

(declare-fun e!467169 () Bool)

(declare-fun e!467168 () Bool)

(assert (=> b!837119 (= e!467169 e!467168)))

(declare-fun lt!380311 () (_ BitVec 64))

(assert (=> b!837119 (= lt!380311 (select (arr!22485 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28731 0))(
  ( (Unit!28732) )
))
(declare-fun lt!380310 () Unit!28731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46905 (_ BitVec 64) (_ BitVec 32)) Unit!28731)

(assert (=> b!837119 (= lt!380310 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380311 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!837119 (arrayContainsKey!0 _keys!868 lt!380311 #b00000000000000000000000000000000)))

(declare-fun lt!380309 () Unit!28731)

(assert (=> b!837119 (= lt!380309 lt!380310)))

(declare-fun res!569388 () Bool)

(declare-datatypes ((SeekEntryResult!8744 0))(
  ( (MissingZero!8744 (index!37347 (_ BitVec 32))) (Found!8744 (index!37348 (_ BitVec 32))) (Intermediate!8744 (undefined!9556 Bool) (index!37349 (_ BitVec 32)) (x!70724 (_ BitVec 32))) (Undefined!8744) (MissingVacant!8744 (index!37350 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46905 (_ BitVec 32)) SeekEntryResult!8744)

(assert (=> b!837119 (= res!569388 (= (seekEntryOrOpen!0 (select (arr!22485 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8744 #b00000000000000000000000000000000)))))

(assert (=> b!837119 (=> (not res!569388) (not e!467168))))

(declare-fun d!107625 () Bool)

(declare-fun res!569389 () Bool)

(declare-fun e!467170 () Bool)

(assert (=> d!107625 (=> res!569389 e!467170)))

(assert (=> d!107625 (= res!569389 (bvsge #b00000000000000000000000000000000 (size!22927 _keys!868)))))

(assert (=> d!107625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467170)))

(declare-fun b!837120 () Bool)

(assert (=> b!837120 (= e!467170 e!467169)))

(declare-fun c!91088 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!837120 (= c!91088 (validKeyInArray!0 (select (arr!22485 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!837121 () Bool)

(assert (=> b!837121 (= e!467168 call!36795)))

(declare-fun b!837122 () Bool)

(assert (=> b!837122 (= e!467169 call!36795)))

(assert (= (and d!107625 (not res!569389)) b!837120))

(assert (= (and b!837120 c!91088) b!837119))

(assert (= (and b!837120 (not c!91088)) b!837122))

(assert (= (and b!837119 res!569388) b!837121))

(assert (= (or b!837121 b!837122) bm!36792))

(declare-fun m!781483 () Bool)

(assert (=> bm!36792 m!781483))

(declare-fun m!781485 () Bool)

(assert (=> b!837119 m!781485))

(declare-fun m!781487 () Bool)

(assert (=> b!837119 m!781487))

(declare-fun m!781489 () Bool)

(assert (=> b!837119 m!781489))

(assert (=> b!837119 m!781485))

(declare-fun m!781491 () Bool)

(assert (=> b!837119 m!781491))

(assert (=> b!837120 m!781485))

(assert (=> b!837120 m!781485))

(declare-fun m!781493 () Bool)

(assert (=> b!837120 m!781493))

(assert (=> b!837042 d!107625))

(declare-fun d!107627 () Bool)

(assert (=> d!107627 (= (array_inv!17988 _keys!868) (bvsge (size!22927 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72238 d!107627))

(declare-fun d!107629 () Bool)

(assert (=> d!107629 (= (array_inv!17989 _values!688) (bvsge (size!22928 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72238 d!107629))

(declare-fun d!107631 () Bool)

(declare-fun lt!380314 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!388 (List!16023) (InoxSet (_ BitVec 64)))

(assert (=> d!107631 (= lt!380314 (select (content!388 Nil!16020) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!467176 () Bool)

(assert (=> d!107631 (= lt!380314 e!467176)))

(declare-fun res!569395 () Bool)

(assert (=> d!107631 (=> (not res!569395) (not e!467176))))

(assert (=> d!107631 (= res!569395 ((_ is Cons!16019) Nil!16020))))

(assert (=> d!107631 (= (contains!4194 Nil!16020 #b0000000000000000000000000000000000000000000000000000000000000000) lt!380314)))

(declare-fun b!837127 () Bool)

(declare-fun e!467175 () Bool)

(assert (=> b!837127 (= e!467176 e!467175)))

(declare-fun res!569394 () Bool)

(assert (=> b!837127 (=> res!569394 e!467175)))

(assert (=> b!837127 (= res!569394 (= (h!17150 Nil!16020) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!837128 () Bool)

(assert (=> b!837128 (= e!467175 (contains!4194 (t!22385 Nil!16020) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107631 res!569395) b!837127))

(assert (= (and b!837127 (not res!569394)) b!837128))

(declare-fun m!781495 () Bool)

(assert (=> d!107631 m!781495))

(declare-fun m!781497 () Bool)

(assert (=> d!107631 m!781497))

(declare-fun m!781499 () Bool)

(assert (=> b!837128 m!781499))

(assert (=> b!837045 d!107631))

(declare-fun d!107633 () Bool)

(assert (=> d!107633 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!837041 d!107633))

(declare-fun d!107635 () Bool)

(declare-fun lt!380315 () Bool)

(assert (=> d!107635 (= lt!380315 (select (content!388 Nil!16020) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!467178 () Bool)

(assert (=> d!107635 (= lt!380315 e!467178)))

(declare-fun res!569397 () Bool)

(assert (=> d!107635 (=> (not res!569397) (not e!467178))))

(assert (=> d!107635 (= res!569397 ((_ is Cons!16019) Nil!16020))))

(assert (=> d!107635 (= (contains!4194 Nil!16020 #b1000000000000000000000000000000000000000000000000000000000000000) lt!380315)))

(declare-fun b!837129 () Bool)

(declare-fun e!467177 () Bool)

(assert (=> b!837129 (= e!467178 e!467177)))

(declare-fun res!569396 () Bool)

(assert (=> b!837129 (=> res!569396 e!467177)))

(assert (=> b!837129 (= res!569396 (= (h!17150 Nil!16020) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!837130 () Bool)

(assert (=> b!837130 (= e!467177 (contains!4194 (t!22385 Nil!16020) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107635 res!569397) b!837129))

(assert (= (and b!837129 (not res!569396)) b!837130))

(assert (=> d!107635 m!781495))

(declare-fun m!781501 () Bool)

(assert (=> d!107635 m!781501))

(declare-fun m!781503 () Bool)

(assert (=> b!837130 m!781503))

(assert (=> b!837046 d!107635))

(declare-fun d!107637 () Bool)

(declare-fun res!569402 () Bool)

(declare-fun e!467183 () Bool)

(assert (=> d!107637 (=> res!569402 e!467183)))

(assert (=> d!107637 (= res!569402 ((_ is Nil!16020) Nil!16020))))

(assert (=> d!107637 (= (noDuplicate!1304 Nil!16020) e!467183)))

(declare-fun b!837135 () Bool)

(declare-fun e!467184 () Bool)

(assert (=> b!837135 (= e!467183 e!467184)))

(declare-fun res!569403 () Bool)

(assert (=> b!837135 (=> (not res!569403) (not e!467184))))

(assert (=> b!837135 (= res!569403 (not (contains!4194 (t!22385 Nil!16020) (h!17150 Nil!16020))))))

(declare-fun b!837136 () Bool)

(assert (=> b!837136 (= e!467184 (noDuplicate!1304 (t!22385 Nil!16020)))))

(assert (= (and d!107637 (not res!569402)) b!837135))

(assert (= (and b!837135 res!569403) b!837136))

(declare-fun m!781505 () Bool)

(assert (=> b!837135 m!781505))

(declare-fun m!781507 () Bool)

(assert (=> b!837136 m!781507))

(assert (=> b!837047 d!107637))

(declare-fun condMapEmpty!24584 () Bool)

(declare-fun mapDefault!24584 () ValueCell!7220)

(assert (=> mapNonEmpty!24575 (= condMapEmpty!24584 (= mapRest!24575 ((as const (Array (_ BitVec 32) ValueCell!7220)) mapDefault!24584)))))

(declare-fun e!467190 () Bool)

(declare-fun mapRes!24584 () Bool)

(assert (=> mapNonEmpty!24575 (= tp!47570 (and e!467190 mapRes!24584))))

(declare-fun b!837143 () Bool)

(declare-fun e!467189 () Bool)

(assert (=> b!837143 (= e!467189 tp_is_empty!15319)))

(declare-fun mapNonEmpty!24584 () Bool)

(declare-fun tp!47579 () Bool)

(assert (=> mapNonEmpty!24584 (= mapRes!24584 (and tp!47579 e!467189))))

(declare-fun mapValue!24584 () ValueCell!7220)

(declare-fun mapRest!24584 () (Array (_ BitVec 32) ValueCell!7220))

(declare-fun mapKey!24584 () (_ BitVec 32))

(assert (=> mapNonEmpty!24584 (= mapRest!24575 (store mapRest!24584 mapKey!24584 mapValue!24584))))

(declare-fun b!837144 () Bool)

(assert (=> b!837144 (= e!467190 tp_is_empty!15319)))

(declare-fun mapIsEmpty!24584 () Bool)

(assert (=> mapIsEmpty!24584 mapRes!24584))

(assert (= (and mapNonEmpty!24575 condMapEmpty!24584) mapIsEmpty!24584))

(assert (= (and mapNonEmpty!24575 (not condMapEmpty!24584)) mapNonEmpty!24584))

(assert (= (and mapNonEmpty!24584 ((_ is ValueCellFull!7220) mapValue!24584)) b!837143))

(assert (= (and mapNonEmpty!24575 ((_ is ValueCellFull!7220) mapDefault!24584)) b!837144))

(declare-fun m!781509 () Bool)

(assert (=> mapNonEmpty!24584 m!781509))

(check-sat (not b!837135) (not b!837136) (not mapNonEmpty!24584) (not d!107631) tp_is_empty!15319 (not d!107635) (not b!837128) (not b!837119) (not b!837120) (not b!837130) (not bm!36792))
(check-sat)
