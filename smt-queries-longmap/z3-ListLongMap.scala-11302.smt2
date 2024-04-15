; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131666 () Bool)

(assert start!131666)

(declare-fun b!1542086 () Bool)

(declare-fun e!857898 () Bool)

(assert (=> b!1542086 (= e!857898 false)))

(declare-fun lt!665524 () Bool)

(declare-datatypes ((array!102580 0))(
  ( (array!102581 (arr!49493 (Array (_ BitVec 32) (_ BitVec 64))) (size!50045 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102580)

(declare-datatypes ((List!35925 0))(
  ( (Nil!35922) (Cons!35921 (h!37367 (_ BitVec 64)) (t!50611 List!35925)) )
))
(declare-fun arrayNoDuplicates!0 (array!102580 (_ BitVec 32) List!35925) Bool)

(assert (=> b!1542086 (= lt!665524 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35922))))

(declare-fun b!1542087 () Bool)

(declare-fun res!1058346 () Bool)

(assert (=> b!1542087 (=> (not res!1058346) (not e!857898))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58717 0))(
  ( (V!58718 (val!18930 Int)) )
))
(declare-datatypes ((ValueCell!17942 0))(
  ( (ValueCellFull!17942 (v!21727 V!58717)) (EmptyCell!17942) )
))
(declare-datatypes ((array!102582 0))(
  ( (array!102583 (arr!49494 (Array (_ BitVec 32) ValueCell!17942)) (size!50046 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102582)

(assert (=> b!1542087 (= res!1058346 (and (= (size!50046 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50045 _keys!618) (size!50046 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58261 () Bool)

(declare-fun mapRes!58261 () Bool)

(declare-fun tp!110789 () Bool)

(declare-fun e!857901 () Bool)

(assert (=> mapNonEmpty!58261 (= mapRes!58261 (and tp!110789 e!857901))))

(declare-fun mapValue!58261 () ValueCell!17942)

(declare-fun mapRest!58261 () (Array (_ BitVec 32) ValueCell!17942))

(declare-fun mapKey!58261 () (_ BitVec 32))

(assert (=> mapNonEmpty!58261 (= (arr!49494 _values!470) (store mapRest!58261 mapKey!58261 mapValue!58261))))

(declare-fun b!1542088 () Bool)

(declare-fun e!857899 () Bool)

(declare-fun e!857900 () Bool)

(assert (=> b!1542088 (= e!857899 (and e!857900 mapRes!58261))))

(declare-fun condMapEmpty!58261 () Bool)

(declare-fun mapDefault!58261 () ValueCell!17942)

(assert (=> b!1542088 (= condMapEmpty!58261 (= (arr!49494 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17942)) mapDefault!58261)))))

(declare-fun mapIsEmpty!58261 () Bool)

(assert (=> mapIsEmpty!58261 mapRes!58261))

(declare-fun b!1542089 () Bool)

(declare-fun res!1058344 () Bool)

(assert (=> b!1542089 (=> (not res!1058344) (not e!857898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102580 (_ BitVec 32)) Bool)

(assert (=> b!1542089 (= res!1058344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542090 () Bool)

(declare-fun tp_is_empty!37705 () Bool)

(assert (=> b!1542090 (= e!857901 tp_is_empty!37705)))

(declare-fun res!1058345 () Bool)

(assert (=> start!131666 (=> (not res!1058345) (not e!857898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131666 (= res!1058345 (validMask!0 mask!926))))

(assert (=> start!131666 e!857898))

(assert (=> start!131666 true))

(declare-fun array_inv!38703 (array!102582) Bool)

(assert (=> start!131666 (and (array_inv!38703 _values!470) e!857899)))

(declare-fun array_inv!38704 (array!102580) Bool)

(assert (=> start!131666 (array_inv!38704 _keys!618)))

(declare-fun b!1542091 () Bool)

(assert (=> b!1542091 (= e!857900 tp_is_empty!37705)))

(assert (= (and start!131666 res!1058345) b!1542087))

(assert (= (and b!1542087 res!1058346) b!1542089))

(assert (= (and b!1542089 res!1058344) b!1542086))

(assert (= (and b!1542088 condMapEmpty!58261) mapIsEmpty!58261))

(assert (= (and b!1542088 (not condMapEmpty!58261)) mapNonEmpty!58261))

(get-info :version)

(assert (= (and mapNonEmpty!58261 ((_ is ValueCellFull!17942) mapValue!58261)) b!1542090))

(assert (= (and b!1542088 ((_ is ValueCellFull!17942) mapDefault!58261)) b!1542091))

(assert (= start!131666 b!1542088))

(declare-fun m!1423161 () Bool)

(assert (=> b!1542086 m!1423161))

(declare-fun m!1423163 () Bool)

(assert (=> mapNonEmpty!58261 m!1423163))

(declare-fun m!1423165 () Bool)

(assert (=> b!1542089 m!1423165))

(declare-fun m!1423167 () Bool)

(assert (=> start!131666 m!1423167))

(declare-fun m!1423169 () Bool)

(assert (=> start!131666 m!1423169))

(declare-fun m!1423171 () Bool)

(assert (=> start!131666 m!1423171))

(check-sat (not mapNonEmpty!58261) (not start!131666) (not b!1542086) tp_is_empty!37705 (not b!1542089))
(check-sat)
