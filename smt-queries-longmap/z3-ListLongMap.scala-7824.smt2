; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97924 () Bool)

(assert start!97924)

(declare-fun b!1117981 () Bool)

(declare-fun e!637047 () Bool)

(declare-fun e!637046 () Bool)

(assert (=> b!1117981 (= e!637047 e!637046)))

(declare-fun res!746133 () Bool)

(assert (=> b!1117981 (=> (not res!746133) (not e!637046))))

(declare-datatypes ((array!72777 0))(
  ( (array!72778 (arr!35035 (Array (_ BitVec 32) (_ BitVec 64))) (size!35572 (_ BitVec 32))) )
))
(declare-fun lt!497682 () array!72777)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72777 (_ BitVec 32)) Bool)

(assert (=> b!1117981 (= res!746133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497682 mask!1564))))

(declare-fun _keys!1208 () array!72777)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117981 (= lt!497682 (array!72778 (store (arr!35035 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35572 _keys!1208)))))

(declare-fun mapNonEmpty!43696 () Bool)

(declare-fun mapRes!43696 () Bool)

(declare-fun tp!82940 () Bool)

(declare-fun e!637049 () Bool)

(assert (=> mapNonEmpty!43696 (= mapRes!43696 (and tp!82940 e!637049))))

(declare-datatypes ((V!42353 0))(
  ( (V!42354 (val!14016 Int)) )
))
(declare-datatypes ((ValueCell!13250 0))(
  ( (ValueCellFull!13250 (v!16645 V!42353)) (EmptyCell!13250) )
))
(declare-fun mapRest!43696 () (Array (_ BitVec 32) ValueCell!13250))

(declare-datatypes ((array!72779 0))(
  ( (array!72780 (arr!35036 (Array (_ BitVec 32) ValueCell!13250)) (size!35573 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72779)

(declare-fun mapValue!43696 () ValueCell!13250)

(declare-fun mapKey!43696 () (_ BitVec 32))

(assert (=> mapNonEmpty!43696 (= (arr!35036 _values!996) (store mapRest!43696 mapKey!43696 mapValue!43696))))

(declare-fun b!1117982 () Bool)

(declare-fun e!637045 () Bool)

(declare-fun tp_is_empty!27919 () Bool)

(assert (=> b!1117982 (= e!637045 tp_is_empty!27919)))

(declare-fun b!1117983 () Bool)

(declare-fun res!746126 () Bool)

(assert (=> b!1117983 (=> (not res!746126) (not e!637047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117983 (= res!746126 (validMask!0 mask!1564))))

(declare-fun res!746132 () Bool)

(assert (=> start!97924 (=> (not res!746132) (not e!637047))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97924 (= res!746132 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35572 _keys!1208))))))

(assert (=> start!97924 e!637047))

(declare-fun array_inv!26992 (array!72777) Bool)

(assert (=> start!97924 (array_inv!26992 _keys!1208)))

(assert (=> start!97924 true))

(declare-fun e!637048 () Bool)

(declare-fun array_inv!26993 (array!72779) Bool)

(assert (=> start!97924 (and (array_inv!26993 _values!996) e!637048)))

(declare-fun b!1117984 () Bool)

(declare-fun res!746130 () Bool)

(assert (=> b!1117984 (=> (not res!746130) (not e!637047))))

(assert (=> b!1117984 (= res!746130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117985 () Bool)

(declare-fun res!746127 () Bool)

(assert (=> b!1117985 (=> (not res!746127) (not e!637047))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117985 (= res!746127 (= (select (arr!35035 _keys!1208) i!673) k0!934))))

(declare-fun b!1117986 () Bool)

(declare-fun res!746125 () Bool)

(assert (=> b!1117986 (=> (not res!746125) (not e!637047))))

(declare-datatypes ((List!24394 0))(
  ( (Nil!24391) (Cons!24390 (h!25608 (_ BitVec 64)) (t!34867 List!24394)) )
))
(declare-fun arrayNoDuplicates!0 (array!72777 (_ BitVec 32) List!24394) Bool)

(assert (=> b!1117986 (= res!746125 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24391))))

(declare-fun b!1117987 () Bool)

(declare-fun res!746134 () Bool)

(assert (=> b!1117987 (=> (not res!746134) (not e!637047))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117987 (= res!746134 (and (= (size!35573 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35572 _keys!1208) (size!35573 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117988 () Bool)

(declare-fun res!746128 () Bool)

(assert (=> b!1117988 (=> (not res!746128) (not e!637047))))

(assert (=> b!1117988 (= res!746128 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35572 _keys!1208))))))

(declare-fun b!1117989 () Bool)

(declare-fun res!746129 () Bool)

(assert (=> b!1117989 (=> (not res!746129) (not e!637046))))

(assert (=> b!1117989 (= res!746129 (arrayNoDuplicates!0 lt!497682 #b00000000000000000000000000000000 Nil!24391))))

(declare-fun b!1117990 () Bool)

(assert (=> b!1117990 (= e!637048 (and e!637045 mapRes!43696))))

(declare-fun condMapEmpty!43696 () Bool)

(declare-fun mapDefault!43696 () ValueCell!13250)

(assert (=> b!1117990 (= condMapEmpty!43696 (= (arr!35036 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13250)) mapDefault!43696)))))

(declare-fun mapIsEmpty!43696 () Bool)

(assert (=> mapIsEmpty!43696 mapRes!43696))

(declare-fun b!1117991 () Bool)

(assert (=> b!1117991 (= e!637046 (not true))))

(declare-fun arrayContainsKey!0 (array!72777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117991 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36623 0))(
  ( (Unit!36624) )
))
(declare-fun lt!497683 () Unit!36623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72777 (_ BitVec 64) (_ BitVec 32)) Unit!36623)

(assert (=> b!1117991 (= lt!497683 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117992 () Bool)

(assert (=> b!1117992 (= e!637049 tp_is_empty!27919)))

(declare-fun b!1117993 () Bool)

(declare-fun res!746131 () Bool)

(assert (=> b!1117993 (=> (not res!746131) (not e!637047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117993 (= res!746131 (validKeyInArray!0 k0!934))))

(assert (= (and start!97924 res!746132) b!1117983))

(assert (= (and b!1117983 res!746126) b!1117987))

(assert (= (and b!1117987 res!746134) b!1117984))

(assert (= (and b!1117984 res!746130) b!1117986))

(assert (= (and b!1117986 res!746125) b!1117988))

(assert (= (and b!1117988 res!746128) b!1117993))

(assert (= (and b!1117993 res!746131) b!1117985))

(assert (= (and b!1117985 res!746127) b!1117981))

(assert (= (and b!1117981 res!746133) b!1117989))

(assert (= (and b!1117989 res!746129) b!1117991))

(assert (= (and b!1117990 condMapEmpty!43696) mapIsEmpty!43696))

(assert (= (and b!1117990 (not condMapEmpty!43696)) mapNonEmpty!43696))

(get-info :version)

(assert (= (and mapNonEmpty!43696 ((_ is ValueCellFull!13250) mapValue!43696)) b!1117992))

(assert (= (and b!1117990 ((_ is ValueCellFull!13250) mapDefault!43696)) b!1117982))

(assert (= start!97924 b!1117990))

(declare-fun m!1034463 () Bool)

(assert (=> b!1117984 m!1034463))

(declare-fun m!1034465 () Bool)

(assert (=> b!1117983 m!1034465))

(declare-fun m!1034467 () Bool)

(assert (=> b!1117981 m!1034467))

(declare-fun m!1034469 () Bool)

(assert (=> b!1117981 m!1034469))

(declare-fun m!1034471 () Bool)

(assert (=> start!97924 m!1034471))

(declare-fun m!1034473 () Bool)

(assert (=> start!97924 m!1034473))

(declare-fun m!1034475 () Bool)

(assert (=> b!1117993 m!1034475))

(declare-fun m!1034477 () Bool)

(assert (=> b!1117989 m!1034477))

(declare-fun m!1034479 () Bool)

(assert (=> b!1117986 m!1034479))

(declare-fun m!1034481 () Bool)

(assert (=> mapNonEmpty!43696 m!1034481))

(declare-fun m!1034483 () Bool)

(assert (=> b!1117991 m!1034483))

(declare-fun m!1034485 () Bool)

(assert (=> b!1117991 m!1034485))

(declare-fun m!1034487 () Bool)

(assert (=> b!1117985 m!1034487))

(check-sat (not b!1117993) (not b!1117984) tp_is_empty!27919 (not mapNonEmpty!43696) (not b!1117986) (not start!97924) (not b!1117991) (not b!1117983) (not b!1117981) (not b!1117989))
(check-sat)
