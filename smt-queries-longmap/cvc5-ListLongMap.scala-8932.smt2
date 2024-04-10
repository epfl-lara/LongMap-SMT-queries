; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108318 () Bool)

(assert start!108318)

(declare-fun b!1278533 () Bool)

(declare-fun e!730353 () Bool)

(declare-fun e!730355 () Bool)

(declare-fun mapRes!51809 () Bool)

(assert (=> b!1278533 (= e!730353 (and e!730355 mapRes!51809))))

(declare-fun condMapEmpty!51809 () Bool)

(declare-datatypes ((V!49777 0))(
  ( (V!49778 (val!16827 Int)) )
))
(declare-datatypes ((ValueCell!15854 0))(
  ( (ValueCellFull!15854 (v!19427 V!49777)) (EmptyCell!15854) )
))
(declare-datatypes ((array!84106 0))(
  ( (array!84107 (arr!40557 (Array (_ BitVec 32) ValueCell!15854)) (size!41107 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84106)

(declare-fun mapDefault!51809 () ValueCell!15854)

