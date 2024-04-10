; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111754 () Bool)

(assert start!111754)

(declare-fun b_free!30411 () Bool)

(declare-fun b_next!30411 () Bool)

(assert (=> start!111754 (= b_free!30411 (not b_next!30411))))

(declare-fun tp!106709 () Bool)

(declare-fun b_and!48949 () Bool)

(assert (=> start!111754 (= tp!106709 b_and!48949)))

(declare-fun res!878960 () Bool)

(declare-fun e!754920 () Bool)

(assert (=> start!111754 (=> (not res!878960) (not e!754920))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111754 (= res!878960 (validMask!0 mask!2019))))

(assert (=> start!111754 e!754920))

(declare-datatypes ((array!89378 0))(
  ( (array!89379 (arr!43163 (Array (_ BitVec 32) (_ BitVec 64))) (size!43713 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89378)

(declare-fun array_inv!32583 (array!89378) Bool)

(assert (=> start!111754 (array_inv!32583 _keys!1609)))

(assert (=> start!111754 true))

(declare-fun tp_is_empty!36231 () Bool)

(assert (=> start!111754 tp_is_empty!36231))

(declare-datatypes ((V!53411 0))(
  ( (V!53412 (val!18190 Int)) )
))
(declare-datatypes ((ValueCell!17217 0))(
  ( (ValueCellFull!17217 (v!20820 V!53411)) (EmptyCell!17217) )
))
(declare-datatypes ((array!89380 0))(
  ( (array!89381 (arr!43164 (Array (_ BitVec 32) ValueCell!17217)) (size!43714 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89380)

(declare-fun e!754921 () Bool)

(declare-fun array_inv!32584 (array!89380) Bool)

(assert (=> start!111754 (and (array_inv!32584 _values!1337) e!754921)))

(assert (=> start!111754 tp!106709))

(declare-fun b!1324228 () Bool)

(declare-fun e!754924 () Bool)

(declare-fun mapRes!55994 () Bool)

(assert (=> b!1324228 (= e!754921 (and e!754924 mapRes!55994))))

(declare-fun condMapEmpty!55994 () Bool)

(declare-fun mapDefault!55994 () ValueCell!17217)

(assert (=> b!1324228 (= condMapEmpty!55994 (= (arr!43164 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17217)) mapDefault!55994)))))

(declare-fun b!1324229 () Bool)

(declare-fun res!878961 () Bool)

(assert (=> b!1324229 (=> (not res!878961) (not e!754920))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1324229 (= res!878961 (and (= (size!43714 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43713 _keys!1609) (size!43714 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324230 () Bool)

(declare-fun res!878959 () Bool)

(assert (=> b!1324230 (=> (not res!878959) (not e!754920))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324230 (= res!878959 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43713 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324231 () Bool)

(declare-fun e!754923 () Bool)

(assert (=> b!1324231 (= e!754923 tp_is_empty!36231)))

(declare-fun b!1324232 () Bool)

(assert (=> b!1324232 (= e!754920 false)))

(declare-fun zeroValue!1279 () V!53411)

(declare-fun minValue!1279 () V!53411)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589449 () Bool)

(declare-datatypes ((tuple2!23456 0))(
  ( (tuple2!23457 (_1!11739 (_ BitVec 64)) (_2!11739 V!53411)) )
))
(declare-datatypes ((List!30597 0))(
  ( (Nil!30594) (Cons!30593 (h!31802 tuple2!23456) (t!44523 List!30597)) )
))
(declare-datatypes ((ListLongMap!21113 0))(
  ( (ListLongMap!21114 (toList!10572 List!30597)) )
))
(declare-fun contains!8727 (ListLongMap!21113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5568 (array!89378 array!89380 (_ BitVec 32) (_ BitVec 32) V!53411 V!53411 (_ BitVec 32) Int) ListLongMap!21113)

(assert (=> b!1324232 (= lt!589449 (contains!8727 (getCurrentListMap!5568 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324233 () Bool)

(assert (=> b!1324233 (= e!754924 tp_is_empty!36231)))

(declare-fun b!1324234 () Bool)

(declare-fun res!878963 () Bool)

(assert (=> b!1324234 (=> (not res!878963) (not e!754920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89378 (_ BitVec 32)) Bool)

(assert (=> b!1324234 (= res!878963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55994 () Bool)

(declare-fun tp!106708 () Bool)

(assert (=> mapNonEmpty!55994 (= mapRes!55994 (and tp!106708 e!754923))))

(declare-fun mapRest!55994 () (Array (_ BitVec 32) ValueCell!17217))

(declare-fun mapKey!55994 () (_ BitVec 32))

(declare-fun mapValue!55994 () ValueCell!17217)

(assert (=> mapNonEmpty!55994 (= (arr!43164 _values!1337) (store mapRest!55994 mapKey!55994 mapValue!55994))))

(declare-fun mapIsEmpty!55994 () Bool)

(assert (=> mapIsEmpty!55994 mapRes!55994))

(declare-fun b!1324235 () Bool)

(declare-fun res!878962 () Bool)

(assert (=> b!1324235 (=> (not res!878962) (not e!754920))))

(declare-datatypes ((List!30598 0))(
  ( (Nil!30595) (Cons!30594 (h!31803 (_ BitVec 64)) (t!44524 List!30598)) )
))
(declare-fun arrayNoDuplicates!0 (array!89378 (_ BitVec 32) List!30598) Bool)

(assert (=> b!1324235 (= res!878962 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30595))))

(assert (= (and start!111754 res!878960) b!1324229))

(assert (= (and b!1324229 res!878961) b!1324234))

(assert (= (and b!1324234 res!878963) b!1324235))

(assert (= (and b!1324235 res!878962) b!1324230))

(assert (= (and b!1324230 res!878959) b!1324232))

(assert (= (and b!1324228 condMapEmpty!55994) mapIsEmpty!55994))

(assert (= (and b!1324228 (not condMapEmpty!55994)) mapNonEmpty!55994))

(get-info :version)

(assert (= (and mapNonEmpty!55994 ((_ is ValueCellFull!17217) mapValue!55994)) b!1324231))

(assert (= (and b!1324228 ((_ is ValueCellFull!17217) mapDefault!55994)) b!1324233))

(assert (= start!111754 b!1324228))

(declare-fun m!1213159 () Bool)

(assert (=> mapNonEmpty!55994 m!1213159))

(declare-fun m!1213161 () Bool)

(assert (=> b!1324235 m!1213161))

(declare-fun m!1213163 () Bool)

(assert (=> start!111754 m!1213163))

(declare-fun m!1213165 () Bool)

(assert (=> start!111754 m!1213165))

(declare-fun m!1213167 () Bool)

(assert (=> start!111754 m!1213167))

(declare-fun m!1213169 () Bool)

(assert (=> b!1324234 m!1213169))

(declare-fun m!1213171 () Bool)

(assert (=> b!1324232 m!1213171))

(assert (=> b!1324232 m!1213171))

(declare-fun m!1213173 () Bool)

(assert (=> b!1324232 m!1213173))

(check-sat (not mapNonEmpty!55994) tp_is_empty!36231 b_and!48949 (not b_next!30411) (not b!1324232) (not b!1324235) (not start!111754) (not b!1324234))
(check-sat b_and!48949 (not b_next!30411))
