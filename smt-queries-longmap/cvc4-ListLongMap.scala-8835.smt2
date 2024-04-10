; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107238 () Bool)

(assert start!107238)

(declare-fun b!1271165 () Bool)

(declare-fun e!724785 () Bool)

(declare-fun e!724787 () Bool)

(declare-fun mapRes!50971 () Bool)

(assert (=> b!1271165 (= e!724785 (and e!724787 mapRes!50971))))

(declare-fun condMapEmpty!50971 () Bool)

(declare-datatypes ((V!49095 0))(
  ( (V!49096 (val!16538 Int)) )
))
(declare-datatypes ((ValueCell!15610 0))(
  ( (ValueCellFull!15610 (v!19175 V!49095)) (EmptyCell!15610) )
))
(declare-datatypes ((array!83110 0))(
  ( (array!83111 (arr!40092 (Array (_ BitVec 32) ValueCell!15610)) (size!40628 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83110)

(declare-fun mapDefault!50971 () ValueCell!15610)

