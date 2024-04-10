; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132128 () Bool)

(assert start!132128)

(declare-fun b_free!31841 () Bool)

(declare-fun b_next!31841 () Bool)

(assert (=> start!132128 (= b_free!31841 (not b_next!31841))))

(declare-fun tp!111775 () Bool)

(declare-fun b_and!51251 () Bool)

(assert (=> start!132128 (= tp!111775 b_and!51251)))

(declare-fun bm!70532 () Bool)

(declare-datatypes ((V!59265 0))(
  ( (V!59266 (val!19136 Int)) )
))
(declare-datatypes ((tuple2!24650 0))(
  ( (tuple2!24651 (_1!12336 (_ BitVec 64)) (_2!12336 V!59265)) )
))
(declare-datatypes ((List!36134 0))(
  ( (Nil!36131) (Cons!36130 (h!37575 tuple2!24650) (t!50828 List!36134)) )
))
(declare-datatypes ((ListLongMap!22259 0))(
  ( (ListLongMap!22260 (toList!11145 List!36134)) )
))
(declare-fun call!70535 () ListLongMap!22259)

(declare-fun call!70538 () ListLongMap!22259)

(assert (=> bm!70532 (= call!70535 call!70538)))

(declare-fun bm!70533 () Bool)

(declare-fun call!70537 () ListLongMap!22259)

(declare-fun call!70536 () ListLongMap!22259)

(assert (=> bm!70533 (= call!70537 call!70536)))

(declare-fun b!1549641 () Bool)

(declare-fun e!862598 () ListLongMap!22259)

(assert (=> b!1549641 (= e!862598 call!70535)))

(declare-fun b!1549642 () Bool)

(declare-fun e!862592 () ListLongMap!22259)

(assert (=> b!1549642 (= e!862592 call!70537)))

(declare-datatypes ((array!103430 0))(
  ( (array!103431 (arr!49917 (Array (_ BitVec 32) (_ BitVec 64))) (size!50467 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103430)

(declare-fun zeroValue!436 () V!59265)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70534 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18148 0))(
  ( (ValueCellFull!18148 (v!21937 V!59265)) (EmptyCell!18148) )
))
(declare-datatypes ((array!103432 0))(
  ( (array!103433 (arr!49918 (Array (_ BitVec 32) ValueCell!18148)) (size!50468 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103432)

(declare-fun minValue!436 () V!59265)

(declare-fun call!70539 () ListLongMap!22259)

(declare-fun getCurrentListMapNoExtraKeys!6596 (array!103430 array!103432 (_ BitVec 32) (_ BitVec 32) V!59265 V!59265 (_ BitVec 32) Int) ListLongMap!22259)

(assert (=> bm!70534 (= call!70539 (getCurrentListMapNoExtraKeys!6596 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549643 () Bool)

(declare-fun res!1061641 () Bool)

(declare-fun e!862594 () Bool)

(assert (=> b!1549643 (=> (not res!1061641) (not e!862594))))

(assert (=> b!1549643 (= res!1061641 (and (= (size!50468 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50467 _keys!618) (size!50468 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549644 () Bool)

(declare-fun c!142422 () Bool)

(declare-fun lt!668000 () Bool)

(assert (=> b!1549644 (= c!142422 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668000))))

(assert (=> b!1549644 (= e!862598 e!862592)))

(declare-fun b!1549645 () Bool)

(declare-datatypes ((Unit!51622 0))(
  ( (Unit!51623) )
))
(declare-fun e!862599 () Unit!51622)

(declare-fun Unit!51624 () Unit!51622)

(assert (=> b!1549645 (= e!862599 Unit!51624)))

(declare-fun b!1549646 () Bool)

(declare-fun e!862596 () ListLongMap!22259)

(assert (=> b!1549646 (= e!862596 e!862598)))

(declare-fun c!142424 () Bool)

(assert (=> b!1549646 (= c!142424 (and (not lt!668000) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549647 () Bool)

(declare-fun e!862593 () Bool)

(declare-fun tp_is_empty!38117 () Bool)

(assert (=> b!1549647 (= e!862593 tp_is_empty!38117)))

(declare-fun b!1549648 () Bool)

(declare-fun e!862595 () Bool)

(assert (=> b!1549648 (= e!862594 e!862595)))

(declare-fun res!1061640 () Bool)

(assert (=> b!1549648 (=> (not res!1061640) (not e!862595))))

(declare-fun lt!667998 () Bool)

(assert (=> b!1549648 (= res!1061640 (not lt!667998))))

(declare-fun lt!667995 () Unit!51622)

(assert (=> b!1549648 (= lt!667995 e!862599)))

(declare-fun c!142423 () Bool)

(assert (=> b!1549648 (= c!142423 (not lt!667998))))

(declare-fun e!862602 () Bool)

(assert (=> b!1549648 (= lt!667998 e!862602)))

(declare-fun res!1061639 () Bool)

(assert (=> b!1549648 (=> res!1061639 e!862602)))

(assert (=> b!1549648 (= res!1061639 (bvsge from!762 (size!50467 _keys!618)))))

(declare-fun lt!667994 () ListLongMap!22259)

(assert (=> b!1549648 (= lt!667994 e!862596)))

(declare-fun c!142421 () Bool)

(assert (=> b!1549648 (= c!142421 (and (not lt!668000) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549648 (= lt!668000 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549649 () Bool)

(declare-fun lt!667999 () Unit!51622)

(assert (=> b!1549649 (= e!862599 lt!667999)))

(declare-fun lt!667993 () ListLongMap!22259)

(assert (=> b!1549649 (= lt!667993 (getCurrentListMapNoExtraKeys!6596 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!667996 () Unit!51622)

(declare-fun addStillContains!1279 (ListLongMap!22259 (_ BitVec 64) V!59265 (_ BitVec 64)) Unit!51622)

(assert (=> b!1549649 (= lt!667996 (addStillContains!1279 lt!667993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49917 _keys!618) from!762)))))

(declare-fun lt!667997 () ListLongMap!22259)

(declare-fun +!4971 (ListLongMap!22259 tuple2!24650) ListLongMap!22259)

(assert (=> b!1549649 (= lt!667997 (+!4971 lt!667993 (tuple2!24651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10091 (ListLongMap!22259 (_ BitVec 64)) Bool)

(assert (=> b!1549649 (contains!10091 lt!667997 (select (arr!49917 _keys!618) from!762))))

(declare-fun addApplyDifferent!626 (ListLongMap!22259 (_ BitVec 64) V!59265 (_ BitVec 64)) Unit!51622)

(assert (=> b!1549649 (= lt!667999 (addApplyDifferent!626 lt!667993 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49917 _keys!618) from!762)))))

(declare-fun lt!668002 () V!59265)

(declare-fun apply!1084 (ListLongMap!22259 (_ BitVec 64)) V!59265)

(assert (=> b!1549649 (= lt!668002 (apply!1084 (+!4971 lt!667993 (tuple2!24651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49917 _keys!618) from!762)))))

(declare-fun lt!668003 () V!59265)

(assert (=> b!1549649 (= lt!668003 (apply!1084 lt!667993 (select (arr!49917 _keys!618) from!762)))))

(assert (=> b!1549649 (= lt!668002 lt!668003)))

(declare-fun lt!668001 () Unit!51622)

(assert (=> b!1549649 (= lt!668001 (addApplyDifferent!626 lt!667993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49917 _keys!618) from!762)))))

(assert (=> b!1549649 (= (apply!1084 lt!667997 (select (arr!49917 _keys!618) from!762)) lt!668003)))

(declare-fun b!1549650 () Bool)

(assert (=> b!1549650 (= e!862596 (+!4971 call!70538 (tuple2!24651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58879 () Bool)

(declare-fun mapRes!58879 () Bool)

(assert (=> mapIsEmpty!58879 mapRes!58879))

(declare-fun b!1549651 () Bool)

(declare-fun e!862597 () Bool)

(assert (=> b!1549651 (= e!862597 tp_is_empty!38117)))

(declare-fun b!1549652 () Bool)

(assert (=> b!1549652 (= e!862592 call!70535)))

(declare-fun b!1549653 () Bool)

(declare-fun res!1061643 () Bool)

(assert (=> b!1549653 (=> (not res!1061643) (not e!862594))))

(assert (=> b!1549653 (= res!1061643 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50467 _keys!618))))))

(declare-fun bm!70535 () Bool)

(assert (=> bm!70535 (= call!70536 call!70539)))

(declare-fun b!1549654 () Bool)

(declare-fun res!1061638 () Bool)

(assert (=> b!1549654 (=> (not res!1061638) (not e!862594))))

(declare-datatypes ((List!36135 0))(
  ( (Nil!36132) (Cons!36131 (h!37576 (_ BitVec 64)) (t!50829 List!36135)) )
))
(declare-fun arrayNoDuplicates!0 (array!103430 (_ BitVec 32) List!36135) Bool)

(assert (=> b!1549654 (= res!1061638 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36132))))

(declare-fun b!1549655 () Bool)

(assert (=> b!1549655 (= e!862595 false)))

(declare-fun lt!667992 () Bool)

(assert (=> b!1549655 (= lt!667992 (contains!10091 lt!667994 (select (arr!49917 _keys!618) from!762)))))

(declare-fun b!1549656 () Bool)

(declare-fun res!1061637 () Bool)

(assert (=> b!1549656 (=> (not res!1061637) (not e!862594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103430 (_ BitVec 32)) Bool)

(assert (=> b!1549656 (= res!1061637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1061642 () Bool)

(assert (=> start!132128 (=> (not res!1061642) (not e!862594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132128 (= res!1061642 (validMask!0 mask!926))))

(assert (=> start!132128 e!862594))

(declare-fun array_inv!38807 (array!103430) Bool)

(assert (=> start!132128 (array_inv!38807 _keys!618)))

(assert (=> start!132128 tp_is_empty!38117))

(assert (=> start!132128 true))

(assert (=> start!132128 tp!111775))

(declare-fun e!862601 () Bool)

(declare-fun array_inv!38808 (array!103432) Bool)

(assert (=> start!132128 (and (array_inv!38808 _values!470) e!862601)))

(declare-fun b!1549657 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549657 (= e!862602 (not (validKeyInArray!0 (select (arr!49917 _keys!618) from!762))))))

(declare-fun b!1549658 () Bool)

(assert (=> b!1549658 (= e!862601 (and e!862597 mapRes!58879))))

(declare-fun condMapEmpty!58879 () Bool)

(declare-fun mapDefault!58879 () ValueCell!18148)

