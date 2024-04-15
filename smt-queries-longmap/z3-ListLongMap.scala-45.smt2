; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!782 () Bool)

(assert start!782)

(declare-fun b_free!175 () Bool)

(declare-fun b_next!175 () Bool)

(assert (=> start!782 (= b_free!175 (not b_next!175))))

(declare-fun tp!755 () Bool)

(declare-fun b_and!321 () Bool)

(assert (=> start!782 (= tp!755 b_and!321)))

(declare-fun mapIsEmpty!350 () Bool)

(declare-fun mapRes!350 () Bool)

(assert (=> mapIsEmpty!350 mapRes!350))

(declare-fun b!5616 () Bool)

(declare-fun res!6331 () Bool)

(declare-fun e!3049 () Bool)

(assert (=> b!5616 (=> (not res!6331) (not e!3049))))

(declare-datatypes ((array!433 0))(
  ( (array!434 (arr!205 (Array (_ BitVec 32) (_ BitVec 64))) (size!267 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!433)

(declare-datatypes ((List!133 0))(
  ( (Nil!130) (Cons!129 (h!695 (_ BitVec 64)) (t!2268 List!133)) )
))
(declare-fun arrayNoDuplicates!0 (array!433 (_ BitVec 32) List!133) Bool)

(assert (=> b!5616 (= res!6331 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!130))))

(declare-fun b!5617 () Bool)

(declare-fun e!3050 () Bool)

(declare-fun tp_is_empty!253 () Bool)

(assert (=> b!5617 (= e!3050 tp_is_empty!253)))

(declare-fun b!5618 () Bool)

(declare-fun res!6330 () Bool)

(assert (=> b!5618 (=> (not res!6330) (not e!3049))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!433 (_ BitVec 32)) Bool)

(assert (=> b!5618 (= res!6330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5619 () Bool)

(declare-fun e!3052 () Bool)

(assert (=> b!5619 (= e!3052 true)))

(declare-fun lt!1026 () (_ BitVec 32))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!433 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5619 (= lt!1026 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5620 () Bool)

(declare-fun res!6329 () Bool)

(assert (=> b!5620 (=> (not res!6329) (not e!3049))))

(declare-datatypes ((V!515 0))(
  ( (V!516 (val!132 Int)) )
))
(declare-datatypes ((ValueCell!110 0))(
  ( (ValueCellFull!110 (v!1223 V!515)) (EmptyCell!110) )
))
(declare-datatypes ((array!435 0))(
  ( (array!436 (arr!206 (Array (_ BitVec 32) ValueCell!110)) (size!268 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!435)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5620 (= res!6329 (and (= (size!268 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!267 _keys!1806) (size!268 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5621 () Bool)

(declare-fun res!6332 () Bool)

(assert (=> b!5621 (=> (not res!6332) (not e!3049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5621 (= res!6332 (validKeyInArray!0 k0!1278))))

(declare-fun b!5622 () Bool)

(declare-fun res!6334 () Bool)

(assert (=> b!5622 (=> (not res!6334) (not e!3049))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!515)

(declare-fun zeroValue!1434 () V!515)

(declare-datatypes ((tuple2!124 0))(
  ( (tuple2!125 (_1!62 (_ BitVec 64)) (_2!62 V!515)) )
))
(declare-datatypes ((List!134 0))(
  ( (Nil!131) (Cons!130 (h!696 tuple2!124) (t!2269 List!134)) )
))
(declare-datatypes ((ListLongMap!129 0))(
  ( (ListLongMap!130 (toList!80 List!134)) )
))
(declare-fun contains!54 (ListLongMap!129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!39 (array!433 array!435 (_ BitVec 32) (_ BitVec 32) V!515 V!515 (_ BitVec 32) Int) ListLongMap!129)

(assert (=> b!5622 (= res!6334 (contains!54 (getCurrentListMap!39 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5623 () Bool)

(declare-fun e!3048 () Bool)

(assert (=> b!5623 (= e!3048 (and e!3050 mapRes!350))))

(declare-fun condMapEmpty!350 () Bool)

(declare-fun mapDefault!350 () ValueCell!110)

(assert (=> b!5623 (= condMapEmpty!350 (= (arr!206 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!110)) mapDefault!350)))))

(declare-fun res!6328 () Bool)

(assert (=> start!782 (=> (not res!6328) (not e!3049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!782 (= res!6328 (validMask!0 mask!2250))))

(assert (=> start!782 e!3049))

(assert (=> start!782 tp!755))

(assert (=> start!782 true))

(declare-fun array_inv!141 (array!435) Bool)

(assert (=> start!782 (and (array_inv!141 _values!1492) e!3048)))

(assert (=> start!782 tp_is_empty!253))

(declare-fun array_inv!142 (array!433) Bool)

(assert (=> start!782 (array_inv!142 _keys!1806)))

(declare-fun b!5624 () Bool)

(assert (=> b!5624 (= e!3049 (not e!3052))))

(declare-fun res!6333 () Bool)

(assert (=> b!5624 (=> res!6333 e!3052)))

(declare-fun arrayContainsKey!0 (array!433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5624 (= res!6333 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3053 () Bool)

(assert (=> b!5624 e!3053))

(declare-fun c!395 () Bool)

(assert (=> b!5624 (= c!395 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!73 0))(
  ( (Unit!74) )
))
(declare-fun lt!1025 () Unit!73)

(declare-fun lemmaKeyInListMapIsInArray!22 (array!433 array!435 (_ BitVec 32) (_ BitVec 32) V!515 V!515 (_ BitVec 64) Int) Unit!73)

(assert (=> b!5624 (= lt!1025 (lemmaKeyInListMapIsInArray!22 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!350 () Bool)

(declare-fun tp!754 () Bool)

(declare-fun e!3051 () Bool)

(assert (=> mapNonEmpty!350 (= mapRes!350 (and tp!754 e!3051))))

(declare-fun mapValue!350 () ValueCell!110)

(declare-fun mapKey!350 () (_ BitVec 32))

(declare-fun mapRest!350 () (Array (_ BitVec 32) ValueCell!110))

(assert (=> mapNonEmpty!350 (= (arr!206 _values!1492) (store mapRest!350 mapKey!350 mapValue!350))))

(declare-fun b!5625 () Bool)

(assert (=> b!5625 (= e!3053 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5626 () Bool)

(assert (=> b!5626 (= e!3051 tp_is_empty!253)))

(declare-fun b!5627 () Bool)

(assert (=> b!5627 (= e!3053 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(assert (= (and start!782 res!6328) b!5620))

(assert (= (and b!5620 res!6329) b!5618))

(assert (= (and b!5618 res!6330) b!5616))

(assert (= (and b!5616 res!6331) b!5622))

(assert (= (and b!5622 res!6334) b!5621))

(assert (= (and b!5621 res!6332) b!5624))

(assert (= (and b!5624 c!395) b!5627))

(assert (= (and b!5624 (not c!395)) b!5625))

(assert (= (and b!5624 (not res!6333)) b!5619))

(assert (= (and b!5623 condMapEmpty!350) mapIsEmpty!350))

(assert (= (and b!5623 (not condMapEmpty!350)) mapNonEmpty!350))

(get-info :version)

(assert (= (and mapNonEmpty!350 ((_ is ValueCellFull!110) mapValue!350)) b!5626))

(assert (= (and b!5623 ((_ is ValueCellFull!110) mapDefault!350)) b!5617))

(assert (= start!782 b!5623))

(declare-fun m!3137 () Bool)

(assert (=> b!5621 m!3137))

(declare-fun m!3139 () Bool)

(assert (=> b!5616 m!3139))

(declare-fun m!3141 () Bool)

(assert (=> start!782 m!3141))

(declare-fun m!3143 () Bool)

(assert (=> start!782 m!3143))

(declare-fun m!3145 () Bool)

(assert (=> start!782 m!3145))

(declare-fun m!3147 () Bool)

(assert (=> b!5618 m!3147))

(declare-fun m!3149 () Bool)

(assert (=> b!5627 m!3149))

(declare-fun m!3151 () Bool)

(assert (=> b!5622 m!3151))

(assert (=> b!5622 m!3151))

(declare-fun m!3153 () Bool)

(assert (=> b!5622 m!3153))

(assert (=> b!5624 m!3149))

(declare-fun m!3155 () Bool)

(assert (=> b!5624 m!3155))

(declare-fun m!3157 () Bool)

(assert (=> mapNonEmpty!350 m!3157))

(declare-fun m!3159 () Bool)

(assert (=> b!5619 m!3159))

(check-sat (not b!5621) (not b!5618) (not mapNonEmpty!350) (not b_next!175) (not b!5624) (not start!782) (not b!5616) (not b!5627) (not b!5619) (not b!5622) tp_is_empty!253 b_and!321)
(check-sat b_and!321 (not b_next!175))
