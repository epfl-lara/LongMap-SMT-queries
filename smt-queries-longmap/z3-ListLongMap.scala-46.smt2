; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!790 () Bool)

(assert start!790)

(declare-fun b_free!183 () Bool)

(declare-fun b_next!183 () Bool)

(assert (=> start!790 (= b_free!183 (not b_next!183))))

(declare-fun tp!778 () Bool)

(declare-fun b_and!329 () Bool)

(assert (=> start!790 (= tp!778 b_and!329)))

(declare-fun b!5760 () Bool)

(declare-fun res!6415 () Bool)

(declare-fun e!3133 () Bool)

(assert (=> b!5760 (=> (not res!6415) (not e!3133))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!525 0))(
  ( (V!526 (val!136 Int)) )
))
(declare-datatypes ((ValueCell!114 0))(
  ( (ValueCellFull!114 (v!1227 V!525)) (EmptyCell!114) )
))
(declare-datatypes ((array!457 0))(
  ( (array!458 (arr!217 (Array (_ BitVec 32) ValueCell!114)) (size!279 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!457)

(declare-fun minValue!1434 () V!525)

(declare-datatypes ((array!459 0))(
  ( (array!460 (arr!218 (Array (_ BitVec 32) (_ BitVec 64))) (size!280 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!459)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!525)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((tuple2!134 0))(
  ( (tuple2!135 (_1!67 (_ BitVec 64)) (_2!67 V!525)) )
))
(declare-datatypes ((List!146 0))(
  ( (Nil!143) (Cons!142 (h!708 tuple2!134) (t!2281 List!146)) )
))
(declare-datatypes ((ListLongMap!139 0))(
  ( (ListLongMap!140 (toList!85 List!146)) )
))
(declare-fun contains!59 (ListLongMap!139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!44 (array!459 array!457 (_ BitVec 32) (_ BitVec 32) V!525 V!525 (_ BitVec 32) Int) ListLongMap!139)

(assert (=> b!5760 (= res!6415 (contains!59 (getCurrentListMap!44 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5761 () Bool)

(declare-fun e!3135 () Bool)

(assert (=> b!5761 (= e!3135 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5762 () Bool)

(declare-fun e!3137 () Bool)

(declare-fun e!3134 () Bool)

(declare-fun mapRes!362 () Bool)

(assert (=> b!5762 (= e!3137 (and e!3134 mapRes!362))))

(declare-fun condMapEmpty!362 () Bool)

(declare-fun mapDefault!362 () ValueCell!114)

(assert (=> b!5762 (= condMapEmpty!362 (= (arr!217 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!114)) mapDefault!362)))))

(declare-fun b!5763 () Bool)

(declare-fun e!3132 () Bool)

(assert (=> b!5763 (= e!3133 (not e!3132))))

(declare-fun res!6418 () Bool)

(assert (=> b!5763 (=> res!6418 e!3132)))

(declare-fun arrayContainsKey!0 (array!459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5763 (= res!6418 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5763 e!3135))

(declare-fun c!407 () Bool)

(assert (=> b!5763 (= c!407 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!83 0))(
  ( (Unit!84) )
))
(declare-fun lt!1050 () Unit!83)

(declare-fun lemmaKeyInListMapIsInArray!27 (array!459 array!457 (_ BitVec 32) (_ BitVec 32) V!525 V!525 (_ BitVec 64) Int) Unit!83)

(assert (=> b!5763 (= lt!1050 (lemmaKeyInListMapIsInArray!27 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!5764 () Bool)

(declare-fun res!6413 () Bool)

(assert (=> b!5764 (=> (not res!6413) (not e!3133))))

(assert (=> b!5764 (= res!6413 (and (= (size!279 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!280 _keys!1806) (size!279 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5765 () Bool)

(declare-fun res!6417 () Bool)

(assert (=> b!5765 (=> (not res!6417) (not e!3133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!459 (_ BitVec 32)) Bool)

(assert (=> b!5765 (= res!6417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5766 () Bool)

(assert (=> b!5766 (= e!3135 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!362 () Bool)

(assert (=> mapIsEmpty!362 mapRes!362))

(declare-fun b!5767 () Bool)

(declare-fun tp_is_empty!261 () Bool)

(assert (=> b!5767 (= e!3134 tp_is_empty!261)))

(declare-fun b!5768 () Bool)

(declare-fun res!6416 () Bool)

(assert (=> b!5768 (=> (not res!6416) (not e!3133))))

(declare-datatypes ((List!147 0))(
  ( (Nil!144) (Cons!143 (h!709 (_ BitVec 64)) (t!2282 List!147)) )
))
(declare-fun arrayNoDuplicates!0 (array!459 (_ BitVec 32) List!147) Bool)

(assert (=> b!5768 (= res!6416 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!144))))

(declare-fun mapNonEmpty!362 () Bool)

(declare-fun tp!779 () Bool)

(declare-fun e!3136 () Bool)

(assert (=> mapNonEmpty!362 (= mapRes!362 (and tp!779 e!3136))))

(declare-fun mapRest!362 () (Array (_ BitVec 32) ValueCell!114))

(declare-fun mapKey!362 () (_ BitVec 32))

(declare-fun mapValue!362 () ValueCell!114)

(assert (=> mapNonEmpty!362 (= (arr!217 _values!1492) (store mapRest!362 mapKey!362 mapValue!362))))

(declare-fun b!5769 () Bool)

(assert (=> b!5769 (= e!3132 true)))

(declare-fun lt!1049 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!459 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5769 (= lt!1049 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun res!6414 () Bool)

(assert (=> start!790 (=> (not res!6414) (not e!3133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!790 (= res!6414 (validMask!0 mask!2250))))

(assert (=> start!790 e!3133))

(assert (=> start!790 tp!778))

(assert (=> start!790 true))

(declare-fun array_inv!159 (array!457) Bool)

(assert (=> start!790 (and (array_inv!159 _values!1492) e!3137)))

(assert (=> start!790 tp_is_empty!261))

(declare-fun array_inv!160 (array!459) Bool)

(assert (=> start!790 (array_inv!160 _keys!1806)))

(declare-fun b!5770 () Bool)

(declare-fun res!6412 () Bool)

(assert (=> b!5770 (=> (not res!6412) (not e!3133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5770 (= res!6412 (validKeyInArray!0 k0!1278))))

(declare-fun b!5771 () Bool)

(assert (=> b!5771 (= e!3136 tp_is_empty!261)))

(assert (= (and start!790 res!6414) b!5764))

(assert (= (and b!5764 res!6413) b!5765))

(assert (= (and b!5765 res!6417) b!5768))

(assert (= (and b!5768 res!6416) b!5760))

(assert (= (and b!5760 res!6415) b!5770))

(assert (= (and b!5770 res!6412) b!5763))

(assert (= (and b!5763 c!407) b!5766))

(assert (= (and b!5763 (not c!407)) b!5761))

(assert (= (and b!5763 (not res!6418)) b!5769))

(assert (= (and b!5762 condMapEmpty!362) mapIsEmpty!362))

(assert (= (and b!5762 (not condMapEmpty!362)) mapNonEmpty!362))

(get-info :version)

(assert (= (and mapNonEmpty!362 ((_ is ValueCellFull!114) mapValue!362)) b!5771))

(assert (= (and b!5762 ((_ is ValueCellFull!114) mapDefault!362)) b!5767))

(assert (= start!790 b!5762))

(declare-fun m!3233 () Bool)

(assert (=> b!5766 m!3233))

(declare-fun m!3235 () Bool)

(assert (=> start!790 m!3235))

(declare-fun m!3237 () Bool)

(assert (=> start!790 m!3237))

(declare-fun m!3239 () Bool)

(assert (=> start!790 m!3239))

(declare-fun m!3241 () Bool)

(assert (=> b!5760 m!3241))

(assert (=> b!5760 m!3241))

(declare-fun m!3243 () Bool)

(assert (=> b!5760 m!3243))

(declare-fun m!3245 () Bool)

(assert (=> b!5765 m!3245))

(declare-fun m!3247 () Bool)

(assert (=> mapNonEmpty!362 m!3247))

(assert (=> b!5763 m!3233))

(declare-fun m!3249 () Bool)

(assert (=> b!5763 m!3249))

(declare-fun m!3251 () Bool)

(assert (=> b!5768 m!3251))

(declare-fun m!3253 () Bool)

(assert (=> b!5769 m!3253))

(declare-fun m!3255 () Bool)

(assert (=> b!5770 m!3255))

(check-sat (not b!5770) (not b!5763) (not b!5760) (not b!5765) (not start!790) (not b_next!183) (not mapNonEmpty!362) (not b!5769) tp_is_empty!261 (not b!5766) b_and!329 (not b!5768))
(check-sat b_and!329 (not b_next!183))
