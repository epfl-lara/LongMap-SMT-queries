; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132140 () Bool)

(assert start!132140)

(declare-fun res!1059388 () Bool)

(declare-fun e!859696 () Bool)

(assert (=> start!132140 (=> (not res!1059388) (not e!859696))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132140 (= res!1059388 (validMask!0 mask!926))))

(assert (=> start!132140 e!859696))

(assert (=> start!132140 true))

(declare-datatypes ((V!58733 0))(
  ( (V!58734 (val!18936 Int)) )
))
(declare-datatypes ((ValueCell!17948 0))(
  ( (ValueCellFull!17948 (v!21729 V!58733)) (EmptyCell!17948) )
))
(declare-datatypes ((array!102786 0))(
  ( (array!102787 (arr!49588 (Array (_ BitVec 32) ValueCell!17948)) (size!50139 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102786)

(declare-fun e!859697 () Bool)

(declare-fun array_inv!38839 (array!102786) Bool)

(assert (=> start!132140 (and (array_inv!38839 _values!470) e!859697)))

(declare-datatypes ((array!102788 0))(
  ( (array!102789 (arr!49589 (Array (_ BitVec 32) (_ BitVec 64))) (size!50140 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102788)

(declare-fun array_inv!38840 (array!102788) Bool)

(assert (=> start!132140 (array_inv!38840 _keys!618)))

(declare-fun b!1544943 () Bool)

(declare-fun e!859694 () Bool)

(declare-fun mapRes!58279 () Bool)

(assert (=> b!1544943 (= e!859697 (and e!859694 mapRes!58279))))

(declare-fun condMapEmpty!58279 () Bool)

(declare-fun mapDefault!58279 () ValueCell!17948)

(assert (=> b!1544943 (= condMapEmpty!58279 (= (arr!49588 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17948)) mapDefault!58279)))))

(declare-fun b!1544944 () Bool)

(declare-fun res!1059389 () Bool)

(assert (=> b!1544944 (=> (not res!1059389) (not e!859696))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544944 (= res!1059389 (and (= (size!50139 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50140 _keys!618) (size!50139 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58279 () Bool)

(declare-fun tp!110806 () Bool)

(declare-fun e!859698 () Bool)

(assert (=> mapNonEmpty!58279 (= mapRes!58279 (and tp!110806 e!859698))))

(declare-fun mapKey!58279 () (_ BitVec 32))

(declare-fun mapRest!58279 () (Array (_ BitVec 32) ValueCell!17948))

(declare-fun mapValue!58279 () ValueCell!17948)

(assert (=> mapNonEmpty!58279 (= (arr!49588 _values!470) (store mapRest!58279 mapKey!58279 mapValue!58279))))

(declare-fun mapIsEmpty!58279 () Bool)

(assert (=> mapIsEmpty!58279 mapRes!58279))

(declare-fun b!1544945 () Bool)

(declare-fun tp_is_empty!37717 () Bool)

(assert (=> b!1544945 (= e!859694 tp_is_empty!37717)))

(declare-fun b!1544946 () Bool)

(assert (=> b!1544946 (= e!859696 false)))

(declare-fun lt!666736 () Bool)

(declare-datatypes ((List!35920 0))(
  ( (Nil!35917) (Cons!35916 (h!37379 (_ BitVec 64)) (t!50606 List!35920)) )
))
(declare-fun arrayNoDuplicates!0 (array!102788 (_ BitVec 32) List!35920) Bool)

(assert (=> b!1544946 (= lt!666736 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35917))))

(declare-fun b!1544947 () Bool)

(declare-fun res!1059387 () Bool)

(assert (=> b!1544947 (=> (not res!1059387) (not e!859696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102788 (_ BitVec 32)) Bool)

(assert (=> b!1544947 (= res!1059387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544948 () Bool)

(assert (=> b!1544948 (= e!859698 tp_is_empty!37717)))

(assert (= (and start!132140 res!1059388) b!1544944))

(assert (= (and b!1544944 res!1059389) b!1544947))

(assert (= (and b!1544947 res!1059387) b!1544946))

(assert (= (and b!1544943 condMapEmpty!58279) mapIsEmpty!58279))

(assert (= (and b!1544943 (not condMapEmpty!58279)) mapNonEmpty!58279))

(get-info :version)

(assert (= (and mapNonEmpty!58279 ((_ is ValueCellFull!17948) mapValue!58279)) b!1544948))

(assert (= (and b!1544943 ((_ is ValueCellFull!17948) mapDefault!58279)) b!1544945))

(assert (= start!132140 b!1544943))

(declare-fun m!1426383 () Bool)

(assert (=> start!132140 m!1426383))

(declare-fun m!1426385 () Bool)

(assert (=> start!132140 m!1426385))

(declare-fun m!1426387 () Bool)

(assert (=> start!132140 m!1426387))

(declare-fun m!1426389 () Bool)

(assert (=> mapNonEmpty!58279 m!1426389))

(declare-fun m!1426391 () Bool)

(assert (=> b!1544946 m!1426391))

(declare-fun m!1426393 () Bool)

(assert (=> b!1544947 m!1426393))

(check-sat (not b!1544947) (not b!1544946) (not start!132140) tp_is_empty!37717 (not mapNonEmpty!58279))
(check-sat)
