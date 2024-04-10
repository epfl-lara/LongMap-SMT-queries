; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38476 () Bool)

(assert start!38476)

(declare-fun b!397178 () Bool)

(declare-fun res!228005 () Bool)

(declare-fun e!240238 () Bool)

(assert (=> b!397178 (=> (not res!228005) (not e!240238))))

(declare-datatypes ((array!23703 0))(
  ( (array!23704 (arr!11301 (Array (_ BitVec 32) (_ BitVec 64))) (size!11653 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23703)

(declare-datatypes ((V!14299 0))(
  ( (V!14300 (val!4992 Int)) )
))
(declare-datatypes ((ValueCell!4604 0))(
  ( (ValueCellFull!4604 (v!7239 V!14299)) (EmptyCell!4604) )
))
(declare-datatypes ((array!23705 0))(
  ( (array!23706 (arr!11302 (Array (_ BitVec 32) ValueCell!4604)) (size!11654 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23705)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397178 (= res!228005 (and (= (size!11654 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11653 _keys!709) (size!11654 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397179 () Bool)

(declare-fun res!228008 () Bool)

(assert (=> b!397179 (=> (not res!228008) (not e!240238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397179 (= res!228008 (validMask!0 mask!1025))))

(declare-fun b!397180 () Bool)

(declare-fun e!240239 () Bool)

(declare-fun tp_is_empty!9895 () Bool)

(assert (=> b!397180 (= e!240239 tp_is_empty!9895)))

(declare-fun b!397181 () Bool)

(declare-fun e!240240 () Bool)

(declare-fun mapRes!16464 () Bool)

(assert (=> b!397181 (= e!240240 (and e!240239 mapRes!16464))))

(declare-fun condMapEmpty!16464 () Bool)

(declare-fun mapDefault!16464 () ValueCell!4604)

