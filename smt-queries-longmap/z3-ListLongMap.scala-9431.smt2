; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112196 () Bool)

(assert start!112196)

(declare-fun b_free!30591 () Bool)

(declare-fun b_next!30591 () Bool)

(assert (=> start!112196 (= b_free!30591 (not b_next!30591))))

(declare-fun tp!107409 () Bool)

(declare-fun b_and!49241 () Bool)

(assert (=> start!112196 (= tp!107409 b_and!49241)))

(declare-fun mapIsEmpty!56425 () Bool)

(declare-fun mapRes!56425 () Bool)

(assert (=> mapIsEmpty!56425 mapRes!56425))

(declare-fun b!1328799 () Bool)

(declare-fun res!881641 () Bool)

(declare-fun e!757634 () Bool)

(assert (=> b!1328799 (=> (not res!881641) (not e!757634))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!89894 0))(
  ( (array!89895 (arr!43413 (Array (_ BitVec 32) (_ BitVec 64))) (size!43963 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89894)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328799 (= res!881641 (not (= (select (arr!43413 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1328800 () Bool)

(declare-fun e!757633 () Bool)

(declare-fun tp_is_empty!36501 () Bool)

(assert (=> b!1328800 (= e!757633 tp_is_empty!36501)))

(declare-fun b!1328801 () Bool)

(declare-fun res!881643 () Bool)

(assert (=> b!1328801 (=> (not res!881643) (not e!757634))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328801 (= res!881643 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43963 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328802 () Bool)

(declare-fun res!881644 () Bool)

(assert (=> b!1328802 (=> (not res!881644) (not e!757634))))

(declare-datatypes ((V!53771 0))(
  ( (V!53772 (val!18325 Int)) )
))
(declare-datatypes ((ValueCell!17352 0))(
  ( (ValueCellFull!17352 (v!20962 V!53771)) (EmptyCell!17352) )
))
(declare-datatypes ((array!89896 0))(
  ( (array!89897 (arr!43414 (Array (_ BitVec 32) ValueCell!17352)) (size!43964 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89896)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1328802 (= res!881644 (and (= (size!43964 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43963 _keys!1590) (size!43964 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328803 () Bool)

(declare-fun e!757632 () Bool)

(assert (=> b!1328803 (= e!757632 tp_is_empty!36501)))

(declare-fun b!1328804 () Bool)

(declare-fun res!881645 () Bool)

(assert (=> b!1328804 (=> (not res!881645) (not e!757634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328804 (= res!881645 (validKeyInArray!0 (select (arr!43413 _keys!1590) from!1980)))))

(declare-fun b!1328805 () Bool)

(declare-fun res!881640 () Bool)

(assert (=> b!1328805 (=> (not res!881640) (not e!757634))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53771)

(declare-fun zeroValue!1262 () V!53771)

(declare-datatypes ((tuple2!23588 0))(
  ( (tuple2!23589 (_1!11805 (_ BitVec 64)) (_2!11805 V!53771)) )
))
(declare-datatypes ((List!30745 0))(
  ( (Nil!30742) (Cons!30741 (h!31950 tuple2!23588) (t!44751 List!30745)) )
))
(declare-datatypes ((ListLongMap!21245 0))(
  ( (ListLongMap!21246 (toList!10638 List!30745)) )
))
(declare-fun contains!8802 (ListLongMap!21245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5629 (array!89894 array!89896 (_ BitVec 32) (_ BitVec 32) V!53771 V!53771 (_ BitVec 32) Int) ListLongMap!21245)

(assert (=> b!1328805 (= res!881640 (contains!8802 (getCurrentListMap!5629 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328806 () Bool)

(declare-fun res!881642 () Bool)

(assert (=> b!1328806 (=> (not res!881642) (not e!757634))))

(declare-datatypes ((List!30746 0))(
  ( (Nil!30743) (Cons!30742 (h!31951 (_ BitVec 64)) (t!44752 List!30746)) )
))
(declare-fun arrayNoDuplicates!0 (array!89894 (_ BitVec 32) List!30746) Bool)

(assert (=> b!1328806 (= res!881642 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30743))))

(declare-fun b!1328807 () Bool)

(declare-fun res!881639 () Bool)

(assert (=> b!1328807 (=> (not res!881639) (not e!757634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89894 (_ BitVec 32)) Bool)

(assert (=> b!1328807 (= res!881639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328808 () Bool)

(assert (=> b!1328808 (= e!757634 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun b!1328809 () Bool)

(declare-fun e!757636 () Bool)

(assert (=> b!1328809 (= e!757636 (and e!757632 mapRes!56425))))

(declare-fun condMapEmpty!56425 () Bool)

(declare-fun mapDefault!56425 () ValueCell!17352)

(assert (=> b!1328809 (= condMapEmpty!56425 (= (arr!43414 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17352)) mapDefault!56425)))))

(declare-fun mapNonEmpty!56425 () Bool)

(declare-fun tp!107410 () Bool)

(assert (=> mapNonEmpty!56425 (= mapRes!56425 (and tp!107410 e!757633))))

(declare-fun mapValue!56425 () ValueCell!17352)

(declare-fun mapKey!56425 () (_ BitVec 32))

(declare-fun mapRest!56425 () (Array (_ BitVec 32) ValueCell!17352))

(assert (=> mapNonEmpty!56425 (= (arr!43414 _values!1320) (store mapRest!56425 mapKey!56425 mapValue!56425))))

(declare-fun res!881646 () Bool)

(assert (=> start!112196 (=> (not res!881646) (not e!757634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112196 (= res!881646 (validMask!0 mask!1998))))

(assert (=> start!112196 e!757634))

(declare-fun array_inv!32757 (array!89896) Bool)

(assert (=> start!112196 (and (array_inv!32757 _values!1320) e!757636)))

(assert (=> start!112196 true))

(declare-fun array_inv!32758 (array!89894) Bool)

(assert (=> start!112196 (array_inv!32758 _keys!1590)))

(assert (=> start!112196 tp!107409))

(assert (=> start!112196 tp_is_empty!36501))

(assert (= (and start!112196 res!881646) b!1328802))

(assert (= (and b!1328802 res!881644) b!1328807))

(assert (= (and b!1328807 res!881639) b!1328806))

(assert (= (and b!1328806 res!881642) b!1328801))

(assert (= (and b!1328801 res!881643) b!1328805))

(assert (= (and b!1328805 res!881640) b!1328799))

(assert (= (and b!1328799 res!881641) b!1328804))

(assert (= (and b!1328804 res!881645) b!1328808))

(assert (= (and b!1328809 condMapEmpty!56425) mapIsEmpty!56425))

(assert (= (and b!1328809 (not condMapEmpty!56425)) mapNonEmpty!56425))

(get-info :version)

(assert (= (and mapNonEmpty!56425 ((_ is ValueCellFull!17352) mapValue!56425)) b!1328800))

(assert (= (and b!1328809 ((_ is ValueCellFull!17352) mapDefault!56425)) b!1328803))

(assert (= start!112196 b!1328809))

(declare-fun m!1217645 () Bool)

(assert (=> mapNonEmpty!56425 m!1217645))

(declare-fun m!1217647 () Bool)

(assert (=> b!1328799 m!1217647))

(assert (=> b!1328804 m!1217647))

(assert (=> b!1328804 m!1217647))

(declare-fun m!1217649 () Bool)

(assert (=> b!1328804 m!1217649))

(declare-fun m!1217651 () Bool)

(assert (=> start!112196 m!1217651))

(declare-fun m!1217653 () Bool)

(assert (=> start!112196 m!1217653))

(declare-fun m!1217655 () Bool)

(assert (=> start!112196 m!1217655))

(declare-fun m!1217657 () Bool)

(assert (=> b!1328805 m!1217657))

(assert (=> b!1328805 m!1217657))

(declare-fun m!1217659 () Bool)

(assert (=> b!1328805 m!1217659))

(declare-fun m!1217661 () Bool)

(assert (=> b!1328807 m!1217661))

(declare-fun m!1217663 () Bool)

(assert (=> b!1328806 m!1217663))

(check-sat (not b!1328805) (not b!1328806) (not b!1328804) (not b!1328807) (not b_next!30591) b_and!49241 (not mapNonEmpty!56425) tp_is_empty!36501 (not start!112196))
(check-sat b_and!49241 (not b_next!30591))
