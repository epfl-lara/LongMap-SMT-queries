; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4284 () Bool)

(assert start!4284)

(declare-fun b_free!1153 () Bool)

(declare-fun b_next!1153 () Bool)

(assert (=> start!4284 (= b_free!1153 (not b_next!1153))))

(declare-fun tp!4884 () Bool)

(declare-fun b_and!1957 () Bool)

(assert (=> start!4284 (= tp!4884 b_and!1957)))

(declare-fun res!19969 () Bool)

(declare-fun e!20860 () Bool)

(assert (=> start!4284 (=> (not res!19969) (not e!20860))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4284 (= res!19969 (validMask!0 mask!2294))))

(assert (=> start!4284 e!20860))

(assert (=> start!4284 true))

(assert (=> start!4284 tp!4884))

(declare-datatypes ((V!1835 0))(
  ( (V!1836 (val!780 Int)) )
))
(declare-datatypes ((ValueCell!554 0))(
  ( (ValueCellFull!554 (v!1871 V!1835)) (EmptyCell!554) )
))
(declare-datatypes ((array!2213 0))(
  ( (array!2214 (arr!1058 (Array (_ BitVec 32) ValueCell!554)) (size!1159 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2213)

(declare-fun e!20862 () Bool)

(declare-fun array_inv!725 (array!2213) Bool)

(assert (=> start!4284 (and (array_inv!725 _values!1501) e!20862)))

(declare-datatypes ((array!2215 0))(
  ( (array!2216 (arr!1059 (Array (_ BitVec 32) (_ BitVec 64))) (size!1160 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2215)

(declare-fun array_inv!726 (array!2215) Bool)

(assert (=> start!4284 (array_inv!726 _keys!1833)))

(declare-fun tp_is_empty!1507 () Bool)

(assert (=> start!4284 tp_is_empty!1507))

(declare-fun b!32846 () Bool)

(declare-fun res!19973 () Bool)

(assert (=> b!32846 (=> (not res!19973) (not e!20860))))

(declare-datatypes ((List!850 0))(
  ( (Nil!847) (Cons!846 (h!1413 (_ BitVec 64)) (t!3541 List!850)) )
))
(declare-fun arrayNoDuplicates!0 (array!2215 (_ BitVec 32) List!850) Bool)

(assert (=> b!32846 (= res!19973 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!847))))

(declare-fun b!32847 () Bool)

(declare-fun e!20863 () Bool)

(assert (=> b!32847 (= e!20863 tp_is_empty!1507)))

(declare-fun b!32848 () Bool)

(declare-fun e!20859 () Bool)

(assert (=> b!32848 (= e!20859 tp_is_empty!1507)))

(declare-fun b!32849 () Bool)

(declare-fun res!19970 () Bool)

(assert (=> b!32849 (=> (not res!19970) (not e!20860))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!32849 (= res!19970 (and (= (size!1159 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1160 _keys!1833) (size!1159 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1795 () Bool)

(declare-fun mapRes!1795 () Bool)

(assert (=> mapIsEmpty!1795 mapRes!1795))

(declare-fun b!32850 () Bool)

(assert (=> b!32850 (= e!20862 (and e!20863 mapRes!1795))))

(declare-fun condMapEmpty!1795 () Bool)

(declare-fun mapDefault!1795 () ValueCell!554)

(assert (=> b!32850 (= condMapEmpty!1795 (= (arr!1058 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!554)) mapDefault!1795)))))

(declare-fun b!32851 () Bool)

(declare-fun res!19968 () Bool)

(assert (=> b!32851 (=> (not res!19968) (not e!20860))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32851 (= res!19968 (validKeyInArray!0 k0!1304))))

(declare-fun b!32852 () Bool)

(declare-fun res!19971 () Bool)

(declare-fun e!20861 () Bool)

(assert (=> b!32852 (=> (not res!19971) (not e!20861))))

(declare-fun arrayContainsKey!0 (array!2215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32852 (= res!19971 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32853 () Bool)

(declare-fun res!19967 () Bool)

(assert (=> b!32853 (=> (not res!19967) (not e!20860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2215 (_ BitVec 32)) Bool)

(assert (=> b!32853 (= res!19967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32854 () Bool)

(assert (=> b!32854 (= e!20861 (not true))))

(declare-datatypes ((tuple2!1256 0))(
  ( (tuple2!1257 (_1!639 (_ BitVec 64)) (_2!639 V!1835)) )
))
(declare-datatypes ((List!851 0))(
  ( (Nil!848) (Cons!847 (h!1414 tuple2!1256) (t!3542 List!851)) )
))
(declare-datatypes ((ListLongMap!827 0))(
  ( (ListLongMap!828 (toList!429 List!851)) )
))
(declare-fun lt!11885 () ListLongMap!827)

(declare-fun lt!11886 () (_ BitVec 32))

(declare-fun contains!373 (ListLongMap!827 (_ BitVec 64)) Bool)

(assert (=> b!32854 (contains!373 lt!11885 (select (arr!1059 _keys!1833) lt!11886))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((Unit!735 0))(
  ( (Unit!736) )
))
(declare-fun lt!11884 () Unit!735)

(declare-fun zeroValue!1443 () V!1835)

(declare-fun minValue!1443 () V!1835)

(declare-fun lemmaValidKeyInArrayIsInListMap!53 (array!2215 array!2213 (_ BitVec 32) (_ BitVec 32) V!1835 V!1835 (_ BitVec 32) Int) Unit!735)

(assert (=> b!32854 (= lt!11884 (lemmaValidKeyInArrayIsInListMap!53 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11886 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2215 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32854 (= lt!11886 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32855 () Bool)

(assert (=> b!32855 (= e!20860 e!20861)))

(declare-fun res!19972 () Bool)

(assert (=> b!32855 (=> (not res!19972) (not e!20861))))

(assert (=> b!32855 (= res!19972 (not (contains!373 lt!11885 k0!1304)))))

(declare-fun getCurrentListMap!252 (array!2215 array!2213 (_ BitVec 32) (_ BitVec 32) V!1835 V!1835 (_ BitVec 32) Int) ListLongMap!827)

(assert (=> b!32855 (= lt!11885 (getCurrentListMap!252 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1795 () Bool)

(declare-fun tp!4885 () Bool)

(assert (=> mapNonEmpty!1795 (= mapRes!1795 (and tp!4885 e!20859))))

(declare-fun mapKey!1795 () (_ BitVec 32))

(declare-fun mapRest!1795 () (Array (_ BitVec 32) ValueCell!554))

(declare-fun mapValue!1795 () ValueCell!554)

(assert (=> mapNonEmpty!1795 (= (arr!1058 _values!1501) (store mapRest!1795 mapKey!1795 mapValue!1795))))

(assert (= (and start!4284 res!19969) b!32849))

(assert (= (and b!32849 res!19970) b!32853))

(assert (= (and b!32853 res!19967) b!32846))

(assert (= (and b!32846 res!19973) b!32851))

(assert (= (and b!32851 res!19968) b!32855))

(assert (= (and b!32855 res!19972) b!32852))

(assert (= (and b!32852 res!19971) b!32854))

(assert (= (and b!32850 condMapEmpty!1795) mapIsEmpty!1795))

(assert (= (and b!32850 (not condMapEmpty!1795)) mapNonEmpty!1795))

(get-info :version)

(assert (= (and mapNonEmpty!1795 ((_ is ValueCellFull!554) mapValue!1795)) b!32848))

(assert (= (and b!32850 ((_ is ValueCellFull!554) mapDefault!1795)) b!32847))

(assert (= start!4284 b!32850))

(declare-fun m!26205 () Bool)

(assert (=> b!32851 m!26205))

(declare-fun m!26207 () Bool)

(assert (=> b!32852 m!26207))

(declare-fun m!26209 () Bool)

(assert (=> b!32855 m!26209))

(declare-fun m!26211 () Bool)

(assert (=> b!32855 m!26211))

(declare-fun m!26213 () Bool)

(assert (=> b!32846 m!26213))

(declare-fun m!26215 () Bool)

(assert (=> b!32853 m!26215))

(declare-fun m!26217 () Bool)

(assert (=> b!32854 m!26217))

(assert (=> b!32854 m!26217))

(declare-fun m!26219 () Bool)

(assert (=> b!32854 m!26219))

(declare-fun m!26221 () Bool)

(assert (=> b!32854 m!26221))

(declare-fun m!26223 () Bool)

(assert (=> b!32854 m!26223))

(declare-fun m!26225 () Bool)

(assert (=> start!4284 m!26225))

(declare-fun m!26227 () Bool)

(assert (=> start!4284 m!26227))

(declare-fun m!26229 () Bool)

(assert (=> start!4284 m!26229))

(declare-fun m!26231 () Bool)

(assert (=> mapNonEmpty!1795 m!26231))

(check-sat (not b!32855) (not b_next!1153) tp_is_empty!1507 (not start!4284) (not b!32853) (not b!32854) (not b!32852) (not b!32846) (not mapNonEmpty!1795) b_and!1957 (not b!32851))
(check-sat b_and!1957 (not b_next!1153))
