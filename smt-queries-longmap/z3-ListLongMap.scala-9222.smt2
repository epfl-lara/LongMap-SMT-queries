; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110904 () Bool)

(assert start!110904)

(declare-fun b_free!29515 () Bool)

(declare-fun b_next!29515 () Bool)

(assert (=> start!110904 (= b_free!29515 (not b_next!29515))))

(declare-fun tp!103866 () Bool)

(declare-fun b_and!47725 () Bool)

(assert (=> start!110904 (= tp!103866 b_and!47725)))

(declare-fun b!1310942 () Bool)

(declare-fun res!869888 () Bool)

(declare-fun e!748067 () Bool)

(assert (=> b!1310942 (=> (not res!869888) (not e!748067))))

(declare-datatypes ((array!87543 0))(
  ( (array!87544 (arr!42247 (Array (_ BitVec 32) (_ BitVec 64))) (size!42798 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87543)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310942 (= res!869888 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42798 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310943 () Bool)

(assert (=> b!1310943 (= e!748067 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52097 0))(
  ( (V!52098 (val!17697 Int)) )
))
(declare-fun minValue!1296 () V!52097)

(declare-datatypes ((ValueCell!16724 0))(
  ( (ValueCellFull!16724 (v!20319 V!52097)) (EmptyCell!16724) )
))
(declare-datatypes ((array!87545 0))(
  ( (array!87546 (arr!42248 (Array (_ BitVec 32) ValueCell!16724)) (size!42799 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87545)

(declare-fun zeroValue!1296 () V!52097)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585767 () Bool)

(declare-datatypes ((tuple2!22834 0))(
  ( (tuple2!22835 (_1!11428 (_ BitVec 64)) (_2!11428 V!52097)) )
))
(declare-datatypes ((List!29994 0))(
  ( (Nil!29991) (Cons!29990 (h!31208 tuple2!22834) (t!43592 List!29994)) )
))
(declare-datatypes ((ListLongMap!20499 0))(
  ( (ListLongMap!20500 (toList!10265 List!29994)) )
))
(declare-fun contains!8427 (ListLongMap!20499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5269 (array!87543 array!87545 (_ BitVec 32) (_ BitVec 32) V!52097 V!52097 (_ BitVec 32) Int) ListLongMap!20499)

(assert (=> b!1310943 (= lt!585767 (contains!8427 (getCurrentListMap!5269 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310944 () Bool)

(declare-fun res!869891 () Bool)

(assert (=> b!1310944 (=> (not res!869891) (not e!748067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87543 (_ BitVec 32)) Bool)

(assert (=> b!1310944 (= res!869891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!869887 () Bool)

(assert (=> start!110904 (=> (not res!869887) (not e!748067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110904 (= res!869887 (validMask!0 mask!2040))))

(assert (=> start!110904 e!748067))

(assert (=> start!110904 tp!103866))

(declare-fun array_inv!32193 (array!87543) Bool)

(assert (=> start!110904 (array_inv!32193 _keys!1628)))

(assert (=> start!110904 true))

(declare-fun tp_is_empty!35245 () Bool)

(assert (=> start!110904 tp_is_empty!35245))

(declare-fun e!748069 () Bool)

(declare-fun array_inv!32194 (array!87545) Bool)

(assert (=> start!110904 (and (array_inv!32194 _values!1354) e!748069)))

(declare-fun b!1310945 () Bool)

(declare-fun e!748068 () Bool)

(assert (=> b!1310945 (= e!748068 tp_is_empty!35245)))

(declare-fun b!1310946 () Bool)

(declare-fun mapRes!54496 () Bool)

(assert (=> b!1310946 (= e!748069 (and e!748068 mapRes!54496))))

(declare-fun condMapEmpty!54496 () Bool)

(declare-fun mapDefault!54496 () ValueCell!16724)

(assert (=> b!1310946 (= condMapEmpty!54496 (= (arr!42248 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16724)) mapDefault!54496)))))

(declare-fun mapIsEmpty!54496 () Bool)

(assert (=> mapIsEmpty!54496 mapRes!54496))

(declare-fun mapNonEmpty!54496 () Bool)

(declare-fun tp!103867 () Bool)

(declare-fun e!748070 () Bool)

(assert (=> mapNonEmpty!54496 (= mapRes!54496 (and tp!103867 e!748070))))

(declare-fun mapRest!54496 () (Array (_ BitVec 32) ValueCell!16724))

(declare-fun mapKey!54496 () (_ BitVec 32))

(declare-fun mapValue!54496 () ValueCell!16724)

(assert (=> mapNonEmpty!54496 (= (arr!42248 _values!1354) (store mapRest!54496 mapKey!54496 mapValue!54496))))

(declare-fun b!1310947 () Bool)

(declare-fun res!869890 () Bool)

(assert (=> b!1310947 (=> (not res!869890) (not e!748067))))

(declare-datatypes ((List!29995 0))(
  ( (Nil!29992) (Cons!29991 (h!31209 (_ BitVec 64)) (t!43593 List!29995)) )
))
(declare-fun arrayNoDuplicates!0 (array!87543 (_ BitVec 32) List!29995) Bool)

(assert (=> b!1310947 (= res!869890 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29992))))

(declare-fun b!1310948 () Bool)

(assert (=> b!1310948 (= e!748070 tp_is_empty!35245)))

(declare-fun b!1310949 () Bool)

(declare-fun res!869889 () Bool)

(assert (=> b!1310949 (=> (not res!869889) (not e!748067))))

(assert (=> b!1310949 (= res!869889 (and (= (size!42799 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42798 _keys!1628) (size!42799 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110904 res!869887) b!1310949))

(assert (= (and b!1310949 res!869889) b!1310944))

(assert (= (and b!1310944 res!869891) b!1310947))

(assert (= (and b!1310947 res!869890) b!1310942))

(assert (= (and b!1310942 res!869888) b!1310943))

(assert (= (and b!1310946 condMapEmpty!54496) mapIsEmpty!54496))

(assert (= (and b!1310946 (not condMapEmpty!54496)) mapNonEmpty!54496))

(get-info :version)

(assert (= (and mapNonEmpty!54496 ((_ is ValueCellFull!16724) mapValue!54496)) b!1310948))

(assert (= (and b!1310946 ((_ is ValueCellFull!16724) mapDefault!54496)) b!1310945))

(assert (= start!110904 b!1310946))

(declare-fun m!1201253 () Bool)

(assert (=> b!1310944 m!1201253))

(declare-fun m!1201255 () Bool)

(assert (=> b!1310943 m!1201255))

(assert (=> b!1310943 m!1201255))

(declare-fun m!1201257 () Bool)

(assert (=> b!1310943 m!1201257))

(declare-fun m!1201259 () Bool)

(assert (=> mapNonEmpty!54496 m!1201259))

(declare-fun m!1201261 () Bool)

(assert (=> start!110904 m!1201261))

(declare-fun m!1201263 () Bool)

(assert (=> start!110904 m!1201263))

(declare-fun m!1201265 () Bool)

(assert (=> start!110904 m!1201265))

(declare-fun m!1201267 () Bool)

(assert (=> b!1310947 m!1201267))

(check-sat (not start!110904) (not b!1310947) tp_is_empty!35245 (not b!1310943) b_and!47725 (not b_next!29515) (not mapNonEmpty!54496) (not b!1310944))
(check-sat b_and!47725 (not b_next!29515))
