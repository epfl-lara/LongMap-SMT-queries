; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112552 () Bool)

(assert start!112552)

(declare-fun b_free!30947 () Bool)

(declare-fun b_next!30947 () Bool)

(assert (=> start!112552 (= b_free!30947 (not b_next!30947))))

(declare-fun tp!108477 () Bool)

(declare-fun b_and!49855 () Bool)

(assert (=> start!112552 (= tp!108477 b_and!49855)))

(declare-fun b!1335078 () Bool)

(declare-fun res!886062 () Bool)

(declare-fun e!760385 () Bool)

(assert (=> b!1335078 (=> (not res!886062) (not e!760385))))

(declare-datatypes ((array!90574 0))(
  ( (array!90575 (arr!43753 (Array (_ BitVec 32) (_ BitVec 64))) (size!44303 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90574)

(declare-datatypes ((List!30997 0))(
  ( (Nil!30994) (Cons!30993 (h!32202 (_ BitVec 64)) (t!45261 List!30997)) )
))
(declare-fun arrayNoDuplicates!0 (array!90574 (_ BitVec 32) List!30997) Bool)

(assert (=> b!1335078 (= res!886062 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30994))))

(declare-fun b!1335079 () Bool)

(declare-fun res!886059 () Bool)

(assert (=> b!1335079 (=> (not res!886059) (not e!760385))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90574 (_ BitVec 32)) Bool)

(assert (=> b!1335079 (= res!886059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!886060 () Bool)

(assert (=> start!112552 (=> (not res!886060) (not e!760385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112552 (= res!886060 (validMask!0 mask!1998))))

(assert (=> start!112552 e!760385))

(declare-datatypes ((V!54245 0))(
  ( (V!54246 (val!18503 Int)) )
))
(declare-datatypes ((ValueCell!17530 0))(
  ( (ValueCellFull!17530 (v!21140 V!54245)) (EmptyCell!17530) )
))
(declare-datatypes ((array!90576 0))(
  ( (array!90577 (arr!43754 (Array (_ BitVec 32) ValueCell!17530)) (size!44304 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90576)

(declare-fun e!760386 () Bool)

(declare-fun array_inv!32997 (array!90576) Bool)

(assert (=> start!112552 (and (array_inv!32997 _values!1320) e!760386)))

(assert (=> start!112552 true))

(declare-fun array_inv!32998 (array!90574) Bool)

(assert (=> start!112552 (array_inv!32998 _keys!1590)))

(assert (=> start!112552 tp!108477))

(declare-fun tp_is_empty!36857 () Bool)

(assert (=> start!112552 tp_is_empty!36857))

(declare-fun b!1335080 () Bool)

(declare-fun e!760383 () Bool)

(assert (=> b!1335080 (= e!760383 tp_is_empty!36857)))

(declare-fun b!1335081 () Bool)

(declare-fun e!760384 () Bool)

(assert (=> b!1335081 (= e!760384 tp_is_empty!36857)))

(declare-fun mapIsEmpty!56959 () Bool)

(declare-fun mapRes!56959 () Bool)

(assert (=> mapIsEmpty!56959 mapRes!56959))

(declare-fun b!1335082 () Bool)

(assert (=> b!1335082 (= e!760386 (and e!760384 mapRes!56959))))

(declare-fun condMapEmpty!56959 () Bool)

(declare-fun mapDefault!56959 () ValueCell!17530)

