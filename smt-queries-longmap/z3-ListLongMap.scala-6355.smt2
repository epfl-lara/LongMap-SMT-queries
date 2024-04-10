; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81868 () Bool)

(assert start!81868)

(declare-fun b_free!18363 () Bool)

(declare-fun b_next!18363 () Bool)

(assert (=> start!81868 (= b_free!18363 (not b_next!18363))))

(declare-fun tp!63789 () Bool)

(declare-fun b_and!29849 () Bool)

(assert (=> start!81868 (= tp!63789 b_and!29849)))

(declare-fun mapNonEmpty!33322 () Bool)

(declare-fun mapRes!33322 () Bool)

(declare-fun tp!63788 () Bool)

(declare-fun e!537913 () Bool)

(assert (=> mapNonEmpty!33322 (= mapRes!33322 (and tp!63788 e!537913))))

(declare-datatypes ((V!32859 0))(
  ( (V!32860 (val!10504 Int)) )
))
(declare-datatypes ((ValueCell!9972 0))(
  ( (ValueCellFull!9972 (v!13059 V!32859)) (EmptyCell!9972) )
))
(declare-fun mapRest!33322 () (Array (_ BitVec 32) ValueCell!9972))

(declare-datatypes ((array!57923 0))(
  ( (array!57924 (arr!27841 (Array (_ BitVec 32) ValueCell!9972)) (size!28320 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57923)

(declare-fun mapValue!33322 () ValueCell!9972)

(declare-fun mapKey!33322 () (_ BitVec 32))

(assert (=> mapNonEmpty!33322 (= (arr!27841 _values!1197) (store mapRest!33322 mapKey!33322 mapValue!33322))))

(declare-fun b!954778 () Bool)

(declare-fun res!639363 () Bool)

(declare-fun e!537909 () Bool)

(assert (=> b!954778 (=> (not res!639363) (not e!537909))))

(declare-datatypes ((array!57925 0))(
  ( (array!57926 (arr!27842 (Array (_ BitVec 32) (_ BitVec 64))) (size!28321 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57925)

(declare-datatypes ((List!19407 0))(
  ( (Nil!19404) (Cons!19403 (h!20565 (_ BitVec 64)) (t!27768 List!19407)) )
))
(declare-fun arrayNoDuplicates!0 (array!57925 (_ BitVec 32) List!19407) Bool)

(assert (=> b!954778 (= res!639363 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19404))))

(declare-fun res!639361 () Bool)

(assert (=> start!81868 (=> (not res!639361) (not e!537909))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81868 (= res!639361 (validMask!0 mask!1823))))

(assert (=> start!81868 e!537909))

(assert (=> start!81868 true))

(declare-fun tp_is_empty!20907 () Bool)

(assert (=> start!81868 tp_is_empty!20907))

(declare-fun array_inv!21611 (array!57925) Bool)

(assert (=> start!81868 (array_inv!21611 _keys!1441)))

(declare-fun e!537912 () Bool)

(declare-fun array_inv!21612 (array!57923) Bool)

(assert (=> start!81868 (and (array_inv!21612 _values!1197) e!537912)))

(assert (=> start!81868 tp!63789))

(declare-fun b!954779 () Bool)

(declare-fun e!537911 () Bool)

(assert (=> b!954779 (= e!537911 tp_is_empty!20907)))

(declare-fun b!954780 () Bool)

(assert (=> b!954780 (= e!537913 tp_is_empty!20907)))

(declare-fun b!954781 () Bool)

(declare-fun res!639362 () Bool)

(assert (=> b!954781 (=> (not res!639362) (not e!537909))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!954781 (= res!639362 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28321 _keys!1441))))))

(declare-fun b!954782 () Bool)

(declare-fun res!639365 () Bool)

(assert (=> b!954782 (=> (not res!639365) (not e!537909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954782 (= res!639365 (validKeyInArray!0 (select (arr!27842 _keys!1441) i!735)))))

(declare-fun b!954783 () Bool)

(declare-fun res!639364 () Bool)

(assert (=> b!954783 (=> (not res!639364) (not e!537909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57925 (_ BitVec 32)) Bool)

(assert (=> b!954783 (= res!639364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954784 () Bool)

(declare-fun res!639366 () Bool)

(assert (=> b!954784 (=> (not res!639366) (not e!537909))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954784 (= res!639366 (and (= (size!28320 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28321 _keys!1441) (size!28320 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954785 () Bool)

(assert (=> b!954785 (= e!537909 false)))

(declare-fun zeroValue!1139 () V!32859)

(declare-fun lt!429938 () Bool)

(declare-fun minValue!1139 () V!32859)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13630 0))(
  ( (tuple2!13631 (_1!6826 (_ BitVec 64)) (_2!6826 V!32859)) )
))
(declare-datatypes ((List!19408 0))(
  ( (Nil!19405) (Cons!19404 (h!20566 tuple2!13630) (t!27769 List!19408)) )
))
(declare-datatypes ((ListLongMap!12327 0))(
  ( (ListLongMap!12328 (toList!6179 List!19408)) )
))
(declare-fun contains!5277 (ListLongMap!12327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3412 (array!57925 array!57923 (_ BitVec 32) (_ BitVec 32) V!32859 V!32859 (_ BitVec 32) Int) ListLongMap!12327)

(assert (=> b!954785 (= lt!429938 (contains!5277 (getCurrentListMap!3412 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27842 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33322 () Bool)

(assert (=> mapIsEmpty!33322 mapRes!33322))

(declare-fun b!954786 () Bool)

(assert (=> b!954786 (= e!537912 (and e!537911 mapRes!33322))))

(declare-fun condMapEmpty!33322 () Bool)

(declare-fun mapDefault!33322 () ValueCell!9972)

(assert (=> b!954786 (= condMapEmpty!33322 (= (arr!27841 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9972)) mapDefault!33322)))))

(assert (= (and start!81868 res!639361) b!954784))

(assert (= (and b!954784 res!639366) b!954783))

(assert (= (and b!954783 res!639364) b!954778))

(assert (= (and b!954778 res!639363) b!954781))

(assert (= (and b!954781 res!639362) b!954782))

(assert (= (and b!954782 res!639365) b!954785))

(assert (= (and b!954786 condMapEmpty!33322) mapIsEmpty!33322))

(assert (= (and b!954786 (not condMapEmpty!33322)) mapNonEmpty!33322))

(get-info :version)

(assert (= (and mapNonEmpty!33322 ((_ is ValueCellFull!9972) mapValue!33322)) b!954780))

(assert (= (and b!954786 ((_ is ValueCellFull!9972) mapDefault!33322)) b!954779))

(assert (= start!81868 b!954786))

(declare-fun m!886423 () Bool)

(assert (=> b!954778 m!886423))

(declare-fun m!886425 () Bool)

(assert (=> start!81868 m!886425))

(declare-fun m!886427 () Bool)

(assert (=> start!81868 m!886427))

(declare-fun m!886429 () Bool)

(assert (=> start!81868 m!886429))

(declare-fun m!886431 () Bool)

(assert (=> b!954782 m!886431))

(assert (=> b!954782 m!886431))

(declare-fun m!886433 () Bool)

(assert (=> b!954782 m!886433))

(declare-fun m!886435 () Bool)

(assert (=> mapNonEmpty!33322 m!886435))

(declare-fun m!886437 () Bool)

(assert (=> b!954783 m!886437))

(declare-fun m!886439 () Bool)

(assert (=> b!954785 m!886439))

(assert (=> b!954785 m!886431))

(assert (=> b!954785 m!886439))

(assert (=> b!954785 m!886431))

(declare-fun m!886441 () Bool)

(assert (=> b!954785 m!886441))

(check-sat (not b!954785) (not b!954782) tp_is_empty!20907 (not start!81868) (not b!954778) (not b!954783) b_and!29849 (not b_next!18363) (not mapNonEmpty!33322))
(check-sat b_and!29849 (not b_next!18363))
