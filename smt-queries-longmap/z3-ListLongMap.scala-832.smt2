; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20090 () Bool)

(assert start!20090)

(declare-fun b_free!4749 () Bool)

(declare-fun b_next!4749 () Bool)

(assert (=> start!20090 (= b_free!4749 (not b_next!4749))))

(declare-fun tp!17278 () Bool)

(declare-fun b_and!11495 () Bool)

(assert (=> start!20090 (= tp!17278 b_and!11495)))

(declare-fun b!196784 () Bool)

(declare-fun e!129597 () Bool)

(declare-fun e!129599 () Bool)

(declare-fun mapRes!7976 () Bool)

(assert (=> b!196784 (= e!129597 (and e!129599 mapRes!7976))))

(declare-fun condMapEmpty!7976 () Bool)

(declare-datatypes ((V!5787 0))(
  ( (V!5788 (val!2347 Int)) )
))
(declare-datatypes ((ValueCell!1959 0))(
  ( (ValueCellFull!1959 (v!4317 V!5787)) (EmptyCell!1959) )
))
(declare-datatypes ((array!8467 0))(
  ( (array!8468 (arr!3984 (Array (_ BitVec 32) ValueCell!1959)) (size!4309 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8467)

(declare-fun mapDefault!7976 () ValueCell!1959)

(assert (=> b!196784 (= condMapEmpty!7976 (= (arr!3984 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1959)) mapDefault!7976)))))

(declare-fun b!196785 () Bool)

(declare-fun res!92932 () Bool)

(declare-fun e!129598 () Bool)

(assert (=> b!196785 (=> (not res!92932) (not e!129598))))

(declare-datatypes ((array!8469 0))(
  ( (array!8470 (arr!3985 (Array (_ BitVec 32) (_ BitVec 64))) (size!4310 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8469)

(declare-datatypes ((List!2488 0))(
  ( (Nil!2485) (Cons!2484 (h!3126 (_ BitVec 64)) (t!7419 List!2488)) )
))
(declare-fun arrayNoDuplicates!0 (array!8469 (_ BitVec 32) List!2488) Bool)

(assert (=> b!196785 (= res!92932 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2485))))

(declare-fun b!196786 () Bool)

(declare-fun e!129596 () Bool)

(declare-fun tp_is_empty!4605 () Bool)

(assert (=> b!196786 (= e!129596 tp_is_empty!4605)))

(declare-fun b!196787 () Bool)

(declare-fun res!92931 () Bool)

(assert (=> b!196787 (=> (not res!92931) (not e!129598))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8469 (_ BitVec 32)) Bool)

(assert (=> b!196787 (= res!92931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196789 () Bool)

(declare-fun res!92929 () Bool)

(assert (=> b!196789 (=> (not res!92929) (not e!129598))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196789 (= res!92929 (validKeyInArray!0 k0!843))))

(declare-fun b!196790 () Bool)

(declare-fun res!92935 () Bool)

(assert (=> b!196790 (=> (not res!92935) (not e!129598))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196790 (= res!92935 (= (select (arr!3985 _keys!825) i!601) k0!843))))

(declare-fun b!196791 () Bool)

(assert (=> b!196791 (= e!129599 tp_is_empty!4605)))

(declare-fun b!196792 () Bool)

(declare-fun res!92933 () Bool)

(assert (=> b!196792 (=> (not res!92933) (not e!129598))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196792 (= res!92933 (and (= (size!4309 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4310 _keys!825) (size!4309 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7976 () Bool)

(assert (=> mapIsEmpty!7976 mapRes!7976))

(declare-fun res!92934 () Bool)

(assert (=> start!20090 (=> (not res!92934) (not e!129598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20090 (= res!92934 (validMask!0 mask!1149))))

(assert (=> start!20090 e!129598))

(declare-fun array_inv!2599 (array!8467) Bool)

(assert (=> start!20090 (and (array_inv!2599 _values!649) e!129597)))

(assert (=> start!20090 true))

(assert (=> start!20090 tp_is_empty!4605))

(declare-fun array_inv!2600 (array!8469) Bool)

(assert (=> start!20090 (array_inv!2600 _keys!825)))

(assert (=> start!20090 tp!17278))

(declare-fun b!196788 () Bool)

(assert (=> b!196788 (= e!129598 false)))

(declare-datatypes ((tuple2!3576 0))(
  ( (tuple2!3577 (_1!1799 (_ BitVec 64)) (_2!1799 V!5787)) )
))
(declare-datatypes ((List!2489 0))(
  ( (Nil!2486) (Cons!2485 (h!3127 tuple2!3576) (t!7420 List!2489)) )
))
(declare-datatypes ((ListLongMap!2489 0))(
  ( (ListLongMap!2490 (toList!1260 List!2489)) )
))
(declare-fun lt!97653 () ListLongMap!2489)

(declare-fun zeroValue!615 () V!5787)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5787)

(declare-fun getCurrentListMapNoExtraKeys!225 (array!8469 array!8467 (_ BitVec 32) (_ BitVec 32) V!5787 V!5787 (_ BitVec 32) Int) ListLongMap!2489)

(assert (=> b!196788 (= lt!97653 (getCurrentListMapNoExtraKeys!225 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!7976 () Bool)

(declare-fun tp!17279 () Bool)

(assert (=> mapNonEmpty!7976 (= mapRes!7976 (and tp!17279 e!129596))))

(declare-fun mapRest!7976 () (Array (_ BitVec 32) ValueCell!1959))

(declare-fun mapKey!7976 () (_ BitVec 32))

(declare-fun mapValue!7976 () ValueCell!1959)

(assert (=> mapNonEmpty!7976 (= (arr!3984 _values!649) (store mapRest!7976 mapKey!7976 mapValue!7976))))

(declare-fun b!196793 () Bool)

(declare-fun res!92930 () Bool)

(assert (=> b!196793 (=> (not res!92930) (not e!129598))))

(assert (=> b!196793 (= res!92930 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4310 _keys!825))))))

(assert (= (and start!20090 res!92934) b!196792))

(assert (= (and b!196792 res!92933) b!196787))

(assert (= (and b!196787 res!92931) b!196785))

(assert (= (and b!196785 res!92932) b!196793))

(assert (= (and b!196793 res!92930) b!196789))

(assert (= (and b!196789 res!92929) b!196790))

(assert (= (and b!196790 res!92935) b!196788))

(assert (= (and b!196784 condMapEmpty!7976) mapIsEmpty!7976))

(assert (= (and b!196784 (not condMapEmpty!7976)) mapNonEmpty!7976))

(get-info :version)

(assert (= (and mapNonEmpty!7976 ((_ is ValueCellFull!1959) mapValue!7976)) b!196786))

(assert (= (and b!196784 ((_ is ValueCellFull!1959) mapDefault!7976)) b!196791))

(assert (= start!20090 b!196784))

(declare-fun m!223927 () Bool)

(assert (=> b!196788 m!223927))

(declare-fun m!223929 () Bool)

(assert (=> start!20090 m!223929))

(declare-fun m!223931 () Bool)

(assert (=> start!20090 m!223931))

(declare-fun m!223933 () Bool)

(assert (=> start!20090 m!223933))

(declare-fun m!223935 () Bool)

(assert (=> mapNonEmpty!7976 m!223935))

(declare-fun m!223937 () Bool)

(assert (=> b!196789 m!223937))

(declare-fun m!223939 () Bool)

(assert (=> b!196790 m!223939))

(declare-fun m!223941 () Bool)

(assert (=> b!196785 m!223941))

(declare-fun m!223943 () Bool)

(assert (=> b!196787 m!223943))

(check-sat (not b!196788) tp_is_empty!4605 (not b!196789) (not start!20090) (not b!196785) (not b!196787) b_and!11495 (not b_next!4749) (not mapNonEmpty!7976))
(check-sat b_and!11495 (not b_next!4749))
