; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38292 () Bool)

(assert start!38292)

(declare-fun b!394980 () Bool)

(declare-fun res!226407 () Bool)

(declare-fun e!239134 () Bool)

(assert (=> b!394980 (=> (not res!226407) (not e!239134))))

(declare-datatypes ((List!6501 0))(
  ( (Nil!6498) (Cons!6497 (h!7353 (_ BitVec 64)) (t!11675 List!6501)) )
))
(declare-fun noDuplicate!196 (List!6501) Bool)

(assert (=> b!394980 (= res!226407 (noDuplicate!196 Nil!6498))))

(declare-fun b!394981 () Bool)

(declare-fun e!239137 () Bool)

(declare-fun tp_is_empty!9783 () Bool)

(assert (=> b!394981 (= e!239137 tp_is_empty!9783)))

(declare-fun b!394982 () Bool)

(declare-fun e!239138 () Bool)

(assert (=> b!394982 (= e!239134 e!239138)))

(declare-fun res!226410 () Bool)

(assert (=> b!394982 (=> res!226410 e!239138)))

(declare-fun contains!2478 (List!6501 (_ BitVec 64)) Bool)

(assert (=> b!394982 (= res!226410 (contains!2478 Nil!6498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394983 () Bool)

(declare-fun e!239133 () Bool)

(assert (=> b!394983 (= e!239133 tp_is_empty!9783)))

(declare-fun b!394984 () Bool)

(declare-fun res!226412 () Bool)

(assert (=> b!394984 (=> (not res!226412) (not e!239134))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394984 (= res!226412 (validMask!0 mask!1025))))

(declare-fun res!226408 () Bool)

(assert (=> start!38292 (=> (not res!226408) (not e!239134))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23473 0))(
  ( (array!23474 (arr!11191 (Array (_ BitVec 32) (_ BitVec 64))) (size!11543 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23473)

(assert (=> start!38292 (= res!226408 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11543 _keys!709))))))

(assert (=> start!38292 e!239134))

(assert (=> start!38292 true))

(declare-datatypes ((V!14149 0))(
  ( (V!14150 (val!4936 Int)) )
))
(declare-datatypes ((ValueCell!4548 0))(
  ( (ValueCellFull!4548 (v!7181 V!14149)) (EmptyCell!4548) )
))
(declare-datatypes ((array!23475 0))(
  ( (array!23476 (arr!11192 (Array (_ BitVec 32) ValueCell!4548)) (size!11544 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23475)

(declare-fun e!239135 () Bool)

(declare-fun array_inv!8212 (array!23475) Bool)

(assert (=> start!38292 (and (array_inv!8212 _values!549) e!239135)))

(declare-fun array_inv!8213 (array!23473) Bool)

(assert (=> start!38292 (array_inv!8213 _keys!709)))

(declare-fun mapIsEmpty!16281 () Bool)

(declare-fun mapRes!16281 () Bool)

(assert (=> mapIsEmpty!16281 mapRes!16281))

(declare-fun b!394985 () Bool)

(declare-fun res!226406 () Bool)

(assert (=> b!394985 (=> (not res!226406) (not e!239134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23473 (_ BitVec 32)) Bool)

(assert (=> b!394985 (= res!226406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394986 () Bool)

(assert (=> b!394986 (= e!239135 (and e!239133 mapRes!16281))))

(declare-fun condMapEmpty!16281 () Bool)

(declare-fun mapDefault!16281 () ValueCell!4548)

(assert (=> b!394986 (= condMapEmpty!16281 (= (arr!11192 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4548)) mapDefault!16281)))))

(declare-fun b!394987 () Bool)

(declare-fun res!226409 () Bool)

(assert (=> b!394987 (=> (not res!226409) (not e!239134))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394987 (= res!226409 (and (= (size!11544 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11543 _keys!709) (size!11544 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394988 () Bool)

(assert (=> b!394988 (= e!239138 (contains!2478 Nil!6498 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!16281 () Bool)

(declare-fun tp!32076 () Bool)

(assert (=> mapNonEmpty!16281 (= mapRes!16281 (and tp!32076 e!239137))))

(declare-fun mapRest!16281 () (Array (_ BitVec 32) ValueCell!4548))

(declare-fun mapKey!16281 () (_ BitVec 32))

(declare-fun mapValue!16281 () ValueCell!4548)

(assert (=> mapNonEmpty!16281 (= (arr!11192 _values!549) (store mapRest!16281 mapKey!16281 mapValue!16281))))

(declare-fun b!394989 () Bool)

(declare-fun res!226411 () Bool)

(assert (=> b!394989 (=> (not res!226411) (not e!239134))))

(assert (=> b!394989 (= res!226411 (and (bvsle #b00000000000000000000000000000000 (size!11543 _keys!709)) (bvslt (size!11543 _keys!709) #b01111111111111111111111111111111)))))

(assert (= (and start!38292 res!226408) b!394984))

(assert (= (and b!394984 res!226412) b!394987))

(assert (= (and b!394987 res!226409) b!394985))

(assert (= (and b!394985 res!226406) b!394989))

(assert (= (and b!394989 res!226411) b!394980))

(assert (= (and b!394980 res!226407) b!394982))

(assert (= (and b!394982 (not res!226410)) b!394988))

(assert (= (and b!394986 condMapEmpty!16281) mapIsEmpty!16281))

(assert (= (and b!394986 (not condMapEmpty!16281)) mapNonEmpty!16281))

(get-info :version)

(assert (= (and mapNonEmpty!16281 ((_ is ValueCellFull!4548) mapValue!16281)) b!394981))

(assert (= (and b!394986 ((_ is ValueCellFull!4548) mapDefault!16281)) b!394983))

(assert (= start!38292 b!394986))

(declare-fun m!391231 () Bool)

(assert (=> start!38292 m!391231))

(declare-fun m!391233 () Bool)

(assert (=> start!38292 m!391233))

(declare-fun m!391235 () Bool)

(assert (=> b!394982 m!391235))

(declare-fun m!391237 () Bool)

(assert (=> mapNonEmpty!16281 m!391237))

(declare-fun m!391239 () Bool)

(assert (=> b!394988 m!391239))

(declare-fun m!391241 () Bool)

(assert (=> b!394985 m!391241))

(declare-fun m!391243 () Bool)

(assert (=> b!394984 m!391243))

(declare-fun m!391245 () Bool)

(assert (=> b!394980 m!391245))

(check-sat (not b!394985) (not start!38292) (not b!394982) (not mapNonEmpty!16281) (not b!394984) tp_is_empty!9783 (not b!394980) (not b!394988))
(check-sat)
(get-model)

(declare-fun d!73313 () Bool)

(declare-fun res!226438 () Bool)

(declare-fun e!239161 () Bool)

(assert (=> d!73313 (=> res!226438 e!239161)))

(assert (=> d!73313 (= res!226438 ((_ is Nil!6498) Nil!6498))))

(assert (=> d!73313 (= (noDuplicate!196 Nil!6498) e!239161)))

(declare-fun b!395024 () Bool)

(declare-fun e!239162 () Bool)

(assert (=> b!395024 (= e!239161 e!239162)))

(declare-fun res!226439 () Bool)

(assert (=> b!395024 (=> (not res!226439) (not e!239162))))

(assert (=> b!395024 (= res!226439 (not (contains!2478 (t!11675 Nil!6498) (h!7353 Nil!6498))))))

(declare-fun b!395025 () Bool)

(assert (=> b!395025 (= e!239162 (noDuplicate!196 (t!11675 Nil!6498)))))

(assert (= (and d!73313 (not res!226438)) b!395024))

(assert (= (and b!395024 res!226439) b!395025))

(declare-fun m!391263 () Bool)

(assert (=> b!395024 m!391263))

(declare-fun m!391265 () Bool)

(assert (=> b!395025 m!391265))

(assert (=> b!394980 d!73313))

(declare-fun d!73315 () Bool)

(declare-fun lt!187047 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!201 (List!6501) (InoxSet (_ BitVec 64)))

(assert (=> d!73315 (= lt!187047 (select (content!201 Nil!6498) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239167 () Bool)

(assert (=> d!73315 (= lt!187047 e!239167)))

(declare-fun res!226444 () Bool)

(assert (=> d!73315 (=> (not res!226444) (not e!239167))))

(assert (=> d!73315 (= res!226444 ((_ is Cons!6497) Nil!6498))))

(assert (=> d!73315 (= (contains!2478 Nil!6498 #b1000000000000000000000000000000000000000000000000000000000000000) lt!187047)))

(declare-fun b!395030 () Bool)

(declare-fun e!239168 () Bool)

(assert (=> b!395030 (= e!239167 e!239168)))

(declare-fun res!226445 () Bool)

(assert (=> b!395030 (=> res!226445 e!239168)))

(assert (=> b!395030 (= res!226445 (= (h!7353 Nil!6498) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!395031 () Bool)

(assert (=> b!395031 (= e!239168 (contains!2478 (t!11675 Nil!6498) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73315 res!226444) b!395030))

(assert (= (and b!395030 (not res!226445)) b!395031))

(declare-fun m!391267 () Bool)

(assert (=> d!73315 m!391267))

(declare-fun m!391269 () Bool)

(assert (=> d!73315 m!391269))

(declare-fun m!391271 () Bool)

(assert (=> b!395031 m!391271))

(assert (=> b!394988 d!73315))

(declare-fun d!73317 () Bool)

(assert (=> d!73317 (= (array_inv!8212 _values!549) (bvsge (size!11544 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38292 d!73317))

(declare-fun d!73319 () Bool)

(assert (=> d!73319 (= (array_inv!8213 _keys!709) (bvsge (size!11543 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38292 d!73319))

(declare-fun d!73321 () Bool)

(assert (=> d!73321 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394984 d!73321))

(declare-fun d!73323 () Bool)

(declare-fun lt!187048 () Bool)

(assert (=> d!73323 (= lt!187048 (select (content!201 Nil!6498) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239169 () Bool)

(assert (=> d!73323 (= lt!187048 e!239169)))

(declare-fun res!226446 () Bool)

(assert (=> d!73323 (=> (not res!226446) (not e!239169))))

(assert (=> d!73323 (= res!226446 ((_ is Cons!6497) Nil!6498))))

(assert (=> d!73323 (= (contains!2478 Nil!6498 #b0000000000000000000000000000000000000000000000000000000000000000) lt!187048)))

(declare-fun b!395032 () Bool)

(declare-fun e!239170 () Bool)

(assert (=> b!395032 (= e!239169 e!239170)))

(declare-fun res!226447 () Bool)

(assert (=> b!395032 (=> res!226447 e!239170)))

(assert (=> b!395032 (= res!226447 (= (h!7353 Nil!6498) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!395033 () Bool)

(assert (=> b!395033 (= e!239170 (contains!2478 (t!11675 Nil!6498) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73323 res!226446) b!395032))

(assert (= (and b!395032 (not res!226447)) b!395033))

(assert (=> d!73323 m!391267))

(declare-fun m!391273 () Bool)

(assert (=> d!73323 m!391273))

(declare-fun m!391275 () Bool)

(assert (=> b!395033 m!391275))

(assert (=> b!394982 d!73323))

(declare-fun b!395042 () Bool)

(declare-fun e!239177 () Bool)

(declare-fun e!239179 () Bool)

(assert (=> b!395042 (= e!239177 e!239179)))

(declare-fun lt!187055 () (_ BitVec 64))

(assert (=> b!395042 (= lt!187055 (select (arr!11191 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12068 0))(
  ( (Unit!12069) )
))
(declare-fun lt!187056 () Unit!12068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23473 (_ BitVec 64) (_ BitVec 32)) Unit!12068)

(assert (=> b!395042 (= lt!187056 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187055 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395042 (arrayContainsKey!0 _keys!709 lt!187055 #b00000000000000000000000000000000)))

(declare-fun lt!187057 () Unit!12068)

(assert (=> b!395042 (= lt!187057 lt!187056)))

(declare-fun res!226452 () Bool)

(declare-datatypes ((SeekEntryResult!3522 0))(
  ( (MissingZero!3522 (index!16267 (_ BitVec 32))) (Found!3522 (index!16268 (_ BitVec 32))) (Intermediate!3522 (undefined!4334 Bool) (index!16269 (_ BitVec 32)) (x!38594 (_ BitVec 32))) (Undefined!3522) (MissingVacant!3522 (index!16270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23473 (_ BitVec 32)) SeekEntryResult!3522)

(assert (=> b!395042 (= res!226452 (= (seekEntryOrOpen!0 (select (arr!11191 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3522 #b00000000000000000000000000000000)))))

(assert (=> b!395042 (=> (not res!226452) (not e!239179))))

(declare-fun b!395043 () Bool)

(declare-fun call!27869 () Bool)

(assert (=> b!395043 (= e!239179 call!27869)))

(declare-fun d!73325 () Bool)

(declare-fun res!226453 () Bool)

(declare-fun e!239178 () Bool)

(assert (=> d!73325 (=> res!226453 e!239178)))

(assert (=> d!73325 (= res!226453 (bvsge #b00000000000000000000000000000000 (size!11543 _keys!709)))))

(assert (=> d!73325 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239178)))

(declare-fun b!395044 () Bool)

(assert (=> b!395044 (= e!239178 e!239177)))

(declare-fun c!54545 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395044 (= c!54545 (validKeyInArray!0 (select (arr!11191 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395045 () Bool)

(assert (=> b!395045 (= e!239177 call!27869)))

(declare-fun bm!27866 () Bool)

(assert (=> bm!27866 (= call!27869 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!73325 (not res!226453)) b!395044))

(assert (= (and b!395044 c!54545) b!395042))

(assert (= (and b!395044 (not c!54545)) b!395045))

(assert (= (and b!395042 res!226452) b!395043))

(assert (= (or b!395043 b!395045) bm!27866))

(declare-fun m!391277 () Bool)

(assert (=> b!395042 m!391277))

(declare-fun m!391279 () Bool)

(assert (=> b!395042 m!391279))

(declare-fun m!391281 () Bool)

(assert (=> b!395042 m!391281))

(assert (=> b!395042 m!391277))

(declare-fun m!391283 () Bool)

(assert (=> b!395042 m!391283))

(assert (=> b!395044 m!391277))

(assert (=> b!395044 m!391277))

(declare-fun m!391285 () Bool)

(assert (=> b!395044 m!391285))

(declare-fun m!391287 () Bool)

(assert (=> bm!27866 m!391287))

(assert (=> b!394985 d!73325))

(declare-fun mapIsEmpty!16287 () Bool)

(declare-fun mapRes!16287 () Bool)

(assert (=> mapIsEmpty!16287 mapRes!16287))

(declare-fun mapNonEmpty!16287 () Bool)

(declare-fun tp!32082 () Bool)

(declare-fun e!239184 () Bool)

(assert (=> mapNonEmpty!16287 (= mapRes!16287 (and tp!32082 e!239184))))

(declare-fun mapRest!16287 () (Array (_ BitVec 32) ValueCell!4548))

(declare-fun mapKey!16287 () (_ BitVec 32))

(declare-fun mapValue!16287 () ValueCell!4548)

(assert (=> mapNonEmpty!16287 (= mapRest!16281 (store mapRest!16287 mapKey!16287 mapValue!16287))))

(declare-fun condMapEmpty!16287 () Bool)

(declare-fun mapDefault!16287 () ValueCell!4548)

(assert (=> mapNonEmpty!16281 (= condMapEmpty!16287 (= mapRest!16281 ((as const (Array (_ BitVec 32) ValueCell!4548)) mapDefault!16287)))))

(declare-fun e!239185 () Bool)

(assert (=> mapNonEmpty!16281 (= tp!32076 (and e!239185 mapRes!16287))))

(declare-fun b!395053 () Bool)

(assert (=> b!395053 (= e!239185 tp_is_empty!9783)))

(declare-fun b!395052 () Bool)

(assert (=> b!395052 (= e!239184 tp_is_empty!9783)))

(assert (= (and mapNonEmpty!16281 condMapEmpty!16287) mapIsEmpty!16287))

(assert (= (and mapNonEmpty!16281 (not condMapEmpty!16287)) mapNonEmpty!16287))

(assert (= (and mapNonEmpty!16287 ((_ is ValueCellFull!4548) mapValue!16287)) b!395052))

(assert (= (and mapNonEmpty!16281 ((_ is ValueCellFull!4548) mapDefault!16287)) b!395053))

(declare-fun m!391289 () Bool)

(assert (=> mapNonEmpty!16287 m!391289))

(check-sat (not b!395031) (not d!73323) (not b!395024) (not b!395033) (not b!395044) (not bm!27866) tp_is_empty!9783 (not b!395025) (not d!73315) (not b!395042) (not mapNonEmpty!16287))
(check-sat)
