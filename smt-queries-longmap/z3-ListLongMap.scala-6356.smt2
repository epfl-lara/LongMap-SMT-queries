; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82040 () Bool)

(assert start!82040)

(declare-fun b_free!18367 () Bool)

(declare-fun b_next!18367 () Bool)

(assert (=> start!82040 (= b_free!18367 (not b_next!18367))))

(declare-fun tp!63802 () Bool)

(declare-fun b_and!29863 () Bool)

(assert (=> start!82040 (= tp!63802 b_and!29863)))

(declare-fun mapNonEmpty!33328 () Bool)

(declare-fun mapRes!33328 () Bool)

(declare-fun tp!63801 () Bool)

(declare-fun e!538525 () Bool)

(assert (=> mapNonEmpty!33328 (= mapRes!33328 (and tp!63801 e!538525))))

(declare-datatypes ((V!32865 0))(
  ( (V!32866 (val!10506 Int)) )
))
(declare-datatypes ((ValueCell!9974 0))(
  ( (ValueCellFull!9974 (v!13058 V!32865)) (EmptyCell!9974) )
))
(declare-fun mapValue!33328 () ValueCell!9974)

(declare-fun mapKey!33328 () (_ BitVec 32))

(declare-datatypes ((array!57982 0))(
  ( (array!57983 (arr!27866 (Array (_ BitVec 32) ValueCell!9974)) (size!28346 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57982)

(declare-fun mapRest!33328 () (Array (_ BitVec 32) ValueCell!9974))

(assert (=> mapNonEmpty!33328 (= (arr!27866 _values!1197) (store mapRest!33328 mapKey!33328 mapValue!33328))))

(declare-fun mapIsEmpty!33328 () Bool)

(assert (=> mapIsEmpty!33328 mapRes!33328))

(declare-fun b!955735 () Bool)

(declare-fun res!639746 () Bool)

(declare-fun e!538522 () Bool)

(assert (=> b!955735 (=> (not res!639746) (not e!538522))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57984 0))(
  ( (array!57985 (arr!27867 (Array (_ BitVec 32) (_ BitVec 64))) (size!28347 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57984)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955735 (= res!639746 (and (= (size!28346 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28347 _keys!1441) (size!28346 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955736 () Bool)

(declare-fun res!639743 () Bool)

(assert (=> b!955736 (=> (not res!639743) (not e!538522))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!955736 (= res!639743 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28347 _keys!1441))))))

(declare-fun b!955738 () Bool)

(declare-fun res!639741 () Bool)

(assert (=> b!955738 (=> (not res!639741) (not e!538522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955738 (= res!639741 (validKeyInArray!0 (select (arr!27867 _keys!1441) i!735)))))

(declare-fun b!955739 () Bool)

(declare-fun e!538523 () Bool)

(declare-fun tp_is_empty!20911 () Bool)

(assert (=> b!955739 (= e!538523 tp_is_empty!20911)))

(declare-fun b!955740 () Bool)

(assert (=> b!955740 (= e!538522 false)))

(declare-fun zeroValue!1139 () V!32865)

(declare-fun lt!430305 () Bool)

(declare-fun minValue!1139 () V!32865)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13624 0))(
  ( (tuple2!13625 (_1!6823 (_ BitVec 64)) (_2!6823 V!32865)) )
))
(declare-datatypes ((List!19410 0))(
  ( (Nil!19407) (Cons!19406 (h!20574 tuple2!13624) (t!27763 List!19410)) )
))
(declare-datatypes ((ListLongMap!12323 0))(
  ( (ListLongMap!12324 (toList!6177 List!19410)) )
))
(declare-fun contains!5286 (ListLongMap!12323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3410 (array!57984 array!57982 (_ BitVec 32) (_ BitVec 32) V!32865 V!32865 (_ BitVec 32) Int) ListLongMap!12323)

(assert (=> b!955740 (= lt!430305 (contains!5286 (getCurrentListMap!3410 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27867 _keys!1441) i!735)))))

(declare-fun b!955741 () Bool)

(declare-fun e!538524 () Bool)

(assert (=> b!955741 (= e!538524 (and e!538523 mapRes!33328))))

(declare-fun condMapEmpty!33328 () Bool)

(declare-fun mapDefault!33328 () ValueCell!9974)

(assert (=> b!955741 (= condMapEmpty!33328 (= (arr!27866 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9974)) mapDefault!33328)))))

(declare-fun b!955742 () Bool)

(assert (=> b!955742 (= e!538525 tp_is_empty!20911)))

(declare-fun b!955743 () Bool)

(declare-fun res!639742 () Bool)

(assert (=> b!955743 (=> (not res!639742) (not e!538522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57984 (_ BitVec 32)) Bool)

(assert (=> b!955743 (= res!639742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!639744 () Bool)

(assert (=> start!82040 (=> (not res!639744) (not e!538522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82040 (= res!639744 (validMask!0 mask!1823))))

(assert (=> start!82040 e!538522))

(assert (=> start!82040 true))

(assert (=> start!82040 tp_is_empty!20911))

(declare-fun array_inv!21709 (array!57984) Bool)

(assert (=> start!82040 (array_inv!21709 _keys!1441)))

(declare-fun array_inv!21710 (array!57982) Bool)

(assert (=> start!82040 (and (array_inv!21710 _values!1197) e!538524)))

(assert (=> start!82040 tp!63802))

(declare-fun b!955737 () Bool)

(declare-fun res!639745 () Bool)

(assert (=> b!955737 (=> (not res!639745) (not e!538522))))

(declare-datatypes ((List!19411 0))(
  ( (Nil!19408) (Cons!19407 (h!20575 (_ BitVec 64)) (t!27764 List!19411)) )
))
(declare-fun arrayNoDuplicates!0 (array!57984 (_ BitVec 32) List!19411) Bool)

(assert (=> b!955737 (= res!639745 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19408))))

(assert (= (and start!82040 res!639744) b!955735))

(assert (= (and b!955735 res!639746) b!955743))

(assert (= (and b!955743 res!639742) b!955737))

(assert (= (and b!955737 res!639745) b!955736))

(assert (= (and b!955736 res!639743) b!955738))

(assert (= (and b!955738 res!639741) b!955740))

(assert (= (and b!955741 condMapEmpty!33328) mapIsEmpty!33328))

(assert (= (and b!955741 (not condMapEmpty!33328)) mapNonEmpty!33328))

(get-info :version)

(assert (= (and mapNonEmpty!33328 ((_ is ValueCellFull!9974) mapValue!33328)) b!955742))

(assert (= (and b!955741 ((_ is ValueCellFull!9974) mapDefault!33328)) b!955739))

(assert (= start!82040 b!955741))

(declare-fun m!887757 () Bool)

(assert (=> start!82040 m!887757))

(declare-fun m!887759 () Bool)

(assert (=> start!82040 m!887759))

(declare-fun m!887761 () Bool)

(assert (=> start!82040 m!887761))

(declare-fun m!887763 () Bool)

(assert (=> b!955737 m!887763))

(declare-fun m!887765 () Bool)

(assert (=> b!955743 m!887765))

(declare-fun m!887767 () Bool)

(assert (=> mapNonEmpty!33328 m!887767))

(declare-fun m!887769 () Bool)

(assert (=> b!955740 m!887769))

(declare-fun m!887771 () Bool)

(assert (=> b!955740 m!887771))

(assert (=> b!955740 m!887769))

(assert (=> b!955740 m!887771))

(declare-fun m!887773 () Bool)

(assert (=> b!955740 m!887773))

(assert (=> b!955738 m!887771))

(assert (=> b!955738 m!887771))

(declare-fun m!887775 () Bool)

(assert (=> b!955738 m!887775))

(check-sat (not b!955743) (not start!82040) (not b!955738) (not b!955737) (not b!955740) (not mapNonEmpty!33328) (not b_next!18367) tp_is_empty!20911 b_and!29863)
(check-sat b_and!29863 (not b_next!18367))
