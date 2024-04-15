; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112194 () Bool)

(assert start!112194)

(declare-fun b_free!30589 () Bool)

(declare-fun b_next!30589 () Bool)

(assert (=> start!112194 (= b_free!30589 (not b_next!30589))))

(declare-fun tp!107404 () Bool)

(declare-fun b_and!49221 () Bool)

(assert (=> start!112194 (= tp!107404 b_and!49221)))

(declare-fun b!1328696 () Bool)

(declare-fun e!757588 () Bool)

(declare-fun tp_is_empty!36499 () Bool)

(assert (=> b!1328696 (= e!757588 tp_is_empty!36499)))

(declare-fun mapNonEmpty!56422 () Bool)

(declare-fun mapRes!56422 () Bool)

(declare-fun tp!107405 () Bool)

(declare-fun e!757586 () Bool)

(assert (=> mapNonEmpty!56422 (= mapRes!56422 (and tp!107405 e!757586))))

(declare-datatypes ((V!53769 0))(
  ( (V!53770 (val!18324 Int)) )
))
(declare-datatypes ((ValueCell!17351 0))(
  ( (ValueCellFull!17351 (v!20960 V!53769)) (EmptyCell!17351) )
))
(declare-datatypes ((array!89825 0))(
  ( (array!89826 (arr!43379 (Array (_ BitVec 32) ValueCell!17351)) (size!43931 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89825)

(declare-fun mapRest!56422 () (Array (_ BitVec 32) ValueCell!17351))

(declare-fun mapValue!56422 () ValueCell!17351)

(declare-fun mapKey!56422 () (_ BitVec 32))

(assert (=> mapNonEmpty!56422 (= (arr!43379 _values!1320) (store mapRest!56422 mapKey!56422 mapValue!56422))))

(declare-fun res!881593 () Bool)

(declare-fun e!757584 () Bool)

(assert (=> start!112194 (=> (not res!881593) (not e!757584))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112194 (= res!881593 (validMask!0 mask!1998))))

(assert (=> start!112194 e!757584))

(declare-fun e!757585 () Bool)

(declare-fun array_inv!32905 (array!89825) Bool)

(assert (=> start!112194 (and (array_inv!32905 _values!1320) e!757585)))

(assert (=> start!112194 true))

(declare-datatypes ((array!89827 0))(
  ( (array!89828 (arr!43380 (Array (_ BitVec 32) (_ BitVec 64))) (size!43932 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89827)

(declare-fun array_inv!32906 (array!89827) Bool)

(assert (=> start!112194 (array_inv!32906 _keys!1590)))

(assert (=> start!112194 tp!107404))

(assert (=> start!112194 tp_is_empty!36499))

(declare-fun b!1328697 () Bool)

(declare-fun res!881588 () Bool)

(assert (=> b!1328697 (=> (not res!881588) (not e!757584))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53769)

(declare-fun zeroValue!1262 () V!53769)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23644 0))(
  ( (tuple2!23645 (_1!11833 (_ BitVec 64)) (_2!11833 V!53769)) )
))
(declare-datatypes ((List!30796 0))(
  ( (Nil!30793) (Cons!30792 (h!32001 tuple2!23644) (t!44794 List!30796)) )
))
(declare-datatypes ((ListLongMap!21301 0))(
  ( (ListLongMap!21302 (toList!10666 List!30796)) )
))
(declare-fun contains!8758 (ListLongMap!21301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5538 (array!89827 array!89825 (_ BitVec 32) (_ BitVec 32) V!53769 V!53769 (_ BitVec 32) Int) ListLongMap!21301)

(assert (=> b!1328697 (= res!881588 (contains!8758 (getCurrentListMap!5538 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328698 () Bool)

(declare-fun res!881592 () Bool)

(assert (=> b!1328698 (=> (not res!881592) (not e!757584))))

(assert (=> b!1328698 (= res!881592 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43932 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328699 () Bool)

(declare-fun res!881591 () Bool)

(assert (=> b!1328699 (=> (not res!881591) (not e!757584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328699 (= res!881591 (validKeyInArray!0 (select (arr!43380 _keys!1590) from!1980)))))

(declare-fun b!1328700 () Bool)

(assert (=> b!1328700 (= e!757584 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun b!1328701 () Bool)

(declare-fun res!881587 () Bool)

(assert (=> b!1328701 (=> (not res!881587) (not e!757584))))

(assert (=> b!1328701 (= res!881587 (not (= (select (arr!43380 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1328702 () Bool)

(declare-fun res!881589 () Bool)

(assert (=> b!1328702 (=> (not res!881589) (not e!757584))))

(assert (=> b!1328702 (= res!881589 (and (= (size!43931 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43932 _keys!1590) (size!43931 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328703 () Bool)

(declare-fun res!881590 () Bool)

(assert (=> b!1328703 (=> (not res!881590) (not e!757584))))

(declare-datatypes ((List!30797 0))(
  ( (Nil!30794) (Cons!30793 (h!32002 (_ BitVec 64)) (t!44795 List!30797)) )
))
(declare-fun arrayNoDuplicates!0 (array!89827 (_ BitVec 32) List!30797) Bool)

(assert (=> b!1328703 (= res!881590 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30794))))

(declare-fun b!1328704 () Bool)

(assert (=> b!1328704 (= e!757585 (and e!757588 mapRes!56422))))

(declare-fun condMapEmpty!56422 () Bool)

(declare-fun mapDefault!56422 () ValueCell!17351)

(assert (=> b!1328704 (= condMapEmpty!56422 (= (arr!43379 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17351)) mapDefault!56422)))))

(declare-fun mapIsEmpty!56422 () Bool)

(assert (=> mapIsEmpty!56422 mapRes!56422))

(declare-fun b!1328705 () Bool)

(declare-fun res!881586 () Bool)

(assert (=> b!1328705 (=> (not res!881586) (not e!757584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89827 (_ BitVec 32)) Bool)

(assert (=> b!1328705 (= res!881586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328706 () Bool)

(assert (=> b!1328706 (= e!757586 tp_is_empty!36499)))

(assert (= (and start!112194 res!881593) b!1328702))

(assert (= (and b!1328702 res!881589) b!1328705))

(assert (= (and b!1328705 res!881586) b!1328703))

(assert (= (and b!1328703 res!881590) b!1328698))

(assert (= (and b!1328698 res!881592) b!1328697))

(assert (= (and b!1328697 res!881588) b!1328701))

(assert (= (and b!1328701 res!881587) b!1328699))

(assert (= (and b!1328699 res!881591) b!1328700))

(assert (= (and b!1328704 condMapEmpty!56422) mapIsEmpty!56422))

(assert (= (and b!1328704 (not condMapEmpty!56422)) mapNonEmpty!56422))

(get-info :version)

(assert (= (and mapNonEmpty!56422 ((_ is ValueCellFull!17351) mapValue!56422)) b!1328706))

(assert (= (and b!1328704 ((_ is ValueCellFull!17351) mapDefault!56422)) b!1328696))

(assert (= start!112194 b!1328704))

(declare-fun m!1217109 () Bool)

(assert (=> b!1328705 m!1217109))

(declare-fun m!1217111 () Bool)

(assert (=> b!1328699 m!1217111))

(assert (=> b!1328699 m!1217111))

(declare-fun m!1217113 () Bool)

(assert (=> b!1328699 m!1217113))

(declare-fun m!1217115 () Bool)

(assert (=> b!1328703 m!1217115))

(declare-fun m!1217117 () Bool)

(assert (=> b!1328697 m!1217117))

(assert (=> b!1328697 m!1217117))

(declare-fun m!1217119 () Bool)

(assert (=> b!1328697 m!1217119))

(declare-fun m!1217121 () Bool)

(assert (=> start!112194 m!1217121))

(declare-fun m!1217123 () Bool)

(assert (=> start!112194 m!1217123))

(declare-fun m!1217125 () Bool)

(assert (=> start!112194 m!1217125))

(assert (=> b!1328701 m!1217111))

(declare-fun m!1217127 () Bool)

(assert (=> mapNonEmpty!56422 m!1217127))

(check-sat (not start!112194) tp_is_empty!36499 (not b!1328697) (not b!1328699) (not b!1328705) (not mapNonEmpty!56422) (not b!1328703) b_and!49221 (not b_next!30589))
(check-sat b_and!49221 (not b_next!30589))
