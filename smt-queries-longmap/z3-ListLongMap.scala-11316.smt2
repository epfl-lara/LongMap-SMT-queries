; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132212 () Bool)

(assert start!132212)

(declare-fun b!1545591 () Bool)

(declare-fun res!1059712 () Bool)

(declare-fun e!860235 () Bool)

(assert (=> b!1545591 (=> (not res!1059712) (not e!860235))))

(declare-datatypes ((array!102924 0))(
  ( (array!102925 (arr!49657 (Array (_ BitVec 32) (_ BitVec 64))) (size!50208 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102924)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102924 (_ BitVec 32)) Bool)

(assert (=> b!1545591 (= res!1059712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059713 () Bool)

(assert (=> start!132212 (=> (not res!1059713) (not e!860235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132212 (= res!1059713 (validMask!0 mask!926))))

(assert (=> start!132212 e!860235))

(assert (=> start!132212 true))

(declare-datatypes ((V!58829 0))(
  ( (V!58830 (val!18972 Int)) )
))
(declare-datatypes ((ValueCell!17984 0))(
  ( (ValueCellFull!17984 (v!21765 V!58829)) (EmptyCell!17984) )
))
(declare-datatypes ((array!102926 0))(
  ( (array!102927 (arr!49658 (Array (_ BitVec 32) ValueCell!17984)) (size!50209 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102926)

(declare-fun e!860238 () Bool)

(declare-fun array_inv!38893 (array!102926) Bool)

(assert (=> start!132212 (and (array_inv!38893 _values!470) e!860238)))

(declare-fun array_inv!38894 (array!102924) Bool)

(assert (=> start!132212 (array_inv!38894 _keys!618)))

(declare-fun b!1545592 () Bool)

(declare-fun res!1059711 () Bool)

(assert (=> b!1545592 (=> (not res!1059711) (not e!860235))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545592 (= res!1059711 (and (= (size!50209 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50208 _keys!618) (size!50209 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545593 () Bool)

(declare-fun e!860236 () Bool)

(declare-fun mapRes!58387 () Bool)

(assert (=> b!1545593 (= e!860238 (and e!860236 mapRes!58387))))

(declare-fun condMapEmpty!58387 () Bool)

(declare-fun mapDefault!58387 () ValueCell!17984)

(assert (=> b!1545593 (= condMapEmpty!58387 (= (arr!49658 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17984)) mapDefault!58387)))))

(declare-fun mapIsEmpty!58387 () Bool)

(assert (=> mapIsEmpty!58387 mapRes!58387))

(declare-fun b!1545594 () Bool)

(declare-fun e!860237 () Bool)

(declare-fun tp_is_empty!37789 () Bool)

(assert (=> b!1545594 (= e!860237 tp_is_empty!37789)))

(declare-fun mapNonEmpty!58387 () Bool)

(declare-fun tp!110914 () Bool)

(assert (=> mapNonEmpty!58387 (= mapRes!58387 (and tp!110914 e!860237))))

(declare-fun mapValue!58387 () ValueCell!17984)

(declare-fun mapKey!58387 () (_ BitVec 32))

(declare-fun mapRest!58387 () (Array (_ BitVec 32) ValueCell!17984))

(assert (=> mapNonEmpty!58387 (= (arr!49658 _values!470) (store mapRest!58387 mapKey!58387 mapValue!58387))))

(declare-fun b!1545595 () Bool)

(assert (=> b!1545595 (= e!860235 false)))

(declare-fun lt!666844 () Bool)

(declare-datatypes ((List!35942 0))(
  ( (Nil!35939) (Cons!35938 (h!37401 (_ BitVec 64)) (t!50628 List!35942)) )
))
(declare-fun arrayNoDuplicates!0 (array!102924 (_ BitVec 32) List!35942) Bool)

(assert (=> b!1545595 (= lt!666844 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35939))))

(declare-fun b!1545596 () Bool)

(assert (=> b!1545596 (= e!860236 tp_is_empty!37789)))

(assert (= (and start!132212 res!1059713) b!1545592))

(assert (= (and b!1545592 res!1059711) b!1545591))

(assert (= (and b!1545591 res!1059712) b!1545595))

(assert (= (and b!1545593 condMapEmpty!58387) mapIsEmpty!58387))

(assert (= (and b!1545593 (not condMapEmpty!58387)) mapNonEmpty!58387))

(get-info :version)

(assert (= (and mapNonEmpty!58387 ((_ is ValueCellFull!17984) mapValue!58387)) b!1545594))

(assert (= (and b!1545593 ((_ is ValueCellFull!17984) mapDefault!58387)) b!1545596))

(assert (= start!132212 b!1545593))

(declare-fun m!1426815 () Bool)

(assert (=> b!1545591 m!1426815))

(declare-fun m!1426817 () Bool)

(assert (=> start!132212 m!1426817))

(declare-fun m!1426819 () Bool)

(assert (=> start!132212 m!1426819))

(declare-fun m!1426821 () Bool)

(assert (=> start!132212 m!1426821))

(declare-fun m!1426823 () Bool)

(assert (=> mapNonEmpty!58387 m!1426823))

(declare-fun m!1426825 () Bool)

(assert (=> b!1545595 m!1426825))

(check-sat tp_is_empty!37789 (not mapNonEmpty!58387) (not start!132212) (not b!1545591) (not b!1545595))
(check-sat)
