; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81916 () Bool)

(assert start!81916)

(declare-fun b_free!18411 () Bool)

(declare-fun b_next!18411 () Bool)

(assert (=> start!81916 (= b_free!18411 (not b_next!18411))))

(declare-fun tp!63932 () Bool)

(declare-fun b_and!29897 () Bool)

(assert (=> start!81916 (= tp!63932 b_and!29897)))

(declare-fun b!955467 () Bool)

(declare-fun res!639835 () Bool)

(declare-fun e!538270 () Bool)

(assert (=> b!955467 (=> (not res!639835) (not e!538270))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58015 0))(
  ( (array!58016 (arr!27887 (Array (_ BitVec 32) (_ BitVec 64))) (size!28366 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58015)

(assert (=> b!955467 (= res!639835 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28366 _keys!1441))))))

(declare-fun b!955468 () Bool)

(declare-fun res!639840 () Bool)

(assert (=> b!955468 (=> (not res!639840) (not e!538270))))

(declare-datatypes ((List!19436 0))(
  ( (Nil!19433) (Cons!19432 (h!20594 (_ BitVec 64)) (t!27797 List!19436)) )
))
(declare-fun arrayNoDuplicates!0 (array!58015 (_ BitVec 32) List!19436) Bool)

(assert (=> b!955468 (= res!639840 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19433))))

(declare-fun b!955469 () Bool)

(declare-fun e!538273 () Bool)

(declare-fun tp_is_empty!20955 () Bool)

(assert (=> b!955469 (= e!538273 tp_is_empty!20955)))

(declare-fun b!955470 () Bool)

(declare-fun res!639838 () Bool)

(assert (=> b!955470 (=> (not res!639838) (not e!538270))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58015 (_ BitVec 32)) Bool)

(assert (=> b!955470 (= res!639838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955471 () Bool)

(declare-fun res!639834 () Bool)

(assert (=> b!955471 (=> (not res!639834) (not e!538270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955471 (= res!639834 (validKeyInArray!0 (select (arr!27887 _keys!1441) i!735)))))

(declare-fun b!955472 () Bool)

(declare-fun res!639836 () Bool)

(assert (=> b!955472 (=> (not res!639836) (not e!538270))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32923 0))(
  ( (V!32924 (val!10528 Int)) )
))
(declare-datatypes ((ValueCell!9996 0))(
  ( (ValueCellFull!9996 (v!13083 V!32923)) (EmptyCell!9996) )
))
(declare-datatypes ((array!58017 0))(
  ( (array!58018 (arr!27888 (Array (_ BitVec 32) ValueCell!9996)) (size!28367 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58017)

(assert (=> b!955472 (= res!639836 (and (= (size!28367 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28366 _keys!1441) (size!28367 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955473 () Bool)

(declare-fun res!639837 () Bool)

(assert (=> b!955473 (=> (not res!639837) (not e!538270))))

(declare-fun zeroValue!1139 () V!32923)

(declare-fun minValue!1139 () V!32923)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13662 0))(
  ( (tuple2!13663 (_1!6842 (_ BitVec 64)) (_2!6842 V!32923)) )
))
(declare-datatypes ((List!19437 0))(
  ( (Nil!19434) (Cons!19433 (h!20595 tuple2!13662) (t!27798 List!19437)) )
))
(declare-datatypes ((ListLongMap!12359 0))(
  ( (ListLongMap!12360 (toList!6195 List!19437)) )
))
(declare-fun contains!5293 (ListLongMap!12359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3428 (array!58015 array!58017 (_ BitVec 32) (_ BitVec 32) V!32923 V!32923 (_ BitVec 32) Int) ListLongMap!12359)

(assert (=> b!955473 (= res!639837 (contains!5293 (getCurrentListMap!3428 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27887 _keys!1441) i!735)))))

(declare-fun res!639839 () Bool)

(assert (=> start!81916 (=> (not res!639839) (not e!538270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81916 (= res!639839 (validMask!0 mask!1823))))

(assert (=> start!81916 e!538270))

(assert (=> start!81916 true))

(assert (=> start!81916 tp_is_empty!20955))

(declare-fun array_inv!21643 (array!58015) Bool)

(assert (=> start!81916 (array_inv!21643 _keys!1441)))

(declare-fun e!538269 () Bool)

(declare-fun array_inv!21644 (array!58017) Bool)

(assert (=> start!81916 (and (array_inv!21644 _values!1197) e!538269)))

(assert (=> start!81916 tp!63932))

(declare-fun b!955474 () Bool)

(assert (=> b!955474 (= e!538270 (not true))))

(assert (=> b!955474 (contains!5293 (getCurrentListMap!3428 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27887 _keys!1441) i!735))))

(declare-datatypes ((Unit!32111 0))(
  ( (Unit!32112) )
))
(declare-fun lt!430010 () Unit!32111)

(declare-fun lemmaInListMapFromThenFromZero!10 (array!58015 array!58017 (_ BitVec 32) (_ BitVec 32) V!32923 V!32923 (_ BitVec 32) (_ BitVec 32) Int) Unit!32111)

(assert (=> b!955474 (= lt!430010 (lemmaInListMapFromThenFromZero!10 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955475 () Bool)

(declare-fun e!538272 () Bool)

(assert (=> b!955475 (= e!538272 tp_is_empty!20955)))

(declare-fun b!955476 () Bool)

(declare-fun mapRes!33394 () Bool)

(assert (=> b!955476 (= e!538269 (and e!538273 mapRes!33394))))

(declare-fun condMapEmpty!33394 () Bool)

(declare-fun mapDefault!33394 () ValueCell!9996)

(assert (=> b!955476 (= condMapEmpty!33394 (= (arr!27888 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9996)) mapDefault!33394)))))

(declare-fun mapIsEmpty!33394 () Bool)

(assert (=> mapIsEmpty!33394 mapRes!33394))

(declare-fun mapNonEmpty!33394 () Bool)

(declare-fun tp!63933 () Bool)

(assert (=> mapNonEmpty!33394 (= mapRes!33394 (and tp!63933 e!538272))))

(declare-fun mapValue!33394 () ValueCell!9996)

(declare-fun mapKey!33394 () (_ BitVec 32))

(declare-fun mapRest!33394 () (Array (_ BitVec 32) ValueCell!9996))

(assert (=> mapNonEmpty!33394 (= (arr!27888 _values!1197) (store mapRest!33394 mapKey!33394 mapValue!33394))))

(assert (= (and start!81916 res!639839) b!955472))

(assert (= (and b!955472 res!639836) b!955470))

(assert (= (and b!955470 res!639838) b!955468))

(assert (= (and b!955468 res!639840) b!955467))

(assert (= (and b!955467 res!639835) b!955471))

(assert (= (and b!955471 res!639834) b!955473))

(assert (= (and b!955473 res!639837) b!955474))

(assert (= (and b!955476 condMapEmpty!33394) mapIsEmpty!33394))

(assert (= (and b!955476 (not condMapEmpty!33394)) mapNonEmpty!33394))

(get-info :version)

(assert (= (and mapNonEmpty!33394 ((_ is ValueCellFull!9996) mapValue!33394)) b!955475))

(assert (= (and b!955476 ((_ is ValueCellFull!9996) mapDefault!33394)) b!955469))

(assert (= start!81916 b!955476))

(declare-fun m!886981 () Bool)

(assert (=> b!955474 m!886981))

(declare-fun m!886983 () Bool)

(assert (=> b!955474 m!886983))

(assert (=> b!955474 m!886981))

(assert (=> b!955474 m!886983))

(declare-fun m!886985 () Bool)

(assert (=> b!955474 m!886985))

(declare-fun m!886987 () Bool)

(assert (=> b!955474 m!886987))

(declare-fun m!886989 () Bool)

(assert (=> start!81916 m!886989))

(declare-fun m!886991 () Bool)

(assert (=> start!81916 m!886991))

(declare-fun m!886993 () Bool)

(assert (=> start!81916 m!886993))

(declare-fun m!886995 () Bool)

(assert (=> mapNonEmpty!33394 m!886995))

(declare-fun m!886997 () Bool)

(assert (=> b!955468 m!886997))

(assert (=> b!955471 m!886983))

(assert (=> b!955471 m!886983))

(declare-fun m!886999 () Bool)

(assert (=> b!955471 m!886999))

(declare-fun m!887001 () Bool)

(assert (=> b!955470 m!887001))

(declare-fun m!887003 () Bool)

(assert (=> b!955473 m!887003))

(assert (=> b!955473 m!886983))

(assert (=> b!955473 m!887003))

(assert (=> b!955473 m!886983))

(declare-fun m!887005 () Bool)

(assert (=> b!955473 m!887005))

(check-sat b_and!29897 (not b!955468) (not b_next!18411) tp_is_empty!20955 (not b!955474) (not b!955471) (not start!81916) (not b!955470) (not b!955473) (not mapNonEmpty!33394))
(check-sat b_and!29897 (not b_next!18411))
