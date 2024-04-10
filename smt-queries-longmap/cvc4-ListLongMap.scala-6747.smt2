; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84564 () Bool)

(assert start!84564)

(declare-fun b_free!20045 () Bool)

(declare-fun b_next!20045 () Bool)

(assert (=> start!84564 (= b_free!20045 (not b_next!20045))))

(declare-fun tp!69922 () Bool)

(declare-fun b_and!32159 () Bool)

(assert (=> start!84564 (= tp!69922 b_and!32159)))

(declare-fun b!989117 () Bool)

(declare-fun e!557733 () Bool)

(declare-fun tp_is_empty!23261 () Bool)

(assert (=> b!989117 (= e!557733 tp_is_empty!23261)))

(declare-fun mapNonEmpty!36933 () Bool)

(declare-fun mapRes!36933 () Bool)

(declare-fun tp!69923 () Bool)

(declare-fun e!557730 () Bool)

(assert (=> mapNonEmpty!36933 (= mapRes!36933 (and tp!69923 e!557730))))

(declare-fun mapKey!36933 () (_ BitVec 32))

(declare-datatypes ((V!35997 0))(
  ( (V!35998 (val!11681 Int)) )
))
(declare-datatypes ((ValueCell!11149 0))(
  ( (ValueCellFull!11149 (v!14248 V!35997)) (EmptyCell!11149) )
))
(declare-datatypes ((array!62481 0))(
  ( (array!62482 (arr!30094 (Array (_ BitVec 32) ValueCell!11149)) (size!30573 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62481)

(declare-fun mapValue!36933 () ValueCell!11149)

(declare-fun mapRest!36933 () (Array (_ BitVec 32) ValueCell!11149))

(assert (=> mapNonEmpty!36933 (= (arr!30094 _values!1278) (store mapRest!36933 mapKey!36933 mapValue!36933))))

(declare-fun b!989118 () Bool)

(declare-fun e!557732 () Bool)

(declare-fun e!557729 () Bool)

(assert (=> b!989118 (= e!557732 e!557729)))

(declare-fun res!661551 () Bool)

(assert (=> b!989118 (=> (not res!661551) (not e!557729))))

(declare-datatypes ((array!62483 0))(
  ( (array!62484 (arr!30095 (Array (_ BitVec 32) (_ BitVec 64))) (size!30574 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62483)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!989118 (= res!661551 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30095 _keys!1544) from!1932))))))

(declare-fun lt!438730 () V!35997)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15620 (ValueCell!11149 V!35997) V!35997)

(declare-fun dynLambda!1868 (Int (_ BitVec 64)) V!35997)

(assert (=> b!989118 (= lt!438730 (get!15620 (select (arr!30094 _values!1278) from!1932) (dynLambda!1868 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35997)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35997)

(declare-datatypes ((tuple2!14888 0))(
  ( (tuple2!14889 (_1!7455 (_ BitVec 64)) (_2!7455 V!35997)) )
))
(declare-datatypes ((List!20817 0))(
  ( (Nil!20814) (Cons!20813 (h!21975 tuple2!14888) (t!29774 List!20817)) )
))
(declare-datatypes ((ListLongMap!13585 0))(
  ( (ListLongMap!13586 (toList!6808 List!20817)) )
))
(declare-fun lt!438727 () ListLongMap!13585)

(declare-fun getCurrentListMapNoExtraKeys!3498 (array!62483 array!62481 (_ BitVec 32) (_ BitVec 32) V!35997 V!35997 (_ BitVec 32) Int) ListLongMap!13585)

(assert (=> b!989118 (= lt!438727 (getCurrentListMapNoExtraKeys!3498 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989119 () Bool)

(declare-fun res!661544 () Bool)

(assert (=> b!989119 (=> (not res!661544) (not e!557732))))

(assert (=> b!989119 (= res!661544 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!989120 () Bool)

(declare-fun res!661548 () Bool)

(assert (=> b!989120 (=> (not res!661548) (not e!557732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62483 (_ BitVec 32)) Bool)

(assert (=> b!989120 (= res!661548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989121 () Bool)

(declare-fun res!661546 () Bool)

(assert (=> b!989121 (=> (not res!661546) (not e!557732))))

(assert (=> b!989121 (= res!661546 (and (= (size!30573 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30574 _keys!1544) (size!30573 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989122 () Bool)

(declare-fun res!661549 () Bool)

(assert (=> b!989122 (=> (not res!661549) (not e!557732))))

(declare-datatypes ((List!20818 0))(
  ( (Nil!20815) (Cons!20814 (h!21976 (_ BitVec 64)) (t!29775 List!20818)) )
))
(declare-fun arrayNoDuplicates!0 (array!62483 (_ BitVec 32) List!20818) Bool)

(assert (=> b!989122 (= res!661549 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20815))))

(declare-fun b!989123 () Bool)

(declare-fun e!557731 () Bool)

(assert (=> b!989123 (= e!557731 (and e!557733 mapRes!36933))))

(declare-fun condMapEmpty!36933 () Bool)

(declare-fun mapDefault!36933 () ValueCell!11149)

