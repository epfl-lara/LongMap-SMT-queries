; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33462 () Bool)

(assert start!33462)

(declare-fun b!332145 () Bool)

(declare-fun e!203899 () Bool)

(declare-fun tp_is_empty!6715 () Bool)

(assert (=> b!332145 (= e!203899 tp_is_empty!6715)))

(declare-fun b!332146 () Bool)

(declare-fun e!203900 () Bool)

(assert (=> b!332146 (= e!203900 tp_is_empty!6715)))

(declare-fun mapNonEmpty!11457 () Bool)

(declare-fun mapRes!11457 () Bool)

(declare-fun tp!23832 () Bool)

(assert (=> mapNonEmpty!11457 (= mapRes!11457 (and tp!23832 e!203899))))

(declare-datatypes ((V!9931 0))(
  ( (V!9932 (val!3402 Int)) )
))
(declare-datatypes ((ValueCell!3014 0))(
  ( (ValueCellFull!3014 (v!5561 V!9931)) (EmptyCell!3014) )
))
(declare-fun mapValue!11457 () ValueCell!3014)

(declare-fun mapRest!11457 () (Array (_ BitVec 32) ValueCell!3014))

(declare-fun mapKey!11457 () (_ BitVec 32))

(declare-datatypes ((array!17025 0))(
  ( (array!17026 (arr!8047 (Array (_ BitVec 32) ValueCell!3014)) (size!8399 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17025)

(assert (=> mapNonEmpty!11457 (= (arr!8047 _values!1525) (store mapRest!11457 mapKey!11457 mapValue!11457))))

(declare-fun b!332147 () Bool)

(declare-fun res!182987 () Bool)

(declare-fun e!203897 () Bool)

(assert (=> b!332147 (=> (not res!182987) (not e!203897))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17027 0))(
  ( (array!17028 (arr!8048 (Array (_ BitVec 32) (_ BitVec 64))) (size!8400 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17027)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332147 (= res!182987 (and (= (size!8399 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8400 _keys!1895) (size!8399 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!182986 () Bool)

(assert (=> start!33462 (=> (not res!182986) (not e!203897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33462 (= res!182986 (validMask!0 mask!2385))))

(assert (=> start!33462 e!203897))

(assert (=> start!33462 true))

(declare-fun e!203901 () Bool)

(declare-fun array_inv!5992 (array!17025) Bool)

(assert (=> start!33462 (and (array_inv!5992 _values!1525) e!203901)))

(declare-fun array_inv!5993 (array!17027) Bool)

(assert (=> start!33462 (array_inv!5993 _keys!1895)))

(declare-fun b!332148 () Bool)

(declare-fun res!182985 () Bool)

(assert (=> b!332148 (=> (not res!182985) (not e!203897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17027 (_ BitVec 32)) Bool)

(assert (=> b!332148 (= res!182985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332149 () Bool)

(assert (=> b!332149 (= e!203897 false)))

(declare-fun lt!158968 () Bool)

(declare-datatypes ((List!4582 0))(
  ( (Nil!4579) (Cons!4578 (h!5434 (_ BitVec 64)) (t!9664 List!4582)) )
))
(declare-fun arrayNoDuplicates!0 (array!17027 (_ BitVec 32) List!4582) Bool)

(assert (=> b!332149 (= lt!158968 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4579))))

(declare-fun mapIsEmpty!11457 () Bool)

(assert (=> mapIsEmpty!11457 mapRes!11457))

(declare-fun b!332150 () Bool)

(assert (=> b!332150 (= e!203901 (and e!203900 mapRes!11457))))

(declare-fun condMapEmpty!11457 () Bool)

(declare-fun mapDefault!11457 () ValueCell!3014)

