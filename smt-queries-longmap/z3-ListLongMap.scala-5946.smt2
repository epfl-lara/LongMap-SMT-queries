; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77474 () Bool)

(assert start!77474)

(declare-fun b!902773 () Bool)

(declare-fun e!505730 () Bool)

(declare-fun tp_is_empty!18505 () Bool)

(assert (=> b!902773 (= e!505730 tp_is_empty!18505)))

(declare-fun b!902774 () Bool)

(declare-fun e!505726 () Bool)

(assert (=> b!902774 (= e!505726 tp_is_empty!18505)))

(declare-fun mapNonEmpty!29467 () Bool)

(declare-fun mapRes!29467 () Bool)

(declare-fun tp!56527 () Bool)

(assert (=> mapNonEmpty!29467 (= mapRes!29467 (and tp!56527 e!505726))))

(declare-datatypes ((V!29639 0))(
  ( (V!29640 (val!9303 Int)) )
))
(declare-datatypes ((ValueCell!8771 0))(
  ( (ValueCellFull!8771 (v!11807 V!29639)) (EmptyCell!8771) )
))
(declare-fun mapValue!29467 () ValueCell!8771)

(declare-fun mapRest!29467 () (Array (_ BitVec 32) ValueCell!8771))

(declare-fun mapKey!29467 () (_ BitVec 32))

(declare-datatypes ((array!53051 0))(
  ( (array!53052 (arr!25486 (Array (_ BitVec 32) ValueCell!8771)) (size!25947 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53051)

(assert (=> mapNonEmpty!29467 (= (arr!25486 _values!1152) (store mapRest!29467 mapKey!29467 mapValue!29467))))

(declare-fun b!902775 () Bool)

(declare-fun e!505729 () Bool)

(assert (=> b!902775 (= e!505729 (and e!505730 mapRes!29467))))

(declare-fun condMapEmpty!29467 () Bool)

(declare-fun mapDefault!29467 () ValueCell!8771)

(assert (=> b!902775 (= condMapEmpty!29467 (= (arr!25486 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8771)) mapDefault!29467)))))

(declare-fun b!902776 () Bool)

(declare-fun res!609193 () Bool)

(declare-fun e!505727 () Bool)

(assert (=> b!902776 (=> (not res!609193) (not e!505727))))

(declare-datatypes ((array!53053 0))(
  ( (array!53054 (arr!25487 (Array (_ BitVec 32) (_ BitVec 64))) (size!25948 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53053)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53053 (_ BitVec 32)) Bool)

(assert (=> b!902776 (= res!609193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29467 () Bool)

(assert (=> mapIsEmpty!29467 mapRes!29467))

(declare-fun b!902777 () Bool)

(assert (=> b!902777 (= e!505727 (bvsgt #b00000000000000000000000000000000 (size!25948 _keys!1386)))))

(declare-fun b!902778 () Bool)

(declare-fun res!609195 () Bool)

(assert (=> b!902778 (=> (not res!609195) (not e!505727))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902778 (= res!609195 (and (= (size!25947 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25948 _keys!1386) (size!25947 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902779 () Bool)

(declare-fun res!609194 () Bool)

(assert (=> b!902779 (=> (not res!609194) (not e!505727))))

(declare-datatypes ((List!17916 0))(
  ( (Nil!17913) (Cons!17912 (h!19058 (_ BitVec 64)) (t!25290 List!17916)) )
))
(declare-fun arrayNoDuplicates!0 (array!53053 (_ BitVec 32) List!17916) Bool)

(assert (=> b!902779 (= res!609194 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17913))))

(declare-fun res!609192 () Bool)

(assert (=> start!77474 (=> (not res!609192) (not e!505727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77474 (= res!609192 (validMask!0 mask!1756))))

(assert (=> start!77474 e!505727))

(assert (=> start!77474 true))

(declare-fun array_inv!20032 (array!53051) Bool)

(assert (=> start!77474 (and (array_inv!20032 _values!1152) e!505729)))

(declare-fun array_inv!20033 (array!53053) Bool)

(assert (=> start!77474 (array_inv!20033 _keys!1386)))

(assert (= (and start!77474 res!609192) b!902778))

(assert (= (and b!902778 res!609195) b!902776))

(assert (= (and b!902776 res!609193) b!902779))

(assert (= (and b!902779 res!609194) b!902777))

(assert (= (and b!902775 condMapEmpty!29467) mapIsEmpty!29467))

(assert (= (and b!902775 (not condMapEmpty!29467)) mapNonEmpty!29467))

(get-info :version)

(assert (= (and mapNonEmpty!29467 ((_ is ValueCellFull!8771) mapValue!29467)) b!902774))

(assert (= (and b!902775 ((_ is ValueCellFull!8771) mapDefault!29467)) b!902773))

(assert (= start!77474 b!902775))

(declare-fun m!838061 () Bool)

(assert (=> mapNonEmpty!29467 m!838061))

(declare-fun m!838063 () Bool)

(assert (=> b!902776 m!838063))

(declare-fun m!838065 () Bool)

(assert (=> b!902779 m!838065))

(declare-fun m!838067 () Bool)

(assert (=> start!77474 m!838067))

(declare-fun m!838069 () Bool)

(assert (=> start!77474 m!838069))

(declare-fun m!838071 () Bool)

(assert (=> start!77474 m!838071))

(check-sat tp_is_empty!18505 (not b!902779) (not b!902776) (not start!77474) (not mapNonEmpty!29467))
(check-sat)
(get-model)

(declare-fun d!111795 () Bool)

(assert (=> d!111795 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77474 d!111795))

(declare-fun d!111797 () Bool)

(assert (=> d!111797 (= (array_inv!20032 _values!1152) (bvsge (size!25947 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77474 d!111797))

(declare-fun d!111799 () Bool)

(assert (=> d!111799 (= (array_inv!20033 _keys!1386) (bvsge (size!25948 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77474 d!111799))

(declare-fun d!111801 () Bool)

(declare-fun res!609225 () Bool)

(declare-fun e!505767 () Bool)

(assert (=> d!111801 (=> res!609225 e!505767)))

(assert (=> d!111801 (= res!609225 (bvsge #b00000000000000000000000000000000 (size!25948 _keys!1386)))))

(assert (=> d!111801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505767)))

(declare-fun b!902830 () Bool)

(declare-fun e!505768 () Bool)

(declare-fun e!505769 () Bool)

(assert (=> b!902830 (= e!505768 e!505769)))

(declare-fun lt!407722 () (_ BitVec 64))

(assert (=> b!902830 (= lt!407722 (select (arr!25487 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30582 0))(
  ( (Unit!30583) )
))
(declare-fun lt!407721 () Unit!30582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53053 (_ BitVec 64) (_ BitVec 32)) Unit!30582)

(assert (=> b!902830 (= lt!407721 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407722 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902830 (arrayContainsKey!0 _keys!1386 lt!407722 #b00000000000000000000000000000000)))

(declare-fun lt!407720 () Unit!30582)

(assert (=> b!902830 (= lt!407720 lt!407721)))

(declare-fun res!609224 () Bool)

(declare-datatypes ((SeekEntryResult!8962 0))(
  ( (MissingZero!8962 (index!38219 (_ BitVec 32))) (Found!8962 (index!38220 (_ BitVec 32))) (Intermediate!8962 (undefined!9774 Bool) (index!38221 (_ BitVec 32)) (x!77002 (_ BitVec 32))) (Undefined!8962) (MissingVacant!8962 (index!38222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53053 (_ BitVec 32)) SeekEntryResult!8962)

(assert (=> b!902830 (= res!609224 (= (seekEntryOrOpen!0 (select (arr!25487 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8962 #b00000000000000000000000000000000)))))

(assert (=> b!902830 (=> (not res!609224) (not e!505769))))

(declare-fun bm!40220 () Bool)

(declare-fun call!40223 () Bool)

(assert (=> bm!40220 (= call!40223 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!902831 () Bool)

(assert (=> b!902831 (= e!505767 e!505768)))

(declare-fun c!95580 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902831 (= c!95580 (validKeyInArray!0 (select (arr!25487 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!902832 () Bool)

(assert (=> b!902832 (= e!505768 call!40223)))

(declare-fun b!902833 () Bool)

(assert (=> b!902833 (= e!505769 call!40223)))

(assert (= (and d!111801 (not res!609225)) b!902831))

(assert (= (and b!902831 c!95580) b!902830))

(assert (= (and b!902831 (not c!95580)) b!902832))

(assert (= (and b!902830 res!609224) b!902833))

(assert (= (or b!902833 b!902832) bm!40220))

(declare-fun m!838097 () Bool)

(assert (=> b!902830 m!838097))

(declare-fun m!838099 () Bool)

(assert (=> b!902830 m!838099))

(declare-fun m!838101 () Bool)

(assert (=> b!902830 m!838101))

(assert (=> b!902830 m!838097))

(declare-fun m!838103 () Bool)

(assert (=> b!902830 m!838103))

(declare-fun m!838105 () Bool)

(assert (=> bm!40220 m!838105))

(assert (=> b!902831 m!838097))

(assert (=> b!902831 m!838097))

(declare-fun m!838107 () Bool)

(assert (=> b!902831 m!838107))

(assert (=> b!902776 d!111801))

(declare-fun b!902844 () Bool)

(declare-fun e!505779 () Bool)

(declare-fun contains!4424 (List!17916 (_ BitVec 64)) Bool)

(assert (=> b!902844 (= e!505779 (contains!4424 Nil!17913 (select (arr!25487 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!902845 () Bool)

(declare-fun e!505781 () Bool)

(declare-fun e!505780 () Bool)

(assert (=> b!902845 (= e!505781 e!505780)))

(declare-fun res!609232 () Bool)

(assert (=> b!902845 (=> (not res!609232) (not e!505780))))

(assert (=> b!902845 (= res!609232 (not e!505779))))

(declare-fun res!609234 () Bool)

(assert (=> b!902845 (=> (not res!609234) (not e!505779))))

(assert (=> b!902845 (= res!609234 (validKeyInArray!0 (select (arr!25487 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!902846 () Bool)

(declare-fun e!505778 () Bool)

(declare-fun call!40226 () Bool)

(assert (=> b!902846 (= e!505778 call!40226)))

(declare-fun b!902847 () Bool)

(assert (=> b!902847 (= e!505778 call!40226)))

(declare-fun d!111803 () Bool)

(declare-fun res!609233 () Bool)

(assert (=> d!111803 (=> res!609233 e!505781)))

(assert (=> d!111803 (= res!609233 (bvsge #b00000000000000000000000000000000 (size!25948 _keys!1386)))))

(assert (=> d!111803 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17913) e!505781)))

(declare-fun bm!40223 () Bool)

(declare-fun c!95583 () Bool)

(assert (=> bm!40223 (= call!40226 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95583 (Cons!17912 (select (arr!25487 _keys!1386) #b00000000000000000000000000000000) Nil!17913) Nil!17913)))))

(declare-fun b!902848 () Bool)

(assert (=> b!902848 (= e!505780 e!505778)))

(assert (=> b!902848 (= c!95583 (validKeyInArray!0 (select (arr!25487 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!111803 (not res!609233)) b!902845))

(assert (= (and b!902845 res!609234) b!902844))

(assert (= (and b!902845 res!609232) b!902848))

(assert (= (and b!902848 c!95583) b!902847))

(assert (= (and b!902848 (not c!95583)) b!902846))

(assert (= (or b!902847 b!902846) bm!40223))

(assert (=> b!902844 m!838097))

(assert (=> b!902844 m!838097))

(declare-fun m!838109 () Bool)

(assert (=> b!902844 m!838109))

(assert (=> b!902845 m!838097))

(assert (=> b!902845 m!838097))

(assert (=> b!902845 m!838107))

(assert (=> bm!40223 m!838097))

(declare-fun m!838111 () Bool)

(assert (=> bm!40223 m!838111))

(assert (=> b!902848 m!838097))

(assert (=> b!902848 m!838097))

(assert (=> b!902848 m!838107))

(assert (=> b!902779 d!111803))

(declare-fun b!902856 () Bool)

(declare-fun e!505787 () Bool)

(assert (=> b!902856 (= e!505787 tp_is_empty!18505)))

(declare-fun b!902855 () Bool)

(declare-fun e!505786 () Bool)

(assert (=> b!902855 (= e!505786 tp_is_empty!18505)))

(declare-fun mapIsEmpty!29476 () Bool)

(declare-fun mapRes!29476 () Bool)

(assert (=> mapIsEmpty!29476 mapRes!29476))

(declare-fun mapNonEmpty!29476 () Bool)

(declare-fun tp!56536 () Bool)

(assert (=> mapNonEmpty!29476 (= mapRes!29476 (and tp!56536 e!505786))))

(declare-fun mapRest!29476 () (Array (_ BitVec 32) ValueCell!8771))

(declare-fun mapKey!29476 () (_ BitVec 32))

(declare-fun mapValue!29476 () ValueCell!8771)

(assert (=> mapNonEmpty!29476 (= mapRest!29467 (store mapRest!29476 mapKey!29476 mapValue!29476))))

(declare-fun condMapEmpty!29476 () Bool)

(declare-fun mapDefault!29476 () ValueCell!8771)

(assert (=> mapNonEmpty!29467 (= condMapEmpty!29476 (= mapRest!29467 ((as const (Array (_ BitVec 32) ValueCell!8771)) mapDefault!29476)))))

(assert (=> mapNonEmpty!29467 (= tp!56527 (and e!505787 mapRes!29476))))

(assert (= (and mapNonEmpty!29467 condMapEmpty!29476) mapIsEmpty!29476))

(assert (= (and mapNonEmpty!29467 (not condMapEmpty!29476)) mapNonEmpty!29476))

(assert (= (and mapNonEmpty!29476 ((_ is ValueCellFull!8771) mapValue!29476)) b!902855))

(assert (= (and mapNonEmpty!29467 ((_ is ValueCellFull!8771) mapDefault!29476)) b!902856))

(declare-fun m!838113 () Bool)

(assert (=> mapNonEmpty!29476 m!838113))

(check-sat (not b!902848) (not b!902844) (not bm!40223) (not mapNonEmpty!29476) tp_is_empty!18505 (not bm!40220) (not b!902845) (not b!902830) (not b!902831))
(check-sat)
