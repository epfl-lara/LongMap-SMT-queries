; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82690 () Bool)

(assert start!82690)

(declare-fun b_free!18841 () Bool)

(declare-fun b_next!18841 () Bool)

(assert (=> start!82690 (= b_free!18841 (not b_next!18841))))

(declare-fun tp!65643 () Bool)

(declare-fun b_and!30303 () Bool)

(assert (=> start!82690 (= tp!65643 b_and!30303)))

(declare-fun b!964257 () Bool)

(declare-fun e!543595 () Bool)

(declare-fun tp_is_empty!21643 () Bool)

(assert (=> b!964257 (= e!543595 tp_is_empty!21643)))

(declare-fun b!964258 () Bool)

(declare-fun e!543590 () Bool)

(assert (=> b!964258 (= e!543590 tp_is_empty!21643)))

(declare-fun b!964260 () Bool)

(declare-fun res!645469 () Bool)

(declare-fun e!543591 () Bool)

(assert (=> b!964260 (=> (not res!645469) (not e!543591))))

(declare-datatypes ((array!59308 0))(
  ( (array!59309 (arr!28523 (Array (_ BitVec 32) (_ BitVec 64))) (size!29004 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59308)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964260 (= res!645469 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29004 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29004 _keys!1686))))))

(declare-fun b!964261 () Bool)

(declare-fun res!645471 () Bool)

(assert (=> b!964261 (=> (not res!645471) (not e!543591))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33841 0))(
  ( (V!33842 (val!10872 Int)) )
))
(declare-datatypes ((ValueCell!10340 0))(
  ( (ValueCellFull!10340 (v!13429 V!33841)) (EmptyCell!10340) )
))
(declare-datatypes ((array!59310 0))(
  ( (array!59311 (arr!28524 (Array (_ BitVec 32) ValueCell!10340)) (size!29005 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59310)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!964261 (= res!645471 (and (= (size!29005 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29004 _keys!1686) (size!29005 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964262 () Bool)

(declare-fun e!543593 () Bool)

(declare-fun mapRes!34459 () Bool)

(assert (=> b!964262 (= e!543593 (and e!543590 mapRes!34459))))

(declare-fun condMapEmpty!34459 () Bool)

(declare-fun mapDefault!34459 () ValueCell!10340)

(assert (=> b!964262 (= condMapEmpty!34459 (= (arr!28524 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10340)) mapDefault!34459)))))

(declare-fun b!964263 () Bool)

(declare-fun e!543592 () Bool)

(assert (=> b!964263 (= e!543591 (not e!543592))))

(declare-fun res!645472 () Bool)

(assert (=> b!964263 (=> res!645472 e!543592)))

(assert (=> b!964263 (= res!645472 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29004 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!33841)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33841)

(declare-datatypes ((tuple2!14042 0))(
  ( (tuple2!14043 (_1!7032 (_ BitVec 64)) (_2!7032 V!33841)) )
))
(declare-datatypes ((List!19850 0))(
  ( (Nil!19847) (Cons!19846 (h!21008 tuple2!14042) (t!28204 List!19850)) )
))
(declare-datatypes ((ListLongMap!12729 0))(
  ( (ListLongMap!12730 (toList!6380 List!19850)) )
))
(declare-fun contains!5427 (ListLongMap!12729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3542 (array!59308 array!59310 (_ BitVec 32) (_ BitVec 32) V!33841 V!33841 (_ BitVec 32) Int) ListLongMap!12729)

(assert (=> b!964263 (contains!5427 (getCurrentListMap!3542 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28523 _keys!1686) i!803))))

(declare-datatypes ((Unit!32146 0))(
  ( (Unit!32147) )
))
(declare-fun lt!430877 () Unit!32146)

(declare-fun lemmaInListMapFromThenInFromMinusOne!38 (array!59308 array!59310 (_ BitVec 32) (_ BitVec 32) V!33841 V!33841 (_ BitVec 32) (_ BitVec 32) Int) Unit!32146)

(assert (=> b!964263 (= lt!430877 (lemmaInListMapFromThenInFromMinusOne!38 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964264 () Bool)

(declare-fun res!645467 () Bool)

(assert (=> b!964264 (=> (not res!645467) (not e!543591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59308 (_ BitVec 32)) Bool)

(assert (=> b!964264 (= res!645467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964265 () Bool)

(declare-fun res!645468 () Bool)

(assert (=> b!964265 (=> (not res!645468) (not e!543591))))

(assert (=> b!964265 (= res!645468 (contains!5427 (getCurrentListMap!3542 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28523 _keys!1686) i!803)))))

(declare-fun b!964266 () Bool)

(declare-fun res!645470 () Bool)

(assert (=> b!964266 (=> (not res!645470) (not e!543591))))

(declare-datatypes ((List!19851 0))(
  ( (Nil!19848) (Cons!19847 (h!21009 (_ BitVec 64)) (t!28205 List!19851)) )
))
(declare-fun arrayNoDuplicates!0 (array!59308 (_ BitVec 32) List!19851) Bool)

(assert (=> b!964266 (= res!645470 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19848))))

(declare-fun res!645466 () Bool)

(assert (=> start!82690 (=> (not res!645466) (not e!543591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82690 (= res!645466 (validMask!0 mask!2110))))

(assert (=> start!82690 e!543591))

(assert (=> start!82690 true))

(declare-fun array_inv!22155 (array!59310) Bool)

(assert (=> start!82690 (and (array_inv!22155 _values!1400) e!543593)))

(declare-fun array_inv!22156 (array!59308) Bool)

(assert (=> start!82690 (array_inv!22156 _keys!1686)))

(assert (=> start!82690 tp!65643))

(assert (=> start!82690 tp_is_empty!21643))

(declare-fun b!964259 () Bool)

(declare-fun res!645465 () Bool)

(assert (=> b!964259 (=> (not res!645465) (not e!543591))))

(assert (=> b!964259 (= res!645465 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964267 () Bool)

(assert (=> b!964267 (= e!543592 true)))

(assert (=> b!964267 (contains!5427 (getCurrentListMap!3542 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28523 _keys!1686) i!803))))

(declare-fun lt!430876 () Unit!32146)

(declare-fun lemmaInListMapFromThenInFromSmaller!34 (array!59308 array!59310 (_ BitVec 32) (_ BitVec 32) V!33841 V!33841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32146)

(assert (=> b!964267 (= lt!430876 (lemmaInListMapFromThenInFromSmaller!34 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34459 () Bool)

(assert (=> mapIsEmpty!34459 mapRes!34459))

(declare-fun mapNonEmpty!34459 () Bool)

(declare-fun tp!65644 () Bool)

(assert (=> mapNonEmpty!34459 (= mapRes!34459 (and tp!65644 e!543595))))

(declare-fun mapRest!34459 () (Array (_ BitVec 32) ValueCell!10340))

(declare-fun mapValue!34459 () ValueCell!10340)

(declare-fun mapKey!34459 () (_ BitVec 32))

(assert (=> mapNonEmpty!34459 (= (arr!28524 _values!1400) (store mapRest!34459 mapKey!34459 mapValue!34459))))

(declare-fun b!964268 () Bool)

(declare-fun res!645473 () Bool)

(assert (=> b!964268 (=> (not res!645473) (not e!543591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964268 (= res!645473 (validKeyInArray!0 (select (arr!28523 _keys!1686) i!803)))))

(assert (= (and start!82690 res!645466) b!964261))

(assert (= (and b!964261 res!645471) b!964264))

(assert (= (and b!964264 res!645467) b!964266))

(assert (= (and b!964266 res!645470) b!964260))

(assert (= (and b!964260 res!645469) b!964268))

(assert (= (and b!964268 res!645473) b!964265))

(assert (= (and b!964265 res!645468) b!964259))

(assert (= (and b!964259 res!645465) b!964263))

(assert (= (and b!964263 (not res!645472)) b!964267))

(assert (= (and b!964262 condMapEmpty!34459) mapIsEmpty!34459))

(assert (= (and b!964262 (not condMapEmpty!34459)) mapNonEmpty!34459))

(get-info :version)

(assert (= (and mapNonEmpty!34459 ((_ is ValueCellFull!10340) mapValue!34459)) b!964257))

(assert (= (and b!964262 ((_ is ValueCellFull!10340) mapDefault!34459)) b!964258))

(assert (= start!82690 b!964262))

(declare-fun m!892987 () Bool)

(assert (=> b!964266 m!892987))

(declare-fun m!892989 () Bool)

(assert (=> start!82690 m!892989))

(declare-fun m!892991 () Bool)

(assert (=> start!82690 m!892991))

(declare-fun m!892993 () Bool)

(assert (=> start!82690 m!892993))

(declare-fun m!892995 () Bool)

(assert (=> b!964264 m!892995))

(declare-fun m!892997 () Bool)

(assert (=> b!964267 m!892997))

(declare-fun m!892999 () Bool)

(assert (=> b!964267 m!892999))

(assert (=> b!964267 m!892997))

(assert (=> b!964267 m!892999))

(declare-fun m!893001 () Bool)

(assert (=> b!964267 m!893001))

(declare-fun m!893003 () Bool)

(assert (=> b!964267 m!893003))

(declare-fun m!893005 () Bool)

(assert (=> b!964265 m!893005))

(assert (=> b!964265 m!892999))

(assert (=> b!964265 m!893005))

(assert (=> b!964265 m!892999))

(declare-fun m!893007 () Bool)

(assert (=> b!964265 m!893007))

(declare-fun m!893009 () Bool)

(assert (=> mapNonEmpty!34459 m!893009))

(assert (=> b!964268 m!892999))

(assert (=> b!964268 m!892999))

(declare-fun m!893011 () Bool)

(assert (=> b!964268 m!893011))

(declare-fun m!893013 () Bool)

(assert (=> b!964263 m!893013))

(assert (=> b!964263 m!892999))

(assert (=> b!964263 m!893013))

(assert (=> b!964263 m!892999))

(declare-fun m!893015 () Bool)

(assert (=> b!964263 m!893015))

(declare-fun m!893017 () Bool)

(assert (=> b!964263 m!893017))

(check-sat b_and!30303 (not b!964267) (not b!964264) (not b!964265) (not b!964263) (not mapNonEmpty!34459) (not b!964266) (not b_next!18841) (not b!964268) (not start!82690) tp_is_empty!21643)
(check-sat b_and!30303 (not b_next!18841))
