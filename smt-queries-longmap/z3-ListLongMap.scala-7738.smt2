; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97166 () Bool)

(assert start!97166)

(declare-fun mapIsEmpty!42922 () Bool)

(declare-fun mapRes!42922 () Bool)

(assert (=> mapIsEmpty!42922 mapRes!42922))

(declare-fun b!1105215 () Bool)

(declare-fun res!737479 () Bool)

(declare-fun e!630790 () Bool)

(assert (=> b!1105215 (=> (not res!737479) (not e!630790))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71640 0))(
  ( (array!71641 (arr!34473 (Array (_ BitVec 32) (_ BitVec 64))) (size!35011 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71640)

(assert (=> b!1105215 (= res!737479 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35011 _keys!1208))))))

(declare-fun b!1105216 () Bool)

(declare-fun e!630789 () Bool)

(declare-fun tp_is_empty!27403 () Bool)

(assert (=> b!1105216 (= e!630789 tp_is_empty!27403)))

(declare-fun b!1105217 () Bool)

(declare-fun res!737477 () Bool)

(assert (=> b!1105217 (=> (not res!737477) (not e!630790))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105217 (= res!737477 (validMask!0 mask!1564))))

(declare-fun b!1105218 () Bool)

(declare-fun res!737473 () Bool)

(assert (=> b!1105218 (=> (not res!737473) (not e!630790))))

(declare-datatypes ((List!24107 0))(
  ( (Nil!24104) (Cons!24103 (h!25312 (_ BitVec 64)) (t!34363 List!24107)) )
))
(declare-fun arrayNoDuplicates!0 (array!71640 (_ BitVec 32) List!24107) Bool)

(assert (=> b!1105218 (= res!737473 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24104))))

(declare-fun b!1105219 () Bool)

(declare-fun res!737471 () Bool)

(assert (=> b!1105219 (=> (not res!737471) (not e!630790))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105219 (= res!737471 (= (select (arr!34473 _keys!1208) i!673) k0!934))))

(declare-fun b!1105220 () Bool)

(declare-fun e!630787 () Bool)

(assert (=> b!1105220 (= e!630790 e!630787)))

(declare-fun res!737475 () Bool)

(assert (=> b!1105220 (=> (not res!737475) (not e!630787))))

(declare-fun lt!495096 () array!71640)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71640 (_ BitVec 32)) Bool)

(assert (=> b!1105220 (= res!737475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495096 mask!1564))))

(assert (=> b!1105220 (= lt!495096 (array!71641 (store (arr!34473 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35011 _keys!1208)))))

(declare-fun b!1105221 () Bool)

(declare-fun res!737474 () Bool)

(assert (=> b!1105221 (=> (not res!737474) (not e!630790))))

(assert (=> b!1105221 (= res!737474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!42922 () Bool)

(declare-fun tp!81842 () Bool)

(assert (=> mapNonEmpty!42922 (= mapRes!42922 (and tp!81842 e!630789))))

(declare-datatypes ((V!41665 0))(
  ( (V!41666 (val!13758 Int)) )
))
(declare-datatypes ((ValueCell!12992 0))(
  ( (ValueCellFull!12992 (v!16390 V!41665)) (EmptyCell!12992) )
))
(declare-fun mapRest!42922 () (Array (_ BitVec 32) ValueCell!12992))

(declare-datatypes ((array!71642 0))(
  ( (array!71643 (arr!34474 (Array (_ BitVec 32) ValueCell!12992)) (size!35012 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71642)

(declare-fun mapKey!42922 () (_ BitVec 32))

(declare-fun mapValue!42922 () ValueCell!12992)

(assert (=> mapNonEmpty!42922 (= (arr!34474 _values!996) (store mapRest!42922 mapKey!42922 mapValue!42922))))

(declare-fun b!1105223 () Bool)

(declare-fun res!737472 () Bool)

(assert (=> b!1105223 (=> (not res!737472) (not e!630790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105223 (= res!737472 (validKeyInArray!0 k0!934))))

(declare-fun b!1105224 () Bool)

(declare-fun e!630791 () Bool)

(assert (=> b!1105224 (= e!630791 tp_is_empty!27403)))

(declare-fun b!1105225 () Bool)

(declare-fun res!737478 () Bool)

(assert (=> b!1105225 (=> (not res!737478) (not e!630787))))

(assert (=> b!1105225 (= res!737478 (arrayNoDuplicates!0 lt!495096 #b00000000000000000000000000000000 Nil!24104))))

(declare-fun b!1105226 () Bool)

(declare-fun e!630788 () Bool)

(assert (=> b!1105226 (= e!630788 (and e!630791 mapRes!42922))))

(declare-fun condMapEmpty!42922 () Bool)

(declare-fun mapDefault!42922 () ValueCell!12992)

(assert (=> b!1105226 (= condMapEmpty!42922 (= (arr!34474 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12992)) mapDefault!42922)))))

(declare-fun b!1105227 () Bool)

(assert (=> b!1105227 (= e!630787 (not true))))

(declare-fun arrayContainsKey!0 (array!71640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105227 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36091 0))(
  ( (Unit!36092) )
))
(declare-fun lt!495095 () Unit!36091)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71640 (_ BitVec 64) (_ BitVec 32)) Unit!36091)

(assert (=> b!1105227 (= lt!495095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!737476 () Bool)

(assert (=> start!97166 (=> (not res!737476) (not e!630790))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97166 (= res!737476 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35011 _keys!1208))))))

(assert (=> start!97166 e!630790))

(declare-fun array_inv!26586 (array!71640) Bool)

(assert (=> start!97166 (array_inv!26586 _keys!1208)))

(assert (=> start!97166 true))

(declare-fun array_inv!26587 (array!71642) Bool)

(assert (=> start!97166 (and (array_inv!26587 _values!996) e!630788)))

(declare-fun b!1105222 () Bool)

(declare-fun res!737470 () Bool)

(assert (=> b!1105222 (=> (not res!737470) (not e!630790))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105222 (= res!737470 (and (= (size!35012 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35011 _keys!1208) (size!35012 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97166 res!737476) b!1105217))

(assert (= (and b!1105217 res!737477) b!1105222))

(assert (= (and b!1105222 res!737470) b!1105221))

(assert (= (and b!1105221 res!737474) b!1105218))

(assert (= (and b!1105218 res!737473) b!1105215))

(assert (= (and b!1105215 res!737479) b!1105223))

(assert (= (and b!1105223 res!737472) b!1105219))

(assert (= (and b!1105219 res!737471) b!1105220))

(assert (= (and b!1105220 res!737475) b!1105225))

(assert (= (and b!1105225 res!737478) b!1105227))

(assert (= (and b!1105226 condMapEmpty!42922) mapIsEmpty!42922))

(assert (= (and b!1105226 (not condMapEmpty!42922)) mapNonEmpty!42922))

(get-info :version)

(assert (= (and mapNonEmpty!42922 ((_ is ValueCellFull!12992) mapValue!42922)) b!1105216))

(assert (= (and b!1105226 ((_ is ValueCellFull!12992) mapDefault!42922)) b!1105224))

(assert (= start!97166 b!1105226))

(declare-fun m!1024161 () Bool)

(assert (=> b!1105217 m!1024161))

(declare-fun m!1024163 () Bool)

(assert (=> b!1105225 m!1024163))

(declare-fun m!1024165 () Bool)

(assert (=> b!1105218 m!1024165))

(declare-fun m!1024167 () Bool)

(assert (=> b!1105227 m!1024167))

(declare-fun m!1024169 () Bool)

(assert (=> b!1105227 m!1024169))

(declare-fun m!1024171 () Bool)

(assert (=> b!1105223 m!1024171))

(declare-fun m!1024173 () Bool)

(assert (=> mapNonEmpty!42922 m!1024173))

(declare-fun m!1024175 () Bool)

(assert (=> b!1105220 m!1024175))

(declare-fun m!1024177 () Bool)

(assert (=> b!1105220 m!1024177))

(declare-fun m!1024179 () Bool)

(assert (=> b!1105219 m!1024179))

(declare-fun m!1024181 () Bool)

(assert (=> b!1105221 m!1024181))

(declare-fun m!1024183 () Bool)

(assert (=> start!97166 m!1024183))

(declare-fun m!1024185 () Bool)

(assert (=> start!97166 m!1024185))

(check-sat (not b!1105220) (not b!1105221) (not b!1105225) (not b!1105227) (not start!97166) tp_is_empty!27403 (not b!1105223) (not mapNonEmpty!42922) (not b!1105217) (not b!1105218))
(check-sat)
