; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111054 () Bool)

(assert start!111054)

(declare-fun b_free!29665 () Bool)

(declare-fun b_next!29665 () Bool)

(assert (=> start!111054 (= b_free!29665 (not b_next!29665))))

(declare-fun tp!104317 () Bool)

(declare-fun b_and!47875 () Bool)

(assert (=> start!111054 (= tp!104317 b_and!47875)))

(declare-fun b!1313182 () Bool)

(declare-fun res!871455 () Bool)

(declare-fun e!749193 () Bool)

(assert (=> b!1313182 (=> (not res!871455) (not e!749193))))

(declare-datatypes ((array!87827 0))(
  ( (array!87828 (arr!42389 (Array (_ BitVec 32) (_ BitVec 64))) (size!42940 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87827)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313182 (= res!871455 (not (= (select (arr!42389 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapNonEmpty!54721 () Bool)

(declare-fun mapRes!54721 () Bool)

(declare-fun tp!104316 () Bool)

(declare-fun e!749195 () Bool)

(assert (=> mapNonEmpty!54721 (= mapRes!54721 (and tp!104316 e!749195))))

(declare-datatypes ((V!52297 0))(
  ( (V!52298 (val!17772 Int)) )
))
(declare-datatypes ((ValueCell!16799 0))(
  ( (ValueCellFull!16799 (v!20394 V!52297)) (EmptyCell!16799) )
))
(declare-datatypes ((array!87829 0))(
  ( (array!87830 (arr!42390 (Array (_ BitVec 32) ValueCell!16799)) (size!42941 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87829)

(declare-fun mapValue!54721 () ValueCell!16799)

(declare-fun mapRest!54721 () (Array (_ BitVec 32) ValueCell!16799))

(declare-fun mapKey!54721 () (_ BitVec 32))

(assert (=> mapNonEmpty!54721 (= (arr!42390 _values!1354) (store mapRest!54721 mapKey!54721 mapValue!54721))))

(declare-fun b!1313183 () Bool)

(declare-fun e!749191 () Bool)

(declare-fun e!749192 () Bool)

(assert (=> b!1313183 (= e!749191 (and e!749192 mapRes!54721))))

(declare-fun condMapEmpty!54721 () Bool)

(declare-fun mapDefault!54721 () ValueCell!16799)

(assert (=> b!1313183 (= condMapEmpty!54721 (= (arr!42390 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16799)) mapDefault!54721)))))

(declare-fun b!1313184 () Bool)

(declare-fun res!871453 () Bool)

(assert (=> b!1313184 (=> (not res!871453) (not e!749193))))

(assert (=> b!1313184 (= res!871453 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42940 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313185 () Bool)

(assert (=> b!1313185 (= e!749193 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52297)

(declare-fun zeroValue!1296 () V!52297)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22938 0))(
  ( (tuple2!22939 (_1!11480 (_ BitVec 64)) (_2!11480 V!52297)) )
))
(declare-datatypes ((List!30091 0))(
  ( (Nil!30088) (Cons!30087 (h!31305 tuple2!22938) (t!43689 List!30091)) )
))
(declare-datatypes ((ListLongMap!20603 0))(
  ( (ListLongMap!20604 (toList!10317 List!30091)) )
))
(declare-fun contains!8479 (ListLongMap!20603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5321 (array!87827 array!87829 (_ BitVec 32) (_ BitVec 32) V!52297 V!52297 (_ BitVec 32) Int) ListLongMap!20603)

(assert (=> b!1313185 (contains!8479 (getCurrentListMap!5321 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43331 0))(
  ( (Unit!43332) )
))
(declare-fun lt!585992 () Unit!43331)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!6 (array!87827 array!87829 (_ BitVec 32) (_ BitVec 32) V!52297 V!52297 (_ BitVec 64) (_ BitVec 32) Int) Unit!43331)

(assert (=> b!1313185 (= lt!585992 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!6 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54721 () Bool)

(assert (=> mapIsEmpty!54721 mapRes!54721))

(declare-fun b!1313186 () Bool)

(declare-fun res!871457 () Bool)

(assert (=> b!1313186 (=> (not res!871457) (not e!749193))))

(assert (=> b!1313186 (= res!871457 (and (= (size!42941 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42940 _keys!1628) (size!42941 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313187 () Bool)

(declare-fun tp_is_empty!35395 () Bool)

(assert (=> b!1313187 (= e!749195 tp_is_empty!35395)))

(declare-fun b!1313188 () Bool)

(declare-fun res!871456 () Bool)

(assert (=> b!1313188 (=> (not res!871456) (not e!749193))))

(assert (=> b!1313188 (= res!871456 (contains!8479 (getCurrentListMap!5321 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!871460 () Bool)

(assert (=> start!111054 (=> (not res!871460) (not e!749193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111054 (= res!871460 (validMask!0 mask!2040))))

(assert (=> start!111054 e!749193))

(assert (=> start!111054 tp!104317))

(declare-fun array_inv!32289 (array!87827) Bool)

(assert (=> start!111054 (array_inv!32289 _keys!1628)))

(assert (=> start!111054 true))

(assert (=> start!111054 tp_is_empty!35395))

(declare-fun array_inv!32290 (array!87829) Bool)

(assert (=> start!111054 (and (array_inv!32290 _values!1354) e!749191)))

(declare-fun b!1313189 () Bool)

(declare-fun res!871459 () Bool)

(assert (=> b!1313189 (=> (not res!871459) (not e!749193))))

(declare-datatypes ((List!30092 0))(
  ( (Nil!30089) (Cons!30088 (h!31306 (_ BitVec 64)) (t!43690 List!30092)) )
))
(declare-fun arrayNoDuplicates!0 (array!87827 (_ BitVec 32) List!30092) Bool)

(assert (=> b!1313189 (= res!871459 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30089))))

(declare-fun b!1313190 () Bool)

(assert (=> b!1313190 (= e!749192 tp_is_empty!35395)))

(declare-fun b!1313191 () Bool)

(declare-fun res!871454 () Bool)

(assert (=> b!1313191 (=> (not res!871454) (not e!749193))))

(assert (=> b!1313191 (= res!871454 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1313192 () Bool)

(declare-fun res!871452 () Bool)

(assert (=> b!1313192 (=> (not res!871452) (not e!749193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313192 (= res!871452 (validKeyInArray!0 (select (arr!42389 _keys!1628) from!2020)))))

(declare-fun b!1313193 () Bool)

(declare-fun res!871458 () Bool)

(assert (=> b!1313193 (=> (not res!871458) (not e!749193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87827 (_ BitVec 32)) Bool)

(assert (=> b!1313193 (= res!871458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111054 res!871460) b!1313186))

(assert (= (and b!1313186 res!871457) b!1313193))

(assert (= (and b!1313193 res!871458) b!1313189))

(assert (= (and b!1313189 res!871459) b!1313184))

(assert (= (and b!1313184 res!871453) b!1313188))

(assert (= (and b!1313188 res!871456) b!1313182))

(assert (= (and b!1313182 res!871455) b!1313192))

(assert (= (and b!1313192 res!871452) b!1313191))

(assert (= (and b!1313191 res!871454) b!1313185))

(assert (= (and b!1313183 condMapEmpty!54721) mapIsEmpty!54721))

(assert (= (and b!1313183 (not condMapEmpty!54721)) mapNonEmpty!54721))

(get-info :version)

(assert (= (and mapNonEmpty!54721 ((_ is ValueCellFull!16799) mapValue!54721)) b!1313187))

(assert (= (and b!1313183 ((_ is ValueCellFull!16799) mapDefault!54721)) b!1313190))

(assert (= start!111054 b!1313183))

(declare-fun m!1202813 () Bool)

(assert (=> b!1313188 m!1202813))

(assert (=> b!1313188 m!1202813))

(declare-fun m!1202815 () Bool)

(assert (=> b!1313188 m!1202815))

(declare-fun m!1202817 () Bool)

(assert (=> b!1313189 m!1202817))

(declare-fun m!1202819 () Bool)

(assert (=> mapNonEmpty!54721 m!1202819))

(declare-fun m!1202821 () Bool)

(assert (=> b!1313182 m!1202821))

(declare-fun m!1202823 () Bool)

(assert (=> start!111054 m!1202823))

(declare-fun m!1202825 () Bool)

(assert (=> start!111054 m!1202825))

(declare-fun m!1202827 () Bool)

(assert (=> start!111054 m!1202827))

(assert (=> b!1313192 m!1202821))

(assert (=> b!1313192 m!1202821))

(declare-fun m!1202829 () Bool)

(assert (=> b!1313192 m!1202829))

(declare-fun m!1202831 () Bool)

(assert (=> b!1313193 m!1202831))

(declare-fun m!1202833 () Bool)

(assert (=> b!1313185 m!1202833))

(assert (=> b!1313185 m!1202833))

(declare-fun m!1202835 () Bool)

(assert (=> b!1313185 m!1202835))

(declare-fun m!1202837 () Bool)

(assert (=> b!1313185 m!1202837))

(check-sat (not mapNonEmpty!54721) b_and!47875 (not b!1313188) (not b_next!29665) (not start!111054) tp_is_empty!35395 (not b!1313185) (not b!1313192) (not b!1313189) (not b!1313193))
(check-sat b_and!47875 (not b_next!29665))
