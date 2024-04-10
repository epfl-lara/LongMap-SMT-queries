; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81832 () Bool)

(assert start!81832)

(declare-fun b_free!18327 () Bool)

(declare-fun b_next!18327 () Bool)

(assert (=> start!81832 (= b_free!18327 (not b_next!18327))))

(declare-fun tp!63681 () Bool)

(declare-fun b_and!29813 () Bool)

(assert (=> start!81832 (= tp!63681 b_and!29813)))

(declare-fun b!954292 () Bool)

(declare-fun res!639037 () Bool)

(declare-fun e!537641 () Bool)

(assert (=> b!954292 (=> (not res!639037) (not e!537641))))

(declare-datatypes ((array!57855 0))(
  ( (array!57856 (arr!27807 (Array (_ BitVec 32) (_ BitVec 64))) (size!28286 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57855)

(declare-datatypes ((List!19390 0))(
  ( (Nil!19387) (Cons!19386 (h!20548 (_ BitVec 64)) (t!27751 List!19390)) )
))
(declare-fun arrayNoDuplicates!0 (array!57855 (_ BitVec 32) List!19390) Bool)

(assert (=> b!954292 (= res!639037 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19387))))

(declare-fun mapIsEmpty!33268 () Bool)

(declare-fun mapRes!33268 () Bool)

(assert (=> mapIsEmpty!33268 mapRes!33268))

(declare-fun b!954293 () Bool)

(declare-fun res!639042 () Bool)

(assert (=> b!954293 (=> (not res!639042) (not e!537641))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954293 (= res!639042 (validKeyInArray!0 (select (arr!27807 _keys!1441) i!735)))))

(declare-fun b!954294 () Bool)

(declare-fun res!639039 () Bool)

(assert (=> b!954294 (=> (not res!639039) (not e!537641))))

(assert (=> b!954294 (= res!639039 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28286 _keys!1441))))))

(declare-fun b!954295 () Bool)

(declare-fun res!639041 () Bool)

(assert (=> b!954295 (=> (not res!639041) (not e!537641))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((V!32811 0))(
  ( (V!32812 (val!10486 Int)) )
))
(declare-datatypes ((ValueCell!9954 0))(
  ( (ValueCellFull!9954 (v!13041 V!32811)) (EmptyCell!9954) )
))
(declare-datatypes ((array!57857 0))(
  ( (array!57858 (arr!27808 (Array (_ BitVec 32) ValueCell!9954)) (size!28287 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57857)

(assert (=> b!954295 (= res!639041 (and (= (size!28287 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28286 _keys!1441) (size!28287 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954296 () Bool)

(declare-fun e!537643 () Bool)

(declare-fun e!537640 () Bool)

(assert (=> b!954296 (= e!537643 (and e!537640 mapRes!33268))))

(declare-fun condMapEmpty!33268 () Bool)

(declare-fun mapDefault!33268 () ValueCell!9954)

(assert (=> b!954296 (= condMapEmpty!33268 (= (arr!27808 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9954)) mapDefault!33268)))))

(declare-fun b!954297 () Bool)

(declare-fun e!537642 () Bool)

(declare-fun tp_is_empty!20871 () Bool)

(assert (=> b!954297 (= e!537642 tp_is_empty!20871)))

(declare-fun b!954298 () Bool)

(assert (=> b!954298 (= e!537641 false)))

(declare-fun lt!429884 () Bool)

(declare-fun zeroValue!1139 () V!32811)

(declare-fun minValue!1139 () V!32811)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13612 0))(
  ( (tuple2!13613 (_1!6817 (_ BitVec 64)) (_2!6817 V!32811)) )
))
(declare-datatypes ((List!19391 0))(
  ( (Nil!19388) (Cons!19387 (h!20549 tuple2!13612) (t!27752 List!19391)) )
))
(declare-datatypes ((ListLongMap!12309 0))(
  ( (ListLongMap!12310 (toList!6170 List!19391)) )
))
(declare-fun contains!5268 (ListLongMap!12309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3403 (array!57855 array!57857 (_ BitVec 32) (_ BitVec 32) V!32811 V!32811 (_ BitVec 32) Int) ListLongMap!12309)

(assert (=> b!954298 (= lt!429884 (contains!5268 (getCurrentListMap!3403 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27807 _keys!1441) i!735)))))

(declare-fun b!954299 () Bool)

(declare-fun res!639040 () Bool)

(assert (=> b!954299 (=> (not res!639040) (not e!537641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57855 (_ BitVec 32)) Bool)

(assert (=> b!954299 (= res!639040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954300 () Bool)

(assert (=> b!954300 (= e!537640 tp_is_empty!20871)))

(declare-fun res!639038 () Bool)

(assert (=> start!81832 (=> (not res!639038) (not e!537641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81832 (= res!639038 (validMask!0 mask!1823))))

(assert (=> start!81832 e!537641))

(assert (=> start!81832 true))

(assert (=> start!81832 tp_is_empty!20871))

(declare-fun array_inv!21587 (array!57855) Bool)

(assert (=> start!81832 (array_inv!21587 _keys!1441)))

(declare-fun array_inv!21588 (array!57857) Bool)

(assert (=> start!81832 (and (array_inv!21588 _values!1197) e!537643)))

(assert (=> start!81832 tp!63681))

(declare-fun mapNonEmpty!33268 () Bool)

(declare-fun tp!63680 () Bool)

(assert (=> mapNonEmpty!33268 (= mapRes!33268 (and tp!63680 e!537642))))

(declare-fun mapRest!33268 () (Array (_ BitVec 32) ValueCell!9954))

(declare-fun mapKey!33268 () (_ BitVec 32))

(declare-fun mapValue!33268 () ValueCell!9954)

(assert (=> mapNonEmpty!33268 (= (arr!27808 _values!1197) (store mapRest!33268 mapKey!33268 mapValue!33268))))

(assert (= (and start!81832 res!639038) b!954295))

(assert (= (and b!954295 res!639041) b!954299))

(assert (= (and b!954299 res!639040) b!954292))

(assert (= (and b!954292 res!639037) b!954294))

(assert (= (and b!954294 res!639039) b!954293))

(assert (= (and b!954293 res!639042) b!954298))

(assert (= (and b!954296 condMapEmpty!33268) mapIsEmpty!33268))

(assert (= (and b!954296 (not condMapEmpty!33268)) mapNonEmpty!33268))

(get-info :version)

(assert (= (and mapNonEmpty!33268 ((_ is ValueCellFull!9954) mapValue!33268)) b!954297))

(assert (= (and b!954296 ((_ is ValueCellFull!9954) mapDefault!33268)) b!954300))

(assert (= start!81832 b!954296))

(declare-fun m!886063 () Bool)

(assert (=> b!954292 m!886063))

(declare-fun m!886065 () Bool)

(assert (=> mapNonEmpty!33268 m!886065))

(declare-fun m!886067 () Bool)

(assert (=> b!954298 m!886067))

(declare-fun m!886069 () Bool)

(assert (=> b!954298 m!886069))

(assert (=> b!954298 m!886067))

(assert (=> b!954298 m!886069))

(declare-fun m!886071 () Bool)

(assert (=> b!954298 m!886071))

(assert (=> b!954293 m!886069))

(assert (=> b!954293 m!886069))

(declare-fun m!886073 () Bool)

(assert (=> b!954293 m!886073))

(declare-fun m!886075 () Bool)

(assert (=> start!81832 m!886075))

(declare-fun m!886077 () Bool)

(assert (=> start!81832 m!886077))

(declare-fun m!886079 () Bool)

(assert (=> start!81832 m!886079))

(declare-fun m!886081 () Bool)

(assert (=> b!954299 m!886081))

(check-sat (not start!81832) (not mapNonEmpty!33268) (not b_next!18327) (not b!954299) (not b!954298) (not b!954293) tp_is_empty!20871 b_and!29813 (not b!954292))
(check-sat b_and!29813 (not b_next!18327))
