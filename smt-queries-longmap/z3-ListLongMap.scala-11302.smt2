; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132128 () Bool)

(assert start!132128)

(declare-fun res!1059334 () Bool)

(declare-fun e!859605 () Bool)

(assert (=> start!132128 (=> (not res!1059334) (not e!859605))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132128 (= res!1059334 (validMask!0 mask!926))))

(assert (=> start!132128 e!859605))

(assert (=> start!132128 true))

(declare-datatypes ((V!58717 0))(
  ( (V!58718 (val!18930 Int)) )
))
(declare-datatypes ((ValueCell!17942 0))(
  ( (ValueCellFull!17942 (v!21723 V!58717)) (EmptyCell!17942) )
))
(declare-datatypes ((array!102766 0))(
  ( (array!102767 (arr!49578 (Array (_ BitVec 32) ValueCell!17942)) (size!50129 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102766)

(declare-fun e!859607 () Bool)

(declare-fun array_inv!38833 (array!102766) Bool)

(assert (=> start!132128 (and (array_inv!38833 _values!470) e!859607)))

(declare-datatypes ((array!102768 0))(
  ( (array!102769 (arr!49579 (Array (_ BitVec 32) (_ BitVec 64))) (size!50130 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102768)

(declare-fun array_inv!38834 (array!102768) Bool)

(assert (=> start!132128 (array_inv!38834 _keys!618)))

(declare-fun b!1544835 () Bool)

(declare-fun e!859604 () Bool)

(declare-fun tp_is_empty!37705 () Bool)

(assert (=> b!1544835 (= e!859604 tp_is_empty!37705)))

(declare-fun b!1544836 () Bool)

(declare-fun mapRes!58261 () Bool)

(assert (=> b!1544836 (= e!859607 (and e!859604 mapRes!58261))))

(declare-fun condMapEmpty!58261 () Bool)

(declare-fun mapDefault!58261 () ValueCell!17942)

(assert (=> b!1544836 (= condMapEmpty!58261 (= (arr!49578 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17942)) mapDefault!58261)))))

(declare-fun b!1544837 () Bool)

(declare-fun res!1059333 () Bool)

(assert (=> b!1544837 (=> (not res!1059333) (not e!859605))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544837 (= res!1059333 (and (= (size!50129 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50130 _keys!618) (size!50129 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58261 () Bool)

(assert (=> mapIsEmpty!58261 mapRes!58261))

(declare-fun b!1544838 () Bool)

(assert (=> b!1544838 (= e!859605 false)))

(declare-fun lt!666718 () Bool)

(declare-datatypes ((List!35917 0))(
  ( (Nil!35914) (Cons!35913 (h!37376 (_ BitVec 64)) (t!50603 List!35917)) )
))
(declare-fun arrayNoDuplicates!0 (array!102768 (_ BitVec 32) List!35917) Bool)

(assert (=> b!1544838 (= lt!666718 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35914))))

(declare-fun b!1544839 () Bool)

(declare-fun e!859606 () Bool)

(assert (=> b!1544839 (= e!859606 tp_is_empty!37705)))

(declare-fun mapNonEmpty!58261 () Bool)

(declare-fun tp!110788 () Bool)

(assert (=> mapNonEmpty!58261 (= mapRes!58261 (and tp!110788 e!859606))))

(declare-fun mapValue!58261 () ValueCell!17942)

(declare-fun mapKey!58261 () (_ BitVec 32))

(declare-fun mapRest!58261 () (Array (_ BitVec 32) ValueCell!17942))

(assert (=> mapNonEmpty!58261 (= (arr!49578 _values!470) (store mapRest!58261 mapKey!58261 mapValue!58261))))

(declare-fun b!1544840 () Bool)

(declare-fun res!1059335 () Bool)

(assert (=> b!1544840 (=> (not res!1059335) (not e!859605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102768 (_ BitVec 32)) Bool)

(assert (=> b!1544840 (= res!1059335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132128 res!1059334) b!1544837))

(assert (= (and b!1544837 res!1059333) b!1544840))

(assert (= (and b!1544840 res!1059335) b!1544838))

(assert (= (and b!1544836 condMapEmpty!58261) mapIsEmpty!58261))

(assert (= (and b!1544836 (not condMapEmpty!58261)) mapNonEmpty!58261))

(get-info :version)

(assert (= (and mapNonEmpty!58261 ((_ is ValueCellFull!17942) mapValue!58261)) b!1544839))

(assert (= (and b!1544836 ((_ is ValueCellFull!17942) mapDefault!58261)) b!1544835))

(assert (= start!132128 b!1544836))

(declare-fun m!1426311 () Bool)

(assert (=> start!132128 m!1426311))

(declare-fun m!1426313 () Bool)

(assert (=> start!132128 m!1426313))

(declare-fun m!1426315 () Bool)

(assert (=> start!132128 m!1426315))

(declare-fun m!1426317 () Bool)

(assert (=> b!1544838 m!1426317))

(declare-fun m!1426319 () Bool)

(assert (=> mapNonEmpty!58261 m!1426319))

(declare-fun m!1426321 () Bool)

(assert (=> b!1544840 m!1426321))

(check-sat (not b!1544840) (not mapNonEmpty!58261) tp_is_empty!37705 (not start!132128) (not b!1544838))
(check-sat)
