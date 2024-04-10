; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39068 () Bool)

(assert start!39068)

(declare-fun b_free!9335 () Bool)

(declare-fun b_next!9335 () Bool)

(assert (=> start!39068 (= b_free!9335 (not b_next!9335))))

(declare-fun tp!33533 () Bool)

(declare-fun b_and!16721 () Bool)

(assert (=> start!39068 (= tp!33533 b_and!16721)))

(declare-fun b!410142 () Bool)

(declare-fun res!237655 () Bool)

(declare-fun e!245887 () Bool)

(assert (=> b!410142 (=> (not res!237655) (not e!245887))))

(declare-datatypes ((array!24845 0))(
  ( (array!24846 (arr!11872 (Array (_ BitVec 32) (_ BitVec 64))) (size!12224 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24845)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24845 (_ BitVec 32)) Bool)

(assert (=> b!410142 (= res!237655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17352 () Bool)

(declare-fun mapRes!17352 () Bool)

(assert (=> mapIsEmpty!17352 mapRes!17352))

(declare-fun b!410143 () Bool)

(declare-fun res!237656 () Bool)

(declare-fun e!245891 () Bool)

(assert (=> b!410143 (=> (not res!237656) (not e!245891))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410143 (= res!237656 (bvsle from!863 i!563))))

(declare-fun b!410144 () Bool)

(declare-fun res!237658 () Bool)

(assert (=> b!410144 (=> (not res!237658) (not e!245887))))

(declare-datatypes ((List!6881 0))(
  ( (Nil!6878) (Cons!6877 (h!7733 (_ BitVec 64)) (t!12055 List!6881)) )
))
(declare-fun arrayNoDuplicates!0 (array!24845 (_ BitVec 32) List!6881) Bool)

(assert (=> b!410144 (= res!237658 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6878))))

(declare-fun b!410145 () Bool)

(declare-fun res!237660 () Bool)

(assert (=> b!410145 (=> (not res!237660) (not e!245887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410145 (= res!237660 (validMask!0 mask!1025))))

(declare-fun b!410146 () Bool)

(declare-fun e!245889 () Bool)

(declare-fun tp_is_empty!10487 () Bool)

(assert (=> b!410146 (= e!245889 tp_is_empty!10487)))

(declare-fun b!410147 () Bool)

(declare-fun res!237653 () Bool)

(assert (=> b!410147 (=> (not res!237653) (not e!245891))))

(declare-fun lt!189041 () array!24845)

(assert (=> b!410147 (= res!237653 (arrayNoDuplicates!0 lt!189041 #b00000000000000000000000000000000 Nil!6878))))

(declare-fun b!410148 () Bool)

(declare-fun res!237652 () Bool)

(assert (=> b!410148 (=> (not res!237652) (not e!245887))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15087 0))(
  ( (V!15088 (val!5288 Int)) )
))
(declare-datatypes ((ValueCell!4900 0))(
  ( (ValueCellFull!4900 (v!7535 V!15087)) (EmptyCell!4900) )
))
(declare-datatypes ((array!24847 0))(
  ( (array!24848 (arr!11873 (Array (_ BitVec 32) ValueCell!4900)) (size!12225 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24847)

(assert (=> b!410148 (= res!237652 (and (= (size!12225 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12224 _keys!709) (size!12225 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410149 () Bool)

(declare-fun res!237663 () Bool)

(assert (=> b!410149 (=> (not res!237663) (not e!245887))))

(assert (=> b!410149 (= res!237663 (or (= (select (arr!11872 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11872 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410150 () Bool)

(assert (=> b!410150 (= e!245887 e!245891)))

(declare-fun res!237657 () Bool)

(assert (=> b!410150 (=> (not res!237657) (not e!245891))))

(assert (=> b!410150 (= res!237657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189041 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!410150 (= lt!189041 (array!24846 (store (arr!11872 _keys!709) i!563 k!794) (size!12224 _keys!709)))))

(declare-fun mapNonEmpty!17352 () Bool)

(declare-fun tp!33534 () Bool)

(declare-fun e!245890 () Bool)

(assert (=> mapNonEmpty!17352 (= mapRes!17352 (and tp!33534 e!245890))))

(declare-fun mapKey!17352 () (_ BitVec 32))

(declare-fun mapValue!17352 () ValueCell!4900)

(declare-fun mapRest!17352 () (Array (_ BitVec 32) ValueCell!4900))

(assert (=> mapNonEmpty!17352 (= (arr!11873 _values!549) (store mapRest!17352 mapKey!17352 mapValue!17352))))

(declare-fun res!237661 () Bool)

(assert (=> start!39068 (=> (not res!237661) (not e!245887))))

(assert (=> start!39068 (= res!237661 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12224 _keys!709))))))

(assert (=> start!39068 e!245887))

(assert (=> start!39068 tp_is_empty!10487))

(assert (=> start!39068 tp!33533))

(assert (=> start!39068 true))

(declare-fun e!245892 () Bool)

(declare-fun array_inv!8664 (array!24847) Bool)

(assert (=> start!39068 (and (array_inv!8664 _values!549) e!245892)))

(declare-fun array_inv!8665 (array!24845) Bool)

(assert (=> start!39068 (array_inv!8665 _keys!709)))

(declare-fun b!410151 () Bool)

(declare-fun res!237662 () Bool)

(assert (=> b!410151 (=> (not res!237662) (not e!245887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410151 (= res!237662 (validKeyInArray!0 k!794))))

(declare-fun b!410152 () Bool)

(assert (=> b!410152 (= e!245892 (and e!245889 mapRes!17352))))

(declare-fun condMapEmpty!17352 () Bool)

(declare-fun mapDefault!17352 () ValueCell!4900)

