; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36594 () Bool)

(assert start!36594)

(declare-fun res!204194 () Bool)

(declare-fun e!223604 () Bool)

(assert (=> start!36594 (=> (not res!204194) (not e!223604))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36594 (= res!204194 (validMask!0 mask!970))))

(assert (=> start!36594 e!223604))

(assert (=> start!36594 true))

(declare-datatypes ((V!12379 0))(
  ( (V!12380 (val!4272 Int)) )
))
(declare-datatypes ((ValueCell!3884 0))(
  ( (ValueCellFull!3884 (v!6461 V!12379)) (EmptyCell!3884) )
))
(declare-datatypes ((array!20849 0))(
  ( (array!20850 (arr!9898 (Array (_ BitVec 32) ValueCell!3884)) (size!10251 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20849)

(declare-fun e!223606 () Bool)

(declare-fun array_inv!7338 (array!20849) Bool)

(assert (=> start!36594 (and (array_inv!7338 _values!506) e!223606)))

(declare-datatypes ((array!20851 0))(
  ( (array!20852 (arr!9899 (Array (_ BitVec 32) (_ BitVec 64))) (size!10252 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20851)

(declare-fun array_inv!7339 (array!20851) Bool)

(assert (=> start!36594 (array_inv!7339 _keys!658)))

(declare-fun b!365178 () Bool)

(declare-fun e!223607 () Bool)

(declare-datatypes ((List!5491 0))(
  ( (Nil!5488) (Cons!5487 (h!6343 (_ BitVec 64)) (t!10632 List!5491)) )
))
(declare-fun contains!2421 (List!5491 (_ BitVec 64)) Bool)

(assert (=> b!365178 (= e!223607 (contains!2421 Nil!5488 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365179 () Bool)

(declare-fun e!223608 () Bool)

(declare-fun tp_is_empty!8455 () Bool)

(assert (=> b!365179 (= e!223608 tp_is_empty!8455)))

(declare-fun b!365180 () Bool)

(declare-fun res!204198 () Bool)

(assert (=> b!365180 (=> (not res!204198) (not e!223604))))

(assert (=> b!365180 (= res!204198 (and (bvsle #b00000000000000000000000000000000 (size!10252 _keys!658)) (bvslt (size!10252 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365181 () Bool)

(declare-fun res!204196 () Bool)

(assert (=> b!365181 (=> (not res!204196) (not e!223604))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365181 (= res!204196 (and (= (size!10251 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10252 _keys!658) (size!10251 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365182 () Bool)

(declare-fun res!204199 () Bool)

(assert (=> b!365182 (=> (not res!204199) (not e!223604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20851 (_ BitVec 32)) Bool)

(assert (=> b!365182 (= res!204199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365183 () Bool)

(declare-fun e!223609 () Bool)

(assert (=> b!365183 (= e!223609 tp_is_empty!8455)))

(declare-fun mapNonEmpty!14232 () Bool)

(declare-fun mapRes!14232 () Bool)

(declare-fun tp!28308 () Bool)

(assert (=> mapNonEmpty!14232 (= mapRes!14232 (and tp!28308 e!223609))))

(declare-fun mapKey!14232 () (_ BitVec 32))

(declare-fun mapValue!14232 () ValueCell!3884)

(declare-fun mapRest!14232 () (Array (_ BitVec 32) ValueCell!3884))

(assert (=> mapNonEmpty!14232 (= (arr!9898 _values!506) (store mapRest!14232 mapKey!14232 mapValue!14232))))

(declare-fun b!365184 () Bool)

(assert (=> b!365184 (= e!223606 (and e!223608 mapRes!14232))))

(declare-fun condMapEmpty!14232 () Bool)

(declare-fun mapDefault!14232 () ValueCell!3884)

(assert (=> b!365184 (= condMapEmpty!14232 (= (arr!9898 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3884)) mapDefault!14232)))))

(declare-fun b!365185 () Bool)

(assert (=> b!365185 (= e!223604 e!223607)))

(declare-fun res!204195 () Bool)

(assert (=> b!365185 (=> res!204195 e!223607)))

(assert (=> b!365185 (= res!204195 (contains!2421 Nil!5488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!14232 () Bool)

(assert (=> mapIsEmpty!14232 mapRes!14232))

(declare-fun b!365186 () Bool)

(declare-fun res!204197 () Bool)

(assert (=> b!365186 (=> (not res!204197) (not e!223604))))

(declare-fun noDuplicate!187 (List!5491) Bool)

(assert (=> b!365186 (= res!204197 (noDuplicate!187 Nil!5488))))

(assert (= (and start!36594 res!204194) b!365181))

(assert (= (and b!365181 res!204196) b!365182))

(assert (= (and b!365182 res!204199) b!365180))

(assert (= (and b!365180 res!204198) b!365186))

(assert (= (and b!365186 res!204197) b!365185))

(assert (= (and b!365185 (not res!204195)) b!365178))

(assert (= (and b!365184 condMapEmpty!14232) mapIsEmpty!14232))

(assert (= (and b!365184 (not condMapEmpty!14232)) mapNonEmpty!14232))

(get-info :version)

(assert (= (and mapNonEmpty!14232 ((_ is ValueCellFull!3884) mapValue!14232)) b!365183))

(assert (= (and b!365184 ((_ is ValueCellFull!3884) mapDefault!14232)) b!365179))

(assert (= start!36594 b!365184))

(declare-fun m!362431 () Bool)

(assert (=> b!365178 m!362431))

(declare-fun m!362433 () Bool)

(assert (=> start!36594 m!362433))

(declare-fun m!362435 () Bool)

(assert (=> start!36594 m!362435))

(declare-fun m!362437 () Bool)

(assert (=> start!36594 m!362437))

(declare-fun m!362439 () Bool)

(assert (=> mapNonEmpty!14232 m!362439))

(declare-fun m!362441 () Bool)

(assert (=> b!365182 m!362441))

(declare-fun m!362443 () Bool)

(assert (=> b!365186 m!362443))

(declare-fun m!362445 () Bool)

(assert (=> b!365185 m!362445))

(check-sat (not b!365178) (not b!365185) (not start!36594) (not b!365186) (not mapNonEmpty!14232) tp_is_empty!8455 (not b!365182))
(check-sat)
(get-model)

(declare-fun d!72139 () Bool)

(declare-fun lt!168943 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!200 (List!5491) (InoxSet (_ BitVec 64)))

(assert (=> d!72139 (= lt!168943 (select (content!200 Nil!5488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!223651 () Bool)

(assert (=> d!72139 (= lt!168943 e!223651)))

(declare-fun res!204241 () Bool)

(assert (=> d!72139 (=> (not res!204241) (not e!223651))))

(assert (=> d!72139 (= res!204241 ((_ is Cons!5487) Nil!5488))))

(assert (=> d!72139 (= (contains!2421 Nil!5488 #b1000000000000000000000000000000000000000000000000000000000000000) lt!168943)))

(declare-fun b!365245 () Bool)

(declare-fun e!223650 () Bool)

(assert (=> b!365245 (= e!223651 e!223650)))

(declare-fun res!204240 () Bool)

(assert (=> b!365245 (=> res!204240 e!223650)))

(assert (=> b!365245 (= res!204240 (= (h!6343 Nil!5488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365246 () Bool)

(assert (=> b!365246 (= e!223650 (contains!2421 (t!10632 Nil!5488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72139 res!204241) b!365245))

(assert (= (and b!365245 (not res!204240)) b!365246))

(declare-fun m!362479 () Bool)

(assert (=> d!72139 m!362479))

(declare-fun m!362481 () Bool)

(assert (=> d!72139 m!362481))

(declare-fun m!362483 () Bool)

(assert (=> b!365246 m!362483))

(assert (=> b!365178 d!72139))

(declare-fun d!72141 () Bool)

(declare-fun lt!168944 () Bool)

(assert (=> d!72141 (= lt!168944 (select (content!200 Nil!5488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!223653 () Bool)

(assert (=> d!72141 (= lt!168944 e!223653)))

(declare-fun res!204243 () Bool)

(assert (=> d!72141 (=> (not res!204243) (not e!223653))))

(assert (=> d!72141 (= res!204243 ((_ is Cons!5487) Nil!5488))))

(assert (=> d!72141 (= (contains!2421 Nil!5488 #b0000000000000000000000000000000000000000000000000000000000000000) lt!168944)))

(declare-fun b!365247 () Bool)

(declare-fun e!223652 () Bool)

(assert (=> b!365247 (= e!223653 e!223652)))

(declare-fun res!204242 () Bool)

(assert (=> b!365247 (=> res!204242 e!223652)))

(assert (=> b!365247 (= res!204242 (= (h!6343 Nil!5488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!365248 () Bool)

(assert (=> b!365248 (= e!223652 (contains!2421 (t!10632 Nil!5488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72141 res!204243) b!365247))

(assert (= (and b!365247 (not res!204242)) b!365248))

(assert (=> d!72141 m!362479))

(declare-fun m!362485 () Bool)

(assert (=> d!72141 m!362485))

(declare-fun m!362487 () Bool)

(assert (=> b!365248 m!362487))

(assert (=> b!365185 d!72141))

(declare-fun d!72143 () Bool)

(assert (=> d!72143 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36594 d!72143))

(declare-fun d!72145 () Bool)

(assert (=> d!72145 (= (array_inv!7338 _values!506) (bvsge (size!10251 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36594 d!72145))

(declare-fun d!72147 () Bool)

(assert (=> d!72147 (= (array_inv!7339 _keys!658) (bvsge (size!10252 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36594 d!72147))

(declare-fun b!365257 () Bool)

(declare-fun e!223661 () Bool)

(declare-fun e!223660 () Bool)

(assert (=> b!365257 (= e!223661 e!223660)))

(declare-fun lt!168951 () (_ BitVec 64))

(assert (=> b!365257 (= lt!168951 (select (arr!9899 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11366 0))(
  ( (Unit!11367) )
))
(declare-fun lt!168952 () Unit!11366)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20851 (_ BitVec 64) (_ BitVec 32)) Unit!11366)

(assert (=> b!365257 (= lt!168952 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!168951 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365257 (arrayContainsKey!0 _keys!658 lt!168951 #b00000000000000000000000000000000)))

(declare-fun lt!168953 () Unit!11366)

(assert (=> b!365257 (= lt!168953 lt!168952)))

(declare-fun res!204249 () Bool)

(declare-datatypes ((SeekEntryResult!3498 0))(
  ( (MissingZero!3498 (index!16171 (_ BitVec 32))) (Found!3498 (index!16172 (_ BitVec 32))) (Intermediate!3498 (undefined!4310 Bool) (index!16173 (_ BitVec 32)) (x!36651 (_ BitVec 32))) (Undefined!3498) (MissingVacant!3498 (index!16174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20851 (_ BitVec 32)) SeekEntryResult!3498)

(assert (=> b!365257 (= res!204249 (= (seekEntryOrOpen!0 (select (arr!9899 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3498 #b00000000000000000000000000000000)))))

(assert (=> b!365257 (=> (not res!204249) (not e!223660))))

(declare-fun d!72149 () Bool)

(declare-fun res!204248 () Bool)

(declare-fun e!223662 () Bool)

(assert (=> d!72149 (=> res!204248 e!223662)))

(assert (=> d!72149 (= res!204248 (bvsge #b00000000000000000000000000000000 (size!10252 _keys!658)))))

(assert (=> d!72149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223662)))

(declare-fun bm!27253 () Bool)

(declare-fun call!27256 () Bool)

(assert (=> bm!27253 (= call!27256 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365258 () Bool)

(assert (=> b!365258 (= e!223661 call!27256)))

(declare-fun b!365259 () Bool)

(assert (=> b!365259 (= e!223662 e!223661)))

(declare-fun c!53826 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365259 (= c!53826 (validKeyInArray!0 (select (arr!9899 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365260 () Bool)

(assert (=> b!365260 (= e!223660 call!27256)))

(assert (= (and d!72149 (not res!204248)) b!365259))

(assert (= (and b!365259 c!53826) b!365257))

(assert (= (and b!365259 (not c!53826)) b!365258))

(assert (= (and b!365257 res!204249) b!365260))

(assert (= (or b!365260 b!365258) bm!27253))

(declare-fun m!362489 () Bool)

(assert (=> b!365257 m!362489))

(declare-fun m!362491 () Bool)

(assert (=> b!365257 m!362491))

(declare-fun m!362493 () Bool)

(assert (=> b!365257 m!362493))

(assert (=> b!365257 m!362489))

(declare-fun m!362495 () Bool)

(assert (=> b!365257 m!362495))

(declare-fun m!362497 () Bool)

(assert (=> bm!27253 m!362497))

(assert (=> b!365259 m!362489))

(assert (=> b!365259 m!362489))

(declare-fun m!362499 () Bool)

(assert (=> b!365259 m!362499))

(assert (=> b!365182 d!72149))

(declare-fun d!72151 () Bool)

(declare-fun res!204254 () Bool)

(declare-fun e!223667 () Bool)

(assert (=> d!72151 (=> res!204254 e!223667)))

(assert (=> d!72151 (= res!204254 ((_ is Nil!5488) Nil!5488))))

(assert (=> d!72151 (= (noDuplicate!187 Nil!5488) e!223667)))

(declare-fun b!365265 () Bool)

(declare-fun e!223668 () Bool)

(assert (=> b!365265 (= e!223667 e!223668)))

(declare-fun res!204255 () Bool)

(assert (=> b!365265 (=> (not res!204255) (not e!223668))))

(assert (=> b!365265 (= res!204255 (not (contains!2421 (t!10632 Nil!5488) (h!6343 Nil!5488))))))

(declare-fun b!365266 () Bool)

(assert (=> b!365266 (= e!223668 (noDuplicate!187 (t!10632 Nil!5488)))))

(assert (= (and d!72151 (not res!204254)) b!365265))

(assert (= (and b!365265 res!204255) b!365266))

(declare-fun m!362501 () Bool)

(assert (=> b!365265 m!362501))

(declare-fun m!362503 () Bool)

(assert (=> b!365266 m!362503))

(assert (=> b!365186 d!72151))

(declare-fun b!365274 () Bool)

(declare-fun e!223674 () Bool)

(assert (=> b!365274 (= e!223674 tp_is_empty!8455)))

(declare-fun b!365273 () Bool)

(declare-fun e!223673 () Bool)

(assert (=> b!365273 (= e!223673 tp_is_empty!8455)))

(declare-fun condMapEmpty!14241 () Bool)

(declare-fun mapDefault!14241 () ValueCell!3884)

(assert (=> mapNonEmpty!14232 (= condMapEmpty!14241 (= mapRest!14232 ((as const (Array (_ BitVec 32) ValueCell!3884)) mapDefault!14241)))))

(declare-fun mapRes!14241 () Bool)

(assert (=> mapNonEmpty!14232 (= tp!28308 (and e!223674 mapRes!14241))))

(declare-fun mapNonEmpty!14241 () Bool)

(declare-fun tp!28317 () Bool)

(assert (=> mapNonEmpty!14241 (= mapRes!14241 (and tp!28317 e!223673))))

(declare-fun mapKey!14241 () (_ BitVec 32))

(declare-fun mapRest!14241 () (Array (_ BitVec 32) ValueCell!3884))

(declare-fun mapValue!14241 () ValueCell!3884)

(assert (=> mapNonEmpty!14241 (= mapRest!14232 (store mapRest!14241 mapKey!14241 mapValue!14241))))

(declare-fun mapIsEmpty!14241 () Bool)

(assert (=> mapIsEmpty!14241 mapRes!14241))

(assert (= (and mapNonEmpty!14232 condMapEmpty!14241) mapIsEmpty!14241))

(assert (= (and mapNonEmpty!14232 (not condMapEmpty!14241)) mapNonEmpty!14241))

(assert (= (and mapNonEmpty!14241 ((_ is ValueCellFull!3884) mapValue!14241)) b!365273))

(assert (= (and mapNonEmpty!14232 ((_ is ValueCellFull!3884) mapDefault!14241)) b!365274))

(declare-fun m!362505 () Bool)

(assert (=> mapNonEmpty!14241 m!362505))

(check-sat (not b!365259) (not b!365248) (not b!365266) (not d!72139) (not bm!27253) (not b!365257) (not mapNonEmpty!14241) (not b!365265) tp_is_empty!8455 (not b!365246) (not d!72141))
(check-sat)
