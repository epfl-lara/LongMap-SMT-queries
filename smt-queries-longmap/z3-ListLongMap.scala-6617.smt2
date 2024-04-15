; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83626 () Bool)

(assert start!83626)

(declare-fun b!976821 () Bool)

(declare-fun e!550583 () Bool)

(declare-fun tp_is_empty!22477 () Bool)

(assert (=> b!976821 (= e!550583 tp_is_empty!22477)))

(declare-fun mapIsEmpty!35735 () Bool)

(declare-fun mapRes!35735 () Bool)

(assert (=> mapIsEmpty!35735 mapRes!35735))

(declare-fun b!976822 () Bool)

(declare-fun e!550581 () Bool)

(assert (=> b!976822 (= e!550581 tp_is_empty!22477)))

(declare-fun b!976823 () Bool)

(declare-fun e!550582 () Bool)

(declare-datatypes ((array!60916 0))(
  ( (array!60917 (arr!29319 (Array (_ BitVec 32) (_ BitVec 64))) (size!29800 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60916)

(assert (=> b!976823 (= e!550582 (and (bvsle #b00000000000000000000000000000000 (size!29800 _keys!1544)) (bvsge (size!29800 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!976824 () Bool)

(declare-fun res!653865 () Bool)

(assert (=> b!976824 (=> (not res!653865) (not e!550582))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60916 (_ BitVec 32)) Bool)

(assert (=> b!976824 (= res!653865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35735 () Bool)

(declare-fun tp!67988 () Bool)

(assert (=> mapNonEmpty!35735 (= mapRes!35735 (and tp!67988 e!550581))))

(declare-datatypes ((V!34953 0))(
  ( (V!34954 (val!11289 Int)) )
))
(declare-datatypes ((ValueCell!10757 0))(
  ( (ValueCellFull!10757 (v!13849 V!34953)) (EmptyCell!10757) )
))
(declare-fun mapValue!35735 () ValueCell!10757)

(declare-datatypes ((array!60918 0))(
  ( (array!60919 (arr!29320 (Array (_ BitVec 32) ValueCell!10757)) (size!29801 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60918)

(declare-fun mapRest!35735 () (Array (_ BitVec 32) ValueCell!10757))

(declare-fun mapKey!35735 () (_ BitVec 32))

(assert (=> mapNonEmpty!35735 (= (arr!29320 _values!1278) (store mapRest!35735 mapKey!35735 mapValue!35735))))

(declare-fun b!976826 () Bool)

(declare-fun e!550580 () Bool)

(assert (=> b!976826 (= e!550580 (and e!550583 mapRes!35735))))

(declare-fun condMapEmpty!35735 () Bool)

(declare-fun mapDefault!35735 () ValueCell!10757)

(assert (=> b!976826 (= condMapEmpty!35735 (= (arr!29320 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10757)) mapDefault!35735)))))

(declare-fun res!653866 () Bool)

(assert (=> start!83626 (=> (not res!653866) (not e!550582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83626 (= res!653866 (validMask!0 mask!1948))))

(assert (=> start!83626 e!550582))

(assert (=> start!83626 true))

(declare-fun array_inv!22709 (array!60918) Bool)

(assert (=> start!83626 (and (array_inv!22709 _values!1278) e!550580)))

(declare-fun array_inv!22710 (array!60916) Bool)

(assert (=> start!83626 (array_inv!22710 _keys!1544)))

(declare-fun b!976825 () Bool)

(declare-fun res!653864 () Bool)

(assert (=> b!976825 (=> (not res!653864) (not e!550582))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!976825 (= res!653864 (and (= (size!29801 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29800 _keys!1544) (size!29801 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!83626 res!653866) b!976825))

(assert (= (and b!976825 res!653864) b!976824))

(assert (= (and b!976824 res!653865) b!976823))

(assert (= (and b!976826 condMapEmpty!35735) mapIsEmpty!35735))

(assert (= (and b!976826 (not condMapEmpty!35735)) mapNonEmpty!35735))

(get-info :version)

(assert (= (and mapNonEmpty!35735 ((_ is ValueCellFull!10757) mapValue!35735)) b!976822))

(assert (= (and b!976826 ((_ is ValueCellFull!10757) mapDefault!35735)) b!976821))

(assert (= start!83626 b!976826))

(declare-fun m!903707 () Bool)

(assert (=> b!976824 m!903707))

(declare-fun m!903709 () Bool)

(assert (=> mapNonEmpty!35735 m!903709))

(declare-fun m!903711 () Bool)

(assert (=> start!83626 m!903711))

(declare-fun m!903713 () Bool)

(assert (=> start!83626 m!903713))

(declare-fun m!903715 () Bool)

(assert (=> start!83626 m!903715))

(check-sat (not b!976824) (not start!83626) (not mapNonEmpty!35735) tp_is_empty!22477)
(check-sat)
(get-model)

(declare-fun b!976871 () Bool)

(declare-fun e!550622 () Bool)

(declare-fun e!550621 () Bool)

(assert (=> b!976871 (= e!550622 e!550621)))

(declare-fun c!99951 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976871 (= c!99951 (validKeyInArray!0 (select (arr!29319 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!976872 () Bool)

(declare-fun call!41761 () Bool)

(assert (=> b!976872 (= e!550621 call!41761)))

(declare-fun d!116437 () Bool)

(declare-fun res!653890 () Bool)

(assert (=> d!116437 (=> res!653890 e!550622)))

(assert (=> d!116437 (= res!653890 (bvsge #b00000000000000000000000000000000 (size!29800 _keys!1544)))))

(assert (=> d!116437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!550622)))

(declare-fun b!976873 () Bool)

(declare-fun e!550623 () Bool)

(assert (=> b!976873 (= e!550623 call!41761)))

(declare-fun bm!41758 () Bool)

(assert (=> bm!41758 (= call!41761 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!976874 () Bool)

(assert (=> b!976874 (= e!550621 e!550623)))

(declare-fun lt!433190 () (_ BitVec 64))

(assert (=> b!976874 (= lt!433190 (select (arr!29319 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32358 0))(
  ( (Unit!32359) )
))
(declare-fun lt!433188 () Unit!32358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60916 (_ BitVec 64) (_ BitVec 32)) Unit!32358)

(assert (=> b!976874 (= lt!433188 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433190 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!976874 (arrayContainsKey!0 _keys!1544 lt!433190 #b00000000000000000000000000000000)))

(declare-fun lt!433189 () Unit!32358)

(assert (=> b!976874 (= lt!433189 lt!433188)))

(declare-fun res!653889 () Bool)

(declare-datatypes ((SeekEntryResult!9198 0))(
  ( (MissingZero!9198 (index!39163 (_ BitVec 32))) (Found!9198 (index!39164 (_ BitVec 32))) (Intermediate!9198 (undefined!10010 Bool) (index!39165 (_ BitVec 32)) (x!84534 (_ BitVec 32))) (Undefined!9198) (MissingVacant!9198 (index!39166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60916 (_ BitVec 32)) SeekEntryResult!9198)

(assert (=> b!976874 (= res!653889 (= (seekEntryOrOpen!0 (select (arr!29319 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9198 #b00000000000000000000000000000000)))))

(assert (=> b!976874 (=> (not res!653889) (not e!550623))))

(assert (= (and d!116437 (not res!653890)) b!976871))

(assert (= (and b!976871 c!99951) b!976874))

(assert (= (and b!976871 (not c!99951)) b!976872))

(assert (= (and b!976874 res!653889) b!976873))

(assert (= (or b!976873 b!976872) bm!41758))

(declare-fun m!903737 () Bool)

(assert (=> b!976871 m!903737))

(assert (=> b!976871 m!903737))

(declare-fun m!903739 () Bool)

(assert (=> b!976871 m!903739))

(declare-fun m!903741 () Bool)

(assert (=> bm!41758 m!903741))

(assert (=> b!976874 m!903737))

(declare-fun m!903743 () Bool)

(assert (=> b!976874 m!903743))

(declare-fun m!903745 () Bool)

(assert (=> b!976874 m!903745))

(assert (=> b!976874 m!903737))

(declare-fun m!903747 () Bool)

(assert (=> b!976874 m!903747))

(assert (=> b!976824 d!116437))

(declare-fun d!116439 () Bool)

(assert (=> d!116439 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83626 d!116439))

(declare-fun d!116441 () Bool)

(assert (=> d!116441 (= (array_inv!22709 _values!1278) (bvsge (size!29801 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83626 d!116441))

(declare-fun d!116443 () Bool)

(assert (=> d!116443 (= (array_inv!22710 _keys!1544) (bvsge (size!29800 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83626 d!116443))

(declare-fun b!976881 () Bool)

(declare-fun e!550629 () Bool)

(assert (=> b!976881 (= e!550629 tp_is_empty!22477)))

(declare-fun mapNonEmpty!35744 () Bool)

(declare-fun mapRes!35744 () Bool)

(declare-fun tp!67997 () Bool)

(assert (=> mapNonEmpty!35744 (= mapRes!35744 (and tp!67997 e!550629))))

(declare-fun mapKey!35744 () (_ BitVec 32))

(declare-fun mapRest!35744 () (Array (_ BitVec 32) ValueCell!10757))

(declare-fun mapValue!35744 () ValueCell!10757)

(assert (=> mapNonEmpty!35744 (= mapRest!35735 (store mapRest!35744 mapKey!35744 mapValue!35744))))

(declare-fun mapIsEmpty!35744 () Bool)

(assert (=> mapIsEmpty!35744 mapRes!35744))

(declare-fun b!976882 () Bool)

(declare-fun e!550628 () Bool)

(assert (=> b!976882 (= e!550628 tp_is_empty!22477)))

(declare-fun condMapEmpty!35744 () Bool)

(declare-fun mapDefault!35744 () ValueCell!10757)

(assert (=> mapNonEmpty!35735 (= condMapEmpty!35744 (= mapRest!35735 ((as const (Array (_ BitVec 32) ValueCell!10757)) mapDefault!35744)))))

(assert (=> mapNonEmpty!35735 (= tp!67988 (and e!550628 mapRes!35744))))

(assert (= (and mapNonEmpty!35735 condMapEmpty!35744) mapIsEmpty!35744))

(assert (= (and mapNonEmpty!35735 (not condMapEmpty!35744)) mapNonEmpty!35744))

(assert (= (and mapNonEmpty!35744 ((_ is ValueCellFull!10757) mapValue!35744)) b!976881))

(assert (= (and mapNonEmpty!35735 ((_ is ValueCellFull!10757) mapDefault!35744)) b!976882))

(declare-fun m!903749 () Bool)

(assert (=> mapNonEmpty!35744 m!903749))

(check-sat (not b!976874) (not b!976871) (not mapNonEmpty!35744) tp_is_empty!22477 (not bm!41758))
(check-sat)
