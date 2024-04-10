; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36634 () Bool)

(assert start!36634)

(declare-fun mapIsEmpty!14256 () Bool)

(declare-fun mapRes!14256 () Bool)

(assert (=> mapIsEmpty!14256 mapRes!14256))

(declare-fun b!365645 () Bool)

(declare-fun res!204443 () Bool)

(declare-fun e!223921 () Bool)

(assert (=> b!365645 (=> (not res!204443) (not e!223921))))

(declare-datatypes ((array!20895 0))(
  ( (array!20896 (arr!9920 (Array (_ BitVec 32) (_ BitVec 64))) (size!10272 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20895)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20895 (_ BitVec 32)) Bool)

(assert (=> b!365645 (= res!204443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365646 () Bool)

(declare-fun e!223922 () Bool)

(declare-fun e!223920 () Bool)

(assert (=> b!365646 (= e!223922 (and e!223920 mapRes!14256))))

(declare-fun condMapEmpty!14256 () Bool)

(declare-datatypes ((V!12397 0))(
  ( (V!12398 (val!4279 Int)) )
))
(declare-datatypes ((ValueCell!3891 0))(
  ( (ValueCellFull!3891 (v!6475 V!12397)) (EmptyCell!3891) )
))
(declare-datatypes ((array!20897 0))(
  ( (array!20898 (arr!9921 (Array (_ BitVec 32) ValueCell!3891)) (size!10273 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20897)

(declare-fun mapDefault!14256 () ValueCell!3891)

(assert (=> b!365646 (= condMapEmpty!14256 (= (arr!9921 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3891)) mapDefault!14256)))))

(declare-fun b!365647 () Bool)

(declare-fun res!204446 () Bool)

(assert (=> b!365647 (=> (not res!204446) (not e!223921))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365647 (= res!204446 (and (= (size!10273 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10272 _keys!658) (size!10273 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365648 () Bool)

(declare-fun res!204445 () Bool)

(assert (=> b!365648 (=> (not res!204445) (not e!223921))))

(declare-datatypes ((List!5531 0))(
  ( (Nil!5528) (Cons!5527 (h!6383 (_ BitVec 64)) (t!10681 List!5531)) )
))
(declare-fun arrayNoDuplicates!0 (array!20895 (_ BitVec 32) List!5531) Bool)

(assert (=> b!365648 (= res!204445 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5528))))

(declare-fun b!365649 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365649 (= e!223921 (and (or (= (select (arr!9920 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9920 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!10272 _keys!658))))))

(declare-fun res!204447 () Bool)

(assert (=> start!36634 (=> (not res!204447) (not e!223921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36634 (= res!204447 (validMask!0 mask!970))))

(assert (=> start!36634 e!223921))

(assert (=> start!36634 true))

(declare-fun array_inv!7346 (array!20897) Bool)

(assert (=> start!36634 (and (array_inv!7346 _values!506) e!223922)))

(declare-fun array_inv!7347 (array!20895) Bool)

(assert (=> start!36634 (array_inv!7347 _keys!658)))

(declare-fun b!365650 () Bool)

(declare-fun tp_is_empty!8469 () Bool)

(assert (=> b!365650 (= e!223920 tp_is_empty!8469)))

(declare-fun b!365651 () Bool)

(declare-fun e!223919 () Bool)

(assert (=> b!365651 (= e!223919 tp_is_empty!8469)))

(declare-fun b!365652 () Bool)

(declare-fun res!204444 () Bool)

(assert (=> b!365652 (=> (not res!204444) (not e!223921))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365652 (= res!204444 (validKeyInArray!0 k0!778))))

(declare-fun b!365653 () Bool)

(declare-fun res!204442 () Bool)

(assert (=> b!365653 (=> (not res!204442) (not e!223921))))

(assert (=> b!365653 (= res!204442 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10272 _keys!658))))))

(declare-fun mapNonEmpty!14256 () Bool)

(declare-fun tp!28332 () Bool)

(assert (=> mapNonEmpty!14256 (= mapRes!14256 (and tp!28332 e!223919))))

(declare-fun mapKey!14256 () (_ BitVec 32))

(declare-fun mapRest!14256 () (Array (_ BitVec 32) ValueCell!3891))

(declare-fun mapValue!14256 () ValueCell!3891)

(assert (=> mapNonEmpty!14256 (= (arr!9921 _values!506) (store mapRest!14256 mapKey!14256 mapValue!14256))))

(assert (= (and start!36634 res!204447) b!365647))

(assert (= (and b!365647 res!204446) b!365645))

(assert (= (and b!365645 res!204443) b!365648))

(assert (= (and b!365648 res!204445) b!365653))

(assert (= (and b!365653 res!204442) b!365652))

(assert (= (and b!365652 res!204444) b!365649))

(assert (= (and b!365646 condMapEmpty!14256) mapIsEmpty!14256))

(assert (= (and b!365646 (not condMapEmpty!14256)) mapNonEmpty!14256))

(get-info :version)

(assert (= (and mapNonEmpty!14256 ((_ is ValueCellFull!3891) mapValue!14256)) b!365651))

(assert (= (and b!365646 ((_ is ValueCellFull!3891) mapDefault!14256)) b!365650))

(assert (= start!36634 b!365646))

(declare-fun m!363283 () Bool)

(assert (=> b!365652 m!363283))

(declare-fun m!363285 () Bool)

(assert (=> mapNonEmpty!14256 m!363285))

(declare-fun m!363287 () Bool)

(assert (=> b!365645 m!363287))

(declare-fun m!363289 () Bool)

(assert (=> b!365649 m!363289))

(declare-fun m!363291 () Bool)

(assert (=> start!36634 m!363291))

(declare-fun m!363293 () Bool)

(assert (=> start!36634 m!363293))

(declare-fun m!363295 () Bool)

(assert (=> start!36634 m!363295))

(declare-fun m!363297 () Bool)

(assert (=> b!365648 m!363297))

(check-sat tp_is_empty!8469 (not b!365648) (not b!365645) (not start!36634) (not b!365652) (not mapNonEmpty!14256))
(check-sat)
