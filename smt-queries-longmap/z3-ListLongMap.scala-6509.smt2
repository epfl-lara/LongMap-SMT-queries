; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83062 () Bool)

(assert start!83062)

(declare-fun b_free!19021 () Bool)

(declare-fun b_next!19021 () Bool)

(assert (=> start!83062 (= b_free!19021 (not b_next!19021))))

(declare-fun tp!66192 () Bool)

(declare-fun b_and!30519 () Bool)

(assert (=> start!83062 (= tp!66192 b_and!30519)))

(declare-fun b!968088 () Bool)

(declare-fun res!647774 () Bool)

(declare-fun e!545751 () Bool)

(assert (=> b!968088 (=> (not res!647774) (not e!545751))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34089 0))(
  ( (V!34090 (val!10965 Int)) )
))
(declare-datatypes ((ValueCell!10433 0))(
  ( (ValueCellFull!10433 (v!13520 V!34089)) (EmptyCell!10433) )
))
(declare-datatypes ((array!59756 0))(
  ( (array!59757 (arr!28742 (Array (_ BitVec 32) ValueCell!10433)) (size!29222 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59756)

(declare-datatypes ((array!59758 0))(
  ( (array!59759 (arr!28743 (Array (_ BitVec 32) (_ BitVec 64))) (size!29223 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59758)

(declare-fun minValue!1342 () V!34089)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34089)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14092 0))(
  ( (tuple2!14093 (_1!7057 (_ BitVec 64)) (_2!7057 V!34089)) )
))
(declare-datatypes ((List!19937 0))(
  ( (Nil!19934) (Cons!19933 (h!21101 tuple2!14092) (t!28292 List!19937)) )
))
(declare-datatypes ((ListLongMap!12791 0))(
  ( (ListLongMap!12792 (toList!6411 List!19937)) )
))
(declare-fun contains!5523 (ListLongMap!12791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3644 (array!59758 array!59756 (_ BitVec 32) (_ BitVec 32) V!34089 V!34089 (_ BitVec 32) Int) ListLongMap!12791)

(assert (=> b!968088 (= res!647774 (contains!5523 (getCurrentListMap!3644 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28743 _keys!1686) i!803)))))

(declare-fun b!968089 () Bool)

(declare-fun res!647776 () Bool)

(assert (=> b!968089 (=> (not res!647776) (not e!545751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59758 (_ BitVec 32)) Bool)

(assert (=> b!968089 (= res!647776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968090 () Bool)

(declare-fun e!545749 () Bool)

(declare-fun tp_is_empty!21829 () Bool)

(assert (=> b!968090 (= e!545749 tp_is_empty!21829)))

(declare-fun b!968091 () Bool)

(declare-fun res!647775 () Bool)

(assert (=> b!968091 (=> (not res!647775) (not e!545751))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968091 (= res!647775 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29223 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29223 _keys!1686))))))

(declare-fun b!968092 () Bool)

(declare-fun res!647777 () Bool)

(assert (=> b!968092 (=> (not res!647777) (not e!545751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968092 (= res!647777 (validKeyInArray!0 (select (arr!28743 _keys!1686) i!803)))))

(declare-fun b!968093 () Bool)

(declare-fun e!545752 () Bool)

(assert (=> b!968093 (= e!545752 tp_is_empty!21829)))

(declare-fun b!968094 () Bool)

(assert (=> b!968094 (= e!545751 (not true))))

(assert (=> b!968094 (contains!5523 (getCurrentListMap!3644 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28743 _keys!1686) i!803))))

(declare-datatypes ((Unit!32276 0))(
  ( (Unit!32277) )
))
(declare-fun lt!431759 () Unit!32276)

(declare-fun lemmaInListMapFromThenInFromMinusOne!49 (array!59758 array!59756 (_ BitVec 32) (_ BitVec 32) V!34089 V!34089 (_ BitVec 32) (_ BitVec 32) Int) Unit!32276)

(assert (=> b!968094 (= lt!431759 (lemmaInListMapFromThenInFromMinusOne!49 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968095 () Bool)

(declare-fun res!647771 () Bool)

(assert (=> b!968095 (=> (not res!647771) (not e!545751))))

(assert (=> b!968095 (= res!647771 (and (= (size!29222 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29223 _keys!1686) (size!29222 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34738 () Bool)

(declare-fun mapRes!34738 () Bool)

(assert (=> mapIsEmpty!34738 mapRes!34738))

(declare-fun b!968096 () Bool)

(declare-fun res!647773 () Bool)

(assert (=> b!968096 (=> (not res!647773) (not e!545751))))

(declare-datatypes ((List!19938 0))(
  ( (Nil!19935) (Cons!19934 (h!21102 (_ BitVec 64)) (t!28293 List!19938)) )
))
(declare-fun arrayNoDuplicates!0 (array!59758 (_ BitVec 32) List!19938) Bool)

(assert (=> b!968096 (= res!647773 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19935))))

(declare-fun b!968097 () Bool)

(declare-fun e!545750 () Bool)

(assert (=> b!968097 (= e!545750 (and e!545752 mapRes!34738))))

(declare-fun condMapEmpty!34738 () Bool)

(declare-fun mapDefault!34738 () ValueCell!10433)

(assert (=> b!968097 (= condMapEmpty!34738 (= (arr!28742 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10433)) mapDefault!34738)))))

(declare-fun res!647778 () Bool)

(assert (=> start!83062 (=> (not res!647778) (not e!545751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83062 (= res!647778 (validMask!0 mask!2110))))

(assert (=> start!83062 e!545751))

(assert (=> start!83062 true))

(declare-fun array_inv!22311 (array!59756) Bool)

(assert (=> start!83062 (and (array_inv!22311 _values!1400) e!545750)))

(declare-fun array_inv!22312 (array!59758) Bool)

(assert (=> start!83062 (array_inv!22312 _keys!1686)))

(assert (=> start!83062 tp!66192))

(assert (=> start!83062 tp_is_empty!21829))

(declare-fun mapNonEmpty!34738 () Bool)

(declare-fun tp!66193 () Bool)

(assert (=> mapNonEmpty!34738 (= mapRes!34738 (and tp!66193 e!545749))))

(declare-fun mapKey!34738 () (_ BitVec 32))

(declare-fun mapRest!34738 () (Array (_ BitVec 32) ValueCell!10433))

(declare-fun mapValue!34738 () ValueCell!10433)

(assert (=> mapNonEmpty!34738 (= (arr!28742 _values!1400) (store mapRest!34738 mapKey!34738 mapValue!34738))))

(declare-fun b!968098 () Bool)

(declare-fun res!647772 () Bool)

(assert (=> b!968098 (=> (not res!647772) (not e!545751))))

(assert (=> b!968098 (= res!647772 (bvsgt from!2084 newFrom!159))))

(assert (= (and start!83062 res!647778) b!968095))

(assert (= (and b!968095 res!647771) b!968089))

(assert (= (and b!968089 res!647776) b!968096))

(assert (= (and b!968096 res!647773) b!968091))

(assert (= (and b!968091 res!647775) b!968092))

(assert (= (and b!968092 res!647777) b!968088))

(assert (= (and b!968088 res!647774) b!968098))

(assert (= (and b!968098 res!647772) b!968094))

(assert (= (and b!968097 condMapEmpty!34738) mapIsEmpty!34738))

(assert (= (and b!968097 (not condMapEmpty!34738)) mapNonEmpty!34738))

(get-info :version)

(assert (= (and mapNonEmpty!34738 ((_ is ValueCellFull!10433) mapValue!34738)) b!968090))

(assert (= (and b!968097 ((_ is ValueCellFull!10433) mapDefault!34738)) b!968093))

(assert (= start!83062 b!968097))

(declare-fun m!897085 () Bool)

(assert (=> mapNonEmpty!34738 m!897085))

(declare-fun m!897087 () Bool)

(assert (=> b!968089 m!897087))

(declare-fun m!897089 () Bool)

(assert (=> b!968088 m!897089))

(declare-fun m!897091 () Bool)

(assert (=> b!968088 m!897091))

(assert (=> b!968088 m!897089))

(assert (=> b!968088 m!897091))

(declare-fun m!897093 () Bool)

(assert (=> b!968088 m!897093))

(declare-fun m!897095 () Bool)

(assert (=> start!83062 m!897095))

(declare-fun m!897097 () Bool)

(assert (=> start!83062 m!897097))

(declare-fun m!897099 () Bool)

(assert (=> start!83062 m!897099))

(assert (=> b!968092 m!897091))

(assert (=> b!968092 m!897091))

(declare-fun m!897101 () Bool)

(assert (=> b!968092 m!897101))

(declare-fun m!897103 () Bool)

(assert (=> b!968094 m!897103))

(assert (=> b!968094 m!897091))

(assert (=> b!968094 m!897103))

(assert (=> b!968094 m!897091))

(declare-fun m!897105 () Bool)

(assert (=> b!968094 m!897105))

(declare-fun m!897107 () Bool)

(assert (=> b!968094 m!897107))

(declare-fun m!897109 () Bool)

(assert (=> b!968096 m!897109))

(check-sat (not start!83062) (not b!968094) (not b_next!19021) (not b!968092) (not b!968089) b_and!30519 tp_is_empty!21829 (not b!968088) (not b!968096) (not mapNonEmpty!34738))
(check-sat b_and!30519 (not b_next!19021))
