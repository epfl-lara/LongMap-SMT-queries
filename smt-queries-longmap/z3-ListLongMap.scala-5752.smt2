; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74342 () Bool)

(assert start!74342)

(declare-fun b_free!15105 () Bool)

(declare-fun b_next!15105 () Bool)

(assert (=> start!74342 (= b_free!15105 (not b_next!15105))))

(declare-fun tp!52989 () Bool)

(declare-fun b_and!24881 () Bool)

(assert (=> start!74342 (= tp!52989 b_and!24881)))

(declare-fun b!874907 () Bool)

(declare-fun res!594590 () Bool)

(declare-fun e!487081 () Bool)

(assert (=> b!874907 (=> (not res!594590) (not e!487081))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874907 (= res!594590 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27632 () Bool)

(declare-fun mapRes!27632 () Bool)

(declare-fun tp!52990 () Bool)

(declare-fun e!487083 () Bool)

(assert (=> mapNonEmpty!27632 (= mapRes!27632 (and tp!52990 e!487083))))

(declare-datatypes ((V!28179 0))(
  ( (V!28180 (val!8722 Int)) )
))
(declare-datatypes ((ValueCell!8235 0))(
  ( (ValueCellFull!8235 (v!11151 V!28179)) (EmptyCell!8235) )
))
(declare-fun mapValue!27632 () ValueCell!8235)

(declare-fun mapKey!27632 () (_ BitVec 32))

(declare-fun mapRest!27632 () (Array (_ BitVec 32) ValueCell!8235))

(declare-datatypes ((array!50826 0))(
  ( (array!50827 (arr!24441 (Array (_ BitVec 32) ValueCell!8235)) (size!24881 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50826)

(assert (=> mapNonEmpty!27632 (= (arr!24441 _values!688) (store mapRest!27632 mapKey!27632 mapValue!27632))))

(declare-fun b!874908 () Bool)

(declare-fun res!594587 () Bool)

(assert (=> b!874908 (=> (not res!594587) (not e!487081))))

(declare-datatypes ((array!50828 0))(
  ( (array!50829 (arr!24442 (Array (_ BitVec 32) (_ BitVec 64))) (size!24882 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50828)

(declare-datatypes ((List!17346 0))(
  ( (Nil!17343) (Cons!17342 (h!18473 (_ BitVec 64)) (t!24387 List!17346)) )
))
(declare-fun arrayNoDuplicates!0 (array!50828 (_ BitVec 32) List!17346) Bool)

(assert (=> b!874908 (= res!594587 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17343))))

(declare-fun b!874909 () Bool)

(declare-fun res!594594 () Bool)

(assert (=> b!874909 (=> (not res!594594) (not e!487081))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!874909 (= res!594594 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24882 _keys!868))))))

(declare-fun b!874910 () Bool)

(declare-fun e!487082 () Bool)

(declare-fun tp_is_empty!17349 () Bool)

(assert (=> b!874910 (= e!487082 tp_is_empty!17349)))

(declare-fun b!874911 () Bool)

(declare-fun res!594592 () Bool)

(assert (=> b!874911 (=> (not res!594592) (not e!487081))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874911 (= res!594592 (and (= (select (arr!24442 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27632 () Bool)

(assert (=> mapIsEmpty!27632 mapRes!27632))

(declare-fun b!874912 () Bool)

(declare-fun res!594589 () Bool)

(assert (=> b!874912 (=> (not res!594589) (not e!487081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874912 (= res!594589 (validKeyInArray!0 k0!854))))

(declare-fun res!594593 () Bool)

(assert (=> start!74342 (=> (not res!594593) (not e!487081))))

(assert (=> start!74342 (= res!594593 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24882 _keys!868))))))

(assert (=> start!74342 e!487081))

(assert (=> start!74342 tp_is_empty!17349))

(assert (=> start!74342 true))

(assert (=> start!74342 tp!52989))

(declare-fun array_inv!19270 (array!50828) Bool)

(assert (=> start!74342 (array_inv!19270 _keys!868)))

(declare-fun e!487085 () Bool)

(declare-fun array_inv!19271 (array!50826) Bool)

(assert (=> start!74342 (and (array_inv!19271 _values!688) e!487085)))

(declare-fun b!874913 () Bool)

(assert (=> b!874913 (= e!487081 (and (= from!1053 i!612) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24882 _keys!868)) (bvsge (bvsub (size!24882 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!24882 _keys!868) from!1053))))))

(declare-fun v!557 () V!28179)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11522 0))(
  ( (tuple2!11523 (_1!5772 (_ BitVec 64)) (_2!5772 V!28179)) )
))
(declare-datatypes ((List!17347 0))(
  ( (Nil!17344) (Cons!17343 (h!18474 tuple2!11522) (t!24388 List!17347)) )
))
(declare-datatypes ((ListLongMap!10291 0))(
  ( (ListLongMap!10292 (toList!5161 List!17347)) )
))
(declare-fun lt!396028 () ListLongMap!10291)

(declare-fun minValue!654 () V!28179)

(declare-fun zeroValue!654 () V!28179)

(declare-fun getCurrentListMapNoExtraKeys!3128 (array!50828 array!50826 (_ BitVec 32) (_ BitVec 32) V!28179 V!28179 (_ BitVec 32) Int) ListLongMap!10291)

(assert (=> b!874913 (= lt!396028 (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50827 (store (arr!24441 _values!688) i!612 (ValueCellFull!8235 v!557)) (size!24881 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396029 () ListLongMap!10291)

(assert (=> b!874913 (= lt!396029 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874914 () Bool)

(declare-fun res!594588 () Bool)

(assert (=> b!874914 (=> (not res!594588) (not e!487081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50828 (_ BitVec 32)) Bool)

(assert (=> b!874914 (= res!594588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874915 () Bool)

(assert (=> b!874915 (= e!487085 (and e!487082 mapRes!27632))))

(declare-fun condMapEmpty!27632 () Bool)

(declare-fun mapDefault!27632 () ValueCell!8235)

(assert (=> b!874915 (= condMapEmpty!27632 (= (arr!24441 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8235)) mapDefault!27632)))))

(declare-fun b!874916 () Bool)

(declare-fun res!594591 () Bool)

(assert (=> b!874916 (=> (not res!594591) (not e!487081))))

(assert (=> b!874916 (= res!594591 (and (= (size!24881 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24882 _keys!868) (size!24881 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874917 () Bool)

(assert (=> b!874917 (= e!487083 tp_is_empty!17349)))

(assert (= (and start!74342 res!594593) b!874907))

(assert (= (and b!874907 res!594590) b!874916))

(assert (= (and b!874916 res!594591) b!874914))

(assert (= (and b!874914 res!594588) b!874908))

(assert (= (and b!874908 res!594587) b!874909))

(assert (= (and b!874909 res!594594) b!874912))

(assert (= (and b!874912 res!594589) b!874911))

(assert (= (and b!874911 res!594592) b!874913))

(assert (= (and b!874915 condMapEmpty!27632) mapIsEmpty!27632))

(assert (= (and b!874915 (not condMapEmpty!27632)) mapNonEmpty!27632))

(get-info :version)

(assert (= (and mapNonEmpty!27632 ((_ is ValueCellFull!8235) mapValue!27632)) b!874917))

(assert (= (and b!874915 ((_ is ValueCellFull!8235) mapDefault!27632)) b!874910))

(assert (= start!74342 b!874915))

(declare-fun m!814919 () Bool)

(assert (=> b!874911 m!814919))

(declare-fun m!814921 () Bool)

(assert (=> b!874914 m!814921))

(declare-fun m!814923 () Bool)

(assert (=> b!874907 m!814923))

(declare-fun m!814925 () Bool)

(assert (=> b!874913 m!814925))

(declare-fun m!814927 () Bool)

(assert (=> b!874913 m!814927))

(declare-fun m!814929 () Bool)

(assert (=> b!874913 m!814929))

(declare-fun m!814931 () Bool)

(assert (=> start!74342 m!814931))

(declare-fun m!814933 () Bool)

(assert (=> start!74342 m!814933))

(declare-fun m!814935 () Bool)

(assert (=> b!874912 m!814935))

(declare-fun m!814937 () Bool)

(assert (=> mapNonEmpty!27632 m!814937))

(declare-fun m!814939 () Bool)

(assert (=> b!874908 m!814939))

(check-sat tp_is_empty!17349 (not b!874908) (not mapNonEmpty!27632) (not b!874913) (not b!874912) (not b_next!15105) b_and!24881 (not b!874914) (not b!874907) (not start!74342))
(check-sat b_and!24881 (not b_next!15105))
