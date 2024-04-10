; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36594 () Bool)

(assert start!36594)

(declare-fun b!365377 () Bool)

(declare-fun e!223726 () Bool)

(declare-fun tp_is_empty!8451 () Bool)

(assert (=> b!365377 (= e!223726 tp_is_empty!8451)))

(declare-fun b!365378 () Bool)

(declare-fun e!223728 () Bool)

(declare-datatypes ((List!5524 0))(
  ( (Nil!5521) (Cons!5520 (h!6376 (_ BitVec 64)) (t!10674 List!5524)) )
))
(declare-fun noDuplicate!184 (List!5524) Bool)

(assert (=> b!365378 (= e!223728 (not (noDuplicate!184 Nil!5521)))))

(declare-fun b!365379 () Bool)

(declare-fun res!204284 () Bool)

(assert (=> b!365379 (=> (not res!204284) (not e!223728))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12373 0))(
  ( (V!12374 (val!4270 Int)) )
))
(declare-datatypes ((ValueCell!3882 0))(
  ( (ValueCellFull!3882 (v!6465 V!12373)) (EmptyCell!3882) )
))
(declare-datatypes ((array!20859 0))(
  ( (array!20860 (arr!9904 (Array (_ BitVec 32) ValueCell!3882)) (size!10256 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20859)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((array!20861 0))(
  ( (array!20862 (arr!9905 (Array (_ BitVec 32) (_ BitVec 64))) (size!10257 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20861)

(assert (=> b!365379 (= res!204284 (and (= (size!10256 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10257 _keys!658) (size!10256 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14223 () Bool)

(declare-fun mapRes!14223 () Bool)

(assert (=> mapIsEmpty!14223 mapRes!14223))

(declare-fun b!365380 () Bool)

(declare-fun e!223725 () Bool)

(assert (=> b!365380 (= e!223725 (and e!223726 mapRes!14223))))

(declare-fun condMapEmpty!14223 () Bool)

(declare-fun mapDefault!14223 () ValueCell!3882)

(assert (=> b!365380 (= condMapEmpty!14223 (= (arr!9904 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3882)) mapDefault!14223)))))

(declare-fun b!365381 () Bool)

(declare-fun res!204285 () Bool)

(assert (=> b!365381 (=> (not res!204285) (not e!223728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20861 (_ BitVec 32)) Bool)

(assert (=> b!365381 (= res!204285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14223 () Bool)

(declare-fun tp!28299 () Bool)

(declare-fun e!223729 () Bool)

(assert (=> mapNonEmpty!14223 (= mapRes!14223 (and tp!28299 e!223729))))

(declare-fun mapRest!14223 () (Array (_ BitVec 32) ValueCell!3882))

(declare-fun mapKey!14223 () (_ BitVec 32))

(declare-fun mapValue!14223 () ValueCell!3882)

(assert (=> mapNonEmpty!14223 (= (arr!9904 _values!506) (store mapRest!14223 mapKey!14223 mapValue!14223))))

(declare-fun b!365382 () Bool)

(declare-fun res!204286 () Bool)

(assert (=> b!365382 (=> (not res!204286) (not e!223728))))

(assert (=> b!365382 (= res!204286 (and (bvsle #b00000000000000000000000000000000 (size!10257 _keys!658)) (bvslt (size!10257 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365383 () Bool)

(assert (=> b!365383 (= e!223729 tp_is_empty!8451)))

(declare-fun res!204283 () Bool)

(assert (=> start!36594 (=> (not res!204283) (not e!223728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36594 (= res!204283 (validMask!0 mask!970))))

(assert (=> start!36594 e!223728))

(assert (=> start!36594 true))

(declare-fun array_inv!7334 (array!20859) Bool)

(assert (=> start!36594 (and (array_inv!7334 _values!506) e!223725)))

(declare-fun array_inv!7335 (array!20861) Bool)

(assert (=> start!36594 (array_inv!7335 _keys!658)))

(assert (= (and start!36594 res!204283) b!365379))

(assert (= (and b!365379 res!204284) b!365381))

(assert (= (and b!365381 res!204285) b!365382))

(assert (= (and b!365382 res!204286) b!365378))

(assert (= (and b!365380 condMapEmpty!14223) mapIsEmpty!14223))

(assert (= (and b!365380 (not condMapEmpty!14223)) mapNonEmpty!14223))

(get-info :version)

(assert (= (and mapNonEmpty!14223 ((_ is ValueCellFull!3882) mapValue!14223)) b!365383))

(assert (= (and b!365380 ((_ is ValueCellFull!3882) mapDefault!14223)) b!365377))

(assert (= start!36594 b!365380))

(declare-fun m!363113 () Bool)

(assert (=> b!365378 m!363113))

(declare-fun m!363115 () Bool)

(assert (=> b!365381 m!363115))

(declare-fun m!363117 () Bool)

(assert (=> mapNonEmpty!14223 m!363117))

(declare-fun m!363119 () Bool)

(assert (=> start!36594 m!363119))

(declare-fun m!363121 () Bool)

(assert (=> start!36594 m!363121))

(declare-fun m!363123 () Bool)

(assert (=> start!36594 m!363123))

(check-sat (not mapNonEmpty!14223) (not b!365378) (not start!36594) tp_is_empty!8451 (not b!365381))
(check-sat)
(get-model)

(declare-fun d!72331 () Bool)

(declare-fun res!204303 () Bool)

(declare-fun e!223749 () Bool)

(assert (=> d!72331 (=> res!204303 e!223749)))

(assert (=> d!72331 (= res!204303 ((_ is Nil!5521) Nil!5521))))

(assert (=> d!72331 (= (noDuplicate!184 Nil!5521) e!223749)))

(declare-fun b!365409 () Bool)

(declare-fun e!223750 () Bool)

(assert (=> b!365409 (= e!223749 e!223750)))

(declare-fun res!204304 () Bool)

(assert (=> b!365409 (=> (not res!204304) (not e!223750))))

(declare-fun contains!2431 (List!5524 (_ BitVec 64)) Bool)

(assert (=> b!365409 (= res!204304 (not (contains!2431 (t!10674 Nil!5521) (h!6376 Nil!5521))))))

(declare-fun b!365410 () Bool)

(assert (=> b!365410 (= e!223750 (noDuplicate!184 (t!10674 Nil!5521)))))

(assert (= (and d!72331 (not res!204303)) b!365409))

(assert (= (and b!365409 res!204304) b!365410))

(declare-fun m!363137 () Bool)

(assert (=> b!365409 m!363137))

(declare-fun m!363139 () Bool)

(assert (=> b!365410 m!363139))

(assert (=> b!365378 d!72331))

(declare-fun d!72333 () Bool)

(assert (=> d!72333 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36594 d!72333))

(declare-fun d!72335 () Bool)

(assert (=> d!72335 (= (array_inv!7334 _values!506) (bvsge (size!10256 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36594 d!72335))

(declare-fun d!72337 () Bool)

(assert (=> d!72337 (= (array_inv!7335 _keys!658) (bvsge (size!10257 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36594 d!72337))

(declare-fun d!72339 () Bool)

(declare-fun res!204309 () Bool)

(declare-fun e!223758 () Bool)

(assert (=> d!72339 (=> res!204309 e!223758)))

(assert (=> d!72339 (= res!204309 (bvsge #b00000000000000000000000000000000 (size!10257 _keys!658)))))

(assert (=> d!72339 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223758)))

(declare-fun b!365419 () Bool)

(declare-fun e!223757 () Bool)

(declare-fun call!27278 () Bool)

(assert (=> b!365419 (= e!223757 call!27278)))

(declare-fun b!365420 () Bool)

(declare-fun e!223759 () Bool)

(assert (=> b!365420 (= e!223759 call!27278)))

(declare-fun bm!27275 () Bool)

(assert (=> bm!27275 (= call!27278 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365421 () Bool)

(assert (=> b!365421 (= e!223758 e!223757)))

(declare-fun c!53894 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365421 (= c!53894 (validKeyInArray!0 (select (arr!9905 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365422 () Bool)

(assert (=> b!365422 (= e!223757 e!223759)))

(declare-fun lt!169173 () (_ BitVec 64))

(assert (=> b!365422 (= lt!169173 (select (arr!9905 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11386 0))(
  ( (Unit!11387) )
))
(declare-fun lt!169172 () Unit!11386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20861 (_ BitVec 64) (_ BitVec 32)) Unit!11386)

(assert (=> b!365422 (= lt!169172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169173 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365422 (arrayContainsKey!0 _keys!658 lt!169173 #b00000000000000000000000000000000)))

(declare-fun lt!169174 () Unit!11386)

(assert (=> b!365422 (= lt!169174 lt!169172)))

(declare-fun res!204310 () Bool)

(declare-datatypes ((SeekEntryResult!3502 0))(
  ( (MissingZero!3502 (index!16187 (_ BitVec 32))) (Found!3502 (index!16188 (_ BitVec 32))) (Intermediate!3502 (undefined!4314 Bool) (index!16189 (_ BitVec 32)) (x!36650 (_ BitVec 32))) (Undefined!3502) (MissingVacant!3502 (index!16190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20861 (_ BitVec 32)) SeekEntryResult!3502)

(assert (=> b!365422 (= res!204310 (= (seekEntryOrOpen!0 (select (arr!9905 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3502 #b00000000000000000000000000000000)))))

(assert (=> b!365422 (=> (not res!204310) (not e!223759))))

(assert (= (and d!72339 (not res!204309)) b!365421))

(assert (= (and b!365421 c!53894) b!365422))

(assert (= (and b!365421 (not c!53894)) b!365419))

(assert (= (and b!365422 res!204310) b!365420))

(assert (= (or b!365420 b!365419) bm!27275))

(declare-fun m!363141 () Bool)

(assert (=> bm!27275 m!363141))

(declare-fun m!363143 () Bool)

(assert (=> b!365421 m!363143))

(assert (=> b!365421 m!363143))

(declare-fun m!363145 () Bool)

(assert (=> b!365421 m!363145))

(assert (=> b!365422 m!363143))

(declare-fun m!363147 () Bool)

(assert (=> b!365422 m!363147))

(declare-fun m!363149 () Bool)

(assert (=> b!365422 m!363149))

(assert (=> b!365422 m!363143))

(declare-fun m!363151 () Bool)

(assert (=> b!365422 m!363151))

(assert (=> b!365381 d!72339))

(declare-fun mapNonEmpty!14229 () Bool)

(declare-fun mapRes!14229 () Bool)

(declare-fun tp!28305 () Bool)

(declare-fun e!223765 () Bool)

(assert (=> mapNonEmpty!14229 (= mapRes!14229 (and tp!28305 e!223765))))

(declare-fun mapKey!14229 () (_ BitVec 32))

(declare-fun mapValue!14229 () ValueCell!3882)

(declare-fun mapRest!14229 () (Array (_ BitVec 32) ValueCell!3882))

(assert (=> mapNonEmpty!14229 (= mapRest!14223 (store mapRest!14229 mapKey!14229 mapValue!14229))))

(declare-fun b!365430 () Bool)

(declare-fun e!223764 () Bool)

(assert (=> b!365430 (= e!223764 tp_is_empty!8451)))

(declare-fun mapIsEmpty!14229 () Bool)

(assert (=> mapIsEmpty!14229 mapRes!14229))

(declare-fun b!365429 () Bool)

(assert (=> b!365429 (= e!223765 tp_is_empty!8451)))

(declare-fun condMapEmpty!14229 () Bool)

(declare-fun mapDefault!14229 () ValueCell!3882)

(assert (=> mapNonEmpty!14223 (= condMapEmpty!14229 (= mapRest!14223 ((as const (Array (_ BitVec 32) ValueCell!3882)) mapDefault!14229)))))

(assert (=> mapNonEmpty!14223 (= tp!28299 (and e!223764 mapRes!14229))))

(assert (= (and mapNonEmpty!14223 condMapEmpty!14229) mapIsEmpty!14229))

(assert (= (and mapNonEmpty!14223 (not condMapEmpty!14229)) mapNonEmpty!14229))

(assert (= (and mapNonEmpty!14229 ((_ is ValueCellFull!3882) mapValue!14229)) b!365429))

(assert (= (and mapNonEmpty!14223 ((_ is ValueCellFull!3882) mapDefault!14229)) b!365430))

(declare-fun m!363153 () Bool)

(assert (=> mapNonEmpty!14229 m!363153))

(check-sat (not b!365410) (not b!365421) tp_is_empty!8451 (not b!365409) (not mapNonEmpty!14229) (not b!365422) (not bm!27275))
(check-sat)
