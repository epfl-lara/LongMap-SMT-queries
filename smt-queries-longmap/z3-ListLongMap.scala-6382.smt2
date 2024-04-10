; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82046 () Bool)

(assert start!82046)

(declare-fun b_free!18453 () Bool)

(declare-fun b_next!18453 () Bool)

(assert (=> start!82046 (= b_free!18453 (not b_next!18453))))

(declare-fun tp!64170 () Bool)

(declare-fun b_and!29941 () Bool)

(assert (=> start!82046 (= tp!64170 b_and!29941)))

(declare-fun b!956845 () Bool)

(declare-fun e!539196 () Bool)

(declare-fun e!539198 () Bool)

(declare-fun mapRes!33568 () Bool)

(assert (=> b!956845 (= e!539196 (and e!539198 mapRes!33568))))

(declare-fun condMapEmpty!33568 () Bool)

(declare-datatypes ((V!33075 0))(
  ( (V!33076 (val!10585 Int)) )
))
(declare-datatypes ((ValueCell!10053 0))(
  ( (ValueCellFull!10053 (v!13141 V!33075)) (EmptyCell!10053) )
))
(declare-datatypes ((array!58237 0))(
  ( (array!58238 (arr!27997 (Array (_ BitVec 32) ValueCell!10053)) (size!28476 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58237)

(declare-fun mapDefault!33568 () ValueCell!10053)

(assert (=> b!956845 (= condMapEmpty!33568 (= (arr!27997 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10053)) mapDefault!33568)))))

(declare-fun b!956846 () Bool)

(declare-fun res!640639 () Bool)

(declare-fun e!539197 () Bool)

(assert (=> b!956846 (=> (not res!640639) (not e!539197))))

(declare-datatypes ((array!58239 0))(
  ( (array!58240 (arr!27998 (Array (_ BitVec 32) (_ BitVec 64))) (size!28477 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58239)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956846 (= res!640639 (validKeyInArray!0 (select (arr!27998 _keys!1441) i!735)))))

(declare-fun b!956847 () Bool)

(declare-fun e!539200 () Bool)

(declare-fun tp_is_empty!21069 () Bool)

(assert (=> b!956847 (= e!539200 tp_is_empty!21069)))

(declare-fun b!956848 () Bool)

(assert (=> b!956848 (= e!539198 tp_is_empty!21069)))

(declare-fun mapIsEmpty!33568 () Bool)

(assert (=> mapIsEmpty!33568 mapRes!33568))

(declare-fun mapNonEmpty!33568 () Bool)

(declare-fun tp!64169 () Bool)

(assert (=> mapNonEmpty!33568 (= mapRes!33568 (and tp!64169 e!539200))))

(declare-fun mapRest!33568 () (Array (_ BitVec 32) ValueCell!10053))

(declare-fun mapKey!33568 () (_ BitVec 32))

(declare-fun mapValue!33568 () ValueCell!10053)

(assert (=> mapNonEmpty!33568 (= (arr!27997 _values!1197) (store mapRest!33568 mapKey!33568 mapValue!33568))))

(declare-fun res!640636 () Bool)

(assert (=> start!82046 (=> (not res!640636) (not e!539197))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82046 (= res!640636 (validMask!0 mask!1823))))

(assert (=> start!82046 e!539197))

(assert (=> start!82046 true))

(assert (=> start!82046 tp_is_empty!21069))

(declare-fun array_inv!21721 (array!58239) Bool)

(assert (=> start!82046 (array_inv!21721 _keys!1441)))

(declare-fun array_inv!21722 (array!58237) Bool)

(assert (=> start!82046 (and (array_inv!21722 _values!1197) e!539196)))

(assert (=> start!82046 tp!64170))

(declare-fun b!956849 () Bool)

(declare-fun res!640641 () Bool)

(assert (=> b!956849 (=> (not res!640641) (not e!539197))))

(assert (=> b!956849 (= res!640641 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28477 _keys!1441))))))

(declare-fun b!956850 () Bool)

(declare-fun res!640637 () Bool)

(assert (=> b!956850 (=> (not res!640637) (not e!539197))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956850 (= res!640637 (and (= (size!28476 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28477 _keys!1441) (size!28476 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956851 () Bool)

(declare-fun res!640638 () Bool)

(assert (=> b!956851 (=> (not res!640638) (not e!539197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58239 (_ BitVec 32)) Bool)

(assert (=> b!956851 (= res!640638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956852 () Bool)

(assert (=> b!956852 (= e!539197 (not true))))

(declare-fun zeroValue!1139 () V!33075)

(declare-fun minValue!1139 () V!33075)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13700 0))(
  ( (tuple2!13701 (_1!6861 (_ BitVec 64)) (_2!6861 V!33075)) )
))
(declare-datatypes ((List!19498 0))(
  ( (Nil!19495) (Cons!19494 (h!20656 tuple2!13700) (t!27861 List!19498)) )
))
(declare-datatypes ((ListLongMap!12397 0))(
  ( (ListLongMap!12398 (toList!6214 List!19498)) )
))
(declare-fun contains!5313 (ListLongMap!12397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3447 (array!58239 array!58237 (_ BitVec 32) (_ BitVec 32) V!33075 V!33075 (_ BitVec 32) Int) ListLongMap!12397)

(assert (=> b!956852 (contains!5313 (getCurrentListMap!3447 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27998 _keys!1441) i!735))))

(declare-datatypes ((Unit!32147 0))(
  ( (Unit!32148) )
))
(declare-fun lt!430259 () Unit!32147)

(declare-fun lemmaInListMapFromThenFromZero!26 (array!58239 array!58237 (_ BitVec 32) (_ BitVec 32) V!33075 V!33075 (_ BitVec 32) (_ BitVec 32) Int) Unit!32147)

(assert (=> b!956852 (= lt!430259 (lemmaInListMapFromThenFromZero!26 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956853 () Bool)

(declare-fun res!640640 () Bool)

(assert (=> b!956853 (=> (not res!640640) (not e!539197))))

(assert (=> b!956853 (= res!640640 (contains!5313 (getCurrentListMap!3447 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27998 _keys!1441) i!735)))))

(declare-fun b!956854 () Bool)

(declare-fun res!640635 () Bool)

(assert (=> b!956854 (=> (not res!640635) (not e!539197))))

(declare-datatypes ((List!19499 0))(
  ( (Nil!19496) (Cons!19495 (h!20657 (_ BitVec 64)) (t!27862 List!19499)) )
))
(declare-fun arrayNoDuplicates!0 (array!58239 (_ BitVec 32) List!19499) Bool)

(assert (=> b!956854 (= res!640635 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19496))))

(assert (= (and start!82046 res!640636) b!956850))

(assert (= (and b!956850 res!640637) b!956851))

(assert (= (and b!956851 res!640638) b!956854))

(assert (= (and b!956854 res!640635) b!956849))

(assert (= (and b!956849 res!640641) b!956846))

(assert (= (and b!956846 res!640639) b!956853))

(assert (= (and b!956853 res!640640) b!956852))

(assert (= (and b!956845 condMapEmpty!33568) mapIsEmpty!33568))

(assert (= (and b!956845 (not condMapEmpty!33568)) mapNonEmpty!33568))

(get-info :version)

(assert (= (and mapNonEmpty!33568 ((_ is ValueCellFull!10053) mapValue!33568)) b!956847))

(assert (= (and b!956845 ((_ is ValueCellFull!10053) mapDefault!33568)) b!956848))

(assert (= start!82046 b!956845))

(declare-fun m!888021 () Bool)

(assert (=> b!956852 m!888021))

(declare-fun m!888023 () Bool)

(assert (=> b!956852 m!888023))

(assert (=> b!956852 m!888021))

(assert (=> b!956852 m!888023))

(declare-fun m!888025 () Bool)

(assert (=> b!956852 m!888025))

(declare-fun m!888027 () Bool)

(assert (=> b!956852 m!888027))

(declare-fun m!888029 () Bool)

(assert (=> b!956853 m!888029))

(assert (=> b!956853 m!888023))

(assert (=> b!956853 m!888029))

(assert (=> b!956853 m!888023))

(declare-fun m!888031 () Bool)

(assert (=> b!956853 m!888031))

(declare-fun m!888033 () Bool)

(assert (=> start!82046 m!888033))

(declare-fun m!888035 () Bool)

(assert (=> start!82046 m!888035))

(declare-fun m!888037 () Bool)

(assert (=> start!82046 m!888037))

(declare-fun m!888039 () Bool)

(assert (=> b!956851 m!888039))

(assert (=> b!956846 m!888023))

(assert (=> b!956846 m!888023))

(declare-fun m!888041 () Bool)

(assert (=> b!956846 m!888041))

(declare-fun m!888043 () Bool)

(assert (=> b!956854 m!888043))

(declare-fun m!888045 () Bool)

(assert (=> mapNonEmpty!33568 m!888045))

(check-sat (not b!956853) tp_is_empty!21069 (not b!956854) (not b!956846) (not b_next!18453) (not mapNonEmpty!33568) (not start!82046) (not b!956852) b_and!29941 (not b!956851))
(check-sat b_and!29941 (not b_next!18453))
