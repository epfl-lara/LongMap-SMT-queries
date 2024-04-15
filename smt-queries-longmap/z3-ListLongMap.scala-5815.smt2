; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74974 () Bool)

(assert start!74974)

(declare-fun b_free!15481 () Bool)

(declare-fun b_next!15481 () Bool)

(assert (=> start!74974 (= b_free!15481 (not b_next!15481))))

(declare-fun tp!54150 () Bool)

(declare-fun b_and!25645 () Bool)

(assert (=> start!74974 (= tp!54150 b_and!25645)))

(declare-fun b!884400 () Bool)

(declare-fun e!492166 () Bool)

(declare-fun tp_is_empty!17725 () Bool)

(assert (=> b!884400 (= e!492166 tp_is_empty!17725)))

(declare-fun b!884401 () Bool)

(declare-fun res!600848 () Bool)

(declare-fun e!492168 () Bool)

(assert (=> b!884401 (=> (not res!600848) (not e!492168))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884401 (= res!600848 (validMask!0 mask!1196))))

(declare-fun b!884402 () Bool)

(declare-fun res!600851 () Bool)

(assert (=> b!884402 (=> (not res!600851) (not e!492168))))

(declare-datatypes ((array!51559 0))(
  ( (array!51560 (arr!24798 (Array (_ BitVec 32) (_ BitVec 64))) (size!25240 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51559)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51559 (_ BitVec 32)) Bool)

(assert (=> b!884402 (= res!600851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884403 () Bool)

(declare-fun res!600852 () Bool)

(assert (=> b!884403 (=> (not res!600852) (not e!492168))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!884403 (= res!600852 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25240 _keys!868))))))

(declare-fun mapIsEmpty!28227 () Bool)

(declare-fun mapRes!28227 () Bool)

(assert (=> mapIsEmpty!28227 mapRes!28227))

(declare-fun b!884404 () Bool)

(declare-fun e!492167 () Bool)

(assert (=> b!884404 (= e!492168 e!492167)))

(declare-fun res!600849 () Bool)

(assert (=> b!884404 (=> (not res!600849) (not e!492167))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884404 (= res!600849 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28681 0))(
  ( (V!28682 (val!8910 Int)) )
))
(declare-datatypes ((ValueCell!8423 0))(
  ( (ValueCellFull!8423 (v!11377 V!28681)) (EmptyCell!8423) )
))
(declare-datatypes ((array!51561 0))(
  ( (array!51562 (arr!24799 (Array (_ BitVec 32) ValueCell!8423)) (size!25241 (_ BitVec 32))) )
))
(declare-fun lt!400503 () array!51561)

(declare-datatypes ((tuple2!11834 0))(
  ( (tuple2!11835 (_1!5928 (_ BitVec 64)) (_2!5928 V!28681)) )
))
(declare-datatypes ((List!17629 0))(
  ( (Nil!17626) (Cons!17625 (h!18756 tuple2!11834) (t!24895 List!17629)) )
))
(declare-datatypes ((ListLongMap!10593 0))(
  ( (ListLongMap!10594 (toList!5312 List!17629)) )
))
(declare-fun lt!400504 () ListLongMap!10593)

(declare-fun minValue!654 () V!28681)

(declare-fun zeroValue!654 () V!28681)

(declare-fun getCurrentListMapNoExtraKeys!3302 (array!51559 array!51561 (_ BitVec 32) (_ BitVec 32) V!28681 V!28681 (_ BitVec 32) Int) ListLongMap!10593)

(assert (=> b!884404 (= lt!400504 (getCurrentListMapNoExtraKeys!3302 _keys!868 lt!400503 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!51561)

(declare-fun v!557 () V!28681)

(assert (=> b!884404 (= lt!400503 (array!51562 (store (arr!24799 _values!688) i!612 (ValueCellFull!8423 v!557)) (size!25241 _values!688)))))

(declare-fun lt!400502 () ListLongMap!10593)

(assert (=> b!884404 (= lt!400502 (getCurrentListMapNoExtraKeys!3302 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884405 () Bool)

(declare-fun res!600846 () Bool)

(assert (=> b!884405 (=> (not res!600846) (not e!492168))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!884405 (= res!600846 (and (= (select (arr!24798 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!28227 () Bool)

(declare-fun tp!54149 () Bool)

(declare-fun e!492164 () Bool)

(assert (=> mapNonEmpty!28227 (= mapRes!28227 (and tp!54149 e!492164))))

(declare-fun mapValue!28227 () ValueCell!8423)

(declare-fun mapRest!28227 () (Array (_ BitVec 32) ValueCell!8423))

(declare-fun mapKey!28227 () (_ BitVec 32))

(assert (=> mapNonEmpty!28227 (= (arr!24799 _values!688) (store mapRest!28227 mapKey!28227 mapValue!28227))))

(declare-fun b!884406 () Bool)

(declare-fun e!492169 () Bool)

(assert (=> b!884406 (= e!492169 (and e!492166 mapRes!28227))))

(declare-fun condMapEmpty!28227 () Bool)

(declare-fun mapDefault!28227 () ValueCell!8423)

(assert (=> b!884406 (= condMapEmpty!28227 (= (arr!24799 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8423)) mapDefault!28227)))))

(declare-fun b!884407 () Bool)

(declare-fun res!600844 () Bool)

(assert (=> b!884407 (=> (not res!600844) (not e!492168))))

(assert (=> b!884407 (= res!600844 (and (= (size!25241 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25240 _keys!868) (size!25241 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884408 () Bool)

(declare-fun res!600850 () Bool)

(assert (=> b!884408 (=> (not res!600850) (not e!492168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884408 (= res!600850 (validKeyInArray!0 k0!854))))

(declare-fun b!884409 () Bool)

(assert (=> b!884409 (= e!492164 tp_is_empty!17725)))

(declare-fun res!600847 () Bool)

(assert (=> start!74974 (=> (not res!600847) (not e!492168))))

(assert (=> start!74974 (= res!600847 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25240 _keys!868))))))

(assert (=> start!74974 e!492168))

(assert (=> start!74974 tp_is_empty!17725))

(assert (=> start!74974 true))

(assert (=> start!74974 tp!54150))

(declare-fun array_inv!19574 (array!51559) Bool)

(assert (=> start!74974 (array_inv!19574 _keys!868)))

(declare-fun array_inv!19575 (array!51561) Bool)

(assert (=> start!74974 (and (array_inv!19575 _values!688) e!492169)))

(declare-fun b!884410 () Bool)

(assert (=> b!884410 (= e!492167 (not true))))

(declare-fun +!2603 (ListLongMap!10593 tuple2!11834) ListLongMap!10593)

(assert (=> b!884410 (= (getCurrentListMapNoExtraKeys!3302 _keys!868 lt!400503 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2603 (getCurrentListMapNoExtraKeys!3302 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11835 k0!854 v!557)))))

(declare-datatypes ((Unit!30152 0))(
  ( (Unit!30153) )
))
(declare-fun lt!400501 () Unit!30152)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!764 (array!51559 array!51561 (_ BitVec 32) (_ BitVec 32) V!28681 V!28681 (_ BitVec 32) (_ BitVec 64) V!28681 (_ BitVec 32) Int) Unit!30152)

(assert (=> b!884410 (= lt!400501 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!764 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884411 () Bool)

(declare-fun res!600845 () Bool)

(assert (=> b!884411 (=> (not res!600845) (not e!492168))))

(declare-datatypes ((List!17630 0))(
  ( (Nil!17627) (Cons!17626 (h!18757 (_ BitVec 64)) (t!24896 List!17630)) )
))
(declare-fun arrayNoDuplicates!0 (array!51559 (_ BitVec 32) List!17630) Bool)

(assert (=> b!884411 (= res!600845 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17627))))

(assert (= (and start!74974 res!600847) b!884401))

(assert (= (and b!884401 res!600848) b!884407))

(assert (= (and b!884407 res!600844) b!884402))

(assert (= (and b!884402 res!600851) b!884411))

(assert (= (and b!884411 res!600845) b!884403))

(assert (= (and b!884403 res!600852) b!884408))

(assert (= (and b!884408 res!600850) b!884405))

(assert (= (and b!884405 res!600846) b!884404))

(assert (= (and b!884404 res!600849) b!884410))

(assert (= (and b!884406 condMapEmpty!28227) mapIsEmpty!28227))

(assert (= (and b!884406 (not condMapEmpty!28227)) mapNonEmpty!28227))

(get-info :version)

(assert (= (and mapNonEmpty!28227 ((_ is ValueCellFull!8423) mapValue!28227)) b!884409))

(assert (= (and b!884406 ((_ is ValueCellFull!8423) mapDefault!28227)) b!884400))

(assert (= start!74974 b!884406))

(declare-fun m!824123 () Bool)

(assert (=> b!884402 m!824123))

(declare-fun m!824125 () Bool)

(assert (=> b!884408 m!824125))

(declare-fun m!824127 () Bool)

(assert (=> b!884411 m!824127))

(declare-fun m!824129 () Bool)

(assert (=> b!884401 m!824129))

(declare-fun m!824131 () Bool)

(assert (=> b!884404 m!824131))

(declare-fun m!824133 () Bool)

(assert (=> b!884404 m!824133))

(declare-fun m!824135 () Bool)

(assert (=> b!884404 m!824135))

(declare-fun m!824137 () Bool)

(assert (=> mapNonEmpty!28227 m!824137))

(declare-fun m!824139 () Bool)

(assert (=> b!884410 m!824139))

(declare-fun m!824141 () Bool)

(assert (=> b!884410 m!824141))

(assert (=> b!884410 m!824141))

(declare-fun m!824143 () Bool)

(assert (=> b!884410 m!824143))

(declare-fun m!824145 () Bool)

(assert (=> b!884410 m!824145))

(declare-fun m!824147 () Bool)

(assert (=> b!884405 m!824147))

(declare-fun m!824149 () Bool)

(assert (=> start!74974 m!824149))

(declare-fun m!824151 () Bool)

(assert (=> start!74974 m!824151))

(check-sat b_and!25645 (not b!884410) (not b_next!15481) (not b!884401) (not b!884402) (not b!884404) (not b!884408) (not b!884411) tp_is_empty!17725 (not mapNonEmpty!28227) (not start!74974))
(check-sat b_and!25645 (not b_next!15481))
