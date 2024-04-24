; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73612 () Bool)

(assert start!73612)

(declare-fun b_free!14359 () Bool)

(declare-fun b_next!14359 () Bool)

(assert (=> start!73612 (= b_free!14359 (not b_next!14359))))

(declare-fun tp!50582 () Bool)

(declare-fun b_and!23725 () Bool)

(assert (=> start!73612 (= tp!50582 b_and!23725)))

(declare-fun b!858489 () Bool)

(declare-fun res!582906 () Bool)

(declare-fun e!478556 () Bool)

(assert (=> b!858489 (=> (not res!582906) (not e!478556))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49221 0))(
  ( (array!49222 (arr!23637 (Array (_ BitVec 32) (_ BitVec 64))) (size!24078 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49221)

(assert (=> b!858489 (= res!582906 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24078 _keys!868))))))

(declare-fun mapIsEmpty!26342 () Bool)

(declare-fun mapRes!26342 () Bool)

(assert (=> mapIsEmpty!26342 mapRes!26342))

(declare-fun b!858490 () Bool)

(declare-fun res!582900 () Bool)

(assert (=> b!858490 (=> (not res!582900) (not e!478556))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49221 (_ BitVec 32)) Bool)

(assert (=> b!858490 (= res!582900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26342 () Bool)

(declare-fun tp!50581 () Bool)

(declare-fun e!478553 () Bool)

(assert (=> mapNonEmpty!26342 (= mapRes!26342 (and tp!50581 e!478553))))

(declare-datatypes ((V!27041 0))(
  ( (V!27042 (val!8295 Int)) )
))
(declare-datatypes ((ValueCell!7808 0))(
  ( (ValueCellFull!7808 (v!10720 V!27041)) (EmptyCell!7808) )
))
(declare-fun mapValue!26342 () ValueCell!7808)

(declare-fun mapRest!26342 () (Array (_ BitVec 32) ValueCell!7808))

(declare-fun mapKey!26342 () (_ BitVec 32))

(declare-datatypes ((array!49223 0))(
  ( (array!49224 (arr!23638 (Array (_ BitVec 32) ValueCell!7808)) (size!24079 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49223)

(assert (=> mapNonEmpty!26342 (= (arr!23638 _values!688) (store mapRest!26342 mapKey!26342 mapValue!26342))))

(declare-fun b!858491 () Bool)

(declare-fun e!478557 () Bool)

(assert (=> b!858491 (= e!478557 (not true))))

(declare-fun v!557 () V!27041)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!386702 () array!49223)

(declare-fun minValue!654 () V!27041)

(declare-fun zeroValue!654 () V!27041)

(declare-datatypes ((tuple2!10864 0))(
  ( (tuple2!10865 (_1!5443 (_ BitVec 64)) (_2!5443 V!27041)) )
))
(declare-datatypes ((List!16707 0))(
  ( (Nil!16704) (Cons!16703 (h!17840 tuple2!10864) (t!23340 List!16707)) )
))
(declare-datatypes ((ListLongMap!9635 0))(
  ( (ListLongMap!9636 (toList!4833 List!16707)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2889 (array!49221 array!49223 (_ BitVec 32) (_ BitVec 32) V!27041 V!27041 (_ BitVec 32) Int) ListLongMap!9635)

(declare-fun +!2242 (ListLongMap!9635 tuple2!10864) ListLongMap!9635)

(assert (=> b!858491 (= (getCurrentListMapNoExtraKeys!2889 _keys!868 lt!386702 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2242 (getCurrentListMapNoExtraKeys!2889 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10865 k0!854 v!557)))))

(declare-datatypes ((Unit!29240 0))(
  ( (Unit!29241) )
))
(declare-fun lt!386699 () Unit!29240)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!440 (array!49221 array!49223 (_ BitVec 32) (_ BitVec 32) V!27041 V!27041 (_ BitVec 32) (_ BitVec 64) V!27041 (_ BitVec 32) Int) Unit!29240)

(assert (=> b!858491 (= lt!386699 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!440 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858492 () Bool)

(declare-fun tp_is_empty!16495 () Bool)

(assert (=> b!858492 (= e!478553 tp_is_empty!16495)))

(declare-fun res!582902 () Bool)

(assert (=> start!73612 (=> (not res!582902) (not e!478556))))

(assert (=> start!73612 (= res!582902 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24078 _keys!868))))))

(assert (=> start!73612 e!478556))

(assert (=> start!73612 tp_is_empty!16495))

(assert (=> start!73612 true))

(assert (=> start!73612 tp!50582))

(declare-fun array_inv!18770 (array!49221) Bool)

(assert (=> start!73612 (array_inv!18770 _keys!868)))

(declare-fun e!478554 () Bool)

(declare-fun array_inv!18771 (array!49223) Bool)

(assert (=> start!73612 (and (array_inv!18771 _values!688) e!478554)))

(declare-fun b!858493 () Bool)

(declare-fun res!582899 () Bool)

(assert (=> b!858493 (=> (not res!582899) (not e!478556))))

(assert (=> b!858493 (= res!582899 (and (= (select (arr!23637 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858494 () Bool)

(assert (=> b!858494 (= e!478556 e!478557)))

(declare-fun res!582907 () Bool)

(assert (=> b!858494 (=> (not res!582907) (not e!478557))))

(assert (=> b!858494 (= res!582907 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386701 () ListLongMap!9635)

(assert (=> b!858494 (= lt!386701 (getCurrentListMapNoExtraKeys!2889 _keys!868 lt!386702 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858494 (= lt!386702 (array!49224 (store (arr!23638 _values!688) i!612 (ValueCellFull!7808 v!557)) (size!24079 _values!688)))))

(declare-fun lt!386700 () ListLongMap!9635)

(assert (=> b!858494 (= lt!386700 (getCurrentListMapNoExtraKeys!2889 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858495 () Bool)

(declare-fun res!582903 () Bool)

(assert (=> b!858495 (=> (not res!582903) (not e!478556))))

(declare-datatypes ((List!16708 0))(
  ( (Nil!16705) (Cons!16704 (h!17841 (_ BitVec 64)) (t!23341 List!16708)) )
))
(declare-fun arrayNoDuplicates!0 (array!49221 (_ BitVec 32) List!16708) Bool)

(assert (=> b!858495 (= res!582903 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16705))))

(declare-fun b!858496 () Bool)

(declare-fun res!582904 () Bool)

(assert (=> b!858496 (=> (not res!582904) (not e!478556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858496 (= res!582904 (validKeyInArray!0 k0!854))))

(declare-fun b!858497 () Bool)

(declare-fun res!582905 () Bool)

(assert (=> b!858497 (=> (not res!582905) (not e!478556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858497 (= res!582905 (validMask!0 mask!1196))))

(declare-fun b!858498 () Bool)

(declare-fun e!478555 () Bool)

(assert (=> b!858498 (= e!478555 tp_is_empty!16495)))

(declare-fun b!858499 () Bool)

(assert (=> b!858499 (= e!478554 (and e!478555 mapRes!26342))))

(declare-fun condMapEmpty!26342 () Bool)

(declare-fun mapDefault!26342 () ValueCell!7808)

(assert (=> b!858499 (= condMapEmpty!26342 (= (arr!23638 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7808)) mapDefault!26342)))))

(declare-fun b!858500 () Bool)

(declare-fun res!582901 () Bool)

(assert (=> b!858500 (=> (not res!582901) (not e!478556))))

(assert (=> b!858500 (= res!582901 (and (= (size!24079 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24078 _keys!868) (size!24079 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73612 res!582902) b!858497))

(assert (= (and b!858497 res!582905) b!858500))

(assert (= (and b!858500 res!582901) b!858490))

(assert (= (and b!858490 res!582900) b!858495))

(assert (= (and b!858495 res!582903) b!858489))

(assert (= (and b!858489 res!582906) b!858496))

(assert (= (and b!858496 res!582904) b!858493))

(assert (= (and b!858493 res!582899) b!858494))

(assert (= (and b!858494 res!582907) b!858491))

(assert (= (and b!858499 condMapEmpty!26342) mapIsEmpty!26342))

(assert (= (and b!858499 (not condMapEmpty!26342)) mapNonEmpty!26342))

(get-info :version)

(assert (= (and mapNonEmpty!26342 ((_ is ValueCellFull!7808) mapValue!26342)) b!858492))

(assert (= (and b!858499 ((_ is ValueCellFull!7808) mapDefault!26342)) b!858498))

(assert (= start!73612 b!858499))

(declare-fun m!799631 () Bool)

(assert (=> b!858495 m!799631))

(declare-fun m!799633 () Bool)

(assert (=> b!858496 m!799633))

(declare-fun m!799635 () Bool)

(assert (=> b!858497 m!799635))

(declare-fun m!799637 () Bool)

(assert (=> mapNonEmpty!26342 m!799637))

(declare-fun m!799639 () Bool)

(assert (=> b!858491 m!799639))

(declare-fun m!799641 () Bool)

(assert (=> b!858491 m!799641))

(assert (=> b!858491 m!799641))

(declare-fun m!799643 () Bool)

(assert (=> b!858491 m!799643))

(declare-fun m!799645 () Bool)

(assert (=> b!858491 m!799645))

(declare-fun m!799647 () Bool)

(assert (=> b!858494 m!799647))

(declare-fun m!799649 () Bool)

(assert (=> b!858494 m!799649))

(declare-fun m!799651 () Bool)

(assert (=> b!858494 m!799651))

(declare-fun m!799653 () Bool)

(assert (=> b!858490 m!799653))

(declare-fun m!799655 () Bool)

(assert (=> b!858493 m!799655))

(declare-fun m!799657 () Bool)

(assert (=> start!73612 m!799657))

(declare-fun m!799659 () Bool)

(assert (=> start!73612 m!799659))

(check-sat (not b!858494) (not b!858496) b_and!23725 tp_is_empty!16495 (not b!858495) (not b!858497) (not mapNonEmpty!26342) (not b!858490) (not b!858491) (not b_next!14359) (not start!73612))
(check-sat b_and!23725 (not b_next!14359))
