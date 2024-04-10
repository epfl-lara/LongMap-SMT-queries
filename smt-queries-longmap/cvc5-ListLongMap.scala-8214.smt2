; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100162 () Bool)

(assert start!100162)

(declare-fun b!1194511 () Bool)

(declare-fun e!678848 () Bool)

(declare-fun e!678850 () Bool)

(declare-fun mapRes!47219 () Bool)

(assert (=> b!1194511 (= e!678848 (and e!678850 mapRes!47219))))

(declare-fun condMapEmpty!47219 () Bool)

(declare-datatypes ((V!45473 0))(
  ( (V!45474 (val!15186 Int)) )
))
(declare-datatypes ((ValueCell!14420 0))(
  ( (ValueCellFull!14420 (v!17824 V!45473)) (EmptyCell!14420) )
))
(declare-datatypes ((array!77299 0))(
  ( (array!77300 (arr!37298 (Array (_ BitVec 32) ValueCell!14420)) (size!37834 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77299)

(declare-fun mapDefault!47219 () ValueCell!14420)

