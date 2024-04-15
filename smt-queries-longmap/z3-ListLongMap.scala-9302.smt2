; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111160 () Bool)

(assert start!111160)

(declare-fun b_free!29995 () Bool)

(declare-fun b_next!29995 () Bool)

(assert (=> start!111160 (= b_free!29995 (not b_next!29995))))

(declare-fun tp!105307 () Bool)

(declare-fun b_and!48185 () Bool)

(assert (=> start!111160 (= tp!105307 b_and!48185)))

(declare-fun b!1316088 () Bool)

(declare-fun res!873696 () Bool)

(declare-fun e!750793 () Bool)

(assert (=> b!1316088 (=> (not res!873696) (not e!750793))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88317 0))(
  ( (array!88318 (arr!42639 (Array (_ BitVec 32) (_ BitVec 64))) (size!43191 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88317)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52737 0))(
  ( (V!52738 (val!17937 Int)) )
))
(declare-fun minValue!1296 () V!52737)

(declare-datatypes ((ValueCell!16964 0))(
  ( (ValueCellFull!16964 (v!20563 V!52737)) (EmptyCell!16964) )
))
(declare-datatypes ((array!88319 0))(
  ( (array!88320 (arr!42640 (Array (_ BitVec 32) ValueCell!16964)) (size!43192 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88319)

(declare-fun zeroValue!1296 () V!52737)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23226 0))(
  ( (tuple2!23227 (_1!11624 (_ BitVec 64)) (_2!11624 V!52737)) )
))
(declare-datatypes ((List!30342 0))(
  ( (Nil!30339) (Cons!30338 (h!31547 tuple2!23226) (t!43940 List!30342)) )
))
(declare-datatypes ((ListLongMap!20883 0))(
  ( (ListLongMap!20884 (toList!10457 List!30342)) )
))
(declare-fun contains!8534 (ListLongMap!20883 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5352 (array!88317 array!88319 (_ BitVec 32) (_ BitVec 32) V!52737 V!52737 (_ BitVec 32) Int) ListLongMap!20883)

(assert (=> b!1316088 (= res!873696 (contains!8534 (getCurrentListMap!5352 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316089 () Bool)

(declare-fun res!873703 () Bool)

(assert (=> b!1316089 (=> (not res!873703) (not e!750793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88317 (_ BitVec 32)) Bool)

(assert (=> b!1316089 (= res!873703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316090 () Bool)

(declare-fun e!750792 () Bool)

(declare-fun tp_is_empty!35725 () Bool)

(assert (=> b!1316090 (= e!750792 tp_is_empty!35725)))

(declare-fun b!1316091 () Bool)

(declare-fun res!873697 () Bool)

(assert (=> b!1316091 (=> (not res!873697) (not e!750793))))

(assert (=> b!1316091 (= res!873697 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43191 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316092 () Bool)

(declare-fun e!750790 () Bool)

(declare-fun e!750791 () Bool)

(declare-fun mapRes!55216 () Bool)

(assert (=> b!1316092 (= e!750790 (and e!750791 mapRes!55216))))

(declare-fun condMapEmpty!55216 () Bool)

(declare-fun mapDefault!55216 () ValueCell!16964)

(assert (=> b!1316092 (= condMapEmpty!55216 (= (arr!42640 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16964)) mapDefault!55216)))))

(declare-fun b!1316094 () Bool)

(declare-fun res!873699 () Bool)

(assert (=> b!1316094 (=> (not res!873699) (not e!750793))))

(assert (=> b!1316094 (= res!873699 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1316095 () Bool)

(declare-fun res!873698 () Bool)

(assert (=> b!1316095 (=> (not res!873698) (not e!750793))))

(assert (=> b!1316095 (= res!873698 (not (= (select (arr!42639 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1316096 () Bool)

(declare-fun res!873702 () Bool)

(assert (=> b!1316096 (=> (not res!873702) (not e!750793))))

(declare-datatypes ((List!30343 0))(
  ( (Nil!30340) (Cons!30339 (h!31548 (_ BitVec 64)) (t!43941 List!30343)) )
))
(declare-fun arrayNoDuplicates!0 (array!88317 (_ BitVec 32) List!30343) Bool)

(assert (=> b!1316096 (= res!873702 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30340))))

(declare-fun b!1316097 () Bool)

(assert (=> b!1316097 (= e!750791 tp_is_empty!35725)))

(declare-fun b!1316098 () Bool)

(declare-fun res!873700 () Bool)

(assert (=> b!1316098 (=> (not res!873700) (not e!750793))))

(assert (=> b!1316098 (= res!873700 (and (= (size!43192 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43191 _keys!1628) (size!43192 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55216 () Bool)

(assert (=> mapIsEmpty!55216 mapRes!55216))

(declare-fun b!1316093 () Bool)

(declare-fun res!873695 () Bool)

(assert (=> b!1316093 (=> (not res!873695) (not e!750793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316093 (= res!873695 (validKeyInArray!0 (select (arr!42639 _keys!1628) from!2020)))))

(declare-fun res!873701 () Bool)

(assert (=> start!111160 (=> (not res!873701) (not e!750793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111160 (= res!873701 (validMask!0 mask!2040))))

(assert (=> start!111160 e!750793))

(assert (=> start!111160 tp!105307))

(declare-fun array_inv!32383 (array!88317) Bool)

(assert (=> start!111160 (array_inv!32383 _keys!1628)))

(assert (=> start!111160 true))

(assert (=> start!111160 tp_is_empty!35725))

(declare-fun array_inv!32384 (array!88319) Bool)

(assert (=> start!111160 (and (array_inv!32384 _values!1354) e!750790)))

(declare-fun mapNonEmpty!55216 () Bool)

(declare-fun tp!105308 () Bool)

(assert (=> mapNonEmpty!55216 (= mapRes!55216 (and tp!105308 e!750792))))

(declare-fun mapValue!55216 () ValueCell!16964)

(declare-fun mapRest!55216 () (Array (_ BitVec 32) ValueCell!16964))

(declare-fun mapKey!55216 () (_ BitVec 32))

(assert (=> mapNonEmpty!55216 (= (arr!42640 _values!1354) (store mapRest!55216 mapKey!55216 mapValue!55216))))

(declare-fun b!1316099 () Bool)

(assert (=> b!1316099 (= e!750793 (not true))))

(assert (=> b!1316099 (contains!8534 (getCurrentListMap!5352 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43227 0))(
  ( (Unit!43228) )
))
(declare-fun lt!585816 () Unit!43227)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!21 (array!88317 array!88319 (_ BitVec 32) (_ BitVec 32) V!52737 V!52737 (_ BitVec 64) (_ BitVec 32) Int) Unit!43227)

(assert (=> b!1316099 (= lt!585816 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!21 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(assert (= (and start!111160 res!873701) b!1316098))

(assert (= (and b!1316098 res!873700) b!1316089))

(assert (= (and b!1316089 res!873703) b!1316096))

(assert (= (and b!1316096 res!873702) b!1316091))

(assert (= (and b!1316091 res!873697) b!1316088))

(assert (= (and b!1316088 res!873696) b!1316095))

(assert (= (and b!1316095 res!873698) b!1316093))

(assert (= (and b!1316093 res!873695) b!1316094))

(assert (= (and b!1316094 res!873699) b!1316099))

(assert (= (and b!1316092 condMapEmpty!55216) mapIsEmpty!55216))

(assert (= (and b!1316092 (not condMapEmpty!55216)) mapNonEmpty!55216))

(get-info :version)

(assert (= (and mapNonEmpty!55216 ((_ is ValueCellFull!16964) mapValue!55216)) b!1316090))

(assert (= (and b!1316092 ((_ is ValueCellFull!16964) mapDefault!55216)) b!1316097))

(assert (= start!111160 b!1316092))

(declare-fun m!1203591 () Bool)

(assert (=> b!1316095 m!1203591))

(assert (=> b!1316093 m!1203591))

(assert (=> b!1316093 m!1203591))

(declare-fun m!1203593 () Bool)

(assert (=> b!1316093 m!1203593))

(declare-fun m!1203595 () Bool)

(assert (=> b!1316088 m!1203595))

(assert (=> b!1316088 m!1203595))

(declare-fun m!1203597 () Bool)

(assert (=> b!1316088 m!1203597))

(declare-fun m!1203599 () Bool)

(assert (=> b!1316096 m!1203599))

(declare-fun m!1203601 () Bool)

(assert (=> b!1316089 m!1203601))

(declare-fun m!1203603 () Bool)

(assert (=> mapNonEmpty!55216 m!1203603))

(declare-fun m!1203605 () Bool)

(assert (=> start!111160 m!1203605))

(declare-fun m!1203607 () Bool)

(assert (=> start!111160 m!1203607))

(declare-fun m!1203609 () Bool)

(assert (=> start!111160 m!1203609))

(declare-fun m!1203611 () Bool)

(assert (=> b!1316099 m!1203611))

(assert (=> b!1316099 m!1203611))

(declare-fun m!1203613 () Bool)

(assert (=> b!1316099 m!1203613))

(declare-fun m!1203615 () Bool)

(assert (=> b!1316099 m!1203615))

(check-sat (not b!1316089) (not b!1316093) (not b!1316088) (not start!111160) tp_is_empty!35725 (not b!1316099) (not b!1316096) b_and!48185 (not b_next!29995) (not mapNonEmpty!55216))
(check-sat b_and!48185 (not b_next!29995))
