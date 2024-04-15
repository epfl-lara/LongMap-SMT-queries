; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!548 () Bool)

(assert start!548)

(declare-fun mapNonEmpty!119 () Bool)

(declare-fun mapRes!119 () Bool)

(declare-fun tp!359 () Bool)

(declare-fun e!1504 () Bool)

(assert (=> mapNonEmpty!119 (= mapRes!119 (and tp!359 e!1504))))

(declare-datatypes ((V!323 0))(
  ( (V!324 (val!60 Int)) )
))
(declare-datatypes ((ValueCell!38 0))(
  ( (ValueCellFull!38 (v!1147 V!323)) (EmptyCell!38) )
))
(declare-fun mapValue!119 () ValueCell!38)

(declare-datatypes ((array!151 0))(
  ( (array!152 (arr!69 (Array (_ BitVec 32) ValueCell!38)) (size!131 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!151)

(declare-fun mapKey!119 () (_ BitVec 32))

(declare-fun mapRest!119 () (Array (_ BitVec 32) ValueCell!38))

(assert (=> mapNonEmpty!119 (= (arr!69 _values!1492) (store mapRest!119 mapKey!119 mapValue!119))))

(declare-fun b!3267 () Bool)

(declare-fun res!5093 () Bool)

(declare-fun e!1508 () Bool)

(assert (=> b!3267 (=> (not res!5093) (not e!1508))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!153 0))(
  ( (array!154 (arr!70 (Array (_ BitVec 32) (_ BitVec 64))) (size!132 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!153)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3267 (= res!5093 (and (= (size!131 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!132 _keys!1806) (size!131 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3268 () Bool)

(declare-fun e!1507 () Bool)

(declare-fun tp_is_empty!109 () Bool)

(assert (=> b!3268 (= e!1507 tp_is_empty!109)))

(declare-fun b!3269 () Bool)

(declare-fun e!1505 () Bool)

(assert (=> b!3269 (= e!1505 (and e!1507 mapRes!119))))

(declare-fun condMapEmpty!119 () Bool)

(declare-fun mapDefault!119 () ValueCell!38)

(assert (=> b!3269 (= condMapEmpty!119 (= (arr!69 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!38)) mapDefault!119)))))

(declare-fun b!3270 () Bool)

(assert (=> b!3270 (= e!1508 false)))

(declare-fun lt!447 () Bool)

(declare-datatypes ((List!48 0))(
  ( (Nil!45) (Cons!44 (h!610 (_ BitVec 64)) (t!2175 List!48)) )
))
(declare-fun arrayNoDuplicates!0 (array!153 (_ BitVec 32) List!48) Bool)

(assert (=> b!3270 (= lt!447 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!45))))

(declare-fun b!3271 () Bool)

(declare-fun res!5094 () Bool)

(assert (=> b!3271 (=> (not res!5094) (not e!1508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!153 (_ BitVec 32)) Bool)

(assert (=> b!3271 (= res!5094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!5095 () Bool)

(assert (=> start!548 (=> (not res!5095) (not e!1508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!548 (= res!5095 (validMask!0 mask!2250))))

(assert (=> start!548 e!1508))

(assert (=> start!548 true))

(declare-fun array_inv!41 (array!151) Bool)

(assert (=> start!548 (and (array_inv!41 _values!1492) e!1505)))

(declare-fun array_inv!42 (array!153) Bool)

(assert (=> start!548 (array_inv!42 _keys!1806)))

(declare-fun b!3272 () Bool)

(assert (=> b!3272 (= e!1504 tp_is_empty!109)))

(declare-fun mapIsEmpty!119 () Bool)

(assert (=> mapIsEmpty!119 mapRes!119))

(assert (= (and start!548 res!5095) b!3267))

(assert (= (and b!3267 res!5093) b!3271))

(assert (= (and b!3271 res!5094) b!3270))

(assert (= (and b!3269 condMapEmpty!119) mapIsEmpty!119))

(assert (= (and b!3269 (not condMapEmpty!119)) mapNonEmpty!119))

(get-info :version)

(assert (= (and mapNonEmpty!119 ((_ is ValueCellFull!38) mapValue!119)) b!3272))

(assert (= (and b!3269 ((_ is ValueCellFull!38) mapDefault!119)) b!3268))

(assert (= start!548 b!3269))

(declare-fun m!1541 () Bool)

(assert (=> mapNonEmpty!119 m!1541))

(declare-fun m!1543 () Bool)

(assert (=> b!3270 m!1543))

(declare-fun m!1545 () Bool)

(assert (=> b!3271 m!1545))

(declare-fun m!1547 () Bool)

(assert (=> start!548 m!1547))

(declare-fun m!1549 () Bool)

(assert (=> start!548 m!1549))

(declare-fun m!1551 () Bool)

(assert (=> start!548 m!1551))

(check-sat tp_is_empty!109 (not start!548) (not mapNonEmpty!119) (not b!3271) (not b!3270))
(check-sat)
