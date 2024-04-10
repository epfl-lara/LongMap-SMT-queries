; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78452 () Bool)

(assert start!78452)

(declare-fun b!914914 () Bool)

(declare-fun res!616929 () Bool)

(declare-fun e!513361 () Bool)

(assert (=> b!914914 (=> (not res!616929) (not e!513361))))

(declare-datatypes ((array!54400 0))(
  ( (array!54401 (arr!26148 (Array (_ BitVec 32) (_ BitVec 64))) (size!26607 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54400)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54400 (_ BitVec 32)) Bool)

(assert (=> b!914914 (= res!616929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30552 () Bool)

(declare-fun mapRes!30552 () Bool)

(declare-fun tp!58619 () Bool)

(declare-fun e!513359 () Bool)

(assert (=> mapNonEmpty!30552 (= mapRes!30552 (and tp!58619 e!513359))))

(declare-datatypes ((V!30569 0))(
  ( (V!30570 (val!9652 Int)) )
))
(declare-datatypes ((ValueCell!9120 0))(
  ( (ValueCellFull!9120 (v!12169 V!30569)) (EmptyCell!9120) )
))
(declare-fun mapValue!30552 () ValueCell!9120)

(declare-fun mapRest!30552 () (Array (_ BitVec 32) ValueCell!9120))

(declare-datatypes ((array!54402 0))(
  ( (array!54403 (arr!26149 (Array (_ BitVec 32) ValueCell!9120)) (size!26608 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54402)

(declare-fun mapKey!30552 () (_ BitVec 32))

(assert (=> mapNonEmpty!30552 (= (arr!26149 _values!1231) (store mapRest!30552 mapKey!30552 mapValue!30552))))

(declare-fun mapIsEmpty!30552 () Bool)

(assert (=> mapIsEmpty!30552 mapRes!30552))

(declare-fun res!616931 () Bool)

(assert (=> start!78452 (=> (not res!616931) (not e!513361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78452 (= res!616931 (validMask!0 mask!1881))))

(assert (=> start!78452 e!513361))

(assert (=> start!78452 true))

(declare-fun e!513358 () Bool)

(declare-fun array_inv!20418 (array!54402) Bool)

(assert (=> start!78452 (and (array_inv!20418 _values!1231) e!513358)))

(declare-fun array_inv!20419 (array!54400) Bool)

(assert (=> start!78452 (array_inv!20419 _keys!1487)))

(declare-fun b!914915 () Bool)

(declare-fun e!513360 () Bool)

(assert (=> b!914915 (= e!513358 (and e!513360 mapRes!30552))))

(declare-fun condMapEmpty!30552 () Bool)

(declare-fun mapDefault!30552 () ValueCell!9120)

(assert (=> b!914915 (= condMapEmpty!30552 (= (arr!26149 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9120)) mapDefault!30552)))))

(declare-fun b!914916 () Bool)

(declare-fun tp_is_empty!19203 () Bool)

(assert (=> b!914916 (= e!513359 tp_is_empty!19203)))

(declare-fun b!914917 () Bool)

(assert (=> b!914917 (= e!513361 (and (bvsle #b00000000000000000000000000000000 (size!26607 _keys!1487)) (bvsge (size!26607 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!914918 () Bool)

(assert (=> b!914918 (= e!513360 tp_is_empty!19203)))

(declare-fun b!914919 () Bool)

(declare-fun res!616930 () Bool)

(assert (=> b!914919 (=> (not res!616930) (not e!513361))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914919 (= res!616930 (and (= (size!26608 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26607 _keys!1487) (size!26608 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78452 res!616931) b!914919))

(assert (= (and b!914919 res!616930) b!914914))

(assert (= (and b!914914 res!616929) b!914917))

(assert (= (and b!914915 condMapEmpty!30552) mapIsEmpty!30552))

(assert (= (and b!914915 (not condMapEmpty!30552)) mapNonEmpty!30552))

(get-info :version)

(assert (= (and mapNonEmpty!30552 ((_ is ValueCellFull!9120) mapValue!30552)) b!914916))

(assert (= (and b!914915 ((_ is ValueCellFull!9120) mapDefault!30552)) b!914918))

(assert (= start!78452 b!914915))

(declare-fun m!849475 () Bool)

(assert (=> b!914914 m!849475))

(declare-fun m!849477 () Bool)

(assert (=> mapNonEmpty!30552 m!849477))

(declare-fun m!849479 () Bool)

(assert (=> start!78452 m!849479))

(declare-fun m!849481 () Bool)

(assert (=> start!78452 m!849481))

(declare-fun m!849483 () Bool)

(assert (=> start!78452 m!849483))

(check-sat (not b!914914) (not start!78452) (not mapNonEmpty!30552) tp_is_empty!19203)
(check-sat)
(get-model)

(declare-fun b!914946 () Bool)

(declare-fun e!513384 () Bool)

(declare-fun e!513385 () Bool)

(assert (=> b!914946 (= e!513384 e!513385)))

(declare-fun c!96045 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914946 (= c!96045 (validKeyInArray!0 (select (arr!26148 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!112715 () Bool)

(declare-fun res!616946 () Bool)

(assert (=> d!112715 (=> res!616946 e!513384)))

(assert (=> d!112715 (= res!616946 (bvsge #b00000000000000000000000000000000 (size!26607 _keys!1487)))))

(assert (=> d!112715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513384)))

(declare-fun b!914947 () Bool)

(declare-fun e!513386 () Bool)

(assert (=> b!914947 (= e!513385 e!513386)))

(declare-fun lt!411602 () (_ BitVec 64))

(assert (=> b!914947 (= lt!411602 (select (arr!26148 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30964 0))(
  ( (Unit!30965) )
))
(declare-fun lt!411601 () Unit!30964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54400 (_ BitVec 64) (_ BitVec 32)) Unit!30964)

(assert (=> b!914947 (= lt!411601 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411602 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914947 (arrayContainsKey!0 _keys!1487 lt!411602 #b00000000000000000000000000000000)))

(declare-fun lt!411603 () Unit!30964)

(assert (=> b!914947 (= lt!411603 lt!411601)))

(declare-fun res!616945 () Bool)

(declare-datatypes ((SeekEntryResult!8973 0))(
  ( (MissingZero!8973 (index!38263 (_ BitVec 32))) (Found!8973 (index!38264 (_ BitVec 32))) (Intermediate!8973 (undefined!9785 Bool) (index!38265 (_ BitVec 32)) (x!78268 (_ BitVec 32))) (Undefined!8973) (MissingVacant!8973 (index!38266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54400 (_ BitVec 32)) SeekEntryResult!8973)

(assert (=> b!914947 (= res!616945 (= (seekEntryOrOpen!0 (select (arr!26148 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8973 #b00000000000000000000000000000000)))))

(assert (=> b!914947 (=> (not res!616945) (not e!513386))))

(declare-fun b!914948 () Bool)

(declare-fun call!40543 () Bool)

(assert (=> b!914948 (= e!513385 call!40543)))

(declare-fun b!914949 () Bool)

(assert (=> b!914949 (= e!513386 call!40543)))

(declare-fun bm!40540 () Bool)

(assert (=> bm!40540 (= call!40543 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!112715 (not res!616946)) b!914946))

(assert (= (and b!914946 c!96045) b!914947))

(assert (= (and b!914946 (not c!96045)) b!914948))

(assert (= (and b!914947 res!616945) b!914949))

(assert (= (or b!914949 b!914948) bm!40540))

(declare-fun m!849495 () Bool)

(assert (=> b!914946 m!849495))

(assert (=> b!914946 m!849495))

(declare-fun m!849497 () Bool)

(assert (=> b!914946 m!849497))

(assert (=> b!914947 m!849495))

(declare-fun m!849499 () Bool)

(assert (=> b!914947 m!849499))

(declare-fun m!849501 () Bool)

(assert (=> b!914947 m!849501))

(assert (=> b!914947 m!849495))

(declare-fun m!849503 () Bool)

(assert (=> b!914947 m!849503))

(declare-fun m!849505 () Bool)

(assert (=> bm!40540 m!849505))

(assert (=> b!914914 d!112715))

(declare-fun d!112717 () Bool)

(assert (=> d!112717 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78452 d!112717))

(declare-fun d!112719 () Bool)

(assert (=> d!112719 (= (array_inv!20418 _values!1231) (bvsge (size!26608 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78452 d!112719))

(declare-fun d!112721 () Bool)

(assert (=> d!112721 (= (array_inv!20419 _keys!1487) (bvsge (size!26607 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78452 d!112721))

(declare-fun condMapEmpty!30558 () Bool)

(declare-fun mapDefault!30558 () ValueCell!9120)

(assert (=> mapNonEmpty!30552 (= condMapEmpty!30558 (= mapRest!30552 ((as const (Array (_ BitVec 32) ValueCell!9120)) mapDefault!30558)))))

(declare-fun e!513391 () Bool)

(declare-fun mapRes!30558 () Bool)

(assert (=> mapNonEmpty!30552 (= tp!58619 (and e!513391 mapRes!30558))))

(declare-fun mapNonEmpty!30558 () Bool)

(declare-fun tp!58625 () Bool)

(declare-fun e!513392 () Bool)

(assert (=> mapNonEmpty!30558 (= mapRes!30558 (and tp!58625 e!513392))))

(declare-fun mapKey!30558 () (_ BitVec 32))

(declare-fun mapValue!30558 () ValueCell!9120)

(declare-fun mapRest!30558 () (Array (_ BitVec 32) ValueCell!9120))

(assert (=> mapNonEmpty!30558 (= mapRest!30552 (store mapRest!30558 mapKey!30558 mapValue!30558))))

(declare-fun b!914957 () Bool)

(assert (=> b!914957 (= e!513391 tp_is_empty!19203)))

(declare-fun mapIsEmpty!30558 () Bool)

(assert (=> mapIsEmpty!30558 mapRes!30558))

(declare-fun b!914956 () Bool)

(assert (=> b!914956 (= e!513392 tp_is_empty!19203)))

(assert (= (and mapNonEmpty!30552 condMapEmpty!30558) mapIsEmpty!30558))

(assert (= (and mapNonEmpty!30552 (not condMapEmpty!30558)) mapNonEmpty!30558))

(assert (= (and mapNonEmpty!30558 ((_ is ValueCellFull!9120) mapValue!30558)) b!914956))

(assert (= (and mapNonEmpty!30552 ((_ is ValueCellFull!9120) mapDefault!30558)) b!914957))

(declare-fun m!849507 () Bool)

(assert (=> mapNonEmpty!30558 m!849507))

(check-sat (not b!914946) (not b!914947) (not mapNonEmpty!30558) (not bm!40540) tp_is_empty!19203)
(check-sat)
