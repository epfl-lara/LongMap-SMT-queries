; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!776 () Bool)

(assert start!776)

(declare-fun b_free!169 () Bool)

(declare-fun b_next!169 () Bool)

(assert (=> start!776 (= b_free!169 (not b_next!169))))

(declare-fun tp!737 () Bool)

(declare-fun b_and!315 () Bool)

(assert (=> start!776 (= tp!737 b_and!315)))

(declare-fun b!5515 () Bool)

(declare-fun e!2992 () Bool)

(assert (=> b!5515 (= e!2992 (not true))))

(declare-fun e!2995 () Bool)

(assert (=> b!5515 e!2995))

(declare-fun c!386 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(assert (=> b!5515 (= c!386 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!507 0))(
  ( (V!508 (val!129 Int)) )
))
(declare-datatypes ((ValueCell!107 0))(
  ( (ValueCellFull!107 (v!1220 V!507)) (EmptyCell!107) )
))
(declare-datatypes ((array!423 0))(
  ( (array!424 (arr!200 (Array (_ BitVec 32) ValueCell!107)) (size!262 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!423)

(declare-fun minValue!1434 () V!507)

(declare-datatypes ((array!425 0))(
  ( (array!426 (arr!201 (Array (_ BitVec 32) (_ BitVec 64))) (size!263 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!425)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!507)

(declare-datatypes ((Unit!71 0))(
  ( (Unit!72) )
))
(declare-fun lt!1014 () Unit!71)

(declare-fun lemmaKeyInListMapIsInArray!21 (array!425 array!423 (_ BitVec 32) (_ BitVec 32) V!507 V!507 (_ BitVec 64) Int) Unit!71)

(assert (=> b!5515 (= lt!1014 (lemmaKeyInListMapIsInArray!21 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!5516 () Bool)

(declare-fun e!2993 () Bool)

(declare-fun e!2991 () Bool)

(declare-fun mapRes!341 () Bool)

(assert (=> b!5516 (= e!2993 (and e!2991 mapRes!341))))

(declare-fun condMapEmpty!341 () Bool)

(declare-fun mapDefault!341 () ValueCell!107)

(assert (=> b!5516 (= condMapEmpty!341 (= (arr!200 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!107)) mapDefault!341)))))

(declare-fun b!5517 () Bool)

(declare-fun res!6273 () Bool)

(assert (=> b!5517 (=> (not res!6273) (not e!2992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5517 (= res!6273 (validKeyInArray!0 k0!1278))))

(declare-fun b!5518 () Bool)

(declare-fun res!6275 () Bool)

(assert (=> b!5518 (=> (not res!6275) (not e!2992))))

(declare-datatypes ((tuple2!122 0))(
  ( (tuple2!123 (_1!61 (_ BitVec 64)) (_2!61 V!507)) )
))
(declare-datatypes ((List!131 0))(
  ( (Nil!128) (Cons!127 (h!693 tuple2!122) (t!2266 List!131)) )
))
(declare-datatypes ((ListLongMap!127 0))(
  ( (ListLongMap!128 (toList!79 List!131)) )
))
(declare-fun contains!53 (ListLongMap!127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!38 (array!425 array!423 (_ BitVec 32) (_ BitVec 32) V!507 V!507 (_ BitVec 32) Int) ListLongMap!127)

(assert (=> b!5518 (= res!6275 (contains!53 (getCurrentListMap!38 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5519 () Bool)

(assert (=> b!5519 (= e!2995 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!6272 () Bool)

(assert (=> start!776 (=> (not res!6272) (not e!2992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!776 (= res!6272 (validMask!0 mask!2250))))

(assert (=> start!776 e!2992))

(assert (=> start!776 tp!737))

(assert (=> start!776 true))

(declare-fun array_inv!139 (array!423) Bool)

(assert (=> start!776 (and (array_inv!139 _values!1492) e!2993)))

(declare-fun tp_is_empty!247 () Bool)

(assert (=> start!776 tp_is_empty!247))

(declare-fun array_inv!140 (array!425) Bool)

(assert (=> start!776 (array_inv!140 _keys!1806)))

(declare-fun b!5520 () Bool)

(declare-fun res!6274 () Bool)

(assert (=> b!5520 (=> (not res!6274) (not e!2992))))

(assert (=> b!5520 (= res!6274 (and (= (size!262 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!263 _keys!1806) (size!262 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5521 () Bool)

(declare-fun e!2996 () Bool)

(assert (=> b!5521 (= e!2996 tp_is_empty!247)))

(declare-fun b!5522 () Bool)

(declare-fun arrayContainsKey!0 (array!425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5522 (= e!2995 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!341 () Bool)

(assert (=> mapIsEmpty!341 mapRes!341))

(declare-fun b!5523 () Bool)

(assert (=> b!5523 (= e!2991 tp_is_empty!247)))

(declare-fun b!5524 () Bool)

(declare-fun res!6277 () Bool)

(assert (=> b!5524 (=> (not res!6277) (not e!2992))))

(declare-datatypes ((List!132 0))(
  ( (Nil!129) (Cons!128 (h!694 (_ BitVec 64)) (t!2267 List!132)) )
))
(declare-fun arrayNoDuplicates!0 (array!425 (_ BitVec 32) List!132) Bool)

(assert (=> b!5524 (= res!6277 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!129))))

(declare-fun mapNonEmpty!341 () Bool)

(declare-fun tp!736 () Bool)

(assert (=> mapNonEmpty!341 (= mapRes!341 (and tp!736 e!2996))))

(declare-fun mapKey!341 () (_ BitVec 32))

(declare-fun mapValue!341 () ValueCell!107)

(declare-fun mapRest!341 () (Array (_ BitVec 32) ValueCell!107))

(assert (=> mapNonEmpty!341 (= (arr!200 _values!1492) (store mapRest!341 mapKey!341 mapValue!341))))

(declare-fun b!5525 () Bool)

(declare-fun res!6276 () Bool)

(assert (=> b!5525 (=> (not res!6276) (not e!2992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!425 (_ BitVec 32)) Bool)

(assert (=> b!5525 (= res!6276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!776 res!6272) b!5520))

(assert (= (and b!5520 res!6274) b!5525))

(assert (= (and b!5525 res!6276) b!5524))

(assert (= (and b!5524 res!6277) b!5518))

(assert (= (and b!5518 res!6275) b!5517))

(assert (= (and b!5517 res!6273) b!5515))

(assert (= (and b!5515 c!386) b!5522))

(assert (= (and b!5515 (not c!386)) b!5519))

(assert (= (and b!5516 condMapEmpty!341) mapIsEmpty!341))

(assert (= (and b!5516 (not condMapEmpty!341)) mapNonEmpty!341))

(get-info :version)

(assert (= (and mapNonEmpty!341 ((_ is ValueCellFull!107) mapValue!341)) b!5521))

(assert (= (and b!5516 ((_ is ValueCellFull!107) mapDefault!341)) b!5523))

(assert (= start!776 b!5516))

(declare-fun m!3071 () Bool)

(assert (=> start!776 m!3071))

(declare-fun m!3073 () Bool)

(assert (=> start!776 m!3073))

(declare-fun m!3075 () Bool)

(assert (=> start!776 m!3075))

(declare-fun m!3077 () Bool)

(assert (=> b!5517 m!3077))

(declare-fun m!3079 () Bool)

(assert (=> b!5525 m!3079))

(declare-fun m!3081 () Bool)

(assert (=> b!5515 m!3081))

(declare-fun m!3083 () Bool)

(assert (=> mapNonEmpty!341 m!3083))

(declare-fun m!3085 () Bool)

(assert (=> b!5522 m!3085))

(declare-fun m!3087 () Bool)

(assert (=> b!5518 m!3087))

(assert (=> b!5518 m!3087))

(declare-fun m!3089 () Bool)

(assert (=> b!5518 m!3089))

(declare-fun m!3091 () Bool)

(assert (=> b!5524 m!3091))

(check-sat (not b!5522) (not b_next!169) (not b!5518) (not b!5517) tp_is_empty!247 (not start!776) (not b!5524) (not mapNonEmpty!341) (not b!5515) b_and!315 (not b!5525))
(check-sat b_and!315 (not b_next!169))
