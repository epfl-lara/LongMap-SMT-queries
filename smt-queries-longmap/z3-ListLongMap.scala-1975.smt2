; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34698 () Bool)

(assert start!34698)

(declare-fun b_free!7519 () Bool)

(declare-fun b_next!7519 () Bool)

(assert (=> start!34698 (= b_free!7519 (not b_next!7519))))

(declare-fun tp!26121 () Bool)

(declare-fun b_and!14713 () Bool)

(assert (=> start!34698 (= tp!26121 b_and!14713)))

(declare-fun b!346704 () Bool)

(declare-fun res!191866 () Bool)

(declare-fun e!212453 () Bool)

(assert (=> b!346704 (=> (not res!191866) (not e!212453))))

(declare-datatypes ((array!18517 0))(
  ( (array!18518 (arr!8769 (Array (_ BitVec 32) (_ BitVec 64))) (size!9122 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18517)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18517 (_ BitVec 32)) Bool)

(assert (=> b!346704 (= res!191866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346705 () Bool)

(declare-fun res!191870 () Bool)

(assert (=> b!346705 (=> (not res!191870) (not e!212453))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10939 0))(
  ( (V!10940 (val!3780 Int)) )
))
(declare-fun zeroValue!1467 () V!10939)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3392 0))(
  ( (ValueCellFull!3392 (v!5956 V!10939)) (EmptyCell!3392) )
))
(declare-datatypes ((array!18519 0))(
  ( (array!18520 (arr!8770 (Array (_ BitVec 32) ValueCell!3392)) (size!9123 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18519)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10939)

(declare-datatypes ((tuple2!5426 0))(
  ( (tuple2!5427 (_1!2724 (_ BitVec 64)) (_2!2724 V!10939)) )
))
(declare-datatypes ((List!5043 0))(
  ( (Nil!5040) (Cons!5039 (h!5895 tuple2!5426) (t!10162 List!5043)) )
))
(declare-datatypes ((ListLongMap!4329 0))(
  ( (ListLongMap!4330 (toList!2180 List!5043)) )
))
(declare-fun contains!2255 (ListLongMap!4329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1686 (array!18517 array!18519 (_ BitVec 32) (_ BitVec 32) V!10939 V!10939 (_ BitVec 32) Int) ListLongMap!4329)

(assert (=> b!346705 (= res!191870 (not (contains!2255 (getCurrentListMap!1686 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!191868 () Bool)

(assert (=> start!34698 (=> (not res!191868) (not e!212453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34698 (= res!191868 (validMask!0 mask!2385))))

(assert (=> start!34698 e!212453))

(assert (=> start!34698 true))

(declare-fun tp_is_empty!7471 () Bool)

(assert (=> start!34698 tp_is_empty!7471))

(assert (=> start!34698 tp!26121))

(declare-fun e!212454 () Bool)

(declare-fun array_inv!6512 (array!18519) Bool)

(assert (=> start!34698 (and (array_inv!6512 _values!1525) e!212454)))

(declare-fun array_inv!6513 (array!18517) Bool)

(assert (=> start!34698 (array_inv!6513 _keys!1895)))

(declare-fun b!346706 () Bool)

(declare-fun res!191871 () Bool)

(assert (=> b!346706 (=> (not res!191871) (not e!212453))))

(declare-datatypes ((List!5044 0))(
  ( (Nil!5041) (Cons!5040 (h!5896 (_ BitVec 64)) (t!10163 List!5044)) )
))
(declare-fun arrayNoDuplicates!0 (array!18517 (_ BitVec 32) List!5044) Bool)

(assert (=> b!346706 (= res!191871 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5041))))

(declare-fun b!346707 () Bool)

(declare-fun e!212457 () Bool)

(declare-fun mapRes!12663 () Bool)

(assert (=> b!346707 (= e!212454 (and e!212457 mapRes!12663))))

(declare-fun condMapEmpty!12663 () Bool)

(declare-fun mapDefault!12663 () ValueCell!3392)

(assert (=> b!346707 (= condMapEmpty!12663 (= (arr!8770 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3392)) mapDefault!12663)))))

(declare-fun b!346708 () Bool)

(declare-fun res!191869 () Bool)

(assert (=> b!346708 (=> (not res!191869) (not e!212453))))

(assert (=> b!346708 (= res!191869 (and (= (size!9123 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9122 _keys!1895) (size!9123 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346709 () Bool)

(declare-fun res!191867 () Bool)

(assert (=> b!346709 (=> (not res!191867) (not e!212453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346709 (= res!191867 (validKeyInArray!0 k0!1348))))

(declare-fun b!346710 () Bool)

(assert (=> b!346710 (= e!212457 tp_is_empty!7471)))

(declare-fun mapIsEmpty!12663 () Bool)

(assert (=> mapIsEmpty!12663 mapRes!12663))

(declare-fun b!346711 () Bool)

(declare-fun e!212456 () Bool)

(assert (=> b!346711 (= e!212453 e!212456)))

(declare-fun res!191873 () Bool)

(assert (=> b!346711 (=> (not res!191873) (not e!212456))))

(declare-datatypes ((SeekEntryResult!3377 0))(
  ( (MissingZero!3377 (index!15687 (_ BitVec 32))) (Found!3377 (index!15688 (_ BitVec 32))) (Intermediate!3377 (undefined!4189 Bool) (index!15689 (_ BitVec 32)) (x!34554 (_ BitVec 32))) (Undefined!3377) (MissingVacant!3377 (index!15690 (_ BitVec 32))) )
))
(declare-fun lt!163232 () SeekEntryResult!3377)

(get-info :version)

(assert (=> b!346711 (= res!191873 (and ((_ is Found!3377) lt!163232) (= (select (arr!8769 _keys!1895) (index!15688 lt!163232)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18517 (_ BitVec 32)) SeekEntryResult!3377)

(assert (=> b!346711 (= lt!163232 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12663 () Bool)

(declare-fun tp!26120 () Bool)

(declare-fun e!212458 () Bool)

(assert (=> mapNonEmpty!12663 (= mapRes!12663 (and tp!26120 e!212458))))

(declare-fun mapValue!12663 () ValueCell!3392)

(declare-fun mapKey!12663 () (_ BitVec 32))

(declare-fun mapRest!12663 () (Array (_ BitVec 32) ValueCell!3392))

(assert (=> mapNonEmpty!12663 (= (arr!8770 _values!1525) (store mapRest!12663 mapKey!12663 mapValue!12663))))

(declare-fun b!346712 () Bool)

(declare-fun res!191872 () Bool)

(assert (=> b!346712 (=> (not res!191872) (not e!212456))))

(declare-fun arrayContainsKey!0 (array!18517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346712 (= res!191872 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15688 lt!163232)))))

(declare-fun b!346713 () Bool)

(assert (=> b!346713 (= e!212456 (not true))))

(assert (=> b!346713 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10742 0))(
  ( (Unit!10743) )
))
(declare-fun lt!163233 () Unit!10742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18517 (_ BitVec 64) (_ BitVec 32)) Unit!10742)

(assert (=> b!346713 (= lt!163233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15688 lt!163232)))))

(declare-fun b!346714 () Bool)

(assert (=> b!346714 (= e!212458 tp_is_empty!7471)))

(assert (= (and start!34698 res!191868) b!346708))

(assert (= (and b!346708 res!191869) b!346704))

(assert (= (and b!346704 res!191866) b!346706))

(assert (= (and b!346706 res!191871) b!346709))

(assert (= (and b!346709 res!191867) b!346705))

(assert (= (and b!346705 res!191870) b!346711))

(assert (= (and b!346711 res!191873) b!346712))

(assert (= (and b!346712 res!191872) b!346713))

(assert (= (and b!346707 condMapEmpty!12663) mapIsEmpty!12663))

(assert (= (and b!346707 (not condMapEmpty!12663)) mapNonEmpty!12663))

(assert (= (and mapNonEmpty!12663 ((_ is ValueCellFull!3392) mapValue!12663)) b!346714))

(assert (= (and b!346707 ((_ is ValueCellFull!3392) mapDefault!12663)) b!346710))

(assert (= start!34698 b!346707))

(declare-fun m!347249 () Bool)

(assert (=> b!346709 m!347249))

(declare-fun m!347251 () Bool)

(assert (=> b!346712 m!347251))

(declare-fun m!347253 () Bool)

(assert (=> b!346706 m!347253))

(declare-fun m!347255 () Bool)

(assert (=> mapNonEmpty!12663 m!347255))

(declare-fun m!347257 () Bool)

(assert (=> b!346713 m!347257))

(declare-fun m!347259 () Bool)

(assert (=> b!346713 m!347259))

(declare-fun m!347261 () Bool)

(assert (=> b!346711 m!347261))

(declare-fun m!347263 () Bool)

(assert (=> b!346711 m!347263))

(declare-fun m!347265 () Bool)

(assert (=> b!346705 m!347265))

(assert (=> b!346705 m!347265))

(declare-fun m!347267 () Bool)

(assert (=> b!346705 m!347267))

(declare-fun m!347269 () Bool)

(assert (=> b!346704 m!347269))

(declare-fun m!347271 () Bool)

(assert (=> start!34698 m!347271))

(declare-fun m!347273 () Bool)

(assert (=> start!34698 m!347273))

(declare-fun m!347275 () Bool)

(assert (=> start!34698 m!347275))

(check-sat (not start!34698) (not b!346705) (not b!346704) (not b_next!7519) (not b!346706) (not b!346713) (not mapNonEmpty!12663) (not b!346711) b_and!14713 (not b!346709) tp_is_empty!7471 (not b!346712))
(check-sat b_and!14713 (not b_next!7519))
