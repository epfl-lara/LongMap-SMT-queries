; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108204 () Bool)

(assert start!108204)

(declare-fun b!1276872 () Bool)

(declare-fun e!729051 () Bool)

(declare-datatypes ((List!28648 0))(
  ( (Nil!28645) (Cons!28644 (h!29862 (_ BitVec 64)) (t!42176 List!28648)) )
))
(declare-fun contains!7707 (List!28648 (_ BitVec 64)) Bool)

(assert (=> b!1276872 (= e!729051 (contains!7707 Nil!28645 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1276873 () Bool)

(declare-fun res!848335 () Bool)

(declare-fun e!729055 () Bool)

(assert (=> b!1276873 (=> (not res!848335) (not e!729055))))

(declare-datatypes ((array!83657 0))(
  ( (array!83658 (arr!40337 (Array (_ BitVec 32) (_ BitVec 64))) (size!40888 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83657)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83657 (_ BitVec 32)) Bool)

(assert (=> b!1276873 (= res!848335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51422 () Bool)

(declare-fun mapRes!51422 () Bool)

(assert (=> mapIsEmpty!51422 mapRes!51422))

(declare-fun b!1276874 () Bool)

(declare-fun res!848334 () Bool)

(assert (=> b!1276874 (=> (not res!848334) (not e!729055))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49457 0))(
  ( (V!49458 (val!16707 Int)) )
))
(declare-datatypes ((ValueCell!15734 0))(
  ( (ValueCellFull!15734 (v!19298 V!49457)) (EmptyCell!15734) )
))
(declare-datatypes ((array!83659 0))(
  ( (array!83660 (arr!40338 (Array (_ BitVec 32) ValueCell!15734)) (size!40889 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83659)

(assert (=> b!1276874 (= res!848334 (and (= (size!40889 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40888 _keys!1427) (size!40889 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276875 () Bool)

(assert (=> b!1276875 (= e!729055 e!729051)))

(declare-fun res!848339 () Bool)

(assert (=> b!1276875 (=> res!848339 e!729051)))

(assert (=> b!1276875 (= res!848339 (contains!7707 Nil!28645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1276876 () Bool)

(declare-fun res!848336 () Bool)

(assert (=> b!1276876 (=> (not res!848336) (not e!729055))))

(declare-fun noDuplicate!2066 (List!28648) Bool)

(assert (=> b!1276876 (= res!848336 (noDuplicate!2066 Nil!28645))))

(declare-fun res!848338 () Bool)

(assert (=> start!108204 (=> (not res!848338) (not e!729055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108204 (= res!848338 (validMask!0 mask!1805))))

(assert (=> start!108204 e!729055))

(assert (=> start!108204 true))

(declare-fun e!729052 () Bool)

(declare-fun array_inv!30845 (array!83659) Bool)

(assert (=> start!108204 (and (array_inv!30845 _values!1187) e!729052)))

(declare-fun array_inv!30846 (array!83657) Bool)

(assert (=> start!108204 (array_inv!30846 _keys!1427)))

(declare-fun mapNonEmpty!51422 () Bool)

(declare-fun tp!98180 () Bool)

(declare-fun e!729056 () Bool)

(assert (=> mapNonEmpty!51422 (= mapRes!51422 (and tp!98180 e!729056))))

(declare-fun mapRest!51422 () (Array (_ BitVec 32) ValueCell!15734))

(declare-fun mapValue!51422 () ValueCell!15734)

(declare-fun mapKey!51422 () (_ BitVec 32))

(assert (=> mapNonEmpty!51422 (= (arr!40338 _values!1187) (store mapRest!51422 mapKey!51422 mapValue!51422))))

(declare-fun b!1276877 () Bool)

(declare-fun e!729053 () Bool)

(assert (=> b!1276877 (= e!729052 (and e!729053 mapRes!51422))))

(declare-fun condMapEmpty!51422 () Bool)

(declare-fun mapDefault!51422 () ValueCell!15734)

(assert (=> b!1276877 (= condMapEmpty!51422 (= (arr!40338 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15734)) mapDefault!51422)))))

(declare-fun b!1276878 () Bool)

(declare-fun res!848337 () Bool)

(assert (=> b!1276878 (=> (not res!848337) (not e!729055))))

(assert (=> b!1276878 (= res!848337 (and (bvsle #b00000000000000000000000000000000 (size!40888 _keys!1427)) (bvslt (size!40888 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun b!1276879 () Bool)

(declare-fun tp_is_empty!33265 () Bool)

(assert (=> b!1276879 (= e!729053 tp_is_empty!33265)))

(declare-fun b!1276880 () Bool)

(assert (=> b!1276880 (= e!729056 tp_is_empty!33265)))

(assert (= (and start!108204 res!848338) b!1276874))

(assert (= (and b!1276874 res!848334) b!1276873))

(assert (= (and b!1276873 res!848335) b!1276878))

(assert (= (and b!1276878 res!848337) b!1276876))

(assert (= (and b!1276876 res!848336) b!1276875))

(assert (= (and b!1276875 (not res!848339)) b!1276872))

(assert (= (and b!1276877 condMapEmpty!51422) mapIsEmpty!51422))

(assert (= (and b!1276877 (not condMapEmpty!51422)) mapNonEmpty!51422))

(get-info :version)

(assert (= (and mapNonEmpty!51422 ((_ is ValueCellFull!15734) mapValue!51422)) b!1276880))

(assert (= (and b!1276877 ((_ is ValueCellFull!15734) mapDefault!51422)) b!1276879))

(assert (= start!108204 b!1276877))

(declare-fun m!1173371 () Bool)

(assert (=> b!1276872 m!1173371))

(declare-fun m!1173373 () Bool)

(assert (=> b!1276875 m!1173373))

(declare-fun m!1173375 () Bool)

(assert (=> mapNonEmpty!51422 m!1173375))

(declare-fun m!1173377 () Bool)

(assert (=> b!1276876 m!1173377))

(declare-fun m!1173379 () Bool)

(assert (=> start!108204 m!1173379))

(declare-fun m!1173381 () Bool)

(assert (=> start!108204 m!1173381))

(declare-fun m!1173383 () Bool)

(assert (=> start!108204 m!1173383))

(declare-fun m!1173385 () Bool)

(assert (=> b!1276873 m!1173385))

(check-sat (not mapNonEmpty!51422) (not b!1276875) (not b!1276872) (not start!108204) (not b!1276876) tp_is_empty!33265 (not b!1276873))
(check-sat)
(get-model)

(declare-fun d!140827 () Bool)

(declare-fun lt!575845 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!640 (List!28648) (InoxSet (_ BitVec 64)))

(assert (=> d!140827 (= lt!575845 (select (content!640 Nil!28645) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!729098 () Bool)

(assert (=> d!140827 (= lt!575845 e!729098)))

(declare-fun res!848381 () Bool)

(assert (=> d!140827 (=> (not res!848381) (not e!729098))))

(assert (=> d!140827 (= res!848381 ((_ is Cons!28644) Nil!28645))))

(assert (=> d!140827 (= (contains!7707 Nil!28645 #b0000000000000000000000000000000000000000000000000000000000000000) lt!575845)))

(declare-fun b!1276939 () Bool)

(declare-fun e!729097 () Bool)

(assert (=> b!1276939 (= e!729098 e!729097)))

(declare-fun res!848380 () Bool)

(assert (=> b!1276939 (=> res!848380 e!729097)))

(assert (=> b!1276939 (= res!848380 (= (h!29862 Nil!28645) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1276940 () Bool)

(assert (=> b!1276940 (= e!729097 (contains!7707 (t!42176 Nil!28645) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140827 res!848381) b!1276939))

(assert (= (and b!1276939 (not res!848380)) b!1276940))

(declare-fun m!1173419 () Bool)

(assert (=> d!140827 m!1173419))

(declare-fun m!1173421 () Bool)

(assert (=> d!140827 m!1173421))

(declare-fun m!1173423 () Bool)

(assert (=> b!1276940 m!1173423))

(assert (=> b!1276875 d!140827))

(declare-fun d!140829 () Bool)

(declare-fun res!848386 () Bool)

(declare-fun e!729103 () Bool)

(assert (=> d!140829 (=> res!848386 e!729103)))

(assert (=> d!140829 (= res!848386 ((_ is Nil!28645) Nil!28645))))

(assert (=> d!140829 (= (noDuplicate!2066 Nil!28645) e!729103)))

(declare-fun b!1276945 () Bool)

(declare-fun e!729104 () Bool)

(assert (=> b!1276945 (= e!729103 e!729104)))

(declare-fun res!848387 () Bool)

(assert (=> b!1276945 (=> (not res!848387) (not e!729104))))

(assert (=> b!1276945 (= res!848387 (not (contains!7707 (t!42176 Nil!28645) (h!29862 Nil!28645))))))

(declare-fun b!1276946 () Bool)

(assert (=> b!1276946 (= e!729104 (noDuplicate!2066 (t!42176 Nil!28645)))))

(assert (= (and d!140829 (not res!848386)) b!1276945))

(assert (= (and b!1276945 res!848387) b!1276946))

(declare-fun m!1173425 () Bool)

(assert (=> b!1276945 m!1173425))

(declare-fun m!1173427 () Bool)

(assert (=> b!1276946 m!1173427))

(assert (=> b!1276876 d!140829))

(declare-fun d!140831 () Bool)

(declare-fun lt!575846 () Bool)

(assert (=> d!140831 (= lt!575846 (select (content!640 Nil!28645) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!729106 () Bool)

(assert (=> d!140831 (= lt!575846 e!729106)))

(declare-fun res!848389 () Bool)

(assert (=> d!140831 (=> (not res!848389) (not e!729106))))

(assert (=> d!140831 (= res!848389 ((_ is Cons!28644) Nil!28645))))

(assert (=> d!140831 (= (contains!7707 Nil!28645 #b1000000000000000000000000000000000000000000000000000000000000000) lt!575846)))

(declare-fun b!1276947 () Bool)

(declare-fun e!729105 () Bool)

(assert (=> b!1276947 (= e!729106 e!729105)))

(declare-fun res!848388 () Bool)

(assert (=> b!1276947 (=> res!848388 e!729105)))

(assert (=> b!1276947 (= res!848388 (= (h!29862 Nil!28645) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1276948 () Bool)

(assert (=> b!1276948 (= e!729105 (contains!7707 (t!42176 Nil!28645) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140831 res!848389) b!1276947))

(assert (= (and b!1276947 (not res!848388)) b!1276948))

(assert (=> d!140831 m!1173419))

(declare-fun m!1173429 () Bool)

(assert (=> d!140831 m!1173429))

(declare-fun m!1173431 () Bool)

(assert (=> b!1276948 m!1173431))

(assert (=> b!1276872 d!140831))

(declare-fun bm!62706 () Bool)

(declare-fun call!62709 () Bool)

(assert (=> bm!62706 (= call!62709 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1276957 () Bool)

(declare-fun e!729114 () Bool)

(assert (=> b!1276957 (= e!729114 call!62709)))

(declare-fun d!140833 () Bool)

(declare-fun res!848395 () Bool)

(declare-fun e!729113 () Bool)

(assert (=> d!140833 (=> res!848395 e!729113)))

(assert (=> d!140833 (= res!848395 (bvsge #b00000000000000000000000000000000 (size!40888 _keys!1427)))))

(assert (=> d!140833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!729113)))

(declare-fun b!1276958 () Bool)

(declare-fun e!729115 () Bool)

(assert (=> b!1276958 (= e!729115 call!62709)))

(declare-fun b!1276959 () Bool)

(assert (=> b!1276959 (= e!729115 e!729114)))

(declare-fun lt!575854 () (_ BitVec 64))

(assert (=> b!1276959 (= lt!575854 (select (arr!40337 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42328 0))(
  ( (Unit!42329) )
))
(declare-fun lt!575855 () Unit!42328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83657 (_ BitVec 64) (_ BitVec 32)) Unit!42328)

(assert (=> b!1276959 (= lt!575855 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575854 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276959 (arrayContainsKey!0 _keys!1427 lt!575854 #b00000000000000000000000000000000)))

(declare-fun lt!575853 () Unit!42328)

(assert (=> b!1276959 (= lt!575853 lt!575855)))

(declare-fun res!848394 () Bool)

(declare-datatypes ((SeekEntryResult!9960 0))(
  ( (MissingZero!9960 (index!42211 (_ BitVec 32))) (Found!9960 (index!42212 (_ BitVec 32))) (Intermediate!9960 (undefined!10772 Bool) (index!42213 (_ BitVec 32)) (x!112957 (_ BitVec 32))) (Undefined!9960) (MissingVacant!9960 (index!42214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83657 (_ BitVec 32)) SeekEntryResult!9960)

(assert (=> b!1276959 (= res!848394 (= (seekEntryOrOpen!0 (select (arr!40337 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!9960 #b00000000000000000000000000000000)))))

(assert (=> b!1276959 (=> (not res!848394) (not e!729114))))

(declare-fun b!1276960 () Bool)

(assert (=> b!1276960 (= e!729113 e!729115)))

(declare-fun c!124327 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1276960 (= c!124327 (validKeyInArray!0 (select (arr!40337 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140833 (not res!848395)) b!1276960))

(assert (= (and b!1276960 c!124327) b!1276959))

(assert (= (and b!1276960 (not c!124327)) b!1276958))

(assert (= (and b!1276959 res!848394) b!1276957))

(assert (= (or b!1276957 b!1276958) bm!62706))

(declare-fun m!1173433 () Bool)

(assert (=> bm!62706 m!1173433))

(declare-fun m!1173435 () Bool)

(assert (=> b!1276959 m!1173435))

(declare-fun m!1173437 () Bool)

(assert (=> b!1276959 m!1173437))

(declare-fun m!1173439 () Bool)

(assert (=> b!1276959 m!1173439))

(assert (=> b!1276959 m!1173435))

(declare-fun m!1173441 () Bool)

(assert (=> b!1276959 m!1173441))

(assert (=> b!1276960 m!1173435))

(assert (=> b!1276960 m!1173435))

(declare-fun m!1173443 () Bool)

(assert (=> b!1276960 m!1173443))

(assert (=> b!1276873 d!140833))

(declare-fun d!140835 () Bool)

(assert (=> d!140835 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108204 d!140835))

(declare-fun d!140837 () Bool)

(assert (=> d!140837 (= (array_inv!30845 _values!1187) (bvsge (size!40889 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108204 d!140837))

(declare-fun d!140839 () Bool)

(assert (=> d!140839 (= (array_inv!30846 _keys!1427) (bvsge (size!40888 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108204 d!140839))

(declare-fun condMapEmpty!51431 () Bool)

(declare-fun mapDefault!51431 () ValueCell!15734)

(assert (=> mapNonEmpty!51422 (= condMapEmpty!51431 (= mapRest!51422 ((as const (Array (_ BitVec 32) ValueCell!15734)) mapDefault!51431)))))

(declare-fun e!729120 () Bool)

(declare-fun mapRes!51431 () Bool)

(assert (=> mapNonEmpty!51422 (= tp!98180 (and e!729120 mapRes!51431))))

(declare-fun b!1276967 () Bool)

(declare-fun e!729121 () Bool)

(assert (=> b!1276967 (= e!729121 tp_is_empty!33265)))

(declare-fun b!1276968 () Bool)

(assert (=> b!1276968 (= e!729120 tp_is_empty!33265)))

(declare-fun mapIsEmpty!51431 () Bool)

(assert (=> mapIsEmpty!51431 mapRes!51431))

(declare-fun mapNonEmpty!51431 () Bool)

(declare-fun tp!98189 () Bool)

(assert (=> mapNonEmpty!51431 (= mapRes!51431 (and tp!98189 e!729121))))

(declare-fun mapKey!51431 () (_ BitVec 32))

(declare-fun mapRest!51431 () (Array (_ BitVec 32) ValueCell!15734))

(declare-fun mapValue!51431 () ValueCell!15734)

(assert (=> mapNonEmpty!51431 (= mapRest!51422 (store mapRest!51431 mapKey!51431 mapValue!51431))))

(assert (= (and mapNonEmpty!51422 condMapEmpty!51431) mapIsEmpty!51431))

(assert (= (and mapNonEmpty!51422 (not condMapEmpty!51431)) mapNonEmpty!51431))

(assert (= (and mapNonEmpty!51431 ((_ is ValueCellFull!15734) mapValue!51431)) b!1276967))

(assert (= (and mapNonEmpty!51422 ((_ is ValueCellFull!15734) mapDefault!51431)) b!1276968))

(declare-fun m!1173445 () Bool)

(assert (=> mapNonEmpty!51431 m!1173445))

(check-sat (not mapNonEmpty!51431) (not b!1276948) (not d!140827) tp_is_empty!33265 (not bm!62706) (not d!140831) (not b!1276960) (not b!1276940) (not b!1276959) (not b!1276946) (not b!1276945))
(check-sat)
