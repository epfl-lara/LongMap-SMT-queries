; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131936 () Bool)

(assert start!131936)

(declare-fun b_free!31699 () Bool)

(declare-fun b_next!31699 () Bool)

(assert (=> start!131936 (= b_free!31699 (not b_next!31699))))

(declare-fun tp!111349 () Bool)

(declare-fun b_and!51091 () Bool)

(assert (=> start!131936 (= tp!111349 b_and!51091)))

(declare-fun b!1545904 () Bool)

(declare-fun res!1060019 () Bool)

(declare-fun e!860461 () Bool)

(assert (=> b!1545904 (=> (not res!1060019) (not e!860461))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103084 0))(
  ( (array!103085 (arr!49745 (Array (_ BitVec 32) (_ BitVec 64))) (size!50297 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103084)

(assert (=> b!1545904 (= res!1060019 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50297 _keys!618))))))

(declare-fun b!1545905 () Bool)

(declare-fun e!860463 () Bool)

(declare-fun tp_is_empty!37975 () Bool)

(assert (=> b!1545905 (= e!860463 tp_is_empty!37975)))

(declare-fun b!1545906 () Bool)

(declare-fun res!1060023 () Bool)

(assert (=> b!1545906 (=> (not res!1060023) (not e!860461))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59077 0))(
  ( (V!59078 (val!19065 Int)) )
))
(declare-datatypes ((ValueCell!18077 0))(
  ( (ValueCellFull!18077 (v!21862 V!59077)) (EmptyCell!18077) )
))
(declare-datatypes ((array!103086 0))(
  ( (array!103087 (arr!49746 (Array (_ BitVec 32) ValueCell!18077)) (size!50298 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103086)

(assert (=> b!1545906 (= res!1060023 (and (= (size!50298 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50297 _keys!618) (size!50298 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545907 () Bool)

(declare-fun res!1060020 () Bool)

(assert (=> b!1545907 (=> (not res!1060020) (not e!860461))))

(declare-datatypes ((List!36061 0))(
  ( (Nil!36058) (Cons!36057 (h!37503 (_ BitVec 64)) (t!50747 List!36061)) )
))
(declare-fun arrayNoDuplicates!0 (array!103084 (_ BitVec 32) List!36061) Bool)

(assert (=> b!1545907 (= res!1060020 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36058))))

(declare-fun bm!69432 () Bool)

(declare-datatypes ((tuple2!24588 0))(
  ( (tuple2!24589 (_1!12305 (_ BitVec 64)) (_2!12305 V!59077)) )
))
(declare-datatypes ((List!36062 0))(
  ( (Nil!36059) (Cons!36058 (h!37504 tuple2!24588) (t!50748 List!36062)) )
))
(declare-datatypes ((ListLongMap!22197 0))(
  ( (ListLongMap!22198 (toList!11114 List!36062)) )
))
(declare-fun call!69437 () ListLongMap!22197)

(declare-fun call!69436 () ListLongMap!22197)

(assert (=> bm!69432 (= call!69437 call!69436)))

(declare-fun mapIsEmpty!58666 () Bool)

(declare-fun mapRes!58666 () Bool)

(assert (=> mapIsEmpty!58666 mapRes!58666))

(declare-fun zeroValue!436 () V!59077)

(declare-fun c!141685 () Bool)

(declare-fun c!141686 () Bool)

(declare-fun call!69439 () ListLongMap!22197)

(declare-fun minValue!436 () V!59077)

(declare-fun call!69438 () ListLongMap!22197)

(declare-fun bm!69433 () Bool)

(declare-fun +!4941 (ListLongMap!22197 tuple2!24588) ListLongMap!22197)

(assert (=> bm!69433 (= call!69438 (+!4941 (ite c!141686 call!69439 (ite c!141685 call!69436 call!69437)) (ite (or c!141686 c!141685) (tuple2!24589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1060021 () Bool)

(assert (=> start!131936 (=> (not res!1060021) (not e!860461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131936 (= res!1060021 (validMask!0 mask!926))))

(assert (=> start!131936 e!860461))

(declare-fun array_inv!38883 (array!103084) Bool)

(assert (=> start!131936 (array_inv!38883 _keys!618)))

(assert (=> start!131936 tp_is_empty!37975))

(assert (=> start!131936 true))

(assert (=> start!131936 tp!111349))

(declare-fun e!860462 () Bool)

(declare-fun array_inv!38884 (array!103086) Bool)

(assert (=> start!131936 (and (array_inv!38884 _values!470) e!860462)))

(declare-fun b!1545908 () Bool)

(declare-fun c!141687 () Bool)

(declare-fun lt!666226 () Bool)

(assert (=> b!1545908 (= c!141687 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666226))))

(declare-fun e!860468 () ListLongMap!22197)

(declare-fun e!860467 () ListLongMap!22197)

(assert (=> b!1545908 (= e!860468 e!860467)))

(declare-fun b!1545909 () Bool)

(assert (=> b!1545909 (= e!860462 (and e!860463 mapRes!58666))))

(declare-fun condMapEmpty!58666 () Bool)

(declare-fun mapDefault!58666 () ValueCell!18077)

(assert (=> b!1545909 (= condMapEmpty!58666 (= (arr!49746 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18077)) mapDefault!58666)))))

(declare-fun b!1545910 () Bool)

(declare-fun call!69435 () ListLongMap!22197)

(assert (=> b!1545910 (= e!860467 call!69435)))

(declare-fun bm!69434 () Bool)

(assert (=> bm!69434 (= call!69435 call!69438)))

(declare-fun b!1545911 () Bool)

(declare-fun e!860466 () ListLongMap!22197)

(assert (=> b!1545911 (= e!860466 e!860468)))

(assert (=> b!1545911 (= c!141685 (and (not lt!666226) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545912 () Bool)

(declare-fun e!860464 () Bool)

(assert (=> b!1545912 (= e!860464 (not true))))

(declare-fun lt!666224 () ListLongMap!22197)

(declare-fun contains!10001 (ListLongMap!22197 (_ BitVec 64)) Bool)

(assert (=> b!1545912 (contains!10001 (+!4941 lt!666224 (tuple2!24589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49745 _keys!618) from!762))))

(declare-datatypes ((Unit!51349 0))(
  ( (Unit!51350) )
))
(declare-fun lt!666225 () Unit!51349)

(declare-fun addStillContains!1224 (ListLongMap!22197 (_ BitVec 64) V!59077 (_ BitVec 64)) Unit!51349)

(assert (=> b!1545912 (= lt!666225 (addStillContains!1224 lt!666224 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49745 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6569 (array!103084 array!103086 (_ BitVec 32) (_ BitVec 32) V!59077 V!59077 (_ BitVec 32) Int) ListLongMap!22197)

(assert (=> b!1545912 (= lt!666224 (getCurrentListMapNoExtraKeys!6569 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545913 () Bool)

(declare-fun e!860465 () Bool)

(assert (=> b!1545913 (= e!860465 tp_is_empty!37975)))

(declare-fun mapNonEmpty!58666 () Bool)

(declare-fun tp!111350 () Bool)

(assert (=> mapNonEmpty!58666 (= mapRes!58666 (and tp!111350 e!860465))))

(declare-fun mapKey!58666 () (_ BitVec 32))

(declare-fun mapRest!58666 () (Array (_ BitVec 32) ValueCell!18077))

(declare-fun mapValue!58666 () ValueCell!18077)

(assert (=> mapNonEmpty!58666 (= (arr!49746 _values!470) (store mapRest!58666 mapKey!58666 mapValue!58666))))

(declare-fun bm!69435 () Bool)

(assert (=> bm!69435 (= call!69436 call!69439)))

(declare-fun b!1545914 () Bool)

(assert (=> b!1545914 (= e!860466 (+!4941 call!69438 (tuple2!24589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69436 () Bool)

(assert (=> bm!69436 (= call!69439 (getCurrentListMapNoExtraKeys!6569 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545915 () Bool)

(assert (=> b!1545915 (= e!860467 call!69437)))

(declare-fun b!1545916 () Bool)

(declare-fun res!1060017 () Bool)

(assert (=> b!1545916 (=> (not res!1060017) (not e!860464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545916 (= res!1060017 (validKeyInArray!0 (select (arr!49745 _keys!618) from!762)))))

(declare-fun b!1545917 () Bool)

(declare-fun res!1060022 () Bool)

(assert (=> b!1545917 (=> (not res!1060022) (not e!860461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103084 (_ BitVec 32)) Bool)

(assert (=> b!1545917 (= res!1060022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545918 () Bool)

(assert (=> b!1545918 (= e!860461 e!860464)))

(declare-fun res!1060018 () Bool)

(assert (=> b!1545918 (=> (not res!1060018) (not e!860464))))

(assert (=> b!1545918 (= res!1060018 (bvslt from!762 (size!50297 _keys!618)))))

(declare-fun lt!666223 () ListLongMap!22197)

(assert (=> b!1545918 (= lt!666223 e!860466)))

(assert (=> b!1545918 (= c!141686 (and (not lt!666226) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545918 (= lt!666226 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545919 () Bool)

(assert (=> b!1545919 (= e!860468 call!69435)))

(assert (= (and start!131936 res!1060021) b!1545906))

(assert (= (and b!1545906 res!1060023) b!1545917))

(assert (= (and b!1545917 res!1060022) b!1545907))

(assert (= (and b!1545907 res!1060020) b!1545904))

(assert (= (and b!1545904 res!1060019) b!1545918))

(assert (= (and b!1545918 c!141686) b!1545914))

(assert (= (and b!1545918 (not c!141686)) b!1545911))

(assert (= (and b!1545911 c!141685) b!1545919))

(assert (= (and b!1545911 (not c!141685)) b!1545908))

(assert (= (and b!1545908 c!141687) b!1545910))

(assert (= (and b!1545908 (not c!141687)) b!1545915))

(assert (= (or b!1545910 b!1545915) bm!69432))

(assert (= (or b!1545919 bm!69432) bm!69435))

(assert (= (or b!1545919 b!1545910) bm!69434))

(assert (= (or b!1545914 bm!69435) bm!69436))

(assert (= (or b!1545914 bm!69434) bm!69433))

(assert (= (and b!1545918 res!1060018) b!1545916))

(assert (= (and b!1545916 res!1060017) b!1545912))

(assert (= (and b!1545909 condMapEmpty!58666) mapIsEmpty!58666))

(assert (= (and b!1545909 (not condMapEmpty!58666)) mapNonEmpty!58666))

(get-info :version)

(assert (= (and mapNonEmpty!58666 ((_ is ValueCellFull!18077) mapValue!58666)) b!1545913))

(assert (= (and b!1545909 ((_ is ValueCellFull!18077) mapDefault!58666)) b!1545905))

(assert (= start!131936 b!1545909))

(declare-fun m!1425315 () Bool)

(assert (=> b!1545907 m!1425315))

(declare-fun m!1425317 () Bool)

(assert (=> bm!69436 m!1425317))

(declare-fun m!1425319 () Bool)

(assert (=> b!1545916 m!1425319))

(assert (=> b!1545916 m!1425319))

(declare-fun m!1425321 () Bool)

(assert (=> b!1545916 m!1425321))

(declare-fun m!1425323 () Bool)

(assert (=> mapNonEmpty!58666 m!1425323))

(assert (=> b!1545912 m!1425317))

(assert (=> b!1545912 m!1425319))

(declare-fun m!1425325 () Bool)

(assert (=> b!1545912 m!1425325))

(assert (=> b!1545912 m!1425325))

(assert (=> b!1545912 m!1425319))

(declare-fun m!1425327 () Bool)

(assert (=> b!1545912 m!1425327))

(assert (=> b!1545912 m!1425319))

(declare-fun m!1425329 () Bool)

(assert (=> b!1545912 m!1425329))

(declare-fun m!1425331 () Bool)

(assert (=> b!1545914 m!1425331))

(declare-fun m!1425333 () Bool)

(assert (=> b!1545917 m!1425333))

(declare-fun m!1425335 () Bool)

(assert (=> bm!69433 m!1425335))

(declare-fun m!1425337 () Bool)

(assert (=> start!131936 m!1425337))

(declare-fun m!1425339 () Bool)

(assert (=> start!131936 m!1425339))

(declare-fun m!1425341 () Bool)

(assert (=> start!131936 m!1425341))

(check-sat (not b!1545907) (not b_next!31699) (not b!1545917) (not mapNonEmpty!58666) (not bm!69433) (not b!1545916) tp_is_empty!37975 (not b!1545912) (not start!131936) (not bm!69436) (not b!1545914) b_and!51091)
(check-sat b_and!51091 (not b_next!31699))
