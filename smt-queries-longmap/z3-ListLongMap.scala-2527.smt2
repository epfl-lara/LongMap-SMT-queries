; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38982 () Bool)

(assert start!38982)

(declare-fun b!408341 () Bool)

(declare-fun res!236246 () Bool)

(declare-fun e!245114 () Bool)

(assert (=> b!408341 (=> (not res!236246) (not e!245114))))

(declare-datatypes ((array!24677 0))(
  ( (array!24678 (arr!11788 (Array (_ BitVec 32) (_ BitVec 64))) (size!12140 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24677)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24677 (_ BitVec 32)) Bool)

(assert (=> b!408341 (= res!236246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408342 () Bool)

(declare-fun e!245115 () Bool)

(assert (=> b!408342 (= e!245114 e!245115)))

(declare-fun res!236244 () Bool)

(assert (=> b!408342 (=> (not res!236244) (not e!245115))))

(declare-fun lt!188783 () array!24677)

(assert (=> b!408342 (= res!236244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188783 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408342 (= lt!188783 (array!24678 (store (arr!11788 _keys!709) i!563 k0!794) (size!12140 _keys!709)))))

(declare-fun b!408343 () Bool)

(declare-fun e!245118 () Bool)

(declare-fun e!245113 () Bool)

(declare-fun mapRes!17223 () Bool)

(assert (=> b!408343 (= e!245118 (and e!245113 mapRes!17223))))

(declare-fun condMapEmpty!17223 () Bool)

(declare-datatypes ((V!14973 0))(
  ( (V!14974 (val!5245 Int)) )
))
(declare-datatypes ((ValueCell!4857 0))(
  ( (ValueCellFull!4857 (v!7492 V!14973)) (EmptyCell!4857) )
))
(declare-datatypes ((array!24679 0))(
  ( (array!24680 (arr!11789 (Array (_ BitVec 32) ValueCell!4857)) (size!12141 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24679)

(declare-fun mapDefault!17223 () ValueCell!4857)

(assert (=> b!408343 (= condMapEmpty!17223 (= (arr!11789 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4857)) mapDefault!17223)))))

(declare-fun b!408344 () Bool)

(declare-fun res!236242 () Bool)

(assert (=> b!408344 (=> (not res!236242) (not e!245114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408344 (= res!236242 (validMask!0 mask!1025))))

(declare-fun b!408346 () Bool)

(declare-fun res!236238 () Bool)

(assert (=> b!408346 (=> (not res!236238) (not e!245114))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408346 (= res!236238 (and (= (size!12141 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12140 _keys!709) (size!12141 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17223 () Bool)

(declare-fun tp!33342 () Bool)

(declare-fun e!245117 () Bool)

(assert (=> mapNonEmpty!17223 (= mapRes!17223 (and tp!33342 e!245117))))

(declare-fun mapKey!17223 () (_ BitVec 32))

(declare-fun mapValue!17223 () ValueCell!4857)

(declare-fun mapRest!17223 () (Array (_ BitVec 32) ValueCell!4857))

(assert (=> mapNonEmpty!17223 (= (arr!11789 _values!549) (store mapRest!17223 mapKey!17223 mapValue!17223))))

(declare-fun b!408347 () Bool)

(declare-fun res!236245 () Bool)

(assert (=> b!408347 (=> (not res!236245) (not e!245114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408347 (= res!236245 (validKeyInArray!0 k0!794))))

(declare-fun b!408348 () Bool)

(declare-fun tp_is_empty!10401 () Bool)

(assert (=> b!408348 (= e!245117 tp_is_empty!10401)))

(declare-fun res!236243 () Bool)

(assert (=> start!38982 (=> (not res!236243) (not e!245114))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38982 (= res!236243 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12140 _keys!709))))))

(assert (=> start!38982 e!245114))

(assert (=> start!38982 true))

(declare-fun array_inv!8598 (array!24679) Bool)

(assert (=> start!38982 (and (array_inv!8598 _values!549) e!245118)))

(declare-fun array_inv!8599 (array!24677) Bool)

(assert (=> start!38982 (array_inv!8599 _keys!709)))

(declare-fun b!408345 () Bool)

(declare-fun res!236241 () Bool)

(assert (=> b!408345 (=> (not res!236241) (not e!245114))))

(declare-fun arrayContainsKey!0 (array!24677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408345 (= res!236241 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408349 () Bool)

(assert (=> b!408349 (= e!245113 tp_is_empty!10401)))

(declare-fun b!408350 () Bool)

(assert (=> b!408350 (= e!245115 false)))

(declare-fun lt!188782 () Bool)

(declare-datatypes ((List!6831 0))(
  ( (Nil!6828) (Cons!6827 (h!7683 (_ BitVec 64)) (t!12005 List!6831)) )
))
(declare-fun arrayNoDuplicates!0 (array!24677 (_ BitVec 32) List!6831) Bool)

(assert (=> b!408350 (= lt!188782 (arrayNoDuplicates!0 lt!188783 #b00000000000000000000000000000000 Nil!6828))))

(declare-fun b!408351 () Bool)

(declare-fun res!236240 () Bool)

(assert (=> b!408351 (=> (not res!236240) (not e!245114))))

(assert (=> b!408351 (= res!236240 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12140 _keys!709))))))

(declare-fun b!408352 () Bool)

(declare-fun res!236239 () Bool)

(assert (=> b!408352 (=> (not res!236239) (not e!245114))))

(assert (=> b!408352 (= res!236239 (or (= (select (arr!11788 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11788 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408353 () Bool)

(declare-fun res!236247 () Bool)

(assert (=> b!408353 (=> (not res!236247) (not e!245114))))

(assert (=> b!408353 (= res!236247 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6828))))

(declare-fun mapIsEmpty!17223 () Bool)

(assert (=> mapIsEmpty!17223 mapRes!17223))

(assert (= (and start!38982 res!236243) b!408344))

(assert (= (and b!408344 res!236242) b!408346))

(assert (= (and b!408346 res!236238) b!408341))

(assert (= (and b!408341 res!236246) b!408353))

(assert (= (and b!408353 res!236247) b!408351))

(assert (= (and b!408351 res!236240) b!408347))

(assert (= (and b!408347 res!236245) b!408352))

(assert (= (and b!408352 res!236239) b!408345))

(assert (= (and b!408345 res!236241) b!408342))

(assert (= (and b!408342 res!236244) b!408350))

(assert (= (and b!408343 condMapEmpty!17223) mapIsEmpty!17223))

(assert (= (and b!408343 (not condMapEmpty!17223)) mapNonEmpty!17223))

(get-info :version)

(assert (= (and mapNonEmpty!17223 ((_ is ValueCellFull!4857) mapValue!17223)) b!408348))

(assert (= (and b!408343 ((_ is ValueCellFull!4857) mapDefault!17223)) b!408349))

(assert (= start!38982 b!408343))

(declare-fun m!399679 () Bool)

(assert (=> b!408350 m!399679))

(declare-fun m!399681 () Bool)

(assert (=> b!408344 m!399681))

(declare-fun m!399683 () Bool)

(assert (=> mapNonEmpty!17223 m!399683))

(declare-fun m!399685 () Bool)

(assert (=> b!408352 m!399685))

(declare-fun m!399687 () Bool)

(assert (=> b!408347 m!399687))

(declare-fun m!399689 () Bool)

(assert (=> b!408353 m!399689))

(declare-fun m!399691 () Bool)

(assert (=> b!408341 m!399691))

(declare-fun m!399693 () Bool)

(assert (=> start!38982 m!399693))

(declare-fun m!399695 () Bool)

(assert (=> start!38982 m!399695))

(declare-fun m!399697 () Bool)

(assert (=> b!408345 m!399697))

(declare-fun m!399699 () Bool)

(assert (=> b!408342 m!399699))

(declare-fun m!399701 () Bool)

(assert (=> b!408342 m!399701))

(check-sat (not b!408345) (not b!408344) (not b!408353) tp_is_empty!10401 (not start!38982) (not b!408342) (not b!408347) (not b!408341) (not mapNonEmpty!17223) (not b!408350))
(check-sat)
