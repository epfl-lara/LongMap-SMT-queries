; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38858 () Bool)

(assert start!38858)

(declare-fun b!405923 () Bool)

(declare-fun res!234387 () Bool)

(declare-fun e!243999 () Bool)

(assert (=> b!405923 (=> (not res!234387) (not e!243999))))

(declare-datatypes ((array!24445 0))(
  ( (array!24446 (arr!11672 (Array (_ BitVec 32) (_ BitVec 64))) (size!12024 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24445)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405923 (= res!234387 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17037 () Bool)

(declare-fun mapRes!17037 () Bool)

(declare-fun tp!33156 () Bool)

(declare-fun e!244001 () Bool)

(assert (=> mapNonEmpty!17037 (= mapRes!17037 (and tp!33156 e!244001))))

(declare-fun mapKey!17037 () (_ BitVec 32))

(declare-datatypes ((V!14807 0))(
  ( (V!14808 (val!5183 Int)) )
))
(declare-datatypes ((ValueCell!4795 0))(
  ( (ValueCellFull!4795 (v!7430 V!14807)) (EmptyCell!4795) )
))
(declare-fun mapValue!17037 () ValueCell!4795)

(declare-datatypes ((array!24447 0))(
  ( (array!24448 (arr!11673 (Array (_ BitVec 32) ValueCell!4795)) (size!12025 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24447)

(declare-fun mapRest!17037 () (Array (_ BitVec 32) ValueCell!4795))

(assert (=> mapNonEmpty!17037 (= (arr!11673 _values!549) (store mapRest!17037 mapKey!17037 mapValue!17037))))

(declare-fun b!405924 () Bool)

(declare-fun res!234378 () Bool)

(assert (=> b!405924 (=> (not res!234378) (not e!243999))))

(declare-datatypes ((List!6783 0))(
  ( (Nil!6780) (Cons!6779 (h!7635 (_ BitVec 64)) (t!11957 List!6783)) )
))
(declare-fun arrayNoDuplicates!0 (array!24445 (_ BitVec 32) List!6783) Bool)

(assert (=> b!405924 (= res!234378 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6780))))

(declare-fun b!405925 () Bool)

(declare-fun res!234380 () Bool)

(assert (=> b!405925 (=> (not res!234380) (not e!243999))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24445 (_ BitVec 32)) Bool)

(assert (=> b!405925 (= res!234380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405926 () Bool)

(declare-fun e!243997 () Bool)

(declare-fun e!244002 () Bool)

(assert (=> b!405926 (= e!243997 (and e!244002 mapRes!17037))))

(declare-fun condMapEmpty!17037 () Bool)

(declare-fun mapDefault!17037 () ValueCell!4795)

