; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74238 () Bool)

(assert start!74238)

(declare-fun b!873341 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun e!486353 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50644 0))(
  ( (array!50645 (arr!24351 (Array (_ BitVec 32) (_ BitVec 64))) (size!24791 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50644)

(declare-datatypes ((V!28059 0))(
  ( (V!28060 (val!8677 Int)) )
))
(declare-datatypes ((ValueCell!8190 0))(
  ( (ValueCellFull!8190 (v!11106 V!28059)) (EmptyCell!8190) )
))
(declare-datatypes ((array!50646 0))(
  ( (array!50647 (arr!24352 (Array (_ BitVec 32) ValueCell!8190)) (size!24792 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50646)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!873341 (= e!486353 (and (= (select (arr!24351 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24791 _keys!868)) (bvsge i!612 (size!24792 _values!688))))))

(declare-fun b!873342 () Bool)

(declare-fun e!486355 () Bool)

(declare-fun e!486351 () Bool)

(declare-fun mapRes!27494 () Bool)

(assert (=> b!873342 (= e!486355 (and e!486351 mapRes!27494))))

(declare-fun condMapEmpty!27494 () Bool)

(declare-fun mapDefault!27494 () ValueCell!8190)

(assert (=> b!873342 (= condMapEmpty!27494 (= (arr!24352 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8190)) mapDefault!27494)))))

(declare-fun b!873343 () Bool)

(declare-fun tp_is_empty!17259 () Bool)

(assert (=> b!873343 (= e!486351 tp_is_empty!17259)))

(declare-fun b!873344 () Bool)

(declare-fun res!593486 () Bool)

(assert (=> b!873344 (=> (not res!593486) (not e!486353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873344 (= res!593486 (validKeyInArray!0 k0!854))))

(declare-fun b!873345 () Bool)

(declare-fun res!593482 () Bool)

(assert (=> b!873345 (=> (not res!593482) (not e!486353))))

(assert (=> b!873345 (= res!593482 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24791 _keys!868))))))

(declare-fun b!873346 () Bool)

(declare-fun res!593483 () Bool)

(assert (=> b!873346 (=> (not res!593483) (not e!486353))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!873346 (= res!593483 (and (= (size!24792 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24791 _keys!868) (size!24792 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873347 () Bool)

(declare-fun res!593484 () Bool)

(assert (=> b!873347 (=> (not res!593484) (not e!486353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50644 (_ BitVec 32)) Bool)

(assert (=> b!873347 (= res!593484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!593481 () Bool)

(assert (=> start!74238 (=> (not res!593481) (not e!486353))))

(assert (=> start!74238 (= res!593481 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24791 _keys!868))))))

(assert (=> start!74238 e!486353))

(assert (=> start!74238 true))

(declare-fun array_inv!19212 (array!50644) Bool)

(assert (=> start!74238 (array_inv!19212 _keys!868)))

(declare-fun array_inv!19213 (array!50646) Bool)

(assert (=> start!74238 (and (array_inv!19213 _values!688) e!486355)))

(declare-fun mapNonEmpty!27494 () Bool)

(declare-fun tp!52720 () Bool)

(declare-fun e!486352 () Bool)

(assert (=> mapNonEmpty!27494 (= mapRes!27494 (and tp!52720 e!486352))))

(declare-fun mapRest!27494 () (Array (_ BitVec 32) ValueCell!8190))

(declare-fun mapValue!27494 () ValueCell!8190)

(declare-fun mapKey!27494 () (_ BitVec 32))

(assert (=> mapNonEmpty!27494 (= (arr!24352 _values!688) (store mapRest!27494 mapKey!27494 mapValue!27494))))

(declare-fun b!873348 () Bool)

(assert (=> b!873348 (= e!486352 tp_is_empty!17259)))

(declare-fun b!873349 () Bool)

(declare-fun res!593485 () Bool)

(assert (=> b!873349 (=> (not res!593485) (not e!486353))))

(declare-datatypes ((List!17288 0))(
  ( (Nil!17285) (Cons!17284 (h!18415 (_ BitVec 64)) (t!24327 List!17288)) )
))
(declare-fun arrayNoDuplicates!0 (array!50644 (_ BitVec 32) List!17288) Bool)

(assert (=> b!873349 (= res!593485 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17285))))

(declare-fun b!873350 () Bool)

(declare-fun res!593480 () Bool)

(assert (=> b!873350 (=> (not res!593480) (not e!486353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873350 (= res!593480 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27494 () Bool)

(assert (=> mapIsEmpty!27494 mapRes!27494))

(assert (= (and start!74238 res!593481) b!873350))

(assert (= (and b!873350 res!593480) b!873346))

(assert (= (and b!873346 res!593483) b!873347))

(assert (= (and b!873347 res!593484) b!873349))

(assert (= (and b!873349 res!593485) b!873345))

(assert (= (and b!873345 res!593482) b!873344))

(assert (= (and b!873344 res!593486) b!873341))

(assert (= (and b!873342 condMapEmpty!27494) mapIsEmpty!27494))

(assert (= (and b!873342 (not condMapEmpty!27494)) mapNonEmpty!27494))

(get-info :version)

(assert (= (and mapNonEmpty!27494 ((_ is ValueCellFull!8190) mapValue!27494)) b!873348))

(assert (= (and b!873342 ((_ is ValueCellFull!8190) mapDefault!27494)) b!873343))

(assert (= start!74238 b!873342))

(declare-fun m!813881 () Bool)

(assert (=> b!873347 m!813881))

(declare-fun m!813883 () Bool)

(assert (=> b!873349 m!813883))

(declare-fun m!813885 () Bool)

(assert (=> b!873341 m!813885))

(declare-fun m!813887 () Bool)

(assert (=> start!74238 m!813887))

(declare-fun m!813889 () Bool)

(assert (=> start!74238 m!813889))

(declare-fun m!813891 () Bool)

(assert (=> b!873350 m!813891))

(declare-fun m!813893 () Bool)

(assert (=> b!873344 m!813893))

(declare-fun m!813895 () Bool)

(assert (=> mapNonEmpty!27494 m!813895))

(check-sat (not b!873344) (not start!74238) tp_is_empty!17259 (not mapNonEmpty!27494) (not b!873349) (not b!873347) (not b!873350))
(check-sat)
