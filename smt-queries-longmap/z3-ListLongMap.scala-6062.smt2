; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78432 () Bool)

(assert start!78432)

(declare-fun mapIsEmpty!30549 () Bool)

(declare-fun mapRes!30549 () Bool)

(assert (=> mapIsEmpty!30549 mapRes!30549))

(declare-fun res!616810 () Bool)

(declare-fun e!513196 () Bool)

(assert (=> start!78432 (=> (not res!616810) (not e!513196))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78432 (= res!616810 (validMask!0 mask!1881))))

(assert (=> start!78432 e!513196))

(assert (=> start!78432 true))

(declare-datatypes ((V!30567 0))(
  ( (V!30568 (val!9651 Int)) )
))
(declare-datatypes ((ValueCell!9119 0))(
  ( (ValueCellFull!9119 (v!12167 V!30567)) (EmptyCell!9119) )
))
(declare-datatypes ((array!54399 0))(
  ( (array!54400 (arr!26148 (Array (_ BitVec 32) ValueCell!9119)) (size!26609 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54399)

(declare-fun e!513199 () Bool)

(declare-fun array_inv!20500 (array!54399) Bool)

(assert (=> start!78432 (and (array_inv!20500 _values!1231) e!513199)))

(declare-datatypes ((array!54401 0))(
  ( (array!54402 (arr!26149 (Array (_ BitVec 32) (_ BitVec 64))) (size!26610 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54401)

(declare-fun array_inv!20501 (array!54401) Bool)

(assert (=> start!78432 (array_inv!20501 _keys!1487)))

(declare-fun b!914657 () Bool)

(declare-fun e!513198 () Bool)

(declare-fun tp_is_empty!19201 () Bool)

(assert (=> b!914657 (= e!513198 tp_is_empty!19201)))

(declare-fun b!914658 () Bool)

(declare-fun e!513195 () Bool)

(assert (=> b!914658 (= e!513199 (and e!513195 mapRes!30549))))

(declare-fun condMapEmpty!30549 () Bool)

(declare-fun mapDefault!30549 () ValueCell!9119)

(assert (=> b!914658 (= condMapEmpty!30549 (= (arr!26148 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9119)) mapDefault!30549)))))

(declare-fun mapNonEmpty!30549 () Bool)

(declare-fun tp!58617 () Bool)

(assert (=> mapNonEmpty!30549 (= mapRes!30549 (and tp!58617 e!513198))))

(declare-fun mapValue!30549 () ValueCell!9119)

(declare-fun mapRest!30549 () (Array (_ BitVec 32) ValueCell!9119))

(declare-fun mapKey!30549 () (_ BitVec 32))

(assert (=> mapNonEmpty!30549 (= (arr!26148 _values!1231) (store mapRest!30549 mapKey!30549 mapValue!30549))))

(declare-fun b!914659 () Bool)

(declare-fun res!616811 () Bool)

(assert (=> b!914659 (=> (not res!616811) (not e!513196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54401 (_ BitVec 32)) Bool)

(assert (=> b!914659 (= res!616811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!914660 () Bool)

(assert (=> b!914660 (= e!513196 (and (bvsle #b00000000000000000000000000000000 (size!26610 _keys!1487)) (bvsge (size!26610 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!914661 () Bool)

(declare-fun res!616812 () Bool)

(assert (=> b!914661 (=> (not res!616812) (not e!513196))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914661 (= res!616812 (and (= (size!26609 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26610 _keys!1487) (size!26609 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!914662 () Bool)

(assert (=> b!914662 (= e!513195 tp_is_empty!19201)))

(assert (= (and start!78432 res!616810) b!914661))

(assert (= (and b!914661 res!616812) b!914659))

(assert (= (and b!914659 res!616811) b!914660))

(assert (= (and b!914658 condMapEmpty!30549) mapIsEmpty!30549))

(assert (= (and b!914658 (not condMapEmpty!30549)) mapNonEmpty!30549))

(get-info :version)

(assert (= (and mapNonEmpty!30549 ((_ is ValueCellFull!9119) mapValue!30549)) b!914657))

(assert (= (and b!914658 ((_ is ValueCellFull!9119) mapDefault!30549)) b!914662))

(assert (= start!78432 b!914658))

(declare-fun m!848707 () Bool)

(assert (=> start!78432 m!848707))

(declare-fun m!848709 () Bool)

(assert (=> start!78432 m!848709))

(declare-fun m!848711 () Bool)

(assert (=> start!78432 m!848711))

(declare-fun m!848713 () Bool)

(assert (=> mapNonEmpty!30549 m!848713))

(declare-fun m!848715 () Bool)

(assert (=> b!914659 m!848715))

(check-sat (not start!78432) (not b!914659) (not mapNonEmpty!30549) tp_is_empty!19201)
(check-sat)
(get-model)

(declare-fun d!112517 () Bool)

(assert (=> d!112517 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78432 d!112517))

(declare-fun d!112519 () Bool)

(assert (=> d!112519 (= (array_inv!20500 _values!1231) (bvsge (size!26609 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78432 d!112519))

(declare-fun d!112521 () Bool)

(assert (=> d!112521 (= (array_inv!20501 _keys!1487) (bvsge (size!26610 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78432 d!112521))

(declare-fun b!914707 () Bool)

(declare-fun e!513238 () Bool)

(declare-fun e!513237 () Bool)

(assert (=> b!914707 (= e!513238 e!513237)))

(declare-fun lt!411365 () (_ BitVec 64))

(assert (=> b!914707 (= lt!411365 (select (arr!26149 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30880 0))(
  ( (Unit!30881) )
))
(declare-fun lt!411366 () Unit!30880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54401 (_ BitVec 64) (_ BitVec 32)) Unit!30880)

(assert (=> b!914707 (= lt!411366 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411365 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914707 (arrayContainsKey!0 _keys!1487 lt!411365 #b00000000000000000000000000000000)))

(declare-fun lt!411367 () Unit!30880)

(assert (=> b!914707 (= lt!411367 lt!411366)))

(declare-fun res!616835 () Bool)

(declare-datatypes ((SeekEntryResult!8973 0))(
  ( (MissingZero!8973 (index!38263 (_ BitVec 32))) (Found!8973 (index!38264 (_ BitVec 32))) (Intermediate!8973 (undefined!9785 Bool) (index!38265 (_ BitVec 32)) (x!78263 (_ BitVec 32))) (Undefined!8973) (MissingVacant!8973 (index!38266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54401 (_ BitVec 32)) SeekEntryResult!8973)

(assert (=> b!914707 (= res!616835 (= (seekEntryOrOpen!0 (select (arr!26149 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8973 #b00000000000000000000000000000000)))))

(assert (=> b!914707 (=> (not res!616835) (not e!513237))))

(declare-fun b!914708 () Bool)

(declare-fun call!40517 () Bool)

(assert (=> b!914708 (= e!513238 call!40517)))

(declare-fun d!112523 () Bool)

(declare-fun res!616836 () Bool)

(declare-fun e!513236 () Bool)

(assert (=> d!112523 (=> res!616836 e!513236)))

(assert (=> d!112523 (= res!616836 (bvsge #b00000000000000000000000000000000 (size!26610 _keys!1487)))))

(assert (=> d!112523 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513236)))

(declare-fun b!914709 () Bool)

(assert (=> b!914709 (= e!513236 e!513238)))

(declare-fun c!95980 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914709 (= c!95980 (validKeyInArray!0 (select (arr!26149 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!914710 () Bool)

(assert (=> b!914710 (= e!513237 call!40517)))

(declare-fun bm!40514 () Bool)

(assert (=> bm!40514 (= call!40517 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!112523 (not res!616836)) b!914709))

(assert (= (and b!914709 c!95980) b!914707))

(assert (= (and b!914709 (not c!95980)) b!914708))

(assert (= (and b!914707 res!616835) b!914710))

(assert (= (or b!914710 b!914708) bm!40514))

(declare-fun m!848737 () Bool)

(assert (=> b!914707 m!848737))

(declare-fun m!848739 () Bool)

(assert (=> b!914707 m!848739))

(declare-fun m!848741 () Bool)

(assert (=> b!914707 m!848741))

(assert (=> b!914707 m!848737))

(declare-fun m!848743 () Bool)

(assert (=> b!914707 m!848743))

(assert (=> b!914709 m!848737))

(assert (=> b!914709 m!848737))

(declare-fun m!848745 () Bool)

(assert (=> b!914709 m!848745))

(declare-fun m!848747 () Bool)

(assert (=> bm!40514 m!848747))

(assert (=> b!914659 d!112523))

(declare-fun condMapEmpty!30558 () Bool)

(declare-fun mapDefault!30558 () ValueCell!9119)

(assert (=> mapNonEmpty!30549 (= condMapEmpty!30558 (= mapRest!30549 ((as const (Array (_ BitVec 32) ValueCell!9119)) mapDefault!30558)))))

(declare-fun e!513243 () Bool)

(declare-fun mapRes!30558 () Bool)

(assert (=> mapNonEmpty!30549 (= tp!58617 (and e!513243 mapRes!30558))))

(declare-fun b!914717 () Bool)

(declare-fun e!513244 () Bool)

(assert (=> b!914717 (= e!513244 tp_is_empty!19201)))

(declare-fun mapIsEmpty!30558 () Bool)

(assert (=> mapIsEmpty!30558 mapRes!30558))

(declare-fun mapNonEmpty!30558 () Bool)

(declare-fun tp!58626 () Bool)

(assert (=> mapNonEmpty!30558 (= mapRes!30558 (and tp!58626 e!513244))))

(declare-fun mapRest!30558 () (Array (_ BitVec 32) ValueCell!9119))

(declare-fun mapValue!30558 () ValueCell!9119)

(declare-fun mapKey!30558 () (_ BitVec 32))

(assert (=> mapNonEmpty!30558 (= mapRest!30549 (store mapRest!30558 mapKey!30558 mapValue!30558))))

(declare-fun b!914718 () Bool)

(assert (=> b!914718 (= e!513243 tp_is_empty!19201)))

(assert (= (and mapNonEmpty!30549 condMapEmpty!30558) mapIsEmpty!30558))

(assert (= (and mapNonEmpty!30549 (not condMapEmpty!30558)) mapNonEmpty!30558))

(assert (= (and mapNonEmpty!30558 ((_ is ValueCellFull!9119) mapValue!30558)) b!914717))

(assert (= (and mapNonEmpty!30549 ((_ is ValueCellFull!9119) mapDefault!30558)) b!914718))

(declare-fun m!848749 () Bool)

(assert (=> mapNonEmpty!30558 m!848749))

(check-sat (not mapNonEmpty!30558) tp_is_empty!19201 (not b!914709) (not bm!40514) (not b!914707))
(check-sat)
