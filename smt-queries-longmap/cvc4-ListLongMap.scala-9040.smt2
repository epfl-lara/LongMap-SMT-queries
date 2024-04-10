; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109028 () Bool)

(assert start!109028)

(declare-fun b_free!28517 () Bool)

(declare-fun b_next!28517 () Bool)

(assert (=> start!109028 (= b_free!28517 (not b_next!28517))))

(declare-fun tp!100670 () Bool)

(declare-fun b_and!46607 () Bool)

(assert (=> start!109028 (= tp!100670 b_and!46607)))

(declare-fun b!1288589 () Bool)

(declare-fun res!855887 () Bool)

(declare-fun e!735789 () Bool)

(assert (=> b!1288589 (=> (not res!855887) (not e!735789))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85358 0))(
  ( (array!85359 (arr!41180 (Array (_ BitVec 32) (_ BitVec 64))) (size!41730 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85358)

(assert (=> b!1288589 (= res!855887 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41730 _keys!1741))))))

(declare-fun b!1288590 () Bool)

(declare-fun e!735794 () Bool)

(assert (=> b!1288590 (= e!735789 (not e!735794))))

(declare-fun res!855884 () Bool)

(assert (=> b!1288590 (=> res!855884 e!735794)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288590 (= res!855884 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50645 0))(
  ( (V!50646 (val!17153 Int)) )
))
(declare-datatypes ((tuple2!22020 0))(
  ( (tuple2!22021 (_1!11021 (_ BitVec 64)) (_2!11021 V!50645)) )
))
(declare-datatypes ((List!29194 0))(
  ( (Nil!29191) (Cons!29190 (h!30399 tuple2!22020) (t!42758 List!29194)) )
))
(declare-datatypes ((ListLongMap!19677 0))(
  ( (ListLongMap!19678 (toList!9854 List!29194)) )
))
(declare-fun contains!7972 (ListLongMap!19677 (_ BitVec 64)) Bool)

(assert (=> b!1288590 (not (contains!7972 (ListLongMap!19678 Nil!29191) k!1205))))

(declare-datatypes ((Unit!42628 0))(
  ( (Unit!42629) )
))
(declare-fun lt!578030 () Unit!42628)

(declare-fun emptyContainsNothing!43 ((_ BitVec 64)) Unit!42628)

(assert (=> b!1288590 (= lt!578030 (emptyContainsNothing!43 k!1205))))

(declare-fun b!1288591 () Bool)

(declare-fun res!855881 () Bool)

(assert (=> b!1288591 (=> (not res!855881) (not e!735789))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85358 (_ BitVec 32)) Bool)

(assert (=> b!1288591 (= res!855881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288593 () Bool)

(declare-fun e!735793 () Bool)

(declare-fun tp_is_empty!34157 () Bool)

(assert (=> b!1288593 (= e!735793 tp_is_empty!34157)))

(declare-fun b!1288594 () Bool)

(declare-fun res!855885 () Bool)

(assert (=> b!1288594 (=> (not res!855885) (not e!735789))))

(declare-datatypes ((List!29195 0))(
  ( (Nil!29192) (Cons!29191 (h!30400 (_ BitVec 64)) (t!42759 List!29195)) )
))
(declare-fun arrayNoDuplicates!0 (array!85358 (_ BitVec 32) List!29195) Bool)

(assert (=> b!1288594 (= res!855885 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29192))))

(declare-fun b!1288595 () Bool)

(declare-fun e!735792 () Bool)

(declare-fun mapRes!52796 () Bool)

(assert (=> b!1288595 (= e!735792 (and e!735793 mapRes!52796))))

(declare-fun condMapEmpty!52796 () Bool)

(declare-datatypes ((ValueCell!16180 0))(
  ( (ValueCellFull!16180 (v!19756 V!50645)) (EmptyCell!16180) )
))
(declare-datatypes ((array!85360 0))(
  ( (array!85361 (arr!41181 (Array (_ BitVec 32) ValueCell!16180)) (size!41731 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85360)

(declare-fun mapDefault!52796 () ValueCell!16180)

