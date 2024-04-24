; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35304 () Bool)

(assert start!35304)

(declare-fun b!353703 () Bool)

(declare-fun e!216665 () Bool)

(declare-fun e!216663 () Bool)

(declare-fun mapRes!13194 () Bool)

(assert (=> b!353703 (= e!216665 (and e!216663 mapRes!13194))))

(declare-fun condMapEmpty!13194 () Bool)

(declare-datatypes ((V!11371 0))(
  ( (V!11372 (val!3942 Int)) )
))
(declare-datatypes ((ValueCell!3554 0))(
  ( (ValueCellFull!3554 (v!6136 V!11371)) (EmptyCell!3554) )
))
(declare-datatypes ((array!19168 0))(
  ( (array!19169 (arr!9079 (Array (_ BitVec 32) ValueCell!3554)) (size!9431 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19168)

(declare-fun mapDefault!13194 () ValueCell!3554)

(assert (=> b!353703 (= condMapEmpty!13194 (= (arr!9079 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3554)) mapDefault!13194)))))

(declare-fun mapIsEmpty!13194 () Bool)

(assert (=> mapIsEmpty!13194 mapRes!13194))

(declare-fun b!353704 () Bool)

(declare-fun e!216661 () Bool)

(declare-datatypes ((List!5184 0))(
  ( (Nil!5181) (Cons!5180 (h!6036 (_ BitVec 64)) (t!10326 List!5184)) )
))
(declare-fun contains!2355 (List!5184 (_ BitVec 64)) Bool)

(assert (=> b!353704 (= e!216661 (contains!2355 Nil!5181 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353706 () Bool)

(declare-fun e!216662 () Bool)

(assert (=> b!353706 (= e!216662 e!216661)))

(declare-fun res!196114 () Bool)

(assert (=> b!353706 (=> res!196114 e!216661)))

(assert (=> b!353706 (= res!196114 (contains!2355 Nil!5181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353707 () Bool)

(declare-fun res!196116 () Bool)

(assert (=> b!353707 (=> (not res!196116) (not e!216662))))

(declare-datatypes ((array!19170 0))(
  ( (array!19171 (arr!9080 (Array (_ BitVec 32) (_ BitVec 64))) (size!9432 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19170)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19170 (_ BitVec 32)) Bool)

(assert (=> b!353707 (= res!196116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353708 () Bool)

(declare-fun res!196118 () Bool)

(assert (=> b!353708 (=> (not res!196118) (not e!216662))))

(assert (=> b!353708 (= res!196118 (and (bvsle #b00000000000000000000000000000000 (size!9432 _keys!1456)) (bvslt (size!9432 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353705 () Bool)

(declare-fun tp_is_empty!7795 () Bool)

(assert (=> b!353705 (= e!216663 tp_is_empty!7795)))

(declare-fun res!196117 () Bool)

(assert (=> start!35304 (=> (not res!196117) (not e!216662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35304 (= res!196117 (validMask!0 mask!1842))))

(assert (=> start!35304 e!216662))

(assert (=> start!35304 true))

(declare-fun array_inv!6702 (array!19168) Bool)

(assert (=> start!35304 (and (array_inv!6702 _values!1208) e!216665)))

(declare-fun array_inv!6703 (array!19170) Bool)

(assert (=> start!35304 (array_inv!6703 _keys!1456)))

(declare-fun b!353709 () Bool)

(declare-fun res!196115 () Bool)

(assert (=> b!353709 (=> (not res!196115) (not e!216662))))

(declare-fun noDuplicate!182 (List!5184) Bool)

(assert (=> b!353709 (= res!196115 (noDuplicate!182 Nil!5181))))

(declare-fun b!353710 () Bool)

(declare-fun res!196113 () Bool)

(assert (=> b!353710 (=> (not res!196113) (not e!216662))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353710 (= res!196113 (and (= (size!9431 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9432 _keys!1456) (size!9431 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13194 () Bool)

(declare-fun tp!27090 () Bool)

(declare-fun e!216664 () Bool)

(assert (=> mapNonEmpty!13194 (= mapRes!13194 (and tp!27090 e!216664))))

(declare-fun mapRest!13194 () (Array (_ BitVec 32) ValueCell!3554))

(declare-fun mapKey!13194 () (_ BitVec 32))

(declare-fun mapValue!13194 () ValueCell!3554)

(assert (=> mapNonEmpty!13194 (= (arr!9079 _values!1208) (store mapRest!13194 mapKey!13194 mapValue!13194))))

(declare-fun b!353711 () Bool)

(assert (=> b!353711 (= e!216664 tp_is_empty!7795)))

(assert (= (and start!35304 res!196117) b!353710))

(assert (= (and b!353710 res!196113) b!353707))

(assert (= (and b!353707 res!196116) b!353708))

(assert (= (and b!353708 res!196118) b!353709))

(assert (= (and b!353709 res!196115) b!353706))

(assert (= (and b!353706 (not res!196114)) b!353704))

(assert (= (and b!353703 condMapEmpty!13194) mapIsEmpty!13194))

(assert (= (and b!353703 (not condMapEmpty!13194)) mapNonEmpty!13194))

(get-info :version)

(assert (= (and mapNonEmpty!13194 ((_ is ValueCellFull!3554) mapValue!13194)) b!353711))

(assert (= (and b!353703 ((_ is ValueCellFull!3554) mapDefault!13194)) b!353705))

(assert (= start!35304 b!353703))

(declare-fun m!353231 () Bool)

(assert (=> b!353707 m!353231))

(declare-fun m!353233 () Bool)

(assert (=> start!35304 m!353233))

(declare-fun m!353235 () Bool)

(assert (=> start!35304 m!353235))

(declare-fun m!353237 () Bool)

(assert (=> start!35304 m!353237))

(declare-fun m!353239 () Bool)

(assert (=> mapNonEmpty!13194 m!353239))

(declare-fun m!353241 () Bool)

(assert (=> b!353706 m!353241))

(declare-fun m!353243 () Bool)

(assert (=> b!353704 m!353243))

(declare-fun m!353245 () Bool)

(assert (=> b!353709 m!353245))

(check-sat tp_is_empty!7795 (not mapNonEmpty!13194) (not b!353706) (not b!353709) (not b!353704) (not b!353707) (not start!35304))
(check-sat)
(get-model)

(declare-fun d!71681 () Bool)

(assert (=> d!71681 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35304 d!71681))

(declare-fun d!71683 () Bool)

(assert (=> d!71683 (= (array_inv!6702 _values!1208) (bvsge (size!9431 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35304 d!71683))

(declare-fun d!71685 () Bool)

(assert (=> d!71685 (= (array_inv!6703 _keys!1456) (bvsge (size!9432 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35304 d!71685))

(declare-fun d!71687 () Bool)

(declare-fun lt!165622 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!199 (List!5184) (InoxSet (_ BitVec 64)))

(assert (=> d!71687 (= lt!165622 (select (content!199 Nil!5181) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!216706 () Bool)

(assert (=> d!71687 (= lt!165622 e!216706)))

(declare-fun res!196159 () Bool)

(assert (=> d!71687 (=> (not res!196159) (not e!216706))))

(assert (=> d!71687 (= res!196159 ((_ is Cons!5180) Nil!5181))))

(assert (=> d!71687 (= (contains!2355 Nil!5181 #b0000000000000000000000000000000000000000000000000000000000000000) lt!165622)))

(declare-fun b!353770 () Bool)

(declare-fun e!216707 () Bool)

(assert (=> b!353770 (= e!216706 e!216707)))

(declare-fun res!196160 () Bool)

(assert (=> b!353770 (=> res!196160 e!216707)))

(assert (=> b!353770 (= res!196160 (= (h!6036 Nil!5181) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353771 () Bool)

(assert (=> b!353771 (= e!216707 (contains!2355 (t!10326 Nil!5181) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71687 res!196159) b!353770))

(assert (= (and b!353770 (not res!196160)) b!353771))

(declare-fun m!353279 () Bool)

(assert (=> d!71687 m!353279))

(declare-fun m!353281 () Bool)

(assert (=> d!71687 m!353281))

(declare-fun m!353283 () Bool)

(assert (=> b!353771 m!353283))

(assert (=> b!353706 d!71687))

(declare-fun bm!27137 () Bool)

(declare-fun call!27140 () Bool)

(assert (=> bm!27137 (= call!27140 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353780 () Bool)

(declare-fun e!216714 () Bool)

(assert (=> b!353780 (= e!216714 call!27140)))

(declare-fun b!353781 () Bool)

(declare-fun e!216715 () Bool)

(assert (=> b!353781 (= e!216715 call!27140)))

(declare-fun b!353782 () Bool)

(declare-fun e!216716 () Bool)

(assert (=> b!353782 (= e!216716 e!216715)))

(declare-fun c!53678 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353782 (= c!53678 (validKeyInArray!0 (select (arr!9080 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun d!71689 () Bool)

(declare-fun res!196165 () Bool)

(assert (=> d!71689 (=> res!196165 e!216716)))

(assert (=> d!71689 (= res!196165 (bvsge #b00000000000000000000000000000000 (size!9432 _keys!1456)))))

(assert (=> d!71689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216716)))

(declare-fun b!353783 () Bool)

(assert (=> b!353783 (= e!216715 e!216714)))

(declare-fun lt!165631 () (_ BitVec 64))

(assert (=> b!353783 (= lt!165631 (select (arr!9080 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10901 0))(
  ( (Unit!10902) )
))
(declare-fun lt!165630 () Unit!10901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19170 (_ BitVec 64) (_ BitVec 32)) Unit!10901)

(assert (=> b!353783 (= lt!165630 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165631 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353783 (arrayContainsKey!0 _keys!1456 lt!165631 #b00000000000000000000000000000000)))

(declare-fun lt!165629 () Unit!10901)

(assert (=> b!353783 (= lt!165629 lt!165630)))

(declare-fun res!196166 () Bool)

(declare-datatypes ((SeekEntryResult!3438 0))(
  ( (MissingZero!3438 (index!15931 (_ BitVec 32))) (Found!3438 (index!15932 (_ BitVec 32))) (Intermediate!3438 (undefined!4250 Bool) (index!15933 (_ BitVec 32)) (x!35169 (_ BitVec 32))) (Undefined!3438) (MissingVacant!3438 (index!15934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19170 (_ BitVec 32)) SeekEntryResult!3438)

(assert (=> b!353783 (= res!196166 (= (seekEntryOrOpen!0 (select (arr!9080 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3438 #b00000000000000000000000000000000)))))

(assert (=> b!353783 (=> (not res!196166) (not e!216714))))

(assert (= (and d!71689 (not res!196165)) b!353782))

(assert (= (and b!353782 c!53678) b!353783))

(assert (= (and b!353782 (not c!53678)) b!353781))

(assert (= (and b!353783 res!196166) b!353780))

(assert (= (or b!353780 b!353781) bm!27137))

(declare-fun m!353285 () Bool)

(assert (=> bm!27137 m!353285))

(declare-fun m!353287 () Bool)

(assert (=> b!353782 m!353287))

(assert (=> b!353782 m!353287))

(declare-fun m!353289 () Bool)

(assert (=> b!353782 m!353289))

(assert (=> b!353783 m!353287))

(declare-fun m!353291 () Bool)

(assert (=> b!353783 m!353291))

(declare-fun m!353293 () Bool)

(assert (=> b!353783 m!353293))

(assert (=> b!353783 m!353287))

(declare-fun m!353295 () Bool)

(assert (=> b!353783 m!353295))

(assert (=> b!353707 d!71689))

(declare-fun d!71691 () Bool)

(declare-fun res!196171 () Bool)

(declare-fun e!216721 () Bool)

(assert (=> d!71691 (=> res!196171 e!216721)))

(assert (=> d!71691 (= res!196171 ((_ is Nil!5181) Nil!5181))))

(assert (=> d!71691 (= (noDuplicate!182 Nil!5181) e!216721)))

(declare-fun b!353788 () Bool)

(declare-fun e!216722 () Bool)

(assert (=> b!353788 (= e!216721 e!216722)))

(declare-fun res!196172 () Bool)

(assert (=> b!353788 (=> (not res!196172) (not e!216722))))

(assert (=> b!353788 (= res!196172 (not (contains!2355 (t!10326 Nil!5181) (h!6036 Nil!5181))))))

(declare-fun b!353789 () Bool)

(assert (=> b!353789 (= e!216722 (noDuplicate!182 (t!10326 Nil!5181)))))

(assert (= (and d!71691 (not res!196171)) b!353788))

(assert (= (and b!353788 res!196172) b!353789))

(declare-fun m!353297 () Bool)

(assert (=> b!353788 m!353297))

(declare-fun m!353299 () Bool)

(assert (=> b!353789 m!353299))

(assert (=> b!353709 d!71691))

(declare-fun d!71693 () Bool)

(declare-fun lt!165632 () Bool)

(assert (=> d!71693 (= lt!165632 (select (content!199 Nil!5181) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!216723 () Bool)

(assert (=> d!71693 (= lt!165632 e!216723)))

(declare-fun res!196173 () Bool)

(assert (=> d!71693 (=> (not res!196173) (not e!216723))))

(assert (=> d!71693 (= res!196173 ((_ is Cons!5180) Nil!5181))))

(assert (=> d!71693 (= (contains!2355 Nil!5181 #b1000000000000000000000000000000000000000000000000000000000000000) lt!165632)))

(declare-fun b!353790 () Bool)

(declare-fun e!216724 () Bool)

(assert (=> b!353790 (= e!216723 e!216724)))

(declare-fun res!196174 () Bool)

(assert (=> b!353790 (=> res!196174 e!216724)))

(assert (=> b!353790 (= res!196174 (= (h!6036 Nil!5181) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353791 () Bool)

(assert (=> b!353791 (= e!216724 (contains!2355 (t!10326 Nil!5181) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71693 res!196173) b!353790))

(assert (= (and b!353790 (not res!196174)) b!353791))

(assert (=> d!71693 m!353279))

(declare-fun m!353301 () Bool)

(assert (=> d!71693 m!353301))

(declare-fun m!353303 () Bool)

(assert (=> b!353791 m!353303))

(assert (=> b!353704 d!71693))

(declare-fun mapIsEmpty!13203 () Bool)

(declare-fun mapRes!13203 () Bool)

(assert (=> mapIsEmpty!13203 mapRes!13203))

(declare-fun b!353798 () Bool)

(declare-fun e!216730 () Bool)

(assert (=> b!353798 (= e!216730 tp_is_empty!7795)))

(declare-fun condMapEmpty!13203 () Bool)

(declare-fun mapDefault!13203 () ValueCell!3554)

(assert (=> mapNonEmpty!13194 (= condMapEmpty!13203 (= mapRest!13194 ((as const (Array (_ BitVec 32) ValueCell!3554)) mapDefault!13203)))))

(declare-fun e!216729 () Bool)

(assert (=> mapNonEmpty!13194 (= tp!27090 (and e!216729 mapRes!13203))))

(declare-fun mapNonEmpty!13203 () Bool)

(declare-fun tp!27099 () Bool)

(assert (=> mapNonEmpty!13203 (= mapRes!13203 (and tp!27099 e!216730))))

(declare-fun mapRest!13203 () (Array (_ BitVec 32) ValueCell!3554))

(declare-fun mapKey!13203 () (_ BitVec 32))

(declare-fun mapValue!13203 () ValueCell!3554)

(assert (=> mapNonEmpty!13203 (= mapRest!13194 (store mapRest!13203 mapKey!13203 mapValue!13203))))

(declare-fun b!353799 () Bool)

(assert (=> b!353799 (= e!216729 tp_is_empty!7795)))

(assert (= (and mapNonEmpty!13194 condMapEmpty!13203) mapIsEmpty!13203))

(assert (= (and mapNonEmpty!13194 (not condMapEmpty!13203)) mapNonEmpty!13203))

(assert (= (and mapNonEmpty!13203 ((_ is ValueCellFull!3554) mapValue!13203)) b!353798))

(assert (= (and mapNonEmpty!13194 ((_ is ValueCellFull!3554) mapDefault!13203)) b!353799))

(declare-fun m!353305 () Bool)

(assert (=> mapNonEmpty!13203 m!353305))

(check-sat (not bm!27137) (not d!71693) (not b!353789) (not d!71687) (not b!353782) (not b!353783) (not b!353791) (not b!353788) tp_is_empty!7795 (not mapNonEmpty!13203) (not b!353771))
(check-sat)
