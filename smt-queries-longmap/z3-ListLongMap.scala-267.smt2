; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4390 () Bool)

(assert start!4390)

(declare-fun b_free!1189 () Bool)

(declare-fun b_next!1189 () Bool)

(assert (=> start!4390 (= b_free!1189 (not b_next!1189))))

(declare-fun tp!5001 () Bool)

(declare-fun b_and!2003 () Bool)

(assert (=> start!4390 (= tp!5001 b_and!2003)))

(declare-fun b!33848 () Bool)

(declare-fun e!21489 () Bool)

(declare-fun tp_is_empty!1543 () Bool)

(assert (=> b!33848 (= e!21489 tp_is_empty!1543)))

(declare-fun b!33849 () Bool)

(declare-fun res!20532 () Bool)

(declare-fun e!21488 () Bool)

(assert (=> b!33849 (=> (not res!20532) (not e!21488))))

(declare-datatypes ((array!2277 0))(
  ( (array!2278 (arr!1087 (Array (_ BitVec 32) (_ BitVec 64))) (size!1188 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2277)

(declare-datatypes ((List!883 0))(
  ( (Nil!880) (Cons!879 (h!1446 (_ BitVec 64)) (t!3579 List!883)) )
))
(declare-fun arrayNoDuplicates!0 (array!2277 (_ BitVec 32) List!883) Bool)

(assert (=> b!33849 (= res!20532 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!880))))

(declare-fun b!33850 () Bool)

(declare-fun res!20528 () Bool)

(declare-fun e!21485 () Bool)

(assert (=> b!33850 (=> (not res!20528) (not e!21485))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33850 (= res!20528 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!20533 () Bool)

(assert (=> start!4390 (=> (not res!20533) (not e!21488))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4390 (= res!20533 (validMask!0 mask!2294))))

(assert (=> start!4390 e!21488))

(assert (=> start!4390 true))

(assert (=> start!4390 tp!5001))

(declare-datatypes ((V!1883 0))(
  ( (V!1884 (val!798 Int)) )
))
(declare-datatypes ((ValueCell!572 0))(
  ( (ValueCellFull!572 (v!1891 V!1883)) (EmptyCell!572) )
))
(declare-datatypes ((array!2279 0))(
  ( (array!2280 (arr!1088 (Array (_ BitVec 32) ValueCell!572)) (size!1189 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2279)

(declare-fun e!21486 () Bool)

(declare-fun array_inv!775 (array!2279) Bool)

(assert (=> start!4390 (and (array_inv!775 _values!1501) e!21486)))

(declare-fun array_inv!776 (array!2277) Bool)

(assert (=> start!4390 (array_inv!776 _keys!1833)))

(assert (=> start!4390 tp_is_empty!1543))

(declare-fun b!33851 () Bool)

(declare-fun res!20531 () Bool)

(assert (=> b!33851 (=> (not res!20531) (not e!21488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33851 (= res!20531 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1858 () Bool)

(declare-fun mapRes!1858 () Bool)

(assert (=> mapIsEmpty!1858 mapRes!1858))

(declare-fun b!33852 () Bool)

(declare-fun res!20527 () Bool)

(assert (=> b!33852 (=> (not res!20527) (not e!21488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2277 (_ BitVec 32)) Bool)

(assert (=> b!33852 (= res!20527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33853 () Bool)

(declare-fun e!21490 () Bool)

(assert (=> b!33853 (= e!21490 tp_is_empty!1543)))

(declare-fun b!33854 () Bool)

(assert (=> b!33854 (= e!21485 (not true))))

(declare-datatypes ((SeekEntryResult!142 0))(
  ( (MissingZero!142 (index!2690 (_ BitVec 32))) (Found!142 (index!2691 (_ BitVec 32))) (Intermediate!142 (undefined!954 Bool) (index!2692 (_ BitVec 32)) (x!6870 (_ BitVec 32))) (Undefined!142) (MissingVacant!142 (index!2693 (_ BitVec 32))) )
))
(declare-fun lt!12500 () SeekEntryResult!142)

(declare-fun lt!12501 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33854 (and ((_ is Found!142) lt!12500) (= (index!2691 lt!12500) lt!12501))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2277 (_ BitVec 32)) SeekEntryResult!142)

(assert (=> b!33854 (= lt!12500 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!763 0))(
  ( (Unit!764) )
))
(declare-fun lt!12499 () Unit!763)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2277 (_ BitVec 32)) Unit!763)

(assert (=> b!33854 (= lt!12499 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12501 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1300 0))(
  ( (tuple2!1301 (_1!661 (_ BitVec 64)) (_2!661 V!1883)) )
))
(declare-datatypes ((List!884 0))(
  ( (Nil!881) (Cons!880 (h!1447 tuple2!1300) (t!3580 List!884)) )
))
(declare-datatypes ((ListLongMap!865 0))(
  ( (ListLongMap!866 (toList!448 List!884)) )
))
(declare-fun lt!12498 () ListLongMap!865)

(declare-fun contains!394 (ListLongMap!865 (_ BitVec 64)) Bool)

(assert (=> b!33854 (contains!394 lt!12498 (select (arr!1087 _keys!1833) lt!12501))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!12502 () Unit!763)

(declare-fun zeroValue!1443 () V!1883)

(declare-fun minValue!1443 () V!1883)

(declare-fun lemmaValidKeyInArrayIsInListMap!63 (array!2277 array!2279 (_ BitVec 32) (_ BitVec 32) V!1883 V!1883 (_ BitVec 32) Int) Unit!763)

(assert (=> b!33854 (= lt!12502 (lemmaValidKeyInArrayIsInListMap!63 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12501 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2277 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33854 (= lt!12501 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33855 () Bool)

(assert (=> b!33855 (= e!21486 (and e!21490 mapRes!1858))))

(declare-fun condMapEmpty!1858 () Bool)

(declare-fun mapDefault!1858 () ValueCell!572)

(assert (=> b!33855 (= condMapEmpty!1858 (= (arr!1088 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!572)) mapDefault!1858)))))

(declare-fun b!33856 () Bool)

(assert (=> b!33856 (= e!21488 e!21485)))

(declare-fun res!20529 () Bool)

(assert (=> b!33856 (=> (not res!20529) (not e!21485))))

(assert (=> b!33856 (= res!20529 (not (contains!394 lt!12498 k0!1304)))))

(declare-fun getCurrentListMap!267 (array!2277 array!2279 (_ BitVec 32) (_ BitVec 32) V!1883 V!1883 (_ BitVec 32) Int) ListLongMap!865)

(assert (=> b!33856 (= lt!12498 (getCurrentListMap!267 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33857 () Bool)

(declare-fun res!20530 () Bool)

(assert (=> b!33857 (=> (not res!20530) (not e!21488))))

(assert (=> b!33857 (= res!20530 (and (= (size!1189 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1188 _keys!1833) (size!1189 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1858 () Bool)

(declare-fun tp!5002 () Bool)

(assert (=> mapNonEmpty!1858 (= mapRes!1858 (and tp!5002 e!21489))))

(declare-fun mapValue!1858 () ValueCell!572)

(declare-fun mapKey!1858 () (_ BitVec 32))

(declare-fun mapRest!1858 () (Array (_ BitVec 32) ValueCell!572))

(assert (=> mapNonEmpty!1858 (= (arr!1088 _values!1501) (store mapRest!1858 mapKey!1858 mapValue!1858))))

(assert (= (and start!4390 res!20533) b!33857))

(assert (= (and b!33857 res!20530) b!33852))

(assert (= (and b!33852 res!20527) b!33849))

(assert (= (and b!33849 res!20532) b!33851))

(assert (= (and b!33851 res!20531) b!33856))

(assert (= (and b!33856 res!20529) b!33850))

(assert (= (and b!33850 res!20528) b!33854))

(assert (= (and b!33855 condMapEmpty!1858) mapIsEmpty!1858))

(assert (= (and b!33855 (not condMapEmpty!1858)) mapNonEmpty!1858))

(assert (= (and mapNonEmpty!1858 ((_ is ValueCellFull!572) mapValue!1858)) b!33848))

(assert (= (and b!33855 ((_ is ValueCellFull!572) mapDefault!1858)) b!33853))

(assert (= start!4390 b!33855))

(declare-fun m!27177 () Bool)

(assert (=> b!33856 m!27177))

(declare-fun m!27179 () Bool)

(assert (=> b!33856 m!27179))

(declare-fun m!27181 () Bool)

(assert (=> b!33854 m!27181))

(declare-fun m!27183 () Bool)

(assert (=> b!33854 m!27183))

(declare-fun m!27185 () Bool)

(assert (=> b!33854 m!27185))

(assert (=> b!33854 m!27181))

(declare-fun m!27187 () Bool)

(assert (=> b!33854 m!27187))

(declare-fun m!27189 () Bool)

(assert (=> b!33854 m!27189))

(declare-fun m!27191 () Bool)

(assert (=> b!33854 m!27191))

(declare-fun m!27193 () Bool)

(assert (=> b!33849 m!27193))

(declare-fun m!27195 () Bool)

(assert (=> b!33851 m!27195))

(declare-fun m!27197 () Bool)

(assert (=> mapNonEmpty!1858 m!27197))

(declare-fun m!27199 () Bool)

(assert (=> start!4390 m!27199))

(declare-fun m!27201 () Bool)

(assert (=> start!4390 m!27201))

(declare-fun m!27203 () Bool)

(assert (=> start!4390 m!27203))

(declare-fun m!27205 () Bool)

(assert (=> b!33850 m!27205))

(declare-fun m!27207 () Bool)

(assert (=> b!33852 m!27207))

(check-sat (not b!33854) (not start!4390) (not b!33850) (not b!33856) (not b!33849) (not b!33852) tp_is_empty!1543 (not b_next!1189) (not b!33851) b_and!2003 (not mapNonEmpty!1858))
(check-sat b_and!2003 (not b_next!1189))
