; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33368 () Bool)

(assert start!33368)

(declare-fun b!331571 () Bool)

(declare-fun e!203427 () Bool)

(declare-fun tp_is_empty!6665 () Bool)

(assert (=> b!331571 (= e!203427 tp_is_empty!6665)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun b!331572 () Bool)

(declare-fun e!203431 () Bool)

(declare-datatypes ((V!9863 0))(
  ( (V!9864 (val!3377 Int)) )
))
(declare-datatypes ((ValueCell!2989 0))(
  ( (ValueCellFull!2989 (v!5535 V!9863)) (EmptyCell!2989) )
))
(declare-datatypes ((array!16921 0))(
  ( (array!16922 (arr!8000 (Array (_ BitVec 32) ValueCell!2989)) (size!8352 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16921)

(declare-datatypes ((array!16923 0))(
  ( (array!16924 (arr!8001 (Array (_ BitVec 32) (_ BitVec 64))) (size!8353 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16923)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331572 (= e!203431 (and (= (size!8352 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8353 _keys!1895) (size!8352 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (not (= (size!8353 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun b!331573 () Bool)

(declare-fun e!203429 () Bool)

(declare-fun e!203428 () Bool)

(declare-fun mapRes!11367 () Bool)

(assert (=> b!331573 (= e!203429 (and e!203428 mapRes!11367))))

(declare-fun condMapEmpty!11367 () Bool)

(declare-fun mapDefault!11367 () ValueCell!2989)

