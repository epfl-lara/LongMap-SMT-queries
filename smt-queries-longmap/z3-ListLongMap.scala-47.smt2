; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!794 () Bool)

(assert start!794)

(declare-fun b_free!187 () Bool)

(declare-fun b_next!187 () Bool)

(assert (=> start!794 (= b_free!187 (not b_next!187))))

(declare-fun tp!791 () Bool)

(declare-fun b_and!333 () Bool)

(assert (=> start!794 (= tp!791 b_and!333)))

(declare-fun b!5832 () Bool)

(declare-fun e!3179 () Bool)

(declare-fun tp_is_empty!265 () Bool)

(assert (=> b!5832 (= e!3179 tp_is_empty!265)))

(declare-fun b!5833 () Bool)

(declare-fun res!6457 () Bool)

(declare-fun e!3174 () Bool)

(assert (=> b!5833 (=> (not res!6457) (not e!3174))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5833 (= res!6457 (validKeyInArray!0 k0!1278))))

(declare-fun b!5834 () Bool)

(declare-fun e!3176 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5834 (= e!3176 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5835 () Bool)

(declare-fun e!3175 () Bool)

(assert (=> b!5835 (= e!3175 true)))

(declare-fun lt!1061 () (_ BitVec 32))

(declare-datatypes ((array!457 0))(
  ( (array!458 (arr!217 (Array (_ BitVec 32) (_ BitVec 64))) (size!279 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!457)

(declare-fun arrayScanForKey!0 (array!457 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5835 (= lt!1061 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!368 () Bool)

(declare-fun mapRes!368 () Bool)

(declare-fun tp!790 () Bool)

(assert (=> mapNonEmpty!368 (= mapRes!368 (and tp!790 e!3179))))

(declare-fun mapKey!368 () (_ BitVec 32))

(declare-datatypes ((V!531 0))(
  ( (V!532 (val!138 Int)) )
))
(declare-datatypes ((ValueCell!116 0))(
  ( (ValueCellFull!116 (v!1229 V!531)) (EmptyCell!116) )
))
(declare-datatypes ((array!459 0))(
  ( (array!460 (arr!218 (Array (_ BitVec 32) ValueCell!116)) (size!280 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!459)

(declare-fun mapRest!368 () (Array (_ BitVec 32) ValueCell!116))

(declare-fun mapValue!368 () ValueCell!116)

(assert (=> mapNonEmpty!368 (= (arr!218 _values!1492) (store mapRest!368 mapKey!368 mapValue!368))))

(declare-fun res!6458 () Bool)

(assert (=> start!794 (=> (not res!6458) (not e!3174))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!794 (= res!6458 (validMask!0 mask!2250))))

(assert (=> start!794 e!3174))

(assert (=> start!794 tp!791))

(assert (=> start!794 true))

(declare-fun e!3177 () Bool)

(declare-fun array_inv!153 (array!459) Bool)

(assert (=> start!794 (and (array_inv!153 _values!1492) e!3177)))

(assert (=> start!794 tp_is_empty!265))

(declare-fun array_inv!154 (array!457) Bool)

(assert (=> start!794 (array_inv!154 _keys!1806)))

(declare-fun mapIsEmpty!368 () Bool)

(assert (=> mapIsEmpty!368 mapRes!368))

(declare-fun b!5836 () Bool)

(declare-fun res!6456 () Bool)

(assert (=> b!5836 (=> (not res!6456) (not e!3174))))

(assert (=> b!5836 (= res!6456 (and (= (size!280 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!279 _keys!1806) (size!280 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5837 () Bool)

(assert (=> b!5837 (= e!3174 (not e!3175))))

(declare-fun res!6459 () Bool)

(assert (=> b!5837 (=> res!6459 e!3175)))

(declare-fun arrayContainsKey!0 (array!457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5837 (= res!6459 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5837 e!3176))

(declare-fun c!413 () Bool)

(assert (=> b!5837 (= c!413 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1434 () V!531)

(declare-fun zeroValue!1434 () V!531)

(declare-datatypes ((Unit!85 0))(
  ( (Unit!86) )
))
(declare-fun lt!1062 () Unit!85)

(declare-fun defaultEntry!1495 () Int)

(declare-fun lemmaKeyInListMapIsInArray!28 (array!457 array!459 (_ BitVec 32) (_ BitVec 32) V!531 V!531 (_ BitVec 64) Int) Unit!85)

(assert (=> b!5837 (= lt!1062 (lemmaKeyInListMapIsInArray!28 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!5838 () Bool)

(declare-fun res!6455 () Bool)

(assert (=> b!5838 (=> (not res!6455) (not e!3174))))

(declare-datatypes ((tuple2!134 0))(
  ( (tuple2!135 (_1!67 (_ BitVec 64)) (_2!67 V!531)) )
))
(declare-datatypes ((List!143 0))(
  ( (Nil!140) (Cons!139 (h!705 tuple2!134) (t!2278 List!143)) )
))
(declare-datatypes ((ListLongMap!139 0))(
  ( (ListLongMap!140 (toList!85 List!143)) )
))
(declare-fun contains!59 (ListLongMap!139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!44 (array!457 array!459 (_ BitVec 32) (_ BitVec 32) V!531 V!531 (_ BitVec 32) Int) ListLongMap!139)

(assert (=> b!5838 (= res!6455 (contains!59 (getCurrentListMap!44 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5839 () Bool)

(declare-fun res!6454 () Bool)

(assert (=> b!5839 (=> (not res!6454) (not e!3174))))

(declare-datatypes ((List!144 0))(
  ( (Nil!141) (Cons!140 (h!706 (_ BitVec 64)) (t!2279 List!144)) )
))
(declare-fun arrayNoDuplicates!0 (array!457 (_ BitVec 32) List!144) Bool)

(assert (=> b!5839 (= res!6454 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!141))))

(declare-fun b!5840 () Bool)

(assert (=> b!5840 (= e!3176 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5841 () Bool)

(declare-fun e!3178 () Bool)

(assert (=> b!5841 (= e!3177 (and e!3178 mapRes!368))))

(declare-fun condMapEmpty!368 () Bool)

(declare-fun mapDefault!368 () ValueCell!116)

(assert (=> b!5841 (= condMapEmpty!368 (= (arr!218 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!116)) mapDefault!368)))))

(declare-fun b!5842 () Bool)

(assert (=> b!5842 (= e!3178 tp_is_empty!265)))

(declare-fun b!5843 () Bool)

(declare-fun res!6460 () Bool)

(assert (=> b!5843 (=> (not res!6460) (not e!3174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!457 (_ BitVec 32)) Bool)

(assert (=> b!5843 (= res!6460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!794 res!6458) b!5836))

(assert (= (and b!5836 res!6456) b!5843))

(assert (= (and b!5843 res!6460) b!5839))

(assert (= (and b!5839 res!6454) b!5838))

(assert (= (and b!5838 res!6455) b!5833))

(assert (= (and b!5833 res!6457) b!5837))

(assert (= (and b!5837 c!413) b!5840))

(assert (= (and b!5837 (not c!413)) b!5834))

(assert (= (and b!5837 (not res!6459)) b!5835))

(assert (= (and b!5841 condMapEmpty!368) mapIsEmpty!368))

(assert (= (and b!5841 (not condMapEmpty!368)) mapNonEmpty!368))

(get-info :version)

(assert (= (and mapNonEmpty!368 ((_ is ValueCellFull!116) mapValue!368)) b!5832))

(assert (= (and b!5841 ((_ is ValueCellFull!116) mapDefault!368)) b!5842))

(assert (= start!794 b!5841))

(declare-fun m!3281 () Bool)

(assert (=> b!5835 m!3281))

(declare-fun m!3283 () Bool)

(assert (=> mapNonEmpty!368 m!3283))

(declare-fun m!3285 () Bool)

(assert (=> b!5838 m!3285))

(assert (=> b!5838 m!3285))

(declare-fun m!3287 () Bool)

(assert (=> b!5838 m!3287))

(declare-fun m!3289 () Bool)

(assert (=> b!5840 m!3289))

(declare-fun m!3291 () Bool)

(assert (=> b!5833 m!3291))

(declare-fun m!3293 () Bool)

(assert (=> b!5839 m!3293))

(assert (=> b!5837 m!3289))

(declare-fun m!3295 () Bool)

(assert (=> b!5837 m!3295))

(declare-fun m!3297 () Bool)

(assert (=> b!5843 m!3297))

(declare-fun m!3299 () Bool)

(assert (=> start!794 m!3299))

(declare-fun m!3301 () Bool)

(assert (=> start!794 m!3301))

(declare-fun m!3303 () Bool)

(assert (=> start!794 m!3303))

(check-sat (not start!794) b_and!333 (not b!5843) (not b_next!187) (not mapNonEmpty!368) (not b!5835) tp_is_empty!265 (not b!5839) (not b!5838) (not b!5833) (not b!5837) (not b!5840))
(check-sat b_and!333 (not b_next!187))
