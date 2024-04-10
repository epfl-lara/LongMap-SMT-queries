; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39046 () Bool)

(assert start!39046)

(declare-fun b_free!9313 () Bool)

(declare-fun b_next!9313 () Bool)

(assert (=> start!39046 (= b_free!9313 (not b_next!9313))))

(declare-fun tp!33468 () Bool)

(declare-fun b_and!16699 () Bool)

(assert (=> start!39046 (= tp!33468 b_and!16699)))

(declare-fun b!409647 () Bool)

(declare-fun res!237260 () Bool)

(declare-fun e!245692 () Bool)

(assert (=> b!409647 (=> (not res!237260) (not e!245692))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409647 (= res!237260 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17319 () Bool)

(declare-fun mapRes!17319 () Bool)

(declare-fun tp!33467 () Bool)

(declare-fun e!245694 () Bool)

(assert (=> mapNonEmpty!17319 (= mapRes!17319 (and tp!33467 e!245694))))

(declare-datatypes ((V!15059 0))(
  ( (V!15060 (val!5277 Int)) )
))
(declare-datatypes ((ValueCell!4889 0))(
  ( (ValueCellFull!4889 (v!7524 V!15059)) (EmptyCell!4889) )
))
(declare-datatypes ((array!24803 0))(
  ( (array!24804 (arr!11851 (Array (_ BitVec 32) ValueCell!4889)) (size!12203 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24803)

(declare-fun mapKey!17319 () (_ BitVec 32))

(declare-fun mapRest!17319 () (Array (_ BitVec 32) ValueCell!4889))

(declare-fun mapValue!17319 () ValueCell!4889)

(assert (=> mapNonEmpty!17319 (= (arr!11851 _values!549) (store mapRest!17319 mapKey!17319 mapValue!17319))))

(declare-fun b!409648 () Bool)

(declare-fun res!237262 () Bool)

(declare-fun e!245693 () Bool)

(assert (=> b!409648 (=> (not res!237262) (not e!245693))))

(declare-datatypes ((array!24805 0))(
  ( (array!24806 (arr!11852 (Array (_ BitVec 32) (_ BitVec 64))) (size!12204 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24805)

(assert (=> b!409648 (= res!237262 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12204 _keys!709))))))

(declare-fun b!409649 () Bool)

(declare-fun res!237264 () Bool)

(assert (=> b!409649 (=> (not res!237264) (not e!245693))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409649 (= res!237264 (validKeyInArray!0 k!794))))

(declare-fun b!409650 () Bool)

(declare-fun res!237258 () Bool)

(assert (=> b!409650 (=> (not res!237258) (not e!245693))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24805 (_ BitVec 32)) Bool)

(assert (=> b!409650 (= res!237258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409651 () Bool)

(declare-fun res!237256 () Bool)

(assert (=> b!409651 (=> (not res!237256) (not e!245693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409651 (= res!237256 (validMask!0 mask!1025))))

(declare-fun b!409652 () Bool)

(declare-fun res!237265 () Bool)

(assert (=> b!409652 (=> (not res!237265) (not e!245693))))

(assert (=> b!409652 (= res!237265 (or (= (select (arr!11852 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11852 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409653 () Bool)

(declare-fun res!237259 () Bool)

(assert (=> b!409653 (=> (not res!237259) (not e!245693))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409653 (= res!237259 (and (= (size!12203 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12204 _keys!709) (size!12203 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17319 () Bool)

(assert (=> mapIsEmpty!17319 mapRes!17319))

(declare-fun res!237263 () Bool)

(assert (=> start!39046 (=> (not res!237263) (not e!245693))))

(assert (=> start!39046 (= res!237263 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12204 _keys!709))))))

(assert (=> start!39046 e!245693))

(declare-fun tp_is_empty!10465 () Bool)

(assert (=> start!39046 tp_is_empty!10465))

(assert (=> start!39046 tp!33468))

(assert (=> start!39046 true))

(declare-fun e!245690 () Bool)

(declare-fun array_inv!8650 (array!24803) Bool)

(assert (=> start!39046 (and (array_inv!8650 _values!549) e!245690)))

(declare-fun array_inv!8651 (array!24805) Bool)

(assert (=> start!39046 (array_inv!8651 _keys!709)))

(declare-fun b!409654 () Bool)

(declare-fun e!245689 () Bool)

(assert (=> b!409654 (= e!245690 (and e!245689 mapRes!17319))))

(declare-fun condMapEmpty!17319 () Bool)

(declare-fun mapDefault!17319 () ValueCell!4889)

