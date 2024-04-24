; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82028 () Bool)

(assert start!82028)

(declare-fun b_free!18355 () Bool)

(declare-fun b_next!18355 () Bool)

(assert (=> start!82028 (= b_free!18355 (not b_next!18355))))

(declare-fun tp!63765 () Bool)

(declare-fun b_and!29851 () Bool)

(assert (=> start!82028 (= tp!63765 b_and!29851)))

(declare-fun b!955573 () Bool)

(declare-fun e!538431 () Bool)

(declare-fun tp_is_empty!20899 () Bool)

(assert (=> b!955573 (= e!538431 tp_is_empty!20899)))

(declare-fun b!955574 () Bool)

(declare-fun e!538433 () Bool)

(assert (=> b!955574 (= e!538433 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32849 0))(
  ( (V!32850 (val!10500 Int)) )
))
(declare-fun zeroValue!1139 () V!32849)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57958 0))(
  ( (array!57959 (arr!27854 (Array (_ BitVec 32) (_ BitVec 64))) (size!28334 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57958)

(declare-datatypes ((ValueCell!9968 0))(
  ( (ValueCellFull!9968 (v!13052 V!32849)) (EmptyCell!9968) )
))
(declare-datatypes ((array!57960 0))(
  ( (array!57961 (arr!27855 (Array (_ BitVec 32) ValueCell!9968)) (size!28335 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57960)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun lt!430287 () Bool)

(declare-fun minValue!1139 () V!32849)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13612 0))(
  ( (tuple2!13613 (_1!6817 (_ BitVec 64)) (_2!6817 V!32849)) )
))
(declare-datatypes ((List!19400 0))(
  ( (Nil!19397) (Cons!19396 (h!20564 tuple2!13612) (t!27753 List!19400)) )
))
(declare-datatypes ((ListLongMap!12311 0))(
  ( (ListLongMap!12312 (toList!6171 List!19400)) )
))
(declare-fun contains!5280 (ListLongMap!12311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3404 (array!57958 array!57960 (_ BitVec 32) (_ BitVec 32) V!32849 V!32849 (_ BitVec 32) Int) ListLongMap!12311)

(assert (=> b!955574 (= lt!430287 (contains!5280 (getCurrentListMap!3404 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27854 _keys!1441) i!735)))))

(declare-fun b!955575 () Bool)

(declare-fun e!538435 () Bool)

(assert (=> b!955575 (= e!538435 tp_is_empty!20899)))

(declare-fun res!639636 () Bool)

(assert (=> start!82028 (=> (not res!639636) (not e!538433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82028 (= res!639636 (validMask!0 mask!1823))))

(assert (=> start!82028 e!538433))

(assert (=> start!82028 true))

(assert (=> start!82028 tp_is_empty!20899))

(declare-fun array_inv!21699 (array!57958) Bool)

(assert (=> start!82028 (array_inv!21699 _keys!1441)))

(declare-fun e!538432 () Bool)

(declare-fun array_inv!21700 (array!57960) Bool)

(assert (=> start!82028 (and (array_inv!21700 _values!1197) e!538432)))

(assert (=> start!82028 tp!63765))

(declare-fun b!955576 () Bool)

(declare-fun res!639634 () Bool)

(assert (=> b!955576 (=> (not res!639634) (not e!538433))))

(declare-datatypes ((List!19401 0))(
  ( (Nil!19398) (Cons!19397 (h!20565 (_ BitVec 64)) (t!27754 List!19401)) )
))
(declare-fun arrayNoDuplicates!0 (array!57958 (_ BitVec 32) List!19401) Bool)

(assert (=> b!955576 (= res!639634 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19398))))

(declare-fun b!955577 () Bool)

(declare-fun res!639638 () Bool)

(assert (=> b!955577 (=> (not res!639638) (not e!538433))))

(assert (=> b!955577 (= res!639638 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28334 _keys!1441))))))

(declare-fun mapNonEmpty!33310 () Bool)

(declare-fun mapRes!33310 () Bool)

(declare-fun tp!63766 () Bool)

(assert (=> mapNonEmpty!33310 (= mapRes!33310 (and tp!63766 e!538431))))

(declare-fun mapValue!33310 () ValueCell!9968)

(declare-fun mapKey!33310 () (_ BitVec 32))

(declare-fun mapRest!33310 () (Array (_ BitVec 32) ValueCell!9968))

(assert (=> mapNonEmpty!33310 (= (arr!27855 _values!1197) (store mapRest!33310 mapKey!33310 mapValue!33310))))

(declare-fun mapIsEmpty!33310 () Bool)

(assert (=> mapIsEmpty!33310 mapRes!33310))

(declare-fun b!955578 () Bool)

(assert (=> b!955578 (= e!538432 (and e!538435 mapRes!33310))))

(declare-fun condMapEmpty!33310 () Bool)

(declare-fun mapDefault!33310 () ValueCell!9968)

(assert (=> b!955578 (= condMapEmpty!33310 (= (arr!27855 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9968)) mapDefault!33310)))))

(declare-fun b!955579 () Bool)

(declare-fun res!639633 () Bool)

(assert (=> b!955579 (=> (not res!639633) (not e!538433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955579 (= res!639633 (validKeyInArray!0 (select (arr!27854 _keys!1441) i!735)))))

(declare-fun b!955580 () Bool)

(declare-fun res!639635 () Bool)

(assert (=> b!955580 (=> (not res!639635) (not e!538433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57958 (_ BitVec 32)) Bool)

(assert (=> b!955580 (= res!639635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955581 () Bool)

(declare-fun res!639637 () Bool)

(assert (=> b!955581 (=> (not res!639637) (not e!538433))))

(assert (=> b!955581 (= res!639637 (and (= (size!28335 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28334 _keys!1441) (size!28335 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(assert (= (and start!82028 res!639636) b!955581))

(assert (= (and b!955581 res!639637) b!955580))

(assert (= (and b!955580 res!639635) b!955576))

(assert (= (and b!955576 res!639634) b!955577))

(assert (= (and b!955577 res!639638) b!955579))

(assert (= (and b!955579 res!639633) b!955574))

(assert (= (and b!955578 condMapEmpty!33310) mapIsEmpty!33310))

(assert (= (and b!955578 (not condMapEmpty!33310)) mapNonEmpty!33310))

(get-info :version)

(assert (= (and mapNonEmpty!33310 ((_ is ValueCellFull!9968) mapValue!33310)) b!955573))

(assert (= (and b!955578 ((_ is ValueCellFull!9968) mapDefault!33310)) b!955575))

(assert (= start!82028 b!955578))

(declare-fun m!887637 () Bool)

(assert (=> b!955580 m!887637))

(declare-fun m!887639 () Bool)

(assert (=> mapNonEmpty!33310 m!887639))

(declare-fun m!887641 () Bool)

(assert (=> b!955576 m!887641))

(declare-fun m!887643 () Bool)

(assert (=> b!955579 m!887643))

(assert (=> b!955579 m!887643))

(declare-fun m!887645 () Bool)

(assert (=> b!955579 m!887645))

(declare-fun m!887647 () Bool)

(assert (=> b!955574 m!887647))

(assert (=> b!955574 m!887643))

(assert (=> b!955574 m!887647))

(assert (=> b!955574 m!887643))

(declare-fun m!887649 () Bool)

(assert (=> b!955574 m!887649))

(declare-fun m!887651 () Bool)

(assert (=> start!82028 m!887651))

(declare-fun m!887653 () Bool)

(assert (=> start!82028 m!887653))

(declare-fun m!887655 () Bool)

(assert (=> start!82028 m!887655))

(check-sat (not mapNonEmpty!33310) (not b!955579) tp_is_empty!20899 (not b!955576) (not b_next!18355) (not b!955574) b_and!29851 (not start!82028) (not b!955580))
(check-sat b_and!29851 (not b_next!18355))
