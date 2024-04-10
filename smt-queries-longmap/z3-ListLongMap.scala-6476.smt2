; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82698 () Bool)

(assert start!82698)

(declare-fun b_free!18831 () Bool)

(declare-fun b_next!18831 () Bool)

(assert (=> start!82698 (= b_free!18831 (not b_next!18831))))

(declare-fun tp!65612 () Bool)

(declare-fun b_and!30319 () Bool)

(assert (=> start!82698 (= tp!65612 b_and!30319)))

(declare-fun b!964316 () Bool)

(declare-fun e!543652 () Bool)

(declare-fun tp_is_empty!21633 () Bool)

(assert (=> b!964316 (= e!543652 tp_is_empty!21633)))

(declare-fun b!964317 () Bool)

(declare-fun e!543649 () Bool)

(assert (=> b!964317 (= e!543649 true)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33827 0))(
  ( (V!33828 (val!10867 Int)) )
))
(declare-datatypes ((ValueCell!10335 0))(
  ( (ValueCellFull!10335 (v!13425 V!33827)) (EmptyCell!10335) )
))
(declare-datatypes ((array!59353 0))(
  ( (array!59354 (arr!28545 (Array (_ BitVec 32) ValueCell!10335)) (size!29024 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59353)

(declare-datatypes ((array!59355 0))(
  ( (array!59356 (arr!28546 (Array (_ BitVec 32) (_ BitVec 64))) (size!29025 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59355)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33827)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33827)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-datatypes ((tuple2!13964 0))(
  ( (tuple2!13965 (_1!6993 (_ BitVec 64)) (_2!6993 V!33827)) )
))
(declare-datatypes ((List!19811 0))(
  ( (Nil!19808) (Cons!19807 (h!20969 tuple2!13964) (t!28174 List!19811)) )
))
(declare-datatypes ((ListLongMap!12661 0))(
  ( (ListLongMap!12662 (toList!6346 List!19811)) )
))
(declare-fun contains!5449 (ListLongMap!12661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3579 (array!59355 array!59353 (_ BitVec 32) (_ BitVec 32) V!33827 V!33827 (_ BitVec 32) Int) ListLongMap!12661)

(assert (=> b!964317 (contains!5449 (getCurrentListMap!3579 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28546 _keys!1686) i!803))))

(declare-datatypes ((Unit!32275 0))(
  ( (Unit!32276) )
))
(declare-fun lt!431083 () Unit!32275)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!30 (array!59355 array!59353 (_ BitVec 32) (_ BitVec 32) V!33827 V!33827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32275)

(assert (=> b!964317 (= lt!431083 (lemmaInListMapFromThenInFromSmaller!30 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964318 () Bool)

(declare-fun e!543651 () Bool)

(assert (=> b!964318 (= e!543651 (not e!543649))))

(declare-fun res!645441 () Bool)

(assert (=> b!964318 (=> res!645441 e!543649)))

(assert (=> b!964318 (= res!645441 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29025 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964318 (contains!5449 (getCurrentListMap!3579 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28546 _keys!1686) i!803))))

(declare-fun lt!431082 () Unit!32275)

(declare-fun lemmaInListMapFromThenInFromMinusOne!32 (array!59355 array!59353 (_ BitVec 32) (_ BitVec 32) V!33827 V!33827 (_ BitVec 32) (_ BitVec 32) Int) Unit!32275)

(assert (=> b!964318 (= lt!431082 (lemmaInListMapFromThenInFromMinusOne!32 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964319 () Bool)

(declare-fun e!543648 () Bool)

(declare-fun e!543650 () Bool)

(declare-fun mapRes!34444 () Bool)

(assert (=> b!964319 (= e!543648 (and e!543650 mapRes!34444))))

(declare-fun condMapEmpty!34444 () Bool)

(declare-fun mapDefault!34444 () ValueCell!10335)

(assert (=> b!964319 (= condMapEmpty!34444 (= (arr!28545 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10335)) mapDefault!34444)))))

(declare-fun b!964320 () Bool)

(declare-fun res!645442 () Bool)

(assert (=> b!964320 (=> (not res!645442) (not e!543651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59355 (_ BitVec 32)) Bool)

(assert (=> b!964320 (= res!645442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964321 () Bool)

(declare-fun res!645445 () Bool)

(assert (=> b!964321 (=> (not res!645445) (not e!543651))))

(assert (=> b!964321 (= res!645445 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29025 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29025 _keys!1686))))))

(declare-fun b!964322 () Bool)

(assert (=> b!964322 (= e!543650 tp_is_empty!21633)))

(declare-fun b!964323 () Bool)

(declare-fun res!645446 () Bool)

(assert (=> b!964323 (=> (not res!645446) (not e!543651))))

(assert (=> b!964323 (= res!645446 (contains!5449 (getCurrentListMap!3579 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28546 _keys!1686) i!803)))))

(declare-fun res!645440 () Bool)

(assert (=> start!82698 (=> (not res!645440) (not e!543651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82698 (= res!645440 (validMask!0 mask!2110))))

(assert (=> start!82698 e!543651))

(assert (=> start!82698 true))

(declare-fun array_inv!22107 (array!59353) Bool)

(assert (=> start!82698 (and (array_inv!22107 _values!1400) e!543648)))

(declare-fun array_inv!22108 (array!59355) Bool)

(assert (=> start!82698 (array_inv!22108 _keys!1686)))

(assert (=> start!82698 tp!65612))

(assert (=> start!82698 tp_is_empty!21633))

(declare-fun mapIsEmpty!34444 () Bool)

(assert (=> mapIsEmpty!34444 mapRes!34444))

(declare-fun b!964324 () Bool)

(declare-fun res!645447 () Bool)

(assert (=> b!964324 (=> (not res!645447) (not e!543651))))

(declare-datatypes ((List!19812 0))(
  ( (Nil!19809) (Cons!19808 (h!20970 (_ BitVec 64)) (t!28175 List!19812)) )
))
(declare-fun arrayNoDuplicates!0 (array!59355 (_ BitVec 32) List!19812) Bool)

(assert (=> b!964324 (= res!645447 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19809))))

(declare-fun mapNonEmpty!34444 () Bool)

(declare-fun tp!65613 () Bool)

(assert (=> mapNonEmpty!34444 (= mapRes!34444 (and tp!65613 e!543652))))

(declare-fun mapValue!34444 () ValueCell!10335)

(declare-fun mapKey!34444 () (_ BitVec 32))

(declare-fun mapRest!34444 () (Array (_ BitVec 32) ValueCell!10335))

(assert (=> mapNonEmpty!34444 (= (arr!28545 _values!1400) (store mapRest!34444 mapKey!34444 mapValue!34444))))

(declare-fun b!964325 () Bool)

(declare-fun res!645444 () Bool)

(assert (=> b!964325 (=> (not res!645444) (not e!543651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964325 (= res!645444 (validKeyInArray!0 (select (arr!28546 _keys!1686) i!803)))))

(declare-fun b!964326 () Bool)

(declare-fun res!645443 () Bool)

(assert (=> b!964326 (=> (not res!645443) (not e!543651))))

(assert (=> b!964326 (= res!645443 (and (= (size!29024 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29025 _keys!1686) (size!29024 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964327 () Bool)

(declare-fun res!645448 () Bool)

(assert (=> b!964327 (=> (not res!645448) (not e!543651))))

(assert (=> b!964327 (= res!645448 (bvsgt from!2084 newFrom!159))))

(assert (= (and start!82698 res!645440) b!964326))

(assert (= (and b!964326 res!645443) b!964320))

(assert (= (and b!964320 res!645442) b!964324))

(assert (= (and b!964324 res!645447) b!964321))

(assert (= (and b!964321 res!645445) b!964325))

(assert (= (and b!964325 res!645444) b!964323))

(assert (= (and b!964323 res!645446) b!964327))

(assert (= (and b!964327 res!645448) b!964318))

(assert (= (and b!964318 (not res!645441)) b!964317))

(assert (= (and b!964319 condMapEmpty!34444) mapIsEmpty!34444))

(assert (= (and b!964319 (not condMapEmpty!34444)) mapNonEmpty!34444))

(get-info :version)

(assert (= (and mapNonEmpty!34444 ((_ is ValueCellFull!10335) mapValue!34444)) b!964316))

(assert (= (and b!964319 ((_ is ValueCellFull!10335) mapDefault!34444)) b!964322))

(assert (= start!82698 b!964319))

(declare-fun m!893585 () Bool)

(assert (=> b!964323 m!893585))

(declare-fun m!893587 () Bool)

(assert (=> b!964323 m!893587))

(assert (=> b!964323 m!893585))

(assert (=> b!964323 m!893587))

(declare-fun m!893589 () Bool)

(assert (=> b!964323 m!893589))

(declare-fun m!893591 () Bool)

(assert (=> b!964318 m!893591))

(assert (=> b!964318 m!893587))

(assert (=> b!964318 m!893591))

(assert (=> b!964318 m!893587))

(declare-fun m!893593 () Bool)

(assert (=> b!964318 m!893593))

(declare-fun m!893595 () Bool)

(assert (=> b!964318 m!893595))

(assert (=> b!964325 m!893587))

(assert (=> b!964325 m!893587))

(declare-fun m!893597 () Bool)

(assert (=> b!964325 m!893597))

(declare-fun m!893599 () Bool)

(assert (=> b!964317 m!893599))

(assert (=> b!964317 m!893587))

(assert (=> b!964317 m!893599))

(assert (=> b!964317 m!893587))

(declare-fun m!893601 () Bool)

(assert (=> b!964317 m!893601))

(declare-fun m!893603 () Bool)

(assert (=> b!964317 m!893603))

(declare-fun m!893605 () Bool)

(assert (=> start!82698 m!893605))

(declare-fun m!893607 () Bool)

(assert (=> start!82698 m!893607))

(declare-fun m!893609 () Bool)

(assert (=> start!82698 m!893609))

(declare-fun m!893611 () Bool)

(assert (=> b!964320 m!893611))

(declare-fun m!893613 () Bool)

(assert (=> b!964324 m!893613))

(declare-fun m!893615 () Bool)

(assert (=> mapNonEmpty!34444 m!893615))

(check-sat tp_is_empty!21633 (not b!964320) (not b!964324) (not b!964317) (not mapNonEmpty!34444) (not b!964318) (not b!964323) b_and!30319 (not b_next!18831) (not b!964325) (not start!82698))
(check-sat b_and!30319 (not b_next!18831))
