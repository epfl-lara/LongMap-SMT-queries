; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113662 () Bool)

(assert start!113662)

(declare-fun b_free!31489 () Bool)

(declare-fun b_next!31489 () Bool)

(assert (=> start!113662 (= b_free!31489 (not b_next!31489))))

(declare-fun tp!110272 () Bool)

(declare-fun b_and!50779 () Bool)

(assert (=> start!113662 (= tp!110272 b_and!50779)))

(declare-fun b!1347936 () Bool)

(declare-fun e!767072 () Bool)

(declare-fun tp_is_empty!37489 () Bool)

(assert (=> b!1347936 (= e!767072 tp_is_empty!37489)))

(declare-fun b!1347937 () Bool)

(declare-fun e!767070 () Bool)

(assert (=> b!1347937 (= e!767070 tp_is_empty!37489)))

(declare-fun b!1347938 () Bool)

(declare-fun res!894080 () Bool)

(declare-fun e!767068 () Bool)

(assert (=> b!1347938 (=> (not res!894080) (not e!767068))))

(declare-datatypes ((array!91921 0))(
  ( (array!91922 (arr!44412 (Array (_ BitVec 32) (_ BitVec 64))) (size!44963 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91921)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91921 (_ BitVec 32)) Bool)

(assert (=> b!1347938 (= res!894080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57940 () Bool)

(declare-fun mapRes!57940 () Bool)

(assert (=> mapIsEmpty!57940 mapRes!57940))

(declare-fun b!1347940 () Bool)

(declare-fun res!894079 () Bool)

(assert (=> b!1347940 (=> (not res!894079) (not e!767068))))

(declare-datatypes ((List!31446 0))(
  ( (Nil!31443) (Cons!31442 (h!32660 (_ BitVec 64)) (t!46028 List!31446)) )
))
(declare-fun arrayNoDuplicates!0 (array!91921 (_ BitVec 32) List!31446) Bool)

(assert (=> b!1347940 (= res!894079 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31443))))

(declare-fun b!1347939 () Bool)

(declare-fun res!894076 () Bool)

(assert (=> b!1347939 (=> (not res!894076) (not e!767068))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347939 (= res!894076 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44963 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!894077 () Bool)

(assert (=> start!113662 (=> (not res!894077) (not e!767068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113662 (= res!894077 (validMask!0 mask!1977))))

(assert (=> start!113662 e!767068))

(assert (=> start!113662 tp_is_empty!37489))

(assert (=> start!113662 true))

(declare-fun array_inv!33723 (array!91921) Bool)

(assert (=> start!113662 (array_inv!33723 _keys!1571)))

(declare-datatypes ((V!55089 0))(
  ( (V!55090 (val!18819 Int)) )
))
(declare-datatypes ((ValueCell!17846 0))(
  ( (ValueCellFull!17846 (v!21462 V!55089)) (EmptyCell!17846) )
))
(declare-datatypes ((array!91923 0))(
  ( (array!91924 (arr!44413 (Array (_ BitVec 32) ValueCell!17846)) (size!44964 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91923)

(declare-fun e!767069 () Bool)

(declare-fun array_inv!33724 (array!91923) Bool)

(assert (=> start!113662 (and (array_inv!33724 _values!1303) e!767069)))

(assert (=> start!113662 tp!110272))

(declare-fun b!1347941 () Bool)

(assert (=> b!1347941 (= e!767069 (and e!767072 mapRes!57940))))

(declare-fun condMapEmpty!57940 () Bool)

(declare-fun mapDefault!57940 () ValueCell!17846)

(assert (=> b!1347941 (= condMapEmpty!57940 (= (arr!44413 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17846)) mapDefault!57940)))))

(declare-fun b!1347942 () Bool)

(assert (=> b!1347942 (= e!767068 false)))

(declare-fun lt!596003 () Bool)

(declare-fun minValue!1245 () V!55089)

(declare-fun zeroValue!1245 () V!55089)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24306 0))(
  ( (tuple2!24307 (_1!12164 (_ BitVec 64)) (_2!12164 V!55089)) )
))
(declare-datatypes ((List!31447 0))(
  ( (Nil!31444) (Cons!31443 (h!32661 tuple2!24306) (t!46029 List!31447)) )
))
(declare-datatypes ((ListLongMap!21971 0))(
  ( (ListLongMap!21972 (toList!11001 List!31447)) )
))
(declare-fun contains!9189 (ListLongMap!21971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5941 (array!91921 array!91923 (_ BitVec 32) (_ BitVec 32) V!55089 V!55089 (_ BitVec 32) Int) ListLongMap!21971)

(assert (=> b!1347942 (= lt!596003 (contains!9189 (getCurrentListMap!5941 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347943 () Bool)

(declare-fun res!894078 () Bool)

(assert (=> b!1347943 (=> (not res!894078) (not e!767068))))

(assert (=> b!1347943 (= res!894078 (and (= (size!44964 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44963 _keys!1571) (size!44964 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57940 () Bool)

(declare-fun tp!110271 () Bool)

(assert (=> mapNonEmpty!57940 (= mapRes!57940 (and tp!110271 e!767070))))

(declare-fun mapValue!57940 () ValueCell!17846)

(declare-fun mapKey!57940 () (_ BitVec 32))

(declare-fun mapRest!57940 () (Array (_ BitVec 32) ValueCell!17846))

(assert (=> mapNonEmpty!57940 (= (arr!44413 _values!1303) (store mapRest!57940 mapKey!57940 mapValue!57940))))

(assert (= (and start!113662 res!894077) b!1347943))

(assert (= (and b!1347943 res!894078) b!1347938))

(assert (= (and b!1347938 res!894080) b!1347940))

(assert (= (and b!1347940 res!894079) b!1347939))

(assert (= (and b!1347939 res!894076) b!1347942))

(assert (= (and b!1347941 condMapEmpty!57940) mapIsEmpty!57940))

(assert (= (and b!1347941 (not condMapEmpty!57940)) mapNonEmpty!57940))

(get-info :version)

(assert (= (and mapNonEmpty!57940 ((_ is ValueCellFull!17846) mapValue!57940)) b!1347937))

(assert (= (and b!1347941 ((_ is ValueCellFull!17846) mapDefault!57940)) b!1347936))

(assert (= start!113662 b!1347941))

(declare-fun m!1235313 () Bool)

(assert (=> start!113662 m!1235313))

(declare-fun m!1235315 () Bool)

(assert (=> start!113662 m!1235315))

(declare-fun m!1235317 () Bool)

(assert (=> start!113662 m!1235317))

(declare-fun m!1235319 () Bool)

(assert (=> b!1347942 m!1235319))

(assert (=> b!1347942 m!1235319))

(declare-fun m!1235321 () Bool)

(assert (=> b!1347942 m!1235321))

(declare-fun m!1235323 () Bool)

(assert (=> b!1347940 m!1235323))

(declare-fun m!1235325 () Bool)

(assert (=> mapNonEmpty!57940 m!1235325))

(declare-fun m!1235327 () Bool)

(assert (=> b!1347938 m!1235327))

(check-sat tp_is_empty!37489 (not b!1347942) b_and!50779 (not b_next!31489) (not b!1347940) (not mapNonEmpty!57940) (not start!113662) (not b!1347938))
(check-sat b_and!50779 (not b_next!31489))
