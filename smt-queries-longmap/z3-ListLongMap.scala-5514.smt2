; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72870 () Bool)

(assert start!72870)

(declare-fun b_free!13785 () Bool)

(declare-fun b_next!13785 () Bool)

(assert (=> start!72870 (= b_free!13785 (not b_next!13785))))

(declare-fun tp!48858 () Bool)

(declare-fun b_and!22871 () Bool)

(assert (=> start!72870 (= tp!48858 b_and!22871)))

(declare-fun res!574630 () Bool)

(declare-fun e!472147 () Bool)

(assert (=> start!72870 (=> (not res!574630) (not e!472147))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48060 0))(
  ( (array!48061 (arr!23061 (Array (_ BitVec 32) (_ BitVec 64))) (size!23501 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48060)

(assert (=> start!72870 (= res!574630 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23501 _keys!868))))))

(assert (=> start!72870 e!472147))

(assert (=> start!72870 true))

(assert (=> start!72870 tp!48858))

(declare-fun array_inv!18326 (array!48060) Bool)

(assert (=> start!72870 (array_inv!18326 _keys!868)))

(declare-datatypes ((V!26275 0))(
  ( (V!26276 (val!8008 Int)) )
))
(declare-datatypes ((ValueCell!7521 0))(
  ( (ValueCellFull!7521 (v!10433 V!26275)) (EmptyCell!7521) )
))
(declare-datatypes ((array!48062 0))(
  ( (array!48063 (arr!23062 (Array (_ BitVec 32) ValueCell!7521)) (size!23502 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48062)

(declare-fun e!472145 () Bool)

(declare-fun array_inv!18327 (array!48062) Bool)

(assert (=> start!72870 (and (array_inv!18327 _values!688) e!472145)))

(declare-fun tp_is_empty!15921 () Bool)

(assert (=> start!72870 tp_is_empty!15921))

(declare-fun b!845836 () Bool)

(declare-fun res!574631 () Bool)

(assert (=> b!845836 (=> (not res!574631) (not e!472147))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!845836 (= res!574631 (and (= (size!23502 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23501 _keys!868) (size!23502 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845837 () Bool)

(declare-fun res!574636 () Bool)

(assert (=> b!845837 (=> (not res!574636) (not e!472147))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845837 (= res!574636 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23501 _keys!868))))))

(declare-fun b!845838 () Bool)

(declare-fun res!574635 () Bool)

(assert (=> b!845838 (=> (not res!574635) (not e!472147))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!845838 (= res!574635 (and (= (select (arr!23061 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25481 () Bool)

(declare-fun mapRes!25481 () Bool)

(declare-fun tp!48859 () Bool)

(declare-fun e!472144 () Bool)

(assert (=> mapNonEmpty!25481 (= mapRes!25481 (and tp!48859 e!472144))))

(declare-fun mapValue!25481 () ValueCell!7521)

(declare-fun mapRest!25481 () (Array (_ BitVec 32) ValueCell!7521))

(declare-fun mapKey!25481 () (_ BitVec 32))

(assert (=> mapNonEmpty!25481 (= (arr!23062 _values!688) (store mapRest!25481 mapKey!25481 mapValue!25481))))

(declare-fun mapIsEmpty!25481 () Bool)

(assert (=> mapIsEmpty!25481 mapRes!25481))

(declare-fun b!845839 () Bool)

(declare-fun res!574632 () Bool)

(assert (=> b!845839 (=> (not res!574632) (not e!472147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48060 (_ BitVec 32)) Bool)

(assert (=> b!845839 (= res!574632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845840 () Bool)

(assert (=> b!845840 (= e!472144 tp_is_empty!15921)))

(declare-fun b!845841 () Bool)

(declare-fun e!472146 () Bool)

(assert (=> b!845841 (= e!472146 tp_is_empty!15921)))

(declare-fun b!845842 () Bool)

(declare-fun res!574633 () Bool)

(assert (=> b!845842 (=> (not res!574633) (not e!472147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845842 (= res!574633 (validMask!0 mask!1196))))

(declare-fun b!845843 () Bool)

(assert (=> b!845843 (= e!472145 (and e!472146 mapRes!25481))))

(declare-fun condMapEmpty!25481 () Bool)

(declare-fun mapDefault!25481 () ValueCell!7521)

(assert (=> b!845843 (= condMapEmpty!25481 (= (arr!23062 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7521)) mapDefault!25481)))))

(declare-fun b!845844 () Bool)

(declare-fun res!574634 () Bool)

(assert (=> b!845844 (=> (not res!574634) (not e!472147))))

(declare-datatypes ((List!16322 0))(
  ( (Nil!16319) (Cons!16318 (h!17449 (_ BitVec 64)) (t!22693 List!16322)) )
))
(declare-fun arrayNoDuplicates!0 (array!48060 (_ BitVec 32) List!16322) Bool)

(assert (=> b!845844 (= res!574634 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16319))))

(declare-fun b!845845 () Bool)

(assert (=> b!845845 (= e!472147 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10460 0))(
  ( (tuple2!10461 (_1!5241 (_ BitVec 64)) (_2!5241 V!26275)) )
))
(declare-datatypes ((List!16323 0))(
  ( (Nil!16320) (Cons!16319 (h!17450 tuple2!10460) (t!22694 List!16323)) )
))
(declare-datatypes ((ListLongMap!9229 0))(
  ( (ListLongMap!9230 (toList!4630 List!16323)) )
))
(declare-fun lt!381448 () ListLongMap!9229)

(declare-fun minValue!654 () V!26275)

(declare-fun zeroValue!654 () V!26275)

(declare-fun getCurrentListMapNoExtraKeys!2615 (array!48060 array!48062 (_ BitVec 32) (_ BitVec 32) V!26275 V!26275 (_ BitVec 32) Int) ListLongMap!9229)

(assert (=> b!845845 (= lt!381448 (getCurrentListMapNoExtraKeys!2615 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845846 () Bool)

(declare-fun res!574637 () Bool)

(assert (=> b!845846 (=> (not res!574637) (not e!472147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845846 (= res!574637 (validKeyInArray!0 k0!854))))

(assert (= (and start!72870 res!574630) b!845842))

(assert (= (and b!845842 res!574633) b!845836))

(assert (= (and b!845836 res!574631) b!845839))

(assert (= (and b!845839 res!574632) b!845844))

(assert (= (and b!845844 res!574634) b!845837))

(assert (= (and b!845837 res!574636) b!845846))

(assert (= (and b!845846 res!574637) b!845838))

(assert (= (and b!845838 res!574635) b!845845))

(assert (= (and b!845843 condMapEmpty!25481) mapIsEmpty!25481))

(assert (= (and b!845843 (not condMapEmpty!25481)) mapNonEmpty!25481))

(get-info :version)

(assert (= (and mapNonEmpty!25481 ((_ is ValueCellFull!7521) mapValue!25481)) b!845840))

(assert (= (and b!845843 ((_ is ValueCellFull!7521) mapDefault!25481)) b!845841))

(assert (= start!72870 b!845843))

(declare-fun m!787467 () Bool)

(assert (=> b!845838 m!787467))

(declare-fun m!787469 () Bool)

(assert (=> b!845842 m!787469))

(declare-fun m!787471 () Bool)

(assert (=> mapNonEmpty!25481 m!787471))

(declare-fun m!787473 () Bool)

(assert (=> b!845845 m!787473))

(declare-fun m!787475 () Bool)

(assert (=> b!845839 m!787475))

(declare-fun m!787477 () Bool)

(assert (=> b!845844 m!787477))

(declare-fun m!787479 () Bool)

(assert (=> b!845846 m!787479))

(declare-fun m!787481 () Bool)

(assert (=> start!72870 m!787481))

(declare-fun m!787483 () Bool)

(assert (=> start!72870 m!787483))

(check-sat (not b!845839) b_and!22871 (not b!845846) (not mapNonEmpty!25481) tp_is_empty!15921 (not b!845842) (not b!845844) (not b_next!13785) (not b!845845) (not start!72870))
(check-sat b_and!22871 (not b_next!13785))
