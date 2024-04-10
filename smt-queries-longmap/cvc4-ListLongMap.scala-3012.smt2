; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42410 () Bool)

(assert start!42410)

(declare-fun b_free!11885 () Bool)

(declare-fun b_next!11885 () Bool)

(assert (=> start!42410 (= b_free!11885 (not b_next!11885))))

(declare-fun tp!41688 () Bool)

(declare-fun b_and!20341 () Bool)

(assert (=> start!42410 (= tp!41688 b_and!20341)))

(declare-fun b!473192 () Bool)

(declare-fun e!277566 () Bool)

(declare-fun tp_is_empty!13313 () Bool)

(assert (=> b!473192 (= e!277566 tp_is_empty!13313)))

(declare-fun res!282642 () Bool)

(declare-fun e!277570 () Bool)

(assert (=> start!42410 (=> (not res!282642) (not e!277570))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42410 (= res!282642 (validMask!0 mask!1365))))

(assert (=> start!42410 e!277570))

(assert (=> start!42410 tp_is_empty!13313))

(assert (=> start!42410 tp!41688))

(assert (=> start!42410 true))

(declare-datatypes ((array!30385 0))(
  ( (array!30386 (arr!14612 (Array (_ BitVec 32) (_ BitVec 64))) (size!14964 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30385)

(declare-fun array_inv!10542 (array!30385) Bool)

(assert (=> start!42410 (array_inv!10542 _keys!1025)))

(declare-datatypes ((V!18855 0))(
  ( (V!18856 (val!6701 Int)) )
))
(declare-datatypes ((ValueCell!6313 0))(
  ( (ValueCellFull!6313 (v!8992 V!18855)) (EmptyCell!6313) )
))
(declare-datatypes ((array!30387 0))(
  ( (array!30388 (arr!14613 (Array (_ BitVec 32) ValueCell!6313)) (size!14965 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30387)

(declare-fun e!277569 () Bool)

(declare-fun array_inv!10543 (array!30387) Bool)

(assert (=> start!42410 (and (array_inv!10543 _values!833) e!277569)))

(declare-fun mapNonEmpty!21682 () Bool)

(declare-fun mapRes!21682 () Bool)

(declare-fun tp!41689 () Bool)

(declare-fun e!277567 () Bool)

(assert (=> mapNonEmpty!21682 (= mapRes!21682 (and tp!41689 e!277567))))

(declare-fun mapValue!21682 () ValueCell!6313)

(declare-fun mapKey!21682 () (_ BitVec 32))

(declare-fun mapRest!21682 () (Array (_ BitVec 32) ValueCell!6313))

(assert (=> mapNonEmpty!21682 (= (arr!14613 _values!833) (store mapRest!21682 mapKey!21682 mapValue!21682))))

(declare-fun b!473193 () Bool)

(assert (=> b!473193 (= e!277569 (and e!277566 mapRes!21682))))

(declare-fun condMapEmpty!21682 () Bool)

(declare-fun mapDefault!21682 () ValueCell!6313)

