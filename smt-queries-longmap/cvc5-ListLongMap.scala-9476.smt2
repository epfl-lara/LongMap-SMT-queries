; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112464 () Bool)

(assert start!112464)

(declare-fun b_free!30859 () Bool)

(declare-fun b_next!30859 () Bool)

(assert (=> start!112464 (= b_free!30859 (not b_next!30859))))

(declare-fun tp!108213 () Bool)

(declare-fun b_and!49719 () Bool)

(assert (=> start!112464 (= tp!108213 b_and!49719)))

(declare-fun b!1333554 () Bool)

(declare-fun e!759653 () Bool)

(declare-fun tp_is_empty!36769 () Bool)

(assert (=> b!1333554 (= e!759653 tp_is_empty!36769)))

(declare-fun b!1333555 () Bool)

(declare-fun res!884983 () Bool)

(declare-fun e!759655 () Bool)

(assert (=> b!1333555 (=> (not res!884983) (not e!759655))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90410 0))(
  ( (array!90411 (arr!43671 (Array (_ BitVec 32) (_ BitVec 64))) (size!44221 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90410)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1333555 (= res!884983 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44221 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333556 () Bool)

(declare-fun res!884988 () Bool)

(assert (=> b!1333556 (=> (not res!884988) (not e!759655))))

(assert (=> b!1333556 (= res!884988 (not (= (select (arr!43671 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1333557 () Bool)

(declare-fun e!759658 () Bool)

(assert (=> b!1333557 (= e!759658 (not true))))

(declare-datatypes ((V!54129 0))(
  ( (V!54130 (val!18459 Int)) )
))
(declare-datatypes ((tuple2!23794 0))(
  ( (tuple2!23795 (_1!11908 (_ BitVec 64)) (_2!11908 V!54129)) )
))
(declare-datatypes ((List!30938 0))(
  ( (Nil!30935) (Cons!30934 (h!32143 tuple2!23794) (t!45156 List!30938)) )
))
(declare-datatypes ((ListLongMap!21451 0))(
  ( (ListLongMap!21452 (toList!10741 List!30938)) )
))
(declare-fun lt!592155 () ListLongMap!21451)

(declare-fun contains!8905 (ListLongMap!21451 (_ BitVec 64)) Bool)

(assert (=> b!1333557 (contains!8905 lt!592155 k!1153)))

(declare-fun lt!592154 () V!54129)

(declare-datatypes ((Unit!43869 0))(
  ( (Unit!43870) )
))
(declare-fun lt!592156 () Unit!43869)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!297 ((_ BitVec 64) (_ BitVec 64) V!54129 ListLongMap!21451) Unit!43869)

(assert (=> b!1333557 (= lt!592156 (lemmaInListMapAfterAddingDiffThenInBefore!297 k!1153 (select (arr!43671 _keys!1590) from!1980) lt!592154 lt!592155))))

(declare-fun b!1333558 () Bool)

(declare-fun res!884979 () Bool)

(assert (=> b!1333558 (=> (not res!884979) (not e!759655))))

(declare-datatypes ((List!30939 0))(
  ( (Nil!30936) (Cons!30935 (h!32144 (_ BitVec 64)) (t!45157 List!30939)) )
))
(declare-fun arrayNoDuplicates!0 (array!90410 (_ BitVec 32) List!30939) Bool)

(assert (=> b!1333558 (= res!884979 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30936))))

(declare-fun mapNonEmpty!56827 () Bool)

(declare-fun mapRes!56827 () Bool)

(declare-fun tp!108214 () Bool)

(assert (=> mapNonEmpty!56827 (= mapRes!56827 (and tp!108214 e!759653))))

(declare-datatypes ((ValueCell!17486 0))(
  ( (ValueCellFull!17486 (v!21096 V!54129)) (EmptyCell!17486) )
))
(declare-datatypes ((array!90412 0))(
  ( (array!90413 (arr!43672 (Array (_ BitVec 32) ValueCell!17486)) (size!44222 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90412)

(declare-fun mapRest!56827 () (Array (_ BitVec 32) ValueCell!17486))

(declare-fun mapKey!56827 () (_ BitVec 32))

(declare-fun mapValue!56827 () ValueCell!17486)

(assert (=> mapNonEmpty!56827 (= (arr!43672 _values!1320) (store mapRest!56827 mapKey!56827 mapValue!56827))))

(declare-fun b!1333559 () Bool)

(declare-fun res!884986 () Bool)

(assert (=> b!1333559 (=> (not res!884986) (not e!759655))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90410 (_ BitVec 32)) Bool)

(assert (=> b!1333559 (= res!884986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56827 () Bool)

(assert (=> mapIsEmpty!56827 mapRes!56827))

(declare-fun b!1333561 () Bool)

(declare-fun e!759654 () Bool)

(declare-fun e!759656 () Bool)

(assert (=> b!1333561 (= e!759654 (and e!759656 mapRes!56827))))

(declare-fun condMapEmpty!56827 () Bool)

(declare-fun mapDefault!56827 () ValueCell!17486)

