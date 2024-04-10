; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82508 () Bool)

(assert start!82508)

(declare-fun b!961550 () Bool)

(declare-fun e!542194 () Bool)

(declare-fun tp_is_empty!21443 () Bool)

(assert (=> b!961550 (= e!542194 tp_is_empty!21443)))

(declare-fun b!961551 () Bool)

(declare-fun res!643530 () Bool)

(declare-fun e!542195 () Bool)

(assert (=> b!961551 (=> (not res!643530) (not e!542195))))

(declare-datatypes ((array!58983 0))(
  ( (array!58984 (arr!28360 (Array (_ BitVec 32) (_ BitVec 64))) (size!28839 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58983)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58983 (_ BitVec 32)) Bool)

(assert (=> b!961551 (= res!643530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34159 () Bool)

(declare-fun mapRes!34159 () Bool)

(assert (=> mapIsEmpty!34159 mapRes!34159))

(declare-fun res!643531 () Bool)

(assert (=> start!82508 (=> (not res!643531) (not e!542195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82508 (= res!643531 (validMask!0 mask!2110))))

(assert (=> start!82508 e!542195))

(assert (=> start!82508 true))

(declare-datatypes ((V!33573 0))(
  ( (V!33574 (val!10772 Int)) )
))
(declare-datatypes ((ValueCell!10240 0))(
  ( (ValueCellFull!10240 (v!13330 V!33573)) (EmptyCell!10240) )
))
(declare-datatypes ((array!58985 0))(
  ( (array!58986 (arr!28361 (Array (_ BitVec 32) ValueCell!10240)) (size!28840 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58985)

(declare-fun e!542193 () Bool)

(declare-fun array_inv!21977 (array!58985) Bool)

(assert (=> start!82508 (and (array_inv!21977 _values!1400) e!542193)))

(declare-fun array_inv!21978 (array!58983) Bool)

(assert (=> start!82508 (array_inv!21978 _keys!1686)))

(declare-fun b!961552 () Bool)

(declare-fun e!542192 () Bool)

(assert (=> b!961552 (= e!542192 tp_is_empty!21443)))

(declare-fun mapNonEmpty!34159 () Bool)

(declare-fun tp!65088 () Bool)

(assert (=> mapNonEmpty!34159 (= mapRes!34159 (and tp!65088 e!542192))))

(declare-fun mapKey!34159 () (_ BitVec 32))

(declare-fun mapRest!34159 () (Array (_ BitVec 32) ValueCell!10240))

(declare-fun mapValue!34159 () ValueCell!10240)

(assert (=> mapNonEmpty!34159 (= (arr!28361 _values!1400) (store mapRest!34159 mapKey!34159 mapValue!34159))))

(declare-fun b!961553 () Bool)

(declare-fun res!643529 () Bool)

(assert (=> b!961553 (=> (not res!643529) (not e!542195))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961553 (= res!643529 (and (= (size!28840 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28839 _keys!1686) (size!28840 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961554 () Bool)

(assert (=> b!961554 (= e!542193 (and e!542194 mapRes!34159))))

(declare-fun condMapEmpty!34159 () Bool)

(declare-fun mapDefault!34159 () ValueCell!10240)

