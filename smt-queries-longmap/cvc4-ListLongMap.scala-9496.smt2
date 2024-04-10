; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112588 () Bool)

(assert start!112588)

(declare-fun b_free!30983 () Bool)

(declare-fun b_next!30983 () Bool)

(assert (=> start!112588 (= b_free!30983 (not b_next!30983))))

(declare-fun tp!108586 () Bool)

(declare-fun b_and!49891 () Bool)

(assert (=> start!112588 (= tp!108586 b_and!49891)))

(declare-fun b!1335605 () Bool)

(declare-fun res!886430 () Bool)

(declare-fun e!760656 () Bool)

(assert (=> b!1335605 (=> (not res!886430) (not e!760656))))

(declare-datatypes ((V!54293 0))(
  ( (V!54294 (val!18521 Int)) )
))
(declare-datatypes ((ValueCell!17548 0))(
  ( (ValueCellFull!17548 (v!21158 V!54293)) (EmptyCell!17548) )
))
(declare-datatypes ((array!90644 0))(
  ( (array!90645 (arr!43788 (Array (_ BitVec 32) ValueCell!17548)) (size!44338 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90644)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90646 0))(
  ( (array!90647 (arr!43789 (Array (_ BitVec 32) (_ BitVec 64))) (size!44339 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90646)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54293)

(declare-fun zeroValue!1262 () V!54293)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23884 0))(
  ( (tuple2!23885 (_1!11953 (_ BitVec 64)) (_2!11953 V!54293)) )
))
(declare-datatypes ((List!31025 0))(
  ( (Nil!31022) (Cons!31021 (h!32230 tuple2!23884) (t!45289 List!31025)) )
))
(declare-datatypes ((ListLongMap!21541 0))(
  ( (ListLongMap!21542 (toList!10786 List!31025)) )
))
(declare-fun contains!8949 (ListLongMap!21541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5759 (array!90646 array!90644 (_ BitVec 32) (_ BitVec 32) V!54293 V!54293 (_ BitVec 32) Int) ListLongMap!21541)

(assert (=> b!1335605 (= res!886430 (contains!8949 (getCurrentListMap!5759 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1335606 () Bool)

(declare-fun e!760653 () Bool)

(declare-fun tp_is_empty!36893 () Bool)

(assert (=> b!1335606 (= e!760653 tp_is_empty!36893)))

(declare-fun b!1335607 () Bool)

(declare-fun e!760657 () Bool)

(assert (=> b!1335607 (= e!760657 tp_is_empty!36893)))

(declare-fun b!1335608 () Bool)

(declare-fun res!886425 () Bool)

(assert (=> b!1335608 (=> (not res!886425) (not e!760656))))

(declare-datatypes ((List!31026 0))(
  ( (Nil!31023) (Cons!31022 (h!32231 (_ BitVec 64)) (t!45290 List!31026)) )
))
(declare-fun arrayNoDuplicates!0 (array!90646 (_ BitVec 32) List!31026) Bool)

(assert (=> b!1335608 (= res!886425 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31023))))

(declare-fun b!1335609 () Bool)

(declare-fun res!886431 () Bool)

(assert (=> b!1335609 (=> (not res!886431) (not e!760656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90646 (_ BitVec 32)) Bool)

(assert (=> b!1335609 (= res!886431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335610 () Bool)

(declare-fun e!760655 () Bool)

(declare-fun mapRes!57013 () Bool)

(assert (=> b!1335610 (= e!760655 (and e!760657 mapRes!57013))))

(declare-fun condMapEmpty!57013 () Bool)

(declare-fun mapDefault!57013 () ValueCell!17548)

