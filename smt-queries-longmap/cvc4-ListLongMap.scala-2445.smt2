; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38492 () Bool)

(assert start!38492)

(declare-fun b!397490 () Bool)

(declare-fun e!240383 () Bool)

(declare-fun tp_is_empty!9911 () Bool)

(assert (=> b!397490 (= e!240383 tp_is_empty!9911)))

(declare-fun b!397491 () Bool)

(declare-fun res!228240 () Bool)

(declare-fun e!240381 () Bool)

(assert (=> b!397491 (=> (not res!228240) (not e!240381))))

(declare-datatypes ((array!23735 0))(
  ( (array!23736 (arr!11317 (Array (_ BitVec 32) (_ BitVec 64))) (size!11669 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23735)

(declare-datatypes ((V!14319 0))(
  ( (V!14320 (val!5000 Int)) )
))
(declare-datatypes ((ValueCell!4612 0))(
  ( (ValueCellFull!4612 (v!7247 V!14319)) (EmptyCell!4612) )
))
(declare-datatypes ((array!23737 0))(
  ( (array!23738 (arr!11318 (Array (_ BitVec 32) ValueCell!4612)) (size!11670 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23737)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397491 (= res!228240 (and (= (size!11670 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11669 _keys!709) (size!11670 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397492 () Bool)

(declare-fun res!228248 () Bool)

(assert (=> b!397492 (=> (not res!228248) (not e!240381))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397492 (= res!228248 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11669 _keys!709))))))

(declare-fun mapIsEmpty!16488 () Bool)

(declare-fun mapRes!16488 () Bool)

(assert (=> mapIsEmpty!16488 mapRes!16488))

(declare-fun b!397493 () Bool)

(declare-fun e!240382 () Bool)

(assert (=> b!397493 (= e!240382 false)))

(declare-fun lt!187312 () Bool)

(declare-fun lt!187313 () array!23735)

(declare-datatypes ((List!6550 0))(
  ( (Nil!6547) (Cons!6546 (h!7402 (_ BitVec 64)) (t!11724 List!6550)) )
))
(declare-fun arrayNoDuplicates!0 (array!23735 (_ BitVec 32) List!6550) Bool)

(assert (=> b!397493 (= lt!187312 (arrayNoDuplicates!0 lt!187313 #b00000000000000000000000000000000 Nil!6547))))

(declare-fun mapNonEmpty!16488 () Bool)

(declare-fun tp!32283 () Bool)

(assert (=> mapNonEmpty!16488 (= mapRes!16488 (and tp!32283 e!240383))))

(declare-fun mapKey!16488 () (_ BitVec 32))

(declare-fun mapRest!16488 () (Array (_ BitVec 32) ValueCell!4612))

(declare-fun mapValue!16488 () ValueCell!4612)

(assert (=> mapNonEmpty!16488 (= (arr!11318 _values!549) (store mapRest!16488 mapKey!16488 mapValue!16488))))

(declare-fun b!397494 () Bool)

(assert (=> b!397494 (= e!240381 e!240382)))

(declare-fun res!228249 () Bool)

(assert (=> b!397494 (=> (not res!228249) (not e!240382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23735 (_ BitVec 32)) Bool)

(assert (=> b!397494 (= res!228249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187313 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!397494 (= lt!187313 (array!23736 (store (arr!11317 _keys!709) i!563 k!794) (size!11669 _keys!709)))))

(declare-fun b!397495 () Bool)

(declare-fun res!228244 () Bool)

(assert (=> b!397495 (=> (not res!228244) (not e!240381))))

(assert (=> b!397495 (= res!228244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397497 () Bool)

(declare-fun res!228242 () Bool)

(assert (=> b!397497 (=> (not res!228242) (not e!240381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397497 (= res!228242 (validMask!0 mask!1025))))

(declare-fun b!397498 () Bool)

(declare-fun e!240384 () Bool)

(declare-fun e!240379 () Bool)

(assert (=> b!397498 (= e!240384 (and e!240379 mapRes!16488))))

(declare-fun condMapEmpty!16488 () Bool)

(declare-fun mapDefault!16488 () ValueCell!4612)

