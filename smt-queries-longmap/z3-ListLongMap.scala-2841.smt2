; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40996 () Bool)

(assert start!40996)

(declare-fun b_free!10945 () Bool)

(declare-fun b_next!10945 () Bool)

(assert (=> start!40996 (= b_free!10945 (not b_next!10945))))

(declare-fun tp!38662 () Bool)

(declare-fun b_and!19061 () Bool)

(assert (=> start!40996 (= tp!38662 b_and!19061)))

(declare-fun b!456674 () Bool)

(declare-fun e!266743 () Bool)

(declare-fun tp_is_empty!12283 () Bool)

(assert (=> b!456674 (= e!266743 tp_is_empty!12283)))

(declare-fun b!456675 () Bool)

(declare-fun e!266747 () Bool)

(declare-fun e!266744 () Bool)

(assert (=> b!456675 (= e!266747 (not e!266744))))

(declare-fun res!272653 () Bool)

(assert (=> b!456675 (=> res!272653 e!266744)))

(declare-datatypes ((array!28357 0))(
  ( (array!28358 (arr!13622 (Array (_ BitVec 32) (_ BitVec 64))) (size!13975 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28357)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456675 (= res!272653 (not (validKeyInArray!0 (select (arr!13622 _keys!709) from!863))))))

(declare-datatypes ((V!17483 0))(
  ( (V!17484 (val!6186 Int)) )
))
(declare-fun minValue!515 () V!17483)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17483)

(declare-datatypes ((ValueCell!5798 0))(
  ( (ValueCellFull!5798 (v!8446 V!17483)) (EmptyCell!5798) )
))
(declare-datatypes ((array!28359 0))(
  ( (array!28360 (arr!13623 (Array (_ BitVec 32) ValueCell!5798)) (size!13976 (_ BitVec 32))) )
))
(declare-fun lt!206470 () array!28359)

(declare-fun v!412 () V!17483)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!206469 () array!28357)

(declare-fun _values!549 () array!28359)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!8168 0))(
  ( (tuple2!8169 (_1!4095 (_ BitVec 64)) (_2!4095 V!17483)) )
))
(declare-datatypes ((List!8232 0))(
  ( (Nil!8229) (Cons!8228 (h!9084 tuple2!8168) (t!14051 List!8232)) )
))
(declare-datatypes ((ListLongMap!7071 0))(
  ( (ListLongMap!7072 (toList!3551 List!8232)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1746 (array!28357 array!28359 (_ BitVec 32) (_ BitVec 32) V!17483 V!17483 (_ BitVec 32) Int) ListLongMap!7071)

(declare-fun +!1605 (ListLongMap!7071 tuple2!8168) ListLongMap!7071)

(assert (=> b!456675 (= (getCurrentListMapNoExtraKeys!1746 lt!206469 lt!206470 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1605 (getCurrentListMapNoExtraKeys!1746 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8169 k0!794 v!412)))))

(declare-datatypes ((Unit!13259 0))(
  ( (Unit!13260) )
))
(declare-fun lt!206467 () Unit!13259)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!742 (array!28357 array!28359 (_ BitVec 32) (_ BitVec 32) V!17483 V!17483 (_ BitVec 32) (_ BitVec 64) V!17483 (_ BitVec 32) Int) Unit!13259)

(assert (=> b!456675 (= lt!206467 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!742 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456676 () Bool)

(declare-fun res!272658 () Bool)

(declare-fun e!266746 () Bool)

(assert (=> b!456676 (=> (not res!272658) (not e!266746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456676 (= res!272658 (validMask!0 mask!1025))))

(declare-fun b!456677 () Bool)

(declare-fun res!272660 () Bool)

(assert (=> b!456677 (=> (not res!272660) (not e!266746))))

(declare-fun arrayContainsKey!0 (array!28357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456677 (= res!272660 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456678 () Bool)

(assert (=> b!456678 (= e!266744 (bvslt from!863 (size!13976 _values!549)))))

(declare-fun mapNonEmpty!20065 () Bool)

(declare-fun mapRes!20065 () Bool)

(declare-fun tp!38661 () Bool)

(assert (=> mapNonEmpty!20065 (= mapRes!20065 (and tp!38661 e!266743))))

(declare-fun mapKey!20065 () (_ BitVec 32))

(declare-fun mapValue!20065 () ValueCell!5798)

(declare-fun mapRest!20065 () (Array (_ BitVec 32) ValueCell!5798))

(assert (=> mapNonEmpty!20065 (= (arr!13623 _values!549) (store mapRest!20065 mapKey!20065 mapValue!20065))))

(declare-fun b!456679 () Bool)

(declare-fun res!272666 () Bool)

(assert (=> b!456679 (=> (not res!272666) (not e!266746))))

(declare-datatypes ((List!8233 0))(
  ( (Nil!8230) (Cons!8229 (h!9085 (_ BitVec 64)) (t!14052 List!8233)) )
))
(declare-fun arrayNoDuplicates!0 (array!28357 (_ BitVec 32) List!8233) Bool)

(assert (=> b!456679 (= res!272666 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8230))))

(declare-fun b!456680 () Bool)

(declare-fun e!266742 () Bool)

(assert (=> b!456680 (= e!266746 e!266742)))

(declare-fun res!272662 () Bool)

(assert (=> b!456680 (=> (not res!272662) (not e!266742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28357 (_ BitVec 32)) Bool)

(assert (=> b!456680 (= res!272662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206469 mask!1025))))

(assert (=> b!456680 (= lt!206469 (array!28358 (store (arr!13622 _keys!709) i!563 k0!794) (size!13975 _keys!709)))))

(declare-fun mapIsEmpty!20065 () Bool)

(assert (=> mapIsEmpty!20065 mapRes!20065))

(declare-fun b!456681 () Bool)

(declare-fun res!272661 () Bool)

(assert (=> b!456681 (=> (not res!272661) (not e!266746))))

(assert (=> b!456681 (= res!272661 (and (= (size!13976 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13975 _keys!709) (size!13976 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456682 () Bool)

(declare-fun res!272663 () Bool)

(assert (=> b!456682 (=> (not res!272663) (not e!266742))))

(assert (=> b!456682 (= res!272663 (arrayNoDuplicates!0 lt!206469 #b00000000000000000000000000000000 Nil!8230))))

(declare-fun b!456683 () Bool)

(declare-fun res!272654 () Bool)

(assert (=> b!456683 (=> (not res!272654) (not e!266746))))

(assert (=> b!456683 (= res!272654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456684 () Bool)

(declare-fun res!272656 () Bool)

(assert (=> b!456684 (=> (not res!272656) (not e!266746))))

(assert (=> b!456684 (= res!272656 (validKeyInArray!0 k0!794))))

(declare-fun res!272659 () Bool)

(assert (=> start!40996 (=> (not res!272659) (not e!266746))))

(assert (=> start!40996 (= res!272659 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13975 _keys!709))))))

(assert (=> start!40996 e!266746))

(assert (=> start!40996 tp_is_empty!12283))

(assert (=> start!40996 tp!38662))

(assert (=> start!40996 true))

(declare-fun e!266748 () Bool)

(declare-fun array_inv!9924 (array!28359) Bool)

(assert (=> start!40996 (and (array_inv!9924 _values!549) e!266748)))

(declare-fun array_inv!9925 (array!28357) Bool)

(assert (=> start!40996 (array_inv!9925 _keys!709)))

(declare-fun b!456685 () Bool)

(assert (=> b!456685 (= e!266742 e!266747)))

(declare-fun res!272655 () Bool)

(assert (=> b!456685 (=> (not res!272655) (not e!266747))))

(assert (=> b!456685 (= res!272655 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206471 () ListLongMap!7071)

(assert (=> b!456685 (= lt!206471 (getCurrentListMapNoExtraKeys!1746 lt!206469 lt!206470 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456685 (= lt!206470 (array!28360 (store (arr!13623 _values!549) i!563 (ValueCellFull!5798 v!412)) (size!13976 _values!549)))))

(declare-fun lt!206468 () ListLongMap!7071)

(assert (=> b!456685 (= lt!206468 (getCurrentListMapNoExtraKeys!1746 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456686 () Bool)

(declare-fun e!266749 () Bool)

(assert (=> b!456686 (= e!266749 tp_is_empty!12283)))

(declare-fun b!456687 () Bool)

(assert (=> b!456687 (= e!266748 (and e!266749 mapRes!20065))))

(declare-fun condMapEmpty!20065 () Bool)

(declare-fun mapDefault!20065 () ValueCell!5798)

(assert (=> b!456687 (= condMapEmpty!20065 (= (arr!13623 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5798)) mapDefault!20065)))))

(declare-fun b!456688 () Bool)

(declare-fun res!272665 () Bool)

(assert (=> b!456688 (=> (not res!272665) (not e!266742))))

(assert (=> b!456688 (= res!272665 (bvsle from!863 i!563))))

(declare-fun b!456689 () Bool)

(declare-fun res!272657 () Bool)

(assert (=> b!456689 (=> (not res!272657) (not e!266746))))

(assert (=> b!456689 (= res!272657 (or (= (select (arr!13622 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13622 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456690 () Bool)

(declare-fun res!272664 () Bool)

(assert (=> b!456690 (=> (not res!272664) (not e!266746))))

(assert (=> b!456690 (= res!272664 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13975 _keys!709))))))

(assert (= (and start!40996 res!272659) b!456676))

(assert (= (and b!456676 res!272658) b!456681))

(assert (= (and b!456681 res!272661) b!456683))

(assert (= (and b!456683 res!272654) b!456679))

(assert (= (and b!456679 res!272666) b!456690))

(assert (= (and b!456690 res!272664) b!456684))

(assert (= (and b!456684 res!272656) b!456689))

(assert (= (and b!456689 res!272657) b!456677))

(assert (= (and b!456677 res!272660) b!456680))

(assert (= (and b!456680 res!272662) b!456682))

(assert (= (and b!456682 res!272663) b!456688))

(assert (= (and b!456688 res!272665) b!456685))

(assert (= (and b!456685 res!272655) b!456675))

(assert (= (and b!456675 (not res!272653)) b!456678))

(assert (= (and b!456687 condMapEmpty!20065) mapIsEmpty!20065))

(assert (= (and b!456687 (not condMapEmpty!20065)) mapNonEmpty!20065))

(get-info :version)

(assert (= (and mapNonEmpty!20065 ((_ is ValueCellFull!5798) mapValue!20065)) b!456674))

(assert (= (and b!456687 ((_ is ValueCellFull!5798) mapDefault!20065)) b!456686))

(assert (= start!40996 b!456687))

(declare-fun m!439577 () Bool)

(assert (=> b!456680 m!439577))

(declare-fun m!439579 () Bool)

(assert (=> b!456680 m!439579))

(declare-fun m!439581 () Bool)

(assert (=> b!456684 m!439581))

(declare-fun m!439583 () Bool)

(assert (=> b!456675 m!439583))

(declare-fun m!439585 () Bool)

(assert (=> b!456675 m!439585))

(declare-fun m!439587 () Bool)

(assert (=> b!456675 m!439587))

(assert (=> b!456675 m!439587))

(declare-fun m!439589 () Bool)

(assert (=> b!456675 m!439589))

(assert (=> b!456675 m!439583))

(declare-fun m!439591 () Bool)

(assert (=> b!456675 m!439591))

(declare-fun m!439593 () Bool)

(assert (=> b!456675 m!439593))

(declare-fun m!439595 () Bool)

(assert (=> b!456679 m!439595))

(declare-fun m!439597 () Bool)

(assert (=> b!456689 m!439597))

(declare-fun m!439599 () Bool)

(assert (=> b!456677 m!439599))

(declare-fun m!439601 () Bool)

(assert (=> b!456683 m!439601))

(declare-fun m!439603 () Bool)

(assert (=> b!456685 m!439603))

(declare-fun m!439605 () Bool)

(assert (=> b!456685 m!439605))

(declare-fun m!439607 () Bool)

(assert (=> b!456685 m!439607))

(declare-fun m!439609 () Bool)

(assert (=> b!456676 m!439609))

(declare-fun m!439611 () Bool)

(assert (=> mapNonEmpty!20065 m!439611))

(declare-fun m!439613 () Bool)

(assert (=> b!456682 m!439613))

(declare-fun m!439615 () Bool)

(assert (=> start!40996 m!439615))

(declare-fun m!439617 () Bool)

(assert (=> start!40996 m!439617))

(check-sat (not b_next!10945) (not b!456677) (not start!40996) (not b!456680) (not b!456684) (not b!456676) (not mapNonEmpty!20065) (not b!456682) (not b!456685) tp_is_empty!12283 b_and!19061 (not b!456683) (not b!456675) (not b!456679))
(check-sat b_and!19061 (not b_next!10945))
