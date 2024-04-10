; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4130 () Bool)

(assert start!4130)

(declare-fun b_free!1035 () Bool)

(declare-fun b_next!1035 () Bool)

(assert (=> start!4130 (= b_free!1035 (not b_next!1035))))

(declare-fun tp!4524 () Bool)

(declare-fun b_and!1845 () Bool)

(assert (=> start!4130 (= tp!4524 b_and!1845)))

(declare-fun mapIsEmpty!1612 () Bool)

(declare-fun mapRes!1612 () Bool)

(assert (=> mapIsEmpty!1612 mapRes!1612))

(declare-fun mapNonEmpty!1612 () Bool)

(declare-fun tp!4525 () Bool)

(declare-fun e!19820 () Bool)

(assert (=> mapNonEmpty!1612 (= mapRes!1612 (and tp!4525 e!19820))))

(declare-datatypes ((V!1677 0))(
  ( (V!1678 (val!721 Int)) )
))
(declare-datatypes ((ValueCell!495 0))(
  ( (ValueCellFull!495 (v!1810 V!1677)) (EmptyCell!495) )
))
(declare-datatypes ((array!2001 0))(
  ( (array!2002 (arr!954 (Array (_ BitVec 32) ValueCell!495)) (size!1055 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2001)

(declare-fun mapValue!1612 () ValueCell!495)

(declare-fun mapRest!1612 () (Array (_ BitVec 32) ValueCell!495))

(declare-fun mapKey!1612 () (_ BitVec 32))

(assert (=> mapNonEmpty!1612 (= (arr!954 _values!1501) (store mapRest!1612 mapKey!1612 mapValue!1612))))

(declare-fun b!30938 () Bool)

(declare-fun res!18705 () Bool)

(declare-fun e!19817 () Bool)

(assert (=> b!30938 (=> (not res!18705) (not e!19817))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2003 0))(
  ( (array!2004 (arr!955 (Array (_ BitVec 32) (_ BitVec 64))) (size!1056 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2003)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!30938 (= res!18705 (and (= (size!1055 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1056 _keys!1833) (size!1055 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30939 () Bool)

(declare-fun e!19823 () Bool)

(declare-fun e!19818 () Bool)

(assert (=> b!30939 (= e!19823 e!19818)))

(declare-fun res!18701 () Bool)

(assert (=> b!30939 (=> (not res!18701) (not e!19818))))

(declare-datatypes ((SeekEntryResult!113 0))(
  ( (MissingZero!113 (index!2574 (_ BitVec 32))) (Found!113 (index!2575 (_ BitVec 32))) (Intermediate!113 (undefined!925 Bool) (index!2576 (_ BitVec 32)) (x!6583 (_ BitVec 32))) (Undefined!113) (MissingVacant!113 (index!2577 (_ BitVec 32))) )
))
(declare-fun lt!11514 () SeekEntryResult!113)

(get-info :version)

(assert (=> b!30939 (= res!18701 ((_ is Found!113) lt!11514))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2003 (_ BitVec 32)) SeekEntryResult!113)

(assert (=> b!30939 (= lt!11514 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30940 () Bool)

(declare-fun res!18699 () Bool)

(assert (=> b!30940 (=> (not res!18699) (not e!19817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30940 (= res!18699 (validKeyInArray!0 k0!1304))))

(declare-fun res!18702 () Bool)

(assert (=> start!4130 (=> (not res!18702) (not e!19817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4130 (= res!18702 (validMask!0 mask!2294))))

(assert (=> start!4130 e!19817))

(assert (=> start!4130 true))

(assert (=> start!4130 tp!4524))

(declare-fun e!19821 () Bool)

(declare-fun array_inv!665 (array!2001) Bool)

(assert (=> start!4130 (and (array_inv!665 _values!1501) e!19821)))

(declare-fun array_inv!666 (array!2003) Bool)

(assert (=> start!4130 (array_inv!666 _keys!1833)))

(declare-fun tp_is_empty!1389 () Bool)

(assert (=> start!4130 tp_is_empty!1389))

(declare-fun b!30941 () Bool)

(declare-fun e!19819 () Bool)

(assert (=> b!30941 (= e!19821 (and e!19819 mapRes!1612))))

(declare-fun condMapEmpty!1612 () Bool)

(declare-fun mapDefault!1612 () ValueCell!495)

(assert (=> b!30941 (= condMapEmpty!1612 (= (arr!954 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!495)) mapDefault!1612)))))

(declare-fun b!30942 () Bool)

(assert (=> b!30942 (= e!19817 e!19823)))

(declare-fun res!18698 () Bool)

(assert (=> b!30942 (=> (not res!18698) (not e!19823))))

(declare-datatypes ((tuple2!1182 0))(
  ( (tuple2!1183 (_1!602 (_ BitVec 64)) (_2!602 V!1677)) )
))
(declare-datatypes ((List!776 0))(
  ( (Nil!773) (Cons!772 (h!1339 tuple2!1182) (t!3469 List!776)) )
))
(declare-datatypes ((ListLongMap!759 0))(
  ( (ListLongMap!760 (toList!395 List!776)) )
))
(declare-fun lt!11516 () ListLongMap!759)

(declare-fun contains!335 (ListLongMap!759 (_ BitVec 64)) Bool)

(assert (=> b!30942 (= res!18698 (not (contains!335 lt!11516 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1677)

(declare-fun minValue!1443 () V!1677)

(declare-fun getCurrentListMap!223 (array!2003 array!2001 (_ BitVec 32) (_ BitVec 32) V!1677 V!1677 (_ BitVec 32) Int) ListLongMap!759)

(assert (=> b!30942 (= lt!11516 (getCurrentListMap!223 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!30943 () Bool)

(assert (=> b!30943 (= e!19818 (not true))))

(assert (=> b!30943 (contains!335 lt!11516 (select (arr!955 _keys!1833) (index!2575 lt!11514)))))

(declare-datatypes ((Unit!695 0))(
  ( (Unit!696) )
))
(declare-fun lt!11515 () Unit!695)

(declare-fun lemmaValidKeyInArrayIsInListMap!41 (array!2003 array!2001 (_ BitVec 32) (_ BitVec 32) V!1677 V!1677 (_ BitVec 32) Int) Unit!695)

(assert (=> b!30943 (= lt!11515 (lemmaValidKeyInArrayIsInListMap!41 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2575 lt!11514) defaultEntry!1504))))

(declare-fun b!30944 () Bool)

(declare-fun res!18704 () Bool)

(assert (=> b!30944 (=> (not res!18704) (not e!19817))))

(declare-datatypes ((List!777 0))(
  ( (Nil!774) (Cons!773 (h!1340 (_ BitVec 64)) (t!3470 List!777)) )
))
(declare-fun arrayNoDuplicates!0 (array!2003 (_ BitVec 32) List!777) Bool)

(assert (=> b!30944 (= res!18704 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!774))))

(declare-fun b!30945 () Bool)

(assert (=> b!30945 (= e!19819 tp_is_empty!1389)))

(declare-fun b!30946 () Bool)

(declare-fun res!18703 () Bool)

(assert (=> b!30946 (=> (not res!18703) (not e!19817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2003 (_ BitVec 32)) Bool)

(assert (=> b!30946 (= res!18703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30947 () Bool)

(declare-fun res!18700 () Bool)

(assert (=> b!30947 (=> (not res!18700) (not e!19823))))

(declare-fun arrayContainsKey!0 (array!2003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30947 (= res!18700 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30948 () Bool)

(assert (=> b!30948 (= e!19820 tp_is_empty!1389)))

(assert (= (and start!4130 res!18702) b!30938))

(assert (= (and b!30938 res!18705) b!30946))

(assert (= (and b!30946 res!18703) b!30944))

(assert (= (and b!30944 res!18704) b!30940))

(assert (= (and b!30940 res!18699) b!30942))

(assert (= (and b!30942 res!18698) b!30947))

(assert (= (and b!30947 res!18700) b!30939))

(assert (= (and b!30939 res!18701) b!30943))

(assert (= (and b!30941 condMapEmpty!1612) mapIsEmpty!1612))

(assert (= (and b!30941 (not condMapEmpty!1612)) mapNonEmpty!1612))

(assert (= (and mapNonEmpty!1612 ((_ is ValueCellFull!495) mapValue!1612)) b!30948))

(assert (= (and b!30941 ((_ is ValueCellFull!495) mapDefault!1612)) b!30945))

(assert (= start!4130 b!30941))

(declare-fun m!24845 () Bool)

(assert (=> b!30947 m!24845))

(declare-fun m!24847 () Bool)

(assert (=> b!30939 m!24847))

(declare-fun m!24849 () Bool)

(assert (=> b!30944 m!24849))

(declare-fun m!24851 () Bool)

(assert (=> start!4130 m!24851))

(declare-fun m!24853 () Bool)

(assert (=> start!4130 m!24853))

(declare-fun m!24855 () Bool)

(assert (=> start!4130 m!24855))

(declare-fun m!24857 () Bool)

(assert (=> b!30946 m!24857))

(declare-fun m!24859 () Bool)

(assert (=> b!30940 m!24859))

(declare-fun m!24861 () Bool)

(assert (=> b!30943 m!24861))

(assert (=> b!30943 m!24861))

(declare-fun m!24863 () Bool)

(assert (=> b!30943 m!24863))

(declare-fun m!24865 () Bool)

(assert (=> b!30943 m!24865))

(declare-fun m!24867 () Bool)

(assert (=> mapNonEmpty!1612 m!24867))

(declare-fun m!24869 () Bool)

(assert (=> b!30942 m!24869))

(declare-fun m!24871 () Bool)

(assert (=> b!30942 m!24871))

(check-sat (not b!30942) (not b!30946) (not b!30944) (not b_next!1035) (not b!30939) (not mapNonEmpty!1612) b_and!1845 (not b!30943) tp_is_empty!1389 (not b!30947) (not b!30940) (not start!4130))
(check-sat b_and!1845 (not b_next!1035))
