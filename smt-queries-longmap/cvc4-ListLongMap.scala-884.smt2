; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20404 () Bool)

(assert start!20404)

(declare-fun b_free!5063 () Bool)

(declare-fun b_next!5063 () Bool)

(assert (=> start!20404 (= b_free!5063 (not b_next!5063))))

(declare-fun tp!18221 () Bool)

(declare-fun b_and!11809 () Bool)

(assert (=> start!20404 (= tp!18221 b_and!11809)))

(declare-fun b!201762 () Bool)

(declare-fun res!96497 () Bool)

(declare-fun e!132210 () Bool)

(assert (=> b!201762 (=> (not res!96497) (not e!132210))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201762 (= res!96497 (validKeyInArray!0 k!843))))

(declare-fun b!201763 () Bool)

(declare-fun res!96498 () Bool)

(assert (=> b!201763 (=> (not res!96498) (not e!132210))))

(declare-datatypes ((array!9067 0))(
  ( (array!9068 (arr!4284 (Array (_ BitVec 32) (_ BitVec 64))) (size!4609 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9067)

(declare-datatypes ((List!2705 0))(
  ( (Nil!2702) (Cons!2701 (h!3343 (_ BitVec 64)) (t!7636 List!2705)) )
))
(declare-fun arrayNoDuplicates!0 (array!9067 (_ BitVec 32) List!2705) Bool)

(assert (=> b!201763 (= res!96498 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2702))))

(declare-fun b!201764 () Bool)

(declare-fun res!96500 () Bool)

(assert (=> b!201764 (=> (not res!96500) (not e!132210))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6205 0))(
  ( (V!6206 (val!2504 Int)) )
))
(declare-datatypes ((ValueCell!2116 0))(
  ( (ValueCellFull!2116 (v!4474 V!6205)) (EmptyCell!2116) )
))
(declare-datatypes ((array!9069 0))(
  ( (array!9070 (arr!4285 (Array (_ BitVec 32) ValueCell!2116)) (size!4610 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9069)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201764 (= res!96500 (and (= (size!4610 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4609 _keys!825) (size!4610 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201765 () Bool)

(declare-fun e!132215 () Bool)

(assert (=> b!201765 (= e!132215 true)))

(declare-datatypes ((tuple2!3794 0))(
  ( (tuple2!3795 (_1!1908 (_ BitVec 64)) (_2!1908 V!6205)) )
))
(declare-datatypes ((List!2706 0))(
  ( (Nil!2703) (Cons!2702 (h!3344 tuple2!3794) (t!7637 List!2706)) )
))
(declare-datatypes ((ListLongMap!2707 0))(
  ( (ListLongMap!2708 (toList!1369 List!2706)) )
))
(declare-fun lt!100811 () ListLongMap!2707)

(declare-fun lt!100815 () tuple2!3794)

(declare-fun lt!100801 () ListLongMap!2707)

(declare-fun lt!100804 () tuple2!3794)

(declare-fun +!396 (ListLongMap!2707 tuple2!3794) ListLongMap!2707)

(assert (=> b!201765 (= (+!396 lt!100811 lt!100804) (+!396 lt!100801 lt!100815))))

(declare-fun minValue!615 () V!6205)

(declare-fun lt!100802 () ListLongMap!2707)

(declare-datatypes ((Unit!6092 0))(
  ( (Unit!6093) )
))
(declare-fun lt!100813 () Unit!6092)

(declare-fun v!520 () V!6205)

(declare-fun addCommutativeForDiffKeys!117 (ListLongMap!2707 (_ BitVec 64) V!6205 (_ BitVec 64) V!6205) Unit!6092)

(assert (=> b!201765 (= lt!100813 (addCommutativeForDiffKeys!117 lt!100802 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201766 () Bool)

(declare-fun res!96499 () Bool)

(assert (=> b!201766 (=> (not res!96499) (not e!132210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9067 (_ BitVec 32)) Bool)

(assert (=> b!201766 (= res!96499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8447 () Bool)

(declare-fun mapRes!8447 () Bool)

(declare-fun tp!18220 () Bool)

(declare-fun e!132211 () Bool)

(assert (=> mapNonEmpty!8447 (= mapRes!8447 (and tp!18220 e!132211))))

(declare-fun mapKey!8447 () (_ BitVec 32))

(declare-fun mapValue!8447 () ValueCell!2116)

(declare-fun mapRest!8447 () (Array (_ BitVec 32) ValueCell!2116))

(assert (=> mapNonEmpty!8447 (= (arr!4285 _values!649) (store mapRest!8447 mapKey!8447 mapValue!8447))))

(declare-fun b!201767 () Bool)

(declare-fun e!132212 () Bool)

(declare-fun tp_is_empty!4919 () Bool)

(assert (=> b!201767 (= e!132212 tp_is_empty!4919)))

(declare-fun b!201768 () Bool)

(declare-fun e!132213 () Bool)

(assert (=> b!201768 (= e!132213 (and e!132212 mapRes!8447))))

(declare-fun condMapEmpty!8447 () Bool)

(declare-fun mapDefault!8447 () ValueCell!2116)

