; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131986 () Bool)

(assert start!131986)

(declare-fun b_free!31699 () Bool)

(declare-fun b_next!31699 () Bool)

(assert (=> start!131986 (= b_free!31699 (not b_next!31699))))

(declare-fun tp!111349 () Bool)

(declare-fun b_and!51109 () Bool)

(assert (=> start!131986 (= tp!111349 b_and!51109)))

(declare-fun bm!69467 () Bool)

(declare-datatypes ((V!59077 0))(
  ( (V!59078 (val!19065 Int)) )
))
(declare-datatypes ((tuple2!24512 0))(
  ( (tuple2!24513 (_1!12267 (_ BitVec 64)) (_2!12267 V!59077)) )
))
(declare-datatypes ((List!36019 0))(
  ( (Nil!36016) (Cons!36015 (h!37460 tuple2!24512) (t!50713 List!36019)) )
))
(declare-datatypes ((ListLongMap!22121 0))(
  ( (ListLongMap!22122 (toList!11076 List!36019)) )
))
(declare-fun call!69473 () ListLongMap!22121)

(declare-fun call!69471 () ListLongMap!22121)

(assert (=> bm!69467 (= call!69473 call!69471)))

(declare-fun b!1546217 () Bool)

(declare-fun res!1060150 () Bool)

(declare-fun e!860664 () Bool)

(assert (=> b!1546217 (=> (not res!1060150) (not e!860664))))

(declare-datatypes ((array!103156 0))(
  ( (array!103157 (arr!49780 (Array (_ BitVec 32) (_ BitVec 64))) (size!50330 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103156)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546217 (= res!1060150 (validKeyInArray!0 (select (arr!49780 _keys!618) from!762)))))

(declare-fun b!1546218 () Bool)

(declare-fun e!860661 () ListLongMap!22121)

(declare-fun e!860663 () ListLongMap!22121)

(assert (=> b!1546218 (= e!860661 e!860663)))

(declare-fun c!141776 () Bool)

(declare-fun lt!666509 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546218 (= c!141776 (and (not lt!666509) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58666 () Bool)

(declare-fun mapRes!58666 () Bool)

(assert (=> mapIsEmpty!58666 mapRes!58666))

(declare-fun res!1060149 () Bool)

(declare-fun e!860662 () Bool)

(assert (=> start!131986 (=> (not res!1060149) (not e!860662))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131986 (= res!1060149 (validMask!0 mask!926))))

(assert (=> start!131986 e!860662))

(declare-fun array_inv!38719 (array!103156) Bool)

(assert (=> start!131986 (array_inv!38719 _keys!618)))

(declare-fun tp_is_empty!37975 () Bool)

(assert (=> start!131986 tp_is_empty!37975))

(assert (=> start!131986 true))

(assert (=> start!131986 tp!111349))

(declare-datatypes ((ValueCell!18077 0))(
  ( (ValueCellFull!18077 (v!21866 V!59077)) (EmptyCell!18077) )
))
(declare-datatypes ((array!103158 0))(
  ( (array!103159 (arr!49781 (Array (_ BitVec 32) ValueCell!18077)) (size!50331 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103158)

(declare-fun e!860665 () Bool)

(declare-fun array_inv!38720 (array!103158) Bool)

(assert (=> start!131986 (and (array_inv!38720 _values!470) e!860665)))

(declare-fun b!1546219 () Bool)

(assert (=> b!1546219 (= e!860662 e!860664)))

(declare-fun res!1060147 () Bool)

(assert (=> b!1546219 (=> (not res!1060147) (not e!860664))))

(assert (=> b!1546219 (= res!1060147 (bvslt from!762 (size!50330 _keys!618)))))

(declare-fun lt!666510 () ListLongMap!22121)

(assert (=> b!1546219 (= lt!666510 e!860661)))

(declare-fun c!141774 () Bool)

(assert (=> b!1546219 (= c!141774 (and (not lt!666509) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546219 (= lt!666509 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546220 () Bool)

(declare-fun res!1060151 () Bool)

(assert (=> b!1546220 (=> (not res!1060151) (not e!860662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103156 (_ BitVec 32)) Bool)

(assert (=> b!1546220 (= res!1060151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun zeroValue!436 () V!59077)

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59077)

(declare-fun bm!69468 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6542 (array!103156 array!103158 (_ BitVec 32) (_ BitVec 32) V!59077 V!59077 (_ BitVec 32) Int) ListLongMap!22121)

(assert (=> bm!69468 (= call!69471 (getCurrentListMapNoExtraKeys!6542 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546221 () Bool)

(declare-fun call!69472 () ListLongMap!22121)

(assert (=> b!1546221 (= e!860663 call!69472)))

(declare-fun b!1546222 () Bool)

(declare-fun e!860660 () ListLongMap!22121)

(assert (=> b!1546222 (= e!860660 call!69472)))

(declare-fun mapNonEmpty!58666 () Bool)

(declare-fun tp!111348 () Bool)

(declare-fun e!860659 () Bool)

(assert (=> mapNonEmpty!58666 (= mapRes!58666 (and tp!111348 e!860659))))

(declare-fun mapRest!58666 () (Array (_ BitVec 32) ValueCell!18077))

(declare-fun mapValue!58666 () ValueCell!18077)

(declare-fun mapKey!58666 () (_ BitVec 32))

(assert (=> mapNonEmpty!58666 (= (arr!49781 _values!470) (store mapRest!58666 mapKey!58666 mapValue!58666))))

(declare-fun bm!69469 () Bool)

(declare-fun call!69470 () ListLongMap!22121)

(assert (=> bm!69469 (= call!69470 call!69473)))

(declare-fun b!1546223 () Bool)

(assert (=> b!1546223 (= e!860659 tp_is_empty!37975)))

(declare-fun b!1546224 () Bool)

(declare-fun e!860667 () Bool)

(assert (=> b!1546224 (= e!860667 tp_is_empty!37975)))

(declare-fun b!1546225 () Bool)

(declare-fun res!1060152 () Bool)

(assert (=> b!1546225 (=> (not res!1060152) (not e!860662))))

(declare-datatypes ((List!36020 0))(
  ( (Nil!36017) (Cons!36016 (h!37461 (_ BitVec 64)) (t!50714 List!36020)) )
))
(declare-fun arrayNoDuplicates!0 (array!103156 (_ BitVec 32) List!36020) Bool)

(assert (=> b!1546225 (= res!1060152 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36017))))

(declare-fun b!1546226 () Bool)

(declare-fun c!141775 () Bool)

(assert (=> b!1546226 (= c!141775 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666509))))

(assert (=> b!1546226 (= e!860663 e!860660)))

(declare-fun bm!69470 () Bool)

(declare-fun call!69474 () ListLongMap!22121)

(assert (=> bm!69470 (= call!69472 call!69474)))

(declare-fun b!1546227 () Bool)

(declare-fun res!1060148 () Bool)

(assert (=> b!1546227 (=> (not res!1060148) (not e!860662))))

(assert (=> b!1546227 (= res!1060148 (and (= (size!50331 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50330 _keys!618) (size!50331 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546228 () Bool)

(assert (=> b!1546228 (= e!860660 call!69470)))

(declare-fun b!1546229 () Bool)

(declare-fun res!1060146 () Bool)

(assert (=> b!1546229 (=> (not res!1060146) (not e!860662))))

(assert (=> b!1546229 (= res!1060146 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50330 _keys!618))))))

(declare-fun b!1546230 () Bool)

(declare-fun +!4911 (ListLongMap!22121 tuple2!24512) ListLongMap!22121)

(assert (=> b!1546230 (= e!860661 (+!4911 call!69474 (tuple2!24513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69471 () Bool)

(assert (=> bm!69471 (= call!69474 (+!4911 (ite c!141774 call!69471 (ite c!141776 call!69473 call!69470)) (ite (or c!141774 c!141776) (tuple2!24513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546231 () Bool)

(assert (=> b!1546231 (= e!860664 (not true))))

(declare-fun lt!666511 () ListLongMap!22121)

(declare-fun contains!10044 (ListLongMap!22121 (_ BitVec 64)) Bool)

(assert (=> b!1546231 (contains!10044 (+!4911 lt!666511 (tuple2!24513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49780 _keys!618) from!762))))

(declare-datatypes ((Unit!51524 0))(
  ( (Unit!51525) )
))
(declare-fun lt!666512 () Unit!51524)

(declare-fun addStillContains!1232 (ListLongMap!22121 (_ BitVec 64) V!59077 (_ BitVec 64)) Unit!51524)

(assert (=> b!1546231 (= lt!666512 (addStillContains!1232 lt!666511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49780 _keys!618) from!762)))))

(assert (=> b!1546231 (= lt!666511 (getCurrentListMapNoExtraKeys!6542 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546232 () Bool)

(assert (=> b!1546232 (= e!860665 (and e!860667 mapRes!58666))))

(declare-fun condMapEmpty!58666 () Bool)

(declare-fun mapDefault!58666 () ValueCell!18077)

