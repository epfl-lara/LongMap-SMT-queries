; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110624 () Bool)

(assert start!110624)

(declare-fun res!867750 () Bool)

(declare-fun e!746075 () Bool)

(assert (=> start!110624 (=> (not res!867750) (not e!746075))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110624 (= res!867750 (validMask!0 mask!2040))))

(assert (=> start!110624 e!746075))

(assert (=> start!110624 true))

(declare-datatypes ((V!51753 0))(
  ( (V!51754 (val!17568 Int)) )
))
(declare-datatypes ((ValueCell!16595 0))(
  ( (ValueCellFull!16595 (v!20189 V!51753)) (EmptyCell!16595) )
))
(declare-datatypes ((array!87043 0))(
  ( (array!87044 (arr!41999 (Array (_ BitVec 32) ValueCell!16595)) (size!42550 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87043)

(declare-fun e!746072 () Bool)

(declare-fun array_inv!32009 (array!87043) Bool)

(assert (=> start!110624 (and (array_inv!32009 _values!1354) e!746072)))

(declare-datatypes ((array!87045 0))(
  ( (array!87046 (arr!42000 (Array (_ BitVec 32) (_ BitVec 64))) (size!42551 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87045)

(declare-fun array_inv!32010 (array!87045) Bool)

(assert (=> start!110624 (array_inv!32010 _keys!1628)))

(declare-fun b!1307613 () Bool)

(declare-datatypes ((List!29832 0))(
  ( (Nil!29829) (Cons!29828 (h!31046 (_ BitVec 64)) (t!43430 List!29832)) )
))
(declare-fun noDuplicate!2072 (List!29832) Bool)

(assert (=> b!1307613 (= e!746075 (not (noDuplicate!2072 Nil!29829)))))

(declare-fun b!1307614 () Bool)

(declare-fun e!746076 () Bool)

(declare-fun mapRes!54103 () Bool)

(assert (=> b!1307614 (= e!746072 (and e!746076 mapRes!54103))))

(declare-fun condMapEmpty!54103 () Bool)

(declare-fun mapDefault!54103 () ValueCell!16595)

(assert (=> b!1307614 (= condMapEmpty!54103 (= (arr!41999 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16595)) mapDefault!54103)))))

(declare-fun b!1307615 () Bool)

(declare-fun res!867749 () Bool)

(assert (=> b!1307615 (=> (not res!867749) (not e!746075))))

(assert (=> b!1307615 (= res!867749 (and (bvsle #b00000000000000000000000000000000 (size!42551 _keys!1628)) (bvslt (size!42551 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun b!1307616 () Bool)

(declare-fun res!867747 () Bool)

(assert (=> b!1307616 (=> (not res!867747) (not e!746075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87045 (_ BitVec 32)) Bool)

(assert (=> b!1307616 (= res!867747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54103 () Bool)

(assert (=> mapIsEmpty!54103 mapRes!54103))

(declare-fun b!1307617 () Bool)

(declare-fun tp_is_empty!34987 () Bool)

(assert (=> b!1307617 (= e!746076 tp_is_empty!34987)))

(declare-fun mapNonEmpty!54103 () Bool)

(declare-fun tp!103183 () Bool)

(declare-fun e!746073 () Bool)

(assert (=> mapNonEmpty!54103 (= mapRes!54103 (and tp!103183 e!746073))))

(declare-fun mapKey!54103 () (_ BitVec 32))

(declare-fun mapRest!54103 () (Array (_ BitVec 32) ValueCell!16595))

(declare-fun mapValue!54103 () ValueCell!16595)

(assert (=> mapNonEmpty!54103 (= (arr!41999 _values!1354) (store mapRest!54103 mapKey!54103 mapValue!54103))))

(declare-fun b!1307618 () Bool)

(declare-fun res!867748 () Bool)

(assert (=> b!1307618 (=> (not res!867748) (not e!746075))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307618 (= res!867748 (and (= (size!42550 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42551 _keys!1628) (size!42550 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307619 () Bool)

(assert (=> b!1307619 (= e!746073 tp_is_empty!34987)))

(assert (= (and start!110624 res!867750) b!1307618))

(assert (= (and b!1307618 res!867748) b!1307616))

(assert (= (and b!1307616 res!867747) b!1307615))

(assert (= (and b!1307615 res!867749) b!1307613))

(assert (= (and b!1307614 condMapEmpty!54103) mapIsEmpty!54103))

(assert (= (and b!1307614 (not condMapEmpty!54103)) mapNonEmpty!54103))

(get-info :version)

(assert (= (and mapNonEmpty!54103 ((_ is ValueCellFull!16595) mapValue!54103)) b!1307619))

(assert (= (and b!1307614 ((_ is ValueCellFull!16595) mapDefault!54103)) b!1307617))

(assert (= start!110624 b!1307614))

(declare-fun m!1198993 () Bool)

(assert (=> start!110624 m!1198993))

(declare-fun m!1198995 () Bool)

(assert (=> start!110624 m!1198995))

(declare-fun m!1198997 () Bool)

(assert (=> start!110624 m!1198997))

(declare-fun m!1198999 () Bool)

(assert (=> b!1307613 m!1198999))

(declare-fun m!1199001 () Bool)

(assert (=> b!1307616 m!1199001))

(declare-fun m!1199003 () Bool)

(assert (=> mapNonEmpty!54103 m!1199003))

(check-sat (not b!1307613) tp_is_empty!34987 (not mapNonEmpty!54103) (not b!1307616) (not start!110624))
(check-sat)
(get-model)

(declare-fun b!1307670 () Bool)

(declare-fun e!746114 () Bool)

(declare-fun e!746113 () Bool)

(assert (=> b!1307670 (= e!746114 e!746113)))

(declare-fun c!125942 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307670 (= c!125942 (validKeyInArray!0 (select (arr!42000 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun d!142687 () Bool)

(declare-fun res!867779 () Bool)

(assert (=> d!142687 (=> res!867779 e!746114)))

(assert (=> d!142687 (= res!867779 (bvsge #b00000000000000000000000000000000 (size!42551 _keys!1628)))))

(assert (=> d!142687 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!746114)))

(declare-fun b!1307671 () Bool)

(declare-fun e!746115 () Bool)

(declare-fun call!64694 () Bool)

(assert (=> b!1307671 (= e!746115 call!64694)))

(declare-fun bm!64691 () Bool)

(assert (=> bm!64691 (= call!64694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1307672 () Bool)

(assert (=> b!1307672 (= e!746113 e!746115)))

(declare-fun lt!585390 () (_ BitVec 64))

(assert (=> b!1307672 (= lt!585390 (select (arr!42000 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43237 0))(
  ( (Unit!43238) )
))
(declare-fun lt!585389 () Unit!43237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!87045 (_ BitVec 64) (_ BitVec 32)) Unit!43237)

(assert (=> b!1307672 (= lt!585389 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!585390 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!87045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1307672 (arrayContainsKey!0 _keys!1628 lt!585390 #b00000000000000000000000000000000)))

(declare-fun lt!585391 () Unit!43237)

(assert (=> b!1307672 (= lt!585391 lt!585389)))

(declare-fun res!867780 () Bool)

(declare-datatypes ((SeekEntryResult!9989 0))(
  ( (MissingZero!9989 (index!42327 (_ BitVec 32))) (Found!9989 (index!42328 (_ BitVec 32))) (Intermediate!9989 (undefined!10801 Bool) (index!42329 (_ BitVec 32)) (x!115997 (_ BitVec 32))) (Undefined!9989) (MissingVacant!9989 (index!42330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!87045 (_ BitVec 32)) SeekEntryResult!9989)

(assert (=> b!1307672 (= res!867780 (= (seekEntryOrOpen!0 (select (arr!42000 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!9989 #b00000000000000000000000000000000)))))

(assert (=> b!1307672 (=> (not res!867780) (not e!746115))))

(declare-fun b!1307673 () Bool)

(assert (=> b!1307673 (= e!746113 call!64694)))

(assert (= (and d!142687 (not res!867779)) b!1307670))

(assert (= (and b!1307670 c!125942) b!1307672))

(assert (= (and b!1307670 (not c!125942)) b!1307673))

(assert (= (and b!1307672 res!867780) b!1307671))

(assert (= (or b!1307671 b!1307673) bm!64691))

(declare-fun m!1199029 () Bool)

(assert (=> b!1307670 m!1199029))

(assert (=> b!1307670 m!1199029))

(declare-fun m!1199031 () Bool)

(assert (=> b!1307670 m!1199031))

(declare-fun m!1199033 () Bool)

(assert (=> bm!64691 m!1199033))

(assert (=> b!1307672 m!1199029))

(declare-fun m!1199035 () Bool)

(assert (=> b!1307672 m!1199035))

(declare-fun m!1199037 () Bool)

(assert (=> b!1307672 m!1199037))

(assert (=> b!1307672 m!1199029))

(declare-fun m!1199039 () Bool)

(assert (=> b!1307672 m!1199039))

(assert (=> b!1307616 d!142687))

(declare-fun d!142689 () Bool)

(declare-fun res!867785 () Bool)

(declare-fun e!746120 () Bool)

(assert (=> d!142689 (=> res!867785 e!746120)))

(assert (=> d!142689 (= res!867785 ((_ is Nil!29829) Nil!29829))))

(assert (=> d!142689 (= (noDuplicate!2072 Nil!29829) e!746120)))

(declare-fun b!1307678 () Bool)

(declare-fun e!746121 () Bool)

(assert (=> b!1307678 (= e!746120 e!746121)))

(declare-fun res!867786 () Bool)

(assert (=> b!1307678 (=> (not res!867786) (not e!746121))))

(declare-fun contains!8352 (List!29832 (_ BitVec 64)) Bool)

(assert (=> b!1307678 (= res!867786 (not (contains!8352 (t!43430 Nil!29829) (h!31046 Nil!29829))))))

(declare-fun b!1307679 () Bool)

(assert (=> b!1307679 (= e!746121 (noDuplicate!2072 (t!43430 Nil!29829)))))

(assert (= (and d!142689 (not res!867785)) b!1307678))

(assert (= (and b!1307678 res!867786) b!1307679))

(declare-fun m!1199041 () Bool)

(assert (=> b!1307678 m!1199041))

(declare-fun m!1199043 () Bool)

(assert (=> b!1307679 m!1199043))

(assert (=> b!1307613 d!142689))

(declare-fun d!142691 () Bool)

(assert (=> d!142691 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110624 d!142691))

(declare-fun d!142693 () Bool)

(assert (=> d!142693 (= (array_inv!32009 _values!1354) (bvsge (size!42550 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110624 d!142693))

(declare-fun d!142695 () Bool)

(assert (=> d!142695 (= (array_inv!32010 _keys!1628) (bvsge (size!42551 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110624 d!142695))

(declare-fun condMapEmpty!54112 () Bool)

(declare-fun mapDefault!54112 () ValueCell!16595)

(assert (=> mapNonEmpty!54103 (= condMapEmpty!54112 (= mapRest!54103 ((as const (Array (_ BitVec 32) ValueCell!16595)) mapDefault!54112)))))

(declare-fun e!746127 () Bool)

(declare-fun mapRes!54112 () Bool)

(assert (=> mapNonEmpty!54103 (= tp!103183 (and e!746127 mapRes!54112))))

(declare-fun mapIsEmpty!54112 () Bool)

(assert (=> mapIsEmpty!54112 mapRes!54112))

(declare-fun b!1307686 () Bool)

(declare-fun e!746126 () Bool)

(assert (=> b!1307686 (= e!746126 tp_is_empty!34987)))

(declare-fun mapNonEmpty!54112 () Bool)

(declare-fun tp!103192 () Bool)

(assert (=> mapNonEmpty!54112 (= mapRes!54112 (and tp!103192 e!746126))))

(declare-fun mapRest!54112 () (Array (_ BitVec 32) ValueCell!16595))

(declare-fun mapValue!54112 () ValueCell!16595)

(declare-fun mapKey!54112 () (_ BitVec 32))

(assert (=> mapNonEmpty!54112 (= mapRest!54103 (store mapRest!54112 mapKey!54112 mapValue!54112))))

(declare-fun b!1307687 () Bool)

(assert (=> b!1307687 (= e!746127 tp_is_empty!34987)))

(assert (= (and mapNonEmpty!54103 condMapEmpty!54112) mapIsEmpty!54112))

(assert (= (and mapNonEmpty!54103 (not condMapEmpty!54112)) mapNonEmpty!54112))

(assert (= (and mapNonEmpty!54112 ((_ is ValueCellFull!16595) mapValue!54112)) b!1307686))

(assert (= (and mapNonEmpty!54103 ((_ is ValueCellFull!16595) mapDefault!54112)) b!1307687))

(declare-fun m!1199045 () Bool)

(assert (=> mapNonEmpty!54112 m!1199045))

(check-sat (not mapNonEmpty!54112) (not b!1307678) (not b!1307672) tp_is_empty!34987 (not bm!64691) (not b!1307679) (not b!1307670))
(check-sat)
