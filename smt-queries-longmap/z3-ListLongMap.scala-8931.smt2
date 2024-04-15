; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108300 () Bool)

(assert start!108300)

(declare-fun res!849302 () Bool)

(declare-fun e!730242 () Bool)

(assert (=> start!108300 (=> (not res!849302) (not e!730242))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108300 (= res!849302 (validMask!0 mask!2175))))

(assert (=> start!108300 e!730242))

(assert (=> start!108300 true))

(declare-datatypes ((V!49769 0))(
  ( (V!49770 (val!16824 Int)) )
))
(declare-datatypes ((ValueCell!15851 0))(
  ( (ValueCellFull!15851 (v!19422 V!49769)) (EmptyCell!15851) )
))
(declare-datatypes ((array!83987 0))(
  ( (array!83988 (arr!40499 (Array (_ BitVec 32) ValueCell!15851)) (size!41051 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!83987)

(declare-fun e!730241 () Bool)

(declare-fun array_inv!30921 (array!83987) Bool)

(assert (=> start!108300 (and (array_inv!30921 _values!1445) e!730241)))

(declare-datatypes ((array!83989 0))(
  ( (array!83990 (arr!40500 (Array (_ BitVec 32) (_ BitVec 64))) (size!41052 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!83989)

(declare-fun array_inv!30922 (array!83989) Bool)

(assert (=> start!108300 (array_inv!30922 _keys!1741)))

(declare-fun b!1278360 () Bool)

(declare-fun res!849303 () Bool)

(assert (=> b!1278360 (=> (not res!849303) (not e!730242))))

(declare-datatypes ((List!28814 0))(
  ( (Nil!28811) (Cons!28810 (h!30019 (_ BitVec 64)) (t!42346 List!28814)) )
))
(declare-fun noDuplicate!2076 (List!28814) Bool)

(assert (=> b!1278360 (= res!849303 (noDuplicate!2076 Nil!28811))))

(declare-fun b!1278361 () Bool)

(declare-fun e!730246 () Bool)

(declare-fun mapRes!51797 () Bool)

(assert (=> b!1278361 (= e!730241 (and e!730246 mapRes!51797))))

(declare-fun condMapEmpty!51797 () Bool)

(declare-fun mapDefault!51797 () ValueCell!15851)

(assert (=> b!1278361 (= condMapEmpty!51797 (= (arr!40499 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15851)) mapDefault!51797)))))

(declare-fun b!1278362 () Bool)

(declare-fun res!849306 () Bool)

(assert (=> b!1278362 (=> (not res!849306) (not e!730242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83989 (_ BitVec 32)) Bool)

(assert (=> b!1278362 (= res!849306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278363 () Bool)

(declare-fun res!849304 () Bool)

(assert (=> b!1278363 (=> (not res!849304) (not e!730242))))

(assert (=> b!1278363 (= res!849304 (and (bvsle #b00000000000000000000000000000000 (size!41052 _keys!1741)) (bvslt (size!41052 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun b!1278364 () Bool)

(declare-fun res!849301 () Bool)

(assert (=> b!1278364 (=> (not res!849301) (not e!730242))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278364 (= res!849301 (and (= (size!41051 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41052 _keys!1741) (size!41051 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51797 () Bool)

(assert (=> mapIsEmpty!51797 mapRes!51797))

(declare-fun b!1278365 () Bool)

(declare-fun e!730245 () Bool)

(assert (=> b!1278365 (= e!730242 e!730245)))

(declare-fun res!849305 () Bool)

(assert (=> b!1278365 (=> res!849305 e!730245)))

(declare-fun contains!7708 (List!28814 (_ BitVec 64)) Bool)

(assert (=> b!1278365 (= res!849305 (contains!7708 Nil!28811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278366 () Bool)

(declare-fun tp_is_empty!33499 () Bool)

(assert (=> b!1278366 (= e!730246 tp_is_empty!33499)))

(declare-fun b!1278367 () Bool)

(declare-fun e!730244 () Bool)

(assert (=> b!1278367 (= e!730244 tp_is_empty!33499)))

(declare-fun mapNonEmpty!51797 () Bool)

(declare-fun tp!98772 () Bool)

(assert (=> mapNonEmpty!51797 (= mapRes!51797 (and tp!98772 e!730244))))

(declare-fun mapValue!51797 () ValueCell!15851)

(declare-fun mapRest!51797 () (Array (_ BitVec 32) ValueCell!15851))

(declare-fun mapKey!51797 () (_ BitVec 32))

(assert (=> mapNonEmpty!51797 (= (arr!40499 _values!1445) (store mapRest!51797 mapKey!51797 mapValue!51797))))

(declare-fun b!1278368 () Bool)

(assert (=> b!1278368 (= e!730245 (contains!7708 Nil!28811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!108300 res!849302) b!1278364))

(assert (= (and b!1278364 res!849301) b!1278362))

(assert (= (and b!1278362 res!849306) b!1278363))

(assert (= (and b!1278363 res!849304) b!1278360))

(assert (= (and b!1278360 res!849303) b!1278365))

(assert (= (and b!1278365 (not res!849305)) b!1278368))

(assert (= (and b!1278361 condMapEmpty!51797) mapIsEmpty!51797))

(assert (= (and b!1278361 (not condMapEmpty!51797)) mapNonEmpty!51797))

(get-info :version)

(assert (= (and mapNonEmpty!51797 ((_ is ValueCellFull!15851) mapValue!51797)) b!1278367))

(assert (= (and b!1278361 ((_ is ValueCellFull!15851) mapDefault!51797)) b!1278366))

(assert (= start!108300 b!1278361))

(declare-fun m!1173233 () Bool)

(assert (=> mapNonEmpty!51797 m!1173233))

(declare-fun m!1173235 () Bool)

(assert (=> b!1278362 m!1173235))

(declare-fun m!1173237 () Bool)

(assert (=> b!1278360 m!1173237))

(declare-fun m!1173239 () Bool)

(assert (=> b!1278368 m!1173239))

(declare-fun m!1173241 () Bool)

(assert (=> b!1278365 m!1173241))

(declare-fun m!1173243 () Bool)

(assert (=> start!108300 m!1173243))

(declare-fun m!1173245 () Bool)

(assert (=> start!108300 m!1173245))

(declare-fun m!1173247 () Bool)

(assert (=> start!108300 m!1173247))

(check-sat (not b!1278365) (not b!1278360) (not mapNonEmpty!51797) (not start!108300) tp_is_empty!33499 (not b!1278368) (not b!1278362))
(check-sat)
(get-model)

(declare-fun b!1278431 () Bool)

(declare-fun e!730289 () Bool)

(declare-fun call!62697 () Bool)

(assert (=> b!1278431 (= e!730289 call!62697)))

(declare-fun b!1278432 () Bool)

(declare-fun e!730291 () Bool)

(assert (=> b!1278432 (= e!730291 e!730289)))

(declare-fun c!124022 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278432 (= c!124022 (validKeyInArray!0 (select (arr!40500 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1278433 () Bool)

(declare-fun e!730290 () Bool)

(assert (=> b!1278433 (= e!730290 call!62697)))

(declare-fun d!140433 () Bool)

(declare-fun res!849347 () Bool)

(assert (=> d!140433 (=> res!849347 e!730291)))

(assert (=> d!140433 (= res!849347 (bvsge #b00000000000000000000000000000000 (size!41052 _keys!1741)))))

(assert (=> d!140433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730291)))

(declare-fun bm!62694 () Bool)

(assert (=> bm!62694 (= call!62697 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1278434 () Bool)

(assert (=> b!1278434 (= e!730289 e!730290)))

(declare-fun lt!575701 () (_ BitVec 64))

(assert (=> b!1278434 (= lt!575701 (select (arr!40500 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42237 0))(
  ( (Unit!42238) )
))
(declare-fun lt!575703 () Unit!42237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83989 (_ BitVec 64) (_ BitVec 32)) Unit!42237)

(assert (=> b!1278434 (= lt!575703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!575701 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278434 (arrayContainsKey!0 _keys!1741 lt!575701 #b00000000000000000000000000000000)))

(declare-fun lt!575702 () Unit!42237)

(assert (=> b!1278434 (= lt!575702 lt!575703)))

(declare-fun res!849348 () Bool)

(declare-datatypes ((SeekEntryResult!10010 0))(
  ( (MissingZero!10010 (index!42411 (_ BitVec 32))) (Found!10010 (index!42412 (_ BitVec 32))) (Intermediate!10010 (undefined!10822 Bool) (index!42413 (_ BitVec 32)) (x!113326 (_ BitVec 32))) (Undefined!10010) (MissingVacant!10010 (index!42414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83989 (_ BitVec 32)) SeekEntryResult!10010)

(assert (=> b!1278434 (= res!849348 (= (seekEntryOrOpen!0 (select (arr!40500 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10010 #b00000000000000000000000000000000)))))

(assert (=> b!1278434 (=> (not res!849348) (not e!730290))))

(assert (= (and d!140433 (not res!849347)) b!1278432))

(assert (= (and b!1278432 c!124022) b!1278434))

(assert (= (and b!1278432 (not c!124022)) b!1278431))

(assert (= (and b!1278434 res!849348) b!1278433))

(assert (= (or b!1278433 b!1278431) bm!62694))

(declare-fun m!1173281 () Bool)

(assert (=> b!1278432 m!1173281))

(assert (=> b!1278432 m!1173281))

(declare-fun m!1173283 () Bool)

(assert (=> b!1278432 m!1173283))

(declare-fun m!1173285 () Bool)

(assert (=> bm!62694 m!1173285))

(assert (=> b!1278434 m!1173281))

(declare-fun m!1173287 () Bool)

(assert (=> b!1278434 m!1173287))

(declare-fun m!1173289 () Bool)

(assert (=> b!1278434 m!1173289))

(assert (=> b!1278434 m!1173281))

(declare-fun m!1173291 () Bool)

(assert (=> b!1278434 m!1173291))

(assert (=> b!1278362 d!140433))

(declare-fun d!140435 () Bool)

(assert (=> d!140435 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108300 d!140435))

(declare-fun d!140437 () Bool)

(assert (=> d!140437 (= (array_inv!30921 _values!1445) (bvsge (size!41051 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108300 d!140437))

(declare-fun d!140439 () Bool)

(assert (=> d!140439 (= (array_inv!30922 _keys!1741) (bvsge (size!41052 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108300 d!140439))

(declare-fun d!140441 () Bool)

(declare-fun lt!575706 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!640 (List!28814) (InoxSet (_ BitVec 64)))

(assert (=> d!140441 (= lt!575706 (select (content!640 Nil!28811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!730297 () Bool)

(assert (=> d!140441 (= lt!575706 e!730297)))

(declare-fun res!849353 () Bool)

(assert (=> d!140441 (=> (not res!849353) (not e!730297))))

(assert (=> d!140441 (= res!849353 ((_ is Cons!28810) Nil!28811))))

(assert (=> d!140441 (= (contains!7708 Nil!28811 #b1000000000000000000000000000000000000000000000000000000000000000) lt!575706)))

(declare-fun b!1278439 () Bool)

(declare-fun e!730296 () Bool)

(assert (=> b!1278439 (= e!730297 e!730296)))

(declare-fun res!849354 () Bool)

(assert (=> b!1278439 (=> res!849354 e!730296)))

(assert (=> b!1278439 (= res!849354 (= (h!30019 Nil!28811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278440 () Bool)

(assert (=> b!1278440 (= e!730296 (contains!7708 (t!42346 Nil!28811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140441 res!849353) b!1278439))

(assert (= (and b!1278439 (not res!849354)) b!1278440))

(declare-fun m!1173293 () Bool)

(assert (=> d!140441 m!1173293))

(declare-fun m!1173295 () Bool)

(assert (=> d!140441 m!1173295))

(declare-fun m!1173297 () Bool)

(assert (=> b!1278440 m!1173297))

(assert (=> b!1278368 d!140441))

(declare-fun d!140443 () Bool)

(declare-fun lt!575707 () Bool)

(assert (=> d!140443 (= lt!575707 (select (content!640 Nil!28811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!730299 () Bool)

(assert (=> d!140443 (= lt!575707 e!730299)))

(declare-fun res!849355 () Bool)

(assert (=> d!140443 (=> (not res!849355) (not e!730299))))

(assert (=> d!140443 (= res!849355 ((_ is Cons!28810) Nil!28811))))

(assert (=> d!140443 (= (contains!7708 Nil!28811 #b0000000000000000000000000000000000000000000000000000000000000000) lt!575707)))

(declare-fun b!1278441 () Bool)

(declare-fun e!730298 () Bool)

(assert (=> b!1278441 (= e!730299 e!730298)))

(declare-fun res!849356 () Bool)

(assert (=> b!1278441 (=> res!849356 e!730298)))

(assert (=> b!1278441 (= res!849356 (= (h!30019 Nil!28811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278442 () Bool)

(assert (=> b!1278442 (= e!730298 (contains!7708 (t!42346 Nil!28811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140443 res!849355) b!1278441))

(assert (= (and b!1278441 (not res!849356)) b!1278442))

(assert (=> d!140443 m!1173293))

(declare-fun m!1173299 () Bool)

(assert (=> d!140443 m!1173299))

(declare-fun m!1173301 () Bool)

(assert (=> b!1278442 m!1173301))

(assert (=> b!1278365 d!140443))

(declare-fun d!140445 () Bool)

(declare-fun res!849361 () Bool)

(declare-fun e!730304 () Bool)

(assert (=> d!140445 (=> res!849361 e!730304)))

(assert (=> d!140445 (= res!849361 ((_ is Nil!28811) Nil!28811))))

(assert (=> d!140445 (= (noDuplicate!2076 Nil!28811) e!730304)))

(declare-fun b!1278447 () Bool)

(declare-fun e!730305 () Bool)

(assert (=> b!1278447 (= e!730304 e!730305)))

(declare-fun res!849362 () Bool)

(assert (=> b!1278447 (=> (not res!849362) (not e!730305))))

(assert (=> b!1278447 (= res!849362 (not (contains!7708 (t!42346 Nil!28811) (h!30019 Nil!28811))))))

(declare-fun b!1278448 () Bool)

(assert (=> b!1278448 (= e!730305 (noDuplicate!2076 (t!42346 Nil!28811)))))

(assert (= (and d!140445 (not res!849361)) b!1278447))

(assert (= (and b!1278447 res!849362) b!1278448))

(declare-fun m!1173303 () Bool)

(assert (=> b!1278447 m!1173303))

(declare-fun m!1173305 () Bool)

(assert (=> b!1278448 m!1173305))

(assert (=> b!1278360 d!140445))

(declare-fun b!1278455 () Bool)

(declare-fun e!730310 () Bool)

(assert (=> b!1278455 (= e!730310 tp_is_empty!33499)))

(declare-fun mapIsEmpty!51806 () Bool)

(declare-fun mapRes!51806 () Bool)

(assert (=> mapIsEmpty!51806 mapRes!51806))

(declare-fun mapNonEmpty!51806 () Bool)

(declare-fun tp!98781 () Bool)

(assert (=> mapNonEmpty!51806 (= mapRes!51806 (and tp!98781 e!730310))))

(declare-fun mapValue!51806 () ValueCell!15851)

(declare-fun mapKey!51806 () (_ BitVec 32))

(declare-fun mapRest!51806 () (Array (_ BitVec 32) ValueCell!15851))

(assert (=> mapNonEmpty!51806 (= mapRest!51797 (store mapRest!51806 mapKey!51806 mapValue!51806))))

(declare-fun condMapEmpty!51806 () Bool)

(declare-fun mapDefault!51806 () ValueCell!15851)

(assert (=> mapNonEmpty!51797 (= condMapEmpty!51806 (= mapRest!51797 ((as const (Array (_ BitVec 32) ValueCell!15851)) mapDefault!51806)))))

(declare-fun e!730311 () Bool)

(assert (=> mapNonEmpty!51797 (= tp!98772 (and e!730311 mapRes!51806))))

(declare-fun b!1278456 () Bool)

(assert (=> b!1278456 (= e!730311 tp_is_empty!33499)))

(assert (= (and mapNonEmpty!51797 condMapEmpty!51806) mapIsEmpty!51806))

(assert (= (and mapNonEmpty!51797 (not condMapEmpty!51806)) mapNonEmpty!51806))

(assert (= (and mapNonEmpty!51806 ((_ is ValueCellFull!15851) mapValue!51806)) b!1278455))

(assert (= (and mapNonEmpty!51797 ((_ is ValueCellFull!15851) mapDefault!51806)) b!1278456))

(declare-fun m!1173307 () Bool)

(assert (=> mapNonEmpty!51806 m!1173307))

(check-sat (not b!1278442) (not d!140443) (not bm!62694) (not b!1278447) (not d!140441) (not b!1278448) (not b!1278432) (not b!1278434) (not b!1278440) tp_is_empty!33499 (not mapNonEmpty!51806))
(check-sat)
