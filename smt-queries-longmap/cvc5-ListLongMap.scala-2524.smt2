; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38962 () Bool)

(assert start!38962)

(declare-fun b!407951 () Bool)

(declare-fun res!235939 () Bool)

(declare-fun e!244936 () Bool)

(assert (=> b!407951 (=> (not res!235939) (not e!244936))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24643 0))(
  ( (array!24644 (arr!11771 (Array (_ BitVec 32) (_ BitVec 64))) (size!12123 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24643)

(assert (=> b!407951 (= res!235939 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12123 _keys!709))))))

(declare-fun b!407952 () Bool)

(declare-fun res!235947 () Bool)

(assert (=> b!407952 (=> (not res!235947) (not e!244936))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24643 (_ BitVec 32)) Bool)

(assert (=> b!407952 (= res!235947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407953 () Bool)

(declare-fun e!244938 () Bool)

(declare-fun tp_is_empty!10381 () Bool)

(assert (=> b!407953 (= e!244938 tp_is_empty!10381)))

(declare-fun mapIsEmpty!17193 () Bool)

(declare-fun mapRes!17193 () Bool)

(assert (=> mapIsEmpty!17193 mapRes!17193))

(declare-fun res!235943 () Bool)

(assert (=> start!38962 (=> (not res!235943) (not e!244936))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38962 (= res!235943 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12123 _keys!709))))))

(assert (=> start!38962 e!244936))

(assert (=> start!38962 true))

(declare-datatypes ((V!14947 0))(
  ( (V!14948 (val!5235 Int)) )
))
(declare-datatypes ((ValueCell!4847 0))(
  ( (ValueCellFull!4847 (v!7482 V!14947)) (EmptyCell!4847) )
))
(declare-datatypes ((array!24645 0))(
  ( (array!24646 (arr!11772 (Array (_ BitVec 32) ValueCell!4847)) (size!12124 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24645)

(declare-fun e!244933 () Bool)

(declare-fun array_inv!8586 (array!24645) Bool)

(assert (=> start!38962 (and (array_inv!8586 _values!549) e!244933)))

(declare-fun array_inv!8587 (array!24643) Bool)

(assert (=> start!38962 (array_inv!8587 _keys!709)))

(declare-fun b!407954 () Bool)

(declare-fun res!235946 () Bool)

(assert (=> b!407954 (=> (not res!235946) (not e!244936))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407954 (= res!235946 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!407955 () Bool)

(declare-fun e!244935 () Bool)

(assert (=> b!407955 (= e!244936 e!244935)))

(declare-fun res!235940 () Bool)

(assert (=> b!407955 (=> (not res!235940) (not e!244935))))

(declare-fun lt!188723 () array!24643)

(assert (=> b!407955 (= res!235940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188723 mask!1025))))

(assert (=> b!407955 (= lt!188723 (array!24644 (store (arr!11771 _keys!709) i!563 k!794) (size!12123 _keys!709)))))

(declare-fun b!407956 () Bool)

(declare-fun res!235945 () Bool)

(assert (=> b!407956 (=> (not res!235945) (not e!244936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407956 (= res!235945 (validMask!0 mask!1025))))

(declare-fun b!407957 () Bool)

(declare-fun res!235938 () Bool)

(assert (=> b!407957 (=> (not res!235938) (not e!244936))))

(declare-datatypes ((List!6825 0))(
  ( (Nil!6822) (Cons!6821 (h!7677 (_ BitVec 64)) (t!11999 List!6825)) )
))
(declare-fun arrayNoDuplicates!0 (array!24643 (_ BitVec 32) List!6825) Bool)

(assert (=> b!407957 (= res!235938 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6822))))

(declare-fun b!407958 () Bool)

(declare-fun res!235944 () Bool)

(assert (=> b!407958 (=> (not res!235944) (not e!244936))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407958 (= res!235944 (and (= (size!12124 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12123 _keys!709) (size!12124 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407959 () Bool)

(declare-fun res!235942 () Bool)

(assert (=> b!407959 (=> (not res!235942) (not e!244936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407959 (= res!235942 (validKeyInArray!0 k!794))))

(declare-fun b!407960 () Bool)

(declare-fun e!244937 () Bool)

(assert (=> b!407960 (= e!244937 tp_is_empty!10381)))

(declare-fun b!407961 () Bool)

(declare-fun res!235941 () Bool)

(assert (=> b!407961 (=> (not res!235941) (not e!244936))))

(assert (=> b!407961 (= res!235941 (or (= (select (arr!11771 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11771 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407962 () Bool)

(assert (=> b!407962 (= e!244933 (and e!244938 mapRes!17193))))

(declare-fun condMapEmpty!17193 () Bool)

(declare-fun mapDefault!17193 () ValueCell!4847)

