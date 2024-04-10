; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82542 () Bool)

(assert start!82542)

(declare-fun b_free!18675 () Bool)

(declare-fun b_next!18675 () Bool)

(assert (=> start!82542 (= b_free!18675 (not b_next!18675))))

(declare-fun tp!65144 () Bool)

(declare-fun b_and!30163 () Bool)

(assert (=> start!82542 (= tp!65144 b_and!30163)))

(declare-fun b!961898 () Bool)

(declare-fun e!542448 () Bool)

(declare-fun e!542449 () Bool)

(declare-fun mapRes!34210 () Bool)

(assert (=> b!961898 (= e!542448 (and e!542449 mapRes!34210))))

(declare-fun condMapEmpty!34210 () Bool)

(declare-datatypes ((V!33619 0))(
  ( (V!33620 (val!10789 Int)) )
))
(declare-datatypes ((ValueCell!10257 0))(
  ( (ValueCellFull!10257 (v!13347 V!33619)) (EmptyCell!10257) )
))
(declare-datatypes ((array!59051 0))(
  ( (array!59052 (arr!28394 (Array (_ BitVec 32) ValueCell!10257)) (size!28873 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59051)

(declare-fun mapDefault!34210 () ValueCell!10257)

(assert (=> b!961898 (= condMapEmpty!34210 (= (arr!28394 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10257)) mapDefault!34210)))))

(declare-fun b!961899 () Bool)

(declare-fun res!643728 () Bool)

(declare-fun e!542446 () Bool)

(assert (=> b!961899 (=> (not res!643728) (not e!542446))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59053 0))(
  ( (array!59054 (arr!28395 (Array (_ BitVec 32) (_ BitVec 64))) (size!28874 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59053)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961899 (= res!643728 (and (= (size!28873 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28874 _keys!1686) (size!28873 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961900 () Bool)

(declare-fun res!643727 () Bool)

(assert (=> b!961900 (=> (not res!643727) (not e!542446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59053 (_ BitVec 32)) Bool)

(assert (=> b!961900 (= res!643727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961901 () Bool)

(assert (=> b!961901 (= e!542446 false)))

(declare-fun minValue!1342 () V!33619)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!430816 () Bool)

(declare-fun zeroValue!1342 () V!33619)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13858 0))(
  ( (tuple2!13859 (_1!6940 (_ BitVec 64)) (_2!6940 V!33619)) )
))
(declare-datatypes ((List!19706 0))(
  ( (Nil!19703) (Cons!19702 (h!20864 tuple2!13858) (t!28069 List!19706)) )
))
(declare-datatypes ((ListLongMap!12555 0))(
  ( (ListLongMap!12556 (toList!6293 List!19706)) )
))
(declare-fun contains!5396 (ListLongMap!12555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3526 (array!59053 array!59051 (_ BitVec 32) (_ BitVec 32) V!33619 V!33619 (_ BitVec 32) Int) ListLongMap!12555)

(assert (=> b!961901 (= lt!430816 (contains!5396 (getCurrentListMap!3526 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28395 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34210 () Bool)

(declare-fun tp!65145 () Bool)

(declare-fun e!542447 () Bool)

(assert (=> mapNonEmpty!34210 (= mapRes!34210 (and tp!65145 e!542447))))

(declare-fun mapValue!34210 () ValueCell!10257)

(declare-fun mapKey!34210 () (_ BitVec 32))

(declare-fun mapRest!34210 () (Array (_ BitVec 32) ValueCell!10257))

(assert (=> mapNonEmpty!34210 (= (arr!28394 _values!1400) (store mapRest!34210 mapKey!34210 mapValue!34210))))

(declare-fun b!961902 () Bool)

(declare-fun res!643725 () Bool)

(assert (=> b!961902 (=> (not res!643725) (not e!542446))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!961902 (= res!643725 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28874 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28874 _keys!1686))))))

(declare-fun b!961903 () Bool)

(declare-fun tp_is_empty!21477 () Bool)

(assert (=> b!961903 (= e!542449 tp_is_empty!21477)))

(declare-fun res!643729 () Bool)

(assert (=> start!82542 (=> (not res!643729) (not e!542446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82542 (= res!643729 (validMask!0 mask!2110))))

(assert (=> start!82542 e!542446))

(assert (=> start!82542 true))

(declare-fun array_inv!22003 (array!59051) Bool)

(assert (=> start!82542 (and (array_inv!22003 _values!1400) e!542448)))

(declare-fun array_inv!22004 (array!59053) Bool)

(assert (=> start!82542 (array_inv!22004 _keys!1686)))

(assert (=> start!82542 tp!65144))

(assert (=> start!82542 tp_is_empty!21477))

(declare-fun b!961904 () Bool)

(assert (=> b!961904 (= e!542447 tp_is_empty!21477)))

(declare-fun b!961905 () Bool)

(declare-fun res!643726 () Bool)

(assert (=> b!961905 (=> (not res!643726) (not e!542446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961905 (= res!643726 (validKeyInArray!0 (select (arr!28395 _keys!1686) i!803)))))

(declare-fun b!961906 () Bool)

(declare-fun res!643724 () Bool)

(assert (=> b!961906 (=> (not res!643724) (not e!542446))))

(declare-datatypes ((List!19707 0))(
  ( (Nil!19704) (Cons!19703 (h!20865 (_ BitVec 64)) (t!28070 List!19707)) )
))
(declare-fun arrayNoDuplicates!0 (array!59053 (_ BitVec 32) List!19707) Bool)

(assert (=> b!961906 (= res!643724 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19704))))

(declare-fun mapIsEmpty!34210 () Bool)

(assert (=> mapIsEmpty!34210 mapRes!34210))

(assert (= (and start!82542 res!643729) b!961899))

(assert (= (and b!961899 res!643728) b!961900))

(assert (= (and b!961900 res!643727) b!961906))

(assert (= (and b!961906 res!643724) b!961902))

(assert (= (and b!961902 res!643725) b!961905))

(assert (= (and b!961905 res!643726) b!961901))

(assert (= (and b!961898 condMapEmpty!34210) mapIsEmpty!34210))

(assert (= (and b!961898 (not condMapEmpty!34210)) mapNonEmpty!34210))

(get-info :version)

(assert (= (and mapNonEmpty!34210 ((_ is ValueCellFull!10257) mapValue!34210)) b!961904))

(assert (= (and b!961898 ((_ is ValueCellFull!10257) mapDefault!34210)) b!961903))

(assert (= start!82542 b!961898))

(declare-fun m!891689 () Bool)

(assert (=> start!82542 m!891689))

(declare-fun m!891691 () Bool)

(assert (=> start!82542 m!891691))

(declare-fun m!891693 () Bool)

(assert (=> start!82542 m!891693))

(declare-fun m!891695 () Bool)

(assert (=> b!961906 m!891695))

(declare-fun m!891697 () Bool)

(assert (=> mapNonEmpty!34210 m!891697))

(declare-fun m!891699 () Bool)

(assert (=> b!961901 m!891699))

(declare-fun m!891701 () Bool)

(assert (=> b!961901 m!891701))

(assert (=> b!961901 m!891699))

(assert (=> b!961901 m!891701))

(declare-fun m!891703 () Bool)

(assert (=> b!961901 m!891703))

(assert (=> b!961905 m!891701))

(assert (=> b!961905 m!891701))

(declare-fun m!891705 () Bool)

(assert (=> b!961905 m!891705))

(declare-fun m!891707 () Bool)

(assert (=> b!961900 m!891707))

(check-sat (not b!961901) (not b!961905) (not b!961900) (not b!961906) (not mapNonEmpty!34210) b_and!30163 (not start!82542) tp_is_empty!21477 (not b_next!18675))
(check-sat b_and!30163 (not b_next!18675))
