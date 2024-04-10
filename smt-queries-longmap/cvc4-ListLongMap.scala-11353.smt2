; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132026 () Bool)

(assert start!132026)

(declare-fun b_free!31739 () Bool)

(declare-fun b_next!31739 () Bool)

(assert (=> start!132026 (= b_free!31739 (not b_next!31739))))

(declare-fun tp!111469 () Bool)

(declare-fun b_and!51149 () Bool)

(assert (=> start!132026 (= tp!111469 b_and!51149)))

(declare-fun b!1547177 () Bool)

(declare-fun e!861202 () Bool)

(declare-fun tp_is_empty!38015 () Bool)

(assert (=> b!1547177 (= e!861202 tp_is_empty!38015)))

(declare-fun b!1547178 () Bool)

(declare-datatypes ((V!59129 0))(
  ( (V!59130 (val!19085 Int)) )
))
(declare-datatypes ((tuple2!24550 0))(
  ( (tuple2!24551 (_1!12286 (_ BitVec 64)) (_2!12286 V!59129)) )
))
(declare-datatypes ((List!36050 0))(
  ( (Nil!36047) (Cons!36046 (h!37491 tuple2!24550) (t!50744 List!36050)) )
))
(declare-datatypes ((ListLongMap!22159 0))(
  ( (ListLongMap!22160 (toList!11095 List!36050)) )
))
(declare-fun e!861203 () ListLongMap!22159)

(declare-fun e!861207 () ListLongMap!22159)

(assert (=> b!1547178 (= e!861203 e!861207)))

(declare-fun c!141954 () Bool)

(declare-fun lt!666797 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547178 (= c!141954 (and (not lt!666797) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547179 () Bool)

(declare-fun c!141955 () Bool)

(assert (=> b!1547179 (= c!141955 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666797))))

(declare-fun e!861204 () ListLongMap!22159)

(assert (=> b!1547179 (= e!861207 e!861204)))

(declare-fun b!1547180 () Bool)

(declare-fun e!861205 () Bool)

(assert (=> b!1547180 (= e!861205 tp_is_empty!38015)))

(declare-fun b!1547181 () Bool)

(declare-fun res!1060569 () Bool)

(declare-fun e!861201 () Bool)

(assert (=> b!1547181 (=> (not res!1060569) (not e!861201))))

(declare-datatypes ((array!103230 0))(
  ( (array!103231 (arr!49817 (Array (_ BitVec 32) (_ BitVec 64))) (size!50367 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103230)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18097 0))(
  ( (ValueCellFull!18097 (v!21886 V!59129)) (EmptyCell!18097) )
))
(declare-datatypes ((array!103232 0))(
  ( (array!103233 (arr!49818 (Array (_ BitVec 32) ValueCell!18097)) (size!50368 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103232)

(assert (=> b!1547181 (= res!1060569 (and (= (size!50368 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50367 _keys!618) (size!50368 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1060570 () Bool)

(assert (=> start!132026 (=> (not res!1060570) (not e!861201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132026 (= res!1060570 (validMask!0 mask!926))))

(assert (=> start!132026 e!861201))

(declare-fun array_inv!38745 (array!103230) Bool)

(assert (=> start!132026 (array_inv!38745 _keys!618)))

(assert (=> start!132026 tp_is_empty!38015))

(assert (=> start!132026 true))

(assert (=> start!132026 tp!111469))

(declare-fun e!861199 () Bool)

(declare-fun array_inv!38746 (array!103232) Bool)

(assert (=> start!132026 (and (array_inv!38746 _values!470) e!861199)))

(declare-fun b!1547182 () Bool)

(declare-fun res!1060567 () Bool)

(assert (=> b!1547182 (=> (not res!1060567) (not e!861201))))

(declare-datatypes ((List!36051 0))(
  ( (Nil!36048) (Cons!36047 (h!37492 (_ BitVec 64)) (t!50745 List!36051)) )
))
(declare-fun arrayNoDuplicates!0 (array!103230 (_ BitVec 32) List!36051) Bool)

(assert (=> b!1547182 (= res!1060567 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36048))))

(declare-fun b!1547183 () Bool)

(declare-fun res!1060571 () Bool)

(assert (=> b!1547183 (=> (not res!1060571) (not e!861201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103230 (_ BitVec 32)) Bool)

(assert (=> b!1547183 (= res!1060571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun zeroValue!436 () V!59129)

(declare-fun call!69773 () ListLongMap!22159)

(declare-fun call!69771 () ListLongMap!22159)

(declare-fun call!69770 () ListLongMap!22159)

(declare-fun bm!69767 () Bool)

(declare-fun minValue!436 () V!59129)

(declare-fun c!141956 () Bool)

(declare-fun call!69772 () ListLongMap!22159)

(declare-fun +!4926 (ListLongMap!22159 tuple2!24550) ListLongMap!22159)

(assert (=> bm!69767 (= call!69772 (+!4926 (ite c!141956 call!69771 (ite c!141954 call!69770 call!69773)) (ite (or c!141956 c!141954) (tuple2!24551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547184 () Bool)

(declare-fun e!861200 () Bool)

(assert (=> b!1547184 (= e!861200 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666794 () ListLongMap!22159)

(declare-fun apply!1048 (ListLongMap!22159 (_ BitVec 64)) V!59129)

(assert (=> b!1547184 (= (apply!1048 (+!4926 lt!666794 (tuple2!24551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49817 _keys!618) from!762)) (apply!1048 lt!666794 (select (arr!49817 _keys!618) from!762)))))

(declare-datatypes ((Unit!51546 0))(
  ( (Unit!51547) )
))
(declare-fun lt!666793 () Unit!51546)

(declare-fun addApplyDifferent!590 (ListLongMap!22159 (_ BitVec 64) V!59129 (_ BitVec 64)) Unit!51546)

(assert (=> b!1547184 (= lt!666793 (addApplyDifferent!590 lt!666794 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49817 _keys!618) from!762)))))

(declare-fun contains!10055 (ListLongMap!22159 (_ BitVec 64)) Bool)

(assert (=> b!1547184 (contains!10055 (+!4926 lt!666794 (tuple2!24551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49817 _keys!618) from!762))))

(declare-fun lt!666795 () Unit!51546)

(declare-fun addStillContains!1243 (ListLongMap!22159 (_ BitVec 64) V!59129 (_ BitVec 64)) Unit!51546)

(assert (=> b!1547184 (= lt!666795 (addStillContains!1243 lt!666794 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49817 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6555 (array!103230 array!103232 (_ BitVec 32) (_ BitVec 32) V!59129 V!59129 (_ BitVec 32) Int) ListLongMap!22159)

(assert (=> b!1547184 (= lt!666794 (getCurrentListMapNoExtraKeys!6555 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547185 () Bool)

(declare-fun mapRes!58726 () Bool)

(assert (=> b!1547185 (= e!861199 (and e!861205 mapRes!58726))))

(declare-fun condMapEmpty!58726 () Bool)

(declare-fun mapDefault!58726 () ValueCell!18097)

