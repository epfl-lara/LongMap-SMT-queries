; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113318 () Bool)

(assert start!113318)

(declare-fun b_free!31369 () Bool)

(declare-fun b_next!31369 () Bool)

(assert (=> start!113318 (= b_free!31369 (not b_next!31369))))

(declare-fun tp!109911 () Bool)

(declare-fun b_and!50591 () Bool)

(assert (=> start!113318 (= tp!109911 b_and!50591)))

(declare-fun b!1344554 () Bool)

(declare-fun res!892086 () Bool)

(declare-fun e!765245 () Bool)

(assert (=> b!1344554 (=> (not res!892086) (not e!765245))))

(declare-datatypes ((V!54929 0))(
  ( (V!54930 (val!18759 Int)) )
))
(declare-fun minValue!1245 () V!54929)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91578 0))(
  ( (array!91579 (arr!44245 (Array (_ BitVec 32) (_ BitVec 64))) (size!44795 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91578)

(declare-fun zeroValue!1245 () V!54929)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17786 0))(
  ( (ValueCellFull!17786 (v!21407 V!54929)) (EmptyCell!17786) )
))
(declare-datatypes ((array!91580 0))(
  ( (array!91581 (arr!44246 (Array (_ BitVec 32) ValueCell!17786)) (size!44796 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91580)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24176 0))(
  ( (tuple2!24177 (_1!12099 (_ BitVec 64)) (_2!12099 V!54929)) )
))
(declare-datatypes ((List!31331 0))(
  ( (Nil!31328) (Cons!31327 (h!32536 tuple2!24176) (t!45857 List!31331)) )
))
(declare-datatypes ((ListLongMap!21833 0))(
  ( (ListLongMap!21834 (toList!10932 List!31331)) )
))
(declare-fun contains!9108 (ListLongMap!21833 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5888 (array!91578 array!91580 (_ BitVec 32) (_ BitVec 32) V!54929 V!54929 (_ BitVec 32) Int) ListLongMap!21833)

(assert (=> b!1344554 (= res!892086 (contains!9108 (getCurrentListMap!5888 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344555 () Bool)

(declare-fun res!892085 () Bool)

(assert (=> b!1344555 (=> (not res!892085) (not e!765245))))

(assert (=> b!1344555 (= res!892085 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44795 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344556 () Bool)

(declare-fun res!892087 () Bool)

(assert (=> b!1344556 (=> (not res!892087) (not e!765245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344556 (= res!892087 (validKeyInArray!0 (select (arr!44245 _keys!1571) from!1960)))))

(declare-fun b!1344557 () Bool)

(declare-fun res!892089 () Bool)

(assert (=> b!1344557 (=> (not res!892089) (not e!765245))))

(declare-datatypes ((List!31332 0))(
  ( (Nil!31329) (Cons!31328 (h!32537 (_ BitVec 64)) (t!45858 List!31332)) )
))
(declare-fun arrayNoDuplicates!0 (array!91578 (_ BitVec 32) List!31332) Bool)

(assert (=> b!1344557 (= res!892089 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31329))))

(declare-fun b!1344558 () Bool)

(assert (=> b!1344558 (= e!765245 false)))

(declare-fun lt!595194 () Bool)

(declare-fun +!4819 (ListLongMap!21833 tuple2!24176) ListLongMap!21833)

(declare-fun getCurrentListMapNoExtraKeys!6461 (array!91578 array!91580 (_ BitVec 32) (_ BitVec 32) V!54929 V!54929 (_ BitVec 32) Int) ListLongMap!21833)

(declare-fun get!22348 (ValueCell!17786 V!54929) V!54929)

(declare-fun dynLambda!3758 (Int (_ BitVec 64)) V!54929)

(assert (=> b!1344558 (= lt!595194 (contains!9108 (+!4819 (getCurrentListMapNoExtraKeys!6461 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24177 (select (arr!44245 _keys!1571) from!1960) (get!22348 (select (arr!44246 _values!1303) from!1960) (dynLambda!3758 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1142))))

(declare-fun b!1344559 () Bool)

(declare-fun e!765246 () Bool)

(declare-fun tp_is_empty!37369 () Bool)

(assert (=> b!1344559 (= e!765246 tp_is_empty!37369)))

(declare-fun mapNonEmpty!57760 () Bool)

(declare-fun mapRes!57760 () Bool)

(declare-fun tp!109912 () Bool)

(assert (=> mapNonEmpty!57760 (= mapRes!57760 (and tp!109912 e!765246))))

(declare-fun mapRest!57760 () (Array (_ BitVec 32) ValueCell!17786))

(declare-fun mapValue!57760 () ValueCell!17786)

(declare-fun mapKey!57760 () (_ BitVec 32))

(assert (=> mapNonEmpty!57760 (= (arr!44246 _values!1303) (store mapRest!57760 mapKey!57760 mapValue!57760))))

(declare-fun b!1344560 () Bool)

(declare-fun res!892083 () Bool)

(assert (=> b!1344560 (=> (not res!892083) (not e!765245))))

(assert (=> b!1344560 (= res!892083 (and (= (size!44796 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44795 _keys!1571) (size!44796 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344561 () Bool)

(declare-fun e!765247 () Bool)

(assert (=> b!1344561 (= e!765247 tp_is_empty!37369)))

(declare-fun b!1344562 () Bool)

(declare-fun res!892081 () Bool)

(assert (=> b!1344562 (=> (not res!892081) (not e!765245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91578 (_ BitVec 32)) Bool)

(assert (=> b!1344562 (= res!892081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344563 () Bool)

(declare-fun res!892084 () Bool)

(assert (=> b!1344563 (=> (not res!892084) (not e!765245))))

(assert (=> b!1344563 (= res!892084 (not (= (select (arr!44245 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1344564 () Bool)

(declare-fun res!892082 () Bool)

(assert (=> b!1344564 (=> (not res!892082) (not e!765245))))

(assert (=> b!1344564 (= res!892082 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!892088 () Bool)

(assert (=> start!113318 (=> (not res!892088) (not e!765245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113318 (= res!892088 (validMask!0 mask!1977))))

(assert (=> start!113318 e!765245))

(assert (=> start!113318 tp_is_empty!37369))

(assert (=> start!113318 true))

(declare-fun array_inv!33345 (array!91578) Bool)

(assert (=> start!113318 (array_inv!33345 _keys!1571)))

(declare-fun e!765248 () Bool)

(declare-fun array_inv!33346 (array!91580) Bool)

(assert (=> start!113318 (and (array_inv!33346 _values!1303) e!765248)))

(assert (=> start!113318 tp!109911))

(declare-fun b!1344565 () Bool)

(assert (=> b!1344565 (= e!765248 (and e!765247 mapRes!57760))))

(declare-fun condMapEmpty!57760 () Bool)

(declare-fun mapDefault!57760 () ValueCell!17786)

