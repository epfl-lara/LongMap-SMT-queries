; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84382 () Bool)

(assert start!84382)

(declare-fun b_free!19969 () Bool)

(declare-fun b_next!19969 () Bool)

(assert (=> start!84382 (= b_free!19969 (not b_next!19969))))

(declare-fun tp!69682 () Bool)

(declare-fun b_and!32003 () Bool)

(assert (=> start!84382 (= tp!69682 b_and!32003)))

(declare-fun mapIsEmpty!36806 () Bool)

(declare-fun mapRes!36806 () Bool)

(assert (=> mapIsEmpty!36806 mapRes!36806))

(declare-fun b!987045 () Bool)

(declare-fun e!556598 () Bool)

(declare-fun tp_is_empty!23185 () Bool)

(assert (=> b!987045 (= e!556598 tp_is_empty!23185)))

(declare-fun b!987046 () Bool)

(declare-fun res!660348 () Bool)

(declare-fun e!556599 () Bool)

(assert (=> b!987046 (=> (not res!660348) (not e!556599))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987046 (= res!660348 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987047 () Bool)

(declare-fun e!556602 () Bool)

(declare-fun e!556600 () Bool)

(assert (=> b!987047 (= e!556602 (and e!556600 mapRes!36806))))

(declare-fun condMapEmpty!36806 () Bool)

(declare-datatypes ((V!35897 0))(
  ( (V!35898 (val!11643 Int)) )
))
(declare-datatypes ((ValueCell!11111 0))(
  ( (ValueCellFull!11111 (v!14205 V!35897)) (EmptyCell!11111) )
))
(declare-datatypes ((array!62327 0))(
  ( (array!62328 (arr!30021 (Array (_ BitVec 32) ValueCell!11111)) (size!30500 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62327)

(declare-fun mapDefault!36806 () ValueCell!11111)

