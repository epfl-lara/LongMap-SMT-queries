; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40958 () Bool)

(assert start!40958)

(declare-fun b_free!10893 () Bool)

(declare-fun b_next!10893 () Bool)

(assert (=> start!40958 (= b_free!10893 (not b_next!10893))))

(declare-fun tp!38506 () Bool)

(declare-fun b_and!19035 () Bool)

(assert (=> start!40958 (= tp!38506 b_and!19035)))

(declare-fun b!455717 () Bool)

(declare-fun res!271798 () Bool)

(declare-fun e!266393 () Bool)

(assert (=> b!455717 (=> (not res!271798) (not e!266393))))

(declare-datatypes ((array!28265 0))(
  ( (array!28266 (arr!13576 (Array (_ BitVec 32) (_ BitVec 64))) (size!13928 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28265)

(declare-datatypes ((List!8184 0))(
  ( (Nil!8181) (Cons!8180 (h!9036 (_ BitVec 64)) (t!14012 List!8184)) )
))
(declare-fun arrayNoDuplicates!0 (array!28265 (_ BitVec 32) List!8184) Bool)

(assert (=> b!455717 (= res!271798 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8181))))

(declare-fun b!455718 () Bool)

(declare-fun res!271789 () Bool)

(assert (=> b!455718 (=> (not res!271789) (not e!266393))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455718 (= res!271789 (validMask!0 mask!1025))))

(declare-fun b!455719 () Bool)

(declare-fun res!271794 () Bool)

(assert (=> b!455719 (=> (not res!271794) (not e!266393))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17413 0))(
  ( (V!17414 (val!6160 Int)) )
))
(declare-datatypes ((ValueCell!5772 0))(
  ( (ValueCellFull!5772 (v!8426 V!17413)) (EmptyCell!5772) )
))
(declare-datatypes ((array!28267 0))(
  ( (array!28268 (arr!13577 (Array (_ BitVec 32) ValueCell!5772)) (size!13929 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28267)

(assert (=> b!455719 (= res!271794 (and (= (size!13929 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13928 _keys!709) (size!13929 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455720 () Bool)

(declare-fun res!271791 () Bool)

(assert (=> b!455720 (=> (not res!271791) (not e!266393))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455720 (= res!271791 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19987 () Bool)

(declare-fun mapRes!19987 () Bool)

(declare-fun tp!38505 () Bool)

(declare-fun e!266392 () Bool)

(assert (=> mapNonEmpty!19987 (= mapRes!19987 (and tp!38505 e!266392))))

(declare-fun mapValue!19987 () ValueCell!5772)

(declare-fun mapRest!19987 () (Array (_ BitVec 32) ValueCell!5772))

(declare-fun mapKey!19987 () (_ BitVec 32))

(assert (=> mapNonEmpty!19987 (= (arr!13577 _values!549) (store mapRest!19987 mapKey!19987 mapValue!19987))))

(declare-fun b!455722 () Bool)

(declare-fun res!271795 () Bool)

(declare-fun e!266391 () Bool)

(assert (=> b!455722 (=> (not res!271795) (not e!266391))))

(declare-fun lt!206392 () array!28265)

(assert (=> b!455722 (= res!271795 (arrayNoDuplicates!0 lt!206392 #b00000000000000000000000000000000 Nil!8181))))

(declare-fun b!455723 () Bool)

(declare-fun res!271793 () Bool)

(assert (=> b!455723 (=> (not res!271793) (not e!266391))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455723 (= res!271793 (bvsle from!863 i!563))))

(declare-fun b!455724 () Bool)

(declare-fun res!271788 () Bool)

(assert (=> b!455724 (=> (not res!271788) (not e!266393))))

(assert (=> b!455724 (= res!271788 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13928 _keys!709))))))

(declare-fun b!455725 () Bool)

(declare-fun e!266394 () Bool)

(declare-fun tp_is_empty!12231 () Bool)

(assert (=> b!455725 (= e!266394 tp_is_empty!12231)))

(declare-fun b!455726 () Bool)

(assert (=> b!455726 (= e!266391 false)))

(declare-fun minValue!515 () V!17413)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17413)

(declare-datatypes ((tuple2!8116 0))(
  ( (tuple2!8117 (_1!4069 (_ BitVec 64)) (_2!4069 V!17413)) )
))
(declare-datatypes ((List!8185 0))(
  ( (Nil!8182) (Cons!8181 (h!9037 tuple2!8116) (t!14013 List!8185)) )
))
(declare-datatypes ((ListLongMap!7029 0))(
  ( (ListLongMap!7030 (toList!3530 List!8185)) )
))
(declare-fun lt!206391 () ListLongMap!7029)

(declare-fun v!412 () V!17413)

(declare-fun getCurrentListMapNoExtraKeys!1713 (array!28265 array!28267 (_ BitVec 32) (_ BitVec 32) V!17413 V!17413 (_ BitVec 32) Int) ListLongMap!7029)

(assert (=> b!455726 (= lt!206391 (getCurrentListMapNoExtraKeys!1713 lt!206392 (array!28268 (store (arr!13577 _values!549) i!563 (ValueCellFull!5772 v!412)) (size!13929 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206393 () ListLongMap!7029)

(assert (=> b!455726 (= lt!206393 (getCurrentListMapNoExtraKeys!1713 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455727 () Bool)

(declare-fun e!266395 () Bool)

(assert (=> b!455727 (= e!266395 (and e!266394 mapRes!19987))))

(declare-fun condMapEmpty!19987 () Bool)

(declare-fun mapDefault!19987 () ValueCell!5772)

(assert (=> b!455727 (= condMapEmpty!19987 (= (arr!13577 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5772)) mapDefault!19987)))))

(declare-fun b!455728 () Bool)

(declare-fun res!271797 () Bool)

(assert (=> b!455728 (=> (not res!271797) (not e!266393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28265 (_ BitVec 32)) Bool)

(assert (=> b!455728 (= res!271797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455729 () Bool)

(assert (=> b!455729 (= e!266392 tp_is_empty!12231)))

(declare-fun b!455730 () Bool)

(declare-fun res!271796 () Bool)

(assert (=> b!455730 (=> (not res!271796) (not e!266393))))

(declare-fun arrayContainsKey!0 (array!28265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455730 (= res!271796 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455731 () Bool)

(assert (=> b!455731 (= e!266393 e!266391)))

(declare-fun res!271790 () Bool)

(assert (=> b!455731 (=> (not res!271790) (not e!266391))))

(assert (=> b!455731 (= res!271790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206392 mask!1025))))

(assert (=> b!455731 (= lt!206392 (array!28266 (store (arr!13576 _keys!709) i!563 k0!794) (size!13928 _keys!709)))))

(declare-fun mapIsEmpty!19987 () Bool)

(assert (=> mapIsEmpty!19987 mapRes!19987))

(declare-fun b!455721 () Bool)

(declare-fun res!271792 () Bool)

(assert (=> b!455721 (=> (not res!271792) (not e!266393))))

(assert (=> b!455721 (= res!271792 (or (= (select (arr!13576 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13576 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!271799 () Bool)

(assert (=> start!40958 (=> (not res!271799) (not e!266393))))

(assert (=> start!40958 (= res!271799 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13928 _keys!709))))))

(assert (=> start!40958 e!266393))

(assert (=> start!40958 tp_is_empty!12231))

(assert (=> start!40958 tp!38506))

(assert (=> start!40958 true))

(declare-fun array_inv!9838 (array!28267) Bool)

(assert (=> start!40958 (and (array_inv!9838 _values!549) e!266395)))

(declare-fun array_inv!9839 (array!28265) Bool)

(assert (=> start!40958 (array_inv!9839 _keys!709)))

(assert (= (and start!40958 res!271799) b!455718))

(assert (= (and b!455718 res!271789) b!455719))

(assert (= (and b!455719 res!271794) b!455728))

(assert (= (and b!455728 res!271797) b!455717))

(assert (= (and b!455717 res!271798) b!455724))

(assert (= (and b!455724 res!271788) b!455720))

(assert (= (and b!455720 res!271791) b!455721))

(assert (= (and b!455721 res!271792) b!455730))

(assert (= (and b!455730 res!271796) b!455731))

(assert (= (and b!455731 res!271790) b!455722))

(assert (= (and b!455722 res!271795) b!455723))

(assert (= (and b!455723 res!271793) b!455726))

(assert (= (and b!455727 condMapEmpty!19987) mapIsEmpty!19987))

(assert (= (and b!455727 (not condMapEmpty!19987)) mapNonEmpty!19987))

(get-info :version)

(assert (= (and mapNonEmpty!19987 ((_ is ValueCellFull!5772) mapValue!19987)) b!455729))

(assert (= (and b!455727 ((_ is ValueCellFull!5772) mapDefault!19987)) b!455725))

(assert (= start!40958 b!455727))

(declare-fun m!439411 () Bool)

(assert (=> b!455731 m!439411))

(declare-fun m!439413 () Bool)

(assert (=> b!455731 m!439413))

(declare-fun m!439415 () Bool)

(assert (=> mapNonEmpty!19987 m!439415))

(declare-fun m!439417 () Bool)

(assert (=> b!455730 m!439417))

(declare-fun m!439419 () Bool)

(assert (=> b!455726 m!439419))

(declare-fun m!439421 () Bool)

(assert (=> b!455726 m!439421))

(declare-fun m!439423 () Bool)

(assert (=> b!455726 m!439423))

(declare-fun m!439425 () Bool)

(assert (=> b!455722 m!439425))

(declare-fun m!439427 () Bool)

(assert (=> b!455721 m!439427))

(declare-fun m!439429 () Bool)

(assert (=> b!455718 m!439429))

(declare-fun m!439431 () Bool)

(assert (=> start!40958 m!439431))

(declare-fun m!439433 () Bool)

(assert (=> start!40958 m!439433))

(declare-fun m!439435 () Bool)

(assert (=> b!455720 m!439435))

(declare-fun m!439437 () Bool)

(assert (=> b!455728 m!439437))

(declare-fun m!439439 () Bool)

(assert (=> b!455717 m!439439))

(check-sat (not b!455718) (not start!40958) (not b!455720) (not b!455722) tp_is_empty!12231 (not mapNonEmpty!19987) (not b!455728) b_and!19035 (not b!455726) (not b!455731) (not b!455730) (not b_next!10893) (not b!455717))
(check-sat b_and!19035 (not b_next!10893))
