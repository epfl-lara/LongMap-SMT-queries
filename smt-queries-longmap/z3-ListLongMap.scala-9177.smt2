; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110596 () Bool)

(assert start!110596)

(declare-fun b!1307463 () Bool)

(declare-fun e!745956 () Bool)

(declare-fun tp_is_empty!34975 () Bool)

(assert (=> b!1307463 (= e!745956 tp_is_empty!34975)))

(declare-fun mapIsEmpty!54079 () Bool)

(declare-fun mapRes!54079 () Bool)

(assert (=> mapIsEmpty!54079 mapRes!54079))

(declare-fun b!1307464 () Bool)

(declare-fun e!745953 () Bool)

(declare-datatypes ((array!87017 0))(
  ( (array!87018 (arr!41988 (Array (_ BitVec 32) (_ BitVec 64))) (size!42539 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87017)

(assert (=> b!1307464 (= e!745953 (bvsgt #b00000000000000000000000000000000 (size!42539 _keys!1628)))))

(declare-fun res!867681 () Bool)

(assert (=> start!110596 (=> (not res!867681) (not e!745953))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110596 (= res!867681 (validMask!0 mask!2040))))

(assert (=> start!110596 e!745953))

(assert (=> start!110596 true))

(declare-datatypes ((V!51737 0))(
  ( (V!51738 (val!17562 Int)) )
))
(declare-datatypes ((ValueCell!16589 0))(
  ( (ValueCellFull!16589 (v!20183 V!51737)) (EmptyCell!16589) )
))
(declare-datatypes ((array!87019 0))(
  ( (array!87020 (arr!41989 (Array (_ BitVec 32) ValueCell!16589)) (size!42540 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87019)

(declare-fun e!745952 () Bool)

(declare-fun array_inv!32001 (array!87019) Bool)

(assert (=> start!110596 (and (array_inv!32001 _values!1354) e!745952)))

(declare-fun array_inv!32002 (array!87017) Bool)

(assert (=> start!110596 (array_inv!32002 _keys!1628)))

(declare-fun mapNonEmpty!54079 () Bool)

(declare-fun tp!103159 () Bool)

(declare-fun e!745955 () Bool)

(assert (=> mapNonEmpty!54079 (= mapRes!54079 (and tp!103159 e!745955))))

(declare-fun mapValue!54079 () ValueCell!16589)

(declare-fun mapRest!54079 () (Array (_ BitVec 32) ValueCell!16589))

(declare-fun mapKey!54079 () (_ BitVec 32))

(assert (=> mapNonEmpty!54079 (= (arr!41989 _values!1354) (store mapRest!54079 mapKey!54079 mapValue!54079))))

(declare-fun b!1307465 () Bool)

(assert (=> b!1307465 (= e!745955 tp_is_empty!34975)))

(declare-fun b!1307466 () Bool)

(declare-fun res!867680 () Bool)

(assert (=> b!1307466 (=> (not res!867680) (not e!745953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87017 (_ BitVec 32)) Bool)

(assert (=> b!1307466 (= res!867680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307467 () Bool)

(assert (=> b!1307467 (= e!745952 (and e!745956 mapRes!54079))))

(declare-fun condMapEmpty!54079 () Bool)

(declare-fun mapDefault!54079 () ValueCell!16589)

(assert (=> b!1307467 (= condMapEmpty!54079 (= (arr!41989 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16589)) mapDefault!54079)))))

(declare-fun b!1307468 () Bool)

(declare-fun res!867679 () Bool)

(assert (=> b!1307468 (=> (not res!867679) (not e!745953))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307468 (= res!867679 (and (= (size!42540 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42539 _keys!1628) (size!42540 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110596 res!867681) b!1307468))

(assert (= (and b!1307468 res!867679) b!1307466))

(assert (= (and b!1307466 res!867680) b!1307464))

(assert (= (and b!1307467 condMapEmpty!54079) mapIsEmpty!54079))

(assert (= (and b!1307467 (not condMapEmpty!54079)) mapNonEmpty!54079))

(get-info :version)

(assert (= (and mapNonEmpty!54079 ((_ is ValueCellFull!16589) mapValue!54079)) b!1307465))

(assert (= (and b!1307467 ((_ is ValueCellFull!16589) mapDefault!54079)) b!1307463))

(assert (= start!110596 b!1307467))

(declare-fun m!1198905 () Bool)

(assert (=> start!110596 m!1198905))

(declare-fun m!1198907 () Bool)

(assert (=> start!110596 m!1198907))

(declare-fun m!1198909 () Bool)

(assert (=> start!110596 m!1198909))

(declare-fun m!1198911 () Bool)

(assert (=> mapNonEmpty!54079 m!1198911))

(declare-fun m!1198913 () Bool)

(assert (=> b!1307466 m!1198913))

(check-sat (not start!110596) (not b!1307466) (not mapNonEmpty!54079) tp_is_empty!34975)
(check-sat)
(get-model)

(declare-fun d!142667 () Bool)

(assert (=> d!142667 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110596 d!142667))

(declare-fun d!142669 () Bool)

(assert (=> d!142669 (= (array_inv!32001 _values!1354) (bvsge (size!42540 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110596 d!142669))

(declare-fun d!142671 () Bool)

(assert (=> d!142671 (= (array_inv!32002 _keys!1628) (bvsge (size!42539 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110596 d!142671))

(declare-fun b!1307513 () Bool)

(declare-fun e!745994 () Bool)

(declare-fun call!64688 () Bool)

(assert (=> b!1307513 (= e!745994 call!64688)))

(declare-fun d!142673 () Bool)

(declare-fun res!867705 () Bool)

(declare-fun e!745995 () Bool)

(assert (=> d!142673 (=> res!867705 e!745995)))

(assert (=> d!142673 (= res!867705 (bvsge #b00000000000000000000000000000000 (size!42539 _keys!1628)))))

(assert (=> d!142673 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745995)))

(declare-fun b!1307514 () Bool)

(assert (=> b!1307514 (= e!745995 e!745994)))

(declare-fun c!125936 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307514 (= c!125936 (validKeyInArray!0 (select (arr!41988 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun bm!64685 () Bool)

(assert (=> bm!64685 (= call!64688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1307515 () Bool)

(declare-fun e!745993 () Bool)

(assert (=> b!1307515 (= e!745994 e!745993)))

(declare-fun lt!585373 () (_ BitVec 64))

(assert (=> b!1307515 (= lt!585373 (select (arr!41988 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43233 0))(
  ( (Unit!43234) )
))
(declare-fun lt!585371 () Unit!43233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!87017 (_ BitVec 64) (_ BitVec 32)) Unit!43233)

(assert (=> b!1307515 (= lt!585371 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!585373 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!87017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1307515 (arrayContainsKey!0 _keys!1628 lt!585373 #b00000000000000000000000000000000)))

(declare-fun lt!585372 () Unit!43233)

(assert (=> b!1307515 (= lt!585372 lt!585371)))

(declare-fun res!867704 () Bool)

(declare-datatypes ((SeekEntryResult!9987 0))(
  ( (MissingZero!9987 (index!42319 (_ BitVec 32))) (Found!9987 (index!42320 (_ BitVec 32))) (Intermediate!9987 (undefined!10799 Bool) (index!42321 (_ BitVec 32)) (x!115975 (_ BitVec 32))) (Undefined!9987) (MissingVacant!9987 (index!42322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!87017 (_ BitVec 32)) SeekEntryResult!9987)

(assert (=> b!1307515 (= res!867704 (= (seekEntryOrOpen!0 (select (arr!41988 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!9987 #b00000000000000000000000000000000)))))

(assert (=> b!1307515 (=> (not res!867704) (not e!745993))))

(declare-fun b!1307516 () Bool)

(assert (=> b!1307516 (= e!745993 call!64688)))

(assert (= (and d!142673 (not res!867705)) b!1307514))

(assert (= (and b!1307514 c!125936) b!1307515))

(assert (= (and b!1307514 (not c!125936)) b!1307513))

(assert (= (and b!1307515 res!867704) b!1307516))

(assert (= (or b!1307516 b!1307513) bm!64685))

(declare-fun m!1198935 () Bool)

(assert (=> b!1307514 m!1198935))

(assert (=> b!1307514 m!1198935))

(declare-fun m!1198937 () Bool)

(assert (=> b!1307514 m!1198937))

(declare-fun m!1198939 () Bool)

(assert (=> bm!64685 m!1198939))

(assert (=> b!1307515 m!1198935))

(declare-fun m!1198941 () Bool)

(assert (=> b!1307515 m!1198941))

(declare-fun m!1198943 () Bool)

(assert (=> b!1307515 m!1198943))

(assert (=> b!1307515 m!1198935))

(declare-fun m!1198945 () Bool)

(assert (=> b!1307515 m!1198945))

(assert (=> b!1307466 d!142673))

(declare-fun b!1307524 () Bool)

(declare-fun e!746000 () Bool)

(assert (=> b!1307524 (= e!746000 tp_is_empty!34975)))

(declare-fun condMapEmpty!54088 () Bool)

(declare-fun mapDefault!54088 () ValueCell!16589)

(assert (=> mapNonEmpty!54079 (= condMapEmpty!54088 (= mapRest!54079 ((as const (Array (_ BitVec 32) ValueCell!16589)) mapDefault!54088)))))

(declare-fun mapRes!54088 () Bool)

(assert (=> mapNonEmpty!54079 (= tp!103159 (and e!746000 mapRes!54088))))

(declare-fun mapIsEmpty!54088 () Bool)

(assert (=> mapIsEmpty!54088 mapRes!54088))

(declare-fun b!1307523 () Bool)

(declare-fun e!746001 () Bool)

(assert (=> b!1307523 (= e!746001 tp_is_empty!34975)))

(declare-fun mapNonEmpty!54088 () Bool)

(declare-fun tp!103168 () Bool)

(assert (=> mapNonEmpty!54088 (= mapRes!54088 (and tp!103168 e!746001))))

(declare-fun mapKey!54088 () (_ BitVec 32))

(declare-fun mapValue!54088 () ValueCell!16589)

(declare-fun mapRest!54088 () (Array (_ BitVec 32) ValueCell!16589))

(assert (=> mapNonEmpty!54088 (= mapRest!54079 (store mapRest!54088 mapKey!54088 mapValue!54088))))

(assert (= (and mapNonEmpty!54079 condMapEmpty!54088) mapIsEmpty!54088))

(assert (= (and mapNonEmpty!54079 (not condMapEmpty!54088)) mapNonEmpty!54088))

(assert (= (and mapNonEmpty!54088 ((_ is ValueCellFull!16589) mapValue!54088)) b!1307523))

(assert (= (and mapNonEmpty!54079 ((_ is ValueCellFull!16589) mapDefault!54088)) b!1307524))

(declare-fun m!1198947 () Bool)

(assert (=> mapNonEmpty!54088 m!1198947))

(check-sat (not b!1307514) (not bm!64685) (not mapNonEmpty!54088) (not b!1307515) tp_is_empty!34975)
(check-sat)
