; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38396 () Bool)

(assert start!38396)

(declare-fun b!396113 () Bool)

(declare-fun res!227219 () Bool)

(declare-fun e!239726 () Bool)

(assert (=> b!396113 (=> (not res!227219) (not e!239726))))

(declare-datatypes ((array!23596 0))(
  ( (array!23597 (arr!11248 (Array (_ BitVec 32) (_ BitVec 64))) (size!11600 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23596)

(assert (=> b!396113 (= res!227219 (and (bvsle #b00000000000000000000000000000000 (size!11600 _keys!709)) (bvslt (size!11600 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!396114 () Bool)

(declare-fun e!239725 () Bool)

(declare-datatypes ((List!6389 0))(
  ( (Nil!6386) (Cons!6385 (h!7241 (_ BitVec 64)) (t!11555 List!6389)) )
))
(declare-fun contains!2462 (List!6389 (_ BitVec 64)) Bool)

(assert (=> b!396114 (= e!239725 (contains!2462 Nil!6386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396115 () Bool)

(declare-fun res!227226 () Bool)

(assert (=> b!396115 (=> (not res!227226) (not e!239726))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14235 0))(
  ( (V!14236 (val!4968 Int)) )
))
(declare-datatypes ((ValueCell!4580 0))(
  ( (ValueCellFull!4580 (v!7215 V!14235)) (EmptyCell!4580) )
))
(declare-datatypes ((array!23598 0))(
  ( (array!23599 (arr!11249 (Array (_ BitVec 32) ValueCell!4580)) (size!11601 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23598)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396115 (= res!227226 (and (= (size!11601 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11600 _keys!709) (size!11601 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396116 () Bool)

(declare-fun res!227230 () Bool)

(assert (=> b!396116 (=> (not res!227230) (not e!239726))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396116 (= res!227230 (or (= (select (arr!11248 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11248 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396117 () Bool)

(declare-fun res!227229 () Bool)

(assert (=> b!396117 (=> (not res!227229) (not e!239726))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396117 (= res!227229 (validKeyInArray!0 k0!794))))

(declare-fun b!396118 () Bool)

(declare-fun res!227223 () Bool)

(assert (=> b!396118 (=> (not res!227223) (not e!239726))))

(assert (=> b!396118 (= res!227223 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11600 _keys!709))))))

(declare-fun b!396119 () Bool)

(declare-fun e!239724 () Bool)

(declare-fun tp_is_empty!9847 () Bool)

(assert (=> b!396119 (= e!239724 tp_is_empty!9847)))

(declare-fun b!396120 () Bool)

(declare-fun e!239723 () Bool)

(assert (=> b!396120 (= e!239723 tp_is_empty!9847)))

(declare-fun b!396121 () Bool)

(declare-fun e!239722 () Bool)

(declare-fun mapRes!16389 () Bool)

(assert (=> b!396121 (= e!239722 (and e!239723 mapRes!16389))))

(declare-fun condMapEmpty!16389 () Bool)

(declare-fun mapDefault!16389 () ValueCell!4580)

(assert (=> b!396121 (= condMapEmpty!16389 (= (arr!11249 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4580)) mapDefault!16389)))))

(declare-fun res!227227 () Bool)

(assert (=> start!38396 (=> (not res!227227) (not e!239726))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38396 (= res!227227 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11600 _keys!709))))))

(assert (=> start!38396 e!239726))

(assert (=> start!38396 true))

(declare-fun array_inv!8314 (array!23598) Bool)

(assert (=> start!38396 (and (array_inv!8314 _values!549) e!239722)))

(declare-fun array_inv!8315 (array!23596) Bool)

(assert (=> start!38396 (array_inv!8315 _keys!709)))

(declare-fun b!396122 () Bool)

(declare-fun res!227228 () Bool)

(assert (=> b!396122 (=> (not res!227228) (not e!239726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396122 (= res!227228 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16389 () Bool)

(declare-fun tp!32184 () Bool)

(assert (=> mapNonEmpty!16389 (= mapRes!16389 (and tp!32184 e!239724))))

(declare-fun mapRest!16389 () (Array (_ BitVec 32) ValueCell!4580))

(declare-fun mapKey!16389 () (_ BitVec 32))

(declare-fun mapValue!16389 () ValueCell!4580)

(assert (=> mapNonEmpty!16389 (= (arr!11249 _values!549) (store mapRest!16389 mapKey!16389 mapValue!16389))))

(declare-fun b!396123 () Bool)

(declare-fun res!227220 () Bool)

(assert (=> b!396123 (=> (not res!227220) (not e!239726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23596 (_ BitVec 32)) Bool)

(assert (=> b!396123 (= res!227220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709)) mask!1025))))

(declare-fun b!396124 () Bool)

(assert (=> b!396124 (= e!239726 e!239725)))

(declare-fun res!227231 () Bool)

(assert (=> b!396124 (=> res!227231 e!239725)))

(assert (=> b!396124 (= res!227231 (contains!2462 Nil!6386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396125 () Bool)

(declare-fun res!227221 () Bool)

(assert (=> b!396125 (=> (not res!227221) (not e!239726))))

(assert (=> b!396125 (= res!227221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396126 () Bool)

(declare-fun res!227225 () Bool)

(assert (=> b!396126 (=> (not res!227225) (not e!239726))))

(declare-fun noDuplicate!200 (List!6389) Bool)

(assert (=> b!396126 (= res!227225 (noDuplicate!200 Nil!6386))))

(declare-fun b!396127 () Bool)

(declare-fun res!227222 () Bool)

(assert (=> b!396127 (=> (not res!227222) (not e!239726))))

(declare-fun arrayContainsKey!0 (array!23596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396127 (= res!227222 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396128 () Bool)

(declare-fun res!227224 () Bool)

(assert (=> b!396128 (=> (not res!227224) (not e!239726))))

(declare-fun arrayNoDuplicates!0 (array!23596 (_ BitVec 32) List!6389) Bool)

(assert (=> b!396128 (= res!227224 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6386))))

(declare-fun mapIsEmpty!16389 () Bool)

(assert (=> mapIsEmpty!16389 mapRes!16389))

(assert (= (and start!38396 res!227227) b!396122))

(assert (= (and b!396122 res!227228) b!396115))

(assert (= (and b!396115 res!227226) b!396125))

(assert (= (and b!396125 res!227221) b!396128))

(assert (= (and b!396128 res!227224) b!396118))

(assert (= (and b!396118 res!227223) b!396117))

(assert (= (and b!396117 res!227229) b!396116))

(assert (= (and b!396116 res!227230) b!396127))

(assert (= (and b!396127 res!227222) b!396123))

(assert (= (and b!396123 res!227220) b!396113))

(assert (= (and b!396113 res!227219) b!396126))

(assert (= (and b!396126 res!227225) b!396124))

(assert (= (and b!396124 (not res!227231)) b!396114))

(assert (= (and b!396121 condMapEmpty!16389) mapIsEmpty!16389))

(assert (= (and b!396121 (not condMapEmpty!16389)) mapNonEmpty!16389))

(get-info :version)

(assert (= (and mapNonEmpty!16389 ((_ is ValueCellFull!4580) mapValue!16389)) b!396119))

(assert (= (and b!396121 ((_ is ValueCellFull!4580) mapDefault!16389)) b!396120))

(assert (= start!38396 b!396121))

(declare-fun m!392123 () Bool)

(assert (=> b!396116 m!392123))

(declare-fun m!392125 () Bool)

(assert (=> b!396124 m!392125))

(declare-fun m!392127 () Bool)

(assert (=> mapNonEmpty!16389 m!392127))

(declare-fun m!392129 () Bool)

(assert (=> b!396126 m!392129))

(declare-fun m!392131 () Bool)

(assert (=> b!396122 m!392131))

(declare-fun m!392133 () Bool)

(assert (=> b!396114 m!392133))

(declare-fun m!392135 () Bool)

(assert (=> b!396125 m!392135))

(declare-fun m!392137 () Bool)

(assert (=> start!38396 m!392137))

(declare-fun m!392139 () Bool)

(assert (=> start!38396 m!392139))

(declare-fun m!392141 () Bool)

(assert (=> b!396117 m!392141))

(declare-fun m!392143 () Bool)

(assert (=> b!396128 m!392143))

(declare-fun m!392145 () Bool)

(assert (=> b!396123 m!392145))

(declare-fun m!392147 () Bool)

(assert (=> b!396123 m!392147))

(declare-fun m!392149 () Bool)

(assert (=> b!396127 m!392149))

(check-sat tp_is_empty!9847 (not b!396114) (not start!38396) (not mapNonEmpty!16389) (not b!396126) (not b!396117) (not b!396127) (not b!396128) (not b!396123) (not b!396122) (not b!396125) (not b!396124))
(check-sat)
(get-model)

(declare-fun d!73425 () Bool)

(declare-fun res!227314 () Bool)

(declare-fun e!239769 () Bool)

(assert (=> d!73425 (=> res!227314 e!239769)))

(assert (=> d!73425 (= res!227314 (bvsge #b00000000000000000000000000000000 (size!11600 _keys!709)))))

(assert (=> d!73425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239769)))

(declare-fun b!396233 () Bool)

(declare-fun e!239770 () Bool)

(declare-fun call!27879 () Bool)

(assert (=> b!396233 (= e!239770 call!27879)))

(declare-fun bm!27876 () Bool)

(assert (=> bm!27876 (= call!27879 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!396234 () Bool)

(declare-fun e!239771 () Bool)

(assert (=> b!396234 (= e!239769 e!239771)))

(declare-fun c!54545 () Bool)

(assert (=> b!396234 (= c!54545 (validKeyInArray!0 (select (arr!11248 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396235 () Bool)

(assert (=> b!396235 (= e!239771 e!239770)))

(declare-fun lt!187144 () (_ BitVec 64))

(assert (=> b!396235 (= lt!187144 (select (arr!11248 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12045 0))(
  ( (Unit!12046) )
))
(declare-fun lt!187143 () Unit!12045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23596 (_ BitVec 64) (_ BitVec 32)) Unit!12045)

(assert (=> b!396235 (= lt!187143 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187144 #b00000000000000000000000000000000))))

(assert (=> b!396235 (arrayContainsKey!0 _keys!709 lt!187144 #b00000000000000000000000000000000)))

(declare-fun lt!187145 () Unit!12045)

(assert (=> b!396235 (= lt!187145 lt!187143)))

(declare-fun res!227315 () Bool)

(declare-datatypes ((SeekEntryResult!3475 0))(
  ( (MissingZero!3475 (index!16079 (_ BitVec 32))) (Found!3475 (index!16080 (_ BitVec 32))) (Intermediate!3475 (undefined!4287 Bool) (index!16081 (_ BitVec 32)) (x!38640 (_ BitVec 32))) (Undefined!3475) (MissingVacant!3475 (index!16082 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23596 (_ BitVec 32)) SeekEntryResult!3475)

(assert (=> b!396235 (= res!227315 (= (seekEntryOrOpen!0 (select (arr!11248 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3475 #b00000000000000000000000000000000)))))

(assert (=> b!396235 (=> (not res!227315) (not e!239770))))

(declare-fun b!396236 () Bool)

(assert (=> b!396236 (= e!239771 call!27879)))

(assert (= (and d!73425 (not res!227314)) b!396234))

(assert (= (and b!396234 c!54545) b!396235))

(assert (= (and b!396234 (not c!54545)) b!396236))

(assert (= (and b!396235 res!227315) b!396233))

(assert (= (or b!396233 b!396236) bm!27876))

(declare-fun m!392207 () Bool)

(assert (=> bm!27876 m!392207))

(declare-fun m!392209 () Bool)

(assert (=> b!396234 m!392209))

(assert (=> b!396234 m!392209))

(declare-fun m!392211 () Bool)

(assert (=> b!396234 m!392211))

(assert (=> b!396235 m!392209))

(declare-fun m!392213 () Bool)

(assert (=> b!396235 m!392213))

(declare-fun m!392215 () Bool)

(assert (=> b!396235 m!392215))

(assert (=> b!396235 m!392209))

(declare-fun m!392217 () Bool)

(assert (=> b!396235 m!392217))

(assert (=> b!396125 d!73425))

(declare-fun d!73427 () Bool)

(declare-fun lt!187148 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!204 (List!6389) (InoxSet (_ BitVec 64)))

(assert (=> d!73427 (= lt!187148 (select (content!204 Nil!6386) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239776 () Bool)

(assert (=> d!73427 (= lt!187148 e!239776)))

(declare-fun res!227320 () Bool)

(assert (=> d!73427 (=> (not res!227320) (not e!239776))))

(assert (=> d!73427 (= res!227320 ((_ is Cons!6385) Nil!6386))))

(assert (=> d!73427 (= (contains!2462 Nil!6386 #b0000000000000000000000000000000000000000000000000000000000000000) lt!187148)))

(declare-fun b!396241 () Bool)

(declare-fun e!239777 () Bool)

(assert (=> b!396241 (= e!239776 e!239777)))

(declare-fun res!227321 () Bool)

(assert (=> b!396241 (=> res!227321 e!239777)))

(assert (=> b!396241 (= res!227321 (= (h!7241 Nil!6386) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396242 () Bool)

(assert (=> b!396242 (= e!239777 (contains!2462 (t!11555 Nil!6386) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73427 res!227320) b!396241))

(assert (= (and b!396241 (not res!227321)) b!396242))

(declare-fun m!392219 () Bool)

(assert (=> d!73427 m!392219))

(declare-fun m!392221 () Bool)

(assert (=> d!73427 m!392221))

(declare-fun m!392223 () Bool)

(assert (=> b!396242 m!392223))

(assert (=> b!396124 d!73427))

(declare-fun d!73429 () Bool)

(declare-fun res!227326 () Bool)

(declare-fun e!239782 () Bool)

(assert (=> d!73429 (=> res!227326 e!239782)))

(assert (=> d!73429 (= res!227326 ((_ is Nil!6386) Nil!6386))))

(assert (=> d!73429 (= (noDuplicate!200 Nil!6386) e!239782)))

(declare-fun b!396247 () Bool)

(declare-fun e!239783 () Bool)

(assert (=> b!396247 (= e!239782 e!239783)))

(declare-fun res!227327 () Bool)

(assert (=> b!396247 (=> (not res!227327) (not e!239783))))

(assert (=> b!396247 (= res!227327 (not (contains!2462 (t!11555 Nil!6386) (h!7241 Nil!6386))))))

(declare-fun b!396248 () Bool)

(assert (=> b!396248 (= e!239783 (noDuplicate!200 (t!11555 Nil!6386)))))

(assert (= (and d!73429 (not res!227326)) b!396247))

(assert (= (and b!396247 res!227327) b!396248))

(declare-fun m!392225 () Bool)

(assert (=> b!396247 m!392225))

(declare-fun m!392227 () Bool)

(assert (=> b!396248 m!392227))

(assert (=> b!396126 d!73429))

(declare-fun d!73431 () Bool)

(assert (=> d!73431 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!396122 d!73431))

(declare-fun d!73433 () Bool)

(assert (=> d!73433 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!396117 d!73433))

(declare-fun d!73435 () Bool)

(declare-fun res!227332 () Bool)

(declare-fun e!239788 () Bool)

(assert (=> d!73435 (=> res!227332 e!239788)))

(assert (=> d!73435 (= res!227332 (= (select (arr!11248 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73435 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239788)))

(declare-fun b!396253 () Bool)

(declare-fun e!239789 () Bool)

(assert (=> b!396253 (= e!239788 e!239789)))

(declare-fun res!227333 () Bool)

(assert (=> b!396253 (=> (not res!227333) (not e!239789))))

(assert (=> b!396253 (= res!227333 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11600 _keys!709)))))

(declare-fun b!396254 () Bool)

(assert (=> b!396254 (= e!239789 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73435 (not res!227332)) b!396253))

(assert (= (and b!396253 res!227333) b!396254))

(assert (=> d!73435 m!392209))

(declare-fun m!392229 () Bool)

(assert (=> b!396254 m!392229))

(assert (=> b!396127 d!73435))

(declare-fun d!73437 () Bool)

(declare-fun lt!187149 () Bool)

(assert (=> d!73437 (= lt!187149 (select (content!204 Nil!6386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239790 () Bool)

(assert (=> d!73437 (= lt!187149 e!239790)))

(declare-fun res!227334 () Bool)

(assert (=> d!73437 (=> (not res!227334) (not e!239790))))

(assert (=> d!73437 (= res!227334 ((_ is Cons!6385) Nil!6386))))

(assert (=> d!73437 (= (contains!2462 Nil!6386 #b1000000000000000000000000000000000000000000000000000000000000000) lt!187149)))

(declare-fun b!396255 () Bool)

(declare-fun e!239791 () Bool)

(assert (=> b!396255 (= e!239790 e!239791)))

(declare-fun res!227335 () Bool)

(assert (=> b!396255 (=> res!227335 e!239791)))

(assert (=> b!396255 (= res!227335 (= (h!7241 Nil!6386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396256 () Bool)

(assert (=> b!396256 (= e!239791 (contains!2462 (t!11555 Nil!6386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73437 res!227334) b!396255))

(assert (= (and b!396255 (not res!227335)) b!396256))

(assert (=> d!73437 m!392219))

(declare-fun m!392231 () Bool)

(assert (=> d!73437 m!392231))

(declare-fun m!392233 () Bool)

(assert (=> b!396256 m!392233))

(assert (=> b!396114 d!73437))

(declare-fun b!396267 () Bool)

(declare-fun e!239801 () Bool)

(assert (=> b!396267 (= e!239801 (contains!2462 Nil!6386 (select (arr!11248 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!27879 () Bool)

(declare-fun call!27882 () Bool)

(declare-fun c!54548 () Bool)

(assert (=> bm!27879 (= call!27882 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54548 (Cons!6385 (select (arr!11248 _keys!709) #b00000000000000000000000000000000) Nil!6386) Nil!6386)))))

(declare-fun d!73439 () Bool)

(declare-fun res!227342 () Bool)

(declare-fun e!239802 () Bool)

(assert (=> d!73439 (=> res!227342 e!239802)))

(assert (=> d!73439 (= res!227342 (bvsge #b00000000000000000000000000000000 (size!11600 _keys!709)))))

(assert (=> d!73439 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6386) e!239802)))

(declare-fun b!396268 () Bool)

(declare-fun e!239803 () Bool)

(assert (=> b!396268 (= e!239802 e!239803)))

(declare-fun res!227344 () Bool)

(assert (=> b!396268 (=> (not res!227344) (not e!239803))))

(assert (=> b!396268 (= res!227344 (not e!239801))))

(declare-fun res!227343 () Bool)

(assert (=> b!396268 (=> (not res!227343) (not e!239801))))

(assert (=> b!396268 (= res!227343 (validKeyInArray!0 (select (arr!11248 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396269 () Bool)

(declare-fun e!239800 () Bool)

(assert (=> b!396269 (= e!239800 call!27882)))

(declare-fun b!396270 () Bool)

(assert (=> b!396270 (= e!239800 call!27882)))

(declare-fun b!396271 () Bool)

(assert (=> b!396271 (= e!239803 e!239800)))

(assert (=> b!396271 (= c!54548 (validKeyInArray!0 (select (arr!11248 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73439 (not res!227342)) b!396268))

(assert (= (and b!396268 res!227343) b!396267))

(assert (= (and b!396268 res!227344) b!396271))

(assert (= (and b!396271 c!54548) b!396270))

(assert (= (and b!396271 (not c!54548)) b!396269))

(assert (= (or b!396270 b!396269) bm!27879))

(assert (=> b!396267 m!392209))

(assert (=> b!396267 m!392209))

(declare-fun m!392235 () Bool)

(assert (=> b!396267 m!392235))

(assert (=> bm!27879 m!392209))

(declare-fun m!392237 () Bool)

(assert (=> bm!27879 m!392237))

(assert (=> b!396268 m!392209))

(assert (=> b!396268 m!392209))

(assert (=> b!396268 m!392211))

(assert (=> b!396271 m!392209))

(assert (=> b!396271 m!392209))

(assert (=> b!396271 m!392211))

(assert (=> b!396128 d!73439))

(declare-fun d!73441 () Bool)

(declare-fun res!227345 () Bool)

(declare-fun e!239804 () Bool)

(assert (=> d!73441 (=> res!227345 e!239804)))

(assert (=> d!73441 (= res!227345 (bvsge #b00000000000000000000000000000000 (size!11600 (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709)))))))

(assert (=> d!73441 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709)) mask!1025) e!239804)))

(declare-fun b!396272 () Bool)

(declare-fun e!239805 () Bool)

(declare-fun call!27883 () Bool)

(assert (=> b!396272 (= e!239805 call!27883)))

(declare-fun bm!27880 () Bool)

(assert (=> bm!27880 (= call!27883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709)) mask!1025))))

(declare-fun b!396273 () Bool)

(declare-fun e!239806 () Bool)

(assert (=> b!396273 (= e!239804 e!239806)))

(declare-fun c!54549 () Bool)

(assert (=> b!396273 (= c!54549 (validKeyInArray!0 (select (arr!11248 (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709))) #b00000000000000000000000000000000)))))

(declare-fun b!396274 () Bool)

(assert (=> b!396274 (= e!239806 e!239805)))

(declare-fun lt!187151 () (_ BitVec 64))

(assert (=> b!396274 (= lt!187151 (select (arr!11248 (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709))) #b00000000000000000000000000000000))))

(declare-fun lt!187150 () Unit!12045)

(assert (=> b!396274 (= lt!187150 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709)) lt!187151 #b00000000000000000000000000000000))))

(assert (=> b!396274 (arrayContainsKey!0 (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709)) lt!187151 #b00000000000000000000000000000000)))

(declare-fun lt!187152 () Unit!12045)

(assert (=> b!396274 (= lt!187152 lt!187150)))

(declare-fun res!227346 () Bool)

(assert (=> b!396274 (= res!227346 (= (seekEntryOrOpen!0 (select (arr!11248 (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709))) #b00000000000000000000000000000000) (array!23597 (store (arr!11248 _keys!709) i!563 k0!794) (size!11600 _keys!709)) mask!1025) (Found!3475 #b00000000000000000000000000000000)))))

(assert (=> b!396274 (=> (not res!227346) (not e!239805))))

(declare-fun b!396275 () Bool)

(assert (=> b!396275 (= e!239806 call!27883)))

(assert (= (and d!73441 (not res!227345)) b!396273))

(assert (= (and b!396273 c!54549) b!396274))

(assert (= (and b!396273 (not c!54549)) b!396275))

(assert (= (and b!396274 res!227346) b!396272))

(assert (= (or b!396272 b!396275) bm!27880))

(declare-fun m!392239 () Bool)

(assert (=> bm!27880 m!392239))

(declare-fun m!392241 () Bool)

(assert (=> b!396273 m!392241))

(assert (=> b!396273 m!392241))

(declare-fun m!392243 () Bool)

(assert (=> b!396273 m!392243))

(assert (=> b!396274 m!392241))

(declare-fun m!392245 () Bool)

(assert (=> b!396274 m!392245))

(declare-fun m!392247 () Bool)

(assert (=> b!396274 m!392247))

(assert (=> b!396274 m!392241))

(declare-fun m!392249 () Bool)

(assert (=> b!396274 m!392249))

(assert (=> b!396123 d!73441))

(declare-fun d!73443 () Bool)

(assert (=> d!73443 (= (array_inv!8314 _values!549) (bvsge (size!11601 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38396 d!73443))

(declare-fun d!73445 () Bool)

(assert (=> d!73445 (= (array_inv!8315 _keys!709) (bvsge (size!11600 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38396 d!73445))

(declare-fun condMapEmpty!16398 () Bool)

(declare-fun mapDefault!16398 () ValueCell!4580)

(assert (=> mapNonEmpty!16389 (= condMapEmpty!16398 (= mapRest!16389 ((as const (Array (_ BitVec 32) ValueCell!4580)) mapDefault!16398)))))

(declare-fun e!239811 () Bool)

(declare-fun mapRes!16398 () Bool)

(assert (=> mapNonEmpty!16389 (= tp!32184 (and e!239811 mapRes!16398))))

(declare-fun mapNonEmpty!16398 () Bool)

(declare-fun tp!32193 () Bool)

(declare-fun e!239812 () Bool)

(assert (=> mapNonEmpty!16398 (= mapRes!16398 (and tp!32193 e!239812))))

(declare-fun mapKey!16398 () (_ BitVec 32))

(declare-fun mapRest!16398 () (Array (_ BitVec 32) ValueCell!4580))

(declare-fun mapValue!16398 () ValueCell!4580)

(assert (=> mapNonEmpty!16398 (= mapRest!16389 (store mapRest!16398 mapKey!16398 mapValue!16398))))

(declare-fun mapIsEmpty!16398 () Bool)

(assert (=> mapIsEmpty!16398 mapRes!16398))

(declare-fun b!396282 () Bool)

(assert (=> b!396282 (= e!239812 tp_is_empty!9847)))

(declare-fun b!396283 () Bool)

(assert (=> b!396283 (= e!239811 tp_is_empty!9847)))

(assert (= (and mapNonEmpty!16389 condMapEmpty!16398) mapIsEmpty!16398))

(assert (= (and mapNonEmpty!16389 (not condMapEmpty!16398)) mapNonEmpty!16398))

(assert (= (and mapNonEmpty!16398 ((_ is ValueCellFull!4580) mapValue!16398)) b!396282))

(assert (= (and mapNonEmpty!16389 ((_ is ValueCellFull!4580) mapDefault!16398)) b!396283))

(declare-fun m!392251 () Bool)

(assert (=> mapNonEmpty!16398 m!392251))

(check-sat tp_is_empty!9847 (not b!396268) (not bm!27880) (not b!396274) (not b!396254) (not b!396248) (not d!73427) (not b!396256) (not b!396235) (not b!396242) (not b!396273) (not b!396247) (not bm!27876) (not b!396271) (not mapNonEmpty!16398) (not d!73437) (not b!396267) (not bm!27879) (not b!396234))
(check-sat)
