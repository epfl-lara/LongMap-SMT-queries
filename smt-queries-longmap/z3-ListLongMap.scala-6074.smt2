; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78554 () Bool)

(assert start!78554)

(declare-fun b_free!16767 () Bool)

(declare-fun b_next!16767 () Bool)

(assert (=> start!78554 (= b_free!16767 (not b_next!16767))))

(declare-fun tp!58742 () Bool)

(declare-fun b_and!27389 () Bool)

(assert (=> start!78554 (= tp!58742 b_and!27389)))

(declare-fun b!915697 () Bool)

(declare-fun res!617347 () Bool)

(declare-fun e!513972 () Bool)

(assert (=> b!915697 (=> (not res!617347) (not e!513972))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54544 0))(
  ( (array!54545 (arr!26217 (Array (_ BitVec 32) (_ BitVec 64))) (size!26676 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54544)

(assert (=> b!915697 (= res!617347 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26676 _keys!1487))))))

(declare-fun b!915698 () Bool)

(declare-fun e!513974 () Bool)

(declare-fun tp_is_empty!19275 () Bool)

(assert (=> b!915698 (= e!513974 tp_is_empty!19275)))

(declare-fun b!915699 () Bool)

(declare-fun res!617348 () Bool)

(assert (=> b!915699 (=> (not res!617348) (not e!513972))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30665 0))(
  ( (V!30666 (val!9688 Int)) )
))
(declare-datatypes ((ValueCell!9156 0))(
  ( (ValueCellFull!9156 (v!12206 V!30665)) (EmptyCell!9156) )
))
(declare-datatypes ((array!54546 0))(
  ( (array!54547 (arr!26218 (Array (_ BitVec 32) ValueCell!9156)) (size!26677 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54546)

(assert (=> b!915699 (= res!617348 (and (= (size!26677 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26676 _keys!1487) (size!26677 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915700 () Bool)

(declare-fun res!617349 () Bool)

(assert (=> b!915700 (=> (not res!617349) (not e!513972))))

(declare-datatypes ((List!18382 0))(
  ( (Nil!18379) (Cons!18378 (h!19524 (_ BitVec 64)) (t!25995 List!18382)) )
))
(declare-fun arrayNoDuplicates!0 (array!54544 (_ BitVec 32) List!18382) Bool)

(assert (=> b!915700 (= res!617349 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18379))))

(declare-fun mapIsEmpty!30669 () Bool)

(declare-fun mapRes!30669 () Bool)

(assert (=> mapIsEmpty!30669 mapRes!30669))

(declare-fun res!617350 () Bool)

(assert (=> start!78554 (=> (not res!617350) (not e!513972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78554 (= res!617350 (validMask!0 mask!1881))))

(assert (=> start!78554 e!513972))

(assert (=> start!78554 true))

(declare-fun e!513975 () Bool)

(declare-fun array_inv!20460 (array!54546) Bool)

(assert (=> start!78554 (and (array_inv!20460 _values!1231) e!513975)))

(assert (=> start!78554 tp!58742))

(declare-fun array_inv!20461 (array!54544) Bool)

(assert (=> start!78554 (array_inv!20461 _keys!1487)))

(assert (=> start!78554 tp_is_empty!19275))

(declare-fun b!915701 () Bool)

(assert (=> b!915701 (= e!513972 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!411703 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30665)

(declare-fun minValue!1173 () V!30665)

(declare-datatypes ((tuple2!12572 0))(
  ( (tuple2!12573 (_1!6297 (_ BitVec 64)) (_2!6297 V!30665)) )
))
(declare-datatypes ((List!18383 0))(
  ( (Nil!18380) (Cons!18379 (h!19525 tuple2!12572) (t!25996 List!18383)) )
))
(declare-datatypes ((ListLongMap!11269 0))(
  ( (ListLongMap!11270 (toList!5650 List!18383)) )
))
(declare-fun contains!4704 (ListLongMap!11269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2911 (array!54544 array!54546 (_ BitVec 32) (_ BitVec 32) V!30665 V!30665 (_ BitVec 32) Int) ListLongMap!11269)

(assert (=> b!915701 (= lt!411703 (contains!4704 (getCurrentListMap!2911 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun mapNonEmpty!30669 () Bool)

(declare-fun tp!58741 () Bool)

(assert (=> mapNonEmpty!30669 (= mapRes!30669 (and tp!58741 e!513974))))

(declare-fun mapRest!30669 () (Array (_ BitVec 32) ValueCell!9156))

(declare-fun mapValue!30669 () ValueCell!9156)

(declare-fun mapKey!30669 () (_ BitVec 32))

(assert (=> mapNonEmpty!30669 (= (arr!26218 _values!1231) (store mapRest!30669 mapKey!30669 mapValue!30669))))

(declare-fun b!915702 () Bool)

(declare-fun res!617346 () Bool)

(assert (=> b!915702 (=> (not res!617346) (not e!513972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54544 (_ BitVec 32)) Bool)

(assert (=> b!915702 (= res!617346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915703 () Bool)

(declare-fun e!513973 () Bool)

(assert (=> b!915703 (= e!513973 tp_is_empty!19275)))

(declare-fun b!915704 () Bool)

(assert (=> b!915704 (= e!513975 (and e!513973 mapRes!30669))))

(declare-fun condMapEmpty!30669 () Bool)

(declare-fun mapDefault!30669 () ValueCell!9156)

(assert (=> b!915704 (= condMapEmpty!30669 (= (arr!26218 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9156)) mapDefault!30669)))))

(assert (= (and start!78554 res!617350) b!915699))

(assert (= (and b!915699 res!617348) b!915702))

(assert (= (and b!915702 res!617346) b!915700))

(assert (= (and b!915700 res!617349) b!915697))

(assert (= (and b!915697 res!617347) b!915701))

(assert (= (and b!915704 condMapEmpty!30669) mapIsEmpty!30669))

(assert (= (and b!915704 (not condMapEmpty!30669)) mapNonEmpty!30669))

(get-info :version)

(assert (= (and mapNonEmpty!30669 ((_ is ValueCellFull!9156) mapValue!30669)) b!915698))

(assert (= (and b!915704 ((_ is ValueCellFull!9156) mapDefault!30669)) b!915703))

(assert (= start!78554 b!915704))

(declare-fun m!849979 () Bool)

(assert (=> mapNonEmpty!30669 m!849979))

(declare-fun m!849981 () Bool)

(assert (=> b!915700 m!849981))

(declare-fun m!849983 () Bool)

(assert (=> start!78554 m!849983))

(declare-fun m!849985 () Bool)

(assert (=> start!78554 m!849985))

(declare-fun m!849987 () Bool)

(assert (=> start!78554 m!849987))

(declare-fun m!849989 () Bool)

(assert (=> b!915701 m!849989))

(assert (=> b!915701 m!849989))

(declare-fun m!849991 () Bool)

(assert (=> b!915701 m!849991))

(declare-fun m!849993 () Bool)

(assert (=> b!915702 m!849993))

(check-sat b_and!27389 (not b!915702) (not mapNonEmpty!30669) (not b_next!16767) (not start!78554) (not b!915701) tp_is_empty!19275 (not b!915700))
(check-sat b_and!27389 (not b_next!16767))
