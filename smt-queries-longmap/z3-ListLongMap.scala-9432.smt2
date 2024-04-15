; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112200 () Bool)

(assert start!112200)

(declare-fun b_free!30595 () Bool)

(declare-fun b_next!30595 () Bool)

(assert (=> start!112200 (= b_free!30595 (not b_next!30595))))

(declare-fun tp!107423 () Bool)

(declare-fun b_and!49227 () Bool)

(assert (=> start!112200 (= tp!107423 b_and!49227)))

(declare-fun b!1328797 () Bool)

(declare-fun e!757630 () Bool)

(assert (=> b!1328797 (= e!757630 false)))

(declare-datatypes ((V!53777 0))(
  ( (V!53778 (val!18327 Int)) )
))
(declare-datatypes ((ValueCell!17354 0))(
  ( (ValueCellFull!17354 (v!20963 V!53777)) (EmptyCell!17354) )
))
(declare-datatypes ((array!89837 0))(
  ( (array!89838 (arr!43385 (Array (_ BitVec 32) ValueCell!17354)) (size!43937 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89837)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89839 0))(
  ( (array!89840 (arr!43386 (Array (_ BitVec 32) (_ BitVec 64))) (size!43938 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89839)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!590695 () Bool)

(declare-fun minValue!1262 () V!53777)

(declare-fun zeroValue!1262 () V!53777)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23650 0))(
  ( (tuple2!23651 (_1!11836 (_ BitVec 64)) (_2!11836 V!53777)) )
))
(declare-datatypes ((List!30802 0))(
  ( (Nil!30799) (Cons!30798 (h!32007 tuple2!23650) (t!44802 List!30802)) )
))
(declare-datatypes ((ListLongMap!21307 0))(
  ( (ListLongMap!21308 (toList!10669 List!30802)) )
))
(declare-fun contains!8761 (ListLongMap!21307 (_ BitVec 64)) Bool)

(declare-fun +!4656 (ListLongMap!21307 tuple2!23650) ListLongMap!21307)

(declare-fun getCurrentListMapNoExtraKeys!6294 (array!89839 array!89837 (_ BitVec 32) (_ BitVec 32) V!53777 V!53777 (_ BitVec 32) Int) ListLongMap!21307)

(declare-fun get!21851 (ValueCell!17354 V!53777) V!53777)

(declare-fun dynLambda!3586 (Int (_ BitVec 64)) V!53777)

(assert (=> b!1328797 (= lt!590695 (contains!8761 (+!4656 (+!4656 (getCurrentListMapNoExtraKeys!6294 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23651 (select (arr!43386 _keys!1590) from!1980) (get!21851 (select (arr!43385 _values!1320) from!1980) (dynLambda!3586 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun b!1328798 () Bool)

(declare-fun res!881660 () Bool)

(assert (=> b!1328798 (=> (not res!881660) (not e!757630))))

(assert (=> b!1328798 (= res!881660 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1328799 () Bool)

(declare-fun res!881666 () Bool)

(assert (=> b!1328799 (=> (not res!881666) (not e!757630))))

(assert (=> b!1328799 (= res!881666 (and (= (size!43937 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43938 _keys!1590) (size!43937 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56431 () Bool)

(declare-fun mapRes!56431 () Bool)

(assert (=> mapIsEmpty!56431 mapRes!56431))

(declare-fun b!1328800 () Bool)

(declare-fun res!881664 () Bool)

(assert (=> b!1328800 (=> (not res!881664) (not e!757630))))

(declare-datatypes ((List!30803 0))(
  ( (Nil!30800) (Cons!30799 (h!32008 (_ BitVec 64)) (t!44803 List!30803)) )
))
(declare-fun arrayNoDuplicates!0 (array!89839 (_ BitVec 32) List!30803) Bool)

(assert (=> b!1328800 (= res!881664 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30800))))

(declare-fun b!1328801 () Bool)

(declare-fun res!881665 () Bool)

(assert (=> b!1328801 (=> (not res!881665) (not e!757630))))

(declare-fun getCurrentListMap!5541 (array!89839 array!89837 (_ BitVec 32) (_ BitVec 32) V!53777 V!53777 (_ BitVec 32) Int) ListLongMap!21307)

(assert (=> b!1328801 (= res!881665 (contains!8761 (getCurrentListMap!5541 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328802 () Bool)

(declare-fun res!881668 () Bool)

(assert (=> b!1328802 (=> (not res!881668) (not e!757630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328802 (= res!881668 (validKeyInArray!0 (select (arr!43386 _keys!1590) from!1980)))))

(declare-fun b!1328803 () Bool)

(declare-fun e!757632 () Bool)

(declare-fun e!757631 () Bool)

(assert (=> b!1328803 (= e!757632 (and e!757631 mapRes!56431))))

(declare-fun condMapEmpty!56431 () Bool)

(declare-fun mapDefault!56431 () ValueCell!17354)

(assert (=> b!1328803 (= condMapEmpty!56431 (= (arr!43385 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17354)) mapDefault!56431)))))

(declare-fun b!1328804 () Bool)

(declare-fun res!881661 () Bool)

(assert (=> b!1328804 (=> (not res!881661) (not e!757630))))

(assert (=> b!1328804 (= res!881661 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43938 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328805 () Bool)

(declare-fun res!881662 () Bool)

(assert (=> b!1328805 (=> (not res!881662) (not e!757630))))

(assert (=> b!1328805 (= res!881662 (not (= (select (arr!43386 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1328806 () Bool)

(declare-fun res!881667 () Bool)

(assert (=> b!1328806 (=> (not res!881667) (not e!757630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89839 (_ BitVec 32)) Bool)

(assert (=> b!1328806 (= res!881667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328807 () Bool)

(declare-fun tp_is_empty!36505 () Bool)

(assert (=> b!1328807 (= e!757631 tp_is_empty!36505)))

(declare-fun res!881663 () Bool)

(assert (=> start!112200 (=> (not res!881663) (not e!757630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112200 (= res!881663 (validMask!0 mask!1998))))

(assert (=> start!112200 e!757630))

(declare-fun array_inv!32911 (array!89837) Bool)

(assert (=> start!112200 (and (array_inv!32911 _values!1320) e!757632)))

(assert (=> start!112200 true))

(declare-fun array_inv!32912 (array!89839) Bool)

(assert (=> start!112200 (array_inv!32912 _keys!1590)))

(assert (=> start!112200 tp!107423))

(assert (=> start!112200 tp_is_empty!36505))

(declare-fun mapNonEmpty!56431 () Bool)

(declare-fun tp!107422 () Bool)

(declare-fun e!757633 () Bool)

(assert (=> mapNonEmpty!56431 (= mapRes!56431 (and tp!107422 e!757633))))

(declare-fun mapKey!56431 () (_ BitVec 32))

(declare-fun mapValue!56431 () ValueCell!17354)

(declare-fun mapRest!56431 () (Array (_ BitVec 32) ValueCell!17354))

(assert (=> mapNonEmpty!56431 (= (arr!43385 _values!1320) (store mapRest!56431 mapKey!56431 mapValue!56431))))

(declare-fun b!1328808 () Bool)

(assert (=> b!1328808 (= e!757633 tp_is_empty!36505)))

(assert (= (and start!112200 res!881663) b!1328799))

(assert (= (and b!1328799 res!881666) b!1328806))

(assert (= (and b!1328806 res!881667) b!1328800))

(assert (= (and b!1328800 res!881664) b!1328804))

(assert (= (and b!1328804 res!881661) b!1328801))

(assert (= (and b!1328801 res!881665) b!1328805))

(assert (= (and b!1328805 res!881662) b!1328802))

(assert (= (and b!1328802 res!881668) b!1328798))

(assert (= (and b!1328798 res!881660) b!1328797))

(assert (= (and b!1328803 condMapEmpty!56431) mapIsEmpty!56431))

(assert (= (and b!1328803 (not condMapEmpty!56431)) mapNonEmpty!56431))

(get-info :version)

(assert (= (and mapNonEmpty!56431 ((_ is ValueCellFull!17354) mapValue!56431)) b!1328808))

(assert (= (and b!1328803 ((_ is ValueCellFull!17354) mapDefault!56431)) b!1328807))

(assert (= start!112200 b!1328803))

(declare-fun b_lambda!23845 () Bool)

(assert (=> (not b_lambda!23845) (not b!1328797)))

(declare-fun t!44801 () Bool)

(declare-fun tb!11803 () Bool)

(assert (=> (and start!112200 (= defaultEntry!1323 defaultEntry!1323) t!44801) tb!11803))

(declare-fun result!24685 () Bool)

(assert (=> tb!11803 (= result!24685 tp_is_empty!36505)))

(assert (=> b!1328797 t!44801))

(declare-fun b_and!49229 () Bool)

(assert (= b_and!49227 (and (=> t!44801 result!24685) b_and!49229)))

(declare-fun m!1217169 () Bool)

(assert (=> b!1328797 m!1217169))

(declare-fun m!1217171 () Bool)

(assert (=> b!1328797 m!1217171))

(declare-fun m!1217173 () Bool)

(assert (=> b!1328797 m!1217173))

(declare-fun m!1217175 () Bool)

(assert (=> b!1328797 m!1217175))

(declare-fun m!1217177 () Bool)

(assert (=> b!1328797 m!1217177))

(assert (=> b!1328797 m!1217171))

(declare-fun m!1217179 () Bool)

(assert (=> b!1328797 m!1217179))

(assert (=> b!1328797 m!1217169))

(assert (=> b!1328797 m!1217173))

(declare-fun m!1217181 () Bool)

(assert (=> b!1328797 m!1217181))

(assert (=> b!1328797 m!1217175))

(assert (=> b!1328797 m!1217179))

(declare-fun m!1217183 () Bool)

(assert (=> b!1328797 m!1217183))

(declare-fun m!1217185 () Bool)

(assert (=> b!1328800 m!1217185))

(declare-fun m!1217187 () Bool)

(assert (=> mapNonEmpty!56431 m!1217187))

(declare-fun m!1217189 () Bool)

(assert (=> b!1328806 m!1217189))

(declare-fun m!1217191 () Bool)

(assert (=> b!1328801 m!1217191))

(assert (=> b!1328801 m!1217191))

(declare-fun m!1217193 () Bool)

(assert (=> b!1328801 m!1217193))

(declare-fun m!1217195 () Bool)

(assert (=> start!112200 m!1217195))

(declare-fun m!1217197 () Bool)

(assert (=> start!112200 m!1217197))

(declare-fun m!1217199 () Bool)

(assert (=> start!112200 m!1217199))

(assert (=> b!1328802 m!1217181))

(assert (=> b!1328802 m!1217181))

(declare-fun m!1217201 () Bool)

(assert (=> b!1328802 m!1217201))

(assert (=> b!1328805 m!1217181))

(check-sat (not b!1328797) (not b!1328802) (not b!1328806) (not b_next!30595) b_and!49229 (not start!112200) (not mapNonEmpty!56431) (not b!1328801) (not b_lambda!23845) tp_is_empty!36505 (not b!1328800))
(check-sat b_and!49229 (not b_next!30595))
