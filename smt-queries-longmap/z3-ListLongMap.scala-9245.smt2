; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110820 () Bool)

(assert start!110820)

(declare-fun b_free!29655 () Bool)

(declare-fun b_next!29655 () Bool)

(assert (=> start!110820 (= b_free!29655 (not b_next!29655))))

(declare-fun tp!104286 () Bool)

(declare-fun b_and!47863 () Bool)

(assert (=> start!110820 (= tp!104286 b_and!47863)))

(declare-fun b!1311703 () Bool)

(declare-fun e!748275 () Bool)

(declare-fun tp_is_empty!35385 () Bool)

(assert (=> b!1311703 (= e!748275 tp_is_empty!35385)))

(declare-fun b!1311704 () Bool)

(declare-fun e!748274 () Bool)

(assert (=> b!1311704 (= e!748274 tp_is_empty!35385)))

(declare-fun b!1311705 () Bool)

(declare-fun res!870801 () Bool)

(declare-fun e!748273 () Bool)

(assert (=> b!1311705 (=> (not res!870801) (not e!748273))))

(declare-datatypes ((array!87758 0))(
  ( (array!87759 (arr!42359 (Array (_ BitVec 32) (_ BitVec 64))) (size!42909 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87758)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1311705 (= res!870801 (not (= (select (arr!42359 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311706 () Bool)

(assert (=> b!1311706 (= e!748273 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52283 0))(
  ( (V!52284 (val!17767 Int)) )
))
(declare-fun minValue!1296 () V!52283)

(declare-datatypes ((ValueCell!16794 0))(
  ( (ValueCellFull!16794 (v!20394 V!52283)) (EmptyCell!16794) )
))
(declare-datatypes ((array!87760 0))(
  ( (array!87761 (arr!42360 (Array (_ BitVec 32) ValueCell!16794)) (size!42910 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87760)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52283)

(declare-datatypes ((tuple2!22898 0))(
  ( (tuple2!22899 (_1!11460 (_ BitVec 64)) (_2!11460 V!52283)) )
))
(declare-datatypes ((List!30037 0))(
  ( (Nil!30034) (Cons!30033 (h!31242 tuple2!22898) (t!43643 List!30037)) )
))
(declare-datatypes ((ListLongMap!20555 0))(
  ( (ListLongMap!20556 (toList!10293 List!30037)) )
))
(declare-fun contains!8443 (ListLongMap!20555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5306 (array!87758 array!87760 (_ BitVec 32) (_ BitVec 32) V!52283 V!52283 (_ BitVec 32) Int) ListLongMap!20555)

(assert (=> b!1311706 (contains!8443 (getCurrentListMap!5306 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43352 0))(
  ( (Unit!43353) )
))
(declare-fun lt!585501 () Unit!43352)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!3 (array!87758 array!87760 (_ BitVec 32) (_ BitVec 32) V!52283 V!52283 (_ BitVec 64) (_ BitVec 32) Int) Unit!43352)

(assert (=> b!1311706 (= lt!585501 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!3 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311707 () Bool)

(declare-fun res!870802 () Bool)

(assert (=> b!1311707 (=> (not res!870802) (not e!748273))))

(assert (=> b!1311707 (= res!870802 (contains!8443 (getCurrentListMap!5306 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311708 () Bool)

(declare-fun res!870804 () Bool)

(assert (=> b!1311708 (=> (not res!870804) (not e!748273))))

(assert (=> b!1311708 (= res!870804 (and (= (size!42910 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42909 _keys!1628) (size!42910 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311710 () Bool)

(declare-fun res!870807 () Bool)

(assert (=> b!1311710 (=> (not res!870807) (not e!748273))))

(assert (=> b!1311710 (= res!870807 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42909 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311711 () Bool)

(declare-fun res!870806 () Bool)

(assert (=> b!1311711 (=> (not res!870806) (not e!748273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87758 (_ BitVec 32)) Bool)

(assert (=> b!1311711 (= res!870806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54706 () Bool)

(declare-fun mapRes!54706 () Bool)

(assert (=> mapIsEmpty!54706 mapRes!54706))

(declare-fun mapNonEmpty!54706 () Bool)

(declare-fun tp!104287 () Bool)

(assert (=> mapNonEmpty!54706 (= mapRes!54706 (and tp!104287 e!748274))))

(declare-fun mapValue!54706 () ValueCell!16794)

(declare-fun mapKey!54706 () (_ BitVec 32))

(declare-fun mapRest!54706 () (Array (_ BitVec 32) ValueCell!16794))

(assert (=> mapNonEmpty!54706 (= (arr!42360 _values!1354) (store mapRest!54706 mapKey!54706 mapValue!54706))))

(declare-fun b!1311712 () Bool)

(declare-fun res!870800 () Bool)

(assert (=> b!1311712 (=> (not res!870800) (not e!748273))))

(assert (=> b!1311712 (= res!870800 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!870803 () Bool)

(assert (=> start!110820 (=> (not res!870803) (not e!748273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110820 (= res!870803 (validMask!0 mask!2040))))

(assert (=> start!110820 e!748273))

(assert (=> start!110820 tp!104286))

(declare-fun array_inv!32011 (array!87758) Bool)

(assert (=> start!110820 (array_inv!32011 _keys!1628)))

(assert (=> start!110820 true))

(assert (=> start!110820 tp_is_empty!35385))

(declare-fun e!748277 () Bool)

(declare-fun array_inv!32012 (array!87760) Bool)

(assert (=> start!110820 (and (array_inv!32012 _values!1354) e!748277)))

(declare-fun b!1311709 () Bool)

(assert (=> b!1311709 (= e!748277 (and e!748275 mapRes!54706))))

(declare-fun condMapEmpty!54706 () Bool)

(declare-fun mapDefault!54706 () ValueCell!16794)

(assert (=> b!1311709 (= condMapEmpty!54706 (= (arr!42360 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16794)) mapDefault!54706)))))

(declare-fun b!1311713 () Bool)

(declare-fun res!870799 () Bool)

(assert (=> b!1311713 (=> (not res!870799) (not e!748273))))

(declare-datatypes ((List!30038 0))(
  ( (Nil!30035) (Cons!30034 (h!31243 (_ BitVec 64)) (t!43644 List!30038)) )
))
(declare-fun arrayNoDuplicates!0 (array!87758 (_ BitVec 32) List!30038) Bool)

(assert (=> b!1311713 (= res!870799 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30035))))

(declare-fun b!1311714 () Bool)

(declare-fun res!870805 () Bool)

(assert (=> b!1311714 (=> (not res!870805) (not e!748273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311714 (= res!870805 (validKeyInArray!0 (select (arr!42359 _keys!1628) from!2020)))))

(assert (= (and start!110820 res!870803) b!1311708))

(assert (= (and b!1311708 res!870804) b!1311711))

(assert (= (and b!1311711 res!870806) b!1311713))

(assert (= (and b!1311713 res!870799) b!1311710))

(assert (= (and b!1311710 res!870807) b!1311707))

(assert (= (and b!1311707 res!870802) b!1311705))

(assert (= (and b!1311705 res!870801) b!1311714))

(assert (= (and b!1311714 res!870805) b!1311712))

(assert (= (and b!1311712 res!870800) b!1311706))

(assert (= (and b!1311709 condMapEmpty!54706) mapIsEmpty!54706))

(assert (= (and b!1311709 (not condMapEmpty!54706)) mapNonEmpty!54706))

(get-info :version)

(assert (= (and mapNonEmpty!54706 ((_ is ValueCellFull!16794) mapValue!54706)) b!1311704))

(assert (= (and b!1311709 ((_ is ValueCellFull!16794) mapDefault!54706)) b!1311703))

(assert (= start!110820 b!1311709))

(declare-fun m!1201085 () Bool)

(assert (=> b!1311707 m!1201085))

(assert (=> b!1311707 m!1201085))

(declare-fun m!1201087 () Bool)

(assert (=> b!1311707 m!1201087))

(declare-fun m!1201089 () Bool)

(assert (=> b!1311713 m!1201089))

(declare-fun m!1201091 () Bool)

(assert (=> b!1311706 m!1201091))

(assert (=> b!1311706 m!1201091))

(declare-fun m!1201093 () Bool)

(assert (=> b!1311706 m!1201093))

(declare-fun m!1201095 () Bool)

(assert (=> b!1311706 m!1201095))

(declare-fun m!1201097 () Bool)

(assert (=> b!1311711 m!1201097))

(declare-fun m!1201099 () Bool)

(assert (=> b!1311705 m!1201099))

(declare-fun m!1201101 () Bool)

(assert (=> mapNonEmpty!54706 m!1201101))

(declare-fun m!1201103 () Bool)

(assert (=> start!110820 m!1201103))

(declare-fun m!1201105 () Bool)

(assert (=> start!110820 m!1201105))

(declare-fun m!1201107 () Bool)

(assert (=> start!110820 m!1201107))

(assert (=> b!1311714 m!1201099))

(assert (=> b!1311714 m!1201099))

(declare-fun m!1201109 () Bool)

(assert (=> b!1311714 m!1201109))

(check-sat (not b!1311714) b_and!47863 (not b!1311707) (not b!1311711) tp_is_empty!35385 (not b!1311713) (not start!110820) (not b!1311706) (not b_next!29655) (not mapNonEmpty!54706))
(check-sat b_and!47863 (not b_next!29655))
