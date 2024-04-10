; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!720 () Bool)

(assert start!720)

(declare-fun b_free!153 () Bool)

(declare-fun b_next!153 () Bool)

(assert (=> start!720 (= b_free!153 (not b_next!153))))

(declare-fun tp!682 () Bool)

(declare-fun b_and!295 () Bool)

(assert (=> start!720 (= tp!682 b_and!295)))

(declare-fun res!6012 () Bool)

(declare-fun e!2668 () Bool)

(assert (=> start!720 (=> (not res!6012) (not e!2668))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!720 (= res!6012 (validMask!0 mask!2250))))

(assert (=> start!720 e!2668))

(assert (=> start!720 tp!682))

(assert (=> start!720 true))

(declare-datatypes ((V!485 0))(
  ( (V!486 (val!121 Int)) )
))
(declare-datatypes ((ValueCell!99 0))(
  ( (ValueCellFull!99 (v!1210 V!485)) (EmptyCell!99) )
))
(declare-datatypes ((array!395 0))(
  ( (array!396 (arr!188 (Array (_ BitVec 32) ValueCell!99)) (size!250 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!395)

(declare-fun e!2669 () Bool)

(declare-fun array_inv!139 (array!395) Bool)

(assert (=> start!720 (and (array_inv!139 _values!1492) e!2669)))

(declare-fun tp_is_empty!231 () Bool)

(assert (=> start!720 tp_is_empty!231))

(declare-datatypes ((array!397 0))(
  ( (array!398 (arr!189 (Array (_ BitVec 32) (_ BitVec 64))) (size!251 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!397)

(declare-fun array_inv!140 (array!397) Bool)

(assert (=> start!720 (array_inv!140 _keys!1806)))

(declare-fun mapIsEmpty!311 () Bool)

(declare-fun mapRes!311 () Bool)

(assert (=> mapIsEmpty!311 mapRes!311))

(declare-fun b!4991 () Bool)

(declare-fun res!6013 () Bool)

(assert (=> b!4991 (=> (not res!6013) (not e!2668))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4991 (= res!6013 (and (= (size!250 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!251 _keys!1806) (size!250 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4992 () Bool)

(declare-fun res!6010 () Bool)

(assert (=> b!4992 (=> (not res!6010) (not e!2668))))

(declare-datatypes ((List!123 0))(
  ( (Nil!120) (Cons!119 (h!685 (_ BitVec 64)) (t!2254 List!123)) )
))
(declare-fun arrayNoDuplicates!0 (array!397 (_ BitVec 32) List!123) Bool)

(assert (=> b!4992 (= res!6010 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!120))))

(declare-fun b!4993 () Bool)

(declare-fun e!2671 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(assert (=> b!4993 (= e!2671 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4994 () Bool)

(declare-fun e!2672 () Bool)

(assert (=> b!4994 (= e!2672 tp_is_empty!231)))

(declare-fun b!4995 () Bool)

(declare-fun arrayContainsKey!0 (array!397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4995 (= e!2671 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4996 () Bool)

(assert (=> b!4996 (= e!2668 (not true))))

(assert (=> b!4996 e!2671))

(declare-fun c!302 () Bool)

(assert (=> b!4996 (= c!302 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((Unit!57 0))(
  ( (Unit!58) )
))
(declare-fun lt!810 () Unit!57)

(declare-fun minValue!1434 () V!485)

(declare-fun zeroValue!1434 () V!485)

(declare-fun lemmaKeyInListMapIsInArray!16 (array!397 array!395 (_ BitVec 32) (_ BitVec 32) V!485 V!485 (_ BitVec 64) Int) Unit!57)

(assert (=> b!4996 (= lt!810 (lemmaKeyInListMapIsInArray!16 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!4997 () Bool)

(declare-fun e!2670 () Bool)

(assert (=> b!4997 (= e!2670 tp_is_empty!231)))

(declare-fun mapNonEmpty!311 () Bool)

(declare-fun tp!683 () Bool)

(assert (=> mapNonEmpty!311 (= mapRes!311 (and tp!683 e!2670))))

(declare-fun mapKey!311 () (_ BitVec 32))

(declare-fun mapValue!311 () ValueCell!99)

(declare-fun mapRest!311 () (Array (_ BitVec 32) ValueCell!99))

(assert (=> mapNonEmpty!311 (= (arr!188 _values!1492) (store mapRest!311 mapKey!311 mapValue!311))))

(declare-fun b!4998 () Bool)

(declare-fun res!6009 () Bool)

(assert (=> b!4998 (=> (not res!6009) (not e!2668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!397 (_ BitVec 32)) Bool)

(assert (=> b!4998 (= res!6009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4999 () Bool)

(declare-fun res!6011 () Bool)

(assert (=> b!4999 (=> (not res!6011) (not e!2668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4999 (= res!6011 (validKeyInArray!0 k0!1278))))

(declare-fun b!5000 () Bool)

(declare-fun res!6008 () Bool)

(assert (=> b!5000 (=> (not res!6008) (not e!2668))))

(declare-datatypes ((tuple2!112 0))(
  ( (tuple2!113 (_1!56 (_ BitVec 64)) (_2!56 V!485)) )
))
(declare-datatypes ((List!124 0))(
  ( (Nil!121) (Cons!120 (h!686 tuple2!112) (t!2255 List!124)) )
))
(declare-datatypes ((ListLongMap!117 0))(
  ( (ListLongMap!118 (toList!74 List!124)) )
))
(declare-fun contains!46 (ListLongMap!117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!33 (array!397 array!395 (_ BitVec 32) (_ BitVec 32) V!485 V!485 (_ BitVec 32) Int) ListLongMap!117)

(assert (=> b!5000 (= res!6008 (contains!46 (getCurrentListMap!33 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5001 () Bool)

(assert (=> b!5001 (= e!2669 (and e!2672 mapRes!311))))

(declare-fun condMapEmpty!311 () Bool)

(declare-fun mapDefault!311 () ValueCell!99)

(assert (=> b!5001 (= condMapEmpty!311 (= (arr!188 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!99)) mapDefault!311)))))

(assert (= (and start!720 res!6012) b!4991))

(assert (= (and b!4991 res!6013) b!4998))

(assert (= (and b!4998 res!6009) b!4992))

(assert (= (and b!4992 res!6010) b!5000))

(assert (= (and b!5000 res!6008) b!4999))

(assert (= (and b!4999 res!6011) b!4996))

(assert (= (and b!4996 c!302) b!4995))

(assert (= (and b!4996 (not c!302)) b!4993))

(assert (= (and b!5001 condMapEmpty!311) mapIsEmpty!311))

(assert (= (and b!5001 (not condMapEmpty!311)) mapNonEmpty!311))

(get-info :version)

(assert (= (and mapNonEmpty!311 ((_ is ValueCellFull!99) mapValue!311)) b!4997))

(assert (= (and b!5001 ((_ is ValueCellFull!99) mapDefault!311)) b!4994))

(assert (= start!720 b!5001))

(declare-fun m!2727 () Bool)

(assert (=> mapNonEmpty!311 m!2727))

(declare-fun m!2729 () Bool)

(assert (=> b!4992 m!2729))

(declare-fun m!2731 () Bool)

(assert (=> b!5000 m!2731))

(assert (=> b!5000 m!2731))

(declare-fun m!2733 () Bool)

(assert (=> b!5000 m!2733))

(declare-fun m!2735 () Bool)

(assert (=> start!720 m!2735))

(declare-fun m!2737 () Bool)

(assert (=> start!720 m!2737))

(declare-fun m!2739 () Bool)

(assert (=> start!720 m!2739))

(declare-fun m!2741 () Bool)

(assert (=> b!4999 m!2741))

(declare-fun m!2743 () Bool)

(assert (=> b!4996 m!2743))

(declare-fun m!2745 () Bool)

(assert (=> b!4998 m!2745))

(declare-fun m!2747 () Bool)

(assert (=> b!4995 m!2747))

(check-sat (not b!4995) (not b!4992) (not b_next!153) (not b!4999) tp_is_empty!231 (not mapNonEmpty!311) (not b!4998) b_and!295 (not b!5000) (not start!720) (not b!4996))
(check-sat b_and!295 (not b_next!153))
