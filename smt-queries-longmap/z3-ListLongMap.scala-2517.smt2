; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38906 () Bool)

(assert start!38906)

(declare-fun b!406861 () Bool)

(declare-fun res!235186 () Bool)

(declare-fun e!244381 () Bool)

(assert (=> b!406861 (=> (not res!235186) (not e!244381))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24551 0))(
  ( (array!24552 (arr!11725 (Array (_ BitVec 32) (_ BitVec 64))) (size!12078 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24551)

(assert (=> b!406861 (= res!235186 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12078 _keys!709))))))

(declare-fun b!406862 () Bool)

(declare-fun res!235181 () Bool)

(assert (=> b!406862 (=> (not res!235181) (not e!244381))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406862 (= res!235181 (validMask!0 mask!1025))))

(declare-fun b!406863 () Bool)

(declare-fun res!235179 () Bool)

(assert (=> b!406863 (=> (not res!235179) (not e!244381))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14891 0))(
  ( (V!14892 (val!5214 Int)) )
))
(declare-datatypes ((ValueCell!4826 0))(
  ( (ValueCellFull!4826 (v!7455 V!14891)) (EmptyCell!4826) )
))
(declare-datatypes ((array!24553 0))(
  ( (array!24554 (arr!11726 (Array (_ BitVec 32) ValueCell!4826)) (size!12079 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24553)

(assert (=> b!406863 (= res!235179 (and (= (size!12079 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12078 _keys!709) (size!12079 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406864 () Bool)

(declare-fun e!244384 () Bool)

(assert (=> b!406864 (= e!244384 false)))

(declare-fun lt!188362 () Bool)

(declare-fun lt!188363 () array!24551)

(declare-datatypes ((List!6782 0))(
  ( (Nil!6779) (Cons!6778 (h!7634 (_ BitVec 64)) (t!11947 List!6782)) )
))
(declare-fun arrayNoDuplicates!0 (array!24551 (_ BitVec 32) List!6782) Bool)

(assert (=> b!406864 (= lt!188362 (arrayNoDuplicates!0 lt!188363 #b00000000000000000000000000000000 Nil!6779))))

(declare-fun b!406865 () Bool)

(declare-fun res!235184 () Bool)

(assert (=> b!406865 (=> (not res!235184) (not e!244381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24551 (_ BitVec 32)) Bool)

(assert (=> b!406865 (= res!235184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17130 () Bool)

(declare-fun mapRes!17130 () Bool)

(declare-fun tp!33249 () Bool)

(declare-fun e!244386 () Bool)

(assert (=> mapNonEmpty!17130 (= mapRes!17130 (and tp!33249 e!244386))))

(declare-fun mapKey!17130 () (_ BitVec 32))

(declare-fun mapRest!17130 () (Array (_ BitVec 32) ValueCell!4826))

(declare-fun mapValue!17130 () ValueCell!4826)

(assert (=> mapNonEmpty!17130 (= (arr!11726 _values!549) (store mapRest!17130 mapKey!17130 mapValue!17130))))

(declare-fun b!406866 () Bool)

(declare-fun e!244383 () Bool)

(declare-fun e!244385 () Bool)

(assert (=> b!406866 (= e!244383 (and e!244385 mapRes!17130))))

(declare-fun condMapEmpty!17130 () Bool)

(declare-fun mapDefault!17130 () ValueCell!4826)

(assert (=> b!406866 (= condMapEmpty!17130 (= (arr!11726 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4826)) mapDefault!17130)))))

(declare-fun b!406867 () Bool)

(declare-fun res!235183 () Bool)

(assert (=> b!406867 (=> (not res!235183) (not e!244381))))

(assert (=> b!406867 (= res!235183 (or (= (select (arr!11725 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11725 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!235188 () Bool)

(assert (=> start!38906 (=> (not res!235188) (not e!244381))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38906 (= res!235188 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12078 _keys!709))))))

(assert (=> start!38906 e!244381))

(assert (=> start!38906 true))

(declare-fun array_inv!8600 (array!24553) Bool)

(assert (=> start!38906 (and (array_inv!8600 _values!549) e!244383)))

(declare-fun array_inv!8601 (array!24551) Bool)

(assert (=> start!38906 (array_inv!8601 _keys!709)))

(declare-fun mapIsEmpty!17130 () Bool)

(assert (=> mapIsEmpty!17130 mapRes!17130))

(declare-fun b!406868 () Bool)

(declare-fun tp_is_empty!10339 () Bool)

(assert (=> b!406868 (= e!244386 tp_is_empty!10339)))

(declare-fun b!406869 () Bool)

(assert (=> b!406869 (= e!244385 tp_is_empty!10339)))

(declare-fun b!406870 () Bool)

(declare-fun res!235187 () Bool)

(assert (=> b!406870 (=> (not res!235187) (not e!244381))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406870 (= res!235187 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406871 () Bool)

(declare-fun res!235185 () Bool)

(assert (=> b!406871 (=> (not res!235185) (not e!244381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406871 (= res!235185 (validKeyInArray!0 k0!794))))

(declare-fun b!406872 () Bool)

(assert (=> b!406872 (= e!244381 e!244384)))

(declare-fun res!235180 () Bool)

(assert (=> b!406872 (=> (not res!235180) (not e!244384))))

(assert (=> b!406872 (= res!235180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188363 mask!1025))))

(assert (=> b!406872 (= lt!188363 (array!24552 (store (arr!11725 _keys!709) i!563 k0!794) (size!12078 _keys!709)))))

(declare-fun b!406873 () Bool)

(declare-fun res!235182 () Bool)

(assert (=> b!406873 (=> (not res!235182) (not e!244381))))

(assert (=> b!406873 (= res!235182 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6779))))

(assert (= (and start!38906 res!235188) b!406862))

(assert (= (and b!406862 res!235181) b!406863))

(assert (= (and b!406863 res!235179) b!406865))

(assert (= (and b!406865 res!235184) b!406873))

(assert (= (and b!406873 res!235182) b!406861))

(assert (= (and b!406861 res!235186) b!406871))

(assert (= (and b!406871 res!235185) b!406867))

(assert (= (and b!406867 res!235183) b!406870))

(assert (= (and b!406870 res!235187) b!406872))

(assert (= (and b!406872 res!235180) b!406864))

(assert (= (and b!406866 condMapEmpty!17130) mapIsEmpty!17130))

(assert (= (and b!406866 (not condMapEmpty!17130)) mapNonEmpty!17130))

(get-info :version)

(assert (= (and mapNonEmpty!17130 ((_ is ValueCellFull!4826) mapValue!17130)) b!406868))

(assert (= (and b!406866 ((_ is ValueCellFull!4826) mapDefault!17130)) b!406869))

(assert (= start!38906 b!406866))

(declare-fun m!398211 () Bool)

(assert (=> mapNonEmpty!17130 m!398211))

(declare-fun m!398213 () Bool)

(assert (=> b!406862 m!398213))

(declare-fun m!398215 () Bool)

(assert (=> b!406873 m!398215))

(declare-fun m!398217 () Bool)

(assert (=> b!406864 m!398217))

(declare-fun m!398219 () Bool)

(assert (=> b!406871 m!398219))

(declare-fun m!398221 () Bool)

(assert (=> b!406867 m!398221))

(declare-fun m!398223 () Bool)

(assert (=> b!406865 m!398223))

(declare-fun m!398225 () Bool)

(assert (=> start!38906 m!398225))

(declare-fun m!398227 () Bool)

(assert (=> start!38906 m!398227))

(declare-fun m!398229 () Bool)

(assert (=> b!406870 m!398229))

(declare-fun m!398231 () Bool)

(assert (=> b!406872 m!398231))

(declare-fun m!398233 () Bool)

(assert (=> b!406872 m!398233))

(check-sat (not b!406865) (not b!406870) tp_is_empty!10339 (not b!406862) (not b!406872) (not b!406871) (not start!38906) (not b!406864) (not mapNonEmpty!17130) (not b!406873))
(check-sat)
