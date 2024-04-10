; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4278 () Bool)

(assert start!4278)

(declare-fun b_free!1143 () Bool)

(declare-fun b_next!1143 () Bool)

(assert (=> start!4278 (= b_free!1143 (not b_next!1143))))

(declare-fun tp!4855 () Bool)

(declare-fun b_and!1957 () Bool)

(assert (=> start!4278 (= tp!4855 b_and!1957)))

(declare-fun mapNonEmpty!1780 () Bool)

(declare-fun mapRes!1780 () Bool)

(declare-fun tp!4854 () Bool)

(declare-fun e!20825 () Bool)

(assert (=> mapNonEmpty!1780 (= mapRes!1780 (and tp!4854 e!20825))))

(declare-datatypes ((V!1821 0))(
  ( (V!1822 (val!775 Int)) )
))
(declare-datatypes ((ValueCell!549 0))(
  ( (ValueCellFull!549 (v!1866 V!1821)) (EmptyCell!549) )
))
(declare-datatypes ((array!2207 0))(
  ( (array!2208 (arr!1055 (Array (_ BitVec 32) ValueCell!549)) (size!1156 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2207)

(declare-fun mapValue!1780 () ValueCell!549)

(declare-fun mapRest!1780 () (Array (_ BitVec 32) ValueCell!549))

(declare-fun mapKey!1780 () (_ BitVec 32))

(assert (=> mapNonEmpty!1780 (= (arr!1055 _values!1501) (store mapRest!1780 mapKey!1780 mapValue!1780))))

(declare-fun b!32768 () Bool)

(declare-fun e!20821 () Bool)

(declare-datatypes ((array!2209 0))(
  ( (array!2210 (arr!1056 (Array (_ BitVec 32) (_ BitVec 64))) (size!1157 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2209)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!32768 (= e!20821 (not (= (size!1157 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((tuple2!1260 0))(
  ( (tuple2!1261 (_1!641 (_ BitVec 64)) (_2!641 V!1821)) )
))
(declare-datatypes ((List!853 0))(
  ( (Nil!850) (Cons!849 (h!1416 tuple2!1260) (t!3550 List!853)) )
))
(declare-datatypes ((ListLongMap!837 0))(
  ( (ListLongMap!838 (toList!434 List!853)) )
))
(declare-fun lt!11885 () ListLongMap!837)

(declare-fun lt!11884 () (_ BitVec 32))

(declare-fun contains!376 (ListLongMap!837 (_ BitVec 64)) Bool)

(assert (=> b!32768 (contains!376 lt!11885 (select (arr!1056 _keys!1833) lt!11884))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((Unit!715 0))(
  ( (Unit!716) )
))
(declare-fun lt!11883 () Unit!715)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1821)

(declare-fun minValue!1443 () V!1821)

(declare-fun lemmaValidKeyInArrayIsInListMap!47 (array!2209 array!2207 (_ BitVec 32) (_ BitVec 32) V!1821 V!1821 (_ BitVec 32) Int) Unit!715)

(assert (=> b!32768 (= lt!11883 (lemmaValidKeyInArrayIsInListMap!47 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11884 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2209 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32768 (= lt!11884 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32769 () Bool)

(declare-fun res!19907 () Bool)

(assert (=> b!32769 (=> (not res!19907) (not e!20821))))

(declare-fun arrayContainsKey!0 (array!2209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32769 (= res!19907 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32770 () Bool)

(declare-fun res!19906 () Bool)

(declare-fun e!20823 () Bool)

(assert (=> b!32770 (=> (not res!19906) (not e!20823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32770 (= res!19906 (validKeyInArray!0 k0!1304))))

(declare-fun b!32771 () Bool)

(assert (=> b!32771 (= e!20823 e!20821)))

(declare-fun res!19908 () Bool)

(assert (=> b!32771 (=> (not res!19908) (not e!20821))))

(assert (=> b!32771 (= res!19908 (not (contains!376 lt!11885 k0!1304)))))

(declare-fun getCurrentListMap!262 (array!2209 array!2207 (_ BitVec 32) (_ BitVec 32) V!1821 V!1821 (_ BitVec 32) Int) ListLongMap!837)

(assert (=> b!32771 (= lt!11885 (getCurrentListMap!262 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32772 () Bool)

(declare-fun res!19904 () Bool)

(assert (=> b!32772 (=> (not res!19904) (not e!20823))))

(assert (=> b!32772 (= res!19904 (and (= (size!1156 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1157 _keys!1833) (size!1156 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!19903 () Bool)

(assert (=> start!4278 (=> (not res!19903) (not e!20823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4278 (= res!19903 (validMask!0 mask!2294))))

(assert (=> start!4278 e!20823))

(assert (=> start!4278 true))

(assert (=> start!4278 tp!4855))

(declare-fun e!20822 () Bool)

(declare-fun array_inv!739 (array!2207) Bool)

(assert (=> start!4278 (and (array_inv!739 _values!1501) e!20822)))

(declare-fun array_inv!740 (array!2209) Bool)

(assert (=> start!4278 (array_inv!740 _keys!1833)))

(declare-fun tp_is_empty!1497 () Bool)

(assert (=> start!4278 tp_is_empty!1497))

(declare-fun b!32773 () Bool)

(declare-fun e!20820 () Bool)

(assert (=> b!32773 (= e!20820 tp_is_empty!1497)))

(declare-fun b!32774 () Bool)

(assert (=> b!32774 (= e!20825 tp_is_empty!1497)))

(declare-fun b!32775 () Bool)

(declare-fun res!19905 () Bool)

(assert (=> b!32775 (=> (not res!19905) (not e!20823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2209 (_ BitVec 32)) Bool)

(assert (=> b!32775 (= res!19905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32776 () Bool)

(assert (=> b!32776 (= e!20822 (and e!20820 mapRes!1780))))

(declare-fun condMapEmpty!1780 () Bool)

(declare-fun mapDefault!1780 () ValueCell!549)

(assert (=> b!32776 (= condMapEmpty!1780 (= (arr!1055 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!549)) mapDefault!1780)))))

(declare-fun b!32777 () Bool)

(declare-fun res!19902 () Bool)

(assert (=> b!32777 (=> (not res!19902) (not e!20823))))

(declare-datatypes ((List!854 0))(
  ( (Nil!851) (Cons!850 (h!1417 (_ BitVec 64)) (t!3551 List!854)) )
))
(declare-fun arrayNoDuplicates!0 (array!2209 (_ BitVec 32) List!854) Bool)

(assert (=> b!32777 (= res!19902 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!851))))

(declare-fun mapIsEmpty!1780 () Bool)

(assert (=> mapIsEmpty!1780 mapRes!1780))

(assert (= (and start!4278 res!19903) b!32772))

(assert (= (and b!32772 res!19904) b!32775))

(assert (= (and b!32775 res!19905) b!32777))

(assert (= (and b!32777 res!19902) b!32770))

(assert (= (and b!32770 res!19906) b!32771))

(assert (= (and b!32771 res!19908) b!32769))

(assert (= (and b!32769 res!19907) b!32768))

(assert (= (and b!32776 condMapEmpty!1780) mapIsEmpty!1780))

(assert (= (and b!32776 (not condMapEmpty!1780)) mapNonEmpty!1780))

(get-info :version)

(assert (= (and mapNonEmpty!1780 ((_ is ValueCellFull!549) mapValue!1780)) b!32774))

(assert (= (and b!32776 ((_ is ValueCellFull!549) mapDefault!1780)) b!32773))

(assert (= start!4278 b!32776))

(declare-fun m!26217 () Bool)

(assert (=> b!32769 m!26217))

(declare-fun m!26219 () Bool)

(assert (=> mapNonEmpty!1780 m!26219))

(declare-fun m!26221 () Bool)

(assert (=> b!32777 m!26221))

(declare-fun m!26223 () Bool)

(assert (=> b!32775 m!26223))

(declare-fun m!26225 () Bool)

(assert (=> b!32771 m!26225))

(declare-fun m!26227 () Bool)

(assert (=> b!32771 m!26227))

(declare-fun m!26229 () Bool)

(assert (=> start!4278 m!26229))

(declare-fun m!26231 () Bool)

(assert (=> start!4278 m!26231))

(declare-fun m!26233 () Bool)

(assert (=> start!4278 m!26233))

(declare-fun m!26235 () Bool)

(assert (=> b!32768 m!26235))

(assert (=> b!32768 m!26235))

(declare-fun m!26237 () Bool)

(assert (=> b!32768 m!26237))

(declare-fun m!26239 () Bool)

(assert (=> b!32768 m!26239))

(declare-fun m!26241 () Bool)

(assert (=> b!32768 m!26241))

(declare-fun m!26243 () Bool)

(assert (=> b!32770 m!26243))

(check-sat (not b!32768) (not b!32769) (not b!32777) (not start!4278) (not b_next!1143) (not b!32775) b_and!1957 (not b!32770) (not mapNonEmpty!1780) tp_is_empty!1497 (not b!32771))
(check-sat b_and!1957 (not b_next!1143))
