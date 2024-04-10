; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107030 () Bool)

(assert start!107030)

(declare-fun b!1268969 () Bool)

(declare-fun e!723224 () Bool)

(declare-fun e!723228 () Bool)

(declare-fun mapRes!50659 () Bool)

(assert (=> b!1268969 (= e!723224 (and e!723228 mapRes!50659))))

(declare-fun condMapEmpty!50659 () Bool)

(declare-datatypes ((V!48819 0))(
  ( (V!48820 (val!16434 Int)) )
))
(declare-datatypes ((ValueCell!15506 0))(
  ( (ValueCellFull!15506 (v!19071 V!48819)) (EmptyCell!15506) )
))
(declare-datatypes ((array!82706 0))(
  ( (array!82707 (arr!39890 (Array (_ BitVec 32) ValueCell!15506)) (size!40426 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82706)

(declare-fun mapDefault!50659 () ValueCell!15506)

