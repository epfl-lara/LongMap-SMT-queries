; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38482 () Bool)

(assert start!38482)

(declare-fun b!397295 () Bool)

(declare-fun res!228097 () Bool)

(declare-fun e!240292 () Bool)

(assert (=> b!397295 (=> (not res!228097) (not e!240292))))

(declare-datatypes ((array!23715 0))(
  ( (array!23716 (arr!11307 (Array (_ BitVec 32) (_ BitVec 64))) (size!11659 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23715)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14307 0))(
  ( (V!14308 (val!4995 Int)) )
))
(declare-datatypes ((ValueCell!4607 0))(
  ( (ValueCellFull!4607 (v!7242 V!14307)) (EmptyCell!4607) )
))
(declare-datatypes ((array!23717 0))(
  ( (array!23718 (arr!11308 (Array (_ BitVec 32) ValueCell!4607)) (size!11660 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23717)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397295 (= res!228097 (and (= (size!11660 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11659 _keys!709) (size!11660 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397296 () Bool)

(declare-fun e!240293 () Bool)

(declare-fun tp_is_empty!9901 () Bool)

(assert (=> b!397296 (= e!240293 tp_is_empty!9901)))

(declare-fun b!397297 () Bool)

(declare-fun res!228091 () Bool)

(assert (=> b!397297 (=> (not res!228091) (not e!240292))))

(declare-datatypes ((List!6545 0))(
  ( (Nil!6542) (Cons!6541 (h!7397 (_ BitVec 64)) (t!11719 List!6545)) )
))
(declare-fun arrayNoDuplicates!0 (array!23715 (_ BitVec 32) List!6545) Bool)

(assert (=> b!397297 (= res!228091 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6542))))

(declare-fun b!397298 () Bool)

(declare-fun e!240291 () Bool)

(assert (=> b!397298 (= e!240292 e!240291)))

(declare-fun res!228090 () Bool)

(assert (=> b!397298 (=> (not res!228090) (not e!240291))))

(declare-fun lt!187282 () array!23715)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23715 (_ BitVec 32)) Bool)

(assert (=> b!397298 (= res!228090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187282 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397298 (= lt!187282 (array!23716 (store (arr!11307 _keys!709) i!563 k!794) (size!11659 _keys!709)))))

(declare-fun b!397299 () Bool)

(declare-fun res!228094 () Bool)

(assert (=> b!397299 (=> (not res!228094) (not e!240292))))

(assert (=> b!397299 (= res!228094 (or (= (select (arr!11307 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11307 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397300 () Bool)

(declare-fun res!228093 () Bool)

(assert (=> b!397300 (=> (not res!228093) (not e!240292))))

(assert (=> b!397300 (= res!228093 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11659 _keys!709))))))

(declare-fun b!397301 () Bool)

(declare-fun e!240289 () Bool)

(declare-fun e!240294 () Bool)

(declare-fun mapRes!16473 () Bool)

(assert (=> b!397301 (= e!240289 (and e!240294 mapRes!16473))))

(declare-fun condMapEmpty!16473 () Bool)

(declare-fun mapDefault!16473 () ValueCell!4607)

