; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81992 () Bool)

(assert start!81992)

(declare-fun b_free!18319 () Bool)

(declare-fun b_next!18319 () Bool)

(assert (=> start!81992 (= b_free!18319 (not b_next!18319))))

(declare-fun tp!63658 () Bool)

(declare-fun b_and!29815 () Bool)

(assert (=> start!81992 (= tp!63658 b_and!29815)))

(declare-fun mapNonEmpty!33256 () Bool)

(declare-fun mapRes!33256 () Bool)

(declare-fun tp!63657 () Bool)

(declare-fun e!538163 () Bool)

(assert (=> mapNonEmpty!33256 (= mapRes!33256 (and tp!63657 e!538163))))

(declare-fun mapKey!33256 () (_ BitVec 32))

(declare-datatypes ((V!32801 0))(
  ( (V!32802 (val!10482 Int)) )
))
(declare-datatypes ((ValueCell!9950 0))(
  ( (ValueCellFull!9950 (v!13034 V!32801)) (EmptyCell!9950) )
))
(declare-datatypes ((array!57886 0))(
  ( (array!57887 (arr!27818 (Array (_ BitVec 32) ValueCell!9950)) (size!28298 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57886)

(declare-fun mapRest!33256 () (Array (_ BitVec 32) ValueCell!9950))

(declare-fun mapValue!33256 () ValueCell!9950)

(assert (=> mapNonEmpty!33256 (= (arr!27818 _values!1197) (store mapRest!33256 mapKey!33256 mapValue!33256))))

(declare-fun b!955087 () Bool)

(declare-fun e!538164 () Bool)

(declare-fun e!538162 () Bool)

(assert (=> b!955087 (= e!538164 (and e!538162 mapRes!33256))))

(declare-fun condMapEmpty!33256 () Bool)

(declare-fun mapDefault!33256 () ValueCell!9950)

(assert (=> b!955087 (= condMapEmpty!33256 (= (arr!27818 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9950)) mapDefault!33256)))))

(declare-fun b!955088 () Bool)

(declare-fun res!639314 () Bool)

(declare-fun e!538165 () Bool)

(assert (=> b!955088 (=> (not res!639314) (not e!538165))))

(declare-datatypes ((array!57888 0))(
  ( (array!57889 (arr!27819 (Array (_ BitVec 32) (_ BitVec 64))) (size!28299 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57888)

(declare-datatypes ((List!19373 0))(
  ( (Nil!19370) (Cons!19369 (h!20537 (_ BitVec 64)) (t!27726 List!19373)) )
))
(declare-fun arrayNoDuplicates!0 (array!57888 (_ BitVec 32) List!19373) Bool)

(assert (=> b!955088 (= res!639314 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19370))))

(declare-fun mapIsEmpty!33256 () Bool)

(assert (=> mapIsEmpty!33256 mapRes!33256))

(declare-fun b!955089 () Bool)

(declare-fun res!639309 () Bool)

(assert (=> b!955089 (=> (not res!639309) (not e!538165))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57888 (_ BitVec 32)) Bool)

(assert (=> b!955089 (= res!639309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955090 () Bool)

(declare-fun res!639310 () Bool)

(assert (=> b!955090 (=> (not res!639310) (not e!538165))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955090 (= res!639310 (and (= (size!28298 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28299 _keys!1441) (size!28298 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955091 () Bool)

(declare-fun tp_is_empty!20863 () Bool)

(assert (=> b!955091 (= e!538162 tp_is_empty!20863)))

(declare-fun b!955092 () Bool)

(assert (=> b!955092 (= e!538165 false)))

(declare-fun lt!430233 () Bool)

(declare-fun zeroValue!1139 () V!32801)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32801)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13584 0))(
  ( (tuple2!13585 (_1!6803 (_ BitVec 64)) (_2!6803 V!32801)) )
))
(declare-datatypes ((List!19374 0))(
  ( (Nil!19371) (Cons!19370 (h!20538 tuple2!13584) (t!27727 List!19374)) )
))
(declare-datatypes ((ListLongMap!12283 0))(
  ( (ListLongMap!12284 (toList!6157 List!19374)) )
))
(declare-fun contains!5266 (ListLongMap!12283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3390 (array!57888 array!57886 (_ BitVec 32) (_ BitVec 32) V!32801 V!32801 (_ BitVec 32) Int) ListLongMap!12283)

(assert (=> b!955092 (= lt!430233 (contains!5266 (getCurrentListMap!3390 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27819 _keys!1441) i!735)))))

(declare-fun b!955093 () Bool)

(assert (=> b!955093 (= e!538163 tp_is_empty!20863)))

(declare-fun b!955094 () Bool)

(declare-fun res!639312 () Bool)

(assert (=> b!955094 (=> (not res!639312) (not e!538165))))

(assert (=> b!955094 (= res!639312 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28299 _keys!1441))))))

(declare-fun b!955095 () Bool)

(declare-fun res!639313 () Bool)

(assert (=> b!955095 (=> (not res!639313) (not e!538165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955095 (= res!639313 (validKeyInArray!0 (select (arr!27819 _keys!1441) i!735)))))

(declare-fun res!639311 () Bool)

(assert (=> start!81992 (=> (not res!639311) (not e!538165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81992 (= res!639311 (validMask!0 mask!1823))))

(assert (=> start!81992 e!538165))

(assert (=> start!81992 true))

(assert (=> start!81992 tp_is_empty!20863))

(declare-fun array_inv!21669 (array!57888) Bool)

(assert (=> start!81992 (array_inv!21669 _keys!1441)))

(declare-fun array_inv!21670 (array!57886) Bool)

(assert (=> start!81992 (and (array_inv!21670 _values!1197) e!538164)))

(assert (=> start!81992 tp!63658))

(assert (= (and start!81992 res!639311) b!955090))

(assert (= (and b!955090 res!639310) b!955089))

(assert (= (and b!955089 res!639309) b!955088))

(assert (= (and b!955088 res!639314) b!955094))

(assert (= (and b!955094 res!639312) b!955095))

(assert (= (and b!955095 res!639313) b!955092))

(assert (= (and b!955087 condMapEmpty!33256) mapIsEmpty!33256))

(assert (= (and b!955087 (not condMapEmpty!33256)) mapNonEmpty!33256))

(get-info :version)

(assert (= (and mapNonEmpty!33256 ((_ is ValueCellFull!9950) mapValue!33256)) b!955093))

(assert (= (and b!955087 ((_ is ValueCellFull!9950) mapDefault!33256)) b!955091))

(assert (= start!81992 b!955087))

(declare-fun m!887277 () Bool)

(assert (=> mapNonEmpty!33256 m!887277))

(declare-fun m!887279 () Bool)

(assert (=> b!955092 m!887279))

(declare-fun m!887281 () Bool)

(assert (=> b!955092 m!887281))

(assert (=> b!955092 m!887279))

(assert (=> b!955092 m!887281))

(declare-fun m!887283 () Bool)

(assert (=> b!955092 m!887283))

(declare-fun m!887285 () Bool)

(assert (=> b!955089 m!887285))

(declare-fun m!887287 () Bool)

(assert (=> start!81992 m!887287))

(declare-fun m!887289 () Bool)

(assert (=> start!81992 m!887289))

(declare-fun m!887291 () Bool)

(assert (=> start!81992 m!887291))

(assert (=> b!955095 m!887281))

(assert (=> b!955095 m!887281))

(declare-fun m!887293 () Bool)

(assert (=> b!955095 m!887293))

(declare-fun m!887295 () Bool)

(assert (=> b!955088 m!887295))

(check-sat (not b!955092) (not b!955088) (not b!955089) (not b_next!18319) (not mapNonEmpty!33256) (not start!81992) tp_is_empty!20863 b_and!29815 (not b!955095))
(check-sat b_and!29815 (not b_next!18319))
