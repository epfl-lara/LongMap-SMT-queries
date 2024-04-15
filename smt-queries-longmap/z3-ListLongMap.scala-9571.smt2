; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113288 () Bool)

(assert start!113288)

(declare-fun b_free!31339 () Bool)

(declare-fun b_next!31339 () Bool)

(assert (=> start!113288 (= b_free!31339 (not b_next!31339))))

(declare-fun tp!109822 () Bool)

(declare-fun b_and!50543 () Bool)

(assert (=> start!113288 (= tp!109822 b_and!50543)))

(declare-fun b!1344089 () Bool)

(declare-fun res!891793 () Bool)

(declare-fun e!764987 () Bool)

(assert (=> b!1344089 (=> (not res!891793) (not e!764987))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54889 0))(
  ( (V!54890 (val!18744 Int)) )
))
(declare-datatypes ((ValueCell!17771 0))(
  ( (ValueCellFull!17771 (v!21391 V!54889)) (EmptyCell!17771) )
))
(declare-datatypes ((array!91465 0))(
  ( (array!91466 (arr!44189 (Array (_ BitVec 32) ValueCell!17771)) (size!44741 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91465)

(declare-datatypes ((array!91467 0))(
  ( (array!91468 (arr!44190 (Array (_ BitVec 32) (_ BitVec 64))) (size!44742 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91467)

(assert (=> b!1344089 (= res!891793 (and (= (size!44741 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44742 _keys!1571) (size!44741 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57715 () Bool)

(declare-fun mapRes!57715 () Bool)

(declare-fun tp!109823 () Bool)

(declare-fun e!764989 () Bool)

(assert (=> mapNonEmpty!57715 (= mapRes!57715 (and tp!109823 e!764989))))

(declare-fun mapRest!57715 () (Array (_ BitVec 32) ValueCell!17771))

(declare-fun mapKey!57715 () (_ BitVec 32))

(declare-fun mapValue!57715 () ValueCell!17771)

(assert (=> mapNonEmpty!57715 (= (arr!44189 _values!1303) (store mapRest!57715 mapKey!57715 mapValue!57715))))

(declare-fun b!1344090 () Bool)

(declare-fun res!891792 () Bool)

(assert (=> b!1344090 (=> (not res!891792) (not e!764987))))

(declare-datatypes ((List!31360 0))(
  ( (Nil!31357) (Cons!31356 (h!32565 (_ BitVec 64)) (t!45876 List!31360)) )
))
(declare-fun arrayNoDuplicates!0 (array!91467 (_ BitVec 32) List!31360) Bool)

(assert (=> b!1344090 (= res!891792 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31357))))

(declare-fun mapIsEmpty!57715 () Bool)

(assert (=> mapIsEmpty!57715 mapRes!57715))

(declare-fun b!1344091 () Bool)

(assert (=> b!1344091 (= e!764987 false)))

(declare-fun minValue!1245 () V!54889)

(declare-fun lt!594972 () Bool)

(declare-fun zeroValue!1245 () V!54889)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24220 0))(
  ( (tuple2!24221 (_1!12121 (_ BitVec 64)) (_2!12121 V!54889)) )
))
(declare-datatypes ((List!31361 0))(
  ( (Nil!31358) (Cons!31357 (h!32566 tuple2!24220) (t!45877 List!31361)) )
))
(declare-datatypes ((ListLongMap!21877 0))(
  ( (ListLongMap!21878 (toList!10954 List!31361)) )
))
(declare-fun contains!9059 (ListLongMap!21877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5800 (array!91467 array!91465 (_ BitVec 32) (_ BitVec 32) V!54889 V!54889 (_ BitVec 32) Int) ListLongMap!21877)

(assert (=> b!1344091 (= lt!594972 (contains!9059 (getCurrentListMap!5800 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344092 () Bool)

(declare-fun tp_is_empty!37339 () Bool)

(assert (=> b!1344092 (= e!764989 tp_is_empty!37339)))

(declare-fun b!1344093 () Bool)

(declare-fun e!764986 () Bool)

(assert (=> b!1344093 (= e!764986 tp_is_empty!37339)))

(declare-fun res!891794 () Bool)

(assert (=> start!113288 (=> (not res!891794) (not e!764987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113288 (= res!891794 (validMask!0 mask!1977))))

(assert (=> start!113288 e!764987))

(assert (=> start!113288 tp_is_empty!37339))

(assert (=> start!113288 true))

(declare-fun array_inv!33493 (array!91467) Bool)

(assert (=> start!113288 (array_inv!33493 _keys!1571)))

(declare-fun e!764988 () Bool)

(declare-fun array_inv!33494 (array!91465) Bool)

(assert (=> start!113288 (and (array_inv!33494 _values!1303) e!764988)))

(assert (=> start!113288 tp!109822))

(declare-fun b!1344094 () Bool)

(assert (=> b!1344094 (= e!764988 (and e!764986 mapRes!57715))))

(declare-fun condMapEmpty!57715 () Bool)

(declare-fun mapDefault!57715 () ValueCell!17771)

(assert (=> b!1344094 (= condMapEmpty!57715 (= (arr!44189 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17771)) mapDefault!57715)))))

(declare-fun b!1344095 () Bool)

(declare-fun res!891795 () Bool)

(assert (=> b!1344095 (=> (not res!891795) (not e!764987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91467 (_ BitVec 32)) Bool)

(assert (=> b!1344095 (= res!891795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344096 () Bool)

(declare-fun res!891796 () Bool)

(assert (=> b!1344096 (=> (not res!891796) (not e!764987))))

(assert (=> b!1344096 (= res!891796 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44742 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113288 res!891794) b!1344089))

(assert (= (and b!1344089 res!891793) b!1344095))

(assert (= (and b!1344095 res!891795) b!1344090))

(assert (= (and b!1344090 res!891792) b!1344096))

(assert (= (and b!1344096 res!891796) b!1344091))

(assert (= (and b!1344094 condMapEmpty!57715) mapIsEmpty!57715))

(assert (= (and b!1344094 (not condMapEmpty!57715)) mapNonEmpty!57715))

(get-info :version)

(assert (= (and mapNonEmpty!57715 ((_ is ValueCellFull!17771) mapValue!57715)) b!1344092))

(assert (= (and b!1344094 ((_ is ValueCellFull!17771) mapDefault!57715)) b!1344093))

(assert (= start!113288 b!1344094))

(declare-fun m!1231339 () Bool)

(assert (=> b!1344090 m!1231339))

(declare-fun m!1231341 () Bool)

(assert (=> mapNonEmpty!57715 m!1231341))

(declare-fun m!1231343 () Bool)

(assert (=> b!1344095 m!1231343))

(declare-fun m!1231345 () Bool)

(assert (=> start!113288 m!1231345))

(declare-fun m!1231347 () Bool)

(assert (=> start!113288 m!1231347))

(declare-fun m!1231349 () Bool)

(assert (=> start!113288 m!1231349))

(declare-fun m!1231351 () Bool)

(assert (=> b!1344091 m!1231351))

(assert (=> b!1344091 m!1231351))

(declare-fun m!1231353 () Bool)

(assert (=> b!1344091 m!1231353))

(check-sat b_and!50543 (not b!1344091) (not b!1344095) (not b!1344090) (not mapNonEmpty!57715) (not start!113288) tp_is_empty!37339 (not b_next!31339))
(check-sat b_and!50543 (not b_next!31339))
