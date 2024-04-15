; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111764 () Bool)

(assert start!111764)

(declare-fun b_free!30421 () Bool)

(declare-fun b_next!30421 () Bool)

(assert (=> start!111764 (= b_free!30421 (not b_next!30421))))

(declare-fun tp!106739 () Bool)

(declare-fun b_and!48941 () Bool)

(assert (=> start!111764 (= tp!106739 b_and!48941)))

(declare-fun b!1324278 () Bool)

(declare-fun res!879005 () Bool)

(declare-fun e!754966 () Bool)

(assert (=> b!1324278 (=> (not res!879005) (not e!754966))))

(declare-datatypes ((array!89325 0))(
  ( (array!89326 (arr!43137 (Array (_ BitVec 32) (_ BitVec 64))) (size!43689 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89325)

(declare-datatypes ((List!30660 0))(
  ( (Nil!30657) (Cons!30656 (h!31865 (_ BitVec 64)) (t!44578 List!30660)) )
))
(declare-fun arrayNoDuplicates!0 (array!89325 (_ BitVec 32) List!30660) Bool)

(assert (=> b!1324278 (= res!879005 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30657))))

(declare-fun b!1324279 () Bool)

(declare-fun e!754964 () Bool)

(declare-fun tp_is_empty!36241 () Bool)

(assert (=> b!1324279 (= e!754964 tp_is_empty!36241)))

(declare-fun b!1324280 () Bool)

(declare-fun res!879009 () Bool)

(assert (=> b!1324280 (=> (not res!879009) (not e!754966))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89325 (_ BitVec 32)) Bool)

(assert (=> b!1324280 (= res!879009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324281 () Bool)

(declare-fun res!879006 () Bool)

(assert (=> b!1324281 (=> (not res!879006) (not e!754966))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1324281 (= res!879006 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43689 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56009 () Bool)

(declare-fun mapRes!56009 () Bool)

(declare-fun tp!106740 () Bool)

(declare-fun e!754962 () Bool)

(assert (=> mapNonEmpty!56009 (= mapRes!56009 (and tp!106740 e!754962))))

(declare-fun mapKey!56009 () (_ BitVec 32))

(declare-datatypes ((V!53425 0))(
  ( (V!53426 (val!18195 Int)) )
))
(declare-datatypes ((ValueCell!17222 0))(
  ( (ValueCellFull!17222 (v!20824 V!53425)) (EmptyCell!17222) )
))
(declare-fun mapRest!56009 () (Array (_ BitVec 32) ValueCell!17222))

(declare-datatypes ((array!89327 0))(
  ( (array!89328 (arr!43138 (Array (_ BitVec 32) ValueCell!17222)) (size!43690 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89327)

(declare-fun mapValue!56009 () ValueCell!17222)

(assert (=> mapNonEmpty!56009 (= (arr!43138 _values!1337) (store mapRest!56009 mapKey!56009 mapValue!56009))))

(declare-fun res!879008 () Bool)

(assert (=> start!111764 (=> (not res!879008) (not e!754966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111764 (= res!879008 (validMask!0 mask!2019))))

(assert (=> start!111764 e!754966))

(declare-fun array_inv!32747 (array!89325) Bool)

(assert (=> start!111764 (array_inv!32747 _keys!1609)))

(assert (=> start!111764 true))

(assert (=> start!111764 tp_is_empty!36241))

(declare-fun e!754963 () Bool)

(declare-fun array_inv!32748 (array!89327) Bool)

(assert (=> start!111764 (and (array_inv!32748 _values!1337) e!754963)))

(assert (=> start!111764 tp!106739))

(declare-fun b!1324282 () Bool)

(declare-fun res!879007 () Bool)

(assert (=> b!1324282 (=> (not res!879007) (not e!754966))))

(assert (=> b!1324282 (= res!879007 (and (= (size!43690 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43689 _keys!1609) (size!43690 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324283 () Bool)

(assert (=> b!1324283 (= e!754962 tp_is_empty!36241)))

(declare-fun b!1324284 () Bool)

(assert (=> b!1324284 (= e!754966 false)))

(declare-fun lt!589278 () Bool)

(declare-fun zeroValue!1279 () V!53425)

(declare-fun minValue!1279 () V!53425)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23528 0))(
  ( (tuple2!23529 (_1!11775 (_ BitVec 64)) (_2!11775 V!53425)) )
))
(declare-datatypes ((List!30661 0))(
  ( (Nil!30658) (Cons!30657 (h!31866 tuple2!23528) (t!44579 List!30661)) )
))
(declare-datatypes ((ListLongMap!21185 0))(
  ( (ListLongMap!21186 (toList!10608 List!30661)) )
))
(declare-fun contains!8691 (ListLongMap!21185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5487 (array!89325 array!89327 (_ BitVec 32) (_ BitVec 32) V!53425 V!53425 (_ BitVec 32) Int) ListLongMap!21185)

(assert (=> b!1324284 (= lt!589278 (contains!8691 (getCurrentListMap!5487 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!56009 () Bool)

(assert (=> mapIsEmpty!56009 mapRes!56009))

(declare-fun b!1324285 () Bool)

(assert (=> b!1324285 (= e!754963 (and e!754964 mapRes!56009))))

(declare-fun condMapEmpty!56009 () Bool)

(declare-fun mapDefault!56009 () ValueCell!17222)

(assert (=> b!1324285 (= condMapEmpty!56009 (= (arr!43138 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17222)) mapDefault!56009)))))

(assert (= (and start!111764 res!879008) b!1324282))

(assert (= (and b!1324282 res!879007) b!1324280))

(assert (= (and b!1324280 res!879009) b!1324278))

(assert (= (and b!1324278 res!879005) b!1324281))

(assert (= (and b!1324281 res!879006) b!1324284))

(assert (= (and b!1324285 condMapEmpty!56009) mapIsEmpty!56009))

(assert (= (and b!1324285 (not condMapEmpty!56009)) mapNonEmpty!56009))

(get-info :version)

(assert (= (and mapNonEmpty!56009 ((_ is ValueCellFull!17222) mapValue!56009)) b!1324283))

(assert (= (and b!1324285 ((_ is ValueCellFull!17222) mapDefault!56009)) b!1324279))

(assert (= start!111764 b!1324285))

(declare-fun m!1212723 () Bool)

(assert (=> start!111764 m!1212723))

(declare-fun m!1212725 () Bool)

(assert (=> start!111764 m!1212725))

(declare-fun m!1212727 () Bool)

(assert (=> start!111764 m!1212727))

(declare-fun m!1212729 () Bool)

(assert (=> b!1324278 m!1212729))

(declare-fun m!1212731 () Bool)

(assert (=> b!1324284 m!1212731))

(assert (=> b!1324284 m!1212731))

(declare-fun m!1212733 () Bool)

(assert (=> b!1324284 m!1212733))

(declare-fun m!1212735 () Bool)

(assert (=> b!1324280 m!1212735))

(declare-fun m!1212737 () Bool)

(assert (=> mapNonEmpty!56009 m!1212737))

(check-sat (not b!1324278) (not mapNonEmpty!56009) (not start!111764) (not b!1324280) b_and!48941 (not b_next!30421) tp_is_empty!36241 (not b!1324284))
(check-sat b_and!48941 (not b_next!30421))
