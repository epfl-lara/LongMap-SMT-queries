; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38810 () Bool)

(assert start!38810)

(declare-fun b!404987 () Bool)

(declare-fun res!233667 () Bool)

(declare-fun e!243567 () Bool)

(assert (=> b!404987 (=> (not res!233667) (not e!243567))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404987 (= res!233667 (validMask!0 mask!1025))))

(declare-fun b!404988 () Bool)

(declare-fun res!233664 () Bool)

(assert (=> b!404988 (=> (not res!233664) (not e!243567))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404988 (= res!233664 (validKeyInArray!0 k!794))))

(declare-fun b!404989 () Bool)

(declare-fun e!243568 () Bool)

(assert (=> b!404989 (= e!243568 false)))

(declare-fun lt!188267 () Bool)

(declare-datatypes ((array!24353 0))(
  ( (array!24354 (arr!11626 (Array (_ BitVec 32) (_ BitVec 64))) (size!11978 (_ BitVec 32))) )
))
(declare-fun lt!188266 () array!24353)

(declare-datatypes ((List!6766 0))(
  ( (Nil!6763) (Cons!6762 (h!7618 (_ BitVec 64)) (t!11940 List!6766)) )
))
(declare-fun arrayNoDuplicates!0 (array!24353 (_ BitVec 32) List!6766) Bool)

(assert (=> b!404989 (= lt!188267 (arrayNoDuplicates!0 lt!188266 #b00000000000000000000000000000000 Nil!6763))))

(declare-fun b!404990 () Bool)

(declare-fun e!243569 () Bool)

(declare-fun tp_is_empty!10229 () Bool)

(assert (=> b!404990 (= e!243569 tp_is_empty!10229)))

(declare-fun b!404991 () Bool)

(declare-fun res!233658 () Bool)

(assert (=> b!404991 (=> (not res!233658) (not e!243567))))

(declare-fun _keys!709 () array!24353)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14743 0))(
  ( (V!14744 (val!5159 Int)) )
))
(declare-datatypes ((ValueCell!4771 0))(
  ( (ValueCellFull!4771 (v!7406 V!14743)) (EmptyCell!4771) )
))
(declare-datatypes ((array!24355 0))(
  ( (array!24356 (arr!11627 (Array (_ BitVec 32) ValueCell!4771)) (size!11979 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24355)

(assert (=> b!404991 (= res!233658 (and (= (size!11979 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11978 _keys!709) (size!11979 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16965 () Bool)

(declare-fun mapRes!16965 () Bool)

(declare-fun tp!33084 () Bool)

(assert (=> mapNonEmpty!16965 (= mapRes!16965 (and tp!33084 e!243569))))

(declare-fun mapValue!16965 () ValueCell!4771)

(declare-fun mapRest!16965 () (Array (_ BitVec 32) ValueCell!4771))

(declare-fun mapKey!16965 () (_ BitVec 32))

(assert (=> mapNonEmpty!16965 (= (arr!11627 _values!549) (store mapRest!16965 mapKey!16965 mapValue!16965))))

(declare-fun b!404992 () Bool)

(declare-fun res!233666 () Bool)

(assert (=> b!404992 (=> (not res!233666) (not e!243567))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404992 (= res!233666 (or (= (select (arr!11626 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11626 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404993 () Bool)

(declare-fun res!233661 () Bool)

(assert (=> b!404993 (=> (not res!233661) (not e!243567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24353 (_ BitVec 32)) Bool)

(assert (=> b!404993 (= res!233661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404994 () Bool)

(declare-fun e!243566 () Bool)

(declare-fun e!243565 () Bool)

(assert (=> b!404994 (= e!243566 (and e!243565 mapRes!16965))))

(declare-fun condMapEmpty!16965 () Bool)

(declare-fun mapDefault!16965 () ValueCell!4771)

