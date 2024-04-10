; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33870 () Bool)

(assert start!33870)

(declare-fun b_free!7049 () Bool)

(declare-fun b_next!7049 () Bool)

(assert (=> start!33870 (= b_free!7049 (not b_next!7049))))

(declare-fun tp!24660 () Bool)

(declare-fun b_and!14235 () Bool)

(assert (=> start!33870 (= tp!24660 b_and!14235)))

(declare-fun mapNonEmpty!11907 () Bool)

(declare-fun mapRes!11907 () Bool)

(declare-fun tp!24659 () Bool)

(declare-fun e!206894 () Bool)

(assert (=> mapNonEmpty!11907 (= mapRes!11907 (and tp!24659 e!206894))))

(declare-datatypes ((V!10311 0))(
  ( (V!10312 (val!3545 Int)) )
))
(declare-datatypes ((ValueCell!3157 0))(
  ( (ValueCellFull!3157 (v!5710 V!10311)) (EmptyCell!3157) )
))
(declare-fun mapRest!11907 () (Array (_ BitVec 32) ValueCell!3157))

(declare-fun mapKey!11907 () (_ BitVec 32))

(declare-fun mapValue!11907 () ValueCell!3157)

(declare-datatypes ((array!17597 0))(
  ( (array!17598 (arr!8326 (Array (_ BitVec 32) ValueCell!3157)) (size!8678 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17597)

(assert (=> mapNonEmpty!11907 (= (arr!8326 _values!1525) (store mapRest!11907 mapKey!11907 mapValue!11907))))

(declare-fun b!337128 () Bool)

(declare-fun res!186174 () Bool)

(declare-fun e!206895 () Bool)

(assert (=> b!337128 (=> (not res!186174) (not e!206895))))

(declare-datatypes ((array!17599 0))(
  ( (array!17600 (arr!8327 (Array (_ BitVec 32) (_ BitVec 64))) (size!8679 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17599)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337128 (= res!186174 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337129 () Bool)

(declare-fun res!186175 () Bool)

(declare-fun e!206898 () Bool)

(assert (=> b!337129 (=> (not res!186175) (not e!206898))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337129 (= res!186175 (and (= (size!8678 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8679 _keys!1895) (size!8678 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337130 () Bool)

(assert (=> b!337130 (= e!206895 false)))

(declare-fun lt!160378 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17599 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337130 (= lt!160378 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337131 () Bool)

(declare-fun res!186176 () Bool)

(assert (=> b!337131 (=> (not res!186176) (not e!206898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337131 (= res!186176 (validKeyInArray!0 k!1348))))

(declare-fun b!337132 () Bool)

(declare-fun res!186173 () Bool)

(assert (=> b!337132 (=> (not res!186173) (not e!206898))))

(declare-datatypes ((List!4765 0))(
  ( (Nil!4762) (Cons!4761 (h!5617 (_ BitVec 64)) (t!9859 List!4765)) )
))
(declare-fun arrayNoDuplicates!0 (array!17599 (_ BitVec 32) List!4765) Bool)

(assert (=> b!337132 (= res!186173 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4762))))

(declare-fun mapIsEmpty!11907 () Bool)

(assert (=> mapIsEmpty!11907 mapRes!11907))

(declare-fun res!186171 () Bool)

(assert (=> start!33870 (=> (not res!186171) (not e!206898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33870 (= res!186171 (validMask!0 mask!2385))))

(assert (=> start!33870 e!206898))

(assert (=> start!33870 true))

(declare-fun tp_is_empty!7001 () Bool)

(assert (=> start!33870 tp_is_empty!7001))

(assert (=> start!33870 tp!24660))

(declare-fun e!206893 () Bool)

(declare-fun array_inv!6182 (array!17597) Bool)

(assert (=> start!33870 (and (array_inv!6182 _values!1525) e!206893)))

(declare-fun array_inv!6183 (array!17599) Bool)

(assert (=> start!33870 (array_inv!6183 _keys!1895)))

(declare-fun b!337133 () Bool)

(declare-fun e!206896 () Bool)

(assert (=> b!337133 (= e!206893 (and e!206896 mapRes!11907))))

(declare-fun condMapEmpty!11907 () Bool)

(declare-fun mapDefault!11907 () ValueCell!3157)

