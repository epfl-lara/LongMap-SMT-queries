; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110610 () Bool)

(assert start!110610)

(declare-fun b!1307537 () Bool)

(declare-fun e!746016 () Bool)

(declare-fun e!746012 () Bool)

(declare-fun mapRes!54091 () Bool)

(assert (=> b!1307537 (= e!746016 (and e!746012 mapRes!54091))))

(declare-fun condMapEmpty!54091 () Bool)

(declare-datatypes ((V!51745 0))(
  ( (V!51746 (val!17565 Int)) )
))
(declare-datatypes ((ValueCell!16592 0))(
  ( (ValueCellFull!16592 (v!20186 V!51745)) (EmptyCell!16592) )
))
(declare-datatypes ((array!87031 0))(
  ( (array!87032 (arr!41994 (Array (_ BitVec 32) ValueCell!16592)) (size!42545 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87031)

(declare-fun mapDefault!54091 () ValueCell!16592)

(assert (=> b!1307537 (= condMapEmpty!54091 (= (arr!41994 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16592)) mapDefault!54091)))))

(declare-fun b!1307538 () Bool)

(declare-fun e!746014 () Bool)

(declare-datatypes ((array!87033 0))(
  ( (array!87034 (arr!41995 (Array (_ BitVec 32) (_ BitVec 64))) (size!42546 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87033)

(assert (=> b!1307538 (= e!746014 (and (bvsle #b00000000000000000000000000000000 (size!42546 _keys!1628)) (bvsge (size!42546 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!54091 () Bool)

(declare-fun tp!103171 () Bool)

(declare-fun e!746015 () Bool)

(assert (=> mapNonEmpty!54091 (= mapRes!54091 (and tp!103171 e!746015))))

(declare-fun mapValue!54091 () ValueCell!16592)

(declare-fun mapRest!54091 () (Array (_ BitVec 32) ValueCell!16592))

(declare-fun mapKey!54091 () (_ BitVec 32))

(assert (=> mapNonEmpty!54091 (= (arr!41994 _values!1354) (store mapRest!54091 mapKey!54091 mapValue!54091))))

(declare-fun b!1307539 () Bool)

(declare-fun tp_is_empty!34981 () Bool)

(assert (=> b!1307539 (= e!746015 tp_is_empty!34981)))

(declare-fun res!867714 () Bool)

(assert (=> start!110610 (=> (not res!867714) (not e!746014))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110610 (= res!867714 (validMask!0 mask!2040))))

(assert (=> start!110610 e!746014))

(assert (=> start!110610 true))

(declare-fun array_inv!32005 (array!87031) Bool)

(assert (=> start!110610 (and (array_inv!32005 _values!1354) e!746016)))

(declare-fun array_inv!32006 (array!87033) Bool)

(assert (=> start!110610 (array_inv!32006 _keys!1628)))

(declare-fun mapIsEmpty!54091 () Bool)

(assert (=> mapIsEmpty!54091 mapRes!54091))

(declare-fun b!1307540 () Bool)

(assert (=> b!1307540 (= e!746012 tp_is_empty!34981)))

(declare-fun b!1307541 () Bool)

(declare-fun res!867713 () Bool)

(assert (=> b!1307541 (=> (not res!867713) (not e!746014))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307541 (= res!867713 (and (= (size!42545 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42546 _keys!1628) (size!42545 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307542 () Bool)

(declare-fun res!867712 () Bool)

(assert (=> b!1307542 (=> (not res!867712) (not e!746014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87033 (_ BitVec 32)) Bool)

(assert (=> b!1307542 (= res!867712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110610 res!867714) b!1307541))

(assert (= (and b!1307541 res!867713) b!1307542))

(assert (= (and b!1307542 res!867712) b!1307538))

(assert (= (and b!1307537 condMapEmpty!54091) mapIsEmpty!54091))

(assert (= (and b!1307537 (not condMapEmpty!54091)) mapNonEmpty!54091))

(get-info :version)

(assert (= (and mapNonEmpty!54091 ((_ is ValueCellFull!16592) mapValue!54091)) b!1307539))

(assert (= (and b!1307537 ((_ is ValueCellFull!16592) mapDefault!54091)) b!1307540))

(assert (= start!110610 b!1307537))

(declare-fun m!1198949 () Bool)

(assert (=> mapNonEmpty!54091 m!1198949))

(declare-fun m!1198951 () Bool)

(assert (=> start!110610 m!1198951))

(declare-fun m!1198953 () Bool)

(assert (=> start!110610 m!1198953))

(declare-fun m!1198955 () Bool)

(assert (=> start!110610 m!1198955))

(declare-fun m!1198957 () Bool)

(assert (=> b!1307542 m!1198957))

(check-sat (not b!1307542) (not start!110610) (not mapNonEmpty!54091) tp_is_empty!34981)
(check-sat)
(get-model)

(declare-fun b!1307587 () Bool)

(declare-fun e!746055 () Bool)

(declare-fun e!746054 () Bool)

(assert (=> b!1307587 (= e!746055 e!746054)))

(declare-fun lt!585381 () (_ BitVec 64))

(assert (=> b!1307587 (= lt!585381 (select (arr!41995 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43235 0))(
  ( (Unit!43236) )
))
(declare-fun lt!585380 () Unit!43235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!87033 (_ BitVec 64) (_ BitVec 32)) Unit!43235)

(assert (=> b!1307587 (= lt!585380 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!585381 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!87033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1307587 (arrayContainsKey!0 _keys!1628 lt!585381 #b00000000000000000000000000000000)))

(declare-fun lt!585382 () Unit!43235)

(assert (=> b!1307587 (= lt!585382 lt!585380)))

(declare-fun res!867737 () Bool)

(declare-datatypes ((SeekEntryResult!9988 0))(
  ( (MissingZero!9988 (index!42323 (_ BitVec 32))) (Found!9988 (index!42324 (_ BitVec 32))) (Intermediate!9988 (undefined!10800 Bool) (index!42325 (_ BitVec 32)) (x!115986 (_ BitVec 32))) (Undefined!9988) (MissingVacant!9988 (index!42326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!87033 (_ BitVec 32)) SeekEntryResult!9988)

(assert (=> b!1307587 (= res!867737 (= (seekEntryOrOpen!0 (select (arr!41995 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!9988 #b00000000000000000000000000000000)))))

(assert (=> b!1307587 (=> (not res!867737) (not e!746054))))

(declare-fun b!1307588 () Bool)

(declare-fun call!64691 () Bool)

(assert (=> b!1307588 (= e!746055 call!64691)))

(declare-fun bm!64688 () Bool)

(assert (=> bm!64688 (= call!64691 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1307589 () Bool)

(assert (=> b!1307589 (= e!746054 call!64691)))

(declare-fun b!1307590 () Bool)

(declare-fun e!746053 () Bool)

(assert (=> b!1307590 (= e!746053 e!746055)))

(declare-fun c!125939 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307590 (= c!125939 (validKeyInArray!0 (select (arr!41995 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun d!142677 () Bool)

(declare-fun res!867738 () Bool)

(assert (=> d!142677 (=> res!867738 e!746053)))

(assert (=> d!142677 (= res!867738 (bvsge #b00000000000000000000000000000000 (size!42546 _keys!1628)))))

(assert (=> d!142677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!746053)))

(assert (= (and d!142677 (not res!867738)) b!1307590))

(assert (= (and b!1307590 c!125939) b!1307587))

(assert (= (and b!1307590 (not c!125939)) b!1307588))

(assert (= (and b!1307587 res!867737) b!1307589))

(assert (= (or b!1307589 b!1307588) bm!64688))

(declare-fun m!1198979 () Bool)

(assert (=> b!1307587 m!1198979))

(declare-fun m!1198981 () Bool)

(assert (=> b!1307587 m!1198981))

(declare-fun m!1198983 () Bool)

(assert (=> b!1307587 m!1198983))

(assert (=> b!1307587 m!1198979))

(declare-fun m!1198985 () Bool)

(assert (=> b!1307587 m!1198985))

(declare-fun m!1198987 () Bool)

(assert (=> bm!64688 m!1198987))

(assert (=> b!1307590 m!1198979))

(assert (=> b!1307590 m!1198979))

(declare-fun m!1198989 () Bool)

(assert (=> b!1307590 m!1198989))

(assert (=> b!1307542 d!142677))

(declare-fun d!142679 () Bool)

(assert (=> d!142679 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110610 d!142679))

(declare-fun d!142681 () Bool)

(assert (=> d!142681 (= (array_inv!32005 _values!1354) (bvsge (size!42545 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110610 d!142681))

(declare-fun d!142683 () Bool)

(assert (=> d!142683 (= (array_inv!32006 _keys!1628) (bvsge (size!42546 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110610 d!142683))

(declare-fun b!1307598 () Bool)

(declare-fun e!746061 () Bool)

(assert (=> b!1307598 (= e!746061 tp_is_empty!34981)))

(declare-fun mapNonEmpty!54100 () Bool)

(declare-fun mapRes!54100 () Bool)

(declare-fun tp!103180 () Bool)

(declare-fun e!746060 () Bool)

(assert (=> mapNonEmpty!54100 (= mapRes!54100 (and tp!103180 e!746060))))

(declare-fun mapValue!54100 () ValueCell!16592)

(declare-fun mapRest!54100 () (Array (_ BitVec 32) ValueCell!16592))

(declare-fun mapKey!54100 () (_ BitVec 32))

(assert (=> mapNonEmpty!54100 (= mapRest!54091 (store mapRest!54100 mapKey!54100 mapValue!54100))))

(declare-fun condMapEmpty!54100 () Bool)

(declare-fun mapDefault!54100 () ValueCell!16592)

(assert (=> mapNonEmpty!54091 (= condMapEmpty!54100 (= mapRest!54091 ((as const (Array (_ BitVec 32) ValueCell!16592)) mapDefault!54100)))))

(assert (=> mapNonEmpty!54091 (= tp!103171 (and e!746061 mapRes!54100))))

(declare-fun mapIsEmpty!54100 () Bool)

(assert (=> mapIsEmpty!54100 mapRes!54100))

(declare-fun b!1307597 () Bool)

(assert (=> b!1307597 (= e!746060 tp_is_empty!34981)))

(assert (= (and mapNonEmpty!54091 condMapEmpty!54100) mapIsEmpty!54100))

(assert (= (and mapNonEmpty!54091 (not condMapEmpty!54100)) mapNonEmpty!54100))

(assert (= (and mapNonEmpty!54100 ((_ is ValueCellFull!16592) mapValue!54100)) b!1307597))

(assert (= (and mapNonEmpty!54091 ((_ is ValueCellFull!16592) mapDefault!54100)) b!1307598))

(declare-fun m!1198991 () Bool)

(assert (=> mapNonEmpty!54100 m!1198991))

(check-sat (not mapNonEmpty!54100) (not bm!64688) (not b!1307587) tp_is_empty!34981 (not b!1307590))
(check-sat)
