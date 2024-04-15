; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81920 () Bool)

(assert start!81920)

(declare-fun b_free!18433 () Bool)

(declare-fun b_next!18433 () Bool)

(assert (=> start!81920 (= b_free!18433 (not b_next!18433))))

(declare-fun tp!64000 () Bool)

(declare-fun b_and!29893 () Bool)

(assert (=> start!81920 (= tp!64000 b_and!29893)))

(declare-fun b!955558 () Bool)

(declare-fun res!639959 () Bool)

(declare-fun e!538287 () Bool)

(assert (=> b!955558 (=> (not res!639959) (not e!538287))))

(declare-datatypes ((array!58014 0))(
  ( (array!58015 (arr!27887 (Array (_ BitVec 32) (_ BitVec 64))) (size!28368 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58014)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58014 (_ BitVec 32)) Bool)

(assert (=> b!955558 (= res!639959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955559 () Bool)

(declare-fun res!639957 () Bool)

(assert (=> b!955559 (=> (not res!639957) (not e!538287))))

(declare-datatypes ((List!19469 0))(
  ( (Nil!19466) (Cons!19465 (h!20627 (_ BitVec 64)) (t!27821 List!19469)) )
))
(declare-fun arrayNoDuplicates!0 (array!58014 (_ BitVec 32) List!19469) Bool)

(assert (=> b!955559 (= res!639957 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19466))))

(declare-fun mapNonEmpty!33427 () Bool)

(declare-fun mapRes!33427 () Bool)

(declare-fun tp!63999 () Bool)

(declare-fun e!538288 () Bool)

(assert (=> mapNonEmpty!33427 (= mapRes!33427 (and tp!63999 e!538288))))

(declare-datatypes ((V!32953 0))(
  ( (V!32954 (val!10539 Int)) )
))
(declare-datatypes ((ValueCell!10007 0))(
  ( (ValueCellFull!10007 (v!13093 V!32953)) (EmptyCell!10007) )
))
(declare-fun mapValue!33427 () ValueCell!10007)

(declare-fun mapRest!33427 () (Array (_ BitVec 32) ValueCell!10007))

(declare-datatypes ((array!58016 0))(
  ( (array!58017 (arr!27888 (Array (_ BitVec 32) ValueCell!10007)) (size!28369 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58016)

(declare-fun mapKey!33427 () (_ BitVec 32))

(assert (=> mapNonEmpty!33427 (= (arr!27888 _values!1197) (store mapRest!33427 mapKey!33427 mapValue!33427))))

(declare-fun b!955560 () Bool)

(declare-fun res!639960 () Bool)

(assert (=> b!955560 (=> (not res!639960) (not e!538287))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955560 (= res!639960 (and (= (size!28369 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28368 _keys!1441) (size!28369 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955561 () Bool)

(declare-fun e!538286 () Bool)

(declare-fun tp_is_empty!20977 () Bool)

(assert (=> b!955561 (= e!538286 tp_is_empty!20977)))

(declare-fun b!955562 () Bool)

(assert (=> b!955562 (= e!538287 (not (bvsle #b00000000000000000000000000000000 (size!28368 _keys!1441))))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32953)

(declare-fun minValue!1139 () V!32953)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13732 0))(
  ( (tuple2!13733 (_1!6877 (_ BitVec 64)) (_2!6877 V!32953)) )
))
(declare-datatypes ((List!19470 0))(
  ( (Nil!19467) (Cons!19466 (h!20628 tuple2!13732) (t!27822 List!19470)) )
))
(declare-datatypes ((ListLongMap!12419 0))(
  ( (ListLongMap!12420 (toList!6225 List!19470)) )
))
(declare-fun contains!5266 (ListLongMap!12419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3387 (array!58014 array!58016 (_ BitVec 32) (_ BitVec 32) V!32953 V!32953 (_ BitVec 32) Int) ListLongMap!12419)

(assert (=> b!955562 (contains!5266 (getCurrentListMap!3387 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27887 _keys!1441) i!735))))

(declare-datatypes ((Unit!32000 0))(
  ( (Unit!32001) )
))
(declare-fun lt!429807 () Unit!32000)

(declare-fun lemmaInListMapFromThenFromZero!19 (array!58014 array!58016 (_ BitVec 32) (_ BitVec 32) V!32953 V!32953 (_ BitVec 32) (_ BitVec 32) Int) Unit!32000)

(assert (=> b!955562 (= lt!429807 (lemmaInListMapFromThenFromZero!19 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955563 () Bool)

(assert (=> b!955563 (= e!538288 tp_is_empty!20977)))

(declare-fun mapIsEmpty!33427 () Bool)

(assert (=> mapIsEmpty!33427 mapRes!33427))

(declare-fun res!639958 () Bool)

(assert (=> start!81920 (=> (not res!639958) (not e!538287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81920 (= res!639958 (validMask!0 mask!1823))))

(assert (=> start!81920 e!538287))

(assert (=> start!81920 true))

(assert (=> start!81920 tp_is_empty!20977))

(declare-fun array_inv!21705 (array!58014) Bool)

(assert (=> start!81920 (array_inv!21705 _keys!1441)))

(declare-fun e!538289 () Bool)

(declare-fun array_inv!21706 (array!58016) Bool)

(assert (=> start!81920 (and (array_inv!21706 _values!1197) e!538289)))

(assert (=> start!81920 tp!64000))

(declare-fun b!955564 () Bool)

(declare-fun res!639955 () Bool)

(assert (=> b!955564 (=> (not res!639955) (not e!538287))))

(assert (=> b!955564 (= res!639955 (contains!5266 (getCurrentListMap!3387 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27887 _keys!1441) i!735)))))

(declare-fun b!955565 () Bool)

(assert (=> b!955565 (= e!538289 (and e!538286 mapRes!33427))))

(declare-fun condMapEmpty!33427 () Bool)

(declare-fun mapDefault!33427 () ValueCell!10007)

(assert (=> b!955565 (= condMapEmpty!33427 (= (arr!27888 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10007)) mapDefault!33427)))))

(declare-fun b!955566 () Bool)

(declare-fun res!639961 () Bool)

(assert (=> b!955566 (=> (not res!639961) (not e!538287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955566 (= res!639961 (validKeyInArray!0 (select (arr!27887 _keys!1441) i!735)))))

(declare-fun b!955567 () Bool)

(declare-fun res!639956 () Bool)

(assert (=> b!955567 (=> (not res!639956) (not e!538287))))

(assert (=> b!955567 (= res!639956 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28368 _keys!1441))))))

(assert (= (and start!81920 res!639958) b!955560))

(assert (= (and b!955560 res!639960) b!955558))

(assert (= (and b!955558 res!639959) b!955559))

(assert (= (and b!955559 res!639957) b!955567))

(assert (= (and b!955567 res!639956) b!955566))

(assert (= (and b!955566 res!639961) b!955564))

(assert (= (and b!955564 res!639955) b!955562))

(assert (= (and b!955565 condMapEmpty!33427) mapIsEmpty!33427))

(assert (= (and b!955565 (not condMapEmpty!33427)) mapNonEmpty!33427))

(get-info :version)

(assert (= (and mapNonEmpty!33427 ((_ is ValueCellFull!10007) mapValue!33427)) b!955563))

(assert (= (and b!955565 ((_ is ValueCellFull!10007) mapDefault!33427)) b!955561))

(assert (= start!81920 b!955565))

(declare-fun m!886509 () Bool)

(assert (=> b!955558 m!886509))

(declare-fun m!886511 () Bool)

(assert (=> b!955559 m!886511))

(declare-fun m!886513 () Bool)

(assert (=> mapNonEmpty!33427 m!886513))

(declare-fun m!886515 () Bool)

(assert (=> start!81920 m!886515))

(declare-fun m!886517 () Bool)

(assert (=> start!81920 m!886517))

(declare-fun m!886519 () Bool)

(assert (=> start!81920 m!886519))

(declare-fun m!886521 () Bool)

(assert (=> b!955566 m!886521))

(assert (=> b!955566 m!886521))

(declare-fun m!886523 () Bool)

(assert (=> b!955566 m!886523))

(declare-fun m!886525 () Bool)

(assert (=> b!955562 m!886525))

(assert (=> b!955562 m!886521))

(assert (=> b!955562 m!886525))

(assert (=> b!955562 m!886521))

(declare-fun m!886527 () Bool)

(assert (=> b!955562 m!886527))

(declare-fun m!886529 () Bool)

(assert (=> b!955562 m!886529))

(declare-fun m!886531 () Bool)

(assert (=> b!955564 m!886531))

(assert (=> b!955564 m!886521))

(assert (=> b!955564 m!886531))

(assert (=> b!955564 m!886521))

(declare-fun m!886533 () Bool)

(assert (=> b!955564 m!886533))

(check-sat (not start!81920) (not b!955558) (not b!955562) (not b!955566) (not b!955564) b_and!29893 (not b!955559) (not mapNonEmpty!33427) (not b_next!18433) tp_is_empty!20977)
(check-sat b_and!29893 (not b_next!18433))
