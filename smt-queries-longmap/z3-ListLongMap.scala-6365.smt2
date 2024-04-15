; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81908 () Bool)

(assert start!81908)

(declare-fun b_free!18421 () Bool)

(declare-fun b_next!18421 () Bool)

(assert (=> start!81908 (= b_free!18421 (not b_next!18421))))

(declare-fun tp!63963 () Bool)

(declare-fun b_and!29881 () Bool)

(assert (=> start!81908 (= tp!63963 b_and!29881)))

(declare-fun b!955378 () Bool)

(declare-fun res!639830 () Bool)

(declare-fun e!538199 () Bool)

(assert (=> b!955378 (=> (not res!639830) (not e!538199))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32937 0))(
  ( (V!32938 (val!10533 Int)) )
))
(declare-datatypes ((ValueCell!10001 0))(
  ( (ValueCellFull!10001 (v!13087 V!32937)) (EmptyCell!10001) )
))
(declare-datatypes ((array!57990 0))(
  ( (array!57991 (arr!27875 (Array (_ BitVec 32) ValueCell!10001)) (size!28356 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57990)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((array!57992 0))(
  ( (array!57993 (arr!27876 (Array (_ BitVec 32) (_ BitVec 64))) (size!28357 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57992)

(assert (=> b!955378 (= res!639830 (and (= (size!28356 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28357 _keys!1441) (size!28356 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955379 () Bool)

(declare-fun e!538198 () Bool)

(declare-fun tp_is_empty!20965 () Bool)

(assert (=> b!955379 (= e!538198 tp_is_empty!20965)))

(declare-fun b!955380 () Bool)

(declare-fun res!639835 () Bool)

(assert (=> b!955380 (=> (not res!639835) (not e!538199))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955380 (= res!639835 (validKeyInArray!0 (select (arr!27876 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33409 () Bool)

(declare-fun mapRes!33409 () Bool)

(declare-fun tp!63964 () Bool)

(declare-fun e!538196 () Bool)

(assert (=> mapNonEmpty!33409 (= mapRes!33409 (and tp!63964 e!538196))))

(declare-fun mapRest!33409 () (Array (_ BitVec 32) ValueCell!10001))

(declare-fun mapValue!33409 () ValueCell!10001)

(declare-fun mapKey!33409 () (_ BitVec 32))

(assert (=> mapNonEmpty!33409 (= (arr!27875 _values!1197) (store mapRest!33409 mapKey!33409 mapValue!33409))))

(declare-fun b!955381 () Bool)

(assert (=> b!955381 (= e!538199 (not true))))

(declare-fun zeroValue!1139 () V!32937)

(declare-fun minValue!1139 () V!32937)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13720 0))(
  ( (tuple2!13721 (_1!6871 (_ BitVec 64)) (_2!6871 V!32937)) )
))
(declare-datatypes ((List!19458 0))(
  ( (Nil!19455) (Cons!19454 (h!20616 tuple2!13720) (t!27810 List!19458)) )
))
(declare-datatypes ((ListLongMap!12407 0))(
  ( (ListLongMap!12408 (toList!6219 List!19458)) )
))
(declare-fun contains!5260 (ListLongMap!12407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3381 (array!57992 array!57990 (_ BitVec 32) (_ BitVec 32) V!32937 V!32937 (_ BitVec 32) Int) ListLongMap!12407)

(assert (=> b!955381 (contains!5260 (getCurrentListMap!3381 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27876 _keys!1441) i!735))))

(declare-datatypes ((Unit!31988 0))(
  ( (Unit!31989) )
))
(declare-fun lt!429789 () Unit!31988)

(declare-fun lemmaInListMapFromThenFromZero!13 (array!57992 array!57990 (_ BitVec 32) (_ BitVec 32) V!32937 V!32937 (_ BitVec 32) (_ BitVec 32) Int) Unit!31988)

(assert (=> b!955381 (= lt!429789 (lemmaInListMapFromThenFromZero!13 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955382 () Bool)

(declare-fun res!639829 () Bool)

(assert (=> b!955382 (=> (not res!639829) (not e!538199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57992 (_ BitVec 32)) Bool)

(assert (=> b!955382 (= res!639829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33409 () Bool)

(assert (=> mapIsEmpty!33409 mapRes!33409))

(declare-fun b!955383 () Bool)

(declare-fun res!639831 () Bool)

(assert (=> b!955383 (=> (not res!639831) (not e!538199))))

(assert (=> b!955383 (= res!639831 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28357 _keys!1441))))))

(declare-fun res!639833 () Bool)

(assert (=> start!81908 (=> (not res!639833) (not e!538199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81908 (= res!639833 (validMask!0 mask!1823))))

(assert (=> start!81908 e!538199))

(assert (=> start!81908 true))

(assert (=> start!81908 tp_is_empty!20965))

(declare-fun array_inv!21697 (array!57992) Bool)

(assert (=> start!81908 (array_inv!21697 _keys!1441)))

(declare-fun e!538197 () Bool)

(declare-fun array_inv!21698 (array!57990) Bool)

(assert (=> start!81908 (and (array_inv!21698 _values!1197) e!538197)))

(assert (=> start!81908 tp!63963))

(declare-fun b!955384 () Bool)

(assert (=> b!955384 (= e!538197 (and e!538198 mapRes!33409))))

(declare-fun condMapEmpty!33409 () Bool)

(declare-fun mapDefault!33409 () ValueCell!10001)

(assert (=> b!955384 (= condMapEmpty!33409 (= (arr!27875 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10001)) mapDefault!33409)))))

(declare-fun b!955385 () Bool)

(declare-fun res!639834 () Bool)

(assert (=> b!955385 (=> (not res!639834) (not e!538199))))

(assert (=> b!955385 (= res!639834 (contains!5260 (getCurrentListMap!3381 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27876 _keys!1441) i!735)))))

(declare-fun b!955386 () Bool)

(assert (=> b!955386 (= e!538196 tp_is_empty!20965)))

(declare-fun b!955387 () Bool)

(declare-fun res!639832 () Bool)

(assert (=> b!955387 (=> (not res!639832) (not e!538199))))

(declare-datatypes ((List!19459 0))(
  ( (Nil!19456) (Cons!19455 (h!20617 (_ BitVec 64)) (t!27811 List!19459)) )
))
(declare-fun arrayNoDuplicates!0 (array!57992 (_ BitVec 32) List!19459) Bool)

(assert (=> b!955387 (= res!639832 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19456))))

(assert (= (and start!81908 res!639833) b!955378))

(assert (= (and b!955378 res!639830) b!955382))

(assert (= (and b!955382 res!639829) b!955387))

(assert (= (and b!955387 res!639832) b!955383))

(assert (= (and b!955383 res!639831) b!955380))

(assert (= (and b!955380 res!639835) b!955385))

(assert (= (and b!955385 res!639834) b!955381))

(assert (= (and b!955384 condMapEmpty!33409) mapIsEmpty!33409))

(assert (= (and b!955384 (not condMapEmpty!33409)) mapNonEmpty!33409))

(get-info :version)

(assert (= (and mapNonEmpty!33409 ((_ is ValueCellFull!10001) mapValue!33409)) b!955386))

(assert (= (and b!955384 ((_ is ValueCellFull!10001) mapDefault!33409)) b!955379))

(assert (= start!81908 b!955384))

(declare-fun m!886353 () Bool)

(assert (=> b!955382 m!886353))

(declare-fun m!886355 () Bool)

(assert (=> mapNonEmpty!33409 m!886355))

(declare-fun m!886357 () Bool)

(assert (=> b!955381 m!886357))

(declare-fun m!886359 () Bool)

(assert (=> b!955381 m!886359))

(assert (=> b!955381 m!886357))

(assert (=> b!955381 m!886359))

(declare-fun m!886361 () Bool)

(assert (=> b!955381 m!886361))

(declare-fun m!886363 () Bool)

(assert (=> b!955381 m!886363))

(assert (=> b!955380 m!886359))

(assert (=> b!955380 m!886359))

(declare-fun m!886365 () Bool)

(assert (=> b!955380 m!886365))

(declare-fun m!886367 () Bool)

(assert (=> b!955385 m!886367))

(assert (=> b!955385 m!886359))

(assert (=> b!955385 m!886367))

(assert (=> b!955385 m!886359))

(declare-fun m!886369 () Bool)

(assert (=> b!955385 m!886369))

(declare-fun m!886371 () Bool)

(assert (=> b!955387 m!886371))

(declare-fun m!886373 () Bool)

(assert (=> start!81908 m!886373))

(declare-fun m!886375 () Bool)

(assert (=> start!81908 m!886375))

(declare-fun m!886377 () Bool)

(assert (=> start!81908 m!886377))

(check-sat (not b!955382) (not mapNonEmpty!33409) (not b_next!18421) tp_is_empty!20965 (not start!81908) b_and!29881 (not b!955381) (not b!955387) (not b!955385) (not b!955380))
(check-sat b_and!29881 (not b_next!18421))
