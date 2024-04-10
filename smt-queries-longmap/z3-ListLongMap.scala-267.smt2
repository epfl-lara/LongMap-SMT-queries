; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4402 () Bool)

(assert start!4402)

(declare-fun b_free!1191 () Bool)

(declare-fun b_next!1191 () Bool)

(assert (=> start!4402 (= b_free!1191 (not b_next!1191))))

(declare-fun tp!5007 () Bool)

(declare-fun b_and!2011 () Bool)

(assert (=> start!4402 (= tp!5007 b_and!2011)))

(declare-fun b!33932 () Bool)

(declare-fun res!20586 () Bool)

(declare-fun e!21549 () Bool)

(assert (=> b!33932 (=> (not res!20586) (not e!21549))))

(declare-datatypes ((array!2305 0))(
  ( (array!2306 (arr!1101 (Array (_ BitVec 32) (_ BitVec 64))) (size!1202 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2305)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2305 (_ BitVec 32)) Bool)

(assert (=> b!33932 (= res!20586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33933 () Bool)

(declare-fun e!21551 () Bool)

(assert (=> b!33933 (= e!21549 e!21551)))

(declare-fun res!20584 () Bool)

(assert (=> b!33933 (=> (not res!20584) (not e!21551))))

(declare-datatypes ((V!1885 0))(
  ( (V!1886 (val!799 Int)) )
))
(declare-datatypes ((tuple2!1300 0))(
  ( (tuple2!1301 (_1!661 (_ BitVec 64)) (_2!661 V!1885)) )
))
(declare-datatypes ((List!890 0))(
  ( (Nil!887) (Cons!886 (h!1453 tuple2!1300) (t!3593 List!890)) )
))
(declare-datatypes ((ListLongMap!877 0))(
  ( (ListLongMap!878 (toList!454 List!890)) )
))
(declare-fun lt!12521 () ListLongMap!877)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!399 (ListLongMap!877 (_ BitVec 64)) Bool)

(assert (=> b!33933 (= res!20584 (not (contains!399 lt!12521 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((ValueCell!573 0))(
  ( (ValueCellFull!573 (v!1893 V!1885)) (EmptyCell!573) )
))
(declare-datatypes ((array!2307 0))(
  ( (array!2308 (arr!1102 (Array (_ BitVec 32) ValueCell!573)) (size!1203 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2307)

(declare-fun zeroValue!1443 () V!1885)

(declare-fun minValue!1443 () V!1885)

(declare-fun getCurrentListMap!279 (array!2305 array!2307 (_ BitVec 32) (_ BitVec 32) V!1885 V!1885 (_ BitVec 32) Int) ListLongMap!877)

(assert (=> b!33933 (= lt!12521 (getCurrentListMap!279 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33934 () Bool)

(declare-fun res!20585 () Bool)

(assert (=> b!33934 (=> (not res!20585) (not e!21549))))

(declare-datatypes ((List!891 0))(
  ( (Nil!888) (Cons!887 (h!1454 (_ BitVec 64)) (t!3594 List!891)) )
))
(declare-fun arrayNoDuplicates!0 (array!2305 (_ BitVec 32) List!891) Bool)

(assert (=> b!33934 (= res!20585 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!888))))

(declare-fun b!33935 () Bool)

(declare-fun res!20581 () Bool)

(assert (=> b!33935 (=> (not res!20581) (not e!21549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33935 (= res!20581 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1861 () Bool)

(declare-fun mapRes!1861 () Bool)

(assert (=> mapIsEmpty!1861 mapRes!1861))

(declare-fun res!20583 () Bool)

(assert (=> start!4402 (=> (not res!20583) (not e!21549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4402 (= res!20583 (validMask!0 mask!2294))))

(assert (=> start!4402 e!21549))

(assert (=> start!4402 true))

(assert (=> start!4402 tp!5007))

(declare-fun e!21547 () Bool)

(declare-fun array_inv!775 (array!2307) Bool)

(assert (=> start!4402 (and (array_inv!775 _values!1501) e!21547)))

(declare-fun array_inv!776 (array!2305) Bool)

(assert (=> start!4402 (array_inv!776 _keys!1833)))

(declare-fun tp_is_empty!1545 () Bool)

(assert (=> start!4402 tp_is_empty!1545))

(declare-fun b!33936 () Bool)

(declare-fun res!20582 () Bool)

(assert (=> b!33936 (=> (not res!20582) (not e!21549))))

(assert (=> b!33936 (= res!20582 (and (= (size!1203 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1202 _keys!1833) (size!1203 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33937 () Bool)

(declare-fun e!21550 () Bool)

(assert (=> b!33937 (= e!21547 (and e!21550 mapRes!1861))))

(declare-fun condMapEmpty!1861 () Bool)

(declare-fun mapDefault!1861 () ValueCell!573)

(assert (=> b!33937 (= condMapEmpty!1861 (= (arr!1102 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!573)) mapDefault!1861)))))

(declare-fun b!33938 () Bool)

(declare-fun e!21548 () Bool)

(assert (=> b!33938 (= e!21548 tp_is_empty!1545)))

(declare-fun b!33939 () Bool)

(assert (=> b!33939 (= e!21550 tp_is_empty!1545)))

(declare-fun b!33940 () Bool)

(declare-fun res!20580 () Bool)

(assert (=> b!33940 (=> (not res!20580) (not e!21551))))

(declare-fun arrayContainsKey!0 (array!2305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33940 (= res!20580 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33941 () Bool)

(assert (=> b!33941 (= e!21551 (not true))))

(declare-datatypes ((SeekEntryResult!134 0))(
  ( (MissingZero!134 (index!2658 (_ BitVec 32))) (Found!134 (index!2659 (_ BitVec 32))) (Intermediate!134 (undefined!946 Bool) (index!2660 (_ BitVec 32)) (x!6862 (_ BitVec 32))) (Undefined!134) (MissingVacant!134 (index!2661 (_ BitVec 32))) )
))
(declare-fun lt!12520 () SeekEntryResult!134)

(declare-fun lt!12518 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33941 (and ((_ is Found!134) lt!12520) (= (index!2659 lt!12520) lt!12518))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2305 (_ BitVec 32)) SeekEntryResult!134)

(assert (=> b!33941 (= lt!12520 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!762 0))(
  ( (Unit!763) )
))
(declare-fun lt!12519 () Unit!762)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2305 (_ BitVec 32)) Unit!762)

(assert (=> b!33941 (= lt!12519 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12518 _keys!1833 mask!2294))))

(assert (=> b!33941 (contains!399 lt!12521 (select (arr!1101 _keys!1833) lt!12518))))

(declare-fun lt!12517 () Unit!762)

(declare-fun lemmaValidKeyInArrayIsInListMap!66 (array!2305 array!2307 (_ BitVec 32) (_ BitVec 32) V!1885 V!1885 (_ BitVec 32) Int) Unit!762)

(assert (=> b!33941 (= lt!12517 (lemmaValidKeyInArrayIsInListMap!66 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12518 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2305 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33941 (= lt!12518 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1861 () Bool)

(declare-fun tp!5008 () Bool)

(assert (=> mapNonEmpty!1861 (= mapRes!1861 (and tp!5008 e!21548))))

(declare-fun mapKey!1861 () (_ BitVec 32))

(declare-fun mapValue!1861 () ValueCell!573)

(declare-fun mapRest!1861 () (Array (_ BitVec 32) ValueCell!573))

(assert (=> mapNonEmpty!1861 (= (arr!1102 _values!1501) (store mapRest!1861 mapKey!1861 mapValue!1861))))

(assert (= (and start!4402 res!20583) b!33936))

(assert (= (and b!33936 res!20582) b!33932))

(assert (= (and b!33932 res!20586) b!33934))

(assert (= (and b!33934 res!20585) b!33935))

(assert (= (and b!33935 res!20581) b!33933))

(assert (= (and b!33933 res!20584) b!33940))

(assert (= (and b!33940 res!20580) b!33941))

(assert (= (and b!33937 condMapEmpty!1861) mapIsEmpty!1861))

(assert (= (and b!33937 (not condMapEmpty!1861)) mapNonEmpty!1861))

(assert (= (and mapNonEmpty!1861 ((_ is ValueCellFull!573) mapValue!1861)) b!33938))

(assert (= (and b!33937 ((_ is ValueCellFull!573) mapDefault!1861)) b!33939))

(assert (= start!4402 b!33937))

(declare-fun m!27279 () Bool)

(assert (=> b!33940 m!27279))

(declare-fun m!27281 () Bool)

(assert (=> b!33933 m!27281))

(declare-fun m!27283 () Bool)

(assert (=> b!33933 m!27283))

(declare-fun m!27285 () Bool)

(assert (=> b!33935 m!27285))

(declare-fun m!27287 () Bool)

(assert (=> b!33934 m!27287))

(declare-fun m!27289 () Bool)

(assert (=> mapNonEmpty!1861 m!27289))

(declare-fun m!27291 () Bool)

(assert (=> b!33941 m!27291))

(declare-fun m!27293 () Bool)

(assert (=> b!33941 m!27293))

(declare-fun m!27295 () Bool)

(assert (=> b!33941 m!27295))

(declare-fun m!27297 () Bool)

(assert (=> b!33941 m!27297))

(declare-fun m!27299 () Bool)

(assert (=> b!33941 m!27299))

(assert (=> b!33941 m!27295))

(declare-fun m!27301 () Bool)

(assert (=> b!33941 m!27301))

(declare-fun m!27303 () Bool)

(assert (=> b!33932 m!27303))

(declare-fun m!27305 () Bool)

(assert (=> start!4402 m!27305))

(declare-fun m!27307 () Bool)

(assert (=> start!4402 m!27307))

(declare-fun m!27309 () Bool)

(assert (=> start!4402 m!27309))

(check-sat (not b!33940) (not b!33934) (not b!33932) (not b_next!1191) (not mapNonEmpty!1861) (not b!33935) (not start!4402) tp_is_empty!1545 (not b!33941) (not b!33933) b_and!2011)
(check-sat b_and!2011 (not b_next!1191))
