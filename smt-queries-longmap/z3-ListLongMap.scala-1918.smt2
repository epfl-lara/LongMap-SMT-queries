; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34120 () Bool)

(assert start!34120)

(declare-fun b_free!7177 () Bool)

(declare-fun b_next!7177 () Bool)

(assert (=> start!34120 (= b_free!7177 (not b_next!7177))))

(declare-fun tp!25062 () Bool)

(declare-fun b_and!14349 () Bool)

(assert (=> start!34120 (= tp!25062 b_and!14349)))

(declare-fun b!339874 () Bool)

(declare-fun res!187739 () Bool)

(declare-fun e!208502 () Bool)

(assert (=> b!339874 (=> (not res!187739) (not e!208502))))

(declare-datatypes ((array!17835 0))(
  ( (array!17836 (arr!8439 (Array (_ BitVec 32) (_ BitVec 64))) (size!8792 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17835)

(declare-datatypes ((List!4806 0))(
  ( (Nil!4803) (Cons!4802 (h!5658 (_ BitVec 64)) (t!9903 List!4806)) )
))
(declare-fun arrayNoDuplicates!0 (array!17835 (_ BitVec 32) List!4806) Bool)

(assert (=> b!339874 (= res!187739 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4803))))

(declare-fun b!339876 () Bool)

(declare-fun res!187737 () Bool)

(assert (=> b!339876 (=> (not res!187737) (not e!208502))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17835 (_ BitVec 32)) Bool)

(assert (=> b!339876 (= res!187737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339877 () Bool)

(declare-fun res!187738 () Bool)

(assert (=> b!339877 (=> (not res!187738) (not e!208502))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10483 0))(
  ( (V!10484 (val!3609 Int)) )
))
(declare-fun zeroValue!1467 () V!10483)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3221 0))(
  ( (ValueCellFull!3221 (v!5774 V!10483)) (EmptyCell!3221) )
))
(declare-datatypes ((array!17837 0))(
  ( (array!17838 (arr!8440 (Array (_ BitVec 32) ValueCell!3221)) (size!8793 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17837)

(declare-fun minValue!1467 () V!10483)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5182 0))(
  ( (tuple2!5183 (_1!2602 (_ BitVec 64)) (_2!2602 V!10483)) )
))
(declare-datatypes ((List!4807 0))(
  ( (Nil!4804) (Cons!4803 (h!5659 tuple2!5182) (t!9904 List!4807)) )
))
(declare-datatypes ((ListLongMap!4085 0))(
  ( (ListLongMap!4086 (toList!2058 List!4807)) )
))
(declare-fun contains!2122 (ListLongMap!4085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1564 (array!17835 array!17837 (_ BitVec 32) (_ BitVec 32) V!10483 V!10483 (_ BitVec 32) Int) ListLongMap!4085)

(assert (=> b!339877 (= res!187738 (not (contains!2122 (getCurrentListMap!1564 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339878 () Bool)

(declare-fun e!208501 () Bool)

(assert (=> b!339878 (= e!208502 e!208501)))

(declare-fun res!187740 () Bool)

(assert (=> b!339878 (=> (not res!187740) (not e!208501))))

(declare-datatypes ((SeekEntryResult!3254 0))(
  ( (MissingZero!3254 (index!15195 (_ BitVec 32))) (Found!3254 (index!15196 (_ BitVec 32))) (Intermediate!3254 (undefined!4066 Bool) (index!15197 (_ BitVec 32)) (x!33865 (_ BitVec 32))) (Undefined!3254) (MissingVacant!3254 (index!15198 (_ BitVec 32))) )
))
(declare-fun lt!161241 () SeekEntryResult!3254)

(get-info :version)

(assert (=> b!339878 (= res!187740 (and (not ((_ is Found!3254) lt!161241)) (not ((_ is MissingZero!3254) lt!161241)) ((_ is MissingVacant!3254) lt!161241)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17835 (_ BitVec 32)) SeekEntryResult!3254)

(assert (=> b!339878 (= lt!161241 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339879 () Bool)

(assert (=> b!339879 (= e!208501 (or (bvsge #b00000000000000000000000000000000 (size!8792 _keys!1895)) (bvsge (size!8792 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!12117 () Bool)

(declare-fun mapRes!12117 () Bool)

(assert (=> mapIsEmpty!12117 mapRes!12117))

(declare-fun b!339880 () Bool)

(declare-fun res!187736 () Bool)

(assert (=> b!339880 (=> (not res!187736) (not e!208501))))

(declare-fun arrayContainsKey!0 (array!17835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339880 (= res!187736 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339881 () Bool)

(declare-fun res!187735 () Bool)

(assert (=> b!339881 (=> (not res!187735) (not e!208502))))

(assert (=> b!339881 (= res!187735 (and (= (size!8793 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8792 _keys!1895) (size!8793 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12117 () Bool)

(declare-fun tp!25061 () Bool)

(declare-fun e!208504 () Bool)

(assert (=> mapNonEmpty!12117 (= mapRes!12117 (and tp!25061 e!208504))))

(declare-fun mapValue!12117 () ValueCell!3221)

(declare-fun mapRest!12117 () (Array (_ BitVec 32) ValueCell!3221))

(declare-fun mapKey!12117 () (_ BitVec 32))

(assert (=> mapNonEmpty!12117 (= (arr!8440 _values!1525) (store mapRest!12117 mapKey!12117 mapValue!12117))))

(declare-fun b!339882 () Bool)

(declare-fun res!187741 () Bool)

(assert (=> b!339882 (=> (not res!187741) (not e!208502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339882 (= res!187741 (validKeyInArray!0 k0!1348))))

(declare-fun b!339883 () Bool)

(declare-fun tp_is_empty!7129 () Bool)

(assert (=> b!339883 (= e!208504 tp_is_empty!7129)))

(declare-fun b!339884 () Bool)

(declare-fun e!208503 () Bool)

(assert (=> b!339884 (= e!208503 tp_is_empty!7129)))

(declare-fun b!339875 () Bool)

(declare-fun e!208499 () Bool)

(assert (=> b!339875 (= e!208499 (and e!208503 mapRes!12117))))

(declare-fun condMapEmpty!12117 () Bool)

(declare-fun mapDefault!12117 () ValueCell!3221)

(assert (=> b!339875 (= condMapEmpty!12117 (= (arr!8440 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3221)) mapDefault!12117)))))

(declare-fun res!187742 () Bool)

(assert (=> start!34120 (=> (not res!187742) (not e!208502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34120 (= res!187742 (validMask!0 mask!2385))))

(assert (=> start!34120 e!208502))

(assert (=> start!34120 true))

(assert (=> start!34120 tp_is_empty!7129))

(assert (=> start!34120 tp!25062))

(declare-fun array_inv!6284 (array!17837) Bool)

(assert (=> start!34120 (and (array_inv!6284 _values!1525) e!208499)))

(declare-fun array_inv!6285 (array!17835) Bool)

(assert (=> start!34120 (array_inv!6285 _keys!1895)))

(assert (= (and start!34120 res!187742) b!339881))

(assert (= (and b!339881 res!187735) b!339876))

(assert (= (and b!339876 res!187737) b!339874))

(assert (= (and b!339874 res!187739) b!339882))

(assert (= (and b!339882 res!187741) b!339877))

(assert (= (and b!339877 res!187738) b!339878))

(assert (= (and b!339878 res!187740) b!339880))

(assert (= (and b!339880 res!187736) b!339879))

(assert (= (and b!339875 condMapEmpty!12117) mapIsEmpty!12117))

(assert (= (and b!339875 (not condMapEmpty!12117)) mapNonEmpty!12117))

(assert (= (and mapNonEmpty!12117 ((_ is ValueCellFull!3221) mapValue!12117)) b!339883))

(assert (= (and b!339875 ((_ is ValueCellFull!3221) mapDefault!12117)) b!339884))

(assert (= start!34120 b!339875))

(declare-fun m!342207 () Bool)

(assert (=> b!339880 m!342207))

(declare-fun m!342209 () Bool)

(assert (=> start!34120 m!342209))

(declare-fun m!342211 () Bool)

(assert (=> start!34120 m!342211))

(declare-fun m!342213 () Bool)

(assert (=> start!34120 m!342213))

(declare-fun m!342215 () Bool)

(assert (=> mapNonEmpty!12117 m!342215))

(declare-fun m!342217 () Bool)

(assert (=> b!339878 m!342217))

(declare-fun m!342219 () Bool)

(assert (=> b!339882 m!342219))

(declare-fun m!342221 () Bool)

(assert (=> b!339877 m!342221))

(assert (=> b!339877 m!342221))

(declare-fun m!342223 () Bool)

(assert (=> b!339877 m!342223))

(declare-fun m!342225 () Bool)

(assert (=> b!339876 m!342225))

(declare-fun m!342227 () Bool)

(assert (=> b!339874 m!342227))

(check-sat (not b!339874) (not mapNonEmpty!12117) (not b!339880) (not b!339878) (not b!339882) b_and!14349 (not start!34120) (not b!339876) tp_is_empty!7129 (not b!339877) (not b_next!7177))
(check-sat b_and!14349 (not b_next!7177))
(get-model)

(declare-fun b!339961 () Bool)

(declare-fun e!208552 () Bool)

(declare-fun e!208549 () Bool)

(assert (=> b!339961 (= e!208552 e!208549)))

(declare-fun c!52577 () Bool)

(assert (=> b!339961 (= c!52577 (validKeyInArray!0 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26513 () Bool)

(declare-fun call!26516 () Bool)

(assert (=> bm!26513 (= call!26516 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52577 (Cons!4802 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000) Nil!4803) Nil!4803)))))

(declare-fun b!339962 () Bool)

(declare-fun e!208550 () Bool)

(assert (=> b!339962 (= e!208550 e!208552)))

(declare-fun res!187799 () Bool)

(assert (=> b!339962 (=> (not res!187799) (not e!208552))))

(declare-fun e!208551 () Bool)

(assert (=> b!339962 (= res!187799 (not e!208551))))

(declare-fun res!187797 () Bool)

(assert (=> b!339962 (=> (not res!187797) (not e!208551))))

(assert (=> b!339962 (= res!187797 (validKeyInArray!0 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70701 () Bool)

(declare-fun res!187798 () Bool)

(assert (=> d!70701 (=> res!187798 e!208550)))

(assert (=> d!70701 (= res!187798 (bvsge #b00000000000000000000000000000000 (size!8792 _keys!1895)))))

(assert (=> d!70701 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4803) e!208550)))

(declare-fun b!339963 () Bool)

(assert (=> b!339963 (= e!208549 call!26516)))

(declare-fun b!339964 () Bool)

(assert (=> b!339964 (= e!208549 call!26516)))

(declare-fun b!339965 () Bool)

(declare-fun contains!2123 (List!4806 (_ BitVec 64)) Bool)

(assert (=> b!339965 (= e!208551 (contains!2123 Nil!4803 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70701 (not res!187798)) b!339962))

(assert (= (and b!339962 res!187797) b!339965))

(assert (= (and b!339962 res!187799) b!339961))

(assert (= (and b!339961 c!52577) b!339964))

(assert (= (and b!339961 (not c!52577)) b!339963))

(assert (= (or b!339964 b!339963) bm!26513))

(declare-fun m!342273 () Bool)

(assert (=> b!339961 m!342273))

(assert (=> b!339961 m!342273))

(declare-fun m!342275 () Bool)

(assert (=> b!339961 m!342275))

(assert (=> bm!26513 m!342273))

(declare-fun m!342277 () Bool)

(assert (=> bm!26513 m!342277))

(assert (=> b!339962 m!342273))

(assert (=> b!339962 m!342273))

(assert (=> b!339962 m!342275))

(assert (=> b!339965 m!342273))

(assert (=> b!339965 m!342273))

(declare-fun m!342279 () Bool)

(assert (=> b!339965 m!342279))

(assert (=> b!339874 d!70701))

(declare-fun d!70703 () Bool)

(assert (=> d!70703 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339882 d!70703))

(declare-fun b!339978 () Bool)

(declare-fun e!208561 () SeekEntryResult!3254)

(declare-fun lt!161256 () SeekEntryResult!3254)

(assert (=> b!339978 (= e!208561 (MissingZero!3254 (index!15197 lt!161256)))))

(declare-fun b!339979 () Bool)

(declare-fun e!208560 () SeekEntryResult!3254)

(declare-fun e!208559 () SeekEntryResult!3254)

(assert (=> b!339979 (= e!208560 e!208559)))

(declare-fun lt!161254 () (_ BitVec 64))

(assert (=> b!339979 (= lt!161254 (select (arr!8439 _keys!1895) (index!15197 lt!161256)))))

(declare-fun c!52585 () Bool)

(assert (=> b!339979 (= c!52585 (= lt!161254 k0!1348))))

(declare-fun b!339980 () Bool)

(assert (=> b!339980 (= e!208560 Undefined!3254)))

(declare-fun d!70705 () Bool)

(declare-fun lt!161255 () SeekEntryResult!3254)

(assert (=> d!70705 (and (or ((_ is Undefined!3254) lt!161255) (not ((_ is Found!3254) lt!161255)) (and (bvsge (index!15196 lt!161255) #b00000000000000000000000000000000) (bvslt (index!15196 lt!161255) (size!8792 _keys!1895)))) (or ((_ is Undefined!3254) lt!161255) ((_ is Found!3254) lt!161255) (not ((_ is MissingZero!3254) lt!161255)) (and (bvsge (index!15195 lt!161255) #b00000000000000000000000000000000) (bvslt (index!15195 lt!161255) (size!8792 _keys!1895)))) (or ((_ is Undefined!3254) lt!161255) ((_ is Found!3254) lt!161255) ((_ is MissingZero!3254) lt!161255) (not ((_ is MissingVacant!3254) lt!161255)) (and (bvsge (index!15198 lt!161255) #b00000000000000000000000000000000) (bvslt (index!15198 lt!161255) (size!8792 _keys!1895)))) (or ((_ is Undefined!3254) lt!161255) (ite ((_ is Found!3254) lt!161255) (= (select (arr!8439 _keys!1895) (index!15196 lt!161255)) k0!1348) (ite ((_ is MissingZero!3254) lt!161255) (= (select (arr!8439 _keys!1895) (index!15195 lt!161255)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3254) lt!161255) (= (select (arr!8439 _keys!1895) (index!15198 lt!161255)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70705 (= lt!161255 e!208560)))

(declare-fun c!52584 () Bool)

(assert (=> d!70705 (= c!52584 (and ((_ is Intermediate!3254) lt!161256) (undefined!4066 lt!161256)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17835 (_ BitVec 32)) SeekEntryResult!3254)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70705 (= lt!161256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70705 (validMask!0 mask!2385)))

(assert (=> d!70705 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161255)))

(declare-fun b!339981 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17835 (_ BitVec 32)) SeekEntryResult!3254)

(assert (=> b!339981 (= e!208561 (seekKeyOrZeroReturnVacant!0 (x!33865 lt!161256) (index!15197 lt!161256) (index!15197 lt!161256) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339982 () Bool)

(assert (=> b!339982 (= e!208559 (Found!3254 (index!15197 lt!161256)))))

(declare-fun b!339983 () Bool)

(declare-fun c!52586 () Bool)

(assert (=> b!339983 (= c!52586 (= lt!161254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!339983 (= e!208559 e!208561)))

(assert (= (and d!70705 c!52584) b!339980))

(assert (= (and d!70705 (not c!52584)) b!339979))

(assert (= (and b!339979 c!52585) b!339982))

(assert (= (and b!339979 (not c!52585)) b!339983))

(assert (= (and b!339983 c!52586) b!339978))

(assert (= (and b!339983 (not c!52586)) b!339981))

(declare-fun m!342281 () Bool)

(assert (=> b!339979 m!342281))

(declare-fun m!342283 () Bool)

(assert (=> d!70705 m!342283))

(declare-fun m!342285 () Bool)

(assert (=> d!70705 m!342285))

(declare-fun m!342287 () Bool)

(assert (=> d!70705 m!342287))

(declare-fun m!342289 () Bool)

(assert (=> d!70705 m!342289))

(assert (=> d!70705 m!342209))

(assert (=> d!70705 m!342283))

(declare-fun m!342291 () Bool)

(assert (=> d!70705 m!342291))

(declare-fun m!342293 () Bool)

(assert (=> b!339981 m!342293))

(assert (=> b!339878 d!70705))

(declare-fun d!70707 () Bool)

(assert (=> d!70707 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34120 d!70707))

(declare-fun d!70709 () Bool)

(assert (=> d!70709 (= (array_inv!6284 _values!1525) (bvsge (size!8793 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34120 d!70709))

(declare-fun d!70711 () Bool)

(assert (=> d!70711 (= (array_inv!6285 _keys!1895) (bvsge (size!8792 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34120 d!70711))

(declare-fun d!70713 () Bool)

(declare-fun e!208566 () Bool)

(assert (=> d!70713 e!208566))

(declare-fun res!187802 () Bool)

(assert (=> d!70713 (=> res!187802 e!208566)))

(declare-fun lt!161266 () Bool)

(assert (=> d!70713 (= res!187802 (not lt!161266))))

(declare-fun lt!161268 () Bool)

(assert (=> d!70713 (= lt!161266 lt!161268)))

(declare-datatypes ((Unit!10566 0))(
  ( (Unit!10567) )
))
(declare-fun lt!161267 () Unit!10566)

(declare-fun e!208567 () Unit!10566)

(assert (=> d!70713 (= lt!161267 e!208567)))

(declare-fun c!52589 () Bool)

(assert (=> d!70713 (= c!52589 lt!161268)))

(declare-fun containsKey!323 (List!4807 (_ BitVec 64)) Bool)

(assert (=> d!70713 (= lt!161268 (containsKey!323 (toList!2058 (getCurrentListMap!1564 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70713 (= (contains!2122 (getCurrentListMap!1564 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161266)))

(declare-fun b!339990 () Bool)

(declare-fun lt!161265 () Unit!10566)

(assert (=> b!339990 (= e!208567 lt!161265)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!272 (List!4807 (_ BitVec 64)) Unit!10566)

(assert (=> b!339990 (= lt!161265 (lemmaContainsKeyImpliesGetValueByKeyDefined!272 (toList!2058 (getCurrentListMap!1564 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!337 0))(
  ( (Some!336 (v!5777 V!10483)) (None!335) )
))
(declare-fun isDefined!273 (Option!337) Bool)

(declare-fun getValueByKey!331 (List!4807 (_ BitVec 64)) Option!337)

(assert (=> b!339990 (isDefined!273 (getValueByKey!331 (toList!2058 (getCurrentListMap!1564 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!339991 () Bool)

(declare-fun Unit!10568 () Unit!10566)

(assert (=> b!339991 (= e!208567 Unit!10568)))

(declare-fun b!339992 () Bool)

(assert (=> b!339992 (= e!208566 (isDefined!273 (getValueByKey!331 (toList!2058 (getCurrentListMap!1564 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70713 c!52589) b!339990))

(assert (= (and d!70713 (not c!52589)) b!339991))

(assert (= (and d!70713 (not res!187802)) b!339992))

(declare-fun m!342295 () Bool)

(assert (=> d!70713 m!342295))

(declare-fun m!342297 () Bool)

(assert (=> b!339990 m!342297))

(declare-fun m!342299 () Bool)

(assert (=> b!339990 m!342299))

(assert (=> b!339990 m!342299))

(declare-fun m!342301 () Bool)

(assert (=> b!339990 m!342301))

(assert (=> b!339992 m!342299))

(assert (=> b!339992 m!342299))

(assert (=> b!339992 m!342301))

(assert (=> b!339877 d!70713))

(declare-fun b!340035 () Bool)

(declare-fun e!208602 () Unit!10566)

(declare-fun lt!161313 () Unit!10566)

(assert (=> b!340035 (= e!208602 lt!161313)))

(declare-fun lt!161325 () ListLongMap!4085)

(declare-fun getCurrentListMapNoExtraKeys!591 (array!17835 array!17837 (_ BitVec 32) (_ BitVec 32) V!10483 V!10483 (_ BitVec 32) Int) ListLongMap!4085)

(assert (=> b!340035 (= lt!161325 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161331 () (_ BitVec 64))

(assert (=> b!340035 (= lt!161331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161319 () (_ BitVec 64))

(assert (=> b!340035 (= lt!161319 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161317 () Unit!10566)

(declare-fun addStillContains!251 (ListLongMap!4085 (_ BitVec 64) V!10483 (_ BitVec 64)) Unit!10566)

(assert (=> b!340035 (= lt!161317 (addStillContains!251 lt!161325 lt!161331 zeroValue!1467 lt!161319))))

(declare-fun +!728 (ListLongMap!4085 tuple2!5182) ListLongMap!4085)

(assert (=> b!340035 (contains!2122 (+!728 lt!161325 (tuple2!5183 lt!161331 zeroValue!1467)) lt!161319)))

(declare-fun lt!161326 () Unit!10566)

(assert (=> b!340035 (= lt!161326 lt!161317)))

(declare-fun lt!161321 () ListLongMap!4085)

(assert (=> b!340035 (= lt!161321 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161318 () (_ BitVec 64))

(assert (=> b!340035 (= lt!161318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161327 () (_ BitVec 64))

(assert (=> b!340035 (= lt!161327 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161329 () Unit!10566)

(declare-fun addApplyDifferent!251 (ListLongMap!4085 (_ BitVec 64) V!10483 (_ BitVec 64)) Unit!10566)

(assert (=> b!340035 (= lt!161329 (addApplyDifferent!251 lt!161321 lt!161318 minValue!1467 lt!161327))))

(declare-fun apply!275 (ListLongMap!4085 (_ BitVec 64)) V!10483)

(assert (=> b!340035 (= (apply!275 (+!728 lt!161321 (tuple2!5183 lt!161318 minValue!1467)) lt!161327) (apply!275 lt!161321 lt!161327))))

(declare-fun lt!161330 () Unit!10566)

(assert (=> b!340035 (= lt!161330 lt!161329)))

(declare-fun lt!161323 () ListLongMap!4085)

(assert (=> b!340035 (= lt!161323 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161314 () (_ BitVec 64))

(assert (=> b!340035 (= lt!161314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161328 () (_ BitVec 64))

(assert (=> b!340035 (= lt!161328 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161320 () Unit!10566)

(assert (=> b!340035 (= lt!161320 (addApplyDifferent!251 lt!161323 lt!161314 zeroValue!1467 lt!161328))))

(assert (=> b!340035 (= (apply!275 (+!728 lt!161323 (tuple2!5183 lt!161314 zeroValue!1467)) lt!161328) (apply!275 lt!161323 lt!161328))))

(declare-fun lt!161333 () Unit!10566)

(assert (=> b!340035 (= lt!161333 lt!161320)))

(declare-fun lt!161316 () ListLongMap!4085)

(assert (=> b!340035 (= lt!161316 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161322 () (_ BitVec 64))

(assert (=> b!340035 (= lt!161322 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161332 () (_ BitVec 64))

(assert (=> b!340035 (= lt!161332 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!340035 (= lt!161313 (addApplyDifferent!251 lt!161316 lt!161322 minValue!1467 lt!161332))))

(assert (=> b!340035 (= (apply!275 (+!728 lt!161316 (tuple2!5183 lt!161322 minValue!1467)) lt!161332) (apply!275 lt!161316 lt!161332))))

(declare-fun b!340036 () Bool)

(declare-fun e!208606 () ListLongMap!4085)

(declare-fun call!26533 () ListLongMap!4085)

(assert (=> b!340036 (= e!208606 call!26533)))

(declare-fun bm!26528 () Bool)

(declare-fun call!26534 () ListLongMap!4085)

(declare-fun c!52603 () Bool)

(declare-fun call!26532 () ListLongMap!4085)

(declare-fun call!26535 () ListLongMap!4085)

(declare-fun c!52605 () Bool)

(assert (=> bm!26528 (= call!26534 (+!728 (ite c!52603 call!26535 (ite c!52605 call!26532 call!26533)) (ite (or c!52603 c!52605) (tuple2!5183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!340037 () Bool)

(declare-fun Unit!10569 () Unit!10566)

(assert (=> b!340037 (= e!208602 Unit!10569)))

(declare-fun b!340038 () Bool)

(declare-fun res!187827 () Bool)

(declare-fun e!208604 () Bool)

(assert (=> b!340038 (=> (not res!187827) (not e!208604))))

(declare-fun e!208600 () Bool)

(assert (=> b!340038 (= res!187827 e!208600)))

(declare-fun c!52606 () Bool)

(assert (=> b!340038 (= c!52606 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!340039 () Bool)

(declare-fun e!208605 () Bool)

(declare-fun lt!161315 () ListLongMap!4085)

(assert (=> b!340039 (= e!208605 (= (apply!275 lt!161315 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!340040 () Bool)

(declare-fun c!52604 () Bool)

(assert (=> b!340040 (= c!52604 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!208601 () ListLongMap!4085)

(assert (=> b!340040 (= e!208601 e!208606)))

(declare-fun d!70715 () Bool)

(assert (=> d!70715 e!208604))

(declare-fun res!187824 () Bool)

(assert (=> d!70715 (=> (not res!187824) (not e!208604))))

(assert (=> d!70715 (= res!187824 (or (bvsge #b00000000000000000000000000000000 (size!8792 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8792 _keys!1895)))))))

(declare-fun lt!161324 () ListLongMap!4085)

(assert (=> d!70715 (= lt!161315 lt!161324)))

(declare-fun lt!161334 () Unit!10566)

(assert (=> d!70715 (= lt!161334 e!208602)))

(declare-fun c!52602 () Bool)

(declare-fun e!208594 () Bool)

(assert (=> d!70715 (= c!52602 e!208594)))

(declare-fun res!187823 () Bool)

(assert (=> d!70715 (=> (not res!187823) (not e!208594))))

(assert (=> d!70715 (= res!187823 (bvslt #b00000000000000000000000000000000 (size!8792 _keys!1895)))))

(declare-fun e!208596 () ListLongMap!4085)

(assert (=> d!70715 (= lt!161324 e!208596)))

(assert (=> d!70715 (= c!52603 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70715 (validMask!0 mask!2385)))

(assert (=> d!70715 (= (getCurrentListMap!1564 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161315)))

(declare-fun bm!26529 () Bool)

(declare-fun call!26537 () Bool)

(assert (=> bm!26529 (= call!26537 (contains!2122 lt!161315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!340041 () Bool)

(declare-fun call!26536 () ListLongMap!4085)

(assert (=> b!340041 (= e!208606 call!26536)))

(declare-fun bm!26530 () Bool)

(declare-fun call!26531 () Bool)

(assert (=> bm!26530 (= call!26531 (contains!2122 lt!161315 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!340042 () Bool)

(assert (=> b!340042 (= e!208601 call!26536)))

(declare-fun e!208599 () Bool)

(declare-fun b!340043 () Bool)

(declare-fun get!4591 (ValueCell!3221 V!10483) V!10483)

(declare-fun dynLambda!609 (Int (_ BitVec 64)) V!10483)

(assert (=> b!340043 (= e!208599 (= (apply!275 lt!161315 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000)) (get!4591 (select (arr!8440 _values!1525) #b00000000000000000000000000000000) (dynLambda!609 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!340043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8793 _values!1525)))))

(assert (=> b!340043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8792 _keys!1895)))))

(declare-fun b!340044 () Bool)

(declare-fun res!187828 () Bool)

(assert (=> b!340044 (=> (not res!187828) (not e!208604))))

(declare-fun e!208595 () Bool)

(assert (=> b!340044 (= res!187828 e!208595)))

(declare-fun res!187826 () Bool)

(assert (=> b!340044 (=> res!187826 e!208595)))

(declare-fun e!208597 () Bool)

(assert (=> b!340044 (= res!187826 (not e!208597))))

(declare-fun res!187821 () Bool)

(assert (=> b!340044 (=> (not res!187821) (not e!208597))))

(assert (=> b!340044 (= res!187821 (bvslt #b00000000000000000000000000000000 (size!8792 _keys!1895)))))

(declare-fun bm!26531 () Bool)

(assert (=> bm!26531 (= call!26533 call!26532)))

(declare-fun b!340045 () Bool)

(declare-fun e!208603 () Bool)

(declare-fun e!208598 () Bool)

(assert (=> b!340045 (= e!208603 e!208598)))

(declare-fun res!187825 () Bool)

(assert (=> b!340045 (= res!187825 call!26531)))

(assert (=> b!340045 (=> (not res!187825) (not e!208598))))

(declare-fun bm!26532 () Bool)

(assert (=> bm!26532 (= call!26532 call!26535)))

(declare-fun b!340046 () Bool)

(assert (=> b!340046 (= e!208600 e!208605)))

(declare-fun res!187822 () Bool)

(assert (=> b!340046 (= res!187822 call!26537)))

(assert (=> b!340046 (=> (not res!187822) (not e!208605))))

(declare-fun b!340047 () Bool)

(assert (=> b!340047 (= e!208598 (= (apply!275 lt!161315 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!340048 () Bool)

(assert (=> b!340048 (= e!208596 e!208601)))

(assert (=> b!340048 (= c!52605 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!340049 () Bool)

(assert (=> b!340049 (= e!208603 (not call!26531))))

(declare-fun b!340050 () Bool)

(assert (=> b!340050 (= e!208604 e!208603)))

(declare-fun c!52607 () Bool)

(assert (=> b!340050 (= c!52607 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!340051 () Bool)

(assert (=> b!340051 (= e!208596 (+!728 call!26534 (tuple2!5183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!340052 () Bool)

(assert (=> b!340052 (= e!208594 (validKeyInArray!0 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26533 () Bool)

(assert (=> bm!26533 (= call!26535 (getCurrentListMapNoExtraKeys!591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!340053 () Bool)

(assert (=> b!340053 (= e!208600 (not call!26537))))

(declare-fun b!340054 () Bool)

(assert (=> b!340054 (= e!208597 (validKeyInArray!0 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340055 () Bool)

(assert (=> b!340055 (= e!208595 e!208599)))

(declare-fun res!187829 () Bool)

(assert (=> b!340055 (=> (not res!187829) (not e!208599))))

(assert (=> b!340055 (= res!187829 (contains!2122 lt!161315 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!340055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8792 _keys!1895)))))

(declare-fun bm!26534 () Bool)

(assert (=> bm!26534 (= call!26536 call!26534)))

(assert (= (and d!70715 c!52603) b!340051))

(assert (= (and d!70715 (not c!52603)) b!340048))

(assert (= (and b!340048 c!52605) b!340042))

(assert (= (and b!340048 (not c!52605)) b!340040))

(assert (= (and b!340040 c!52604) b!340041))

(assert (= (and b!340040 (not c!52604)) b!340036))

(assert (= (or b!340041 b!340036) bm!26531))

(assert (= (or b!340042 bm!26531) bm!26532))

(assert (= (or b!340042 b!340041) bm!26534))

(assert (= (or b!340051 bm!26532) bm!26533))

(assert (= (or b!340051 bm!26534) bm!26528))

(assert (= (and d!70715 res!187823) b!340052))

(assert (= (and d!70715 c!52602) b!340035))

(assert (= (and d!70715 (not c!52602)) b!340037))

(assert (= (and d!70715 res!187824) b!340044))

(assert (= (and b!340044 res!187821) b!340054))

(assert (= (and b!340044 (not res!187826)) b!340055))

(assert (= (and b!340055 res!187829) b!340043))

(assert (= (and b!340044 res!187828) b!340038))

(assert (= (and b!340038 c!52606) b!340046))

(assert (= (and b!340038 (not c!52606)) b!340053))

(assert (= (and b!340046 res!187822) b!340039))

(assert (= (or b!340046 b!340053) bm!26529))

(assert (= (and b!340038 res!187827) b!340050))

(assert (= (and b!340050 c!52607) b!340045))

(assert (= (and b!340050 (not c!52607)) b!340049))

(assert (= (and b!340045 res!187825) b!340047))

(assert (= (or b!340045 b!340049) bm!26530))

(declare-fun b_lambda!8421 () Bool)

(assert (=> (not b_lambda!8421) (not b!340043)))

(declare-fun t!9907 () Bool)

(declare-fun tb!3057 () Bool)

(assert (=> (and start!34120 (= defaultEntry!1528 defaultEntry!1528) t!9907) tb!3057))

(declare-fun result!5517 () Bool)

(assert (=> tb!3057 (= result!5517 tp_is_empty!7129)))

(assert (=> b!340043 t!9907))

(declare-fun b_and!14355 () Bool)

(assert (= b_and!14349 (and (=> t!9907 result!5517) b_and!14355)))

(assert (=> d!70715 m!342209))

(declare-fun m!342303 () Bool)

(assert (=> bm!26533 m!342303))

(declare-fun m!342305 () Bool)

(assert (=> b!340043 m!342305))

(declare-fun m!342307 () Bool)

(assert (=> b!340043 m!342307))

(declare-fun m!342309 () Bool)

(assert (=> b!340043 m!342309))

(assert (=> b!340043 m!342273))

(assert (=> b!340043 m!342305))

(assert (=> b!340043 m!342273))

(declare-fun m!342311 () Bool)

(assert (=> b!340043 m!342311))

(assert (=> b!340043 m!342307))

(assert (=> b!340052 m!342273))

(assert (=> b!340052 m!342273))

(assert (=> b!340052 m!342275))

(assert (=> b!340054 m!342273))

(assert (=> b!340054 m!342273))

(assert (=> b!340054 m!342275))

(declare-fun m!342313 () Bool)

(assert (=> bm!26528 m!342313))

(assert (=> b!340035 m!342303))

(declare-fun m!342315 () Bool)

(assert (=> b!340035 m!342315))

(declare-fun m!342317 () Bool)

(assert (=> b!340035 m!342317))

(declare-fun m!342319 () Bool)

(assert (=> b!340035 m!342319))

(declare-fun m!342321 () Bool)

(assert (=> b!340035 m!342321))

(declare-fun m!342323 () Bool)

(assert (=> b!340035 m!342323))

(declare-fun m!342325 () Bool)

(assert (=> b!340035 m!342325))

(declare-fun m!342327 () Bool)

(assert (=> b!340035 m!342327))

(declare-fun m!342329 () Bool)

(assert (=> b!340035 m!342329))

(declare-fun m!342331 () Bool)

(assert (=> b!340035 m!342331))

(assert (=> b!340035 m!342325))

(assert (=> b!340035 m!342273))

(declare-fun m!342333 () Bool)

(assert (=> b!340035 m!342333))

(declare-fun m!342335 () Bool)

(assert (=> b!340035 m!342335))

(declare-fun m!342337 () Bool)

(assert (=> b!340035 m!342337))

(assert (=> b!340035 m!342337))

(declare-fun m!342339 () Bool)

(assert (=> b!340035 m!342339))

(assert (=> b!340035 m!342333))

(assert (=> b!340035 m!342323))

(declare-fun m!342341 () Bool)

(assert (=> b!340035 m!342341))

(declare-fun m!342343 () Bool)

(assert (=> b!340035 m!342343))

(declare-fun m!342345 () Bool)

(assert (=> bm!26529 m!342345))

(declare-fun m!342347 () Bool)

(assert (=> bm!26530 m!342347))

(assert (=> b!340055 m!342273))

(assert (=> b!340055 m!342273))

(declare-fun m!342349 () Bool)

(assert (=> b!340055 m!342349))

(declare-fun m!342351 () Bool)

(assert (=> b!340039 m!342351))

(declare-fun m!342353 () Bool)

(assert (=> b!340051 m!342353))

(declare-fun m!342355 () Bool)

(assert (=> b!340047 m!342355))

(assert (=> b!339877 d!70715))

(declare-fun bm!26537 () Bool)

(declare-fun call!26540 () Bool)

(assert (=> bm!26537 (= call!26540 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!340066 () Bool)

(declare-fun e!208615 () Bool)

(declare-fun e!208613 () Bool)

(assert (=> b!340066 (= e!208615 e!208613)))

(declare-fun lt!161341 () (_ BitVec 64))

(assert (=> b!340066 (= lt!161341 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161343 () Unit!10566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17835 (_ BitVec 64) (_ BitVec 32)) Unit!10566)

(assert (=> b!340066 (= lt!161343 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161341 #b00000000000000000000000000000000))))

(assert (=> b!340066 (arrayContainsKey!0 _keys!1895 lt!161341 #b00000000000000000000000000000000)))

(declare-fun lt!161342 () Unit!10566)

(assert (=> b!340066 (= lt!161342 lt!161343)))

(declare-fun res!187834 () Bool)

(assert (=> b!340066 (= res!187834 (= (seekEntryOrOpen!0 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3254 #b00000000000000000000000000000000)))))

(assert (=> b!340066 (=> (not res!187834) (not e!208613))))

(declare-fun d!70717 () Bool)

(declare-fun res!187835 () Bool)

(declare-fun e!208614 () Bool)

(assert (=> d!70717 (=> res!187835 e!208614)))

(assert (=> d!70717 (= res!187835 (bvsge #b00000000000000000000000000000000 (size!8792 _keys!1895)))))

(assert (=> d!70717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208614)))

(declare-fun b!340067 () Bool)

(assert (=> b!340067 (= e!208614 e!208615)))

(declare-fun c!52610 () Bool)

(assert (=> b!340067 (= c!52610 (validKeyInArray!0 (select (arr!8439 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340068 () Bool)

(assert (=> b!340068 (= e!208613 call!26540)))

(declare-fun b!340069 () Bool)

(assert (=> b!340069 (= e!208615 call!26540)))

(assert (= (and d!70717 (not res!187835)) b!340067))

(assert (= (and b!340067 c!52610) b!340066))

(assert (= (and b!340067 (not c!52610)) b!340069))

(assert (= (and b!340066 res!187834) b!340068))

(assert (= (or b!340068 b!340069) bm!26537))

(declare-fun m!342357 () Bool)

(assert (=> bm!26537 m!342357))

(assert (=> b!340066 m!342273))

(declare-fun m!342359 () Bool)

(assert (=> b!340066 m!342359))

(declare-fun m!342361 () Bool)

(assert (=> b!340066 m!342361))

(assert (=> b!340066 m!342273))

(declare-fun m!342363 () Bool)

(assert (=> b!340066 m!342363))

(assert (=> b!340067 m!342273))

(assert (=> b!340067 m!342273))

(assert (=> b!340067 m!342275))

(assert (=> b!339876 d!70717))

(declare-fun d!70719 () Bool)

(declare-fun res!187840 () Bool)

(declare-fun e!208620 () Bool)

(assert (=> d!70719 (=> res!187840 e!208620)))

(assert (=> d!70719 (= res!187840 (= (select (arr!8439 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70719 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!208620)))

(declare-fun b!340074 () Bool)

(declare-fun e!208621 () Bool)

(assert (=> b!340074 (= e!208620 e!208621)))

(declare-fun res!187841 () Bool)

(assert (=> b!340074 (=> (not res!187841) (not e!208621))))

(assert (=> b!340074 (= res!187841 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8792 _keys!1895)))))

(declare-fun b!340075 () Bool)

(assert (=> b!340075 (= e!208621 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70719 (not res!187840)) b!340074))

(assert (= (and b!340074 res!187841) b!340075))

(assert (=> d!70719 m!342273))

(declare-fun m!342365 () Bool)

(assert (=> b!340075 m!342365))

(assert (=> b!339880 d!70719))

(declare-fun mapIsEmpty!12126 () Bool)

(declare-fun mapRes!12126 () Bool)

(assert (=> mapIsEmpty!12126 mapRes!12126))

(declare-fun b!340083 () Bool)

(declare-fun e!208627 () Bool)

(assert (=> b!340083 (= e!208627 tp_is_empty!7129)))

(declare-fun b!340082 () Bool)

(declare-fun e!208626 () Bool)

(assert (=> b!340082 (= e!208626 tp_is_empty!7129)))

(declare-fun mapNonEmpty!12126 () Bool)

(declare-fun tp!25077 () Bool)

(assert (=> mapNonEmpty!12126 (= mapRes!12126 (and tp!25077 e!208626))))

(declare-fun mapRest!12126 () (Array (_ BitVec 32) ValueCell!3221))

(declare-fun mapKey!12126 () (_ BitVec 32))

(declare-fun mapValue!12126 () ValueCell!3221)

(assert (=> mapNonEmpty!12126 (= mapRest!12117 (store mapRest!12126 mapKey!12126 mapValue!12126))))

(declare-fun condMapEmpty!12126 () Bool)

(declare-fun mapDefault!12126 () ValueCell!3221)

(assert (=> mapNonEmpty!12117 (= condMapEmpty!12126 (= mapRest!12117 ((as const (Array (_ BitVec 32) ValueCell!3221)) mapDefault!12126)))))

(assert (=> mapNonEmpty!12117 (= tp!25061 (and e!208627 mapRes!12126))))

(assert (= (and mapNonEmpty!12117 condMapEmpty!12126) mapIsEmpty!12126))

(assert (= (and mapNonEmpty!12117 (not condMapEmpty!12126)) mapNonEmpty!12126))

(assert (= (and mapNonEmpty!12126 ((_ is ValueCellFull!3221) mapValue!12126)) b!340082))

(assert (= (and mapNonEmpty!12117 ((_ is ValueCellFull!3221) mapDefault!12126)) b!340083))

(declare-fun m!342367 () Bool)

(assert (=> mapNonEmpty!12126 m!342367))

(declare-fun b_lambda!8423 () Bool)

(assert (= b_lambda!8421 (or (and start!34120 b_free!7177) b_lambda!8423)))

(check-sat (not b!340075) (not bm!26528) (not d!70715) (not bm!26530) (not b!340051) (not b!340035) (not b!339981) (not b!340055) b_and!14355 (not b!340043) (not b!339992) (not b!340039) (not bm!26537) (not d!70713) (not b!339990) (not mapNonEmpty!12126) (not b!340067) (not b!340047) (not b!339961) (not d!70705) (not b!339962) (not b_lambda!8423) (not bm!26513) (not b!340066) tp_is_empty!7129 (not bm!26529) (not b!339965) (not b!340052) (not b_next!7177) (not bm!26533) (not b!340054))
(check-sat b_and!14355 (not b_next!7177))
