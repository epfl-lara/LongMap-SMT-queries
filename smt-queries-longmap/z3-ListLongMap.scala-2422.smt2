; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38262 () Bool)

(assert start!38262)

(declare-fun mapIsEmpty!16257 () Bool)

(declare-fun mapRes!16257 () Bool)

(assert (=> mapIsEmpty!16257 mapRes!16257))

(declare-fun b!394784 () Bool)

(declare-fun e!239005 () Bool)

(declare-fun tp_is_empty!9771 () Bool)

(assert (=> b!394784 (= e!239005 tp_is_empty!9771)))

(declare-fun mapNonEmpty!16257 () Bool)

(declare-fun tp!32052 () Bool)

(declare-fun e!239004 () Bool)

(assert (=> mapNonEmpty!16257 (= mapRes!16257 (and tp!32052 e!239004))))

(declare-datatypes ((V!14133 0))(
  ( (V!14134 (val!4930 Int)) )
))
(declare-datatypes ((ValueCell!4542 0))(
  ( (ValueCellFull!4542 (v!7175 V!14133)) (EmptyCell!4542) )
))
(declare-fun mapRest!16257 () (Array (_ BitVec 32) ValueCell!4542))

(declare-datatypes ((array!23447 0))(
  ( (array!23448 (arr!11180 (Array (_ BitVec 32) ValueCell!4542)) (size!11532 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23447)

(declare-fun mapKey!16257 () (_ BitVec 32))

(declare-fun mapValue!16257 () ValueCell!4542)

(assert (=> mapNonEmpty!16257 (= (arr!11180 _values!549) (store mapRest!16257 mapKey!16257 mapValue!16257))))

(declare-fun b!394785 () Bool)

(declare-fun e!239002 () Bool)

(declare-datatypes ((array!23449 0))(
  ( (array!23450 (arr!11181 (Array (_ BitVec 32) (_ BitVec 64))) (size!11533 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23449)

(assert (=> b!394785 (= e!239002 (and (bvsle #b00000000000000000000000000000000 (size!11533 _keys!709)) (bvsge (size!11533 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394786 () Bool)

(declare-fun res!226295 () Bool)

(assert (=> b!394786 (=> (not res!226295) (not e!239002))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23449 (_ BitVec 32)) Bool)

(assert (=> b!394786 (= res!226295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!226293 () Bool)

(assert (=> start!38262 (=> (not res!226293) (not e!239002))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38262 (= res!226293 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11533 _keys!709))))))

(assert (=> start!38262 e!239002))

(assert (=> start!38262 true))

(declare-fun e!239003 () Bool)

(declare-fun array_inv!8206 (array!23447) Bool)

(assert (=> start!38262 (and (array_inv!8206 _values!549) e!239003)))

(declare-fun array_inv!8207 (array!23449) Bool)

(assert (=> start!38262 (array_inv!8207 _keys!709)))

(declare-fun b!394787 () Bool)

(declare-fun res!226294 () Bool)

(assert (=> b!394787 (=> (not res!226294) (not e!239002))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394787 (= res!226294 (and (= (size!11532 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11533 _keys!709) (size!11532 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394788 () Bool)

(declare-fun res!226292 () Bool)

(assert (=> b!394788 (=> (not res!226292) (not e!239002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394788 (= res!226292 (validMask!0 mask!1025))))

(declare-fun b!394789 () Bool)

(assert (=> b!394789 (= e!239003 (and e!239005 mapRes!16257))))

(declare-fun condMapEmpty!16257 () Bool)

(declare-fun mapDefault!16257 () ValueCell!4542)

(assert (=> b!394789 (= condMapEmpty!16257 (= (arr!11180 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4542)) mapDefault!16257)))))

(declare-fun b!394790 () Bool)

(assert (=> b!394790 (= e!239004 tp_is_empty!9771)))

(assert (= (and start!38262 res!226293) b!394788))

(assert (= (and b!394788 res!226292) b!394787))

(assert (= (and b!394787 res!226294) b!394786))

(assert (= (and b!394786 res!226295) b!394785))

(assert (= (and b!394789 condMapEmpty!16257) mapIsEmpty!16257))

(assert (= (and b!394789 (not condMapEmpty!16257)) mapNonEmpty!16257))

(get-info :version)

(assert (= (and mapNonEmpty!16257 ((_ is ValueCellFull!4542) mapValue!16257)) b!394790))

(assert (= (and b!394789 ((_ is ValueCellFull!4542) mapDefault!16257)) b!394784))

(assert (= start!38262 b!394789))

(declare-fun m!391127 () Bool)

(assert (=> mapNonEmpty!16257 m!391127))

(declare-fun m!391129 () Bool)

(assert (=> b!394786 m!391129))

(declare-fun m!391131 () Bool)

(assert (=> start!38262 m!391131))

(declare-fun m!391133 () Bool)

(assert (=> start!38262 m!391133))

(declare-fun m!391135 () Bool)

(assert (=> b!394788 m!391135))

(check-sat (not start!38262) (not b!394786) (not mapNonEmpty!16257) tp_is_empty!9771 (not b!394788))
(check-sat)
(get-model)

(declare-fun d!73291 () Bool)

(declare-fun res!226313 () Bool)

(declare-fun e!239029 () Bool)

(assert (=> d!73291 (=> res!226313 e!239029)))

(assert (=> d!73291 (= res!226313 (bvsge #b00000000000000000000000000000000 (size!11533 _keys!709)))))

(assert (=> d!73291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239029)))

(declare-fun b!394820 () Bool)

(declare-fun e!239030 () Bool)

(declare-fun call!27863 () Bool)

(assert (=> b!394820 (= e!239030 call!27863)))

(declare-fun b!394821 () Bool)

(declare-fun e!239028 () Bool)

(assert (=> b!394821 (= e!239028 call!27863)))

(declare-fun bm!27860 () Bool)

(assert (=> bm!27860 (= call!27863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!394822 () Bool)

(assert (=> b!394822 (= e!239029 e!239030)))

(declare-fun c!54539 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394822 (= c!54539 (validKeyInArray!0 (select (arr!11181 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!394823 () Bool)

(assert (=> b!394823 (= e!239030 e!239028)))

(declare-fun lt!187035 () (_ BitVec 64))

(assert (=> b!394823 (= lt!187035 (select (arr!11181 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12064 0))(
  ( (Unit!12065) )
))
(declare-fun lt!187033 () Unit!12064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23449 (_ BitVec 64) (_ BitVec 32)) Unit!12064)

(assert (=> b!394823 (= lt!187033 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187035 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394823 (arrayContainsKey!0 _keys!709 lt!187035 #b00000000000000000000000000000000)))

(declare-fun lt!187034 () Unit!12064)

(assert (=> b!394823 (= lt!187034 lt!187033)))

(declare-fun res!226312 () Bool)

(declare-datatypes ((SeekEntryResult!3520 0))(
  ( (MissingZero!3520 (index!16259 (_ BitVec 32))) (Found!3520 (index!16260 (_ BitVec 32))) (Intermediate!3520 (undefined!4332 Bool) (index!16261 (_ BitVec 32)) (x!38572 (_ BitVec 32))) (Undefined!3520) (MissingVacant!3520 (index!16262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23449 (_ BitVec 32)) SeekEntryResult!3520)

(assert (=> b!394823 (= res!226312 (= (seekEntryOrOpen!0 (select (arr!11181 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3520 #b00000000000000000000000000000000)))))

(assert (=> b!394823 (=> (not res!226312) (not e!239028))))

(assert (= (and d!73291 (not res!226313)) b!394822))

(assert (= (and b!394822 c!54539) b!394823))

(assert (= (and b!394822 (not c!54539)) b!394820))

(assert (= (and b!394823 res!226312) b!394821))

(assert (= (or b!394821 b!394820) bm!27860))

(declare-fun m!391147 () Bool)

(assert (=> bm!27860 m!391147))

(declare-fun m!391149 () Bool)

(assert (=> b!394822 m!391149))

(assert (=> b!394822 m!391149))

(declare-fun m!391151 () Bool)

(assert (=> b!394822 m!391151))

(assert (=> b!394823 m!391149))

(declare-fun m!391153 () Bool)

(assert (=> b!394823 m!391153))

(declare-fun m!391155 () Bool)

(assert (=> b!394823 m!391155))

(assert (=> b!394823 m!391149))

(declare-fun m!391157 () Bool)

(assert (=> b!394823 m!391157))

(assert (=> b!394786 d!73291))

(declare-fun d!73293 () Bool)

(assert (=> d!73293 (= (array_inv!8206 _values!549) (bvsge (size!11532 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38262 d!73293))

(declare-fun d!73295 () Bool)

(assert (=> d!73295 (= (array_inv!8207 _keys!709) (bvsge (size!11533 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38262 d!73295))

(declare-fun d!73297 () Bool)

(assert (=> d!73297 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394788 d!73297))

(declare-fun condMapEmpty!16263 () Bool)

(declare-fun mapDefault!16263 () ValueCell!4542)

(assert (=> mapNonEmpty!16257 (= condMapEmpty!16263 (= mapRest!16257 ((as const (Array (_ BitVec 32) ValueCell!4542)) mapDefault!16263)))))

(declare-fun e!239035 () Bool)

(declare-fun mapRes!16263 () Bool)

(assert (=> mapNonEmpty!16257 (= tp!32052 (and e!239035 mapRes!16263))))

(declare-fun b!394831 () Bool)

(assert (=> b!394831 (= e!239035 tp_is_empty!9771)))

(declare-fun mapNonEmpty!16263 () Bool)

(declare-fun tp!32058 () Bool)

(declare-fun e!239036 () Bool)

(assert (=> mapNonEmpty!16263 (= mapRes!16263 (and tp!32058 e!239036))))

(declare-fun mapRest!16263 () (Array (_ BitVec 32) ValueCell!4542))

(declare-fun mapKey!16263 () (_ BitVec 32))

(declare-fun mapValue!16263 () ValueCell!4542)

(assert (=> mapNonEmpty!16263 (= mapRest!16257 (store mapRest!16263 mapKey!16263 mapValue!16263))))

(declare-fun b!394830 () Bool)

(assert (=> b!394830 (= e!239036 tp_is_empty!9771)))

(declare-fun mapIsEmpty!16263 () Bool)

(assert (=> mapIsEmpty!16263 mapRes!16263))

(assert (= (and mapNonEmpty!16257 condMapEmpty!16263) mapIsEmpty!16263))

(assert (= (and mapNonEmpty!16257 (not condMapEmpty!16263)) mapNonEmpty!16263))

(assert (= (and mapNonEmpty!16263 ((_ is ValueCellFull!4542) mapValue!16263)) b!394830))

(assert (= (and mapNonEmpty!16257 ((_ is ValueCellFull!4542) mapDefault!16263)) b!394831))

(declare-fun m!391159 () Bool)

(assert (=> mapNonEmpty!16263 m!391159))

(check-sat (not mapNonEmpty!16263) (not bm!27860) (not b!394823) tp_is_empty!9771 (not b!394822))
(check-sat)
