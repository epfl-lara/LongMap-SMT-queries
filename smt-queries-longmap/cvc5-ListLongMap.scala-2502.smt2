; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38830 () Bool)

(assert start!38830)

(declare-fun b!405377 () Bool)

(declare-fun e!243748 () Bool)

(declare-fun tp_is_empty!10249 () Bool)

(assert (=> b!405377 (= e!243748 tp_is_empty!10249)))

(declare-fun b!405378 () Bool)

(declare-fun res!233967 () Bool)

(declare-fun e!243747 () Bool)

(assert (=> b!405378 (=> (not res!233967) (not e!243747))))

(declare-datatypes ((array!24389 0))(
  ( (array!24390 (arr!11644 (Array (_ BitVec 32) (_ BitVec 64))) (size!11996 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24389)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405378 (= res!233967 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!405379 () Bool)

(declare-fun res!233964 () Bool)

(assert (=> b!405379 (=> (not res!233964) (not e!243747))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405379 (= res!233964 (or (= (select (arr!11644 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11644 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405380 () Bool)

(declare-fun res!233960 () Bool)

(assert (=> b!405380 (=> (not res!233960) (not e!243747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405380 (= res!233960 (validKeyInArray!0 k!794))))

(declare-fun b!405381 () Bool)

(declare-fun res!233961 () Bool)

(assert (=> b!405381 (=> (not res!233961) (not e!243747))))

(declare-datatypes ((List!6771 0))(
  ( (Nil!6768) (Cons!6767 (h!7623 (_ BitVec 64)) (t!11945 List!6771)) )
))
(declare-fun arrayNoDuplicates!0 (array!24389 (_ BitVec 32) List!6771) Bool)

(assert (=> b!405381 (= res!233961 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6768))))

(declare-fun b!405382 () Bool)

(declare-fun res!233965 () Bool)

(assert (=> b!405382 (=> (not res!233965) (not e!243747))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405382 (= res!233965 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16995 () Bool)

(declare-fun mapRes!16995 () Bool)

(assert (=> mapIsEmpty!16995 mapRes!16995))

(declare-fun mapNonEmpty!16995 () Bool)

(declare-fun tp!33114 () Bool)

(declare-fun e!243749 () Bool)

(assert (=> mapNonEmpty!16995 (= mapRes!16995 (and tp!33114 e!243749))))

(declare-datatypes ((V!14771 0))(
  ( (V!14772 (val!5169 Int)) )
))
(declare-datatypes ((ValueCell!4781 0))(
  ( (ValueCellFull!4781 (v!7416 V!14771)) (EmptyCell!4781) )
))
(declare-datatypes ((array!24391 0))(
  ( (array!24392 (arr!11645 (Array (_ BitVec 32) ValueCell!4781)) (size!11997 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24391)

(declare-fun mapKey!16995 () (_ BitVec 32))

(declare-fun mapValue!16995 () ValueCell!4781)

(declare-fun mapRest!16995 () (Array (_ BitVec 32) ValueCell!4781))

(assert (=> mapNonEmpty!16995 (= (arr!11645 _values!549) (store mapRest!16995 mapKey!16995 mapValue!16995))))

(declare-fun b!405383 () Bool)

(declare-fun e!243746 () Bool)

(assert (=> b!405383 (= e!243747 e!243746)))

(declare-fun res!233966 () Bool)

(assert (=> b!405383 (=> (not res!233966) (not e!243746))))

(declare-fun lt!188327 () array!24389)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24389 (_ BitVec 32)) Bool)

(assert (=> b!405383 (= res!233966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188327 mask!1025))))

(assert (=> b!405383 (= lt!188327 (array!24390 (store (arr!11644 _keys!709) i!563 k!794) (size!11996 _keys!709)))))

(declare-fun b!405384 () Bool)

(assert (=> b!405384 (= e!243746 false)))

(declare-fun lt!188326 () Bool)

(assert (=> b!405384 (= lt!188326 (arrayNoDuplicates!0 lt!188327 #b00000000000000000000000000000000 Nil!6768))))

(declare-fun b!405386 () Bool)

(declare-fun res!233962 () Bool)

(assert (=> b!405386 (=> (not res!233962) (not e!243747))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405386 (= res!233962 (and (= (size!11997 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11996 _keys!709) (size!11997 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405387 () Bool)

(declare-fun res!233963 () Bool)

(assert (=> b!405387 (=> (not res!233963) (not e!243747))))

(assert (=> b!405387 (= res!233963 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11996 _keys!709))))))

(declare-fun b!405388 () Bool)

(declare-fun res!233958 () Bool)

(assert (=> b!405388 (=> (not res!233958) (not e!243747))))

(assert (=> b!405388 (= res!233958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405389 () Bool)

(declare-fun e!243745 () Bool)

(assert (=> b!405389 (= e!243745 (and e!243748 mapRes!16995))))

(declare-fun condMapEmpty!16995 () Bool)

(declare-fun mapDefault!16995 () ValueCell!4781)

