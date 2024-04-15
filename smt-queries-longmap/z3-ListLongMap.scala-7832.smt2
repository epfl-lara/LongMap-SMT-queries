; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97730 () Bool)

(assert start!97730)

(declare-fun b_free!23437 () Bool)

(declare-fun b_next!23437 () Bool)

(assert (=> start!97730 (= b_free!23437 (not b_next!23437))))

(declare-fun tp!83015 () Bool)

(declare-fun b_and!37689 () Bool)

(assert (=> start!97730 (= tp!83015 b_and!37689)))

(declare-fun b!1117463 () Bool)

(declare-fun res!746264 () Bool)

(declare-fun e!636546 () Bool)

(assert (=> b!1117463 (=> (not res!746264) (not e!636546))))

(declare-datatypes ((array!72730 0))(
  ( (array!72731 (arr!35018 (Array (_ BitVec 32) (_ BitVec 64))) (size!35556 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72730)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72730 (_ BitVec 32)) Bool)

(assert (=> b!1117463 (= res!746264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117464 () Bool)

(declare-fun res!746259 () Bool)

(assert (=> b!1117464 (=> (not res!746259) (not e!636546))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117464 (= res!746259 (validKeyInArray!0 k0!934))))

(declare-fun b!1117465 () Bool)

(declare-fun e!636545 () Bool)

(declare-fun e!636543 () Bool)

(assert (=> b!1117465 (= e!636545 (not e!636543))))

(declare-fun res!746266 () Bool)

(assert (=> b!1117465 (=> res!746266 e!636543)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117465 (= res!746266 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117465 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36503 0))(
  ( (Unit!36504) )
))
(declare-fun lt!497114 () Unit!36503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72730 (_ BitVec 64) (_ BitVec 32)) Unit!36503)

(assert (=> b!1117465 (= lt!497114 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43768 () Bool)

(declare-fun mapRes!43768 () Bool)

(declare-fun tp!83014 () Bool)

(declare-fun e!636548 () Bool)

(assert (=> mapNonEmpty!43768 (= mapRes!43768 (and tp!83014 e!636548))))

(declare-datatypes ((V!42417 0))(
  ( (V!42418 (val!14040 Int)) )
))
(declare-datatypes ((ValueCell!13274 0))(
  ( (ValueCellFull!13274 (v!16672 V!42417)) (EmptyCell!13274) )
))
(declare-fun mapRest!43768 () (Array (_ BitVec 32) ValueCell!13274))

(declare-fun mapKey!43768 () (_ BitVec 32))

(declare-datatypes ((array!72732 0))(
  ( (array!72733 (arr!35019 (Array (_ BitVec 32) ValueCell!13274)) (size!35557 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72732)

(declare-fun mapValue!43768 () ValueCell!13274)

(assert (=> mapNonEmpty!43768 (= (arr!35019 _values!996) (store mapRest!43768 mapKey!43768 mapValue!43768))))

(declare-fun b!1117466 () Bool)

(declare-fun res!746256 () Bool)

(assert (=> b!1117466 (=> (not res!746256) (not e!636545))))

(declare-fun lt!497113 () array!72730)

(declare-datatypes ((List!24429 0))(
  ( (Nil!24426) (Cons!24425 (h!25634 (_ BitVec 64)) (t!34901 List!24429)) )
))
(declare-fun arrayNoDuplicates!0 (array!72730 (_ BitVec 32) List!24429) Bool)

(assert (=> b!1117466 (= res!746256 (arrayNoDuplicates!0 lt!497113 #b00000000000000000000000000000000 Nil!24426))))

(declare-fun b!1117467 () Bool)

(declare-fun res!746261 () Bool)

(assert (=> b!1117467 (=> (not res!746261) (not e!636546))))

(assert (=> b!1117467 (= res!746261 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24426))))

(declare-fun b!1117468 () Bool)

(declare-fun res!746263 () Bool)

(assert (=> b!1117468 (=> (not res!746263) (not e!636546))))

(assert (=> b!1117468 (= res!746263 (= (select (arr!35018 _keys!1208) i!673) k0!934))))

(declare-fun b!1117469 () Bool)

(declare-fun res!746257 () Bool)

(assert (=> b!1117469 (=> (not res!746257) (not e!636546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117469 (= res!746257 (validMask!0 mask!1564))))

(declare-fun b!1117470 () Bool)

(declare-fun e!636544 () Bool)

(declare-fun tp_is_empty!27967 () Bool)

(assert (=> b!1117470 (= e!636544 tp_is_empty!27967)))

(declare-fun res!746258 () Bool)

(assert (=> start!97730 (=> (not res!746258) (not e!636546))))

(assert (=> start!97730 (= res!746258 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35556 _keys!1208))))))

(assert (=> start!97730 e!636546))

(assert (=> start!97730 tp_is_empty!27967))

(declare-fun array_inv!26980 (array!72730) Bool)

(assert (=> start!97730 (array_inv!26980 _keys!1208)))

(assert (=> start!97730 true))

(assert (=> start!97730 tp!83015))

(declare-fun e!636547 () Bool)

(declare-fun array_inv!26981 (array!72732) Bool)

(assert (=> start!97730 (and (array_inv!26981 _values!996) e!636547)))

(declare-fun mapIsEmpty!43768 () Bool)

(assert (=> mapIsEmpty!43768 mapRes!43768))

(declare-fun b!1117471 () Bool)

(assert (=> b!1117471 (= e!636543 true)))

(declare-fun zeroValue!944 () V!42417)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42417)

(declare-datatypes ((tuple2!17670 0))(
  ( (tuple2!17671 (_1!8846 (_ BitVec 64)) (_2!8846 V!42417)) )
))
(declare-datatypes ((List!24430 0))(
  ( (Nil!24427) (Cons!24426 (h!25635 tuple2!17670) (t!34902 List!24430)) )
))
(declare-datatypes ((ListLongMap!15639 0))(
  ( (ListLongMap!15640 (toList!7835 List!24430)) )
))
(declare-fun lt!497115 () ListLongMap!15639)

(declare-fun getCurrentListMapNoExtraKeys!4344 (array!72730 array!72732 (_ BitVec 32) (_ BitVec 32) V!42417 V!42417 (_ BitVec 32) Int) ListLongMap!15639)

(assert (=> b!1117471 (= lt!497115 (getCurrentListMapNoExtraKeys!4344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1117472 () Bool)

(declare-fun res!746260 () Bool)

(assert (=> b!1117472 (=> (not res!746260) (not e!636546))))

(assert (=> b!1117472 (= res!746260 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35556 _keys!1208))))))

(declare-fun b!1117473 () Bool)

(assert (=> b!1117473 (= e!636546 e!636545)))

(declare-fun res!746262 () Bool)

(assert (=> b!1117473 (=> (not res!746262) (not e!636545))))

(assert (=> b!1117473 (= res!746262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497113 mask!1564))))

(assert (=> b!1117473 (= lt!497113 (array!72731 (store (arr!35018 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35556 _keys!1208)))))

(declare-fun b!1117474 () Bool)

(declare-fun res!746265 () Bool)

(assert (=> b!1117474 (=> (not res!746265) (not e!636546))))

(assert (=> b!1117474 (= res!746265 (and (= (size!35557 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35556 _keys!1208) (size!35557 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117475 () Bool)

(assert (=> b!1117475 (= e!636547 (and e!636544 mapRes!43768))))

(declare-fun condMapEmpty!43768 () Bool)

(declare-fun mapDefault!43768 () ValueCell!13274)

(assert (=> b!1117475 (= condMapEmpty!43768 (= (arr!35019 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13274)) mapDefault!43768)))))

(declare-fun b!1117476 () Bool)

(assert (=> b!1117476 (= e!636548 tp_is_empty!27967)))

(assert (= (and start!97730 res!746258) b!1117469))

(assert (= (and b!1117469 res!746257) b!1117474))

(assert (= (and b!1117474 res!746265) b!1117463))

(assert (= (and b!1117463 res!746264) b!1117467))

(assert (= (and b!1117467 res!746261) b!1117472))

(assert (= (and b!1117472 res!746260) b!1117464))

(assert (= (and b!1117464 res!746259) b!1117468))

(assert (= (and b!1117468 res!746263) b!1117473))

(assert (= (and b!1117473 res!746262) b!1117466))

(assert (= (and b!1117466 res!746256) b!1117465))

(assert (= (and b!1117465 (not res!746266)) b!1117471))

(assert (= (and b!1117475 condMapEmpty!43768) mapIsEmpty!43768))

(assert (= (and b!1117475 (not condMapEmpty!43768)) mapNonEmpty!43768))

(get-info :version)

(assert (= (and mapNonEmpty!43768 ((_ is ValueCellFull!13274) mapValue!43768)) b!1117476))

(assert (= (and b!1117475 ((_ is ValueCellFull!13274) mapDefault!43768)) b!1117470))

(assert (= start!97730 b!1117475))

(declare-fun m!1032789 () Bool)

(assert (=> b!1117473 m!1032789))

(declare-fun m!1032791 () Bool)

(assert (=> b!1117473 m!1032791))

(declare-fun m!1032793 () Bool)

(assert (=> mapNonEmpty!43768 m!1032793))

(declare-fun m!1032795 () Bool)

(assert (=> b!1117467 m!1032795))

(declare-fun m!1032797 () Bool)

(assert (=> b!1117464 m!1032797))

(declare-fun m!1032799 () Bool)

(assert (=> b!1117469 m!1032799))

(declare-fun m!1032801 () Bool)

(assert (=> b!1117468 m!1032801))

(declare-fun m!1032803 () Bool)

(assert (=> b!1117466 m!1032803))

(declare-fun m!1032805 () Bool)

(assert (=> b!1117471 m!1032805))

(declare-fun m!1032807 () Bool)

(assert (=> start!97730 m!1032807))

(declare-fun m!1032809 () Bool)

(assert (=> start!97730 m!1032809))

(declare-fun m!1032811 () Bool)

(assert (=> b!1117463 m!1032811))

(declare-fun m!1032813 () Bool)

(assert (=> b!1117465 m!1032813))

(declare-fun m!1032815 () Bool)

(assert (=> b!1117465 m!1032815))

(check-sat (not b!1117463) b_and!37689 tp_is_empty!27967 (not b!1117465) (not mapNonEmpty!43768) (not b!1117471) (not b!1117473) (not b_next!23437) (not b!1117466) (not start!97730) (not b!1117467) (not b!1117469) (not b!1117464))
(check-sat b_and!37689 (not b_next!23437))
