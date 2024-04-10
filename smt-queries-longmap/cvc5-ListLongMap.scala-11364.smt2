; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132088 () Bool)

(assert start!132088)

(declare-fun b_free!31801 () Bool)

(declare-fun b_next!31801 () Bool)

(assert (=> start!132088 (= b_free!31801 (not b_next!31801))))

(declare-fun tp!111654 () Bool)

(declare-fun b_and!51211 () Bool)

(assert (=> start!132088 (= tp!111654 b_and!51211)))

(declare-fun mapIsEmpty!58819 () Bool)

(declare-fun mapRes!58819 () Bool)

(assert (=> mapIsEmpty!58819 mapRes!58819))

(declare-fun bm!70232 () Bool)

(declare-datatypes ((V!59213 0))(
  ( (V!59214 (val!19116 Int)) )
))
(declare-datatypes ((tuple2!24610 0))(
  ( (tuple2!24611 (_1!12316 (_ BitVec 64)) (_2!12316 V!59213)) )
))
(declare-datatypes ((List!36100 0))(
  ( (Nil!36097) (Cons!36096 (h!37541 tuple2!24610) (t!50794 List!36100)) )
))
(declare-datatypes ((ListLongMap!22219 0))(
  ( (ListLongMap!22220 (toList!11125 List!36100)) )
))
(declare-fun call!70237 () ListLongMap!22219)

(declare-fun call!70235 () ListLongMap!22219)

(assert (=> bm!70232 (= call!70237 call!70235)))

(declare-fun b!1548665 () Bool)

(declare-fun res!1061218 () Bool)

(declare-fun e!862036 () Bool)

(assert (=> b!1548665 (=> (not res!1061218) (not e!862036))))

(declare-datatypes ((array!103352 0))(
  ( (array!103353 (arr!49878 (Array (_ BitVec 32) (_ BitVec 64))) (size!50428 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103352)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548665 (= res!1061218 (validKeyInArray!0 (select (arr!49878 _keys!618) from!762)))))

(declare-fun b!1548667 () Bool)

(declare-fun res!1061219 () Bool)

(declare-fun e!862043 () Bool)

(assert (=> b!1548667 (=> (not res!1061219) (not e!862043))))

(assert (=> b!1548667 (= res!1061219 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50428 _keys!618))))))

(declare-fun b!1548668 () Bool)

(declare-fun res!1061221 () Bool)

(assert (=> b!1548668 (=> (not res!1061221) (not e!862043))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103352 (_ BitVec 32)) Bool)

(assert (=> b!1548668 (= res!1061221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58819 () Bool)

(declare-fun tp!111655 () Bool)

(declare-fun e!862040 () Bool)

(assert (=> mapNonEmpty!58819 (= mapRes!58819 (and tp!111655 e!862040))))

(declare-datatypes ((ValueCell!18128 0))(
  ( (ValueCellFull!18128 (v!21917 V!59213)) (EmptyCell!18128) )
))
(declare-fun mapValue!58819 () ValueCell!18128)

(declare-datatypes ((array!103354 0))(
  ( (array!103355 (arr!49879 (Array (_ BitVec 32) ValueCell!18128)) (size!50429 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103354)

(declare-fun mapKey!58819 () (_ BitVec 32))

(declare-fun mapRest!58819 () (Array (_ BitVec 32) ValueCell!18128))

(assert (=> mapNonEmpty!58819 (= (arr!49879 _values!470) (store mapRest!58819 mapKey!58819 mapValue!58819))))

(declare-fun b!1548669 () Bool)

(declare-fun c!142233 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667426 () Bool)

(assert (=> b!1548669 (= c!142233 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667426))))

(declare-fun e!862041 () ListLongMap!22219)

(declare-fun e!862037 () ListLongMap!22219)

(assert (=> b!1548669 (= e!862041 e!862037)))

(declare-fun b!1548670 () Bool)

(declare-fun call!70238 () ListLongMap!22219)

(assert (=> b!1548670 (= e!862037 call!70238)))

(declare-fun b!1548671 () Bool)

(declare-fun tp_is_empty!38077 () Bool)

(assert (=> b!1548671 (= e!862040 tp_is_empty!38077)))

(declare-fun b!1548672 () Bool)

(declare-fun e!862039 () Bool)

(assert (=> b!1548672 (= e!862039 tp_is_empty!38077)))

(declare-fun b!1548673 () Bool)

(assert (=> b!1548673 (= e!862041 call!70237)))

(declare-fun b!1548674 () Bool)

(assert (=> b!1548674 (= e!862036 (not true))))

(declare-fun lt!667424 () V!59213)

(declare-fun lt!667421 () ListLongMap!22219)

(declare-fun apply!1071 (ListLongMap!22219 (_ BitVec 64)) V!59213)

(assert (=> b!1548674 (= (apply!1071 lt!667421 (select (arr!49878 _keys!618) from!762)) lt!667424)))

(declare-fun zeroValue!436 () V!59213)

(declare-datatypes ((Unit!51592 0))(
  ( (Unit!51593) )
))
(declare-fun lt!667419 () Unit!51592)

(declare-fun lt!667425 () ListLongMap!22219)

(declare-fun addApplyDifferent!613 (ListLongMap!22219 (_ BitVec 64) V!59213 (_ BitVec 64)) Unit!51592)

(assert (=> b!1548674 (= lt!667419 (addApplyDifferent!613 lt!667425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49878 _keys!618) from!762)))))

(declare-fun lt!667427 () V!59213)

(assert (=> b!1548674 (= lt!667427 lt!667424)))

(assert (=> b!1548674 (= lt!667424 (apply!1071 lt!667425 (select (arr!49878 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59213)

(declare-fun +!4954 (ListLongMap!22219 tuple2!24610) ListLongMap!22219)

(assert (=> b!1548674 (= lt!667427 (apply!1071 (+!4954 lt!667425 (tuple2!24611 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49878 _keys!618) from!762)))))

(declare-fun lt!667423 () Unit!51592)

(assert (=> b!1548674 (= lt!667423 (addApplyDifferent!613 lt!667425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49878 _keys!618) from!762)))))

(declare-fun contains!10078 (ListLongMap!22219 (_ BitVec 64)) Bool)

(assert (=> b!1548674 (contains!10078 lt!667421 (select (arr!49878 _keys!618) from!762))))

(assert (=> b!1548674 (= lt!667421 (+!4954 lt!667425 (tuple2!24611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667422 () Unit!51592)

(declare-fun addStillContains!1266 (ListLongMap!22219 (_ BitVec 64) V!59213 (_ BitVec 64)) Unit!51592)

(assert (=> b!1548674 (= lt!667422 (addStillContains!1266 lt!667425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49878 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6580 (array!103352 array!103354 (_ BitVec 32) (_ BitVec 32) V!59213 V!59213 (_ BitVec 32) Int) ListLongMap!22219)

(assert (=> b!1548674 (= lt!667425 (getCurrentListMapNoExtraKeys!6580 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548675 () Bool)

(declare-fun e!862038 () ListLongMap!22219)

(assert (=> b!1548675 (= e!862038 e!862041)))

(declare-fun c!142234 () Bool)

(assert (=> b!1548675 (= c!142234 (and (not lt!667426) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548676 () Bool)

(declare-fun res!1061220 () Bool)

(assert (=> b!1548676 (=> (not res!1061220) (not e!862043))))

(declare-datatypes ((List!36101 0))(
  ( (Nil!36098) (Cons!36097 (h!37542 (_ BitVec 64)) (t!50795 List!36101)) )
))
(declare-fun arrayNoDuplicates!0 (array!103352 (_ BitVec 32) List!36101) Bool)

(assert (=> b!1548676 (= res!1061220 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36098))))

(declare-fun b!1548666 () Bool)

(declare-fun e!862042 () Bool)

(assert (=> b!1548666 (= e!862042 (and e!862039 mapRes!58819))))

(declare-fun condMapEmpty!58819 () Bool)

(declare-fun mapDefault!58819 () ValueCell!18128)

