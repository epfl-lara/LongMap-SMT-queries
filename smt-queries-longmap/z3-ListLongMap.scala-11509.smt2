; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133888 () Bool)

(assert start!133888)

(declare-fun b_free!32161 () Bool)

(declare-fun b_next!32161 () Bool)

(assert (=> start!133888 (= b_free!32161 (not b_next!32161))))

(declare-fun tp!113785 () Bool)

(declare-fun b_and!51745 () Bool)

(assert (=> start!133888 (= tp!113785 b_and!51745)))

(declare-fun res!1070129 () Bool)

(declare-fun e!872501 () Bool)

(assert (=> start!133888 (=> (not res!1070129) (not e!872501))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133888 (= res!1070129 (validMask!0 mask!947))))

(assert (=> start!133888 e!872501))

(assert (=> start!133888 tp!113785))

(declare-fun tp_is_empty!38935 () Bool)

(assert (=> start!133888 tp_is_empty!38935))

(assert (=> start!133888 true))

(declare-datatypes ((array!104488 0))(
  ( (array!104489 (arr!50432 (Array (_ BitVec 32) (_ BitVec 64))) (size!50984 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104488)

(declare-fun array_inv!39389 (array!104488) Bool)

(assert (=> start!133888 (array_inv!39389 _keys!637)))

(declare-datatypes ((V!60121 0))(
  ( (V!60122 (val!19551 Int)) )
))
(declare-datatypes ((ValueCell!18437 0))(
  ( (ValueCellFull!18437 (v!22303 V!60121)) (EmptyCell!18437) )
))
(declare-datatypes ((array!104490 0))(
  ( (array!104491 (arr!50433 (Array (_ BitVec 32) ValueCell!18437)) (size!50985 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104490)

(declare-fun e!872500 () Bool)

(declare-fun array_inv!39390 (array!104490) Bool)

(assert (=> start!133888 (and (array_inv!39390 _values!487) e!872500)))

(declare-fun mapNonEmpty!59794 () Bool)

(declare-fun mapRes!59794 () Bool)

(declare-fun tp!113786 () Bool)

(declare-fun e!872503 () Bool)

(assert (=> mapNonEmpty!59794 (= mapRes!59794 (and tp!113786 e!872503))))

(declare-fun mapRest!59794 () (Array (_ BitVec 32) ValueCell!18437))

(declare-fun mapValue!59794 () ValueCell!18437)

(declare-fun mapKey!59794 () (_ BitVec 32))

(assert (=> mapNonEmpty!59794 (= (arr!50433 _values!487) (store mapRest!59794 mapKey!59794 mapValue!59794))))

(declare-fun b!1565382 () Bool)

(declare-fun res!1070132 () Bool)

(assert (=> b!1565382 (=> (not res!1070132) (not e!872501))))

(declare-datatypes ((List!36657 0))(
  ( (Nil!36654) (Cons!36653 (h!38100 (_ BitVec 64)) (t!51524 List!36657)) )
))
(declare-fun arrayNoDuplicates!0 (array!104488 (_ BitVec 32) List!36657) Bool)

(assert (=> b!1565382 (= res!1070132 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36654))))

(declare-fun b!1565383 () Bool)

(declare-fun e!872499 () Bool)

(assert (=> b!1565383 (= e!872500 (and e!872499 mapRes!59794))))

(declare-fun condMapEmpty!59794 () Bool)

(declare-fun mapDefault!59794 () ValueCell!18437)

(assert (=> b!1565383 (= condMapEmpty!59794 (= (arr!50433 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18437)) mapDefault!59794)))))

(declare-fun b!1565384 () Bool)

(assert (=> b!1565384 (= e!872501 (not true))))

(declare-fun lt!672086 () Bool)

(declare-datatypes ((tuple2!25298 0))(
  ( (tuple2!25299 (_1!12660 (_ BitVec 64)) (_2!12660 V!60121)) )
))
(declare-datatypes ((List!36658 0))(
  ( (Nil!36655) (Cons!36654 (h!38101 tuple2!25298) (t!51525 List!36658)) )
))
(declare-datatypes ((ListLongMap!22733 0))(
  ( (ListLongMap!22734 (toList!11382 List!36658)) )
))
(declare-fun lt!672085 () ListLongMap!22733)

(declare-fun contains!10295 (ListLongMap!22733 (_ BitVec 64)) Bool)

(assert (=> b!1565384 (= lt!672086 (contains!10295 lt!672085 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565384 (not (contains!10295 lt!672085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672084 () ListLongMap!22733)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!672087 () V!60121)

(declare-fun +!5103 (ListLongMap!22733 tuple2!25298) ListLongMap!22733)

(assert (=> b!1565384 (= lt!672085 (+!5103 lt!672084 (tuple2!25299 (select (arr!50432 _keys!637) from!782) lt!672087)))))

(declare-datatypes ((Unit!51824 0))(
  ( (Unit!51825) )
))
(declare-fun lt!672088 () Unit!51824)

(declare-fun addStillNotContains!550 (ListLongMap!22733 (_ BitVec 64) V!60121 (_ BitVec 64)) Unit!51824)

(assert (=> b!1565384 (= lt!672088 (addStillNotContains!550 lt!672084 (select (arr!50432 _keys!637) from!782) lt!672087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26340 (ValueCell!18437 V!60121) V!60121)

(declare-fun dynLambda!3879 (Int (_ BitVec 64)) V!60121)

(assert (=> b!1565384 (= lt!672087 (get!26340 (select (arr!50433 _values!487) from!782) (dynLambda!3879 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60121)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60121)

(declare-fun getCurrentListMapNoExtraKeys!6734 (array!104488 array!104490 (_ BitVec 32) (_ BitVec 32) V!60121 V!60121 (_ BitVec 32) Int) ListLongMap!22733)

(assert (=> b!1565384 (= lt!672084 (getCurrentListMapNoExtraKeys!6734 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565385 () Bool)

(declare-fun res!1070134 () Bool)

(assert (=> b!1565385 (=> (not res!1070134) (not e!872501))))

(assert (=> b!1565385 (= res!1070134 (and (= (size!50985 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50984 _keys!637) (size!50985 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565386 () Bool)

(declare-fun res!1070133 () Bool)

(assert (=> b!1565386 (=> (not res!1070133) (not e!872501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104488 (_ BitVec 32)) Bool)

(assert (=> b!1565386 (= res!1070133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565387 () Bool)

(declare-fun res!1070130 () Bool)

(assert (=> b!1565387 (=> (not res!1070130) (not e!872501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565387 (= res!1070130 (validKeyInArray!0 (select (arr!50432 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59794 () Bool)

(assert (=> mapIsEmpty!59794 mapRes!59794))

(declare-fun b!1565388 () Bool)

(assert (=> b!1565388 (= e!872503 tp_is_empty!38935)))

(declare-fun b!1565389 () Bool)

(assert (=> b!1565389 (= e!872499 tp_is_empty!38935)))

(declare-fun b!1565390 () Bool)

(declare-fun res!1070131 () Bool)

(assert (=> b!1565390 (=> (not res!1070131) (not e!872501))))

(assert (=> b!1565390 (= res!1070131 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50984 _keys!637)) (bvslt from!782 (size!50984 _keys!637))))))

(assert (= (and start!133888 res!1070129) b!1565385))

(assert (= (and b!1565385 res!1070134) b!1565386))

(assert (= (and b!1565386 res!1070133) b!1565382))

(assert (= (and b!1565382 res!1070132) b!1565390))

(assert (= (and b!1565390 res!1070131) b!1565387))

(assert (= (and b!1565387 res!1070130) b!1565384))

(assert (= (and b!1565383 condMapEmpty!59794) mapIsEmpty!59794))

(assert (= (and b!1565383 (not condMapEmpty!59794)) mapNonEmpty!59794))

(get-info :version)

(assert (= (and mapNonEmpty!59794 ((_ is ValueCellFull!18437) mapValue!59794)) b!1565388))

(assert (= (and b!1565383 ((_ is ValueCellFull!18437) mapDefault!59794)) b!1565389))

(assert (= start!133888 b!1565383))

(declare-fun b_lambda!24965 () Bool)

(assert (=> (not b_lambda!24965) (not b!1565384)))

(declare-fun t!51523 () Bool)

(declare-fun tb!12621 () Bool)

(assert (=> (and start!133888 (= defaultEntry!495 defaultEntry!495) t!51523) tb!12621))

(declare-fun result!26541 () Bool)

(assert (=> tb!12621 (= result!26541 tp_is_empty!38935)))

(assert (=> b!1565384 t!51523))

(declare-fun b_and!51747 () Bool)

(assert (= b_and!51745 (and (=> t!51523 result!26541) b_and!51747)))

(declare-fun m!1439719 () Bool)

(assert (=> b!1565384 m!1439719))

(declare-fun m!1439721 () Bool)

(assert (=> b!1565384 m!1439721))

(declare-fun m!1439723 () Bool)

(assert (=> b!1565384 m!1439723))

(declare-fun m!1439725 () Bool)

(assert (=> b!1565384 m!1439725))

(assert (=> b!1565384 m!1439719))

(declare-fun m!1439727 () Bool)

(assert (=> b!1565384 m!1439727))

(declare-fun m!1439729 () Bool)

(assert (=> b!1565384 m!1439729))

(assert (=> b!1565384 m!1439721))

(declare-fun m!1439731 () Bool)

(assert (=> b!1565384 m!1439731))

(declare-fun m!1439733 () Bool)

(assert (=> b!1565384 m!1439733))

(assert (=> b!1565384 m!1439727))

(declare-fun m!1439735 () Bool)

(assert (=> b!1565384 m!1439735))

(declare-fun m!1439737 () Bool)

(assert (=> b!1565386 m!1439737))

(declare-fun m!1439739 () Bool)

(assert (=> b!1565382 m!1439739))

(declare-fun m!1439741 () Bool)

(assert (=> start!133888 m!1439741))

(declare-fun m!1439743 () Bool)

(assert (=> start!133888 m!1439743))

(declare-fun m!1439745 () Bool)

(assert (=> start!133888 m!1439745))

(declare-fun m!1439747 () Bool)

(assert (=> mapNonEmpty!59794 m!1439747))

(assert (=> b!1565387 m!1439727))

(assert (=> b!1565387 m!1439727))

(declare-fun m!1439749 () Bool)

(assert (=> b!1565387 m!1439749))

(check-sat (not b!1565387) tp_is_empty!38935 (not b_lambda!24965) (not b!1565386) b_and!51747 (not b!1565384) (not mapNonEmpty!59794) (not start!133888) (not b!1565382) (not b_next!32161))
(check-sat b_and!51747 (not b_next!32161))
