; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107940 () Bool)

(assert start!107940)

(declare-fun b!1275360 () Bool)

(declare-fun e!728050 () Bool)

(declare-fun e!728046 () Bool)

(declare-fun mapRes!51392 () Bool)

(assert (=> b!1275360 (= e!728050 (and e!728046 mapRes!51392))))

(declare-fun condMapEmpty!51392 () Bool)

(declare-datatypes ((V!49437 0))(
  ( (V!49438 (val!16700 Int)) )
))
(declare-datatypes ((ValueCell!15727 0))(
  ( (ValueCellFull!15727 (v!19296 V!49437)) (EmptyCell!15727) )
))
(declare-datatypes ((array!83610 0))(
  ( (array!83611 (arr!40321 (Array (_ BitVec 32) ValueCell!15727)) (size!40871 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83610)

(declare-fun mapDefault!51392 () ValueCell!15727)

