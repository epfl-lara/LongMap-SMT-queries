; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38954 () Bool)

(assert start!38954)

(declare-fun b!407795 () Bool)

(declare-fun res!235826 () Bool)

(declare-fun e!244862 () Bool)

(assert (=> b!407795 (=> (not res!235826) (not e!244862))))

(declare-datatypes ((array!24627 0))(
  ( (array!24628 (arr!11763 (Array (_ BitVec 32) (_ BitVec 64))) (size!12115 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24627)

(declare-datatypes ((List!6821 0))(
  ( (Nil!6818) (Cons!6817 (h!7673 (_ BitVec 64)) (t!11995 List!6821)) )
))
(declare-fun arrayNoDuplicates!0 (array!24627 (_ BitVec 32) List!6821) Bool)

(assert (=> b!407795 (= res!235826 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6818))))

(declare-fun b!407796 () Bool)

(declare-fun e!244861 () Bool)

(assert (=> b!407796 (= e!244861 false)))

(declare-fun lt!188698 () Bool)

(declare-fun lt!188699 () array!24627)

(assert (=> b!407796 (= lt!188698 (arrayNoDuplicates!0 lt!188699 #b00000000000000000000000000000000 Nil!6818))))

(declare-fun b!407797 () Bool)

(declare-fun res!235819 () Bool)

(assert (=> b!407797 (=> (not res!235819) (not e!244862))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14935 0))(
  ( (V!14936 (val!5231 Int)) )
))
(declare-datatypes ((ValueCell!4843 0))(
  ( (ValueCellFull!4843 (v!7478 V!14935)) (EmptyCell!4843) )
))
(declare-datatypes ((array!24629 0))(
  ( (array!24630 (arr!11764 (Array (_ BitVec 32) ValueCell!4843)) (size!12116 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24629)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!407797 (= res!235819 (and (= (size!12116 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12115 _keys!709) (size!12116 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407798 () Bool)

(assert (=> b!407798 (= e!244862 e!244861)))

(declare-fun res!235824 () Bool)

(assert (=> b!407798 (=> (not res!235824) (not e!244861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24627 (_ BitVec 32)) Bool)

(assert (=> b!407798 (= res!235824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188699 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407798 (= lt!188699 (array!24628 (store (arr!11763 _keys!709) i!563 k!794) (size!12115 _keys!709)))))

(declare-fun b!407799 () Bool)

(declare-fun e!244865 () Bool)

(declare-fun e!244866 () Bool)

(declare-fun mapRes!17181 () Bool)

(assert (=> b!407799 (= e!244865 (and e!244866 mapRes!17181))))

(declare-fun condMapEmpty!17181 () Bool)

(declare-fun mapDefault!17181 () ValueCell!4843)

