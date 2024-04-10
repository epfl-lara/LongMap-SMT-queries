; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112442 () Bool)

(assert start!112442)

(declare-fun b_free!30837 () Bool)

(declare-fun b_next!30837 () Bool)

(assert (=> start!112442 (= b_free!30837 (not b_next!30837))))

(declare-fun tp!108147 () Bool)

(declare-fun b_and!49679 () Bool)

(assert (=> start!112442 (= tp!108147 b_and!49679)))

(declare-fun b!1333122 () Bool)

(declare-fun res!884668 () Bool)

(declare-fun e!759479 () Bool)

(assert (=> b!1333122 (=> (not res!884668) (not e!759479))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90368 0))(
  ( (array!90369 (arr!43650 (Array (_ BitVec 32) (_ BitVec 64))) (size!44200 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90368)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333122 (= res!884668 (not (= (select (arr!43650 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333123 () Bool)

(declare-fun e!759478 () Bool)

(declare-fun tp_is_empty!36747 () Bool)

(assert (=> b!1333123 (= e!759478 tp_is_empty!36747)))

(declare-fun b!1333124 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333124 (= e!759479 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun b!1333125 () Bool)

(declare-fun res!884663 () Bool)

(assert (=> b!1333125 (=> (not res!884663) (not e!759479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333125 (= res!884663 (validKeyInArray!0 (select (arr!43650 _keys!1590) from!1980)))))

(declare-fun b!1333126 () Bool)

(declare-fun e!759477 () Bool)

(assert (=> b!1333126 (= e!759477 tp_is_empty!36747)))

(declare-fun b!1333127 () Bool)

(declare-fun res!884667 () Bool)

(assert (=> b!1333127 (=> (not res!884667) (not e!759479))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90368 (_ BitVec 32)) Bool)

(assert (=> b!1333127 (= res!884667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56794 () Bool)

(declare-fun mapRes!56794 () Bool)

(declare-fun tp!108148 () Bool)

(assert (=> mapNonEmpty!56794 (= mapRes!56794 (and tp!108148 e!759477))))

(declare-datatypes ((V!54099 0))(
  ( (V!54100 (val!18448 Int)) )
))
(declare-datatypes ((ValueCell!17475 0))(
  ( (ValueCellFull!17475 (v!21085 V!54099)) (EmptyCell!17475) )
))
(declare-datatypes ((array!90370 0))(
  ( (array!90371 (arr!43651 (Array (_ BitVec 32) ValueCell!17475)) (size!44201 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90370)

(declare-fun mapValue!56794 () ValueCell!17475)

(declare-fun mapRest!56794 () (Array (_ BitVec 32) ValueCell!17475))

(declare-fun mapKey!56794 () (_ BitVec 32))

(assert (=> mapNonEmpty!56794 (= (arr!43651 _values!1320) (store mapRest!56794 mapKey!56794 mapValue!56794))))

(declare-fun b!1333128 () Bool)

(declare-fun res!884669 () Bool)

(assert (=> b!1333128 (=> (not res!884669) (not e!759479))))

(assert (=> b!1333128 (= res!884669 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44200 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333129 () Bool)

(declare-fun res!884664 () Bool)

(assert (=> b!1333129 (=> (not res!884664) (not e!759479))))

(declare-datatypes ((List!30921 0))(
  ( (Nil!30918) (Cons!30917 (h!32126 (_ BitVec 64)) (t!45119 List!30921)) )
))
(declare-fun arrayNoDuplicates!0 (array!90368 (_ BitVec 32) List!30921) Bool)

(assert (=> b!1333129 (= res!884664 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30918))))

(declare-fun res!884665 () Bool)

(assert (=> start!112442 (=> (not res!884665) (not e!759479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112442 (= res!884665 (validMask!0 mask!1998))))

(assert (=> start!112442 e!759479))

(declare-fun e!759480 () Bool)

(declare-fun array_inv!32921 (array!90370) Bool)

(assert (=> start!112442 (and (array_inv!32921 _values!1320) e!759480)))

(assert (=> start!112442 true))

(declare-fun array_inv!32922 (array!90368) Bool)

(assert (=> start!112442 (array_inv!32922 _keys!1590)))

(assert (=> start!112442 tp!108147))

(assert (=> start!112442 tp_is_empty!36747))

(declare-fun b!1333130 () Bool)

(declare-fun res!884666 () Bool)

(assert (=> b!1333130 (=> (not res!884666) (not e!759479))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54099)

(declare-fun zeroValue!1262 () V!54099)

(declare-datatypes ((tuple2!23778 0))(
  ( (tuple2!23779 (_1!11900 (_ BitVec 64)) (_2!11900 V!54099)) )
))
(declare-datatypes ((List!30922 0))(
  ( (Nil!30919) (Cons!30918 (h!32127 tuple2!23778) (t!45120 List!30922)) )
))
(declare-datatypes ((ListLongMap!21435 0))(
  ( (ListLongMap!21436 (toList!10733 List!30922)) )
))
(declare-fun contains!8897 (ListLongMap!21435 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5714 (array!90368 array!90370 (_ BitVec 32) (_ BitVec 32) V!54099 V!54099 (_ BitVec 32) Int) ListLongMap!21435)

(assert (=> b!1333130 (= res!884666 (contains!8897 (getCurrentListMap!5714 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56794 () Bool)

(assert (=> mapIsEmpty!56794 mapRes!56794))

(declare-fun b!1333131 () Bool)

(declare-fun res!884670 () Bool)

(assert (=> b!1333131 (=> (not res!884670) (not e!759479))))

(assert (=> b!1333131 (= res!884670 (and (= (size!44201 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44200 _keys!1590) (size!44201 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333132 () Bool)

(assert (=> b!1333132 (= e!759480 (and e!759478 mapRes!56794))))

(declare-fun condMapEmpty!56794 () Bool)

(declare-fun mapDefault!56794 () ValueCell!17475)

(assert (=> b!1333132 (= condMapEmpty!56794 (= (arr!43651 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17475)) mapDefault!56794)))))

(assert (= (and start!112442 res!884665) b!1333131))

(assert (= (and b!1333131 res!884670) b!1333127))

(assert (= (and b!1333127 res!884667) b!1333129))

(assert (= (and b!1333129 res!884664) b!1333128))

(assert (= (and b!1333128 res!884669) b!1333130))

(assert (= (and b!1333130 res!884666) b!1333122))

(assert (= (and b!1333122 res!884668) b!1333125))

(assert (= (and b!1333125 res!884663) b!1333124))

(assert (= (and b!1333132 condMapEmpty!56794) mapIsEmpty!56794))

(assert (= (and b!1333132 (not condMapEmpty!56794)) mapNonEmpty!56794))

(get-info :version)

(assert (= (and mapNonEmpty!56794 ((_ is ValueCellFull!17475) mapValue!56794)) b!1333126))

(assert (= (and b!1333132 ((_ is ValueCellFull!17475) mapDefault!56794)) b!1333123))

(assert (= start!112442 b!1333132))

(declare-fun m!1221743 () Bool)

(assert (=> b!1333125 m!1221743))

(assert (=> b!1333125 m!1221743))

(declare-fun m!1221745 () Bool)

(assert (=> b!1333125 m!1221745))

(assert (=> b!1333122 m!1221743))

(declare-fun m!1221747 () Bool)

(assert (=> b!1333127 m!1221747))

(declare-fun m!1221749 () Bool)

(assert (=> b!1333129 m!1221749))

(declare-fun m!1221751 () Bool)

(assert (=> mapNonEmpty!56794 m!1221751))

(declare-fun m!1221753 () Bool)

(assert (=> start!112442 m!1221753))

(declare-fun m!1221755 () Bool)

(assert (=> start!112442 m!1221755))

(declare-fun m!1221757 () Bool)

(assert (=> start!112442 m!1221757))

(declare-fun m!1221759 () Bool)

(assert (=> b!1333130 m!1221759))

(assert (=> b!1333130 m!1221759))

(declare-fun m!1221761 () Bool)

(assert (=> b!1333130 m!1221761))

(check-sat (not b!1333130) b_and!49679 (not b!1333129) (not b!1333125) (not b_next!30837) (not b!1333127) (not start!112442) (not mapNonEmpty!56794) tp_is_empty!36747)
(check-sat b_and!49679 (not b_next!30837))
