; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73048 () Bool)

(assert start!73048)

(declare-fun b_free!13795 () Bool)

(declare-fun b_next!13795 () Bool)

(assert (=> start!73048 (= b_free!13795 (not b_next!13795))))

(declare-fun tp!48890 () Bool)

(declare-fun b_and!22891 () Bool)

(assert (=> start!73048 (= tp!48890 b_and!22891)))

(declare-fun b!846904 () Bool)

(declare-fun res!575098 () Bool)

(declare-fun e!472804 () Bool)

(assert (=> b!846904 (=> (not res!575098) (not e!472804))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846904 (= res!575098 (validKeyInArray!0 k0!854))))

(declare-fun b!846905 () Bool)

(declare-fun res!575094 () Bool)

(assert (=> b!846905 (=> (not res!575094) (not e!472804))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48125 0))(
  ( (array!48126 (arr!23089 (Array (_ BitVec 32) (_ BitVec 64))) (size!23530 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48125)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846905 (= res!575094 (and (= (select (arr!23089 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25496 () Bool)

(declare-fun mapRes!25496 () Bool)

(assert (=> mapIsEmpty!25496 mapRes!25496))

(declare-fun b!846906 () Bool)

(declare-fun res!575095 () Bool)

(assert (=> b!846906 (=> (not res!575095) (not e!472804))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26289 0))(
  ( (V!26290 (val!8013 Int)) )
))
(declare-datatypes ((ValueCell!7526 0))(
  ( (ValueCellFull!7526 (v!10438 V!26289)) (EmptyCell!7526) )
))
(declare-datatypes ((array!48127 0))(
  ( (array!48128 (arr!23090 (Array (_ BitVec 32) ValueCell!7526)) (size!23531 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48127)

(assert (=> b!846906 (= res!575095 (and (= (size!23531 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23530 _keys!868) (size!23531 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846907 () Bool)

(assert (=> b!846907 (= e!472804 false)))

(declare-datatypes ((tuple2!10392 0))(
  ( (tuple2!10393 (_1!5207 (_ BitVec 64)) (_2!5207 V!26289)) )
))
(declare-datatypes ((List!16260 0))(
  ( (Nil!16257) (Cons!16256 (h!17393 tuple2!10392) (t!22623 List!16260)) )
))
(declare-datatypes ((ListLongMap!9163 0))(
  ( (ListLongMap!9164 (toList!4597 List!16260)) )
))
(declare-fun lt!381824 () ListLongMap!9163)

(declare-fun minValue!654 () V!26289)

(declare-fun zeroValue!654 () V!26289)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2655 (array!48125 array!48127 (_ BitVec 32) (_ BitVec 32) V!26289 V!26289 (_ BitVec 32) Int) ListLongMap!9163)

(assert (=> b!846907 (= lt!381824 (getCurrentListMapNoExtraKeys!2655 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846908 () Bool)

(declare-fun e!472802 () Bool)

(declare-fun tp_is_empty!15931 () Bool)

(assert (=> b!846908 (= e!472802 tp_is_empty!15931)))

(declare-fun b!846909 () Bool)

(declare-fun res!575100 () Bool)

(assert (=> b!846909 (=> (not res!575100) (not e!472804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48125 (_ BitVec 32)) Bool)

(assert (=> b!846909 (= res!575100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846910 () Bool)

(declare-fun e!472800 () Bool)

(assert (=> b!846910 (= e!472800 (and e!472802 mapRes!25496))))

(declare-fun condMapEmpty!25496 () Bool)

(declare-fun mapDefault!25496 () ValueCell!7526)

(assert (=> b!846910 (= condMapEmpty!25496 (= (arr!23090 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7526)) mapDefault!25496)))))

(declare-fun b!846912 () Bool)

(declare-fun res!575099 () Bool)

(assert (=> b!846912 (=> (not res!575099) (not e!472804))))

(assert (=> b!846912 (= res!575099 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23530 _keys!868))))))

(declare-fun mapNonEmpty!25496 () Bool)

(declare-fun tp!48889 () Bool)

(declare-fun e!472803 () Bool)

(assert (=> mapNonEmpty!25496 (= mapRes!25496 (and tp!48889 e!472803))))

(declare-fun mapRest!25496 () (Array (_ BitVec 32) ValueCell!7526))

(declare-fun mapKey!25496 () (_ BitVec 32))

(declare-fun mapValue!25496 () ValueCell!7526)

(assert (=> mapNonEmpty!25496 (= (arr!23090 _values!688) (store mapRest!25496 mapKey!25496 mapValue!25496))))

(declare-fun b!846913 () Bool)

(declare-fun res!575097 () Bool)

(assert (=> b!846913 (=> (not res!575097) (not e!472804))))

(declare-datatypes ((List!16261 0))(
  ( (Nil!16258) (Cons!16257 (h!17394 (_ BitVec 64)) (t!22624 List!16261)) )
))
(declare-fun arrayNoDuplicates!0 (array!48125 (_ BitVec 32) List!16261) Bool)

(assert (=> b!846913 (= res!575097 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16258))))

(declare-fun b!846914 () Bool)

(declare-fun res!575096 () Bool)

(assert (=> b!846914 (=> (not res!575096) (not e!472804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846914 (= res!575096 (validMask!0 mask!1196))))

(declare-fun res!575101 () Bool)

(assert (=> start!73048 (=> (not res!575101) (not e!472804))))

(assert (=> start!73048 (= res!575101 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23530 _keys!868))))))

(assert (=> start!73048 e!472804))

(assert (=> start!73048 true))

(assert (=> start!73048 tp!48890))

(declare-fun array_inv!18398 (array!48125) Bool)

(assert (=> start!73048 (array_inv!18398 _keys!868)))

(declare-fun array_inv!18399 (array!48127) Bool)

(assert (=> start!73048 (and (array_inv!18399 _values!688) e!472800)))

(assert (=> start!73048 tp_is_empty!15931))

(declare-fun b!846911 () Bool)

(assert (=> b!846911 (= e!472803 tp_is_empty!15931)))

(assert (= (and start!73048 res!575101) b!846914))

(assert (= (and b!846914 res!575096) b!846906))

(assert (= (and b!846906 res!575095) b!846909))

(assert (= (and b!846909 res!575100) b!846913))

(assert (= (and b!846913 res!575097) b!846912))

(assert (= (and b!846912 res!575099) b!846904))

(assert (= (and b!846904 res!575098) b!846905))

(assert (= (and b!846905 res!575094) b!846907))

(assert (= (and b!846910 condMapEmpty!25496) mapIsEmpty!25496))

(assert (= (and b!846910 (not condMapEmpty!25496)) mapNonEmpty!25496))

(get-info :version)

(assert (= (and mapNonEmpty!25496 ((_ is ValueCellFull!7526) mapValue!25496)) b!846911))

(assert (= (and b!846910 ((_ is ValueCellFull!7526) mapDefault!25496)) b!846908))

(assert (= start!73048 b!846910))

(declare-fun m!788849 () Bool)

(assert (=> b!846905 m!788849))

(declare-fun m!788851 () Bool)

(assert (=> b!846909 m!788851))

(declare-fun m!788853 () Bool)

(assert (=> b!846904 m!788853))

(declare-fun m!788855 () Bool)

(assert (=> mapNonEmpty!25496 m!788855))

(declare-fun m!788857 () Bool)

(assert (=> start!73048 m!788857))

(declare-fun m!788859 () Bool)

(assert (=> start!73048 m!788859))

(declare-fun m!788861 () Bool)

(assert (=> b!846913 m!788861))

(declare-fun m!788863 () Bool)

(assert (=> b!846907 m!788863))

(declare-fun m!788865 () Bool)

(assert (=> b!846914 m!788865))

(check-sat (not b!846907) b_and!22891 (not start!73048) (not b!846904) tp_is_empty!15931 (not mapNonEmpty!25496) (not b!846913) (not b!846914) (not b_next!13795) (not b!846909))
(check-sat b_and!22891 (not b_next!13795))
