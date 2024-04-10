; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33992 () Bool)

(assert start!33992)

(declare-fun b_free!7123 () Bool)

(declare-fun b_next!7123 () Bool)

(assert (=> start!33992 (= b_free!7123 (not b_next!7123))))

(declare-fun tp!24887 () Bool)

(declare-fun b_and!14313 () Bool)

(assert (=> start!33992 (= tp!24887 b_and!14313)))

(declare-fun b!338692 () Bool)

(declare-fun e!207807 () Bool)

(declare-fun e!207806 () Bool)

(assert (=> b!338692 (= e!207807 e!207806)))

(declare-fun res!187099 () Bool)

(assert (=> b!338692 (=> (not res!187099) (not e!207806))))

(declare-datatypes ((SeekEntryResult!3244 0))(
  ( (MissingZero!3244 (index!15155 (_ BitVec 32))) (Found!3244 (index!15156 (_ BitVec 32))) (Intermediate!3244 (undefined!4056 Bool) (index!15157 (_ BitVec 32)) (x!33748 (_ BitVec 32))) (Undefined!3244) (MissingVacant!3244 (index!15158 (_ BitVec 32))) )
))
(declare-fun lt!160879 () SeekEntryResult!3244)

(assert (=> b!338692 (= res!187099 (and (not (is-Found!3244 lt!160879)) (is-MissingZero!3244 lt!160879)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17745 0))(
  ( (array!17746 (arr!8398 (Array (_ BitVec 32) (_ BitVec 64))) (size!8750 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17745)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17745 (_ BitVec 32)) SeekEntryResult!3244)

(assert (=> b!338692 (= lt!160879 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!338693 () Bool)

(declare-fun res!187100 () Bool)

(assert (=> b!338693 (=> (not res!187100) (not e!207807))))

(declare-datatypes ((V!10411 0))(
  ( (V!10412 (val!3582 Int)) )
))
(declare-fun zeroValue!1467 () V!10411)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3194 0))(
  ( (ValueCellFull!3194 (v!5749 V!10411)) (EmptyCell!3194) )
))
(declare-datatypes ((array!17747 0))(
  ( (array!17748 (arr!8399 (Array (_ BitVec 32) ValueCell!3194)) (size!8751 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17747)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10411)

(declare-datatypes ((tuple2!5202 0))(
  ( (tuple2!5203 (_1!2612 (_ BitVec 64)) (_2!2612 V!10411)) )
))
(declare-datatypes ((List!4817 0))(
  ( (Nil!4814) (Cons!4813 (h!5669 tuple2!5202) (t!9915 List!4817)) )
))
(declare-datatypes ((ListLongMap!4115 0))(
  ( (ListLongMap!4116 (toList!2073 List!4817)) )
))
(declare-fun contains!2122 (ListLongMap!4115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1594 (array!17745 array!17747 (_ BitVec 32) (_ BitVec 32) V!10411 V!10411 (_ BitVec 32) Int) ListLongMap!4115)

(assert (=> b!338693 (= res!187100 (not (contains!2122 (getCurrentListMap!1594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!338694 () Bool)

(declare-fun res!187098 () Bool)

(assert (=> b!338694 (=> (not res!187098) (not e!207807))))

(declare-datatypes ((List!4818 0))(
  ( (Nil!4815) (Cons!4814 (h!5670 (_ BitVec 64)) (t!9916 List!4818)) )
))
(declare-fun arrayNoDuplicates!0 (array!17745 (_ BitVec 32) List!4818) Bool)

(assert (=> b!338694 (= res!187098 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4815))))

(declare-fun b!338695 () Bool)

(declare-fun e!207809 () Bool)

(declare-fun tp_is_empty!7075 () Bool)

(assert (=> b!338695 (= e!207809 tp_is_empty!7075)))

(declare-fun b!338696 () Bool)

(declare-fun e!207810 () Bool)

(assert (=> b!338696 (= e!207810 tp_is_empty!7075)))

(declare-fun b!338697 () Bool)

(assert (=> b!338697 (= e!207806 false)))

(declare-datatypes ((Unit!10529 0))(
  ( (Unit!10530) )
))
(declare-fun lt!160877 () Unit!10529)

(declare-fun e!207808 () Unit!10529)

(assert (=> b!338697 (= lt!160877 e!207808)))

(declare-fun c!52446 () Bool)

(declare-fun arrayContainsKey!0 (array!17745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338697 (= c!52446 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!338698 () Bool)

(declare-fun res!187097 () Bool)

(assert (=> b!338698 (=> (not res!187097) (not e!207807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17745 (_ BitVec 32)) Bool)

(assert (=> b!338698 (= res!187097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338699 () Bool)

(declare-fun res!187096 () Bool)

(assert (=> b!338699 (=> (not res!187096) (not e!207807))))

(assert (=> b!338699 (= res!187096 (and (= (size!8751 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8750 _keys!1895) (size!8751 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338700 () Bool)

(declare-fun e!207804 () Bool)

(declare-fun mapRes!12024 () Bool)

(assert (=> b!338700 (= e!207804 (and e!207809 mapRes!12024))))

(declare-fun condMapEmpty!12024 () Bool)

(declare-fun mapDefault!12024 () ValueCell!3194)

