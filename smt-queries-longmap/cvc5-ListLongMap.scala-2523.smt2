; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38956 () Bool)

(assert start!38956)

(declare-fun mapIsEmpty!17184 () Bool)

(declare-fun mapRes!17184 () Bool)

(assert (=> mapIsEmpty!17184 mapRes!17184))

(declare-fun mapNonEmpty!17184 () Bool)

(declare-fun tp!33303 () Bool)

(declare-fun e!244882 () Bool)

(assert (=> mapNonEmpty!17184 (= mapRes!17184 (and tp!33303 e!244882))))

(declare-datatypes ((V!14939 0))(
  ( (V!14940 (val!5232 Int)) )
))
(declare-datatypes ((ValueCell!4844 0))(
  ( (ValueCellFull!4844 (v!7479 V!14939)) (EmptyCell!4844) )
))
(declare-fun mapValue!17184 () ValueCell!4844)

(declare-datatypes ((array!24631 0))(
  ( (array!24632 (arr!11765 (Array (_ BitVec 32) ValueCell!4844)) (size!12117 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24631)

(declare-fun mapKey!17184 () (_ BitVec 32))

(declare-fun mapRest!17184 () (Array (_ BitVec 32) ValueCell!4844))

(assert (=> mapNonEmpty!17184 (= (arr!11765 _values!549) (store mapRest!17184 mapKey!17184 mapValue!17184))))

(declare-fun b!407834 () Bool)

(declare-fun res!235848 () Bool)

(declare-fun e!244883 () Bool)

(assert (=> b!407834 (=> (not res!235848) (not e!244883))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407834 (= res!235848 (validKeyInArray!0 k!794))))

(declare-fun b!407835 () Bool)

(declare-fun res!235852 () Bool)

(assert (=> b!407835 (=> (not res!235852) (not e!244883))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24633 0))(
  ( (array!24634 (arr!11766 (Array (_ BitVec 32) (_ BitVec 64))) (size!12118 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24633)

(assert (=> b!407835 (= res!235852 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12118 _keys!709))))))

(declare-fun res!235856 () Bool)

(assert (=> start!38956 (=> (not res!235856) (not e!244883))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38956 (= res!235856 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12118 _keys!709))))))

(assert (=> start!38956 e!244883))

(assert (=> start!38956 true))

(declare-fun e!244881 () Bool)

(declare-fun array_inv!8582 (array!24631) Bool)

(assert (=> start!38956 (and (array_inv!8582 _values!549) e!244881)))

(declare-fun array_inv!8583 (array!24633) Bool)

(assert (=> start!38956 (array_inv!8583 _keys!709)))

(declare-fun b!407836 () Bool)

(declare-fun res!235854 () Bool)

(assert (=> b!407836 (=> (not res!235854) (not e!244883))))

(declare-datatypes ((List!6822 0))(
  ( (Nil!6819) (Cons!6818 (h!7674 (_ BitVec 64)) (t!11996 List!6822)) )
))
(declare-fun arrayNoDuplicates!0 (array!24633 (_ BitVec 32) List!6822) Bool)

(assert (=> b!407836 (= res!235854 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6819))))

(declare-fun b!407837 () Bool)

(declare-fun e!244884 () Bool)

(declare-fun tp_is_empty!10375 () Bool)

(assert (=> b!407837 (= e!244884 tp_is_empty!10375)))

(declare-fun b!407838 () Bool)

(assert (=> b!407838 (= e!244881 (and e!244884 mapRes!17184))))

(declare-fun condMapEmpty!17184 () Bool)

(declare-fun mapDefault!17184 () ValueCell!4844)

