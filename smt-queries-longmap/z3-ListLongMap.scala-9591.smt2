; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113632 () Bool)

(assert start!113632)

(declare-fun b_free!31459 () Bool)

(declare-fun b_next!31459 () Bool)

(assert (=> start!113632 (= b_free!31459 (not b_next!31459))))

(declare-fun tp!110181 () Bool)

(declare-fun b_and!50749 () Bool)

(assert (=> start!113632 (= tp!110181 b_and!50749)))

(declare-fun mapNonEmpty!57895 () Bool)

(declare-fun mapRes!57895 () Bool)

(declare-fun tp!110182 () Bool)

(declare-fun e!766844 () Bool)

(assert (=> mapNonEmpty!57895 (= mapRes!57895 (and tp!110182 e!766844))))

(declare-datatypes ((V!55049 0))(
  ( (V!55050 (val!18804 Int)) )
))
(declare-datatypes ((ValueCell!17831 0))(
  ( (ValueCellFull!17831 (v!21447 V!55049)) (EmptyCell!17831) )
))
(declare-fun mapRest!57895 () (Array (_ BitVec 32) ValueCell!17831))

(declare-fun mapKey!57895 () (_ BitVec 32))

(declare-fun mapValue!57895 () ValueCell!17831)

(declare-datatypes ((array!91863 0))(
  ( (array!91864 (arr!44383 (Array (_ BitVec 32) ValueCell!17831)) (size!44934 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91863)

(assert (=> mapNonEmpty!57895 (= (arr!44383 _values!1303) (store mapRest!57895 mapKey!57895 mapValue!57895))))

(declare-fun res!893828 () Bool)

(declare-fun e!766846 () Bool)

(assert (=> start!113632 (=> (not res!893828) (not e!766846))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113632 (= res!893828 (validMask!0 mask!1977))))

(assert (=> start!113632 e!766846))

(declare-fun tp_is_empty!37459 () Bool)

(assert (=> start!113632 tp_is_empty!37459))

(assert (=> start!113632 true))

(declare-datatypes ((array!91865 0))(
  ( (array!91866 (arr!44384 (Array (_ BitVec 32) (_ BitVec 64))) (size!44935 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91865)

(declare-fun array_inv!33703 (array!91865) Bool)

(assert (=> start!113632 (array_inv!33703 _keys!1571)))

(declare-fun e!766845 () Bool)

(declare-fun array_inv!33704 (array!91863) Bool)

(assert (=> start!113632 (and (array_inv!33704 _values!1303) e!766845)))

(assert (=> start!113632 tp!110181))

(declare-fun b!1347549 () Bool)

(declare-fun e!766847 () Bool)

(assert (=> b!1347549 (= e!766845 (and e!766847 mapRes!57895))))

(declare-fun condMapEmpty!57895 () Bool)

(declare-fun mapDefault!57895 () ValueCell!17831)

(assert (=> b!1347549 (= condMapEmpty!57895 (= (arr!44383 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17831)) mapDefault!57895)))))

(declare-fun b!1347550 () Bool)

(declare-fun res!893826 () Bool)

(assert (=> b!1347550 (=> (not res!893826) (not e!766846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91865 (_ BitVec 32)) Bool)

(assert (=> b!1347550 (= res!893826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347551 () Bool)

(declare-fun res!893827 () Bool)

(assert (=> b!1347551 (=> (not res!893827) (not e!766846))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1347551 (= res!893827 (and (= (size!44934 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44935 _keys!1571) (size!44934 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347552 () Bool)

(declare-fun res!893824 () Bool)

(assert (=> b!1347552 (=> (not res!893824) (not e!766846))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347552 (= res!893824 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44935 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347553 () Bool)

(assert (=> b!1347553 (= e!766846 false)))

(declare-fun minValue!1245 () V!55049)

(declare-fun lt!595967 () Bool)

(declare-fun zeroValue!1245 () V!55049)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24284 0))(
  ( (tuple2!24285 (_1!12153 (_ BitVec 64)) (_2!12153 V!55049)) )
))
(declare-datatypes ((List!31425 0))(
  ( (Nil!31422) (Cons!31421 (h!32639 tuple2!24284) (t!46007 List!31425)) )
))
(declare-datatypes ((ListLongMap!21949 0))(
  ( (ListLongMap!21950 (toList!10990 List!31425)) )
))
(declare-fun contains!9178 (ListLongMap!21949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5930 (array!91865 array!91863 (_ BitVec 32) (_ BitVec 32) V!55049 V!55049 (_ BitVec 32) Int) ListLongMap!21949)

(assert (=> b!1347553 (= lt!595967 (contains!9178 (getCurrentListMap!5930 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347554 () Bool)

(assert (=> b!1347554 (= e!766844 tp_is_empty!37459)))

(declare-fun b!1347555 () Bool)

(declare-fun res!893825 () Bool)

(assert (=> b!1347555 (=> (not res!893825) (not e!766846))))

(declare-datatypes ((List!31426 0))(
  ( (Nil!31423) (Cons!31422 (h!32640 (_ BitVec 64)) (t!46008 List!31426)) )
))
(declare-fun arrayNoDuplicates!0 (array!91865 (_ BitVec 32) List!31426) Bool)

(assert (=> b!1347555 (= res!893825 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31423))))

(declare-fun b!1347556 () Bool)

(assert (=> b!1347556 (= e!766847 tp_is_empty!37459)))

(declare-fun mapIsEmpty!57895 () Bool)

(assert (=> mapIsEmpty!57895 mapRes!57895))

(assert (= (and start!113632 res!893828) b!1347551))

(assert (= (and b!1347551 res!893827) b!1347550))

(assert (= (and b!1347550 res!893826) b!1347555))

(assert (= (and b!1347555 res!893825) b!1347552))

(assert (= (and b!1347552 res!893824) b!1347553))

(assert (= (and b!1347549 condMapEmpty!57895) mapIsEmpty!57895))

(assert (= (and b!1347549 (not condMapEmpty!57895)) mapNonEmpty!57895))

(get-info :version)

(assert (= (and mapNonEmpty!57895 ((_ is ValueCellFull!17831) mapValue!57895)) b!1347554))

(assert (= (and b!1347549 ((_ is ValueCellFull!17831) mapDefault!57895)) b!1347556))

(assert (= start!113632 b!1347549))

(declare-fun m!1235061 () Bool)

(assert (=> b!1347555 m!1235061))

(declare-fun m!1235063 () Bool)

(assert (=> b!1347550 m!1235063))

(declare-fun m!1235065 () Bool)

(assert (=> b!1347553 m!1235065))

(assert (=> b!1347553 m!1235065))

(declare-fun m!1235067 () Bool)

(assert (=> b!1347553 m!1235067))

(declare-fun m!1235069 () Bool)

(assert (=> mapNonEmpty!57895 m!1235069))

(declare-fun m!1235071 () Bool)

(assert (=> start!113632 m!1235071))

(declare-fun m!1235073 () Bool)

(assert (=> start!113632 m!1235073))

(declare-fun m!1235075 () Bool)

(assert (=> start!113632 m!1235075))

(check-sat (not b!1347555) (not mapNonEmpty!57895) tp_is_empty!37459 (not b_next!31459) (not b!1347553) b_and!50749 (not b!1347550) (not start!113632))
(check-sat b_and!50749 (not b_next!31459))
