; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34190 () Bool)

(assert start!34190)

(declare-fun b_free!7213 () Bool)

(declare-fun b_next!7213 () Bool)

(assert (=> start!34190 (= b_free!7213 (not b_next!7213))))

(declare-fun tp!25173 () Bool)

(declare-fun b_and!14413 () Bool)

(assert (=> start!34190 (= tp!25173 b_and!14413)))

(declare-fun mapIsEmpty!12174 () Bool)

(declare-fun mapRes!12174 () Bool)

(assert (=> mapIsEmpty!12174 mapRes!12174))

(declare-fun b!340858 () Bool)

(declare-fun e!209082 () Bool)

(assert (=> b!340858 (= e!209082 false)))

(declare-fun lt!161664 () (_ BitVec 32))

(declare-datatypes ((array!17931 0))(
  ( (array!17932 (arr!8486 (Array (_ BitVec 32) (_ BitVec 64))) (size!8838 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17931)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17931 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340858 (= lt!161664 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!340859 () Bool)

(declare-fun e!209078 () Bool)

(declare-fun tp_is_empty!7165 () Bool)

(assert (=> b!340859 (= e!209078 tp_is_empty!7165)))

(declare-fun b!340860 () Bool)

(declare-fun e!209077 () Bool)

(assert (=> b!340860 (= e!209077 tp_is_empty!7165)))

(declare-fun b!340862 () Bool)

(declare-fun e!209079 () Bool)

(assert (=> b!340862 (= e!209079 e!209082)))

(declare-fun res!188334 () Bool)

(assert (=> b!340862 (=> (not res!188334) (not e!209082))))

(declare-datatypes ((SeekEntryResult!3279 0))(
  ( (MissingZero!3279 (index!15295 (_ BitVec 32))) (Found!3279 (index!15296 (_ BitVec 32))) (Intermediate!3279 (undefined!4091 Bool) (index!15297 (_ BitVec 32)) (x!33953 (_ BitVec 32))) (Undefined!3279) (MissingVacant!3279 (index!15298 (_ BitVec 32))) )
))
(declare-fun lt!161665 () SeekEntryResult!3279)

(assert (=> b!340862 (= res!188334 (and (not (is-Found!3279 lt!161665)) (not (is-MissingZero!3279 lt!161665)) (is-MissingVacant!3279 lt!161665)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17931 (_ BitVec 32)) SeekEntryResult!3279)

(assert (=> b!340862 (= lt!161665 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!340863 () Bool)

(declare-fun res!188332 () Bool)

(assert (=> b!340863 (=> (not res!188332) (not e!209079))))

(declare-datatypes ((V!10531 0))(
  ( (V!10532 (val!3627 Int)) )
))
(declare-datatypes ((ValueCell!3239 0))(
  ( (ValueCellFull!3239 (v!5799 V!10531)) (EmptyCell!3239) )
))
(declare-datatypes ((array!17933 0))(
  ( (array!17934 (arr!8487 (Array (_ BitVec 32) ValueCell!3239)) (size!8839 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17933)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340863 (= res!188332 (and (= (size!8839 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8838 _keys!1895) (size!8839 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340864 () Bool)

(declare-fun res!188336 () Bool)

(assert (=> b!340864 (=> (not res!188336) (not e!209079))))

(declare-fun zeroValue!1467 () V!10531)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10531)

(declare-datatypes ((tuple2!5262 0))(
  ( (tuple2!5263 (_1!2642 (_ BitVec 64)) (_2!2642 V!10531)) )
))
(declare-datatypes ((List!4882 0))(
  ( (Nil!4879) (Cons!4878 (h!5734 tuple2!5262) (t!9990 List!4882)) )
))
(declare-datatypes ((ListLongMap!4175 0))(
  ( (ListLongMap!4176 (toList!2103 List!4882)) )
))
(declare-fun contains!2157 (ListLongMap!4175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1624 (array!17931 array!17933 (_ BitVec 32) (_ BitVec 32) V!10531 V!10531 (_ BitVec 32) Int) ListLongMap!4175)

(assert (=> b!340864 (= res!188336 (not (contains!2157 (getCurrentListMap!1624 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!340865 () Bool)

(declare-fun res!188329 () Bool)

(assert (=> b!340865 (=> (not res!188329) (not e!209082))))

(declare-fun arrayContainsKey!0 (array!17931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340865 (= res!188329 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!340866 () Bool)

(declare-fun res!188335 () Bool)

(assert (=> b!340866 (=> (not res!188335) (not e!209079))))

(declare-datatypes ((List!4883 0))(
  ( (Nil!4880) (Cons!4879 (h!5735 (_ BitVec 64)) (t!9991 List!4883)) )
))
(declare-fun arrayNoDuplicates!0 (array!17931 (_ BitVec 32) List!4883) Bool)

(assert (=> b!340866 (= res!188335 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4880))))

(declare-fun b!340867 () Bool)

(declare-fun res!188330 () Bool)

(assert (=> b!340867 (=> (not res!188330) (not e!209079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340867 (= res!188330 (validKeyInArray!0 k!1348))))

(declare-fun res!188333 () Bool)

(assert (=> start!34190 (=> (not res!188333) (not e!209079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34190 (= res!188333 (validMask!0 mask!2385))))

(assert (=> start!34190 e!209079))

(assert (=> start!34190 true))

(assert (=> start!34190 tp_is_empty!7165))

(assert (=> start!34190 tp!25173))

(declare-fun e!209081 () Bool)

(declare-fun array_inv!6286 (array!17933) Bool)

(assert (=> start!34190 (and (array_inv!6286 _values!1525) e!209081)))

(declare-fun array_inv!6287 (array!17931) Bool)

(assert (=> start!34190 (array_inv!6287 _keys!1895)))

(declare-fun b!340861 () Bool)

(declare-fun res!188331 () Bool)

(assert (=> b!340861 (=> (not res!188331) (not e!209079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17931 (_ BitVec 32)) Bool)

(assert (=> b!340861 (= res!188331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12174 () Bool)

(declare-fun tp!25172 () Bool)

(assert (=> mapNonEmpty!12174 (= mapRes!12174 (and tp!25172 e!209078))))

(declare-fun mapRest!12174 () (Array (_ BitVec 32) ValueCell!3239))

(declare-fun mapValue!12174 () ValueCell!3239)

(declare-fun mapKey!12174 () (_ BitVec 32))

(assert (=> mapNonEmpty!12174 (= (arr!8487 _values!1525) (store mapRest!12174 mapKey!12174 mapValue!12174))))

(declare-fun b!340868 () Bool)

(assert (=> b!340868 (= e!209081 (and e!209077 mapRes!12174))))

(declare-fun condMapEmpty!12174 () Bool)

(declare-fun mapDefault!12174 () ValueCell!3239)

