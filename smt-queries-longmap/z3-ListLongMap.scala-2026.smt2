; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35260 () Bool)

(assert start!35260)

(declare-fun b!353460 () Bool)

(declare-fun res!195993 () Bool)

(declare-fun e!216473 () Bool)

(assert (=> b!353460 (=> (not res!195993) (not e!216473))))

(declare-datatypes ((array!19130 0))(
  ( (array!19131 (arr!9063 (Array (_ BitVec 32) (_ BitVec 64))) (size!9415 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19130)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19130 (_ BitVec 32)) Bool)

(assert (=> b!353460 (= res!195993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353461 () Bool)

(declare-fun e!216475 () Bool)

(declare-fun tp_is_empty!7777 () Bool)

(assert (=> b!353461 (= e!216475 tp_is_empty!7777)))

(declare-fun mapIsEmpty!13158 () Bool)

(declare-fun mapRes!13158 () Bool)

(assert (=> mapIsEmpty!13158 mapRes!13158))

(declare-fun b!353462 () Bool)

(declare-fun e!216476 () Bool)

(assert (=> b!353462 (= e!216476 (and e!216475 mapRes!13158))))

(declare-fun condMapEmpty!13158 () Bool)

(declare-datatypes ((V!11347 0))(
  ( (V!11348 (val!3933 Int)) )
))
(declare-datatypes ((ValueCell!3545 0))(
  ( (ValueCellFull!3545 (v!6127 V!11347)) (EmptyCell!3545) )
))
(declare-datatypes ((array!19132 0))(
  ( (array!19133 (arr!9064 (Array (_ BitVec 32) ValueCell!3545)) (size!9416 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19132)

(declare-fun mapDefault!13158 () ValueCell!3545)

(assert (=> b!353462 (= condMapEmpty!13158 (= (arr!9064 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3545)) mapDefault!13158)))))

(declare-fun b!353463 () Bool)

(declare-fun res!195995 () Bool)

(assert (=> b!353463 (=> (not res!195995) (not e!216473))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353463 (= res!195995 (and (= (size!9416 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9415 _keys!1456) (size!9416 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!195994 () Bool)

(assert (=> start!35260 (=> (not res!195994) (not e!216473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35260 (= res!195994 (validMask!0 mask!1842))))

(assert (=> start!35260 e!216473))

(assert (=> start!35260 true))

(declare-fun array_inv!6692 (array!19132) Bool)

(assert (=> start!35260 (and (array_inv!6692 _values!1208) e!216476)))

(declare-fun array_inv!6693 (array!19130) Bool)

(assert (=> start!35260 (array_inv!6693 _keys!1456)))

(declare-fun b!353464 () Bool)

(declare-fun e!216474 () Bool)

(assert (=> b!353464 (= e!216474 tp_is_empty!7777)))

(declare-fun b!353465 () Bool)

(assert (=> b!353465 (= e!216473 (bvsgt #b00000000000000000000000000000000 (size!9415 _keys!1456)))))

(declare-fun mapNonEmpty!13158 () Bool)

(declare-fun tp!27054 () Bool)

(assert (=> mapNonEmpty!13158 (= mapRes!13158 (and tp!27054 e!216474))))

(declare-fun mapKey!13158 () (_ BitVec 32))

(declare-fun mapValue!13158 () ValueCell!3545)

(declare-fun mapRest!13158 () (Array (_ BitVec 32) ValueCell!3545))

(assert (=> mapNonEmpty!13158 (= (arr!9064 _values!1208) (store mapRest!13158 mapKey!13158 mapValue!13158))))

(assert (= (and start!35260 res!195994) b!353463))

(assert (= (and b!353463 res!195995) b!353460))

(assert (= (and b!353460 res!195993) b!353465))

(assert (= (and b!353462 condMapEmpty!13158) mapIsEmpty!13158))

(assert (= (and b!353462 (not condMapEmpty!13158)) mapNonEmpty!13158))

(get-info :version)

(assert (= (and mapNonEmpty!13158 ((_ is ValueCellFull!3545) mapValue!13158)) b!353464))

(assert (= (and b!353462 ((_ is ValueCellFull!3545) mapDefault!13158)) b!353461))

(assert (= start!35260 b!353462))

(declare-fun m!353089 () Bool)

(assert (=> b!353460 m!353089))

(declare-fun m!353091 () Bool)

(assert (=> start!35260 m!353091))

(declare-fun m!353093 () Bool)

(assert (=> start!35260 m!353093))

(declare-fun m!353095 () Bool)

(assert (=> start!35260 m!353095))

(declare-fun m!353097 () Bool)

(assert (=> mapNonEmpty!13158 m!353097))

(check-sat (not b!353460) (not start!35260) (not mapNonEmpty!13158) tp_is_empty!7777)
(check-sat)
(get-model)

(declare-fun b!353510 () Bool)

(declare-fun e!216514 () Bool)

(declare-fun e!216513 () Bool)

(assert (=> b!353510 (= e!216514 e!216513)))

(declare-fun lt!165601 () (_ BitVec 64))

(assert (=> b!353510 (= lt!165601 (select (arr!9063 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10895 0))(
  ( (Unit!10896) )
))
(declare-fun lt!165599 () Unit!10895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19130 (_ BitVec 64) (_ BitVec 32)) Unit!10895)

(assert (=> b!353510 (= lt!165599 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165601 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353510 (arrayContainsKey!0 _keys!1456 lt!165601 #b00000000000000000000000000000000)))

(declare-fun lt!165600 () Unit!10895)

(assert (=> b!353510 (= lt!165600 lt!165599)))

(declare-fun res!196018 () Bool)

(declare-datatypes ((SeekEntryResult!3435 0))(
  ( (MissingZero!3435 (index!15919 (_ BitVec 32))) (Found!3435 (index!15920 (_ BitVec 32))) (Intermediate!3435 (undefined!4247 Bool) (index!15921 (_ BitVec 32)) (x!35136 (_ BitVec 32))) (Undefined!3435) (MissingVacant!3435 (index!15922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19130 (_ BitVec 32)) SeekEntryResult!3435)

(assert (=> b!353510 (= res!196018 (= (seekEntryOrOpen!0 (select (arr!9063 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3435 #b00000000000000000000000000000000)))))

(assert (=> b!353510 (=> (not res!196018) (not e!216513))))

(declare-fun b!353511 () Bool)

(declare-fun e!216515 () Bool)

(assert (=> b!353511 (= e!216515 e!216514)))

(declare-fun c!53669 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353511 (= c!53669 (validKeyInArray!0 (select (arr!9063 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun d!71649 () Bool)

(declare-fun res!196019 () Bool)

(assert (=> d!71649 (=> res!196019 e!216515)))

(assert (=> d!71649 (= res!196019 (bvsge #b00000000000000000000000000000000 (size!9415 _keys!1456)))))

(assert (=> d!71649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216515)))

(declare-fun b!353512 () Bool)

(declare-fun call!27131 () Bool)

(assert (=> b!353512 (= e!216513 call!27131)))

(declare-fun b!353513 () Bool)

(assert (=> b!353513 (= e!216514 call!27131)))

(declare-fun bm!27128 () Bool)

(assert (=> bm!27128 (= call!27131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(assert (= (and d!71649 (not res!196019)) b!353511))

(assert (= (and b!353511 c!53669) b!353510))

(assert (= (and b!353511 (not c!53669)) b!353513))

(assert (= (and b!353510 res!196018) b!353512))

(assert (= (or b!353512 b!353513) bm!27128))

(declare-fun m!353119 () Bool)

(assert (=> b!353510 m!353119))

(declare-fun m!353121 () Bool)

(assert (=> b!353510 m!353121))

(declare-fun m!353123 () Bool)

(assert (=> b!353510 m!353123))

(assert (=> b!353510 m!353119))

(declare-fun m!353125 () Bool)

(assert (=> b!353510 m!353125))

(assert (=> b!353511 m!353119))

(assert (=> b!353511 m!353119))

(declare-fun m!353127 () Bool)

(assert (=> b!353511 m!353127))

(declare-fun m!353129 () Bool)

(assert (=> bm!27128 m!353129))

(assert (=> b!353460 d!71649))

(declare-fun d!71651 () Bool)

(assert (=> d!71651 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35260 d!71651))

(declare-fun d!71653 () Bool)

(assert (=> d!71653 (= (array_inv!6692 _values!1208) (bvsge (size!9416 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35260 d!71653))

(declare-fun d!71655 () Bool)

(assert (=> d!71655 (= (array_inv!6693 _keys!1456) (bvsge (size!9415 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35260 d!71655))

(declare-fun mapNonEmpty!13167 () Bool)

(declare-fun mapRes!13167 () Bool)

(declare-fun tp!27063 () Bool)

(declare-fun e!216521 () Bool)

(assert (=> mapNonEmpty!13167 (= mapRes!13167 (and tp!27063 e!216521))))

(declare-fun mapKey!13167 () (_ BitVec 32))

(declare-fun mapRest!13167 () (Array (_ BitVec 32) ValueCell!3545))

(declare-fun mapValue!13167 () ValueCell!3545)

(assert (=> mapNonEmpty!13167 (= mapRest!13158 (store mapRest!13167 mapKey!13167 mapValue!13167))))

(declare-fun mapIsEmpty!13167 () Bool)

(assert (=> mapIsEmpty!13167 mapRes!13167))

(declare-fun b!353521 () Bool)

(declare-fun e!216520 () Bool)

(assert (=> b!353521 (= e!216520 tp_is_empty!7777)))

(declare-fun condMapEmpty!13167 () Bool)

(declare-fun mapDefault!13167 () ValueCell!3545)

(assert (=> mapNonEmpty!13158 (= condMapEmpty!13167 (= mapRest!13158 ((as const (Array (_ BitVec 32) ValueCell!3545)) mapDefault!13167)))))

(assert (=> mapNonEmpty!13158 (= tp!27054 (and e!216520 mapRes!13167))))

(declare-fun b!353520 () Bool)

(assert (=> b!353520 (= e!216521 tp_is_empty!7777)))

(assert (= (and mapNonEmpty!13158 condMapEmpty!13167) mapIsEmpty!13167))

(assert (= (and mapNonEmpty!13158 (not condMapEmpty!13167)) mapNonEmpty!13167))

(assert (= (and mapNonEmpty!13167 ((_ is ValueCellFull!3545) mapValue!13167)) b!353520))

(assert (= (and mapNonEmpty!13158 ((_ is ValueCellFull!3545) mapDefault!13167)) b!353521))

(declare-fun m!353131 () Bool)

(assert (=> mapNonEmpty!13167 m!353131))

(check-sat (not bm!27128) (not b!353511) (not mapNonEmpty!13167) tp_is_empty!7777 (not b!353510))
(check-sat)
