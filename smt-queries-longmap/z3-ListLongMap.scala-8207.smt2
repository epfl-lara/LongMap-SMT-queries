; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100344 () Bool)

(assert start!100344)

(declare-fun mapNonEmpty!47153 () Bool)

(declare-fun mapRes!47153 () Bool)

(declare-fun tp!89763 () Bool)

(declare-fun e!679295 () Bool)

(assert (=> mapNonEmpty!47153 (= mapRes!47153 (and tp!89763 e!679295))))

(declare-datatypes ((V!45417 0))(
  ( (V!45418 (val!15165 Int)) )
))
(declare-datatypes ((ValueCell!14399 0))(
  ( (ValueCellFull!14399 (v!17799 V!45417)) (EmptyCell!14399) )
))
(declare-datatypes ((array!77255 0))(
  ( (array!77256 (arr!37271 (Array (_ BitVec 32) ValueCell!14399)) (size!37808 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77255)

(declare-fun mapRest!47153 () (Array (_ BitVec 32) ValueCell!14399))

(declare-fun mapKey!47153 () (_ BitVec 32))

(declare-fun mapValue!47153 () ValueCell!14399)

(assert (=> mapNonEmpty!47153 (= (arr!37271 _values!996) (store mapRest!47153 mapKey!47153 mapValue!47153))))

(declare-fun b!1195076 () Bool)

(declare-fun res!794767 () Bool)

(declare-fun e!679291 () Bool)

(assert (=> b!1195076 (=> (not res!794767) (not e!679291))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195076 (= res!794767 (validMask!0 mask!1564))))

(declare-fun b!1195077 () Bool)

(declare-fun res!794766 () Bool)

(assert (=> b!1195077 (=> (not res!794766) (not e!679291))))

(declare-datatypes ((array!77257 0))(
  ( (array!77258 (arr!37272 (Array (_ BitVec 32) (_ BitVec 64))) (size!37809 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77257)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195077 (= res!794766 (and (= (size!37808 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37809 _keys!1208) (size!37808 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47153 () Bool)

(assert (=> mapIsEmpty!47153 mapRes!47153))

(declare-fun b!1195078 () Bool)

(declare-fun e!679294 () Bool)

(declare-fun e!679292 () Bool)

(assert (=> b!1195078 (= e!679294 (and e!679292 mapRes!47153))))

(declare-fun condMapEmpty!47153 () Bool)

(declare-fun mapDefault!47153 () ValueCell!14399)

(assert (=> b!1195078 (= condMapEmpty!47153 (= (arr!37271 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14399)) mapDefault!47153)))))

(declare-fun res!794765 () Bool)

(assert (=> start!100344 (=> (not res!794765) (not e!679291))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100344 (= res!794765 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37809 _keys!1208))))))

(assert (=> start!100344 e!679291))

(declare-fun array_inv!28480 (array!77257) Bool)

(assert (=> start!100344 (array_inv!28480 _keys!1208)))

(assert (=> start!100344 true))

(declare-fun array_inv!28481 (array!77255) Bool)

(assert (=> start!100344 (and (array_inv!28481 _values!996) e!679294)))

(declare-fun b!1195079 () Bool)

(declare-fun res!794768 () Bool)

(assert (=> b!1195079 (=> (not res!794768) (not e!679291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77257 (_ BitVec 32)) Bool)

(assert (=> b!1195079 (= res!794768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195080 () Bool)

(assert (=> b!1195080 (= e!679291 false)))

(declare-fun lt!543163 () Bool)

(declare-datatypes ((List!26276 0))(
  ( (Nil!26273) (Cons!26272 (h!27490 (_ BitVec 64)) (t!38939 List!26276)) )
))
(declare-fun arrayNoDuplicates!0 (array!77257 (_ BitVec 32) List!26276) Bool)

(assert (=> b!1195080 (= lt!543163 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26273))))

(declare-fun b!1195081 () Bool)

(declare-fun tp_is_empty!30217 () Bool)

(assert (=> b!1195081 (= e!679292 tp_is_empty!30217)))

(declare-fun b!1195082 () Bool)

(assert (=> b!1195082 (= e!679295 tp_is_empty!30217)))

(assert (= (and start!100344 res!794765) b!1195076))

(assert (= (and b!1195076 res!794767) b!1195077))

(assert (= (and b!1195077 res!794766) b!1195079))

(assert (= (and b!1195079 res!794768) b!1195080))

(assert (= (and b!1195078 condMapEmpty!47153) mapIsEmpty!47153))

(assert (= (and b!1195078 (not condMapEmpty!47153)) mapNonEmpty!47153))

(get-info :version)

(assert (= (and mapNonEmpty!47153 ((_ is ValueCellFull!14399) mapValue!47153)) b!1195082))

(assert (= (and b!1195078 ((_ is ValueCellFull!14399) mapDefault!47153)) b!1195081))

(assert (= start!100344 b!1195078))

(declare-fun m!1103535 () Bool)

(assert (=> mapNonEmpty!47153 m!1103535))

(declare-fun m!1103537 () Bool)

(assert (=> b!1195076 m!1103537))

(declare-fun m!1103539 () Bool)

(assert (=> b!1195079 m!1103539))

(declare-fun m!1103541 () Bool)

(assert (=> b!1195080 m!1103541))

(declare-fun m!1103543 () Bool)

(assert (=> start!100344 m!1103543))

(declare-fun m!1103545 () Bool)

(assert (=> start!100344 m!1103545))

(check-sat (not b!1195076) tp_is_empty!30217 (not b!1195079) (not start!100344) (not b!1195080) (not mapNonEmpty!47153))
(check-sat)
