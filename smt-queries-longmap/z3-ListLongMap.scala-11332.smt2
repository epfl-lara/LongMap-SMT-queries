; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131898 () Bool)

(assert start!131898)

(declare-fun b_free!31611 () Bool)

(declare-fun b_next!31611 () Bool)

(assert (=> start!131898 (= b_free!31611 (not b_next!31611))))

(declare-fun tp!111085 () Bool)

(declare-fun b_and!51021 () Bool)

(assert (=> start!131898 (= tp!111085 b_and!51021)))

(declare-fun b!1544221 () Bool)

(declare-datatypes ((V!58959 0))(
  ( (V!58960 (val!19021 Int)) )
))
(declare-datatypes ((tuple2!24432 0))(
  ( (tuple2!24433 (_1!12227 (_ BitVec 64)) (_2!12227 V!58959)) )
))
(declare-datatypes ((List!35949 0))(
  ( (Nil!35946) (Cons!35945 (h!37390 tuple2!24432) (t!50643 List!35949)) )
))
(declare-datatypes ((ListLongMap!22041 0))(
  ( (ListLongMap!22042 (toList!11036 List!35949)) )
))
(declare-fun e!859532 () ListLongMap!22041)

(declare-fun call!68811 () ListLongMap!22041)

(assert (=> b!1544221 (= e!859532 call!68811)))

(declare-fun b!1544222 () Bool)

(declare-fun res!1059340 () Bool)

(declare-fun e!859530 () Bool)

(assert (=> b!1544222 (=> (not res!1059340) (not e!859530))))

(declare-datatypes ((array!102988 0))(
  ( (array!102989 (arr!49696 (Array (_ BitVec 32) (_ BitVec 64))) (size!50246 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102988)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102988 (_ BitVec 32)) Bool)

(assert (=> b!1544222 (= res!1059340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58534 () Bool)

(declare-fun mapRes!58534 () Bool)

(assert (=> mapIsEmpty!58534 mapRes!58534))

(declare-fun b!1544223 () Bool)

(declare-fun e!859536 () Bool)

(declare-fun tp_is_empty!37887 () Bool)

(assert (=> b!1544223 (= e!859536 tp_is_empty!37887)))

(declare-fun bm!68807 () Bool)

(declare-fun call!68810 () ListLongMap!22041)

(declare-fun call!68814 () ListLongMap!22041)

(assert (=> bm!68807 (= call!68810 call!68814)))

(declare-fun res!1059339 () Bool)

(assert (=> start!131898 (=> (not res!1059339) (not e!859530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131898 (= res!1059339 (validMask!0 mask!926))))

(assert (=> start!131898 e!859530))

(declare-fun array_inv!38661 (array!102988) Bool)

(assert (=> start!131898 (array_inv!38661 _keys!618)))

(assert (=> start!131898 tp_is_empty!37887))

(assert (=> start!131898 true))

(assert (=> start!131898 tp!111085))

(declare-datatypes ((ValueCell!18033 0))(
  ( (ValueCellFull!18033 (v!21822 V!58959)) (EmptyCell!18033) )
))
(declare-datatypes ((array!102990 0))(
  ( (array!102991 (arr!49697 (Array (_ BitVec 32) ValueCell!18033)) (size!50247 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102990)

(declare-fun e!859535 () Bool)

(declare-fun array_inv!38662 (array!102990) Bool)

(assert (=> start!131898 (and (array_inv!38662 _values!470) e!859535)))

(declare-fun b!1544224 () Bool)

(assert (=> b!1544224 (= e!859530 false)))

(declare-fun lt!666106 () ListLongMap!22041)

(declare-fun e!859534 () ListLongMap!22041)

(assert (=> b!1544224 (= lt!666106 e!859534)))

(declare-fun c!141378 () Bool)

(declare-fun lt!666107 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544224 (= c!141378 (and (not lt!666107) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544224 (= lt!666107 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!436 () V!58959)

(declare-fun bm!68808 () Bool)

(declare-fun minValue!436 () V!58959)

(declare-fun call!68812 () ListLongMap!22041)

(declare-fun c!141380 () Bool)

(declare-fun +!4875 (ListLongMap!22041 tuple2!24432) ListLongMap!22041)

(assert (=> bm!68808 (= call!68812 (+!4875 (ite c!141378 call!68814 (ite c!141380 call!68810 call!68811)) (ite (or c!141378 c!141380) (tuple2!24433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapNonEmpty!58534 () Bool)

(declare-fun tp!111084 () Bool)

(declare-fun e!859531 () Bool)

(assert (=> mapNonEmpty!58534 (= mapRes!58534 (and tp!111084 e!859531))))

(declare-fun mapKey!58534 () (_ BitVec 32))

(declare-fun mapValue!58534 () ValueCell!18033)

(declare-fun mapRest!58534 () (Array (_ BitVec 32) ValueCell!18033))

(assert (=> mapNonEmpty!58534 (= (arr!49697 _values!470) (store mapRest!58534 mapKey!58534 mapValue!58534))))

(declare-fun b!1544225 () Bool)

(declare-fun c!141379 () Bool)

(assert (=> b!1544225 (= c!141379 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666107))))

(declare-fun e!859533 () ListLongMap!22041)

(assert (=> b!1544225 (= e!859533 e!859532)))

(declare-fun b!1544226 () Bool)

(assert (=> b!1544226 (= e!859535 (and e!859536 mapRes!58534))))

(declare-fun condMapEmpty!58534 () Bool)

(declare-fun mapDefault!58534 () ValueCell!18033)

(assert (=> b!1544226 (= condMapEmpty!58534 (= (arr!49697 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18033)) mapDefault!58534)))))

(declare-fun b!1544227 () Bool)

(declare-fun res!1059341 () Bool)

(assert (=> b!1544227 (=> (not res!1059341) (not e!859530))))

(assert (=> b!1544227 (= res!1059341 (and (= (size!50247 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50246 _keys!618) (size!50247 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544228 () Bool)

(declare-fun res!1059342 () Bool)

(assert (=> b!1544228 (=> (not res!1059342) (not e!859530))))

(declare-datatypes ((List!35950 0))(
  ( (Nil!35947) (Cons!35946 (h!37391 (_ BitVec 64)) (t!50644 List!35950)) )
))
(declare-fun arrayNoDuplicates!0 (array!102988 (_ BitVec 32) List!35950) Bool)

(assert (=> b!1544228 (= res!1059342 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35947))))

(declare-fun b!1544229 () Bool)

(assert (=> b!1544229 (= e!859534 (+!4875 call!68812 (tuple2!24433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!68809 () Bool)

(declare-fun call!68813 () ListLongMap!22041)

(assert (=> bm!68809 (= call!68813 call!68812)))

(declare-fun b!1544230 () Bool)

(assert (=> b!1544230 (= e!859533 call!68813)))

(declare-fun b!1544231 () Bool)

(assert (=> b!1544231 (= e!859531 tp_is_empty!37887)))

(declare-fun bm!68810 () Bool)

(assert (=> bm!68810 (= call!68811 call!68810)))

(declare-fun b!1544232 () Bool)

(assert (=> b!1544232 (= e!859534 e!859533)))

(assert (=> b!1544232 (= c!141380 (and (not lt!666107) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544233 () Bool)

(declare-fun res!1059338 () Bool)

(assert (=> b!1544233 (=> (not res!1059338) (not e!859530))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544233 (= res!1059338 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50246 _keys!618))))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!68811 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6508 (array!102988 array!102990 (_ BitVec 32) (_ BitVec 32) V!58959 V!58959 (_ BitVec 32) Int) ListLongMap!22041)

(assert (=> bm!68811 (= call!68814 (getCurrentListMapNoExtraKeys!6508 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544234 () Bool)

(assert (=> b!1544234 (= e!859532 call!68813)))

(assert (= (and start!131898 res!1059339) b!1544227))

(assert (= (and b!1544227 res!1059341) b!1544222))

(assert (= (and b!1544222 res!1059340) b!1544228))

(assert (= (and b!1544228 res!1059342) b!1544233))

(assert (= (and b!1544233 res!1059338) b!1544224))

(assert (= (and b!1544224 c!141378) b!1544229))

(assert (= (and b!1544224 (not c!141378)) b!1544232))

(assert (= (and b!1544232 c!141380) b!1544230))

(assert (= (and b!1544232 (not c!141380)) b!1544225))

(assert (= (and b!1544225 c!141379) b!1544234))

(assert (= (and b!1544225 (not c!141379)) b!1544221))

(assert (= (or b!1544234 b!1544221) bm!68810))

(assert (= (or b!1544230 bm!68810) bm!68807))

(assert (= (or b!1544230 b!1544234) bm!68809))

(assert (= (or b!1544229 bm!68807) bm!68811))

(assert (= (or b!1544229 bm!68809) bm!68808))

(assert (= (and b!1544226 condMapEmpty!58534) mapIsEmpty!58534))

(assert (= (and b!1544226 (not condMapEmpty!58534)) mapNonEmpty!58534))

(get-info :version)

(assert (= (and mapNonEmpty!58534 ((_ is ValueCellFull!18033) mapValue!58534)) b!1544231))

(assert (= (and b!1544226 ((_ is ValueCellFull!18033) mapDefault!58534)) b!1544223))

(assert (= start!131898 b!1544226))

(declare-fun m!1425187 () Bool)

(assert (=> bm!68808 m!1425187))

(declare-fun m!1425189 () Bool)

(assert (=> b!1544229 m!1425189))

(declare-fun m!1425191 () Bool)

(assert (=> b!1544228 m!1425191))

(declare-fun m!1425193 () Bool)

(assert (=> bm!68811 m!1425193))

(declare-fun m!1425195 () Bool)

(assert (=> start!131898 m!1425195))

(declare-fun m!1425197 () Bool)

(assert (=> start!131898 m!1425197))

(declare-fun m!1425199 () Bool)

(assert (=> start!131898 m!1425199))

(declare-fun m!1425201 () Bool)

(assert (=> mapNonEmpty!58534 m!1425201))

(declare-fun m!1425203 () Bool)

(assert (=> b!1544222 m!1425203))

(check-sat (not b_next!31611) (not b!1544229) (not bm!68808) (not bm!68811) (not b!1544228) (not mapNonEmpty!58534) (not start!131898) b_and!51021 (not b!1544222) tp_is_empty!37887)
(check-sat b_and!51021 (not b_next!31611))
