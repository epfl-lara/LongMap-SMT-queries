; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82088 () Bool)

(assert start!82088)

(declare-fun b_free!18415 () Bool)

(declare-fun b_next!18415 () Bool)

(assert (=> start!82088 (= b_free!18415 (not b_next!18415))))

(declare-fun tp!63945 () Bool)

(declare-fun b_and!29911 () Bool)

(assert (=> start!82088 (= tp!63945 b_and!29911)))

(declare-fun mapNonEmpty!33400 () Bool)

(declare-fun mapRes!33400 () Bool)

(declare-fun tp!63946 () Bool)

(declare-fun e!538881 () Bool)

(assert (=> mapNonEmpty!33400 (= mapRes!33400 (and tp!63946 e!538881))))

(declare-datatypes ((V!32929 0))(
  ( (V!32930 (val!10530 Int)) )
))
(declare-datatypes ((ValueCell!9998 0))(
  ( (ValueCellFull!9998 (v!13082 V!32929)) (EmptyCell!9998) )
))
(declare-fun mapValue!33400 () ValueCell!9998)

(declare-fun mapKey!33400 () (_ BitVec 32))

(declare-fun mapRest!33400 () (Array (_ BitVec 32) ValueCell!9998))

(declare-datatypes ((array!58070 0))(
  ( (array!58071 (arr!27910 (Array (_ BitVec 32) ValueCell!9998)) (size!28390 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58070)

(assert (=> mapNonEmpty!33400 (= (arr!27910 _values!1197) (store mapRest!33400 mapKey!33400 mapValue!33400))))

(declare-fun b!956430 () Bool)

(declare-fun res!640222 () Bool)

(declare-fun e!538883 () Bool)

(assert (=> b!956430 (=> (not res!640222) (not e!538883))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58072 0))(
  ( (array!58073 (arr!27911 (Array (_ BitVec 32) (_ BitVec 64))) (size!28391 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58072)

(assert (=> b!956430 (= res!640222 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28391 _keys!1441))))))

(declare-fun b!956431 () Bool)

(declare-fun res!640223 () Bool)

(assert (=> b!956431 (=> (not res!640223) (not e!538883))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956431 (= res!640223 (and (= (size!28390 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28391 _keys!1441) (size!28390 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33400 () Bool)

(assert (=> mapIsEmpty!33400 mapRes!33400))

(declare-fun b!956432 () Bool)

(declare-fun e!538882 () Bool)

(declare-fun e!538885 () Bool)

(assert (=> b!956432 (= e!538882 (and e!538885 mapRes!33400))))

(declare-fun condMapEmpty!33400 () Bool)

(declare-fun mapDefault!33400 () ValueCell!9998)

(assert (=> b!956432 (= condMapEmpty!33400 (= (arr!27910 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9998)) mapDefault!33400)))))

(declare-fun b!956433 () Bool)

(declare-fun res!640226 () Bool)

(assert (=> b!956433 (=> (not res!640226) (not e!538883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956433 (= res!640226 (validKeyInArray!0 (select (arr!27911 _keys!1441) i!735)))))

(declare-fun res!640225 () Bool)

(assert (=> start!82088 (=> (not res!640225) (not e!538883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82088 (= res!640225 (validMask!0 mask!1823))))

(assert (=> start!82088 e!538883))

(assert (=> start!82088 true))

(declare-fun tp_is_empty!20959 () Bool)

(assert (=> start!82088 tp_is_empty!20959))

(declare-fun array_inv!21735 (array!58072) Bool)

(assert (=> start!82088 (array_inv!21735 _keys!1441)))

(declare-fun array_inv!21736 (array!58070) Bool)

(assert (=> start!82088 (and (array_inv!21736 _values!1197) e!538882)))

(assert (=> start!82088 tp!63945))

(declare-fun b!956434 () Bool)

(assert (=> b!956434 (= e!538883 (not true))))

(declare-fun zeroValue!1139 () V!32929)

(declare-fun minValue!1139 () V!32929)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13660 0))(
  ( (tuple2!13661 (_1!6841 (_ BitVec 64)) (_2!6841 V!32929)) )
))
(declare-datatypes ((List!19442 0))(
  ( (Nil!19439) (Cons!19438 (h!20606 tuple2!13660) (t!27795 List!19442)) )
))
(declare-datatypes ((ListLongMap!12359 0))(
  ( (ListLongMap!12360 (toList!6195 List!19442)) )
))
(declare-fun contains!5304 (ListLongMap!12359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3428 (array!58072 array!58070 (_ BitVec 32) (_ BitVec 32) V!32929 V!32929 (_ BitVec 32) Int) ListLongMap!12359)

(assert (=> b!956434 (contains!5304 (getCurrentListMap!3428 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27911 _keys!1441) i!735))))

(declare-datatypes ((Unit!32092 0))(
  ( (Unit!32093) )
))
(declare-fun lt!430377 () Unit!32092)

(declare-fun lemmaInListMapFromThenFromZero!11 (array!58072 array!58070 (_ BitVec 32) (_ BitVec 32) V!32929 V!32929 (_ BitVec 32) (_ BitVec 32) Int) Unit!32092)

(assert (=> b!956434 (= lt!430377 (lemmaInListMapFromThenFromZero!11 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956435 () Bool)

(declare-fun res!640220 () Bool)

(assert (=> b!956435 (=> (not res!640220) (not e!538883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58072 (_ BitVec 32)) Bool)

(assert (=> b!956435 (= res!640220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956436 () Bool)

(assert (=> b!956436 (= e!538881 tp_is_empty!20959)))

(declare-fun b!956437 () Bool)

(declare-fun res!640221 () Bool)

(assert (=> b!956437 (=> (not res!640221) (not e!538883))))

(declare-datatypes ((List!19443 0))(
  ( (Nil!19440) (Cons!19439 (h!20607 (_ BitVec 64)) (t!27796 List!19443)) )
))
(declare-fun arrayNoDuplicates!0 (array!58072 (_ BitVec 32) List!19443) Bool)

(assert (=> b!956437 (= res!640221 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19440))))

(declare-fun b!956438 () Bool)

(assert (=> b!956438 (= e!538885 tp_is_empty!20959)))

(declare-fun b!956439 () Bool)

(declare-fun res!640224 () Bool)

(assert (=> b!956439 (=> (not res!640224) (not e!538883))))

(assert (=> b!956439 (= res!640224 (contains!5304 (getCurrentListMap!3428 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27911 _keys!1441) i!735)))))

(assert (= (and start!82088 res!640225) b!956431))

(assert (= (and b!956431 res!640223) b!956435))

(assert (= (and b!956435 res!640220) b!956437))

(assert (= (and b!956437 res!640221) b!956430))

(assert (= (and b!956430 res!640222) b!956433))

(assert (= (and b!956433 res!640226) b!956439))

(assert (= (and b!956439 res!640224) b!956434))

(assert (= (and b!956432 condMapEmpty!33400) mapIsEmpty!33400))

(assert (= (and b!956432 (not condMapEmpty!33400)) mapNonEmpty!33400))

(get-info :version)

(assert (= (and mapNonEmpty!33400 ((_ is ValueCellFull!9998) mapValue!33400)) b!956436))

(assert (= (and b!956432 ((_ is ValueCellFull!9998) mapDefault!33400)) b!956438))

(assert (= start!82088 b!956432))

(declare-fun m!888327 () Bool)

(assert (=> start!82088 m!888327))

(declare-fun m!888329 () Bool)

(assert (=> start!82088 m!888329))

(declare-fun m!888331 () Bool)

(assert (=> start!82088 m!888331))

(declare-fun m!888333 () Bool)

(assert (=> mapNonEmpty!33400 m!888333))

(declare-fun m!888335 () Bool)

(assert (=> b!956433 m!888335))

(assert (=> b!956433 m!888335))

(declare-fun m!888337 () Bool)

(assert (=> b!956433 m!888337))

(declare-fun m!888339 () Bool)

(assert (=> b!956434 m!888339))

(assert (=> b!956434 m!888335))

(assert (=> b!956434 m!888339))

(assert (=> b!956434 m!888335))

(declare-fun m!888341 () Bool)

(assert (=> b!956434 m!888341))

(declare-fun m!888343 () Bool)

(assert (=> b!956434 m!888343))

(declare-fun m!888345 () Bool)

(assert (=> b!956437 m!888345))

(declare-fun m!888347 () Bool)

(assert (=> b!956439 m!888347))

(assert (=> b!956439 m!888335))

(assert (=> b!956439 m!888347))

(assert (=> b!956439 m!888335))

(declare-fun m!888349 () Bool)

(assert (=> b!956439 m!888349))

(declare-fun m!888351 () Bool)

(assert (=> b!956435 m!888351))

(check-sat (not b!956434) (not b!956433) tp_is_empty!20959 b_and!29911 (not b!956437) (not b!956435) (not start!82088) (not b!956439) (not mapNonEmpty!33400) (not b_next!18415))
(check-sat b_and!29911 (not b_next!18415))
