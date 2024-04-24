; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4266 () Bool)

(assert start!4266)

(declare-fun b_free!1135 () Bool)

(declare-fun b_next!1135 () Bool)

(assert (=> start!4266 (= b_free!1135 (not b_next!1135))))

(declare-fun tp!4831 () Bool)

(declare-fun b_and!1939 () Bool)

(assert (=> start!4266 (= tp!4831 b_and!1939)))

(declare-fun res!19781 () Bool)

(declare-fun e!20698 () Bool)

(assert (=> start!4266 (=> (not res!19781) (not e!20698))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4266 (= res!19781 (validMask!0 mask!2294))))

(assert (=> start!4266 e!20698))

(assert (=> start!4266 true))

(assert (=> start!4266 tp!4831))

(declare-datatypes ((V!1811 0))(
  ( (V!1812 (val!771 Int)) )
))
(declare-datatypes ((ValueCell!545 0))(
  ( (ValueCellFull!545 (v!1862 V!1811)) (EmptyCell!545) )
))
(declare-datatypes ((array!2179 0))(
  ( (array!2180 (arr!1041 (Array (_ BitVec 32) ValueCell!545)) (size!1142 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2179)

(declare-fun e!20696 () Bool)

(declare-fun array_inv!715 (array!2179) Bool)

(assert (=> start!4266 (and (array_inv!715 _values!1501) e!20696)))

(declare-datatypes ((array!2181 0))(
  ( (array!2182 (arr!1042 (Array (_ BitVec 32) (_ BitVec 64))) (size!1143 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2181)

(declare-fun array_inv!716 (array!2181) Bool)

(assert (=> start!4266 (array_inv!716 _keys!1833)))

(declare-fun tp_is_empty!1489 () Bool)

(assert (=> start!4266 tp_is_empty!1489))

(declare-fun b!32576 () Bool)

(declare-fun e!20699 () Bool)

(assert (=> b!32576 (= e!20699 tp_is_empty!1489)))

(declare-fun b!32577 () Bool)

(declare-fun e!20697 () Bool)

(declare-fun mapRes!1768 () Bool)

(assert (=> b!32577 (= e!20696 (and e!20697 mapRes!1768))))

(declare-fun condMapEmpty!1768 () Bool)

(declare-fun mapDefault!1768 () ValueCell!545)

(assert (=> b!32577 (= condMapEmpty!1768 (= (arr!1041 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!545)) mapDefault!1768)))))

(declare-fun mapNonEmpty!1768 () Bool)

(declare-fun tp!4830 () Bool)

(assert (=> mapNonEmpty!1768 (= mapRes!1768 (and tp!4830 e!20699))))

(declare-fun mapValue!1768 () ValueCell!545)

(declare-fun mapKey!1768 () (_ BitVec 32))

(declare-fun mapRest!1768 () (Array (_ BitVec 32) ValueCell!545))

(assert (=> mapNonEmpty!1768 (= (arr!1041 _values!1501) (store mapRest!1768 mapKey!1768 mapValue!1768))))

(declare-fun b!32578 () Bool)

(declare-fun res!19784 () Bool)

(declare-fun e!20700 () Bool)

(assert (=> b!32578 (=> (not res!19784) (not e!20700))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32578 (= res!19784 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32579 () Bool)

(assert (=> b!32579 (= e!20698 e!20700)))

(declare-fun res!19778 () Bool)

(assert (=> b!32579 (=> (not res!19778) (not e!20700))))

(declare-datatypes ((tuple2!1242 0))(
  ( (tuple2!1243 (_1!632 (_ BitVec 64)) (_2!632 V!1811)) )
))
(declare-datatypes ((List!838 0))(
  ( (Nil!835) (Cons!834 (h!1401 tuple2!1242) (t!3529 List!838)) )
))
(declare-datatypes ((ListLongMap!813 0))(
  ( (ListLongMap!814 (toList!422 List!838)) )
))
(declare-fun lt!11805 () ListLongMap!813)

(declare-fun contains!366 (ListLongMap!813 (_ BitVec 64)) Bool)

(assert (=> b!32579 (= res!19778 (not (contains!366 lt!11805 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1811)

(declare-fun minValue!1443 () V!1811)

(declare-fun getCurrentListMap!247 (array!2181 array!2179 (_ BitVec 32) (_ BitVec 32) V!1811 V!1811 (_ BitVec 32) Int) ListLongMap!813)

(assert (=> b!32579 (= lt!11805 (getCurrentListMap!247 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32580 () Bool)

(assert (=> b!32580 (= e!20697 tp_is_empty!1489)))

(declare-fun b!32581 () Bool)

(declare-fun res!19780 () Bool)

(assert (=> b!32581 (=> (not res!19780) (not e!20698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2181 (_ BitVec 32)) Bool)

(assert (=> b!32581 (= res!19780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1768 () Bool)

(assert (=> mapIsEmpty!1768 mapRes!1768))

(declare-fun b!32582 () Bool)

(declare-fun res!19783 () Bool)

(assert (=> b!32582 (=> (not res!19783) (not e!20698))))

(assert (=> b!32582 (= res!19783 (and (= (size!1142 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1143 _keys!1833) (size!1142 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32583 () Bool)

(assert (=> b!32583 (= e!20700 (not true))))

(declare-fun lt!11804 () (_ BitVec 32))

(assert (=> b!32583 (contains!366 lt!11805 (select (arr!1042 _keys!1833) lt!11804))))

(declare-datatypes ((Unit!725 0))(
  ( (Unit!726) )
))
(declare-fun lt!11803 () Unit!725)

(declare-fun lemmaValidKeyInArrayIsInListMap!48 (array!2181 array!2179 (_ BitVec 32) (_ BitVec 32) V!1811 V!1811 (_ BitVec 32) Int) Unit!725)

(assert (=> b!32583 (= lt!11803 (lemmaValidKeyInArrayIsInListMap!48 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11804 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2181 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32583 (= lt!11804 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32584 () Bool)

(declare-fun res!19782 () Bool)

(assert (=> b!32584 (=> (not res!19782) (not e!20698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32584 (= res!19782 (validKeyInArray!0 k0!1304))))

(declare-fun b!32585 () Bool)

(declare-fun res!19779 () Bool)

(assert (=> b!32585 (=> (not res!19779) (not e!20698))))

(declare-datatypes ((List!839 0))(
  ( (Nil!836) (Cons!835 (h!1402 (_ BitVec 64)) (t!3530 List!839)) )
))
(declare-fun arrayNoDuplicates!0 (array!2181 (_ BitVec 32) List!839) Bool)

(assert (=> b!32585 (= res!19779 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!836))))

(assert (= (and start!4266 res!19781) b!32582))

(assert (= (and b!32582 res!19783) b!32581))

(assert (= (and b!32581 res!19780) b!32585))

(assert (= (and b!32585 res!19779) b!32584))

(assert (= (and b!32584 res!19782) b!32579))

(assert (= (and b!32579 res!19778) b!32578))

(assert (= (and b!32578 res!19784) b!32583))

(assert (= (and b!32577 condMapEmpty!1768) mapIsEmpty!1768))

(assert (= (and b!32577 (not condMapEmpty!1768)) mapNonEmpty!1768))

(get-info :version)

(assert (= (and mapNonEmpty!1768 ((_ is ValueCellFull!545) mapValue!1768)) b!32576))

(assert (= (and b!32577 ((_ is ValueCellFull!545) mapDefault!1768)) b!32580))

(assert (= start!4266 b!32577))

(declare-fun m!25953 () Bool)

(assert (=> b!32579 m!25953))

(declare-fun m!25955 () Bool)

(assert (=> b!32579 m!25955))

(declare-fun m!25957 () Bool)

(assert (=> start!4266 m!25957))

(declare-fun m!25959 () Bool)

(assert (=> start!4266 m!25959))

(declare-fun m!25961 () Bool)

(assert (=> start!4266 m!25961))

(declare-fun m!25963 () Bool)

(assert (=> b!32581 m!25963))

(declare-fun m!25965 () Bool)

(assert (=> b!32583 m!25965))

(assert (=> b!32583 m!25965))

(declare-fun m!25967 () Bool)

(assert (=> b!32583 m!25967))

(declare-fun m!25969 () Bool)

(assert (=> b!32583 m!25969))

(declare-fun m!25971 () Bool)

(assert (=> b!32583 m!25971))

(declare-fun m!25973 () Bool)

(assert (=> b!32584 m!25973))

(declare-fun m!25975 () Bool)

(assert (=> mapNonEmpty!1768 m!25975))

(declare-fun m!25977 () Bool)

(assert (=> b!32585 m!25977))

(declare-fun m!25979 () Bool)

(assert (=> b!32578 m!25979))

(check-sat (not mapNonEmpty!1768) (not b!32579) tp_is_empty!1489 (not b!32581) (not start!4266) (not b!32583) b_and!1939 (not b!32585) (not b!32584) (not b_next!1135) (not b!32578))
(check-sat b_and!1939 (not b_next!1135))
