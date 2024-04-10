; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33472 () Bool)

(assert start!33472)

(declare-fun b!332235 () Bool)

(declare-fun e!203976 () Bool)

(declare-fun tp_is_empty!6725 () Bool)

(assert (=> b!332235 (= e!203976 tp_is_empty!6725)))

(declare-fun b!332236 () Bool)

(declare-fun e!203972 () Bool)

(assert (=> b!332236 (= e!203972 tp_is_empty!6725)))

(declare-fun b!332237 () Bool)

(declare-fun res!183032 () Bool)

(declare-fun e!203974 () Bool)

(assert (=> b!332237 (=> (not res!183032) (not e!203974))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9943 0))(
  ( (V!9944 (val!3407 Int)) )
))
(declare-datatypes ((ValueCell!3019 0))(
  ( (ValueCellFull!3019 (v!5566 V!9943)) (EmptyCell!3019) )
))
(declare-datatypes ((array!17045 0))(
  ( (array!17046 (arr!8057 (Array (_ BitVec 32) ValueCell!3019)) (size!8409 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17045)

(declare-datatypes ((array!17047 0))(
  ( (array!17048 (arr!8058 (Array (_ BitVec 32) (_ BitVec 64))) (size!8410 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17047)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332237 (= res!183032 (and (= (size!8409 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8410 _keys!1895) (size!8409 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332238 () Bool)

(declare-fun res!183030 () Bool)

(assert (=> b!332238 (=> (not res!183030) (not e!203974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17047 (_ BitVec 32)) Bool)

(assert (=> b!332238 (= res!183030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11472 () Bool)

(declare-fun mapRes!11472 () Bool)

(assert (=> mapIsEmpty!11472 mapRes!11472))

(declare-fun b!332239 () Bool)

(assert (=> b!332239 (= e!203974 false)))

(declare-fun lt!158983 () Bool)

(declare-datatypes ((List!4586 0))(
  ( (Nil!4583) (Cons!4582 (h!5438 (_ BitVec 64)) (t!9668 List!4586)) )
))
(declare-fun arrayNoDuplicates!0 (array!17047 (_ BitVec 32) List!4586) Bool)

(assert (=> b!332239 (= lt!158983 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4583))))

(declare-fun mapNonEmpty!11472 () Bool)

(declare-fun tp!23847 () Bool)

(assert (=> mapNonEmpty!11472 (= mapRes!11472 (and tp!23847 e!203972))))

(declare-fun mapKey!11472 () (_ BitVec 32))

(declare-fun mapValue!11472 () ValueCell!3019)

(declare-fun mapRest!11472 () (Array (_ BitVec 32) ValueCell!3019))

(assert (=> mapNonEmpty!11472 (= (arr!8057 _values!1525) (store mapRest!11472 mapKey!11472 mapValue!11472))))

(declare-fun res!183031 () Bool)

(assert (=> start!33472 (=> (not res!183031) (not e!203974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33472 (= res!183031 (validMask!0 mask!2385))))

(assert (=> start!33472 e!203974))

(assert (=> start!33472 true))

(declare-fun e!203975 () Bool)

(declare-fun array_inv!6000 (array!17045) Bool)

(assert (=> start!33472 (and (array_inv!6000 _values!1525) e!203975)))

(declare-fun array_inv!6001 (array!17047) Bool)

(assert (=> start!33472 (array_inv!6001 _keys!1895)))

(declare-fun b!332240 () Bool)

(assert (=> b!332240 (= e!203975 (and e!203976 mapRes!11472))))

(declare-fun condMapEmpty!11472 () Bool)

(declare-fun mapDefault!11472 () ValueCell!3019)

