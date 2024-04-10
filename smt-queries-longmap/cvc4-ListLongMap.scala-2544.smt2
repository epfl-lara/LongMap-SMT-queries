; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39086 () Bool)

(assert start!39086)

(declare-fun b_free!9353 () Bool)

(declare-fun b_next!9353 () Bool)

(assert (=> start!39086 (= b_free!9353 (not b_next!9353))))

(declare-fun tp!33587 () Bool)

(declare-fun b_and!16739 () Bool)

(assert (=> start!39086 (= tp!33587 b_and!16739)))

(declare-fun b!410547 () Bool)

(declare-fun e!246051 () Bool)

(declare-fun e!246054 () Bool)

(assert (=> b!410547 (= e!246051 e!246054)))

(declare-fun res!237980 () Bool)

(assert (=> b!410547 (=> (not res!237980) (not e!246054))))

(declare-datatypes ((array!24879 0))(
  ( (array!24880 (arr!11889 (Array (_ BitVec 32) (_ BitVec 64))) (size!12241 (_ BitVec 32))) )
))
(declare-fun lt!189102 () array!24879)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24879 (_ BitVec 32)) Bool)

(assert (=> b!410547 (= res!237980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189102 mask!1025))))

(declare-fun _keys!709 () array!24879)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410547 (= lt!189102 (array!24880 (store (arr!11889 _keys!709) i!563 k!794) (size!12241 _keys!709)))))

(declare-fun b!410548 () Bool)

(declare-fun res!237986 () Bool)

(assert (=> b!410548 (=> (not res!237986) (not e!246051))))

(assert (=> b!410548 (= res!237986 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12241 _keys!709))))))

(declare-fun b!410549 () Bool)

(declare-fun res!237976 () Bool)

(assert (=> b!410549 (=> (not res!237976) (not e!246051))))

(assert (=> b!410549 (= res!237976 (or (= (select (arr!11889 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11889 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!237979 () Bool)

(assert (=> start!39086 (=> (not res!237979) (not e!246051))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39086 (= res!237979 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12241 _keys!709))))))

(assert (=> start!39086 e!246051))

(declare-fun tp_is_empty!10505 () Bool)

(assert (=> start!39086 tp_is_empty!10505))

(assert (=> start!39086 tp!33587))

(assert (=> start!39086 true))

(declare-datatypes ((V!15111 0))(
  ( (V!15112 (val!5297 Int)) )
))
(declare-datatypes ((ValueCell!4909 0))(
  ( (ValueCellFull!4909 (v!7544 V!15111)) (EmptyCell!4909) )
))
(declare-datatypes ((array!24881 0))(
  ( (array!24882 (arr!11890 (Array (_ BitVec 32) ValueCell!4909)) (size!12242 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24881)

(declare-fun e!246053 () Bool)

(declare-fun array_inv!8678 (array!24881) Bool)

(assert (=> start!39086 (and (array_inv!8678 _values!549) e!246053)))

(declare-fun array_inv!8679 (array!24879) Bool)

(assert (=> start!39086 (array_inv!8679 _keys!709)))

(declare-fun b!410550 () Bool)

(declare-fun res!237978 () Bool)

(assert (=> b!410550 (=> (not res!237978) (not e!246054))))

(declare-datatypes ((List!6895 0))(
  ( (Nil!6892) (Cons!6891 (h!7747 (_ BitVec 64)) (t!12069 List!6895)) )
))
(declare-fun arrayNoDuplicates!0 (array!24879 (_ BitVec 32) List!6895) Bool)

(assert (=> b!410550 (= res!237978 (arrayNoDuplicates!0 lt!189102 #b00000000000000000000000000000000 Nil!6892))))

(declare-fun b!410551 () Bool)

(declare-fun res!237977 () Bool)

(assert (=> b!410551 (=> (not res!237977) (not e!246051))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410551 (= res!237977 (and (= (size!12242 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12241 _keys!709) (size!12242 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410552 () Bool)

(assert (=> b!410552 (= e!246054 false)))

(declare-fun minValue!515 () V!15111)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6870 0))(
  ( (tuple2!6871 (_1!3446 (_ BitVec 64)) (_2!3446 V!15111)) )
))
(declare-datatypes ((List!6896 0))(
  ( (Nil!6893) (Cons!6892 (h!7748 tuple2!6870) (t!12070 List!6896)) )
))
(declare-datatypes ((ListLongMap!5783 0))(
  ( (ListLongMap!5784 (toList!2907 List!6896)) )
))
(declare-fun lt!189104 () ListLongMap!5783)

(declare-fun zeroValue!515 () V!15111)

(declare-fun v!412 () V!15111)

(declare-fun getCurrentListMapNoExtraKeys!1115 (array!24879 array!24881 (_ BitVec 32) (_ BitVec 32) V!15111 V!15111 (_ BitVec 32) Int) ListLongMap!5783)

(assert (=> b!410552 (= lt!189104 (getCurrentListMapNoExtraKeys!1115 lt!189102 (array!24882 (store (arr!11890 _values!549) i!563 (ValueCellFull!4909 v!412)) (size!12242 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189103 () ListLongMap!5783)

(assert (=> b!410552 (= lt!189103 (getCurrentListMapNoExtraKeys!1115 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410553 () Bool)

(declare-fun e!246050 () Bool)

(assert (=> b!410553 (= e!246050 tp_is_empty!10505)))

(declare-fun b!410554 () Bool)

(declare-fun res!237983 () Bool)

(assert (=> b!410554 (=> (not res!237983) (not e!246051))))

(assert (=> b!410554 (= res!237983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410555 () Bool)

(declare-fun e!246052 () Bool)

(declare-fun mapRes!17379 () Bool)

(assert (=> b!410555 (= e!246053 (and e!246052 mapRes!17379))))

(declare-fun condMapEmpty!17379 () Bool)

(declare-fun mapDefault!17379 () ValueCell!4909)

