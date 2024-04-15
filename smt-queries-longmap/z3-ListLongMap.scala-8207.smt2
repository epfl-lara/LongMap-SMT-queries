; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100102 () Bool)

(assert start!100102)

(declare-fun b!1193663 () Bool)

(declare-fun res!794193 () Bool)

(declare-fun e!678383 () Bool)

(assert (=> b!1193663 (=> (not res!794193) (not e!678383))))

(declare-datatypes ((array!77150 0))(
  ( (array!77151 (arr!37225 (Array (_ BitVec 32) (_ BitVec 64))) (size!37763 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77150)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77150 (_ BitVec 32)) Bool)

(assert (=> b!1193663 (= res!794193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47153 () Bool)

(declare-fun mapRes!47153 () Bool)

(declare-fun tp!89763 () Bool)

(declare-fun e!678382 () Bool)

(assert (=> mapNonEmpty!47153 (= mapRes!47153 (and tp!89763 e!678382))))

(declare-fun mapKey!47153 () (_ BitVec 32))

(declare-datatypes ((V!45417 0))(
  ( (V!45418 (val!15165 Int)) )
))
(declare-datatypes ((ValueCell!14399 0))(
  ( (ValueCellFull!14399 (v!17802 V!45417)) (EmptyCell!14399) )
))
(declare-fun mapValue!47153 () ValueCell!14399)

(declare-datatypes ((array!77152 0))(
  ( (array!77153 (arr!37226 (Array (_ BitVec 32) ValueCell!14399)) (size!37764 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77152)

(declare-fun mapRest!47153 () (Array (_ BitVec 32) ValueCell!14399))

(assert (=> mapNonEmpty!47153 (= (arr!37226 _values!996) (store mapRest!47153 mapKey!47153 mapValue!47153))))

(declare-fun b!1193664 () Bool)

(declare-fun res!794194 () Bool)

(assert (=> b!1193664 (=> (not res!794194) (not e!678383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193664 (= res!794194 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47153 () Bool)

(assert (=> mapIsEmpty!47153 mapRes!47153))

(declare-fun res!794192 () Bool)

(assert (=> start!100102 (=> (not res!794192) (not e!678383))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100102 (= res!794192 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37763 _keys!1208))))))

(assert (=> start!100102 e!678383))

(declare-fun array_inv!28500 (array!77150) Bool)

(assert (=> start!100102 (array_inv!28500 _keys!1208)))

(assert (=> start!100102 true))

(declare-fun e!678381 () Bool)

(declare-fun array_inv!28501 (array!77152) Bool)

(assert (=> start!100102 (and (array_inv!28501 _values!996) e!678381)))

(declare-fun b!1193665 () Bool)

(declare-fun res!794191 () Bool)

(assert (=> b!1193665 (=> (not res!794191) (not e!678383))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193665 (= res!794191 (and (= (size!37764 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37763 _keys!1208) (size!37764 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193666 () Bool)

(declare-fun tp_is_empty!30217 () Bool)

(assert (=> b!1193666 (= e!678382 tp_is_empty!30217)))

(declare-fun b!1193667 () Bool)

(declare-fun e!678385 () Bool)

(assert (=> b!1193667 (= e!678385 tp_is_empty!30217)))

(declare-fun b!1193668 () Bool)

(assert (=> b!1193668 (= e!678383 false)))

(declare-fun lt!542487 () Bool)

(declare-datatypes ((List!26322 0))(
  ( (Nil!26319) (Cons!26318 (h!27527 (_ BitVec 64)) (t!38984 List!26322)) )
))
(declare-fun arrayNoDuplicates!0 (array!77150 (_ BitVec 32) List!26322) Bool)

(assert (=> b!1193668 (= lt!542487 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26319))))

(declare-fun b!1193669 () Bool)

(assert (=> b!1193669 (= e!678381 (and e!678385 mapRes!47153))))

(declare-fun condMapEmpty!47153 () Bool)

(declare-fun mapDefault!47153 () ValueCell!14399)

(assert (=> b!1193669 (= condMapEmpty!47153 (= (arr!37226 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14399)) mapDefault!47153)))))

(assert (= (and start!100102 res!794192) b!1193664))

(assert (= (and b!1193664 res!794194) b!1193665))

(assert (= (and b!1193665 res!794191) b!1193663))

(assert (= (and b!1193663 res!794193) b!1193668))

(assert (= (and b!1193669 condMapEmpty!47153) mapIsEmpty!47153))

(assert (= (and b!1193669 (not condMapEmpty!47153)) mapNonEmpty!47153))

(get-info :version)

(assert (= (and mapNonEmpty!47153 ((_ is ValueCellFull!14399) mapValue!47153)) b!1193666))

(assert (= (and b!1193669 ((_ is ValueCellFull!14399) mapDefault!47153)) b!1193667))

(assert (= start!100102 b!1193669))

(declare-fun m!1101353 () Bool)

(assert (=> b!1193663 m!1101353))

(declare-fun m!1101355 () Bool)

(assert (=> start!100102 m!1101355))

(declare-fun m!1101357 () Bool)

(assert (=> start!100102 m!1101357))

(declare-fun m!1101359 () Bool)

(assert (=> b!1193668 m!1101359))

(declare-fun m!1101361 () Bool)

(assert (=> b!1193664 m!1101361))

(declare-fun m!1101363 () Bool)

(assert (=> mapNonEmpty!47153 m!1101363))

(check-sat (not mapNonEmpty!47153) (not b!1193668) (not b!1193664) (not b!1193663) (not start!100102) tp_is_empty!30217)
(check-sat)
