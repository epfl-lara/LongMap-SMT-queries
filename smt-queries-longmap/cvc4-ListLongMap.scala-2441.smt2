; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38468 () Bool)

(assert start!38468)

(declare-fun b!397022 () Bool)

(declare-fun e!240166 () Bool)

(declare-fun tp_is_empty!9887 () Bool)

(assert (=> b!397022 (= e!240166 tp_is_empty!9887)))

(declare-fun b!397023 () Bool)

(declare-fun e!240165 () Bool)

(assert (=> b!397023 (= e!240165 tp_is_empty!9887)))

(declare-fun mapNonEmpty!16452 () Bool)

(declare-fun mapRes!16452 () Bool)

(declare-fun tp!32247 () Bool)

(assert (=> mapNonEmpty!16452 (= mapRes!16452 (and tp!32247 e!240166))))

(declare-fun mapKey!16452 () (_ BitVec 32))

(declare-datatypes ((V!14287 0))(
  ( (V!14288 (val!4988 Int)) )
))
(declare-datatypes ((ValueCell!4600 0))(
  ( (ValueCellFull!4600 (v!7235 V!14287)) (EmptyCell!4600) )
))
(declare-datatypes ((array!23687 0))(
  ( (array!23688 (arr!11293 (Array (_ BitVec 32) ValueCell!4600)) (size!11645 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23687)

(declare-fun mapValue!16452 () ValueCell!4600)

(declare-fun mapRest!16452 () (Array (_ BitVec 32) ValueCell!4600))

(assert (=> mapNonEmpty!16452 (= (arr!11293 _values!549) (store mapRest!16452 mapKey!16452 mapValue!16452))))

(declare-fun mapIsEmpty!16452 () Bool)

(assert (=> mapIsEmpty!16452 mapRes!16452))

(declare-fun b!397024 () Bool)

(declare-fun res!227883 () Bool)

(declare-fun e!240168 () Bool)

(assert (=> b!397024 (=> (not res!227883) (not e!240168))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23689 0))(
  ( (array!23690 (arr!11294 (Array (_ BitVec 32) (_ BitVec 64))) (size!11646 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23689)

(assert (=> b!397024 (= res!227883 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11646 _keys!709))))))

(declare-fun b!397025 () Bool)

(declare-fun res!227887 () Bool)

(assert (=> b!397025 (=> (not res!227887) (not e!240168))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397025 (= res!227887 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!397026 () Bool)

(declare-fun res!227880 () Bool)

(assert (=> b!397026 (=> (not res!227880) (not e!240168))))

(assert (=> b!397026 (= res!227880 (or (= (select (arr!11294 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11294 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397027 () Bool)

(declare-fun res!227882 () Bool)

(assert (=> b!397027 (=> (not res!227882) (not e!240168))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397027 (= res!227882 (validMask!0 mask!1025))))

(declare-fun b!397029 () Bool)

(declare-fun res!227884 () Bool)

(assert (=> b!397029 (=> (not res!227884) (not e!240168))))

(declare-datatypes ((List!6539 0))(
  ( (Nil!6536) (Cons!6535 (h!7391 (_ BitVec 64)) (t!11713 List!6539)) )
))
(declare-fun arrayNoDuplicates!0 (array!23689 (_ BitVec 32) List!6539) Bool)

(assert (=> b!397029 (= res!227884 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6536))))

(declare-fun b!397030 () Bool)

(declare-fun res!227886 () Bool)

(assert (=> b!397030 (=> (not res!227886) (not e!240168))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397030 (= res!227886 (and (= (size!11645 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11646 _keys!709) (size!11645 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397031 () Bool)

(declare-fun e!240163 () Bool)

(assert (=> b!397031 (= e!240163 false)))

(declare-fun lt!187241 () Bool)

(declare-fun lt!187240 () array!23689)

(assert (=> b!397031 (= lt!187241 (arrayNoDuplicates!0 lt!187240 #b00000000000000000000000000000000 Nil!6536))))

(declare-fun b!397032 () Bool)

(declare-fun res!227881 () Bool)

(assert (=> b!397032 (=> (not res!227881) (not e!240168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23689 (_ BitVec 32)) Bool)

(assert (=> b!397032 (= res!227881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397033 () Bool)

(declare-fun e!240164 () Bool)

(assert (=> b!397033 (= e!240164 (and e!240165 mapRes!16452))))

(declare-fun condMapEmpty!16452 () Bool)

(declare-fun mapDefault!16452 () ValueCell!4600)

