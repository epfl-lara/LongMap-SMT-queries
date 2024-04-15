; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73024 () Bool)

(assert start!73024)

(declare-fun b_free!13957 () Bool)

(declare-fun b_next!13957 () Bool)

(assert (=> start!73024 (= b_free!13957 (not b_next!13957))))

(declare-fun tp!49376 () Bool)

(declare-fun b_and!23047 () Bool)

(assert (=> start!73024 (= tp!49376 b_and!23047)))

(declare-fun b!848905 () Bool)

(declare-fun e!473601 () Bool)

(assert (=> b!848905 (= e!473601 true)))

(declare-datatypes ((V!26505 0))(
  ( (V!26506 (val!8094 Int)) )
))
(declare-datatypes ((ValueCell!7607 0))(
  ( (ValueCellFull!7607 (v!10513 V!26505)) (EmptyCell!7607) )
))
(declare-datatypes ((array!48389 0))(
  ( (array!48390 (arr!23226 (Array (_ BitVec 32) ValueCell!7607)) (size!23668 (_ BitVec 32))) )
))
(declare-fun lt!381963 () array!48389)

(declare-datatypes ((tuple2!10620 0))(
  ( (tuple2!10621 (_1!5321 (_ BitVec 64)) (_2!5321 V!26505)) )
))
(declare-datatypes ((List!16466 0))(
  ( (Nil!16463) (Cons!16462 (h!17593 tuple2!10620) (t!22860 List!16466)) )
))
(declare-datatypes ((ListLongMap!9379 0))(
  ( (ListLongMap!9380 (toList!4705 List!16466)) )
))
(declare-fun lt!381965 () ListLongMap!9379)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48391 0))(
  ( (array!48392 (arr!23227 (Array (_ BitVec 32) (_ BitVec 64))) (size!23669 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48391)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26505)

(declare-fun zeroValue!654 () V!26505)

(declare-fun defaultEntry!696 () Int)

(declare-fun +!2132 (ListLongMap!9379 tuple2!10620) ListLongMap!9379)

(declare-fun getCurrentListMapNoExtraKeys!2715 (array!48391 array!48389 (_ BitVec 32) (_ BitVec 32) V!26505 V!26505 (_ BitVec 32) Int) ListLongMap!9379)

(declare-fun get!12231 (ValueCell!7607 V!26505) V!26505)

(declare-fun dynLambda!998 (Int (_ BitVec 64)) V!26505)

(assert (=> b!848905 (= lt!381965 (+!2132 (getCurrentListMapNoExtraKeys!2715 _keys!868 lt!381963 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10621 (select (arr!23227 _keys!868) from!1053) (get!12231 (select (arr!23226 lt!381963) from!1053) (dynLambda!998 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!473602 () Bool)

(declare-fun v!557 () V!26505)

(declare-fun call!37700 () ListLongMap!9379)

(declare-fun call!37701 () ListLongMap!9379)

(declare-fun b!848906 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!848906 (= e!473602 (= call!37701 (+!2132 call!37700 (tuple2!10621 k0!854 v!557))))))

(declare-fun mapIsEmpty!25739 () Bool)

(declare-fun mapRes!25739 () Bool)

(assert (=> mapIsEmpty!25739 mapRes!25739))

(declare-fun bm!37697 () Bool)

(assert (=> bm!37697 (= call!37701 (getCurrentListMapNoExtraKeys!2715 _keys!868 lt!381963 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848907 () Bool)

(declare-fun res!576769 () Bool)

(declare-fun e!473597 () Bool)

(assert (=> b!848907 (=> (not res!576769) (not e!473597))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848907 (= res!576769 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23669 _keys!868))))))

(declare-fun b!848908 () Bool)

(declare-fun e!473604 () Bool)

(assert (=> b!848908 (= e!473604 (not e!473601))))

(declare-fun res!576776 () Bool)

(assert (=> b!848908 (=> res!576776 e!473601)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848908 (= res!576776 (not (validKeyInArray!0 (select (arr!23227 _keys!868) from!1053))))))

(assert (=> b!848908 e!473602))

(declare-fun c!91541 () Bool)

(assert (=> b!848908 (= c!91541 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28939 0))(
  ( (Unit!28940) )
))
(declare-fun lt!381964 () Unit!28939)

(declare-fun _values!688 () array!48389)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!344 (array!48391 array!48389 (_ BitVec 32) (_ BitVec 32) V!26505 V!26505 (_ BitVec 32) (_ BitVec 64) V!26505 (_ BitVec 32) Int) Unit!28939)

(assert (=> b!848908 (= lt!381964 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!344 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848909 () Bool)

(assert (=> b!848909 (= e!473597 e!473604)))

(declare-fun res!576777 () Bool)

(assert (=> b!848909 (=> (not res!576777) (not e!473604))))

(assert (=> b!848909 (= res!576777 (= from!1053 i!612))))

(assert (=> b!848909 (= lt!381965 (getCurrentListMapNoExtraKeys!2715 _keys!868 lt!381963 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848909 (= lt!381963 (array!48390 (store (arr!23226 _values!688) i!612 (ValueCellFull!7607 v!557)) (size!23668 _values!688)))))

(declare-fun lt!381962 () ListLongMap!9379)

(assert (=> b!848909 (= lt!381962 (getCurrentListMapNoExtraKeys!2715 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848910 () Bool)

(declare-fun e!473603 () Bool)

(declare-fun tp_is_empty!16093 () Bool)

(assert (=> b!848910 (= e!473603 tp_is_empty!16093)))

(declare-fun mapNonEmpty!25739 () Bool)

(declare-fun tp!49375 () Bool)

(assert (=> mapNonEmpty!25739 (= mapRes!25739 (and tp!49375 e!473603))))

(declare-fun mapValue!25739 () ValueCell!7607)

(declare-fun mapKey!25739 () (_ BitVec 32))

(declare-fun mapRest!25739 () (Array (_ BitVec 32) ValueCell!7607))

(assert (=> mapNonEmpty!25739 (= (arr!23226 _values!688) (store mapRest!25739 mapKey!25739 mapValue!25739))))

(declare-fun b!848911 () Bool)

(declare-fun res!576773 () Bool)

(assert (=> b!848911 (=> (not res!576773) (not e!473597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848911 (= res!576773 (validMask!0 mask!1196))))

(declare-fun b!848912 () Bool)

(assert (=> b!848912 (= e!473602 (= call!37701 call!37700))))

(declare-fun b!848913 () Bool)

(declare-fun res!576771 () Bool)

(assert (=> b!848913 (=> (not res!576771) (not e!473597))))

(assert (=> b!848913 (= res!576771 (and (= (size!23668 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23669 _keys!868) (size!23668 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848914 () Bool)

(declare-fun res!576768 () Bool)

(assert (=> b!848914 (=> (not res!576768) (not e!473597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48391 (_ BitVec 32)) Bool)

(assert (=> b!848914 (= res!576768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848915 () Bool)

(declare-fun res!576772 () Bool)

(assert (=> b!848915 (=> (not res!576772) (not e!473597))))

(declare-datatypes ((List!16467 0))(
  ( (Nil!16464) (Cons!16463 (h!17594 (_ BitVec 64)) (t!22861 List!16467)) )
))
(declare-fun arrayNoDuplicates!0 (array!48391 (_ BitVec 32) List!16467) Bool)

(assert (=> b!848915 (= res!576772 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16464))))

(declare-fun b!848916 () Bool)

(declare-fun res!576770 () Bool)

(assert (=> b!848916 (=> (not res!576770) (not e!473597))))

(assert (=> b!848916 (= res!576770 (validKeyInArray!0 k0!854))))

(declare-fun res!576775 () Bool)

(assert (=> start!73024 (=> (not res!576775) (not e!473597))))

(assert (=> start!73024 (= res!576775 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23669 _keys!868))))))

(assert (=> start!73024 e!473597))

(assert (=> start!73024 tp_is_empty!16093))

(assert (=> start!73024 true))

(assert (=> start!73024 tp!49376))

(declare-fun array_inv!18518 (array!48391) Bool)

(assert (=> start!73024 (array_inv!18518 _keys!868)))

(declare-fun e!473600 () Bool)

(declare-fun array_inv!18519 (array!48389) Bool)

(assert (=> start!73024 (and (array_inv!18519 _values!688) e!473600)))

(declare-fun b!848917 () Bool)

(declare-fun e!473598 () Bool)

(assert (=> b!848917 (= e!473600 (and e!473598 mapRes!25739))))

(declare-fun condMapEmpty!25739 () Bool)

(declare-fun mapDefault!25739 () ValueCell!7607)

(assert (=> b!848917 (= condMapEmpty!25739 (= (arr!23226 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7607)) mapDefault!25739)))))

(declare-fun b!848918 () Bool)

(assert (=> b!848918 (= e!473598 tp_is_empty!16093)))

(declare-fun bm!37698 () Bool)

(assert (=> bm!37698 (= call!37700 (getCurrentListMapNoExtraKeys!2715 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848919 () Bool)

(declare-fun res!576774 () Bool)

(assert (=> b!848919 (=> (not res!576774) (not e!473597))))

(assert (=> b!848919 (= res!576774 (and (= (select (arr!23227 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73024 res!576775) b!848911))

(assert (= (and b!848911 res!576773) b!848913))

(assert (= (and b!848913 res!576771) b!848914))

(assert (= (and b!848914 res!576768) b!848915))

(assert (= (and b!848915 res!576772) b!848907))

(assert (= (and b!848907 res!576769) b!848916))

(assert (= (and b!848916 res!576770) b!848919))

(assert (= (and b!848919 res!576774) b!848909))

(assert (= (and b!848909 res!576777) b!848908))

(assert (= (and b!848908 c!91541) b!848906))

(assert (= (and b!848908 (not c!91541)) b!848912))

(assert (= (or b!848906 b!848912) bm!37698))

(assert (= (or b!848906 b!848912) bm!37697))

(assert (= (and b!848908 (not res!576776)) b!848905))

(assert (= (and b!848917 condMapEmpty!25739) mapIsEmpty!25739))

(assert (= (and b!848917 (not condMapEmpty!25739)) mapNonEmpty!25739))

(get-info :version)

(assert (= (and mapNonEmpty!25739 ((_ is ValueCellFull!7607) mapValue!25739)) b!848910))

(assert (= (and b!848917 ((_ is ValueCellFull!7607) mapDefault!25739)) b!848918))

(assert (= start!73024 b!848917))

(declare-fun b_lambda!11471 () Bool)

(assert (=> (not b_lambda!11471) (not b!848905)))

(declare-fun t!22859 () Bool)

(declare-fun tb!4251 () Bool)

(assert (=> (and start!73024 (= defaultEntry!696 defaultEntry!696) t!22859) tb!4251))

(declare-fun result!8121 () Bool)

(assert (=> tb!4251 (= result!8121 tp_is_empty!16093)))

(assert (=> b!848905 t!22859))

(declare-fun b_and!23049 () Bool)

(assert (= b_and!23047 (and (=> t!22859 result!8121) b_and!23049)))

(declare-fun m!789101 () Bool)

(assert (=> b!848905 m!789101))

(declare-fun m!789103 () Bool)

(assert (=> b!848905 m!789103))

(declare-fun m!789105 () Bool)

(assert (=> b!848905 m!789105))

(declare-fun m!789107 () Bool)

(assert (=> b!848905 m!789107))

(assert (=> b!848905 m!789101))

(declare-fun m!789109 () Bool)

(assert (=> b!848905 m!789109))

(assert (=> b!848905 m!789103))

(declare-fun m!789111 () Bool)

(assert (=> b!848905 m!789111))

(assert (=> b!848905 m!789105))

(declare-fun m!789113 () Bool)

(assert (=> b!848911 m!789113))

(assert (=> b!848908 m!789111))

(assert (=> b!848908 m!789111))

(declare-fun m!789115 () Bool)

(assert (=> b!848908 m!789115))

(declare-fun m!789117 () Bool)

(assert (=> b!848908 m!789117))

(declare-fun m!789119 () Bool)

(assert (=> b!848906 m!789119))

(declare-fun m!789121 () Bool)

(assert (=> mapNonEmpty!25739 m!789121))

(assert (=> bm!37697 m!789101))

(declare-fun m!789123 () Bool)

(assert (=> b!848919 m!789123))

(declare-fun m!789125 () Bool)

(assert (=> b!848914 m!789125))

(declare-fun m!789127 () Bool)

(assert (=> b!848915 m!789127))

(declare-fun m!789129 () Bool)

(assert (=> start!73024 m!789129))

(declare-fun m!789131 () Bool)

(assert (=> start!73024 m!789131))

(declare-fun m!789133 () Bool)

(assert (=> b!848916 m!789133))

(declare-fun m!789135 () Bool)

(assert (=> bm!37698 m!789135))

(declare-fun m!789137 () Bool)

(assert (=> b!848909 m!789137))

(declare-fun m!789139 () Bool)

(assert (=> b!848909 m!789139))

(declare-fun m!789141 () Bool)

(assert (=> b!848909 m!789141))

(check-sat (not b!848905) (not start!73024) b_and!23049 (not bm!37697) (not b!848909) (not b_next!13957) (not b!848914) (not b_lambda!11471) (not b!848911) (not bm!37698) (not b!848915) (not b!848906) (not b!848916) (not mapNonEmpty!25739) (not b!848908) tp_is_empty!16093)
(check-sat b_and!23049 (not b_next!13957))
