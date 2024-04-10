; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74016 () Bool)

(assert start!74016)

(declare-fun b_free!14931 () Bool)

(declare-fun b_next!14931 () Bool)

(assert (=> start!74016 (= b_free!14931 (not b_next!14931))))

(declare-fun tp!52297 () Bool)

(declare-fun b_and!24683 () Bool)

(assert (=> start!74016 (= tp!52297 b_and!24683)))

(declare-fun res!591586 () Bool)

(declare-fun e!484679 () Bool)

(assert (=> start!74016 (=> (not res!591586) (not e!484679))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50280 0))(
  ( (array!50281 (arr!24171 (Array (_ BitVec 32) (_ BitVec 64))) (size!24611 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50280)

(assert (=> start!74016 (= res!591586 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24611 _keys!868))))))

(assert (=> start!74016 e!484679))

(declare-fun tp_is_empty!17067 () Bool)

(assert (=> start!74016 tp_is_empty!17067))

(assert (=> start!74016 true))

(assert (=> start!74016 tp!52297))

(declare-fun array_inv!19086 (array!50280) Bool)

(assert (=> start!74016 (array_inv!19086 _keys!868)))

(declare-datatypes ((V!27803 0))(
  ( (V!27804 (val!8581 Int)) )
))
(declare-datatypes ((ValueCell!8094 0))(
  ( (ValueCellFull!8094 (v!11006 V!27803)) (EmptyCell!8094) )
))
(declare-datatypes ((array!50282 0))(
  ( (array!50283 (arr!24172 (Array (_ BitVec 32) ValueCell!8094)) (size!24612 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50282)

(declare-fun e!484678 () Bool)

(declare-fun array_inv!19087 (array!50282) Bool)

(assert (=> start!74016 (and (array_inv!19087 _values!688) e!484678)))

(declare-fun b!870411 () Bool)

(declare-fun res!591582 () Bool)

(assert (=> b!870411 (=> (not res!591582) (not e!484679))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870411 (= res!591582 (validMask!0 mask!1196))))

(declare-fun b!870412 () Bool)

(declare-fun e!484676 () Bool)

(assert (=> b!870412 (= e!484676 tp_is_empty!17067)))

(declare-fun b!870413 () Bool)

(declare-fun e!484681 () Bool)

(assert (=> b!870413 (= e!484679 e!484681)))

(declare-fun res!591585 () Bool)

(assert (=> b!870413 (=> (not res!591585) (not e!484681))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870413 (= res!591585 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395126 () array!50282)

(declare-datatypes ((tuple2!11400 0))(
  ( (tuple2!11401 (_1!5711 (_ BitVec 64)) (_2!5711 V!27803)) )
))
(declare-datatypes ((List!17192 0))(
  ( (Nil!17189) (Cons!17188 (h!18319 tuple2!11400) (t!24229 List!17192)) )
))
(declare-datatypes ((ListLongMap!10169 0))(
  ( (ListLongMap!10170 (toList!5100 List!17192)) )
))
(declare-fun lt!395127 () ListLongMap!10169)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27803)

(declare-fun zeroValue!654 () V!27803)

(declare-fun getCurrentListMapNoExtraKeys!3069 (array!50280 array!50282 (_ BitVec 32) (_ BitVec 32) V!27803 V!27803 (_ BitVec 32) Int) ListLongMap!10169)

(assert (=> b!870413 (= lt!395127 (getCurrentListMapNoExtraKeys!3069 _keys!868 lt!395126 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27803)

(assert (=> b!870413 (= lt!395126 (array!50283 (store (arr!24172 _values!688) i!612 (ValueCellFull!8094 v!557)) (size!24612 _values!688)))))

(declare-fun lt!395125 () ListLongMap!10169)

(assert (=> b!870413 (= lt!395125 (getCurrentListMapNoExtraKeys!3069 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870414 () Bool)

(declare-fun e!484677 () Bool)

(assert (=> b!870414 (= e!484677 tp_is_empty!17067)))

(declare-fun mapNonEmpty!27200 () Bool)

(declare-fun mapRes!27200 () Bool)

(declare-fun tp!52296 () Bool)

(assert (=> mapNonEmpty!27200 (= mapRes!27200 (and tp!52296 e!484677))))

(declare-fun mapRest!27200 () (Array (_ BitVec 32) ValueCell!8094))

(declare-fun mapKey!27200 () (_ BitVec 32))

(declare-fun mapValue!27200 () ValueCell!8094)

(assert (=> mapNonEmpty!27200 (= (arr!24172 _values!688) (store mapRest!27200 mapKey!27200 mapValue!27200))))

(declare-fun b!870415 () Bool)

(declare-fun res!591587 () Bool)

(assert (=> b!870415 (=> (not res!591587) (not e!484679))))

(declare-datatypes ((List!17193 0))(
  ( (Nil!17190) (Cons!17189 (h!18320 (_ BitVec 64)) (t!24230 List!17193)) )
))
(declare-fun arrayNoDuplicates!0 (array!50280 (_ BitVec 32) List!17193) Bool)

(assert (=> b!870415 (= res!591587 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17190))))

(declare-fun b!870416 () Bool)

(declare-fun res!591589 () Bool)

(assert (=> b!870416 (=> (not res!591589) (not e!484679))))

(assert (=> b!870416 (= res!591589 (and (= (size!24612 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24611 _keys!868) (size!24612 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870417 () Bool)

(declare-fun res!591590 () Bool)

(assert (=> b!870417 (=> (not res!591590) (not e!484679))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!870417 (= res!591590 (and (= (select (arr!24171 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870418 () Bool)

(declare-fun res!591584 () Bool)

(assert (=> b!870418 (=> (not res!591584) (not e!484679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870418 (= res!591584 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27200 () Bool)

(assert (=> mapIsEmpty!27200 mapRes!27200))

(declare-fun b!870419 () Bool)

(declare-fun res!591588 () Bool)

(assert (=> b!870419 (=> (not res!591588) (not e!484679))))

(assert (=> b!870419 (= res!591588 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24611 _keys!868))))))

(declare-fun b!870420 () Bool)

(assert (=> b!870420 (= e!484678 (and e!484676 mapRes!27200))))

(declare-fun condMapEmpty!27200 () Bool)

(declare-fun mapDefault!27200 () ValueCell!8094)

(assert (=> b!870420 (= condMapEmpty!27200 (= (arr!24172 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8094)) mapDefault!27200)))))

(declare-fun b!870421 () Bool)

(assert (=> b!870421 (= e!484681 (not true))))

(declare-fun +!2438 (ListLongMap!10169 tuple2!11400) ListLongMap!10169)

(assert (=> b!870421 (= (getCurrentListMapNoExtraKeys!3069 _keys!868 lt!395126 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2438 (getCurrentListMapNoExtraKeys!3069 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11401 k0!854 v!557)))))

(declare-datatypes ((Unit!29874 0))(
  ( (Unit!29875) )
))
(declare-fun lt!395128 () Unit!29874)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!632 (array!50280 array!50282 (_ BitVec 32) (_ BitVec 32) V!27803 V!27803 (_ BitVec 32) (_ BitVec 64) V!27803 (_ BitVec 32) Int) Unit!29874)

(assert (=> b!870421 (= lt!395128 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!632 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870422 () Bool)

(declare-fun res!591583 () Bool)

(assert (=> b!870422 (=> (not res!591583) (not e!484679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50280 (_ BitVec 32)) Bool)

(assert (=> b!870422 (= res!591583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74016 res!591586) b!870411))

(assert (= (and b!870411 res!591582) b!870416))

(assert (= (and b!870416 res!591589) b!870422))

(assert (= (and b!870422 res!591583) b!870415))

(assert (= (and b!870415 res!591587) b!870419))

(assert (= (and b!870419 res!591588) b!870418))

(assert (= (and b!870418 res!591584) b!870417))

(assert (= (and b!870417 res!591590) b!870413))

(assert (= (and b!870413 res!591585) b!870421))

(assert (= (and b!870420 condMapEmpty!27200) mapIsEmpty!27200))

(assert (= (and b!870420 (not condMapEmpty!27200)) mapNonEmpty!27200))

(get-info :version)

(assert (= (and mapNonEmpty!27200 ((_ is ValueCellFull!8094) mapValue!27200)) b!870414))

(assert (= (and b!870420 ((_ is ValueCellFull!8094) mapDefault!27200)) b!870412))

(assert (= start!74016 b!870420))

(declare-fun m!811787 () Bool)

(assert (=> b!870417 m!811787))

(declare-fun m!811789 () Bool)

(assert (=> b!870411 m!811789))

(declare-fun m!811791 () Bool)

(assert (=> b!870418 m!811791))

(declare-fun m!811793 () Bool)

(assert (=> b!870422 m!811793))

(declare-fun m!811795 () Bool)

(assert (=> start!74016 m!811795))

(declare-fun m!811797 () Bool)

(assert (=> start!74016 m!811797))

(declare-fun m!811799 () Bool)

(assert (=> mapNonEmpty!27200 m!811799))

(declare-fun m!811801 () Bool)

(assert (=> b!870421 m!811801))

(declare-fun m!811803 () Bool)

(assert (=> b!870421 m!811803))

(assert (=> b!870421 m!811803))

(declare-fun m!811805 () Bool)

(assert (=> b!870421 m!811805))

(declare-fun m!811807 () Bool)

(assert (=> b!870421 m!811807))

(declare-fun m!811809 () Bool)

(assert (=> b!870415 m!811809))

(declare-fun m!811811 () Bool)

(assert (=> b!870413 m!811811))

(declare-fun m!811813 () Bool)

(assert (=> b!870413 m!811813))

(declare-fun m!811815 () Bool)

(assert (=> b!870413 m!811815))

(check-sat (not mapNonEmpty!27200) (not b_next!14931) (not b!870415) (not start!74016) (not b!870413) tp_is_empty!17067 (not b!870422) (not b!870411) (not b!870418) (not b!870421) b_and!24683)
(check-sat b_and!24683 (not b_next!14931))
