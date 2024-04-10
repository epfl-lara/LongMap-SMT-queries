; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82084 () Bool)

(assert start!82084)

(declare-fun b!957069 () Bool)

(declare-fun res!640730 () Bool)

(declare-fun e!539397 () Bool)

(assert (=> b!957069 (=> (not res!640730) (not e!539397))))

(declare-datatypes ((array!58287 0))(
  ( (array!58288 (arr!28020 (Array (_ BitVec 32) (_ BitVec 64))) (size!28499 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58287)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58287 (_ BitVec 32)) Bool)

(assert (=> b!957069 (= res!640730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957070 () Bool)

(declare-fun res!640729 () Bool)

(assert (=> b!957070 (=> (not res!640729) (not e!539397))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33107 0))(
  ( (V!33108 (val!10597 Int)) )
))
(declare-datatypes ((ValueCell!10065 0))(
  ( (ValueCellFull!10065 (v!13153 V!33107)) (EmptyCell!10065) )
))
(declare-datatypes ((array!58289 0))(
  ( (array!58290 (arr!28021 (Array (_ BitVec 32) ValueCell!10065)) (size!28500 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58289)

(assert (=> b!957070 (= res!640729 (and (= (size!28500 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28499 _keys!1668) (size!28500 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!640731 () Bool)

(assert (=> start!82084 (=> (not res!640731) (not e!539397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82084 (= res!640731 (validMask!0 mask!2088))))

(assert (=> start!82084 e!539397))

(assert (=> start!82084 true))

(declare-fun e!539400 () Bool)

(declare-fun array_inv!21741 (array!58289) Bool)

(assert (=> start!82084 (and (array_inv!21741 _values!1386) e!539400)))

(declare-fun array_inv!21742 (array!58287) Bool)

(assert (=> start!82084 (array_inv!21742 _keys!1668)))

(declare-fun mapIsEmpty!33610 () Bool)

(declare-fun mapRes!33610 () Bool)

(assert (=> mapIsEmpty!33610 mapRes!33610))

(declare-fun b!957071 () Bool)

(assert (=> b!957071 (= e!539397 (and (bvsle #b00000000000000000000000000000000 (size!28499 _keys!1668)) (bvsge (size!28499 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun b!957072 () Bool)

(declare-fun e!539401 () Bool)

(assert (=> b!957072 (= e!539400 (and e!539401 mapRes!33610))))

(declare-fun condMapEmpty!33610 () Bool)

(declare-fun mapDefault!33610 () ValueCell!10065)

(assert (=> b!957072 (= condMapEmpty!33610 (= (arr!28021 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10065)) mapDefault!33610)))))

(declare-fun mapNonEmpty!33610 () Bool)

(declare-fun tp!64215 () Bool)

(declare-fun e!539398 () Bool)

(assert (=> mapNonEmpty!33610 (= mapRes!33610 (and tp!64215 e!539398))))

(declare-fun mapRest!33610 () (Array (_ BitVec 32) ValueCell!10065))

(declare-fun mapKey!33610 () (_ BitVec 32))

(declare-fun mapValue!33610 () ValueCell!10065)

(assert (=> mapNonEmpty!33610 (= (arr!28021 _values!1386) (store mapRest!33610 mapKey!33610 mapValue!33610))))

(declare-fun b!957073 () Bool)

(declare-fun tp_is_empty!21093 () Bool)

(assert (=> b!957073 (= e!539398 tp_is_empty!21093)))

(declare-fun b!957074 () Bool)

(assert (=> b!957074 (= e!539401 tp_is_empty!21093)))

(assert (= (and start!82084 res!640731) b!957070))

(assert (= (and b!957070 res!640729) b!957069))

(assert (= (and b!957069 res!640730) b!957071))

(assert (= (and b!957072 condMapEmpty!33610) mapIsEmpty!33610))

(assert (= (and b!957072 (not condMapEmpty!33610)) mapNonEmpty!33610))

(get-info :version)

(assert (= (and mapNonEmpty!33610 ((_ is ValueCellFull!10065) mapValue!33610)) b!957073))

(assert (= (and b!957072 ((_ is ValueCellFull!10065) mapDefault!33610)) b!957074))

(assert (= start!82084 b!957072))

(declare-fun m!888177 () Bool)

(assert (=> b!957069 m!888177))

(declare-fun m!888179 () Bool)

(assert (=> start!82084 m!888179))

(declare-fun m!888181 () Bool)

(assert (=> start!82084 m!888181))

(declare-fun m!888183 () Bool)

(assert (=> start!82084 m!888183))

(declare-fun m!888185 () Bool)

(assert (=> mapNonEmpty!33610 m!888185))

(check-sat (not b!957069) (not start!82084) (not mapNonEmpty!33610) tp_is_empty!21093)
(check-sat)
(get-model)

(declare-fun d!115881 () Bool)

(declare-fun res!640746 () Bool)

(declare-fun e!539425 () Bool)

(assert (=> d!115881 (=> res!640746 e!539425)))

(assert (=> d!115881 (= res!640746 (bvsge #b00000000000000000000000000000000 (size!28499 _keys!1668)))))

(assert (=> d!115881 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539425)))

(declare-fun b!957101 () Bool)

(declare-fun e!539423 () Bool)

(declare-fun call!41711 () Bool)

(assert (=> b!957101 (= e!539423 call!41711)))

(declare-fun b!957102 () Bool)

(declare-fun e!539424 () Bool)

(assert (=> b!957102 (= e!539423 e!539424)))

(declare-fun lt!430278 () (_ BitVec 64))

(assert (=> b!957102 (= lt!430278 (select (arr!28020 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32153 0))(
  ( (Unit!32154) )
))
(declare-fun lt!430280 () Unit!32153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58287 (_ BitVec 64) (_ BitVec 32)) Unit!32153)

(assert (=> b!957102 (= lt!430280 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430278 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!957102 (arrayContainsKey!0 _keys!1668 lt!430278 #b00000000000000000000000000000000)))

(declare-fun lt!430279 () Unit!32153)

(assert (=> b!957102 (= lt!430279 lt!430280)))

(declare-fun res!640745 () Bool)

(declare-datatypes ((SeekEntryResult!9190 0))(
  ( (MissingZero!9190 (index!39131 (_ BitVec 32))) (Found!9190 (index!39132 (_ BitVec 32))) (Intermediate!9190 (undefined!10002 Bool) (index!39133 (_ BitVec 32)) (x!82488 (_ BitVec 32))) (Undefined!9190) (MissingVacant!9190 (index!39134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58287 (_ BitVec 32)) SeekEntryResult!9190)

(assert (=> b!957102 (= res!640745 (= (seekEntryOrOpen!0 (select (arr!28020 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9190 #b00000000000000000000000000000000)))))

(assert (=> b!957102 (=> (not res!640745) (not e!539424))))

(declare-fun b!957103 () Bool)

(assert (=> b!957103 (= e!539424 call!41711)))

(declare-fun b!957104 () Bool)

(assert (=> b!957104 (= e!539425 e!539423)))

(declare-fun c!99899 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957104 (= c!99899 (validKeyInArray!0 (select (arr!28020 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun bm!41708 () Bool)

(assert (=> bm!41708 (= call!41711 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(assert (= (and d!115881 (not res!640746)) b!957104))

(assert (= (and b!957104 c!99899) b!957102))

(assert (= (and b!957104 (not c!99899)) b!957101))

(assert (= (and b!957102 res!640745) b!957103))

(assert (= (or b!957103 b!957101) bm!41708))

(declare-fun m!888197 () Bool)

(assert (=> b!957102 m!888197))

(declare-fun m!888199 () Bool)

(assert (=> b!957102 m!888199))

(declare-fun m!888201 () Bool)

(assert (=> b!957102 m!888201))

(assert (=> b!957102 m!888197))

(declare-fun m!888203 () Bool)

(assert (=> b!957102 m!888203))

(assert (=> b!957104 m!888197))

(assert (=> b!957104 m!888197))

(declare-fun m!888205 () Bool)

(assert (=> b!957104 m!888205))

(declare-fun m!888207 () Bool)

(assert (=> bm!41708 m!888207))

(assert (=> b!957069 d!115881))

(declare-fun d!115883 () Bool)

(assert (=> d!115883 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82084 d!115883))

(declare-fun d!115885 () Bool)

(assert (=> d!115885 (= (array_inv!21741 _values!1386) (bvsge (size!28500 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82084 d!115885))

(declare-fun d!115887 () Bool)

(assert (=> d!115887 (= (array_inv!21742 _keys!1668) (bvsge (size!28499 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82084 d!115887))

(declare-fun mapIsEmpty!33616 () Bool)

(declare-fun mapRes!33616 () Bool)

(assert (=> mapIsEmpty!33616 mapRes!33616))

(declare-fun b!957111 () Bool)

(declare-fun e!539430 () Bool)

(assert (=> b!957111 (= e!539430 tp_is_empty!21093)))

(declare-fun b!957112 () Bool)

(declare-fun e!539431 () Bool)

(assert (=> b!957112 (= e!539431 tp_is_empty!21093)))

(declare-fun condMapEmpty!33616 () Bool)

(declare-fun mapDefault!33616 () ValueCell!10065)

(assert (=> mapNonEmpty!33610 (= condMapEmpty!33616 (= mapRest!33610 ((as const (Array (_ BitVec 32) ValueCell!10065)) mapDefault!33616)))))

(assert (=> mapNonEmpty!33610 (= tp!64215 (and e!539431 mapRes!33616))))

(declare-fun mapNonEmpty!33616 () Bool)

(declare-fun tp!64221 () Bool)

(assert (=> mapNonEmpty!33616 (= mapRes!33616 (and tp!64221 e!539430))))

(declare-fun mapRest!33616 () (Array (_ BitVec 32) ValueCell!10065))

(declare-fun mapValue!33616 () ValueCell!10065)

(declare-fun mapKey!33616 () (_ BitVec 32))

(assert (=> mapNonEmpty!33616 (= mapRest!33610 (store mapRest!33616 mapKey!33616 mapValue!33616))))

(assert (= (and mapNonEmpty!33610 condMapEmpty!33616) mapIsEmpty!33616))

(assert (= (and mapNonEmpty!33610 (not condMapEmpty!33616)) mapNonEmpty!33616))

(assert (= (and mapNonEmpty!33616 ((_ is ValueCellFull!10065) mapValue!33616)) b!957111))

(assert (= (and mapNonEmpty!33610 ((_ is ValueCellFull!10065) mapDefault!33616)) b!957112))

(declare-fun m!888209 () Bool)

(assert (=> mapNonEmpty!33616 m!888209))

(check-sat (not bm!41708) (not mapNonEmpty!33616) tp_is_empty!21093 (not b!957102) (not b!957104))
(check-sat)
