; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!550 () Bool)

(assert start!550)

(declare-fun mapNonEmpty!122 () Bool)

(declare-fun mapRes!122 () Bool)

(declare-fun tp!362 () Bool)

(declare-fun e!1520 () Bool)

(assert (=> mapNonEmpty!122 (= mapRes!122 (and tp!362 e!1520))))

(declare-datatypes ((V!325 0))(
  ( (V!326 (val!61 Int)) )
))
(declare-datatypes ((ValueCell!39 0))(
  ( (ValueCellFull!39 (v!1148 V!325)) (EmptyCell!39) )
))
(declare-datatypes ((array!161 0))(
  ( (array!162 (arr!74 (Array (_ BitVec 32) ValueCell!39)) (size!136 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!161)

(declare-fun mapKey!122 () (_ BitVec 32))

(declare-fun mapRest!122 () (Array (_ BitVec 32) ValueCell!39))

(declare-fun mapValue!122 () ValueCell!39)

(assert (=> mapNonEmpty!122 (= (arr!74 _values!1492) (store mapRest!122 mapKey!122 mapValue!122))))

(declare-fun b!3285 () Bool)

(declare-fun tp_is_empty!111 () Bool)

(assert (=> b!3285 (= e!1520 tp_is_empty!111)))

(declare-fun b!3286 () Bool)

(declare-fun e!1522 () Bool)

(declare-fun e!1519 () Bool)

(assert (=> b!3286 (= e!1522 (and e!1519 mapRes!122))))

(declare-fun condMapEmpty!122 () Bool)

(declare-fun mapDefault!122 () ValueCell!39)

(assert (=> b!3286 (= condMapEmpty!122 (= (arr!74 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!39)) mapDefault!122)))))

(declare-fun b!3287 () Bool)

(declare-fun res!5104 () Bool)

(declare-fun e!1521 () Bool)

(assert (=> b!3287 (=> (not res!5104) (not e!1521))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!163 0))(
  ( (array!164 (arr!75 (Array (_ BitVec 32) (_ BitVec 64))) (size!137 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!163)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3287 (= res!5104 (and (= (size!136 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!137 _keys!1806) (size!136 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!122 () Bool)

(assert (=> mapIsEmpty!122 mapRes!122))

(declare-fun b!3288 () Bool)

(assert (=> b!3288 (= e!1521 false)))

(declare-fun lt!450 () Bool)

(declare-datatypes ((List!52 0))(
  ( (Nil!49) (Cons!48 (h!614 (_ BitVec 64)) (t!2179 List!52)) )
))
(declare-fun arrayNoDuplicates!0 (array!163 (_ BitVec 32) List!52) Bool)

(assert (=> b!3288 (= lt!450 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!49))))

(declare-fun res!5102 () Bool)

(assert (=> start!550 (=> (not res!5102) (not e!1521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!550 (= res!5102 (validMask!0 mask!2250))))

(assert (=> start!550 e!1521))

(assert (=> start!550 true))

(declare-fun array_inv!49 (array!161) Bool)

(assert (=> start!550 (and (array_inv!49 _values!1492) e!1522)))

(declare-fun array_inv!50 (array!163) Bool)

(assert (=> start!550 (array_inv!50 _keys!1806)))

(declare-fun b!3289 () Bool)

(assert (=> b!3289 (= e!1519 tp_is_empty!111)))

(declare-fun b!3290 () Bool)

(declare-fun res!5103 () Bool)

(assert (=> b!3290 (=> (not res!5103) (not e!1521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!163 (_ BitVec 32)) Bool)

(assert (=> b!3290 (= res!5103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!550 res!5102) b!3287))

(assert (= (and b!3287 res!5104) b!3290))

(assert (= (and b!3290 res!5103) b!3288))

(assert (= (and b!3286 condMapEmpty!122) mapIsEmpty!122))

(assert (= (and b!3286 (not condMapEmpty!122)) mapNonEmpty!122))

(get-info :version)

(assert (= (and mapNonEmpty!122 ((_ is ValueCellFull!39) mapValue!122)) b!3285))

(assert (= (and b!3286 ((_ is ValueCellFull!39) mapDefault!122)) b!3289))

(assert (= start!550 b!3286))

(declare-fun m!1553 () Bool)

(assert (=> mapNonEmpty!122 m!1553))

(declare-fun m!1555 () Bool)

(assert (=> b!3288 m!1555))

(declare-fun m!1557 () Bool)

(assert (=> start!550 m!1557))

(declare-fun m!1559 () Bool)

(assert (=> start!550 m!1559))

(declare-fun m!1561 () Bool)

(assert (=> start!550 m!1561))

(declare-fun m!1563 () Bool)

(assert (=> b!3290 m!1563))

(check-sat (not mapNonEmpty!122) (not b!3290) (not start!550) (not b!3288) tp_is_empty!111)
(check-sat)
