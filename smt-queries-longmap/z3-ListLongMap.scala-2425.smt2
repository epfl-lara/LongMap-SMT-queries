; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38294 () Bool)

(assert start!38294)

(declare-fun b!394797 () Bool)

(declare-fun e!239024 () Bool)

(declare-fun e!239026 () Bool)

(declare-fun mapRes!16290 () Bool)

(assert (=> b!394797 (= e!239024 (and e!239026 mapRes!16290))))

(declare-fun condMapEmpty!16290 () Bool)

(declare-datatypes ((V!14155 0))(
  ( (V!14156 (val!4938 Int)) )
))
(declare-datatypes ((ValueCell!4550 0))(
  ( (ValueCellFull!4550 (v!7178 V!14155)) (EmptyCell!4550) )
))
(declare-datatypes ((array!23471 0))(
  ( (array!23472 (arr!11189 (Array (_ BitVec 32) ValueCell!4550)) (size!11542 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23471)

(declare-fun mapDefault!16290 () ValueCell!4550)

(assert (=> b!394797 (= condMapEmpty!16290 (= (arr!11189 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4550)) mapDefault!16290)))))

(declare-fun mapIsEmpty!16290 () Bool)

(assert (=> mapIsEmpty!16290 mapRes!16290))

(declare-fun b!394798 () Bool)

(declare-fun res!226333 () Bool)

(declare-fun e!239022 () Bool)

(assert (=> b!394798 (=> (not res!226333) (not e!239022))))

(declare-datatypes ((array!23473 0))(
  ( (array!23474 (arr!11190 (Array (_ BitVec 32) (_ BitVec 64))) (size!11543 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23473)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394798 (= res!226333 (and (= (size!11542 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11543 _keys!709) (size!11542 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394799 () Bool)

(declare-fun res!226336 () Bool)

(assert (=> b!394799 (=> (not res!226336) (not e!239022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23473 (_ BitVec 32)) Bool)

(assert (=> b!394799 (= res!226336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!226335 () Bool)

(assert (=> start!38294 (=> (not res!226335) (not e!239022))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38294 (= res!226335 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11543 _keys!709))))))

(assert (=> start!38294 e!239022))

(assert (=> start!38294 true))

(declare-fun array_inv!8212 (array!23471) Bool)

(assert (=> start!38294 (and (array_inv!8212 _values!549) e!239024)))

(declare-fun array_inv!8213 (array!23473) Bool)

(assert (=> start!38294 (array_inv!8213 _keys!709)))

(declare-fun b!394800 () Bool)

(assert (=> b!394800 (= e!239022 false)))

(declare-fun lt!186826 () Bool)

(declare-datatypes ((List!6460 0))(
  ( (Nil!6457) (Cons!6456 (h!7312 (_ BitVec 64)) (t!11625 List!6460)) )
))
(declare-fun arrayNoDuplicates!0 (array!23473 (_ BitVec 32) List!6460) Bool)

(assert (=> b!394800 (= lt!186826 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6457))))

(declare-fun b!394801 () Bool)

(declare-fun e!239025 () Bool)

(declare-fun tp_is_empty!9787 () Bool)

(assert (=> b!394801 (= e!239025 tp_is_empty!9787)))

(declare-fun b!394802 () Bool)

(declare-fun res!226334 () Bool)

(assert (=> b!394802 (=> (not res!226334) (not e!239022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394802 (= res!226334 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16290 () Bool)

(declare-fun tp!32085 () Bool)

(assert (=> mapNonEmpty!16290 (= mapRes!16290 (and tp!32085 e!239025))))

(declare-fun mapKey!16290 () (_ BitVec 32))

(declare-fun mapRest!16290 () (Array (_ BitVec 32) ValueCell!4550))

(declare-fun mapValue!16290 () ValueCell!4550)

(assert (=> mapNonEmpty!16290 (= (arr!11189 _values!549) (store mapRest!16290 mapKey!16290 mapValue!16290))))

(declare-fun b!394803 () Bool)

(assert (=> b!394803 (= e!239026 tp_is_empty!9787)))

(assert (= (and start!38294 res!226335) b!394802))

(assert (= (and b!394802 res!226334) b!394798))

(assert (= (and b!394798 res!226333) b!394799))

(assert (= (and b!394799 res!226336) b!394800))

(assert (= (and b!394797 condMapEmpty!16290) mapIsEmpty!16290))

(assert (= (and b!394797 (not condMapEmpty!16290)) mapNonEmpty!16290))

(get-info :version)

(assert (= (and mapNonEmpty!16290 ((_ is ValueCellFull!4550) mapValue!16290)) b!394801))

(assert (= (and b!394797 ((_ is ValueCellFull!4550) mapDefault!16290)) b!394803))

(assert (= start!38294 b!394797))

(declare-fun m!390567 () Bool)

(assert (=> mapNonEmpty!16290 m!390567))

(declare-fun m!390569 () Bool)

(assert (=> b!394802 m!390569))

(declare-fun m!390571 () Bool)

(assert (=> start!38294 m!390571))

(declare-fun m!390573 () Bool)

(assert (=> start!38294 m!390573))

(declare-fun m!390575 () Bool)

(assert (=> b!394800 m!390575))

(declare-fun m!390577 () Bool)

(assert (=> b!394799 m!390577))

(check-sat (not start!38294) (not b!394800) (not b!394799) (not b!394802) tp_is_empty!9787 (not mapNonEmpty!16290))
(check-sat)
