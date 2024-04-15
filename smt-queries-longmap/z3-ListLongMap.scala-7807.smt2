; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97580 () Bool)

(assert start!97580)

(declare-fun b!1114536 () Bool)

(declare-fun res!744011 () Bool)

(declare-fun e!635191 () Bool)

(assert (=> b!1114536 (=> (not res!744011) (not e!635191))))

(declare-datatypes ((array!72440 0))(
  ( (array!72441 (arr!34873 (Array (_ BitVec 32) (_ BitVec 64))) (size!35411 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72440)

(declare-datatypes ((List!24368 0))(
  ( (Nil!24365) (Cons!24364 (h!25573 (_ BitVec 64)) (t!34840 List!24368)) )
))
(declare-fun arrayNoDuplicates!0 (array!72440 (_ BitVec 32) List!24368) Bool)

(assert (=> b!1114536 (= res!744011 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24365))))

(declare-fun b!1114537 () Bool)

(declare-fun res!744004 () Bool)

(assert (=> b!1114537 (=> (not res!744004) (not e!635191))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72440 (_ BitVec 32)) Bool)

(assert (=> b!1114537 (= res!744004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43543 () Bool)

(declare-fun mapRes!43543 () Bool)

(declare-fun tp!82787 () Bool)

(declare-fun e!635196 () Bool)

(assert (=> mapNonEmpty!43543 (= mapRes!43543 (and tp!82787 e!635196))))

(declare-datatypes ((V!42217 0))(
  ( (V!42218 (val!13965 Int)) )
))
(declare-datatypes ((ValueCell!13199 0))(
  ( (ValueCellFull!13199 (v!16597 V!42217)) (EmptyCell!13199) )
))
(declare-fun mapValue!43543 () ValueCell!13199)

(declare-fun mapKey!43543 () (_ BitVec 32))

(declare-fun mapRest!43543 () (Array (_ BitVec 32) ValueCell!13199))

(declare-datatypes ((array!72442 0))(
  ( (array!72443 (arr!34874 (Array (_ BitVec 32) ValueCell!13199)) (size!35412 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72442)

(assert (=> mapNonEmpty!43543 (= (arr!34874 _values!996) (store mapRest!43543 mapKey!43543 mapValue!43543))))

(declare-fun b!1114538 () Bool)

(declare-fun res!744012 () Bool)

(assert (=> b!1114538 (=> (not res!744012) (not e!635191))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114538 (= res!744012 (= (select (arr!34873 _keys!1208) i!673) k0!934))))

(declare-fun b!1114539 () Bool)

(declare-fun res!744009 () Bool)

(assert (=> b!1114539 (=> (not res!744009) (not e!635191))))

(assert (=> b!1114539 (= res!744009 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35411 _keys!1208))))))

(declare-fun b!1114540 () Bool)

(declare-fun tp_is_empty!27817 () Bool)

(assert (=> b!1114540 (= e!635196 tp_is_empty!27817)))

(declare-fun b!1114541 () Bool)

(declare-fun e!635194 () Bool)

(declare-fun e!635192 () Bool)

(assert (=> b!1114541 (= e!635194 (and e!635192 mapRes!43543))))

(declare-fun condMapEmpty!43543 () Bool)

(declare-fun mapDefault!43543 () ValueCell!13199)

(assert (=> b!1114541 (= condMapEmpty!43543 (= (arr!34874 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13199)) mapDefault!43543)))))

(declare-fun res!744007 () Bool)

(assert (=> start!97580 (=> (not res!744007) (not e!635191))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97580 (= res!744007 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35411 _keys!1208))))))

(assert (=> start!97580 e!635191))

(declare-fun array_inv!26882 (array!72440) Bool)

(assert (=> start!97580 (array_inv!26882 _keys!1208)))

(assert (=> start!97580 true))

(declare-fun array_inv!26883 (array!72442) Bool)

(assert (=> start!97580 (and (array_inv!26883 _values!996) e!635194)))

(declare-fun b!1114542 () Bool)

(declare-fun res!744005 () Bool)

(assert (=> b!1114542 (=> (not res!744005) (not e!635191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114542 (= res!744005 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43543 () Bool)

(assert (=> mapIsEmpty!43543 mapRes!43543))

(declare-fun b!1114543 () Bool)

(declare-fun e!635193 () Bool)

(assert (=> b!1114543 (= e!635193 (not true))))

(declare-fun arrayContainsKey!0 (array!72440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114543 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36405 0))(
  ( (Unit!36406) )
))
(declare-fun lt!496662 () Unit!36405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72440 (_ BitVec 64) (_ BitVec 32)) Unit!36405)

(assert (=> b!1114543 (= lt!496662 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114544 () Bool)

(assert (=> b!1114544 (= e!635192 tp_is_empty!27817)))

(declare-fun b!1114545 () Bool)

(declare-fun res!744010 () Bool)

(assert (=> b!1114545 (=> (not res!744010) (not e!635191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114545 (= res!744010 (validKeyInArray!0 k0!934))))

(declare-fun b!1114546 () Bool)

(declare-fun res!744006 () Bool)

(assert (=> b!1114546 (=> (not res!744006) (not e!635193))))

(declare-fun lt!496661 () array!72440)

(assert (=> b!1114546 (= res!744006 (arrayNoDuplicates!0 lt!496661 #b00000000000000000000000000000000 Nil!24365))))

(declare-fun b!1114547 () Bool)

(declare-fun res!744013 () Bool)

(assert (=> b!1114547 (=> (not res!744013) (not e!635191))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114547 (= res!744013 (and (= (size!35412 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35411 _keys!1208) (size!35412 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114548 () Bool)

(assert (=> b!1114548 (= e!635191 e!635193)))

(declare-fun res!744008 () Bool)

(assert (=> b!1114548 (=> (not res!744008) (not e!635193))))

(assert (=> b!1114548 (= res!744008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496661 mask!1564))))

(assert (=> b!1114548 (= lt!496661 (array!72441 (store (arr!34873 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35411 _keys!1208)))))

(assert (= (and start!97580 res!744007) b!1114542))

(assert (= (and b!1114542 res!744005) b!1114547))

(assert (= (and b!1114547 res!744013) b!1114537))

(assert (= (and b!1114537 res!744004) b!1114536))

(assert (= (and b!1114536 res!744011) b!1114539))

(assert (= (and b!1114539 res!744009) b!1114545))

(assert (= (and b!1114545 res!744010) b!1114538))

(assert (= (and b!1114538 res!744012) b!1114548))

(assert (= (and b!1114548 res!744008) b!1114546))

(assert (= (and b!1114546 res!744006) b!1114543))

(assert (= (and b!1114541 condMapEmpty!43543) mapIsEmpty!43543))

(assert (= (and b!1114541 (not condMapEmpty!43543)) mapNonEmpty!43543))

(get-info :version)

(assert (= (and mapNonEmpty!43543 ((_ is ValueCellFull!13199) mapValue!43543)) b!1114540))

(assert (= (and b!1114541 ((_ is ValueCellFull!13199) mapDefault!43543)) b!1114544))

(assert (= start!97580 b!1114541))

(declare-fun m!1030839 () Bool)

(assert (=> b!1114546 m!1030839))

(declare-fun m!1030841 () Bool)

(assert (=> b!1114548 m!1030841))

(declare-fun m!1030843 () Bool)

(assert (=> b!1114548 m!1030843))

(declare-fun m!1030845 () Bool)

(assert (=> start!97580 m!1030845))

(declare-fun m!1030847 () Bool)

(assert (=> start!97580 m!1030847))

(declare-fun m!1030849 () Bool)

(assert (=> b!1114545 m!1030849))

(declare-fun m!1030851 () Bool)

(assert (=> b!1114542 m!1030851))

(declare-fun m!1030853 () Bool)

(assert (=> b!1114536 m!1030853))

(declare-fun m!1030855 () Bool)

(assert (=> b!1114537 m!1030855))

(declare-fun m!1030857 () Bool)

(assert (=> b!1114538 m!1030857))

(declare-fun m!1030859 () Bool)

(assert (=> b!1114543 m!1030859))

(declare-fun m!1030861 () Bool)

(assert (=> b!1114543 m!1030861))

(declare-fun m!1030863 () Bool)

(assert (=> mapNonEmpty!43543 m!1030863))

(check-sat (not b!1114546) (not b!1114545) (not start!97580) tp_is_empty!27817 (not b!1114536) (not b!1114548) (not b!1114542) (not b!1114543) (not mapNonEmpty!43543) (not b!1114537))
(check-sat)
