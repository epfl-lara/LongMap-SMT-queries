; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33478 () Bool)

(assert start!33478)

(declare-fun b!332144 () Bool)

(declare-fun res!182997 () Bool)

(declare-fun e!203949 () Bool)

(assert (=> b!332144 (=> (not res!182997) (not e!203949))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332144 (= res!182997 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11502 () Bool)

(declare-fun mapRes!11502 () Bool)

(assert (=> mapIsEmpty!11502 mapRes!11502))

(declare-fun b!332145 () Bool)

(declare-fun e!203946 () Bool)

(declare-fun tp_is_empty!6745 () Bool)

(assert (=> b!332145 (= e!203946 tp_is_empty!6745)))

(declare-fun b!332146 () Bool)

(declare-fun res!182996 () Bool)

(assert (=> b!332146 (=> (not res!182996) (not e!203949))))

(declare-datatypes ((array!17069 0))(
  ( (array!17070 (arr!8069 (Array (_ BitVec 32) (_ BitVec 64))) (size!8422 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17069)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17069 (_ BitVec 32)) Bool)

(assert (=> b!332146 (= res!182996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332147 () Bool)

(declare-fun res!182999 () Bool)

(assert (=> b!332147 (=> (not res!182999) (not e!203949))))

(declare-datatypes ((V!9971 0))(
  ( (V!9972 (val!3417 Int)) )
))
(declare-datatypes ((ValueCell!3029 0))(
  ( (ValueCellFull!3029 (v!5570 V!9971)) (EmptyCell!3029) )
))
(declare-datatypes ((array!17071 0))(
  ( (array!17072 (arr!8070 (Array (_ BitVec 32) ValueCell!3029)) (size!8423 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17071)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332147 (= res!182999 (and (= (size!8423 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8422 _keys!1895) (size!8423 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11502 () Bool)

(declare-fun tp!23877 () Bool)

(assert (=> mapNonEmpty!11502 (= mapRes!11502 (and tp!23877 e!203946))))

(declare-fun mapKey!11502 () (_ BitVec 32))

(declare-fun mapRest!11502 () (Array (_ BitVec 32) ValueCell!3029))

(declare-fun mapValue!11502 () ValueCell!3029)

(assert (=> mapNonEmpty!11502 (= (arr!8070 _values!1525) (store mapRest!11502 mapKey!11502 mapValue!11502))))

(declare-fun b!332148 () Bool)

(declare-fun res!182995 () Bool)

(assert (=> b!332148 (=> (not res!182995) (not e!203949))))

(declare-datatypes ((List!4561 0))(
  ( (Nil!4558) (Cons!4557 (h!5413 (_ BitVec 64)) (t!9634 List!4561)) )
))
(declare-fun arrayNoDuplicates!0 (array!17069 (_ BitVec 32) List!4561) Bool)

(assert (=> b!332148 (= res!182995 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4558))))

(declare-fun res!182998 () Bool)

(assert (=> start!33478 (=> (not res!182998) (not e!203949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33478 (= res!182998 (validMask!0 mask!2385))))

(assert (=> start!33478 e!203949))

(assert (=> start!33478 true))

(declare-fun e!203947 () Bool)

(declare-fun array_inv!6026 (array!17071) Bool)

(assert (=> start!33478 (and (array_inv!6026 _values!1525) e!203947)))

(declare-fun array_inv!6027 (array!17069) Bool)

(assert (=> start!33478 (array_inv!6027 _keys!1895)))

(declare-fun b!332149 () Bool)

(declare-fun e!203950 () Bool)

(assert (=> b!332149 (= e!203950 tp_is_empty!6745)))

(declare-fun b!332150 () Bool)

(assert (=> b!332150 (= e!203949 (bvsgt #b00000000000000000000000000000000 (size!8422 _keys!1895)))))

(declare-fun b!332151 () Bool)

(assert (=> b!332151 (= e!203947 (and e!203950 mapRes!11502))))

(declare-fun condMapEmpty!11502 () Bool)

(declare-fun mapDefault!11502 () ValueCell!3029)

(assert (=> b!332151 (= condMapEmpty!11502 (= (arr!8070 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3029)) mapDefault!11502)))))

(assert (= (and start!33478 res!182998) b!332147))

(assert (= (and b!332147 res!182999) b!332146))

(assert (= (and b!332146 res!182996) b!332148))

(assert (= (and b!332148 res!182995) b!332144))

(assert (= (and b!332144 res!182997) b!332150))

(assert (= (and b!332151 condMapEmpty!11502) mapIsEmpty!11502))

(assert (= (and b!332151 (not condMapEmpty!11502)) mapNonEmpty!11502))

(get-info :version)

(assert (= (and mapNonEmpty!11502 ((_ is ValueCellFull!3029) mapValue!11502)) b!332145))

(assert (= (and b!332151 ((_ is ValueCellFull!3029) mapDefault!11502)) b!332149))

(assert (= start!33478 b!332151))

(declare-fun m!336215 () Bool)

(assert (=> mapNonEmpty!11502 m!336215))

(declare-fun m!336217 () Bool)

(assert (=> b!332148 m!336217))

(declare-fun m!336219 () Bool)

(assert (=> b!332146 m!336219))

(declare-fun m!336221 () Bool)

(assert (=> start!33478 m!336221))

(declare-fun m!336223 () Bool)

(assert (=> start!33478 m!336223))

(declare-fun m!336225 () Bool)

(assert (=> start!33478 m!336225))

(declare-fun m!336227 () Bool)

(assert (=> b!332144 m!336227))

(check-sat (not start!33478) tp_is_empty!6745 (not b!332148) (not b!332144) (not b!332146) (not mapNonEmpty!11502))
(check-sat)
(get-model)

(declare-fun d!70315 () Bool)

(assert (=> d!70315 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332144 d!70315))

(declare-fun b!332208 () Bool)

(declare-fun e!203989 () Bool)

(declare-fun e!203987 () Bool)

(assert (=> b!332208 (= e!203989 e!203987)))

(declare-fun c!52010 () Bool)

(assert (=> b!332208 (= c!52010 (validKeyInArray!0 (select (arr!8069 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332209 () Bool)

(declare-fun e!203988 () Bool)

(declare-fun call!26186 () Bool)

(assert (=> b!332209 (= e!203988 call!26186)))

(declare-fun d!70317 () Bool)

(declare-fun res!183035 () Bool)

(assert (=> d!70317 (=> res!183035 e!203989)))

(assert (=> d!70317 (= res!183035 (bvsge #b00000000000000000000000000000000 (size!8422 _keys!1895)))))

(assert (=> d!70317 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203989)))

(declare-fun b!332210 () Bool)

(assert (=> b!332210 (= e!203987 call!26186)))

(declare-fun bm!26183 () Bool)

(assert (=> bm!26183 (= call!26186 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!332211 () Bool)

(assert (=> b!332211 (= e!203987 e!203988)))

(declare-fun lt!158783 () (_ BitVec 64))

(assert (=> b!332211 (= lt!158783 (select (arr!8069 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10336 0))(
  ( (Unit!10337) )
))
(declare-fun lt!158784 () Unit!10336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17069 (_ BitVec 64) (_ BitVec 32)) Unit!10336)

(assert (=> b!332211 (= lt!158784 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158783 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!332211 (arrayContainsKey!0 _keys!1895 lt!158783 #b00000000000000000000000000000000)))

(declare-fun lt!158782 () Unit!10336)

(assert (=> b!332211 (= lt!158782 lt!158784)))

(declare-fun res!183034 () Bool)

(declare-datatypes ((SeekEntryResult!3126 0))(
  ( (MissingZero!3126 (index!14683 (_ BitVec 32))) (Found!3126 (index!14684 (_ BitVec 32))) (Intermediate!3126 (undefined!3938 Bool) (index!14685 (_ BitVec 32)) (x!33105 (_ BitVec 32))) (Undefined!3126) (MissingVacant!3126 (index!14686 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17069 (_ BitVec 32)) SeekEntryResult!3126)

(assert (=> b!332211 (= res!183034 (= (seekEntryOrOpen!0 (select (arr!8069 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3126 #b00000000000000000000000000000000)))))

(assert (=> b!332211 (=> (not res!183034) (not e!203988))))

(assert (= (and d!70317 (not res!183035)) b!332208))

(assert (= (and b!332208 c!52010) b!332211))

(assert (= (and b!332208 (not c!52010)) b!332210))

(assert (= (and b!332211 res!183034) b!332209))

(assert (= (or b!332209 b!332210) bm!26183))

(declare-fun m!336257 () Bool)

(assert (=> b!332208 m!336257))

(assert (=> b!332208 m!336257))

(declare-fun m!336259 () Bool)

(assert (=> b!332208 m!336259))

(declare-fun m!336261 () Bool)

(assert (=> bm!26183 m!336261))

(assert (=> b!332211 m!336257))

(declare-fun m!336263 () Bool)

(assert (=> b!332211 m!336263))

(declare-fun m!336265 () Bool)

(assert (=> b!332211 m!336265))

(assert (=> b!332211 m!336257))

(declare-fun m!336267 () Bool)

(assert (=> b!332211 m!336267))

(assert (=> b!332146 d!70317))

(declare-fun b!332222 () Bool)

(declare-fun e!203999 () Bool)

(declare-fun e!204000 () Bool)

(assert (=> b!332222 (= e!203999 e!204000)))

(declare-fun res!183044 () Bool)

(assert (=> b!332222 (=> (not res!183044) (not e!204000))))

(declare-fun e!204001 () Bool)

(assert (=> b!332222 (= res!183044 (not e!204001))))

(declare-fun res!183042 () Bool)

(assert (=> b!332222 (=> (not res!183042) (not e!204001))))

(assert (=> b!332222 (= res!183042 (validKeyInArray!0 (select (arr!8069 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332223 () Bool)

(declare-fun contains!1981 (List!4561 (_ BitVec 64)) Bool)

(assert (=> b!332223 (= e!204001 (contains!1981 Nil!4558 (select (arr!8069 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332224 () Bool)

(declare-fun e!203998 () Bool)

(assert (=> b!332224 (= e!204000 e!203998)))

(declare-fun c!52013 () Bool)

(assert (=> b!332224 (= c!52013 (validKeyInArray!0 (select (arr!8069 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26186 () Bool)

(declare-fun call!26189 () Bool)

(assert (=> bm!26186 (= call!26189 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52013 (Cons!4557 (select (arr!8069 _keys!1895) #b00000000000000000000000000000000) Nil!4558) Nil!4558)))))

(declare-fun b!332225 () Bool)

(assert (=> b!332225 (= e!203998 call!26189)))

(declare-fun d!70319 () Bool)

(declare-fun res!183043 () Bool)

(assert (=> d!70319 (=> res!183043 e!203999)))

(assert (=> d!70319 (= res!183043 (bvsge #b00000000000000000000000000000000 (size!8422 _keys!1895)))))

(assert (=> d!70319 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4558) e!203999)))

(declare-fun b!332226 () Bool)

(assert (=> b!332226 (= e!203998 call!26189)))

(assert (= (and d!70319 (not res!183043)) b!332222))

(assert (= (and b!332222 res!183042) b!332223))

(assert (= (and b!332222 res!183044) b!332224))

(assert (= (and b!332224 c!52013) b!332226))

(assert (= (and b!332224 (not c!52013)) b!332225))

(assert (= (or b!332226 b!332225) bm!26186))

(assert (=> b!332222 m!336257))

(assert (=> b!332222 m!336257))

(assert (=> b!332222 m!336259))

(assert (=> b!332223 m!336257))

(assert (=> b!332223 m!336257))

(declare-fun m!336269 () Bool)

(assert (=> b!332223 m!336269))

(assert (=> b!332224 m!336257))

(assert (=> b!332224 m!336257))

(assert (=> b!332224 m!336259))

(assert (=> bm!26186 m!336257))

(declare-fun m!336271 () Bool)

(assert (=> bm!26186 m!336271))

(assert (=> b!332148 d!70319))

(declare-fun d!70321 () Bool)

(assert (=> d!70321 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33478 d!70321))

(declare-fun d!70323 () Bool)

(assert (=> d!70323 (= (array_inv!6026 _values!1525) (bvsge (size!8423 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33478 d!70323))

(declare-fun d!70325 () Bool)

(assert (=> d!70325 (= (array_inv!6027 _keys!1895) (bvsge (size!8422 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33478 d!70325))

(declare-fun b!332234 () Bool)

(declare-fun e!204006 () Bool)

(assert (=> b!332234 (= e!204006 tp_is_empty!6745)))

(declare-fun condMapEmpty!11511 () Bool)

(declare-fun mapDefault!11511 () ValueCell!3029)

(assert (=> mapNonEmpty!11502 (= condMapEmpty!11511 (= mapRest!11502 ((as const (Array (_ BitVec 32) ValueCell!3029)) mapDefault!11511)))))

(declare-fun mapRes!11511 () Bool)

(assert (=> mapNonEmpty!11502 (= tp!23877 (and e!204006 mapRes!11511))))

(declare-fun b!332233 () Bool)

(declare-fun e!204007 () Bool)

(assert (=> b!332233 (= e!204007 tp_is_empty!6745)))

(declare-fun mapIsEmpty!11511 () Bool)

(assert (=> mapIsEmpty!11511 mapRes!11511))

(declare-fun mapNonEmpty!11511 () Bool)

(declare-fun tp!23886 () Bool)

(assert (=> mapNonEmpty!11511 (= mapRes!11511 (and tp!23886 e!204007))))

(declare-fun mapRest!11511 () (Array (_ BitVec 32) ValueCell!3029))

(declare-fun mapValue!11511 () ValueCell!3029)

(declare-fun mapKey!11511 () (_ BitVec 32))

(assert (=> mapNonEmpty!11511 (= mapRest!11502 (store mapRest!11511 mapKey!11511 mapValue!11511))))

(assert (= (and mapNonEmpty!11502 condMapEmpty!11511) mapIsEmpty!11511))

(assert (= (and mapNonEmpty!11502 (not condMapEmpty!11511)) mapNonEmpty!11511))

(assert (= (and mapNonEmpty!11511 ((_ is ValueCellFull!3029) mapValue!11511)) b!332233))

(assert (= (and mapNonEmpty!11502 ((_ is ValueCellFull!3029) mapDefault!11511)) b!332234))

(declare-fun m!336273 () Bool)

(assert (=> mapNonEmpty!11511 m!336273))

(check-sat (not bm!26183) (not b!332208) (not b!332222) (not bm!26186) tp_is_empty!6745 (not b!332223) (not b!332211) (not mapNonEmpty!11511) (not b!332224))
(check-sat)
