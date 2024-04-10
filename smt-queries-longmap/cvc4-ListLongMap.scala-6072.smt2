; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78544 () Bool)

(assert start!78544)

(declare-fun b!915588 () Bool)

(declare-fun res!617283 () Bool)

(declare-fun e!513898 () Bool)

(assert (=> b!915588 (=> (not res!617283) (not e!513898))))

(declare-datatypes ((array!54526 0))(
  ( (array!54527 (arr!26208 (Array (_ BitVec 32) (_ BitVec 64))) (size!26667 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54526)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30651 0))(
  ( (V!30652 (val!9683 Int)) )
))
(declare-datatypes ((ValueCell!9151 0))(
  ( (ValueCellFull!9151 (v!12201 V!30651)) (EmptyCell!9151) )
))
(declare-datatypes ((array!54528 0))(
  ( (array!54529 (arr!26209 (Array (_ BitVec 32) ValueCell!9151)) (size!26668 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54528)

(assert (=> b!915588 (= res!617283 (and (= (size!26668 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26667 _keys!1487) (size!26668 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30654 () Bool)

(declare-fun mapRes!30654 () Bool)

(assert (=> mapIsEmpty!30654 mapRes!30654))

(declare-fun mapNonEmpty!30654 () Bool)

(declare-fun tp!58721 () Bool)

(declare-fun e!513900 () Bool)

(assert (=> mapNonEmpty!30654 (= mapRes!30654 (and tp!58721 e!513900))))

(declare-fun mapKey!30654 () (_ BitVec 32))

(declare-fun mapValue!30654 () ValueCell!9151)

(declare-fun mapRest!30654 () (Array (_ BitVec 32) ValueCell!9151))

(assert (=> mapNonEmpty!30654 (= (arr!26209 _values!1231) (store mapRest!30654 mapKey!30654 mapValue!30654))))

(declare-fun b!915589 () Bool)

(declare-fun res!617284 () Bool)

(assert (=> b!915589 (=> (not res!617284) (not e!513898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54526 (_ BitVec 32)) Bool)

(assert (=> b!915589 (= res!617284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915590 () Bool)

(declare-fun tp_is_empty!19265 () Bool)

(assert (=> b!915590 (= e!513900 tp_is_empty!19265)))

(declare-fun b!915591 () Bool)

(declare-fun e!513899 () Bool)

(assert (=> b!915591 (= e!513899 tp_is_empty!19265)))

(declare-fun b!915593 () Bool)

(assert (=> b!915593 (= e!513898 false)))

(declare-fun lt!411697 () Bool)

(declare-datatypes ((List!18380 0))(
  ( (Nil!18377) (Cons!18376 (h!19522 (_ BitVec 64)) (t!25993 List!18380)) )
))
(declare-fun arrayNoDuplicates!0 (array!54526 (_ BitVec 32) List!18380) Bool)

(assert (=> b!915593 (= lt!411697 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18377))))

(declare-fun b!915592 () Bool)

(declare-fun e!513897 () Bool)

(assert (=> b!915592 (= e!513897 (and e!513899 mapRes!30654))))

(declare-fun condMapEmpty!30654 () Bool)

(declare-fun mapDefault!30654 () ValueCell!9151)

