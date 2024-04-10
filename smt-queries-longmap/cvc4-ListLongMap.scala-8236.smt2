; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100350 () Bool)

(assert start!100350)

(declare-fun b!1197566 () Bool)

(declare-fun e!680332 () Bool)

(declare-fun e!680330 () Bool)

(declare-fun mapRes!47432 () Bool)

(assert (=> b!1197566 (= e!680332 (and e!680330 mapRes!47432))))

(declare-fun condMapEmpty!47432 () Bool)

(declare-datatypes ((V!45653 0))(
  ( (V!45654 (val!15254 Int)) )
))
(declare-datatypes ((ValueCell!14488 0))(
  ( (ValueCellFull!14488 (v!17892 V!45653)) (EmptyCell!14488) )
))
(declare-datatypes ((array!77569 0))(
  ( (array!77570 (arr!37430 (Array (_ BitVec 32) ValueCell!14488)) (size!37966 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77569)

(declare-fun mapDefault!47432 () ValueCell!14488)

