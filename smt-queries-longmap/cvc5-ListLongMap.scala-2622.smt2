; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39550 () Bool)

(assert start!39550)

(declare-fun b_free!9817 () Bool)

(declare-fun b_next!9817 () Bool)

(assert (=> start!39550 (= b_free!9817 (not b_next!9817))))

(declare-fun tp!34980 () Bool)

(declare-fun b_and!17473 () Bool)

(assert (=> start!39550 (= tp!34980 b_and!17473)))

(declare-fun b!423129 () Bool)

(declare-fun res!247234 () Bool)

(declare-fun e!251616 () Bool)

(assert (=> b!423129 (=> (not res!247234) (not e!251616))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423129 (= res!247234 (validMask!0 mask!1025))))

(declare-fun b!423130 () Bool)

(declare-fun res!247230 () Bool)

(assert (=> b!423130 (=> (not res!247230) (not e!251616))))

(declare-datatypes ((array!25785 0))(
  ( (array!25786 (arr!12342 (Array (_ BitVec 32) (_ BitVec 64))) (size!12694 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25785)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423130 (= res!247230 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!423131 () Bool)

(declare-fun res!247235 () Bool)

(declare-fun e!251613 () Bool)

(assert (=> b!423131 (=> (not res!247235) (not e!251613))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423131 (= res!247235 (bvsle from!863 i!563))))

(declare-fun b!423132 () Bool)

(declare-fun res!247237 () Bool)

(assert (=> b!423132 (=> (not res!247237) (not e!251616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25785 (_ BitVec 32)) Bool)

(assert (=> b!423132 (= res!247237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423133 () Bool)

(declare-fun res!247228 () Bool)

(assert (=> b!423133 (=> (not res!247228) (not e!251613))))

(declare-fun lt!194106 () array!25785)

(declare-datatypes ((List!7269 0))(
  ( (Nil!7266) (Cons!7265 (h!8121 (_ BitVec 64)) (t!12713 List!7269)) )
))
(declare-fun arrayNoDuplicates!0 (array!25785 (_ BitVec 32) List!7269) Bool)

(assert (=> b!423133 (= res!247228 (arrayNoDuplicates!0 lt!194106 #b00000000000000000000000000000000 Nil!7266))))

(declare-fun b!423134 () Bool)

(assert (=> b!423134 (= e!251613 false)))

(declare-datatypes ((V!15731 0))(
  ( (V!15732 (val!5529 Int)) )
))
(declare-fun minValue!515 () V!15731)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7262 0))(
  ( (tuple2!7263 (_1!3642 (_ BitVec 64)) (_2!3642 V!15731)) )
))
(declare-datatypes ((List!7270 0))(
  ( (Nil!7267) (Cons!7266 (h!8122 tuple2!7262) (t!12714 List!7270)) )
))
(declare-datatypes ((ListLongMap!6175 0))(
  ( (ListLongMap!6176 (toList!3103 List!7270)) )
))
(declare-fun lt!194108 () ListLongMap!6175)

(declare-fun zeroValue!515 () V!15731)

(declare-fun v!412 () V!15731)

(declare-datatypes ((ValueCell!5141 0))(
  ( (ValueCellFull!5141 (v!7776 V!15731)) (EmptyCell!5141) )
))
(declare-datatypes ((array!25787 0))(
  ( (array!25788 (arr!12343 (Array (_ BitVec 32) ValueCell!5141)) (size!12695 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25787)

(declare-fun getCurrentListMapNoExtraKeys!1307 (array!25785 array!25787 (_ BitVec 32) (_ BitVec 32) V!15731 V!15731 (_ BitVec 32) Int) ListLongMap!6175)

(assert (=> b!423134 (= lt!194108 (getCurrentListMapNoExtraKeys!1307 lt!194106 (array!25788 (store (arr!12343 _values!549) i!563 (ValueCellFull!5141 v!412)) (size!12695 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194107 () ListLongMap!6175)

(assert (=> b!423134 (= lt!194107 (getCurrentListMapNoExtraKeys!1307 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423135 () Bool)

(declare-fun res!247238 () Bool)

(assert (=> b!423135 (=> (not res!247238) (not e!251616))))

(assert (=> b!423135 (= res!247238 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12694 _keys!709))))))

(declare-fun b!423136 () Bool)

(declare-fun e!251615 () Bool)

(declare-fun tp_is_empty!10969 () Bool)

(assert (=> b!423136 (= e!251615 tp_is_empty!10969)))

(declare-fun b!423137 () Bool)

(declare-fun res!247233 () Bool)

(assert (=> b!423137 (=> (not res!247233) (not e!251616))))

(assert (=> b!423137 (= res!247233 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7266))))

(declare-fun b!423138 () Bool)

(declare-fun e!251614 () Bool)

(assert (=> b!423138 (= e!251614 tp_is_empty!10969)))

(declare-fun b!423139 () Bool)

(declare-fun res!247236 () Bool)

(assert (=> b!423139 (=> (not res!247236) (not e!251616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423139 (= res!247236 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!18075 () Bool)

(declare-fun mapRes!18075 () Bool)

(declare-fun tp!34979 () Bool)

(assert (=> mapNonEmpty!18075 (= mapRes!18075 (and tp!34979 e!251615))))

(declare-fun mapRest!18075 () (Array (_ BitVec 32) ValueCell!5141))

(declare-fun mapKey!18075 () (_ BitVec 32))

(declare-fun mapValue!18075 () ValueCell!5141)

(assert (=> mapNonEmpty!18075 (= (arr!12343 _values!549) (store mapRest!18075 mapKey!18075 mapValue!18075))))

(declare-fun res!247232 () Bool)

(assert (=> start!39550 (=> (not res!247232) (not e!251616))))

(assert (=> start!39550 (= res!247232 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12694 _keys!709))))))

(assert (=> start!39550 e!251616))

(assert (=> start!39550 tp_is_empty!10969))

(assert (=> start!39550 tp!34980))

(assert (=> start!39550 true))

(declare-fun e!251611 () Bool)

(declare-fun array_inv!8992 (array!25787) Bool)

(assert (=> start!39550 (and (array_inv!8992 _values!549) e!251611)))

(declare-fun array_inv!8993 (array!25785) Bool)

(assert (=> start!39550 (array_inv!8993 _keys!709)))

(declare-fun b!423140 () Bool)

(assert (=> b!423140 (= e!251616 e!251613)))

(declare-fun res!247239 () Bool)

(assert (=> b!423140 (=> (not res!247239) (not e!251613))))

(assert (=> b!423140 (= res!247239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194106 mask!1025))))

(assert (=> b!423140 (= lt!194106 (array!25786 (store (arr!12342 _keys!709) i!563 k!794) (size!12694 _keys!709)))))

(declare-fun b!423141 () Bool)

(declare-fun res!247229 () Bool)

(assert (=> b!423141 (=> (not res!247229) (not e!251616))))

(assert (=> b!423141 (= res!247229 (or (= (select (arr!12342 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12342 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423142 () Bool)

(declare-fun res!247231 () Bool)

(assert (=> b!423142 (=> (not res!247231) (not e!251616))))

(assert (=> b!423142 (= res!247231 (and (= (size!12695 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12694 _keys!709) (size!12695 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18075 () Bool)

(assert (=> mapIsEmpty!18075 mapRes!18075))

(declare-fun b!423143 () Bool)

(assert (=> b!423143 (= e!251611 (and e!251614 mapRes!18075))))

(declare-fun condMapEmpty!18075 () Bool)

(declare-fun mapDefault!18075 () ValueCell!5141)

