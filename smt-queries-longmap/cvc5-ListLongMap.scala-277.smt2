; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4488 () Bool)

(assert start!4488)

(declare-fun b_free!1249 () Bool)

(declare-fun b_next!1249 () Bool)

(assert (=> start!4488 (= b_free!1249 (not b_next!1249))))

(declare-fun tp!5185 () Bool)

(declare-fun b_and!2071 () Bool)

(assert (=> start!4488 (= tp!5185 b_and!2071)))

(declare-fun b!34951 () Bool)

(declare-fun res!21249 () Bool)

(declare-fun e!22105 () Bool)

(assert (=> b!34951 (=> (not res!21249) (not e!22105))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1963 0))(
  ( (V!1964 (val!828 Int)) )
))
(declare-datatypes ((ValueCell!602 0))(
  ( (ValueCellFull!602 (v!1923 V!1963)) (EmptyCell!602) )
))
(declare-datatypes ((array!2419 0))(
  ( (array!2420 (arr!1157 (Array (_ BitVec 32) ValueCell!602)) (size!1258 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2419)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2421 0))(
  ( (array!2422 (arr!1158 (Array (_ BitVec 32) (_ BitVec 64))) (size!1259 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2421)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1963)

(declare-fun minValue!1443 () V!1963)

(declare-datatypes ((tuple2!1340 0))(
  ( (tuple2!1341 (_1!681 (_ BitVec 64)) (_2!681 V!1963)) )
))
(declare-datatypes ((List!930 0))(
  ( (Nil!927) (Cons!926 (h!1493 tuple2!1340) (t!3635 List!930)) )
))
(declare-datatypes ((ListLongMap!917 0))(
  ( (ListLongMap!918 (toList!474 List!930)) )
))
(declare-fun contains!420 (ListLongMap!917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!298 (array!2421 array!2419 (_ BitVec 32) (_ BitVec 32) V!1963 V!1963 (_ BitVec 32) Int) ListLongMap!917)

(assert (=> b!34951 (= res!21249 (not (contains!420 (getCurrentListMap!298 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!34952 () Bool)

(declare-fun res!21246 () Bool)

(assert (=> b!34952 (=> (not res!21246) (not e!22105))))

(declare-datatypes ((List!931 0))(
  ( (Nil!928) (Cons!927 (h!1494 (_ BitVec 64)) (t!3636 List!931)) )
))
(declare-fun arrayNoDuplicates!0 (array!2421 (_ BitVec 32) List!931) Bool)

(assert (=> b!34952 (= res!21246 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!928))))

(declare-fun b!34953 () Bool)

(declare-fun e!22103 () Bool)

(declare-fun tp_is_empty!1603 () Bool)

(assert (=> b!34953 (= e!22103 tp_is_empty!1603)))

(declare-fun b!34954 () Bool)

(assert (=> b!34954 (= e!22105 false)))

(declare-datatypes ((SeekEntryResult!155 0))(
  ( (MissingZero!155 (index!2742 (_ BitVec 32))) (Found!155 (index!2743 (_ BitVec 32))) (Intermediate!155 (undefined!967 Bool) (index!2744 (_ BitVec 32)) (x!6973 (_ BitVec 32))) (Undefined!155) (MissingVacant!155 (index!2745 (_ BitVec 32))) )
))
(declare-fun lt!12831 () SeekEntryResult!155)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2421 (_ BitVec 32)) SeekEntryResult!155)

(assert (=> b!34954 (= lt!12831 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1951 () Bool)

(declare-fun mapRes!1951 () Bool)

(assert (=> mapIsEmpty!1951 mapRes!1951))

(declare-fun b!34955 () Bool)

(declare-fun e!22101 () Bool)

(assert (=> b!34955 (= e!22101 tp_is_empty!1603)))

(declare-fun b!34956 () Bool)

(declare-fun res!21251 () Bool)

(assert (=> b!34956 (=> (not res!21251) (not e!22105))))

(declare-fun arrayContainsKey!0 (array!2421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34956 (= res!21251 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34957 () Bool)

(declare-fun e!22104 () Bool)

(assert (=> b!34957 (= e!22104 (and e!22103 mapRes!1951))))

(declare-fun condMapEmpty!1951 () Bool)

(declare-fun mapDefault!1951 () ValueCell!602)

