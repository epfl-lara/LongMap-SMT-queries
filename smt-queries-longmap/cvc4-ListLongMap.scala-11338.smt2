; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131936 () Bool)

(assert start!131936)

(declare-fun b_free!31649 () Bool)

(declare-fun b_next!31649 () Bool)

(assert (=> start!131936 (= b_free!31649 (not b_next!31649))))

(declare-fun tp!111199 () Bool)

(declare-fun b_and!51059 () Bool)

(assert (=> start!131936 (= tp!111199 b_and!51059)))

(declare-datatypes ((V!59009 0))(
  ( (V!59010 (val!19040 Int)) )
))
(declare-fun zeroValue!436 () V!59009)

(declare-datatypes ((tuple2!24464 0))(
  ( (tuple2!24465 (_1!12243 (_ BitVec 64)) (_2!12243 V!59009)) )
))
(declare-datatypes ((List!35976 0))(
  ( (Nil!35973) (Cons!35972 (h!37417 tuple2!24464) (t!50670 List!35976)) )
))
(declare-datatypes ((ListLongMap!22073 0))(
  ( (ListLongMap!22074 (toList!11052 List!35976)) )
))
(declare-fun call!69097 () ListLongMap!22073)

(declare-fun c!141551 () Bool)

(declare-fun c!141549 () Bool)

(declare-fun call!69096 () ListLongMap!22073)

(declare-fun call!69098 () ListLongMap!22073)

(declare-fun minValue!436 () V!59009)

(declare-fun call!69099 () ListLongMap!22073)

(declare-fun bm!69092 () Bool)

(declare-fun +!4888 (ListLongMap!22073 tuple2!24464) ListLongMap!22073)

(assert (=> bm!69092 (= call!69098 (+!4888 (ite c!141549 call!69097 (ite c!141551 call!69096 call!69099)) (ite (or c!141549 c!141551) (tuple2!24465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24465 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545019 () Bool)

(declare-fun e!859992 () ListLongMap!22073)

(declare-fun e!859990 () ListLongMap!22073)

(assert (=> b!1545019 (= e!859992 e!859990)))

(declare-fun lt!666221 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545019 (= c!141551 (and (not lt!666221) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58591 () Bool)

(declare-fun mapRes!58591 () Bool)

(declare-fun tp!111198 () Bool)

(declare-fun e!859985 () Bool)

(assert (=> mapNonEmpty!58591 (= mapRes!58591 (and tp!111198 e!859985))))

(declare-fun mapKey!58591 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18052 0))(
  ( (ValueCellFull!18052 (v!21841 V!59009)) (EmptyCell!18052) )
))
(declare-fun mapRest!58591 () (Array (_ BitVec 32) ValueCell!18052))

(declare-datatypes ((array!103058 0))(
  ( (array!103059 (arr!49731 (Array (_ BitVec 32) ValueCell!18052)) (size!50281 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103058)

(declare-fun mapValue!58591 () ValueCell!18052)

(assert (=> mapNonEmpty!58591 (= (arr!49731 _values!470) (store mapRest!58591 mapKey!58591 mapValue!58591))))

(declare-fun bm!69093 () Bool)

(assert (=> bm!69093 (= call!69099 call!69096)))

(declare-fun res!1059625 () Bool)

(declare-fun e!859986 () Bool)

(assert (=> start!131936 (=> (not res!1059625) (not e!859986))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131936 (= res!1059625 (validMask!0 mask!926))))

(assert (=> start!131936 e!859986))

(declare-datatypes ((array!103060 0))(
  ( (array!103061 (arr!49732 (Array (_ BitVec 32) (_ BitVec 64))) (size!50282 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103060)

(declare-fun array_inv!38683 (array!103060) Bool)

(assert (=> start!131936 (array_inv!38683 _keys!618)))

(declare-fun tp_is_empty!37925 () Bool)

(assert (=> start!131936 tp_is_empty!37925))

(assert (=> start!131936 true))

(assert (=> start!131936 tp!111199))

(declare-fun e!859989 () Bool)

(declare-fun array_inv!38684 (array!103058) Bool)

(assert (=> start!131936 (and (array_inv!38684 _values!470) e!859989)))

(declare-fun bm!69094 () Bool)

(assert (=> bm!69094 (= call!69096 call!69097)))

(declare-fun b!1545020 () Bool)

(declare-fun e!859988 () Bool)

(assert (=> b!1545020 (= e!859988 tp_is_empty!37925)))

(declare-fun b!1545021 () Bool)

(declare-fun res!1059624 () Bool)

(assert (=> b!1545021 (=> (not res!1059624) (not e!859986))))

(declare-datatypes ((List!35977 0))(
  ( (Nil!35974) (Cons!35973 (h!37418 (_ BitVec 64)) (t!50671 List!35977)) )
))
(declare-fun arrayNoDuplicates!0 (array!103060 (_ BitVec 32) List!35977) Bool)

(assert (=> b!1545021 (= res!1059624 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35974))))

(declare-fun b!1545022 () Bool)

(assert (=> b!1545022 (= e!859989 (and e!859988 mapRes!58591))))

(declare-fun condMapEmpty!58591 () Bool)

(declare-fun mapDefault!58591 () ValueCell!18052)

