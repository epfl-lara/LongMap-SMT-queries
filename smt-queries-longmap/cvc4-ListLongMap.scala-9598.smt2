; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113454 () Bool)

(assert start!113454)

(declare-fun b_free!31505 () Bool)

(declare-fun b_next!31505 () Bool)

(assert (=> start!113454 (= b_free!31505 (not b_next!31505))))

(declare-fun tp!110320 () Bool)

(declare-fun b_and!50793 () Bool)

(assert (=> start!113454 (= tp!110320 b_and!50793)))

(declare-fun b!1346861 () Bool)

(declare-fun res!893713 () Bool)

(declare-fun e!766349 () Bool)

(assert (=> b!1346861 (=> (not res!893713) (not e!766349))))

(declare-datatypes ((array!91842 0))(
  ( (array!91843 (arr!44377 (Array (_ BitVec 32) (_ BitVec 64))) (size!44927 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91842)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346861 (= res!893713 (validKeyInArray!0 (select (arr!44377 _keys!1571) from!1960)))))

(declare-fun b!1346862 () Bool)

(declare-fun res!893712 () Bool)

(assert (=> b!1346862 (=> (not res!893712) (not e!766349))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346862 (= res!893712 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44927 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!893711 () Bool)

(assert (=> start!113454 (=> (not res!893711) (not e!766349))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113454 (= res!893711 (validMask!0 mask!1977))))

(assert (=> start!113454 e!766349))

(declare-fun tp_is_empty!37505 () Bool)

(assert (=> start!113454 tp_is_empty!37505))

(assert (=> start!113454 true))

(declare-fun array_inv!33431 (array!91842) Bool)

(assert (=> start!113454 (array_inv!33431 _keys!1571)))

(declare-datatypes ((V!55109 0))(
  ( (V!55110 (val!18827 Int)) )
))
(declare-datatypes ((ValueCell!17854 0))(
  ( (ValueCellFull!17854 (v!21475 V!55109)) (EmptyCell!17854) )
))
(declare-datatypes ((array!91844 0))(
  ( (array!91845 (arr!44378 (Array (_ BitVec 32) ValueCell!17854)) (size!44928 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91844)

(declare-fun e!766348 () Bool)

(declare-fun array_inv!33432 (array!91844) Bool)

(assert (=> start!113454 (and (array_inv!33432 _values!1303) e!766348)))

(assert (=> start!113454 tp!110320))

(declare-fun b!1346863 () Bool)

(declare-fun res!893715 () Bool)

(assert (=> b!1346863 (=> (not res!893715) (not e!766349))))

(declare-datatypes ((List!31423 0))(
  ( (Nil!31420) (Cons!31419 (h!32628 (_ BitVec 64)) (t!46013 List!31423)) )
))
(declare-fun arrayNoDuplicates!0 (array!91842 (_ BitVec 32) List!31423) Bool)

(assert (=> b!1346863 (= res!893715 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31420))))

(declare-fun b!1346864 () Bool)

(declare-fun res!893716 () Bool)

(assert (=> b!1346864 (=> (not res!893716) (not e!766349))))

(declare-fun minValue!1245 () V!55109)

(declare-fun zeroValue!1245 () V!55109)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24268 0))(
  ( (tuple2!24269 (_1!12145 (_ BitVec 64)) (_2!12145 V!55109)) )
))
(declare-datatypes ((List!31424 0))(
  ( (Nil!31421) (Cons!31420 (h!32629 tuple2!24268) (t!46014 List!31424)) )
))
(declare-datatypes ((ListLongMap!21925 0))(
  ( (ListLongMap!21926 (toList!10978 List!31424)) )
))
(declare-fun contains!9154 (ListLongMap!21925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5930 (array!91842 array!91844 (_ BitVec 32) (_ BitVec 32) V!55109 V!55109 (_ BitVec 32) Int) ListLongMap!21925)

(assert (=> b!1346864 (= res!893716 (contains!9154 (getCurrentListMap!5930 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapIsEmpty!57964 () Bool)

(declare-fun mapRes!57964 () Bool)

(assert (=> mapIsEmpty!57964 mapRes!57964))

(declare-fun b!1346865 () Bool)

(declare-fun e!766347 () Bool)

(assert (=> b!1346865 (= e!766348 (and e!766347 mapRes!57964))))

(declare-fun condMapEmpty!57964 () Bool)

(declare-fun mapDefault!57964 () ValueCell!17854)

