; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131838 () Bool)

(assert start!131838)

(declare-fun b!1543497 () Bool)

(declare-fun res!1059023 () Bool)

(declare-fun e!859012 () Bool)

(assert (=> b!1543497 (=> (not res!1059023) (not e!859012))))

(declare-datatypes ((array!102878 0))(
  ( (array!102879 (arr!49641 (Array (_ BitVec 32) (_ BitVec 64))) (size!50191 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102878)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102878 (_ BitVec 32)) Bool)

(assert (=> b!1543497 (= res!1059023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059024 () Bool)

(assert (=> start!131838 (=> (not res!1059024) (not e!859012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131838 (= res!1059024 (validMask!0 mask!926))))

(assert (=> start!131838 e!859012))

(assert (=> start!131838 true))

(declare-datatypes ((V!58879 0))(
  ( (V!58880 (val!18991 Int)) )
))
(declare-datatypes ((ValueCell!18003 0))(
  ( (ValueCellFull!18003 (v!21792 V!58879)) (EmptyCell!18003) )
))
(declare-datatypes ((array!102880 0))(
  ( (array!102881 (arr!49642 (Array (_ BitVec 32) ValueCell!18003)) (size!50192 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102880)

(declare-fun e!859010 () Bool)

(declare-fun array_inv!38619 (array!102880) Bool)

(assert (=> start!131838 (and (array_inv!38619 _values!470) e!859010)))

(declare-fun array_inv!38620 (array!102878) Bool)

(assert (=> start!131838 (array_inv!38620 _keys!618)))

(declare-fun b!1543498 () Bool)

(declare-fun e!859014 () Bool)

(declare-fun tp_is_empty!37827 () Bool)

(assert (=> b!1543498 (= e!859014 tp_is_empty!37827)))

(declare-fun mapIsEmpty!58444 () Bool)

(declare-fun mapRes!58444 () Bool)

(assert (=> mapIsEmpty!58444 mapRes!58444))

(declare-fun b!1543499 () Bool)

(assert (=> b!1543499 (= e!859012 false)))

(declare-fun lt!665993 () Bool)

(declare-datatypes ((List!35924 0))(
  ( (Nil!35921) (Cons!35920 (h!37365 (_ BitVec 64)) (t!50618 List!35924)) )
))
(declare-fun arrayNoDuplicates!0 (array!102878 (_ BitVec 32) List!35924) Bool)

(assert (=> b!1543499 (= lt!665993 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35921))))

(declare-fun mapNonEmpty!58444 () Bool)

(declare-fun tp!110971 () Bool)

(assert (=> mapNonEmpty!58444 (= mapRes!58444 (and tp!110971 e!859014))))

(declare-fun mapRest!58444 () (Array (_ BitVec 32) ValueCell!18003))

(declare-fun mapValue!58444 () ValueCell!18003)

(declare-fun mapKey!58444 () (_ BitVec 32))

(assert (=> mapNonEmpty!58444 (= (arr!49642 _values!470) (store mapRest!58444 mapKey!58444 mapValue!58444))))

(declare-fun b!1543500 () Bool)

(declare-fun e!859013 () Bool)

(assert (=> b!1543500 (= e!859013 tp_is_empty!37827)))

(declare-fun b!1543501 () Bool)

(declare-fun res!1059022 () Bool)

(assert (=> b!1543501 (=> (not res!1059022) (not e!859012))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543501 (= res!1059022 (and (= (size!50192 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50191 _keys!618) (size!50192 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543502 () Bool)

(assert (=> b!1543502 (= e!859010 (and e!859013 mapRes!58444))))

(declare-fun condMapEmpty!58444 () Bool)

(declare-fun mapDefault!58444 () ValueCell!18003)

(assert (=> b!1543502 (= condMapEmpty!58444 (= (arr!49642 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18003)) mapDefault!58444)))))

(assert (= (and start!131838 res!1059024) b!1543501))

(assert (= (and b!1543501 res!1059022) b!1543497))

(assert (= (and b!1543497 res!1059023) b!1543499))

(assert (= (and b!1543502 condMapEmpty!58444) mapIsEmpty!58444))

(assert (= (and b!1543502 (not condMapEmpty!58444)) mapNonEmpty!58444))

(get-info :version)

(assert (= (and mapNonEmpty!58444 ((_ is ValueCellFull!18003) mapValue!58444)) b!1543498))

(assert (= (and b!1543502 ((_ is ValueCellFull!18003) mapDefault!58444)) b!1543500))

(assert (= start!131838 b!1543502))

(declare-fun m!1424785 () Bool)

(assert (=> b!1543497 m!1424785))

(declare-fun m!1424787 () Bool)

(assert (=> start!131838 m!1424787))

(declare-fun m!1424789 () Bool)

(assert (=> start!131838 m!1424789))

(declare-fun m!1424791 () Bool)

(assert (=> start!131838 m!1424791))

(declare-fun m!1424793 () Bool)

(assert (=> b!1543499 m!1424793))

(declare-fun m!1424795 () Bool)

(assert (=> mapNonEmpty!58444 m!1424795))

(check-sat (not b!1543499) (not start!131838) tp_is_empty!37827 (not mapNonEmpty!58444) (not b!1543497))
(check-sat)
