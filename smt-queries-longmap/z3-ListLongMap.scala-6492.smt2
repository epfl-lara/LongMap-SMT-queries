; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82774 () Bool)

(assert start!82774)

(declare-fun b_free!18919 () Bool)

(declare-fun b_next!18919 () Bool)

(assert (=> start!82774 (= b_free!18919 (not b_next!18919))))

(declare-fun tp!65886 () Bool)

(declare-fun b_and!30381 () Bool)

(assert (=> start!82774 (= tp!65886 b_and!30381)))

(declare-fun b!965484 () Bool)

(declare-fun res!646315 () Bool)

(declare-fun e!544258 () Bool)

(assert (=> b!965484 (=> (not res!646315) (not e!544258))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33953 0))(
  ( (V!33954 (val!10914 Int)) )
))
(declare-datatypes ((ValueCell!10382 0))(
  ( (ValueCellFull!10382 (v!13471 V!33953)) (EmptyCell!10382) )
))
(declare-datatypes ((array!59470 0))(
  ( (array!59471 (arr!28604 (Array (_ BitVec 32) ValueCell!10382)) (size!29085 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59470)

(declare-datatypes ((array!59472 0))(
  ( (array!59473 (arr!28605 (Array (_ BitVec 32) (_ BitVec 64))) (size!29086 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59472)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965484 (= res!646315 (and (= (size!29085 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29086 _keys!1686) (size!29085 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965485 () Bool)

(declare-fun res!646317 () Bool)

(assert (=> b!965485 (=> (not res!646317) (not e!544258))))

(declare-datatypes ((List!19907 0))(
  ( (Nil!19904) (Cons!19903 (h!21065 (_ BitVec 64)) (t!28261 List!19907)) )
))
(declare-fun arrayNoDuplicates!0 (array!59472 (_ BitVec 32) List!19907) Bool)

(assert (=> b!965485 (= res!646317 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19904))))

(declare-fun mapIsEmpty!34585 () Bool)

(declare-fun mapRes!34585 () Bool)

(assert (=> mapIsEmpty!34585 mapRes!34585))

(declare-fun b!965486 () Bool)

(declare-fun res!646319 () Bool)

(assert (=> b!965486 (=> (not res!646319) (not e!544258))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965486 (= res!646319 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29086 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29086 _keys!1686))))))

(declare-fun b!965487 () Bool)

(declare-fun e!544256 () Bool)

(declare-fun tp_is_empty!21727 () Bool)

(assert (=> b!965487 (= e!544256 tp_is_empty!21727)))

(declare-fun b!965488 () Bool)

(declare-fun res!646318 () Bool)

(assert (=> b!965488 (=> (not res!646318) (not e!544258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59472 (_ BitVec 32)) Bool)

(assert (=> b!965488 (= res!646318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34585 () Bool)

(declare-fun tp!65887 () Bool)

(assert (=> mapNonEmpty!34585 (= mapRes!34585 (and tp!65887 e!544256))))

(declare-fun mapValue!34585 () ValueCell!10382)

(declare-fun mapRest!34585 () (Array (_ BitVec 32) ValueCell!10382))

(declare-fun mapKey!34585 () (_ BitVec 32))

(assert (=> mapNonEmpty!34585 (= (arr!28604 _values!1400) (store mapRest!34585 mapKey!34585 mapValue!34585))))

(declare-fun b!965489 () Bool)

(declare-fun e!544254 () Bool)

(declare-fun e!544257 () Bool)

(assert (=> b!965489 (= e!544254 (and e!544257 mapRes!34585))))

(declare-fun condMapEmpty!34585 () Bool)

(declare-fun mapDefault!34585 () ValueCell!10382)

(assert (=> b!965489 (= condMapEmpty!34585 (= (arr!28604 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10382)) mapDefault!34585)))))

(declare-fun res!646314 () Bool)

(assert (=> start!82774 (=> (not res!646314) (not e!544258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82774 (= res!646314 (validMask!0 mask!2110))))

(assert (=> start!82774 e!544258))

(assert (=> start!82774 true))

(declare-fun array_inv!22209 (array!59470) Bool)

(assert (=> start!82774 (and (array_inv!22209 _values!1400) e!544254)))

(declare-fun array_inv!22210 (array!59472) Bool)

(assert (=> start!82774 (array_inv!22210 _keys!1686)))

(assert (=> start!82774 tp!65886))

(assert (=> start!82774 tp_is_empty!21727))

(declare-fun b!965490 () Bool)

(declare-fun res!646316 () Bool)

(assert (=> b!965490 (=> (not res!646316) (not e!544258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965490 (= res!646316 (validKeyInArray!0 (select (arr!28605 _keys!1686) i!803)))))

(declare-fun b!965491 () Bool)

(assert (=> b!965491 (= e!544257 tp_is_empty!21727)))

(declare-fun b!965492 () Bool)

(assert (=> b!965492 (= e!544258 (bvslt i!803 #b00000000000000000000000000000000))))

(declare-fun minValue!1342 () V!33953)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33953)

(declare-datatypes ((tuple2!14100 0))(
  ( (tuple2!14101 (_1!7061 (_ BitVec 64)) (_2!7061 V!33953)) )
))
(declare-datatypes ((List!19908 0))(
  ( (Nil!19905) (Cons!19904 (h!21066 tuple2!14100) (t!28262 List!19908)) )
))
(declare-datatypes ((ListLongMap!12787 0))(
  ( (ListLongMap!12788 (toList!6409 List!19908)) )
))
(declare-fun lt!431018 () ListLongMap!12787)

(declare-fun getCurrentListMap!3571 (array!59472 array!59470 (_ BitVec 32) (_ BitVec 32) V!33953 V!33953 (_ BitVec 32) Int) ListLongMap!12787)

(assert (=> b!965492 (= lt!431018 (getCurrentListMap!3571 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403))))

(assert (= (and start!82774 res!646314) b!965484))

(assert (= (and b!965484 res!646315) b!965488))

(assert (= (and b!965488 res!646318) b!965485))

(assert (= (and b!965485 res!646317) b!965486))

(assert (= (and b!965486 res!646319) b!965490))

(assert (= (and b!965490 res!646316) b!965492))

(assert (= (and b!965489 condMapEmpty!34585) mapIsEmpty!34585))

(assert (= (and b!965489 (not condMapEmpty!34585)) mapNonEmpty!34585))

(get-info :version)

(assert (= (and mapNonEmpty!34585 ((_ is ValueCellFull!10382) mapValue!34585)) b!965487))

(assert (= (and b!965489 ((_ is ValueCellFull!10382) mapDefault!34585)) b!965491))

(assert (= start!82774 b!965489))

(declare-fun m!893947 () Bool)

(assert (=> b!965490 m!893947))

(assert (=> b!965490 m!893947))

(declare-fun m!893949 () Bool)

(assert (=> b!965490 m!893949))

(declare-fun m!893951 () Bool)

(assert (=> b!965485 m!893951))

(declare-fun m!893953 () Bool)

(assert (=> mapNonEmpty!34585 m!893953))

(declare-fun m!893955 () Bool)

(assert (=> b!965488 m!893955))

(declare-fun m!893957 () Bool)

(assert (=> start!82774 m!893957))

(declare-fun m!893959 () Bool)

(assert (=> start!82774 m!893959))

(declare-fun m!893961 () Bool)

(assert (=> start!82774 m!893961))

(declare-fun m!893963 () Bool)

(assert (=> b!965492 m!893963))

(check-sat (not mapNonEmpty!34585) (not b_next!18919) (not b!965490) (not start!82774) (not b!965492) tp_is_empty!21727 (not b!965488) b_and!30381 (not b!965485))
(check-sat b_and!30381 (not b_next!18919))
