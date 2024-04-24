; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36882 () Bool)

(assert start!36882)

(declare-fun b_free!8023 () Bool)

(declare-fun b_next!8023 () Bool)

(assert (=> start!36882 (= b_free!8023 (not b_next!8023))))

(declare-fun tp!28785 () Bool)

(declare-fun b_and!15279 () Bool)

(assert (=> start!36882 (= tp!28785 b_and!15279)))

(declare-fun b!369439 () Bool)

(declare-fun res!207288 () Bool)

(declare-fun e!225785 () Bool)

(assert (=> b!369439 (=> (not res!207288) (not e!225785))))

(declare-datatypes ((array!21274 0))(
  ( (array!21275 (arr!10105 (Array (_ BitVec 32) (_ BitVec 64))) (size!10457 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21274)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369439 (= res!207288 (or (= (select (arr!10105 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10105 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369440 () Bool)

(declare-fun res!207295 () Bool)

(assert (=> b!369440 (=> (not res!207295) (not e!225785))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369440 (= res!207295 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369441 () Bool)

(declare-fun res!207292 () Bool)

(declare-fun e!225787 () Bool)

(assert (=> b!369441 (=> (not res!207292) (not e!225787))))

(declare-fun lt!169767 () array!21274)

(declare-datatypes ((List!5545 0))(
  ( (Nil!5542) (Cons!5541 (h!6397 (_ BitVec 64)) (t!10687 List!5545)) )
))
(declare-fun arrayNoDuplicates!0 (array!21274 (_ BitVec 32) List!5545) Bool)

(assert (=> b!369441 (= res!207292 (arrayNoDuplicates!0 lt!169767 #b00000000000000000000000000000000 Nil!5542))))

(declare-fun b!369442 () Bool)

(assert (=> b!369442 (= e!225785 e!225787)))

(declare-fun res!207294 () Bool)

(assert (=> b!369442 (=> (not res!207294) (not e!225787))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21274 (_ BitVec 32)) Bool)

(assert (=> b!369442 (= res!207294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169767 mask!970))))

(assert (=> b!369442 (= lt!169767 (array!21275 (store (arr!10105 _keys!658) i!548 k0!778) (size!10457 _keys!658)))))

(declare-fun b!369443 () Bool)

(declare-fun res!207291 () Bool)

(assert (=> b!369443 (=> (not res!207291) (not e!225785))))

(assert (=> b!369443 (= res!207291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369444 () Bool)

(declare-fun e!225786 () Bool)

(declare-fun tp_is_empty!8671 () Bool)

(assert (=> b!369444 (= e!225786 tp_is_empty!8671)))

(declare-fun b!369445 () Bool)

(declare-fun e!225788 () Bool)

(assert (=> b!369445 (= e!225788 tp_is_empty!8671)))

(declare-fun b!369446 () Bool)

(declare-fun res!207289 () Bool)

(assert (=> b!369446 (=> (not res!207289) (not e!225785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369446 (= res!207289 (validKeyInArray!0 k0!778))))

(declare-fun res!207290 () Bool)

(assert (=> start!36882 (=> (not res!207290) (not e!225785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36882 (= res!207290 (validMask!0 mask!970))))

(assert (=> start!36882 e!225785))

(declare-datatypes ((V!12667 0))(
  ( (V!12668 (val!4380 Int)) )
))
(declare-datatypes ((ValueCell!3992 0))(
  ( (ValueCellFull!3992 (v!6578 V!12667)) (EmptyCell!3992) )
))
(declare-datatypes ((array!21276 0))(
  ( (array!21277 (arr!10106 (Array (_ BitVec 32) ValueCell!3992)) (size!10458 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21276)

(declare-fun e!225784 () Bool)

(declare-fun array_inv!7496 (array!21276) Bool)

(assert (=> start!36882 (and (array_inv!7496 _values!506) e!225784)))

(assert (=> start!36882 tp!28785))

(assert (=> start!36882 true))

(assert (=> start!36882 tp_is_empty!8671))

(declare-fun array_inv!7497 (array!21274) Bool)

(assert (=> start!36882 (array_inv!7497 _keys!658)))

(declare-fun b!369447 () Bool)

(assert (=> b!369447 (= e!225787 false)))

(declare-datatypes ((tuple2!5718 0))(
  ( (tuple2!5719 (_1!2870 (_ BitVec 64)) (_2!2870 V!12667)) )
))
(declare-datatypes ((List!5546 0))(
  ( (Nil!5543) (Cons!5542 (h!6398 tuple2!5718) (t!10688 List!5546)) )
))
(declare-datatypes ((ListLongMap!4633 0))(
  ( (ListLongMap!4634 (toList!2332 List!5546)) )
))
(declare-fun lt!169766 () ListLongMap!4633)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12667)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12667)

(declare-fun minValue!472 () V!12667)

(declare-fun getCurrentListMapNoExtraKeys!641 (array!21274 array!21276 (_ BitVec 32) (_ BitVec 32) V!12667 V!12667 (_ BitVec 32) Int) ListLongMap!4633)

(assert (=> b!369447 (= lt!169766 (getCurrentListMapNoExtraKeys!641 lt!169767 (array!21277 (store (arr!10106 _values!506) i!548 (ValueCellFull!3992 v!373)) (size!10458 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169768 () ListLongMap!4633)

(assert (=> b!369447 (= lt!169768 (getCurrentListMapNoExtraKeys!641 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369448 () Bool)

(declare-fun res!207287 () Bool)

(assert (=> b!369448 (=> (not res!207287) (not e!225785))))

(assert (=> b!369448 (= res!207287 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5542))))

(declare-fun b!369449 () Bool)

(declare-fun mapRes!14571 () Bool)

(assert (=> b!369449 (= e!225784 (and e!225788 mapRes!14571))))

(declare-fun condMapEmpty!14571 () Bool)

(declare-fun mapDefault!14571 () ValueCell!3992)

(assert (=> b!369449 (= condMapEmpty!14571 (= (arr!10106 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3992)) mapDefault!14571)))))

(declare-fun b!369450 () Bool)

(declare-fun res!207296 () Bool)

(assert (=> b!369450 (=> (not res!207296) (not e!225785))))

(assert (=> b!369450 (= res!207296 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10457 _keys!658))))))

(declare-fun mapIsEmpty!14571 () Bool)

(assert (=> mapIsEmpty!14571 mapRes!14571))

(declare-fun b!369451 () Bool)

(declare-fun res!207293 () Bool)

(assert (=> b!369451 (=> (not res!207293) (not e!225785))))

(assert (=> b!369451 (= res!207293 (and (= (size!10458 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10457 _keys!658) (size!10458 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14571 () Bool)

(declare-fun tp!28784 () Bool)

(assert (=> mapNonEmpty!14571 (= mapRes!14571 (and tp!28784 e!225786))))

(declare-fun mapKey!14571 () (_ BitVec 32))

(declare-fun mapRest!14571 () (Array (_ BitVec 32) ValueCell!3992))

(declare-fun mapValue!14571 () ValueCell!3992)

(assert (=> mapNonEmpty!14571 (= (arr!10106 _values!506) (store mapRest!14571 mapKey!14571 mapValue!14571))))

(assert (= (and start!36882 res!207290) b!369451))

(assert (= (and b!369451 res!207293) b!369443))

(assert (= (and b!369443 res!207291) b!369448))

(assert (= (and b!369448 res!207287) b!369450))

(assert (= (and b!369450 res!207296) b!369446))

(assert (= (and b!369446 res!207289) b!369439))

(assert (= (and b!369439 res!207288) b!369440))

(assert (= (and b!369440 res!207295) b!369442))

(assert (= (and b!369442 res!207294) b!369441))

(assert (= (and b!369441 res!207292) b!369447))

(assert (= (and b!369449 condMapEmpty!14571) mapIsEmpty!14571))

(assert (= (and b!369449 (not condMapEmpty!14571)) mapNonEmpty!14571))

(get-info :version)

(assert (= (and mapNonEmpty!14571 ((_ is ValueCellFull!3992) mapValue!14571)) b!369444))

(assert (= (and b!369449 ((_ is ValueCellFull!3992) mapDefault!14571)) b!369445))

(assert (= start!36882 b!369449))

(declare-fun m!366083 () Bool)

(assert (=> b!369446 m!366083))

(declare-fun m!366085 () Bool)

(assert (=> b!369440 m!366085))

(declare-fun m!366087 () Bool)

(assert (=> b!369442 m!366087))

(declare-fun m!366089 () Bool)

(assert (=> b!369442 m!366089))

(declare-fun m!366091 () Bool)

(assert (=> b!369443 m!366091))

(declare-fun m!366093 () Bool)

(assert (=> b!369439 m!366093))

(declare-fun m!366095 () Bool)

(assert (=> b!369441 m!366095))

(declare-fun m!366097 () Bool)

(assert (=> start!36882 m!366097))

(declare-fun m!366099 () Bool)

(assert (=> start!36882 m!366099))

(declare-fun m!366101 () Bool)

(assert (=> start!36882 m!366101))

(declare-fun m!366103 () Bool)

(assert (=> b!369448 m!366103))

(declare-fun m!366105 () Bool)

(assert (=> b!369447 m!366105))

(declare-fun m!366107 () Bool)

(assert (=> b!369447 m!366107))

(declare-fun m!366109 () Bool)

(assert (=> b!369447 m!366109))

(declare-fun m!366111 () Bool)

(assert (=> mapNonEmpty!14571 m!366111))

(check-sat (not start!36882) tp_is_empty!8671 (not b!369441) (not b!369447) (not b_next!8023) (not b!369443) (not b!369446) (not b!369448) (not b!369440) b_and!15279 (not mapNonEmpty!14571) (not b!369442))
(check-sat b_and!15279 (not b_next!8023))
