; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38434 () Bool)

(assert start!38434)

(declare-fun b!396359 () Bool)

(declare-fun e!239857 () Bool)

(declare-fun tp_is_empty!9853 () Bool)

(assert (=> b!396359 (= e!239857 tp_is_empty!9853)))

(declare-fun b!396361 () Bool)

(declare-fun res!227379 () Bool)

(declare-fun e!239862 () Bool)

(assert (=> b!396361 (=> (not res!227379) (not e!239862))))

(declare-datatypes ((array!23619 0))(
  ( (array!23620 (arr!11259 (Array (_ BitVec 32) (_ BitVec 64))) (size!11611 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23619)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14243 0))(
  ( (V!14244 (val!4971 Int)) )
))
(declare-datatypes ((ValueCell!4583 0))(
  ( (ValueCellFull!4583 (v!7218 V!14243)) (EmptyCell!4583) )
))
(declare-datatypes ((array!23621 0))(
  ( (array!23622 (arr!11260 (Array (_ BitVec 32) ValueCell!4583)) (size!11612 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23621)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396361 (= res!227379 (and (= (size!11612 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11611 _keys!709) (size!11612 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396362 () Bool)

(declare-fun e!239859 () Bool)

(assert (=> b!396362 (= e!239859 false)))

(declare-fun lt!187138 () Bool)

(declare-fun lt!187139 () array!23619)

(declare-datatypes ((List!6524 0))(
  ( (Nil!6521) (Cons!6520 (h!7376 (_ BitVec 64)) (t!11698 List!6524)) )
))
(declare-fun arrayNoDuplicates!0 (array!23619 (_ BitVec 32) List!6524) Bool)

(assert (=> b!396362 (= lt!187138 (arrayNoDuplicates!0 lt!187139 #b00000000000000000000000000000000 Nil!6521))))

(declare-fun mapIsEmpty!16401 () Bool)

(declare-fun mapRes!16401 () Bool)

(assert (=> mapIsEmpty!16401 mapRes!16401))

(declare-fun b!396363 () Bool)

(declare-fun res!227378 () Bool)

(assert (=> b!396363 (=> (not res!227378) (not e!239862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23619 (_ BitVec 32)) Bool)

(assert (=> b!396363 (= res!227378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16401 () Bool)

(declare-fun tp!32196 () Bool)

(assert (=> mapNonEmpty!16401 (= mapRes!16401 (and tp!32196 e!239857))))

(declare-fun mapValue!16401 () ValueCell!4583)

(declare-fun mapKey!16401 () (_ BitVec 32))

(declare-fun mapRest!16401 () (Array (_ BitVec 32) ValueCell!4583))

(assert (=> mapNonEmpty!16401 (= (arr!11260 _values!549) (store mapRest!16401 mapKey!16401 mapValue!16401))))

(declare-fun b!396364 () Bool)

(declare-fun e!239858 () Bool)

(declare-fun e!239861 () Bool)

(assert (=> b!396364 (= e!239858 (and e!239861 mapRes!16401))))

(declare-fun condMapEmpty!16401 () Bool)

(declare-fun mapDefault!16401 () ValueCell!4583)

