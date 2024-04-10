; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100192 () Bool)

(assert start!100192)

(declare-fun mapIsEmpty!47246 () Bool)

(declare-fun mapRes!47246 () Bool)

(assert (=> mapIsEmpty!47246 mapRes!47246))

(declare-fun b!1194881 () Bool)

(declare-fun res!795043 () Bool)

(declare-fun e!679034 () Bool)

(assert (=> b!1194881 (=> (not res!795043) (not e!679034))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194881 (= res!795043 (validMask!0 mask!1564))))

(declare-fun b!1194882 () Bool)

(declare-fun e!679033 () Bool)

(declare-fun e!679030 () Bool)

(assert (=> b!1194882 (= e!679033 (and e!679030 mapRes!47246))))

(declare-fun condMapEmpty!47246 () Bool)

(declare-datatypes ((V!45493 0))(
  ( (V!45494 (val!15194 Int)) )
))
(declare-datatypes ((ValueCell!14428 0))(
  ( (ValueCellFull!14428 (v!17832 V!45493)) (EmptyCell!14428) )
))
(declare-datatypes ((array!77331 0))(
  ( (array!77332 (arr!37313 (Array (_ BitVec 32) ValueCell!14428)) (size!37849 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77331)

(declare-fun mapDefault!47246 () ValueCell!14428)

