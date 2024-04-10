; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35560 () Bool)

(assert start!35560)

(declare-fun b!356427 () Bool)

(declare-fun e!218396 () Bool)

(assert (=> b!356427 (= e!218396 (not true))))

(declare-datatypes ((array!19595 0))(
  ( (array!19596 (arr!9291 (Array (_ BitVec 32) (_ BitVec 64))) (size!9643 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19595)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356427 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11661 0))(
  ( (V!11662 (val!4051 Int)) )
))
(declare-fun minValue!1150 () V!11661)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10970 0))(
  ( (Unit!10971) )
))
(declare-fun lt!165935 () Unit!10970)

(declare-datatypes ((ValueCell!3663 0))(
  ( (ValueCellFull!3663 (v!6245 V!11661)) (EmptyCell!3663) )
))
(declare-datatypes ((array!19597 0))(
  ( (array!19598 (arr!9292 (Array (_ BitVec 32) ValueCell!3663)) (size!9644 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19597)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11661)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!4 (array!19595 array!19597 (_ BitVec 32) (_ BitVec 32) V!11661 V!11661 (_ BitVec 64) (_ BitVec 32)) Unit!10970)

(assert (=> b!356427 (= lt!165935 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!4 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356428 () Bool)

(declare-fun res!197776 () Bool)

(assert (=> b!356428 (=> (not res!197776) (not e!218396))))

(assert (=> b!356428 (= res!197776 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356429 () Bool)

(declare-fun e!218395 () Bool)

(declare-fun tp_is_empty!8013 () Bool)

(assert (=> b!356429 (= e!218395 tp_is_empty!8013)))

(declare-fun b!356430 () Bool)

(declare-fun e!218393 () Bool)

(declare-fun e!218392 () Bool)

(declare-fun mapRes!13527 () Bool)

(assert (=> b!356430 (= e!218393 (and e!218392 mapRes!13527))))

(declare-fun condMapEmpty!13527 () Bool)

(declare-fun mapDefault!13527 () ValueCell!3663)

(assert (=> b!356430 (= condMapEmpty!13527 (= (arr!9292 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3663)) mapDefault!13527)))))

(declare-fun mapIsEmpty!13527 () Bool)

(assert (=> mapIsEmpty!13527 mapRes!13527))

(declare-fun res!197775 () Bool)

(assert (=> start!35560 (=> (not res!197775) (not e!218396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35560 (= res!197775 (validMask!0 mask!1842))))

(assert (=> start!35560 e!218396))

(assert (=> start!35560 tp_is_empty!8013))

(assert (=> start!35560 true))

(declare-fun array_inv!6828 (array!19595) Bool)

(assert (=> start!35560 (array_inv!6828 _keys!1456)))

(declare-fun array_inv!6829 (array!19597) Bool)

(assert (=> start!35560 (and (array_inv!6829 _values!1208) e!218393)))

(declare-fun b!356431 () Bool)

(declare-fun res!197773 () Bool)

(assert (=> b!356431 (=> (not res!197773) (not e!218396))))

(assert (=> b!356431 (= res!197773 (not (= (select (arr!9291 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356432 () Bool)

(declare-fun res!197778 () Bool)

(assert (=> b!356432 (=> (not res!197778) (not e!218396))))

(assert (=> b!356432 (= res!197778 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9643 _keys!1456))))))

(declare-fun b!356433 () Bool)

(declare-fun res!197774 () Bool)

(assert (=> b!356433 (=> (not res!197774) (not e!218396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356433 (= res!197774 (validKeyInArray!0 k0!1077))))

(declare-fun b!356434 () Bool)

(declare-fun res!197772 () Bool)

(assert (=> b!356434 (=> (not res!197772) (not e!218396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19595 (_ BitVec 32)) Bool)

(assert (=> b!356434 (= res!197772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356435 () Bool)

(declare-fun res!197779 () Bool)

(assert (=> b!356435 (=> (not res!197779) (not e!218396))))

(assert (=> b!356435 (= res!197779 (and (= (size!9644 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9643 _keys!1456) (size!9644 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356436 () Bool)

(assert (=> b!356436 (= e!218392 tp_is_empty!8013)))

(declare-fun b!356437 () Bool)

(declare-fun res!197777 () Bool)

(assert (=> b!356437 (=> (not res!197777) (not e!218396))))

(declare-datatypes ((List!5369 0))(
  ( (Nil!5366) (Cons!5365 (h!6221 (_ BitVec 64)) (t!10519 List!5369)) )
))
(declare-fun arrayNoDuplicates!0 (array!19595 (_ BitVec 32) List!5369) Bool)

(assert (=> b!356437 (= res!197777 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5366))))

(declare-fun mapNonEmpty!13527 () Bool)

(declare-fun tp!27504 () Bool)

(assert (=> mapNonEmpty!13527 (= mapRes!13527 (and tp!27504 e!218395))))

(declare-fun mapValue!13527 () ValueCell!3663)

(declare-fun mapRest!13527 () (Array (_ BitVec 32) ValueCell!3663))

(declare-fun mapKey!13527 () (_ BitVec 32))

(assert (=> mapNonEmpty!13527 (= (arr!9292 _values!1208) (store mapRest!13527 mapKey!13527 mapValue!13527))))

(assert (= (and start!35560 res!197775) b!356435))

(assert (= (and b!356435 res!197779) b!356434))

(assert (= (and b!356434 res!197772) b!356437))

(assert (= (and b!356437 res!197777) b!356433))

(assert (= (and b!356433 res!197774) b!356432))

(assert (= (and b!356432 res!197778) b!356428))

(assert (= (and b!356428 res!197776) b!356431))

(assert (= (and b!356431 res!197773) b!356427))

(assert (= (and b!356430 condMapEmpty!13527) mapIsEmpty!13527))

(assert (= (and b!356430 (not condMapEmpty!13527)) mapNonEmpty!13527))

(get-info :version)

(assert (= (and mapNonEmpty!13527 ((_ is ValueCellFull!3663) mapValue!13527)) b!356429))

(assert (= (and b!356430 ((_ is ValueCellFull!3663) mapDefault!13527)) b!356436))

(assert (= start!35560 b!356430))

(declare-fun m!354827 () Bool)

(assert (=> b!356433 m!354827))

(declare-fun m!354829 () Bool)

(assert (=> b!356427 m!354829))

(declare-fun m!354831 () Bool)

(assert (=> b!356427 m!354831))

(declare-fun m!354833 () Bool)

(assert (=> b!356428 m!354833))

(declare-fun m!354835 () Bool)

(assert (=> start!35560 m!354835))

(declare-fun m!354837 () Bool)

(assert (=> start!35560 m!354837))

(declare-fun m!354839 () Bool)

(assert (=> start!35560 m!354839))

(declare-fun m!354841 () Bool)

(assert (=> b!356431 m!354841))

(declare-fun m!354843 () Bool)

(assert (=> b!356434 m!354843))

(declare-fun m!354845 () Bool)

(assert (=> mapNonEmpty!13527 m!354845))

(declare-fun m!354847 () Bool)

(assert (=> b!356437 m!354847))

(check-sat (not b!356433) (not b!356427) (not b!356437) (not b!356428) (not mapNonEmpty!13527) (not b!356434) tp_is_empty!8013 (not start!35560))
(check-sat)
