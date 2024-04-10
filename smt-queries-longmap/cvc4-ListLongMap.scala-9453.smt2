; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112330 () Bool)

(assert start!112330)

(declare-fun b_free!30725 () Bool)

(declare-fun b_next!30725 () Bool)

(assert (=> start!112330 (= b_free!30725 (not b_next!30725))))

(declare-fun tp!107812 () Bool)

(declare-fun b_and!49505 () Bool)

(assert (=> start!112330 (= tp!107812 b_and!49505)))

(declare-fun b!1331337 () Bool)

(declare-fun res!883452 () Bool)

(declare-fun e!758639 () Bool)

(assert (=> b!1331337 (=> (not res!883452) (not e!758639))))

(declare-datatypes ((V!53949 0))(
  ( (V!53950 (val!18392 Int)) )
))
(declare-datatypes ((ValueCell!17419 0))(
  ( (ValueCellFull!17419 (v!21029 V!53949)) (EmptyCell!17419) )
))
(declare-datatypes ((array!90150 0))(
  ( (array!90151 (arr!43541 (Array (_ BitVec 32) ValueCell!17419)) (size!44091 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90150)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90152 0))(
  ( (array!90153 (arr!43542 (Array (_ BitVec 32) (_ BitVec 64))) (size!44092 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90152)

(assert (=> b!1331337 (= res!883452 (and (= (size!44091 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44092 _keys!1590) (size!44091 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!883446 () Bool)

(assert (=> start!112330 (=> (not res!883446) (not e!758639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112330 (= res!883446 (validMask!0 mask!1998))))

(assert (=> start!112330 e!758639))

(declare-fun e!758640 () Bool)

(declare-fun array_inv!32841 (array!90150) Bool)

(assert (=> start!112330 (and (array_inv!32841 _values!1320) e!758640)))

(assert (=> start!112330 true))

(declare-fun array_inv!32842 (array!90152) Bool)

(assert (=> start!112330 (array_inv!32842 _keys!1590)))

(assert (=> start!112330 tp!107812))

(declare-fun tp_is_empty!36635 () Bool)

(assert (=> start!112330 tp_is_empty!36635))

(declare-fun b!1331338 () Bool)

(declare-fun res!883445 () Bool)

(assert (=> b!1331338 (=> (not res!883445) (not e!758639))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53949)

(declare-fun zeroValue!1262 () V!53949)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(declare-datatypes ((tuple2!23688 0))(
  ( (tuple2!23689 (_1!11855 (_ BitVec 64)) (_2!11855 V!53949)) )
))
(declare-datatypes ((List!30838 0))(
  ( (Nil!30835) (Cons!30834 (h!32043 tuple2!23688) (t!44976 List!30838)) )
))
(declare-datatypes ((ListLongMap!21345 0))(
  ( (ListLongMap!21346 (toList!10688 List!30838)) )
))
(declare-fun contains!8852 (ListLongMap!21345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5673 (array!90152 array!90150 (_ BitVec 32) (_ BitVec 32) V!53949 V!53949 (_ BitVec 32) Int) ListLongMap!21345)

(assert (=> b!1331338 (= res!883445 (contains!8852 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331339 () Bool)

(declare-fun e!758637 () Bool)

(declare-fun mapRes!56626 () Bool)

(assert (=> b!1331339 (= e!758640 (and e!758637 mapRes!56626))))

(declare-fun condMapEmpty!56626 () Bool)

(declare-fun mapDefault!56626 () ValueCell!17419)

