; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134012 () Bool)

(assert start!134012)

(declare-fun b_free!32017 () Bool)

(declare-fun b_next!32017 () Bool)

(assert (=> start!134012 (= b_free!32017 (not b_next!32017))))

(declare-fun tp!113175 () Bool)

(declare-fun b_and!51547 () Bool)

(assert (=> start!134012 (= tp!113175 b_and!51547)))

(declare-fun b!1564467 () Bool)

(declare-fun res!1068858 () Bool)

(declare-fun e!871969 () Bool)

(assert (=> b!1564467 (=> (not res!1068858) (not e!871969))))

(declare-datatypes ((array!104198 0))(
  ( (array!104199 (arr!50284 (Array (_ BitVec 32) (_ BitVec 64))) (size!50835 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104198)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104198 (_ BitVec 32)) Bool)

(assert (=> b!1564467 (= res!1068858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564468 () Bool)

(declare-fun res!1068856 () Bool)

(assert (=> b!1564468 (=> (not res!1068856) (not e!871969))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564468 (= res!1068856 (validKeyInArray!0 (select (arr!50284 _keys!637) from!782)))))

(declare-fun b!1564469 () Bool)

(declare-fun res!1068860 () Bool)

(assert (=> b!1564469 (=> (not res!1068860) (not e!871969))))

(declare-datatypes ((List!36497 0))(
  ( (Nil!36494) (Cons!36493 (h!37957 (_ BitVec 64)) (t!51296 List!36497)) )
))
(declare-fun arrayNoDuplicates!0 (array!104198 (_ BitVec 32) List!36497) Bool)

(assert (=> b!1564469 (= res!1068860 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36494))))

(declare-fun b!1564470 () Bool)

(declare-fun res!1068855 () Bool)

(assert (=> b!1564470 (=> (not res!1068855) (not e!871969))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59785 0))(
  ( (V!59786 (val!19425 Int)) )
))
(declare-datatypes ((ValueCell!18311 0))(
  ( (ValueCellFull!18311 (v!22169 V!59785)) (EmptyCell!18311) )
))
(declare-datatypes ((array!104200 0))(
  ( (array!104201 (arr!50285 (Array (_ BitVec 32) ValueCell!18311)) (size!50836 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104200)

(assert (=> b!1564470 (= res!1068855 (and (= (size!50836 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50835 _keys!637) (size!50836 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564471 () Bool)

(assert (=> b!1564471 (= e!871969 (not true))))

(declare-fun lt!672361 () Bool)

(declare-datatypes ((tuple2!25158 0))(
  ( (tuple2!25159 (_1!12590 (_ BitVec 64)) (_2!12590 V!59785)) )
))
(declare-datatypes ((List!36498 0))(
  ( (Nil!36495) (Cons!36494 (h!37958 tuple2!25158) (t!51297 List!36498)) )
))
(declare-datatypes ((ListLongMap!22601 0))(
  ( (ListLongMap!22602 (toList!11316 List!36498)) )
))
(declare-fun lt!672358 () ListLongMap!22601)

(declare-fun contains!10317 (ListLongMap!22601 (_ BitVec 64)) Bool)

(assert (=> b!1564471 (= lt!672361 (contains!10317 lt!672358 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564471 (not (contains!10317 lt!672358 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672362 () ListLongMap!22601)

(declare-fun lt!672359 () V!59785)

(declare-fun +!5092 (ListLongMap!22601 tuple2!25158) ListLongMap!22601)

(assert (=> b!1564471 (= lt!672358 (+!5092 lt!672362 (tuple2!25159 (select (arr!50284 _keys!637) from!782) lt!672359)))))

(declare-datatypes ((Unit!51869 0))(
  ( (Unit!51870) )
))
(declare-fun lt!672360 () Unit!51869)

(declare-fun addStillNotContains!543 (ListLongMap!22601 (_ BitVec 64) V!59785 (_ BitVec 64)) Unit!51869)

(assert (=> b!1564471 (= lt!672360 (addStillNotContains!543 lt!672362 (select (arr!50284 _keys!637) from!782) lt!672359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26276 (ValueCell!18311 V!59785) V!59785)

(declare-fun dynLambda!3890 (Int (_ BitVec 64)) V!59785)

(assert (=> b!1564471 (= lt!672359 (get!26276 (select (arr!50285 _values!487) from!782) (dynLambda!3890 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59785)

(declare-fun minValue!453 () V!59785)

(declare-fun getCurrentListMapNoExtraKeys!6715 (array!104198 array!104200 (_ BitVec 32) (_ BitVec 32) V!59785 V!59785 (_ BitVec 32) Int) ListLongMap!22601)

(assert (=> b!1564471 (= lt!672362 (getCurrentListMapNoExtraKeys!6715 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564472 () Bool)

(declare-fun e!871970 () Bool)

(declare-fun tp_is_empty!38683 () Bool)

(assert (=> b!1564472 (= e!871970 tp_is_empty!38683)))

(declare-fun mapNonEmpty!59400 () Bool)

(declare-fun mapRes!59400 () Bool)

(declare-fun tp!113174 () Bool)

(assert (=> mapNonEmpty!59400 (= mapRes!59400 (and tp!113174 e!871970))))

(declare-fun mapKey!59400 () (_ BitVec 32))

(declare-fun mapValue!59400 () ValueCell!18311)

(declare-fun mapRest!59400 () (Array (_ BitVec 32) ValueCell!18311))

(assert (=> mapNonEmpty!59400 (= (arr!50285 _values!487) (store mapRest!59400 mapKey!59400 mapValue!59400))))

(declare-fun res!1068857 () Bool)

(assert (=> start!134012 (=> (not res!1068857) (not e!871969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134012 (= res!1068857 (validMask!0 mask!947))))

(assert (=> start!134012 e!871969))

(assert (=> start!134012 tp!113175))

(assert (=> start!134012 tp_is_empty!38683))

(assert (=> start!134012 true))

(declare-fun array_inv!39333 (array!104198) Bool)

(assert (=> start!134012 (array_inv!39333 _keys!637)))

(declare-fun e!871971 () Bool)

(declare-fun array_inv!39334 (array!104200) Bool)

(assert (=> start!134012 (and (array_inv!39334 _values!487) e!871971)))

(declare-fun mapIsEmpty!59400 () Bool)

(assert (=> mapIsEmpty!59400 mapRes!59400))

(declare-fun b!1564473 () Bool)

(declare-fun res!1068859 () Bool)

(assert (=> b!1564473 (=> (not res!1068859) (not e!871969))))

(assert (=> b!1564473 (= res!1068859 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50835 _keys!637)) (bvslt from!782 (size!50835 _keys!637))))))

(declare-fun b!1564474 () Bool)

(declare-fun e!871972 () Bool)

(assert (=> b!1564474 (= e!871972 tp_is_empty!38683)))

(declare-fun b!1564475 () Bool)

(assert (=> b!1564475 (= e!871971 (and e!871972 mapRes!59400))))

(declare-fun condMapEmpty!59400 () Bool)

(declare-fun mapDefault!59400 () ValueCell!18311)

(assert (=> b!1564475 (= condMapEmpty!59400 (= (arr!50285 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18311)) mapDefault!59400)))))

(assert (= (and start!134012 res!1068857) b!1564470))

(assert (= (and b!1564470 res!1068855) b!1564467))

(assert (= (and b!1564467 res!1068858) b!1564469))

(assert (= (and b!1564469 res!1068860) b!1564473))

(assert (= (and b!1564473 res!1068859) b!1564468))

(assert (= (and b!1564468 res!1068856) b!1564471))

(assert (= (and b!1564475 condMapEmpty!59400) mapIsEmpty!59400))

(assert (= (and b!1564475 (not condMapEmpty!59400)) mapNonEmpty!59400))

(get-info :version)

(assert (= (and mapNonEmpty!59400 ((_ is ValueCellFull!18311) mapValue!59400)) b!1564472))

(assert (= (and b!1564475 ((_ is ValueCellFull!18311) mapDefault!59400)) b!1564474))

(assert (= start!134012 b!1564475))

(declare-fun b_lambda!24885 () Bool)

(assert (=> (not b_lambda!24885) (not b!1564471)))

(declare-fun t!51295 () Bool)

(declare-fun tb!12553 () Bool)

(assert (=> (and start!134012 (= defaultEntry!495 defaultEntry!495) t!51295) tb!12553))

(declare-fun result!26395 () Bool)

(assert (=> tb!12553 (= result!26395 tp_is_empty!38683)))

(assert (=> b!1564471 t!51295))

(declare-fun b_and!51549 () Bool)

(assert (= b_and!51547 (and (=> t!51295 result!26395) b_and!51549)))

(declare-fun m!1440003 () Bool)

(assert (=> b!1564467 m!1440003))

(declare-fun m!1440005 () Bool)

(assert (=> start!134012 m!1440005))

(declare-fun m!1440007 () Bool)

(assert (=> start!134012 m!1440007))

(declare-fun m!1440009 () Bool)

(assert (=> start!134012 m!1440009))

(declare-fun m!1440011 () Bool)

(assert (=> b!1564469 m!1440011))

(declare-fun m!1440013 () Bool)

(assert (=> mapNonEmpty!59400 m!1440013))

(declare-fun m!1440015 () Bool)

(assert (=> b!1564468 m!1440015))

(assert (=> b!1564468 m!1440015))

(declare-fun m!1440017 () Bool)

(assert (=> b!1564468 m!1440017))

(declare-fun m!1440019 () Bool)

(assert (=> b!1564471 m!1440019))

(declare-fun m!1440021 () Bool)

(assert (=> b!1564471 m!1440021))

(declare-fun m!1440023 () Bool)

(assert (=> b!1564471 m!1440023))

(declare-fun m!1440025 () Bool)

(assert (=> b!1564471 m!1440025))

(declare-fun m!1440027 () Bool)

(assert (=> b!1564471 m!1440027))

(assert (=> b!1564471 m!1440019))

(assert (=> b!1564471 m!1440015))

(assert (=> b!1564471 m!1440015))

(declare-fun m!1440029 () Bool)

(assert (=> b!1564471 m!1440029))

(assert (=> b!1564471 m!1440021))

(declare-fun m!1440031 () Bool)

(assert (=> b!1564471 m!1440031))

(declare-fun m!1440033 () Bool)

(assert (=> b!1564471 m!1440033))

(check-sat (not b_next!32017) (not b!1564467) (not b!1564471) (not start!134012) (not b_lambda!24885) (not mapNonEmpty!59400) (not b!1564468) (not b!1564469) b_and!51549 tp_is_empty!38683)
(check-sat b_and!51549 (not b_next!32017))
