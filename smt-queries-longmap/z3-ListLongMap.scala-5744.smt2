; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74460 () Bool)

(assert start!74460)

(declare-fun b_free!15055 () Bool)

(declare-fun b_next!15055 () Bool)

(assert (=> start!74460 (= b_free!15055 (not b_next!15055))))

(declare-fun tp!52840 () Bool)

(declare-fun b_and!24841 () Bool)

(assert (=> start!74460 (= tp!52840 b_and!24841)))

(declare-fun b!874985 () Bool)

(declare-fun res!594334 () Bool)

(declare-fun e!487288 () Bool)

(assert (=> b!874985 (=> (not res!594334) (not e!487288))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874985 (= res!594334 (validMask!0 mask!1196))))

(declare-fun b!874987 () Bool)

(declare-fun res!594331 () Bool)

(assert (=> b!874987 (=> (not res!594331) (not e!487288))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50781 0))(
  ( (array!50782 (arr!24414 (Array (_ BitVec 32) (_ BitVec 64))) (size!24855 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50781)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874987 (= res!594331 (and (= (select (arr!24414 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874988 () Bool)

(declare-fun res!594335 () Bool)

(assert (=> b!874988 (=> (not res!594335) (not e!487288))))

(declare-datatypes ((List!17269 0))(
  ( (Nil!17266) (Cons!17265 (h!18402 (_ BitVec 64)) (t!24302 List!17269)) )
))
(declare-fun arrayNoDuplicates!0 (array!50781 (_ BitVec 32) List!17269) Bool)

(assert (=> b!874988 (= res!594335 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17266))))

(declare-fun b!874989 () Bool)

(declare-fun e!487292 () Bool)

(declare-fun tp_is_empty!17299 () Bool)

(assert (=> b!874989 (= e!487292 tp_is_empty!17299)))

(declare-fun b!874990 () Bool)

(assert (=> b!874990 (= e!487288 false)))

(declare-datatypes ((V!28113 0))(
  ( (V!28114 (val!8697 Int)) )
))
(declare-fun v!557 () V!28113)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8210 0))(
  ( (ValueCellFull!8210 (v!11126 V!28113)) (EmptyCell!8210) )
))
(declare-datatypes ((array!50783 0))(
  ( (array!50784 (arr!24415 (Array (_ BitVec 32) ValueCell!8210)) (size!24856 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50783)

(declare-fun zeroValue!654 () V!28113)

(declare-fun minValue!654 () V!28113)

(declare-datatypes ((tuple2!11422 0))(
  ( (tuple2!11423 (_1!5722 (_ BitVec 64)) (_2!5722 V!28113)) )
))
(declare-datatypes ((List!17270 0))(
  ( (Nil!17267) (Cons!17266 (h!18403 tuple2!11422) (t!24303 List!17270)) )
))
(declare-datatypes ((ListLongMap!10193 0))(
  ( (ListLongMap!10194 (toList!5112 List!17270)) )
))
(declare-fun lt!396239 () ListLongMap!10193)

(declare-fun getCurrentListMapNoExtraKeys!3155 (array!50781 array!50783 (_ BitVec 32) (_ BitVec 32) V!28113 V!28113 (_ BitVec 32) Int) ListLongMap!10193)

(assert (=> b!874990 (= lt!396239 (getCurrentListMapNoExtraKeys!3155 _keys!868 (array!50784 (store (arr!24415 _values!688) i!612 (ValueCellFull!8210 v!557)) (size!24856 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396240 () ListLongMap!10193)

(assert (=> b!874990 (= lt!396240 (getCurrentListMapNoExtraKeys!3155 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874991 () Bool)

(declare-fun e!487290 () Bool)

(assert (=> b!874991 (= e!487290 tp_is_empty!17299)))

(declare-fun res!594338 () Bool)

(assert (=> start!74460 (=> (not res!594338) (not e!487288))))

(assert (=> start!74460 (= res!594338 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24855 _keys!868))))))

(assert (=> start!74460 e!487288))

(assert (=> start!74460 tp_is_empty!17299))

(assert (=> start!74460 true))

(assert (=> start!74460 tp!52840))

(declare-fun array_inv!19314 (array!50781) Bool)

(assert (=> start!74460 (array_inv!19314 _keys!868)))

(declare-fun e!487291 () Bool)

(declare-fun array_inv!19315 (array!50783) Bool)

(assert (=> start!74460 (and (array_inv!19315 _values!688) e!487291)))

(declare-fun b!874986 () Bool)

(declare-fun res!594332 () Bool)

(assert (=> b!874986 (=> (not res!594332) (not e!487288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50781 (_ BitVec 32)) Bool)

(assert (=> b!874986 (= res!594332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874992 () Bool)

(declare-fun mapRes!27557 () Bool)

(assert (=> b!874992 (= e!487291 (and e!487292 mapRes!27557))))

(declare-fun condMapEmpty!27557 () Bool)

(declare-fun mapDefault!27557 () ValueCell!8210)

(assert (=> b!874992 (= condMapEmpty!27557 (= (arr!24415 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8210)) mapDefault!27557)))))

(declare-fun b!874993 () Bool)

(declare-fun res!594333 () Bool)

(assert (=> b!874993 (=> (not res!594333) (not e!487288))))

(assert (=> b!874993 (= res!594333 (and (= (size!24856 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24855 _keys!868) (size!24856 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874994 () Bool)

(declare-fun res!594336 () Bool)

(assert (=> b!874994 (=> (not res!594336) (not e!487288))))

(assert (=> b!874994 (= res!594336 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24855 _keys!868))))))

(declare-fun b!874995 () Bool)

(declare-fun res!594337 () Bool)

(assert (=> b!874995 (=> (not res!594337) (not e!487288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874995 (= res!594337 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27557 () Bool)

(assert (=> mapIsEmpty!27557 mapRes!27557))

(declare-fun mapNonEmpty!27557 () Bool)

(declare-fun tp!52841 () Bool)

(assert (=> mapNonEmpty!27557 (= mapRes!27557 (and tp!52841 e!487290))))

(declare-fun mapKey!27557 () (_ BitVec 32))

(declare-fun mapRest!27557 () (Array (_ BitVec 32) ValueCell!8210))

(declare-fun mapValue!27557 () ValueCell!8210)

(assert (=> mapNonEmpty!27557 (= (arr!24415 _values!688) (store mapRest!27557 mapKey!27557 mapValue!27557))))

(assert (= (and start!74460 res!594338) b!874985))

(assert (= (and b!874985 res!594334) b!874993))

(assert (= (and b!874993 res!594333) b!874986))

(assert (= (and b!874986 res!594332) b!874988))

(assert (= (and b!874988 res!594335) b!874994))

(assert (= (and b!874994 res!594336) b!874995))

(assert (= (and b!874995 res!594337) b!874987))

(assert (= (and b!874987 res!594331) b!874990))

(assert (= (and b!874992 condMapEmpty!27557) mapIsEmpty!27557))

(assert (= (and b!874992 (not condMapEmpty!27557)) mapNonEmpty!27557))

(get-info :version)

(assert (= (and mapNonEmpty!27557 ((_ is ValueCellFull!8210) mapValue!27557)) b!874991))

(assert (= (and b!874992 ((_ is ValueCellFull!8210) mapDefault!27557)) b!874989))

(assert (= start!74460 b!874992))

(declare-fun m!815659 () Bool)

(assert (=> start!74460 m!815659))

(declare-fun m!815661 () Bool)

(assert (=> start!74460 m!815661))

(declare-fun m!815663 () Bool)

(assert (=> mapNonEmpty!27557 m!815663))

(declare-fun m!815665 () Bool)

(assert (=> b!874995 m!815665))

(declare-fun m!815667 () Bool)

(assert (=> b!874990 m!815667))

(declare-fun m!815669 () Bool)

(assert (=> b!874990 m!815669))

(declare-fun m!815671 () Bool)

(assert (=> b!874990 m!815671))

(declare-fun m!815673 () Bool)

(assert (=> b!874988 m!815673))

(declare-fun m!815675 () Bool)

(assert (=> b!874987 m!815675))

(declare-fun m!815677 () Bool)

(assert (=> b!874985 m!815677))

(declare-fun m!815679 () Bool)

(assert (=> b!874986 m!815679))

(check-sat (not b_next!15055) (not mapNonEmpty!27557) b_and!24841 (not b!874985) (not b!874995) tp_is_empty!17299 (not b!874986) (not b!874990) (not start!74460) (not b!874988))
(check-sat b_and!24841 (not b_next!15055))
