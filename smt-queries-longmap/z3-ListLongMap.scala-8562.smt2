; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104544 () Bool)

(assert start!104544)

(declare-fun b!1247043 () Bool)

(declare-fun e!707360 () Bool)

(declare-datatypes ((array!80312 0))(
  ( (array!80313 (arr!38729 (Array (_ BitVec 32) (_ BitVec 64))) (size!39265 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80312)

(assert (=> b!1247043 (= e!707360 (bvsgt #b00000000000000000000000000000000 (size!39265 _keys!1118)))))

(declare-fun mapNonEmpty!48709 () Bool)

(declare-fun mapRes!48709 () Bool)

(declare-fun tp!92810 () Bool)

(declare-fun e!707361 () Bool)

(assert (=> mapNonEmpty!48709 (= mapRes!48709 (and tp!92810 e!707361))))

(declare-datatypes ((V!47113 0))(
  ( (V!47114 (val!15718 Int)) )
))
(declare-datatypes ((ValueCell!14892 0))(
  ( (ValueCellFull!14892 (v!18413 V!47113)) (EmptyCell!14892) )
))
(declare-fun mapValue!48709 () ValueCell!14892)

(declare-fun mapRest!48709 () (Array (_ BitVec 32) ValueCell!14892))

(declare-datatypes ((array!80314 0))(
  ( (array!80315 (arr!38730 (Array (_ BitVec 32) ValueCell!14892)) (size!39266 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80314)

(declare-fun mapKey!48709 () (_ BitVec 32))

(assert (=> mapNonEmpty!48709 (= (arr!38730 _values!914) (store mapRest!48709 mapKey!48709 mapValue!48709))))

(declare-fun b!1247044 () Bool)

(declare-fun e!707363 () Bool)

(declare-fun e!707362 () Bool)

(assert (=> b!1247044 (= e!707363 (and e!707362 mapRes!48709))))

(declare-fun condMapEmpty!48709 () Bool)

(declare-fun mapDefault!48709 () ValueCell!14892)

(assert (=> b!1247044 (= condMapEmpty!48709 (= (arr!38730 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14892)) mapDefault!48709)))))

(declare-fun mapIsEmpty!48709 () Bool)

(assert (=> mapIsEmpty!48709 mapRes!48709))

(declare-fun res!832159 () Bool)

(assert (=> start!104544 (=> (not res!832159) (not e!707360))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104544 (= res!832159 (validMask!0 mask!1466))))

(assert (=> start!104544 e!707360))

(assert (=> start!104544 true))

(declare-fun array_inv!29575 (array!80312) Bool)

(assert (=> start!104544 (array_inv!29575 _keys!1118)))

(declare-fun array_inv!29576 (array!80314) Bool)

(assert (=> start!104544 (and (array_inv!29576 _values!914) e!707363)))

(declare-fun b!1247045 () Bool)

(declare-fun tp_is_empty!31311 () Bool)

(assert (=> b!1247045 (= e!707361 tp_is_empty!31311)))

(declare-fun b!1247046 () Bool)

(declare-fun res!832158 () Bool)

(assert (=> b!1247046 (=> (not res!832158) (not e!707360))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247046 (= res!832158 (and (= (size!39266 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39265 _keys!1118) (size!39266 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247047 () Bool)

(declare-fun res!832157 () Bool)

(assert (=> b!1247047 (=> (not res!832157) (not e!707360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80312 (_ BitVec 32)) Bool)

(assert (=> b!1247047 (= res!832157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247048 () Bool)

(assert (=> b!1247048 (= e!707362 tp_is_empty!31311)))

(assert (= (and start!104544 res!832159) b!1247046))

(assert (= (and b!1247046 res!832158) b!1247047))

(assert (= (and b!1247047 res!832157) b!1247043))

(assert (= (and b!1247044 condMapEmpty!48709) mapIsEmpty!48709))

(assert (= (and b!1247044 (not condMapEmpty!48709)) mapNonEmpty!48709))

(get-info :version)

(assert (= (and mapNonEmpty!48709 ((_ is ValueCellFull!14892) mapValue!48709)) b!1247045))

(assert (= (and b!1247044 ((_ is ValueCellFull!14892) mapDefault!48709)) b!1247048))

(assert (= start!104544 b!1247044))

(declare-fun m!1148699 () Bool)

(assert (=> mapNonEmpty!48709 m!1148699))

(declare-fun m!1148701 () Bool)

(assert (=> start!104544 m!1148701))

(declare-fun m!1148703 () Bool)

(assert (=> start!104544 m!1148703))

(declare-fun m!1148705 () Bool)

(assert (=> start!104544 m!1148705))

(declare-fun m!1148707 () Bool)

(assert (=> b!1247047 m!1148707))

(check-sat (not b!1247047) (not start!104544) (not mapNonEmpty!48709) tp_is_empty!31311)
(check-sat)
(get-model)

(declare-fun b!1247075 () Bool)

(declare-fun e!707385 () Bool)

(declare-fun e!707386 () Bool)

(assert (=> b!1247075 (= e!707385 e!707386)))

(declare-fun lt!563217 () (_ BitVec 64))

(assert (=> b!1247075 (= lt!563217 (select (arr!38729 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41465 0))(
  ( (Unit!41466) )
))
(declare-fun lt!563216 () Unit!41465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80312 (_ BitVec 64) (_ BitVec 32)) Unit!41465)

(assert (=> b!1247075 (= lt!563216 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563217 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247075 (arrayContainsKey!0 _keys!1118 lt!563217 #b00000000000000000000000000000000)))

(declare-fun lt!563215 () Unit!41465)

(assert (=> b!1247075 (= lt!563215 lt!563216)))

(declare-fun res!832173 () Bool)

(declare-datatypes ((SeekEntryResult!9952 0))(
  ( (MissingZero!9952 (index!42179 (_ BitVec 32))) (Found!9952 (index!42180 (_ BitVec 32))) (Intermediate!9952 (undefined!10764 Bool) (index!42181 (_ BitVec 32)) (x!109573 (_ BitVec 32))) (Undefined!9952) (MissingVacant!9952 (index!42182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80312 (_ BitVec 32)) SeekEntryResult!9952)

(assert (=> b!1247075 (= res!832173 (= (seekEntryOrOpen!0 (select (arr!38729 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9952 #b00000000000000000000000000000000)))))

(assert (=> b!1247075 (=> (not res!832173) (not e!707386))))

(declare-fun bm!61551 () Bool)

(declare-fun call!61554 () Bool)

(assert (=> bm!61551 (= call!61554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1247076 () Bool)

(declare-fun e!707387 () Bool)

(assert (=> b!1247076 (= e!707387 e!707385)))

(declare-fun c!122091 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247076 (= c!122091 (validKeyInArray!0 (select (arr!38729 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137721 () Bool)

(declare-fun res!832174 () Bool)

(assert (=> d!137721 (=> res!832174 e!707387)))

(assert (=> d!137721 (= res!832174 (bvsge #b00000000000000000000000000000000 (size!39265 _keys!1118)))))

(assert (=> d!137721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707387)))

(declare-fun b!1247077 () Bool)

(assert (=> b!1247077 (= e!707386 call!61554)))

(declare-fun b!1247078 () Bool)

(assert (=> b!1247078 (= e!707385 call!61554)))

(assert (= (and d!137721 (not res!832174)) b!1247076))

(assert (= (and b!1247076 c!122091) b!1247075))

(assert (= (and b!1247076 (not c!122091)) b!1247078))

(assert (= (and b!1247075 res!832173) b!1247077))

(assert (= (or b!1247077 b!1247078) bm!61551))

(declare-fun m!1148719 () Bool)

(assert (=> b!1247075 m!1148719))

(declare-fun m!1148721 () Bool)

(assert (=> b!1247075 m!1148721))

(declare-fun m!1148723 () Bool)

(assert (=> b!1247075 m!1148723))

(assert (=> b!1247075 m!1148719))

(declare-fun m!1148725 () Bool)

(assert (=> b!1247075 m!1148725))

(declare-fun m!1148727 () Bool)

(assert (=> bm!61551 m!1148727))

(assert (=> b!1247076 m!1148719))

(assert (=> b!1247076 m!1148719))

(declare-fun m!1148729 () Bool)

(assert (=> b!1247076 m!1148729))

(assert (=> b!1247047 d!137721))

(declare-fun d!137723 () Bool)

(assert (=> d!137723 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104544 d!137723))

(declare-fun d!137725 () Bool)

(assert (=> d!137725 (= (array_inv!29575 _keys!1118) (bvsge (size!39265 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104544 d!137725))

(declare-fun d!137727 () Bool)

(assert (=> d!137727 (= (array_inv!29576 _values!914) (bvsge (size!39266 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104544 d!137727))

(declare-fun mapIsEmpty!48715 () Bool)

(declare-fun mapRes!48715 () Bool)

(assert (=> mapIsEmpty!48715 mapRes!48715))

(declare-fun b!1247085 () Bool)

(declare-fun e!707393 () Bool)

(assert (=> b!1247085 (= e!707393 tp_is_empty!31311)))

(declare-fun condMapEmpty!48715 () Bool)

(declare-fun mapDefault!48715 () ValueCell!14892)

(assert (=> mapNonEmpty!48709 (= condMapEmpty!48715 (= mapRest!48709 ((as const (Array (_ BitVec 32) ValueCell!14892)) mapDefault!48715)))))

(declare-fun e!707392 () Bool)

(assert (=> mapNonEmpty!48709 (= tp!92810 (and e!707392 mapRes!48715))))

(declare-fun b!1247086 () Bool)

(assert (=> b!1247086 (= e!707392 tp_is_empty!31311)))

(declare-fun mapNonEmpty!48715 () Bool)

(declare-fun tp!92816 () Bool)

(assert (=> mapNonEmpty!48715 (= mapRes!48715 (and tp!92816 e!707393))))

(declare-fun mapKey!48715 () (_ BitVec 32))

(declare-fun mapRest!48715 () (Array (_ BitVec 32) ValueCell!14892))

(declare-fun mapValue!48715 () ValueCell!14892)

(assert (=> mapNonEmpty!48715 (= mapRest!48709 (store mapRest!48715 mapKey!48715 mapValue!48715))))

(assert (= (and mapNonEmpty!48709 condMapEmpty!48715) mapIsEmpty!48715))

(assert (= (and mapNonEmpty!48709 (not condMapEmpty!48715)) mapNonEmpty!48715))

(assert (= (and mapNonEmpty!48715 ((_ is ValueCellFull!14892) mapValue!48715)) b!1247085))

(assert (= (and mapNonEmpty!48709 ((_ is ValueCellFull!14892) mapDefault!48715)) b!1247086))

(declare-fun m!1148731 () Bool)

(assert (=> mapNonEmpty!48715 m!1148731))

(check-sat (not b!1247076) (not b!1247075) (not mapNonEmpty!48715) (not bm!61551) tp_is_empty!31311)
(check-sat)
