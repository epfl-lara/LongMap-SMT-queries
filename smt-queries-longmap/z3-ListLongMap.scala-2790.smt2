; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40630 () Bool)

(assert start!40630)

(declare-fun b_free!10641 () Bool)

(declare-fun b_next!10641 () Bool)

(assert (=> start!40630 (= b_free!10641 (not b_next!10641))))

(declare-fun tp!37742 () Bool)

(declare-fun b_and!18649 () Bool)

(assert (=> start!40630 (= tp!37742 b_and!18649)))

(declare-fun b!448592 () Bool)

(declare-fun e!263189 () Bool)

(declare-fun e!263190 () Bool)

(declare-fun mapRes!19602 () Bool)

(assert (=> b!448592 (= e!263189 (and e!263190 mapRes!19602))))

(declare-fun condMapEmpty!19602 () Bool)

(declare-datatypes ((V!17077 0))(
  ( (V!17078 (val!6034 Int)) )
))
(declare-datatypes ((ValueCell!5646 0))(
  ( (ValueCellFull!5646 (v!8289 V!17077)) (EmptyCell!5646) )
))
(declare-datatypes ((array!27765 0))(
  ( (array!27766 (arr!13328 (Array (_ BitVec 32) ValueCell!5646)) (size!13680 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27765)

(declare-fun mapDefault!19602 () ValueCell!5646)

(assert (=> b!448592 (= condMapEmpty!19602 (= (arr!13328 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5646)) mapDefault!19602)))))

(declare-fun b!448593 () Bool)

(declare-fun res!266667 () Bool)

(declare-fun e!263191 () Bool)

(assert (=> b!448593 (=> (not res!266667) (not e!263191))))

(declare-datatypes ((array!27767 0))(
  ( (array!27768 (arr!13329 (Array (_ BitVec 32) (_ BitVec 64))) (size!13681 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27767)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27767 (_ BitVec 32)) Bool)

(assert (=> b!448593 (= res!266667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448594 () Bool)

(declare-fun res!266661 () Bool)

(assert (=> b!448594 (=> (not res!266661) (not e!263191))))

(declare-datatypes ((List!7982 0))(
  ( (Nil!7979) (Cons!7978 (h!8834 (_ BitVec 64)) (t!13744 List!7982)) )
))
(declare-fun arrayNoDuplicates!0 (array!27767 (_ BitVec 32) List!7982) Bool)

(assert (=> b!448594 (= res!266661 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7979))))

(declare-fun b!448595 () Bool)

(declare-fun res!266659 () Bool)

(declare-fun e!263187 () Bool)

(assert (=> b!448595 (=> (not res!266659) (not e!263187))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448595 (= res!266659 (bvsle from!863 i!563))))

(declare-fun res!266658 () Bool)

(assert (=> start!40630 (=> (not res!266658) (not e!263191))))

(assert (=> start!40630 (= res!266658 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13681 _keys!709))))))

(assert (=> start!40630 e!263191))

(declare-fun tp_is_empty!11979 () Bool)

(assert (=> start!40630 tp_is_empty!11979))

(assert (=> start!40630 tp!37742))

(assert (=> start!40630 true))

(declare-fun array_inv!9658 (array!27765) Bool)

(assert (=> start!40630 (and (array_inv!9658 _values!549) e!263189)))

(declare-fun array_inv!9659 (array!27767) Bool)

(assert (=> start!40630 (array_inv!9659 _keys!709)))

(declare-fun b!448596 () Bool)

(declare-fun res!266663 () Bool)

(assert (=> b!448596 (=> (not res!266663) (not e!263191))))

(assert (=> b!448596 (= res!266663 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13681 _keys!709))))))

(declare-fun b!448597 () Bool)

(assert (=> b!448597 (= e!263190 tp_is_empty!11979)))

(declare-fun b!448598 () Bool)

(declare-fun res!266657 () Bool)

(assert (=> b!448598 (=> (not res!266657) (not e!263191))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448598 (= res!266657 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448599 () Bool)

(declare-fun res!266664 () Bool)

(assert (=> b!448599 (=> (not res!266664) (not e!263191))))

(assert (=> b!448599 (= res!266664 (or (= (select (arr!13329 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13329 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448600 () Bool)

(assert (=> b!448600 (= e!263191 e!263187)))

(declare-fun res!266662 () Bool)

(assert (=> b!448600 (=> (not res!266662) (not e!263187))))

(declare-fun lt!204196 () array!27767)

(assert (=> b!448600 (= res!266662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204196 mask!1025))))

(assert (=> b!448600 (= lt!204196 (array!27768 (store (arr!13329 _keys!709) i!563 k0!794) (size!13681 _keys!709)))))

(declare-fun b!448601 () Bool)

(declare-fun e!263188 () Bool)

(assert (=> b!448601 (= e!263188 tp_is_empty!11979)))

(declare-fun b!448602 () Bool)

(declare-fun res!266665 () Bool)

(assert (=> b!448602 (=> (not res!266665) (not e!263191))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!448602 (= res!266665 (and (= (size!13680 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13681 _keys!709) (size!13680 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19602 () Bool)

(assert (=> mapIsEmpty!19602 mapRes!19602))

(declare-fun b!448603 () Bool)

(declare-fun res!266666 () Bool)

(assert (=> b!448603 (=> (not res!266666) (not e!263191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448603 (= res!266666 (validKeyInArray!0 k0!794))))

(declare-fun b!448604 () Bool)

(declare-fun res!266660 () Bool)

(assert (=> b!448604 (=> (not res!266660) (not e!263187))))

(assert (=> b!448604 (= res!266660 (arrayNoDuplicates!0 lt!204196 #b00000000000000000000000000000000 Nil!7979))))

(declare-fun b!448605 () Bool)

(declare-fun res!266656 () Bool)

(assert (=> b!448605 (=> (not res!266656) (not e!263191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448605 (= res!266656 (validMask!0 mask!1025))))

(declare-fun b!448606 () Bool)

(assert (=> b!448606 (= e!263187 false)))

(declare-fun minValue!515 () V!17077)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17077)

(declare-datatypes ((tuple2!7918 0))(
  ( (tuple2!7919 (_1!3970 (_ BitVec 64)) (_2!3970 V!17077)) )
))
(declare-datatypes ((List!7983 0))(
  ( (Nil!7980) (Cons!7979 (h!8835 tuple2!7918) (t!13745 List!7983)) )
))
(declare-datatypes ((ListLongMap!6831 0))(
  ( (ListLongMap!6832 (toList!3431 List!7983)) )
))
(declare-fun lt!204198 () ListLongMap!6831)

(declare-fun v!412 () V!17077)

(declare-fun getCurrentListMapNoExtraKeys!1617 (array!27767 array!27765 (_ BitVec 32) (_ BitVec 32) V!17077 V!17077 (_ BitVec 32) Int) ListLongMap!6831)

(assert (=> b!448606 (= lt!204198 (getCurrentListMapNoExtraKeys!1617 lt!204196 (array!27766 (store (arr!13328 _values!549) i!563 (ValueCellFull!5646 v!412)) (size!13680 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204197 () ListLongMap!6831)

(assert (=> b!448606 (= lt!204197 (getCurrentListMapNoExtraKeys!1617 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19602 () Bool)

(declare-fun tp!37743 () Bool)

(assert (=> mapNonEmpty!19602 (= mapRes!19602 (and tp!37743 e!263188))))

(declare-fun mapRest!19602 () (Array (_ BitVec 32) ValueCell!5646))

(declare-fun mapKey!19602 () (_ BitVec 32))

(declare-fun mapValue!19602 () ValueCell!5646)

(assert (=> mapNonEmpty!19602 (= (arr!13328 _values!549) (store mapRest!19602 mapKey!19602 mapValue!19602))))

(assert (= (and start!40630 res!266658) b!448605))

(assert (= (and b!448605 res!266656) b!448602))

(assert (= (and b!448602 res!266665) b!448593))

(assert (= (and b!448593 res!266667) b!448594))

(assert (= (and b!448594 res!266661) b!448596))

(assert (= (and b!448596 res!266663) b!448603))

(assert (= (and b!448603 res!266666) b!448599))

(assert (= (and b!448599 res!266664) b!448598))

(assert (= (and b!448598 res!266657) b!448600))

(assert (= (and b!448600 res!266662) b!448604))

(assert (= (and b!448604 res!266660) b!448595))

(assert (= (and b!448595 res!266659) b!448606))

(assert (= (and b!448592 condMapEmpty!19602) mapIsEmpty!19602))

(assert (= (and b!448592 (not condMapEmpty!19602)) mapNonEmpty!19602))

(get-info :version)

(assert (= (and mapNonEmpty!19602 ((_ is ValueCellFull!5646) mapValue!19602)) b!448601))

(assert (= (and b!448592 ((_ is ValueCellFull!5646) mapDefault!19602)) b!448597))

(assert (= start!40630 b!448592))

(declare-fun m!433093 () Bool)

(assert (=> b!448605 m!433093))

(declare-fun m!433095 () Bool)

(assert (=> b!448600 m!433095))

(declare-fun m!433097 () Bool)

(assert (=> b!448600 m!433097))

(declare-fun m!433099 () Bool)

(assert (=> b!448603 m!433099))

(declare-fun m!433101 () Bool)

(assert (=> b!448606 m!433101))

(declare-fun m!433103 () Bool)

(assert (=> b!448606 m!433103))

(declare-fun m!433105 () Bool)

(assert (=> b!448606 m!433105))

(declare-fun m!433107 () Bool)

(assert (=> mapNonEmpty!19602 m!433107))

(declare-fun m!433109 () Bool)

(assert (=> b!448594 m!433109))

(declare-fun m!433111 () Bool)

(assert (=> b!448593 m!433111))

(declare-fun m!433113 () Bool)

(assert (=> b!448598 m!433113))

(declare-fun m!433115 () Bool)

(assert (=> start!40630 m!433115))

(declare-fun m!433117 () Bool)

(assert (=> start!40630 m!433117))

(declare-fun m!433119 () Bool)

(assert (=> b!448604 m!433119))

(declare-fun m!433121 () Bool)

(assert (=> b!448599 m!433121))

(check-sat (not b!448598) (not b_next!10641) b_and!18649 (not mapNonEmpty!19602) (not b!448600) (not b!448604) (not b!448594) (not b!448603) (not b!448606) (not start!40630) tp_is_empty!11979 (not b!448593) (not b!448605))
(check-sat b_and!18649 (not b_next!10641))
