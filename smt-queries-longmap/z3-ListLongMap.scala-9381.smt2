; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111946 () Bool)

(assert start!111946)

(declare-fun b_free!30379 () Bool)

(declare-fun b_next!30379 () Bool)

(assert (=> start!111946 (= b_free!30379 (not b_next!30379))))

(declare-fun tp!106612 () Bool)

(declare-fun b_and!48919 () Bool)

(assert (=> start!111946 (= tp!106612 b_and!48919)))

(declare-fun b!1325143 () Bool)

(declare-fun res!879239 () Bool)

(declare-fun e!755525 () Bool)

(assert (=> b!1325143 (=> (not res!879239) (not e!755525))))

(declare-datatypes ((array!89403 0))(
  ( (array!89404 (arr!43171 (Array (_ BitVec 32) (_ BitVec 64))) (size!43722 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89403)

(declare-datatypes ((List!30622 0))(
  ( (Nil!30619) (Cons!30618 (h!31836 (_ BitVec 64)) (t!44540 List!30622)) )
))
(declare-fun arrayNoDuplicates!0 (array!89403 (_ BitVec 32) List!30622) Bool)

(assert (=> b!1325143 (= res!879239 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30619))))

(declare-fun b!1325144 () Bool)

(declare-fun e!755527 () Bool)

(declare-fun e!755524 () Bool)

(declare-fun mapRes!55946 () Bool)

(assert (=> b!1325144 (= e!755527 (and e!755524 mapRes!55946))))

(declare-fun condMapEmpty!55946 () Bool)

(declare-datatypes ((V!53369 0))(
  ( (V!53370 (val!18174 Int)) )
))
(declare-datatypes ((ValueCell!17201 0))(
  ( (ValueCellFull!17201 (v!20799 V!53369)) (EmptyCell!17201) )
))
(declare-datatypes ((array!89405 0))(
  ( (array!89406 (arr!43172 (Array (_ BitVec 32) ValueCell!17201)) (size!43723 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89405)

(declare-fun mapDefault!55946 () ValueCell!17201)

(assert (=> b!1325144 (= condMapEmpty!55946 (= (arr!43172 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17201)) mapDefault!55946)))))

(declare-fun mapIsEmpty!55946 () Bool)

(assert (=> mapIsEmpty!55946 mapRes!55946))

(declare-fun b!1325145 () Bool)

(declare-fun res!879240 () Bool)

(assert (=> b!1325145 (=> (not res!879240) (not e!755525))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89403 (_ BitVec 32)) Bool)

(assert (=> b!1325145 (= res!879240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325146 () Bool)

(declare-fun res!879241 () Bool)

(assert (=> b!1325146 (=> (not res!879241) (not e!755525))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1325146 (= res!879241 (and (= (size!43723 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43722 _keys!1609) (size!43723 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325147 () Bool)

(declare-fun res!879238 () Bool)

(assert (=> b!1325147 (=> (not res!879238) (not e!755525))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325147 (= res!879238 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43722 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!879237 () Bool)

(assert (=> start!111946 (=> (not res!879237) (not e!755525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111946 (= res!879237 (validMask!0 mask!2019))))

(assert (=> start!111946 e!755525))

(declare-fun array_inv!32865 (array!89403) Bool)

(assert (=> start!111946 (array_inv!32865 _keys!1609)))

(assert (=> start!111946 true))

(declare-fun tp_is_empty!36199 () Bool)

(assert (=> start!111946 tp_is_empty!36199))

(declare-fun array_inv!32866 (array!89405) Bool)

(assert (=> start!111946 (and (array_inv!32866 _values!1337) e!755527)))

(assert (=> start!111946 tp!106612))

(declare-fun b!1325148 () Bool)

(declare-fun e!755523 () Bool)

(assert (=> b!1325148 (= e!755523 tp_is_empty!36199)))

(declare-fun mapNonEmpty!55946 () Bool)

(declare-fun tp!106613 () Bool)

(assert (=> mapNonEmpty!55946 (= mapRes!55946 (and tp!106613 e!755523))))

(declare-fun mapRest!55946 () (Array (_ BitVec 32) ValueCell!17201))

(declare-fun mapKey!55946 () (_ BitVec 32))

(declare-fun mapValue!55946 () ValueCell!17201)

(assert (=> mapNonEmpty!55946 (= (arr!43172 _values!1337) (store mapRest!55946 mapKey!55946 mapValue!55946))))

(declare-fun b!1325149 () Bool)

(assert (=> b!1325149 (= e!755525 false)))

(declare-fun lt!589877 () Bool)

(declare-fun zeroValue!1279 () V!53369)

(declare-fun minValue!1279 () V!53369)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23472 0))(
  ( (tuple2!23473 (_1!11747 (_ BitVec 64)) (_2!11747 V!53369)) )
))
(declare-datatypes ((List!30623 0))(
  ( (Nil!30620) (Cons!30619 (h!31837 tuple2!23472) (t!44541 List!30623)) )
))
(declare-datatypes ((ListLongMap!21137 0))(
  ( (ListLongMap!21138 (toList!10584 List!30623)) )
))
(declare-fun contains!8751 (ListLongMap!21137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5567 (array!89403 array!89405 (_ BitVec 32) (_ BitVec 32) V!53369 V!53369 (_ BitVec 32) Int) ListLongMap!21137)

(assert (=> b!1325149 (= lt!589877 (contains!8751 (getCurrentListMap!5567 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325150 () Bool)

(assert (=> b!1325150 (= e!755524 tp_is_empty!36199)))

(assert (= (and start!111946 res!879237) b!1325146))

(assert (= (and b!1325146 res!879241) b!1325145))

(assert (= (and b!1325145 res!879240) b!1325143))

(assert (= (and b!1325143 res!879239) b!1325147))

(assert (= (and b!1325147 res!879238) b!1325149))

(assert (= (and b!1325144 condMapEmpty!55946) mapIsEmpty!55946))

(assert (= (and b!1325144 (not condMapEmpty!55946)) mapNonEmpty!55946))

(get-info :version)

(assert (= (and mapNonEmpty!55946 ((_ is ValueCellFull!17201) mapValue!55946)) b!1325148))

(assert (= (and b!1325144 ((_ is ValueCellFull!17201) mapDefault!55946)) b!1325150))

(assert (= start!111946 b!1325144))

(declare-fun m!1214501 () Bool)

(assert (=> b!1325149 m!1214501))

(assert (=> b!1325149 m!1214501))

(declare-fun m!1214503 () Bool)

(assert (=> b!1325149 m!1214503))

(declare-fun m!1214505 () Bool)

(assert (=> start!111946 m!1214505))

(declare-fun m!1214507 () Bool)

(assert (=> start!111946 m!1214507))

(declare-fun m!1214509 () Bool)

(assert (=> start!111946 m!1214509))

(declare-fun m!1214511 () Bool)

(assert (=> mapNonEmpty!55946 m!1214511))

(declare-fun m!1214513 () Bool)

(assert (=> b!1325143 m!1214513))

(declare-fun m!1214515 () Bool)

(assert (=> b!1325145 m!1214515))

(check-sat (not b_next!30379) (not b!1325143) (not mapNonEmpty!55946) tp_is_empty!36199 b_and!48919 (not start!111946) (not b!1325149) (not b!1325145))
(check-sat b_and!48919 (not b_next!30379))
