; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97888 () Bool)

(assert start!97888)

(declare-fun b!1117279 () Bool)

(declare-fun res!745592 () Bool)

(declare-fun e!636722 () Bool)

(assert (=> b!1117279 (=> (not res!745592) (not e!636722))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72705 0))(
  ( (array!72706 (arr!34999 (Array (_ BitVec 32) (_ BitVec 64))) (size!35536 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72705)

(assert (=> b!1117279 (= res!745592 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35536 _keys!1208))))))

(declare-fun b!1117280 () Bool)

(declare-fun res!745587 () Bool)

(assert (=> b!1117280 (=> (not res!745587) (not e!636722))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117280 (= res!745587 (validMask!0 mask!1564))))

(declare-fun b!1117281 () Bool)

(declare-fun res!745588 () Bool)

(assert (=> b!1117281 (=> (not res!745588) (not e!636722))))

(declare-datatypes ((List!24378 0))(
  ( (Nil!24375) (Cons!24374 (h!25592 (_ BitVec 64)) (t!34851 List!24378)) )
))
(declare-fun arrayNoDuplicates!0 (array!72705 (_ BitVec 32) List!24378) Bool)

(assert (=> b!1117281 (= res!745588 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24375))))

(declare-fun b!1117283 () Bool)

(declare-fun e!636726 () Bool)

(declare-fun e!636721 () Bool)

(declare-fun mapRes!43642 () Bool)

(assert (=> b!1117283 (= e!636726 (and e!636721 mapRes!43642))))

(declare-fun condMapEmpty!43642 () Bool)

(declare-datatypes ((V!42305 0))(
  ( (V!42306 (val!13998 Int)) )
))
(declare-datatypes ((ValueCell!13232 0))(
  ( (ValueCellFull!13232 (v!16627 V!42305)) (EmptyCell!13232) )
))
(declare-datatypes ((array!72707 0))(
  ( (array!72708 (arr!35000 (Array (_ BitVec 32) ValueCell!13232)) (size!35537 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72707)

(declare-fun mapDefault!43642 () ValueCell!13232)

(assert (=> b!1117283 (= condMapEmpty!43642 (= (arr!35000 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13232)) mapDefault!43642)))))

(declare-fun b!1117284 () Bool)

(declare-fun res!745594 () Bool)

(declare-fun e!636724 () Bool)

(assert (=> b!1117284 (=> (not res!745594) (not e!636724))))

(declare-fun lt!497574 () array!72705)

(assert (=> b!1117284 (= res!745594 (arrayNoDuplicates!0 lt!497574 #b00000000000000000000000000000000 Nil!24375))))

(declare-fun b!1117285 () Bool)

(declare-fun res!745590 () Bool)

(assert (=> b!1117285 (=> (not res!745590) (not e!636722))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117285 (= res!745590 (and (= (size!35537 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35536 _keys!1208) (size!35537 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117286 () Bool)

(declare-fun res!745585 () Bool)

(assert (=> b!1117286 (=> (not res!745585) (not e!636722))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117286 (= res!745585 (validKeyInArray!0 k0!934))))

(declare-fun b!1117287 () Bool)

(declare-fun tp_is_empty!27883 () Bool)

(assert (=> b!1117287 (= e!636721 tp_is_empty!27883)))

(declare-fun mapNonEmpty!43642 () Bool)

(declare-fun tp!82886 () Bool)

(declare-fun e!636723 () Bool)

(assert (=> mapNonEmpty!43642 (= mapRes!43642 (and tp!82886 e!636723))))

(declare-fun mapKey!43642 () (_ BitVec 32))

(declare-fun mapValue!43642 () ValueCell!13232)

(declare-fun mapRest!43642 () (Array (_ BitVec 32) ValueCell!13232))

(assert (=> mapNonEmpty!43642 (= (arr!35000 _values!996) (store mapRest!43642 mapKey!43642 mapValue!43642))))

(declare-fun mapIsEmpty!43642 () Bool)

(assert (=> mapIsEmpty!43642 mapRes!43642))

(declare-fun b!1117288 () Bool)

(assert (=> b!1117288 (= e!636723 tp_is_empty!27883)))

(declare-fun b!1117289 () Bool)

(declare-fun res!745593 () Bool)

(assert (=> b!1117289 (=> (not res!745593) (not e!636722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72705 (_ BitVec 32)) Bool)

(assert (=> b!1117289 (= res!745593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117282 () Bool)

(declare-fun res!745591 () Bool)

(assert (=> b!1117282 (=> (not res!745591) (not e!636722))))

(assert (=> b!1117282 (= res!745591 (= (select (arr!34999 _keys!1208) i!673) k0!934))))

(declare-fun res!745589 () Bool)

(assert (=> start!97888 (=> (not res!745589) (not e!636722))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97888 (= res!745589 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35536 _keys!1208))))))

(assert (=> start!97888 e!636722))

(declare-fun array_inv!26966 (array!72705) Bool)

(assert (=> start!97888 (array_inv!26966 _keys!1208)))

(assert (=> start!97888 true))

(declare-fun array_inv!26967 (array!72707) Bool)

(assert (=> start!97888 (and (array_inv!26967 _values!996) e!636726)))

(declare-fun b!1117290 () Bool)

(assert (=> b!1117290 (= e!636724 (not true))))

(declare-fun arrayContainsKey!0 (array!72705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117290 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36595 0))(
  ( (Unit!36596) )
))
(declare-fun lt!497575 () Unit!36595)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72705 (_ BitVec 64) (_ BitVec 32)) Unit!36595)

(assert (=> b!1117290 (= lt!497575 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117291 () Bool)

(assert (=> b!1117291 (= e!636722 e!636724)))

(declare-fun res!745586 () Bool)

(assert (=> b!1117291 (=> (not res!745586) (not e!636724))))

(assert (=> b!1117291 (= res!745586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497574 mask!1564))))

(assert (=> b!1117291 (= lt!497574 (array!72706 (store (arr!34999 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35536 _keys!1208)))))

(assert (= (and start!97888 res!745589) b!1117280))

(assert (= (and b!1117280 res!745587) b!1117285))

(assert (= (and b!1117285 res!745590) b!1117289))

(assert (= (and b!1117289 res!745593) b!1117281))

(assert (= (and b!1117281 res!745588) b!1117279))

(assert (= (and b!1117279 res!745592) b!1117286))

(assert (= (and b!1117286 res!745585) b!1117282))

(assert (= (and b!1117282 res!745591) b!1117291))

(assert (= (and b!1117291 res!745586) b!1117284))

(assert (= (and b!1117284 res!745594) b!1117290))

(assert (= (and b!1117283 condMapEmpty!43642) mapIsEmpty!43642))

(assert (= (and b!1117283 (not condMapEmpty!43642)) mapNonEmpty!43642))

(get-info :version)

(assert (= (and mapNonEmpty!43642 ((_ is ValueCellFull!13232) mapValue!43642)) b!1117288))

(assert (= (and b!1117283 ((_ is ValueCellFull!13232) mapDefault!43642)) b!1117287))

(assert (= start!97888 b!1117283))

(declare-fun m!1033995 () Bool)

(assert (=> b!1117280 m!1033995))

(declare-fun m!1033997 () Bool)

(assert (=> b!1117282 m!1033997))

(declare-fun m!1033999 () Bool)

(assert (=> b!1117289 m!1033999))

(declare-fun m!1034001 () Bool)

(assert (=> b!1117286 m!1034001))

(declare-fun m!1034003 () Bool)

(assert (=> mapNonEmpty!43642 m!1034003))

(declare-fun m!1034005 () Bool)

(assert (=> start!97888 m!1034005))

(declare-fun m!1034007 () Bool)

(assert (=> start!97888 m!1034007))

(declare-fun m!1034009 () Bool)

(assert (=> b!1117281 m!1034009))

(declare-fun m!1034011 () Bool)

(assert (=> b!1117284 m!1034011))

(declare-fun m!1034013 () Bool)

(assert (=> b!1117290 m!1034013))

(declare-fun m!1034015 () Bool)

(assert (=> b!1117290 m!1034015))

(declare-fun m!1034017 () Bool)

(assert (=> b!1117291 m!1034017))

(declare-fun m!1034019 () Bool)

(assert (=> b!1117291 m!1034019))

(check-sat (not start!97888) (not mapNonEmpty!43642) (not b!1117289) (not b!1117281) (not b!1117286) (not b!1117280) (not b!1117291) (not b!1117290) (not b!1117284) tp_is_empty!27883)
(check-sat)
