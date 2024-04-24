; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82364 () Bool)

(assert start!82364)

(declare-fun b_free!18469 () Bool)

(declare-fun b_next!18469 () Bool)

(assert (=> start!82364 (= b_free!18469 (not b_next!18469))))

(declare-fun tp!64369 () Bool)

(declare-fun b_and!29967 () Bool)

(assert (=> start!82364 (= tp!64369 b_and!29967)))

(declare-fun b!958913 () Bool)

(declare-fun res!641606 () Bool)

(declare-fun e!540669 () Bool)

(assert (=> b!958913 (=> (not res!641606) (not e!540669))))

(declare-datatypes ((array!58480 0))(
  ( (array!58481 (arr!28109 (Array (_ BitVec 32) (_ BitVec 64))) (size!28589 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58480)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958913 (= res!641606 (validKeyInArray!0 (select (arr!28109 _keys!1668) i!793)))))

(declare-fun b!958914 () Bool)

(declare-fun e!540670 () Bool)

(declare-fun tp_is_empty!21175 () Bool)

(assert (=> b!958914 (= e!540670 tp_is_empty!21175)))

(declare-fun b!958915 () Bool)

(declare-fun res!641608 () Bool)

(assert (=> b!958915 (=> (not res!641608) (not e!540669))))

(declare-datatypes ((List!19527 0))(
  ( (Nil!19524) (Cons!19523 (h!20691 (_ BitVec 64)) (t!27882 List!19527)) )
))
(declare-fun arrayNoDuplicates!0 (array!58480 (_ BitVec 32) List!19527) Bool)

(assert (=> b!958915 (= res!641608 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19524))))

(declare-fun b!958916 () Bool)

(declare-fun res!641607 () Bool)

(assert (=> b!958916 (=> (not res!641607) (not e!540669))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958916 (= res!641607 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28589 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28589 _keys!1668))))))

(declare-fun b!958917 () Bool)

(declare-fun e!540672 () Bool)

(assert (=> b!958917 (= e!540672 tp_is_empty!21175)))

(declare-fun b!958918 () Bool)

(declare-fun res!641603 () Bool)

(assert (=> b!958918 (=> (not res!641603) (not e!540669))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33217 0))(
  ( (V!33218 (val!10638 Int)) )
))
(declare-datatypes ((ValueCell!10106 0))(
  ( (ValueCellFull!10106 (v!13192 V!33217)) (EmptyCell!10106) )
))
(declare-datatypes ((array!58482 0))(
  ( (array!58483 (arr!28110 (Array (_ BitVec 32) ValueCell!10106)) (size!28590 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58482)

(assert (=> b!958918 (= res!641603 (and (= (size!28590 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28589 _keys!1668) (size!28590 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958919 () Bool)

(assert (=> b!958919 (= e!540669 false)))

(declare-fun minValue!1328 () V!33217)

(declare-fun lt!430756 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33217)

(declare-datatypes ((tuple2!13694 0))(
  ( (tuple2!13695 (_1!6858 (_ BitVec 64)) (_2!6858 V!33217)) )
))
(declare-datatypes ((List!19528 0))(
  ( (Nil!19525) (Cons!19524 (h!20692 tuple2!13694) (t!27883 List!19528)) )
))
(declare-datatypes ((ListLongMap!12393 0))(
  ( (ListLongMap!12394 (toList!6212 List!19528)) )
))
(declare-fun contains!5326 (ListLongMap!12393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3445 (array!58480 array!58482 (_ BitVec 32) (_ BitVec 32) V!33217 V!33217 (_ BitVec 32) Int) ListLongMap!12393)

(assert (=> b!958919 (= lt!430756 (contains!5326 (getCurrentListMap!3445 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28109 _keys!1668) i!793)))))

(declare-fun res!641604 () Bool)

(assert (=> start!82364 (=> (not res!641604) (not e!540669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82364 (= res!641604 (validMask!0 mask!2088))))

(assert (=> start!82364 e!540669))

(assert (=> start!82364 true))

(assert (=> start!82364 tp_is_empty!21175))

(declare-fun array_inv!21875 (array!58480) Bool)

(assert (=> start!82364 (array_inv!21875 _keys!1668)))

(declare-fun e!540668 () Bool)

(declare-fun array_inv!21876 (array!58482) Bool)

(assert (=> start!82364 (and (array_inv!21876 _values!1386) e!540668)))

(assert (=> start!82364 tp!64369))

(declare-fun mapIsEmpty!33742 () Bool)

(declare-fun mapRes!33742 () Bool)

(assert (=> mapIsEmpty!33742 mapRes!33742))

(declare-fun b!958920 () Bool)

(assert (=> b!958920 (= e!540668 (and e!540670 mapRes!33742))))

(declare-fun condMapEmpty!33742 () Bool)

(declare-fun mapDefault!33742 () ValueCell!10106)

(assert (=> b!958920 (= condMapEmpty!33742 (= (arr!28110 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10106)) mapDefault!33742)))))

(declare-fun mapNonEmpty!33742 () Bool)

(declare-fun tp!64368 () Bool)

(assert (=> mapNonEmpty!33742 (= mapRes!33742 (and tp!64368 e!540672))))

(declare-fun mapKey!33742 () (_ BitVec 32))

(declare-fun mapValue!33742 () ValueCell!10106)

(declare-fun mapRest!33742 () (Array (_ BitVec 32) ValueCell!10106))

(assert (=> mapNonEmpty!33742 (= (arr!28110 _values!1386) (store mapRest!33742 mapKey!33742 mapValue!33742))))

(declare-fun b!958921 () Bool)

(declare-fun res!641605 () Bool)

(assert (=> b!958921 (=> (not res!641605) (not e!540669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58480 (_ BitVec 32)) Bool)

(assert (=> b!958921 (= res!641605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82364 res!641604) b!958918))

(assert (= (and b!958918 res!641603) b!958921))

(assert (= (and b!958921 res!641605) b!958915))

(assert (= (and b!958915 res!641608) b!958916))

(assert (= (and b!958916 res!641607) b!958913))

(assert (= (and b!958913 res!641606) b!958919))

(assert (= (and b!958920 condMapEmpty!33742) mapIsEmpty!33742))

(assert (= (and b!958920 (not condMapEmpty!33742)) mapNonEmpty!33742))

(get-info :version)

(assert (= (and mapNonEmpty!33742 ((_ is ValueCellFull!10106) mapValue!33742)) b!958917))

(assert (= (and b!958920 ((_ is ValueCellFull!10106) mapDefault!33742)) b!958914))

(assert (= start!82364 b!958920))

(declare-fun m!890091 () Bool)

(assert (=> b!958919 m!890091))

(declare-fun m!890093 () Bool)

(assert (=> b!958919 m!890093))

(assert (=> b!958919 m!890091))

(assert (=> b!958919 m!890093))

(declare-fun m!890095 () Bool)

(assert (=> b!958919 m!890095))

(declare-fun m!890097 () Bool)

(assert (=> mapNonEmpty!33742 m!890097))

(declare-fun m!890099 () Bool)

(assert (=> b!958921 m!890099))

(declare-fun m!890101 () Bool)

(assert (=> b!958915 m!890101))

(assert (=> b!958913 m!890093))

(assert (=> b!958913 m!890093))

(declare-fun m!890103 () Bool)

(assert (=> b!958913 m!890103))

(declare-fun m!890105 () Bool)

(assert (=> start!82364 m!890105))

(declare-fun m!890107 () Bool)

(assert (=> start!82364 m!890107))

(declare-fun m!890109 () Bool)

(assert (=> start!82364 m!890109))

(check-sat tp_is_empty!21175 (not b_next!18469) (not b!958919) (not b!958913) b_and!29967 (not start!82364) (not mapNonEmpty!33742) (not b!958915) (not b!958921))
(check-sat b_and!29967 (not b_next!18469))
