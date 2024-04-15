; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82798 () Bool)

(assert start!82798)

(declare-fun b_free!18943 () Bool)

(declare-fun b_next!18943 () Bool)

(assert (=> start!82798 (= b_free!18943 (not b_next!18943))))

(declare-fun tp!65958 () Bool)

(declare-fun b_and!30405 () Bool)

(assert (=> start!82798 (= tp!65958 b_and!30405)))

(declare-fun b!965808 () Bool)

(declare-fun res!646535 () Bool)

(declare-fun e!544438 () Bool)

(assert (=> b!965808 (=> (not res!646535) (not e!544438))))

(declare-datatypes ((array!59514 0))(
  ( (array!59515 (arr!28626 (Array (_ BitVec 32) (_ BitVec 64))) (size!29107 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59514)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59514 (_ BitVec 32)) Bool)

(assert (=> b!965808 (= res!646535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965809 () Bool)

(declare-fun res!646533 () Bool)

(assert (=> b!965809 (=> (not res!646533) (not e!544438))))

(declare-datatypes ((List!19924 0))(
  ( (Nil!19921) (Cons!19920 (h!21082 (_ BitVec 64)) (t!28278 List!19924)) )
))
(declare-fun arrayNoDuplicates!0 (array!59514 (_ BitVec 32) List!19924) Bool)

(assert (=> b!965809 (= res!646533 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19921))))

(declare-fun b!965810 () Bool)

(assert (=> b!965810 (= e!544438 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33985 0))(
  ( (V!33986 (val!10926 Int)) )
))
(declare-datatypes ((ValueCell!10394 0))(
  ( (ValueCellFull!10394 (v!13483 V!33985)) (EmptyCell!10394) )
))
(declare-datatypes ((array!59516 0))(
  ( (array!59517 (arr!28627 (Array (_ BitVec 32) ValueCell!10394)) (size!29108 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59516)

(declare-fun minValue!1342 () V!33985)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431054 () Bool)

(declare-fun zeroValue!1342 () V!33985)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14120 0))(
  ( (tuple2!14121 (_1!7071 (_ BitVec 64)) (_2!7071 V!33985)) )
))
(declare-datatypes ((List!19925 0))(
  ( (Nil!19922) (Cons!19921 (h!21083 tuple2!14120) (t!28279 List!19925)) )
))
(declare-datatypes ((ListLongMap!12807 0))(
  ( (ListLongMap!12808 (toList!6419 List!19925)) )
))
(declare-fun contains!5464 (ListLongMap!12807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3581 (array!59514 array!59516 (_ BitVec 32) (_ BitVec 32) V!33985 V!33985 (_ BitVec 32) Int) ListLongMap!12807)

(assert (=> b!965810 (= lt!431054 (contains!5464 (getCurrentListMap!3581 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28626 _keys!1686) i!803)))))

(declare-fun b!965812 () Bool)

(declare-fun e!544437 () Bool)

(declare-fun tp_is_empty!21751 () Bool)

(assert (=> b!965812 (= e!544437 tp_is_empty!21751)))

(declare-fun b!965813 () Bool)

(declare-fun res!646530 () Bool)

(assert (=> b!965813 (=> (not res!646530) (not e!544438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965813 (= res!646530 (validKeyInArray!0 (select (arr!28626 _keys!1686) i!803)))))

(declare-fun b!965814 () Bool)

(declare-fun res!646534 () Bool)

(assert (=> b!965814 (=> (not res!646534) (not e!544438))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965814 (= res!646534 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29107 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29107 _keys!1686))))))

(declare-fun b!965815 () Bool)

(declare-fun e!544434 () Bool)

(assert (=> b!965815 (= e!544434 tp_is_empty!21751)))

(declare-fun b!965811 () Bool)

(declare-fun res!646532 () Bool)

(assert (=> b!965811 (=> (not res!646532) (not e!544438))))

(assert (=> b!965811 (= res!646532 (and (= (size!29108 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29107 _keys!1686) (size!29108 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!646531 () Bool)

(assert (=> start!82798 (=> (not res!646531) (not e!544438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82798 (= res!646531 (validMask!0 mask!2110))))

(assert (=> start!82798 e!544438))

(assert (=> start!82798 true))

(declare-fun e!544435 () Bool)

(declare-fun array_inv!22225 (array!59516) Bool)

(assert (=> start!82798 (and (array_inv!22225 _values!1400) e!544435)))

(declare-fun array_inv!22226 (array!59514) Bool)

(assert (=> start!82798 (array_inv!22226 _keys!1686)))

(assert (=> start!82798 tp!65958))

(assert (=> start!82798 tp_is_empty!21751))

(declare-fun b!965816 () Bool)

(declare-fun mapRes!34621 () Bool)

(assert (=> b!965816 (= e!544435 (and e!544434 mapRes!34621))))

(declare-fun condMapEmpty!34621 () Bool)

(declare-fun mapDefault!34621 () ValueCell!10394)

(assert (=> b!965816 (= condMapEmpty!34621 (= (arr!28627 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10394)) mapDefault!34621)))))

(declare-fun mapNonEmpty!34621 () Bool)

(declare-fun tp!65959 () Bool)

(assert (=> mapNonEmpty!34621 (= mapRes!34621 (and tp!65959 e!544437))))

(declare-fun mapValue!34621 () ValueCell!10394)

(declare-fun mapKey!34621 () (_ BitVec 32))

(declare-fun mapRest!34621 () (Array (_ BitVec 32) ValueCell!10394))

(assert (=> mapNonEmpty!34621 (= (arr!28627 _values!1400) (store mapRest!34621 mapKey!34621 mapValue!34621))))

(declare-fun mapIsEmpty!34621 () Bool)

(assert (=> mapIsEmpty!34621 mapRes!34621))

(assert (= (and start!82798 res!646531) b!965811))

(assert (= (and b!965811 res!646532) b!965808))

(assert (= (and b!965808 res!646535) b!965809))

(assert (= (and b!965809 res!646533) b!965814))

(assert (= (and b!965814 res!646534) b!965813))

(assert (= (and b!965813 res!646530) b!965810))

(assert (= (and b!965816 condMapEmpty!34621) mapIsEmpty!34621))

(assert (= (and b!965816 (not condMapEmpty!34621)) mapNonEmpty!34621))

(get-info :version)

(assert (= (and mapNonEmpty!34621 ((_ is ValueCellFull!10394) mapValue!34621)) b!965812))

(assert (= (and b!965816 ((_ is ValueCellFull!10394) mapDefault!34621)) b!965815))

(assert (= start!82798 b!965816))

(declare-fun m!894181 () Bool)

(assert (=> b!965813 m!894181))

(assert (=> b!965813 m!894181))

(declare-fun m!894183 () Bool)

(assert (=> b!965813 m!894183))

(declare-fun m!894185 () Bool)

(assert (=> start!82798 m!894185))

(declare-fun m!894187 () Bool)

(assert (=> start!82798 m!894187))

(declare-fun m!894189 () Bool)

(assert (=> start!82798 m!894189))

(declare-fun m!894191 () Bool)

(assert (=> mapNonEmpty!34621 m!894191))

(declare-fun m!894193 () Bool)

(assert (=> b!965810 m!894193))

(assert (=> b!965810 m!894181))

(assert (=> b!965810 m!894193))

(assert (=> b!965810 m!894181))

(declare-fun m!894195 () Bool)

(assert (=> b!965810 m!894195))

(declare-fun m!894197 () Bool)

(assert (=> b!965808 m!894197))

(declare-fun m!894199 () Bool)

(assert (=> b!965809 m!894199))

(check-sat (not b!965813) (not b!965809) (not mapNonEmpty!34621) (not start!82798) tp_is_empty!21751 (not b!965810) (not b_next!18943) (not b!965808) b_and!30405)
(check-sat b_and!30405 (not b_next!18943))
