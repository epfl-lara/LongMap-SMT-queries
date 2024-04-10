; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4070 () Bool)

(assert start!4070)

(declare-fun b_free!975 () Bool)

(declare-fun b_next!975 () Bool)

(assert (=> start!4070 (= b_free!975 (not b_next!975))))

(declare-fun tp!4345 () Bool)

(declare-fun b_and!1785 () Bool)

(assert (=> start!4070 (= tp!4345 b_and!1785)))

(declare-fun b!30015 () Bool)

(declare-fun e!19322 () Bool)

(declare-fun tp_is_empty!1329 () Bool)

(assert (=> b!30015 (= e!19322 tp_is_empty!1329)))

(declare-fun b!30016 () Bool)

(declare-fun res!18047 () Bool)

(declare-fun e!19325 () Bool)

(assert (=> b!30016 (=> (not res!18047) (not e!19325))))

(declare-datatypes ((V!1597 0))(
  ( (V!1598 (val!691 Int)) )
))
(declare-datatypes ((ValueCell!465 0))(
  ( (ValueCellFull!465 (v!1780 V!1597)) (EmptyCell!465) )
))
(declare-datatypes ((array!1887 0))(
  ( (array!1888 (arr!897 (Array (_ BitVec 32) ValueCell!465)) (size!998 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1887)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1889 0))(
  ( (array!1890 (arr!898 (Array (_ BitVec 32) (_ BitVec 64))) (size!999 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1889)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!30016 (= res!18047 (and (= (size!998 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!999 _keys!1833) (size!998 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30017 () Bool)

(declare-fun e!19321 () Bool)

(declare-fun e!19324 () Bool)

(declare-fun mapRes!1522 () Bool)

(assert (=> b!30017 (= e!19321 (and e!19324 mapRes!1522))))

(declare-fun condMapEmpty!1522 () Bool)

(declare-fun mapDefault!1522 () ValueCell!465)

(assert (=> b!30017 (= condMapEmpty!1522 (= (arr!897 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!465)) mapDefault!1522)))))

(declare-fun b!30019 () Bool)

(assert (=> b!30019 (= e!19325 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!95 0))(
  ( (MissingZero!95 (index!2502 (_ BitVec 32))) (Found!95 (index!2503 (_ BitVec 32))) (Intermediate!95 (undefined!907 Bool) (index!2504 (_ BitVec 32)) (x!6485 (_ BitVec 32))) (Undefined!95) (MissingVacant!95 (index!2505 (_ BitVec 32))) )
))
(declare-fun lt!11378 () SeekEntryResult!95)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1889 (_ BitVec 32)) SeekEntryResult!95)

(assert (=> b!30019 (= lt!11378 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1522 () Bool)

(declare-fun tp!4344 () Bool)

(assert (=> mapNonEmpty!1522 (= mapRes!1522 (and tp!4344 e!19322))))

(declare-fun mapRest!1522 () (Array (_ BitVec 32) ValueCell!465))

(declare-fun mapKey!1522 () (_ BitVec 32))

(declare-fun mapValue!1522 () ValueCell!465)

(assert (=> mapNonEmpty!1522 (= (arr!897 _values!1501) (store mapRest!1522 mapKey!1522 mapValue!1522))))

(declare-fun b!30020 () Bool)

(declare-fun res!18048 () Bool)

(assert (=> b!30020 (=> (not res!18048) (not e!19325))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1597)

(declare-fun minValue!1443 () V!1597)

(declare-datatypes ((tuple2!1146 0))(
  ( (tuple2!1147 (_1!584 (_ BitVec 64)) (_2!584 V!1597)) )
))
(declare-datatypes ((List!742 0))(
  ( (Nil!739) (Cons!738 (h!1305 tuple2!1146) (t!3435 List!742)) )
))
(declare-datatypes ((ListLongMap!723 0))(
  ( (ListLongMap!724 (toList!377 List!742)) )
))
(declare-fun contains!317 (ListLongMap!723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!205 (array!1889 array!1887 (_ BitVec 32) (_ BitVec 32) V!1597 V!1597 (_ BitVec 32) Int) ListLongMap!723)

(assert (=> b!30020 (= res!18048 (not (contains!317 (getCurrentListMap!205 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30021 () Bool)

(assert (=> b!30021 (= e!19324 tp_is_empty!1329)))

(declare-fun b!30022 () Bool)

(declare-fun res!18050 () Bool)

(assert (=> b!30022 (=> (not res!18050) (not e!19325))))

(declare-datatypes ((List!743 0))(
  ( (Nil!740) (Cons!739 (h!1306 (_ BitVec 64)) (t!3436 List!743)) )
))
(declare-fun arrayNoDuplicates!0 (array!1889 (_ BitVec 32) List!743) Bool)

(assert (=> b!30022 (= res!18050 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!740))))

(declare-fun b!30023 () Bool)

(declare-fun res!18045 () Bool)

(assert (=> b!30023 (=> (not res!18045) (not e!19325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1889 (_ BitVec 32)) Bool)

(assert (=> b!30023 (= res!18045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30024 () Bool)

(declare-fun res!18046 () Bool)

(assert (=> b!30024 (=> (not res!18046) (not e!19325))))

(declare-fun arrayContainsKey!0 (array!1889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30024 (= res!18046 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!1522 () Bool)

(assert (=> mapIsEmpty!1522 mapRes!1522))

(declare-fun res!18049 () Bool)

(assert (=> start!4070 (=> (not res!18049) (not e!19325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4070 (= res!18049 (validMask!0 mask!2294))))

(assert (=> start!4070 e!19325))

(assert (=> start!4070 true))

(assert (=> start!4070 tp!4345))

(declare-fun array_inv!625 (array!1887) Bool)

(assert (=> start!4070 (and (array_inv!625 _values!1501) e!19321)))

(declare-fun array_inv!626 (array!1889) Bool)

(assert (=> start!4070 (array_inv!626 _keys!1833)))

(assert (=> start!4070 tp_is_empty!1329))

(declare-fun b!30018 () Bool)

(declare-fun res!18051 () Bool)

(assert (=> b!30018 (=> (not res!18051) (not e!19325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30018 (= res!18051 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4070 res!18049) b!30016))

(assert (= (and b!30016 res!18047) b!30023))

(assert (= (and b!30023 res!18045) b!30022))

(assert (= (and b!30022 res!18050) b!30018))

(assert (= (and b!30018 res!18051) b!30020))

(assert (= (and b!30020 res!18048) b!30024))

(assert (= (and b!30024 res!18046) b!30019))

(assert (= (and b!30017 condMapEmpty!1522) mapIsEmpty!1522))

(assert (= (and b!30017 (not condMapEmpty!1522)) mapNonEmpty!1522))

(get-info :version)

(assert (= (and mapNonEmpty!1522 ((_ is ValueCellFull!465) mapValue!1522)) b!30015))

(assert (= (and b!30017 ((_ is ValueCellFull!465) mapDefault!1522)) b!30021))

(assert (= start!4070 b!30017))

(declare-fun m!24143 () Bool)

(assert (=> b!30024 m!24143))

(declare-fun m!24145 () Bool)

(assert (=> b!30019 m!24145))

(declare-fun m!24147 () Bool)

(assert (=> start!4070 m!24147))

(declare-fun m!24149 () Bool)

(assert (=> start!4070 m!24149))

(declare-fun m!24151 () Bool)

(assert (=> start!4070 m!24151))

(declare-fun m!24153 () Bool)

(assert (=> b!30022 m!24153))

(declare-fun m!24155 () Bool)

(assert (=> b!30020 m!24155))

(assert (=> b!30020 m!24155))

(declare-fun m!24157 () Bool)

(assert (=> b!30020 m!24157))

(declare-fun m!24159 () Bool)

(assert (=> mapNonEmpty!1522 m!24159))

(declare-fun m!24161 () Bool)

(assert (=> b!30018 m!24161))

(declare-fun m!24163 () Bool)

(assert (=> b!30023 m!24163))

(check-sat (not b!30018) (not start!4070) (not b!30022) (not b!30023) (not b!30024) (not b_next!975) (not b!30019) tp_is_empty!1329 b_and!1785 (not b!30020) (not mapNonEmpty!1522))
(check-sat b_and!1785 (not b_next!975))
