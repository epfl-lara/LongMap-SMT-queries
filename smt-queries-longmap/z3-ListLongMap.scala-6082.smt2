; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78602 () Bool)

(assert start!78602)

(declare-fun b_free!16815 () Bool)

(declare-fun b_next!16815 () Bool)

(assert (=> start!78602 (= b_free!16815 (not b_next!16815))))

(declare-fun tp!58885 () Bool)

(declare-fun b_and!27437 () Bool)

(assert (=> start!78602 (= tp!58885 b_and!27437)))

(declare-fun b!916278 () Bool)

(declare-fun res!617716 () Bool)

(declare-fun e!514335 () Bool)

(assert (=> b!916278 (=> (not res!617716) (not e!514335))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54636 0))(
  ( (array!54637 (arr!26263 (Array (_ BitVec 32) (_ BitVec 64))) (size!26722 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54636)

(assert (=> b!916278 (= res!617716 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26722 _keys!1487))))))

(declare-fun b!916279 () Bool)

(declare-fun e!514332 () Bool)

(declare-fun e!514336 () Bool)

(declare-fun mapRes!30741 () Bool)

(assert (=> b!916279 (= e!514332 (and e!514336 mapRes!30741))))

(declare-fun condMapEmpty!30741 () Bool)

(declare-datatypes ((V!30729 0))(
  ( (V!30730 (val!9712 Int)) )
))
(declare-datatypes ((ValueCell!9180 0))(
  ( (ValueCellFull!9180 (v!12230 V!30729)) (EmptyCell!9180) )
))
(declare-datatypes ((array!54638 0))(
  ( (array!54639 (arr!26264 (Array (_ BitVec 32) ValueCell!9180)) (size!26723 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54638)

(declare-fun mapDefault!30741 () ValueCell!9180)

(assert (=> b!916279 (= condMapEmpty!30741 (= (arr!26264 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9180)) mapDefault!30741)))))

(declare-fun b!916280 () Bool)

(declare-fun res!617715 () Bool)

(assert (=> b!916280 (=> (not res!617715) (not e!514335))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30729)

(declare-fun minValue!1173 () V!30729)

(declare-datatypes ((tuple2!12598 0))(
  ( (tuple2!12599 (_1!6310 (_ BitVec 64)) (_2!6310 V!30729)) )
))
(declare-datatypes ((List!18411 0))(
  ( (Nil!18408) (Cons!18407 (h!19553 tuple2!12598) (t!26024 List!18411)) )
))
(declare-datatypes ((ListLongMap!11295 0))(
  ( (ListLongMap!11296 (toList!5663 List!18411)) )
))
(declare-fun contains!4717 (ListLongMap!11295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2924 (array!54636 array!54638 (_ BitVec 32) (_ BitVec 32) V!30729 V!30729 (_ BitVec 32) Int) ListLongMap!11295)

(assert (=> b!916280 (= res!617715 (contains!4717 (getCurrentListMap!2924 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun mapNonEmpty!30741 () Bool)

(declare-fun tp!58886 () Bool)

(declare-fun e!514333 () Bool)

(assert (=> mapNonEmpty!30741 (= mapRes!30741 (and tp!58886 e!514333))))

(declare-fun mapKey!30741 () (_ BitVec 32))

(declare-fun mapValue!30741 () ValueCell!9180)

(declare-fun mapRest!30741 () (Array (_ BitVec 32) ValueCell!9180))

(assert (=> mapNonEmpty!30741 (= (arr!26264 _values!1231) (store mapRest!30741 mapKey!30741 mapValue!30741))))

(declare-fun b!916281 () Bool)

(declare-fun tp_is_empty!19323 () Bool)

(assert (=> b!916281 (= e!514336 tp_is_empty!19323)))

(declare-fun res!617714 () Bool)

(assert (=> start!78602 (=> (not res!617714) (not e!514335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78602 (= res!617714 (validMask!0 mask!1881))))

(assert (=> start!78602 e!514335))

(assert (=> start!78602 true))

(declare-fun array_inv!20486 (array!54638) Bool)

(assert (=> start!78602 (and (array_inv!20486 _values!1231) e!514332)))

(assert (=> start!78602 tp!58885))

(declare-fun array_inv!20487 (array!54636) Bool)

(assert (=> start!78602 (array_inv!20487 _keys!1487)))

(assert (=> start!78602 tp_is_empty!19323))

(declare-fun b!916282 () Bool)

(declare-fun res!617713 () Bool)

(assert (=> b!916282 (=> (not res!617713) (not e!514335))))

(declare-datatypes ((List!18412 0))(
  ( (Nil!18409) (Cons!18408 (h!19554 (_ BitVec 64)) (t!26025 List!18412)) )
))
(declare-fun arrayNoDuplicates!0 (array!54636 (_ BitVec 32) List!18412) Bool)

(assert (=> b!916282 (= res!617713 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18409))))

(declare-fun b!916283 () Bool)

(declare-fun res!617712 () Bool)

(assert (=> b!916283 (=> (not res!617712) (not e!514335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54636 (_ BitVec 32)) Bool)

(assert (=> b!916283 (= res!617712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916284 () Bool)

(assert (=> b!916284 (= e!514333 tp_is_empty!19323)))

(declare-fun b!916285 () Bool)

(assert (=> b!916285 (= e!514335 (bvsgt from!1844 (size!26722 _keys!1487)))))

(declare-fun mapIsEmpty!30741 () Bool)

(assert (=> mapIsEmpty!30741 mapRes!30741))

(declare-fun b!916286 () Bool)

(declare-fun res!617711 () Bool)

(assert (=> b!916286 (=> (not res!617711) (not e!514335))))

(assert (=> b!916286 (= res!617711 (and (= (size!26723 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26722 _keys!1487) (size!26723 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78602 res!617714) b!916286))

(assert (= (and b!916286 res!617711) b!916283))

(assert (= (and b!916283 res!617712) b!916282))

(assert (= (and b!916282 res!617713) b!916278))

(assert (= (and b!916278 res!617716) b!916280))

(assert (= (and b!916280 res!617715) b!916285))

(assert (= (and b!916279 condMapEmpty!30741) mapIsEmpty!30741))

(assert (= (and b!916279 (not condMapEmpty!30741)) mapNonEmpty!30741))

(get-info :version)

(assert (= (and mapNonEmpty!30741 ((_ is ValueCellFull!9180) mapValue!30741)) b!916284))

(assert (= (and b!916279 ((_ is ValueCellFull!9180) mapDefault!30741)) b!916281))

(assert (= start!78602 b!916279))

(declare-fun m!850363 () Bool)

(assert (=> start!78602 m!850363))

(declare-fun m!850365 () Bool)

(assert (=> start!78602 m!850365))

(declare-fun m!850367 () Bool)

(assert (=> start!78602 m!850367))

(declare-fun m!850369 () Bool)

(assert (=> mapNonEmpty!30741 m!850369))

(declare-fun m!850371 () Bool)

(assert (=> b!916282 m!850371))

(declare-fun m!850373 () Bool)

(assert (=> b!916283 m!850373))

(declare-fun m!850375 () Bool)

(assert (=> b!916280 m!850375))

(assert (=> b!916280 m!850375))

(declare-fun m!850377 () Bool)

(assert (=> b!916280 m!850377))

(check-sat (not b!916280) (not b_next!16815) tp_is_empty!19323 b_and!27437 (not start!78602) (not b!916283) (not b!916282) (not mapNonEmpty!30741))
(check-sat b_and!27437 (not b_next!16815))
