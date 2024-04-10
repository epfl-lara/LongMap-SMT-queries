; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40684 () Bool)

(assert start!40684)

(declare-fun b_free!10695 () Bool)

(declare-fun b_next!10695 () Bool)

(assert (=> start!40684 (= b_free!10695 (not b_next!10695))))

(declare-fun tp!37904 () Bool)

(declare-fun b_and!18703 () Bool)

(assert (=> start!40684 (= tp!37904 b_and!18703)))

(declare-fun b!449807 () Bool)

(declare-fun res!267634 () Bool)

(declare-fun e!263678 () Bool)

(assert (=> b!449807 (=> (not res!267634) (not e!263678))))

(declare-datatypes ((array!27873 0))(
  ( (array!27874 (arr!13382 (Array (_ BitVec 32) (_ BitVec 64))) (size!13734 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27873)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449807 (= res!267634 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449808 () Bool)

(declare-fun res!267632 () Bool)

(assert (=> b!449808 (=> (not res!267632) (not e!263678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449808 (= res!267632 (validKeyInArray!0 k0!794))))

(declare-fun b!449809 () Bool)

(declare-fun res!267636 () Bool)

(assert (=> b!449809 (=> (not res!267636) (not e!263678))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449809 (= res!267636 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13734 _keys!709))))))

(declare-fun b!449810 () Bool)

(declare-fun res!267628 () Bool)

(assert (=> b!449810 (=> (not res!267628) (not e!263678))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449810 (= res!267628 (validMask!0 mask!1025))))

(declare-fun b!449811 () Bool)

(declare-fun res!267635 () Bool)

(assert (=> b!449811 (=> (not res!267635) (not e!263678))))

(declare-datatypes ((List!8024 0))(
  ( (Nil!8021) (Cons!8020 (h!8876 (_ BitVec 64)) (t!13786 List!8024)) )
))
(declare-fun arrayNoDuplicates!0 (array!27873 (_ BitVec 32) List!8024) Bool)

(assert (=> b!449811 (= res!267635 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8021))))

(declare-fun b!449812 () Bool)

(declare-fun res!267630 () Bool)

(assert (=> b!449812 (=> (not res!267630) (not e!263678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27873 (_ BitVec 32)) Bool)

(assert (=> b!449812 (= res!267630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449813 () Bool)

(declare-fun e!263675 () Bool)

(declare-fun tp_is_empty!12033 () Bool)

(assert (=> b!449813 (= e!263675 tp_is_empty!12033)))

(declare-fun b!449814 () Bool)

(declare-fun res!267638 () Bool)

(assert (=> b!449814 (=> (not res!267638) (not e!263678))))

(assert (=> b!449814 (= res!267638 (or (= (select (arr!13382 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13382 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449815 () Bool)

(declare-fun e!263673 () Bool)

(declare-fun mapRes!19683 () Bool)

(assert (=> b!449815 (= e!263673 (and e!263675 mapRes!19683))))

(declare-fun condMapEmpty!19683 () Bool)

(declare-datatypes ((V!17149 0))(
  ( (V!17150 (val!6061 Int)) )
))
(declare-datatypes ((ValueCell!5673 0))(
  ( (ValueCellFull!5673 (v!8316 V!17149)) (EmptyCell!5673) )
))
(declare-datatypes ((array!27875 0))(
  ( (array!27876 (arr!13383 (Array (_ BitVec 32) ValueCell!5673)) (size!13735 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27875)

(declare-fun mapDefault!19683 () ValueCell!5673)

(assert (=> b!449815 (= condMapEmpty!19683 (= (arr!13383 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5673)) mapDefault!19683)))))

(declare-fun b!449816 () Bool)

(declare-fun res!267639 () Bool)

(declare-fun e!263677 () Bool)

(assert (=> b!449816 (=> (not res!267639) (not e!263677))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!449816 (= res!267639 (bvsle from!863 i!563))))

(declare-fun b!449817 () Bool)

(assert (=> b!449817 (= e!263677 (and (= from!863 i!563) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13734 _keys!709)) (bvsge (bvsub (size!13734 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13734 _keys!709) from!863))))))

(declare-fun lt!204439 () array!27873)

(declare-fun minValue!515 () V!17149)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17149)

(declare-fun v!412 () V!17149)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7956 0))(
  ( (tuple2!7957 (_1!3989 (_ BitVec 64)) (_2!3989 V!17149)) )
))
(declare-datatypes ((List!8025 0))(
  ( (Nil!8022) (Cons!8021 (h!8877 tuple2!7956) (t!13787 List!8025)) )
))
(declare-datatypes ((ListLongMap!6869 0))(
  ( (ListLongMap!6870 (toList!3450 List!8025)) )
))
(declare-fun lt!204441 () ListLongMap!6869)

(declare-fun getCurrentListMapNoExtraKeys!1636 (array!27873 array!27875 (_ BitVec 32) (_ BitVec 32) V!17149 V!17149 (_ BitVec 32) Int) ListLongMap!6869)

(assert (=> b!449817 (= lt!204441 (getCurrentListMapNoExtraKeys!1636 lt!204439 (array!27876 (store (arr!13383 _values!549) i!563 (ValueCellFull!5673 v!412)) (size!13735 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204440 () ListLongMap!6869)

(assert (=> b!449817 (= lt!204440 (getCurrentListMapNoExtraKeys!1636 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449818 () Bool)

(assert (=> b!449818 (= e!263678 e!263677)))

(declare-fun res!267631 () Bool)

(assert (=> b!449818 (=> (not res!267631) (not e!263677))))

(assert (=> b!449818 (= res!267631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204439 mask!1025))))

(assert (=> b!449818 (= lt!204439 (array!27874 (store (arr!13382 _keys!709) i!563 k0!794) (size!13734 _keys!709)))))

(declare-fun mapNonEmpty!19683 () Bool)

(declare-fun tp!37905 () Bool)

(declare-fun e!263676 () Bool)

(assert (=> mapNonEmpty!19683 (= mapRes!19683 (and tp!37905 e!263676))))

(declare-fun mapRest!19683 () (Array (_ BitVec 32) ValueCell!5673))

(declare-fun mapKey!19683 () (_ BitVec 32))

(declare-fun mapValue!19683 () ValueCell!5673)

(assert (=> mapNonEmpty!19683 (= (arr!13383 _values!549) (store mapRest!19683 mapKey!19683 mapValue!19683))))

(declare-fun res!267629 () Bool)

(assert (=> start!40684 (=> (not res!267629) (not e!263678))))

(assert (=> start!40684 (= res!267629 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13734 _keys!709))))))

(assert (=> start!40684 e!263678))

(assert (=> start!40684 tp_is_empty!12033))

(assert (=> start!40684 tp!37904))

(assert (=> start!40684 true))

(declare-fun array_inv!9694 (array!27875) Bool)

(assert (=> start!40684 (and (array_inv!9694 _values!549) e!263673)))

(declare-fun array_inv!9695 (array!27873) Bool)

(assert (=> start!40684 (array_inv!9695 _keys!709)))

(declare-fun mapIsEmpty!19683 () Bool)

(assert (=> mapIsEmpty!19683 mapRes!19683))

(declare-fun b!449819 () Bool)

(declare-fun res!267637 () Bool)

(assert (=> b!449819 (=> (not res!267637) (not e!263677))))

(assert (=> b!449819 (= res!267637 (arrayNoDuplicates!0 lt!204439 #b00000000000000000000000000000000 Nil!8021))))

(declare-fun b!449820 () Bool)

(assert (=> b!449820 (= e!263676 tp_is_empty!12033)))

(declare-fun b!449821 () Bool)

(declare-fun res!267633 () Bool)

(assert (=> b!449821 (=> (not res!267633) (not e!263678))))

(assert (=> b!449821 (= res!267633 (and (= (size!13735 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13734 _keys!709) (size!13735 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40684 res!267629) b!449810))

(assert (= (and b!449810 res!267628) b!449821))

(assert (= (and b!449821 res!267633) b!449812))

(assert (= (and b!449812 res!267630) b!449811))

(assert (= (and b!449811 res!267635) b!449809))

(assert (= (and b!449809 res!267636) b!449808))

(assert (= (and b!449808 res!267632) b!449814))

(assert (= (and b!449814 res!267638) b!449807))

(assert (= (and b!449807 res!267634) b!449818))

(assert (= (and b!449818 res!267631) b!449819))

(assert (= (and b!449819 res!267637) b!449816))

(assert (= (and b!449816 res!267639) b!449817))

(assert (= (and b!449815 condMapEmpty!19683) mapIsEmpty!19683))

(assert (= (and b!449815 (not condMapEmpty!19683)) mapNonEmpty!19683))

(get-info :version)

(assert (= (and mapNonEmpty!19683 ((_ is ValueCellFull!5673) mapValue!19683)) b!449820))

(assert (= (and b!449815 ((_ is ValueCellFull!5673) mapDefault!19683)) b!449813))

(assert (= start!40684 b!449815))

(declare-fun m!433903 () Bool)

(assert (=> b!449811 m!433903))

(declare-fun m!433905 () Bool)

(assert (=> b!449814 m!433905))

(declare-fun m!433907 () Bool)

(assert (=> b!449817 m!433907))

(declare-fun m!433909 () Bool)

(assert (=> b!449817 m!433909))

(declare-fun m!433911 () Bool)

(assert (=> b!449817 m!433911))

(declare-fun m!433913 () Bool)

(assert (=> start!40684 m!433913))

(declare-fun m!433915 () Bool)

(assert (=> start!40684 m!433915))

(declare-fun m!433917 () Bool)

(assert (=> b!449818 m!433917))

(declare-fun m!433919 () Bool)

(assert (=> b!449818 m!433919))

(declare-fun m!433921 () Bool)

(assert (=> b!449810 m!433921))

(declare-fun m!433923 () Bool)

(assert (=> b!449819 m!433923))

(declare-fun m!433925 () Bool)

(assert (=> mapNonEmpty!19683 m!433925))

(declare-fun m!433927 () Bool)

(assert (=> b!449807 m!433927))

(declare-fun m!433929 () Bool)

(assert (=> b!449812 m!433929))

(declare-fun m!433931 () Bool)

(assert (=> b!449808 m!433931))

(check-sat tp_is_empty!12033 (not b!449817) (not b!449808) (not b!449810) (not b!449812) (not mapNonEmpty!19683) (not b!449807) b_and!18703 (not b!449818) (not start!40684) (not b!449811) (not b_next!10695) (not b!449819))
(check-sat b_and!18703 (not b_next!10695))
