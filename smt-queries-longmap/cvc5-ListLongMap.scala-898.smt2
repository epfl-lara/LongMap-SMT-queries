; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20484 () Bool)

(assert start!20484)

(declare-fun b_free!5143 () Bool)

(declare-fun b_next!5143 () Bool)

(assert (=> start!20484 (= b_free!5143 (not b_next!5143))))

(declare-fun tp!18460 () Bool)

(declare-fun b_and!11889 () Bool)

(assert (=> start!20484 (= tp!18460 b_and!11889)))

(declare-fun b!203211 () Bool)

(declare-fun res!97591 () Bool)

(declare-fun e!133051 () Bool)

(assert (=> b!203211 (=> (not res!97591) (not e!133051))))

(declare-datatypes ((array!9223 0))(
  ( (array!9224 (arr!4362 (Array (_ BitVec 32) (_ BitVec 64))) (size!4687 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9223)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203211 (= res!97591 (= (select (arr!4362 _keys!825) i!601) k!843))))

(declare-fun b!203212 () Bool)

(declare-fun e!133053 () Bool)

(declare-fun tp_is_empty!4999 () Bool)

(assert (=> b!203212 (= e!133053 tp_is_empty!4999)))

(declare-fun b!203213 () Bool)

(declare-fun res!97588 () Bool)

(assert (=> b!203213 (=> (not res!97588) (not e!133051))))

(assert (=> b!203213 (= res!97588 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4687 _keys!825))))))

(declare-fun b!203214 () Bool)

(declare-fun res!97587 () Bool)

(assert (=> b!203214 (=> (not res!97587) (not e!133051))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9223 (_ BitVec 32)) Bool)

(assert (=> b!203214 (= res!97587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8567 () Bool)

(declare-fun mapRes!8567 () Bool)

(assert (=> mapIsEmpty!8567 mapRes!8567))

(declare-fun b!203215 () Bool)

(declare-fun e!133055 () Bool)

(assert (=> b!203215 (= e!133055 true)))

(declare-datatypes ((V!6313 0))(
  ( (V!6314 (val!2544 Int)) )
))
(declare-datatypes ((tuple2!3860 0))(
  ( (tuple2!3861 (_1!1941 (_ BitVec 64)) (_2!1941 V!6313)) )
))
(declare-datatypes ((List!2763 0))(
  ( (Nil!2760) (Cons!2759 (h!3401 tuple2!3860) (t!7694 List!2763)) )
))
(declare-datatypes ((ListLongMap!2773 0))(
  ( (ListLongMap!2774 (toList!1402 List!2763)) )
))
(declare-fun lt!102389 () ListLongMap!2773)

(declare-fun lt!102390 () ListLongMap!2773)

(declare-fun lt!102395 () tuple2!3860)

(declare-fun +!429 (ListLongMap!2773 tuple2!3860) ListLongMap!2773)

(assert (=> b!203215 (= lt!102389 (+!429 lt!102390 lt!102395))))

(declare-datatypes ((Unit!6152 0))(
  ( (Unit!6153) )
))
(declare-fun lt!102394 () Unit!6152)

(declare-fun lt!102393 () ListLongMap!2773)

(declare-fun v!520 () V!6313)

(declare-fun zeroValue!615 () V!6313)

(declare-fun addCommutativeForDiffKeys!144 (ListLongMap!2773 (_ BitVec 64) V!6313 (_ BitVec 64) V!6313) Unit!6152)

(assert (=> b!203215 (= lt!102394 (addCommutativeForDiffKeys!144 lt!102393 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203216 () Bool)

(declare-fun res!97584 () Bool)

(assert (=> b!203216 (=> (not res!97584) (not e!133051))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2156 0))(
  ( (ValueCellFull!2156 (v!4514 V!6313)) (EmptyCell!2156) )
))
(declare-datatypes ((array!9225 0))(
  ( (array!9226 (arr!4363 (Array (_ BitVec 32) ValueCell!2156)) (size!4688 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9225)

(assert (=> b!203216 (= res!97584 (and (= (size!4688 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4687 _keys!825) (size!4688 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203217 () Bool)

(declare-fun e!133050 () Bool)

(assert (=> b!203217 (= e!133050 tp_is_empty!4999)))

(declare-fun b!203218 () Bool)

(declare-fun e!133052 () Bool)

(assert (=> b!203218 (= e!133052 (and e!133053 mapRes!8567))))

(declare-fun condMapEmpty!8567 () Bool)

(declare-fun mapDefault!8567 () ValueCell!2156)

