; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35554 () Bool)

(assert start!35554)

(declare-fun b!356328 () Bool)

(declare-fun res!197701 () Bool)

(declare-fun e!218347 () Bool)

(assert (=> b!356328 (=> (not res!197701) (not e!218347))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19585 0))(
  ( (array!19586 (arr!9286 (Array (_ BitVec 32) (_ BitVec 64))) (size!9638 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19585)

(assert (=> b!356328 (= res!197701 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9638 _keys!1456))))))

(declare-fun b!356329 () Bool)

(declare-fun res!197702 () Bool)

(assert (=> b!356329 (=> (not res!197702) (not e!218347))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356329 (= res!197702 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356330 () Bool)

(declare-fun res!197705 () Bool)

(assert (=> b!356330 (=> (not res!197705) (not e!218347))))

(declare-datatypes ((List!5367 0))(
  ( (Nil!5364) (Cons!5363 (h!6219 (_ BitVec 64)) (t!10517 List!5367)) )
))
(declare-fun arrayNoDuplicates!0 (array!19585 (_ BitVec 32) List!5367) Bool)

(assert (=> b!356330 (= res!197705 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5364))))

(declare-fun b!356331 () Bool)

(declare-fun e!218351 () Bool)

(declare-fun e!218350 () Bool)

(declare-fun mapRes!13518 () Bool)

(assert (=> b!356331 (= e!218351 (and e!218350 mapRes!13518))))

(declare-fun condMapEmpty!13518 () Bool)

(declare-datatypes ((V!11653 0))(
  ( (V!11654 (val!4048 Int)) )
))
(declare-datatypes ((ValueCell!3660 0))(
  ( (ValueCellFull!3660 (v!6242 V!11653)) (EmptyCell!3660) )
))
(declare-datatypes ((array!19587 0))(
  ( (array!19588 (arr!9287 (Array (_ BitVec 32) ValueCell!3660)) (size!9639 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19587)

(declare-fun mapDefault!13518 () ValueCell!3660)

(assert (=> b!356331 (= condMapEmpty!13518 (= (arr!9287 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3660)) mapDefault!13518)))))

(declare-fun b!356333 () Bool)

(assert (=> b!356333 (= e!218347 (not true))))

(assert (=> b!356333 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11653)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10966 0))(
  ( (Unit!10967) )
))
(declare-fun lt!165926 () Unit!10966)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11653)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!2 (array!19585 array!19587 (_ BitVec 32) (_ BitVec 32) V!11653 V!11653 (_ BitVec 64) (_ BitVec 32)) Unit!10966)

(assert (=> b!356333 (= lt!165926 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!2 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356334 () Bool)

(declare-fun res!197707 () Bool)

(assert (=> b!356334 (=> (not res!197707) (not e!218347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356334 (= res!197707 (validKeyInArray!0 k0!1077))))

(declare-fun b!356335 () Bool)

(declare-fun res!197700 () Bool)

(assert (=> b!356335 (=> (not res!197700) (not e!218347))))

(assert (=> b!356335 (= res!197700 (not (= (select (arr!9286 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapNonEmpty!13518 () Bool)

(declare-fun tp!27495 () Bool)

(declare-fun e!218349 () Bool)

(assert (=> mapNonEmpty!13518 (= mapRes!13518 (and tp!27495 e!218349))))

(declare-fun mapRest!13518 () (Array (_ BitVec 32) ValueCell!3660))

(declare-fun mapValue!13518 () ValueCell!3660)

(declare-fun mapKey!13518 () (_ BitVec 32))

(assert (=> mapNonEmpty!13518 (= (arr!9287 _values!1208) (store mapRest!13518 mapKey!13518 mapValue!13518))))

(declare-fun res!197704 () Bool)

(assert (=> start!35554 (=> (not res!197704) (not e!218347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35554 (= res!197704 (validMask!0 mask!1842))))

(assert (=> start!35554 e!218347))

(declare-fun tp_is_empty!8007 () Bool)

(assert (=> start!35554 tp_is_empty!8007))

(assert (=> start!35554 true))

(declare-fun array_inv!6824 (array!19585) Bool)

(assert (=> start!35554 (array_inv!6824 _keys!1456)))

(declare-fun array_inv!6825 (array!19587) Bool)

(assert (=> start!35554 (and (array_inv!6825 _values!1208) e!218351)))

(declare-fun b!356332 () Bool)

(assert (=> b!356332 (= e!218350 tp_is_empty!8007)))

(declare-fun b!356336 () Bool)

(declare-fun res!197703 () Bool)

(assert (=> b!356336 (=> (not res!197703) (not e!218347))))

(assert (=> b!356336 (= res!197703 (and (= (size!9639 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9638 _keys!1456) (size!9639 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13518 () Bool)

(assert (=> mapIsEmpty!13518 mapRes!13518))

(declare-fun b!356337 () Bool)

(declare-fun res!197706 () Bool)

(assert (=> b!356337 (=> (not res!197706) (not e!218347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19585 (_ BitVec 32)) Bool)

(assert (=> b!356337 (= res!197706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356338 () Bool)

(assert (=> b!356338 (= e!218349 tp_is_empty!8007)))

(assert (= (and start!35554 res!197704) b!356336))

(assert (= (and b!356336 res!197703) b!356337))

(assert (= (and b!356337 res!197706) b!356330))

(assert (= (and b!356330 res!197705) b!356334))

(assert (= (and b!356334 res!197707) b!356328))

(assert (= (and b!356328 res!197701) b!356329))

(assert (= (and b!356329 res!197702) b!356335))

(assert (= (and b!356335 res!197700) b!356333))

(assert (= (and b!356331 condMapEmpty!13518) mapIsEmpty!13518))

(assert (= (and b!356331 (not condMapEmpty!13518)) mapNonEmpty!13518))

(get-info :version)

(assert (= (and mapNonEmpty!13518 ((_ is ValueCellFull!3660) mapValue!13518)) b!356338))

(assert (= (and b!356331 ((_ is ValueCellFull!3660) mapDefault!13518)) b!356332))

(assert (= start!35554 b!356331))

(declare-fun m!354761 () Bool)

(assert (=> b!356334 m!354761))

(declare-fun m!354763 () Bool)

(assert (=> b!356329 m!354763))

(declare-fun m!354765 () Bool)

(assert (=> start!35554 m!354765))

(declare-fun m!354767 () Bool)

(assert (=> start!35554 m!354767))

(declare-fun m!354769 () Bool)

(assert (=> start!35554 m!354769))

(declare-fun m!354771 () Bool)

(assert (=> b!356337 m!354771))

(declare-fun m!354773 () Bool)

(assert (=> mapNonEmpty!13518 m!354773))

(declare-fun m!354775 () Bool)

(assert (=> b!356330 m!354775))

(declare-fun m!354777 () Bool)

(assert (=> b!356335 m!354777))

(declare-fun m!354779 () Bool)

(assert (=> b!356333 m!354779))

(declare-fun m!354781 () Bool)

(assert (=> b!356333 m!354781))

(check-sat (not b!356334) (not start!35554) tp_is_empty!8007 (not b!356329) (not b!356337) (not b!356330) (not b!356333) (not mapNonEmpty!13518))
(check-sat)
