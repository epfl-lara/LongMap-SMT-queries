; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34164 () Bool)

(assert start!34164)

(declare-fun b_free!7187 () Bool)

(declare-fun b_next!7187 () Bool)

(assert (=> start!34164 (= b_free!7187 (not b_next!7187))))

(declare-fun tp!25095 () Bool)

(declare-fun b_and!14387 () Bool)

(assert (=> start!34164 (= tp!25095 b_and!14387)))

(declare-fun b!340431 () Bool)

(declare-fun e!208845 () Bool)

(assert (=> b!340431 (= e!208845 false)))

(declare-datatypes ((SeekEntryResult!3270 0))(
  ( (MissingZero!3270 (index!15259 (_ BitVec 32))) (Found!3270 (index!15260 (_ BitVec 32))) (Intermediate!3270 (undefined!4082 Bool) (index!15261 (_ BitVec 32)) (x!33904 (_ BitVec 32))) (Undefined!3270) (MissingVacant!3270 (index!15262 (_ BitVec 32))) )
))
(declare-fun lt!161587 () SeekEntryResult!3270)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17883 0))(
  ( (array!17884 (arr!8462 (Array (_ BitVec 32) (_ BitVec 64))) (size!8814 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17883)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17883 (_ BitVec 32)) SeekEntryResult!3270)

(assert (=> b!340431 (= lt!161587 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!340432 () Bool)

(declare-fun e!208847 () Bool)

(declare-fun tp_is_empty!7139 () Bool)

(assert (=> b!340432 (= e!208847 tp_is_empty!7139)))

(declare-fun b!340433 () Bool)

(declare-fun e!208846 () Bool)

(assert (=> b!340433 (= e!208846 tp_is_empty!7139)))

(declare-fun b!340434 () Bool)

(declare-fun res!188021 () Bool)

(assert (=> b!340434 (=> (not res!188021) (not e!208845))))

(declare-datatypes ((List!4865 0))(
  ( (Nil!4862) (Cons!4861 (h!5717 (_ BitVec 64)) (t!9973 List!4865)) )
))
(declare-fun arrayNoDuplicates!0 (array!17883 (_ BitVec 32) List!4865) Bool)

(assert (=> b!340434 (= res!188021 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4862))))

(declare-fun b!340435 () Bool)

(declare-fun res!188022 () Bool)

(assert (=> b!340435 (=> (not res!188022) (not e!208845))))

(declare-datatypes ((V!10495 0))(
  ( (V!10496 (val!3614 Int)) )
))
(declare-datatypes ((ValueCell!3226 0))(
  ( (ValueCellFull!3226 (v!5786 V!10495)) (EmptyCell!3226) )
))
(declare-datatypes ((array!17885 0))(
  ( (array!17886 (arr!8463 (Array (_ BitVec 32) ValueCell!3226)) (size!8815 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17885)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340435 (= res!188022 (and (= (size!8815 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8814 _keys!1895) (size!8815 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12135 () Bool)

(declare-fun mapRes!12135 () Bool)

(assert (=> mapIsEmpty!12135 mapRes!12135))

(declare-fun b!340436 () Bool)

(declare-fun e!208848 () Bool)

(assert (=> b!340436 (= e!208848 (and e!208846 mapRes!12135))))

(declare-fun condMapEmpty!12135 () Bool)

(declare-fun mapDefault!12135 () ValueCell!3226)

