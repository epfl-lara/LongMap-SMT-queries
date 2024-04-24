; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82022 () Bool)

(assert start!82022)

(declare-fun b_free!18349 () Bool)

(declare-fun b_next!18349 () Bool)

(assert (=> start!82022 (= b_free!18349 (not b_next!18349))))

(declare-fun tp!63748 () Bool)

(declare-fun b_and!29845 () Bool)

(assert (=> start!82022 (= tp!63748 b_and!29845)))

(declare-fun b!955492 () Bool)

(declare-fun e!538388 () Bool)

(declare-fun tp_is_empty!20893 () Bool)

(assert (=> b!955492 (= e!538388 tp_is_empty!20893)))

(declare-fun b!955493 () Bool)

(declare-fun res!639581 () Bool)

(declare-fun e!538387 () Bool)

(assert (=> b!955493 (=> (not res!639581) (not e!538387))))

(declare-datatypes ((array!57946 0))(
  ( (array!57947 (arr!27848 (Array (_ BitVec 32) (_ BitVec 64))) (size!28328 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57946)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57946 (_ BitVec 32)) Bool)

(assert (=> b!955493 (= res!639581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955494 () Bool)

(declare-fun res!639580 () Bool)

(assert (=> b!955494 (=> (not res!639580) (not e!538387))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!955494 (= res!639580 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28328 _keys!1441))))))

(declare-fun mapNonEmpty!33301 () Bool)

(declare-fun mapRes!33301 () Bool)

(declare-fun tp!63747 () Bool)

(assert (=> mapNonEmpty!33301 (= mapRes!33301 (and tp!63747 e!538388))))

(declare-datatypes ((V!32841 0))(
  ( (V!32842 (val!10497 Int)) )
))
(declare-datatypes ((ValueCell!9965 0))(
  ( (ValueCellFull!9965 (v!13049 V!32841)) (EmptyCell!9965) )
))
(declare-fun mapValue!33301 () ValueCell!9965)

(declare-fun mapRest!33301 () (Array (_ BitVec 32) ValueCell!9965))

(declare-datatypes ((array!57948 0))(
  ( (array!57949 (arr!27849 (Array (_ BitVec 32) ValueCell!9965)) (size!28329 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57948)

(declare-fun mapKey!33301 () (_ BitVec 32))

(assert (=> mapNonEmpty!33301 (= (arr!27849 _values!1197) (store mapRest!33301 mapKey!33301 mapValue!33301))))

(declare-fun mapIsEmpty!33301 () Bool)

(assert (=> mapIsEmpty!33301 mapRes!33301))

(declare-fun b!955496 () Bool)

(declare-fun res!639584 () Bool)

(assert (=> b!955496 (=> (not res!639584) (not e!538387))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955496 (= res!639584 (and (= (size!28329 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28328 _keys!1441) (size!28329 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955497 () Bool)

(declare-fun e!538390 () Bool)

(assert (=> b!955497 (= e!538390 tp_is_empty!20893)))

(declare-fun b!955498 () Bool)

(assert (=> b!955498 (= e!538387 false)))

(declare-fun zeroValue!1139 () V!32841)

(declare-fun lt!430278 () Bool)

(declare-fun minValue!1139 () V!32841)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13608 0))(
  ( (tuple2!13609 (_1!6815 (_ BitVec 64)) (_2!6815 V!32841)) )
))
(declare-datatypes ((List!19397 0))(
  ( (Nil!19394) (Cons!19393 (h!20561 tuple2!13608) (t!27750 List!19397)) )
))
(declare-datatypes ((ListLongMap!12307 0))(
  ( (ListLongMap!12308 (toList!6169 List!19397)) )
))
(declare-fun contains!5278 (ListLongMap!12307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3402 (array!57946 array!57948 (_ BitVec 32) (_ BitVec 32) V!32841 V!32841 (_ BitVec 32) Int) ListLongMap!12307)

(assert (=> b!955498 (= lt!430278 (contains!5278 (getCurrentListMap!3402 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27848 _keys!1441) i!735)))))

(declare-fun b!955499 () Bool)

(declare-fun res!639582 () Bool)

(assert (=> b!955499 (=> (not res!639582) (not e!538387))))

(declare-datatypes ((List!19398 0))(
  ( (Nil!19395) (Cons!19394 (h!20562 (_ BitVec 64)) (t!27751 List!19398)) )
))
(declare-fun arrayNoDuplicates!0 (array!57946 (_ BitVec 32) List!19398) Bool)

(assert (=> b!955499 (= res!639582 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19395))))

(declare-fun b!955500 () Bool)

(declare-fun res!639583 () Bool)

(assert (=> b!955500 (=> (not res!639583) (not e!538387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955500 (= res!639583 (validKeyInArray!0 (select (arr!27848 _keys!1441) i!735)))))

(declare-fun res!639579 () Bool)

(assert (=> start!82022 (=> (not res!639579) (not e!538387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82022 (= res!639579 (validMask!0 mask!1823))))

(assert (=> start!82022 e!538387))

(assert (=> start!82022 true))

(assert (=> start!82022 tp_is_empty!20893))

(declare-fun array_inv!21695 (array!57946) Bool)

(assert (=> start!82022 (array_inv!21695 _keys!1441)))

(declare-fun e!538389 () Bool)

(declare-fun array_inv!21696 (array!57948) Bool)

(assert (=> start!82022 (and (array_inv!21696 _values!1197) e!538389)))

(assert (=> start!82022 tp!63748))

(declare-fun b!955495 () Bool)

(assert (=> b!955495 (= e!538389 (and e!538390 mapRes!33301))))

(declare-fun condMapEmpty!33301 () Bool)

(declare-fun mapDefault!33301 () ValueCell!9965)

(assert (=> b!955495 (= condMapEmpty!33301 (= (arr!27849 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9965)) mapDefault!33301)))))

(assert (= (and start!82022 res!639579) b!955496))

(assert (= (and b!955496 res!639584) b!955493))

(assert (= (and b!955493 res!639581) b!955499))

(assert (= (and b!955499 res!639582) b!955494))

(assert (= (and b!955494 res!639580) b!955500))

(assert (= (and b!955500 res!639583) b!955498))

(assert (= (and b!955495 condMapEmpty!33301) mapIsEmpty!33301))

(assert (= (and b!955495 (not condMapEmpty!33301)) mapNonEmpty!33301))

(get-info :version)

(assert (= (and mapNonEmpty!33301 ((_ is ValueCellFull!9965) mapValue!33301)) b!955492))

(assert (= (and b!955495 ((_ is ValueCellFull!9965) mapDefault!33301)) b!955497))

(assert (= start!82022 b!955495))

(declare-fun m!887577 () Bool)

(assert (=> start!82022 m!887577))

(declare-fun m!887579 () Bool)

(assert (=> start!82022 m!887579))

(declare-fun m!887581 () Bool)

(assert (=> start!82022 m!887581))

(declare-fun m!887583 () Bool)

(assert (=> b!955493 m!887583))

(declare-fun m!887585 () Bool)

(assert (=> b!955500 m!887585))

(assert (=> b!955500 m!887585))

(declare-fun m!887587 () Bool)

(assert (=> b!955500 m!887587))

(declare-fun m!887589 () Bool)

(assert (=> b!955498 m!887589))

(assert (=> b!955498 m!887585))

(assert (=> b!955498 m!887589))

(assert (=> b!955498 m!887585))

(declare-fun m!887591 () Bool)

(assert (=> b!955498 m!887591))

(declare-fun m!887593 () Bool)

(assert (=> mapNonEmpty!33301 m!887593))

(declare-fun m!887595 () Bool)

(assert (=> b!955499 m!887595))

(check-sat (not b!955493) (not b!955498) tp_is_empty!20893 (not start!82022) (not b_next!18349) (not mapNonEmpty!33301) b_and!29845 (not b!955500) (not b!955499))
(check-sat b_and!29845 (not b_next!18349))
