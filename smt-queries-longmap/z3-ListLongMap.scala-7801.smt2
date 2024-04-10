; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97552 () Bool)

(assert start!97552)

(declare-fun b!1114002 () Bool)

(declare-fun res!743563 () Bool)

(declare-fun e!634970 () Bool)

(assert (=> b!1114002 (=> (not res!743563) (not e!634970))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114002 (= res!743563 (validKeyInArray!0 k0!934))))

(declare-fun b!1114003 () Bool)

(declare-fun e!634969 () Bool)

(assert (=> b!1114003 (= e!634969 (not true))))

(declare-datatypes ((array!72473 0))(
  ( (array!72474 (arr!34889 (Array (_ BitVec 32) (_ BitVec 64))) (size!35425 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72473)

(declare-fun arrayContainsKey!0 (array!72473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114003 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36562 0))(
  ( (Unit!36563) )
))
(declare-fun lt!496759 () Unit!36562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72473 (_ BitVec 64) (_ BitVec 32)) Unit!36562)

(assert (=> b!1114003 (= lt!496759 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114005 () Bool)

(declare-fun res!743572 () Bool)

(assert (=> b!1114005 (=> (not res!743572) (not e!634970))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114005 (= res!743572 (validMask!0 mask!1564))))

(declare-fun b!1114006 () Bool)

(declare-fun res!743568 () Bool)

(assert (=> b!1114006 (=> (not res!743568) (not e!634970))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42171 0))(
  ( (V!42172 (val!13948 Int)) )
))
(declare-datatypes ((ValueCell!13182 0))(
  ( (ValueCellFull!13182 (v!16581 V!42171)) (EmptyCell!13182) )
))
(declare-datatypes ((array!72475 0))(
  ( (array!72476 (arr!34890 (Array (_ BitVec 32) ValueCell!13182)) (size!35426 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72475)

(assert (=> b!1114006 (= res!743568 (and (= (size!35426 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35425 _keys!1208) (size!35426 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114007 () Bool)

(declare-fun res!743567 () Bool)

(assert (=> b!1114007 (=> (not res!743567) (not e!634970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72473 (_ BitVec 32)) Bool)

(assert (=> b!1114007 (= res!743567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43492 () Bool)

(declare-fun mapRes!43492 () Bool)

(declare-fun tp!82736 () Bool)

(declare-fun e!634967 () Bool)

(assert (=> mapNonEmpty!43492 (= mapRes!43492 (and tp!82736 e!634967))))

(declare-fun mapKey!43492 () (_ BitVec 32))

(declare-fun mapValue!43492 () ValueCell!13182)

(declare-fun mapRest!43492 () (Array (_ BitVec 32) ValueCell!13182))

(assert (=> mapNonEmpty!43492 (= (arr!34890 _values!996) (store mapRest!43492 mapKey!43492 mapValue!43492))))

(declare-fun b!1114008 () Bool)

(declare-fun e!634968 () Bool)

(declare-fun e!634971 () Bool)

(assert (=> b!1114008 (= e!634968 (and e!634971 mapRes!43492))))

(declare-fun condMapEmpty!43492 () Bool)

(declare-fun mapDefault!43492 () ValueCell!13182)

(assert (=> b!1114008 (= condMapEmpty!43492 (= (arr!34890 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13182)) mapDefault!43492)))))

(declare-fun b!1114009 () Bool)

(declare-fun res!743564 () Bool)

(assert (=> b!1114009 (=> (not res!743564) (not e!634970))))

(declare-datatypes ((List!24320 0))(
  ( (Nil!24317) (Cons!24316 (h!25525 (_ BitVec 64)) (t!34801 List!24320)) )
))
(declare-fun arrayNoDuplicates!0 (array!72473 (_ BitVec 32) List!24320) Bool)

(assert (=> b!1114009 (= res!743564 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24317))))

(declare-fun b!1114010 () Bool)

(declare-fun res!743565 () Bool)

(assert (=> b!1114010 (=> (not res!743565) (not e!634970))))

(assert (=> b!1114010 (= res!743565 (= (select (arr!34889 _keys!1208) i!673) k0!934))))

(declare-fun b!1114011 () Bool)

(assert (=> b!1114011 (= e!634970 e!634969)))

(declare-fun res!743569 () Bool)

(assert (=> b!1114011 (=> (not res!743569) (not e!634969))))

(declare-fun lt!496760 () array!72473)

(assert (=> b!1114011 (= res!743569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496760 mask!1564))))

(assert (=> b!1114011 (= lt!496760 (array!72474 (store (arr!34889 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35425 _keys!1208)))))

(declare-fun b!1114004 () Bool)

(declare-fun res!743571 () Bool)

(assert (=> b!1114004 (=> (not res!743571) (not e!634969))))

(assert (=> b!1114004 (= res!743571 (arrayNoDuplicates!0 lt!496760 #b00000000000000000000000000000000 Nil!24317))))

(declare-fun res!743566 () Bool)

(assert (=> start!97552 (=> (not res!743566) (not e!634970))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97552 (= res!743566 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35425 _keys!1208))))))

(assert (=> start!97552 e!634970))

(declare-fun array_inv!26818 (array!72473) Bool)

(assert (=> start!97552 (array_inv!26818 _keys!1208)))

(assert (=> start!97552 true))

(declare-fun array_inv!26819 (array!72475) Bool)

(assert (=> start!97552 (and (array_inv!26819 _values!996) e!634968)))

(declare-fun b!1114012 () Bool)

(declare-fun res!743570 () Bool)

(assert (=> b!1114012 (=> (not res!743570) (not e!634970))))

(assert (=> b!1114012 (= res!743570 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35425 _keys!1208))))))

(declare-fun b!1114013 () Bool)

(declare-fun tp_is_empty!27783 () Bool)

(assert (=> b!1114013 (= e!634967 tp_is_empty!27783)))

(declare-fun mapIsEmpty!43492 () Bool)

(assert (=> mapIsEmpty!43492 mapRes!43492))

(declare-fun b!1114014 () Bool)

(assert (=> b!1114014 (= e!634971 tp_is_empty!27783)))

(assert (= (and start!97552 res!743566) b!1114005))

(assert (= (and b!1114005 res!743572) b!1114006))

(assert (= (and b!1114006 res!743568) b!1114007))

(assert (= (and b!1114007 res!743567) b!1114009))

(assert (= (and b!1114009 res!743564) b!1114012))

(assert (= (and b!1114012 res!743570) b!1114002))

(assert (= (and b!1114002 res!743563) b!1114010))

(assert (= (and b!1114010 res!743565) b!1114011))

(assert (= (and b!1114011 res!743569) b!1114004))

(assert (= (and b!1114004 res!743571) b!1114003))

(assert (= (and b!1114008 condMapEmpty!43492) mapIsEmpty!43492))

(assert (= (and b!1114008 (not condMapEmpty!43492)) mapNonEmpty!43492))

(get-info :version)

(assert (= (and mapNonEmpty!43492 ((_ is ValueCellFull!13182) mapValue!43492)) b!1114013))

(assert (= (and b!1114008 ((_ is ValueCellFull!13182) mapDefault!43492)) b!1114014))

(assert (= start!97552 b!1114008))

(declare-fun m!1031023 () Bool)

(assert (=> b!1114009 m!1031023))

(declare-fun m!1031025 () Bool)

(assert (=> b!1114007 m!1031025))

(declare-fun m!1031027 () Bool)

(assert (=> b!1114003 m!1031027))

(declare-fun m!1031029 () Bool)

(assert (=> b!1114003 m!1031029))

(declare-fun m!1031031 () Bool)

(assert (=> b!1114010 m!1031031))

(declare-fun m!1031033 () Bool)

(assert (=> mapNonEmpty!43492 m!1031033))

(declare-fun m!1031035 () Bool)

(assert (=> b!1114004 m!1031035))

(declare-fun m!1031037 () Bool)

(assert (=> b!1114005 m!1031037))

(declare-fun m!1031039 () Bool)

(assert (=> b!1114011 m!1031039))

(declare-fun m!1031041 () Bool)

(assert (=> b!1114011 m!1031041))

(declare-fun m!1031043 () Bool)

(assert (=> b!1114002 m!1031043))

(declare-fun m!1031045 () Bool)

(assert (=> start!97552 m!1031045))

(declare-fun m!1031047 () Bool)

(assert (=> start!97552 m!1031047))

(check-sat (not start!97552) (not b!1114009) (not mapNonEmpty!43492) (not b!1114002) (not b!1114007) (not b!1114003) (not b!1114011) (not b!1114004) (not b!1114005) tp_is_empty!27783)
(check-sat)
