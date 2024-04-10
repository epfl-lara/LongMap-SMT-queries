; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101148 () Bool)

(assert start!101148)

(declare-fun b_free!26071 () Bool)

(declare-fun b_next!26071 () Bool)

(assert (=> start!101148 (= b_free!26071 (not b_next!26071))))

(declare-fun tp!91235 () Bool)

(declare-fun b_and!43259 () Bool)

(assert (=> start!101148 (= tp!91235 b_and!43259)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!689037 () Bool)

(declare-fun b!1213292 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!551582 () Bool)

(assert (=> b!1213292 (= e!689037 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551582) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213293 () Bool)

(declare-fun res!805669 () Bool)

(declare-fun e!689040 () Bool)

(assert (=> b!1213293 (=> (not res!805669) (not e!689040))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78337 0))(
  ( (array!78338 (arr!37803 (Array (_ BitVec 32) (_ BitVec 64))) (size!38339 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78337)

(assert (=> b!1213293 (= res!805669 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38339 _keys!1208))))))

(declare-fun mapIsEmpty!48037 () Bool)

(declare-fun mapRes!48037 () Bool)

(assert (=> mapIsEmpty!48037 mapRes!48037))

(declare-fun b!1213294 () Bool)

(declare-fun e!689045 () Bool)

(declare-fun e!689042 () Bool)

(assert (=> b!1213294 (= e!689045 (and e!689042 mapRes!48037))))

(declare-fun condMapEmpty!48037 () Bool)

(declare-datatypes ((V!46161 0))(
  ( (V!46162 (val!15444 Int)) )
))
(declare-datatypes ((ValueCell!14678 0))(
  ( (ValueCellFull!14678 (v!18097 V!46161)) (EmptyCell!14678) )
))
(declare-datatypes ((array!78339 0))(
  ( (array!78340 (arr!37804 (Array (_ BitVec 32) ValueCell!14678)) (size!38340 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78339)

(declare-fun mapDefault!48037 () ValueCell!14678)

