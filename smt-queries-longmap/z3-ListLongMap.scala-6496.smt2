; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82984 () Bool)

(assert start!82984)

(declare-fun b_free!18943 () Bool)

(declare-fun b_next!18943 () Bool)

(assert (=> start!82984 (= b_free!18943 (not b_next!18943))))

(declare-fun tp!65958 () Bool)

(declare-fun b_and!30441 () Bool)

(assert (=> start!82984 (= tp!65958 b_and!30441)))

(declare-fun b!966950 () Bool)

(declare-fun res!646988 () Bool)

(declare-fun e!545165 () Bool)

(assert (=> b!966950 (=> (not res!646988) (not e!545165))))

(declare-datatypes ((array!59600 0))(
  ( (array!59601 (arr!28664 (Array (_ BitVec 32) (_ BitVec 64))) (size!29144 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59600)

(declare-datatypes ((List!19883 0))(
  ( (Nil!19880) (Cons!19879 (h!21047 (_ BitVec 64)) (t!28238 List!19883)) )
))
(declare-fun arrayNoDuplicates!0 (array!59600 (_ BitVec 32) List!19883) Bool)

(assert (=> b!966950 (= res!646988 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19880))))

(declare-fun mapNonEmpty!34621 () Bool)

(declare-fun mapRes!34621 () Bool)

(declare-fun tp!65959 () Bool)

(declare-fun e!545166 () Bool)

(assert (=> mapNonEmpty!34621 (= mapRes!34621 (and tp!65959 e!545166))))

(declare-datatypes ((V!33985 0))(
  ( (V!33986 (val!10926 Int)) )
))
(declare-datatypes ((ValueCell!10394 0))(
  ( (ValueCellFull!10394 (v!13481 V!33985)) (EmptyCell!10394) )
))
(declare-fun mapRest!34621 () (Array (_ BitVec 32) ValueCell!10394))

(declare-fun mapKey!34621 () (_ BitVec 32))

(declare-datatypes ((array!59602 0))(
  ( (array!59603 (arr!28665 (Array (_ BitVec 32) ValueCell!10394)) (size!29145 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59602)

(declare-fun mapValue!34621 () ValueCell!10394)

(assert (=> mapNonEmpty!34621 (= (arr!28665 _values!1400) (store mapRest!34621 mapKey!34621 mapValue!34621))))

(declare-fun mapIsEmpty!34621 () Bool)

(assert (=> mapIsEmpty!34621 mapRes!34621))

(declare-fun b!966951 () Bool)

(assert (=> b!966951 (= e!545165 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431651 () Bool)

(declare-fun minValue!1342 () V!33985)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33985)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14034 0))(
  ( (tuple2!14035 (_1!7028 (_ BitVec 64)) (_2!7028 V!33985)) )
))
(declare-datatypes ((List!19884 0))(
  ( (Nil!19881) (Cons!19880 (h!21048 tuple2!14034) (t!28239 List!19884)) )
))
(declare-datatypes ((ListLongMap!12733 0))(
  ( (ListLongMap!12734 (toList!6382 List!19884)) )
))
(declare-fun contains!5494 (ListLongMap!12733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3615 (array!59600 array!59602 (_ BitVec 32) (_ BitVec 32) V!33985 V!33985 (_ BitVec 32) Int) ListLongMap!12733)

(assert (=> b!966951 (= lt!431651 (contains!5494 (getCurrentListMap!3615 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28664 _keys!1686) i!803)))))

(declare-fun b!966952 () Bool)

(declare-fun res!646989 () Bool)

(assert (=> b!966952 (=> (not res!646989) (not e!545165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59600 (_ BitVec 32)) Bool)

(assert (=> b!966952 (= res!646989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966953 () Bool)

(declare-fun e!545168 () Bool)

(declare-fun tp_is_empty!21751 () Bool)

(assert (=> b!966953 (= e!545168 tp_is_empty!21751)))

(declare-fun res!646986 () Bool)

(assert (=> start!82984 (=> (not res!646986) (not e!545165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82984 (= res!646986 (validMask!0 mask!2110))))

(assert (=> start!82984 e!545165))

(assert (=> start!82984 true))

(declare-fun e!545164 () Bool)

(declare-fun array_inv!22255 (array!59602) Bool)

(assert (=> start!82984 (and (array_inv!22255 _values!1400) e!545164)))

(declare-fun array_inv!22256 (array!59600) Bool)

(assert (=> start!82984 (array_inv!22256 _keys!1686)))

(assert (=> start!82984 tp!65958))

(assert (=> start!82984 tp_is_empty!21751))

(declare-fun b!966954 () Bool)

(assert (=> b!966954 (= e!545164 (and e!545168 mapRes!34621))))

(declare-fun condMapEmpty!34621 () Bool)

(declare-fun mapDefault!34621 () ValueCell!10394)

(assert (=> b!966954 (= condMapEmpty!34621 (= (arr!28665 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10394)) mapDefault!34621)))))

(declare-fun b!966955 () Bool)

(declare-fun res!646985 () Bool)

(assert (=> b!966955 (=> (not res!646985) (not e!545165))))

(assert (=> b!966955 (= res!646985 (and (= (size!29145 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29144 _keys!1686) (size!29145 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966956 () Bool)

(declare-fun res!646984 () Bool)

(assert (=> b!966956 (=> (not res!646984) (not e!545165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966956 (= res!646984 (validKeyInArray!0 (select (arr!28664 _keys!1686) i!803)))))

(declare-fun b!966957 () Bool)

(assert (=> b!966957 (= e!545166 tp_is_empty!21751)))

(declare-fun b!966958 () Bool)

(declare-fun res!646987 () Bool)

(assert (=> b!966958 (=> (not res!646987) (not e!545165))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966958 (= res!646987 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29144 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29144 _keys!1686))))))

(assert (= (and start!82984 res!646986) b!966955))

(assert (= (and b!966955 res!646985) b!966952))

(assert (= (and b!966952 res!646989) b!966950))

(assert (= (and b!966950 res!646988) b!966958))

(assert (= (and b!966958 res!646987) b!966956))

(assert (= (and b!966956 res!646984) b!966951))

(assert (= (and b!966954 condMapEmpty!34621) mapIsEmpty!34621))

(assert (= (and b!966954 (not condMapEmpty!34621)) mapNonEmpty!34621))

(get-info :version)

(assert (= (and mapNonEmpty!34621 ((_ is ValueCellFull!10394) mapValue!34621)) b!966957))

(assert (= (and b!966954 ((_ is ValueCellFull!10394) mapDefault!34621)) b!966953))

(assert (= start!82984 b!966954))

(declare-fun m!896233 () Bool)

(assert (=> b!966952 m!896233))

(declare-fun m!896235 () Bool)

(assert (=> start!82984 m!896235))

(declare-fun m!896237 () Bool)

(assert (=> start!82984 m!896237))

(declare-fun m!896239 () Bool)

(assert (=> start!82984 m!896239))

(declare-fun m!896241 () Bool)

(assert (=> b!966956 m!896241))

(assert (=> b!966956 m!896241))

(declare-fun m!896243 () Bool)

(assert (=> b!966956 m!896243))

(declare-fun m!896245 () Bool)

(assert (=> mapNonEmpty!34621 m!896245))

(declare-fun m!896247 () Bool)

(assert (=> b!966951 m!896247))

(assert (=> b!966951 m!896241))

(assert (=> b!966951 m!896247))

(assert (=> b!966951 m!896241))

(declare-fun m!896249 () Bool)

(assert (=> b!966951 m!896249))

(declare-fun m!896251 () Bool)

(assert (=> b!966950 m!896251))

(check-sat (not start!82984) (not b!966950) tp_is_empty!21751 (not b!966952) (not mapNonEmpty!34621) (not b!966956) (not b_next!18943) (not b!966951) b_and!30441)
(check-sat b_and!30441 (not b_next!18943))
