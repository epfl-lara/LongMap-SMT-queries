; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83086 () Bool)

(assert start!83086)

(declare-fun b_free!19045 () Bool)

(declare-fun b_next!19045 () Bool)

(assert (=> start!83086 (= b_free!19045 (not b_next!19045))))

(declare-fun tp!66264 () Bool)

(declare-fun b_and!30543 () Bool)

(assert (=> start!83086 (= tp!66264 b_and!30543)))

(declare-fun b!968484 () Bool)

(declare-fun res!648063 () Bool)

(declare-fun e!545933 () Bool)

(assert (=> b!968484 (=> (not res!648063) (not e!545933))))

(declare-datatypes ((array!59800 0))(
  ( (array!59801 (arr!28764 (Array (_ BitVec 32) (_ BitVec 64))) (size!29244 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59800)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968484 (= res!648063 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29244 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29244 _keys!1686))))))

(declare-fun b!968485 () Bool)

(declare-fun res!648062 () Bool)

(assert (=> b!968485 (=> (not res!648062) (not e!545933))))

(declare-datatypes ((List!19956 0))(
  ( (Nil!19953) (Cons!19952 (h!21120 (_ BitVec 64)) (t!28311 List!19956)) )
))
(declare-fun arrayNoDuplicates!0 (array!59800 (_ BitVec 32) List!19956) Bool)

(assert (=> b!968485 (= res!648062 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19953))))

(declare-fun b!968486 () Bool)

(declare-fun e!545929 () Bool)

(declare-fun tp_is_empty!21853 () Bool)

(assert (=> b!968486 (= e!545929 tp_is_empty!21853)))

(declare-fun b!968487 () Bool)

(declare-fun e!545932 () Bool)

(declare-fun e!545930 () Bool)

(declare-fun mapRes!34774 () Bool)

(assert (=> b!968487 (= e!545932 (and e!545930 mapRes!34774))))

(declare-fun condMapEmpty!34774 () Bool)

(declare-datatypes ((V!34121 0))(
  ( (V!34122 (val!10977 Int)) )
))
(declare-datatypes ((ValueCell!10445 0))(
  ( (ValueCellFull!10445 (v!13532 V!34121)) (EmptyCell!10445) )
))
(declare-datatypes ((array!59802 0))(
  ( (array!59803 (arr!28765 (Array (_ BitVec 32) ValueCell!10445)) (size!29245 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59802)

(declare-fun mapDefault!34774 () ValueCell!10445)

(assert (=> b!968487 (= condMapEmpty!34774 (= (arr!28765 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10445)) mapDefault!34774)))))

(declare-fun b!968488 () Bool)

(declare-fun res!648066 () Bool)

(assert (=> b!968488 (=> (not res!648066) (not e!545933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968488 (= res!648066 (validKeyInArray!0 (select (arr!28764 _keys!1686) i!803)))))

(declare-fun b!968489 () Bool)

(declare-fun res!648061 () Bool)

(assert (=> b!968489 (=> (not res!648061) (not e!545933))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34121)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34121)

(declare-datatypes ((tuple2!14110 0))(
  ( (tuple2!14111 (_1!7066 (_ BitVec 64)) (_2!7066 V!34121)) )
))
(declare-datatypes ((List!19957 0))(
  ( (Nil!19954) (Cons!19953 (h!21121 tuple2!14110) (t!28312 List!19957)) )
))
(declare-datatypes ((ListLongMap!12809 0))(
  ( (ListLongMap!12810 (toList!6420 List!19957)) )
))
(declare-fun contains!5532 (ListLongMap!12809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3653 (array!59800 array!59802 (_ BitVec 32) (_ BitVec 32) V!34121 V!34121 (_ BitVec 32) Int) ListLongMap!12809)

(assert (=> b!968489 (= res!648061 (contains!5532 (getCurrentListMap!3653 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28764 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34774 () Bool)

(assert (=> mapIsEmpty!34774 mapRes!34774))

(declare-fun b!968490 () Bool)

(assert (=> b!968490 (= e!545930 tp_is_empty!21853)))

(declare-fun mapNonEmpty!34774 () Bool)

(declare-fun tp!66265 () Bool)

(assert (=> mapNonEmpty!34774 (= mapRes!34774 (and tp!66265 e!545929))))

(declare-fun mapKey!34774 () (_ BitVec 32))

(declare-fun mapValue!34774 () ValueCell!10445)

(declare-fun mapRest!34774 () (Array (_ BitVec 32) ValueCell!10445))

(assert (=> mapNonEmpty!34774 (= (arr!28765 _values!1400) (store mapRest!34774 mapKey!34774 mapValue!34774))))

(declare-fun b!968492 () Bool)

(declare-fun res!648059 () Bool)

(assert (=> b!968492 (=> (not res!648059) (not e!545933))))

(assert (=> b!968492 (= res!648059 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968493 () Bool)

(assert (=> b!968493 (= e!545933 (not (and (bvsge (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2084 #b00000000000000000000000000000001) (size!29244 _keys!1686)))))))

(assert (=> b!968493 (contains!5532 (getCurrentListMap!3653 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28764 _keys!1686) i!803))))

(declare-datatypes ((Unit!32294 0))(
  ( (Unit!32295) )
))
(declare-fun lt!431795 () Unit!32294)

(declare-fun lemmaInListMapFromThenInFromMinusOne!58 (array!59800 array!59802 (_ BitVec 32) (_ BitVec 32) V!34121 V!34121 (_ BitVec 32) (_ BitVec 32) Int) Unit!32294)

(assert (=> b!968493 (= lt!431795 (lemmaInListMapFromThenInFromMinusOne!58 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968494 () Bool)

(declare-fun res!648060 () Bool)

(assert (=> b!968494 (=> (not res!648060) (not e!545933))))

(assert (=> b!968494 (= res!648060 (and (= (size!29245 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29244 _keys!1686) (size!29245 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!648065 () Bool)

(assert (=> start!83086 (=> (not res!648065) (not e!545933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83086 (= res!648065 (validMask!0 mask!2110))))

(assert (=> start!83086 e!545933))

(assert (=> start!83086 true))

(declare-fun array_inv!22329 (array!59802) Bool)

(assert (=> start!83086 (and (array_inv!22329 _values!1400) e!545932)))

(declare-fun array_inv!22330 (array!59800) Bool)

(assert (=> start!83086 (array_inv!22330 _keys!1686)))

(assert (=> start!83086 tp!66264))

(assert (=> start!83086 tp_is_empty!21853))

(declare-fun b!968491 () Bool)

(declare-fun res!648064 () Bool)

(assert (=> b!968491 (=> (not res!648064) (not e!545933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59800 (_ BitVec 32)) Bool)

(assert (=> b!968491 (= res!648064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!83086 res!648065) b!968494))

(assert (= (and b!968494 res!648060) b!968491))

(assert (= (and b!968491 res!648064) b!968485))

(assert (= (and b!968485 res!648062) b!968484))

(assert (= (and b!968484 res!648063) b!968488))

(assert (= (and b!968488 res!648066) b!968489))

(assert (= (and b!968489 res!648061) b!968492))

(assert (= (and b!968492 res!648059) b!968493))

(assert (= (and b!968487 condMapEmpty!34774) mapIsEmpty!34774))

(assert (= (and b!968487 (not condMapEmpty!34774)) mapNonEmpty!34774))

(get-info :version)

(assert (= (and mapNonEmpty!34774 ((_ is ValueCellFull!10445) mapValue!34774)) b!968486))

(assert (= (and b!968487 ((_ is ValueCellFull!10445) mapDefault!34774)) b!968490))

(assert (= start!83086 b!968487))

(declare-fun m!897397 () Bool)

(assert (=> mapNonEmpty!34774 m!897397))

(declare-fun m!897399 () Bool)

(assert (=> b!968488 m!897399))

(assert (=> b!968488 m!897399))

(declare-fun m!897401 () Bool)

(assert (=> b!968488 m!897401))

(declare-fun m!897403 () Bool)

(assert (=> b!968485 m!897403))

(declare-fun m!897405 () Bool)

(assert (=> start!83086 m!897405))

(declare-fun m!897407 () Bool)

(assert (=> start!83086 m!897407))

(declare-fun m!897409 () Bool)

(assert (=> start!83086 m!897409))

(declare-fun m!897411 () Bool)

(assert (=> b!968493 m!897411))

(assert (=> b!968493 m!897399))

(assert (=> b!968493 m!897411))

(assert (=> b!968493 m!897399))

(declare-fun m!897413 () Bool)

(assert (=> b!968493 m!897413))

(declare-fun m!897415 () Bool)

(assert (=> b!968493 m!897415))

(declare-fun m!897417 () Bool)

(assert (=> b!968489 m!897417))

(assert (=> b!968489 m!897399))

(assert (=> b!968489 m!897417))

(assert (=> b!968489 m!897399))

(declare-fun m!897419 () Bool)

(assert (=> b!968489 m!897419))

(declare-fun m!897421 () Bool)

(assert (=> b!968491 m!897421))

(check-sat tp_is_empty!21853 (not b!968493) (not start!83086) (not b!968489) (not mapNonEmpty!34774) (not b_next!19045) (not b!968485) b_and!30543 (not b!968491) (not b!968488))
(check-sat b_and!30543 (not b_next!19045))
