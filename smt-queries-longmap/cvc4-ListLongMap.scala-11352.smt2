; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132020 () Bool)

(assert start!132020)

(declare-fun b_free!31733 () Bool)

(declare-fun b_next!31733 () Bool)

(assert (=> start!132020 (= b_free!31733 (not b_next!31733))))

(declare-fun tp!111451 () Bool)

(declare-fun b_and!51143 () Bool)

(assert (=> start!132020 (= tp!111451 b_and!51143)))

(declare-fun b!1547033 () Bool)

(declare-fun res!1060504 () Bool)

(declare-fun e!861120 () Bool)

(assert (=> b!1547033 (=> (not res!1060504) (not e!861120))))

(declare-datatypes ((array!103218 0))(
  ( (array!103219 (arr!49811 (Array (_ BitVec 32) (_ BitVec 64))) (size!50361 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103218)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103218 (_ BitVec 32)) Bool)

(assert (=> b!1547033 (= res!1060504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69722 () Bool)

(declare-datatypes ((V!59121 0))(
  ( (V!59122 (val!19082 Int)) )
))
(declare-datatypes ((tuple2!24544 0))(
  ( (tuple2!24545 (_1!12283 (_ BitVec 64)) (_2!12283 V!59121)) )
))
(declare-datatypes ((List!36045 0))(
  ( (Nil!36042) (Cons!36041 (h!37486 tuple2!24544) (t!50739 List!36045)) )
))
(declare-datatypes ((ListLongMap!22153 0))(
  ( (ListLongMap!22154 (toList!11092 List!36045)) )
))
(declare-fun call!69727 () ListLongMap!22153)

(declare-fun call!69725 () ListLongMap!22153)

(assert (=> bm!69722 (= call!69727 call!69725)))

(declare-fun b!1547034 () Bool)

(declare-fun e!861121 () Bool)

(declare-fun tp_is_empty!38009 () Bool)

(assert (=> b!1547034 (= e!861121 tp_is_empty!38009)))

(declare-fun b!1547035 () Bool)

(declare-fun e!861124 () ListLongMap!22153)

(assert (=> b!1547035 (= e!861124 call!69727)))

(declare-fun b!1547036 () Bool)

(declare-fun e!861125 () Bool)

(assert (=> b!1547036 (= e!861125 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666752 () ListLongMap!22153)

(declare-fun minValue!436 () V!59121)

(declare-fun apply!1046 (ListLongMap!22153 (_ BitVec 64)) V!59121)

(declare-fun +!4924 (ListLongMap!22153 tuple2!24544) ListLongMap!22153)

(assert (=> b!1547036 (= (apply!1046 (+!4924 lt!666752 (tuple2!24545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49811 _keys!618) from!762)) (apply!1046 lt!666752 (select (arr!49811 _keys!618) from!762)))))

(declare-datatypes ((Unit!51542 0))(
  ( (Unit!51543) )
))
(declare-fun lt!666750 () Unit!51542)

(declare-fun addApplyDifferent!588 (ListLongMap!22153 (_ BitVec 64) V!59121 (_ BitVec 64)) Unit!51542)

(assert (=> b!1547036 (= lt!666750 (addApplyDifferent!588 lt!666752 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49811 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59121)

(declare-fun contains!10053 (ListLongMap!22153 (_ BitVec 64)) Bool)

(assert (=> b!1547036 (contains!10053 (+!4924 lt!666752 (tuple2!24545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49811 _keys!618) from!762))))

(declare-fun lt!666749 () Unit!51542)

(declare-fun addStillContains!1241 (ListLongMap!22153 (_ BitVec 64) V!59121 (_ BitVec 64)) Unit!51542)

(assert (=> b!1547036 (= lt!666749 (addStillContains!1241 lt!666752 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49811 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((ValueCell!18094 0))(
  ( (ValueCellFull!18094 (v!21883 V!59121)) (EmptyCell!18094) )
))
(declare-datatypes ((array!103220 0))(
  ( (array!103221 (arr!49812 (Array (_ BitVec 32) ValueCell!18094)) (size!50362 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103220)

(declare-fun getCurrentListMapNoExtraKeys!6553 (array!103218 array!103220 (_ BitVec 32) (_ BitVec 32) V!59121 V!59121 (_ BitVec 32) Int) ListLongMap!22153)

(assert (=> b!1547036 (= lt!666752 (getCurrentListMapNoExtraKeys!6553 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547037 () Bool)

(declare-fun res!1060507 () Bool)

(assert (=> b!1547037 (=> (not res!1060507) (not e!861120))))

(declare-datatypes ((List!36046 0))(
  ( (Nil!36043) (Cons!36042 (h!37487 (_ BitVec 64)) (t!50740 List!36046)) )
))
(declare-fun arrayNoDuplicates!0 (array!103218 (_ BitVec 32) List!36046) Bool)

(assert (=> b!1547037 (= res!1060507 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36043))))

(declare-fun bm!69724 () Bool)

(declare-fun call!69729 () ListLongMap!22153)

(declare-fun call!69728 () ListLongMap!22153)

(assert (=> bm!69724 (= call!69729 call!69728)))

(declare-fun mapNonEmpty!58717 () Bool)

(declare-fun mapRes!58717 () Bool)

(declare-fun tp!111450 () Bool)

(assert (=> mapNonEmpty!58717 (= mapRes!58717 (and tp!111450 e!861121))))

(declare-fun mapValue!58717 () ValueCell!18094)

(declare-fun mapKey!58717 () (_ BitVec 32))

(declare-fun mapRest!58717 () (Array (_ BitVec 32) ValueCell!18094))

(assert (=> mapNonEmpty!58717 (= (arr!49812 _values!470) (store mapRest!58717 mapKey!58717 mapValue!58717))))

(declare-fun b!1547038 () Bool)

(declare-fun e!861119 () ListLongMap!22153)

(assert (=> b!1547038 (= e!861119 (+!4924 call!69725 (tuple2!24545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547039 () Bool)

(assert (=> b!1547039 (= e!861120 e!861125)))

(declare-fun res!1060509 () Bool)

(assert (=> b!1547039 (=> (not res!1060509) (not e!861125))))

(assert (=> b!1547039 (= res!1060509 (bvslt from!762 (size!50361 _keys!618)))))

(declare-fun lt!666748 () ListLongMap!22153)

(assert (=> b!1547039 (= lt!666748 e!861119)))

(declare-fun c!141927 () Bool)

(declare-fun lt!666751 () Bool)

(assert (=> b!1547039 (= c!141927 (and (not lt!666751) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547039 (= lt!666751 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547040 () Bool)

(declare-fun e!861118 () ListLongMap!22153)

(declare-fun call!69726 () ListLongMap!22153)

(assert (=> b!1547040 (= e!861118 call!69726)))

(declare-fun c!141928 () Bool)

(declare-fun bm!69725 () Bool)

(assert (=> bm!69725 (= call!69725 (+!4924 (ite c!141927 call!69728 (ite c!141928 call!69729 call!69726)) (ite (or c!141927 c!141928) (tuple2!24545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547041 () Bool)

(declare-fun e!861122 () Bool)

(declare-fun e!861123 () Bool)

(assert (=> b!1547041 (= e!861122 (and e!861123 mapRes!58717))))

(declare-fun condMapEmpty!58717 () Bool)

(declare-fun mapDefault!58717 () ValueCell!18094)

