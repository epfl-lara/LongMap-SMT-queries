; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107024 () Bool)

(assert start!107024)

(declare-fun b!1268915 () Bool)

(declare-fun e!723182 () Bool)

(declare-fun e!723181 () Bool)

(declare-fun mapRes!50650 () Bool)

(assert (=> b!1268915 (= e!723182 (and e!723181 mapRes!50650))))

(declare-fun condMapEmpty!50650 () Bool)

(declare-datatypes ((V!48811 0))(
  ( (V!48812 (val!16431 Int)) )
))
(declare-datatypes ((ValueCell!15503 0))(
  ( (ValueCellFull!15503 (v!19068 V!48811)) (EmptyCell!15503) )
))
(declare-datatypes ((array!82696 0))(
  ( (array!82697 (arr!39885 (Array (_ BitVec 32) ValueCell!15503)) (size!40421 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82696)

(declare-fun mapDefault!50650 () ValueCell!15503)

