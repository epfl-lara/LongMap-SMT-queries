; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82100 () Bool)

(assert start!82100)

(declare-fun b_free!18427 () Bool)

(declare-fun b_next!18427 () Bool)

(assert (=> start!82100 (= b_free!18427 (not b_next!18427))))

(declare-fun tp!63982 () Bool)

(declare-fun b_and!29923 () Bool)

(assert (=> start!82100 (= tp!63982 b_and!29923)))

(declare-fun mapNonEmpty!33418 () Bool)

(declare-fun mapRes!33418 () Bool)

(declare-fun tp!63981 () Bool)

(declare-fun e!538973 () Bool)

(assert (=> mapNonEmpty!33418 (= mapRes!33418 (and tp!63981 e!538973))))

(declare-datatypes ((V!32945 0))(
  ( (V!32946 (val!10536 Int)) )
))
(declare-datatypes ((ValueCell!10004 0))(
  ( (ValueCellFull!10004 (v!13088 V!32945)) (EmptyCell!10004) )
))
(declare-fun mapRest!33418 () (Array (_ BitVec 32) ValueCell!10004))

(declare-fun mapValue!33418 () ValueCell!10004)

(declare-datatypes ((array!58094 0))(
  ( (array!58095 (arr!27922 (Array (_ BitVec 32) ValueCell!10004)) (size!28402 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58094)

(declare-fun mapKey!33418 () (_ BitVec 32))

(assert (=> mapNonEmpty!33418 (= (arr!27922 _values!1197) (store mapRest!33418 mapKey!33418 mapValue!33418))))

(declare-fun b!956610 () Bool)

(declare-fun e!538975 () Bool)

(declare-fun tp_is_empty!20971 () Bool)

(assert (=> b!956610 (= e!538975 tp_is_empty!20971)))

(declare-fun b!956611 () Bool)

(declare-fun e!538971 () Bool)

(assert (=> b!956611 (= e!538971 (and e!538975 mapRes!33418))))

(declare-fun condMapEmpty!33418 () Bool)

(declare-fun mapDefault!33418 () ValueCell!10004)

(assert (=> b!956611 (= condMapEmpty!33418 (= (arr!27922 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10004)) mapDefault!33418)))))

(declare-fun b!956612 () Bool)

(declare-fun res!640347 () Bool)

(declare-fun e!538974 () Bool)

(assert (=> b!956612 (=> (not res!640347) (not e!538974))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58096 0))(
  ( (array!58097 (arr!27923 (Array (_ BitVec 32) (_ BitVec 64))) (size!28403 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58096)

(assert (=> b!956612 (= res!640347 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28403 _keys!1441))))))

(declare-fun b!956613 () Bool)

(declare-fun res!640349 () Bool)

(assert (=> b!956613 (=> (not res!640349) (not e!538974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956613 (= res!640349 (validKeyInArray!0 (select (arr!27923 _keys!1441) i!735)))))

(declare-fun b!956614 () Bool)

(declare-fun res!640348 () Bool)

(assert (=> b!956614 (=> (not res!640348) (not e!538974))))

(declare-datatypes ((List!19450 0))(
  ( (Nil!19447) (Cons!19446 (h!20614 (_ BitVec 64)) (t!27803 List!19450)) )
))
(declare-fun arrayNoDuplicates!0 (array!58096 (_ BitVec 32) List!19450) Bool)

(assert (=> b!956614 (= res!640348 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19447))))

(declare-fun res!640346 () Bool)

(assert (=> start!82100 (=> (not res!640346) (not e!538974))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82100 (= res!640346 (validMask!0 mask!1823))))

(assert (=> start!82100 e!538974))

(assert (=> start!82100 true))

(assert (=> start!82100 tp_is_empty!20971))

(declare-fun array_inv!21743 (array!58096) Bool)

(assert (=> start!82100 (array_inv!21743 _keys!1441)))

(declare-fun array_inv!21744 (array!58094) Bool)

(assert (=> start!82100 (and (array_inv!21744 _values!1197) e!538971)))

(assert (=> start!82100 tp!63982))

(declare-fun b!956615 () Bool)

(declare-fun res!640350 () Bool)

(assert (=> b!956615 (=> (not res!640350) (not e!538974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58096 (_ BitVec 32)) Bool)

(assert (=> b!956615 (= res!640350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956616 () Bool)

(declare-fun res!640352 () Bool)

(assert (=> b!956616 (=> (not res!640352) (not e!538974))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32945)

(declare-fun minValue!1139 () V!32945)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13668 0))(
  ( (tuple2!13669 (_1!6845 (_ BitVec 64)) (_2!6845 V!32945)) )
))
(declare-datatypes ((List!19451 0))(
  ( (Nil!19448) (Cons!19447 (h!20615 tuple2!13668) (t!27804 List!19451)) )
))
(declare-datatypes ((ListLongMap!12367 0))(
  ( (ListLongMap!12368 (toList!6199 List!19451)) )
))
(declare-fun contains!5308 (ListLongMap!12367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3432 (array!58096 array!58094 (_ BitVec 32) (_ BitVec 32) V!32945 V!32945 (_ BitVec 32) Int) ListLongMap!12367)

(assert (=> b!956616 (= res!640352 (contains!5308 (getCurrentListMap!3432 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27923 _keys!1441) i!735)))))

(declare-fun b!956617 () Bool)

(declare-fun res!640351 () Bool)

(assert (=> b!956617 (=> (not res!640351) (not e!538974))))

(assert (=> b!956617 (= res!640351 (and (= (size!28402 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28403 _keys!1441) (size!28402 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956618 () Bool)

(assert (=> b!956618 (= e!538973 tp_is_empty!20971)))

(declare-fun b!956619 () Bool)

(assert (=> b!956619 (= e!538974 (not true))))

(assert (=> b!956619 (contains!5308 (getCurrentListMap!3432 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27923 _keys!1441) i!735))))

(declare-datatypes ((Unit!32100 0))(
  ( (Unit!32101) )
))
(declare-fun lt!430395 () Unit!32100)

(declare-fun lemmaInListMapFromThenFromZero!15 (array!58096 array!58094 (_ BitVec 32) (_ BitVec 32) V!32945 V!32945 (_ BitVec 32) (_ BitVec 32) Int) Unit!32100)

(assert (=> b!956619 (= lt!430395 (lemmaInListMapFromThenFromZero!15 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapIsEmpty!33418 () Bool)

(assert (=> mapIsEmpty!33418 mapRes!33418))

(assert (= (and start!82100 res!640346) b!956617))

(assert (= (and b!956617 res!640351) b!956615))

(assert (= (and b!956615 res!640350) b!956614))

(assert (= (and b!956614 res!640348) b!956612))

(assert (= (and b!956612 res!640347) b!956613))

(assert (= (and b!956613 res!640349) b!956616))

(assert (= (and b!956616 res!640352) b!956619))

(assert (= (and b!956611 condMapEmpty!33418) mapIsEmpty!33418))

(assert (= (and b!956611 (not condMapEmpty!33418)) mapNonEmpty!33418))

(get-info :version)

(assert (= (and mapNonEmpty!33418 ((_ is ValueCellFull!10004) mapValue!33418)) b!956618))

(assert (= (and b!956611 ((_ is ValueCellFull!10004) mapDefault!33418)) b!956610))

(assert (= start!82100 b!956611))

(declare-fun m!888483 () Bool)

(assert (=> b!956614 m!888483))

(declare-fun m!888485 () Bool)

(assert (=> mapNonEmpty!33418 m!888485))

(declare-fun m!888487 () Bool)

(assert (=> start!82100 m!888487))

(declare-fun m!888489 () Bool)

(assert (=> start!82100 m!888489))

(declare-fun m!888491 () Bool)

(assert (=> start!82100 m!888491))

(declare-fun m!888493 () Bool)

(assert (=> b!956616 m!888493))

(declare-fun m!888495 () Bool)

(assert (=> b!956616 m!888495))

(assert (=> b!956616 m!888493))

(assert (=> b!956616 m!888495))

(declare-fun m!888497 () Bool)

(assert (=> b!956616 m!888497))

(assert (=> b!956613 m!888495))

(assert (=> b!956613 m!888495))

(declare-fun m!888499 () Bool)

(assert (=> b!956613 m!888499))

(declare-fun m!888501 () Bool)

(assert (=> b!956619 m!888501))

(assert (=> b!956619 m!888495))

(assert (=> b!956619 m!888501))

(assert (=> b!956619 m!888495))

(declare-fun m!888503 () Bool)

(assert (=> b!956619 m!888503))

(declare-fun m!888505 () Bool)

(assert (=> b!956619 m!888505))

(declare-fun m!888507 () Bool)

(assert (=> b!956615 m!888507))

(check-sat (not b!956616) (not b_next!18427) b_and!29923 (not b!956613) (not start!82100) tp_is_empty!20971 (not b!956615) (not b!956619) (not mapNonEmpty!33418) (not b!956614))
(check-sat b_and!29923 (not b_next!18427))
