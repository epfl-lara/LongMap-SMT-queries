; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75058 () Bool)

(assert start!75058)

(declare-fun b_free!15409 () Bool)

(declare-fun b_next!15409 () Bool)

(assert (=> start!75058 (= b_free!15409 (not b_next!15409))))

(declare-fun tp!53930 () Bool)

(declare-fun b_and!25527 () Bool)

(assert (=> start!75058 (= tp!53930 b_and!25527)))

(declare-fun b!883683 () Bool)

(declare-fun e!491908 () Bool)

(declare-fun tp_is_empty!17653 () Bool)

(assert (=> b!883683 (= e!491908 tp_is_empty!17653)))

(declare-fun b!883684 () Bool)

(declare-fun e!491905 () Bool)

(assert (=> b!883684 (= e!491905 tp_is_empty!17653)))

(declare-fun b!883685 () Bool)

(declare-fun res!600055 () Bool)

(declare-fun e!491911 () Bool)

(assert (=> b!883685 (=> res!600055 e!491911)))

(declare-datatypes ((List!17521 0))(
  ( (Nil!17518) (Cons!17517 (h!18654 (_ BitVec 64)) (t!24724 List!17521)) )
))
(declare-fun noDuplicate!1323 (List!17521) Bool)

(assert (=> b!883685 (= res!600055 (not (noDuplicate!1323 Nil!17518)))))

(declare-fun b!883686 () Bool)

(declare-fun e!491913 () Bool)

(declare-fun e!491909 () Bool)

(assert (=> b!883686 (= e!491913 e!491909)))

(declare-fun res!600057 () Bool)

(assert (=> b!883686 (=> res!600057 e!491909)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51473 0))(
  ( (array!51474 (arr!24751 (Array (_ BitVec 32) (_ BitVec 64))) (size!25192 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51473)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883686 (= res!600057 (not (= (select (arr!24751 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28585 0))(
  ( (V!28586 (val!8874 Int)) )
))
(declare-datatypes ((tuple2!11690 0))(
  ( (tuple2!11691 (_1!5856 (_ BitVec 64)) (_2!5856 V!28585)) )
))
(declare-datatypes ((List!17522 0))(
  ( (Nil!17519) (Cons!17518 (h!18655 tuple2!11690) (t!24725 List!17522)) )
))
(declare-datatypes ((ListLongMap!10461 0))(
  ( (ListLongMap!10462 (toList!5246 List!17522)) )
))
(declare-fun lt!399790 () ListLongMap!10461)

(declare-fun lt!399786 () ListLongMap!10461)

(declare-datatypes ((ValueCell!8387 0))(
  ( (ValueCellFull!8387 (v!11343 V!28585)) (EmptyCell!8387) )
))
(declare-datatypes ((array!51475 0))(
  ( (array!51476 (arr!24752 (Array (_ BitVec 32) ValueCell!8387)) (size!25193 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51475)

(declare-fun +!2560 (ListLongMap!10461 tuple2!11690) ListLongMap!10461)

(declare-fun get!13054 (ValueCell!8387 V!28585) V!28585)

(declare-fun dynLambda!1279 (Int (_ BitVec 64)) V!28585)

(assert (=> b!883686 (= lt!399790 (+!2560 lt!399786 (tuple2!11691 (select (arr!24751 _keys!868) from!1053) (get!13054 (select (arr!24752 _values!688) from!1053) (dynLambda!1279 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883687 () Bool)

(declare-fun res!600059 () Bool)

(declare-fun e!491910 () Bool)

(assert (=> b!883687 (=> (not res!600059) (not e!491910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883687 (= res!600059 (validKeyInArray!0 k0!854))))

(declare-fun b!883688 () Bool)

(declare-fun res!600063 () Bool)

(assert (=> b!883688 (=> (not res!600063) (not e!491910))))

(declare-fun arrayNoDuplicates!0 (array!51473 (_ BitVec 32) List!17521) Bool)

(assert (=> b!883688 (= res!600063 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17518))))

(declare-fun b!883689 () Bool)

(assert (=> b!883689 (= e!491909 e!491911)))

(declare-fun res!600062 () Bool)

(assert (=> b!883689 (=> res!600062 e!491911)))

(assert (=> b!883689 (= res!600062 (or (bvsge (size!25192 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25192 _keys!868)) (bvsge from!1053 (size!25192 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883689 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30090 0))(
  ( (Unit!30091) )
))
(declare-fun lt!399787 () Unit!30090)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30090)

(assert (=> b!883689 (= lt!399787 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883689 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17518)))

(declare-fun lt!399791 () Unit!30090)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51473 (_ BitVec 32) (_ BitVec 32)) Unit!30090)

(assert (=> b!883689 (= lt!399791 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!883690 () Bool)

(declare-fun res!600058 () Bool)

(assert (=> b!883690 (=> (not res!600058) (not e!491910))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!883690 (= res!600058 (and (= (size!25193 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25192 _keys!868) (size!25193 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883692 () Bool)

(declare-fun res!600067 () Bool)

(assert (=> b!883692 (=> (not res!600067) (not e!491910))))

(assert (=> b!883692 (= res!600067 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25192 _keys!868))))))

(declare-fun b!883693 () Bool)

(declare-fun res!600066 () Bool)

(assert (=> b!883693 (=> (not res!600066) (not e!491910))))

(assert (=> b!883693 (= res!600066 (and (= (select (arr!24751 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!28116 () Bool)

(declare-fun mapRes!28116 () Bool)

(assert (=> mapIsEmpty!28116 mapRes!28116))

(declare-fun b!883694 () Bool)

(declare-fun e!491912 () Bool)

(assert (=> b!883694 (= e!491912 (and e!491905 mapRes!28116))))

(declare-fun condMapEmpty!28116 () Bool)

(declare-fun mapDefault!28116 () ValueCell!8387)

(assert (=> b!883694 (= condMapEmpty!28116 (= (arr!24752 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8387)) mapDefault!28116)))))

(declare-fun b!883695 () Bool)

(declare-fun e!491907 () Bool)

(assert (=> b!883695 (= e!491907 (not e!491913))))

(declare-fun res!600061 () Bool)

(assert (=> b!883695 (=> res!600061 e!491913)))

(assert (=> b!883695 (= res!600061 (not (validKeyInArray!0 (select (arr!24751 _keys!868) from!1053))))))

(declare-fun lt!399784 () ListLongMap!10461)

(assert (=> b!883695 (= lt!399784 lt!399786)))

(declare-fun v!557 () V!28585)

(declare-fun lt!399789 () ListLongMap!10461)

(assert (=> b!883695 (= lt!399786 (+!2560 lt!399789 (tuple2!11691 k0!854 v!557)))))

(declare-fun lt!399788 () array!51475)

(declare-fun minValue!654 () V!28585)

(declare-fun zeroValue!654 () V!28585)

(declare-fun getCurrentListMapNoExtraKeys!3286 (array!51473 array!51475 (_ BitVec 32) (_ BitVec 32) V!28585 V!28585 (_ BitVec 32) Int) ListLongMap!10461)

(assert (=> b!883695 (= lt!399784 (getCurrentListMapNoExtraKeys!3286 _keys!868 lt!399788 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883695 (= lt!399789 (getCurrentListMapNoExtraKeys!3286 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399785 () Unit!30090)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!725 (array!51473 array!51475 (_ BitVec 32) (_ BitVec 32) V!28585 V!28585 (_ BitVec 32) (_ BitVec 64) V!28585 (_ BitVec 32) Int) Unit!30090)

(assert (=> b!883695 (= lt!399785 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!725 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883696 () Bool)

(declare-fun res!600056 () Bool)

(assert (=> b!883696 (=> (not res!600056) (not e!491910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51473 (_ BitVec 32)) Bool)

(assert (=> b!883696 (= res!600056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883697 () Bool)

(declare-fun res!600060 () Bool)

(assert (=> b!883697 (=> (not res!600060) (not e!491910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883697 (= res!600060 (validMask!0 mask!1196))))

(declare-fun b!883698 () Bool)

(assert (=> b!883698 (= e!491911 true)))

(declare-fun lt!399792 () Bool)

(declare-fun contains!4252 (List!17521 (_ BitVec 64)) Bool)

(assert (=> b!883698 (= lt!399792 (contains!4252 Nil!17518 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!883699 () Bool)

(assert (=> b!883699 (= e!491910 e!491907)))

(declare-fun res!600065 () Bool)

(assert (=> b!883699 (=> (not res!600065) (not e!491907))))

(assert (=> b!883699 (= res!600065 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!883699 (= lt!399790 (getCurrentListMapNoExtraKeys!3286 _keys!868 lt!399788 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883699 (= lt!399788 (array!51476 (store (arr!24752 _values!688) i!612 (ValueCellFull!8387 v!557)) (size!25193 _values!688)))))

(declare-fun lt!399783 () ListLongMap!10461)

(assert (=> b!883699 (= lt!399783 (getCurrentListMapNoExtraKeys!3286 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!28116 () Bool)

(declare-fun tp!53931 () Bool)

(assert (=> mapNonEmpty!28116 (= mapRes!28116 (and tp!53931 e!491908))))

(declare-fun mapRest!28116 () (Array (_ BitVec 32) ValueCell!8387))

(declare-fun mapValue!28116 () ValueCell!8387)

(declare-fun mapKey!28116 () (_ BitVec 32))

(assert (=> mapNonEmpty!28116 (= (arr!24752 _values!688) (store mapRest!28116 mapKey!28116 mapValue!28116))))

(declare-fun b!883691 () Bool)

(declare-fun res!600064 () Bool)

(assert (=> b!883691 (=> res!600064 e!491911)))

(assert (=> b!883691 (= res!600064 (contains!4252 Nil!17518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!600068 () Bool)

(assert (=> start!75058 (=> (not res!600068) (not e!491910))))

(assert (=> start!75058 (= res!600068 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25192 _keys!868))))))

(assert (=> start!75058 e!491910))

(assert (=> start!75058 tp_is_empty!17653))

(assert (=> start!75058 true))

(assert (=> start!75058 tp!53930))

(declare-fun array_inv!19534 (array!51473) Bool)

(assert (=> start!75058 (array_inv!19534 _keys!868)))

(declare-fun array_inv!19535 (array!51475) Bool)

(assert (=> start!75058 (and (array_inv!19535 _values!688) e!491912)))

(assert (= (and start!75058 res!600068) b!883697))

(assert (= (and b!883697 res!600060) b!883690))

(assert (= (and b!883690 res!600058) b!883696))

(assert (= (and b!883696 res!600056) b!883688))

(assert (= (and b!883688 res!600063) b!883692))

(assert (= (and b!883692 res!600067) b!883687))

(assert (= (and b!883687 res!600059) b!883693))

(assert (= (and b!883693 res!600066) b!883699))

(assert (= (and b!883699 res!600065) b!883695))

(assert (= (and b!883695 (not res!600061)) b!883686))

(assert (= (and b!883686 (not res!600057)) b!883689))

(assert (= (and b!883689 (not res!600062)) b!883685))

(assert (= (and b!883685 (not res!600055)) b!883691))

(assert (= (and b!883691 (not res!600064)) b!883698))

(assert (= (and b!883694 condMapEmpty!28116) mapIsEmpty!28116))

(assert (= (and b!883694 (not condMapEmpty!28116)) mapNonEmpty!28116))

(get-info :version)

(assert (= (and mapNonEmpty!28116 ((_ is ValueCellFull!8387) mapValue!28116)) b!883683))

(assert (= (and b!883694 ((_ is ValueCellFull!8387) mapDefault!28116)) b!883684))

(assert (= start!75058 b!883694))

(declare-fun b_lambda!12701 () Bool)

(assert (=> (not b_lambda!12701) (not b!883686)))

(declare-fun t!24723 () Bool)

(declare-fun tb!5059 () Bool)

(assert (=> (and start!75058 (= defaultEntry!696 defaultEntry!696) t!24723) tb!5059))

(declare-fun result!9761 () Bool)

(assert (=> tb!5059 (= result!9761 tp_is_empty!17653)))

(assert (=> b!883686 t!24723))

(declare-fun b_and!25529 () Bool)

(assert (= b_and!25527 (and (=> t!24723 result!9761) b_and!25529)))

(declare-fun m!824067 () Bool)

(assert (=> b!883693 m!824067))

(declare-fun m!824069 () Bool)

(assert (=> start!75058 m!824069))

(declare-fun m!824071 () Bool)

(assert (=> start!75058 m!824071))

(declare-fun m!824073 () Bool)

(assert (=> b!883685 m!824073))

(declare-fun m!824075 () Bool)

(assert (=> b!883687 m!824075))

(declare-fun m!824077 () Bool)

(assert (=> mapNonEmpty!28116 m!824077))

(declare-fun m!824079 () Bool)

(assert (=> b!883688 m!824079))

(declare-fun m!824081 () Bool)

(assert (=> b!883697 m!824081))

(declare-fun m!824083 () Bool)

(assert (=> b!883698 m!824083))

(declare-fun m!824085 () Bool)

(assert (=> b!883695 m!824085))

(declare-fun m!824087 () Bool)

(assert (=> b!883695 m!824087))

(declare-fun m!824089 () Bool)

(assert (=> b!883695 m!824089))

(declare-fun m!824091 () Bool)

(assert (=> b!883695 m!824091))

(declare-fun m!824093 () Bool)

(assert (=> b!883695 m!824093))

(assert (=> b!883695 m!824091))

(declare-fun m!824095 () Bool)

(assert (=> b!883695 m!824095))

(declare-fun m!824097 () Bool)

(assert (=> b!883699 m!824097))

(declare-fun m!824099 () Bool)

(assert (=> b!883699 m!824099))

(declare-fun m!824101 () Bool)

(assert (=> b!883699 m!824101))

(declare-fun m!824103 () Bool)

(assert (=> b!883696 m!824103))

(declare-fun m!824105 () Bool)

(assert (=> b!883686 m!824105))

(assert (=> b!883686 m!824091))

(declare-fun m!824107 () Bool)

(assert (=> b!883686 m!824107))

(declare-fun m!824109 () Bool)

(assert (=> b!883686 m!824109))

(assert (=> b!883686 m!824105))

(assert (=> b!883686 m!824107))

(declare-fun m!824111 () Bool)

(assert (=> b!883686 m!824111))

(declare-fun m!824113 () Bool)

(assert (=> b!883689 m!824113))

(declare-fun m!824115 () Bool)

(assert (=> b!883689 m!824115))

(declare-fun m!824117 () Bool)

(assert (=> b!883689 m!824117))

(declare-fun m!824119 () Bool)

(assert (=> b!883689 m!824119))

(declare-fun m!824121 () Bool)

(assert (=> b!883691 m!824121))

(check-sat (not b!883686) (not b!883695) tp_is_empty!17653 (not mapNonEmpty!28116) (not b!883696) (not start!75058) (not b!883691) (not b!883685) (not b!883698) (not b!883688) (not b_lambda!12701) (not b!883699) (not b!883687) b_and!25529 (not b_next!15409) (not b!883689) (not b!883697))
(check-sat b_and!25529 (not b_next!15409))
