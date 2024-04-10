; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131926 () Bool)

(assert start!131926)

(declare-fun b_free!31639 () Bool)

(declare-fun b_next!31639 () Bool)

(assert (=> start!131926 (= b_free!31639 (not b_next!31639))))

(declare-fun tp!111169 () Bool)

(declare-fun b_and!51049 () Bool)

(assert (=> start!131926 (= tp!111169 b_and!51049)))

(declare-fun b!1544809 () Bool)

(declare-datatypes ((V!58997 0))(
  ( (V!58998 (val!19035 Int)) )
))
(declare-datatypes ((tuple2!24456 0))(
  ( (tuple2!24457 (_1!12239 (_ BitVec 64)) (_2!12239 V!58997)) )
))
(declare-datatypes ((List!35970 0))(
  ( (Nil!35967) (Cons!35966 (h!37411 tuple2!24456) (t!50664 List!35970)) )
))
(declare-datatypes ((ListLongMap!22065 0))(
  ( (ListLongMap!22066 (toList!11048 List!35970)) )
))
(declare-fun e!859869 () ListLongMap!22065)

(declare-fun call!69021 () ListLongMap!22065)

(assert (=> b!1544809 (= e!859869 call!69021)))

(declare-fun bm!69017 () Bool)

(declare-fun call!69022 () ListLongMap!22065)

(declare-fun call!69020 () ListLongMap!22065)

(assert (=> bm!69017 (= call!69022 call!69020)))

(declare-fun b!1544810 () Bool)

(declare-fun e!859868 () ListLongMap!22065)

(declare-fun call!69023 () ListLongMap!22065)

(assert (=> b!1544810 (= e!859868 call!69023)))

(declare-fun bm!69018 () Bool)

(assert (=> bm!69018 (= call!69021 call!69022)))

(declare-fun res!1059551 () Bool)

(declare-fun e!859865 () Bool)

(assert (=> start!131926 (=> (not res!1059551) (not e!859865))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131926 (= res!1059551 (validMask!0 mask!926))))

(assert (=> start!131926 e!859865))

(declare-datatypes ((array!103038 0))(
  ( (array!103039 (arr!49721 (Array (_ BitVec 32) (_ BitVec 64))) (size!50271 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103038)

(declare-fun array_inv!38675 (array!103038) Bool)

(assert (=> start!131926 (array_inv!38675 _keys!618)))

(declare-fun tp_is_empty!37915 () Bool)

(assert (=> start!131926 tp_is_empty!37915))

(assert (=> start!131926 true))

(assert (=> start!131926 tp!111169))

(declare-datatypes ((ValueCell!18047 0))(
  ( (ValueCellFull!18047 (v!21836 V!58997)) (EmptyCell!18047) )
))
(declare-datatypes ((array!103040 0))(
  ( (array!103041 (arr!49722 (Array (_ BitVec 32) ValueCell!18047)) (size!50272 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103040)

(declare-fun e!859872 () Bool)

(declare-fun array_inv!38676 (array!103040) Bool)

(assert (=> start!131926 (and (array_inv!38676 _values!470) e!859872)))

(declare-fun b!1544811 () Bool)

(declare-fun res!1059549 () Bool)

(assert (=> b!1544811 (=> (not res!1059549) (not e!859865))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544811 (= res!1059549 (and (= (size!50272 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50271 _keys!618) (size!50272 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69019 () Bool)

(declare-fun zeroValue!436 () V!58997)

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!58997)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6518 (array!103038 array!103040 (_ BitVec 32) (_ BitVec 32) V!58997 V!58997 (_ BitVec 32) Int) ListLongMap!22065)

(assert (=> bm!69019 (= call!69020 (getCurrentListMapNoExtraKeys!6518 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun c!141504 () Bool)

(declare-fun call!69024 () ListLongMap!22065)

(declare-fun c!141505 () Bool)

(declare-fun bm!69020 () Bool)

(declare-fun +!4884 (ListLongMap!22065 tuple2!24456) ListLongMap!22065)

(assert (=> bm!69020 (= call!69024 (+!4884 (ite c!141504 call!69020 (ite c!141505 call!69022 call!69021)) (ite (or c!141504 c!141505) (tuple2!24457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544812 () Bool)

(declare-fun e!859866 () Bool)

(assert (=> b!1544812 (= e!859866 tp_is_empty!37915)))

(declare-fun b!1544813 () Bool)

(declare-fun e!859871 () Bool)

(declare-fun mapRes!58576 () Bool)

(assert (=> b!1544813 (= e!859872 (and e!859871 mapRes!58576))))

(declare-fun condMapEmpty!58576 () Bool)

(declare-fun mapDefault!58576 () ValueCell!18047)

