; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131832 () Bool)

(assert start!131832)

(declare-fun b!1543443 () Bool)

(declare-fun res!1058995 () Bool)

(declare-fun e!858969 () Bool)

(assert (=> b!1543443 (=> (not res!1058995) (not e!858969))))

(declare-datatypes ((array!102866 0))(
  ( (array!102867 (arr!49635 (Array (_ BitVec 32) (_ BitVec 64))) (size!50185 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102866)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102866 (_ BitVec 32)) Bool)

(assert (=> b!1543443 (= res!1058995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543444 () Bool)

(declare-fun e!858965 () Bool)

(declare-fun e!858966 () Bool)

(declare-fun mapRes!58435 () Bool)

(assert (=> b!1543444 (= e!858965 (and e!858966 mapRes!58435))))

(declare-fun condMapEmpty!58435 () Bool)

(declare-datatypes ((V!58871 0))(
  ( (V!58872 (val!18988 Int)) )
))
(declare-datatypes ((ValueCell!18000 0))(
  ( (ValueCellFull!18000 (v!21789 V!58871)) (EmptyCell!18000) )
))
(declare-datatypes ((array!102868 0))(
  ( (array!102869 (arr!49636 (Array (_ BitVec 32) ValueCell!18000)) (size!50186 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102868)

(declare-fun mapDefault!58435 () ValueCell!18000)

(assert (=> b!1543444 (= condMapEmpty!58435 (= (arr!49636 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18000)) mapDefault!58435)))))

(declare-fun mapIsEmpty!58435 () Bool)

(assert (=> mapIsEmpty!58435 mapRes!58435))

(declare-fun b!1543445 () Bool)

(declare-fun tp_is_empty!37821 () Bool)

(assert (=> b!1543445 (= e!858966 tp_is_empty!37821)))

(declare-fun b!1543446 () Bool)

(declare-fun res!1058996 () Bool)

(assert (=> b!1543446 (=> (not res!1058996) (not e!858969))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543446 (= res!1058996 (and (= (size!50186 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50185 _keys!618) (size!50186 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543447 () Bool)

(declare-fun e!858968 () Bool)

(assert (=> b!1543447 (= e!858968 tp_is_empty!37821)))

(declare-fun b!1543448 () Bool)

(assert (=> b!1543448 (= e!858969 false)))

(declare-fun lt!665984 () Bool)

(declare-datatypes ((List!35922 0))(
  ( (Nil!35919) (Cons!35918 (h!37363 (_ BitVec 64)) (t!50616 List!35922)) )
))
(declare-fun arrayNoDuplicates!0 (array!102866 (_ BitVec 32) List!35922) Bool)

(assert (=> b!1543448 (= lt!665984 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35919))))

(declare-fun res!1058997 () Bool)

(assert (=> start!131832 (=> (not res!1058997) (not e!858969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131832 (= res!1058997 (validMask!0 mask!926))))

(assert (=> start!131832 e!858969))

(assert (=> start!131832 true))

(declare-fun array_inv!38613 (array!102868) Bool)

(assert (=> start!131832 (and (array_inv!38613 _values!470) e!858965)))

(declare-fun array_inv!38614 (array!102866) Bool)

(assert (=> start!131832 (array_inv!38614 _keys!618)))

(declare-fun mapNonEmpty!58435 () Bool)

(declare-fun tp!110962 () Bool)

(assert (=> mapNonEmpty!58435 (= mapRes!58435 (and tp!110962 e!858968))))

(declare-fun mapValue!58435 () ValueCell!18000)

(declare-fun mapRest!58435 () (Array (_ BitVec 32) ValueCell!18000))

(declare-fun mapKey!58435 () (_ BitVec 32))

(assert (=> mapNonEmpty!58435 (= (arr!49636 _values!470) (store mapRest!58435 mapKey!58435 mapValue!58435))))

(assert (= (and start!131832 res!1058997) b!1543446))

(assert (= (and b!1543446 res!1058996) b!1543443))

(assert (= (and b!1543443 res!1058995) b!1543448))

(assert (= (and b!1543444 condMapEmpty!58435) mapIsEmpty!58435))

(assert (= (and b!1543444 (not condMapEmpty!58435)) mapNonEmpty!58435))

(get-info :version)

(assert (= (and mapNonEmpty!58435 ((_ is ValueCellFull!18000) mapValue!58435)) b!1543447))

(assert (= (and b!1543444 ((_ is ValueCellFull!18000) mapDefault!58435)) b!1543445))

(assert (= start!131832 b!1543444))

(declare-fun m!1424749 () Bool)

(assert (=> b!1543443 m!1424749))

(declare-fun m!1424751 () Bool)

(assert (=> b!1543448 m!1424751))

(declare-fun m!1424753 () Bool)

(assert (=> start!131832 m!1424753))

(declare-fun m!1424755 () Bool)

(assert (=> start!131832 m!1424755))

(declare-fun m!1424757 () Bool)

(assert (=> start!131832 m!1424757))

(declare-fun m!1424759 () Bool)

(assert (=> mapNonEmpty!58435 m!1424759))

(check-sat (not b!1543443) (not mapNonEmpty!58435) tp_is_empty!37821 (not b!1543448) (not start!131832))
(check-sat)
