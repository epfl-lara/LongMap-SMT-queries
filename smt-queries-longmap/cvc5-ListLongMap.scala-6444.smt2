; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82504 () Bool)

(assert start!82504)

(declare-fun res!643513 () Bool)

(declare-fun e!542161 () Bool)

(assert (=> start!82504 (=> (not res!643513) (not e!542161))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82504 (= res!643513 (validMask!0 mask!2110))))

(assert (=> start!82504 e!542161))

(assert (=> start!82504 true))

(declare-datatypes ((V!33569 0))(
  ( (V!33570 (val!10770 Int)) )
))
(declare-datatypes ((ValueCell!10238 0))(
  ( (ValueCellFull!10238 (v!13328 V!33569)) (EmptyCell!10238) )
))
(declare-datatypes ((array!58975 0))(
  ( (array!58976 (arr!28356 (Array (_ BitVec 32) ValueCell!10238)) (size!28835 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58975)

(declare-fun e!542164 () Bool)

(declare-fun array_inv!21973 (array!58975) Bool)

(assert (=> start!82504 (and (array_inv!21973 _values!1400) e!542164)))

(declare-datatypes ((array!58977 0))(
  ( (array!58978 (arr!28357 (Array (_ BitVec 32) (_ BitVec 64))) (size!28836 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58977)

(declare-fun array_inv!21974 (array!58977) Bool)

(assert (=> start!82504 (array_inv!21974 _keys!1686)))

(declare-fun mapNonEmpty!34153 () Bool)

(declare-fun mapRes!34153 () Bool)

(declare-fun tp!65082 () Bool)

(declare-fun e!542165 () Bool)

(assert (=> mapNonEmpty!34153 (= mapRes!34153 (and tp!65082 e!542165))))

(declare-fun mapRest!34153 () (Array (_ BitVec 32) ValueCell!10238))

(declare-fun mapValue!34153 () ValueCell!10238)

(declare-fun mapKey!34153 () (_ BitVec 32))

(assert (=> mapNonEmpty!34153 (= (arr!28356 _values!1400) (store mapRest!34153 mapKey!34153 mapValue!34153))))

(declare-fun b!961514 () Bool)

(declare-fun e!542162 () Bool)

(declare-fun tp_is_empty!21439 () Bool)

(assert (=> b!961514 (= e!542162 tp_is_empty!21439)))

(declare-fun b!961515 () Bool)

(assert (=> b!961515 (= e!542164 (and e!542162 mapRes!34153))))

(declare-fun condMapEmpty!34153 () Bool)

(declare-fun mapDefault!34153 () ValueCell!10238)

