; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107244 () Bool)

(assert start!107244)

(declare-fun b!1271219 () Bool)

(declare-fun e!724829 () Bool)

(declare-fun e!724832 () Bool)

(declare-fun mapRes!50980 () Bool)

(assert (=> b!1271219 (= e!724829 (and e!724832 mapRes!50980))))

(declare-fun condMapEmpty!50980 () Bool)

(declare-datatypes ((V!49103 0))(
  ( (V!49104 (val!16541 Int)) )
))
(declare-datatypes ((ValueCell!15613 0))(
  ( (ValueCellFull!15613 (v!19178 V!49103)) (EmptyCell!15613) )
))
(declare-datatypes ((array!83120 0))(
  ( (array!83121 (arr!40097 (Array (_ BitVec 32) ValueCell!15613)) (size!40633 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83120)

(declare-fun mapDefault!50980 () ValueCell!15613)

