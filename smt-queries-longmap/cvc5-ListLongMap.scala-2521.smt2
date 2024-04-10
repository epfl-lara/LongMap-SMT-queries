; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38944 () Bool)

(assert start!38944)

(declare-fun b!407600 () Bool)

(declare-fun res!235668 () Bool)

(declare-fun e!244775 () Bool)

(assert (=> b!407600 (=> (not res!235668) (not e!244775))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407600 (= res!235668 (validKeyInArray!0 k!794))))

(declare-fun b!407601 () Bool)

(declare-fun res!235676 () Bool)

(assert (=> b!407601 (=> (not res!235676) (not e!244775))))

(declare-datatypes ((array!24607 0))(
  ( (array!24608 (arr!11753 (Array (_ BitVec 32) (_ BitVec 64))) (size!12105 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24607)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14923 0))(
  ( (V!14924 (val!5226 Int)) )
))
(declare-datatypes ((ValueCell!4838 0))(
  ( (ValueCellFull!4838 (v!7473 V!14923)) (EmptyCell!4838) )
))
(declare-datatypes ((array!24609 0))(
  ( (array!24610 (arr!11754 (Array (_ BitVec 32) ValueCell!4838)) (size!12106 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24609)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!407601 (= res!235676 (and (= (size!12106 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12105 _keys!709) (size!12106 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407602 () Bool)

(declare-fun res!235669 () Bool)

(assert (=> b!407602 (=> (not res!235669) (not e!244775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24607 (_ BitVec 32)) Bool)

(assert (=> b!407602 (= res!235669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407603 () Bool)

(declare-fun res!235673 () Bool)

(assert (=> b!407603 (=> (not res!235673) (not e!244775))))

(declare-datatypes ((List!6817 0))(
  ( (Nil!6814) (Cons!6813 (h!7669 (_ BitVec 64)) (t!11991 List!6817)) )
))
(declare-fun arrayNoDuplicates!0 (array!24607 (_ BitVec 32) List!6817) Bool)

(assert (=> b!407603 (= res!235673 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6814))))

(declare-fun b!407604 () Bool)

(declare-fun e!244776 () Bool)

(declare-fun e!244773 () Bool)

(declare-fun mapRes!17166 () Bool)

(assert (=> b!407604 (= e!244776 (and e!244773 mapRes!17166))))

(declare-fun condMapEmpty!17166 () Bool)

(declare-fun mapDefault!17166 () ValueCell!4838)

