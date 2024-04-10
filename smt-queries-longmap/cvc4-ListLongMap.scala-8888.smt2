; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107928 () Bool)

(assert start!107928)

(declare-fun b!1275300 () Bool)

(declare-fun e!727996 () Bool)

(declare-fun e!727998 () Bool)

(declare-fun mapRes!51380 () Bool)

(assert (=> b!1275300 (= e!727996 (and e!727998 mapRes!51380))))

(declare-fun condMapEmpty!51380 () Bool)

(declare-datatypes ((V!49429 0))(
  ( (V!49430 (val!16697 Int)) )
))
(declare-datatypes ((ValueCell!15724 0))(
  ( (ValueCellFull!15724 (v!19293 V!49429)) (EmptyCell!15724) )
))
(declare-datatypes ((array!83598 0))(
  ( (array!83599 (arr!40316 (Array (_ BitVec 32) ValueCell!15724)) (size!40866 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83598)

(declare-fun mapDefault!51380 () ValueCell!15724)

