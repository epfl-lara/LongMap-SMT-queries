; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78370 () Bool)

(assert start!78370)

(declare-fun b_free!16693 () Bool)

(declare-fun b_next!16693 () Bool)

(assert (=> start!78370 (= b_free!16693 (not b_next!16693))))

(declare-fun tp!58357 () Bool)

(declare-fun b_and!27279 () Bool)

(assert (=> start!78370 (= tp!58357 b_and!27279)))

(declare-fun b!913556 () Bool)

(declare-fun res!615995 () Bool)

(declare-fun e!512518 () Bool)

(assert (=> b!913556 (=> (not res!615995) (not e!512518))))

(declare-datatypes ((V!30447 0))(
  ( (V!30448 (val!9606 Int)) )
))
(declare-datatypes ((ValueCell!9074 0))(
  ( (ValueCellFull!9074 (v!12114 V!30447)) (EmptyCell!9074) )
))
(declare-datatypes ((array!54271 0))(
  ( (array!54272 (arr!26085 (Array (_ BitVec 32) ValueCell!9074)) (size!26545 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54271)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54273 0))(
  ( (array!54274 (arr!26086 (Array (_ BitVec 32) (_ BitVec 64))) (size!26546 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54273)

(assert (=> b!913556 (= res!615995 (and (= (size!26545 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26546 _keys!1386) (size!26545 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913557 () Bool)

(assert (=> b!913557 (= e!512518 (not true))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913557 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30447)

(declare-datatypes ((Unit!30870 0))(
  ( (Unit!30871) )
))
(declare-fun lt!411051 () Unit!30870)

(declare-fun minValue!1094 () V!30447)

(declare-fun lemmaKeyInListMapIsInArray!266 (array!54273 array!54271 (_ BitVec 32) (_ BitVec 32) V!30447 V!30447 (_ BitVec 64) Int) Unit!30870)

(assert (=> b!913557 (= lt!411051 (lemmaKeyInListMapIsInArray!266 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!30394 () Bool)

(declare-fun mapRes!30394 () Bool)

(declare-fun tp!58356 () Bool)

(declare-fun e!512517 () Bool)

(assert (=> mapNonEmpty!30394 (= mapRes!30394 (and tp!58356 e!512517))))

(declare-fun mapKey!30394 () (_ BitVec 32))

(declare-fun mapValue!30394 () ValueCell!9074)

(declare-fun mapRest!30394 () (Array (_ BitVec 32) ValueCell!9074))

(assert (=> mapNonEmpty!30394 (= (arr!26085 _values!1152) (store mapRest!30394 mapKey!30394 mapValue!30394))))

(declare-fun b!913558 () Bool)

(declare-fun res!615994 () Bool)

(assert (=> b!913558 (=> (not res!615994) (not e!512518))))

(declare-datatypes ((List!18291 0))(
  ( (Nil!18288) (Cons!18287 (h!19439 (_ BitVec 64)) (t!25872 List!18291)) )
))
(declare-fun arrayNoDuplicates!0 (array!54273 (_ BitVec 32) List!18291) Bool)

(assert (=> b!913558 (= res!615994 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18288))))

(declare-fun b!913559 () Bool)

(declare-fun e!512516 () Bool)

(declare-fun e!512520 () Bool)

(assert (=> b!913559 (= e!512516 (and e!512520 mapRes!30394))))

(declare-fun condMapEmpty!30394 () Bool)

(declare-fun mapDefault!30394 () ValueCell!9074)

(assert (=> b!913559 (= condMapEmpty!30394 (= (arr!26085 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9074)) mapDefault!30394)))))

(declare-fun b!913560 () Bool)

(declare-fun res!615997 () Bool)

(assert (=> b!913560 (=> (not res!615997) (not e!512518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54273 (_ BitVec 32)) Bool)

(assert (=> b!913560 (= res!615997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913561 () Bool)

(declare-fun tp_is_empty!19111 () Bool)

(assert (=> b!913561 (= e!512517 tp_is_empty!19111)))

(declare-fun res!615992 () Bool)

(assert (=> start!78370 (=> (not res!615992) (not e!512518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78370 (= res!615992 (validMask!0 mask!1756))))

(assert (=> start!78370 e!512518))

(declare-fun array_inv!20464 (array!54271) Bool)

(assert (=> start!78370 (and (array_inv!20464 _values!1152) e!512516)))

(assert (=> start!78370 tp!58357))

(assert (=> start!78370 true))

(assert (=> start!78370 tp_is_empty!19111))

(declare-fun array_inv!20465 (array!54273) Bool)

(assert (=> start!78370 (array_inv!20465 _keys!1386)))

(declare-fun b!913562 () Bool)

(assert (=> b!913562 (= e!512520 tp_is_empty!19111)))

(declare-fun b!913563 () Bool)

(declare-fun res!615996 () Bool)

(assert (=> b!913563 (=> (not res!615996) (not e!512518))))

(declare-datatypes ((tuple2!12472 0))(
  ( (tuple2!12473 (_1!6247 (_ BitVec 64)) (_2!6247 V!30447)) )
))
(declare-datatypes ((List!18292 0))(
  ( (Nil!18289) (Cons!18288 (h!19440 tuple2!12472) (t!25873 List!18292)) )
))
(declare-datatypes ((ListLongMap!11171 0))(
  ( (ListLongMap!11172 (toList!5601 List!18292)) )
))
(declare-fun contains!4656 (ListLongMap!11171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2862 (array!54273 array!54271 (_ BitVec 32) (_ BitVec 32) V!30447 V!30447 (_ BitVec 32) Int) ListLongMap!11171)

(assert (=> b!913563 (= res!615996 (contains!4656 (getCurrentListMap!2862 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913564 () Bool)

(declare-fun res!615993 () Bool)

(assert (=> b!913564 (=> (not res!615993) (not e!512518))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!913564 (= res!615993 (and (= (select (arr!26086 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!30394 () Bool)

(assert (=> mapIsEmpty!30394 mapRes!30394))

(declare-fun b!913565 () Bool)

(declare-fun res!615998 () Bool)

(assert (=> b!913565 (=> (not res!615998) (not e!512518))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913565 (= res!615998 (inRange!0 i!717 mask!1756))))

(assert (= (and start!78370 res!615992) b!913556))

(assert (= (and b!913556 res!615995) b!913560))

(assert (= (and b!913560 res!615997) b!913558))

(assert (= (and b!913558 res!615994) b!913563))

(assert (= (and b!913563 res!615996) b!913565))

(assert (= (and b!913565 res!615998) b!913564))

(assert (= (and b!913564 res!615993) b!913557))

(assert (= (and b!913559 condMapEmpty!30394) mapIsEmpty!30394))

(assert (= (and b!913559 (not condMapEmpty!30394)) mapNonEmpty!30394))

(get-info :version)

(assert (= (and mapNonEmpty!30394 ((_ is ValueCellFull!9074) mapValue!30394)) b!913561))

(assert (= (and b!913559 ((_ is ValueCellFull!9074) mapDefault!30394)) b!913562))

(assert (= start!78370 b!913559))

(declare-fun m!848409 () Bool)

(assert (=> start!78370 m!848409))

(declare-fun m!848411 () Bool)

(assert (=> start!78370 m!848411))

(declare-fun m!848413 () Bool)

(assert (=> start!78370 m!848413))

(declare-fun m!848415 () Bool)

(assert (=> b!913558 m!848415))

(declare-fun m!848417 () Bool)

(assert (=> b!913557 m!848417))

(declare-fun m!848419 () Bool)

(assert (=> b!913557 m!848419))

(declare-fun m!848421 () Bool)

(assert (=> b!913565 m!848421))

(declare-fun m!848423 () Bool)

(assert (=> b!913560 m!848423))

(declare-fun m!848425 () Bool)

(assert (=> b!913563 m!848425))

(assert (=> b!913563 m!848425))

(declare-fun m!848427 () Bool)

(assert (=> b!913563 m!848427))

(declare-fun m!848429 () Bool)

(assert (=> b!913564 m!848429))

(declare-fun m!848431 () Bool)

(assert (=> mapNonEmpty!30394 m!848431))

(check-sat (not start!78370) (not b!913557) (not b!913558) (not b!913565) (not b_next!16693) (not mapNonEmpty!30394) (not b!913560) tp_is_empty!19111 (not b!913563) b_and!27279)
(check-sat b_and!27279 (not b_next!16693))
