; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40596 () Bool)

(assert start!40596)

(declare-fun b_free!10621 () Bool)

(declare-fun b_next!10621 () Bool)

(assert (=> start!40596 (= b_free!10621 (not b_next!10621))))

(declare-fun tp!37683 () Bool)

(declare-fun b_and!18603 () Bool)

(assert (=> start!40596 (= tp!37683 b_and!18603)))

(declare-fun b!447871 () Bool)

(declare-fun res!266172 () Bool)

(declare-fun e!262837 () Bool)

(assert (=> b!447871 (=> (not res!266172) (not e!262837))))

(declare-datatypes ((array!27723 0))(
  ( (array!27724 (arr!13307 (Array (_ BitVec 32) (_ BitVec 64))) (size!13660 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27723)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27723 (_ BitVec 32)) Bool)

(assert (=> b!447871 (= res!266172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447872 () Bool)

(declare-fun res!266174 () Bool)

(assert (=> b!447872 (=> (not res!266174) (not e!262837))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447872 (= res!266174 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13660 _keys!709))))))

(declare-fun b!447873 () Bool)

(declare-fun res!266177 () Bool)

(declare-fun e!262836 () Bool)

(assert (=> b!447873 (=> (not res!266177) (not e!262836))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447873 (= res!266177 (bvsle from!863 i!563))))

(declare-fun b!447874 () Bool)

(declare-fun res!266168 () Bool)

(assert (=> b!447874 (=> (not res!266168) (not e!262837))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447874 (= res!266168 (validKeyInArray!0 k0!794))))

(declare-fun b!447875 () Bool)

(declare-fun e!262833 () Bool)

(declare-fun tp_is_empty!11959 () Bool)

(assert (=> b!447875 (= e!262833 tp_is_empty!11959)))

(declare-fun res!266175 () Bool)

(assert (=> start!40596 (=> (not res!266175) (not e!262837))))

(assert (=> start!40596 (= res!266175 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13660 _keys!709))))))

(assert (=> start!40596 e!262837))

(assert (=> start!40596 tp_is_empty!11959))

(assert (=> start!40596 tp!37683))

(assert (=> start!40596 true))

(declare-datatypes ((V!17051 0))(
  ( (V!17052 (val!6024 Int)) )
))
(declare-datatypes ((ValueCell!5636 0))(
  ( (ValueCellFull!5636 (v!8273 V!17051)) (EmptyCell!5636) )
))
(declare-datatypes ((array!27725 0))(
  ( (array!27726 (arr!13308 (Array (_ BitVec 32) ValueCell!5636)) (size!13661 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27725)

(declare-fun e!262834 () Bool)

(declare-fun array_inv!9698 (array!27725) Bool)

(assert (=> start!40596 (and (array_inv!9698 _values!549) e!262834)))

(declare-fun array_inv!9699 (array!27723) Bool)

(assert (=> start!40596 (array_inv!9699 _keys!709)))

(declare-fun mapNonEmpty!19572 () Bool)

(declare-fun mapRes!19572 () Bool)

(declare-fun tp!37682 () Bool)

(declare-fun e!262838 () Bool)

(assert (=> mapNonEmpty!19572 (= mapRes!19572 (and tp!37682 e!262838))))

(declare-fun mapRest!19572 () (Array (_ BitVec 32) ValueCell!5636))

(declare-fun mapValue!19572 () ValueCell!5636)

(declare-fun mapKey!19572 () (_ BitVec 32))

(assert (=> mapNonEmpty!19572 (= (arr!13308 _values!549) (store mapRest!19572 mapKey!19572 mapValue!19572))))

(declare-fun b!447876 () Bool)

(declare-fun res!266167 () Bool)

(assert (=> b!447876 (=> (not res!266167) (not e!262837))))

(declare-fun arrayContainsKey!0 (array!27723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447876 (= res!266167 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447877 () Bool)

(assert (=> b!447877 (= e!262838 tp_is_empty!11959)))

(declare-fun b!447878 () Bool)

(assert (=> b!447878 (= e!262834 (and e!262833 mapRes!19572))))

(declare-fun condMapEmpty!19572 () Bool)

(declare-fun mapDefault!19572 () ValueCell!5636)

(assert (=> b!447878 (= condMapEmpty!19572 (= (arr!13308 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5636)) mapDefault!19572)))))

(declare-fun b!447879 () Bool)

(declare-fun res!266173 () Bool)

(assert (=> b!447879 (=> (not res!266173) (not e!262837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447879 (= res!266173 (validMask!0 mask!1025))))

(declare-fun b!447880 () Bool)

(declare-fun res!266178 () Bool)

(assert (=> b!447880 (=> (not res!266178) (not e!262837))))

(declare-datatypes ((List!7972 0))(
  ( (Nil!7969) (Cons!7968 (h!8824 (_ BitVec 64)) (t!13725 List!7972)) )
))
(declare-fun arrayNoDuplicates!0 (array!27723 (_ BitVec 32) List!7972) Bool)

(assert (=> b!447880 (= res!266178 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7969))))

(declare-fun b!447881 () Bool)

(declare-fun res!266171 () Bool)

(assert (=> b!447881 (=> (not res!266171) (not e!262837))))

(assert (=> b!447881 (= res!266171 (or (= (select (arr!13307 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13307 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19572 () Bool)

(assert (=> mapIsEmpty!19572 mapRes!19572))

(declare-fun b!447882 () Bool)

(assert (=> b!447882 (= e!262837 e!262836)))

(declare-fun res!266170 () Bool)

(assert (=> b!447882 (=> (not res!266170) (not e!262836))))

(declare-fun lt!203872 () array!27723)

(assert (=> b!447882 (= res!266170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203872 mask!1025))))

(assert (=> b!447882 (= lt!203872 (array!27724 (store (arr!13307 _keys!709) i!563 k0!794) (size!13660 _keys!709)))))

(declare-fun b!447883 () Bool)

(declare-fun res!266169 () Bool)

(assert (=> b!447883 (=> (not res!266169) (not e!262837))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447883 (= res!266169 (and (= (size!13661 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13660 _keys!709) (size!13661 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447884 () Bool)

(declare-fun res!266176 () Bool)

(assert (=> b!447884 (=> (not res!266176) (not e!262836))))

(assert (=> b!447884 (= res!266176 (arrayNoDuplicates!0 lt!203872 #b00000000000000000000000000000000 Nil!7969))))

(declare-fun b!447885 () Bool)

(assert (=> b!447885 (= e!262836 false)))

(declare-datatypes ((tuple2!7910 0))(
  ( (tuple2!7911 (_1!3966 (_ BitVec 64)) (_2!3966 V!17051)) )
))
(declare-datatypes ((List!7973 0))(
  ( (Nil!7970) (Cons!7969 (h!8825 tuple2!7910) (t!13726 List!7973)) )
))
(declare-datatypes ((ListLongMap!6813 0))(
  ( (ListLongMap!6814 (toList!3422 List!7973)) )
))
(declare-fun lt!203873 () ListLongMap!6813)

(declare-fun minValue!515 () V!17051)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17051)

(declare-fun v!412 () V!17051)

(declare-fun getCurrentListMapNoExtraKeys!1620 (array!27723 array!27725 (_ BitVec 32) (_ BitVec 32) V!17051 V!17051 (_ BitVec 32) Int) ListLongMap!6813)

(assert (=> b!447885 (= lt!203873 (getCurrentListMapNoExtraKeys!1620 lt!203872 (array!27726 (store (arr!13308 _values!549) i!563 (ValueCellFull!5636 v!412)) (size!13661 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203874 () ListLongMap!6813)

(assert (=> b!447885 (= lt!203874 (getCurrentListMapNoExtraKeys!1620 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40596 res!266175) b!447879))

(assert (= (and b!447879 res!266173) b!447883))

(assert (= (and b!447883 res!266169) b!447871))

(assert (= (and b!447871 res!266172) b!447880))

(assert (= (and b!447880 res!266178) b!447872))

(assert (= (and b!447872 res!266174) b!447874))

(assert (= (and b!447874 res!266168) b!447881))

(assert (= (and b!447881 res!266171) b!447876))

(assert (= (and b!447876 res!266167) b!447882))

(assert (= (and b!447882 res!266170) b!447884))

(assert (= (and b!447884 res!266176) b!447873))

(assert (= (and b!447873 res!266177) b!447885))

(assert (= (and b!447878 condMapEmpty!19572) mapIsEmpty!19572))

(assert (= (and b!447878 (not condMapEmpty!19572)) mapNonEmpty!19572))

(get-info :version)

(assert (= (and mapNonEmpty!19572 ((_ is ValueCellFull!5636) mapValue!19572)) b!447877))

(assert (= (and b!447878 ((_ is ValueCellFull!5636) mapDefault!19572)) b!447875))

(assert (= start!40596 b!447878))

(declare-fun m!432061 () Bool)

(assert (=> b!447879 m!432061))

(declare-fun m!432063 () Bool)

(assert (=> b!447876 m!432063))

(declare-fun m!432065 () Bool)

(assert (=> mapNonEmpty!19572 m!432065))

(declare-fun m!432067 () Bool)

(assert (=> b!447871 m!432067))

(declare-fun m!432069 () Bool)

(assert (=> b!447885 m!432069))

(declare-fun m!432071 () Bool)

(assert (=> b!447885 m!432071))

(declare-fun m!432073 () Bool)

(assert (=> b!447885 m!432073))

(declare-fun m!432075 () Bool)

(assert (=> b!447874 m!432075))

(declare-fun m!432077 () Bool)

(assert (=> b!447880 m!432077))

(declare-fun m!432079 () Bool)

(assert (=> start!40596 m!432079))

(declare-fun m!432081 () Bool)

(assert (=> start!40596 m!432081))

(declare-fun m!432083 () Bool)

(assert (=> b!447881 m!432083))

(declare-fun m!432085 () Bool)

(assert (=> b!447882 m!432085))

(declare-fun m!432087 () Bool)

(assert (=> b!447882 m!432087))

(declare-fun m!432089 () Bool)

(assert (=> b!447884 m!432089))

(check-sat (not b!447879) (not b!447882) (not b!447871) b_and!18603 (not mapNonEmpty!19572) (not b!447880) (not b!447874) (not b_next!10621) (not b!447876) (not b!447884) (not start!40596) (not b!447885) tp_is_empty!11959)
(check-sat b_and!18603 (not b_next!10621))
