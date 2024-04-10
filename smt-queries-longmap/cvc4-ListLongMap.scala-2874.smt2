; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41368 () Bool)

(assert start!41368)

(declare-fun mapIsEmpty!20398 () Bool)

(declare-fun mapRes!20398 () Bool)

(assert (=> mapIsEmpty!20398 mapRes!20398))

(declare-fun res!276539 () Bool)

(declare-fun e!269802 () Bool)

(assert (=> start!41368 (=> (not res!276539) (not e!269802))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41368 (= res!276539 (validMask!0 mask!1365))))

(assert (=> start!41368 e!269802))

(assert (=> start!41368 true))

(declare-datatypes ((array!28771 0))(
  ( (array!28772 (arr!13819 (Array (_ BitVec 32) (_ BitVec 64))) (size!14171 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28771)

(declare-fun array_inv!9994 (array!28771) Bool)

(assert (=> start!41368 (array_inv!9994 _keys!1025)))

(declare-datatypes ((V!17751 0))(
  ( (V!17752 (val!6287 Int)) )
))
(declare-datatypes ((ValueCell!5899 0))(
  ( (ValueCellFull!5899 (v!8574 V!17751)) (EmptyCell!5899) )
))
(declare-datatypes ((array!28773 0))(
  ( (array!28774 (arr!13820 (Array (_ BitVec 32) ValueCell!5899)) (size!14172 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28773)

(declare-fun e!269801 () Bool)

(declare-fun array_inv!9995 (array!28773) Bool)

(assert (=> start!41368 (and (array_inv!9995 _values!833) e!269801)))

(declare-fun b!462383 () Bool)

(declare-fun res!276538 () Bool)

(assert (=> b!462383 (=> (not res!276538) (not e!269802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28771 (_ BitVec 32)) Bool)

(assert (=> b!462383 (= res!276538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20398 () Bool)

(declare-fun tp!39217 () Bool)

(declare-fun e!269798 () Bool)

(assert (=> mapNonEmpty!20398 (= mapRes!20398 (and tp!39217 e!269798))))

(declare-fun mapValue!20398 () ValueCell!5899)

(declare-fun mapKey!20398 () (_ BitVec 32))

(declare-fun mapRest!20398 () (Array (_ BitVec 32) ValueCell!5899))

(assert (=> mapNonEmpty!20398 (= (arr!13820 _values!833) (store mapRest!20398 mapKey!20398 mapValue!20398))))

(declare-fun b!462384 () Bool)

(declare-fun e!269799 () Bool)

(assert (=> b!462384 (= e!269801 (and e!269799 mapRes!20398))))

(declare-fun condMapEmpty!20398 () Bool)

(declare-fun mapDefault!20398 () ValueCell!5899)

