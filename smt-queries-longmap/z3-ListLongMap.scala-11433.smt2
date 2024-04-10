; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133376 () Bool)

(assert start!133376)

(declare-fun b!1559387 () Bool)

(declare-fun res!1066360 () Bool)

(declare-fun e!868876 () Bool)

(assert (=> b!1559387 (=> (not res!1066360) (not e!868876))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103686 0))(
  ( (array!103687 (arr!50037 (Array (_ BitVec 32) (_ BitVec 64))) (size!50587 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103686)

(declare-datatypes ((V!59515 0))(
  ( (V!59516 (val!19324 Int)) )
))
(declare-datatypes ((ValueCell!18210 0))(
  ( (ValueCellFull!18210 (v!22075 V!59515)) (EmptyCell!18210) )
))
(declare-datatypes ((array!103688 0))(
  ( (array!103689 (arr!50038 (Array (_ BitVec 32) ValueCell!18210)) (size!50588 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103688)

(assert (=> b!1559387 (= res!1066360 (and (= (size!50588 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50587 _keys!637) (size!50588 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59091 () Bool)

(declare-fun mapRes!59091 () Bool)

(assert (=> mapIsEmpty!59091 mapRes!59091))

(declare-fun b!1559388 () Bool)

(declare-fun e!868880 () Bool)

(declare-fun tp_is_empty!38481 () Bool)

(assert (=> b!1559388 (= e!868880 tp_is_empty!38481)))

(declare-fun b!1559389 () Bool)

(declare-datatypes ((List!36345 0))(
  ( (Nil!36342) (Cons!36341 (h!37787 (_ BitVec 64)) (t!51078 List!36345)) )
))
(declare-fun noDuplicate!2639 (List!36345) Bool)

(assert (=> b!1559389 (= e!868876 (not (noDuplicate!2639 Nil!36342)))))

(declare-fun b!1559390 () Bool)

(declare-fun e!868877 () Bool)

(assert (=> b!1559390 (= e!868877 tp_is_empty!38481)))

(declare-fun b!1559391 () Bool)

(declare-fun res!1066363 () Bool)

(assert (=> b!1559391 (=> (not res!1066363) (not e!868876))))

(assert (=> b!1559391 (= res!1066363 (and (bvsle #b00000000000000000000000000000000 (size!50587 _keys!637)) (bvslt (size!50587 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun b!1559392 () Bool)

(declare-fun res!1066361 () Bool)

(assert (=> b!1559392 (=> (not res!1066361) (not e!868876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103686 (_ BitVec 32)) Bool)

(assert (=> b!1559392 (= res!1066361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559393 () Bool)

(declare-fun e!868878 () Bool)

(assert (=> b!1559393 (= e!868878 (and e!868877 mapRes!59091))))

(declare-fun condMapEmpty!59091 () Bool)

(declare-fun mapDefault!59091 () ValueCell!18210)

(assert (=> b!1559393 (= condMapEmpty!59091 (= (arr!50038 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18210)) mapDefault!59091)))))

(declare-fun res!1066362 () Bool)

(assert (=> start!133376 (=> (not res!1066362) (not e!868876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133376 (= res!1066362 (validMask!0 mask!947))))

(assert (=> start!133376 e!868876))

(assert (=> start!133376 true))

(declare-fun array_inv!38897 (array!103688) Bool)

(assert (=> start!133376 (and (array_inv!38897 _values!487) e!868878)))

(declare-fun array_inv!38898 (array!103686) Bool)

(assert (=> start!133376 (array_inv!38898 _keys!637)))

(declare-fun mapNonEmpty!59091 () Bool)

(declare-fun tp!112746 () Bool)

(assert (=> mapNonEmpty!59091 (= mapRes!59091 (and tp!112746 e!868880))))

(declare-fun mapRest!59091 () (Array (_ BitVec 32) ValueCell!18210))

(declare-fun mapKey!59091 () (_ BitVec 32))

(declare-fun mapValue!59091 () ValueCell!18210)

(assert (=> mapNonEmpty!59091 (= (arr!50038 _values!487) (store mapRest!59091 mapKey!59091 mapValue!59091))))

(assert (= (and start!133376 res!1066362) b!1559387))

(assert (= (and b!1559387 res!1066360) b!1559392))

(assert (= (and b!1559392 res!1066361) b!1559391))

(assert (= (and b!1559391 res!1066363) b!1559389))

(assert (= (and b!1559393 condMapEmpty!59091) mapIsEmpty!59091))

(assert (= (and b!1559393 (not condMapEmpty!59091)) mapNonEmpty!59091))

(get-info :version)

(assert (= (and mapNonEmpty!59091 ((_ is ValueCellFull!18210) mapValue!59091)) b!1559388))

(assert (= (and b!1559393 ((_ is ValueCellFull!18210) mapDefault!59091)) b!1559390))

(assert (= start!133376 b!1559393))

(declare-fun m!1435647 () Bool)

(assert (=> b!1559389 m!1435647))

(declare-fun m!1435649 () Bool)

(assert (=> b!1559392 m!1435649))

(declare-fun m!1435651 () Bool)

(assert (=> start!133376 m!1435651))

(declare-fun m!1435653 () Bool)

(assert (=> start!133376 m!1435653))

(declare-fun m!1435655 () Bool)

(assert (=> start!133376 m!1435655))

(declare-fun m!1435657 () Bool)

(assert (=> mapNonEmpty!59091 m!1435657))

(check-sat (not b!1559392) (not start!133376) (not mapNonEmpty!59091) tp_is_empty!38481 (not b!1559389))
(check-sat)
(get-model)

(declare-fun d!162923 () Bool)

(declare-fun res!1066380 () Bool)

(declare-fun e!868900 () Bool)

(assert (=> d!162923 (=> res!1066380 e!868900)))

(assert (=> d!162923 (= res!1066380 ((_ is Nil!36342) Nil!36342))))

(assert (=> d!162923 (= (noDuplicate!2639 Nil!36342) e!868900)))

(declare-fun b!1559419 () Bool)

(declare-fun e!868901 () Bool)

(assert (=> b!1559419 (= e!868900 e!868901)))

(declare-fun res!1066381 () Bool)

(assert (=> b!1559419 (=> (not res!1066381) (not e!868901))))

(declare-fun contains!10218 (List!36345 (_ BitVec 64)) Bool)

(assert (=> b!1559419 (= res!1066381 (not (contains!10218 (t!51078 Nil!36342) (h!37787 Nil!36342))))))

(declare-fun b!1559420 () Bool)

(assert (=> b!1559420 (= e!868901 (noDuplicate!2639 (t!51078 Nil!36342)))))

(assert (= (and d!162923 (not res!1066380)) b!1559419))

(assert (= (and b!1559419 res!1066381) b!1559420))

(declare-fun m!1435671 () Bool)

(assert (=> b!1559419 m!1435671))

(declare-fun m!1435673 () Bool)

(assert (=> b!1559420 m!1435673))

(assert (=> b!1559389 d!162923))

(declare-fun d!162925 () Bool)

(assert (=> d!162925 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133376 d!162925))

(declare-fun d!162927 () Bool)

(assert (=> d!162927 (= (array_inv!38897 _values!487) (bvsge (size!50588 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133376 d!162927))

(declare-fun d!162929 () Bool)

(assert (=> d!162929 (= (array_inv!38898 _keys!637) (bvsge (size!50587 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133376 d!162929))

(declare-fun d!162931 () Bool)

(declare-fun res!1066386 () Bool)

(declare-fun e!868910 () Bool)

(assert (=> d!162931 (=> res!1066386 e!868910)))

(assert (=> d!162931 (= res!1066386 (bvsge #b00000000000000000000000000000000 (size!50587 _keys!637)))))

(assert (=> d!162931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!868910)))

(declare-fun b!1559429 () Bool)

(declare-fun e!868908 () Bool)

(declare-fun call!71841 () Bool)

(assert (=> b!1559429 (= e!868908 call!71841)))

(declare-fun b!1559430 () Bool)

(declare-fun e!868909 () Bool)

(assert (=> b!1559430 (= e!868910 e!868909)))

(declare-fun c!144221 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1559430 (= c!144221 (validKeyInArray!0 (select (arr!50037 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1559431 () Bool)

(assert (=> b!1559431 (= e!868909 e!868908)))

(declare-fun lt!670875 () (_ BitVec 64))

(assert (=> b!1559431 (= lt!670875 (select (arr!50037 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51898 0))(
  ( (Unit!51899) )
))
(declare-fun lt!670877 () Unit!51898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103686 (_ BitVec 64) (_ BitVec 32)) Unit!51898)

(assert (=> b!1559431 (= lt!670877 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!670875 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1559431 (arrayContainsKey!0 _keys!637 lt!670875 #b00000000000000000000000000000000)))

(declare-fun lt!670876 () Unit!51898)

(assert (=> b!1559431 (= lt!670876 lt!670877)))

(declare-fun res!1066387 () Bool)

(declare-datatypes ((SeekEntryResult!13519 0))(
  ( (MissingZero!13519 (index!56474 (_ BitVec 32))) (Found!13519 (index!56475 (_ BitVec 32))) (Intermediate!13519 (undefined!14331 Bool) (index!56476 (_ BitVec 32)) (x!139775 (_ BitVec 32))) (Undefined!13519) (MissingVacant!13519 (index!56477 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103686 (_ BitVec 32)) SeekEntryResult!13519)

(assert (=> b!1559431 (= res!1066387 (= (seekEntryOrOpen!0 (select (arr!50037 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13519 #b00000000000000000000000000000000)))))

(assert (=> b!1559431 (=> (not res!1066387) (not e!868908))))

(declare-fun bm!71838 () Bool)

(assert (=> bm!71838 (= call!71841 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1559432 () Bool)

(assert (=> b!1559432 (= e!868909 call!71841)))

(assert (= (and d!162931 (not res!1066386)) b!1559430))

(assert (= (and b!1559430 c!144221) b!1559431))

(assert (= (and b!1559430 (not c!144221)) b!1559432))

(assert (= (and b!1559431 res!1066387) b!1559429))

(assert (= (or b!1559429 b!1559432) bm!71838))

(declare-fun m!1435675 () Bool)

(assert (=> b!1559430 m!1435675))

(assert (=> b!1559430 m!1435675))

(declare-fun m!1435677 () Bool)

(assert (=> b!1559430 m!1435677))

(assert (=> b!1559431 m!1435675))

(declare-fun m!1435679 () Bool)

(assert (=> b!1559431 m!1435679))

(declare-fun m!1435681 () Bool)

(assert (=> b!1559431 m!1435681))

(assert (=> b!1559431 m!1435675))

(declare-fun m!1435683 () Bool)

(assert (=> b!1559431 m!1435683))

(declare-fun m!1435685 () Bool)

(assert (=> bm!71838 m!1435685))

(assert (=> b!1559392 d!162931))

(declare-fun b!1559440 () Bool)

(declare-fun e!868915 () Bool)

(assert (=> b!1559440 (= e!868915 tp_is_empty!38481)))

(declare-fun mapIsEmpty!59097 () Bool)

(declare-fun mapRes!59097 () Bool)

(assert (=> mapIsEmpty!59097 mapRes!59097))

(declare-fun mapNonEmpty!59097 () Bool)

(declare-fun tp!112752 () Bool)

(declare-fun e!868916 () Bool)

(assert (=> mapNonEmpty!59097 (= mapRes!59097 (and tp!112752 e!868916))))

(declare-fun mapKey!59097 () (_ BitVec 32))

(declare-fun mapValue!59097 () ValueCell!18210)

(declare-fun mapRest!59097 () (Array (_ BitVec 32) ValueCell!18210))

(assert (=> mapNonEmpty!59097 (= mapRest!59091 (store mapRest!59097 mapKey!59097 mapValue!59097))))

(declare-fun condMapEmpty!59097 () Bool)

(declare-fun mapDefault!59097 () ValueCell!18210)

(assert (=> mapNonEmpty!59091 (= condMapEmpty!59097 (= mapRest!59091 ((as const (Array (_ BitVec 32) ValueCell!18210)) mapDefault!59097)))))

(assert (=> mapNonEmpty!59091 (= tp!112746 (and e!868915 mapRes!59097))))

(declare-fun b!1559439 () Bool)

(assert (=> b!1559439 (= e!868916 tp_is_empty!38481)))

(assert (= (and mapNonEmpty!59091 condMapEmpty!59097) mapIsEmpty!59097))

(assert (= (and mapNonEmpty!59091 (not condMapEmpty!59097)) mapNonEmpty!59097))

(assert (= (and mapNonEmpty!59097 ((_ is ValueCellFull!18210) mapValue!59097)) b!1559439))

(assert (= (and mapNonEmpty!59091 ((_ is ValueCellFull!18210) mapDefault!59097)) b!1559440))

(declare-fun m!1435687 () Bool)

(assert (=> mapNonEmpty!59097 m!1435687))

(check-sat (not b!1559419) (not bm!71838) (not b!1559431) (not b!1559420) tp_is_empty!38481 (not mapNonEmpty!59097) (not b!1559430))
(check-sat)
