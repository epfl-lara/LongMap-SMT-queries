; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110838 () Bool)

(assert start!110838)

(declare-fun b_free!29673 () Bool)

(declare-fun b_next!29673 () Bool)

(assert (=> start!110838 (= b_free!29673 (not b_next!29673))))

(declare-fun tp!104341 () Bool)

(declare-fun b_and!47881 () Bool)

(assert (=> start!110838 (= tp!104341 b_and!47881)))

(declare-fun b!1312027 () Bool)

(declare-fun res!871044 () Bool)

(declare-fun e!748408 () Bool)

(assert (=> b!1312027 (=> (not res!871044) (not e!748408))))

(declare-datatypes ((array!87794 0))(
  ( (array!87795 (arr!42377 (Array (_ BitVec 32) (_ BitVec 64))) (size!42927 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87794)

(declare-datatypes ((List!30049 0))(
  ( (Nil!30046) (Cons!30045 (h!31254 (_ BitVec 64)) (t!43655 List!30049)) )
))
(declare-fun arrayNoDuplicates!0 (array!87794 (_ BitVec 32) List!30049) Bool)

(assert (=> b!1312027 (= res!871044 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30046))))

(declare-fun b!1312028 () Bool)

(declare-fun e!748412 () Bool)

(declare-fun tp_is_empty!35403 () Bool)

(assert (=> b!1312028 (= e!748412 tp_is_empty!35403)))

(declare-fun mapNonEmpty!54733 () Bool)

(declare-fun mapRes!54733 () Bool)

(declare-fun tp!104340 () Bool)

(declare-fun e!748409 () Bool)

(assert (=> mapNonEmpty!54733 (= mapRes!54733 (and tp!104340 e!748409))))

(declare-fun mapKey!54733 () (_ BitVec 32))

(declare-datatypes ((V!52307 0))(
  ( (V!52308 (val!17776 Int)) )
))
(declare-datatypes ((ValueCell!16803 0))(
  ( (ValueCellFull!16803 (v!20403 V!52307)) (EmptyCell!16803) )
))
(declare-datatypes ((array!87796 0))(
  ( (array!87797 (arr!42378 (Array (_ BitVec 32) ValueCell!16803)) (size!42928 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87796)

(declare-fun mapRest!54733 () (Array (_ BitVec 32) ValueCell!16803))

(declare-fun mapValue!54733 () ValueCell!16803)

(assert (=> mapNonEmpty!54733 (= (arr!42378 _values!1354) (store mapRest!54733 mapKey!54733 mapValue!54733))))

(declare-fun b!1312029 () Bool)

(declare-fun res!871050 () Bool)

(assert (=> b!1312029 (=> (not res!871050) (not e!748408))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312029 (= res!871050 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312030 () Bool)

(assert (=> b!1312030 (= e!748409 tp_is_empty!35403)))

(declare-fun res!871043 () Bool)

(assert (=> start!110838 (=> (not res!871043) (not e!748408))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110838 (= res!871043 (validMask!0 mask!2040))))

(assert (=> start!110838 e!748408))

(assert (=> start!110838 tp!104341))

(declare-fun array_inv!32023 (array!87794) Bool)

(assert (=> start!110838 (array_inv!32023 _keys!1628)))

(assert (=> start!110838 true))

(assert (=> start!110838 tp_is_empty!35403))

(declare-fun e!748410 () Bool)

(declare-fun array_inv!32024 (array!87796) Bool)

(assert (=> start!110838 (and (array_inv!32024 _values!1354) e!748410)))

(declare-fun b!1312031 () Bool)

(assert (=> b!1312031 (= e!748408 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52307)

(declare-fun zeroValue!1296 () V!52307)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22910 0))(
  ( (tuple2!22911 (_1!11466 (_ BitVec 64)) (_2!11466 V!52307)) )
))
(declare-datatypes ((List!30050 0))(
  ( (Nil!30047) (Cons!30046 (h!31255 tuple2!22910) (t!43656 List!30050)) )
))
(declare-datatypes ((ListLongMap!20567 0))(
  ( (ListLongMap!20568 (toList!10299 List!30050)) )
))
(declare-fun contains!8449 (ListLongMap!20567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5312 (array!87794 array!87796 (_ BitVec 32) (_ BitVec 32) V!52307 V!52307 (_ BitVec 32) Int) ListLongMap!20567)

(assert (=> b!1312031 (contains!8449 (getCurrentListMap!5312 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43364 0))(
  ( (Unit!43365) )
))
(declare-fun lt!585528 () Unit!43364)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!9 (array!87794 array!87796 (_ BitVec 32) (_ BitVec 32) V!52307 V!52307 (_ BitVec 64) (_ BitVec 32) Int) Unit!43364)

(assert (=> b!1312031 (= lt!585528 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!9 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312032 () Bool)

(declare-fun res!871046 () Bool)

(assert (=> b!1312032 (=> (not res!871046) (not e!748408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87794 (_ BitVec 32)) Bool)

(assert (=> b!1312032 (= res!871046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312033 () Bool)

(declare-fun res!871042 () Bool)

(assert (=> b!1312033 (=> (not res!871042) (not e!748408))))

(assert (=> b!1312033 (= res!871042 (not (= (select (arr!42377 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312034 () Bool)

(declare-fun res!871048 () Bool)

(assert (=> b!1312034 (=> (not res!871048) (not e!748408))))

(assert (=> b!1312034 (= res!871048 (and (= (size!42928 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42927 _keys!1628) (size!42928 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312035 () Bool)

(assert (=> b!1312035 (= e!748410 (and e!748412 mapRes!54733))))

(declare-fun condMapEmpty!54733 () Bool)

(declare-fun mapDefault!54733 () ValueCell!16803)

(assert (=> b!1312035 (= condMapEmpty!54733 (= (arr!42378 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16803)) mapDefault!54733)))))

(declare-fun b!1312036 () Bool)

(declare-fun res!871049 () Bool)

(assert (=> b!1312036 (=> (not res!871049) (not e!748408))))

(assert (=> b!1312036 (= res!871049 (contains!8449 (getCurrentListMap!5312 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312037 () Bool)

(declare-fun res!871047 () Bool)

(assert (=> b!1312037 (=> (not res!871047) (not e!748408))))

(assert (=> b!1312037 (= res!871047 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42927 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312038 () Bool)

(declare-fun res!871045 () Bool)

(assert (=> b!1312038 (=> (not res!871045) (not e!748408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312038 (= res!871045 (validKeyInArray!0 (select (arr!42377 _keys!1628) from!2020)))))

(declare-fun mapIsEmpty!54733 () Bool)

(assert (=> mapIsEmpty!54733 mapRes!54733))

(assert (= (and start!110838 res!871043) b!1312034))

(assert (= (and b!1312034 res!871048) b!1312032))

(assert (= (and b!1312032 res!871046) b!1312027))

(assert (= (and b!1312027 res!871044) b!1312037))

(assert (= (and b!1312037 res!871047) b!1312036))

(assert (= (and b!1312036 res!871049) b!1312033))

(assert (= (and b!1312033 res!871042) b!1312038))

(assert (= (and b!1312038 res!871045) b!1312029))

(assert (= (and b!1312029 res!871050) b!1312031))

(assert (= (and b!1312035 condMapEmpty!54733) mapIsEmpty!54733))

(assert (= (and b!1312035 (not condMapEmpty!54733)) mapNonEmpty!54733))

(get-info :version)

(assert (= (and mapNonEmpty!54733 ((_ is ValueCellFull!16803) mapValue!54733)) b!1312030))

(assert (= (and b!1312035 ((_ is ValueCellFull!16803) mapDefault!54733)) b!1312028))

(assert (= start!110838 b!1312035))

(declare-fun m!1201319 () Bool)

(assert (=> b!1312031 m!1201319))

(assert (=> b!1312031 m!1201319))

(declare-fun m!1201321 () Bool)

(assert (=> b!1312031 m!1201321))

(declare-fun m!1201323 () Bool)

(assert (=> b!1312031 m!1201323))

(declare-fun m!1201325 () Bool)

(assert (=> b!1312036 m!1201325))

(assert (=> b!1312036 m!1201325))

(declare-fun m!1201327 () Bool)

(assert (=> b!1312036 m!1201327))

(declare-fun m!1201329 () Bool)

(assert (=> b!1312038 m!1201329))

(assert (=> b!1312038 m!1201329))

(declare-fun m!1201331 () Bool)

(assert (=> b!1312038 m!1201331))

(assert (=> b!1312033 m!1201329))

(declare-fun m!1201333 () Bool)

(assert (=> b!1312027 m!1201333))

(declare-fun m!1201335 () Bool)

(assert (=> b!1312032 m!1201335))

(declare-fun m!1201337 () Bool)

(assert (=> start!110838 m!1201337))

(declare-fun m!1201339 () Bool)

(assert (=> start!110838 m!1201339))

(declare-fun m!1201341 () Bool)

(assert (=> start!110838 m!1201341))

(declare-fun m!1201343 () Bool)

(assert (=> mapNonEmpty!54733 m!1201343))

(check-sat (not b!1312036) tp_is_empty!35403 (not b!1312031) (not b!1312038) (not b_next!29673) (not b!1312032) b_and!47881 (not mapNonEmpty!54733) (not b!1312027) (not start!110838))
(check-sat b_and!47881 (not b_next!29673))
