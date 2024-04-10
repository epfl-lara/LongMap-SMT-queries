; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112324 () Bool)

(assert start!112324)

(declare-fun b_free!30719 () Bool)

(declare-fun b_next!30719 () Bool)

(assert (=> start!112324 (= b_free!30719 (not b_next!30719))))

(declare-fun tp!107794 () Bool)

(declare-fun b_and!49493 () Bool)

(assert (=> start!112324 (= tp!107794 b_and!49493)))

(declare-fun res!883367 () Bool)

(declare-fun e!758593 () Bool)

(assert (=> start!112324 (=> (not res!883367) (not e!758593))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112324 (= res!883367 (validMask!0 mask!1998))))

(assert (=> start!112324 e!758593))

(declare-datatypes ((V!53941 0))(
  ( (V!53942 (val!18389 Int)) )
))
(declare-datatypes ((ValueCell!17416 0))(
  ( (ValueCellFull!17416 (v!21026 V!53941)) (EmptyCell!17416) )
))
(declare-datatypes ((array!90138 0))(
  ( (array!90139 (arr!43535 (Array (_ BitVec 32) ValueCell!17416)) (size!44085 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90138)

(declare-fun e!758594 () Bool)

(declare-fun array_inv!32835 (array!90138) Bool)

(assert (=> start!112324 (and (array_inv!32835 _values!1320) e!758594)))

(assert (=> start!112324 true))

(declare-datatypes ((array!90140 0))(
  ( (array!90141 (arr!43536 (Array (_ BitVec 32) (_ BitVec 64))) (size!44086 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90140)

(declare-fun array_inv!32836 (array!90140) Bool)

(assert (=> start!112324 (array_inv!32836 _keys!1590)))

(assert (=> start!112324 tp!107794))

(declare-fun tp_is_empty!36629 () Bool)

(assert (=> start!112324 tp_is_empty!36629))

(declare-fun b!1331223 () Bool)

(declare-fun res!883364 () Bool)

(assert (=> b!1331223 (=> (not res!883364) (not e!758593))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331223 (= res!883364 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331224 () Bool)

(declare-fun res!883371 () Bool)

(assert (=> b!1331224 (=> (not res!883371) (not e!758593))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331224 (= res!883371 (validKeyInArray!0 (select (arr!43536 _keys!1590) from!1980)))))

(declare-fun b!1331225 () Bool)

(declare-fun res!883366 () Bool)

(assert (=> b!1331225 (=> (not res!883366) (not e!758593))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53941)

(declare-fun zeroValue!1262 () V!53941)

(declare-datatypes ((tuple2!23684 0))(
  ( (tuple2!23685 (_1!11853 (_ BitVec 64)) (_2!11853 V!53941)) )
))
(declare-datatypes ((List!30834 0))(
  ( (Nil!30831) (Cons!30830 (h!32039 tuple2!23684) (t!44966 List!30834)) )
))
(declare-datatypes ((ListLongMap!21341 0))(
  ( (ListLongMap!21342 (toList!10686 List!30834)) )
))
(declare-fun contains!8850 (ListLongMap!21341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5671 (array!90140 array!90138 (_ BitVec 32) (_ BitVec 32) V!53941 V!53941 (_ BitVec 32) Int) ListLongMap!21341)

(assert (=> b!1331225 (= res!883366 (contains!8850 (getCurrentListMap!5671 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331226 () Bool)

(declare-fun res!883369 () Bool)

(assert (=> b!1331226 (=> (not res!883369) (not e!758593))))

(assert (=> b!1331226 (= res!883369 (and (= (size!44085 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44086 _keys!1590) (size!44085 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56617 () Bool)

(declare-fun mapRes!56617 () Bool)

(declare-fun tp!107793 () Bool)

(declare-fun e!758596 () Bool)

(assert (=> mapNonEmpty!56617 (= mapRes!56617 (and tp!107793 e!758596))))

(declare-fun mapKey!56617 () (_ BitVec 32))

(declare-fun mapValue!56617 () ValueCell!17416)

(declare-fun mapRest!56617 () (Array (_ BitVec 32) ValueCell!17416))

(assert (=> mapNonEmpty!56617 (= (arr!43535 _values!1320) (store mapRest!56617 mapKey!56617 mapValue!56617))))

(declare-fun b!1331227 () Bool)

(declare-fun res!883363 () Bool)

(assert (=> b!1331227 (=> (not res!883363) (not e!758593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90140 (_ BitVec 32)) Bool)

(assert (=> b!1331227 (= res!883363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331228 () Bool)

(declare-fun e!758592 () Bool)

(assert (=> b!1331228 (= e!758594 (and e!758592 mapRes!56617))))

(declare-fun condMapEmpty!56617 () Bool)

(declare-fun mapDefault!56617 () ValueCell!17416)

