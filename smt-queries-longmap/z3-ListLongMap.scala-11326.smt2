; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132272 () Bool)

(assert start!132272)

(declare-fun res!1059982 () Bool)

(declare-fun e!860688 () Bool)

(assert (=> start!132272 (=> (not res!1059982) (not e!860688))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132272 (= res!1059982 (validMask!0 mask!926))))

(assert (=> start!132272 e!860688))

(assert (=> start!132272 true))

(declare-datatypes ((V!58909 0))(
  ( (V!58910 (val!19002 Int)) )
))
(declare-datatypes ((ValueCell!18014 0))(
  ( (ValueCellFull!18014 (v!21795 V!58909)) (EmptyCell!18014) )
))
(declare-datatypes ((array!103036 0))(
  ( (array!103037 (arr!49713 (Array (_ BitVec 32) ValueCell!18014)) (size!50264 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103036)

(declare-fun e!860687 () Bool)

(declare-fun array_inv!38935 (array!103036) Bool)

(assert (=> start!132272 (and (array_inv!38935 _values!470) e!860687)))

(declare-datatypes ((array!103038 0))(
  ( (array!103039 (arr!49714 (Array (_ BitVec 32) (_ BitVec 64))) (size!50265 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103038)

(declare-fun array_inv!38936 (array!103038) Bool)

(assert (=> start!132272 (array_inv!38936 _keys!618)))

(declare-fun mapNonEmpty!58477 () Bool)

(declare-fun mapRes!58477 () Bool)

(declare-fun tp!111004 () Bool)

(declare-fun e!860686 () Bool)

(assert (=> mapNonEmpty!58477 (= mapRes!58477 (and tp!111004 e!860686))))

(declare-fun mapKey!58477 () (_ BitVec 32))

(declare-fun mapRest!58477 () (Array (_ BitVec 32) ValueCell!18014))

(declare-fun mapValue!58477 () ValueCell!18014)

(assert (=> mapNonEmpty!58477 (= (arr!49713 _values!470) (store mapRest!58477 mapKey!58477 mapValue!58477))))

(declare-fun b!1546131 () Bool)

(declare-fun e!860685 () Bool)

(declare-fun tp_is_empty!37849 () Bool)

(assert (=> b!1546131 (= e!860685 tp_is_empty!37849)))

(declare-fun b!1546132 () Bool)

(declare-fun res!1059981 () Bool)

(assert (=> b!1546132 (=> (not res!1059981) (not e!860688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103038 (_ BitVec 32)) Bool)

(assert (=> b!1546132 (= res!1059981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58477 () Bool)

(assert (=> mapIsEmpty!58477 mapRes!58477))

(declare-fun b!1546133 () Bool)

(declare-fun res!1059983 () Bool)

(assert (=> b!1546133 (=> (not res!1059983) (not e!860688))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546133 (= res!1059983 (and (= (size!50264 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50265 _keys!618) (size!50264 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546134 () Bool)

(assert (=> b!1546134 (= e!860688 false)))

(declare-fun lt!666934 () Bool)

(declare-datatypes ((List!35964 0))(
  ( (Nil!35961) (Cons!35960 (h!37423 (_ BitVec 64)) (t!50650 List!35964)) )
))
(declare-fun arrayNoDuplicates!0 (array!103038 (_ BitVec 32) List!35964) Bool)

(assert (=> b!1546134 (= lt!666934 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35961))))

(declare-fun b!1546135 () Bool)

(assert (=> b!1546135 (= e!860686 tp_is_empty!37849)))

(declare-fun b!1546136 () Bool)

(assert (=> b!1546136 (= e!860687 (and e!860685 mapRes!58477))))

(declare-fun condMapEmpty!58477 () Bool)

(declare-fun mapDefault!58477 () ValueCell!18014)

(assert (=> b!1546136 (= condMapEmpty!58477 (= (arr!49713 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18014)) mapDefault!58477)))))

(assert (= (and start!132272 res!1059982) b!1546133))

(assert (= (and b!1546133 res!1059983) b!1546132))

(assert (= (and b!1546132 res!1059981) b!1546134))

(assert (= (and b!1546136 condMapEmpty!58477) mapIsEmpty!58477))

(assert (= (and b!1546136 (not condMapEmpty!58477)) mapNonEmpty!58477))

(get-info :version)

(assert (= (and mapNonEmpty!58477 ((_ is ValueCellFull!18014) mapValue!58477)) b!1546135))

(assert (= (and b!1546136 ((_ is ValueCellFull!18014) mapDefault!58477)) b!1546131))

(assert (= start!132272 b!1546136))

(declare-fun m!1427175 () Bool)

(assert (=> start!132272 m!1427175))

(declare-fun m!1427177 () Bool)

(assert (=> start!132272 m!1427177))

(declare-fun m!1427179 () Bool)

(assert (=> start!132272 m!1427179))

(declare-fun m!1427181 () Bool)

(assert (=> mapNonEmpty!58477 m!1427181))

(declare-fun m!1427183 () Bool)

(assert (=> b!1546132 m!1427183))

(declare-fun m!1427185 () Bool)

(assert (=> b!1546134 m!1427185))

(check-sat (not b!1546134) (not start!132272) (not b!1546132) (not mapNonEmpty!58477) tp_is_empty!37849)
(check-sat)
