; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82758 () Bool)

(assert start!82758)

(declare-fun b_free!18891 () Bool)

(declare-fun b_next!18891 () Bool)

(assert (=> start!82758 (= b_free!18891 (not b_next!18891))))

(declare-fun tp!65792 () Bool)

(declare-fun b_and!30379 () Bool)

(assert (=> start!82758 (= tp!65792 b_and!30379)))

(declare-fun mapNonEmpty!34534 () Bool)

(declare-fun mapRes!34534 () Bool)

(declare-fun tp!65793 () Bool)

(declare-fun e!544149 () Bool)

(assert (=> mapNonEmpty!34534 (= mapRes!34534 (and tp!65793 e!544149))))

(declare-datatypes ((V!33907 0))(
  ( (V!33908 (val!10897 Int)) )
))
(declare-datatypes ((ValueCell!10365 0))(
  ( (ValueCellFull!10365 (v!13455 V!33907)) (EmptyCell!10365) )
))
(declare-fun mapRest!34534 () (Array (_ BitVec 32) ValueCell!10365))

(declare-datatypes ((array!59471 0))(
  ( (array!59472 (arr!28604 (Array (_ BitVec 32) ValueCell!10365)) (size!29083 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59471)

(declare-fun mapValue!34534 () ValueCell!10365)

(declare-fun mapKey!34534 () (_ BitVec 32))

(assert (=> mapNonEmpty!34534 (= (arr!28604 _values!1400) (store mapRest!34534 mapKey!34534 mapValue!34534))))

(declare-fun b!965273 () Bool)

(declare-fun res!646128 () Bool)

(declare-fun e!544150 () Bool)

(assert (=> b!965273 (=> (not res!646128) (not e!544150))))

(declare-datatypes ((array!59473 0))(
  ( (array!59474 (arr!28605 (Array (_ BitVec 32) (_ BitVec 64))) (size!29084 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59473)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59473 (_ BitVec 32)) Bool)

(assert (=> b!965273 (= res!646128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!646131 () Bool)

(assert (=> start!82758 (=> (not res!646131) (not e!544150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82758 (= res!646131 (validMask!0 mask!2110))))

(assert (=> start!82758 e!544150))

(assert (=> start!82758 true))

(declare-fun e!544148 () Bool)

(declare-fun array_inv!22151 (array!59471) Bool)

(assert (=> start!82758 (and (array_inv!22151 _values!1400) e!544148)))

(declare-fun array_inv!22152 (array!59473) Bool)

(assert (=> start!82758 (array_inv!22152 _keys!1686)))

(assert (=> start!82758 tp!65792))

(declare-fun tp_is_empty!21693 () Bool)

(assert (=> start!82758 tp_is_empty!21693))

(declare-fun b!965274 () Bool)

(declare-fun res!646129 () Bool)

(assert (=> b!965274 (=> (not res!646129) (not e!544150))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965274 (= res!646129 (validKeyInArray!0 (select (arr!28605 _keys!1686) i!803)))))

(declare-fun b!965275 () Bool)

(assert (=> b!965275 (= e!544149 tp_is_empty!21693)))

(declare-fun mapIsEmpty!34534 () Bool)

(assert (=> mapIsEmpty!34534 mapRes!34534))

(declare-fun b!965276 () Bool)

(declare-fun e!544147 () Bool)

(assert (=> b!965276 (= e!544148 (and e!544147 mapRes!34534))))

(declare-fun condMapEmpty!34534 () Bool)

(declare-fun mapDefault!34534 () ValueCell!10365)

(assert (=> b!965276 (= condMapEmpty!34534 (= (arr!28604 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10365)) mapDefault!34534)))))

(declare-fun b!965277 () Bool)

(declare-fun res!646132 () Bool)

(assert (=> b!965277 (=> (not res!646132) (not e!544150))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965277 (= res!646132 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29084 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29084 _keys!1686))))))

(declare-fun b!965278 () Bool)

(assert (=> b!965278 (= e!544150 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431221 () Bool)

(declare-fun minValue!1342 () V!33907)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33907)

(declare-datatypes ((tuple2!14010 0))(
  ( (tuple2!14011 (_1!7016 (_ BitVec 64)) (_2!7016 V!33907)) )
))
(declare-datatypes ((List!19854 0))(
  ( (Nil!19851) (Cons!19850 (h!21012 tuple2!14010) (t!28217 List!19854)) )
))
(declare-datatypes ((ListLongMap!12707 0))(
  ( (ListLongMap!12708 (toList!6369 List!19854)) )
))
(declare-fun contains!5472 (ListLongMap!12707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3602 (array!59473 array!59471 (_ BitVec 32) (_ BitVec 32) V!33907 V!33907 (_ BitVec 32) Int) ListLongMap!12707)

(assert (=> b!965278 (= lt!431221 (contains!5472 (getCurrentListMap!3602 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28605 _keys!1686) i!803)))))

(declare-fun b!965279 () Bool)

(declare-fun res!646130 () Bool)

(assert (=> b!965279 (=> (not res!646130) (not e!544150))))

(assert (=> b!965279 (= res!646130 (and (= (size!29083 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29084 _keys!1686) (size!29083 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965280 () Bool)

(declare-fun res!646127 () Bool)

(assert (=> b!965280 (=> (not res!646127) (not e!544150))))

(declare-datatypes ((List!19855 0))(
  ( (Nil!19852) (Cons!19851 (h!21013 (_ BitVec 64)) (t!28218 List!19855)) )
))
(declare-fun arrayNoDuplicates!0 (array!59473 (_ BitVec 32) List!19855) Bool)

(assert (=> b!965280 (= res!646127 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19852))))

(declare-fun b!965281 () Bool)

(assert (=> b!965281 (= e!544147 tp_is_empty!21693)))

(assert (= (and start!82758 res!646131) b!965279))

(assert (= (and b!965279 res!646130) b!965273))

(assert (= (and b!965273 res!646128) b!965280))

(assert (= (and b!965280 res!646127) b!965277))

(assert (= (and b!965277 res!646132) b!965274))

(assert (= (and b!965274 res!646129) b!965278))

(assert (= (and b!965276 condMapEmpty!34534) mapIsEmpty!34534))

(assert (= (and b!965276 (not condMapEmpty!34534)) mapNonEmpty!34534))

(get-info :version)

(assert (= (and mapNonEmpty!34534 ((_ is ValueCellFull!10365) mapValue!34534)) b!965275))

(assert (= (and b!965276 ((_ is ValueCellFull!10365) mapDefault!34534)) b!965281))

(assert (= start!82758 b!965276))

(declare-fun m!894389 () Bool)

(assert (=> mapNonEmpty!34534 m!894389))

(declare-fun m!894391 () Bool)

(assert (=> b!965273 m!894391))

(declare-fun m!894393 () Bool)

(assert (=> b!965274 m!894393))

(assert (=> b!965274 m!894393))

(declare-fun m!894395 () Bool)

(assert (=> b!965274 m!894395))

(declare-fun m!894397 () Bool)

(assert (=> b!965278 m!894397))

(assert (=> b!965278 m!894393))

(assert (=> b!965278 m!894397))

(assert (=> b!965278 m!894393))

(declare-fun m!894399 () Bool)

(assert (=> b!965278 m!894399))

(declare-fun m!894401 () Bool)

(assert (=> b!965280 m!894401))

(declare-fun m!894403 () Bool)

(assert (=> start!82758 m!894403))

(declare-fun m!894405 () Bool)

(assert (=> start!82758 m!894405))

(declare-fun m!894407 () Bool)

(assert (=> start!82758 m!894407))

(check-sat (not b_next!18891) tp_is_empty!21693 (not b!965273) (not b!965280) (not b!965278) (not start!82758) b_and!30379 (not b!965274) (not mapNonEmpty!34534))
(check-sat b_and!30379 (not b_next!18891))
