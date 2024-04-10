; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97666 () Bool)

(assert start!97666)

(declare-fun b!1116225 () Bool)

(declare-fun e!635992 () Bool)

(declare-fun e!635993 () Bool)

(declare-fun mapRes!43663 () Bool)

(assert (=> b!1116225 (= e!635992 (and e!635993 mapRes!43663))))

(declare-fun condMapEmpty!43663 () Bool)

(declare-datatypes ((V!42323 0))(
  ( (V!42324 (val!14005 Int)) )
))
(declare-datatypes ((ValueCell!13239 0))(
  ( (ValueCellFull!13239 (v!16638 V!42323)) (EmptyCell!13239) )
))
(declare-datatypes ((array!72691 0))(
  ( (array!72692 (arr!34998 (Array (_ BitVec 32) ValueCell!13239)) (size!35534 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72691)

(declare-fun mapDefault!43663 () ValueCell!13239)

(assert (=> b!1116225 (= condMapEmpty!43663 (= (arr!34998 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13239)) mapDefault!43663)))))

(declare-fun mapNonEmpty!43663 () Bool)

(declare-fun tp!82907 () Bool)

(declare-fun e!635997 () Bool)

(assert (=> mapNonEmpty!43663 (= mapRes!43663 (and tp!82907 e!635997))))

(declare-fun mapKey!43663 () (_ BitVec 32))

(declare-fun mapRest!43663 () (Array (_ BitVec 32) ValueCell!13239))

(declare-fun mapValue!43663 () ValueCell!13239)

(assert (=> mapNonEmpty!43663 (= (arr!34998 _values!996) (store mapRest!43663 mapKey!43663 mapValue!43663))))

(declare-fun b!1116226 () Bool)

(declare-fun res!745282 () Bool)

(declare-fun e!635996 () Bool)

(assert (=> b!1116226 (=> (not res!745282) (not e!635996))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116226 (= res!745282 (validMask!0 mask!1564))))

(declare-fun res!745278 () Bool)

(assert (=> start!97666 (=> (not res!745278) (not e!635996))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72693 0))(
  ( (array!72694 (arr!34999 (Array (_ BitVec 32) (_ BitVec 64))) (size!35535 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72693)

(assert (=> start!97666 (= res!745278 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35535 _keys!1208))))))

(assert (=> start!97666 e!635996))

(declare-fun array_inv!26900 (array!72693) Bool)

(assert (=> start!97666 (array_inv!26900 _keys!1208)))

(assert (=> start!97666 true))

(declare-fun array_inv!26901 (array!72691) Bool)

(assert (=> start!97666 (and (array_inv!26901 _values!996) e!635992)))

(declare-fun b!1116227 () Bool)

(declare-fun res!745279 () Bool)

(assert (=> b!1116227 (=> (not res!745279) (not e!635996))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116227 (= res!745279 (= (select (arr!34999 _keys!1208) i!673) k0!934))))

(declare-fun b!1116228 () Bool)

(declare-fun res!745274 () Bool)

(assert (=> b!1116228 (=> (not res!745274) (not e!635996))))

(declare-datatypes ((List!24363 0))(
  ( (Nil!24360) (Cons!24359 (h!25568 (_ BitVec 64)) (t!34844 List!24363)) )
))
(declare-fun arrayNoDuplicates!0 (array!72693 (_ BitVec 32) List!24363) Bool)

(assert (=> b!1116228 (= res!745274 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24360))))

(declare-fun b!1116229 () Bool)

(declare-fun res!745281 () Bool)

(assert (=> b!1116229 (=> (not res!745281) (not e!635996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72693 (_ BitVec 32)) Bool)

(assert (=> b!1116229 (= res!745281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116230 () Bool)

(declare-fun e!635995 () Bool)

(assert (=> b!1116230 (= e!635995 (not true))))

(declare-fun arrayContainsKey!0 (array!72693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116230 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36636 0))(
  ( (Unit!36637) )
))
(declare-fun lt!497101 () Unit!36636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72693 (_ BitVec 64) (_ BitVec 32)) Unit!36636)

(assert (=> b!1116230 (= lt!497101 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116231 () Bool)

(declare-fun res!745276 () Bool)

(assert (=> b!1116231 (=> (not res!745276) (not e!635996))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116231 (= res!745276 (and (= (size!35534 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35535 _keys!1208) (size!35534 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116232 () Bool)

(declare-fun res!745273 () Bool)

(assert (=> b!1116232 (=> (not res!745273) (not e!635996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116232 (= res!745273 (validKeyInArray!0 k0!934))))

(declare-fun b!1116233 () Bool)

(assert (=> b!1116233 (= e!635996 e!635995)))

(declare-fun res!745275 () Bool)

(assert (=> b!1116233 (=> (not res!745275) (not e!635995))))

(declare-fun lt!497102 () array!72693)

(assert (=> b!1116233 (= res!745275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497102 mask!1564))))

(assert (=> b!1116233 (= lt!497102 (array!72694 (store (arr!34999 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35535 _keys!1208)))))

(declare-fun b!1116234 () Bool)

(declare-fun res!745277 () Bool)

(assert (=> b!1116234 (=> (not res!745277) (not e!635996))))

(assert (=> b!1116234 (= res!745277 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35535 _keys!1208))))))

(declare-fun b!1116235 () Bool)

(declare-fun tp_is_empty!27897 () Bool)

(assert (=> b!1116235 (= e!635997 tp_is_empty!27897)))

(declare-fun b!1116236 () Bool)

(declare-fun res!745280 () Bool)

(assert (=> b!1116236 (=> (not res!745280) (not e!635995))))

(assert (=> b!1116236 (= res!745280 (arrayNoDuplicates!0 lt!497102 #b00000000000000000000000000000000 Nil!24360))))

(declare-fun mapIsEmpty!43663 () Bool)

(assert (=> mapIsEmpty!43663 mapRes!43663))

(declare-fun b!1116237 () Bool)

(assert (=> b!1116237 (= e!635993 tp_is_empty!27897)))

(assert (= (and start!97666 res!745278) b!1116226))

(assert (= (and b!1116226 res!745282) b!1116231))

(assert (= (and b!1116231 res!745276) b!1116229))

(assert (= (and b!1116229 res!745281) b!1116228))

(assert (= (and b!1116228 res!745274) b!1116234))

(assert (= (and b!1116234 res!745277) b!1116232))

(assert (= (and b!1116232 res!745273) b!1116227))

(assert (= (and b!1116227 res!745279) b!1116233))

(assert (= (and b!1116233 res!745275) b!1116236))

(assert (= (and b!1116236 res!745280) b!1116230))

(assert (= (and b!1116225 condMapEmpty!43663) mapIsEmpty!43663))

(assert (= (and b!1116225 (not condMapEmpty!43663)) mapNonEmpty!43663))

(get-info :version)

(assert (= (and mapNonEmpty!43663 ((_ is ValueCellFull!13239) mapValue!43663)) b!1116235))

(assert (= (and b!1116225 ((_ is ValueCellFull!13239) mapDefault!43663)) b!1116237))

(assert (= start!97666 b!1116225))

(declare-fun m!1032505 () Bool)

(assert (=> start!97666 m!1032505))

(declare-fun m!1032507 () Bool)

(assert (=> start!97666 m!1032507))

(declare-fun m!1032509 () Bool)

(assert (=> b!1116230 m!1032509))

(declare-fun m!1032511 () Bool)

(assert (=> b!1116230 m!1032511))

(declare-fun m!1032513 () Bool)

(assert (=> b!1116228 m!1032513))

(declare-fun m!1032515 () Bool)

(assert (=> b!1116229 m!1032515))

(declare-fun m!1032517 () Bool)

(assert (=> mapNonEmpty!43663 m!1032517))

(declare-fun m!1032519 () Bool)

(assert (=> b!1116232 m!1032519))

(declare-fun m!1032521 () Bool)

(assert (=> b!1116227 m!1032521))

(declare-fun m!1032523 () Bool)

(assert (=> b!1116226 m!1032523))

(declare-fun m!1032525 () Bool)

(assert (=> b!1116233 m!1032525))

(declare-fun m!1032527 () Bool)

(assert (=> b!1116233 m!1032527))

(declare-fun m!1032529 () Bool)

(assert (=> b!1116236 m!1032529))

(check-sat (not b!1116226) (not b!1116230) (not b!1116236) tp_is_empty!27897 (not b!1116232) (not b!1116229) (not b!1116233) (not b!1116228) (not mapNonEmpty!43663) (not start!97666))
(check-sat)
