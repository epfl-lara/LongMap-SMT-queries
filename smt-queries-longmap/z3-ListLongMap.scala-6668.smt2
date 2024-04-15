; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83962 () Bool)

(assert start!83962)

(declare-fun b_free!19735 () Bool)

(declare-fun b_next!19735 () Bool)

(assert (=> start!83962 (= b_free!19735 (not b_next!19735))))

(declare-fun tp!68728 () Bool)

(declare-fun b_and!31527 () Bool)

(assert (=> start!83962 (= tp!68728 b_and!31527)))

(declare-fun b!981165 () Bool)

(declare-fun res!656623 () Bool)

(declare-fun e!553115 () Bool)

(assert (=> b!981165 (=> (not res!656623) (not e!553115))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981165 (= res!656623 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36203 () Bool)

(declare-fun mapRes!36203 () Bool)

(assert (=> mapIsEmpty!36203 mapRes!36203))

(declare-fun b!981166 () Bool)

(declare-fun e!553113 () Bool)

(declare-fun tp_is_empty!22783 () Bool)

(assert (=> b!981166 (= e!553113 tp_is_empty!22783)))

(declare-fun b!981167 () Bool)

(declare-fun res!656621 () Bool)

(assert (=> b!981167 (=> (not res!656621) (not e!553115))))

(declare-datatypes ((array!61496 0))(
  ( (array!61497 (arr!29606 (Array (_ BitVec 32) (_ BitVec 64))) (size!30087 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61496)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981167 (= res!656621 (validKeyInArray!0 (select (arr!29606 _keys!1544) from!1932)))))

(declare-fun b!981168 () Bool)

(declare-fun res!656624 () Bool)

(assert (=> b!981168 (=> (not res!656624) (not e!553115))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61496 (_ BitVec 32)) Bool)

(assert (=> b!981168 (= res!656624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981169 () Bool)

(declare-fun res!656626 () Bool)

(assert (=> b!981169 (=> (not res!656626) (not e!553115))))

(assert (=> b!981169 (= res!656626 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30087 _keys!1544))))))

(declare-fun b!981170 () Bool)

(declare-fun e!553116 () Bool)

(assert (=> b!981170 (= e!553115 e!553116)))

(declare-fun res!656622 () Bool)

(assert (=> b!981170 (=> (not res!656622) (not e!553116))))

(assert (=> b!981170 (= res!656622 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29606 _keys!1544) from!1932))))))

(declare-datatypes ((V!35361 0))(
  ( (V!35362 (val!11442 Int)) )
))
(declare-datatypes ((ValueCell!10910 0))(
  ( (ValueCellFull!10910 (v!14003 V!35361)) (EmptyCell!10910) )
))
(declare-datatypes ((array!61498 0))(
  ( (array!61499 (arr!29607 (Array (_ BitVec 32) ValueCell!10910)) (size!30088 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61498)

(declare-fun lt!435459 () V!35361)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15355 (ValueCell!10910 V!35361) V!35361)

(declare-fun dynLambda!1761 (Int (_ BitVec 64)) V!35361)

(assert (=> b!981170 (= lt!435459 (get!15355 (select (arr!29607 _values!1278) from!1932) (dynLambda!1761 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35361)

(declare-fun zeroValue!1220 () V!35361)

(declare-datatypes ((tuple2!14718 0))(
  ( (tuple2!14719 (_1!7370 (_ BitVec 64)) (_2!7370 V!35361)) )
))
(declare-datatypes ((List!20559 0))(
  ( (Nil!20556) (Cons!20555 (h!21717 tuple2!14718) (t!29235 List!20559)) )
))
(declare-datatypes ((ListLongMap!13405 0))(
  ( (ListLongMap!13406 (toList!6718 List!20559)) )
))
(declare-fun lt!435455 () ListLongMap!13405)

(declare-fun getCurrentListMapNoExtraKeys!3431 (array!61496 array!61498 (_ BitVec 32) (_ BitVec 32) V!35361 V!35361 (_ BitVec 32) Int) ListLongMap!13405)

(assert (=> b!981170 (= lt!435455 (getCurrentListMapNoExtraKeys!3431 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36203 () Bool)

(declare-fun tp!68729 () Bool)

(assert (=> mapNonEmpty!36203 (= mapRes!36203 (and tp!68729 e!553113))))

(declare-fun mapRest!36203 () (Array (_ BitVec 32) ValueCell!10910))

(declare-fun mapValue!36203 () ValueCell!10910)

(declare-fun mapKey!36203 () (_ BitVec 32))

(assert (=> mapNonEmpty!36203 (= (arr!29607 _values!1278) (store mapRest!36203 mapKey!36203 mapValue!36203))))

(declare-fun b!981171 () Bool)

(declare-fun e!553114 () Bool)

(declare-fun e!553118 () Bool)

(assert (=> b!981171 (= e!553114 (and e!553118 mapRes!36203))))

(declare-fun condMapEmpty!36203 () Bool)

(declare-fun mapDefault!36203 () ValueCell!10910)

(assert (=> b!981171 (= condMapEmpty!36203 (= (arr!29607 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10910)) mapDefault!36203)))))

(declare-fun b!981172 () Bool)

(assert (=> b!981172 (= e!553116 (not true))))

(declare-fun lt!435458 () tuple2!14718)

(declare-fun lt!435456 () tuple2!14718)

(declare-fun +!3015 (ListLongMap!13405 tuple2!14718) ListLongMap!13405)

(assert (=> b!981172 (= (+!3015 (+!3015 lt!435455 lt!435458) lt!435456) (+!3015 (+!3015 lt!435455 lt!435456) lt!435458))))

(assert (=> b!981172 (= lt!435456 (tuple2!14719 (select (arr!29606 _keys!1544) from!1932) lt!435459))))

(assert (=> b!981172 (= lt!435458 (tuple2!14719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32496 0))(
  ( (Unit!32497) )
))
(declare-fun lt!435457 () Unit!32496)

(declare-fun addCommutativeForDiffKeys!619 (ListLongMap!13405 (_ BitVec 64) V!35361 (_ BitVec 64) V!35361) Unit!32496)

(assert (=> b!981172 (= lt!435457 (addCommutativeForDiffKeys!619 lt!435455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29606 _keys!1544) from!1932) lt!435459))))

(declare-fun b!981174 () Bool)

(assert (=> b!981174 (= e!553118 tp_is_empty!22783)))

(declare-fun b!981175 () Bool)

(declare-fun res!656627 () Bool)

(assert (=> b!981175 (=> (not res!656627) (not e!553115))))

(declare-datatypes ((List!20560 0))(
  ( (Nil!20557) (Cons!20556 (h!21718 (_ BitVec 64)) (t!29236 List!20560)) )
))
(declare-fun arrayNoDuplicates!0 (array!61496 (_ BitVec 32) List!20560) Bool)

(assert (=> b!981175 (= res!656627 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20557))))

(declare-fun b!981173 () Bool)

(declare-fun res!656628 () Bool)

(assert (=> b!981173 (=> (not res!656628) (not e!553115))))

(assert (=> b!981173 (= res!656628 (and (= (size!30088 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30087 _keys!1544) (size!30088 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656625 () Bool)

(assert (=> start!83962 (=> (not res!656625) (not e!553115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83962 (= res!656625 (validMask!0 mask!1948))))

(assert (=> start!83962 e!553115))

(assert (=> start!83962 true))

(assert (=> start!83962 tp_is_empty!22783))

(declare-fun array_inv!22909 (array!61498) Bool)

(assert (=> start!83962 (and (array_inv!22909 _values!1278) e!553114)))

(assert (=> start!83962 tp!68728))

(declare-fun array_inv!22910 (array!61496) Bool)

(assert (=> start!83962 (array_inv!22910 _keys!1544)))

(assert (= (and start!83962 res!656625) b!981173))

(assert (= (and b!981173 res!656628) b!981168))

(assert (= (and b!981168 res!656624) b!981175))

(assert (= (and b!981175 res!656627) b!981169))

(assert (= (and b!981169 res!656626) b!981167))

(assert (= (and b!981167 res!656621) b!981165))

(assert (= (and b!981165 res!656623) b!981170))

(assert (= (and b!981170 res!656622) b!981172))

(assert (= (and b!981171 condMapEmpty!36203) mapIsEmpty!36203))

(assert (= (and b!981171 (not condMapEmpty!36203)) mapNonEmpty!36203))

(get-info :version)

(assert (= (and mapNonEmpty!36203 ((_ is ValueCellFull!10910) mapValue!36203)) b!981166))

(assert (= (and b!981171 ((_ is ValueCellFull!10910) mapDefault!36203)) b!981174))

(assert (= start!83962 b!981171))

(declare-fun b_lambda!14755 () Bool)

(assert (=> (not b_lambda!14755) (not b!981170)))

(declare-fun t!29234 () Bool)

(declare-fun tb!6527 () Bool)

(assert (=> (and start!83962 (= defaultEntry!1281 defaultEntry!1281) t!29234) tb!6527))

(declare-fun result!13051 () Bool)

(assert (=> tb!6527 (= result!13051 tp_is_empty!22783)))

(assert (=> b!981170 t!29234))

(declare-fun b_and!31529 () Bool)

(assert (= b_and!31527 (and (=> t!29234 result!13051) b_and!31529)))

(declare-fun m!908015 () Bool)

(assert (=> b!981167 m!908015))

(assert (=> b!981167 m!908015))

(declare-fun m!908017 () Bool)

(assert (=> b!981167 m!908017))

(declare-fun m!908019 () Bool)

(assert (=> start!83962 m!908019))

(declare-fun m!908021 () Bool)

(assert (=> start!83962 m!908021))

(declare-fun m!908023 () Bool)

(assert (=> start!83962 m!908023))

(declare-fun m!908025 () Bool)

(assert (=> b!981168 m!908025))

(declare-fun m!908027 () Bool)

(assert (=> b!981175 m!908027))

(declare-fun m!908029 () Bool)

(assert (=> b!981172 m!908029))

(declare-fun m!908031 () Bool)

(assert (=> b!981172 m!908031))

(assert (=> b!981172 m!908015))

(declare-fun m!908033 () Bool)

(assert (=> b!981172 m!908033))

(declare-fun m!908035 () Bool)

(assert (=> b!981172 m!908035))

(assert (=> b!981172 m!908029))

(assert (=> b!981172 m!908033))

(assert (=> b!981172 m!908015))

(declare-fun m!908037 () Bool)

(assert (=> b!981172 m!908037))

(declare-fun m!908039 () Bool)

(assert (=> mapNonEmpty!36203 m!908039))

(assert (=> b!981170 m!908015))

(declare-fun m!908041 () Bool)

(assert (=> b!981170 m!908041))

(declare-fun m!908043 () Bool)

(assert (=> b!981170 m!908043))

(declare-fun m!908045 () Bool)

(assert (=> b!981170 m!908045))

(assert (=> b!981170 m!908041))

(assert (=> b!981170 m!908045))

(declare-fun m!908047 () Bool)

(assert (=> b!981170 m!908047))

(check-sat tp_is_empty!22783 (not b!981172) b_and!31529 (not b_next!19735) (not b!981167) (not b!981168) (not b!981170) (not mapNonEmpty!36203) (not b_lambda!14755) (not start!83962) (not b!981175))
(check-sat b_and!31529 (not b_next!19735))
