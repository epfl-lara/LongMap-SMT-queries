; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74988 () Bool)

(assert start!74988)

(declare-fun b_free!15477 () Bool)

(declare-fun b_next!15477 () Bool)

(assert (=> start!74988 (= b_free!15477 (not b_next!15477))))

(declare-fun tp!54137 () Bool)

(declare-fun b_and!25667 () Bool)

(assert (=> start!74988 (= tp!54137 b_and!25667)))

(declare-fun res!600900 () Bool)

(declare-fun e!492278 () Bool)

(assert (=> start!74988 (=> (not res!600900) (not e!492278))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51568 0))(
  ( (array!51569 (arr!24802 (Array (_ BitVec 32) (_ BitVec 64))) (size!25242 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51568)

(assert (=> start!74988 (= res!600900 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25242 _keys!868))))))

(assert (=> start!74988 e!492278))

(declare-fun tp_is_empty!17721 () Bool)

(assert (=> start!74988 tp_is_empty!17721))

(assert (=> start!74988 true))

(assert (=> start!74988 tp!54137))

(declare-fun array_inv!19526 (array!51568) Bool)

(assert (=> start!74988 (array_inv!19526 _keys!868)))

(declare-datatypes ((V!28675 0))(
  ( (V!28676 (val!8908 Int)) )
))
(declare-datatypes ((ValueCell!8421 0))(
  ( (ValueCellFull!8421 (v!11381 V!28675)) (EmptyCell!8421) )
))
(declare-datatypes ((array!51570 0))(
  ( (array!51571 (arr!24803 (Array (_ BitVec 32) ValueCell!8421)) (size!25243 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51570)

(declare-fun e!492276 () Bool)

(declare-fun array_inv!19527 (array!51570) Bool)

(assert (=> start!74988 (and (array_inv!19527 _values!688) e!492276)))

(declare-fun b!884563 () Bool)

(declare-fun e!492273 () Bool)

(assert (=> b!884563 (= e!492278 e!492273)))

(declare-fun res!600898 () Bool)

(assert (=> b!884563 (=> (not res!600898) (not e!492273))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!884563 (= res!600898 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400715 () array!51570)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11812 0))(
  ( (tuple2!11813 (_1!5917 (_ BitVec 64)) (_2!5917 V!28675)) )
))
(declare-datatypes ((List!17619 0))(
  ( (Nil!17616) (Cons!17615 (h!18746 tuple2!11812) (t!24894 List!17619)) )
))
(declare-datatypes ((ListLongMap!10581 0))(
  ( (ListLongMap!10582 (toList!5306 List!17619)) )
))
(declare-fun lt!400716 () ListLongMap!10581)

(declare-fun minValue!654 () V!28675)

(declare-fun zeroValue!654 () V!28675)

(declare-fun getCurrentListMapNoExtraKeys!3265 (array!51568 array!51570 (_ BitVec 32) (_ BitVec 32) V!28675 V!28675 (_ BitVec 32) Int) ListLongMap!10581)

(assert (=> b!884563 (= lt!400716 (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!400715 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28675)

(assert (=> b!884563 (= lt!400715 (array!51571 (store (arr!24803 _values!688) i!612 (ValueCellFull!8421 v!557)) (size!25243 _values!688)))))

(declare-fun lt!400714 () ListLongMap!10581)

(assert (=> b!884563 (= lt!400714 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884564 () Bool)

(declare-fun res!600897 () Bool)

(assert (=> b!884564 (=> (not res!600897) (not e!492278))))

(declare-datatypes ((List!17620 0))(
  ( (Nil!17617) (Cons!17616 (h!18747 (_ BitVec 64)) (t!24895 List!17620)) )
))
(declare-fun arrayNoDuplicates!0 (array!51568 (_ BitVec 32) List!17620) Bool)

(assert (=> b!884564 (= res!600897 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17617))))

(declare-fun b!884565 () Bool)

(declare-fun res!600902 () Bool)

(assert (=> b!884565 (=> (not res!600902) (not e!492278))))

(assert (=> b!884565 (= res!600902 (and (= (size!25243 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25242 _keys!868) (size!25243 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28221 () Bool)

(declare-fun mapRes!28221 () Bool)

(declare-fun tp!54136 () Bool)

(declare-fun e!492275 () Bool)

(assert (=> mapNonEmpty!28221 (= mapRes!28221 (and tp!54136 e!492275))))

(declare-fun mapValue!28221 () ValueCell!8421)

(declare-fun mapKey!28221 () (_ BitVec 32))

(declare-fun mapRest!28221 () (Array (_ BitVec 32) ValueCell!8421))

(assert (=> mapNonEmpty!28221 (= (arr!24803 _values!688) (store mapRest!28221 mapKey!28221 mapValue!28221))))

(declare-fun b!884566 () Bool)

(declare-fun e!492277 () Bool)

(assert (=> b!884566 (= e!492277 tp_is_empty!17721)))

(declare-fun b!884567 () Bool)

(declare-fun e!492274 () Bool)

(assert (=> b!884567 (= e!492273 (not e!492274))))

(declare-fun res!600905 () Bool)

(assert (=> b!884567 (=> res!600905 e!492274)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884567 (= res!600905 (validKeyInArray!0 (select (arr!24802 _keys!868) from!1053)))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2575 (ListLongMap!10581 tuple2!11812) ListLongMap!10581)

(assert (=> b!884567 (= (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!400715 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2575 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11813 k0!854 v!557)))))

(declare-datatypes ((Unit!30206 0))(
  ( (Unit!30207) )
))
(declare-fun lt!400713 () Unit!30206)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!758 (array!51568 array!51570 (_ BitVec 32) (_ BitVec 32) V!28675 V!28675 (_ BitVec 32) (_ BitVec 64) V!28675 (_ BitVec 32) Int) Unit!30206)

(assert (=> b!884567 (= lt!400713 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!758 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884568 () Bool)

(assert (=> b!884568 (= e!492274 (bvslt i!612 (size!25243 _values!688)))))

(declare-fun mapIsEmpty!28221 () Bool)

(assert (=> mapIsEmpty!28221 mapRes!28221))

(declare-fun b!884569 () Bool)

(declare-fun res!600904 () Bool)

(assert (=> b!884569 (=> (not res!600904) (not e!492278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884569 (= res!600904 (validMask!0 mask!1196))))

(declare-fun b!884570 () Bool)

(assert (=> b!884570 (= e!492276 (and e!492277 mapRes!28221))))

(declare-fun condMapEmpty!28221 () Bool)

(declare-fun mapDefault!28221 () ValueCell!8421)

(assert (=> b!884570 (= condMapEmpty!28221 (= (arr!24803 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8421)) mapDefault!28221)))))

(declare-fun b!884571 () Bool)

(declare-fun res!600901 () Bool)

(assert (=> b!884571 (=> (not res!600901) (not e!492278))))

(assert (=> b!884571 (= res!600901 (and (= (select (arr!24802 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884572 () Bool)

(declare-fun res!600896 () Bool)

(assert (=> b!884572 (=> (not res!600896) (not e!492278))))

(assert (=> b!884572 (= res!600896 (validKeyInArray!0 k0!854))))

(declare-fun b!884573 () Bool)

(declare-fun res!600903 () Bool)

(assert (=> b!884573 (=> (not res!600903) (not e!492278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51568 (_ BitVec 32)) Bool)

(assert (=> b!884573 (= res!600903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884574 () Bool)

(assert (=> b!884574 (= e!492275 tp_is_empty!17721)))

(declare-fun b!884575 () Bool)

(declare-fun res!600899 () Bool)

(assert (=> b!884575 (=> (not res!600899) (not e!492278))))

(assert (=> b!884575 (= res!600899 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25242 _keys!868))))))

(assert (= (and start!74988 res!600900) b!884569))

(assert (= (and b!884569 res!600904) b!884565))

(assert (= (and b!884565 res!600902) b!884573))

(assert (= (and b!884573 res!600903) b!884564))

(assert (= (and b!884564 res!600897) b!884575))

(assert (= (and b!884575 res!600899) b!884572))

(assert (= (and b!884572 res!600896) b!884571))

(assert (= (and b!884571 res!600901) b!884563))

(assert (= (and b!884563 res!600898) b!884567))

(assert (= (and b!884567 (not res!600905)) b!884568))

(assert (= (and b!884570 condMapEmpty!28221) mapIsEmpty!28221))

(assert (= (and b!884570 (not condMapEmpty!28221)) mapNonEmpty!28221))

(get-info :version)

(assert (= (and mapNonEmpty!28221 ((_ is ValueCellFull!8421) mapValue!28221)) b!884574))

(assert (= (and b!884570 ((_ is ValueCellFull!8421) mapDefault!28221)) b!884566))

(assert (= start!74988 b!884570))

(declare-fun m!824813 () Bool)

(assert (=> b!884572 m!824813))

(declare-fun m!824815 () Bool)

(assert (=> b!884573 m!824815))

(declare-fun m!824817 () Bool)

(assert (=> b!884571 m!824817))

(declare-fun m!824819 () Bool)

(assert (=> mapNonEmpty!28221 m!824819))

(declare-fun m!824821 () Bool)

(assert (=> start!74988 m!824821))

(declare-fun m!824823 () Bool)

(assert (=> start!74988 m!824823))

(declare-fun m!824825 () Bool)

(assert (=> b!884569 m!824825))

(declare-fun m!824827 () Bool)

(assert (=> b!884567 m!824827))

(declare-fun m!824829 () Bool)

(assert (=> b!884567 m!824829))

(declare-fun m!824831 () Bool)

(assert (=> b!884567 m!824831))

(assert (=> b!884567 m!824827))

(declare-fun m!824833 () Bool)

(assert (=> b!884567 m!824833))

(declare-fun m!824835 () Bool)

(assert (=> b!884567 m!824835))

(assert (=> b!884567 m!824833))

(declare-fun m!824837 () Bool)

(assert (=> b!884567 m!824837))

(declare-fun m!824839 () Bool)

(assert (=> b!884563 m!824839))

(declare-fun m!824841 () Bool)

(assert (=> b!884563 m!824841))

(declare-fun m!824843 () Bool)

(assert (=> b!884563 m!824843))

(declare-fun m!824845 () Bool)

(assert (=> b!884564 m!824845))

(check-sat (not b!884567) (not b_next!15477) b_and!25667 (not b!884572) (not b!884563) (not b!884573) (not b!884569) (not b!884564) tp_is_empty!17721 (not mapNonEmpty!28221) (not start!74988))
(check-sat b_and!25667 (not b_next!15477))
