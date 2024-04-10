; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39354 () Bool)

(assert start!39354)

(declare-fun b_free!9621 () Bool)

(declare-fun b_next!9621 () Bool)

(assert (=> start!39354 (= b_free!9621 (not b_next!9621))))

(declare-fun tp!34391 () Bool)

(declare-fun b_and!17117 () Bool)

(assert (=> start!39354 (= tp!34391 b_and!17117)))

(declare-fun b!417607 () Bool)

(declare-fun res!243224 () Bool)

(declare-fun e!249136 () Bool)

(assert (=> b!417607 (=> (not res!243224) (not e!249136))))

(declare-datatypes ((array!25397 0))(
  ( (array!25398 (arr!12148 (Array (_ BitVec 32) (_ BitVec 64))) (size!12500 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25397)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25397 (_ BitVec 32)) Bool)

(assert (=> b!417607 (= res!243224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417608 () Bool)

(declare-fun res!243234 () Bool)

(assert (=> b!417608 (=> (not res!243234) (not e!249136))))

(declare-datatypes ((List!7109 0))(
  ( (Nil!7106) (Cons!7105 (h!7961 (_ BitVec 64)) (t!12395 List!7109)) )
))
(declare-fun arrayNoDuplicates!0 (array!25397 (_ BitVec 32) List!7109) Bool)

(assert (=> b!417608 (= res!243234 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7106))))

(declare-fun b!417609 () Bool)

(declare-fun res!243235 () Bool)

(declare-fun e!249141 () Bool)

(assert (=> b!417609 (=> (not res!243235) (not e!249141))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417609 (= res!243235 (bvsle from!863 i!563))))

(declare-fun b!417610 () Bool)

(declare-fun e!249134 () Bool)

(declare-fun e!249137 () Bool)

(assert (=> b!417610 (= e!249134 (not e!249137))))

(declare-fun res!243231 () Bool)

(assert (=> b!417610 (=> res!243231 e!249137)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417610 (= res!243231 (validKeyInArray!0 (select (arr!12148 _keys!709) from!863)))))

(declare-fun e!249135 () Bool)

(assert (=> b!417610 e!249135))

(declare-fun c!55145 () Bool)

(assert (=> b!417610 (= c!55145 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15469 0))(
  ( (V!15470 (val!5431 Int)) )
))
(declare-fun minValue!515 () V!15469)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5043 0))(
  ( (ValueCellFull!5043 (v!7678 V!15469)) (EmptyCell!5043) )
))
(declare-datatypes ((array!25399 0))(
  ( (array!25400 (arr!12149 (Array (_ BitVec 32) ValueCell!5043)) (size!12501 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25399)

(declare-datatypes ((Unit!12340 0))(
  ( (Unit!12341) )
))
(declare-fun lt!191322 () Unit!12340)

(declare-fun zeroValue!515 () V!15469)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15469)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!426 (array!25397 array!25399 (_ BitVec 32) (_ BitVec 32) V!15469 V!15469 (_ BitVec 32) (_ BitVec 64) V!15469 (_ BitVec 32) Int) Unit!12340)

(assert (=> b!417610 (= lt!191322 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!426 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417611 () Bool)

(declare-fun e!249138 () Bool)

(declare-fun tp_is_empty!10773 () Bool)

(assert (=> b!417611 (= e!249138 tp_is_empty!10773)))

(declare-fun b!417612 () Bool)

(assert (=> b!417612 (= e!249137 true)))

(declare-fun lt!191330 () V!15469)

(declare-datatypes ((tuple2!7092 0))(
  ( (tuple2!7093 (_1!3557 (_ BitVec 64)) (_2!3557 V!15469)) )
))
(declare-fun lt!191325 () tuple2!7092)

(declare-datatypes ((List!7110 0))(
  ( (Nil!7107) (Cons!7106 (h!7962 tuple2!7092) (t!12396 List!7110)) )
))
(declare-datatypes ((ListLongMap!6005 0))(
  ( (ListLongMap!6006 (toList!3018 List!7110)) )
))
(declare-fun lt!191321 () ListLongMap!6005)

(declare-fun +!1219 (ListLongMap!6005 tuple2!7092) ListLongMap!6005)

(assert (=> b!417612 (= (+!1219 lt!191321 lt!191325) (+!1219 (+!1219 lt!191321 (tuple2!7093 k0!794 lt!191330)) lt!191325))))

(declare-fun lt!191326 () V!15469)

(assert (=> b!417612 (= lt!191325 (tuple2!7093 k0!794 lt!191326))))

(declare-fun lt!191329 () Unit!12340)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!19 (ListLongMap!6005 (_ BitVec 64) V!15469 V!15469) Unit!12340)

(assert (=> b!417612 (= lt!191329 (addSameAsAddTwiceSameKeyDiffValues!19 lt!191321 k0!794 lt!191330 lt!191326))))

(declare-fun lt!191324 () V!15469)

(declare-fun get!6011 (ValueCell!5043 V!15469) V!15469)

(assert (=> b!417612 (= lt!191330 (get!6011 (select (arr!12149 _values!549) from!863) lt!191324))))

(declare-fun lt!191327 () ListLongMap!6005)

(declare-fun lt!191323 () array!25397)

(assert (=> b!417612 (= lt!191327 (+!1219 lt!191321 (tuple2!7093 (select (arr!12148 lt!191323) from!863) lt!191326)))))

(assert (=> b!417612 (= lt!191326 (get!6011 (select (store (arr!12149 _values!549) i!563 (ValueCellFull!5043 v!412)) from!863) lt!191324))))

(declare-fun dynLambda!690 (Int (_ BitVec 64)) V!15469)

(assert (=> b!417612 (= lt!191324 (dynLambda!690 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!191328 () array!25399)

(declare-fun getCurrentListMapNoExtraKeys!1223 (array!25397 array!25399 (_ BitVec 32) (_ BitVec 32) V!15469 V!15469 (_ BitVec 32) Int) ListLongMap!6005)

(assert (=> b!417612 (= lt!191321 (getCurrentListMapNoExtraKeys!1223 lt!191323 lt!191328 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417613 () Bool)

(declare-fun res!243237 () Bool)

(assert (=> b!417613 (=> (not res!243237) (not e!249136))))

(assert (=> b!417613 (= res!243237 (or (= (select (arr!12148 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12148 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417614 () Bool)

(declare-fun res!243230 () Bool)

(assert (=> b!417614 (=> (not res!243230) (not e!249136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417614 (= res!243230 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17781 () Bool)

(declare-fun mapRes!17781 () Bool)

(assert (=> mapIsEmpty!17781 mapRes!17781))

(declare-fun b!417616 () Bool)

(declare-fun call!29041 () ListLongMap!6005)

(declare-fun call!29042 () ListLongMap!6005)

(assert (=> b!417616 (= e!249135 (= call!29041 call!29042))))

(declare-fun b!417617 () Bool)

(declare-fun e!249133 () Bool)

(declare-fun e!249139 () Bool)

(assert (=> b!417617 (= e!249133 (and e!249139 mapRes!17781))))

(declare-fun condMapEmpty!17781 () Bool)

(declare-fun mapDefault!17781 () ValueCell!5043)

(assert (=> b!417617 (= condMapEmpty!17781 (= (arr!12149 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5043)) mapDefault!17781)))))

(declare-fun bm!29038 () Bool)

(assert (=> bm!29038 (= call!29042 (getCurrentListMapNoExtraKeys!1223 (ite c!55145 lt!191323 _keys!709) (ite c!55145 lt!191328 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29039 () Bool)

(assert (=> bm!29039 (= call!29041 (getCurrentListMapNoExtraKeys!1223 (ite c!55145 _keys!709 lt!191323) (ite c!55145 _values!549 lt!191328) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417618 () Bool)

(assert (=> b!417618 (= e!249141 e!249134)))

(declare-fun res!243236 () Bool)

(assert (=> b!417618 (=> (not res!243236) (not e!249134))))

(assert (=> b!417618 (= res!243236 (= from!863 i!563))))

(assert (=> b!417618 (= lt!191327 (getCurrentListMapNoExtraKeys!1223 lt!191323 lt!191328 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417618 (= lt!191328 (array!25400 (store (arr!12149 _values!549) i!563 (ValueCellFull!5043 v!412)) (size!12501 _values!549)))))

(declare-fun lt!191320 () ListLongMap!6005)

(assert (=> b!417618 (= lt!191320 (getCurrentListMapNoExtraKeys!1223 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!243228 () Bool)

(assert (=> start!39354 (=> (not res!243228) (not e!249136))))

(assert (=> start!39354 (= res!243228 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12500 _keys!709))))))

(assert (=> start!39354 e!249136))

(assert (=> start!39354 tp_is_empty!10773))

(assert (=> start!39354 tp!34391))

(assert (=> start!39354 true))

(declare-fun array_inv!8858 (array!25399) Bool)

(assert (=> start!39354 (and (array_inv!8858 _values!549) e!249133)))

(declare-fun array_inv!8859 (array!25397) Bool)

(assert (=> start!39354 (array_inv!8859 _keys!709)))

(declare-fun b!417615 () Bool)

(assert (=> b!417615 (= e!249135 (= call!29042 (+!1219 call!29041 (tuple2!7093 k0!794 v!412))))))

(declare-fun b!417619 () Bool)

(declare-fun res!243233 () Bool)

(assert (=> b!417619 (=> (not res!243233) (not e!249136))))

(assert (=> b!417619 (= res!243233 (validKeyInArray!0 k0!794))))

(declare-fun b!417620 () Bool)

(assert (=> b!417620 (= e!249136 e!249141)))

(declare-fun res!243229 () Bool)

(assert (=> b!417620 (=> (not res!243229) (not e!249141))))

(assert (=> b!417620 (= res!243229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191323 mask!1025))))

(assert (=> b!417620 (= lt!191323 (array!25398 (store (arr!12148 _keys!709) i!563 k0!794) (size!12500 _keys!709)))))

(declare-fun b!417621 () Bool)

(declare-fun res!243226 () Bool)

(assert (=> b!417621 (=> (not res!243226) (not e!249136))))

(declare-fun arrayContainsKey!0 (array!25397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417621 (= res!243226 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417622 () Bool)

(declare-fun res!243227 () Bool)

(assert (=> b!417622 (=> (not res!243227) (not e!249141))))

(assert (=> b!417622 (= res!243227 (arrayNoDuplicates!0 lt!191323 #b00000000000000000000000000000000 Nil!7106))))

(declare-fun mapNonEmpty!17781 () Bool)

(declare-fun tp!34392 () Bool)

(assert (=> mapNonEmpty!17781 (= mapRes!17781 (and tp!34392 e!249138))))

(declare-fun mapValue!17781 () ValueCell!5043)

(declare-fun mapRest!17781 () (Array (_ BitVec 32) ValueCell!5043))

(declare-fun mapKey!17781 () (_ BitVec 32))

(assert (=> mapNonEmpty!17781 (= (arr!12149 _values!549) (store mapRest!17781 mapKey!17781 mapValue!17781))))

(declare-fun b!417623 () Bool)

(assert (=> b!417623 (= e!249139 tp_is_empty!10773)))

(declare-fun b!417624 () Bool)

(declare-fun res!243232 () Bool)

(assert (=> b!417624 (=> (not res!243232) (not e!249136))))

(assert (=> b!417624 (= res!243232 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12500 _keys!709))))))

(declare-fun b!417625 () Bool)

(declare-fun res!243225 () Bool)

(assert (=> b!417625 (=> (not res!243225) (not e!249136))))

(assert (=> b!417625 (= res!243225 (and (= (size!12501 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12500 _keys!709) (size!12501 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39354 res!243228) b!417614))

(assert (= (and b!417614 res!243230) b!417625))

(assert (= (and b!417625 res!243225) b!417607))

(assert (= (and b!417607 res!243224) b!417608))

(assert (= (and b!417608 res!243234) b!417624))

(assert (= (and b!417624 res!243232) b!417619))

(assert (= (and b!417619 res!243233) b!417613))

(assert (= (and b!417613 res!243237) b!417621))

(assert (= (and b!417621 res!243226) b!417620))

(assert (= (and b!417620 res!243229) b!417622))

(assert (= (and b!417622 res!243227) b!417609))

(assert (= (and b!417609 res!243235) b!417618))

(assert (= (and b!417618 res!243236) b!417610))

(assert (= (and b!417610 c!55145) b!417615))

(assert (= (and b!417610 (not c!55145)) b!417616))

(assert (= (or b!417615 b!417616) bm!29038))

(assert (= (or b!417615 b!417616) bm!29039))

(assert (= (and b!417610 (not res!243231)) b!417612))

(assert (= (and b!417617 condMapEmpty!17781) mapIsEmpty!17781))

(assert (= (and b!417617 (not condMapEmpty!17781)) mapNonEmpty!17781))

(get-info :version)

(assert (= (and mapNonEmpty!17781 ((_ is ValueCellFull!5043) mapValue!17781)) b!417611))

(assert (= (and b!417617 ((_ is ValueCellFull!5043) mapDefault!17781)) b!417623))

(assert (= start!39354 b!417617))

(declare-fun b_lambda!8925 () Bool)

(assert (=> (not b_lambda!8925) (not b!417612)))

(declare-fun t!12394 () Bool)

(declare-fun tb!3243 () Bool)

(assert (=> (and start!39354 (= defaultEntry!557 defaultEntry!557) t!12394) tb!3243))

(declare-fun result!6013 () Bool)

(assert (=> tb!3243 (= result!6013 tp_is_empty!10773)))

(assert (=> b!417612 t!12394))

(declare-fun b_and!17119 () Bool)

(assert (= b_and!17117 (and (=> t!12394 result!6013) b_and!17119)))

(declare-fun m!406895 () Bool)

(assert (=> bm!29039 m!406895))

(declare-fun m!406897 () Bool)

(assert (=> b!417614 m!406897))

(declare-fun m!406899 () Bool)

(assert (=> b!417621 m!406899))

(declare-fun m!406901 () Bool)

(assert (=> b!417608 m!406901))

(declare-fun m!406903 () Bool)

(assert (=> b!417607 m!406903))

(declare-fun m!406905 () Bool)

(assert (=> b!417610 m!406905))

(assert (=> b!417610 m!406905))

(declare-fun m!406907 () Bool)

(assert (=> b!417610 m!406907))

(declare-fun m!406909 () Bool)

(assert (=> b!417610 m!406909))

(declare-fun m!406911 () Bool)

(assert (=> mapNonEmpty!17781 m!406911))

(declare-fun m!406913 () Bool)

(assert (=> b!417619 m!406913))

(declare-fun m!406915 () Bool)

(assert (=> b!417620 m!406915))

(declare-fun m!406917 () Bool)

(assert (=> b!417620 m!406917))

(declare-fun m!406919 () Bool)

(assert (=> b!417612 m!406919))

(declare-fun m!406921 () Bool)

(assert (=> b!417612 m!406921))

(declare-fun m!406923 () Bool)

(assert (=> b!417612 m!406923))

(declare-fun m!406925 () Bool)

(assert (=> b!417612 m!406925))

(declare-fun m!406927 () Bool)

(assert (=> b!417612 m!406927))

(declare-fun m!406929 () Bool)

(assert (=> b!417612 m!406929))

(declare-fun m!406931 () Bool)

(assert (=> b!417612 m!406931))

(declare-fun m!406933 () Bool)

(assert (=> b!417612 m!406933))

(declare-fun m!406935 () Bool)

(assert (=> b!417612 m!406935))

(declare-fun m!406937 () Bool)

(assert (=> b!417612 m!406937))

(assert (=> b!417612 m!406931))

(assert (=> b!417612 m!406937))

(declare-fun m!406939 () Bool)

(assert (=> b!417612 m!406939))

(assert (=> b!417612 m!406919))

(declare-fun m!406941 () Bool)

(assert (=> b!417612 m!406941))

(declare-fun m!406943 () Bool)

(assert (=> b!417612 m!406943))

(declare-fun m!406945 () Bool)

(assert (=> b!417613 m!406945))

(declare-fun m!406947 () Bool)

(assert (=> b!417622 m!406947))

(declare-fun m!406949 () Bool)

(assert (=> bm!29038 m!406949))

(declare-fun m!406951 () Bool)

(assert (=> b!417615 m!406951))

(declare-fun m!406953 () Bool)

(assert (=> b!417618 m!406953))

(assert (=> b!417618 m!406929))

(declare-fun m!406955 () Bool)

(assert (=> b!417618 m!406955))

(declare-fun m!406957 () Bool)

(assert (=> start!39354 m!406957))

(declare-fun m!406959 () Bool)

(assert (=> start!39354 m!406959))

(check-sat (not b_lambda!8925) (not b!417608) (not mapNonEmpty!17781) (not bm!29038) (not b!417621) (not b!417620) (not bm!29039) (not b!417612) (not b!417607) (not b!417619) (not b!417618) (not b!417610) tp_is_empty!10773 (not b_next!9621) (not b!417615) (not b!417622) (not start!39354) b_and!17119 (not b!417614))
(check-sat b_and!17119 (not b_next!9621))
