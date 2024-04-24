; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73516 () Bool)

(assert start!73516)

(declare-fun b_free!14263 () Bool)

(declare-fun b_next!14263 () Bool)

(assert (=> start!73516 (= b_free!14263 (not b_next!14263))))

(declare-fun tp!50293 () Bool)

(declare-fun b_and!23629 () Bool)

(assert (=> start!73516 (= tp!50293 b_and!23629)))

(declare-fun mapNonEmpty!26198 () Bool)

(declare-fun mapRes!26198 () Bool)

(declare-fun tp!50294 () Bool)

(declare-fun e!477699 () Bool)

(assert (=> mapNonEmpty!26198 (= mapRes!26198 (and tp!50294 e!477699))))

(declare-datatypes ((V!26913 0))(
  ( (V!26914 (val!8247 Int)) )
))
(declare-datatypes ((ValueCell!7760 0))(
  ( (ValueCellFull!7760 (v!10672 V!26913)) (EmptyCell!7760) )
))
(declare-fun mapValue!26198 () ValueCell!7760)

(declare-fun mapKey!26198 () (_ BitVec 32))

(declare-fun mapRest!26198 () (Array (_ BitVec 32) ValueCell!7760))

(declare-datatypes ((array!49039 0))(
  ( (array!49040 (arr!23546 (Array (_ BitVec 32) ValueCell!7760)) (size!23987 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49039)

(assert (=> mapNonEmpty!26198 (= (arr!23546 _values!688) (store mapRest!26198 mapKey!26198 mapValue!26198))))

(declare-fun b!856768 () Bool)

(declare-fun res!581611 () Bool)

(declare-fun e!477700 () Bool)

(assert (=> b!856768 (=> (not res!581611) (not e!477700))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856768 (= res!581611 (validMask!0 mask!1196))))

(declare-fun b!856769 () Bool)

(declare-fun res!581614 () Bool)

(assert (=> b!856769 (=> (not res!581614) (not e!477700))))

(declare-datatypes ((array!49041 0))(
  ( (array!49042 (arr!23547 (Array (_ BitVec 32) (_ BitVec 64))) (size!23988 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49041)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49041 (_ BitVec 32)) Bool)

(assert (=> b!856769 (= res!581614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856770 () Bool)

(declare-fun e!477698 () Bool)

(declare-fun e!477697 () Bool)

(assert (=> b!856770 (= e!477698 (and e!477697 mapRes!26198))))

(declare-fun condMapEmpty!26198 () Bool)

(declare-fun mapDefault!26198 () ValueCell!7760)

(assert (=> b!856770 (= condMapEmpty!26198 (= (arr!23546 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7760)) mapDefault!26198)))))

(declare-fun res!581610 () Bool)

(assert (=> start!73516 (=> (not res!581610) (not e!477700))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73516 (= res!581610 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23988 _keys!868))))))

(assert (=> start!73516 e!477700))

(declare-fun tp_is_empty!16399 () Bool)

(assert (=> start!73516 tp_is_empty!16399))

(assert (=> start!73516 true))

(assert (=> start!73516 tp!50293))

(declare-fun array_inv!18704 (array!49041) Bool)

(assert (=> start!73516 (array_inv!18704 _keys!868)))

(declare-fun array_inv!18705 (array!49039) Bool)

(assert (=> start!73516 (and (array_inv!18705 _values!688) e!477698)))

(declare-fun b!856771 () Bool)

(assert (=> b!856771 (= e!477700 false)))

(declare-fun v!557 () V!26913)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10790 0))(
  ( (tuple2!10791 (_1!5406 (_ BitVec 64)) (_2!5406 V!26913)) )
))
(declare-datatypes ((List!16635 0))(
  ( (Nil!16632) (Cons!16631 (h!17768 tuple2!10790) (t!23268 List!16635)) )
))
(declare-datatypes ((ListLongMap!9561 0))(
  ( (ListLongMap!9562 (toList!4796 List!16635)) )
))
(declare-fun lt!386138 () ListLongMap!9561)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26913)

(declare-fun zeroValue!654 () V!26913)

(declare-fun getCurrentListMapNoExtraKeys!2852 (array!49041 array!49039 (_ BitVec 32) (_ BitVec 32) V!26913 V!26913 (_ BitVec 32) Int) ListLongMap!9561)

(assert (=> b!856771 (= lt!386138 (getCurrentListMapNoExtraKeys!2852 _keys!868 (array!49040 (store (arr!23546 _values!688) i!612 (ValueCellFull!7760 v!557)) (size!23987 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!386137 () ListLongMap!9561)

(assert (=> b!856771 (= lt!386137 (getCurrentListMapNoExtraKeys!2852 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856772 () Bool)

(declare-fun res!581615 () Bool)

(assert (=> b!856772 (=> (not res!581615) (not e!477700))))

(declare-datatypes ((List!16636 0))(
  ( (Nil!16633) (Cons!16632 (h!17769 (_ BitVec 64)) (t!23269 List!16636)) )
))
(declare-fun arrayNoDuplicates!0 (array!49041 (_ BitVec 32) List!16636) Bool)

(assert (=> b!856772 (= res!581615 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16633))))

(declare-fun b!856773 () Bool)

(assert (=> b!856773 (= e!477697 tp_is_empty!16399)))

(declare-fun mapIsEmpty!26198 () Bool)

(assert (=> mapIsEmpty!26198 mapRes!26198))

(declare-fun b!856774 () Bool)

(declare-fun res!581612 () Bool)

(assert (=> b!856774 (=> (not res!581612) (not e!477700))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!856774 (= res!581612 (and (= (select (arr!23547 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856775 () Bool)

(assert (=> b!856775 (= e!477699 tp_is_empty!16399)))

(declare-fun b!856776 () Bool)

(declare-fun res!581617 () Bool)

(assert (=> b!856776 (=> (not res!581617) (not e!477700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856776 (= res!581617 (validKeyInArray!0 k0!854))))

(declare-fun b!856777 () Bool)

(declare-fun res!581613 () Bool)

(assert (=> b!856777 (=> (not res!581613) (not e!477700))))

(assert (=> b!856777 (= res!581613 (and (= (size!23987 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23988 _keys!868) (size!23987 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856778 () Bool)

(declare-fun res!581616 () Bool)

(assert (=> b!856778 (=> (not res!581616) (not e!477700))))

(assert (=> b!856778 (= res!581616 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23988 _keys!868))))))

(assert (= (and start!73516 res!581610) b!856768))

(assert (= (and b!856768 res!581611) b!856777))

(assert (= (and b!856777 res!581613) b!856769))

(assert (= (and b!856769 res!581614) b!856772))

(assert (= (and b!856772 res!581615) b!856778))

(assert (= (and b!856778 res!581616) b!856776))

(assert (= (and b!856776 res!581617) b!856774))

(assert (= (and b!856774 res!581612) b!856771))

(assert (= (and b!856770 condMapEmpty!26198) mapIsEmpty!26198))

(assert (= (and b!856770 (not condMapEmpty!26198)) mapNonEmpty!26198))

(get-info :version)

(assert (= (and mapNonEmpty!26198 ((_ is ValueCellFull!7760) mapValue!26198)) b!856775))

(assert (= (and b!856770 ((_ is ValueCellFull!7760) mapDefault!26198)) b!856773))

(assert (= start!73516 b!856770))

(declare-fun m!798215 () Bool)

(assert (=> b!856769 m!798215))

(declare-fun m!798217 () Bool)

(assert (=> start!73516 m!798217))

(declare-fun m!798219 () Bool)

(assert (=> start!73516 m!798219))

(declare-fun m!798221 () Bool)

(assert (=> b!856776 m!798221))

(declare-fun m!798223 () Bool)

(assert (=> b!856771 m!798223))

(declare-fun m!798225 () Bool)

(assert (=> b!856771 m!798225))

(declare-fun m!798227 () Bool)

(assert (=> b!856771 m!798227))

(declare-fun m!798229 () Bool)

(assert (=> b!856772 m!798229))

(declare-fun m!798231 () Bool)

(assert (=> b!856774 m!798231))

(declare-fun m!798233 () Bool)

(assert (=> b!856768 m!798233))

(declare-fun m!798235 () Bool)

(assert (=> mapNonEmpty!26198 m!798235))

(check-sat b_and!23629 (not b!856776) (not mapNonEmpty!26198) (not b!856768) (not start!73516) (not b!856771) (not b!856772) tp_is_empty!16399 (not b_next!14263) (not b!856769))
(check-sat b_and!23629 (not b_next!14263))
