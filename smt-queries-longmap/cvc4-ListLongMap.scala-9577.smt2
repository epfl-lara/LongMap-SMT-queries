; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113328 () Bool)

(assert start!113328)

(declare-fun b_free!31379 () Bool)

(declare-fun b_next!31379 () Bool)

(assert (=> start!113328 (= b_free!31379 (not b_next!31379))))

(declare-fun tp!109941 () Bool)

(declare-fun b_and!50611 () Bool)

(assert (=> start!113328 (= tp!109941 b_and!50611)))

(declare-fun mapIsEmpty!57775 () Bool)

(declare-fun mapRes!57775 () Bool)

(assert (=> mapIsEmpty!57775 mapRes!57775))

(declare-fun b!1344744 () Bool)

(declare-fun res!892222 () Bool)

(declare-fun e!765320 () Bool)

(assert (=> b!1344744 (=> (not res!892222) (not e!765320))))

(declare-datatypes ((array!91598 0))(
  ( (array!91599 (arr!44255 (Array (_ BitVec 32) (_ BitVec 64))) (size!44805 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91598)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344744 (= res!892222 (validKeyInArray!0 (select (arr!44255 _keys!1571) from!1960)))))

(declare-fun b!1344745 () Bool)

(declare-fun res!892223 () Bool)

(assert (=> b!1344745 (=> (not res!892223) (not e!765320))))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1344745 (= res!892223 (not (= (select (arr!44255 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1344746 () Bool)

(declare-fun res!892219 () Bool)

(assert (=> b!1344746 (=> (not res!892219) (not e!765320))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54941 0))(
  ( (V!54942 (val!18764 Int)) )
))
(declare-datatypes ((ValueCell!17791 0))(
  ( (ValueCellFull!17791 (v!21412 V!54941)) (EmptyCell!17791) )
))
(declare-datatypes ((array!91600 0))(
  ( (array!91601 (arr!44256 (Array (_ BitVec 32) ValueCell!17791)) (size!44806 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91600)

(assert (=> b!1344746 (= res!892219 (and (= (size!44806 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44805 _keys!1571) (size!44806 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344747 () Bool)

(declare-fun res!892224 () Bool)

(assert (=> b!1344747 (=> (not res!892224) (not e!765320))))

(declare-datatypes ((List!31340 0))(
  ( (Nil!31337) (Cons!31336 (h!32545 (_ BitVec 64)) (t!45876 List!31340)) )
))
(declare-fun arrayNoDuplicates!0 (array!91598 (_ BitVec 32) List!31340) Bool)

(assert (=> b!1344747 (= res!892224 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31337))))

(declare-fun b!1344748 () Bool)

(declare-fun res!892216 () Bool)

(assert (=> b!1344748 (=> (not res!892216) (not e!765320))))

(declare-fun minValue!1245 () V!54941)

(declare-fun zeroValue!1245 () V!54941)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24184 0))(
  ( (tuple2!24185 (_1!12103 (_ BitVec 64)) (_2!12103 V!54941)) )
))
(declare-datatypes ((List!31341 0))(
  ( (Nil!31338) (Cons!31337 (h!32546 tuple2!24184) (t!45877 List!31341)) )
))
(declare-datatypes ((ListLongMap!21841 0))(
  ( (ListLongMap!21842 (toList!10936 List!31341)) )
))
(declare-fun contains!9112 (ListLongMap!21841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5892 (array!91598 array!91600 (_ BitVec 32) (_ BitVec 32) V!54941 V!54941 (_ BitVec 32) Int) ListLongMap!21841)

(assert (=> b!1344748 (= res!892216 (contains!9112 (getCurrentListMap!5892 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!892218 () Bool)

(assert (=> start!113328 (=> (not res!892218) (not e!765320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113328 (= res!892218 (validMask!0 mask!1977))))

(assert (=> start!113328 e!765320))

(declare-fun tp_is_empty!37379 () Bool)

(assert (=> start!113328 tp_is_empty!37379))

(assert (=> start!113328 true))

(declare-fun array_inv!33353 (array!91598) Bool)

(assert (=> start!113328 (array_inv!33353 _keys!1571)))

(declare-fun e!765321 () Bool)

(declare-fun array_inv!33354 (array!91600) Bool)

(assert (=> start!113328 (and (array_inv!33354 _values!1303) e!765321)))

(assert (=> start!113328 tp!109941))

(declare-fun b!1344749 () Bool)

(assert (=> b!1344749 (= e!765320 false)))

(declare-fun lt!595209 () Bool)

(declare-fun +!4822 (ListLongMap!21841 tuple2!24184) ListLongMap!21841)

(declare-fun getCurrentListMapNoExtraKeys!6464 (array!91598 array!91600 (_ BitVec 32) (_ BitVec 32) V!54941 V!54941 (_ BitVec 32) Int) ListLongMap!21841)

(declare-fun get!22353 (ValueCell!17791 V!54941) V!54941)

(declare-fun dynLambda!3761 (Int (_ BitVec 64)) V!54941)

(assert (=> b!1344749 (= lt!595209 (contains!9112 (+!4822 (getCurrentListMapNoExtraKeys!6464 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24185 (select (arr!44255 _keys!1571) from!1960) (get!22353 (select (arr!44256 _values!1303) from!1960) (dynLambda!3761 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1142))))

(declare-fun mapNonEmpty!57775 () Bool)

(declare-fun tp!109942 () Bool)

(declare-fun e!765319 () Bool)

(assert (=> mapNonEmpty!57775 (= mapRes!57775 (and tp!109942 e!765319))))

(declare-fun mapValue!57775 () ValueCell!17791)

(declare-fun mapKey!57775 () (_ BitVec 32))

(declare-fun mapRest!57775 () (Array (_ BitVec 32) ValueCell!17791))

(assert (=> mapNonEmpty!57775 (= (arr!44256 _values!1303) (store mapRest!57775 mapKey!57775 mapValue!57775))))

(declare-fun b!1344750 () Bool)

(declare-fun res!892220 () Bool)

(assert (=> b!1344750 (=> (not res!892220) (not e!765320))))

(assert (=> b!1344750 (= res!892220 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44805 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344751 () Bool)

(assert (=> b!1344751 (= e!765319 tp_is_empty!37379)))

(declare-fun b!1344752 () Bool)

(declare-fun e!765322 () Bool)

(assert (=> b!1344752 (= e!765322 tp_is_empty!37379)))

(declare-fun b!1344753 () Bool)

(assert (=> b!1344753 (= e!765321 (and e!765322 mapRes!57775))))

(declare-fun condMapEmpty!57775 () Bool)

(declare-fun mapDefault!57775 () ValueCell!17791)

