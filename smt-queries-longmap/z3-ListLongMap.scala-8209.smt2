; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100356 () Bool)

(assert start!100356)

(declare-fun b!1195210 () Bool)

(declare-fun res!794845 () Bool)

(declare-fun e!679383 () Bool)

(assert (=> b!1195210 (=> (not res!794845) (not e!679383))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195210 (= res!794845 (validMask!0 mask!1564))))

(declare-fun b!1195211 () Bool)

(assert (=> b!1195211 (= e!679383 false)))

(declare-datatypes ((array!77277 0))(
  ( (array!77278 (arr!37282 (Array (_ BitVec 32) (_ BitVec 64))) (size!37819 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77277)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!543181 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77277 (_ BitVec 32)) Bool)

(assert (=> b!1195211 (= lt!543181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!77278 (store (arr!37282 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37819 _keys!1208)) mask!1564))))

(declare-fun mapNonEmpty!47171 () Bool)

(declare-fun mapRes!47171 () Bool)

(declare-fun tp!89781 () Bool)

(declare-fun e!679385 () Bool)

(assert (=> mapNonEmpty!47171 (= mapRes!47171 (and tp!89781 e!679385))))

(declare-datatypes ((V!45433 0))(
  ( (V!45434 (val!15171 Int)) )
))
(declare-datatypes ((ValueCell!14405 0))(
  ( (ValueCellFull!14405 (v!17805 V!45433)) (EmptyCell!14405) )
))
(declare-fun mapValue!47171 () ValueCell!14405)

(declare-fun mapKey!47171 () (_ BitVec 32))

(declare-datatypes ((array!77279 0))(
  ( (array!77280 (arr!37283 (Array (_ BitVec 32) ValueCell!14405)) (size!37820 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77279)

(declare-fun mapRest!47171 () (Array (_ BitVec 32) ValueCell!14405))

(assert (=> mapNonEmpty!47171 (= (arr!37283 _values!996) (store mapRest!47171 mapKey!47171 mapValue!47171))))

(declare-fun b!1195212 () Bool)

(declare-fun res!794849 () Bool)

(assert (=> b!1195212 (=> (not res!794849) (not e!679383))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195212 (= res!794849 (= (select (arr!37282 _keys!1208) i!673) k0!934))))

(declare-fun b!1195213 () Bool)

(declare-fun e!679382 () Bool)

(declare-fun e!679381 () Bool)

(assert (=> b!1195213 (= e!679382 (and e!679381 mapRes!47171))))

(declare-fun condMapEmpty!47171 () Bool)

(declare-fun mapDefault!47171 () ValueCell!14405)

(assert (=> b!1195213 (= condMapEmpty!47171 (= (arr!37283 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14405)) mapDefault!47171)))))

(declare-fun mapIsEmpty!47171 () Bool)

(assert (=> mapIsEmpty!47171 mapRes!47171))

(declare-fun b!1195214 () Bool)

(declare-fun res!794848 () Bool)

(assert (=> b!1195214 (=> (not res!794848) (not e!679383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195214 (= res!794848 (validKeyInArray!0 k0!934))))

(declare-fun b!1195215 () Bool)

(declare-fun res!794850 () Bool)

(assert (=> b!1195215 (=> (not res!794850) (not e!679383))))

(assert (=> b!1195215 (= res!794850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195216 () Bool)

(declare-fun res!794852 () Bool)

(assert (=> b!1195216 (=> (not res!794852) (not e!679383))))

(declare-datatypes ((List!26280 0))(
  ( (Nil!26277) (Cons!26276 (h!27494 (_ BitVec 64)) (t!38943 List!26280)) )
))
(declare-fun arrayNoDuplicates!0 (array!77277 (_ BitVec 32) List!26280) Bool)

(assert (=> b!1195216 (= res!794852 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26277))))

(declare-fun res!794847 () Bool)

(assert (=> start!100356 (=> (not res!794847) (not e!679383))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100356 (= res!794847 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37819 _keys!1208))))))

(assert (=> start!100356 e!679383))

(declare-fun array_inv!28488 (array!77277) Bool)

(assert (=> start!100356 (array_inv!28488 _keys!1208)))

(assert (=> start!100356 true))

(declare-fun array_inv!28489 (array!77279) Bool)

(assert (=> start!100356 (and (array_inv!28489 _values!996) e!679382)))

(declare-fun b!1195217 () Bool)

(declare-fun tp_is_empty!30229 () Bool)

(assert (=> b!1195217 (= e!679381 tp_is_empty!30229)))

(declare-fun b!1195218 () Bool)

(declare-fun res!794846 () Bool)

(assert (=> b!1195218 (=> (not res!794846) (not e!679383))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195218 (= res!794846 (and (= (size!37820 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37819 _keys!1208) (size!37820 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195219 () Bool)

(assert (=> b!1195219 (= e!679385 tp_is_empty!30229)))

(declare-fun b!1195220 () Bool)

(declare-fun res!794851 () Bool)

(assert (=> b!1195220 (=> (not res!794851) (not e!679383))))

(assert (=> b!1195220 (= res!794851 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37819 _keys!1208))))))

(assert (= (and start!100356 res!794847) b!1195210))

(assert (= (and b!1195210 res!794845) b!1195218))

(assert (= (and b!1195218 res!794846) b!1195215))

(assert (= (and b!1195215 res!794850) b!1195216))

(assert (= (and b!1195216 res!794852) b!1195220))

(assert (= (and b!1195220 res!794851) b!1195214))

(assert (= (and b!1195214 res!794848) b!1195212))

(assert (= (and b!1195212 res!794849) b!1195211))

(assert (= (and b!1195213 condMapEmpty!47171) mapIsEmpty!47171))

(assert (= (and b!1195213 (not condMapEmpty!47171)) mapNonEmpty!47171))

(get-info :version)

(assert (= (and mapNonEmpty!47171 ((_ is ValueCellFull!14405) mapValue!47171)) b!1195219))

(assert (= (and b!1195213 ((_ is ValueCellFull!14405) mapDefault!47171)) b!1195217))

(assert (= start!100356 b!1195213))

(declare-fun m!1103607 () Bool)

(assert (=> b!1195212 m!1103607))

(declare-fun m!1103609 () Bool)

(assert (=> b!1195214 m!1103609))

(declare-fun m!1103611 () Bool)

(assert (=> mapNonEmpty!47171 m!1103611))

(declare-fun m!1103613 () Bool)

(assert (=> b!1195211 m!1103613))

(declare-fun m!1103615 () Bool)

(assert (=> b!1195211 m!1103615))

(declare-fun m!1103617 () Bool)

(assert (=> start!100356 m!1103617))

(declare-fun m!1103619 () Bool)

(assert (=> start!100356 m!1103619))

(declare-fun m!1103621 () Bool)

(assert (=> b!1195215 m!1103621))

(declare-fun m!1103623 () Bool)

(assert (=> b!1195210 m!1103623))

(declare-fun m!1103625 () Bool)

(assert (=> b!1195216 m!1103625))

(check-sat tp_is_empty!30229 (not b!1195210) (not mapNonEmpty!47171) (not b!1195216) (not b!1195215) (not start!100356) (not b!1195214) (not b!1195211))
(check-sat)
