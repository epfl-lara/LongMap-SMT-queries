; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43430 () Bool)

(assert start!43430)

(declare-fun b_free!12233 () Bool)

(declare-fun b_next!12233 () Bool)

(assert (=> start!43430 (= b_free!12233 (not b_next!12233))))

(declare-fun tp!42979 () Bool)

(declare-fun b_and!20991 () Bool)

(assert (=> start!43430 (= tp!42979 b_and!20991)))

(declare-fun b!481187 () Bool)

(declare-fun res!286909 () Bool)

(declare-fun e!283117 () Bool)

(assert (=> b!481187 (=> (not res!286909) (not e!283117))))

(declare-datatypes ((array!31151 0))(
  ( (array!31152 (arr!14979 (Array (_ BitVec 32) (_ BitVec 64))) (size!15337 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31151)

(declare-datatypes ((List!9156 0))(
  ( (Nil!9153) (Cons!9152 (h!10008 (_ BitVec 64)) (t!15368 List!9156)) )
))
(declare-fun arrayNoDuplicates!0 (array!31151 (_ BitVec 32) List!9156) Bool)

(assert (=> b!481187 (= res!286909 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9153))))

(declare-fun b!481188 () Bool)

(declare-fun e!283120 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481188 (= e!283120 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481189 () Bool)

(declare-fun arrayContainsKey!0 (array!31151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481189 (= e!283120 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!481190 () Bool)

(declare-fun e!283119 () Bool)

(declare-fun tp_is_empty!13745 () Bool)

(assert (=> b!481190 (= e!283119 tp_is_empty!13745)))

(declare-fun b!481191 () Bool)

(declare-fun res!286910 () Bool)

(assert (=> b!481191 (=> (not res!286910) (not e!283117))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19397 0))(
  ( (V!19398 (val!6920 Int)) )
))
(declare-fun minValue!1458 () V!19397)

(declare-fun zeroValue!1458 () V!19397)

(declare-datatypes ((ValueCell!6511 0))(
  ( (ValueCellFull!6511 (v!9212 V!19397)) (EmptyCell!6511) )
))
(declare-datatypes ((array!31153 0))(
  ( (array!31154 (arr!14980 (Array (_ BitVec 32) ValueCell!6511)) (size!15338 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31153)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9078 0))(
  ( (tuple2!9079 (_1!4550 (_ BitVec 64)) (_2!4550 V!19397)) )
))
(declare-datatypes ((List!9157 0))(
  ( (Nil!9154) (Cons!9153 (h!10009 tuple2!9078) (t!15369 List!9157)) )
))
(declare-datatypes ((ListLongMap!7991 0))(
  ( (ListLongMap!7992 (toList!4011 List!9157)) )
))
(declare-fun contains!2624 (ListLongMap!7991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2330 (array!31151 array!31153 (_ BitVec 32) (_ BitVec 32) V!19397 V!19397 (_ BitVec 32) Int) ListLongMap!7991)

(assert (=> b!481191 (= res!286910 (contains!2624 (getCurrentListMap!2330 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapIsEmpty!22324 () Bool)

(declare-fun mapRes!22324 () Bool)

(assert (=> mapIsEmpty!22324 mapRes!22324))

(declare-fun res!286907 () Bool)

(assert (=> start!43430 (=> (not res!286907) (not e!283117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43430 (= res!286907 (validMask!0 mask!2352))))

(assert (=> start!43430 e!283117))

(assert (=> start!43430 true))

(assert (=> start!43430 tp_is_empty!13745))

(declare-fun e!283118 () Bool)

(declare-fun array_inv!10802 (array!31153) Bool)

(assert (=> start!43430 (and (array_inv!10802 _values!1516) e!283118)))

(assert (=> start!43430 tp!42979))

(declare-fun array_inv!10803 (array!31151) Bool)

(assert (=> start!43430 (array_inv!10803 _keys!1874)))

(declare-fun b!481192 () Bool)

(declare-fun lt!218397 () (_ BitVec 32))

(assert (=> b!481192 (= e!283117 (not (or (not (= (size!15337 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvslt lt!218397 #b00000000000000000000000000000000) (bvsle lt!218397 (size!15337 _keys!1874)))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31151 (_ BitVec 32)) Bool)

(assert (=> b!481192 (arrayForallSeekEntryOrOpenFound!0 lt!218397 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14112 0))(
  ( (Unit!14113) )
))
(declare-fun lt!218396 () Unit!14112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14112)

(assert (=> b!481192 (= lt!218396 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218397))))

(declare-fun arrayScanForKey!0 (array!31151 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481192 (= lt!218397 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!481192 e!283120))

(declare-fun c!57869 () Bool)

(assert (=> b!481192 (= c!57869 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218398 () Unit!14112)

(declare-fun lemmaKeyInListMapIsInArray!128 (array!31151 array!31153 (_ BitVec 32) (_ BitVec 32) V!19397 V!19397 (_ BitVec 64) Int) Unit!14112)

(assert (=> b!481192 (= lt!218398 (lemmaKeyInListMapIsInArray!128 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!481193 () Bool)

(declare-fun e!283121 () Bool)

(assert (=> b!481193 (= e!283118 (and e!283121 mapRes!22324))))

(declare-fun condMapEmpty!22324 () Bool)

(declare-fun mapDefault!22324 () ValueCell!6511)

