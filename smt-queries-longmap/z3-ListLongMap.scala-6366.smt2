; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81914 () Bool)

(assert start!81914)

(declare-fun b_free!18427 () Bool)

(declare-fun b_next!18427 () Bool)

(assert (=> start!81914 (= b_free!18427 (not b_next!18427))))

(declare-fun tp!63982 () Bool)

(declare-fun b_and!29887 () Bool)

(assert (=> start!81914 (= tp!63982 b_and!29887)))

(declare-fun b!955468 () Bool)

(declare-fun res!639896 () Bool)

(declare-fun e!538242 () Bool)

(assert (=> b!955468 (=> (not res!639896) (not e!538242))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58002 0))(
  ( (array!58003 (arr!27881 (Array (_ BitVec 32) (_ BitVec 64))) (size!28362 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58002)

(assert (=> b!955468 (= res!639896 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28362 _keys!1441))))))

(declare-fun b!955469 () Bool)

(declare-fun res!639894 () Bool)

(assert (=> b!955469 (=> (not res!639894) (not e!538242))))

(declare-datatypes ((List!19463 0))(
  ( (Nil!19460) (Cons!19459 (h!20621 (_ BitVec 64)) (t!27815 List!19463)) )
))
(declare-fun arrayNoDuplicates!0 (array!58002 (_ BitVec 32) List!19463) Bool)

(assert (=> b!955469 (= res!639894 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19460))))

(declare-fun b!955470 () Bool)

(declare-fun e!538243 () Bool)

(declare-fun tp_is_empty!20971 () Bool)

(assert (=> b!955470 (= e!538243 tp_is_empty!20971)))

(declare-fun b!955471 () Bool)

(declare-fun res!639893 () Bool)

(assert (=> b!955471 (=> (not res!639893) (not e!538242))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58002 (_ BitVec 32)) Bool)

(assert (=> b!955471 (= res!639893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33418 () Bool)

(declare-fun mapRes!33418 () Bool)

(assert (=> mapIsEmpty!33418 mapRes!33418))

(declare-fun res!639898 () Bool)

(assert (=> start!81914 (=> (not res!639898) (not e!538242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81914 (= res!639898 (validMask!0 mask!1823))))

(assert (=> start!81914 e!538242))

(assert (=> start!81914 true))

(assert (=> start!81914 tp_is_empty!20971))

(declare-fun array_inv!21699 (array!58002) Bool)

(assert (=> start!81914 (array_inv!21699 _keys!1441)))

(declare-datatypes ((V!32945 0))(
  ( (V!32946 (val!10536 Int)) )
))
(declare-datatypes ((ValueCell!10004 0))(
  ( (ValueCellFull!10004 (v!13090 V!32945)) (EmptyCell!10004) )
))
(declare-datatypes ((array!58004 0))(
  ( (array!58005 (arr!27882 (Array (_ BitVec 32) ValueCell!10004)) (size!28363 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58004)

(declare-fun e!538241 () Bool)

(declare-fun array_inv!21700 (array!58004) Bool)

(assert (=> start!81914 (and (array_inv!21700 _values!1197) e!538241)))

(assert (=> start!81914 tp!63982))

(declare-fun b!955472 () Bool)

(declare-fun e!538244 () Bool)

(assert (=> b!955472 (= e!538241 (and e!538244 mapRes!33418))))

(declare-fun condMapEmpty!33418 () Bool)

(declare-fun mapDefault!33418 () ValueCell!10004)

(assert (=> b!955472 (= condMapEmpty!33418 (= (arr!27882 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10004)) mapDefault!33418)))))

(declare-fun b!955473 () Bool)

(declare-fun res!639897 () Bool)

(assert (=> b!955473 (=> (not res!639897) (not e!538242))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955473 (= res!639897 (and (= (size!28363 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28362 _keys!1441) (size!28363 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33418 () Bool)

(declare-fun tp!63981 () Bool)

(assert (=> mapNonEmpty!33418 (= mapRes!33418 (and tp!63981 e!538243))))

(declare-fun mapKey!33418 () (_ BitVec 32))

(declare-fun mapValue!33418 () ValueCell!10004)

(declare-fun mapRest!33418 () (Array (_ BitVec 32) ValueCell!10004))

(assert (=> mapNonEmpty!33418 (= (arr!27882 _values!1197) (store mapRest!33418 mapKey!33418 mapValue!33418))))

(declare-fun b!955474 () Bool)

(declare-fun res!639895 () Bool)

(assert (=> b!955474 (=> (not res!639895) (not e!538242))))

(declare-fun zeroValue!1139 () V!32945)

(declare-fun minValue!1139 () V!32945)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13726 0))(
  ( (tuple2!13727 (_1!6874 (_ BitVec 64)) (_2!6874 V!32945)) )
))
(declare-datatypes ((List!19464 0))(
  ( (Nil!19461) (Cons!19460 (h!20622 tuple2!13726) (t!27816 List!19464)) )
))
(declare-datatypes ((ListLongMap!12413 0))(
  ( (ListLongMap!12414 (toList!6222 List!19464)) )
))
(declare-fun contains!5263 (ListLongMap!12413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3384 (array!58002 array!58004 (_ BitVec 32) (_ BitVec 32) V!32945 V!32945 (_ BitVec 32) Int) ListLongMap!12413)

(assert (=> b!955474 (= res!639895 (contains!5263 (getCurrentListMap!3384 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27881 _keys!1441) i!735)))))

(declare-fun b!955475 () Bool)

(declare-fun res!639892 () Bool)

(assert (=> b!955475 (=> (not res!639892) (not e!538242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955475 (= res!639892 (validKeyInArray!0 (select (arr!27881 _keys!1441) i!735)))))

(declare-fun b!955476 () Bool)

(assert (=> b!955476 (= e!538244 tp_is_empty!20971)))

(declare-fun b!955477 () Bool)

(assert (=> b!955477 (= e!538242 (not true))))

(assert (=> b!955477 (contains!5263 (getCurrentListMap!3384 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27881 _keys!1441) i!735))))

(declare-datatypes ((Unit!31994 0))(
  ( (Unit!31995) )
))
(declare-fun lt!429798 () Unit!31994)

(declare-fun lemmaInListMapFromThenFromZero!16 (array!58002 array!58004 (_ BitVec 32) (_ BitVec 32) V!32945 V!32945 (_ BitVec 32) (_ BitVec 32) Int) Unit!31994)

(assert (=> b!955477 (= lt!429798 (lemmaInListMapFromThenFromZero!16 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(assert (= (and start!81914 res!639898) b!955473))

(assert (= (and b!955473 res!639897) b!955471))

(assert (= (and b!955471 res!639893) b!955469))

(assert (= (and b!955469 res!639894) b!955468))

(assert (= (and b!955468 res!639896) b!955475))

(assert (= (and b!955475 res!639892) b!955474))

(assert (= (and b!955474 res!639895) b!955477))

(assert (= (and b!955472 condMapEmpty!33418) mapIsEmpty!33418))

(assert (= (and b!955472 (not condMapEmpty!33418)) mapNonEmpty!33418))

(get-info :version)

(assert (= (and mapNonEmpty!33418 ((_ is ValueCellFull!10004) mapValue!33418)) b!955470))

(assert (= (and b!955472 ((_ is ValueCellFull!10004) mapDefault!33418)) b!955476))

(assert (= start!81914 b!955472))

(declare-fun m!886431 () Bool)

(assert (=> b!955471 m!886431))

(declare-fun m!886433 () Bool)

(assert (=> b!955475 m!886433))

(assert (=> b!955475 m!886433))

(declare-fun m!886435 () Bool)

(assert (=> b!955475 m!886435))

(declare-fun m!886437 () Bool)

(assert (=> b!955477 m!886437))

(assert (=> b!955477 m!886433))

(assert (=> b!955477 m!886437))

(assert (=> b!955477 m!886433))

(declare-fun m!886439 () Bool)

(assert (=> b!955477 m!886439))

(declare-fun m!886441 () Bool)

(assert (=> b!955477 m!886441))

(declare-fun m!886443 () Bool)

(assert (=> b!955474 m!886443))

(assert (=> b!955474 m!886433))

(assert (=> b!955474 m!886443))

(assert (=> b!955474 m!886433))

(declare-fun m!886445 () Bool)

(assert (=> b!955474 m!886445))

(declare-fun m!886447 () Bool)

(assert (=> mapNonEmpty!33418 m!886447))

(declare-fun m!886449 () Bool)

(assert (=> start!81914 m!886449))

(declare-fun m!886451 () Bool)

(assert (=> start!81914 m!886451))

(declare-fun m!886453 () Bool)

(assert (=> start!81914 m!886453))

(declare-fun m!886455 () Bool)

(assert (=> b!955469 m!886455))

(check-sat (not b!955474) (not b!955469) (not b!955475) b_and!29887 (not b!955471) (not start!81914) (not b_next!18427) tp_is_empty!20971 (not mapNonEmpty!33418) (not b!955477))
(check-sat b_and!29887 (not b_next!18427))
