; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38834 () Bool)

(assert start!38834)

(declare-fun mapNonEmpty!17001 () Bool)

(declare-fun mapRes!17001 () Bool)

(declare-fun tp!33120 () Bool)

(declare-fun e!243786 () Bool)

(assert (=> mapNonEmpty!17001 (= mapRes!17001 (and tp!33120 e!243786))))

(declare-fun mapKey!17001 () (_ BitVec 32))

(declare-datatypes ((V!14775 0))(
  ( (V!14776 (val!5171 Int)) )
))
(declare-datatypes ((ValueCell!4783 0))(
  ( (ValueCellFull!4783 (v!7418 V!14775)) (EmptyCell!4783) )
))
(declare-fun mapRest!17001 () (Array (_ BitVec 32) ValueCell!4783))

(declare-datatypes ((array!24397 0))(
  ( (array!24398 (arr!11648 (Array (_ BitVec 32) ValueCell!4783)) (size!12000 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24397)

(declare-fun mapValue!17001 () ValueCell!4783)

(assert (=> mapNonEmpty!17001 (= (arr!11648 _values!549) (store mapRest!17001 mapKey!17001 mapValue!17001))))

(declare-fun b!405455 () Bool)

(declare-fun res!234019 () Bool)

(declare-fun e!243785 () Bool)

(assert (=> b!405455 (=> (not res!234019) (not e!243785))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405455 (= res!234019 (validKeyInArray!0 k!794))))

(declare-fun b!405456 () Bool)

(declare-fun tp_is_empty!10253 () Bool)

(assert (=> b!405456 (= e!243786 tp_is_empty!10253)))

(declare-fun b!405457 () Bool)

(declare-fun res!234023 () Bool)

(assert (=> b!405457 (=> (not res!234023) (not e!243785))))

(declare-datatypes ((array!24399 0))(
  ( (array!24400 (arr!11649 (Array (_ BitVec 32) (_ BitVec 64))) (size!12001 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24399)

(declare-datatypes ((List!6773 0))(
  ( (Nil!6770) (Cons!6769 (h!7625 (_ BitVec 64)) (t!11947 List!6773)) )
))
(declare-fun arrayNoDuplicates!0 (array!24399 (_ BitVec 32) List!6773) Bool)

(assert (=> b!405457 (= res!234023 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6770))))

(declare-fun b!405458 () Bool)

(declare-fun res!234021 () Bool)

(assert (=> b!405458 (=> (not res!234021) (not e!243785))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405458 (= res!234021 (or (= (select (arr!11649 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11649 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17001 () Bool)

(assert (=> mapIsEmpty!17001 mapRes!17001))

(declare-fun b!405459 () Bool)

(declare-fun res!234025 () Bool)

(assert (=> b!405459 (=> (not res!234025) (not e!243785))))

(declare-fun arrayContainsKey!0 (array!24399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405459 (= res!234025 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!405460 () Bool)

(declare-fun e!243781 () Bool)

(assert (=> b!405460 (= e!243785 e!243781)))

(declare-fun res!234018 () Bool)

(assert (=> b!405460 (=> (not res!234018) (not e!243781))))

(declare-fun lt!188339 () array!24399)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24399 (_ BitVec 32)) Bool)

(assert (=> b!405460 (= res!234018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188339 mask!1025))))

(assert (=> b!405460 (= lt!188339 (array!24400 (store (arr!11649 _keys!709) i!563 k!794) (size!12001 _keys!709)))))

(declare-fun res!234024 () Bool)

(assert (=> start!38834 (=> (not res!234024) (not e!243785))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38834 (= res!234024 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12001 _keys!709))))))

(assert (=> start!38834 e!243785))

(assert (=> start!38834 true))

(declare-fun e!243784 () Bool)

(declare-fun array_inv!8512 (array!24397) Bool)

(assert (=> start!38834 (and (array_inv!8512 _values!549) e!243784)))

(declare-fun array_inv!8513 (array!24399) Bool)

(assert (=> start!38834 (array_inv!8513 _keys!709)))

(declare-fun b!405461 () Bool)

(declare-fun res!234026 () Bool)

(assert (=> b!405461 (=> (not res!234026) (not e!243785))))

(assert (=> b!405461 (= res!234026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405462 () Bool)

(declare-fun res!234027 () Bool)

(assert (=> b!405462 (=> (not res!234027) (not e!243785))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405462 (= res!234027 (and (= (size!12000 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12001 _keys!709) (size!12000 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405463 () Bool)

(declare-fun e!243783 () Bool)

(assert (=> b!405463 (= e!243783 tp_is_empty!10253)))

(declare-fun b!405464 () Bool)

(assert (=> b!405464 (= e!243784 (and e!243783 mapRes!17001))))

(declare-fun condMapEmpty!17001 () Bool)

(declare-fun mapDefault!17001 () ValueCell!4783)

