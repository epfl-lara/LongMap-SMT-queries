; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107178 () Bool)

(assert start!107178)

(declare-fun b!1270625 () Bool)

(declare-fun e!724336 () Bool)

(declare-fun e!724335 () Bool)

(declare-fun mapRes!50881 () Bool)

(assert (=> b!1270625 (= e!724336 (and e!724335 mapRes!50881))))

(declare-fun condMapEmpty!50881 () Bool)

(declare-datatypes ((V!49015 0))(
  ( (V!49016 (val!16508 Int)) )
))
(declare-datatypes ((ValueCell!15580 0))(
  ( (ValueCellFull!15580 (v!19145 V!49015)) (EmptyCell!15580) )
))
(declare-datatypes ((array!82994 0))(
  ( (array!82995 (arr!40034 (Array (_ BitVec 32) ValueCell!15580)) (size!40570 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82994)

(declare-fun mapDefault!50881 () ValueCell!15580)

