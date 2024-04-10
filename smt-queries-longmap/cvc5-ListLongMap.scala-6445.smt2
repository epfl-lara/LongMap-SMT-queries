; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82510 () Bool)

(assert start!82510)

(declare-fun mapIsEmpty!34162 () Bool)

(declare-fun mapRes!34162 () Bool)

(assert (=> mapIsEmpty!34162 mapRes!34162))

(declare-fun b!961568 () Bool)

(declare-fun e!542206 () Bool)

(declare-fun tp_is_empty!21445 () Bool)

(assert (=> b!961568 (= e!542206 tp_is_empty!21445)))

(declare-fun b!961569 () Bool)

(declare-fun res!643540 () Bool)

(declare-fun e!542207 () Bool)

(assert (=> b!961569 (=> (not res!643540) (not e!542207))))

(declare-datatypes ((array!58987 0))(
  ( (array!58988 (arr!28362 (Array (_ BitVec 32) (_ BitVec 64))) (size!28841 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58987)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58987 (_ BitVec 32)) Bool)

(assert (=> b!961569 (= res!643540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961570 () Bool)

(declare-fun res!643539 () Bool)

(assert (=> b!961570 (=> (not res!643539) (not e!542207))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33577 0))(
  ( (V!33578 (val!10773 Int)) )
))
(declare-datatypes ((ValueCell!10241 0))(
  ( (ValueCellFull!10241 (v!13331 V!33577)) (EmptyCell!10241) )
))
(declare-datatypes ((array!58989 0))(
  ( (array!58990 (arr!28363 (Array (_ BitVec 32) ValueCell!10241)) (size!28842 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58989)

(assert (=> b!961570 (= res!643539 (and (= (size!28842 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28841 _keys!1686) (size!28842 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961571 () Bool)

(assert (=> b!961571 (= e!542207 false)))

(declare-fun lt!430777 () Bool)

(declare-datatypes ((List!19694 0))(
  ( (Nil!19691) (Cons!19690 (h!20852 (_ BitVec 64)) (t!28057 List!19694)) )
))
(declare-fun arrayNoDuplicates!0 (array!58987 (_ BitVec 32) List!19694) Bool)

(assert (=> b!961571 (= lt!430777 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19691))))

(declare-fun res!643538 () Bool)

(assert (=> start!82510 (=> (not res!643538) (not e!542207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82510 (= res!643538 (validMask!0 mask!2110))))

(assert (=> start!82510 e!542207))

(assert (=> start!82510 true))

(declare-fun e!542210 () Bool)

(declare-fun array_inv!21979 (array!58989) Bool)

(assert (=> start!82510 (and (array_inv!21979 _values!1400) e!542210)))

(declare-fun array_inv!21980 (array!58987) Bool)

(assert (=> start!82510 (array_inv!21980 _keys!1686)))

(declare-fun b!961572 () Bool)

(declare-fun e!542209 () Bool)

(assert (=> b!961572 (= e!542209 tp_is_empty!21445)))

(declare-fun b!961573 () Bool)

(assert (=> b!961573 (= e!542210 (and e!542206 mapRes!34162))))

(declare-fun condMapEmpty!34162 () Bool)

(declare-fun mapDefault!34162 () ValueCell!10241)

