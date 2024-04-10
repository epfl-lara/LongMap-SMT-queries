; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!784 () Bool)

(assert start!784)

(declare-fun b_free!177 () Bool)

(declare-fun b_next!177 () Bool)

(assert (=> start!784 (= b_free!177 (not b_next!177))))

(declare-fun tp!760 () Bool)

(declare-fun b_and!323 () Bool)

(assert (=> start!784 (= tp!760 b_and!323)))

(declare-fun b!5652 () Bool)

(declare-fun e!3072 () Bool)

(declare-fun tp_is_empty!255 () Bool)

(assert (=> b!5652 (= e!3072 tp_is_empty!255)))

(declare-fun b!5653 () Bool)

(declare-fun e!3069 () Bool)

(declare-datatypes ((array!447 0))(
  ( (array!448 (arr!212 (Array (_ BitVec 32) (_ BitVec 64))) (size!274 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!447)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5653 (= e!3069 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5654 () Bool)

(declare-fun res!6352 () Bool)

(declare-fun e!3071 () Bool)

(assert (=> b!5654 (=> (not res!6352) (not e!3071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5654 (= res!6352 (validKeyInArray!0 k0!1278))))

(declare-fun b!5655 () Bool)

(declare-fun e!3073 () Bool)

(assert (=> b!5655 (= e!3073 true)))

(declare-fun lt!1032 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!447 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5655 (= lt!1032 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!353 () Bool)

(declare-fun mapRes!353 () Bool)

(declare-fun tp!761 () Bool)

(declare-fun e!3070 () Bool)

(assert (=> mapNonEmpty!353 (= mapRes!353 (and tp!761 e!3070))))

(declare-datatypes ((V!517 0))(
  ( (V!518 (val!133 Int)) )
))
(declare-datatypes ((ValueCell!111 0))(
  ( (ValueCellFull!111 (v!1224 V!517)) (EmptyCell!111) )
))
(declare-fun mapValue!353 () ValueCell!111)

(declare-fun mapRest!353 () (Array (_ BitVec 32) ValueCell!111))

(declare-datatypes ((array!449 0))(
  ( (array!450 (arr!213 (Array (_ BitVec 32) ValueCell!111)) (size!275 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!449)

(declare-fun mapKey!353 () (_ BitVec 32))

(assert (=> mapNonEmpty!353 (= (arr!213 _values!1492) (store mapRest!353 mapKey!353 mapValue!353))))

(declare-fun b!5656 () Bool)

(declare-fun res!6351 () Bool)

(assert (=> b!5656 (=> (not res!6351) (not e!3071))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!447 (_ BitVec 32)) Bool)

(assert (=> b!5656 (= res!6351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!6355 () Bool)

(assert (=> start!784 (=> (not res!6355) (not e!3071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!784 (= res!6355 (validMask!0 mask!2250))))

(assert (=> start!784 e!3071))

(assert (=> start!784 tp!760))

(assert (=> start!784 true))

(declare-fun e!3068 () Bool)

(declare-fun array_inv!157 (array!449) Bool)

(assert (=> start!784 (and (array_inv!157 _values!1492) e!3068)))

(assert (=> start!784 tp_is_empty!255))

(declare-fun array_inv!158 (array!447) Bool)

(assert (=> start!784 (array_inv!158 _keys!1806)))

(declare-fun b!5657 () Bool)

(declare-fun res!6354 () Bool)

(assert (=> b!5657 (=> (not res!6354) (not e!3071))))

(declare-fun minValue!1434 () V!517)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!517)

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((tuple2!130 0))(
  ( (tuple2!131 (_1!65 (_ BitVec 64)) (_2!65 V!517)) )
))
(declare-datatypes ((List!143 0))(
  ( (Nil!140) (Cons!139 (h!705 tuple2!130) (t!2278 List!143)) )
))
(declare-datatypes ((ListLongMap!135 0))(
  ( (ListLongMap!136 (toList!83 List!143)) )
))
(declare-fun contains!57 (ListLongMap!135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!42 (array!447 array!449 (_ BitVec 32) (_ BitVec 32) V!517 V!517 (_ BitVec 32) Int) ListLongMap!135)

(assert (=> b!5657 (= res!6354 (contains!57 (getCurrentListMap!42 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5658 () Bool)

(assert (=> b!5658 (= e!3071 (not e!3073))))

(declare-fun res!6353 () Bool)

(assert (=> b!5658 (=> res!6353 e!3073)))

(assert (=> b!5658 (= res!6353 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5658 e!3069))

(declare-fun c!398 () Bool)

(assert (=> b!5658 (= c!398 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!79 0))(
  ( (Unit!80) )
))
(declare-fun lt!1031 () Unit!79)

(declare-fun lemmaKeyInListMapIsInArray!25 (array!447 array!449 (_ BitVec 32) (_ BitVec 32) V!517 V!517 (_ BitVec 64) Int) Unit!79)

(assert (=> b!5658 (= lt!1031 (lemmaKeyInListMapIsInArray!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!5659 () Bool)

(assert (=> b!5659 (= e!3069 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5660 () Bool)

(declare-fun res!6350 () Bool)

(assert (=> b!5660 (=> (not res!6350) (not e!3071))))

(assert (=> b!5660 (= res!6350 (and (= (size!275 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!274 _keys!1806) (size!275 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5661 () Bool)

(assert (=> b!5661 (= e!3068 (and e!3072 mapRes!353))))

(declare-fun condMapEmpty!353 () Bool)

(declare-fun mapDefault!353 () ValueCell!111)

(assert (=> b!5661 (= condMapEmpty!353 (= (arr!213 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!111)) mapDefault!353)))))

(declare-fun mapIsEmpty!353 () Bool)

(assert (=> mapIsEmpty!353 mapRes!353))

(declare-fun b!5662 () Bool)

(declare-fun res!6349 () Bool)

(assert (=> b!5662 (=> (not res!6349) (not e!3071))))

(declare-datatypes ((List!144 0))(
  ( (Nil!141) (Cons!140 (h!706 (_ BitVec 64)) (t!2279 List!144)) )
))
(declare-fun arrayNoDuplicates!0 (array!447 (_ BitVec 32) List!144) Bool)

(assert (=> b!5662 (= res!6349 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!141))))

(declare-fun b!5663 () Bool)

(assert (=> b!5663 (= e!3070 tp_is_empty!255)))

(assert (= (and start!784 res!6355) b!5660))

(assert (= (and b!5660 res!6350) b!5656))

(assert (= (and b!5656 res!6351) b!5662))

(assert (= (and b!5662 res!6349) b!5657))

(assert (= (and b!5657 res!6354) b!5654))

(assert (= (and b!5654 res!6352) b!5658))

(assert (= (and b!5658 c!398) b!5653))

(assert (= (and b!5658 (not c!398)) b!5659))

(assert (= (and b!5658 (not res!6353)) b!5655))

(assert (= (and b!5661 condMapEmpty!353) mapIsEmpty!353))

(assert (= (and b!5661 (not condMapEmpty!353)) mapNonEmpty!353))

(get-info :version)

(assert (= (and mapNonEmpty!353 ((_ is ValueCellFull!111) mapValue!353)) b!5663))

(assert (= (and b!5661 ((_ is ValueCellFull!111) mapDefault!353)) b!5652))

(assert (= start!784 b!5661))

(declare-fun m!3161 () Bool)

(assert (=> start!784 m!3161))

(declare-fun m!3163 () Bool)

(assert (=> start!784 m!3163))

(declare-fun m!3165 () Bool)

(assert (=> start!784 m!3165))

(declare-fun m!3167 () Bool)

(assert (=> b!5653 m!3167))

(declare-fun m!3169 () Bool)

(assert (=> mapNonEmpty!353 m!3169))

(declare-fun m!3171 () Bool)

(assert (=> b!5655 m!3171))

(declare-fun m!3173 () Bool)

(assert (=> b!5657 m!3173))

(assert (=> b!5657 m!3173))

(declare-fun m!3175 () Bool)

(assert (=> b!5657 m!3175))

(declare-fun m!3177 () Bool)

(assert (=> b!5654 m!3177))

(declare-fun m!3179 () Bool)

(assert (=> b!5656 m!3179))

(declare-fun m!3181 () Bool)

(assert (=> b!5662 m!3181))

(assert (=> b!5658 m!3167))

(declare-fun m!3183 () Bool)

(assert (=> b!5658 m!3183))

(check-sat (not b!5655) (not mapNonEmpty!353) (not b!5653) (not b!5658) (not b!5662) (not b!5656) (not b!5654) b_and!323 (not b_next!177) tp_is_empty!255 (not b!5657) (not start!784))
(check-sat b_and!323 (not b_next!177))
