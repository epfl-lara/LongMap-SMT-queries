; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72912 () Bool)

(assert start!72912)

(declare-fun b_free!13827 () Bool)

(declare-fun b_next!13827 () Bool)

(assert (=> start!72912 (= b_free!13827 (not b_next!13827))))

(declare-fun tp!48985 () Bool)

(declare-fun b_and!22913 () Bool)

(assert (=> start!72912 (= tp!48985 b_and!22913)))

(declare-fun b!846529 () Bool)

(declare-fun res!575140 () Bool)

(declare-fun e!472462 () Bool)

(assert (=> b!846529 (=> (not res!575140) (not e!472462))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48138 0))(
  ( (array!48139 (arr!23100 (Array (_ BitVec 32) (_ BitVec 64))) (size!23540 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48138)

(assert (=> b!846529 (= res!575140 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23540 _keys!868))))))

(declare-fun b!846530 () Bool)

(declare-fun res!575136 () Bool)

(assert (=> b!846530 (=> (not res!575136) (not e!472462))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26331 0))(
  ( (V!26332 (val!8029 Int)) )
))
(declare-datatypes ((ValueCell!7542 0))(
  ( (ValueCellFull!7542 (v!10454 V!26331)) (EmptyCell!7542) )
))
(declare-datatypes ((array!48140 0))(
  ( (array!48141 (arr!23101 (Array (_ BitVec 32) ValueCell!7542)) (size!23541 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48140)

(assert (=> b!846530 (= res!575136 (and (= (size!23541 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23540 _keys!868) (size!23541 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846531 () Bool)

(declare-fun e!472459 () Bool)

(declare-fun e!472460 () Bool)

(declare-fun mapRes!25544 () Bool)

(assert (=> b!846531 (= e!472459 (and e!472460 mapRes!25544))))

(declare-fun condMapEmpty!25544 () Bool)

(declare-fun mapDefault!25544 () ValueCell!7542)

(assert (=> b!846531 (= condMapEmpty!25544 (= (arr!23101 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7542)) mapDefault!25544)))))

(declare-fun mapIsEmpty!25544 () Bool)

(assert (=> mapIsEmpty!25544 mapRes!25544))

(declare-fun b!846532 () Bool)

(declare-fun res!575137 () Bool)

(assert (=> b!846532 (=> (not res!575137) (not e!472462))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846532 (= res!575137 (validKeyInArray!0 k0!854))))

(declare-fun b!846533 () Bool)

(declare-fun res!575135 () Bool)

(assert (=> b!846533 (=> (not res!575135) (not e!472462))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846533 (= res!575135 (and (= (select (arr!23100 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846534 () Bool)

(declare-fun res!575141 () Bool)

(assert (=> b!846534 (=> (not res!575141) (not e!472462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48138 (_ BitVec 32)) Bool)

(assert (=> b!846534 (= res!575141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846535 () Bool)

(assert (=> b!846535 (= e!472462 false)))

(declare-fun v!557 () V!26331)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26331)

(declare-fun zeroValue!654 () V!26331)

(declare-datatypes ((tuple2!10486 0))(
  ( (tuple2!10487 (_1!5254 (_ BitVec 64)) (_2!5254 V!26331)) )
))
(declare-datatypes ((List!16347 0))(
  ( (Nil!16344) (Cons!16343 (h!17474 tuple2!10486) (t!22718 List!16347)) )
))
(declare-datatypes ((ListLongMap!9255 0))(
  ( (ListLongMap!9256 (toList!4643 List!16347)) )
))
(declare-fun lt!381552 () ListLongMap!9255)

(declare-fun getCurrentListMapNoExtraKeys!2628 (array!48138 array!48140 (_ BitVec 32) (_ BitVec 32) V!26331 V!26331 (_ BitVec 32) Int) ListLongMap!9255)

(assert (=> b!846535 (= lt!381552 (getCurrentListMapNoExtraKeys!2628 _keys!868 (array!48141 (store (arr!23101 _values!688) i!612 (ValueCellFull!7542 v!557)) (size!23541 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381553 () ListLongMap!9255)

(assert (=> b!846535 (= lt!381553 (getCurrentListMapNoExtraKeys!2628 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846536 () Bool)

(declare-fun tp_is_empty!15963 () Bool)

(assert (=> b!846536 (= e!472460 tp_is_empty!15963)))

(declare-fun b!846537 () Bool)

(declare-fun e!472461 () Bool)

(assert (=> b!846537 (= e!472461 tp_is_empty!15963)))

(declare-fun mapNonEmpty!25544 () Bool)

(declare-fun tp!48984 () Bool)

(assert (=> mapNonEmpty!25544 (= mapRes!25544 (and tp!48984 e!472461))))

(declare-fun mapKey!25544 () (_ BitVec 32))

(declare-fun mapValue!25544 () ValueCell!7542)

(declare-fun mapRest!25544 () (Array (_ BitVec 32) ValueCell!7542))

(assert (=> mapNonEmpty!25544 (= (arr!23101 _values!688) (store mapRest!25544 mapKey!25544 mapValue!25544))))

(declare-fun res!575138 () Bool)

(assert (=> start!72912 (=> (not res!575138) (not e!472462))))

(assert (=> start!72912 (= res!575138 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23540 _keys!868))))))

(assert (=> start!72912 e!472462))

(assert (=> start!72912 tp_is_empty!15963))

(assert (=> start!72912 true))

(assert (=> start!72912 tp!48985))

(declare-fun array_inv!18352 (array!48138) Bool)

(assert (=> start!72912 (array_inv!18352 _keys!868)))

(declare-fun array_inv!18353 (array!48140) Bool)

(assert (=> start!72912 (and (array_inv!18353 _values!688) e!472459)))

(declare-fun b!846538 () Bool)

(declare-fun res!575134 () Bool)

(assert (=> b!846538 (=> (not res!575134) (not e!472462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846538 (= res!575134 (validMask!0 mask!1196))))

(declare-fun b!846539 () Bool)

(declare-fun res!575139 () Bool)

(assert (=> b!846539 (=> (not res!575139) (not e!472462))))

(declare-datatypes ((List!16348 0))(
  ( (Nil!16345) (Cons!16344 (h!17475 (_ BitVec 64)) (t!22719 List!16348)) )
))
(declare-fun arrayNoDuplicates!0 (array!48138 (_ BitVec 32) List!16348) Bool)

(assert (=> b!846539 (= res!575139 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16345))))

(assert (= (and start!72912 res!575138) b!846538))

(assert (= (and b!846538 res!575134) b!846530))

(assert (= (and b!846530 res!575136) b!846534))

(assert (= (and b!846534 res!575141) b!846539))

(assert (= (and b!846539 res!575139) b!846529))

(assert (= (and b!846529 res!575140) b!846532))

(assert (= (and b!846532 res!575137) b!846533))

(assert (= (and b!846533 res!575135) b!846535))

(assert (= (and b!846531 condMapEmpty!25544) mapIsEmpty!25544))

(assert (= (and b!846531 (not condMapEmpty!25544)) mapNonEmpty!25544))

(get-info :version)

(assert (= (and mapNonEmpty!25544 ((_ is ValueCellFull!7542) mapValue!25544)) b!846537))

(assert (= (and b!846531 ((_ is ValueCellFull!7542) mapDefault!25544)) b!846536))

(assert (= start!72912 b!846531))

(declare-fun m!787897 () Bool)

(assert (=> b!846533 m!787897))

(declare-fun m!787899 () Bool)

(assert (=> b!846534 m!787899))

(declare-fun m!787901 () Bool)

(assert (=> b!846539 m!787901))

(declare-fun m!787903 () Bool)

(assert (=> start!72912 m!787903))

(declare-fun m!787905 () Bool)

(assert (=> start!72912 m!787905))

(declare-fun m!787907 () Bool)

(assert (=> b!846538 m!787907))

(declare-fun m!787909 () Bool)

(assert (=> b!846535 m!787909))

(declare-fun m!787911 () Bool)

(assert (=> b!846535 m!787911))

(declare-fun m!787913 () Bool)

(assert (=> b!846535 m!787913))

(declare-fun m!787915 () Bool)

(assert (=> b!846532 m!787915))

(declare-fun m!787917 () Bool)

(assert (=> mapNonEmpty!25544 m!787917))

(check-sat (not b!846538) (not b!846535) tp_is_empty!15963 (not b!846532) (not b_next!13827) b_and!22913 (not b!846539) (not b!846534) (not mapNonEmpty!25544) (not start!72912))
(check-sat b_and!22913 (not b_next!13827))
