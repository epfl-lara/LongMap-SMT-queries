; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4148 () Bool)

(assert start!4148)

(declare-fun b_free!1057 () Bool)

(declare-fun b_next!1057 () Bool)

(assert (=> start!4148 (= b_free!1057 (not b_next!1057))))

(declare-fun tp!4590 () Bool)

(declare-fun b_and!1857 () Bool)

(assert (=> start!4148 (= tp!4590 b_and!1857)))

(declare-fun b!31205 () Bool)

(declare-fun e!19942 () Bool)

(assert (=> b!31205 (= e!19942 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1707 0))(
  ( (V!1708 (val!732 Int)) )
))
(declare-datatypes ((ValueCell!506 0))(
  ( (ValueCellFull!506 (v!1821 V!1707)) (EmptyCell!506) )
))
(declare-datatypes ((array!2025 0))(
  ( (array!2026 (arr!966 (Array (_ BitVec 32) ValueCell!506)) (size!1067 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2025)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2027 0))(
  ( (array!2028 (arr!967 (Array (_ BitVec 32) (_ BitVec 64))) (size!1068 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2027)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun lt!11502 () Bool)

(declare-fun zeroValue!1443 () V!1707)

(declare-fun minValue!1443 () V!1707)

(declare-datatypes ((tuple2!1194 0))(
  ( (tuple2!1195 (_1!608 (_ BitVec 64)) (_2!608 V!1707)) )
))
(declare-datatypes ((List!789 0))(
  ( (Nil!786) (Cons!785 (h!1352 tuple2!1194) (t!3476 List!789)) )
))
(declare-datatypes ((ListLongMap!765 0))(
  ( (ListLongMap!766 (toList!398 List!789)) )
))
(declare-fun contains!340 (ListLongMap!765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!223 (array!2027 array!2025 (_ BitVec 32) (_ BitVec 32) V!1707 V!1707 (_ BitVec 32) Int) ListLongMap!765)

(assert (=> b!31205 (= lt!11502 (contains!340 (getCurrentListMap!223 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!31206 () Bool)

(declare-fun e!19939 () Bool)

(declare-fun tp_is_empty!1411 () Bool)

(assert (=> b!31206 (= e!19939 tp_is_empty!1411)))

(declare-fun b!31207 () Bool)

(declare-fun e!19938 () Bool)

(assert (=> b!31207 (= e!19938 tp_is_empty!1411)))

(declare-fun b!31208 () Bool)

(declare-fun res!18899 () Bool)

(assert (=> b!31208 (=> (not res!18899) (not e!19942))))

(declare-datatypes ((List!790 0))(
  ( (Nil!787) (Cons!786 (h!1353 (_ BitVec 64)) (t!3477 List!790)) )
))
(declare-fun arrayNoDuplicates!0 (array!2027 (_ BitVec 32) List!790) Bool)

(assert (=> b!31208 (= res!18899 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!787))))

(declare-fun b!31209 () Bool)

(declare-fun res!18901 () Bool)

(assert (=> b!31209 (=> (not res!18901) (not e!19942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31209 (= res!18901 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1645 () Bool)

(declare-fun mapRes!1645 () Bool)

(declare-fun tp!4591 () Bool)

(assert (=> mapNonEmpty!1645 (= mapRes!1645 (and tp!4591 e!19938))))

(declare-fun mapValue!1645 () ValueCell!506)

(declare-fun mapRest!1645 () (Array (_ BitVec 32) ValueCell!506))

(declare-fun mapKey!1645 () (_ BitVec 32))

(assert (=> mapNonEmpty!1645 (= (arr!966 _values!1501) (store mapRest!1645 mapKey!1645 mapValue!1645))))

(declare-fun b!31210 () Bool)

(declare-fun res!18900 () Bool)

(assert (=> b!31210 (=> (not res!18900) (not e!19942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2027 (_ BitVec 32)) Bool)

(assert (=> b!31210 (= res!18900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31211 () Bool)

(declare-fun e!19941 () Bool)

(assert (=> b!31211 (= e!19941 (and e!19939 mapRes!1645))))

(declare-fun condMapEmpty!1645 () Bool)

(declare-fun mapDefault!1645 () ValueCell!506)

(assert (=> b!31211 (= condMapEmpty!1645 (= (arr!966 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!506)) mapDefault!1645)))))

(declare-fun b!31212 () Bool)

(declare-fun res!18902 () Bool)

(assert (=> b!31212 (=> (not res!18902) (not e!19942))))

(assert (=> b!31212 (= res!18902 (and (= (size!1067 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1068 _keys!1833) (size!1067 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1645 () Bool)

(assert (=> mapIsEmpty!1645 mapRes!1645))

(declare-fun res!18898 () Bool)

(assert (=> start!4148 (=> (not res!18898) (not e!19942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4148 (= res!18898 (validMask!0 mask!2294))))

(assert (=> start!4148 e!19942))

(assert (=> start!4148 true))

(assert (=> start!4148 tp!4590))

(declare-fun array_inv!663 (array!2025) Bool)

(assert (=> start!4148 (and (array_inv!663 _values!1501) e!19941)))

(declare-fun array_inv!664 (array!2027) Bool)

(assert (=> start!4148 (array_inv!664 _keys!1833)))

(assert (=> start!4148 tp_is_empty!1411))

(assert (= (and start!4148 res!18898) b!31212))

(assert (= (and b!31212 res!18902) b!31210))

(assert (= (and b!31210 res!18900) b!31208))

(assert (= (and b!31208 res!18899) b!31209))

(assert (= (and b!31209 res!18901) b!31205))

(assert (= (and b!31211 condMapEmpty!1645) mapIsEmpty!1645))

(assert (= (and b!31211 (not condMapEmpty!1645)) mapNonEmpty!1645))

(get-info :version)

(assert (= (and mapNonEmpty!1645 ((_ is ValueCellFull!506) mapValue!1645)) b!31207))

(assert (= (and b!31211 ((_ is ValueCellFull!506) mapDefault!1645)) b!31206))

(assert (= start!4148 b!31211))

(declare-fun m!24947 () Bool)

(assert (=> b!31209 m!24947))

(declare-fun m!24949 () Bool)

(assert (=> b!31205 m!24949))

(assert (=> b!31205 m!24949))

(declare-fun m!24951 () Bool)

(assert (=> b!31205 m!24951))

(declare-fun m!24953 () Bool)

(assert (=> mapNonEmpty!1645 m!24953))

(declare-fun m!24955 () Bool)

(assert (=> b!31208 m!24955))

(declare-fun m!24957 () Bool)

(assert (=> b!31210 m!24957))

(declare-fun m!24959 () Bool)

(assert (=> start!4148 m!24959))

(declare-fun m!24961 () Bool)

(assert (=> start!4148 m!24961))

(declare-fun m!24963 () Bool)

(assert (=> start!4148 m!24963))

(check-sat (not b!31210) (not b!31205) (not b!31209) (not b!31208) (not mapNonEmpty!1645) tp_is_empty!1411 (not start!4148) b_and!1857 (not b_next!1057))
(check-sat b_and!1857 (not b_next!1057))
