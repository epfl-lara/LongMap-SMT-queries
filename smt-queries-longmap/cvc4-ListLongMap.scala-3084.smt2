; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43400 () Bool)

(assert start!43400)

(declare-fun b_free!12227 () Bool)

(declare-fun b_next!12227 () Bool)

(assert (=> start!43400 (= b_free!12227 (not b_next!12227))))

(declare-fun tp!42958 () Bool)

(declare-fun b_and!20983 () Bool)

(assert (=> start!43400 (= tp!42958 b_and!20983)))

(declare-fun b!480957 () Bool)

(declare-fun e!282977 () Bool)

(declare-fun tp_is_empty!13739 () Bool)

(assert (=> b!480957 (= e!282977 tp_is_empty!13739)))

(declare-fun b!480958 () Bool)

(declare-fun e!282976 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480958 (= e!282976 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480959 () Bool)

(declare-fun e!282981 () Bool)

(declare-fun mapRes!22312 () Bool)

(assert (=> b!480959 (= e!282981 (and e!282977 mapRes!22312))))

(declare-fun condMapEmpty!22312 () Bool)

(declare-datatypes ((V!19389 0))(
  ( (V!19390 (val!6917 Int)) )
))
(declare-datatypes ((ValueCell!6508 0))(
  ( (ValueCellFull!6508 (v!9208 V!19389)) (EmptyCell!6508) )
))
(declare-datatypes ((array!31139 0))(
  ( (array!31140 (arr!14974 (Array (_ BitVec 32) ValueCell!6508)) (size!15332 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31139)

(declare-fun mapDefault!22312 () ValueCell!6508)

