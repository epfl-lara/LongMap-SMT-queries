; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33382 () Bool)

(assert start!33382)

(declare-fun b!331631 () Bool)

(declare-fun res!182716 () Bool)

(declare-fun e!203496 () Bool)

(assert (=> b!331631 (=> (not res!182716) (not e!203496))))

(declare-datatypes ((array!16939 0))(
  ( (array!16940 (arr!8008 (Array (_ BitVec 32) (_ BitVec 64))) (size!8360 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16939)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16939 (_ BitVec 32)) Bool)

(assert (=> b!331631 (= res!182716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331632 () Bool)

(declare-fun e!203497 () Bool)

(declare-fun tp_is_empty!6673 () Bool)

(assert (=> b!331632 (= e!203497 tp_is_empty!6673)))

(declare-fun res!182718 () Bool)

(assert (=> start!33382 (=> (not res!182718) (not e!203496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33382 (= res!182718 (validMask!0 mask!2385))))

(assert (=> start!33382 e!203496))

(assert (=> start!33382 true))

(declare-datatypes ((V!9875 0))(
  ( (V!9876 (val!3381 Int)) )
))
(declare-datatypes ((ValueCell!2993 0))(
  ( (ValueCellFull!2993 (v!5539 V!9875)) (EmptyCell!2993) )
))
(declare-datatypes ((array!16941 0))(
  ( (array!16942 (arr!8009 (Array (_ BitVec 32) ValueCell!2993)) (size!8361 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16941)

(declare-fun e!203494 () Bool)

(declare-fun array_inv!5966 (array!16941) Bool)

(assert (=> start!33382 (and (array_inv!5966 _values!1525) e!203494)))

(declare-fun array_inv!5967 (array!16939) Bool)

(assert (=> start!33382 (array_inv!5967 _keys!1895)))

(declare-fun mapIsEmpty!11382 () Bool)

(declare-fun mapRes!11382 () Bool)

(assert (=> mapIsEmpty!11382 mapRes!11382))

(declare-fun b!331633 () Bool)

(declare-fun e!203495 () Bool)

(assert (=> b!331633 (= e!203495 tp_is_empty!6673)))

(declare-fun b!331634 () Bool)

(assert (=> b!331634 (= e!203496 (bvsgt #b00000000000000000000000000000000 (size!8360 _keys!1895)))))

(declare-fun b!331635 () Bool)

(declare-fun res!182717 () Bool)

(assert (=> b!331635 (=> (not res!182717) (not e!203496))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331635 (= res!182717 (and (= (size!8361 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8360 _keys!1895) (size!8361 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331636 () Bool)

(assert (=> b!331636 (= e!203494 (and e!203495 mapRes!11382))))

(declare-fun condMapEmpty!11382 () Bool)

(declare-fun mapDefault!11382 () ValueCell!2993)

