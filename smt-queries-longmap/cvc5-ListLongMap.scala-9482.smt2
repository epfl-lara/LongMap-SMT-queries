; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112500 () Bool)

(assert start!112500)

(declare-fun b_free!30895 () Bool)

(declare-fun b_next!30895 () Bool)

(assert (=> start!112500 (= b_free!30895 (not b_next!30895))))

(declare-fun tp!108321 () Bool)

(declare-fun b_and!49791 () Bool)

(assert (=> start!112500 (= tp!108321 b_and!49791)))

(declare-fun b!1334346 () Bool)

(declare-fun e!759980 () Bool)

(declare-fun tp_is_empty!36805 () Bool)

(assert (=> b!1334346 (= e!759980 tp_is_empty!36805)))

(declare-fun b!1334347 () Bool)

(declare-fun res!885582 () Bool)

(declare-fun e!759978 () Bool)

(assert (=> b!1334347 (=> (not res!885582) (not e!759978))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90476 0))(
  ( (array!90477 (arr!43704 (Array (_ BitVec 32) (_ BitVec 64))) (size!44254 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90476)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1334347 (= res!885582 (not (= k!1153 (select (arr!43704 _keys!1590) from!1980))))))

(declare-fun b!1334348 () Bool)

(declare-fun res!885577 () Bool)

(declare-fun e!759981 () Bool)

(assert (=> b!1334348 (=> (not res!885577) (not e!759981))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334348 (= res!885577 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334349 () Bool)

(declare-fun res!885580 () Bool)

(assert (=> b!1334349 (=> (not res!885580) (not e!759981))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90476 (_ BitVec 32)) Bool)

(assert (=> b!1334349 (= res!885580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334350 () Bool)

(assert (=> b!1334350 (= e!759978 (not true))))

(declare-datatypes ((V!54177 0))(
  ( (V!54178 (val!18477 Int)) )
))
(declare-datatypes ((tuple2!23824 0))(
  ( (tuple2!23825 (_1!11923 (_ BitVec 64)) (_2!11923 V!54177)) )
))
(declare-datatypes ((List!30964 0))(
  ( (Nil!30961) (Cons!30960 (h!32169 tuple2!23824) (t!45218 List!30964)) )
))
(declare-datatypes ((ListLongMap!21481 0))(
  ( (ListLongMap!21482 (toList!10756 List!30964)) )
))
(declare-fun lt!592316 () ListLongMap!21481)

(declare-fun contains!8920 (ListLongMap!21481 (_ BitVec 64)) Bool)

(assert (=> b!1334350 (contains!8920 lt!592316 k!1153)))

(declare-datatypes ((Unit!43893 0))(
  ( (Unit!43894) )
))
(declare-fun lt!592318 () Unit!43893)

(declare-fun lt!592317 () V!54177)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!309 ((_ BitVec 64) (_ BitVec 64) V!54177 ListLongMap!21481) Unit!43893)

(assert (=> b!1334350 (= lt!592318 (lemmaInListMapAfterAddingDiffThenInBefore!309 k!1153 (select (arr!43704 _keys!1590) from!1980) lt!592317 lt!592316))))

(declare-fun b!1334351 () Bool)

(declare-fun e!759982 () Bool)

(assert (=> b!1334351 (= e!759982 tp_is_empty!36805)))

(declare-fun mapIsEmpty!56881 () Bool)

(declare-fun mapRes!56881 () Bool)

(assert (=> mapIsEmpty!56881 mapRes!56881))

(declare-fun b!1334352 () Bool)

(declare-fun e!759979 () Bool)

(assert (=> b!1334352 (= e!759979 (and e!759980 mapRes!56881))))

(declare-fun condMapEmpty!56881 () Bool)

(declare-datatypes ((ValueCell!17504 0))(
  ( (ValueCellFull!17504 (v!21114 V!54177)) (EmptyCell!17504) )
))
(declare-datatypes ((array!90478 0))(
  ( (array!90479 (arr!43705 (Array (_ BitVec 32) ValueCell!17504)) (size!44255 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90478)

(declare-fun mapDefault!56881 () ValueCell!17504)

