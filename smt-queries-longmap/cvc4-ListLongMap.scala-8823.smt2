; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107166 () Bool)

(assert start!107166)

(declare-fun b!1270517 () Bool)

(declare-fun e!724245 () Bool)

(declare-fun e!724246 () Bool)

(declare-fun mapRes!50863 () Bool)

(assert (=> b!1270517 (= e!724245 (and e!724246 mapRes!50863))))

(declare-fun condMapEmpty!50863 () Bool)

(declare-datatypes ((V!48999 0))(
  ( (V!49000 (val!16502 Int)) )
))
(declare-datatypes ((ValueCell!15574 0))(
  ( (ValueCellFull!15574 (v!19139 V!48999)) (EmptyCell!15574) )
))
(declare-datatypes ((array!82972 0))(
  ( (array!82973 (arr!40023 (Array (_ BitVec 32) ValueCell!15574)) (size!40559 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82972)

(declare-fun mapDefault!50863 () ValueCell!15574)

