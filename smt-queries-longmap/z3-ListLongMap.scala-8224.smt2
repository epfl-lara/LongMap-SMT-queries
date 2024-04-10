; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100254 () Bool)

(assert start!100254)

(declare-fun b!1195827 () Bool)

(declare-fun e!679487 () Bool)

(assert (=> b!1195827 (= e!679487 (not true))))

(declare-datatypes ((array!77423 0))(
  ( (array!77424 (arr!37358 (Array (_ BitVec 32) (_ BitVec 64))) (size!37894 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77423)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195827 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39648 0))(
  ( (Unit!39649) )
))
(declare-fun lt!542987 () Unit!39648)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77423 (_ BitVec 64) (_ BitVec 32)) Unit!39648)

(assert (=> b!1195827 (= lt!542987 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195828 () Bool)

(declare-fun res!795760 () Bool)

(declare-fun e!679488 () Bool)

(assert (=> b!1195828 (=> (not res!795760) (not e!679488))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195828 (= res!795760 (validMask!0 mask!1564))))

(declare-fun b!1195829 () Bool)

(declare-fun res!795759 () Bool)

(assert (=> b!1195829 (=> (not res!795759) (not e!679488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77423 (_ BitVec 32)) Bool)

(assert (=> b!1195829 (= res!795759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195830 () Bool)

(declare-fun res!795766 () Bool)

(assert (=> b!1195830 (=> (not res!795766) (not e!679488))))

(declare-datatypes ((List!26288 0))(
  ( (Nil!26285) (Cons!26284 (h!27493 (_ BitVec 64)) (t!38959 List!26288)) )
))
(declare-fun arrayNoDuplicates!0 (array!77423 (_ BitVec 32) List!26288) Bool)

(assert (=> b!1195830 (= res!795766 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26285))))

(declare-fun res!795758 () Bool)

(assert (=> start!100254 (=> (not res!795758) (not e!679488))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100254 (= res!795758 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37894 _keys!1208))))))

(assert (=> start!100254 e!679488))

(declare-fun array_inv!28476 (array!77423) Bool)

(assert (=> start!100254 (array_inv!28476 _keys!1208)))

(assert (=> start!100254 true))

(declare-datatypes ((V!45555 0))(
  ( (V!45556 (val!15217 Int)) )
))
(declare-datatypes ((ValueCell!14451 0))(
  ( (ValueCellFull!14451 (v!17855 V!45555)) (EmptyCell!14451) )
))
(declare-datatypes ((array!77425 0))(
  ( (array!77426 (arr!37359 (Array (_ BitVec 32) ValueCell!14451)) (size!37895 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77425)

(declare-fun e!679484 () Bool)

(declare-fun array_inv!28477 (array!77425) Bool)

(assert (=> start!100254 (and (array_inv!28477 _values!996) e!679484)))

(declare-fun b!1195831 () Bool)

(declare-fun e!679489 () Bool)

(declare-fun tp_is_empty!30321 () Bool)

(assert (=> b!1195831 (= e!679489 tp_is_empty!30321)))

(declare-fun b!1195832 () Bool)

(declare-fun res!795763 () Bool)

(assert (=> b!1195832 (=> (not res!795763) (not e!679488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195832 (= res!795763 (validKeyInArray!0 k0!934))))

(declare-fun b!1195833 () Bool)

(assert (=> b!1195833 (= e!679488 e!679487)))

(declare-fun res!795762 () Bool)

(assert (=> b!1195833 (=> (not res!795762) (not e!679487))))

(declare-fun lt!542988 () array!77423)

(assert (=> b!1195833 (= res!795762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542988 mask!1564))))

(assert (=> b!1195833 (= lt!542988 (array!77424 (store (arr!37358 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37894 _keys!1208)))))

(declare-fun mapIsEmpty!47318 () Bool)

(declare-fun mapRes!47318 () Bool)

(assert (=> mapIsEmpty!47318 mapRes!47318))

(declare-fun b!1195834 () Bool)

(declare-fun e!679485 () Bool)

(assert (=> b!1195834 (= e!679485 tp_is_empty!30321)))

(declare-fun b!1195835 () Bool)

(declare-fun res!795757 () Bool)

(assert (=> b!1195835 (=> (not res!795757) (not e!679488))))

(assert (=> b!1195835 (= res!795757 (= (select (arr!37358 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47318 () Bool)

(declare-fun tp!89928 () Bool)

(assert (=> mapNonEmpty!47318 (= mapRes!47318 (and tp!89928 e!679489))))

(declare-fun mapValue!47318 () ValueCell!14451)

(declare-fun mapRest!47318 () (Array (_ BitVec 32) ValueCell!14451))

(declare-fun mapKey!47318 () (_ BitVec 32))

(assert (=> mapNonEmpty!47318 (= (arr!37359 _values!996) (store mapRest!47318 mapKey!47318 mapValue!47318))))

(declare-fun b!1195836 () Bool)

(assert (=> b!1195836 (= e!679484 (and e!679485 mapRes!47318))))

(declare-fun condMapEmpty!47318 () Bool)

(declare-fun mapDefault!47318 () ValueCell!14451)

(assert (=> b!1195836 (= condMapEmpty!47318 (= (arr!37359 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14451)) mapDefault!47318)))))

(declare-fun b!1195837 () Bool)

(declare-fun res!795765 () Bool)

(assert (=> b!1195837 (=> (not res!795765) (not e!679487))))

(assert (=> b!1195837 (= res!795765 (arrayNoDuplicates!0 lt!542988 #b00000000000000000000000000000000 Nil!26285))))

(declare-fun b!1195838 () Bool)

(declare-fun res!795764 () Bool)

(assert (=> b!1195838 (=> (not res!795764) (not e!679488))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195838 (= res!795764 (and (= (size!37895 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37894 _keys!1208) (size!37895 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195839 () Bool)

(declare-fun res!795761 () Bool)

(assert (=> b!1195839 (=> (not res!795761) (not e!679488))))

(assert (=> b!1195839 (= res!795761 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37894 _keys!1208))))))

(assert (= (and start!100254 res!795758) b!1195828))

(assert (= (and b!1195828 res!795760) b!1195838))

(assert (= (and b!1195838 res!795764) b!1195829))

(assert (= (and b!1195829 res!795759) b!1195830))

(assert (= (and b!1195830 res!795766) b!1195839))

(assert (= (and b!1195839 res!795761) b!1195832))

(assert (= (and b!1195832 res!795763) b!1195835))

(assert (= (and b!1195835 res!795757) b!1195833))

(assert (= (and b!1195833 res!795762) b!1195837))

(assert (= (and b!1195837 res!795765) b!1195827))

(assert (= (and b!1195836 condMapEmpty!47318) mapIsEmpty!47318))

(assert (= (and b!1195836 (not condMapEmpty!47318)) mapNonEmpty!47318))

(get-info :version)

(assert (= (and mapNonEmpty!47318 ((_ is ValueCellFull!14451) mapValue!47318)) b!1195831))

(assert (= (and b!1195836 ((_ is ValueCellFull!14451) mapDefault!47318)) b!1195834))

(assert (= start!100254 b!1195836))

(declare-fun m!1103267 () Bool)

(assert (=> b!1195833 m!1103267))

(declare-fun m!1103269 () Bool)

(assert (=> b!1195833 m!1103269))

(declare-fun m!1103271 () Bool)

(assert (=> b!1195830 m!1103271))

(declare-fun m!1103273 () Bool)

(assert (=> b!1195828 m!1103273))

(declare-fun m!1103275 () Bool)

(assert (=> b!1195835 m!1103275))

(declare-fun m!1103277 () Bool)

(assert (=> start!100254 m!1103277))

(declare-fun m!1103279 () Bool)

(assert (=> start!100254 m!1103279))

(declare-fun m!1103281 () Bool)

(assert (=> b!1195829 m!1103281))

(declare-fun m!1103283 () Bool)

(assert (=> b!1195827 m!1103283))

(declare-fun m!1103285 () Bool)

(assert (=> b!1195827 m!1103285))

(declare-fun m!1103287 () Bool)

(assert (=> b!1195837 m!1103287))

(declare-fun m!1103289 () Bool)

(assert (=> mapNonEmpty!47318 m!1103289))

(declare-fun m!1103291 () Bool)

(assert (=> b!1195832 m!1103291))

(check-sat (not b!1195832) (not start!100254) (not b!1195830) (not b!1195829) (not b!1195828) (not b!1195827) (not mapNonEmpty!47318) tp_is_empty!30321 (not b!1195837) (not b!1195833))
(check-sat)
