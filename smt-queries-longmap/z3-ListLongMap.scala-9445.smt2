; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112502 () Bool)

(assert start!112502)

(declare-fun b_free!30673 () Bool)

(declare-fun b_next!30673 () Bool)

(assert (=> start!112502 (= b_free!30673 (not b_next!30673))))

(declare-fun tp!107655 () Bool)

(declare-fun b_and!49403 () Bool)

(assert (=> start!112502 (= tp!107655 b_and!49403)))

(declare-fun b!1331648 () Bool)

(declare-fun res!883260 () Bool)

(declare-fun e!759093 () Bool)

(assert (=> b!1331648 (=> (not res!883260) (not e!759093))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90161 0))(
  ( (array!90162 (arr!43542 (Array (_ BitVec 32) (_ BitVec 64))) (size!44093 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90161)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331648 (= res!883260 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44093 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331649 () Bool)

(declare-fun res!883263 () Bool)

(assert (=> b!1331649 (=> (not res!883263) (not e!759093))))

(assert (=> b!1331649 (= res!883263 (not (= (select (arr!43542 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331650 () Bool)

(declare-fun res!883268 () Bool)

(assert (=> b!1331650 (=> (not res!883268) (not e!759093))))

(declare-datatypes ((V!53881 0))(
  ( (V!53882 (val!18366 Int)) )
))
(declare-datatypes ((ValueCell!17393 0))(
  ( (ValueCellFull!17393 (v!20998 V!53881)) (EmptyCell!17393) )
))
(declare-datatypes ((array!90163 0))(
  ( (array!90164 (arr!43543 (Array (_ BitVec 32) ValueCell!17393)) (size!44094 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90163)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53881)

(declare-fun zeroValue!1262 () V!53881)

(declare-datatypes ((tuple2!23686 0))(
  ( (tuple2!23687 (_1!11854 (_ BitVec 64)) (_2!11854 V!53881)) )
))
(declare-datatypes ((List!30853 0))(
  ( (Nil!30850) (Cons!30849 (h!32067 tuple2!23686) (t!44931 List!30853)) )
))
(declare-datatypes ((ListLongMap!21351 0))(
  ( (ListLongMap!21352 (toList!10691 List!30853)) )
))
(declare-fun contains!8867 (ListLongMap!21351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5662 (array!90161 array!90163 (_ BitVec 32) (_ BitVec 32) V!53881 V!53881 (_ BitVec 32) Int) ListLongMap!21351)

(assert (=> b!1331650 (= res!883268 (contains!8867 (getCurrentListMap!5662 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331651 () Bool)

(declare-fun res!883265 () Bool)

(assert (=> b!1331651 (=> (not res!883265) (not e!759093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90161 (_ BitVec 32)) Bool)

(assert (=> b!1331651 (= res!883265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331652 () Bool)

(declare-fun res!883261 () Bool)

(assert (=> b!1331652 (=> (not res!883261) (not e!759093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331652 (= res!883261 (validKeyInArray!0 (select (arr!43542 _keys!1590) from!1980)))))

(declare-fun b!1331653 () Bool)

(declare-fun res!883266 () Bool)

(assert (=> b!1331653 (=> (not res!883266) (not e!759093))))

(assert (=> b!1331653 (= res!883266 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331654 () Bool)

(assert (=> b!1331654 (= e!759093 (not true))))

(declare-fun lt!591584 () ListLongMap!21351)

(assert (=> b!1331654 (contains!8867 lt!591584 k0!1153)))

(declare-datatypes ((Unit!43726 0))(
  ( (Unit!43727) )
))
(declare-fun lt!591582 () Unit!43726)

(declare-fun lt!591583 () V!53881)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!251 ((_ BitVec 64) (_ BitVec 64) V!53881 ListLongMap!21351) Unit!43726)

(assert (=> b!1331654 (= lt!591582 (lemmaInListMapAfterAddingDiffThenInBefore!251 k0!1153 (select (arr!43542 _keys!1590) from!1980) lt!591583 lt!591584))))

(declare-fun lt!591581 () ListLongMap!21351)

(assert (=> b!1331654 (contains!8867 lt!591581 k0!1153)))

(declare-fun lt!591585 () Unit!43726)

(assert (=> b!1331654 (= lt!591585 (lemmaInListMapAfterAddingDiffThenInBefore!251 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591581))))

(declare-fun +!4708 (ListLongMap!21351 tuple2!23686) ListLongMap!21351)

(assert (=> b!1331654 (= lt!591581 (+!4708 lt!591584 (tuple2!23687 (select (arr!43542 _keys!1590) from!1980) lt!591583)))))

(declare-fun get!21965 (ValueCell!17393 V!53881) V!53881)

(declare-fun dynLambda!3662 (Int (_ BitVec 64)) V!53881)

(assert (=> b!1331654 (= lt!591583 (get!21965 (select (arr!43543 _values!1320) from!1980) (dynLambda!3662 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6352 (array!90161 array!90163 (_ BitVec 32) (_ BitVec 32) V!53881 V!53881 (_ BitVec 32) Int) ListLongMap!21351)

(assert (=> b!1331654 (= lt!591584 (getCurrentListMapNoExtraKeys!6352 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!883264 () Bool)

(assert (=> start!112502 (=> (not res!883264) (not e!759093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112502 (= res!883264 (validMask!0 mask!1998))))

(assert (=> start!112502 e!759093))

(declare-fun e!759094 () Bool)

(declare-fun array_inv!33129 (array!90163) Bool)

(assert (=> start!112502 (and (array_inv!33129 _values!1320) e!759094)))

(assert (=> start!112502 true))

(declare-fun array_inv!33130 (array!90161) Bool)

(assert (=> start!112502 (array_inv!33130 _keys!1590)))

(assert (=> start!112502 tp!107655))

(declare-fun tp_is_empty!36583 () Bool)

(assert (=> start!112502 tp_is_empty!36583))

(declare-fun b!1331655 () Bool)

(declare-fun e!759090 () Bool)

(assert (=> b!1331655 (= e!759090 tp_is_empty!36583)))

(declare-fun b!1331656 () Bool)

(declare-fun res!883267 () Bool)

(assert (=> b!1331656 (=> (not res!883267) (not e!759093))))

(assert (=> b!1331656 (= res!883267 (and (= (size!44094 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44093 _keys!1590) (size!44094 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56548 () Bool)

(declare-fun mapRes!56548 () Bool)

(declare-fun tp!107656 () Bool)

(declare-fun e!759092 () Bool)

(assert (=> mapNonEmpty!56548 (= mapRes!56548 (and tp!107656 e!759092))))

(declare-fun mapRest!56548 () (Array (_ BitVec 32) ValueCell!17393))

(declare-fun mapKey!56548 () (_ BitVec 32))

(declare-fun mapValue!56548 () ValueCell!17393)

(assert (=> mapNonEmpty!56548 (= (arr!43543 _values!1320) (store mapRest!56548 mapKey!56548 mapValue!56548))))

(declare-fun b!1331657 () Bool)

(assert (=> b!1331657 (= e!759092 tp_is_empty!36583)))

(declare-fun b!1331658 () Bool)

(assert (=> b!1331658 (= e!759094 (and e!759090 mapRes!56548))))

(declare-fun condMapEmpty!56548 () Bool)

(declare-fun mapDefault!56548 () ValueCell!17393)

(assert (=> b!1331658 (= condMapEmpty!56548 (= (arr!43543 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17393)) mapDefault!56548)))))

(declare-fun b!1331659 () Bool)

(declare-fun res!883262 () Bool)

(assert (=> b!1331659 (=> (not res!883262) (not e!759093))))

(declare-datatypes ((List!30854 0))(
  ( (Nil!30851) (Cons!30850 (h!32068 (_ BitVec 64)) (t!44932 List!30854)) )
))
(declare-fun arrayNoDuplicates!0 (array!90161 (_ BitVec 32) List!30854) Bool)

(assert (=> b!1331659 (= res!883262 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30851))))

(declare-fun mapIsEmpty!56548 () Bool)

(assert (=> mapIsEmpty!56548 mapRes!56548))

(assert (= (and start!112502 res!883264) b!1331656))

(assert (= (and b!1331656 res!883267) b!1331651))

(assert (= (and b!1331651 res!883265) b!1331659))

(assert (= (and b!1331659 res!883262) b!1331648))

(assert (= (and b!1331648 res!883260) b!1331650))

(assert (= (and b!1331650 res!883268) b!1331649))

(assert (= (and b!1331649 res!883263) b!1331652))

(assert (= (and b!1331652 res!883261) b!1331653))

(assert (= (and b!1331653 res!883266) b!1331654))

(assert (= (and b!1331658 condMapEmpty!56548) mapIsEmpty!56548))

(assert (= (and b!1331658 (not condMapEmpty!56548)) mapNonEmpty!56548))

(get-info :version)

(assert (= (and mapNonEmpty!56548 ((_ is ValueCellFull!17393) mapValue!56548)) b!1331657))

(assert (= (and b!1331658 ((_ is ValueCellFull!17393) mapDefault!56548)) b!1331655))

(assert (= start!112502 b!1331658))

(declare-fun b_lambda!23927 () Bool)

(assert (=> (not b_lambda!23927) (not b!1331654)))

(declare-fun t!44930 () Bool)

(declare-fun tb!11881 () Bool)

(assert (=> (and start!112502 (= defaultEntry!1323 defaultEntry!1323) t!44930) tb!11881))

(declare-fun result!24841 () Bool)

(assert (=> tb!11881 (= result!24841 tp_is_empty!36583)))

(assert (=> b!1331654 t!44930))

(declare-fun b_and!49405 () Bool)

(assert (= b_and!49403 (and (=> t!44930 result!24841) b_and!49405)))

(declare-fun m!1220609 () Bool)

(assert (=> b!1331651 m!1220609))

(declare-fun m!1220611 () Bool)

(assert (=> b!1331650 m!1220611))

(assert (=> b!1331650 m!1220611))

(declare-fun m!1220613 () Bool)

(assert (=> b!1331650 m!1220613))

(declare-fun m!1220615 () Bool)

(assert (=> b!1331652 m!1220615))

(assert (=> b!1331652 m!1220615))

(declare-fun m!1220617 () Bool)

(assert (=> b!1331652 m!1220617))

(declare-fun m!1220619 () Bool)

(assert (=> b!1331654 m!1220619))

(declare-fun m!1220621 () Bool)

(assert (=> b!1331654 m!1220621))

(declare-fun m!1220623 () Bool)

(assert (=> b!1331654 m!1220623))

(declare-fun m!1220625 () Bool)

(assert (=> b!1331654 m!1220625))

(declare-fun m!1220627 () Bool)

(assert (=> b!1331654 m!1220627))

(declare-fun m!1220629 () Bool)

(assert (=> b!1331654 m!1220629))

(declare-fun m!1220631 () Bool)

(assert (=> b!1331654 m!1220631))

(assert (=> b!1331654 m!1220621))

(declare-fun m!1220633 () Bool)

(assert (=> b!1331654 m!1220633))

(assert (=> b!1331654 m!1220615))

(assert (=> b!1331654 m!1220615))

(declare-fun m!1220635 () Bool)

(assert (=> b!1331654 m!1220635))

(assert (=> b!1331654 m!1220623))

(assert (=> b!1331649 m!1220615))

(declare-fun m!1220637 () Bool)

(assert (=> mapNonEmpty!56548 m!1220637))

(declare-fun m!1220639 () Bool)

(assert (=> start!112502 m!1220639))

(declare-fun m!1220641 () Bool)

(assert (=> start!112502 m!1220641))

(declare-fun m!1220643 () Bool)

(assert (=> start!112502 m!1220643))

(declare-fun m!1220645 () Bool)

(assert (=> b!1331659 m!1220645))

(check-sat (not b!1331659) (not b!1331652) tp_is_empty!36583 (not start!112502) b_and!49405 (not b!1331654) (not mapNonEmpty!56548) (not b!1331650) (not b!1331651) (not b_lambda!23927) (not b_next!30673))
(check-sat b_and!49405 (not b_next!30673))
