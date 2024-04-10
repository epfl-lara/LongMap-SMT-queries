; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33866 () Bool)

(assert start!33866)

(declare-fun b_free!7045 () Bool)

(declare-fun b_next!7045 () Bool)

(assert (=> start!33866 (= b_free!7045 (not b_next!7045))))

(declare-fun tp!24648 () Bool)

(declare-fun b_and!14231 () Bool)

(assert (=> start!33866 (= tp!24648 b_and!14231)))

(declare-fun b!337062 () Bool)

(declare-fun res!186123 () Bool)

(declare-fun e!206861 () Bool)

(assert (=> b!337062 (=> (not res!186123) (not e!206861))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10307 0))(
  ( (V!10308 (val!3543 Int)) )
))
(declare-datatypes ((ValueCell!3155 0))(
  ( (ValueCellFull!3155 (v!5708 V!10307)) (EmptyCell!3155) )
))
(declare-datatypes ((array!17589 0))(
  ( (array!17590 (arr!8322 (Array (_ BitVec 32) ValueCell!3155)) (size!8674 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17589)

(declare-datatypes ((array!17591 0))(
  ( (array!17592 (arr!8323 (Array (_ BitVec 32) (_ BitVec 64))) (size!8675 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17591)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337062 (= res!186123 (and (= (size!8674 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8675 _keys!1895) (size!8674 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337063 () Bool)

(declare-fun res!186124 () Bool)

(declare-fun e!206862 () Bool)

(assert (=> b!337063 (=> (not res!186124) (not e!206862))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337063 (= res!186124 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337064 () Bool)

(declare-fun res!186127 () Bool)

(assert (=> b!337064 (=> (not res!186127) (not e!206861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17591 (_ BitVec 32)) Bool)

(assert (=> b!337064 (= res!186127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337065 () Bool)

(declare-fun res!186126 () Bool)

(assert (=> b!337065 (=> (not res!186126) (not e!206861))))

(declare-datatypes ((List!4761 0))(
  ( (Nil!4758) (Cons!4757 (h!5613 (_ BitVec 64)) (t!9855 List!4761)) )
))
(declare-fun arrayNoDuplicates!0 (array!17591 (_ BitVec 32) List!4761) Bool)

(assert (=> b!337065 (= res!186126 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4758))))

(declare-fun b!337066 () Bool)

(declare-fun res!186125 () Bool)

(assert (=> b!337066 (=> (not res!186125) (not e!206861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337066 (= res!186125 (validKeyInArray!0 k!1348))))

(declare-fun b!337067 () Bool)

(assert (=> b!337067 (= e!206862 false)))

(declare-fun lt!160365 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17591 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337067 (= lt!160365 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337068 () Bool)

(declare-fun e!206860 () Bool)

(declare-fun tp_is_empty!6997 () Bool)

(assert (=> b!337068 (= e!206860 tp_is_empty!6997)))

(declare-fun b!337069 () Bool)

(assert (=> b!337069 (= e!206861 e!206862)))

(declare-fun res!186121 () Bool)

(assert (=> b!337069 (=> (not res!186121) (not e!206862))))

(declare-datatypes ((SeekEntryResult!3216 0))(
  ( (MissingZero!3216 (index!15043 (_ BitVec 32))) (Found!3216 (index!15044 (_ BitVec 32))) (Intermediate!3216 (undefined!4028 Bool) (index!15045 (_ BitVec 32)) (x!33596 (_ BitVec 32))) (Undefined!3216) (MissingVacant!3216 (index!15046 (_ BitVec 32))) )
))
(declare-fun lt!160366 () SeekEntryResult!3216)

(assert (=> b!337069 (= res!186121 (and (not (is-Found!3216 lt!160366)) (is-MissingZero!3216 lt!160366)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17591 (_ BitVec 32)) SeekEntryResult!3216)

(assert (=> b!337069 (= lt!160366 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337070 () Bool)

(declare-fun res!186122 () Bool)

(assert (=> b!337070 (=> (not res!186122) (not e!206861))))

(declare-fun zeroValue!1467 () V!10307)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10307)

(declare-datatypes ((tuple2!5146 0))(
  ( (tuple2!5147 (_1!2584 (_ BitVec 64)) (_2!2584 V!10307)) )
))
(declare-datatypes ((List!4762 0))(
  ( (Nil!4759) (Cons!4758 (h!5614 tuple2!5146) (t!9856 List!4762)) )
))
(declare-datatypes ((ListLongMap!4059 0))(
  ( (ListLongMap!4060 (toList!2045 List!4762)) )
))
(declare-fun contains!2092 (ListLongMap!4059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1566 (array!17591 array!17589 (_ BitVec 32) (_ BitVec 32) V!10307 V!10307 (_ BitVec 32) Int) ListLongMap!4059)

(assert (=> b!337070 (= res!186122 (not (contains!2092 (getCurrentListMap!1566 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!337071 () Bool)

(declare-fun e!206857 () Bool)

(assert (=> b!337071 (= e!206857 tp_is_empty!6997)))

(declare-fun b!337072 () Bool)

(declare-fun e!206859 () Bool)

(declare-fun mapRes!11901 () Bool)

(assert (=> b!337072 (= e!206859 (and e!206860 mapRes!11901))))

(declare-fun condMapEmpty!11901 () Bool)

(declare-fun mapDefault!11901 () ValueCell!3155)

