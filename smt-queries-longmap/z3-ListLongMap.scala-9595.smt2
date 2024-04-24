; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113656 () Bool)

(assert start!113656)

(declare-fun b_free!31483 () Bool)

(declare-fun b_next!31483 () Bool)

(assert (=> start!113656 (= b_free!31483 (not b_next!31483))))

(declare-fun tp!110253 () Bool)

(declare-fun b_and!50773 () Bool)

(assert (=> start!113656 (= tp!110253 b_and!50773)))

(declare-fun mapIsEmpty!57931 () Bool)

(declare-fun mapRes!57931 () Bool)

(assert (=> mapIsEmpty!57931 mapRes!57931))

(declare-fun res!894011 () Bool)

(declare-fun e!767024 () Bool)

(assert (=> start!113656 (=> (not res!894011) (not e!767024))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113656 (= res!894011 (validMask!0 mask!1977))))

(assert (=> start!113656 e!767024))

(declare-fun tp_is_empty!37483 () Bool)

(assert (=> start!113656 tp_is_empty!37483))

(assert (=> start!113656 true))

(declare-datatypes ((array!91909 0))(
  ( (array!91910 (arr!44406 (Array (_ BitVec 32) (_ BitVec 64))) (size!44957 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91909)

(declare-fun array_inv!33719 (array!91909) Bool)

(assert (=> start!113656 (array_inv!33719 _keys!1571)))

(declare-datatypes ((V!55081 0))(
  ( (V!55082 (val!18816 Int)) )
))
(declare-datatypes ((ValueCell!17843 0))(
  ( (ValueCellFull!17843 (v!21459 V!55081)) (EmptyCell!17843) )
))
(declare-datatypes ((array!91911 0))(
  ( (array!91912 (arr!44407 (Array (_ BitVec 32) ValueCell!17843)) (size!44958 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91911)

(declare-fun e!767026 () Bool)

(declare-fun array_inv!33720 (array!91911) Bool)

(assert (=> start!113656 (and (array_inv!33720 _values!1303) e!767026)))

(assert (=> start!113656 tp!110253))

(declare-fun b!1347843 () Bool)

(declare-fun res!894012 () Bool)

(assert (=> b!1347843 (=> (not res!894012) (not e!767024))))

(declare-datatypes ((List!31440 0))(
  ( (Nil!31437) (Cons!31436 (h!32654 (_ BitVec 64)) (t!46022 List!31440)) )
))
(declare-fun arrayNoDuplicates!0 (array!91909 (_ BitVec 32) List!31440) Bool)

(assert (=> b!1347843 (= res!894012 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31437))))

(declare-fun b!1347844 () Bool)

(declare-fun res!894013 () Bool)

(assert (=> b!1347844 (=> (not res!894013) (not e!767024))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1347844 (= res!894013 (and (= (size!44958 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44957 _keys!1571) (size!44958 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347845 () Bool)

(declare-fun res!894016 () Bool)

(assert (=> b!1347845 (=> (not res!894016) (not e!767024))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347845 (= res!894016 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44957 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347846 () Bool)

(declare-fun e!767027 () Bool)

(assert (=> b!1347846 (= e!767026 (and e!767027 mapRes!57931))))

(declare-fun condMapEmpty!57931 () Bool)

(declare-fun mapDefault!57931 () ValueCell!17843)

(assert (=> b!1347846 (= condMapEmpty!57931 (= (arr!44407 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17843)) mapDefault!57931)))))

(declare-fun b!1347847 () Bool)

(assert (=> b!1347847 (= e!767024 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000))))

(declare-fun b!1347848 () Bool)

(assert (=> b!1347848 (= e!767027 tp_is_empty!37483)))

(declare-fun mapNonEmpty!57931 () Bool)

(declare-fun tp!110254 () Bool)

(declare-fun e!767025 () Bool)

(assert (=> mapNonEmpty!57931 (= mapRes!57931 (and tp!110254 e!767025))))

(declare-fun mapKey!57931 () (_ BitVec 32))

(declare-fun mapRest!57931 () (Array (_ BitVec 32) ValueCell!17843))

(declare-fun mapValue!57931 () ValueCell!17843)

(assert (=> mapNonEmpty!57931 (= (arr!44407 _values!1303) (store mapRest!57931 mapKey!57931 mapValue!57931))))

(declare-fun b!1347849 () Bool)

(assert (=> b!1347849 (= e!767025 tp_is_empty!37483)))

(declare-fun b!1347850 () Bool)

(declare-fun res!894014 () Bool)

(assert (=> b!1347850 (=> (not res!894014) (not e!767024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91909 (_ BitVec 32)) Bool)

(assert (=> b!1347850 (= res!894014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347851 () Bool)

(declare-fun res!894015 () Bool)

(assert (=> b!1347851 (=> (not res!894015) (not e!767024))))

(assert (=> b!1347851 (= res!894015 (not (= (select (arr!44406 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347852 () Bool)

(declare-fun res!894010 () Bool)

(assert (=> b!1347852 (=> (not res!894010) (not e!767024))))

(declare-fun minValue!1245 () V!55081)

(declare-fun zeroValue!1245 () V!55081)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24300 0))(
  ( (tuple2!24301 (_1!12161 (_ BitVec 64)) (_2!12161 V!55081)) )
))
(declare-datatypes ((List!31441 0))(
  ( (Nil!31438) (Cons!31437 (h!32655 tuple2!24300) (t!46023 List!31441)) )
))
(declare-datatypes ((ListLongMap!21965 0))(
  ( (ListLongMap!21966 (toList!10998 List!31441)) )
))
(declare-fun contains!9186 (ListLongMap!21965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5938 (array!91909 array!91911 (_ BitVec 32) (_ BitVec 32) V!55081 V!55081 (_ BitVec 32) Int) ListLongMap!21965)

(assert (=> b!1347852 (= res!894010 (contains!9186 (getCurrentListMap!5938 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347853 () Bool)

(declare-fun res!894017 () Bool)

(assert (=> b!1347853 (=> (not res!894017) (not e!767024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347853 (= res!894017 (not (validKeyInArray!0 (select (arr!44406 _keys!1571) from!1960))))))

(assert (= (and start!113656 res!894011) b!1347844))

(assert (= (and b!1347844 res!894013) b!1347850))

(assert (= (and b!1347850 res!894014) b!1347843))

(assert (= (and b!1347843 res!894012) b!1347845))

(assert (= (and b!1347845 res!894016) b!1347852))

(assert (= (and b!1347852 res!894010) b!1347851))

(assert (= (and b!1347851 res!894015) b!1347853))

(assert (= (and b!1347853 res!894017) b!1347847))

(assert (= (and b!1347846 condMapEmpty!57931) mapIsEmpty!57931))

(assert (= (and b!1347846 (not condMapEmpty!57931)) mapNonEmpty!57931))

(get-info :version)

(assert (= (and mapNonEmpty!57931 ((_ is ValueCellFull!17843) mapValue!57931)) b!1347849))

(assert (= (and b!1347846 ((_ is ValueCellFull!17843) mapDefault!57931)) b!1347848))

(assert (= start!113656 b!1347846))

(declare-fun m!1235253 () Bool)

(assert (=> b!1347851 m!1235253))

(assert (=> b!1347853 m!1235253))

(assert (=> b!1347853 m!1235253))

(declare-fun m!1235255 () Bool)

(assert (=> b!1347853 m!1235255))

(declare-fun m!1235257 () Bool)

(assert (=> start!113656 m!1235257))

(declare-fun m!1235259 () Bool)

(assert (=> start!113656 m!1235259))

(declare-fun m!1235261 () Bool)

(assert (=> start!113656 m!1235261))

(declare-fun m!1235263 () Bool)

(assert (=> b!1347843 m!1235263))

(declare-fun m!1235265 () Bool)

(assert (=> mapNonEmpty!57931 m!1235265))

(declare-fun m!1235267 () Bool)

(assert (=> b!1347850 m!1235267))

(declare-fun m!1235269 () Bool)

(assert (=> b!1347852 m!1235269))

(assert (=> b!1347852 m!1235269))

(declare-fun m!1235271 () Bool)

(assert (=> b!1347852 m!1235271))

(check-sat (not b!1347852) (not mapNonEmpty!57931) (not b_next!31483) (not b!1347853) b_and!50773 (not start!113656) (not b!1347843) tp_is_empty!37483 (not b!1347850))
(check-sat b_and!50773 (not b_next!31483))
