; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72424 () Bool)

(assert start!72424)

(declare-fun b!838183 () Bool)

(declare-fun e!467855 () Bool)

(declare-fun e!467852 () Bool)

(assert (=> b!838183 (= e!467855 e!467852)))

(declare-fun res!569794 () Bool)

(assert (=> b!838183 (=> res!569794 e!467852)))

(declare-datatypes ((List!15927 0))(
  ( (Nil!15924) (Cons!15923 (h!17060 (_ BitVec 64)) (t!22290 List!15927)) )
))
(declare-fun contains!4193 (List!15927 (_ BitVec 64)) Bool)

(assert (=> b!838183 (= res!569794 (contains!4193 Nil!15924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!24575 () Bool)

(declare-fun mapRes!24575 () Bool)

(declare-fun tp!47570 () Bool)

(declare-fun e!467850 () Bool)

(assert (=> mapNonEmpty!24575 (= mapRes!24575 (and tp!47570 e!467850))))

(declare-datatypes ((V!25473 0))(
  ( (V!25474 (val!7707 Int)) )
))
(declare-datatypes ((ValueCell!7220 0))(
  ( (ValueCellFull!7220 (v!10131 V!25473)) (EmptyCell!7220) )
))
(declare-fun mapRest!24575 () (Array (_ BitVec 32) ValueCell!7220))

(declare-fun mapValue!24575 () ValueCell!7220)

(declare-fun mapKey!24575 () (_ BitVec 32))

(declare-datatypes ((array!46935 0))(
  ( (array!46936 (arr!22495 (Array (_ BitVec 32) ValueCell!7220)) (size!22936 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46935)

(assert (=> mapNonEmpty!24575 (= (arr!22495 _values!688) (store mapRest!24575 mapKey!24575 mapValue!24575))))

(declare-fun mapIsEmpty!24575 () Bool)

(assert (=> mapIsEmpty!24575 mapRes!24575))

(declare-fun b!838184 () Bool)

(declare-fun res!569792 () Bool)

(assert (=> b!838184 (=> (not res!569792) (not e!467855))))

(declare-datatypes ((array!46937 0))(
  ( (array!46938 (arr!22496 (Array (_ BitVec 32) (_ BitVec 64))) (size!22937 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46937)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46937 (_ BitVec 32)) Bool)

(assert (=> b!838184 (= res!569792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838185 () Bool)

(declare-fun tp_is_empty!15319 () Bool)

(assert (=> b!838185 (= e!467850 tp_is_empty!15319)))

(declare-fun b!838186 () Bool)

(declare-fun res!569793 () Bool)

(assert (=> b!838186 (=> (not res!569793) (not e!467855))))

(declare-fun noDuplicate!1300 (List!15927) Bool)

(assert (=> b!838186 (= res!569793 (noDuplicate!1300 Nil!15924))))

(declare-fun b!838187 () Bool)

(declare-fun res!569791 () Bool)

(assert (=> b!838187 (=> (not res!569791) (not e!467855))))

(assert (=> b!838187 (= res!569791 (and (bvsle #b00000000000000000000000000000000 (size!22937 _keys!868)) (bvslt (size!22937 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun res!569795 () Bool)

(assert (=> start!72424 (=> (not res!569795) (not e!467855))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72424 (= res!569795 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22937 _keys!868))))))

(assert (=> start!72424 e!467855))

(assert (=> start!72424 true))

(declare-fun array_inv!17974 (array!46937) Bool)

(assert (=> start!72424 (array_inv!17974 _keys!868)))

(declare-fun e!467851 () Bool)

(declare-fun array_inv!17975 (array!46935) Bool)

(assert (=> start!72424 (and (array_inv!17975 _values!688) e!467851)))

(declare-fun b!838188 () Bool)

(declare-fun res!569790 () Bool)

(assert (=> b!838188 (=> (not res!569790) (not e!467855))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838188 (= res!569790 (and (= (size!22936 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22937 _keys!868) (size!22936 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838189 () Bool)

(assert (=> b!838189 (= e!467852 (contains!4193 Nil!15924 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!838190 () Bool)

(declare-fun res!569789 () Bool)

(assert (=> b!838190 (=> (not res!569789) (not e!467855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838190 (= res!569789 (validMask!0 mask!1196))))

(declare-fun b!838191 () Bool)

(declare-fun e!467853 () Bool)

(assert (=> b!838191 (= e!467853 tp_is_empty!15319)))

(declare-fun b!838192 () Bool)

(assert (=> b!838192 (= e!467851 (and e!467853 mapRes!24575))))

(declare-fun condMapEmpty!24575 () Bool)

(declare-fun mapDefault!24575 () ValueCell!7220)

(assert (=> b!838192 (= condMapEmpty!24575 (= (arr!22495 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7220)) mapDefault!24575)))))

(assert (= (and start!72424 res!569795) b!838190))

(assert (= (and b!838190 res!569789) b!838188))

(assert (= (and b!838188 res!569790) b!838184))

(assert (= (and b!838184 res!569792) b!838187))

(assert (= (and b!838187 res!569791) b!838186))

(assert (= (and b!838186 res!569793) b!838183))

(assert (= (and b!838183 (not res!569794)) b!838189))

(assert (= (and b!838192 condMapEmpty!24575) mapIsEmpty!24575))

(assert (= (and b!838192 (not condMapEmpty!24575)) mapNonEmpty!24575))

(get-info :version)

(assert (= (and mapNonEmpty!24575 ((_ is ValueCellFull!7220) mapValue!24575)) b!838185))

(assert (= (and b!838192 ((_ is ValueCellFull!7220) mapDefault!24575)) b!838191))

(assert (= start!72424 b!838192))

(declare-fun m!783481 () Bool)

(assert (=> mapNonEmpty!24575 m!783481))

(declare-fun m!783483 () Bool)

(assert (=> b!838189 m!783483))

(declare-fun m!783485 () Bool)

(assert (=> b!838183 m!783485))

(declare-fun m!783487 () Bool)

(assert (=> b!838190 m!783487))

(declare-fun m!783489 () Bool)

(assert (=> start!72424 m!783489))

(declare-fun m!783491 () Bool)

(assert (=> start!72424 m!783491))

(declare-fun m!783493 () Bool)

(assert (=> b!838186 m!783493))

(declare-fun m!783495 () Bool)

(assert (=> b!838184 m!783495))

(check-sat tp_is_empty!15319 (not b!838189) (not b!838184) (not mapNonEmpty!24575) (not b!838190) (not b!838183) (not start!72424) (not b!838186))
(check-sat)
(get-model)

(declare-fun d!108145 () Bool)

(declare-fun lt!380902 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!390 (List!15927) (InoxSet (_ BitVec 64)))

(assert (=> d!108145 (= lt!380902 (select (content!390 Nil!15924) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!467896 () Bool)

(assert (=> d!108145 (= lt!380902 e!467896)))

(declare-fun res!569842 () Bool)

(assert (=> d!108145 (=> (not res!569842) (not e!467896))))

(assert (=> d!108145 (= res!569842 ((_ is Cons!15923) Nil!15924))))

(assert (=> d!108145 (= (contains!4193 Nil!15924 #b0000000000000000000000000000000000000000000000000000000000000000) lt!380902)))

(declare-fun b!838257 () Bool)

(declare-fun e!467897 () Bool)

(assert (=> b!838257 (= e!467896 e!467897)))

(declare-fun res!569843 () Bool)

(assert (=> b!838257 (=> res!569843 e!467897)))

(assert (=> b!838257 (= res!569843 (= (h!17060 Nil!15924) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!838258 () Bool)

(assert (=> b!838258 (= e!467897 (contains!4193 (t!22290 Nil!15924) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!108145 res!569842) b!838257))

(assert (= (and b!838257 (not res!569843)) b!838258))

(declare-fun m!783529 () Bool)

(assert (=> d!108145 m!783529))

(declare-fun m!783531 () Bool)

(assert (=> d!108145 m!783531))

(declare-fun m!783533 () Bool)

(assert (=> b!838258 m!783533))

(assert (=> b!838183 d!108145))

(declare-fun d!108147 () Bool)

(declare-fun res!569848 () Bool)

(declare-fun e!467902 () Bool)

(assert (=> d!108147 (=> res!569848 e!467902)))

(assert (=> d!108147 (= res!569848 ((_ is Nil!15924) Nil!15924))))

(assert (=> d!108147 (= (noDuplicate!1300 Nil!15924) e!467902)))

(declare-fun b!838263 () Bool)

(declare-fun e!467903 () Bool)

(assert (=> b!838263 (= e!467902 e!467903)))

(declare-fun res!569849 () Bool)

(assert (=> b!838263 (=> (not res!569849) (not e!467903))))

(assert (=> b!838263 (= res!569849 (not (contains!4193 (t!22290 Nil!15924) (h!17060 Nil!15924))))))

(declare-fun b!838264 () Bool)

(assert (=> b!838264 (= e!467903 (noDuplicate!1300 (t!22290 Nil!15924)))))

(assert (= (and d!108147 (not res!569848)) b!838263))

(assert (= (and b!838263 res!569849) b!838264))

(declare-fun m!783535 () Bool)

(assert (=> b!838263 m!783535))

(declare-fun m!783537 () Bool)

(assert (=> b!838264 m!783537))

(assert (=> b!838186 d!108147))

(declare-fun b!838273 () Bool)

(declare-fun e!467910 () Bool)

(declare-fun call!36866 () Bool)

(assert (=> b!838273 (= e!467910 call!36866)))

(declare-fun bm!36863 () Bool)

(assert (=> bm!36863 (= call!36866 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!838274 () Bool)

(declare-fun e!467912 () Bool)

(declare-fun e!467911 () Bool)

(assert (=> b!838274 (= e!467912 e!467911)))

(declare-fun c!91435 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838274 (= c!91435 (validKeyInArray!0 (select (arr!22496 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!838275 () Bool)

(assert (=> b!838275 (= e!467911 call!36866)))

(declare-fun b!838276 () Bool)

(assert (=> b!838276 (= e!467911 e!467910)))

(declare-fun lt!380910 () (_ BitVec 64))

(assert (=> b!838276 (= lt!380910 (select (arr!22496 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28796 0))(
  ( (Unit!28797) )
))
(declare-fun lt!380909 () Unit!28796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46937 (_ BitVec 64) (_ BitVec 32)) Unit!28796)

(assert (=> b!838276 (= lt!380909 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380910 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!838276 (arrayContainsKey!0 _keys!868 lt!380910 #b00000000000000000000000000000000)))

(declare-fun lt!380911 () Unit!28796)

(assert (=> b!838276 (= lt!380911 lt!380909)))

(declare-fun res!569855 () Bool)

(declare-datatypes ((SeekEntryResult!8699 0))(
  ( (MissingZero!8699 (index!37167 (_ BitVec 32))) (Found!8699 (index!37168 (_ BitVec 32))) (Intermediate!8699 (undefined!9511 Bool) (index!37169 (_ BitVec 32)) (x!70698 (_ BitVec 32))) (Undefined!8699) (MissingVacant!8699 (index!37170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46937 (_ BitVec 32)) SeekEntryResult!8699)

(assert (=> b!838276 (= res!569855 (= (seekEntryOrOpen!0 (select (arr!22496 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8699 #b00000000000000000000000000000000)))))

(assert (=> b!838276 (=> (not res!569855) (not e!467910))))

(declare-fun d!108149 () Bool)

(declare-fun res!569854 () Bool)

(assert (=> d!108149 (=> res!569854 e!467912)))

(assert (=> d!108149 (= res!569854 (bvsge #b00000000000000000000000000000000 (size!22937 _keys!868)))))

(assert (=> d!108149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467912)))

(assert (= (and d!108149 (not res!569854)) b!838274))

(assert (= (and b!838274 c!91435) b!838276))

(assert (= (and b!838274 (not c!91435)) b!838275))

(assert (= (and b!838276 res!569855) b!838273))

(assert (= (or b!838273 b!838275) bm!36863))

(declare-fun m!783539 () Bool)

(assert (=> bm!36863 m!783539))

(declare-fun m!783541 () Bool)

(assert (=> b!838274 m!783541))

(assert (=> b!838274 m!783541))

(declare-fun m!783543 () Bool)

(assert (=> b!838274 m!783543))

(assert (=> b!838276 m!783541))

(declare-fun m!783545 () Bool)

(assert (=> b!838276 m!783545))

(declare-fun m!783547 () Bool)

(assert (=> b!838276 m!783547))

(assert (=> b!838276 m!783541))

(declare-fun m!783549 () Bool)

(assert (=> b!838276 m!783549))

(assert (=> b!838184 d!108149))

(declare-fun d!108151 () Bool)

(declare-fun lt!380912 () Bool)

(assert (=> d!108151 (= lt!380912 (select (content!390 Nil!15924) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!467913 () Bool)

(assert (=> d!108151 (= lt!380912 e!467913)))

(declare-fun res!569856 () Bool)

(assert (=> d!108151 (=> (not res!569856) (not e!467913))))

(assert (=> d!108151 (= res!569856 ((_ is Cons!15923) Nil!15924))))

(assert (=> d!108151 (= (contains!4193 Nil!15924 #b1000000000000000000000000000000000000000000000000000000000000000) lt!380912)))

(declare-fun b!838277 () Bool)

(declare-fun e!467914 () Bool)

(assert (=> b!838277 (= e!467913 e!467914)))

(declare-fun res!569857 () Bool)

(assert (=> b!838277 (=> res!569857 e!467914)))

(assert (=> b!838277 (= res!569857 (= (h!17060 Nil!15924) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!838278 () Bool)

(assert (=> b!838278 (= e!467914 (contains!4193 (t!22290 Nil!15924) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!108151 res!569856) b!838277))

(assert (= (and b!838277 (not res!569857)) b!838278))

(assert (=> d!108151 m!783529))

(declare-fun m!783551 () Bool)

(assert (=> d!108151 m!783551))

(declare-fun m!783553 () Bool)

(assert (=> b!838278 m!783553))

(assert (=> b!838189 d!108151))

(declare-fun d!108153 () Bool)

(assert (=> d!108153 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!838190 d!108153))

(declare-fun d!108155 () Bool)

(assert (=> d!108155 (= (array_inv!17974 _keys!868) (bvsge (size!22937 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72424 d!108155))

(declare-fun d!108157 () Bool)

(assert (=> d!108157 (= (array_inv!17975 _values!688) (bvsge (size!22936 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72424 d!108157))

(declare-fun b!838285 () Bool)

(declare-fun e!467920 () Bool)

(assert (=> b!838285 (= e!467920 tp_is_empty!15319)))

(declare-fun mapNonEmpty!24584 () Bool)

(declare-fun mapRes!24584 () Bool)

(declare-fun tp!47579 () Bool)

(assert (=> mapNonEmpty!24584 (= mapRes!24584 (and tp!47579 e!467920))))

(declare-fun mapKey!24584 () (_ BitVec 32))

(declare-fun mapRest!24584 () (Array (_ BitVec 32) ValueCell!7220))

(declare-fun mapValue!24584 () ValueCell!7220)

(assert (=> mapNonEmpty!24584 (= mapRest!24575 (store mapRest!24584 mapKey!24584 mapValue!24584))))

(declare-fun mapIsEmpty!24584 () Bool)

(assert (=> mapIsEmpty!24584 mapRes!24584))

(declare-fun condMapEmpty!24584 () Bool)

(declare-fun mapDefault!24584 () ValueCell!7220)

(assert (=> mapNonEmpty!24575 (= condMapEmpty!24584 (= mapRest!24575 ((as const (Array (_ BitVec 32) ValueCell!7220)) mapDefault!24584)))))

(declare-fun e!467919 () Bool)

(assert (=> mapNonEmpty!24575 (= tp!47570 (and e!467919 mapRes!24584))))

(declare-fun b!838286 () Bool)

(assert (=> b!838286 (= e!467919 tp_is_empty!15319)))

(assert (= (and mapNonEmpty!24575 condMapEmpty!24584) mapIsEmpty!24584))

(assert (= (and mapNonEmpty!24575 (not condMapEmpty!24584)) mapNonEmpty!24584))

(assert (= (and mapNonEmpty!24584 ((_ is ValueCellFull!7220) mapValue!24584)) b!838285))

(assert (= (and mapNonEmpty!24575 ((_ is ValueCellFull!7220) mapDefault!24584)) b!838286))

(declare-fun m!783555 () Bool)

(assert (=> mapNonEmpty!24584 m!783555))

(check-sat tp_is_empty!15319 (not bm!36863) (not b!838276) (not b!838263) (not mapNonEmpty!24584) (not d!108145) (not b!838278) (not b!838258) (not d!108151) (not b!838264) (not b!838274))
(check-sat)
