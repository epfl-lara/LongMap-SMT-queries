; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33410 () Bool)

(assert start!33410)

(declare-fun b!331781 () Bool)

(declare-fun res!182786 () Bool)

(declare-fun e!203614 () Bool)

(assert (=> b!331781 (=> (not res!182786) (not e!203614))))

(declare-datatypes ((array!16967 0))(
  ( (array!16968 (arr!8020 (Array (_ BitVec 32) (_ BitVec 64))) (size!8372 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16967)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16967 (_ BitVec 32)) Bool)

(assert (=> b!331781 (= res!182786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331782 () Bool)

(declare-fun e!203615 () Bool)

(declare-fun tp_is_empty!6685 () Bool)

(assert (=> b!331782 (= e!203615 tp_is_empty!6685)))

(declare-fun b!331783 () Bool)

(declare-fun res!182785 () Bool)

(assert (=> b!331783 (=> (not res!182785) (not e!203614))))

(declare-datatypes ((V!9891 0))(
  ( (V!9892 (val!3387 Int)) )
))
(declare-datatypes ((ValueCell!2999 0))(
  ( (ValueCellFull!2999 (v!5545 V!9891)) (EmptyCell!2999) )
))
(declare-datatypes ((array!16969 0))(
  ( (array!16970 (arr!8021 (Array (_ BitVec 32) ValueCell!2999)) (size!8373 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16969)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331783 (= res!182785 (and (= (size!8373 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8372 _keys!1895) (size!8373 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331784 () Bool)

(declare-fun e!203616 () Bool)

(declare-fun mapRes!11406 () Bool)

(assert (=> b!331784 (= e!203616 (and e!203615 mapRes!11406))))

(declare-fun condMapEmpty!11406 () Bool)

(declare-fun mapDefault!11406 () ValueCell!2999)

