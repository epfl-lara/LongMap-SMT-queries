; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131984 () Bool)

(assert start!131984)

(declare-fun b_free!31697 () Bool)

(declare-fun b_next!31697 () Bool)

(assert (=> start!131984 (= b_free!31697 (not b_next!31697))))

(declare-fun tp!111343 () Bool)

(declare-fun b_and!51107 () Bool)

(assert (=> start!131984 (= tp!111343 b_and!51107)))

(declare-fun b!1546169 () Bool)

(declare-fun e!860633 () Bool)

(declare-fun tp_is_empty!37973 () Bool)

(assert (=> b!1546169 (= e!860633 tp_is_empty!37973)))

(declare-fun res!1060130 () Bool)

(declare-fun e!860634 () Bool)

(assert (=> start!131984 (=> (not res!1060130) (not e!860634))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131984 (= res!1060130 (validMask!0 mask!926))))

(assert (=> start!131984 e!860634))

(declare-datatypes ((array!103152 0))(
  ( (array!103153 (arr!49778 (Array (_ BitVec 32) (_ BitVec 64))) (size!50328 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103152)

(declare-fun array_inv!38717 (array!103152) Bool)

(assert (=> start!131984 (array_inv!38717 _keys!618)))

(assert (=> start!131984 tp_is_empty!37973))

(assert (=> start!131984 true))

(assert (=> start!131984 tp!111343))

(declare-datatypes ((V!59073 0))(
  ( (V!59074 (val!19064 Int)) )
))
(declare-datatypes ((ValueCell!18076 0))(
  ( (ValueCellFull!18076 (v!21865 V!59073)) (EmptyCell!18076) )
))
(declare-datatypes ((array!103154 0))(
  ( (array!103155 (arr!49779 (Array (_ BitVec 32) ValueCell!18076)) (size!50329 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103154)

(declare-fun e!860637 () Bool)

(declare-fun array_inv!38718 (array!103154) Bool)

(assert (=> start!131984 (and (array_inv!38718 _values!470) e!860637)))

(declare-fun b!1546170 () Bool)

(declare-fun res!1060129 () Bool)

(assert (=> b!1546170 (=> (not res!1060129) (not e!860634))))

(declare-datatypes ((List!36017 0))(
  ( (Nil!36014) (Cons!36013 (h!37458 (_ BitVec 64)) (t!50711 List!36017)) )
))
(declare-fun arrayNoDuplicates!0 (array!103152 (_ BitVec 32) List!36017) Bool)

(assert (=> b!1546170 (= res!1060129 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36014))))

(declare-fun bm!69452 () Bool)

(declare-datatypes ((tuple2!24510 0))(
  ( (tuple2!24511 (_1!12266 (_ BitVec 64)) (_2!12266 V!59073)) )
))
(declare-datatypes ((List!36018 0))(
  ( (Nil!36015) (Cons!36014 (h!37459 tuple2!24510) (t!50712 List!36018)) )
))
(declare-datatypes ((ListLongMap!22119 0))(
  ( (ListLongMap!22120 (toList!11075 List!36018)) )
))
(declare-fun call!69459 () ListLongMap!22119)

(declare-fun call!69457 () ListLongMap!22119)

(assert (=> bm!69452 (= call!69459 call!69457)))

(declare-fun b!1546171 () Bool)

(declare-fun e!860639 () ListLongMap!22119)

(declare-fun call!69458 () ListLongMap!22119)

(assert (=> b!1546171 (= e!860639 call!69458)))

(declare-fun b!1546172 () Bool)

(declare-fun e!860635 () ListLongMap!22119)

(declare-fun call!69456 () ListLongMap!22119)

(declare-fun minValue!436 () V!59073)

(declare-fun +!4910 (ListLongMap!22119 tuple2!24510) ListLongMap!22119)

(assert (=> b!1546172 (= e!860635 (+!4910 call!69456 (tuple2!24511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546173 () Bool)

(declare-fun res!1060125 () Bool)

(assert (=> b!1546173 (=> (not res!1060125) (not e!860634))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546173 (= res!1060125 (and (= (size!50329 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50328 _keys!618) (size!50329 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546174 () Bool)

(declare-fun res!1060128 () Bool)

(assert (=> b!1546174 (=> (not res!1060128) (not e!860634))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1546174 (= res!1060128 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50328 _keys!618))))))

(declare-fun b!1546175 () Bool)

(declare-fun e!860636 () Bool)

(assert (=> b!1546175 (= e!860636 (not true))))

(declare-fun zeroValue!436 () V!59073)

(declare-fun lt!666498 () ListLongMap!22119)

(declare-fun contains!10043 (ListLongMap!22119 (_ BitVec 64)) Bool)

(assert (=> b!1546175 (contains!10043 (+!4910 lt!666498 (tuple2!24511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49778 _keys!618) from!762))))

(declare-datatypes ((Unit!51522 0))(
  ( (Unit!51523) )
))
(declare-fun lt!666500 () Unit!51522)

(declare-fun addStillContains!1231 (ListLongMap!22119 (_ BitVec 64) V!59073 (_ BitVec 64)) Unit!51522)

(assert (=> b!1546175 (= lt!666500 (addStillContains!1231 lt!666498 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49778 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6541 (array!103152 array!103154 (_ BitVec 32) (_ BitVec 32) V!59073 V!59073 (_ BitVec 32) Int) ListLongMap!22119)

(assert (=> b!1546175 (= lt!666498 (getCurrentListMapNoExtraKeys!6541 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58663 () Bool)

(declare-fun mapRes!58663 () Bool)

(assert (=> mapIsEmpty!58663 mapRes!58663))

(declare-fun mapNonEmpty!58663 () Bool)

(declare-fun tp!111342 () Bool)

(assert (=> mapNonEmpty!58663 (= mapRes!58663 (and tp!111342 e!860633))))

(declare-fun mapValue!58663 () ValueCell!18076)

(declare-fun mapKey!58663 () (_ BitVec 32))

(declare-fun mapRest!58663 () (Array (_ BitVec 32) ValueCell!18076))

(assert (=> mapNonEmpty!58663 (= (arr!49779 _values!470) (store mapRest!58663 mapKey!58663 mapValue!58663))))

(declare-fun b!1546176 () Bool)

(declare-fun e!860640 () ListLongMap!22119)

(assert (=> b!1546176 (= e!860640 call!69458)))

(declare-fun b!1546177 () Bool)

(declare-fun e!860638 () Bool)

(assert (=> b!1546177 (= e!860638 tp_is_empty!37973)))

(declare-fun b!1546178 () Bool)

(declare-fun c!141767 () Bool)

(declare-fun lt!666497 () Bool)

(assert (=> b!1546178 (= c!141767 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666497))))

(assert (=> b!1546178 (= e!860640 e!860639)))

(declare-fun b!1546179 () Bool)

(assert (=> b!1546179 (= e!860635 e!860640)))

(declare-fun c!141765 () Bool)

(assert (=> b!1546179 (= c!141765 (and (not lt!666497) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546180 () Bool)

(assert (=> b!1546180 (= e!860637 (and e!860638 mapRes!58663))))

(declare-fun condMapEmpty!58663 () Bool)

(declare-fun mapDefault!58663 () ValueCell!18076)

