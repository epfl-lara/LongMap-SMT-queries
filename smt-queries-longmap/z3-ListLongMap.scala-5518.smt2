; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72874 () Bool)

(assert start!72874)

(declare-fun b_free!13807 () Bool)

(declare-fun b_next!13807 () Bool)

(assert (=> start!72874 (= b_free!13807 (not b_next!13807))))

(declare-fun tp!48925 () Bool)

(declare-fun b_and!22867 () Bool)

(assert (=> start!72874 (= tp!48925 b_and!22867)))

(declare-fun b!845960 () Bool)

(declare-fun res!574786 () Bool)

(declare-fun e!472163 () Bool)

(assert (=> b!845960 (=> (not res!574786) (not e!472163))))

(declare-datatypes ((array!48101 0))(
  ( (array!48102 (arr!23082 (Array (_ BitVec 32) (_ BitVec 64))) (size!23524 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48101)

(declare-datatypes ((List!16358 0))(
  ( (Nil!16355) (Cons!16354 (h!17485 (_ BitVec 64)) (t!22720 List!16358)) )
))
(declare-fun arrayNoDuplicates!0 (array!48101 (_ BitVec 32) List!16358) Bool)

(assert (=> b!845960 (= res!574786 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16355))))

(declare-fun b!845961 () Bool)

(declare-fun res!574789 () Bool)

(assert (=> b!845961 (=> (not res!574789) (not e!472163))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48101 (_ BitVec 32)) Bool)

(assert (=> b!845961 (= res!574789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845962 () Bool)

(declare-fun res!574791 () Bool)

(assert (=> b!845962 (=> (not res!574791) (not e!472163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845962 (= res!574791 (validMask!0 mask!1196))))

(declare-fun b!845963 () Bool)

(assert (=> b!845963 (= e!472163 false)))

(declare-datatypes ((V!26305 0))(
  ( (V!26306 (val!8019 Int)) )
))
(declare-fun v!557 () V!26305)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7532 0))(
  ( (ValueCellFull!7532 (v!10438 V!26305)) (EmptyCell!7532) )
))
(declare-datatypes ((array!48103 0))(
  ( (array!48104 (arr!23083 (Array (_ BitVec 32) ValueCell!7532)) (size!23525 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48103)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26305)

(declare-fun zeroValue!654 () V!26305)

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((tuple2!10500 0))(
  ( (tuple2!10501 (_1!5261 (_ BitVec 64)) (_2!5261 V!26305)) )
))
(declare-datatypes ((List!16359 0))(
  ( (Nil!16356) (Cons!16355 (h!17486 tuple2!10500) (t!22721 List!16359)) )
))
(declare-datatypes ((ListLongMap!9259 0))(
  ( (ListLongMap!9260 (toList!4645 List!16359)) )
))
(declare-fun lt!381256 () ListLongMap!9259)

(declare-fun getCurrentListMapNoExtraKeys!2659 (array!48101 array!48103 (_ BitVec 32) (_ BitVec 32) V!26305 V!26305 (_ BitVec 32) Int) ListLongMap!9259)

(assert (=> b!845963 (= lt!381256 (getCurrentListMapNoExtraKeys!2659 _keys!868 (array!48104 (store (arr!23083 _values!688) i!612 (ValueCellFull!7532 v!557)) (size!23525 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381257 () ListLongMap!9259)

(assert (=> b!845963 (= lt!381257 (getCurrentListMapNoExtraKeys!2659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845964 () Bool)

(declare-fun res!574785 () Bool)

(assert (=> b!845964 (=> (not res!574785) (not e!472163))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!845964 (= res!574785 (and (= (select (arr!23082 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25514 () Bool)

(declare-fun mapRes!25514 () Bool)

(assert (=> mapIsEmpty!25514 mapRes!25514))

(declare-fun b!845965 () Bool)

(declare-fun res!574787 () Bool)

(assert (=> b!845965 (=> (not res!574787) (not e!472163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845965 (= res!574787 (validKeyInArray!0 k0!854))))

(declare-fun b!845966 () Bool)

(declare-fun e!472160 () Bool)

(declare-fun tp_is_empty!15943 () Bool)

(assert (=> b!845966 (= e!472160 tp_is_empty!15943)))

(declare-fun b!845967 () Bool)

(declare-fun res!574790 () Bool)

(assert (=> b!845967 (=> (not res!574790) (not e!472163))))

(assert (=> b!845967 (= res!574790 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23524 _keys!868))))))

(declare-fun b!845968 () Bool)

(declare-fun res!574784 () Bool)

(assert (=> b!845968 (=> (not res!574784) (not e!472163))))

(assert (=> b!845968 (= res!574784 (and (= (size!23525 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23524 _keys!868) (size!23525 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845969 () Bool)

(declare-fun e!472161 () Bool)

(assert (=> b!845969 (= e!472161 tp_is_empty!15943)))

(declare-fun res!574788 () Bool)

(assert (=> start!72874 (=> (not res!574788) (not e!472163))))

(assert (=> start!72874 (= res!574788 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23524 _keys!868))))))

(assert (=> start!72874 e!472163))

(assert (=> start!72874 tp_is_empty!15943))

(assert (=> start!72874 true))

(assert (=> start!72874 tp!48925))

(declare-fun array_inv!18414 (array!48101) Bool)

(assert (=> start!72874 (array_inv!18414 _keys!868)))

(declare-fun e!472162 () Bool)

(declare-fun array_inv!18415 (array!48103) Bool)

(assert (=> start!72874 (and (array_inv!18415 _values!688) e!472162)))

(declare-fun mapNonEmpty!25514 () Bool)

(declare-fun tp!48926 () Bool)

(assert (=> mapNonEmpty!25514 (= mapRes!25514 (and tp!48926 e!472161))))

(declare-fun mapValue!25514 () ValueCell!7532)

(declare-fun mapRest!25514 () (Array (_ BitVec 32) ValueCell!7532))

(declare-fun mapKey!25514 () (_ BitVec 32))

(assert (=> mapNonEmpty!25514 (= (arr!23083 _values!688) (store mapRest!25514 mapKey!25514 mapValue!25514))))

(declare-fun b!845970 () Bool)

(assert (=> b!845970 (= e!472162 (and e!472160 mapRes!25514))))

(declare-fun condMapEmpty!25514 () Bool)

(declare-fun mapDefault!25514 () ValueCell!7532)

(assert (=> b!845970 (= condMapEmpty!25514 (= (arr!23083 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7532)) mapDefault!25514)))))

(assert (= (and start!72874 res!574788) b!845962))

(assert (= (and b!845962 res!574791) b!845968))

(assert (= (and b!845968 res!574784) b!845961))

(assert (= (and b!845961 res!574789) b!845960))

(assert (= (and b!845960 res!574786) b!845967))

(assert (= (and b!845967 res!574790) b!845965))

(assert (= (and b!845965 res!574787) b!845964))

(assert (= (and b!845964 res!574785) b!845963))

(assert (= (and b!845970 condMapEmpty!25514) mapIsEmpty!25514))

(assert (= (and b!845970 (not condMapEmpty!25514)) mapNonEmpty!25514))

(get-info :version)

(assert (= (and mapNonEmpty!25514 ((_ is ValueCellFull!7532) mapValue!25514)) b!845969))

(assert (= (and b!845970 ((_ is ValueCellFull!7532) mapDefault!25514)) b!845966))

(assert (= start!72874 b!845970))

(declare-fun m!786923 () Bool)

(assert (=> b!845963 m!786923))

(declare-fun m!786925 () Bool)

(assert (=> b!845963 m!786925))

(declare-fun m!786927 () Bool)

(assert (=> b!845963 m!786927))

(declare-fun m!786929 () Bool)

(assert (=> b!845962 m!786929))

(declare-fun m!786931 () Bool)

(assert (=> b!845960 m!786931))

(declare-fun m!786933 () Bool)

(assert (=> b!845964 m!786933))

(declare-fun m!786935 () Bool)

(assert (=> mapNonEmpty!25514 m!786935))

(declare-fun m!786937 () Bool)

(assert (=> start!72874 m!786937))

(declare-fun m!786939 () Bool)

(assert (=> start!72874 m!786939))

(declare-fun m!786941 () Bool)

(assert (=> b!845965 m!786941))

(declare-fun m!786943 () Bool)

(assert (=> b!845961 m!786943))

(check-sat (not b!845963) (not mapNonEmpty!25514) (not b!845961) (not b_next!13807) (not b!845960) (not b!845962) b_and!22867 (not start!72874) (not b!845965) tp_is_empty!15943)
(check-sat b_and!22867 (not b_next!13807))
