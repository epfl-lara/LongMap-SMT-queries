; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38774 () Bool)

(assert start!38774)

(declare-fun b!404287 () Bool)

(declare-fun res!233201 () Bool)

(declare-fun e!243197 () Bool)

(assert (=> b!404287 (=> (not res!233201) (not e!243197))))

(declare-datatypes ((array!24293 0))(
  ( (array!24294 (arr!11596 (Array (_ BitVec 32) (_ BitVec 64))) (size!11949 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24293)

(declare-datatypes ((List!6729 0))(
  ( (Nil!6726) (Cons!6725 (h!7581 (_ BitVec 64)) (t!11894 List!6729)) )
))
(declare-fun arrayNoDuplicates!0 (array!24293 (_ BitVec 32) List!6729) Bool)

(assert (=> b!404287 (= res!233201 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6726))))

(declare-fun b!404288 () Bool)

(declare-fun e!243194 () Bool)

(declare-fun tp_is_empty!10207 () Bool)

(assert (=> b!404288 (= e!243194 tp_is_empty!10207)))

(declare-fun b!404289 () Bool)

(declare-fun res!233204 () Bool)

(assert (=> b!404289 (=> (not res!233204) (not e!243197))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404289 (= res!233204 (validKeyInArray!0 k0!794))))

(declare-fun res!233203 () Bool)

(assert (=> start!38774 (=> (not res!233203) (not e!243197))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38774 (= res!233203 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11949 _keys!709))))))

(assert (=> start!38774 e!243197))

(assert (=> start!38774 true))

(declare-datatypes ((V!14715 0))(
  ( (V!14716 (val!5148 Int)) )
))
(declare-datatypes ((ValueCell!4760 0))(
  ( (ValueCellFull!4760 (v!7389 V!14715)) (EmptyCell!4760) )
))
(declare-datatypes ((array!24295 0))(
  ( (array!24296 (arr!11597 (Array (_ BitVec 32) ValueCell!4760)) (size!11950 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24295)

(declare-fun e!243193 () Bool)

(declare-fun array_inv!8512 (array!24295) Bool)

(assert (=> start!38774 (and (array_inv!8512 _values!549) e!243193)))

(declare-fun array_inv!8513 (array!24293) Bool)

(assert (=> start!38774 (array_inv!8513 _keys!709)))

(declare-fun b!404290 () Bool)

(declare-fun res!233200 () Bool)

(assert (=> b!404290 (=> (not res!233200) (not e!243197))))

(declare-fun arrayContainsKey!0 (array!24293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404290 (= res!233200 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404291 () Bool)

(declare-fun res!233207 () Bool)

(assert (=> b!404291 (=> (not res!233207) (not e!243197))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404291 (= res!233207 (and (= (size!11950 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11949 _keys!709) (size!11950 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404292 () Bool)

(declare-fun e!243195 () Bool)

(assert (=> b!404292 (= e!243197 e!243195)))

(declare-fun res!233206 () Bool)

(assert (=> b!404292 (=> (not res!233206) (not e!243195))))

(declare-fun lt!187966 () array!24293)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24293 (_ BitVec 32)) Bool)

(assert (=> b!404292 (= res!233206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187966 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404292 (= lt!187966 (array!24294 (store (arr!11596 _keys!709) i!563 k0!794) (size!11949 _keys!709)))))

(declare-fun b!404293 () Bool)

(declare-fun res!233202 () Bool)

(assert (=> b!404293 (=> (not res!233202) (not e!243197))))

(assert (=> b!404293 (= res!233202 (or (= (select (arr!11596 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11596 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404294 () Bool)

(declare-fun res!233199 () Bool)

(assert (=> b!404294 (=> (not res!233199) (not e!243197))))

(assert (=> b!404294 (= res!233199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16932 () Bool)

(declare-fun mapRes!16932 () Bool)

(declare-fun tp!33051 () Bool)

(assert (=> mapNonEmpty!16932 (= mapRes!16932 (and tp!33051 e!243194))))

(declare-fun mapKey!16932 () (_ BitVec 32))

(declare-fun mapRest!16932 () (Array (_ BitVec 32) ValueCell!4760))

(declare-fun mapValue!16932 () ValueCell!4760)

(assert (=> mapNonEmpty!16932 (= (arr!11597 _values!549) (store mapRest!16932 mapKey!16932 mapValue!16932))))

(declare-fun b!404295 () Bool)

(declare-fun e!243198 () Bool)

(assert (=> b!404295 (= e!243193 (and e!243198 mapRes!16932))))

(declare-fun condMapEmpty!16932 () Bool)

(declare-fun mapDefault!16932 () ValueCell!4760)

(assert (=> b!404295 (= condMapEmpty!16932 (= (arr!11597 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4760)) mapDefault!16932)))))

(declare-fun b!404296 () Bool)

(declare-fun res!233205 () Bool)

(assert (=> b!404296 (=> (not res!233205) (not e!243197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404296 (= res!233205 (validMask!0 mask!1025))))

(declare-fun b!404297 () Bool)

(declare-fun res!233208 () Bool)

(assert (=> b!404297 (=> (not res!233208) (not e!243197))))

(assert (=> b!404297 (= res!233208 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11949 _keys!709))))))

(declare-fun b!404298 () Bool)

(assert (=> b!404298 (= e!243198 tp_is_empty!10207)))

(declare-fun b!404299 () Bool)

(assert (=> b!404299 (= e!243195 false)))

(declare-fun lt!187967 () Bool)

(assert (=> b!404299 (= lt!187967 (arrayNoDuplicates!0 lt!187966 #b00000000000000000000000000000000 Nil!6726))))

(declare-fun mapIsEmpty!16932 () Bool)

(assert (=> mapIsEmpty!16932 mapRes!16932))

(assert (= (and start!38774 res!233203) b!404296))

(assert (= (and b!404296 res!233205) b!404291))

(assert (= (and b!404291 res!233207) b!404294))

(assert (= (and b!404294 res!233199) b!404287))

(assert (= (and b!404287 res!233201) b!404297))

(assert (= (and b!404297 res!233208) b!404289))

(assert (= (and b!404289 res!233204) b!404293))

(assert (= (and b!404293 res!233202) b!404290))

(assert (= (and b!404290 res!233200) b!404292))

(assert (= (and b!404292 res!233206) b!404299))

(assert (= (and b!404295 condMapEmpty!16932) mapIsEmpty!16932))

(assert (= (and b!404295 (not condMapEmpty!16932)) mapNonEmpty!16932))

(get-info :version)

(assert (= (and mapNonEmpty!16932 ((_ is ValueCellFull!4760) mapValue!16932)) b!404288))

(assert (= (and b!404295 ((_ is ValueCellFull!4760) mapDefault!16932)) b!404298))

(assert (= start!38774 b!404295))

(declare-fun m!396627 () Bool)

(assert (=> b!404299 m!396627))

(declare-fun m!396629 () Bool)

(assert (=> b!404289 m!396629))

(declare-fun m!396631 () Bool)

(assert (=> b!404287 m!396631))

(declare-fun m!396633 () Bool)

(assert (=> mapNonEmpty!16932 m!396633))

(declare-fun m!396635 () Bool)

(assert (=> b!404290 m!396635))

(declare-fun m!396637 () Bool)

(assert (=> b!404292 m!396637))

(declare-fun m!396639 () Bool)

(assert (=> b!404292 m!396639))

(declare-fun m!396641 () Bool)

(assert (=> start!38774 m!396641))

(declare-fun m!396643 () Bool)

(assert (=> start!38774 m!396643))

(declare-fun m!396645 () Bool)

(assert (=> b!404296 m!396645))

(declare-fun m!396647 () Bool)

(assert (=> b!404294 m!396647))

(declare-fun m!396649 () Bool)

(assert (=> b!404293 m!396649))

(check-sat (not start!38774) (not b!404296) (not b!404292) (not mapNonEmpty!16932) (not b!404289) tp_is_empty!10207 (not b!404287) (not b!404294) (not b!404299) (not b!404290))
(check-sat)
