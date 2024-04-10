; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74378 () Bool)

(assert start!74378)

(declare-fun b_free!15141 () Bool)

(declare-fun b_next!15141 () Bool)

(assert (=> start!74378 (= b_free!15141 (not b_next!15141))))

(declare-fun tp!53097 () Bool)

(declare-fun b_and!24919 () Bool)

(assert (=> start!74378 (= tp!53097 b_and!24919)))

(declare-datatypes ((V!28227 0))(
  ( (V!28228 (val!8740 Int)) )
))
(declare-datatypes ((tuple2!11548 0))(
  ( (tuple2!11549 (_1!5785 (_ BitVec 64)) (_2!5785 V!28227)) )
))
(declare-datatypes ((List!17369 0))(
  ( (Nil!17366) (Cons!17365 (h!18496 tuple2!11548) (t!24414 List!17369)) )
))
(declare-datatypes ((ListLongMap!10317 0))(
  ( (ListLongMap!10318 (toList!5174 List!17369)) )
))
(declare-fun lt!396257 () ListLongMap!10317)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun b!875694 () Bool)

(declare-datatypes ((ValueCell!8253 0))(
  ( (ValueCellFull!8253 (v!11169 V!28227)) (EmptyCell!8253) )
))
(declare-datatypes ((array!50894 0))(
  ( (array!50895 (arr!24475 (Array (_ BitVec 32) ValueCell!8253)) (size!24915 (_ BitVec 32))) )
))
(declare-fun lt!396256 () array!50894)

(declare-fun e!487495 () Bool)

(declare-datatypes ((array!50896 0))(
  ( (array!50897 (arr!24476 (Array (_ BitVec 32) (_ BitVec 64))) (size!24916 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50896)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28227)

(declare-fun zeroValue!654 () V!28227)

(declare-fun +!2477 (ListLongMap!10317 tuple2!11548) ListLongMap!10317)

(declare-fun getCurrentListMapNoExtraKeys!3141 (array!50896 array!50894 (_ BitVec 32) (_ BitVec 32) V!28227 V!28227 (_ BitVec 32) Int) ListLongMap!10317)

(declare-fun get!12865 (ValueCell!8253 V!28227) V!28227)

(declare-fun dynLambda!1205 (Int (_ BitVec 64)) V!28227)

(assert (=> b!875694 (= e!487495 (= lt!396257 (+!2477 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!875695 () Bool)

(declare-fun res!595114 () Bool)

(declare-fun e!487494 () Bool)

(assert (=> b!875695 (=> (not res!595114) (not e!487494))))

(declare-datatypes ((List!17370 0))(
  ( (Nil!17367) (Cons!17366 (h!18497 (_ BitVec 64)) (t!24415 List!17370)) )
))
(declare-fun arrayNoDuplicates!0 (array!50896 (_ BitVec 32) List!17370) Bool)

(assert (=> b!875695 (= res!595114 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17367))))

(declare-fun mapIsEmpty!27686 () Bool)

(declare-fun mapRes!27686 () Bool)

(assert (=> mapIsEmpty!27686 mapRes!27686))

(declare-fun res!595112 () Bool)

(assert (=> start!74378 (=> (not res!595112) (not e!487494))))

(assert (=> start!74378 (= res!595112 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24916 _keys!868))))))

(assert (=> start!74378 e!487494))

(declare-fun tp_is_empty!17385 () Bool)

(assert (=> start!74378 tp_is_empty!17385))

(assert (=> start!74378 true))

(assert (=> start!74378 tp!53097))

(declare-fun array_inv!19296 (array!50896) Bool)

(assert (=> start!74378 (array_inv!19296 _keys!868)))

(declare-fun _values!688 () array!50894)

(declare-fun e!487492 () Bool)

(declare-fun array_inv!19297 (array!50894) Bool)

(assert (=> start!74378 (and (array_inv!19297 _values!688) e!487492)))

(declare-fun b!875696 () Bool)

(declare-fun res!595110 () Bool)

(assert (=> b!875696 (=> (not res!595110) (not e!487494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50896 (_ BitVec 32)) Bool)

(assert (=> b!875696 (= res!595110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875697 () Bool)

(declare-fun res!595115 () Bool)

(assert (=> b!875697 (=> (not res!595115) (not e!487494))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!875697 (= res!595115 (and (= (select (arr!24476 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875698 () Bool)

(declare-fun res!595118 () Bool)

(assert (=> b!875698 (=> (not res!595118) (not e!487494))))

(assert (=> b!875698 (= res!595118 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24916 _keys!868))))))

(declare-fun b!875699 () Bool)

(declare-fun e!487498 () Bool)

(assert (=> b!875699 (= e!487498 (not e!487495))))

(declare-fun res!595111 () Bool)

(assert (=> b!875699 (=> res!595111 e!487495)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875699 (= res!595111 (not (validKeyInArray!0 (select (arr!24476 _keys!868) from!1053))))))

(declare-fun e!487493 () Bool)

(assert (=> b!875699 e!487493))

(declare-fun c!92525 () Bool)

(assert (=> b!875699 (= c!92525 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28227)

(declare-datatypes ((Unit!29950 0))(
  ( (Unit!29951) )
))
(declare-fun lt!396254 () Unit!29950)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!668 (array!50896 array!50894 (_ BitVec 32) (_ BitVec 32) V!28227 V!28227 (_ BitVec 32) (_ BitVec 64) V!28227 (_ BitVec 32) Int) Unit!29950)

(assert (=> b!875699 (= lt!396254 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!668 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27686 () Bool)

(declare-fun tp!53098 () Bool)

(declare-fun e!487496 () Bool)

(assert (=> mapNonEmpty!27686 (= mapRes!27686 (and tp!53098 e!487496))))

(declare-fun mapValue!27686 () ValueCell!8253)

(declare-fun mapRest!27686 () (Array (_ BitVec 32) ValueCell!8253))

(declare-fun mapKey!27686 () (_ BitVec 32))

(assert (=> mapNonEmpty!27686 (= (arr!24475 _values!688) (store mapRest!27686 mapKey!27686 mapValue!27686))))

(declare-fun b!875700 () Bool)

(declare-fun e!487497 () Bool)

(assert (=> b!875700 (= e!487497 tp_is_empty!17385)))

(declare-fun b!875701 () Bool)

(assert (=> b!875701 (= e!487494 e!487498)))

(declare-fun res!595117 () Bool)

(assert (=> b!875701 (=> (not res!595117) (not e!487498))))

(assert (=> b!875701 (= res!595117 (= from!1053 i!612))))

(assert (=> b!875701 (= lt!396257 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875701 (= lt!396256 (array!50895 (store (arr!24475 _values!688) i!612 (ValueCellFull!8253 v!557)) (size!24915 _values!688)))))

(declare-fun lt!396255 () ListLongMap!10317)

(assert (=> b!875701 (= lt!396255 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38645 () Bool)

(declare-fun call!38649 () ListLongMap!10317)

(assert (=> bm!38645 (= call!38649 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875702 () Bool)

(assert (=> b!875702 (= e!487496 tp_is_empty!17385)))

(declare-fun b!875703 () Bool)

(declare-fun call!38648 () ListLongMap!10317)

(assert (=> b!875703 (= e!487493 (= call!38648 call!38649))))

(declare-fun b!875704 () Bool)

(assert (=> b!875704 (= e!487492 (and e!487497 mapRes!27686))))

(declare-fun condMapEmpty!27686 () Bool)

(declare-fun mapDefault!27686 () ValueCell!8253)

(assert (=> b!875704 (= condMapEmpty!27686 (= (arr!24475 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8253)) mapDefault!27686)))))

(declare-fun b!875705 () Bool)

(declare-fun res!595119 () Bool)

(assert (=> b!875705 (=> (not res!595119) (not e!487494))))

(assert (=> b!875705 (= res!595119 (validKeyInArray!0 k0!854))))

(declare-fun bm!38646 () Bool)

(assert (=> bm!38646 (= call!38648 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875706 () Bool)

(declare-fun res!595113 () Bool)

(assert (=> b!875706 (=> (not res!595113) (not e!487494))))

(assert (=> b!875706 (= res!595113 (and (= (size!24915 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24916 _keys!868) (size!24915 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875707 () Bool)

(declare-fun res!595116 () Bool)

(assert (=> b!875707 (=> (not res!595116) (not e!487494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875707 (= res!595116 (validMask!0 mask!1196))))

(declare-fun b!875708 () Bool)

(assert (=> b!875708 (= e!487493 (= call!38648 (+!2477 call!38649 (tuple2!11549 k0!854 v!557))))))

(assert (= (and start!74378 res!595112) b!875707))

(assert (= (and b!875707 res!595116) b!875706))

(assert (= (and b!875706 res!595113) b!875696))

(assert (= (and b!875696 res!595110) b!875695))

(assert (= (and b!875695 res!595114) b!875698))

(assert (= (and b!875698 res!595118) b!875705))

(assert (= (and b!875705 res!595119) b!875697))

(assert (= (and b!875697 res!595115) b!875701))

(assert (= (and b!875701 res!595117) b!875699))

(assert (= (and b!875699 c!92525) b!875708))

(assert (= (and b!875699 (not c!92525)) b!875703))

(assert (= (or b!875708 b!875703) bm!38646))

(assert (= (or b!875708 b!875703) bm!38645))

(assert (= (and b!875699 (not res!595111)) b!875694))

(assert (= (and b!875704 condMapEmpty!27686) mapIsEmpty!27686))

(assert (= (and b!875704 (not condMapEmpty!27686)) mapNonEmpty!27686))

(get-info :version)

(assert (= (and mapNonEmpty!27686 ((_ is ValueCellFull!8253) mapValue!27686)) b!875702))

(assert (= (and b!875704 ((_ is ValueCellFull!8253) mapDefault!27686)) b!875700))

(assert (= start!74378 b!875704))

(declare-fun b_lambda!12175 () Bool)

(assert (=> (not b_lambda!12175) (not b!875694)))

(declare-fun t!24413 () Bool)

(declare-fun tb!4901 () Bool)

(assert (=> (and start!74378 (= defaultEntry!696 defaultEntry!696) t!24413) tb!4901))

(declare-fun result!9419 () Bool)

(assert (=> tb!4901 (= result!9419 tp_is_empty!17385)))

(assert (=> b!875694 t!24413))

(declare-fun b_and!24921 () Bool)

(assert (= b_and!24919 (and (=> t!24413 result!9419) b_and!24921)))

(declare-fun m!815503 () Bool)

(assert (=> b!875699 m!815503))

(assert (=> b!875699 m!815503))

(declare-fun m!815505 () Bool)

(assert (=> b!875699 m!815505))

(declare-fun m!815507 () Bool)

(assert (=> b!875699 m!815507))

(declare-fun m!815509 () Bool)

(assert (=> b!875697 m!815509))

(declare-fun m!815511 () Bool)

(assert (=> b!875701 m!815511))

(declare-fun m!815513 () Bool)

(assert (=> b!875701 m!815513))

(declare-fun m!815515 () Bool)

(assert (=> b!875701 m!815515))

(declare-fun m!815517 () Bool)

(assert (=> b!875694 m!815517))

(declare-fun m!815519 () Bool)

(assert (=> b!875694 m!815519))

(assert (=> b!875694 m!815519))

(declare-fun m!815521 () Bool)

(assert (=> b!875694 m!815521))

(declare-fun m!815523 () Bool)

(assert (=> b!875694 m!815523))

(assert (=> b!875694 m!815517))

(declare-fun m!815525 () Bool)

(assert (=> b!875694 m!815525))

(assert (=> b!875694 m!815503))

(assert (=> b!875694 m!815521))

(assert (=> bm!38646 m!815517))

(declare-fun m!815527 () Bool)

(assert (=> b!875696 m!815527))

(declare-fun m!815529 () Bool)

(assert (=> bm!38645 m!815529))

(declare-fun m!815531 () Bool)

(assert (=> b!875707 m!815531))

(declare-fun m!815533 () Bool)

(assert (=> b!875695 m!815533))

(declare-fun m!815535 () Bool)

(assert (=> mapNonEmpty!27686 m!815535))

(declare-fun m!815537 () Bool)

(assert (=> b!875705 m!815537))

(declare-fun m!815539 () Bool)

(assert (=> start!74378 m!815539))

(declare-fun m!815541 () Bool)

(assert (=> start!74378 m!815541))

(declare-fun m!815543 () Bool)

(assert (=> b!875708 m!815543))

(check-sat (not b_lambda!12175) (not b_next!15141) tp_is_empty!17385 (not bm!38645) (not mapNonEmpty!27686) (not b!875708) (not b!875696) (not b!875694) (not b!875707) (not b!875699) (not b!875705) (not b!875701) (not start!74378) (not b!875695) b_and!24921 (not bm!38646))
(check-sat b_and!24921 (not b_next!15141))
(get-model)

(declare-fun b_lambda!12179 () Bool)

(assert (= b_lambda!12175 (or (and start!74378 b_free!15141) b_lambda!12179)))

(check-sat (not b_next!15141) tp_is_empty!17385 (not bm!38645) (not mapNonEmpty!27686) (not b!875708) (not b!875696) (not b!875694) (not b!875699) (not b!875705) (not b!875701) (not start!74378) (not b!875695) b_and!24921 (not bm!38646) (not b!875707) (not b_lambda!12179))
(check-sat b_and!24921 (not b_next!15141))
(get-model)

(declare-fun call!38658 () ListLongMap!10317)

(declare-fun bm!38655 () Bool)

(assert (=> bm!38655 (= call!38658 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!875782 () Bool)

(declare-fun e!487540 () ListLongMap!10317)

(assert (=> b!875782 (= e!487540 (ListLongMap!10318 Nil!17366))))

(declare-fun d!108577 () Bool)

(declare-fun e!487538 () Bool)

(assert (=> d!108577 e!487538))

(declare-fun res!595159 () Bool)

(assert (=> d!108577 (=> (not res!595159) (not e!487538))))

(declare-fun lt!396284 () ListLongMap!10317)

(declare-fun contains!4245 (ListLongMap!10317 (_ BitVec 64)) Bool)

(assert (=> d!108577 (= res!595159 (not (contains!4245 lt!396284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108577 (= lt!396284 e!487540)))

(declare-fun c!92540 () Bool)

(assert (=> d!108577 (= c!92540 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(assert (=> d!108577 (validMask!0 mask!1196)))

(assert (=> d!108577 (= (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396284)))

(declare-fun b!875783 () Bool)

(declare-fun e!487542 () Bool)

(assert (=> b!875783 (= e!487538 e!487542)))

(declare-fun c!92539 () Bool)

(declare-fun e!487541 () Bool)

(assert (=> b!875783 (= c!92539 e!487541)))

(declare-fun res!595161 () Bool)

(assert (=> b!875783 (=> (not res!595161) (not e!487541))))

(assert (=> b!875783 (= res!595161 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(declare-fun b!875784 () Bool)

(assert (=> b!875784 (= e!487541 (validKeyInArray!0 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!875784 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!875785 () Bool)

(declare-fun e!487544 () Bool)

(assert (=> b!875785 (= e!487544 (= lt!396284 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!875786 () Bool)

(assert (=> b!875786 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(assert (=> b!875786 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24915 _values!688)))))

(declare-fun e!487543 () Bool)

(declare-fun apply!376 (ListLongMap!10317 (_ BitVec 64)) V!28227)

(assert (=> b!875786 (= e!487543 (= (apply!376 lt!396284 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12865 (select (arr!24475 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!875787 () Bool)

(declare-fun isEmpty!662 (ListLongMap!10317) Bool)

(assert (=> b!875787 (= e!487544 (isEmpty!662 lt!396284))))

(declare-fun b!875788 () Bool)

(assert (=> b!875788 (= e!487542 e!487544)))

(declare-fun c!92537 () Bool)

(assert (=> b!875788 (= c!92537 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(declare-fun b!875789 () Bool)

(declare-fun e!487539 () ListLongMap!10317)

(assert (=> b!875789 (= e!487540 e!487539)))

(declare-fun c!92538 () Bool)

(assert (=> b!875789 (= c!92538 (validKeyInArray!0 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!875790 () Bool)

(declare-fun res!595158 () Bool)

(assert (=> b!875790 (=> (not res!595158) (not e!487538))))

(assert (=> b!875790 (= res!595158 (not (contains!4245 lt!396284 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875791 () Bool)

(assert (=> b!875791 (= e!487542 e!487543)))

(assert (=> b!875791 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(declare-fun res!595160 () Bool)

(assert (=> b!875791 (= res!595160 (contains!4245 lt!396284 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!875791 (=> (not res!595160) (not e!487543))))

(declare-fun b!875792 () Bool)

(declare-fun lt!396285 () Unit!29950)

(declare-fun lt!396289 () Unit!29950)

(assert (=> b!875792 (= lt!396285 lt!396289)))

(declare-fun lt!396286 () ListLongMap!10317)

(declare-fun lt!396287 () (_ BitVec 64))

(declare-fun lt!396288 () V!28227)

(declare-fun lt!396290 () (_ BitVec 64))

(assert (=> b!875792 (not (contains!4245 (+!2477 lt!396286 (tuple2!11549 lt!396287 lt!396288)) lt!396290))))

(declare-fun addStillNotContains!201 (ListLongMap!10317 (_ BitVec 64) V!28227 (_ BitVec 64)) Unit!29950)

(assert (=> b!875792 (= lt!396289 (addStillNotContains!201 lt!396286 lt!396287 lt!396288 lt!396290))))

(assert (=> b!875792 (= lt!396290 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!875792 (= lt!396288 (get!12865 (select (arr!24475 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!875792 (= lt!396287 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!875792 (= lt!396286 call!38658)))

(assert (=> b!875792 (= e!487539 (+!2477 call!38658 (tuple2!11549 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12865 (select (arr!24475 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!875793 () Bool)

(assert (=> b!875793 (= e!487539 call!38658)))

(assert (= (and d!108577 c!92540) b!875782))

(assert (= (and d!108577 (not c!92540)) b!875789))

(assert (= (and b!875789 c!92538) b!875792))

(assert (= (and b!875789 (not c!92538)) b!875793))

(assert (= (or b!875792 b!875793) bm!38655))

(assert (= (and d!108577 res!595159) b!875790))

(assert (= (and b!875790 res!595158) b!875783))

(assert (= (and b!875783 res!595161) b!875784))

(assert (= (and b!875783 c!92539) b!875791))

(assert (= (and b!875783 (not c!92539)) b!875788))

(assert (= (and b!875791 res!595160) b!875786))

(assert (= (and b!875788 c!92537) b!875785))

(assert (= (and b!875788 (not c!92537)) b!875787))

(declare-fun b_lambda!12181 () Bool)

(assert (=> (not b_lambda!12181) (not b!875786)))

(assert (=> b!875786 t!24413))

(declare-fun b_and!24927 () Bool)

(assert (= b_and!24921 (and (=> t!24413 result!9419) b_and!24927)))

(declare-fun b_lambda!12183 () Bool)

(assert (=> (not b_lambda!12183) (not b!875792)))

(assert (=> b!875792 t!24413))

(declare-fun b_and!24929 () Bool)

(assert (= b_and!24927 (and (=> t!24413 result!9419) b_and!24929)))

(declare-fun m!815587 () Bool)

(assert (=> b!875787 m!815587))

(declare-fun m!815589 () Bool)

(assert (=> b!875792 m!815589))

(declare-fun m!815591 () Bool)

(assert (=> b!875792 m!815591))

(declare-fun m!815593 () Bool)

(assert (=> b!875792 m!815593))

(assert (=> b!875792 m!815591))

(assert (=> b!875792 m!815521))

(declare-fun m!815595 () Bool)

(assert (=> b!875792 m!815595))

(assert (=> b!875792 m!815521))

(assert (=> b!875792 m!815589))

(declare-fun m!815597 () Bool)

(assert (=> b!875792 m!815597))

(declare-fun m!815599 () Bool)

(assert (=> b!875792 m!815599))

(declare-fun m!815601 () Bool)

(assert (=> b!875792 m!815601))

(assert (=> b!875789 m!815599))

(assert (=> b!875789 m!815599))

(declare-fun m!815603 () Bool)

(assert (=> b!875789 m!815603))

(declare-fun m!815605 () Bool)

(assert (=> b!875785 m!815605))

(declare-fun m!815607 () Bool)

(assert (=> d!108577 m!815607))

(assert (=> d!108577 m!815531))

(declare-fun m!815609 () Bool)

(assert (=> b!875790 m!815609))

(assert (=> b!875784 m!815599))

(assert (=> b!875784 m!815599))

(assert (=> b!875784 m!815603))

(assert (=> bm!38655 m!815605))

(assert (=> b!875786 m!815599))

(declare-fun m!815611 () Bool)

(assert (=> b!875786 m!815611))

(assert (=> b!875786 m!815599))

(assert (=> b!875786 m!815591))

(assert (=> b!875786 m!815591))

(assert (=> b!875786 m!815521))

(assert (=> b!875786 m!815595))

(assert (=> b!875786 m!815521))

(assert (=> b!875791 m!815599))

(assert (=> b!875791 m!815599))

(declare-fun m!815613 () Bool)

(assert (=> b!875791 m!815613))

(assert (=> bm!38645 d!108577))

(declare-fun d!108579 () Bool)

(declare-fun e!487547 () Bool)

(assert (=> d!108579 e!487547))

(declare-fun res!595166 () Bool)

(assert (=> d!108579 (=> (not res!595166) (not e!487547))))

(declare-fun lt!396302 () ListLongMap!10317)

(assert (=> d!108579 (= res!595166 (contains!4245 lt!396302 (_1!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396299 () List!17369)

(assert (=> d!108579 (= lt!396302 (ListLongMap!10318 lt!396299))))

(declare-fun lt!396301 () Unit!29950)

(declare-fun lt!396300 () Unit!29950)

(assert (=> d!108579 (= lt!396301 lt!396300)))

(declare-datatypes ((Option!424 0))(
  ( (Some!423 (v!11174 V!28227)) (None!422) )
))
(declare-fun getValueByKey!418 (List!17369 (_ BitVec 64)) Option!424)

(assert (=> d!108579 (= (getValueByKey!418 lt!396299 (_1!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!423 (_2!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!232 (List!17369 (_ BitVec 64) V!28227) Unit!29950)

(assert (=> d!108579 (= lt!396300 (lemmaContainsTupThenGetReturnValue!232 lt!396299 (_1!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!271 (List!17369 (_ BitVec 64) V!28227) List!17369)

(assert (=> d!108579 (= lt!396299 (insertStrictlySorted!271 (toList!5174 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696)) (_1!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108579 (= (+!2477 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396302)))

(declare-fun b!875798 () Bool)

(declare-fun res!595167 () Bool)

(assert (=> b!875798 (=> (not res!595167) (not e!487547))))

(assert (=> b!875798 (= res!595167 (= (getValueByKey!418 (toList!5174 lt!396302) (_1!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!423 (_2!5785 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!875799 () Bool)

(declare-fun contains!4246 (List!17369 tuple2!11548) Bool)

(assert (=> b!875799 (= e!487547 (contains!4246 (toList!5174 lt!396302) (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108579 res!595166) b!875798))

(assert (= (and b!875798 res!595167) b!875799))

(declare-fun m!815615 () Bool)

(assert (=> d!108579 m!815615))

(declare-fun m!815617 () Bool)

(assert (=> d!108579 m!815617))

(declare-fun m!815619 () Bool)

(assert (=> d!108579 m!815619))

(declare-fun m!815621 () Bool)

(assert (=> d!108579 m!815621))

(declare-fun m!815623 () Bool)

(assert (=> b!875798 m!815623))

(declare-fun m!815625 () Bool)

(assert (=> b!875799 m!815625))

(assert (=> b!875694 d!108579))

(declare-fun call!38659 () ListLongMap!10317)

(declare-fun bm!38656 () Bool)

(assert (=> bm!38656 (= call!38659 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!875800 () Bool)

(declare-fun e!487550 () ListLongMap!10317)

(assert (=> b!875800 (= e!487550 (ListLongMap!10318 Nil!17366))))

(declare-fun d!108581 () Bool)

(declare-fun e!487548 () Bool)

(assert (=> d!108581 e!487548))

(declare-fun res!595169 () Bool)

(assert (=> d!108581 (=> (not res!595169) (not e!487548))))

(declare-fun lt!396303 () ListLongMap!10317)

(assert (=> d!108581 (= res!595169 (not (contains!4245 lt!396303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108581 (= lt!396303 e!487550)))

(declare-fun c!92544 () Bool)

(assert (=> d!108581 (= c!92544 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(assert (=> d!108581 (validMask!0 mask!1196)))

(assert (=> d!108581 (= (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396303)))

(declare-fun b!875801 () Bool)

(declare-fun e!487552 () Bool)

(assert (=> b!875801 (= e!487548 e!487552)))

(declare-fun c!92543 () Bool)

(declare-fun e!487551 () Bool)

(assert (=> b!875801 (= c!92543 e!487551)))

(declare-fun res!595171 () Bool)

(assert (=> b!875801 (=> (not res!595171) (not e!487551))))

(assert (=> b!875801 (= res!595171 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(declare-fun b!875802 () Bool)

(assert (=> b!875802 (= e!487551 (validKeyInArray!0 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!875802 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!875803 () Bool)

(declare-fun e!487554 () Bool)

(assert (=> b!875803 (= e!487554 (= lt!396303 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!875804 () Bool)

(assert (=> b!875804 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(assert (=> b!875804 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24915 lt!396256)))))

(declare-fun e!487553 () Bool)

(assert (=> b!875804 (= e!487553 (= (apply!376 lt!396303 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12865 (select (arr!24475 lt!396256) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!875805 () Bool)

(assert (=> b!875805 (= e!487554 (isEmpty!662 lt!396303))))

(declare-fun b!875806 () Bool)

(assert (=> b!875806 (= e!487552 e!487554)))

(declare-fun c!92541 () Bool)

(assert (=> b!875806 (= c!92541 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(declare-fun b!875807 () Bool)

(declare-fun e!487549 () ListLongMap!10317)

(assert (=> b!875807 (= e!487550 e!487549)))

(declare-fun c!92542 () Bool)

(assert (=> b!875807 (= c!92542 (validKeyInArray!0 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!875808 () Bool)

(declare-fun res!595168 () Bool)

(assert (=> b!875808 (=> (not res!595168) (not e!487548))))

(assert (=> b!875808 (= res!595168 (not (contains!4245 lt!396303 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875809 () Bool)

(assert (=> b!875809 (= e!487552 e!487553)))

(assert (=> b!875809 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(declare-fun res!595170 () Bool)

(assert (=> b!875809 (= res!595170 (contains!4245 lt!396303 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!875809 (=> (not res!595170) (not e!487553))))

(declare-fun b!875810 () Bool)

(declare-fun lt!396304 () Unit!29950)

(declare-fun lt!396308 () Unit!29950)

(assert (=> b!875810 (= lt!396304 lt!396308)))

(declare-fun lt!396306 () (_ BitVec 64))

(declare-fun lt!396305 () ListLongMap!10317)

(declare-fun lt!396307 () V!28227)

(declare-fun lt!396309 () (_ BitVec 64))

(assert (=> b!875810 (not (contains!4245 (+!2477 lt!396305 (tuple2!11549 lt!396306 lt!396307)) lt!396309))))

(assert (=> b!875810 (= lt!396308 (addStillNotContains!201 lt!396305 lt!396306 lt!396307 lt!396309))))

(assert (=> b!875810 (= lt!396309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!875810 (= lt!396307 (get!12865 (select (arr!24475 lt!396256) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!875810 (= lt!396306 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!875810 (= lt!396305 call!38659)))

(assert (=> b!875810 (= e!487549 (+!2477 call!38659 (tuple2!11549 (select (arr!24476 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12865 (select (arr!24475 lt!396256) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!875811 () Bool)

(assert (=> b!875811 (= e!487549 call!38659)))

(assert (= (and d!108581 c!92544) b!875800))

(assert (= (and d!108581 (not c!92544)) b!875807))

(assert (= (and b!875807 c!92542) b!875810))

(assert (= (and b!875807 (not c!92542)) b!875811))

(assert (= (or b!875810 b!875811) bm!38656))

(assert (= (and d!108581 res!595169) b!875808))

(assert (= (and b!875808 res!595168) b!875801))

(assert (= (and b!875801 res!595171) b!875802))

(assert (= (and b!875801 c!92543) b!875809))

(assert (= (and b!875801 (not c!92543)) b!875806))

(assert (= (and b!875809 res!595170) b!875804))

(assert (= (and b!875806 c!92541) b!875803))

(assert (= (and b!875806 (not c!92541)) b!875805))

(declare-fun b_lambda!12185 () Bool)

(assert (=> (not b_lambda!12185) (not b!875804)))

(assert (=> b!875804 t!24413))

(declare-fun b_and!24931 () Bool)

(assert (= b_and!24929 (and (=> t!24413 result!9419) b_and!24931)))

(declare-fun b_lambda!12187 () Bool)

(assert (=> (not b_lambda!12187) (not b!875810)))

(assert (=> b!875810 t!24413))

(declare-fun b_and!24933 () Bool)

(assert (= b_and!24931 (and (=> t!24413 result!9419) b_and!24933)))

(declare-fun m!815627 () Bool)

(assert (=> b!875805 m!815627))

(declare-fun m!815629 () Bool)

(assert (=> b!875810 m!815629))

(declare-fun m!815631 () Bool)

(assert (=> b!875810 m!815631))

(declare-fun m!815633 () Bool)

(assert (=> b!875810 m!815633))

(assert (=> b!875810 m!815631))

(assert (=> b!875810 m!815521))

(declare-fun m!815635 () Bool)

(assert (=> b!875810 m!815635))

(assert (=> b!875810 m!815521))

(assert (=> b!875810 m!815629))

(declare-fun m!815637 () Bool)

(assert (=> b!875810 m!815637))

(assert (=> b!875810 m!815599))

(declare-fun m!815639 () Bool)

(assert (=> b!875810 m!815639))

(assert (=> b!875807 m!815599))

(assert (=> b!875807 m!815599))

(assert (=> b!875807 m!815603))

(declare-fun m!815641 () Bool)

(assert (=> b!875803 m!815641))

(declare-fun m!815643 () Bool)

(assert (=> d!108581 m!815643))

(assert (=> d!108581 m!815531))

(declare-fun m!815645 () Bool)

(assert (=> b!875808 m!815645))

(assert (=> b!875802 m!815599))

(assert (=> b!875802 m!815599))

(assert (=> b!875802 m!815603))

(assert (=> bm!38656 m!815641))

(assert (=> b!875804 m!815599))

(declare-fun m!815647 () Bool)

(assert (=> b!875804 m!815647))

(assert (=> b!875804 m!815599))

(assert (=> b!875804 m!815631))

(assert (=> b!875804 m!815631))

(assert (=> b!875804 m!815521))

(assert (=> b!875804 m!815635))

(assert (=> b!875804 m!815521))

(assert (=> b!875809 m!815599))

(assert (=> b!875809 m!815599))

(declare-fun m!815649 () Bool)

(assert (=> b!875809 m!815649))

(assert (=> b!875694 d!108581))

(declare-fun d!108583 () Bool)

(declare-fun c!92547 () Bool)

(assert (=> d!108583 (= c!92547 ((_ is ValueCellFull!8253) (select (arr!24475 lt!396256) from!1053)))))

(declare-fun e!487557 () V!28227)

(assert (=> d!108583 (= (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!487557)))

(declare-fun b!875816 () Bool)

(declare-fun get!12866 (ValueCell!8253 V!28227) V!28227)

(assert (=> b!875816 (= e!487557 (get!12866 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875817 () Bool)

(declare-fun get!12867 (ValueCell!8253 V!28227) V!28227)

(assert (=> b!875817 (= e!487557 (get!12867 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108583 c!92547) b!875816))

(assert (= (and d!108583 (not c!92547)) b!875817))

(assert (=> b!875816 m!815519))

(assert (=> b!875816 m!815521))

(declare-fun m!815651 () Bool)

(assert (=> b!875816 m!815651))

(assert (=> b!875817 m!815519))

(assert (=> b!875817 m!815521))

(declare-fun m!815653 () Bool)

(assert (=> b!875817 m!815653))

(assert (=> b!875694 d!108583))

(declare-fun b!875828 () Bool)

(declare-fun e!487568 () Bool)

(declare-fun contains!4247 (List!17370 (_ BitVec 64)) Bool)

(assert (=> b!875828 (= e!487568 (contains!4247 Nil!17367 (select (arr!24476 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38659 () Bool)

(declare-fun call!38662 () Bool)

(declare-fun c!92550 () Bool)

(assert (=> bm!38659 (= call!38662 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92550 (Cons!17366 (select (arr!24476 _keys!868) #b00000000000000000000000000000000) Nil!17367) Nil!17367)))))

(declare-fun b!875829 () Bool)

(declare-fun e!487567 () Bool)

(assert (=> b!875829 (= e!487567 call!38662)))

(declare-fun b!875830 () Bool)

(assert (=> b!875830 (= e!487567 call!38662)))

(declare-fun b!875831 () Bool)

(declare-fun e!487566 () Bool)

(assert (=> b!875831 (= e!487566 e!487567)))

(assert (=> b!875831 (= c!92550 (validKeyInArray!0 (select (arr!24476 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!875832 () Bool)

(declare-fun e!487569 () Bool)

(assert (=> b!875832 (= e!487569 e!487566)))

(declare-fun res!595179 () Bool)

(assert (=> b!875832 (=> (not res!595179) (not e!487566))))

(assert (=> b!875832 (= res!595179 (not e!487568))))

(declare-fun res!595178 () Bool)

(assert (=> b!875832 (=> (not res!595178) (not e!487568))))

(assert (=> b!875832 (= res!595178 (validKeyInArray!0 (select (arr!24476 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108585 () Bool)

(declare-fun res!595180 () Bool)

(assert (=> d!108585 (=> res!595180 e!487569)))

(assert (=> d!108585 (= res!595180 (bvsge #b00000000000000000000000000000000 (size!24916 _keys!868)))))

(assert (=> d!108585 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17367) e!487569)))

(assert (= (and d!108585 (not res!595180)) b!875832))

(assert (= (and b!875832 res!595178) b!875828))

(assert (= (and b!875832 res!595179) b!875831))

(assert (= (and b!875831 c!92550) b!875830))

(assert (= (and b!875831 (not c!92550)) b!875829))

(assert (= (or b!875830 b!875829) bm!38659))

(declare-fun m!815655 () Bool)

(assert (=> b!875828 m!815655))

(assert (=> b!875828 m!815655))

(declare-fun m!815657 () Bool)

(assert (=> b!875828 m!815657))

(assert (=> bm!38659 m!815655))

(declare-fun m!815659 () Bool)

(assert (=> bm!38659 m!815659))

(assert (=> b!875831 m!815655))

(assert (=> b!875831 m!815655))

(declare-fun m!815661 () Bool)

(assert (=> b!875831 m!815661))

(assert (=> b!875832 m!815655))

(assert (=> b!875832 m!815655))

(assert (=> b!875832 m!815661))

(assert (=> b!875695 d!108585))

(declare-fun d!108587 () Bool)

(assert (=> d!108587 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!875707 d!108587))

(declare-fun d!108589 () Bool)

(assert (=> d!108589 (= (validKeyInArray!0 (select (arr!24476 _keys!868) from!1053)) (and (not (= (select (arr!24476 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24476 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!875699 d!108589))

(declare-fun b!875839 () Bool)

(declare-fun e!487574 () Bool)

(declare-fun call!38667 () ListLongMap!10317)

(declare-fun call!38668 () ListLongMap!10317)

(assert (=> b!875839 (= e!487574 (= call!38667 call!38668))))

(declare-fun bm!38664 () Bool)

(assert (=> bm!38664 (= call!38668 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!108591 () Bool)

(declare-fun e!487575 () Bool)

(assert (=> d!108591 e!487575))

(declare-fun res!595183 () Bool)

(assert (=> d!108591 (=> (not res!595183) (not e!487575))))

(assert (=> d!108591 (= res!595183 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24915 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24915 _values!688))))))))

(declare-fun lt!396312 () Unit!29950)

(declare-fun choose!1429 (array!50896 array!50894 (_ BitVec 32) (_ BitVec 32) V!28227 V!28227 (_ BitVec 32) (_ BitVec 64) V!28227 (_ BitVec 32) Int) Unit!29950)

(assert (=> d!108591 (= lt!396312 (choose!1429 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108591 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24916 _keys!868)))))

(assert (=> d!108591 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!668 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396312)))

(declare-fun b!875840 () Bool)

(assert (=> b!875840 (= e!487575 e!487574)))

(declare-fun c!92553 () Bool)

(assert (=> b!875840 (= c!92553 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!875841 () Bool)

(assert (=> b!875841 (= e!487574 (= call!38667 (+!2477 call!38668 (tuple2!11549 k0!854 v!557))))))

(declare-fun bm!38665 () Bool)

(assert (=> bm!38665 (= call!38667 (getCurrentListMapNoExtraKeys!3141 _keys!868 (array!50895 (store (arr!24475 _values!688) i!612 (ValueCellFull!8253 v!557)) (size!24915 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!108591 res!595183) b!875840))

(assert (= (and b!875840 c!92553) b!875841))

(assert (= (and b!875840 (not c!92553)) b!875839))

(assert (= (or b!875841 b!875839) bm!38664))

(assert (= (or b!875841 b!875839) bm!38665))

(assert (=> bm!38664 m!815529))

(declare-fun m!815663 () Bool)

(assert (=> d!108591 m!815663))

(declare-fun m!815665 () Bool)

(assert (=> b!875841 m!815665))

(assert (=> bm!38665 m!815513))

(declare-fun m!815667 () Bool)

(assert (=> bm!38665 m!815667))

(assert (=> b!875699 d!108591))

(declare-fun d!108593 () Bool)

(declare-fun e!487576 () Bool)

(assert (=> d!108593 e!487576))

(declare-fun res!595184 () Bool)

(assert (=> d!108593 (=> (not res!595184) (not e!487576))))

(declare-fun lt!396316 () ListLongMap!10317)

(assert (=> d!108593 (= res!595184 (contains!4245 lt!396316 (_1!5785 (tuple2!11549 k0!854 v!557))))))

(declare-fun lt!396313 () List!17369)

(assert (=> d!108593 (= lt!396316 (ListLongMap!10318 lt!396313))))

(declare-fun lt!396315 () Unit!29950)

(declare-fun lt!396314 () Unit!29950)

(assert (=> d!108593 (= lt!396315 lt!396314)))

(assert (=> d!108593 (= (getValueByKey!418 lt!396313 (_1!5785 (tuple2!11549 k0!854 v!557))) (Some!423 (_2!5785 (tuple2!11549 k0!854 v!557))))))

(assert (=> d!108593 (= lt!396314 (lemmaContainsTupThenGetReturnValue!232 lt!396313 (_1!5785 (tuple2!11549 k0!854 v!557)) (_2!5785 (tuple2!11549 k0!854 v!557))))))

(assert (=> d!108593 (= lt!396313 (insertStrictlySorted!271 (toList!5174 call!38649) (_1!5785 (tuple2!11549 k0!854 v!557)) (_2!5785 (tuple2!11549 k0!854 v!557))))))

(assert (=> d!108593 (= (+!2477 call!38649 (tuple2!11549 k0!854 v!557)) lt!396316)))

(declare-fun b!875842 () Bool)

(declare-fun res!595185 () Bool)

(assert (=> b!875842 (=> (not res!595185) (not e!487576))))

(assert (=> b!875842 (= res!595185 (= (getValueByKey!418 (toList!5174 lt!396316) (_1!5785 (tuple2!11549 k0!854 v!557))) (Some!423 (_2!5785 (tuple2!11549 k0!854 v!557)))))))

(declare-fun b!875843 () Bool)

(assert (=> b!875843 (= e!487576 (contains!4246 (toList!5174 lt!396316) (tuple2!11549 k0!854 v!557)))))

(assert (= (and d!108593 res!595184) b!875842))

(assert (= (and b!875842 res!595185) b!875843))

(declare-fun m!815669 () Bool)

(assert (=> d!108593 m!815669))

(declare-fun m!815671 () Bool)

(assert (=> d!108593 m!815671))

(declare-fun m!815673 () Bool)

(assert (=> d!108593 m!815673))

(declare-fun m!815675 () Bool)

(assert (=> d!108593 m!815675))

(declare-fun m!815677 () Bool)

(assert (=> b!875842 m!815677))

(declare-fun m!815679 () Bool)

(assert (=> b!875843 m!815679))

(assert (=> b!875708 d!108593))

(declare-fun b!875852 () Bool)

(declare-fun e!487584 () Bool)

(declare-fun call!38671 () Bool)

(assert (=> b!875852 (= e!487584 call!38671)))

(declare-fun b!875853 () Bool)

(declare-fun e!487583 () Bool)

(assert (=> b!875853 (= e!487583 call!38671)))

(declare-fun b!875854 () Bool)

(assert (=> b!875854 (= e!487583 e!487584)))

(declare-fun lt!396325 () (_ BitVec 64))

(assert (=> b!875854 (= lt!396325 (select (arr!24476 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!396324 () Unit!29950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50896 (_ BitVec 64) (_ BitVec 32)) Unit!29950)

(assert (=> b!875854 (= lt!396324 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396325 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!875854 (arrayContainsKey!0 _keys!868 lt!396325 #b00000000000000000000000000000000)))

(declare-fun lt!396323 () Unit!29950)

(assert (=> b!875854 (= lt!396323 lt!396324)))

(declare-fun res!595191 () Bool)

(declare-datatypes ((SeekEntryResult!8752 0))(
  ( (MissingZero!8752 (index!37379 (_ BitVec 32))) (Found!8752 (index!37380 (_ BitVec 32))) (Intermediate!8752 (undefined!9564 Bool) (index!37381 (_ BitVec 32)) (x!74196 (_ BitVec 32))) (Undefined!8752) (MissingVacant!8752 (index!37382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50896 (_ BitVec 32)) SeekEntryResult!8752)

(assert (=> b!875854 (= res!595191 (= (seekEntryOrOpen!0 (select (arr!24476 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8752 #b00000000000000000000000000000000)))))

(assert (=> b!875854 (=> (not res!595191) (not e!487584))))

(declare-fun b!875855 () Bool)

(declare-fun e!487585 () Bool)

(assert (=> b!875855 (= e!487585 e!487583)))

(declare-fun c!92556 () Bool)

(assert (=> b!875855 (= c!92556 (validKeyInArray!0 (select (arr!24476 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38668 () Bool)

(assert (=> bm!38668 (= call!38671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108595 () Bool)

(declare-fun res!595190 () Bool)

(assert (=> d!108595 (=> res!595190 e!487585)))

(assert (=> d!108595 (= res!595190 (bvsge #b00000000000000000000000000000000 (size!24916 _keys!868)))))

(assert (=> d!108595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!487585)))

(assert (= (and d!108595 (not res!595190)) b!875855))

(assert (= (and b!875855 c!92556) b!875854))

(assert (= (and b!875855 (not c!92556)) b!875853))

(assert (= (and b!875854 res!595191) b!875852))

(assert (= (or b!875852 b!875853) bm!38668))

(assert (=> b!875854 m!815655))

(declare-fun m!815681 () Bool)

(assert (=> b!875854 m!815681))

(declare-fun m!815683 () Bool)

(assert (=> b!875854 m!815683))

(assert (=> b!875854 m!815655))

(declare-fun m!815685 () Bool)

(assert (=> b!875854 m!815685))

(assert (=> b!875855 m!815655))

(assert (=> b!875855 m!815655))

(assert (=> b!875855 m!815661))

(declare-fun m!815687 () Bool)

(assert (=> bm!38668 m!815687))

(assert (=> b!875696 d!108595))

(declare-fun call!38672 () ListLongMap!10317)

(declare-fun bm!38669 () Bool)

(assert (=> bm!38669 (= call!38672 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!875856 () Bool)

(declare-fun e!487588 () ListLongMap!10317)

(assert (=> b!875856 (= e!487588 (ListLongMap!10318 Nil!17366))))

(declare-fun d!108597 () Bool)

(declare-fun e!487586 () Bool)

(assert (=> d!108597 e!487586))

(declare-fun res!595193 () Bool)

(assert (=> d!108597 (=> (not res!595193) (not e!487586))))

(declare-fun lt!396326 () ListLongMap!10317)

(assert (=> d!108597 (= res!595193 (not (contains!4245 lt!396326 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108597 (= lt!396326 e!487588)))

(declare-fun c!92560 () Bool)

(assert (=> d!108597 (= c!92560 (bvsge from!1053 (size!24916 _keys!868)))))

(assert (=> d!108597 (validMask!0 mask!1196)))

(assert (=> d!108597 (= (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396326)))

(declare-fun b!875857 () Bool)

(declare-fun e!487590 () Bool)

(assert (=> b!875857 (= e!487586 e!487590)))

(declare-fun c!92559 () Bool)

(declare-fun e!487589 () Bool)

(assert (=> b!875857 (= c!92559 e!487589)))

(declare-fun res!595195 () Bool)

(assert (=> b!875857 (=> (not res!595195) (not e!487589))))

(assert (=> b!875857 (= res!595195 (bvslt from!1053 (size!24916 _keys!868)))))

(declare-fun b!875858 () Bool)

(assert (=> b!875858 (= e!487589 (validKeyInArray!0 (select (arr!24476 _keys!868) from!1053)))))

(assert (=> b!875858 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun e!487592 () Bool)

(declare-fun b!875859 () Bool)

(assert (=> b!875859 (= e!487592 (= lt!396326 (getCurrentListMapNoExtraKeys!3141 _keys!868 lt!396256 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!875860 () Bool)

(assert (=> b!875860 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24916 _keys!868)))))

(assert (=> b!875860 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24915 lt!396256)))))

(declare-fun e!487591 () Bool)

(assert (=> b!875860 (= e!487591 (= (apply!376 lt!396326 (select (arr!24476 _keys!868) from!1053)) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!875861 () Bool)

(assert (=> b!875861 (= e!487592 (isEmpty!662 lt!396326))))

(declare-fun b!875862 () Bool)

(assert (=> b!875862 (= e!487590 e!487592)))

(declare-fun c!92557 () Bool)

(assert (=> b!875862 (= c!92557 (bvslt from!1053 (size!24916 _keys!868)))))

(declare-fun b!875863 () Bool)

(declare-fun e!487587 () ListLongMap!10317)

(assert (=> b!875863 (= e!487588 e!487587)))

(declare-fun c!92558 () Bool)

(assert (=> b!875863 (= c!92558 (validKeyInArray!0 (select (arr!24476 _keys!868) from!1053)))))

(declare-fun b!875864 () Bool)

(declare-fun res!595192 () Bool)

(assert (=> b!875864 (=> (not res!595192) (not e!487586))))

(assert (=> b!875864 (= res!595192 (not (contains!4245 lt!396326 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875865 () Bool)

(assert (=> b!875865 (= e!487590 e!487591)))

(assert (=> b!875865 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24916 _keys!868)))))

(declare-fun res!595194 () Bool)

(assert (=> b!875865 (= res!595194 (contains!4245 lt!396326 (select (arr!24476 _keys!868) from!1053)))))

(assert (=> b!875865 (=> (not res!595194) (not e!487591))))

(declare-fun b!875866 () Bool)

(declare-fun lt!396327 () Unit!29950)

(declare-fun lt!396331 () Unit!29950)

(assert (=> b!875866 (= lt!396327 lt!396331)))

(declare-fun lt!396329 () (_ BitVec 64))

(declare-fun lt!396330 () V!28227)

(declare-fun lt!396332 () (_ BitVec 64))

(declare-fun lt!396328 () ListLongMap!10317)

(assert (=> b!875866 (not (contains!4245 (+!2477 lt!396328 (tuple2!11549 lt!396329 lt!396330)) lt!396332))))

(assert (=> b!875866 (= lt!396331 (addStillNotContains!201 lt!396328 lt!396329 lt!396330 lt!396332))))

(assert (=> b!875866 (= lt!396332 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!875866 (= lt!396330 (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!875866 (= lt!396329 (select (arr!24476 _keys!868) from!1053))))

(assert (=> b!875866 (= lt!396328 call!38672)))

(assert (=> b!875866 (= e!487587 (+!2477 call!38672 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 lt!396256) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!875867 () Bool)

(assert (=> b!875867 (= e!487587 call!38672)))

(assert (= (and d!108597 c!92560) b!875856))

(assert (= (and d!108597 (not c!92560)) b!875863))

(assert (= (and b!875863 c!92558) b!875866))

(assert (= (and b!875863 (not c!92558)) b!875867))

(assert (= (or b!875866 b!875867) bm!38669))

(assert (= (and d!108597 res!595193) b!875864))

(assert (= (and b!875864 res!595192) b!875857))

(assert (= (and b!875857 res!595195) b!875858))

(assert (= (and b!875857 c!92559) b!875865))

(assert (= (and b!875857 (not c!92559)) b!875862))

(assert (= (and b!875865 res!595194) b!875860))

(assert (= (and b!875862 c!92557) b!875859))

(assert (= (and b!875862 (not c!92557)) b!875861))

(declare-fun b_lambda!12189 () Bool)

(assert (=> (not b_lambda!12189) (not b!875860)))

(assert (=> b!875860 t!24413))

(declare-fun b_and!24935 () Bool)

(assert (= b_and!24933 (and (=> t!24413 result!9419) b_and!24935)))

(declare-fun b_lambda!12191 () Bool)

(assert (=> (not b_lambda!12191) (not b!875866)))

(assert (=> b!875866 t!24413))

(declare-fun b_and!24937 () Bool)

(assert (= b_and!24935 (and (=> t!24413 result!9419) b_and!24937)))

(declare-fun m!815689 () Bool)

(assert (=> b!875861 m!815689))

(declare-fun m!815691 () Bool)

(assert (=> b!875866 m!815691))

(assert (=> b!875866 m!815519))

(declare-fun m!815693 () Bool)

(assert (=> b!875866 m!815693))

(assert (=> b!875866 m!815519))

(assert (=> b!875866 m!815521))

(assert (=> b!875866 m!815523))

(assert (=> b!875866 m!815521))

(assert (=> b!875866 m!815691))

(declare-fun m!815695 () Bool)

(assert (=> b!875866 m!815695))

(assert (=> b!875866 m!815503))

(declare-fun m!815697 () Bool)

(assert (=> b!875866 m!815697))

(assert (=> b!875863 m!815503))

(assert (=> b!875863 m!815503))

(assert (=> b!875863 m!815505))

(declare-fun m!815699 () Bool)

(assert (=> b!875859 m!815699))

(declare-fun m!815701 () Bool)

(assert (=> d!108597 m!815701))

(assert (=> d!108597 m!815531))

(declare-fun m!815703 () Bool)

(assert (=> b!875864 m!815703))

(assert (=> b!875858 m!815503))

(assert (=> b!875858 m!815503))

(assert (=> b!875858 m!815505))

(assert (=> bm!38669 m!815699))

(assert (=> b!875860 m!815503))

(declare-fun m!815705 () Bool)

(assert (=> b!875860 m!815705))

(assert (=> b!875860 m!815503))

(assert (=> b!875860 m!815519))

(assert (=> b!875860 m!815519))

(assert (=> b!875860 m!815521))

(assert (=> b!875860 m!815523))

(assert (=> b!875860 m!815521))

(assert (=> b!875865 m!815503))

(assert (=> b!875865 m!815503))

(declare-fun m!815707 () Bool)

(assert (=> b!875865 m!815707))

(assert (=> b!875701 d!108597))

(declare-fun call!38673 () ListLongMap!10317)

(declare-fun bm!38670 () Bool)

(assert (=> bm!38670 (= call!38673 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!875868 () Bool)

(declare-fun e!487595 () ListLongMap!10317)

(assert (=> b!875868 (= e!487595 (ListLongMap!10318 Nil!17366))))

(declare-fun d!108599 () Bool)

(declare-fun e!487593 () Bool)

(assert (=> d!108599 e!487593))

(declare-fun res!595197 () Bool)

(assert (=> d!108599 (=> (not res!595197) (not e!487593))))

(declare-fun lt!396333 () ListLongMap!10317)

(assert (=> d!108599 (= res!595197 (not (contains!4245 lt!396333 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108599 (= lt!396333 e!487595)))

(declare-fun c!92564 () Bool)

(assert (=> d!108599 (= c!92564 (bvsge from!1053 (size!24916 _keys!868)))))

(assert (=> d!108599 (validMask!0 mask!1196)))

(assert (=> d!108599 (= (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396333)))

(declare-fun b!875869 () Bool)

(declare-fun e!487597 () Bool)

(assert (=> b!875869 (= e!487593 e!487597)))

(declare-fun c!92563 () Bool)

(declare-fun e!487596 () Bool)

(assert (=> b!875869 (= c!92563 e!487596)))

(declare-fun res!595199 () Bool)

(assert (=> b!875869 (=> (not res!595199) (not e!487596))))

(assert (=> b!875869 (= res!595199 (bvslt from!1053 (size!24916 _keys!868)))))

(declare-fun b!875870 () Bool)

(assert (=> b!875870 (= e!487596 (validKeyInArray!0 (select (arr!24476 _keys!868) from!1053)))))

(assert (=> b!875870 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!875871 () Bool)

(declare-fun e!487599 () Bool)

(assert (=> b!875871 (= e!487599 (= lt!396333 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!875872 () Bool)

(assert (=> b!875872 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24916 _keys!868)))))

(assert (=> b!875872 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24915 _values!688)))))

(declare-fun e!487598 () Bool)

(assert (=> b!875872 (= e!487598 (= (apply!376 lt!396333 (select (arr!24476 _keys!868) from!1053)) (get!12865 (select (arr!24475 _values!688) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!875873 () Bool)

(assert (=> b!875873 (= e!487599 (isEmpty!662 lt!396333))))

(declare-fun b!875874 () Bool)

(assert (=> b!875874 (= e!487597 e!487599)))

(declare-fun c!92561 () Bool)

(assert (=> b!875874 (= c!92561 (bvslt from!1053 (size!24916 _keys!868)))))

(declare-fun b!875875 () Bool)

(declare-fun e!487594 () ListLongMap!10317)

(assert (=> b!875875 (= e!487595 e!487594)))

(declare-fun c!92562 () Bool)

(assert (=> b!875875 (= c!92562 (validKeyInArray!0 (select (arr!24476 _keys!868) from!1053)))))

(declare-fun b!875876 () Bool)

(declare-fun res!595196 () Bool)

(assert (=> b!875876 (=> (not res!595196) (not e!487593))))

(assert (=> b!875876 (= res!595196 (not (contains!4245 lt!396333 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875877 () Bool)

(assert (=> b!875877 (= e!487597 e!487598)))

(assert (=> b!875877 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24916 _keys!868)))))

(declare-fun res!595198 () Bool)

(assert (=> b!875877 (= res!595198 (contains!4245 lt!396333 (select (arr!24476 _keys!868) from!1053)))))

(assert (=> b!875877 (=> (not res!595198) (not e!487598))))

(declare-fun b!875878 () Bool)

(declare-fun lt!396334 () Unit!29950)

(declare-fun lt!396338 () Unit!29950)

(assert (=> b!875878 (= lt!396334 lt!396338)))

(declare-fun lt!396335 () ListLongMap!10317)

(declare-fun lt!396336 () (_ BitVec 64))

(declare-fun lt!396337 () V!28227)

(declare-fun lt!396339 () (_ BitVec 64))

(assert (=> b!875878 (not (contains!4245 (+!2477 lt!396335 (tuple2!11549 lt!396336 lt!396337)) lt!396339))))

(assert (=> b!875878 (= lt!396338 (addStillNotContains!201 lt!396335 lt!396336 lt!396337 lt!396339))))

(assert (=> b!875878 (= lt!396339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!875878 (= lt!396337 (get!12865 (select (arr!24475 _values!688) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!875878 (= lt!396336 (select (arr!24476 _keys!868) from!1053))))

(assert (=> b!875878 (= lt!396335 call!38673)))

(assert (=> b!875878 (= e!487594 (+!2477 call!38673 (tuple2!11549 (select (arr!24476 _keys!868) from!1053) (get!12865 (select (arr!24475 _values!688) from!1053) (dynLambda!1205 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!875879 () Bool)

(assert (=> b!875879 (= e!487594 call!38673)))

(assert (= (and d!108599 c!92564) b!875868))

(assert (= (and d!108599 (not c!92564)) b!875875))

(assert (= (and b!875875 c!92562) b!875878))

(assert (= (and b!875875 (not c!92562)) b!875879))

(assert (= (or b!875878 b!875879) bm!38670))

(assert (= (and d!108599 res!595197) b!875876))

(assert (= (and b!875876 res!595196) b!875869))

(assert (= (and b!875869 res!595199) b!875870))

(assert (= (and b!875869 c!92563) b!875877))

(assert (= (and b!875869 (not c!92563)) b!875874))

(assert (= (and b!875877 res!595198) b!875872))

(assert (= (and b!875874 c!92561) b!875871))

(assert (= (and b!875874 (not c!92561)) b!875873))

(declare-fun b_lambda!12193 () Bool)

(assert (=> (not b_lambda!12193) (not b!875872)))

(assert (=> b!875872 t!24413))

(declare-fun b_and!24939 () Bool)

(assert (= b_and!24937 (and (=> t!24413 result!9419) b_and!24939)))

(declare-fun b_lambda!12195 () Bool)

(assert (=> (not b_lambda!12195) (not b!875878)))

(assert (=> b!875878 t!24413))

(declare-fun b_and!24941 () Bool)

(assert (= b_and!24939 (and (=> t!24413 result!9419) b_and!24941)))

(declare-fun m!815709 () Bool)

(assert (=> b!875873 m!815709))

(declare-fun m!815711 () Bool)

(assert (=> b!875878 m!815711))

(declare-fun m!815713 () Bool)

(assert (=> b!875878 m!815713))

(declare-fun m!815715 () Bool)

(assert (=> b!875878 m!815715))

(assert (=> b!875878 m!815713))

(assert (=> b!875878 m!815521))

(declare-fun m!815717 () Bool)

(assert (=> b!875878 m!815717))

(assert (=> b!875878 m!815521))

(assert (=> b!875878 m!815711))

(declare-fun m!815719 () Bool)

(assert (=> b!875878 m!815719))

(assert (=> b!875878 m!815503))

(declare-fun m!815721 () Bool)

(assert (=> b!875878 m!815721))

(assert (=> b!875875 m!815503))

(assert (=> b!875875 m!815503))

(assert (=> b!875875 m!815505))

(declare-fun m!815723 () Bool)

(assert (=> b!875871 m!815723))

(declare-fun m!815725 () Bool)

(assert (=> d!108599 m!815725))

(assert (=> d!108599 m!815531))

(declare-fun m!815727 () Bool)

(assert (=> b!875876 m!815727))

(assert (=> b!875870 m!815503))

(assert (=> b!875870 m!815503))

(assert (=> b!875870 m!815505))

(assert (=> bm!38670 m!815723))

(assert (=> b!875872 m!815503))

(declare-fun m!815729 () Bool)

(assert (=> b!875872 m!815729))

(assert (=> b!875872 m!815503))

(assert (=> b!875872 m!815713))

(assert (=> b!875872 m!815713))

(assert (=> b!875872 m!815521))

(assert (=> b!875872 m!815717))

(assert (=> b!875872 m!815521))

(assert (=> b!875877 m!815503))

(assert (=> b!875877 m!815503))

(declare-fun m!815731 () Bool)

(assert (=> b!875877 m!815731))

(assert (=> b!875701 d!108599))

(declare-fun d!108601 () Bool)

(assert (=> d!108601 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!875705 d!108601))

(assert (=> bm!38646 d!108581))

(declare-fun d!108603 () Bool)

(assert (=> d!108603 (= (array_inv!19296 _keys!868) (bvsge (size!24916 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74378 d!108603))

(declare-fun d!108605 () Bool)

(assert (=> d!108605 (= (array_inv!19297 _values!688) (bvsge (size!24915 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74378 d!108605))

(declare-fun condMapEmpty!27692 () Bool)

(declare-fun mapDefault!27692 () ValueCell!8253)

(assert (=> mapNonEmpty!27686 (= condMapEmpty!27692 (= mapRest!27686 ((as const (Array (_ BitVec 32) ValueCell!8253)) mapDefault!27692)))))

(declare-fun e!487604 () Bool)

(declare-fun mapRes!27692 () Bool)

(assert (=> mapNonEmpty!27686 (= tp!53098 (and e!487604 mapRes!27692))))

(declare-fun b!875887 () Bool)

(assert (=> b!875887 (= e!487604 tp_is_empty!17385)))

(declare-fun mapIsEmpty!27692 () Bool)

(assert (=> mapIsEmpty!27692 mapRes!27692))

(declare-fun mapNonEmpty!27692 () Bool)

(declare-fun tp!53107 () Bool)

(declare-fun e!487605 () Bool)

(assert (=> mapNonEmpty!27692 (= mapRes!27692 (and tp!53107 e!487605))))

(declare-fun mapRest!27692 () (Array (_ BitVec 32) ValueCell!8253))

(declare-fun mapKey!27692 () (_ BitVec 32))

(declare-fun mapValue!27692 () ValueCell!8253)

(assert (=> mapNonEmpty!27692 (= mapRest!27686 (store mapRest!27692 mapKey!27692 mapValue!27692))))

(declare-fun b!875886 () Bool)

(assert (=> b!875886 (= e!487605 tp_is_empty!17385)))

(assert (= (and mapNonEmpty!27686 condMapEmpty!27692) mapIsEmpty!27692))

(assert (= (and mapNonEmpty!27686 (not condMapEmpty!27692)) mapNonEmpty!27692))

(assert (= (and mapNonEmpty!27692 ((_ is ValueCellFull!8253) mapValue!27692)) b!875886))

(assert (= (and mapNonEmpty!27686 ((_ is ValueCellFull!8253) mapDefault!27692)) b!875887))

(declare-fun m!815733 () Bool)

(assert (=> mapNonEmpty!27692 m!815733))

(declare-fun b_lambda!12197 () Bool)

(assert (= b_lambda!12181 (or (and start!74378 b_free!15141) b_lambda!12197)))

(declare-fun b_lambda!12199 () Bool)

(assert (= b_lambda!12187 (or (and start!74378 b_free!15141) b_lambda!12199)))

(declare-fun b_lambda!12201 () Bool)

(assert (= b_lambda!12195 (or (and start!74378 b_free!15141) b_lambda!12201)))

(declare-fun b_lambda!12203 () Bool)

(assert (= b_lambda!12183 (or (and start!74378 b_free!15141) b_lambda!12203)))

(declare-fun b_lambda!12205 () Bool)

(assert (= b_lambda!12191 (or (and start!74378 b_free!15141) b_lambda!12205)))

(declare-fun b_lambda!12207 () Bool)

(assert (= b_lambda!12193 (or (and start!74378 b_free!15141) b_lambda!12207)))

(declare-fun b_lambda!12209 () Bool)

(assert (= b_lambda!12185 (or (and start!74378 b_free!15141) b_lambda!12209)))

(declare-fun b_lambda!12211 () Bool)

(assert (= b_lambda!12189 (or (and start!74378 b_free!15141) b_lambda!12211)))

(check-sat (not b_lambda!12199) (not bm!38655) (not b!875878) (not bm!38670) (not b_lambda!12209) (not d!108591) (not b!875803) (not b!875791) (not b!875875) (not b!875864) (not b_lambda!12207) (not b!875842) (not b_lambda!12201) (not b!875787) (not b!875877) (not b_lambda!12203) (not b!875810) (not b!875809) (not b_next!15141) b_and!24941 tp_is_empty!17385 (not b!875785) (not b!875828) (not b!875807) (not d!108597) (not b!875831) (not bm!38668) (not b!875861) (not b!875817) (not b!875805) (not mapNonEmpty!27692) (not b!875873) (not b!875866) (not d!108581) (not b_lambda!12205) (not b!875860) (not b!875871) (not b!875870) (not b!875816) (not b!875790) (not b!875865) (not b_lambda!12211) (not b!875854) (not bm!38669) (not b!875804) (not bm!38664) (not b!875832) (not b!875872) (not b!875863) (not d!108593) (not b!875858) (not d!108577) (not d!108599) (not b!875789) (not b!875808) (not b!875802) (not b!875798) (not b!875786) (not b!875799) (not b!875784) (not b_lambda!12197) (not bm!38656) (not b_lambda!12179) (not b!875859) (not b!875843) (not b!875792) (not bm!38659) (not d!108579) (not b!875841) (not b!875855) (not bm!38665) (not b!875876))
(check-sat b_and!24941 (not b_next!15141))
