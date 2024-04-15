; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!806 () Bool)

(assert start!806)

(declare-fun b_free!199 () Bool)

(declare-fun b_next!199 () Bool)

(assert (=> start!806 (= b_free!199 (not b_next!199))))

(declare-fun tp!827 () Bool)

(declare-fun b_and!345 () Bool)

(assert (=> start!806 (= tp!827 b_and!345)))

(declare-fun b!6048 () Bool)

(declare-fun e!3301 () Bool)

(declare-datatypes ((array!481 0))(
  ( (array!482 (arr!229 (Array (_ BitVec 32) (_ BitVec 64))) (size!291 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!481)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6048 (= e!3301 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6049 () Bool)

(declare-fun e!3304 () Bool)

(declare-fun tp_is_empty!277 () Bool)

(assert (=> b!6049 (= e!3304 tp_is_empty!277)))

(declare-fun b!6051 () Bool)

(declare-fun res!6581 () Bool)

(declare-fun e!3303 () Bool)

(assert (=> b!6051 (=> (not res!6581) (not e!3303))))

(declare-datatypes ((List!151 0))(
  ( (Nil!148) (Cons!147 (h!713 (_ BitVec 64)) (t!2286 List!151)) )
))
(declare-fun arrayNoDuplicates!0 (array!481 (_ BitVec 32) List!151) Bool)

(assert (=> b!6051 (= res!6581 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!148))))

(declare-fun b!6052 () Bool)

(declare-fun res!6582 () Bool)

(assert (=> b!6052 (=> (not res!6582) (not e!3303))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!547 0))(
  ( (V!548 (val!144 Int)) )
))
(declare-datatypes ((ValueCell!122 0))(
  ( (ValueCellFull!122 (v!1235 V!547)) (EmptyCell!122) )
))
(declare-datatypes ((array!483 0))(
  ( (array!484 (arr!230 (Array (_ BitVec 32) ValueCell!122)) (size!292 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!483)

(declare-fun minValue!1434 () V!547)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!547)

(declare-datatypes ((tuple2!142 0))(
  ( (tuple2!143 (_1!71 (_ BitVec 64)) (_2!71 V!547)) )
))
(declare-datatypes ((List!152 0))(
  ( (Nil!149) (Cons!148 (h!714 tuple2!142) (t!2287 List!152)) )
))
(declare-datatypes ((ListLongMap!147 0))(
  ( (ListLongMap!148 (toList!89 List!152)) )
))
(declare-fun contains!63 (ListLongMap!147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!48 (array!481 array!483 (_ BitVec 32) (_ BitVec 32) V!547 V!547 (_ BitVec 32) Int) ListLongMap!147)

(assert (=> b!6052 (= res!6582 (contains!63 (getCurrentListMap!48 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!386 () Bool)

(declare-fun mapRes!386 () Bool)

(assert (=> mapIsEmpty!386 mapRes!386))

(declare-fun b!6053 () Bool)

(declare-fun e!3302 () Bool)

(assert (=> b!6053 (= e!3303 (not e!3302))))

(declare-fun res!6585 () Bool)

(assert (=> b!6053 (=> res!6585 e!3302)))

(assert (=> b!6053 (= res!6585 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6053 e!3301))

(declare-fun c!431 () Bool)

(assert (=> b!6053 (= c!431 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!91 0))(
  ( (Unit!92) )
))
(declare-fun lt!1098 () Unit!91)

(declare-fun lemmaKeyInListMapIsInArray!31 (array!481 array!483 (_ BitVec 32) (_ BitVec 32) V!547 V!547 (_ BitVec 64) Int) Unit!91)

(assert (=> b!6053 (= lt!1098 (lemmaKeyInListMapIsInArray!31 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!386 () Bool)

(declare-fun tp!826 () Bool)

(declare-fun e!3305 () Bool)

(assert (=> mapNonEmpty!386 (= mapRes!386 (and tp!826 e!3305))))

(declare-fun mapRest!386 () (Array (_ BitVec 32) ValueCell!122))

(declare-fun mapValue!386 () ValueCell!122)

(declare-fun mapKey!386 () (_ BitVec 32))

(assert (=> mapNonEmpty!386 (= (arr!230 _values!1492) (store mapRest!386 mapKey!386 mapValue!386))))

(declare-fun b!6054 () Bool)

(declare-fun res!6584 () Bool)

(assert (=> b!6054 (=> (not res!6584) (not e!3303))))

(assert (=> b!6054 (= res!6584 (and (= (size!292 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!291 _keys!1806) (size!292 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6055 () Bool)

(assert (=> b!6055 (= e!3305 tp_is_empty!277)))

(declare-fun res!6583 () Bool)

(assert (=> start!806 (=> (not res!6583) (not e!3303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!806 (= res!6583 (validMask!0 mask!2250))))

(assert (=> start!806 e!3303))

(assert (=> start!806 tp!827))

(assert (=> start!806 true))

(declare-fun e!3299 () Bool)

(declare-fun array_inv!161 (array!483) Bool)

(assert (=> start!806 (and (array_inv!161 _values!1492) e!3299)))

(assert (=> start!806 tp_is_empty!277))

(declare-fun array_inv!162 (array!481) Bool)

(assert (=> start!806 (array_inv!162 _keys!1806)))

(declare-fun b!6050 () Bool)

(assert (=> b!6050 (= e!3301 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6056 () Bool)

(assert (=> b!6056 (= e!3299 (and e!3304 mapRes!386))))

(declare-fun condMapEmpty!386 () Bool)

(declare-fun mapDefault!386 () ValueCell!122)

(assert (=> b!6056 (= condMapEmpty!386 (= (arr!230 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!122)) mapDefault!386)))))

(declare-fun b!6057 () Bool)

(declare-fun res!6586 () Bool)

(assert (=> b!6057 (=> (not res!6586) (not e!3303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!481 (_ BitVec 32)) Bool)

(assert (=> b!6057 (= res!6586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6058 () Bool)

(declare-fun res!6580 () Bool)

(assert (=> b!6058 (=> (not res!6580) (not e!3303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6058 (= res!6580 (validKeyInArray!0 k0!1278))))

(declare-fun b!6059 () Bool)

(assert (=> b!6059 (= e!3302 true)))

(declare-fun lt!1097 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!481 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6059 (= lt!1097 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(assert (= (and start!806 res!6583) b!6054))

(assert (= (and b!6054 res!6584) b!6057))

(assert (= (and b!6057 res!6586) b!6051))

(assert (= (and b!6051 res!6581) b!6052))

(assert (= (and b!6052 res!6582) b!6058))

(assert (= (and b!6058 res!6580) b!6053))

(assert (= (and b!6053 c!431) b!6048))

(assert (= (and b!6053 (not c!431)) b!6050))

(assert (= (and b!6053 (not res!6585)) b!6059))

(assert (= (and b!6056 condMapEmpty!386) mapIsEmpty!386))

(assert (= (and b!6056 (not condMapEmpty!386)) mapNonEmpty!386))

(get-info :version)

(assert (= (and mapNonEmpty!386 ((_ is ValueCellFull!122) mapValue!386)) b!6055))

(assert (= (and b!6056 ((_ is ValueCellFull!122) mapDefault!386)) b!6049))

(assert (= start!806 b!6056))

(declare-fun m!3425 () Bool)

(assert (=> b!6057 m!3425))

(declare-fun m!3427 () Bool)

(assert (=> start!806 m!3427))

(declare-fun m!3429 () Bool)

(assert (=> start!806 m!3429))

(declare-fun m!3431 () Bool)

(assert (=> start!806 m!3431))

(declare-fun m!3433 () Bool)

(assert (=> b!6051 m!3433))

(declare-fun m!3435 () Bool)

(assert (=> b!6052 m!3435))

(assert (=> b!6052 m!3435))

(declare-fun m!3437 () Bool)

(assert (=> b!6052 m!3437))

(declare-fun m!3439 () Bool)

(assert (=> b!6059 m!3439))

(declare-fun m!3441 () Bool)

(assert (=> b!6048 m!3441))

(assert (=> b!6053 m!3441))

(declare-fun m!3443 () Bool)

(assert (=> b!6053 m!3443))

(declare-fun m!3445 () Bool)

(assert (=> mapNonEmpty!386 m!3445))

(declare-fun m!3447 () Bool)

(assert (=> b!6058 m!3447))

(check-sat (not start!806) (not b!6058) (not b_next!199) (not mapNonEmpty!386) (not b!6059) b_and!345 (not b!6052) (not b!6057) (not b!6051) tp_is_empty!277 (not b!6048) (not b!6053))
(check-sat b_and!345 (not b_next!199))
