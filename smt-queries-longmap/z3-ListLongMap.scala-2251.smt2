; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36954 () Bool)

(assert start!36954)

(declare-fun b_free!8095 () Bool)

(declare-fun b_next!8095 () Bool)

(assert (=> start!36954 (= b_free!8095 (not b_next!8095))))

(declare-fun tp!29001 () Bool)

(declare-fun b_and!15311 () Bool)

(assert (=> start!36954 (= tp!29001 b_and!15311)))

(declare-fun b!370621 () Bool)

(declare-fun res!208247 () Bool)

(declare-fun e!226290 () Bool)

(assert (=> b!370621 (=> (not res!208247) (not e!226290))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12763 0))(
  ( (V!12764 (val!4416 Int)) )
))
(declare-datatypes ((ValueCell!4028 0))(
  ( (ValueCellFull!4028 (v!6607 V!12763)) (EmptyCell!4028) )
))
(declare-datatypes ((array!21411 0))(
  ( (array!21412 (arr!10174 (Array (_ BitVec 32) ValueCell!4028)) (size!10527 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21411)

(declare-datatypes ((array!21413 0))(
  ( (array!21414 (arr!10175 (Array (_ BitVec 32) (_ BitVec 64))) (size!10528 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21413)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370621 (= res!208247 (and (= (size!10527 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10528 _keys!658) (size!10527 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370622 () Bool)

(declare-fun res!208249 () Bool)

(assert (=> b!370622 (=> (not res!208249) (not e!226290))))

(declare-datatypes ((List!5662 0))(
  ( (Nil!5659) (Cons!5658 (h!6514 (_ BitVec 64)) (t!10803 List!5662)) )
))
(declare-fun arrayNoDuplicates!0 (array!21413 (_ BitVec 32) List!5662) Bool)

(assert (=> b!370622 (= res!208249 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5659))))

(declare-fun b!370623 () Bool)

(declare-fun res!208242 () Bool)

(assert (=> b!370623 (=> (not res!208242) (not e!226290))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370623 (= res!208242 (validKeyInArray!0 k0!778))))

(declare-fun b!370624 () Bool)

(declare-fun res!208244 () Bool)

(assert (=> b!370624 (=> (not res!208244) (not e!226290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21413 (_ BitVec 32)) Bool)

(assert (=> b!370624 (= res!208244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370625 () Bool)

(declare-fun e!226294 () Bool)

(declare-fun tp_is_empty!8743 () Bool)

(assert (=> b!370625 (= e!226294 tp_is_empty!8743)))

(declare-fun b!370626 () Bool)

(declare-fun e!226293 () Bool)

(declare-fun mapRes!14679 () Bool)

(assert (=> b!370626 (= e!226293 (and e!226294 mapRes!14679))))

(declare-fun condMapEmpty!14679 () Bool)

(declare-fun mapDefault!14679 () ValueCell!4028)

(assert (=> b!370626 (= condMapEmpty!14679 (= (arr!10174 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4028)) mapDefault!14679)))))

(declare-fun res!208245 () Bool)

(assert (=> start!36954 (=> (not res!208245) (not e!226290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36954 (= res!208245 (validMask!0 mask!970))))

(assert (=> start!36954 e!226290))

(declare-fun array_inv!7524 (array!21411) Bool)

(assert (=> start!36954 (and (array_inv!7524 _values!506) e!226293)))

(assert (=> start!36954 tp!29001))

(assert (=> start!36954 true))

(assert (=> start!36954 tp_is_empty!8743))

(declare-fun array_inv!7525 (array!21413) Bool)

(assert (=> start!36954 (array_inv!7525 _keys!658)))

(declare-fun b!370627 () Bool)

(declare-fun res!208243 () Bool)

(assert (=> b!370627 (=> (not res!208243) (not e!226290))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370627 (= res!208243 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10528 _keys!658))))))

(declare-fun b!370628 () Bool)

(declare-fun e!226292 () Bool)

(assert (=> b!370628 (= e!226290 e!226292)))

(declare-fun res!208241 () Bool)

(assert (=> b!370628 (=> (not res!208241) (not e!226292))))

(declare-fun lt!169842 () array!21413)

(assert (=> b!370628 (= res!208241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169842 mask!970))))

(assert (=> b!370628 (= lt!169842 (array!21414 (store (arr!10175 _keys!658) i!548 k0!778) (size!10528 _keys!658)))))

(declare-fun mapIsEmpty!14679 () Bool)

(assert (=> mapIsEmpty!14679 mapRes!14679))

(declare-fun b!370629 () Bool)

(declare-fun res!208248 () Bool)

(assert (=> b!370629 (=> (not res!208248) (not e!226292))))

(assert (=> b!370629 (= res!208248 (arrayNoDuplicates!0 lt!169842 #b00000000000000000000000000000000 Nil!5659))))

(declare-fun mapNonEmpty!14679 () Bool)

(declare-fun tp!29000 () Bool)

(declare-fun e!226295 () Bool)

(assert (=> mapNonEmpty!14679 (= mapRes!14679 (and tp!29000 e!226295))))

(declare-fun mapValue!14679 () ValueCell!4028)

(declare-fun mapRest!14679 () (Array (_ BitVec 32) ValueCell!4028))

(declare-fun mapKey!14679 () (_ BitVec 32))

(assert (=> mapNonEmpty!14679 (= (arr!10174 _values!506) (store mapRest!14679 mapKey!14679 mapValue!14679))))

(declare-fun b!370630 () Bool)

(declare-fun res!208246 () Bool)

(assert (=> b!370630 (=> (not res!208246) (not e!226290))))

(assert (=> b!370630 (= res!208246 (or (= (select (arr!10175 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10175 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370631 () Bool)

(assert (=> b!370631 (= e!226295 tp_is_empty!8743)))

(declare-fun b!370632 () Bool)

(assert (=> b!370632 (= e!226292 (not true))))

(declare-datatypes ((tuple2!5830 0))(
  ( (tuple2!5831 (_1!2926 (_ BitVec 64)) (_2!2926 V!12763)) )
))
(declare-datatypes ((List!5663 0))(
  ( (Nil!5660) (Cons!5659 (h!6515 tuple2!5830) (t!10804 List!5663)) )
))
(declare-datatypes ((ListLongMap!4733 0))(
  ( (ListLongMap!4734 (toList!2382 List!5663)) )
))
(declare-fun lt!169841 () ListLongMap!4733)

(declare-fun lt!169844 () ListLongMap!4733)

(assert (=> b!370632 (and (= lt!169841 lt!169844) (= lt!169844 lt!169841))))

(declare-fun v!373 () V!12763)

(declare-fun lt!169845 () ListLongMap!4733)

(declare-fun +!750 (ListLongMap!4733 tuple2!5830) ListLongMap!4733)

(assert (=> b!370632 (= lt!169844 (+!750 lt!169845 (tuple2!5831 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12763)

(declare-datatypes ((Unit!11376 0))(
  ( (Unit!11377) )
))
(declare-fun lt!169843 () Unit!11376)

(declare-fun minValue!472 () V!12763)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!1 (array!21413 array!21411 (_ BitVec 32) (_ BitVec 32) V!12763 V!12763 (_ BitVec 32) (_ BitVec 64) V!12763 (_ BitVec 32) Int) Unit!11376)

(assert (=> b!370632 (= lt!169843 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!1 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!673 (array!21413 array!21411 (_ BitVec 32) (_ BitVec 32) V!12763 V!12763 (_ BitVec 32) Int) ListLongMap!4733)

(assert (=> b!370632 (= lt!169841 (getCurrentListMapNoExtraKeys!673 lt!169842 (array!21412 (store (arr!10174 _values!506) i!548 (ValueCellFull!4028 v!373)) (size!10527 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!370632 (= lt!169845 (getCurrentListMapNoExtraKeys!673 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370633 () Bool)

(declare-fun res!208250 () Bool)

(assert (=> b!370633 (=> (not res!208250) (not e!226290))))

(declare-fun arrayContainsKey!0 (array!21413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370633 (= res!208250 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36954 res!208245) b!370621))

(assert (= (and b!370621 res!208247) b!370624))

(assert (= (and b!370624 res!208244) b!370622))

(assert (= (and b!370622 res!208249) b!370627))

(assert (= (and b!370627 res!208243) b!370623))

(assert (= (and b!370623 res!208242) b!370630))

(assert (= (and b!370630 res!208246) b!370633))

(assert (= (and b!370633 res!208250) b!370628))

(assert (= (and b!370628 res!208241) b!370629))

(assert (= (and b!370629 res!208248) b!370632))

(assert (= (and b!370626 condMapEmpty!14679) mapIsEmpty!14679))

(assert (= (and b!370626 (not condMapEmpty!14679)) mapNonEmpty!14679))

(get-info :version)

(assert (= (and mapNonEmpty!14679 ((_ is ValueCellFull!4028) mapValue!14679)) b!370631))

(assert (= (and b!370626 ((_ is ValueCellFull!4028) mapDefault!14679)) b!370625))

(assert (= start!36954 b!370626))

(declare-fun m!366209 () Bool)

(assert (=> start!36954 m!366209))

(declare-fun m!366211 () Bool)

(assert (=> start!36954 m!366211))

(declare-fun m!366213 () Bool)

(assert (=> start!36954 m!366213))

(declare-fun m!366215 () Bool)

(assert (=> b!370623 m!366215))

(declare-fun m!366217 () Bool)

(assert (=> b!370632 m!366217))

(declare-fun m!366219 () Bool)

(assert (=> b!370632 m!366219))

(declare-fun m!366221 () Bool)

(assert (=> b!370632 m!366221))

(declare-fun m!366223 () Bool)

(assert (=> b!370632 m!366223))

(declare-fun m!366225 () Bool)

(assert (=> b!370632 m!366225))

(declare-fun m!366227 () Bool)

(assert (=> b!370622 m!366227))

(declare-fun m!366229 () Bool)

(assert (=> b!370629 m!366229))

(declare-fun m!366231 () Bool)

(assert (=> b!370630 m!366231))

(declare-fun m!366233 () Bool)

(assert (=> mapNonEmpty!14679 m!366233))

(declare-fun m!366235 () Bool)

(assert (=> b!370624 m!366235))

(declare-fun m!366237 () Bool)

(assert (=> b!370633 m!366237))

(declare-fun m!366239 () Bool)

(assert (=> b!370628 m!366239))

(declare-fun m!366241 () Bool)

(assert (=> b!370628 m!366241))

(check-sat (not b_next!8095) (not start!36954) (not b!370622) (not b!370623) (not b!370624) tp_is_empty!8743 (not b!370629) (not b!370633) (not b!370632) (not mapNonEmpty!14679) (not b!370628) b_and!15311)
(check-sat b_and!15311 (not b_next!8095))
