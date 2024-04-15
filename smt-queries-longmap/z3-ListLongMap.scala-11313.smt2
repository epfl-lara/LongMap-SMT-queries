; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131732 () Bool)

(assert start!131732)

(declare-fun b!1542680 () Bool)

(declare-fun e!858393 () Bool)

(assert (=> b!1542680 (= e!858393 false)))

(declare-fun lt!665623 () Bool)

(declare-datatypes ((array!102702 0))(
  ( (array!102703 (arr!49554 (Array (_ BitVec 32) (_ BitVec 64))) (size!50106 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102702)

(declare-datatypes ((List!35949 0))(
  ( (Nil!35946) (Cons!35945 (h!37391 (_ BitVec 64)) (t!50635 List!35949)) )
))
(declare-fun arrayNoDuplicates!0 (array!102702 (_ BitVec 32) List!35949) Bool)

(assert (=> b!1542680 (= lt!665623 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35946))))

(declare-fun b!1542681 () Bool)

(declare-fun res!1058643 () Bool)

(assert (=> b!1542681 (=> (not res!1058643) (not e!858393))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102702 (_ BitVec 32)) Bool)

(assert (=> b!1542681 (= res!1058643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058642 () Bool)

(assert (=> start!131732 (=> (not res!1058642) (not e!858393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131732 (= res!1058642 (validMask!0 mask!926))))

(assert (=> start!131732 e!858393))

(assert (=> start!131732 true))

(declare-datatypes ((V!58805 0))(
  ( (V!58806 (val!18963 Int)) )
))
(declare-datatypes ((ValueCell!17975 0))(
  ( (ValueCellFull!17975 (v!21760 V!58805)) (EmptyCell!17975) )
))
(declare-datatypes ((array!102704 0))(
  ( (array!102705 (arr!49555 (Array (_ BitVec 32) ValueCell!17975)) (size!50107 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102704)

(declare-fun e!858392 () Bool)

(declare-fun array_inv!38749 (array!102704) Bool)

(assert (=> start!131732 (and (array_inv!38749 _values!470) e!858392)))

(declare-fun array_inv!38750 (array!102702) Bool)

(assert (=> start!131732 (array_inv!38750 _keys!618)))

(declare-fun b!1542682 () Bool)

(declare-fun e!858394 () Bool)

(declare-fun mapRes!58360 () Bool)

(assert (=> b!1542682 (= e!858392 (and e!858394 mapRes!58360))))

(declare-fun condMapEmpty!58360 () Bool)

(declare-fun mapDefault!58360 () ValueCell!17975)

(assert (=> b!1542682 (= condMapEmpty!58360 (= (arr!49555 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17975)) mapDefault!58360)))))

(declare-fun mapIsEmpty!58360 () Bool)

(assert (=> mapIsEmpty!58360 mapRes!58360))

(declare-fun b!1542683 () Bool)

(declare-fun tp_is_empty!37771 () Bool)

(assert (=> b!1542683 (= e!858394 tp_is_empty!37771)))

(declare-fun b!1542684 () Bool)

(declare-fun res!1058641 () Bool)

(assert (=> b!1542684 (=> (not res!1058641) (not e!858393))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542684 (= res!1058641 (and (= (size!50107 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50106 _keys!618) (size!50107 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542685 () Bool)

(declare-fun e!858395 () Bool)

(assert (=> b!1542685 (= e!858395 tp_is_empty!37771)))

(declare-fun mapNonEmpty!58360 () Bool)

(declare-fun tp!110888 () Bool)

(assert (=> mapNonEmpty!58360 (= mapRes!58360 (and tp!110888 e!858395))))

(declare-fun mapKey!58360 () (_ BitVec 32))

(declare-fun mapValue!58360 () ValueCell!17975)

(declare-fun mapRest!58360 () (Array (_ BitVec 32) ValueCell!17975))

(assert (=> mapNonEmpty!58360 (= (arr!49555 _values!470) (store mapRest!58360 mapKey!58360 mapValue!58360))))

(assert (= (and start!131732 res!1058642) b!1542684))

(assert (= (and b!1542684 res!1058641) b!1542681))

(assert (= (and b!1542681 res!1058643) b!1542680))

(assert (= (and b!1542682 condMapEmpty!58360) mapIsEmpty!58360))

(assert (= (and b!1542682 (not condMapEmpty!58360)) mapNonEmpty!58360))

(get-info :version)

(assert (= (and mapNonEmpty!58360 ((_ is ValueCellFull!17975) mapValue!58360)) b!1542685))

(assert (= (and b!1542682 ((_ is ValueCellFull!17975) mapDefault!58360)) b!1542683))

(assert (= start!131732 b!1542682))

(declare-fun m!1423557 () Bool)

(assert (=> b!1542680 m!1423557))

(declare-fun m!1423559 () Bool)

(assert (=> b!1542681 m!1423559))

(declare-fun m!1423561 () Bool)

(assert (=> start!131732 m!1423561))

(declare-fun m!1423563 () Bool)

(assert (=> start!131732 m!1423563))

(declare-fun m!1423565 () Bool)

(assert (=> start!131732 m!1423565))

(declare-fun m!1423567 () Bool)

(assert (=> mapNonEmpty!58360 m!1423567))

(check-sat (not start!131732) (not b!1542680) (not mapNonEmpty!58360) tp_is_empty!37771 (not b!1542681))
(check-sat)
