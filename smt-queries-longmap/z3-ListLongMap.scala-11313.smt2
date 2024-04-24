; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132194 () Bool)

(assert start!132194)

(declare-fun mapNonEmpty!58360 () Bool)

(declare-fun mapRes!58360 () Bool)

(declare-fun tp!110887 () Bool)

(declare-fun e!860101 () Bool)

(assert (=> mapNonEmpty!58360 (= mapRes!58360 (and tp!110887 e!860101))))

(declare-datatypes ((V!58805 0))(
  ( (V!58806 (val!18963 Int)) )
))
(declare-datatypes ((ValueCell!17975 0))(
  ( (ValueCellFull!17975 (v!21756 V!58805)) (EmptyCell!17975) )
))
(declare-fun mapRest!58360 () (Array (_ BitVec 32) ValueCell!17975))

(declare-datatypes ((array!102890 0))(
  ( (array!102891 (arr!49640 (Array (_ BitVec 32) ValueCell!17975)) (size!50191 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102890)

(declare-fun mapValue!58360 () ValueCell!17975)

(declare-fun mapKey!58360 () (_ BitVec 32))

(assert (=> mapNonEmpty!58360 (= (arr!49640 _values!470) (store mapRest!58360 mapKey!58360 mapValue!58360))))

(declare-fun b!1545429 () Bool)

(declare-fun res!1059630 () Bool)

(declare-fun e!860100 () Bool)

(assert (=> b!1545429 (=> (not res!1059630) (not e!860100))))

(declare-datatypes ((array!102892 0))(
  ( (array!102893 (arr!49641 (Array (_ BitVec 32) (_ BitVec 64))) (size!50192 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102892)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102892 (_ BitVec 32)) Bool)

(assert (=> b!1545429 (= res!1059630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545430 () Bool)

(declare-fun e!860103 () Bool)

(declare-fun e!860102 () Bool)

(assert (=> b!1545430 (= e!860103 (and e!860102 mapRes!58360))))

(declare-fun condMapEmpty!58360 () Bool)

(declare-fun mapDefault!58360 () ValueCell!17975)

(assert (=> b!1545430 (= condMapEmpty!58360 (= (arr!49640 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17975)) mapDefault!58360)))))

(declare-fun mapIsEmpty!58360 () Bool)

(assert (=> mapIsEmpty!58360 mapRes!58360))

(declare-fun b!1545431 () Bool)

(declare-fun tp_is_empty!37771 () Bool)

(assert (=> b!1545431 (= e!860101 tp_is_empty!37771)))

(declare-fun res!1059632 () Bool)

(assert (=> start!132194 (=> (not res!1059632) (not e!860100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132194 (= res!1059632 (validMask!0 mask!926))))

(assert (=> start!132194 e!860100))

(assert (=> start!132194 true))

(declare-fun array_inv!38883 (array!102890) Bool)

(assert (=> start!132194 (and (array_inv!38883 _values!470) e!860103)))

(declare-fun array_inv!38884 (array!102892) Bool)

(assert (=> start!132194 (array_inv!38884 _keys!618)))

(declare-fun b!1545432 () Bool)

(declare-fun res!1059631 () Bool)

(assert (=> b!1545432 (=> (not res!1059631) (not e!860100))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545432 (= res!1059631 (and (= (size!50191 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50192 _keys!618) (size!50191 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545433 () Bool)

(assert (=> b!1545433 (= e!860102 tp_is_empty!37771)))

(declare-fun b!1545434 () Bool)

(assert (=> b!1545434 (= e!860100 false)))

(declare-fun lt!666817 () Bool)

(declare-datatypes ((List!35938 0))(
  ( (Nil!35935) (Cons!35934 (h!37397 (_ BitVec 64)) (t!50624 List!35938)) )
))
(declare-fun arrayNoDuplicates!0 (array!102892 (_ BitVec 32) List!35938) Bool)

(assert (=> b!1545434 (= lt!666817 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35935))))

(assert (= (and start!132194 res!1059632) b!1545432))

(assert (= (and b!1545432 res!1059631) b!1545429))

(assert (= (and b!1545429 res!1059630) b!1545434))

(assert (= (and b!1545430 condMapEmpty!58360) mapIsEmpty!58360))

(assert (= (and b!1545430 (not condMapEmpty!58360)) mapNonEmpty!58360))

(get-info :version)

(assert (= (and mapNonEmpty!58360 ((_ is ValueCellFull!17975) mapValue!58360)) b!1545431))

(assert (= (and b!1545430 ((_ is ValueCellFull!17975) mapDefault!58360)) b!1545433))

(assert (= start!132194 b!1545430))

(declare-fun m!1426707 () Bool)

(assert (=> mapNonEmpty!58360 m!1426707))

(declare-fun m!1426709 () Bool)

(assert (=> b!1545429 m!1426709))

(declare-fun m!1426711 () Bool)

(assert (=> start!132194 m!1426711))

(declare-fun m!1426713 () Bool)

(assert (=> start!132194 m!1426713))

(declare-fun m!1426715 () Bool)

(assert (=> start!132194 m!1426715))

(declare-fun m!1426717 () Bool)

(assert (=> b!1545434 m!1426717))

(check-sat (not b!1545429) tp_is_empty!37771 (not start!132194) (not b!1545434) (not mapNonEmpty!58360))
(check-sat)
