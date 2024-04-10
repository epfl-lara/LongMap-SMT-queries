; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41322 () Bool)

(assert start!41322)

(declare-fun mapIsEmpty!20356 () Bool)

(declare-fun mapRes!20356 () Bool)

(assert (=> mapIsEmpty!20356 mapRes!20356))

(declare-fun b!462079 () Bool)

(declare-fun e!269559 () Bool)

(declare-fun tp_is_empty!12461 () Bool)

(assert (=> b!462079 (= e!269559 tp_is_empty!12461)))

(declare-fun b!462080 () Bool)

(declare-fun res!276371 () Bool)

(declare-fun e!269561 () Bool)

(assert (=> b!462080 (=> (not res!276371) (not e!269561))))

(declare-datatypes ((array!28721 0))(
  ( (array!28722 (arr!13796 (Array (_ BitVec 32) (_ BitVec 64))) (size!14148 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28721)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28721 (_ BitVec 32)) Bool)

(assert (=> b!462080 (= res!276371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462081 () Bool)

(declare-fun e!269560 () Bool)

(declare-fun e!269563 () Bool)

(assert (=> b!462081 (= e!269560 (and e!269563 mapRes!20356))))

(declare-fun condMapEmpty!20356 () Bool)

(declare-datatypes ((V!17719 0))(
  ( (V!17720 (val!6275 Int)) )
))
(declare-datatypes ((ValueCell!5887 0))(
  ( (ValueCellFull!5887 (v!8561 V!17719)) (EmptyCell!5887) )
))
(declare-datatypes ((array!28723 0))(
  ( (array!28724 (arr!13797 (Array (_ BitVec 32) ValueCell!5887)) (size!14149 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28723)

(declare-fun mapDefault!20356 () ValueCell!5887)

