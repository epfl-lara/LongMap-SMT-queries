; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131938 () Bool)

(assert start!131938)

(declare-fun b_free!31651 () Bool)

(declare-fun b_next!31651 () Bool)

(assert (=> start!131938 (= b_free!31651 (not b_next!31651))))

(declare-fun tp!111204 () Bool)

(declare-fun b_and!51061 () Bool)

(assert (=> start!131938 (= tp!111204 b_and!51061)))

(declare-fun b!1545065 () Bool)

(declare-fun e!860013 () Bool)

(assert (=> b!1545065 (= e!860013 false)))

(declare-datatypes ((array!103062 0))(
  ( (array!103063 (arr!49733 (Array (_ BitVec 32) (_ BitVec 64))) (size!50283 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103062)

(declare-datatypes ((V!59013 0))(
  ( (V!59014 (val!19041 Int)) )
))
(declare-fun zeroValue!436 () V!59013)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18053 0))(
  ( (ValueCellFull!18053 (v!21842 V!59013)) (EmptyCell!18053) )
))
(declare-datatypes ((array!103064 0))(
  ( (array!103065 (arr!49734 (Array (_ BitVec 32) ValueCell!18053)) (size!50284 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103064)

(declare-fun minValue!436 () V!59013)

(declare-fun lt!666230 () Bool)

(declare-datatypes ((tuple2!24466 0))(
  ( (tuple2!24467 (_1!12244 (_ BitVec 64)) (_2!12244 V!59013)) )
))
(declare-datatypes ((List!35978 0))(
  ( (Nil!35975) (Cons!35974 (h!37419 tuple2!24466) (t!50672 List!35978)) )
))
(declare-datatypes ((ListLongMap!22075 0))(
  ( (ListLongMap!22076 (toList!11053 List!35978)) )
))
(declare-fun contains!10026 (ListLongMap!22075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6522 (array!103062 array!103064 (_ BitVec 32) (_ BitVec 32) V!59013 V!59013 (_ BitVec 32) Int) ListLongMap!22075)

(assert (=> b!1545065 (= lt!666230 (contains!10026 (getCurrentListMapNoExtraKeys!6522 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49733 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58594 () Bool)

(declare-fun mapRes!58594 () Bool)

(assert (=> mapIsEmpty!58594 mapRes!58594))

(declare-fun call!69111 () ListLongMap!22075)

(declare-fun c!141558 () Bool)

(declare-fun call!69114 () ListLongMap!22075)

(declare-fun c!141560 () Bool)

(declare-fun bm!69107 () Bool)

(declare-fun call!69110 () ListLongMap!22075)

(declare-fun call!69112 () ListLongMap!22075)

(declare-fun +!4889 (ListLongMap!22075 tuple2!24466) ListLongMap!22075)

(assert (=> bm!69107 (= call!69111 (+!4889 (ite c!141560 call!69112 (ite c!141558 call!69110 call!69114)) (ite (or c!141560 c!141558) (tuple2!24467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545066 () Bool)

(declare-fun e!860012 () Bool)

(assert (=> b!1545066 (= e!860012 e!860013)))

(declare-fun res!1059643 () Bool)

(assert (=> b!1545066 (=> (not res!1059643) (not e!860013))))

(assert (=> b!1545066 (= res!1059643 (bvslt from!762 (size!50283 _keys!618)))))

(declare-fun lt!666228 () ListLongMap!22075)

(declare-fun e!860014 () ListLongMap!22075)

(assert (=> b!1545066 (= lt!666228 e!860014)))

(declare-fun lt!666229 () Bool)

(assert (=> b!1545066 (= c!141560 (and (not lt!666229) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545066 (= lt!666229 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545067 () Bool)

(declare-fun e!860015 () ListLongMap!22075)

(declare-fun call!69113 () ListLongMap!22075)

(assert (=> b!1545067 (= e!860015 call!69113)))

(declare-fun b!1545068 () Bool)

(assert (=> b!1545068 (= e!860014 (+!4889 call!69111 (tuple2!24467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545069 () Bool)

(declare-fun res!1059647 () Bool)

(assert (=> b!1545069 (=> (not res!1059647) (not e!860012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103062 (_ BitVec 32)) Bool)

(assert (=> b!1545069 (= res!1059647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545070 () Bool)

(declare-fun res!1059644 () Bool)

(assert (=> b!1545070 (=> (not res!1059644) (not e!860013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545070 (= res!1059644 (validKeyInArray!0 (select (arr!49733 _keys!618) from!762)))))

(declare-fun b!1545071 () Bool)

(declare-fun e!860011 () Bool)

(declare-fun e!860017 () Bool)

(assert (=> b!1545071 (= e!860011 (and e!860017 mapRes!58594))))

(declare-fun condMapEmpty!58594 () Bool)

(declare-fun mapDefault!58594 () ValueCell!18053)

