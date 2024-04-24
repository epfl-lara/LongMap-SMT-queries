; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132098 () Bool)

(assert start!132098)

(declare-fun b!1544565 () Bool)

(declare-fun e!859382 () Bool)

(declare-fun tp_is_empty!37675 () Bool)

(assert (=> b!1544565 (= e!859382 tp_is_empty!37675)))

(declare-fun mapIsEmpty!58216 () Bool)

(declare-fun mapRes!58216 () Bool)

(assert (=> mapIsEmpty!58216 mapRes!58216))

(declare-fun res!1059198 () Bool)

(declare-fun e!859381 () Bool)

(assert (=> start!132098 (=> (not res!1059198) (not e!859381))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132098 (= res!1059198 (validMask!0 mask!926))))

(assert (=> start!132098 e!859381))

(assert (=> start!132098 true))

(declare-datatypes ((V!58677 0))(
  ( (V!58678 (val!18915 Int)) )
))
(declare-datatypes ((ValueCell!17927 0))(
  ( (ValueCellFull!17927 (v!21708 V!58677)) (EmptyCell!17927) )
))
(declare-datatypes ((array!102708 0))(
  ( (array!102709 (arr!49549 (Array (_ BitVec 32) ValueCell!17927)) (size!50100 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102708)

(declare-fun e!859379 () Bool)

(declare-fun array_inv!38813 (array!102708) Bool)

(assert (=> start!132098 (and (array_inv!38813 _values!470) e!859379)))

(declare-datatypes ((array!102710 0))(
  ( (array!102711 (arr!49550 (Array (_ BitVec 32) (_ BitVec 64))) (size!50101 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102710)

(declare-fun array_inv!38814 (array!102710) Bool)

(assert (=> start!132098 (array_inv!38814 _keys!618)))

(declare-fun b!1544566 () Bool)

(declare-fun res!1059200 () Bool)

(assert (=> b!1544566 (=> (not res!1059200) (not e!859381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102710 (_ BitVec 32)) Bool)

(assert (=> b!1544566 (= res!1059200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544567 () Bool)

(declare-fun e!859380 () Bool)

(assert (=> b!1544567 (= e!859380 tp_is_empty!37675)))

(declare-fun b!1544568 () Bool)

(assert (=> b!1544568 (= e!859381 false)))

(declare-fun lt!666673 () Bool)

(declare-datatypes ((List!35906 0))(
  ( (Nil!35903) (Cons!35902 (h!37365 (_ BitVec 64)) (t!50592 List!35906)) )
))
(declare-fun arrayNoDuplicates!0 (array!102710 (_ BitVec 32) List!35906) Bool)

(assert (=> b!1544568 (= lt!666673 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35903))))

(declare-fun b!1544569 () Bool)

(declare-fun res!1059199 () Bool)

(assert (=> b!1544569 (=> (not res!1059199) (not e!859381))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544569 (= res!1059199 (and (= (size!50100 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50101 _keys!618) (size!50100 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544570 () Bool)

(assert (=> b!1544570 (= e!859379 (and e!859380 mapRes!58216))))

(declare-fun condMapEmpty!58216 () Bool)

(declare-fun mapDefault!58216 () ValueCell!17927)

(assert (=> b!1544570 (= condMapEmpty!58216 (= (arr!49549 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17927)) mapDefault!58216)))))

(declare-fun mapNonEmpty!58216 () Bool)

(declare-fun tp!110743 () Bool)

(assert (=> mapNonEmpty!58216 (= mapRes!58216 (and tp!110743 e!859382))))

(declare-fun mapKey!58216 () (_ BitVec 32))

(declare-fun mapValue!58216 () ValueCell!17927)

(declare-fun mapRest!58216 () (Array (_ BitVec 32) ValueCell!17927))

(assert (=> mapNonEmpty!58216 (= (arr!49549 _values!470) (store mapRest!58216 mapKey!58216 mapValue!58216))))

(assert (= (and start!132098 res!1059198) b!1544569))

(assert (= (and b!1544569 res!1059199) b!1544566))

(assert (= (and b!1544566 res!1059200) b!1544568))

(assert (= (and b!1544570 condMapEmpty!58216) mapIsEmpty!58216))

(assert (= (and b!1544570 (not condMapEmpty!58216)) mapNonEmpty!58216))

(get-info :version)

(assert (= (and mapNonEmpty!58216 ((_ is ValueCellFull!17927) mapValue!58216)) b!1544565))

(assert (= (and b!1544570 ((_ is ValueCellFull!17927) mapDefault!58216)) b!1544567))

(assert (= start!132098 b!1544570))

(declare-fun m!1426131 () Bool)

(assert (=> start!132098 m!1426131))

(declare-fun m!1426133 () Bool)

(assert (=> start!132098 m!1426133))

(declare-fun m!1426135 () Bool)

(assert (=> start!132098 m!1426135))

(declare-fun m!1426137 () Bool)

(assert (=> b!1544566 m!1426137))

(declare-fun m!1426139 () Bool)

(assert (=> b!1544568 m!1426139))

(declare-fun m!1426141 () Bool)

(assert (=> mapNonEmpty!58216 m!1426141))

(check-sat (not b!1544566) (not b!1544568) (not start!132098) (not mapNonEmpty!58216) tp_is_empty!37675)
(check-sat)
