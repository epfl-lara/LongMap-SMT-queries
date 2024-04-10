; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39044 () Bool)

(assert start!39044)

(declare-fun b_free!9311 () Bool)

(declare-fun b_next!9311 () Bool)

(assert (=> start!39044 (= b_free!9311 (not b_next!9311))))

(declare-fun tp!33462 () Bool)

(declare-fun b_and!16697 () Bool)

(assert (=> start!39044 (= tp!33462 b_and!16697)))

(declare-fun b!409602 () Bool)

(declare-fun e!245672 () Bool)

(assert (=> b!409602 (= e!245672 false)))

(declare-datatypes ((V!15055 0))(
  ( (V!15056 (val!5276 Int)) )
))
(declare-datatypes ((tuple2!6840 0))(
  ( (tuple2!6841 (_1!3431 (_ BitVec 64)) (_2!3431 V!15055)) )
))
(declare-datatypes ((List!6863 0))(
  ( (Nil!6860) (Cons!6859 (h!7715 tuple2!6840) (t!12037 List!6863)) )
))
(declare-datatypes ((ListLongMap!5753 0))(
  ( (ListLongMap!5754 (toList!2892 List!6863)) )
))
(declare-fun lt!188968 () ListLongMap!5753)

(declare-fun minValue!515 () V!15055)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4888 0))(
  ( (ValueCellFull!4888 (v!7523 V!15055)) (EmptyCell!4888) )
))
(declare-datatypes ((array!24799 0))(
  ( (array!24800 (arr!11849 (Array (_ BitVec 32) ValueCell!4888)) (size!12201 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24799)

(declare-fun zeroValue!515 () V!15055)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24801 0))(
  ( (array!24802 (arr!11850 (Array (_ BitVec 32) (_ BitVec 64))) (size!12202 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24801)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1100 (array!24801 array!24799 (_ BitVec 32) (_ BitVec 32) V!15055 V!15055 (_ BitVec 32) Int) ListLongMap!5753)

(assert (=> b!409602 (= lt!188968 (getCurrentListMapNoExtraKeys!1100 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409603 () Bool)

(declare-fun e!245674 () Bool)

(declare-fun tp_is_empty!10463 () Bool)

(assert (=> b!409603 (= e!245674 tp_is_empty!10463)))

(declare-fun b!409604 () Bool)

(declare-fun res!237227 () Bool)

(assert (=> b!409604 (=> (not res!237227) (not e!245672))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409604 (= res!237227 (bvsle from!863 i!563))))

(declare-fun b!409605 () Bool)

(declare-fun res!237230 () Bool)

(declare-fun e!245676 () Bool)

(assert (=> b!409605 (=> (not res!237230) (not e!245676))))

(assert (=> b!409605 (= res!237230 (or (= (select (arr!11850 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11850 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17316 () Bool)

(declare-fun mapRes!17316 () Bool)

(assert (=> mapIsEmpty!17316 mapRes!17316))

(declare-fun b!409606 () Bool)

(declare-fun res!237222 () Bool)

(assert (=> b!409606 (=> (not res!237222) (not e!245676))))

(assert (=> b!409606 (= res!237222 (and (= (size!12201 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12202 _keys!709) (size!12201 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409607 () Bool)

(declare-fun res!237223 () Bool)

(assert (=> b!409607 (=> (not res!237223) (not e!245676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24801 (_ BitVec 32)) Bool)

(assert (=> b!409607 (= res!237223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!237220 () Bool)

(assert (=> start!39044 (=> (not res!237220) (not e!245676))))

(assert (=> start!39044 (= res!237220 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12202 _keys!709))))))

(assert (=> start!39044 e!245676))

(assert (=> start!39044 tp_is_empty!10463))

(assert (=> start!39044 tp!33462))

(assert (=> start!39044 true))

(declare-fun e!245675 () Bool)

(declare-fun array_inv!8648 (array!24799) Bool)

(assert (=> start!39044 (and (array_inv!8648 _values!549) e!245675)))

(declare-fun array_inv!8649 (array!24801) Bool)

(assert (=> start!39044 (array_inv!8649 _keys!709)))

(declare-fun b!409608 () Bool)

(declare-fun res!237225 () Bool)

(assert (=> b!409608 (=> (not res!237225) (not e!245676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409608 (= res!237225 (validMask!0 mask!1025))))

(declare-fun b!409609 () Bool)

(assert (=> b!409609 (= e!245676 e!245672)))

(declare-fun res!237226 () Bool)

(assert (=> b!409609 (=> (not res!237226) (not e!245672))))

(declare-fun lt!188969 () array!24801)

(assert (=> b!409609 (= res!237226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188969 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!409609 (= lt!188969 (array!24802 (store (arr!11850 _keys!709) i!563 k!794) (size!12202 _keys!709)))))

(declare-fun mapNonEmpty!17316 () Bool)

(declare-fun tp!33461 () Bool)

(assert (=> mapNonEmpty!17316 (= mapRes!17316 (and tp!33461 e!245674))))

(declare-fun mapRest!17316 () (Array (_ BitVec 32) ValueCell!4888))

(declare-fun mapValue!17316 () ValueCell!4888)

(declare-fun mapKey!17316 () (_ BitVec 32))

(assert (=> mapNonEmpty!17316 (= (arr!11849 _values!549) (store mapRest!17316 mapKey!17316 mapValue!17316))))

(declare-fun b!409610 () Bool)

(declare-fun res!237228 () Bool)

(assert (=> b!409610 (=> (not res!237228) (not e!245676))))

(declare-datatypes ((List!6864 0))(
  ( (Nil!6861) (Cons!6860 (h!7716 (_ BitVec 64)) (t!12038 List!6864)) )
))
(declare-fun arrayNoDuplicates!0 (array!24801 (_ BitVec 32) List!6864) Bool)

(assert (=> b!409610 (= res!237228 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6861))))

(declare-fun b!409611 () Bool)

(declare-fun res!237221 () Bool)

(assert (=> b!409611 (=> (not res!237221) (not e!245676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409611 (= res!237221 (validKeyInArray!0 k!794))))

(declare-fun b!409612 () Bool)

(declare-fun e!245671 () Bool)

(assert (=> b!409612 (= e!245675 (and e!245671 mapRes!17316))))

(declare-fun condMapEmpty!17316 () Bool)

(declare-fun mapDefault!17316 () ValueCell!4888)

