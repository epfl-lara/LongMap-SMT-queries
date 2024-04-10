; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131966 () Bool)

(assert start!131966)

(declare-fun b_free!31679 () Bool)

(declare-fun b_next!31679 () Bool)

(assert (=> start!131966 (= b_free!31679 (not b_next!31679))))

(declare-fun tp!111289 () Bool)

(declare-fun b_and!51089 () Bool)

(assert (=> start!131966 (= tp!111289 b_and!51089)))

(declare-fun b!1545737 () Bool)

(declare-fun c!141685 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666389 () Bool)

(assert (=> b!1545737 (= c!141685 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666389))))

(declare-datatypes ((V!59049 0))(
  ( (V!59050 (val!19055 Int)) )
))
(declare-datatypes ((tuple2!24492 0))(
  ( (tuple2!24493 (_1!12257 (_ BitVec 64)) (_2!12257 V!59049)) )
))
(declare-datatypes ((List!36001 0))(
  ( (Nil!35998) (Cons!35997 (h!37442 tuple2!24492) (t!50695 List!36001)) )
))
(declare-datatypes ((ListLongMap!22101 0))(
  ( (ListLongMap!22102 (toList!11066 List!36001)) )
))
(declare-fun e!860391 () ListLongMap!22101)

(declare-fun e!860393 () ListLongMap!22101)

(assert (=> b!1545737 (= e!860391 e!860393)))

(declare-fun res!1059941 () Bool)

(declare-fun e!860396 () Bool)

(assert (=> start!131966 (=> (not res!1059941) (not e!860396))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131966 (= res!1059941 (validMask!0 mask!926))))

(assert (=> start!131966 e!860396))

(declare-datatypes ((array!103116 0))(
  ( (array!103117 (arr!49760 (Array (_ BitVec 32) (_ BitVec 64))) (size!50310 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103116)

(declare-fun array_inv!38703 (array!103116) Bool)

(assert (=> start!131966 (array_inv!38703 _keys!618)))

(declare-fun tp_is_empty!37955 () Bool)

(assert (=> start!131966 tp_is_empty!37955))

(assert (=> start!131966 true))

(assert (=> start!131966 tp!111289))

(declare-datatypes ((ValueCell!18067 0))(
  ( (ValueCellFull!18067 (v!21856 V!59049)) (EmptyCell!18067) )
))
(declare-datatypes ((array!103118 0))(
  ( (array!103119 (arr!49761 (Array (_ BitVec 32) ValueCell!18067)) (size!50311 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103118)

(declare-fun e!860390 () Bool)

(declare-fun array_inv!38704 (array!103118) Bool)

(assert (=> start!131966 (and (array_inv!38704 _values!470) e!860390)))

(declare-fun b!1545738 () Bool)

(declare-fun res!1059940 () Bool)

(assert (=> b!1545738 (=> (not res!1059940) (not e!860396))))

(declare-datatypes ((List!36002 0))(
  ( (Nil!35999) (Cons!35998 (h!37443 (_ BitVec 64)) (t!50696 List!36002)) )
))
(declare-fun arrayNoDuplicates!0 (array!103116 (_ BitVec 32) List!36002) Bool)

(assert (=> b!1545738 (= res!1059940 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35999))))

(declare-fun b!1545739 () Bool)

(declare-fun res!1059937 () Bool)

(assert (=> b!1545739 (=> (not res!1059937) (not e!860396))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1545739 (= res!1059937 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50310 _keys!618))))))

(declare-fun b!1545740 () Bool)

(declare-fun e!860389 () ListLongMap!22101)

(assert (=> b!1545740 (= e!860389 e!860391)))

(declare-fun c!141684 () Bool)

(assert (=> b!1545740 (= c!141684 (and (not lt!666389) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545741 () Bool)

(declare-fun res!1059936 () Bool)

(assert (=> b!1545741 (=> (not res!1059936) (not e!860396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103116 (_ BitVec 32)) Bool)

(assert (=> b!1545741 (= res!1059936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58636 () Bool)

(declare-fun mapRes!58636 () Bool)

(assert (=> mapIsEmpty!58636 mapRes!58636))

(declare-fun bm!69317 () Bool)

(declare-fun call!69320 () ListLongMap!22101)

(declare-fun call!69321 () ListLongMap!22101)

(assert (=> bm!69317 (= call!69320 call!69321)))

(declare-fun b!1545742 () Bool)

(assert (=> b!1545742 (= e!860393 call!69320)))

(declare-fun b!1545743 () Bool)

(declare-fun e!860394 () Bool)

(assert (=> b!1545743 (= e!860390 (and e!860394 mapRes!58636))))

(declare-fun condMapEmpty!58636 () Bool)

(declare-fun mapDefault!58636 () ValueCell!18067)

