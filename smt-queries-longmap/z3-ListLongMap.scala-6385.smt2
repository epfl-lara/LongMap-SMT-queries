; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82070 () Bool)

(assert start!82070)

(declare-fun b!956995 () Bool)

(declare-fun e!539337 () Bool)

(declare-fun tp_is_empty!21087 () Bool)

(assert (=> b!956995 (= e!539337 tp_is_empty!21087)))

(declare-fun mapNonEmpty!33598 () Bool)

(declare-fun mapRes!33598 () Bool)

(declare-fun tp!64203 () Bool)

(assert (=> mapNonEmpty!33598 (= mapRes!33598 (and tp!64203 e!539337))))

(declare-datatypes ((V!33099 0))(
  ( (V!33100 (val!10594 Int)) )
))
(declare-datatypes ((ValueCell!10062 0))(
  ( (ValueCellFull!10062 (v!13150 V!33099)) (EmptyCell!10062) )
))
(declare-fun mapValue!33598 () ValueCell!10062)

(declare-fun mapKey!33598 () (_ BitVec 32))

(declare-datatypes ((array!58273 0))(
  ( (array!58274 (arr!28014 (Array (_ BitVec 32) ValueCell!10062)) (size!28493 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58273)

(declare-fun mapRest!33598 () (Array (_ BitVec 32) ValueCell!10062))

(assert (=> mapNonEmpty!33598 (= (arr!28014 _values!1386) (store mapRest!33598 mapKey!33598 mapValue!33598))))

(declare-fun b!956996 () Bool)

(declare-fun e!539339 () Bool)

(declare-datatypes ((array!58275 0))(
  ( (array!58276 (arr!28015 (Array (_ BitVec 32) (_ BitVec 64))) (size!28494 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58275)

(assert (=> b!956996 (= e!539339 (bvsgt #b00000000000000000000000000000000 (size!28494 _keys!1668)))))

(declare-fun b!956997 () Bool)

(declare-fun e!539341 () Bool)

(declare-fun e!539338 () Bool)

(assert (=> b!956997 (= e!539341 (and e!539338 mapRes!33598))))

(declare-fun condMapEmpty!33598 () Bool)

(declare-fun mapDefault!33598 () ValueCell!10062)

(assert (=> b!956997 (= condMapEmpty!33598 (= (arr!28014 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10062)) mapDefault!33598)))))

(declare-fun res!640697 () Bool)

(assert (=> start!82070 (=> (not res!640697) (not e!539339))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82070 (= res!640697 (validMask!0 mask!2088))))

(assert (=> start!82070 e!539339))

(assert (=> start!82070 true))

(declare-fun array_inv!21735 (array!58273) Bool)

(assert (=> start!82070 (and (array_inv!21735 _values!1386) e!539341)))

(declare-fun array_inv!21736 (array!58275) Bool)

(assert (=> start!82070 (array_inv!21736 _keys!1668)))

(declare-fun b!956998 () Bool)

(assert (=> b!956998 (= e!539338 tp_is_empty!21087)))

(declare-fun b!956999 () Bool)

(declare-fun res!640696 () Bool)

(assert (=> b!956999 (=> (not res!640696) (not e!539339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58275 (_ BitVec 32)) Bool)

(assert (=> b!956999 (= res!640696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33598 () Bool)

(assert (=> mapIsEmpty!33598 mapRes!33598))

(declare-fun b!957000 () Bool)

(declare-fun res!640698 () Bool)

(assert (=> b!957000 (=> (not res!640698) (not e!539339))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957000 (= res!640698 (and (= (size!28493 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28494 _keys!1668) (size!28493 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82070 res!640697) b!957000))

(assert (= (and b!957000 res!640698) b!956999))

(assert (= (and b!956999 res!640696) b!956996))

(assert (= (and b!956997 condMapEmpty!33598) mapIsEmpty!33598))

(assert (= (and b!956997 (not condMapEmpty!33598)) mapNonEmpty!33598))

(get-info :version)

(assert (= (and mapNonEmpty!33598 ((_ is ValueCellFull!10062) mapValue!33598)) b!956995))

(assert (= (and b!956997 ((_ is ValueCellFull!10062) mapDefault!33598)) b!956998))

(assert (= start!82070 b!956997))

(declare-fun m!888133 () Bool)

(assert (=> mapNonEmpty!33598 m!888133))

(declare-fun m!888135 () Bool)

(assert (=> start!82070 m!888135))

(declare-fun m!888137 () Bool)

(assert (=> start!82070 m!888137))

(declare-fun m!888139 () Bool)

(assert (=> start!82070 m!888139))

(declare-fun m!888141 () Bool)

(assert (=> b!956999 m!888141))

(check-sat (not start!82070) (not b!956999) (not mapNonEmpty!33598) tp_is_empty!21087)
(check-sat)
(get-model)

(declare-fun d!115871 () Bool)

(assert (=> d!115871 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82070 d!115871))

(declare-fun d!115873 () Bool)

(assert (=> d!115873 (= (array_inv!21735 _values!1386) (bvsge (size!28493 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82070 d!115873))

(declare-fun d!115875 () Bool)

(assert (=> d!115875 (= (array_inv!21736 _keys!1668) (bvsge (size!28494 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82070 d!115875))

(declare-fun b!957027 () Bool)

(declare-fun e!539364 () Bool)

(declare-fun call!41708 () Bool)

(assert (=> b!957027 (= e!539364 call!41708)))

(declare-fun bm!41705 () Bool)

(assert (=> bm!41705 (= call!41708 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(declare-fun b!957028 () Bool)

(declare-fun e!539365 () Bool)

(assert (=> b!957028 (= e!539365 call!41708)))

(declare-fun d!115877 () Bool)

(declare-fun res!640713 () Bool)

(declare-fun e!539363 () Bool)

(assert (=> d!115877 (=> res!640713 e!539363)))

(assert (=> d!115877 (= res!640713 (bvsge #b00000000000000000000000000000000 (size!28494 _keys!1668)))))

(assert (=> d!115877 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539363)))

(declare-fun b!957029 () Bool)

(assert (=> b!957029 (= e!539363 e!539365)))

(declare-fun c!99896 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957029 (= c!99896 (validKeyInArray!0 (select (arr!28015 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun b!957030 () Bool)

(assert (=> b!957030 (= e!539365 e!539364)))

(declare-fun lt!430269 () (_ BitVec 64))

(assert (=> b!957030 (= lt!430269 (select (arr!28015 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32151 0))(
  ( (Unit!32152) )
))
(declare-fun lt!430270 () Unit!32151)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58275 (_ BitVec 64) (_ BitVec 32)) Unit!32151)

(assert (=> b!957030 (= lt!430270 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430269 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!957030 (arrayContainsKey!0 _keys!1668 lt!430269 #b00000000000000000000000000000000)))

(declare-fun lt!430271 () Unit!32151)

(assert (=> b!957030 (= lt!430271 lt!430270)))

(declare-fun res!640712 () Bool)

(declare-datatypes ((SeekEntryResult!9189 0))(
  ( (MissingZero!9189 (index!39127 (_ BitVec 32))) (Found!9189 (index!39128 (_ BitVec 32))) (Intermediate!9189 (undefined!10001 Bool) (index!39129 (_ BitVec 32)) (x!82477 (_ BitVec 32))) (Undefined!9189) (MissingVacant!9189 (index!39130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58275 (_ BitVec 32)) SeekEntryResult!9189)

(assert (=> b!957030 (= res!640712 (= (seekEntryOrOpen!0 (select (arr!28015 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9189 #b00000000000000000000000000000000)))))

(assert (=> b!957030 (=> (not res!640712) (not e!539364))))

(assert (= (and d!115877 (not res!640713)) b!957029))

(assert (= (and b!957029 c!99896) b!957030))

(assert (= (and b!957029 (not c!99896)) b!957028))

(assert (= (and b!957030 res!640712) b!957027))

(assert (= (or b!957027 b!957028) bm!41705))

(declare-fun m!888153 () Bool)

(assert (=> bm!41705 m!888153))

(declare-fun m!888155 () Bool)

(assert (=> b!957029 m!888155))

(assert (=> b!957029 m!888155))

(declare-fun m!888157 () Bool)

(assert (=> b!957029 m!888157))

(assert (=> b!957030 m!888155))

(declare-fun m!888159 () Bool)

(assert (=> b!957030 m!888159))

(declare-fun m!888161 () Bool)

(assert (=> b!957030 m!888161))

(assert (=> b!957030 m!888155))

(declare-fun m!888163 () Bool)

(assert (=> b!957030 m!888163))

(assert (=> b!956999 d!115877))

(declare-fun condMapEmpty!33604 () Bool)

(declare-fun mapDefault!33604 () ValueCell!10062)

(assert (=> mapNonEmpty!33598 (= condMapEmpty!33604 (= mapRest!33598 ((as const (Array (_ BitVec 32) ValueCell!10062)) mapDefault!33604)))))

(declare-fun e!539371 () Bool)

(declare-fun mapRes!33604 () Bool)

(assert (=> mapNonEmpty!33598 (= tp!64203 (and e!539371 mapRes!33604))))

(declare-fun mapNonEmpty!33604 () Bool)

(declare-fun tp!64209 () Bool)

(declare-fun e!539370 () Bool)

(assert (=> mapNonEmpty!33604 (= mapRes!33604 (and tp!64209 e!539370))))

(declare-fun mapKey!33604 () (_ BitVec 32))

(declare-fun mapRest!33604 () (Array (_ BitVec 32) ValueCell!10062))

(declare-fun mapValue!33604 () ValueCell!10062)

(assert (=> mapNonEmpty!33604 (= mapRest!33598 (store mapRest!33604 mapKey!33604 mapValue!33604))))

(declare-fun b!957037 () Bool)

(assert (=> b!957037 (= e!539370 tp_is_empty!21087)))

(declare-fun mapIsEmpty!33604 () Bool)

(assert (=> mapIsEmpty!33604 mapRes!33604))

(declare-fun b!957038 () Bool)

(assert (=> b!957038 (= e!539371 tp_is_empty!21087)))

(assert (= (and mapNonEmpty!33598 condMapEmpty!33604) mapIsEmpty!33604))

(assert (= (and mapNonEmpty!33598 (not condMapEmpty!33604)) mapNonEmpty!33604))

(assert (= (and mapNonEmpty!33604 ((_ is ValueCellFull!10062) mapValue!33604)) b!957037))

(assert (= (and mapNonEmpty!33598 ((_ is ValueCellFull!10062) mapDefault!33604)) b!957038))

(declare-fun m!888165 () Bool)

(assert (=> mapNonEmpty!33604 m!888165))

(check-sat (not b!957030) tp_is_empty!21087 (not mapNonEmpty!33604) (not b!957029) (not bm!41705))
(check-sat)
