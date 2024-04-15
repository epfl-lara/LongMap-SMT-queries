; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40590 () Bool)

(assert start!40590)

(declare-fun b_free!10615 () Bool)

(declare-fun b_next!10615 () Bool)

(assert (=> start!40590 (= b_free!10615 (not b_next!10615))))

(declare-fun tp!37664 () Bool)

(declare-fun b_and!18597 () Bool)

(assert (=> start!40590 (= tp!37664 b_and!18597)))

(declare-fun b!447736 () Bool)

(declare-fun res!266069 () Bool)

(declare-fun e!262784 () Bool)

(assert (=> b!447736 (=> (not res!266069) (not e!262784))))

(declare-datatypes ((array!27711 0))(
  ( (array!27712 (arr!13301 (Array (_ BitVec 32) (_ BitVec 64))) (size!13654 (_ BitVec 32))) )
))
(declare-fun lt!203847 () array!27711)

(declare-datatypes ((List!7967 0))(
  ( (Nil!7964) (Cons!7963 (h!8819 (_ BitVec 64)) (t!13720 List!7967)) )
))
(declare-fun arrayNoDuplicates!0 (array!27711 (_ BitVec 32) List!7967) Bool)

(assert (=> b!447736 (= res!266069 (arrayNoDuplicates!0 lt!203847 #b00000000000000000000000000000000 Nil!7964))))

(declare-fun b!447737 () Bool)

(declare-fun e!262779 () Bool)

(declare-fun e!262783 () Bool)

(declare-fun mapRes!19563 () Bool)

(assert (=> b!447737 (= e!262779 (and e!262783 mapRes!19563))))

(declare-fun condMapEmpty!19563 () Bool)

(declare-datatypes ((V!17043 0))(
  ( (V!17044 (val!6021 Int)) )
))
(declare-datatypes ((ValueCell!5633 0))(
  ( (ValueCellFull!5633 (v!8270 V!17043)) (EmptyCell!5633) )
))
(declare-datatypes ((array!27713 0))(
  ( (array!27714 (arr!13302 (Array (_ BitVec 32) ValueCell!5633)) (size!13655 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27713)

(declare-fun mapDefault!19563 () ValueCell!5633)

(assert (=> b!447737 (= condMapEmpty!19563 (= (arr!13302 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5633)) mapDefault!19563)))))

(declare-fun b!447738 () Bool)

(declare-fun res!266066 () Bool)

(declare-fun e!262782 () Bool)

(assert (=> b!447738 (=> (not res!266066) (not e!262782))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447738 (= res!266066 (validKeyInArray!0 k0!794))))

(declare-fun b!447739 () Bool)

(assert (=> b!447739 (= e!262782 e!262784)))

(declare-fun res!266065 () Bool)

(assert (=> b!447739 (=> (not res!266065) (not e!262784))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27711 (_ BitVec 32)) Bool)

(assert (=> b!447739 (= res!266065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203847 mask!1025))))

(declare-fun _keys!709 () array!27711)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447739 (= lt!203847 (array!27712 (store (arr!13301 _keys!709) i!563 k0!794) (size!13654 _keys!709)))))

(declare-fun b!447740 () Bool)

(declare-fun res!266070 () Bool)

(assert (=> b!447740 (=> (not res!266070) (not e!262782))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447740 (= res!266070 (and (= (size!13655 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13654 _keys!709) (size!13655 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447741 () Bool)

(declare-fun res!266068 () Bool)

(assert (=> b!447741 (=> (not res!266068) (not e!262782))))

(assert (=> b!447741 (= res!266068 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7964))))

(declare-fun b!447742 () Bool)

(declare-fun res!266062 () Bool)

(assert (=> b!447742 (=> (not res!266062) (not e!262782))))

(assert (=> b!447742 (= res!266062 (or (= (select (arr!13301 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13301 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447743 () Bool)

(declare-fun res!266060 () Bool)

(assert (=> b!447743 (=> (not res!266060) (not e!262784))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447743 (= res!266060 (bvsle from!863 i!563))))

(declare-fun b!447744 () Bool)

(declare-fun e!262781 () Bool)

(declare-fun tp_is_empty!11953 () Bool)

(assert (=> b!447744 (= e!262781 tp_is_empty!11953)))

(declare-fun b!447745 () Bool)

(declare-fun res!266063 () Bool)

(assert (=> b!447745 (=> (not res!266063) (not e!262782))))

(assert (=> b!447745 (= res!266063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447746 () Bool)

(declare-fun res!266059 () Bool)

(assert (=> b!447746 (=> (not res!266059) (not e!262782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447746 (= res!266059 (validMask!0 mask!1025))))

(declare-fun b!447747 () Bool)

(assert (=> b!447747 (= e!262783 tp_is_empty!11953)))

(declare-fun b!447748 () Bool)

(declare-fun res!266064 () Bool)

(assert (=> b!447748 (=> (not res!266064) (not e!262782))))

(declare-fun arrayContainsKey!0 (array!27711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447748 (= res!266064 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19563 () Bool)

(declare-fun tp!37665 () Bool)

(assert (=> mapNonEmpty!19563 (= mapRes!19563 (and tp!37665 e!262781))))

(declare-fun mapRest!19563 () (Array (_ BitVec 32) ValueCell!5633))

(declare-fun mapKey!19563 () (_ BitVec 32))

(declare-fun mapValue!19563 () ValueCell!5633)

(assert (=> mapNonEmpty!19563 (= (arr!13302 _values!549) (store mapRest!19563 mapKey!19563 mapValue!19563))))

(declare-fun res!266067 () Bool)

(assert (=> start!40590 (=> (not res!266067) (not e!262782))))

(assert (=> start!40590 (= res!266067 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13654 _keys!709))))))

(assert (=> start!40590 e!262782))

(assert (=> start!40590 tp_is_empty!11953))

(assert (=> start!40590 tp!37664))

(assert (=> start!40590 true))

(declare-fun array_inv!9694 (array!27713) Bool)

(assert (=> start!40590 (and (array_inv!9694 _values!549) e!262779)))

(declare-fun array_inv!9695 (array!27711) Bool)

(assert (=> start!40590 (array_inv!9695 _keys!709)))

(declare-fun mapIsEmpty!19563 () Bool)

(assert (=> mapIsEmpty!19563 mapRes!19563))

(declare-fun b!447749 () Bool)

(assert (=> b!447749 (= e!262784 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17043)

(declare-fun v!412 () V!17043)

(declare-datatypes ((tuple2!7906 0))(
  ( (tuple2!7907 (_1!3964 (_ BitVec 64)) (_2!3964 V!17043)) )
))
(declare-datatypes ((List!7968 0))(
  ( (Nil!7965) (Cons!7964 (h!8820 tuple2!7906) (t!13721 List!7968)) )
))
(declare-datatypes ((ListLongMap!6809 0))(
  ( (ListLongMap!6810 (toList!3420 List!7968)) )
))
(declare-fun lt!203845 () ListLongMap!6809)

(declare-fun minValue!515 () V!17043)

(declare-fun getCurrentListMapNoExtraKeys!1618 (array!27711 array!27713 (_ BitVec 32) (_ BitVec 32) V!17043 V!17043 (_ BitVec 32) Int) ListLongMap!6809)

(assert (=> b!447749 (= lt!203845 (getCurrentListMapNoExtraKeys!1618 lt!203847 (array!27714 (store (arr!13302 _values!549) i!563 (ValueCellFull!5633 v!412)) (size!13655 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203846 () ListLongMap!6809)

(assert (=> b!447749 (= lt!203846 (getCurrentListMapNoExtraKeys!1618 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447750 () Bool)

(declare-fun res!266061 () Bool)

(assert (=> b!447750 (=> (not res!266061) (not e!262782))))

(assert (=> b!447750 (= res!266061 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13654 _keys!709))))))

(assert (= (and start!40590 res!266067) b!447746))

(assert (= (and b!447746 res!266059) b!447740))

(assert (= (and b!447740 res!266070) b!447745))

(assert (= (and b!447745 res!266063) b!447741))

(assert (= (and b!447741 res!266068) b!447750))

(assert (= (and b!447750 res!266061) b!447738))

(assert (= (and b!447738 res!266066) b!447742))

(assert (= (and b!447742 res!266062) b!447748))

(assert (= (and b!447748 res!266064) b!447739))

(assert (= (and b!447739 res!266065) b!447736))

(assert (= (and b!447736 res!266069) b!447743))

(assert (= (and b!447743 res!266060) b!447749))

(assert (= (and b!447737 condMapEmpty!19563) mapIsEmpty!19563))

(assert (= (and b!447737 (not condMapEmpty!19563)) mapNonEmpty!19563))

(get-info :version)

(assert (= (and mapNonEmpty!19563 ((_ is ValueCellFull!5633) mapValue!19563)) b!447744))

(assert (= (and b!447737 ((_ is ValueCellFull!5633) mapDefault!19563)) b!447747))

(assert (= start!40590 b!447737))

(declare-fun m!431971 () Bool)

(assert (=> b!447741 m!431971))

(declare-fun m!431973 () Bool)

(assert (=> b!447742 m!431973))

(declare-fun m!431975 () Bool)

(assert (=> start!40590 m!431975))

(declare-fun m!431977 () Bool)

(assert (=> start!40590 m!431977))

(declare-fun m!431979 () Bool)

(assert (=> b!447739 m!431979))

(declare-fun m!431981 () Bool)

(assert (=> b!447739 m!431981))

(declare-fun m!431983 () Bool)

(assert (=> b!447738 m!431983))

(declare-fun m!431985 () Bool)

(assert (=> mapNonEmpty!19563 m!431985))

(declare-fun m!431987 () Bool)

(assert (=> b!447749 m!431987))

(declare-fun m!431989 () Bool)

(assert (=> b!447749 m!431989))

(declare-fun m!431991 () Bool)

(assert (=> b!447749 m!431991))

(declare-fun m!431993 () Bool)

(assert (=> b!447736 m!431993))

(declare-fun m!431995 () Bool)

(assert (=> b!447748 m!431995))

(declare-fun m!431997 () Bool)

(assert (=> b!447746 m!431997))

(declare-fun m!431999 () Bool)

(assert (=> b!447745 m!431999))

(check-sat (not start!40590) tp_is_empty!11953 b_and!18597 (not b!447739) (not mapNonEmpty!19563) (not b!447746) (not b!447748) (not b!447736) (not b!447749) (not b!447741) (not b!447738) (not b_next!10615) (not b!447745))
(check-sat b_and!18597 (not b_next!10615))
