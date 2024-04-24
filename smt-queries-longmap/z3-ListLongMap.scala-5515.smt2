; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73042 () Bool)

(assert start!73042)

(declare-fun b_free!13789 () Bool)

(declare-fun b_next!13789 () Bool)

(assert (=> start!73042 (= b_free!13789 (not b_next!13789))))

(declare-fun tp!48871 () Bool)

(declare-fun b_and!22885 () Bool)

(assert (=> start!73042 (= tp!48871 b_and!22885)))

(declare-fun b!846805 () Bool)

(declare-fun res!575028 () Bool)

(declare-fun e!472758 () Bool)

(assert (=> b!846805 (=> (not res!575028) (not e!472758))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48113 0))(
  ( (array!48114 (arr!23083 (Array (_ BitVec 32) (_ BitVec 64))) (size!23524 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48113)

(assert (=> b!846805 (= res!575028 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23524 _keys!868))))))

(declare-fun res!575027 () Bool)

(assert (=> start!73042 (=> (not res!575027) (not e!472758))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73042 (= res!575027 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23524 _keys!868))))))

(assert (=> start!73042 e!472758))

(assert (=> start!73042 true))

(assert (=> start!73042 tp!48871))

(declare-fun array_inv!18394 (array!48113) Bool)

(assert (=> start!73042 (array_inv!18394 _keys!868)))

(declare-datatypes ((V!26281 0))(
  ( (V!26282 (val!8010 Int)) )
))
(declare-datatypes ((ValueCell!7523 0))(
  ( (ValueCellFull!7523 (v!10435 V!26281)) (EmptyCell!7523) )
))
(declare-datatypes ((array!48115 0))(
  ( (array!48116 (arr!23084 (Array (_ BitVec 32) ValueCell!7523)) (size!23525 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48115)

(declare-fun e!472757 () Bool)

(declare-fun array_inv!18395 (array!48115) Bool)

(assert (=> start!73042 (and (array_inv!18395 _values!688) e!472757)))

(declare-fun tp_is_empty!15925 () Bool)

(assert (=> start!73042 tp_is_empty!15925))

(declare-fun mapIsEmpty!25487 () Bool)

(declare-fun mapRes!25487 () Bool)

(assert (=> mapIsEmpty!25487 mapRes!25487))

(declare-fun b!846806 () Bool)

(declare-fun res!575026 () Bool)

(assert (=> b!846806 (=> (not res!575026) (not e!472758))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846806 (= res!575026 (and (= (size!23525 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23524 _keys!868) (size!23525 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846807 () Bool)

(declare-fun e!472755 () Bool)

(assert (=> b!846807 (= e!472757 (and e!472755 mapRes!25487))))

(declare-fun condMapEmpty!25487 () Bool)

(declare-fun mapDefault!25487 () ValueCell!7523)

(assert (=> b!846807 (= condMapEmpty!25487 (= (arr!23084 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7523)) mapDefault!25487)))))

(declare-fun b!846808 () Bool)

(assert (=> b!846808 (= e!472755 tp_is_empty!15925)))

(declare-fun b!846809 () Bool)

(declare-fun res!575029 () Bool)

(assert (=> b!846809 (=> (not res!575029) (not e!472758))))

(declare-datatypes ((List!16256 0))(
  ( (Nil!16253) (Cons!16252 (h!17389 (_ BitVec 64)) (t!22619 List!16256)) )
))
(declare-fun arrayNoDuplicates!0 (array!48113 (_ BitVec 32) List!16256) Bool)

(assert (=> b!846809 (= res!575029 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16253))))

(declare-fun mapNonEmpty!25487 () Bool)

(declare-fun tp!48872 () Bool)

(declare-fun e!472759 () Bool)

(assert (=> mapNonEmpty!25487 (= mapRes!25487 (and tp!48872 e!472759))))

(declare-fun mapValue!25487 () ValueCell!7523)

(declare-fun mapKey!25487 () (_ BitVec 32))

(declare-fun mapRest!25487 () (Array (_ BitVec 32) ValueCell!7523))

(assert (=> mapNonEmpty!25487 (= (arr!23084 _values!688) (store mapRest!25487 mapKey!25487 mapValue!25487))))

(declare-fun b!846810 () Bool)

(assert (=> b!846810 (= e!472758 false)))

(declare-datatypes ((tuple2!10390 0))(
  ( (tuple2!10391 (_1!5206 (_ BitVec 64)) (_2!5206 V!26281)) )
))
(declare-datatypes ((List!16257 0))(
  ( (Nil!16254) (Cons!16253 (h!17390 tuple2!10390) (t!22620 List!16257)) )
))
(declare-datatypes ((ListLongMap!9161 0))(
  ( (ListLongMap!9162 (toList!4596 List!16257)) )
))
(declare-fun lt!381815 () ListLongMap!9161)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26281)

(declare-fun zeroValue!654 () V!26281)

(declare-fun getCurrentListMapNoExtraKeys!2654 (array!48113 array!48115 (_ BitVec 32) (_ BitVec 32) V!26281 V!26281 (_ BitVec 32) Int) ListLongMap!9161)

(assert (=> b!846810 (= lt!381815 (getCurrentListMapNoExtraKeys!2654 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846811 () Bool)

(declare-fun res!575025 () Bool)

(assert (=> b!846811 (=> (not res!575025) (not e!472758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846811 (= res!575025 (validMask!0 mask!1196))))

(declare-fun b!846812 () Bool)

(declare-fun res!575022 () Bool)

(assert (=> b!846812 (=> (not res!575022) (not e!472758))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846812 (= res!575022 (validKeyInArray!0 k0!854))))

(declare-fun b!846813 () Bool)

(declare-fun res!575023 () Bool)

(assert (=> b!846813 (=> (not res!575023) (not e!472758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48113 (_ BitVec 32)) Bool)

(assert (=> b!846813 (= res!575023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846814 () Bool)

(assert (=> b!846814 (= e!472759 tp_is_empty!15925)))

(declare-fun b!846815 () Bool)

(declare-fun res!575024 () Bool)

(assert (=> b!846815 (=> (not res!575024) (not e!472758))))

(assert (=> b!846815 (= res!575024 (and (= (select (arr!23083 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73042 res!575027) b!846811))

(assert (= (and b!846811 res!575025) b!846806))

(assert (= (and b!846806 res!575026) b!846813))

(assert (= (and b!846813 res!575023) b!846809))

(assert (= (and b!846809 res!575029) b!846805))

(assert (= (and b!846805 res!575028) b!846812))

(assert (= (and b!846812 res!575022) b!846815))

(assert (= (and b!846815 res!575024) b!846810))

(assert (= (and b!846807 condMapEmpty!25487) mapIsEmpty!25487))

(assert (= (and b!846807 (not condMapEmpty!25487)) mapNonEmpty!25487))

(get-info :version)

(assert (= (and mapNonEmpty!25487 ((_ is ValueCellFull!7523) mapValue!25487)) b!846814))

(assert (= (and b!846807 ((_ is ValueCellFull!7523) mapDefault!25487)) b!846808))

(assert (= start!73042 b!846807))

(declare-fun m!788795 () Bool)

(assert (=> b!846812 m!788795))

(declare-fun m!788797 () Bool)

(assert (=> mapNonEmpty!25487 m!788797))

(declare-fun m!788799 () Bool)

(assert (=> b!846815 m!788799))

(declare-fun m!788801 () Bool)

(assert (=> b!846809 m!788801))

(declare-fun m!788803 () Bool)

(assert (=> b!846810 m!788803))

(declare-fun m!788805 () Bool)

(assert (=> b!846811 m!788805))

(declare-fun m!788807 () Bool)

(assert (=> b!846813 m!788807))

(declare-fun m!788809 () Bool)

(assert (=> start!73042 m!788809))

(declare-fun m!788811 () Bool)

(assert (=> start!73042 m!788811))

(check-sat (not b!846812) (not b!846809) (not start!73042) (not b_next!13789) (not b!846811) (not b!846810) (not b!846813) tp_is_empty!15925 (not mapNonEmpty!25487) b_and!22885)
(check-sat b_and!22885 (not b_next!13789))
