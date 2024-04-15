; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82804 () Bool)

(assert start!82804)

(declare-fun b_free!18949 () Bool)

(declare-fun b_next!18949 () Bool)

(assert (=> start!82804 (= b_free!18949 (not b_next!18949))))

(declare-fun tp!65976 () Bool)

(declare-fun b_and!30411 () Bool)

(assert (=> start!82804 (= tp!65976 b_and!30411)))

(declare-fun b!965889 () Bool)

(declare-fun res!646585 () Bool)

(declare-fun e!544482 () Bool)

(assert (=> b!965889 (=> (not res!646585) (not e!544482))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33993 0))(
  ( (V!33994 (val!10929 Int)) )
))
(declare-datatypes ((ValueCell!10397 0))(
  ( (ValueCellFull!10397 (v!13486 V!33993)) (EmptyCell!10397) )
))
(declare-datatypes ((array!59526 0))(
  ( (array!59527 (arr!28632 (Array (_ BitVec 32) ValueCell!10397)) (size!29113 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59526)

(declare-datatypes ((array!59528 0))(
  ( (array!59529 (arr!28633 (Array (_ BitVec 32) (_ BitVec 64))) (size!29114 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59528)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965889 (= res!646585 (and (= (size!29113 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29114 _keys!1686) (size!29113 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965890 () Bool)

(declare-fun e!544481 () Bool)

(declare-fun tp_is_empty!21757 () Bool)

(assert (=> b!965890 (= e!544481 tp_is_empty!21757)))

(declare-fun b!965891 () Bool)

(declare-fun e!544480 () Bool)

(declare-fun mapRes!34630 () Bool)

(assert (=> b!965891 (= e!544480 (and e!544481 mapRes!34630))))

(declare-fun condMapEmpty!34630 () Bool)

(declare-fun mapDefault!34630 () ValueCell!10397)

(assert (=> b!965891 (= condMapEmpty!34630 (= (arr!28632 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10397)) mapDefault!34630)))))

(declare-fun b!965892 () Bool)

(assert (=> b!965892 (= e!544482 false)))

(declare-fun lt!431063 () Bool)

(declare-fun minValue!1342 () V!33993)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33993)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14126 0))(
  ( (tuple2!14127 (_1!7074 (_ BitVec 64)) (_2!7074 V!33993)) )
))
(declare-datatypes ((List!19929 0))(
  ( (Nil!19926) (Cons!19925 (h!21087 tuple2!14126) (t!28283 List!19929)) )
))
(declare-datatypes ((ListLongMap!12813 0))(
  ( (ListLongMap!12814 (toList!6422 List!19929)) )
))
(declare-fun contains!5467 (ListLongMap!12813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3584 (array!59528 array!59526 (_ BitVec 32) (_ BitVec 32) V!33993 V!33993 (_ BitVec 32) Int) ListLongMap!12813)

(assert (=> b!965892 (= lt!431063 (contains!5467 (getCurrentListMap!3584 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28633 _keys!1686) i!803)))))

(declare-fun b!965893 () Bool)

(declare-fun res!646589 () Bool)

(assert (=> b!965893 (=> (not res!646589) (not e!544482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965893 (= res!646589 (validKeyInArray!0 (select (arr!28633 _keys!1686) i!803)))))

(declare-fun b!965894 () Bool)

(declare-fun res!646584 () Bool)

(assert (=> b!965894 (=> (not res!646584) (not e!544482))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965894 (= res!646584 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29114 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29114 _keys!1686))))))

(declare-fun b!965895 () Bool)

(declare-fun res!646586 () Bool)

(assert (=> b!965895 (=> (not res!646586) (not e!544482))))

(declare-datatypes ((List!19930 0))(
  ( (Nil!19927) (Cons!19926 (h!21088 (_ BitVec 64)) (t!28284 List!19930)) )
))
(declare-fun arrayNoDuplicates!0 (array!59528 (_ BitVec 32) List!19930) Bool)

(assert (=> b!965895 (= res!646586 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19927))))

(declare-fun res!646588 () Bool)

(assert (=> start!82804 (=> (not res!646588) (not e!544482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82804 (= res!646588 (validMask!0 mask!2110))))

(assert (=> start!82804 e!544482))

(assert (=> start!82804 true))

(declare-fun array_inv!22229 (array!59526) Bool)

(assert (=> start!82804 (and (array_inv!22229 _values!1400) e!544480)))

(declare-fun array_inv!22230 (array!59528) Bool)

(assert (=> start!82804 (array_inv!22230 _keys!1686)))

(assert (=> start!82804 tp!65976))

(assert (=> start!82804 tp_is_empty!21757))

(declare-fun mapNonEmpty!34630 () Bool)

(declare-fun tp!65977 () Bool)

(declare-fun e!544479 () Bool)

(assert (=> mapNonEmpty!34630 (= mapRes!34630 (and tp!65977 e!544479))))

(declare-fun mapRest!34630 () (Array (_ BitVec 32) ValueCell!10397))

(declare-fun mapKey!34630 () (_ BitVec 32))

(declare-fun mapValue!34630 () ValueCell!10397)

(assert (=> mapNonEmpty!34630 (= (arr!28632 _values!1400) (store mapRest!34630 mapKey!34630 mapValue!34630))))

(declare-fun b!965896 () Bool)

(declare-fun res!646587 () Bool)

(assert (=> b!965896 (=> (not res!646587) (not e!544482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59528 (_ BitVec 32)) Bool)

(assert (=> b!965896 (= res!646587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34630 () Bool)

(assert (=> mapIsEmpty!34630 mapRes!34630))

(declare-fun b!965897 () Bool)

(assert (=> b!965897 (= e!544479 tp_is_empty!21757)))

(assert (= (and start!82804 res!646588) b!965889))

(assert (= (and b!965889 res!646585) b!965896))

(assert (= (and b!965896 res!646587) b!965895))

(assert (= (and b!965895 res!646586) b!965894))

(assert (= (and b!965894 res!646584) b!965893))

(assert (= (and b!965893 res!646589) b!965892))

(assert (= (and b!965891 condMapEmpty!34630) mapIsEmpty!34630))

(assert (= (and b!965891 (not condMapEmpty!34630)) mapNonEmpty!34630))

(get-info :version)

(assert (= (and mapNonEmpty!34630 ((_ is ValueCellFull!10397) mapValue!34630)) b!965897))

(assert (= (and b!965891 ((_ is ValueCellFull!10397) mapDefault!34630)) b!965890))

(assert (= start!82804 b!965891))

(declare-fun m!894241 () Bool)

(assert (=> b!965893 m!894241))

(assert (=> b!965893 m!894241))

(declare-fun m!894243 () Bool)

(assert (=> b!965893 m!894243))

(declare-fun m!894245 () Bool)

(assert (=> b!965896 m!894245))

(declare-fun m!894247 () Bool)

(assert (=> mapNonEmpty!34630 m!894247))

(declare-fun m!894249 () Bool)

(assert (=> b!965892 m!894249))

(assert (=> b!965892 m!894241))

(assert (=> b!965892 m!894249))

(assert (=> b!965892 m!894241))

(declare-fun m!894251 () Bool)

(assert (=> b!965892 m!894251))

(declare-fun m!894253 () Bool)

(assert (=> start!82804 m!894253))

(declare-fun m!894255 () Bool)

(assert (=> start!82804 m!894255))

(declare-fun m!894257 () Bool)

(assert (=> start!82804 m!894257))

(declare-fun m!894259 () Bool)

(assert (=> b!965895 m!894259))

(check-sat (not b!965892) tp_is_empty!21757 (not start!82804) (not b!965896) (not b!965893) (not b_next!18949) b_and!30411 (not b!965895) (not mapNonEmpty!34630))
(check-sat b_and!30411 (not b_next!18949))
