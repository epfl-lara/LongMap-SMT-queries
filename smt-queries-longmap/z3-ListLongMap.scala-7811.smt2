; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97604 () Bool)

(assert start!97604)

(declare-fun res!744366 () Bool)

(declare-fun e!635407 () Bool)

(assert (=> start!97604 (=> (not res!744366) (not e!635407))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72486 0))(
  ( (array!72487 (arr!34896 (Array (_ BitVec 32) (_ BitVec 64))) (size!35434 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72486)

(assert (=> start!97604 (= res!744366 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35434 _keys!1208))))))

(assert (=> start!97604 e!635407))

(declare-fun array_inv!26896 (array!72486) Bool)

(assert (=> start!97604 (array_inv!26896 _keys!1208)))

(assert (=> start!97604 true))

(declare-datatypes ((V!42249 0))(
  ( (V!42250 (val!13977 Int)) )
))
(declare-datatypes ((ValueCell!13211 0))(
  ( (ValueCellFull!13211 (v!16609 V!42249)) (EmptyCell!13211) )
))
(declare-datatypes ((array!72488 0))(
  ( (array!72489 (arr!34897 (Array (_ BitVec 32) ValueCell!13211)) (size!35435 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72488)

(declare-fun e!635409 () Bool)

(declare-fun array_inv!26897 (array!72488) Bool)

(assert (=> start!97604 (and (array_inv!26897 _values!996) e!635409)))

(declare-fun b!1115004 () Bool)

(declare-fun res!744368 () Bool)

(assert (=> b!1115004 (=> (not res!744368) (not e!635407))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1115004 (= res!744368 (and (= (size!35435 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35434 _keys!1208) (size!35435 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115005 () Bool)

(declare-fun e!635412 () Bool)

(declare-fun mapRes!43579 () Bool)

(assert (=> b!1115005 (= e!635409 (and e!635412 mapRes!43579))))

(declare-fun condMapEmpty!43579 () Bool)

(declare-fun mapDefault!43579 () ValueCell!13211)

(assert (=> b!1115005 (= condMapEmpty!43579 (= (arr!34897 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13211)) mapDefault!43579)))))

(declare-fun b!1115006 () Bool)

(declare-fun res!744371 () Bool)

(assert (=> b!1115006 (=> (not res!744371) (not e!635407))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115006 (= res!744371 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35434 _keys!1208))))))

(declare-fun b!1115007 () Bool)

(declare-fun res!744367 () Bool)

(assert (=> b!1115007 (=> (not res!744367) (not e!635407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72486 (_ BitVec 32)) Bool)

(assert (=> b!1115007 (= res!744367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43579 () Bool)

(declare-fun tp!82823 () Bool)

(declare-fun e!635410 () Bool)

(assert (=> mapNonEmpty!43579 (= mapRes!43579 (and tp!82823 e!635410))))

(declare-fun mapRest!43579 () (Array (_ BitVec 32) ValueCell!13211))

(declare-fun mapKey!43579 () (_ BitVec 32))

(declare-fun mapValue!43579 () ValueCell!13211)

(assert (=> mapNonEmpty!43579 (= (arr!34897 _values!996) (store mapRest!43579 mapKey!43579 mapValue!43579))))

(declare-fun b!1115008 () Bool)

(declare-fun res!744364 () Bool)

(assert (=> b!1115008 (=> (not res!744364) (not e!635407))))

(declare-datatypes ((List!24376 0))(
  ( (Nil!24373) (Cons!24372 (h!25581 (_ BitVec 64)) (t!34848 List!24376)) )
))
(declare-fun arrayNoDuplicates!0 (array!72486 (_ BitVec 32) List!24376) Bool)

(assert (=> b!1115008 (= res!744364 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24373))))

(declare-fun b!1115009 () Bool)

(declare-fun tp_is_empty!27841 () Bool)

(assert (=> b!1115009 (= e!635412 tp_is_empty!27841)))

(declare-fun b!1115010 () Bool)

(declare-fun res!744365 () Bool)

(declare-fun e!635411 () Bool)

(assert (=> b!1115010 (=> (not res!744365) (not e!635411))))

(declare-fun lt!496734 () array!72486)

(assert (=> b!1115010 (= res!744365 (arrayNoDuplicates!0 lt!496734 #b00000000000000000000000000000000 Nil!24373))))

(declare-fun b!1115011 () Bool)

(declare-fun res!744369 () Bool)

(assert (=> b!1115011 (=> (not res!744369) (not e!635407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115011 (= res!744369 (validMask!0 mask!1564))))

(declare-fun b!1115012 () Bool)

(declare-fun res!744370 () Bool)

(assert (=> b!1115012 (=> (not res!744370) (not e!635407))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115012 (= res!744370 (= (select (arr!34896 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43579 () Bool)

(assert (=> mapIsEmpty!43579 mapRes!43579))

(declare-fun b!1115013 () Bool)

(assert (=> b!1115013 (= e!635410 tp_is_empty!27841)))

(declare-fun b!1115014 () Bool)

(declare-fun res!744372 () Bool)

(assert (=> b!1115014 (=> (not res!744372) (not e!635407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115014 (= res!744372 (validKeyInArray!0 k0!934))))

(declare-fun b!1115015 () Bool)

(assert (=> b!1115015 (= e!635411 (not true))))

(declare-fun arrayContainsKey!0 (array!72486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115015 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36417 0))(
  ( (Unit!36418) )
))
(declare-fun lt!496733 () Unit!36417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72486 (_ BitVec 64) (_ BitVec 32)) Unit!36417)

(assert (=> b!1115015 (= lt!496733 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115016 () Bool)

(assert (=> b!1115016 (= e!635407 e!635411)))

(declare-fun res!744373 () Bool)

(assert (=> b!1115016 (=> (not res!744373) (not e!635411))))

(assert (=> b!1115016 (= res!744373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496734 mask!1564))))

(assert (=> b!1115016 (= lt!496734 (array!72487 (store (arr!34896 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35434 _keys!1208)))))

(assert (= (and start!97604 res!744366) b!1115011))

(assert (= (and b!1115011 res!744369) b!1115004))

(assert (= (and b!1115004 res!744368) b!1115007))

(assert (= (and b!1115007 res!744367) b!1115008))

(assert (= (and b!1115008 res!744364) b!1115006))

(assert (= (and b!1115006 res!744371) b!1115014))

(assert (= (and b!1115014 res!744372) b!1115012))

(assert (= (and b!1115012 res!744370) b!1115016))

(assert (= (and b!1115016 res!744373) b!1115010))

(assert (= (and b!1115010 res!744365) b!1115015))

(assert (= (and b!1115005 condMapEmpty!43579) mapIsEmpty!43579))

(assert (= (and b!1115005 (not condMapEmpty!43579)) mapNonEmpty!43579))

(get-info :version)

(assert (= (and mapNonEmpty!43579 ((_ is ValueCellFull!13211) mapValue!43579)) b!1115013))

(assert (= (and b!1115005 ((_ is ValueCellFull!13211) mapDefault!43579)) b!1115009))

(assert (= start!97604 b!1115005))

(declare-fun m!1031151 () Bool)

(assert (=> b!1115016 m!1031151))

(declare-fun m!1031153 () Bool)

(assert (=> b!1115016 m!1031153))

(declare-fun m!1031155 () Bool)

(assert (=> b!1115015 m!1031155))

(declare-fun m!1031157 () Bool)

(assert (=> b!1115015 m!1031157))

(declare-fun m!1031159 () Bool)

(assert (=> b!1115010 m!1031159))

(declare-fun m!1031161 () Bool)

(assert (=> b!1115012 m!1031161))

(declare-fun m!1031163 () Bool)

(assert (=> b!1115008 m!1031163))

(declare-fun m!1031165 () Bool)

(assert (=> mapNonEmpty!43579 m!1031165))

(declare-fun m!1031167 () Bool)

(assert (=> b!1115007 m!1031167))

(declare-fun m!1031169 () Bool)

(assert (=> start!97604 m!1031169))

(declare-fun m!1031171 () Bool)

(assert (=> start!97604 m!1031171))

(declare-fun m!1031173 () Bool)

(assert (=> b!1115011 m!1031173))

(declare-fun m!1031175 () Bool)

(assert (=> b!1115014 m!1031175))

(check-sat (not b!1115008) tp_is_empty!27841 (not start!97604) (not b!1115007) (not b!1115016) (not b!1115015) (not b!1115014) (not mapNonEmpty!43579) (not b!1115011) (not b!1115010))
(check-sat)
