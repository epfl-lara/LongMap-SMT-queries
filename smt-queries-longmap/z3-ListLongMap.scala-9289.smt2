; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111082 () Bool)

(assert start!111082)

(declare-fun b_free!29917 () Bool)

(declare-fun b_next!29917 () Bool)

(assert (=> start!111082 (= b_free!29917 (not b_next!29917))))

(declare-fun tp!105074 () Bool)

(declare-fun b_and!48107 () Bool)

(assert (=> start!111082 (= tp!105074 b_and!48107)))

(declare-fun b!1315116 () Bool)

(declare-fun e!750205 () Bool)

(declare-fun tp_is_empty!35647 () Bool)

(assert (=> b!1315116 (= e!750205 tp_is_empty!35647)))

(declare-fun b!1315117 () Bool)

(declare-fun e!750208 () Bool)

(assert (=> b!1315117 (= e!750208 tp_is_empty!35647)))

(declare-fun b!1315118 () Bool)

(declare-fun res!873078 () Bool)

(declare-fun e!750209 () Bool)

(assert (=> b!1315118 (=> (not res!873078) (not e!750209))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88167 0))(
  ( (array!88168 (arr!42564 (Array (_ BitVec 32) (_ BitVec 64))) (size!43116 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88167)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52633 0))(
  ( (V!52634 (val!17898 Int)) )
))
(declare-fun minValue!1296 () V!52633)

(declare-datatypes ((ValueCell!16925 0))(
  ( (ValueCellFull!16925 (v!20524 V!52633)) (EmptyCell!16925) )
))
(declare-datatypes ((array!88169 0))(
  ( (array!88170 (arr!42565 (Array (_ BitVec 32) ValueCell!16925)) (size!43117 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88169)

(declare-fun zeroValue!1296 () V!52633)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23174 0))(
  ( (tuple2!23175 (_1!11598 (_ BitVec 64)) (_2!11598 V!52633)) )
))
(declare-datatypes ((List!30289 0))(
  ( (Nil!30286) (Cons!30285 (h!31494 tuple2!23174) (t!43887 List!30289)) )
))
(declare-datatypes ((ListLongMap!20831 0))(
  ( (ListLongMap!20832 (toList!10431 List!30289)) )
))
(declare-fun contains!8508 (ListLongMap!20831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5326 (array!88167 array!88169 (_ BitVec 32) (_ BitVec 32) V!52633 V!52633 (_ BitVec 32) Int) ListLongMap!20831)

(assert (=> b!1315118 (= res!873078 (contains!8508 (getCurrentListMap!5326 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315120 () Bool)

(declare-fun res!873074 () Bool)

(assert (=> b!1315120 (=> (not res!873074) (not e!750209))))

(assert (=> b!1315120 (= res!873074 (not (= (select (arr!42564 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!55099 () Bool)

(declare-fun mapRes!55099 () Bool)

(assert (=> mapIsEmpty!55099 mapRes!55099))

(declare-fun b!1315121 () Bool)

(declare-fun res!873076 () Bool)

(assert (=> b!1315121 (=> (not res!873076) (not e!750209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88167 (_ BitVec 32)) Bool)

(assert (=> b!1315121 (= res!873076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315122 () Bool)

(declare-fun e!750206 () Bool)

(assert (=> b!1315122 (= e!750206 (and e!750208 mapRes!55099))))

(declare-fun condMapEmpty!55099 () Bool)

(declare-fun mapDefault!55099 () ValueCell!16925)

(assert (=> b!1315122 (= condMapEmpty!55099 (= (arr!42565 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16925)) mapDefault!55099)))))

(declare-fun mapNonEmpty!55099 () Bool)

(declare-fun tp!105073 () Bool)

(assert (=> mapNonEmpty!55099 (= mapRes!55099 (and tp!105073 e!750205))))

(declare-fun mapRest!55099 () (Array (_ BitVec 32) ValueCell!16925))

(declare-fun mapKey!55099 () (_ BitVec 32))

(declare-fun mapValue!55099 () ValueCell!16925)

(assert (=> mapNonEmpty!55099 (= (arr!42565 _values!1354) (store mapRest!55099 mapKey!55099 mapValue!55099))))

(declare-fun b!1315123 () Bool)

(declare-fun res!873080 () Bool)

(assert (=> b!1315123 (=> (not res!873080) (not e!750209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1315123 (= res!873080 (validKeyInArray!0 (select (arr!42564 _keys!1628) from!2020)))))

(declare-fun b!1315124 () Bool)

(declare-fun res!873082 () Bool)

(assert (=> b!1315124 (=> (not res!873082) (not e!750209))))

(assert (=> b!1315124 (= res!873082 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1315125 () Bool)

(assert (=> b!1315125 (= e!750209 (not true))))

(assert (=> b!1315125 (contains!8508 (getCurrentListMap!5326 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43225 0))(
  ( (Unit!43226) )
))
(declare-fun lt!585699 () Unit!43225)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!17 (array!88167 array!88169 (_ BitVec 32) (_ BitVec 32) V!52633 V!52633 (_ BitVec 64) (_ BitVec 32) Int) Unit!43225)

(assert (=> b!1315125 (= lt!585699 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!17 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1315119 () Bool)

(declare-fun res!873077 () Bool)

(assert (=> b!1315119 (=> (not res!873077) (not e!750209))))

(assert (=> b!1315119 (= res!873077 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43116 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!873075 () Bool)

(assert (=> start!111082 (=> (not res!873075) (not e!750209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111082 (= res!873075 (validMask!0 mask!2040))))

(assert (=> start!111082 e!750209))

(assert (=> start!111082 tp!105074))

(declare-fun array_inv!32335 (array!88167) Bool)

(assert (=> start!111082 (array_inv!32335 _keys!1628)))

(assert (=> start!111082 true))

(assert (=> start!111082 tp_is_empty!35647))

(declare-fun array_inv!32336 (array!88169) Bool)

(assert (=> start!111082 (and (array_inv!32336 _values!1354) e!750206)))

(declare-fun b!1315126 () Bool)

(declare-fun res!873079 () Bool)

(assert (=> b!1315126 (=> (not res!873079) (not e!750209))))

(declare-datatypes ((List!30290 0))(
  ( (Nil!30287) (Cons!30286 (h!31495 (_ BitVec 64)) (t!43888 List!30290)) )
))
(declare-fun arrayNoDuplicates!0 (array!88167 (_ BitVec 32) List!30290) Bool)

(assert (=> b!1315126 (= res!873079 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30287))))

(declare-fun b!1315127 () Bool)

(declare-fun res!873081 () Bool)

(assert (=> b!1315127 (=> (not res!873081) (not e!750209))))

(assert (=> b!1315127 (= res!873081 (and (= (size!43117 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43116 _keys!1628) (size!43117 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111082 res!873075) b!1315127))

(assert (= (and b!1315127 res!873081) b!1315121))

(assert (= (and b!1315121 res!873076) b!1315126))

(assert (= (and b!1315126 res!873079) b!1315119))

(assert (= (and b!1315119 res!873077) b!1315118))

(assert (= (and b!1315118 res!873078) b!1315120))

(assert (= (and b!1315120 res!873074) b!1315123))

(assert (= (and b!1315123 res!873080) b!1315124))

(assert (= (and b!1315124 res!873082) b!1315125))

(assert (= (and b!1315122 condMapEmpty!55099) mapIsEmpty!55099))

(assert (= (and b!1315122 (not condMapEmpty!55099)) mapNonEmpty!55099))

(get-info :version)

(assert (= (and mapNonEmpty!55099 ((_ is ValueCellFull!16925) mapValue!55099)) b!1315116))

(assert (= (and b!1315122 ((_ is ValueCellFull!16925) mapDefault!55099)) b!1315117))

(assert (= start!111082 b!1315122))

(declare-fun m!1202937 () Bool)

(assert (=> mapNonEmpty!55099 m!1202937))

(declare-fun m!1202939 () Bool)

(assert (=> b!1315123 m!1202939))

(assert (=> b!1315123 m!1202939))

(declare-fun m!1202941 () Bool)

(assert (=> b!1315123 m!1202941))

(declare-fun m!1202943 () Bool)

(assert (=> start!111082 m!1202943))

(declare-fun m!1202945 () Bool)

(assert (=> start!111082 m!1202945))

(declare-fun m!1202947 () Bool)

(assert (=> start!111082 m!1202947))

(declare-fun m!1202949 () Bool)

(assert (=> b!1315118 m!1202949))

(assert (=> b!1315118 m!1202949))

(declare-fun m!1202951 () Bool)

(assert (=> b!1315118 m!1202951))

(assert (=> b!1315120 m!1202939))

(declare-fun m!1202953 () Bool)

(assert (=> b!1315121 m!1202953))

(declare-fun m!1202955 () Bool)

(assert (=> b!1315125 m!1202955))

(assert (=> b!1315125 m!1202955))

(declare-fun m!1202957 () Bool)

(assert (=> b!1315125 m!1202957))

(declare-fun m!1202959 () Bool)

(assert (=> b!1315125 m!1202959))

(declare-fun m!1202961 () Bool)

(assert (=> b!1315126 m!1202961))

(check-sat (not b!1315126) (not start!111082) (not mapNonEmpty!55099) (not b!1315123) (not b!1315118) (not b!1315125) (not b!1315121) tp_is_empty!35647 b_and!48107 (not b_next!29917))
(check-sat b_and!48107 (not b_next!29917))
