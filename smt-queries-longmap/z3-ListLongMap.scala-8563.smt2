; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104558 () Bool)

(assert start!104558)

(declare-fun b!1247117 () Bool)

(declare-fun res!832191 () Bool)

(declare-fun e!707420 () Bool)

(assert (=> b!1247117 (=> (not res!832191) (not e!707420))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!80324 0))(
  ( (array!80325 (arr!38734 (Array (_ BitVec 32) (_ BitVec 64))) (size!39270 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80324)

(declare-datatypes ((V!47121 0))(
  ( (V!47122 (val!15721 Int)) )
))
(declare-datatypes ((ValueCell!14895 0))(
  ( (ValueCellFull!14895 (v!18416 V!47121)) (EmptyCell!14895) )
))
(declare-datatypes ((array!80326 0))(
  ( (array!80327 (arr!38735 (Array (_ BitVec 32) ValueCell!14895)) (size!39271 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80326)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247117 (= res!832191 (and (= (size!39271 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39270 _keys!1118) (size!39271 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247118 () Bool)

(declare-fun e!707423 () Bool)

(declare-fun tp_is_empty!31317 () Bool)

(assert (=> b!1247118 (= e!707423 tp_is_empty!31317)))

(declare-fun res!832190 () Bool)

(assert (=> start!104558 (=> (not res!832190) (not e!707420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104558 (= res!832190 (validMask!0 mask!1466))))

(assert (=> start!104558 e!707420))

(assert (=> start!104558 true))

(declare-fun array_inv!29579 (array!80324) Bool)

(assert (=> start!104558 (array_inv!29579 _keys!1118)))

(declare-fun e!707419 () Bool)

(declare-fun array_inv!29580 (array!80326) Bool)

(assert (=> start!104558 (and (array_inv!29580 _values!914) e!707419)))

(declare-fun b!1247119 () Bool)

(declare-fun mapRes!48721 () Bool)

(assert (=> b!1247119 (= e!707419 (and e!707423 mapRes!48721))))

(declare-fun condMapEmpty!48721 () Bool)

(declare-fun mapDefault!48721 () ValueCell!14895)

(assert (=> b!1247119 (= condMapEmpty!48721 (= (arr!38735 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14895)) mapDefault!48721)))))

(declare-fun mapNonEmpty!48721 () Bool)

(declare-fun tp!92822 () Bool)

(declare-fun e!707422 () Bool)

(assert (=> mapNonEmpty!48721 (= mapRes!48721 (and tp!92822 e!707422))))

(declare-fun mapRest!48721 () (Array (_ BitVec 32) ValueCell!14895))

(declare-fun mapKey!48721 () (_ BitVec 32))

(declare-fun mapValue!48721 () ValueCell!14895)

(assert (=> mapNonEmpty!48721 (= (arr!38735 _values!914) (store mapRest!48721 mapKey!48721 mapValue!48721))))

(declare-fun mapIsEmpty!48721 () Bool)

(assert (=> mapIsEmpty!48721 mapRes!48721))

(declare-fun b!1247120 () Bool)

(assert (=> b!1247120 (= e!707422 tp_is_empty!31317)))

(declare-fun b!1247121 () Bool)

(declare-fun res!832192 () Bool)

(assert (=> b!1247121 (=> (not res!832192) (not e!707420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80324 (_ BitVec 32)) Bool)

(assert (=> b!1247121 (= res!832192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247122 () Bool)

(assert (=> b!1247122 (= e!707420 (and (bvsle #b00000000000000000000000000000000 (size!39270 _keys!1118)) (bvsge (size!39270 _keys!1118) #b01111111111111111111111111111111)))))

(assert (= (and start!104558 res!832190) b!1247117))

(assert (= (and b!1247117 res!832191) b!1247121))

(assert (= (and b!1247121 res!832192) b!1247122))

(assert (= (and b!1247119 condMapEmpty!48721) mapIsEmpty!48721))

(assert (= (and b!1247119 (not condMapEmpty!48721)) mapNonEmpty!48721))

(get-info :version)

(assert (= (and mapNonEmpty!48721 ((_ is ValueCellFull!14895) mapValue!48721)) b!1247120))

(assert (= (and b!1247119 ((_ is ValueCellFull!14895) mapDefault!48721)) b!1247118))

(assert (= start!104558 b!1247119))

(declare-fun m!1148743 () Bool)

(assert (=> start!104558 m!1148743))

(declare-fun m!1148745 () Bool)

(assert (=> start!104558 m!1148745))

(declare-fun m!1148747 () Bool)

(assert (=> start!104558 m!1148747))

(declare-fun m!1148749 () Bool)

(assert (=> mapNonEmpty!48721 m!1148749))

(declare-fun m!1148751 () Bool)

(assert (=> b!1247121 m!1148751))

(check-sat (not start!104558) (not b!1247121) (not mapNonEmpty!48721) tp_is_empty!31317)
(check-sat)
(get-model)

(declare-fun d!137731 () Bool)

(assert (=> d!137731 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104558 d!137731))

(declare-fun d!137733 () Bool)

(assert (=> d!137733 (= (array_inv!29579 _keys!1118) (bvsge (size!39270 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104558 d!137733))

(declare-fun d!137735 () Bool)

(assert (=> d!137735 (= (array_inv!29580 _values!914) (bvsge (size!39271 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104558 d!137735))

(declare-fun b!1247149 () Bool)

(declare-fun e!707445 () Bool)

(declare-fun e!707446 () Bool)

(assert (=> b!1247149 (= e!707445 e!707446)))

(declare-fun lt!563226 () (_ BitVec 64))

(assert (=> b!1247149 (= lt!563226 (select (arr!38734 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41467 0))(
  ( (Unit!41468) )
))
(declare-fun lt!563224 () Unit!41467)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80324 (_ BitVec 64) (_ BitVec 32)) Unit!41467)

(assert (=> b!1247149 (= lt!563224 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563226 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247149 (arrayContainsKey!0 _keys!1118 lt!563226 #b00000000000000000000000000000000)))

(declare-fun lt!563225 () Unit!41467)

(assert (=> b!1247149 (= lt!563225 lt!563224)))

(declare-fun res!832206 () Bool)

(declare-datatypes ((SeekEntryResult!9953 0))(
  ( (MissingZero!9953 (index!42183 (_ BitVec 32))) (Found!9953 (index!42184 (_ BitVec 32))) (Intermediate!9953 (undefined!10765 Bool) (index!42185 (_ BitVec 32)) (x!109584 (_ BitVec 32))) (Undefined!9953) (MissingVacant!9953 (index!42186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80324 (_ BitVec 32)) SeekEntryResult!9953)

(assert (=> b!1247149 (= res!832206 (= (seekEntryOrOpen!0 (select (arr!38734 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9953 #b00000000000000000000000000000000)))))

(assert (=> b!1247149 (=> (not res!832206) (not e!707446))))

(declare-fun b!1247150 () Bool)

(declare-fun e!707447 () Bool)

(assert (=> b!1247150 (= e!707447 e!707445)))

(declare-fun c!122094 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247150 (= c!122094 (validKeyInArray!0 (select (arr!38734 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137737 () Bool)

(declare-fun res!832207 () Bool)

(assert (=> d!137737 (=> res!832207 e!707447)))

(assert (=> d!137737 (= res!832207 (bvsge #b00000000000000000000000000000000 (size!39270 _keys!1118)))))

(assert (=> d!137737 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707447)))

(declare-fun b!1247151 () Bool)

(declare-fun call!61557 () Bool)

(assert (=> b!1247151 (= e!707446 call!61557)))

(declare-fun b!1247152 () Bool)

(assert (=> b!1247152 (= e!707445 call!61557)))

(declare-fun bm!61554 () Bool)

(assert (=> bm!61554 (= call!61557 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!137737 (not res!832207)) b!1247150))

(assert (= (and b!1247150 c!122094) b!1247149))

(assert (= (and b!1247150 (not c!122094)) b!1247152))

(assert (= (and b!1247149 res!832206) b!1247151))

(assert (= (or b!1247151 b!1247152) bm!61554))

(declare-fun m!1148763 () Bool)

(assert (=> b!1247149 m!1148763))

(declare-fun m!1148765 () Bool)

(assert (=> b!1247149 m!1148765))

(declare-fun m!1148767 () Bool)

(assert (=> b!1247149 m!1148767))

(assert (=> b!1247149 m!1148763))

(declare-fun m!1148769 () Bool)

(assert (=> b!1247149 m!1148769))

(assert (=> b!1247150 m!1148763))

(assert (=> b!1247150 m!1148763))

(declare-fun m!1148771 () Bool)

(assert (=> b!1247150 m!1148771))

(declare-fun m!1148773 () Bool)

(assert (=> bm!61554 m!1148773))

(assert (=> b!1247121 d!137737))

(declare-fun b!1247159 () Bool)

(declare-fun e!707453 () Bool)

(assert (=> b!1247159 (= e!707453 tp_is_empty!31317)))

(declare-fun mapNonEmpty!48727 () Bool)

(declare-fun mapRes!48727 () Bool)

(declare-fun tp!92828 () Bool)

(assert (=> mapNonEmpty!48727 (= mapRes!48727 (and tp!92828 e!707453))))

(declare-fun mapKey!48727 () (_ BitVec 32))

(declare-fun mapValue!48727 () ValueCell!14895)

(declare-fun mapRest!48727 () (Array (_ BitVec 32) ValueCell!14895))

(assert (=> mapNonEmpty!48727 (= mapRest!48721 (store mapRest!48727 mapKey!48727 mapValue!48727))))

(declare-fun condMapEmpty!48727 () Bool)

(declare-fun mapDefault!48727 () ValueCell!14895)

(assert (=> mapNonEmpty!48721 (= condMapEmpty!48727 (= mapRest!48721 ((as const (Array (_ BitVec 32) ValueCell!14895)) mapDefault!48727)))))

(declare-fun e!707452 () Bool)

(assert (=> mapNonEmpty!48721 (= tp!92822 (and e!707452 mapRes!48727))))

(declare-fun b!1247160 () Bool)

(assert (=> b!1247160 (= e!707452 tp_is_empty!31317)))

(declare-fun mapIsEmpty!48727 () Bool)

(assert (=> mapIsEmpty!48727 mapRes!48727))

(assert (= (and mapNonEmpty!48721 condMapEmpty!48727) mapIsEmpty!48727))

(assert (= (and mapNonEmpty!48721 (not condMapEmpty!48727)) mapNonEmpty!48727))

(assert (= (and mapNonEmpty!48727 ((_ is ValueCellFull!14895) mapValue!48727)) b!1247159))

(assert (= (and mapNonEmpty!48721 ((_ is ValueCellFull!14895) mapDefault!48727)) b!1247160))

(declare-fun m!1148775 () Bool)

(assert (=> mapNonEmpty!48727 m!1148775))

(check-sat (not b!1247149) (not mapNonEmpty!48727) (not bm!61554) tp_is_empty!31317 (not b!1247150))
(check-sat)
