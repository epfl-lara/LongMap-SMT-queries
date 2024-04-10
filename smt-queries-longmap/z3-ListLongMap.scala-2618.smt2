; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39528 () Bool)

(assert start!39528)

(declare-fun b_free!9795 () Bool)

(declare-fun b_next!9795 () Bool)

(assert (=> start!39528 (= b_free!9795 (not b_next!9795))))

(declare-fun tp!34913 () Bool)

(declare-fun b_and!17451 () Bool)

(assert (=> start!39528 (= tp!34913 b_and!17451)))

(declare-fun b!422634 () Bool)

(declare-fun res!246841 () Bool)

(declare-fun e!251417 () Bool)

(assert (=> b!422634 (=> (not res!246841) (not e!251417))))

(declare-datatypes ((array!25741 0))(
  ( (array!25742 (arr!12320 (Array (_ BitVec 32) (_ BitVec 64))) (size!12672 (_ BitVec 32))) )
))
(declare-fun lt!194007 () array!25741)

(declare-datatypes ((List!7254 0))(
  ( (Nil!7251) (Cons!7250 (h!8106 (_ BitVec 64)) (t!12698 List!7254)) )
))
(declare-fun arrayNoDuplicates!0 (array!25741 (_ BitVec 32) List!7254) Bool)

(assert (=> b!422634 (= res!246841 (arrayNoDuplicates!0 lt!194007 #b00000000000000000000000000000000 Nil!7251))))

(declare-fun b!422635 () Bool)

(declare-fun res!246842 () Bool)

(declare-fun e!251413 () Bool)

(assert (=> b!422635 (=> (not res!246842) (not e!251413))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422635 (= res!246842 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18042 () Bool)

(declare-fun mapRes!18042 () Bool)

(assert (=> mapIsEmpty!18042 mapRes!18042))

(declare-fun res!246834 () Bool)

(assert (=> start!39528 (=> (not res!246834) (not e!251413))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!25741)

(assert (=> start!39528 (= res!246834 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12672 _keys!709))))))

(assert (=> start!39528 e!251413))

(declare-fun tp_is_empty!10947 () Bool)

(assert (=> start!39528 tp_is_empty!10947))

(assert (=> start!39528 tp!34913))

(assert (=> start!39528 true))

(declare-datatypes ((V!15701 0))(
  ( (V!15702 (val!5518 Int)) )
))
(declare-datatypes ((ValueCell!5130 0))(
  ( (ValueCellFull!5130 (v!7765 V!15701)) (EmptyCell!5130) )
))
(declare-datatypes ((array!25743 0))(
  ( (array!25744 (arr!12321 (Array (_ BitVec 32) ValueCell!5130)) (size!12673 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25743)

(declare-fun e!251416 () Bool)

(declare-fun array_inv!8976 (array!25743) Bool)

(assert (=> start!39528 (and (array_inv!8976 _values!549) e!251416)))

(declare-fun array_inv!8977 (array!25741) Bool)

(assert (=> start!39528 (array_inv!8977 _keys!709)))

(declare-fun b!422636 () Bool)

(declare-fun e!251418 () Bool)

(assert (=> b!422636 (= e!251418 tp_is_empty!10947)))

(declare-fun b!422637 () Bool)

(declare-fun e!251414 () Bool)

(assert (=> b!422637 (= e!251416 (and e!251414 mapRes!18042))))

(declare-fun condMapEmpty!18042 () Bool)

(declare-fun mapDefault!18042 () ValueCell!5130)

(assert (=> b!422637 (= condMapEmpty!18042 (= (arr!12321 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5130)) mapDefault!18042)))))

(declare-fun b!422638 () Bool)

(declare-fun res!246840 () Bool)

(assert (=> b!422638 (=> (not res!246840) (not e!251417))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422638 (= res!246840 (bvsle from!863 i!563))))

(declare-fun b!422639 () Bool)

(declare-fun res!246843 () Bool)

(assert (=> b!422639 (=> (not res!246843) (not e!251413))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422639 (= res!246843 (validKeyInArray!0 k0!794))))

(declare-fun b!422640 () Bool)

(declare-fun res!246836 () Bool)

(assert (=> b!422640 (=> (not res!246836) (not e!251413))))

(assert (=> b!422640 (= res!246836 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12672 _keys!709))))))

(declare-fun mapNonEmpty!18042 () Bool)

(declare-fun tp!34914 () Bool)

(assert (=> mapNonEmpty!18042 (= mapRes!18042 (and tp!34914 e!251418))))

(declare-fun mapRest!18042 () (Array (_ BitVec 32) ValueCell!5130))

(declare-fun mapKey!18042 () (_ BitVec 32))

(declare-fun mapValue!18042 () ValueCell!5130)

(assert (=> mapNonEmpty!18042 (= (arr!12321 _values!549) (store mapRest!18042 mapKey!18042 mapValue!18042))))

(declare-fun b!422641 () Bool)

(declare-fun res!246835 () Bool)

(assert (=> b!422641 (=> (not res!246835) (not e!251413))))

(declare-fun arrayContainsKey!0 (array!25741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422641 (= res!246835 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422642 () Bool)

(declare-fun res!246838 () Bool)

(assert (=> b!422642 (=> (not res!246838) (not e!251413))))

(assert (=> b!422642 (= res!246838 (or (= (select (arr!12320 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12320 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422643 () Bool)

(assert (=> b!422643 (= e!251417 false)))

(declare-fun minValue!515 () V!15701)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun v!412 () V!15701)

(declare-datatypes ((tuple2!7248 0))(
  ( (tuple2!7249 (_1!3635 (_ BitVec 64)) (_2!3635 V!15701)) )
))
(declare-datatypes ((List!7255 0))(
  ( (Nil!7252) (Cons!7251 (h!8107 tuple2!7248) (t!12699 List!7255)) )
))
(declare-datatypes ((ListLongMap!6161 0))(
  ( (ListLongMap!6162 (toList!3096 List!7255)) )
))
(declare-fun lt!194009 () ListLongMap!6161)

(declare-fun zeroValue!515 () V!15701)

(declare-fun getCurrentListMapNoExtraKeys!1300 (array!25741 array!25743 (_ BitVec 32) (_ BitVec 32) V!15701 V!15701 (_ BitVec 32) Int) ListLongMap!6161)

(assert (=> b!422643 (= lt!194009 (getCurrentListMapNoExtraKeys!1300 lt!194007 (array!25744 (store (arr!12321 _values!549) i!563 (ValueCellFull!5130 v!412)) (size!12673 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194008 () ListLongMap!6161)

(assert (=> b!422643 (= lt!194008 (getCurrentListMapNoExtraKeys!1300 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422644 () Bool)

(declare-fun res!246839 () Bool)

(assert (=> b!422644 (=> (not res!246839) (not e!251413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25741 (_ BitVec 32)) Bool)

(assert (=> b!422644 (= res!246839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422645 () Bool)

(assert (=> b!422645 (= e!251414 tp_is_empty!10947)))

(declare-fun b!422646 () Bool)

(assert (=> b!422646 (= e!251413 e!251417)))

(declare-fun res!246837 () Bool)

(assert (=> b!422646 (=> (not res!246837) (not e!251417))))

(assert (=> b!422646 (= res!246837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194007 mask!1025))))

(assert (=> b!422646 (= lt!194007 (array!25742 (store (arr!12320 _keys!709) i!563 k0!794) (size!12672 _keys!709)))))

(declare-fun b!422647 () Bool)

(declare-fun res!246832 () Bool)

(assert (=> b!422647 (=> (not res!246832) (not e!251413))))

(assert (=> b!422647 (= res!246832 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7251))))

(declare-fun b!422648 () Bool)

(declare-fun res!246833 () Bool)

(assert (=> b!422648 (=> (not res!246833) (not e!251413))))

(assert (=> b!422648 (= res!246833 (and (= (size!12673 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12672 _keys!709) (size!12673 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39528 res!246834) b!422635))

(assert (= (and b!422635 res!246842) b!422648))

(assert (= (and b!422648 res!246833) b!422644))

(assert (= (and b!422644 res!246839) b!422647))

(assert (= (and b!422647 res!246832) b!422640))

(assert (= (and b!422640 res!246836) b!422639))

(assert (= (and b!422639 res!246843) b!422642))

(assert (= (and b!422642 res!246838) b!422641))

(assert (= (and b!422641 res!246835) b!422646))

(assert (= (and b!422646 res!246837) b!422634))

(assert (= (and b!422634 res!246841) b!422638))

(assert (= (and b!422638 res!246840) b!422643))

(assert (= (and b!422637 condMapEmpty!18042) mapIsEmpty!18042))

(assert (= (and b!422637 (not condMapEmpty!18042)) mapNonEmpty!18042))

(get-info :version)

(assert (= (and mapNonEmpty!18042 ((_ is ValueCellFull!5130) mapValue!18042)) b!422636))

(assert (= (and b!422637 ((_ is ValueCellFull!5130) mapDefault!18042)) b!422645))

(assert (= start!39528 b!422637))

(declare-fun m!412383 () Bool)

(assert (=> b!422634 m!412383))

(declare-fun m!412385 () Bool)

(assert (=> b!422639 m!412385))

(declare-fun m!412387 () Bool)

(assert (=> b!422646 m!412387))

(declare-fun m!412389 () Bool)

(assert (=> b!422646 m!412389))

(declare-fun m!412391 () Bool)

(assert (=> mapNonEmpty!18042 m!412391))

(declare-fun m!412393 () Bool)

(assert (=> b!422635 m!412393))

(declare-fun m!412395 () Bool)

(assert (=> b!422642 m!412395))

(declare-fun m!412397 () Bool)

(assert (=> b!422641 m!412397))

(declare-fun m!412399 () Bool)

(assert (=> b!422644 m!412399))

(declare-fun m!412401 () Bool)

(assert (=> start!39528 m!412401))

(declare-fun m!412403 () Bool)

(assert (=> start!39528 m!412403))

(declare-fun m!412405 () Bool)

(assert (=> b!422647 m!412405))

(declare-fun m!412407 () Bool)

(assert (=> b!422643 m!412407))

(declare-fun m!412409 () Bool)

(assert (=> b!422643 m!412409))

(declare-fun m!412411 () Bool)

(assert (=> b!422643 m!412411))

(check-sat (not b!422635) (not b!422639) b_and!17451 (not b!422647) tp_is_empty!10947 (not start!39528) (not b_next!9795) (not mapNonEmpty!18042) (not b!422644) (not b!422646) (not b!422634) (not b!422643) (not b!422641))
(check-sat b_and!17451 (not b_next!9795))
