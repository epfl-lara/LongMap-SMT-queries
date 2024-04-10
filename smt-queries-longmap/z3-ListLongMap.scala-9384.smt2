; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111742 () Bool)

(assert start!111742)

(declare-fun b_free!30399 () Bool)

(declare-fun b_next!30399 () Bool)

(assert (=> start!111742 (= b_free!30399 (not b_next!30399))))

(declare-fun tp!106673 () Bool)

(declare-fun b_and!48937 () Bool)

(assert (=> start!111742 (= tp!106673 b_and!48937)))

(declare-fun b!1324084 () Bool)

(declare-fun res!878871 () Bool)

(declare-fun e!754832 () Bool)

(assert (=> b!1324084 (=> (not res!878871) (not e!754832))))

(declare-datatypes ((array!89354 0))(
  ( (array!89355 (arr!43151 (Array (_ BitVec 32) (_ BitVec 64))) (size!43701 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89354)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89354 (_ BitVec 32)) Bool)

(assert (=> b!1324084 (= res!878871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55976 () Bool)

(declare-fun mapRes!55976 () Bool)

(declare-fun tp!106672 () Bool)

(declare-fun e!754833 () Bool)

(assert (=> mapNonEmpty!55976 (= mapRes!55976 (and tp!106672 e!754833))))

(declare-datatypes ((V!53395 0))(
  ( (V!53396 (val!18184 Int)) )
))
(declare-datatypes ((ValueCell!17211 0))(
  ( (ValueCellFull!17211 (v!20814 V!53395)) (EmptyCell!17211) )
))
(declare-fun mapRest!55976 () (Array (_ BitVec 32) ValueCell!17211))

(declare-datatypes ((array!89356 0))(
  ( (array!89357 (arr!43152 (Array (_ BitVec 32) ValueCell!17211)) (size!43702 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89356)

(declare-fun mapValue!55976 () ValueCell!17211)

(declare-fun mapKey!55976 () (_ BitVec 32))

(assert (=> mapNonEmpty!55976 (= (arr!43152 _values!1337) (store mapRest!55976 mapKey!55976 mapValue!55976))))

(declare-fun mapIsEmpty!55976 () Bool)

(assert (=> mapIsEmpty!55976 mapRes!55976))

(declare-fun b!1324085 () Bool)

(declare-fun tp_is_empty!36219 () Bool)

(assert (=> b!1324085 (= e!754833 tp_is_empty!36219)))

(declare-fun b!1324086 () Bool)

(declare-fun e!754830 () Bool)

(assert (=> b!1324086 (= e!754830 tp_is_empty!36219)))

(declare-fun b!1324087 () Bool)

(declare-fun res!878870 () Bool)

(assert (=> b!1324087 (=> (not res!878870) (not e!754832))))

(declare-datatypes ((List!30587 0))(
  ( (Nil!30584) (Cons!30583 (h!31792 (_ BitVec 64)) (t!44513 List!30587)) )
))
(declare-fun arrayNoDuplicates!0 (array!89354 (_ BitVec 32) List!30587) Bool)

(assert (=> b!1324087 (= res!878870 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30584))))

(declare-fun res!878869 () Bool)

(assert (=> start!111742 (=> (not res!878869) (not e!754832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111742 (= res!878869 (validMask!0 mask!2019))))

(assert (=> start!111742 e!754832))

(declare-fun array_inv!32575 (array!89354) Bool)

(assert (=> start!111742 (array_inv!32575 _keys!1609)))

(assert (=> start!111742 true))

(assert (=> start!111742 tp_is_empty!36219))

(declare-fun e!754834 () Bool)

(declare-fun array_inv!32576 (array!89356) Bool)

(assert (=> start!111742 (and (array_inv!32576 _values!1337) e!754834)))

(assert (=> start!111742 tp!106673))

(declare-fun b!1324088 () Bool)

(assert (=> b!1324088 (= e!754832 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53395)

(declare-fun minValue!1279 () V!53395)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun lt!589431 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23446 0))(
  ( (tuple2!23447 (_1!11734 (_ BitVec 64)) (_2!11734 V!53395)) )
))
(declare-datatypes ((List!30588 0))(
  ( (Nil!30585) (Cons!30584 (h!31793 tuple2!23446) (t!44514 List!30588)) )
))
(declare-datatypes ((ListLongMap!21103 0))(
  ( (ListLongMap!21104 (toList!10567 List!30588)) )
))
(declare-fun contains!8722 (ListLongMap!21103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5563 (array!89354 array!89356 (_ BitVec 32) (_ BitVec 32) V!53395 V!53395 (_ BitVec 32) Int) ListLongMap!21103)

(assert (=> b!1324088 (= lt!589431 (contains!8722 (getCurrentListMap!5563 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324089 () Bool)

(assert (=> b!1324089 (= e!754834 (and e!754830 mapRes!55976))))

(declare-fun condMapEmpty!55976 () Bool)

(declare-fun mapDefault!55976 () ValueCell!17211)

(assert (=> b!1324089 (= condMapEmpty!55976 (= (arr!43152 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17211)) mapDefault!55976)))))

(declare-fun b!1324090 () Bool)

(declare-fun res!878873 () Bool)

(assert (=> b!1324090 (=> (not res!878873) (not e!754832))))

(assert (=> b!1324090 (= res!878873 (and (= (size!43702 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43701 _keys!1609) (size!43702 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324091 () Bool)

(declare-fun res!878872 () Bool)

(assert (=> b!1324091 (=> (not res!878872) (not e!754832))))

(assert (=> b!1324091 (= res!878872 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43701 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111742 res!878869) b!1324090))

(assert (= (and b!1324090 res!878873) b!1324084))

(assert (= (and b!1324084 res!878871) b!1324087))

(assert (= (and b!1324087 res!878870) b!1324091))

(assert (= (and b!1324091 res!878872) b!1324088))

(assert (= (and b!1324089 condMapEmpty!55976) mapIsEmpty!55976))

(assert (= (and b!1324089 (not condMapEmpty!55976)) mapNonEmpty!55976))

(get-info :version)

(assert (= (and mapNonEmpty!55976 ((_ is ValueCellFull!17211) mapValue!55976)) b!1324085))

(assert (= (and b!1324089 ((_ is ValueCellFull!17211) mapDefault!55976)) b!1324086))

(assert (= start!111742 b!1324089))

(declare-fun m!1213063 () Bool)

(assert (=> b!1324088 m!1213063))

(assert (=> b!1324088 m!1213063))

(declare-fun m!1213065 () Bool)

(assert (=> b!1324088 m!1213065))

(declare-fun m!1213067 () Bool)

(assert (=> mapNonEmpty!55976 m!1213067))

(declare-fun m!1213069 () Bool)

(assert (=> b!1324084 m!1213069))

(declare-fun m!1213071 () Bool)

(assert (=> b!1324087 m!1213071))

(declare-fun m!1213073 () Bool)

(assert (=> start!111742 m!1213073))

(declare-fun m!1213075 () Bool)

(assert (=> start!111742 m!1213075))

(declare-fun m!1213077 () Bool)

(assert (=> start!111742 m!1213077))

(check-sat tp_is_empty!36219 (not mapNonEmpty!55976) (not b!1324087) (not b!1324088) (not b_next!30399) (not b!1324084) b_and!48937 (not start!111742))
(check-sat b_and!48937 (not b_next!30399))
