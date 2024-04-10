; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133626 () Bool)

(assert start!133626)

(declare-fun b_free!32043 () Bool)

(declare-fun b_next!32043 () Bool)

(assert (=> start!133626 (= b_free!32043 (not b_next!32043))))

(declare-fun tp!113253 () Bool)

(declare-fun b_and!51597 () Bool)

(assert (=> start!133626 (= tp!113253 b_and!51597)))

(declare-fun b!1562408 () Bool)

(declare-fun res!1068230 () Bool)

(declare-fun e!870656 () Bool)

(assert (=> b!1562408 (=> (not res!1068230) (not e!870656))))

(declare-datatypes ((array!104134 0))(
  ( (array!104135 (arr!50259 (Array (_ BitVec 32) (_ BitVec 64))) (size!50809 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104134)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562408 (= res!1068230 (validKeyInArray!0 (select (arr!50259 _keys!637) from!782)))))

(declare-fun b!1562409 () Bool)

(declare-fun e!870654 () Bool)

(declare-fun tp_is_empty!38709 () Bool)

(assert (=> b!1562409 (= e!870654 tp_is_empty!38709)))

(declare-fun b!1562410 () Bool)

(declare-fun res!1068231 () Bool)

(assert (=> b!1562410 (=> (not res!1068231) (not e!870656))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59819 0))(
  ( (V!59820 (val!19438 Int)) )
))
(declare-datatypes ((ValueCell!18324 0))(
  ( (ValueCellFull!18324 (v!22190 V!59819)) (EmptyCell!18324) )
))
(declare-datatypes ((array!104136 0))(
  ( (array!104137 (arr!50260 (Array (_ BitVec 32) ValueCell!18324)) (size!50810 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104136)

(assert (=> b!1562410 (= res!1068231 (and (= (size!50810 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50809 _keys!637) (size!50810 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562411 () Bool)

(declare-fun e!870657 () Bool)

(declare-fun mapRes!59439 () Bool)

(assert (=> b!1562411 (= e!870657 (and e!870654 mapRes!59439))))

(declare-fun condMapEmpty!59439 () Bool)

(declare-fun mapDefault!59439 () ValueCell!18324)

(assert (=> b!1562411 (= condMapEmpty!59439 (= (arr!50260 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18324)) mapDefault!59439)))))

(declare-fun b!1562412 () Bool)

(assert (=> b!1562412 (= e!870656 (not true))))

(declare-fun lt!671647 () Bool)

(declare-datatypes ((tuple2!25110 0))(
  ( (tuple2!25111 (_1!12566 (_ BitVec 64)) (_2!12566 V!59819)) )
))
(declare-datatypes ((List!36482 0))(
  ( (Nil!36479) (Cons!36478 (h!37924 tuple2!25110) (t!51315 List!36482)) )
))
(declare-datatypes ((ListLongMap!22545 0))(
  ( (ListLongMap!22546 (toList!11288 List!36482)) )
))
(declare-fun lt!671649 () ListLongMap!22545)

(declare-fun contains!10278 (ListLongMap!22545 (_ BitVec 64)) Bool)

(assert (=> b!1562412 (= lt!671647 (contains!10278 lt!671649 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562412 (not (contains!10278 lt!671649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671645 () V!59819)

(declare-fun lt!671648 () ListLongMap!22545)

(declare-fun +!5058 (ListLongMap!22545 tuple2!25110) ListLongMap!22545)

(assert (=> b!1562412 (= lt!671649 (+!5058 lt!671648 (tuple2!25111 (select (arr!50259 _keys!637) from!782) lt!671645)))))

(declare-datatypes ((Unit!51970 0))(
  ( (Unit!51971) )
))
(declare-fun lt!671646 () Unit!51970)

(declare-fun addStillNotContains!548 (ListLongMap!22545 (_ BitVec 64) V!59819 (_ BitVec 64)) Unit!51970)

(assert (=> b!1562412 (= lt!671646 (addStillNotContains!548 lt!671648 (select (arr!50259 _keys!637) from!782) lt!671645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26249 (ValueCell!18324 V!59819) V!59819)

(declare-fun dynLambda!3842 (Int (_ BitVec 64)) V!59819)

(assert (=> b!1562412 (= lt!671645 (get!26249 (select (arr!50260 _values!487) from!782) (dynLambda!3842 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59819)

(declare-fun minValue!453 () V!59819)

(declare-fun getCurrentListMapNoExtraKeys!6672 (array!104134 array!104136 (_ BitVec 32) (_ BitVec 32) V!59819 V!59819 (_ BitVec 32) Int) ListLongMap!22545)

(assert (=> b!1562412 (= lt!671648 (getCurrentListMapNoExtraKeys!6672 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1068232 () Bool)

(assert (=> start!133626 (=> (not res!1068232) (not e!870656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133626 (= res!1068232 (validMask!0 mask!947))))

(assert (=> start!133626 e!870656))

(assert (=> start!133626 tp!113253))

(assert (=> start!133626 tp_is_empty!38709))

(assert (=> start!133626 true))

(declare-fun array_inv!39063 (array!104134) Bool)

(assert (=> start!133626 (array_inv!39063 _keys!637)))

(declare-fun array_inv!39064 (array!104136) Bool)

(assert (=> start!133626 (and (array_inv!39064 _values!487) e!870657)))

(declare-fun mapNonEmpty!59439 () Bool)

(declare-fun tp!113252 () Bool)

(declare-fun e!870658 () Bool)

(assert (=> mapNonEmpty!59439 (= mapRes!59439 (and tp!113252 e!870658))))

(declare-fun mapValue!59439 () ValueCell!18324)

(declare-fun mapKey!59439 () (_ BitVec 32))

(declare-fun mapRest!59439 () (Array (_ BitVec 32) ValueCell!18324))

(assert (=> mapNonEmpty!59439 (= (arr!50260 _values!487) (store mapRest!59439 mapKey!59439 mapValue!59439))))

(declare-fun b!1562413 () Bool)

(assert (=> b!1562413 (= e!870658 tp_is_empty!38709)))

(declare-fun mapIsEmpty!59439 () Bool)

(assert (=> mapIsEmpty!59439 mapRes!59439))

(declare-fun b!1562414 () Bool)

(declare-fun res!1068229 () Bool)

(assert (=> b!1562414 (=> (not res!1068229) (not e!870656))))

(declare-datatypes ((List!36483 0))(
  ( (Nil!36480) (Cons!36479 (h!37925 (_ BitVec 64)) (t!51316 List!36483)) )
))
(declare-fun arrayNoDuplicates!0 (array!104134 (_ BitVec 32) List!36483) Bool)

(assert (=> b!1562414 (= res!1068229 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36480))))

(declare-fun b!1562415 () Bool)

(declare-fun res!1068233 () Bool)

(assert (=> b!1562415 (=> (not res!1068233) (not e!870656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104134 (_ BitVec 32)) Bool)

(assert (=> b!1562415 (= res!1068233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562416 () Bool)

(declare-fun res!1068234 () Bool)

(assert (=> b!1562416 (=> (not res!1068234) (not e!870656))))

(assert (=> b!1562416 (= res!1068234 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50809 _keys!637)) (bvslt from!782 (size!50809 _keys!637))))))

(assert (= (and start!133626 res!1068232) b!1562410))

(assert (= (and b!1562410 res!1068231) b!1562415))

(assert (= (and b!1562415 res!1068233) b!1562414))

(assert (= (and b!1562414 res!1068229) b!1562416))

(assert (= (and b!1562416 res!1068234) b!1562408))

(assert (= (and b!1562408 res!1068230) b!1562412))

(assert (= (and b!1562411 condMapEmpty!59439) mapIsEmpty!59439))

(assert (= (and b!1562411 (not condMapEmpty!59439)) mapNonEmpty!59439))

(get-info :version)

(assert (= (and mapNonEmpty!59439 ((_ is ValueCellFull!18324) mapValue!59439)) b!1562413))

(assert (= (and b!1562411 ((_ is ValueCellFull!18324) mapDefault!59439)) b!1562409))

(assert (= start!133626 b!1562411))

(declare-fun b_lambda!24917 () Bool)

(assert (=> (not b_lambda!24917) (not b!1562412)))

(declare-fun t!51314 () Bool)

(declare-fun tb!12587 () Bool)

(assert (=> (and start!133626 (= defaultEntry!495 defaultEntry!495) t!51314) tb!12587))

(declare-fun result!26455 () Bool)

(assert (=> tb!12587 (= result!26455 tp_is_empty!38709)))

(assert (=> b!1562412 t!51314))

(declare-fun b_and!51599 () Bool)

(assert (= b_and!51597 (and (=> t!51314 result!26455) b_and!51599)))

(declare-fun m!1438161 () Bool)

(assert (=> mapNonEmpty!59439 m!1438161))

(declare-fun m!1438163 () Bool)

(assert (=> b!1562412 m!1438163))

(declare-fun m!1438165 () Bool)

(assert (=> b!1562412 m!1438165))

(declare-fun m!1438167 () Bool)

(assert (=> b!1562412 m!1438167))

(declare-fun m!1438169 () Bool)

(assert (=> b!1562412 m!1438169))

(declare-fun m!1438171 () Bool)

(assert (=> b!1562412 m!1438171))

(assert (=> b!1562412 m!1438163))

(declare-fun m!1438173 () Bool)

(assert (=> b!1562412 m!1438173))

(declare-fun m!1438175 () Bool)

(assert (=> b!1562412 m!1438175))

(assert (=> b!1562412 m!1438169))

(assert (=> b!1562412 m!1438165))

(declare-fun m!1438177 () Bool)

(assert (=> b!1562412 m!1438177))

(declare-fun m!1438179 () Bool)

(assert (=> b!1562412 m!1438179))

(declare-fun m!1438181 () Bool)

(assert (=> b!1562414 m!1438181))

(declare-fun m!1438183 () Bool)

(assert (=> start!133626 m!1438183))

(declare-fun m!1438185 () Bool)

(assert (=> start!133626 m!1438185))

(declare-fun m!1438187 () Bool)

(assert (=> start!133626 m!1438187))

(assert (=> b!1562408 m!1438169))

(assert (=> b!1562408 m!1438169))

(declare-fun m!1438189 () Bool)

(assert (=> b!1562408 m!1438189))

(declare-fun m!1438191 () Bool)

(assert (=> b!1562415 m!1438191))

(check-sat (not b!1562408) (not b_lambda!24917) (not b!1562412) (not start!133626) tp_is_empty!38709 (not b!1562414) b_and!51599 (not b_next!32043) (not mapNonEmpty!59439) (not b!1562415))
(check-sat b_and!51599 (not b_next!32043))
