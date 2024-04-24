; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104794 () Bool)

(assert start!104794)

(declare-fun res!832736 () Bool)

(declare-fun e!708315 () Bool)

(assert (=> start!104794 (=> (not res!832736) (not e!708315))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104794 (= res!832736 (validMask!0 mask!1466))))

(assert (=> start!104794 e!708315))

(assert (=> start!104794 true))

(declare-datatypes ((array!80369 0))(
  ( (array!80370 (arr!38751 (Array (_ BitVec 32) (_ BitVec 64))) (size!39288 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80369)

(declare-fun array_inv!29679 (array!80369) Bool)

(assert (=> start!104794 (array_inv!29679 _keys!1118)))

(declare-datatypes ((V!47127 0))(
  ( (V!47128 (val!15723 Int)) )
))
(declare-datatypes ((ValueCell!14897 0))(
  ( (ValueCellFull!14897 (v!18414 V!47127)) (EmptyCell!14897) )
))
(declare-datatypes ((array!80371 0))(
  ( (array!80372 (arr!38752 (Array (_ BitVec 32) ValueCell!14897)) (size!39289 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80371)

(declare-fun e!708313 () Bool)

(declare-fun array_inv!29680 (array!80371) Bool)

(assert (=> start!104794 (and (array_inv!29680 _values!914) e!708313)))

(declare-fun b!1248480 () Bool)

(declare-fun e!708312 () Bool)

(declare-fun mapRes!48730 () Bool)

(assert (=> b!1248480 (= e!708313 (and e!708312 mapRes!48730))))

(declare-fun condMapEmpty!48730 () Bool)

(declare-fun mapDefault!48730 () ValueCell!14897)

(assert (=> b!1248480 (= condMapEmpty!48730 (= (arr!38752 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14897)) mapDefault!48730)))))

(declare-fun b!1248481 () Bool)

(declare-fun res!832737 () Bool)

(assert (=> b!1248481 (=> (not res!832737) (not e!708315))))

(assert (=> b!1248481 (= res!832737 (and (bvsle #b00000000000000000000000000000000 (size!39288 _keys!1118)) (bvslt (size!39288 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1248482 () Bool)

(declare-fun tp_is_empty!31321 () Bool)

(assert (=> b!1248482 (= e!708312 tp_is_empty!31321)))

(declare-fun b!1248483 () Bool)

(declare-fun e!708314 () Bool)

(assert (=> b!1248483 (= e!708314 tp_is_empty!31321)))

(declare-fun mapNonEmpty!48730 () Bool)

(declare-fun tp!92831 () Bool)

(assert (=> mapNonEmpty!48730 (= mapRes!48730 (and tp!92831 e!708314))))

(declare-fun mapRest!48730 () (Array (_ BitVec 32) ValueCell!14897))

(declare-fun mapValue!48730 () ValueCell!14897)

(declare-fun mapKey!48730 () (_ BitVec 32))

(assert (=> mapNonEmpty!48730 (= (arr!38752 _values!914) (store mapRest!48730 mapKey!48730 mapValue!48730))))

(declare-fun b!1248484 () Bool)

(declare-fun res!832738 () Bool)

(assert (=> b!1248484 (=> (not res!832738) (not e!708315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80369 (_ BitVec 32)) Bool)

(assert (=> b!1248484 (= res!832738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248485 () Bool)

(declare-datatypes ((List!27545 0))(
  ( (Nil!27542) (Cons!27541 (h!28759 (_ BitVec 64)) (t!41006 List!27545)) )
))
(declare-fun noDuplicate!2056 (List!27545) Bool)

(assert (=> b!1248485 (= e!708315 (not (noDuplicate!2056 Nil!27542)))))

(declare-fun b!1248486 () Bool)

(declare-fun res!832739 () Bool)

(assert (=> b!1248486 (=> (not res!832739) (not e!708315))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248486 (= res!832739 (and (= (size!39289 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39288 _keys!1118) (size!39289 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48730 () Bool)

(assert (=> mapIsEmpty!48730 mapRes!48730))

(assert (= (and start!104794 res!832736) b!1248486))

(assert (= (and b!1248486 res!832739) b!1248484))

(assert (= (and b!1248484 res!832738) b!1248481))

(assert (= (and b!1248481 res!832737) b!1248485))

(assert (= (and b!1248480 condMapEmpty!48730) mapIsEmpty!48730))

(assert (= (and b!1248480 (not condMapEmpty!48730)) mapNonEmpty!48730))

(get-info :version)

(assert (= (and mapNonEmpty!48730 ((_ is ValueCellFull!14897) mapValue!48730)) b!1248483))

(assert (= (and b!1248480 ((_ is ValueCellFull!14897) mapDefault!48730)) b!1248482))

(assert (= start!104794 b!1248480))

(declare-fun m!1150389 () Bool)

(assert (=> start!104794 m!1150389))

(declare-fun m!1150391 () Bool)

(assert (=> start!104794 m!1150391))

(declare-fun m!1150393 () Bool)

(assert (=> start!104794 m!1150393))

(declare-fun m!1150395 () Bool)

(assert (=> mapNonEmpty!48730 m!1150395))

(declare-fun m!1150397 () Bool)

(assert (=> b!1248484 m!1150397))

(declare-fun m!1150399 () Bool)

(assert (=> b!1248485 m!1150399))

(check-sat tp_is_empty!31321 (not mapNonEmpty!48730) (not start!104794) (not b!1248484) (not b!1248485))
(check-sat)
(get-model)

(declare-fun d!138189 () Bool)

(declare-fun res!832768 () Bool)

(declare-fun e!708350 () Bool)

(assert (=> d!138189 (=> res!832768 e!708350)))

(assert (=> d!138189 (= res!832768 ((_ is Nil!27542) Nil!27542))))

(assert (=> d!138189 (= (noDuplicate!2056 Nil!27542) e!708350)))

(declare-fun b!1248533 () Bool)

(declare-fun e!708351 () Bool)

(assert (=> b!1248533 (= e!708350 e!708351)))

(declare-fun res!832769 () Bool)

(assert (=> b!1248533 (=> (not res!832769) (not e!708351))))

(declare-fun contains!7496 (List!27545 (_ BitVec 64)) Bool)

(assert (=> b!1248533 (= res!832769 (not (contains!7496 (t!41006 Nil!27542) (h!28759 Nil!27542))))))

(declare-fun b!1248534 () Bool)

(assert (=> b!1248534 (= e!708351 (noDuplicate!2056 (t!41006 Nil!27542)))))

(assert (= (and d!138189 (not res!832768)) b!1248533))

(assert (= (and b!1248533 res!832769) b!1248534))

(declare-fun m!1150425 () Bool)

(assert (=> b!1248533 m!1150425))

(declare-fun m!1150427 () Bool)

(assert (=> b!1248534 m!1150427))

(assert (=> b!1248485 d!138189))

(declare-fun d!138191 () Bool)

(assert (=> d!138191 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104794 d!138191))

(declare-fun d!138193 () Bool)

(assert (=> d!138193 (= (array_inv!29679 _keys!1118) (bvsge (size!39288 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104794 d!138193))

(declare-fun d!138195 () Bool)

(assert (=> d!138195 (= (array_inv!29680 _values!914) (bvsge (size!39289 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104794 d!138195))

(declare-fun d!138197 () Bool)

(declare-fun res!832774 () Bool)

(declare-fun e!708360 () Bool)

(assert (=> d!138197 (=> res!832774 e!708360)))

(assert (=> d!138197 (= res!832774 (bvsge #b00000000000000000000000000000000 (size!39288 _keys!1118)))))

(assert (=> d!138197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!708360)))

(declare-fun bm!61622 () Bool)

(declare-fun call!61625 () Bool)

(assert (=> bm!61622 (= call!61625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1248543 () Bool)

(declare-fun e!708359 () Bool)

(assert (=> b!1248543 (= e!708359 call!61625)))

(declare-fun b!1248544 () Bool)

(declare-fun e!708358 () Bool)

(assert (=> b!1248544 (= e!708360 e!708358)))

(declare-fun c!122497 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248544 (= c!122497 (validKeyInArray!0 (select (arr!38751 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1248545 () Bool)

(assert (=> b!1248545 (= e!708358 e!708359)))

(declare-fun lt!563718 () (_ BitVec 64))

(assert (=> b!1248545 (= lt!563718 (select (arr!38751 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41442 0))(
  ( (Unit!41443) )
))
(declare-fun lt!563719 () Unit!41442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80369 (_ BitVec 64) (_ BitVec 32)) Unit!41442)

(assert (=> b!1248545 (= lt!563719 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563718 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1248545 (arrayContainsKey!0 _keys!1118 lt!563718 #b00000000000000000000000000000000)))

(declare-fun lt!563717 () Unit!41442)

(assert (=> b!1248545 (= lt!563717 lt!563719)))

(declare-fun res!832775 () Bool)

(declare-datatypes ((SeekEntryResult!9910 0))(
  ( (MissingZero!9910 (index!42011 (_ BitVec 32))) (Found!9910 (index!42012 (_ BitVec 32))) (Intermediate!9910 (undefined!10722 Bool) (index!42013 (_ BitVec 32)) (x!109573 (_ BitVec 32))) (Undefined!9910) (MissingVacant!9910 (index!42014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80369 (_ BitVec 32)) SeekEntryResult!9910)

(assert (=> b!1248545 (= res!832775 (= (seekEntryOrOpen!0 (select (arr!38751 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9910 #b00000000000000000000000000000000)))))

(assert (=> b!1248545 (=> (not res!832775) (not e!708359))))

(declare-fun b!1248546 () Bool)

(assert (=> b!1248546 (= e!708358 call!61625)))

(assert (= (and d!138197 (not res!832774)) b!1248544))

(assert (= (and b!1248544 c!122497) b!1248545))

(assert (= (and b!1248544 (not c!122497)) b!1248546))

(assert (= (and b!1248545 res!832775) b!1248543))

(assert (= (or b!1248543 b!1248546) bm!61622))

(declare-fun m!1150429 () Bool)

(assert (=> bm!61622 m!1150429))

(declare-fun m!1150431 () Bool)

(assert (=> b!1248544 m!1150431))

(assert (=> b!1248544 m!1150431))

(declare-fun m!1150433 () Bool)

(assert (=> b!1248544 m!1150433))

(assert (=> b!1248545 m!1150431))

(declare-fun m!1150435 () Bool)

(assert (=> b!1248545 m!1150435))

(declare-fun m!1150437 () Bool)

(assert (=> b!1248545 m!1150437))

(assert (=> b!1248545 m!1150431))

(declare-fun m!1150439 () Bool)

(assert (=> b!1248545 m!1150439))

(assert (=> b!1248484 d!138197))

(declare-fun mapIsEmpty!48739 () Bool)

(declare-fun mapRes!48739 () Bool)

(assert (=> mapIsEmpty!48739 mapRes!48739))

(declare-fun condMapEmpty!48739 () Bool)

(declare-fun mapDefault!48739 () ValueCell!14897)

(assert (=> mapNonEmpty!48730 (= condMapEmpty!48739 (= mapRest!48730 ((as const (Array (_ BitVec 32) ValueCell!14897)) mapDefault!48739)))))

(declare-fun e!708365 () Bool)

(assert (=> mapNonEmpty!48730 (= tp!92831 (and e!708365 mapRes!48739))))

(declare-fun b!1248554 () Bool)

(assert (=> b!1248554 (= e!708365 tp_is_empty!31321)))

(declare-fun b!1248553 () Bool)

(declare-fun e!708366 () Bool)

(assert (=> b!1248553 (= e!708366 tp_is_empty!31321)))

(declare-fun mapNonEmpty!48739 () Bool)

(declare-fun tp!92840 () Bool)

(assert (=> mapNonEmpty!48739 (= mapRes!48739 (and tp!92840 e!708366))))

(declare-fun mapValue!48739 () ValueCell!14897)

(declare-fun mapKey!48739 () (_ BitVec 32))

(declare-fun mapRest!48739 () (Array (_ BitVec 32) ValueCell!14897))

(assert (=> mapNonEmpty!48739 (= mapRest!48730 (store mapRest!48739 mapKey!48739 mapValue!48739))))

(assert (= (and mapNonEmpty!48730 condMapEmpty!48739) mapIsEmpty!48739))

(assert (= (and mapNonEmpty!48730 (not condMapEmpty!48739)) mapNonEmpty!48739))

(assert (= (and mapNonEmpty!48739 ((_ is ValueCellFull!14897) mapValue!48739)) b!1248553))

(assert (= (and mapNonEmpty!48730 ((_ is ValueCellFull!14897) mapDefault!48739)) b!1248554))

(declare-fun m!1150441 () Bool)

(assert (=> mapNonEmpty!48739 m!1150441))

(check-sat (not b!1248534) tp_is_empty!31321 (not mapNonEmpty!48739) (not b!1248533) (not b!1248545) (not bm!61622) (not b!1248544))
(check-sat)
