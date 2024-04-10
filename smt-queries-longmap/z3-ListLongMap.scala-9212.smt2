; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110622 () Bool)

(assert start!110622)

(declare-fun b_free!29457 () Bool)

(declare-fun b_next!29457 () Bool)

(assert (=> start!110622 (= b_free!29457 (not b_next!29457))))

(declare-fun tp!103692 () Bool)

(declare-fun b_and!47665 () Bool)

(assert (=> start!110622 (= tp!103692 b_and!47665)))

(declare-fun b!1308947 () Bool)

(declare-fun res!868938 () Bool)

(declare-fun e!746789 () Bool)

(assert (=> b!1308947 (=> (not res!868938) (not e!746789))))

(declare-datatypes ((array!87368 0))(
  ( (array!87369 (arr!42164 (Array (_ BitVec 32) (_ BitVec 64))) (size!42714 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87368)

(declare-datatypes ((List!29893 0))(
  ( (Nil!29890) (Cons!29889 (h!31098 (_ BitVec 64)) (t!43499 List!29893)) )
))
(declare-fun arrayNoDuplicates!0 (array!87368 (_ BitVec 32) List!29893) Bool)

(assert (=> b!1308947 (= res!868938 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29890))))

(declare-fun b!1308948 () Bool)

(declare-fun res!868935 () Bool)

(assert (=> b!1308948 (=> (not res!868935) (not e!746789))))

(declare-datatypes ((V!52019 0))(
  ( (V!52020 (val!17668 Int)) )
))
(declare-datatypes ((ValueCell!16695 0))(
  ( (ValueCellFull!16695 (v!20295 V!52019)) (EmptyCell!16695) )
))
(declare-datatypes ((array!87370 0))(
  ( (array!87371 (arr!42165 (Array (_ BitVec 32) ValueCell!16695)) (size!42715 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87370)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1308948 (= res!868935 (and (= (size!42715 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42714 _keys!1628) (size!42715 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308949 () Bool)

(declare-fun e!746790 () Bool)

(declare-fun e!746792 () Bool)

(declare-fun mapRes!54409 () Bool)

(assert (=> b!1308949 (= e!746790 (and e!746792 mapRes!54409))))

(declare-fun condMapEmpty!54409 () Bool)

(declare-fun mapDefault!54409 () ValueCell!16695)

(assert (=> b!1308949 (= condMapEmpty!54409 (= (arr!42165 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16695)) mapDefault!54409)))))

(declare-fun b!1308950 () Bool)

(declare-fun e!746788 () Bool)

(declare-fun tp_is_empty!35187 () Bool)

(assert (=> b!1308950 (= e!746788 tp_is_empty!35187)))

(declare-fun b!1308951 () Bool)

(declare-fun res!868934 () Bool)

(assert (=> b!1308951 (=> (not res!868934) (not e!746789))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308951 (= res!868934 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42714 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308952 () Bool)

(assert (=> b!1308952 (= e!746789 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585204 () Bool)

(declare-fun minValue!1296 () V!52019)

(declare-fun zeroValue!1296 () V!52019)

(declare-datatypes ((tuple2!22752 0))(
  ( (tuple2!22753 (_1!11387 (_ BitVec 64)) (_2!11387 V!52019)) )
))
(declare-datatypes ((List!29894 0))(
  ( (Nil!29891) (Cons!29890 (h!31099 tuple2!22752) (t!43500 List!29894)) )
))
(declare-datatypes ((ListLongMap!20409 0))(
  ( (ListLongMap!20410 (toList!10220 List!29894)) )
))
(declare-fun contains!8370 (ListLongMap!20409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5233 (array!87368 array!87370 (_ BitVec 32) (_ BitVec 32) V!52019 V!52019 (_ BitVec 32) Int) ListLongMap!20409)

(assert (=> b!1308952 (= lt!585204 (contains!8370 (getCurrentListMap!5233 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54409 () Bool)

(declare-fun tp!103693 () Bool)

(assert (=> mapNonEmpty!54409 (= mapRes!54409 (and tp!103693 e!746788))))

(declare-fun mapValue!54409 () ValueCell!16695)

(declare-fun mapRest!54409 () (Array (_ BitVec 32) ValueCell!16695))

(declare-fun mapKey!54409 () (_ BitVec 32))

(assert (=> mapNonEmpty!54409 (= (arr!42165 _values!1354) (store mapRest!54409 mapKey!54409 mapValue!54409))))

(declare-fun b!1308953 () Bool)

(assert (=> b!1308953 (= e!746792 tp_is_empty!35187)))

(declare-fun b!1308954 () Bool)

(declare-fun res!868937 () Bool)

(assert (=> b!1308954 (=> (not res!868937) (not e!746789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87368 (_ BitVec 32)) Bool)

(assert (=> b!1308954 (= res!868937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54409 () Bool)

(assert (=> mapIsEmpty!54409 mapRes!54409))

(declare-fun res!868936 () Bool)

(assert (=> start!110622 (=> (not res!868936) (not e!746789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110622 (= res!868936 (validMask!0 mask!2040))))

(assert (=> start!110622 e!746789))

(assert (=> start!110622 tp!103692))

(declare-fun array_inv!31869 (array!87368) Bool)

(assert (=> start!110622 (array_inv!31869 _keys!1628)))

(assert (=> start!110622 true))

(assert (=> start!110622 tp_is_empty!35187))

(declare-fun array_inv!31870 (array!87370) Bool)

(assert (=> start!110622 (and (array_inv!31870 _values!1354) e!746790)))

(assert (= (and start!110622 res!868936) b!1308948))

(assert (= (and b!1308948 res!868935) b!1308954))

(assert (= (and b!1308954 res!868937) b!1308947))

(assert (= (and b!1308947 res!868938) b!1308951))

(assert (= (and b!1308951 res!868934) b!1308952))

(assert (= (and b!1308949 condMapEmpty!54409) mapIsEmpty!54409))

(assert (= (and b!1308949 (not condMapEmpty!54409)) mapNonEmpty!54409))

(get-info :version)

(assert (= (and mapNonEmpty!54409 ((_ is ValueCellFull!16695) mapValue!54409)) b!1308950))

(assert (= (and b!1308949 ((_ is ValueCellFull!16695) mapDefault!54409)) b!1308953))

(assert (= start!110622 b!1308949))

(declare-fun m!1199191 () Bool)

(assert (=> b!1308947 m!1199191))

(declare-fun m!1199193 () Bool)

(assert (=> mapNonEmpty!54409 m!1199193))

(declare-fun m!1199195 () Bool)

(assert (=> b!1308954 m!1199195))

(declare-fun m!1199197 () Bool)

(assert (=> start!110622 m!1199197))

(declare-fun m!1199199 () Bool)

(assert (=> start!110622 m!1199199))

(declare-fun m!1199201 () Bool)

(assert (=> start!110622 m!1199201))

(declare-fun m!1199203 () Bool)

(assert (=> b!1308952 m!1199203))

(assert (=> b!1308952 m!1199203))

(declare-fun m!1199205 () Bool)

(assert (=> b!1308952 m!1199205))

(check-sat b_and!47665 tp_is_empty!35187 (not b_next!29457) (not b!1308954) (not b!1308952) (not b!1308947) (not mapNonEmpty!54409) (not start!110622))
(check-sat b_and!47665 (not b_next!29457))
