; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33756 () Bool)

(assert start!33756)

(declare-fun b_free!6991 () Bool)

(declare-fun b_next!6991 () Bool)

(assert (=> start!33756 (= b_free!6991 (not b_next!6991))))

(declare-fun tp!24477 () Bool)

(declare-fun b_and!14171 () Bool)

(assert (=> start!33756 (= tp!24477 b_and!14171)))

(declare-fun b!335834 () Bool)

(declare-fun e!206150 () Bool)

(declare-fun tp_is_empty!6943 () Bool)

(assert (=> b!335834 (= e!206150 tp_is_empty!6943)))

(declare-fun b!335835 () Bool)

(declare-fun res!185385 () Bool)

(declare-fun e!206148 () Bool)

(assert (=> b!335835 (=> (not res!185385) (not e!206148))))

(declare-datatypes ((array!17479 0))(
  ( (array!17480 (arr!8270 (Array (_ BitVec 32) (_ BitVec 64))) (size!8622 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17479)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17479 (_ BitVec 32)) Bool)

(assert (=> b!335835 (= res!185385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335836 () Bool)

(declare-fun res!185384 () Bool)

(assert (=> b!335836 (=> (not res!185384) (not e!206148))))

(declare-datatypes ((V!10235 0))(
  ( (V!10236 (val!3516 Int)) )
))
(declare-datatypes ((ValueCell!3128 0))(
  ( (ValueCellFull!3128 (v!5678 V!10235)) (EmptyCell!3128) )
))
(declare-datatypes ((array!17481 0))(
  ( (array!17482 (arr!8271 (Array (_ BitVec 32) ValueCell!3128)) (size!8623 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17481)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335836 (= res!185384 (and (= (size!8623 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8622 _keys!1895) (size!8623 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335837 () Bool)

(declare-fun res!185387 () Bool)

(assert (=> b!335837 (=> (not res!185387) (not e!206148))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335837 (= res!185387 (validKeyInArray!0 k!1348))))

(declare-fun b!335838 () Bool)

(declare-fun e!206149 () Bool)

(declare-fun mapRes!11811 () Bool)

(assert (=> b!335838 (= e!206149 (and e!206150 mapRes!11811))))

(declare-fun condMapEmpty!11811 () Bool)

(declare-fun mapDefault!11811 () ValueCell!3128)

