; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106890 () Bool)

(assert start!106890)

(declare-fun b!1267993 () Bool)

(declare-fun e!722409 () Bool)

(declare-fun e!722411 () Bool)

(declare-fun mapRes!50500 () Bool)

(assert (=> b!1267993 (= e!722409 (and e!722411 mapRes!50500))))

(declare-fun condMapEmpty!50500 () Bool)

(declare-datatypes ((V!48691 0))(
  ( (V!48692 (val!16386 Int)) )
))
(declare-datatypes ((ValueCell!15458 0))(
  ( (ValueCellFull!15458 (v!19022 V!48691)) (EmptyCell!15458) )
))
(declare-datatypes ((array!82514 0))(
  ( (array!82515 (arr!39799 (Array (_ BitVec 32) ValueCell!15458)) (size!40335 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82514)

(declare-fun mapDefault!50500 () ValueCell!15458)

