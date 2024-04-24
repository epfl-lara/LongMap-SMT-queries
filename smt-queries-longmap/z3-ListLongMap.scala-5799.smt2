; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74976 () Bool)

(assert start!74976)

(declare-fun b_free!15385 () Bool)

(declare-fun b_next!15385 () Bool)

(assert (=> start!74976 (= b_free!15385 (not b_next!15385))))

(declare-fun tp!53853 () Bool)

(declare-fun b_and!25447 () Bool)

(assert (=> start!74976 (= tp!53853 b_and!25447)))

(declare-fun b!882811 () Bool)

(declare-fun e!491389 () Bool)

(declare-fun tp_is_empty!17629 () Bool)

(assert (=> b!882811 (= e!491389 tp_is_empty!17629)))

(declare-fun mapIsEmpty!28074 () Bool)

(declare-fun mapRes!28074 () Bool)

(assert (=> mapIsEmpty!28074 mapRes!28074))

(declare-fun b!882812 () Bool)

(declare-fun res!599484 () Bool)

(declare-fun e!491390 () Bool)

(assert (=> b!882812 (=> (not res!599484) (not e!491390))))

(declare-datatypes ((array!51423 0))(
  ( (array!51424 (arr!24728 (Array (_ BitVec 32) (_ BitVec 64))) (size!25169 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51423)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51423 (_ BitVec 32)) Bool)

(assert (=> b!882812 (= res!599484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!599483 () Bool)

(assert (=> start!74976 (=> (not res!599483) (not e!491390))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74976 (= res!599483 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25169 _keys!868))))))

(assert (=> start!74976 e!491390))

(assert (=> start!74976 tp_is_empty!17629))

(assert (=> start!74976 true))

(assert (=> start!74976 tp!53853))

(declare-fun array_inv!19516 (array!51423) Bool)

(assert (=> start!74976 (array_inv!19516 _keys!868)))

(declare-datatypes ((V!28553 0))(
  ( (V!28554 (val!8862 Int)) )
))
(declare-datatypes ((ValueCell!8375 0))(
  ( (ValueCellFull!8375 (v!11322 V!28553)) (EmptyCell!8375) )
))
(declare-datatypes ((array!51425 0))(
  ( (array!51426 (arr!24729 (Array (_ BitVec 32) ValueCell!8375)) (size!25170 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51425)

(declare-fun e!491388 () Bool)

(declare-fun array_inv!19517 (array!51425) Bool)

(assert (=> start!74976 (and (array_inv!19517 _values!688) e!491388)))

(declare-fun b!882813 () Bool)

(declare-fun res!599489 () Bool)

(assert (=> b!882813 (=> (not res!599489) (not e!491390))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882813 (= res!599489 (validKeyInArray!0 k0!854))))

(declare-fun b!882814 () Bool)

(declare-fun e!491387 () Bool)

(assert (=> b!882814 (= e!491387 tp_is_empty!17629)))

(declare-fun b!882815 () Bool)

(declare-fun e!491385 () Bool)

(assert (=> b!882815 (= e!491385 (or (bvsge (size!25169 _keys!868) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25169 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882815 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30074 0))(
  ( (Unit!30075) )
))
(declare-fun lt!399305 () Unit!30074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51423 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30074)

(assert (=> b!882815 (= lt!399305 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17503 0))(
  ( (Nil!17500) (Cons!17499 (h!18636 (_ BitVec 64)) (t!24682 List!17503)) )
))
(declare-fun arrayNoDuplicates!0 (array!51423 (_ BitVec 32) List!17503) Bool)

(assert (=> b!882815 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17500)))

(declare-fun lt!399301 () Unit!30074)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51423 (_ BitVec 32) (_ BitVec 32)) Unit!30074)

(assert (=> b!882815 (= lt!399301 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882816 () Bool)

(declare-fun res!599482 () Bool)

(assert (=> b!882816 (=> (not res!599482) (not e!491390))))

(assert (=> b!882816 (= res!599482 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25169 _keys!868))))))

(declare-fun b!882817 () Bool)

(declare-fun res!599481 () Bool)

(assert (=> b!882817 (=> (not res!599481) (not e!491390))))

(assert (=> b!882817 (= res!599481 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17500))))

(declare-fun b!882818 () Bool)

(declare-fun e!491386 () Bool)

(declare-fun e!491391 () Bool)

(assert (=> b!882818 (= e!491386 (not e!491391))))

(declare-fun res!599485 () Bool)

(assert (=> b!882818 (=> res!599485 e!491391)))

(assert (=> b!882818 (= res!599485 (not (validKeyInArray!0 (select (arr!24728 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11674 0))(
  ( (tuple2!11675 (_1!5848 (_ BitVec 64)) (_2!5848 V!28553)) )
))
(declare-datatypes ((List!17504 0))(
  ( (Nil!17501) (Cons!17500 (h!18637 tuple2!11674) (t!24683 List!17504)) )
))
(declare-datatypes ((ListLongMap!10445 0))(
  ( (ListLongMap!10446 (toList!5238 List!17504)) )
))
(declare-fun lt!399309 () ListLongMap!10445)

(declare-fun lt!399304 () ListLongMap!10445)

(assert (=> b!882818 (= lt!399309 lt!399304)))

(declare-fun v!557 () V!28553)

(declare-fun lt!399306 () ListLongMap!10445)

(declare-fun +!2553 (ListLongMap!10445 tuple2!11674) ListLongMap!10445)

(assert (=> b!882818 (= lt!399304 (+!2553 lt!399306 (tuple2!11675 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28553)

(declare-fun zeroValue!654 () V!28553)

(declare-fun lt!399303 () array!51425)

(declare-fun getCurrentListMapNoExtraKeys!3278 (array!51423 array!51425 (_ BitVec 32) (_ BitVec 32) V!28553 V!28553 (_ BitVec 32) Int) ListLongMap!10445)

(assert (=> b!882818 (= lt!399309 (getCurrentListMapNoExtraKeys!3278 _keys!868 lt!399303 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882818 (= lt!399306 (getCurrentListMapNoExtraKeys!3278 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399308 () Unit!30074)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!718 (array!51423 array!51425 (_ BitVec 32) (_ BitVec 32) V!28553 V!28553 (_ BitVec 32) (_ BitVec 64) V!28553 (_ BitVec 32) Int) Unit!30074)

(assert (=> b!882818 (= lt!399308 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!718 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882819 () Bool)

(declare-fun res!599480 () Bool)

(assert (=> b!882819 (=> (not res!599480) (not e!491390))))

(assert (=> b!882819 (= res!599480 (and (= (select (arr!24728 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!28074 () Bool)

(declare-fun tp!53852 () Bool)

(assert (=> mapNonEmpty!28074 (= mapRes!28074 (and tp!53852 e!491387))))

(declare-fun mapValue!28074 () ValueCell!8375)

(declare-fun mapKey!28074 () (_ BitVec 32))

(declare-fun mapRest!28074 () (Array (_ BitVec 32) ValueCell!8375))

(assert (=> mapNonEmpty!28074 (= (arr!24729 _values!688) (store mapRest!28074 mapKey!28074 mapValue!28074))))

(declare-fun b!882820 () Bool)

(assert (=> b!882820 (= e!491388 (and e!491389 mapRes!28074))))

(declare-fun condMapEmpty!28074 () Bool)

(declare-fun mapDefault!28074 () ValueCell!8375)

(assert (=> b!882820 (= condMapEmpty!28074 (= (arr!24729 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8375)) mapDefault!28074)))))

(declare-fun b!882821 () Bool)

(assert (=> b!882821 (= e!491391 e!491385)))

(declare-fun res!599479 () Bool)

(assert (=> b!882821 (=> res!599479 e!491385)))

(assert (=> b!882821 (= res!599479 (not (= (select (arr!24728 _keys!868) from!1053) k0!854)))))

(declare-fun lt!399307 () ListLongMap!10445)

(declare-fun get!13036 (ValueCell!8375 V!28553) V!28553)

(declare-fun dynLambda!1273 (Int (_ BitVec 64)) V!28553)

(assert (=> b!882821 (= lt!399307 (+!2553 lt!399304 (tuple2!11675 (select (arr!24728 _keys!868) from!1053) (get!13036 (select (arr!24729 _values!688) from!1053) (dynLambda!1273 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882822 () Bool)

(declare-fun res!599487 () Bool)

(assert (=> b!882822 (=> (not res!599487) (not e!491390))))

(assert (=> b!882822 (= res!599487 (and (= (size!25170 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25169 _keys!868) (size!25170 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882823 () Bool)

(declare-fun res!599488 () Bool)

(assert (=> b!882823 (=> (not res!599488) (not e!491390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882823 (= res!599488 (validMask!0 mask!1196))))

(declare-fun b!882824 () Bool)

(assert (=> b!882824 (= e!491390 e!491386)))

(declare-fun res!599486 () Bool)

(assert (=> b!882824 (=> (not res!599486) (not e!491386))))

(assert (=> b!882824 (= res!599486 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!882824 (= lt!399307 (getCurrentListMapNoExtraKeys!3278 _keys!868 lt!399303 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!882824 (= lt!399303 (array!51426 (store (arr!24729 _values!688) i!612 (ValueCellFull!8375 v!557)) (size!25170 _values!688)))))

(declare-fun lt!399302 () ListLongMap!10445)

(assert (=> b!882824 (= lt!399302 (getCurrentListMapNoExtraKeys!3278 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74976 res!599483) b!882823))

(assert (= (and b!882823 res!599488) b!882822))

(assert (= (and b!882822 res!599487) b!882812))

(assert (= (and b!882812 res!599484) b!882817))

(assert (= (and b!882817 res!599481) b!882816))

(assert (= (and b!882816 res!599482) b!882813))

(assert (= (and b!882813 res!599489) b!882819))

(assert (= (and b!882819 res!599480) b!882824))

(assert (= (and b!882824 res!599486) b!882818))

(assert (= (and b!882818 (not res!599485)) b!882821))

(assert (= (and b!882821 (not res!599479)) b!882815))

(assert (= (and b!882820 condMapEmpty!28074) mapIsEmpty!28074))

(assert (= (and b!882820 (not condMapEmpty!28074)) mapNonEmpty!28074))

(get-info :version)

(assert (= (and mapNonEmpty!28074 ((_ is ValueCellFull!8375) mapValue!28074)) b!882814))

(assert (= (and b!882820 ((_ is ValueCellFull!8375) mapDefault!28074)) b!882811))

(assert (= start!74976 b!882820))

(declare-fun b_lambda!12609 () Bool)

(assert (=> (not b_lambda!12609) (not b!882821)))

(declare-fun t!24681 () Bool)

(declare-fun tb!5035 () Bool)

(assert (=> (and start!74976 (= defaultEntry!696 defaultEntry!696) t!24681) tb!5035))

(declare-fun result!9709 () Bool)

(assert (=> tb!5035 (= result!9709 tp_is_empty!17629)))

(assert (=> b!882821 t!24681))

(declare-fun b_and!25449 () Bool)

(assert (= b_and!25447 (and (=> t!24681 result!9709) b_and!25449)))

(declare-fun m!823109 () Bool)

(assert (=> b!882815 m!823109))

(declare-fun m!823111 () Bool)

(assert (=> b!882815 m!823111))

(declare-fun m!823113 () Bool)

(assert (=> b!882815 m!823113))

(declare-fun m!823115 () Bool)

(assert (=> b!882815 m!823115))

(declare-fun m!823117 () Bool)

(assert (=> b!882821 m!823117))

(declare-fun m!823119 () Bool)

(assert (=> b!882821 m!823119))

(declare-fun m!823121 () Bool)

(assert (=> b!882821 m!823121))

(declare-fun m!823123 () Bool)

(assert (=> b!882821 m!823123))

(assert (=> b!882821 m!823119))

(declare-fun m!823125 () Bool)

(assert (=> b!882821 m!823125))

(assert (=> b!882821 m!823121))

(declare-fun m!823127 () Bool)

(assert (=> b!882819 m!823127))

(declare-fun m!823129 () Bool)

(assert (=> mapNonEmpty!28074 m!823129))

(declare-fun m!823131 () Bool)

(assert (=> b!882824 m!823131))

(declare-fun m!823133 () Bool)

(assert (=> b!882824 m!823133))

(declare-fun m!823135 () Bool)

(assert (=> b!882824 m!823135))

(declare-fun m!823137 () Bool)

(assert (=> start!74976 m!823137))

(declare-fun m!823139 () Bool)

(assert (=> start!74976 m!823139))

(declare-fun m!823141 () Bool)

(assert (=> b!882817 m!823141))

(declare-fun m!823143 () Bool)

(assert (=> b!882818 m!823143))

(declare-fun m!823145 () Bool)

(assert (=> b!882818 m!823145))

(assert (=> b!882818 m!823125))

(declare-fun m!823147 () Bool)

(assert (=> b!882818 m!823147))

(assert (=> b!882818 m!823125))

(declare-fun m!823149 () Bool)

(assert (=> b!882818 m!823149))

(declare-fun m!823151 () Bool)

(assert (=> b!882818 m!823151))

(declare-fun m!823153 () Bool)

(assert (=> b!882813 m!823153))

(declare-fun m!823155 () Bool)

(assert (=> b!882823 m!823155))

(declare-fun m!823157 () Bool)

(assert (=> b!882812 m!823157))

(check-sat (not b_next!15385) (not b!882821) (not b!882815) (not b!882824) (not b!882823) (not mapNonEmpty!28074) (not start!74976) b_and!25449 (not b!882818) (not b!882813) (not b_lambda!12609) (not b!882817) tp_is_empty!17629 (not b!882812))
(check-sat b_and!25449 (not b_next!15385))
