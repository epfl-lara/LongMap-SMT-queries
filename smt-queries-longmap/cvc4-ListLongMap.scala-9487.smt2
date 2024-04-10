; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112534 () Bool)

(assert start!112534)

(declare-fun b_free!30929 () Bool)

(declare-fun b_next!30929 () Bool)

(assert (=> start!112534 (= b_free!30929 (not b_next!30929))))

(declare-fun tp!108423 () Bool)

(declare-fun b_and!49837 () Bool)

(assert (=> start!112534 (= tp!108423 b_and!49837)))

(declare-fun b!1334862 () Bool)

(declare-fun e!760248 () Bool)

(declare-fun tp_is_empty!36839 () Bool)

(assert (=> b!1334862 (= e!760248 tp_is_empty!36839)))

(declare-fun b!1334863 () Bool)

(declare-fun res!885925 () Bool)

(declare-fun e!760251 () Bool)

(assert (=> b!1334863 (=> (not res!885925) (not e!760251))))

(declare-datatypes ((V!54221 0))(
  ( (V!54222 (val!18494 Int)) )
))
(declare-datatypes ((ValueCell!17521 0))(
  ( (ValueCellFull!17521 (v!21131 V!54221)) (EmptyCell!17521) )
))
(declare-datatypes ((array!90540 0))(
  ( (array!90541 (arr!43736 (Array (_ BitVec 32) ValueCell!17521)) (size!44286 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90540)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90542 0))(
  ( (array!90543 (arr!43737 (Array (_ BitVec 32) (_ BitVec 64))) (size!44287 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90542)

(assert (=> b!1334863 (= res!885925 (and (= (size!44286 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44287 _keys!1590) (size!44286 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56932 () Bool)

(declare-fun mapRes!56932 () Bool)

(declare-fun tp!108424 () Bool)

(declare-fun e!760252 () Bool)

(assert (=> mapNonEmpty!56932 (= mapRes!56932 (and tp!108424 e!760252))))

(declare-fun mapKey!56932 () (_ BitVec 32))

(declare-fun mapValue!56932 () ValueCell!17521)

(declare-fun mapRest!56932 () (Array (_ BitVec 32) ValueCell!17521))

(assert (=> mapNonEmpty!56932 (= (arr!43736 _values!1320) (store mapRest!56932 mapKey!56932 mapValue!56932))))

(declare-fun b!1334864 () Bool)

(assert (=> b!1334864 (= e!760251 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54221)

(declare-fun zeroValue!1262 () V!54221)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!592399 () Bool)

(declare-datatypes ((tuple2!23846 0))(
  ( (tuple2!23847 (_1!11934 (_ BitVec 64)) (_2!11934 V!54221)) )
))
(declare-datatypes ((List!30985 0))(
  ( (Nil!30982) (Cons!30981 (h!32190 tuple2!23846) (t!45249 List!30985)) )
))
(declare-datatypes ((ListLongMap!21503 0))(
  ( (ListLongMap!21504 (toList!10767 List!30985)) )
))
(declare-fun contains!8931 (ListLongMap!21503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5741 (array!90542 array!90540 (_ BitVec 32) (_ BitVec 32) V!54221 V!54221 (_ BitVec 32) Int) ListLongMap!21503)

(assert (=> b!1334864 (= lt!592399 (contains!8931 (getCurrentListMap!5741 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapIsEmpty!56932 () Bool)

(assert (=> mapIsEmpty!56932 mapRes!56932))

(declare-fun b!1334865 () Bool)

(declare-fun e!760250 () Bool)

(assert (=> b!1334865 (= e!760250 (and e!760248 mapRes!56932))))

(declare-fun condMapEmpty!56932 () Bool)

(declare-fun mapDefault!56932 () ValueCell!17521)

