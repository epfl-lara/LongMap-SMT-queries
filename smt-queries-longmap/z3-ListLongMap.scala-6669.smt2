; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83968 () Bool)

(assert start!83968)

(declare-fun b_free!19741 () Bool)

(declare-fun b_next!19741 () Bool)

(assert (=> start!83968 (= b_free!19741 (not b_next!19741))))

(declare-fun tp!68747 () Bool)

(declare-fun b_and!31539 () Bool)

(assert (=> start!83968 (= tp!68747 b_and!31539)))

(declare-fun b!981270 () Bool)

(declare-fun e!553167 () Bool)

(declare-fun tp_is_empty!22789 () Bool)

(assert (=> b!981270 (= e!553167 tp_is_empty!22789)))

(declare-fun b!981271 () Bool)

(declare-fun e!553170 () Bool)

(declare-fun e!553169 () Bool)

(assert (=> b!981271 (= e!553170 e!553169)))

(declare-fun res!656696 () Bool)

(assert (=> b!981271 (=> (not res!656696) (not e!553169))))

(declare-datatypes ((array!61508 0))(
  ( (array!61509 (arr!29612 (Array (_ BitVec 32) (_ BitVec 64))) (size!30093 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61508)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981271 (= res!656696 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29612 _keys!1544) from!1932))))))

(declare-datatypes ((V!35369 0))(
  ( (V!35370 (val!11445 Int)) )
))
(declare-datatypes ((ValueCell!10913 0))(
  ( (ValueCellFull!10913 (v!14006 V!35369)) (EmptyCell!10913) )
))
(declare-datatypes ((array!61510 0))(
  ( (array!61511 (arr!29613 (Array (_ BitVec 32) ValueCell!10913)) (size!30094 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61510)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!435502 () V!35369)

(declare-fun get!15359 (ValueCell!10913 V!35369) V!35369)

(declare-fun dynLambda!1763 (Int (_ BitVec 64)) V!35369)

(assert (=> b!981271 (= lt!435502 (get!15359 (select (arr!29613 _values!1278) from!1932) (dynLambda!1763 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35369)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14722 0))(
  ( (tuple2!14723 (_1!7372 (_ BitVec 64)) (_2!7372 V!35369)) )
))
(declare-datatypes ((List!20563 0))(
  ( (Nil!20560) (Cons!20559 (h!21721 tuple2!14722) (t!29245 List!20563)) )
))
(declare-datatypes ((ListLongMap!13409 0))(
  ( (ListLongMap!13410 (toList!6720 List!20563)) )
))
(declare-fun lt!435501 () ListLongMap!13409)

(declare-fun zeroValue!1220 () V!35369)

(declare-fun getCurrentListMapNoExtraKeys!3433 (array!61508 array!61510 (_ BitVec 32) (_ BitVec 32) V!35369 V!35369 (_ BitVec 32) Int) ListLongMap!13409)

(assert (=> b!981271 (= lt!435501 (getCurrentListMapNoExtraKeys!3433 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36212 () Bool)

(declare-fun mapRes!36212 () Bool)

(declare-fun tp!68746 () Bool)

(declare-fun e!553171 () Bool)

(assert (=> mapNonEmpty!36212 (= mapRes!36212 (and tp!68746 e!553171))))

(declare-fun mapKey!36212 () (_ BitVec 32))

(declare-fun mapValue!36212 () ValueCell!10913)

(declare-fun mapRest!36212 () (Array (_ BitVec 32) ValueCell!10913))

(assert (=> mapNonEmpty!36212 (= (arr!29613 _values!1278) (store mapRest!36212 mapKey!36212 mapValue!36212))))

(declare-fun b!981272 () Bool)

(assert (=> b!981272 (= e!553169 (not true))))

(declare-fun lt!435503 () tuple2!14722)

(declare-fun lt!435500 () tuple2!14722)

(declare-fun +!3017 (ListLongMap!13409 tuple2!14722) ListLongMap!13409)

(assert (=> b!981272 (= (+!3017 (+!3017 lt!435501 lt!435503) lt!435500) (+!3017 (+!3017 lt!435501 lt!435500) lt!435503))))

(assert (=> b!981272 (= lt!435500 (tuple2!14723 (select (arr!29612 _keys!1544) from!1932) lt!435502))))

(assert (=> b!981272 (= lt!435503 (tuple2!14723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32500 0))(
  ( (Unit!32501) )
))
(declare-fun lt!435504 () Unit!32500)

(declare-fun addCommutativeForDiffKeys!621 (ListLongMap!13409 (_ BitVec 64) V!35369 (_ BitVec 64) V!35369) Unit!32500)

(assert (=> b!981272 (= lt!435504 (addCommutativeForDiffKeys!621 lt!435501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29612 _keys!1544) from!1932) lt!435502))))

(declare-fun b!981273 () Bool)

(declare-fun res!656700 () Bool)

(assert (=> b!981273 (=> (not res!656700) (not e!553170))))

(assert (=> b!981273 (= res!656700 (and (= (size!30094 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30093 _keys!1544) (size!30094 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981274 () Bool)

(assert (=> b!981274 (= e!553171 tp_is_empty!22789)))

(declare-fun b!981275 () Bool)

(declare-fun res!656697 () Bool)

(assert (=> b!981275 (=> (not res!656697) (not e!553170))))

(assert (=> b!981275 (= res!656697 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36212 () Bool)

(assert (=> mapIsEmpty!36212 mapRes!36212))

(declare-fun b!981276 () Bool)

(declare-fun res!656693 () Bool)

(assert (=> b!981276 (=> (not res!656693) (not e!553170))))

(assert (=> b!981276 (= res!656693 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30093 _keys!1544))))))

(declare-fun b!981277 () Bool)

(declare-fun res!656695 () Bool)

(assert (=> b!981277 (=> (not res!656695) (not e!553170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61508 (_ BitVec 32)) Bool)

(assert (=> b!981277 (= res!656695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656699 () Bool)

(assert (=> start!83968 (=> (not res!656699) (not e!553170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83968 (= res!656699 (validMask!0 mask!1948))))

(assert (=> start!83968 e!553170))

(assert (=> start!83968 true))

(assert (=> start!83968 tp_is_empty!22789))

(declare-fun e!553172 () Bool)

(declare-fun array_inv!22915 (array!61510) Bool)

(assert (=> start!83968 (and (array_inv!22915 _values!1278) e!553172)))

(assert (=> start!83968 tp!68747))

(declare-fun array_inv!22916 (array!61508) Bool)

(assert (=> start!83968 (array_inv!22916 _keys!1544)))

(declare-fun b!981278 () Bool)

(declare-fun res!656694 () Bool)

(assert (=> b!981278 (=> (not res!656694) (not e!553170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981278 (= res!656694 (validKeyInArray!0 (select (arr!29612 _keys!1544) from!1932)))))

(declare-fun b!981279 () Bool)

(assert (=> b!981279 (= e!553172 (and e!553167 mapRes!36212))))

(declare-fun condMapEmpty!36212 () Bool)

(declare-fun mapDefault!36212 () ValueCell!10913)

(assert (=> b!981279 (= condMapEmpty!36212 (= (arr!29613 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10913)) mapDefault!36212)))))

(declare-fun b!981280 () Bool)

(declare-fun res!656698 () Bool)

(assert (=> b!981280 (=> (not res!656698) (not e!553170))))

(declare-datatypes ((List!20564 0))(
  ( (Nil!20561) (Cons!20560 (h!21722 (_ BitVec 64)) (t!29246 List!20564)) )
))
(declare-fun arrayNoDuplicates!0 (array!61508 (_ BitVec 32) List!20564) Bool)

(assert (=> b!981280 (= res!656698 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20561))))

(assert (= (and start!83968 res!656699) b!981273))

(assert (= (and b!981273 res!656700) b!981277))

(assert (= (and b!981277 res!656695) b!981280))

(assert (= (and b!981280 res!656698) b!981276))

(assert (= (and b!981276 res!656693) b!981278))

(assert (= (and b!981278 res!656694) b!981275))

(assert (= (and b!981275 res!656697) b!981271))

(assert (= (and b!981271 res!656696) b!981272))

(assert (= (and b!981279 condMapEmpty!36212) mapIsEmpty!36212))

(assert (= (and b!981279 (not condMapEmpty!36212)) mapNonEmpty!36212))

(get-info :version)

(assert (= (and mapNonEmpty!36212 ((_ is ValueCellFull!10913) mapValue!36212)) b!981274))

(assert (= (and b!981279 ((_ is ValueCellFull!10913) mapDefault!36212)) b!981270))

(assert (= start!83968 b!981279))

(declare-fun b_lambda!14761 () Bool)

(assert (=> (not b_lambda!14761) (not b!981271)))

(declare-fun t!29244 () Bool)

(declare-fun tb!6533 () Bool)

(assert (=> (and start!83968 (= defaultEntry!1281 defaultEntry!1281) t!29244) tb!6533))

(declare-fun result!13063 () Bool)

(assert (=> tb!6533 (= result!13063 tp_is_empty!22789)))

(assert (=> b!981271 t!29244))

(declare-fun b_and!31541 () Bool)

(assert (= b_and!31539 (and (=> t!29244 result!13063) b_and!31541)))

(declare-fun m!908117 () Bool)

(assert (=> b!981280 m!908117))

(declare-fun m!908119 () Bool)

(assert (=> start!83968 m!908119))

(declare-fun m!908121 () Bool)

(assert (=> start!83968 m!908121))

(declare-fun m!908123 () Bool)

(assert (=> start!83968 m!908123))

(declare-fun m!908125 () Bool)

(assert (=> mapNonEmpty!36212 m!908125))

(declare-fun m!908127 () Bool)

(assert (=> b!981278 m!908127))

(assert (=> b!981278 m!908127))

(declare-fun m!908129 () Bool)

(assert (=> b!981278 m!908129))

(assert (=> b!981272 m!908127))

(declare-fun m!908131 () Bool)

(assert (=> b!981272 m!908131))

(declare-fun m!908133 () Bool)

(assert (=> b!981272 m!908133))

(declare-fun m!908135 () Bool)

(assert (=> b!981272 m!908135))

(assert (=> b!981272 m!908133))

(assert (=> b!981272 m!908127))

(declare-fun m!908137 () Bool)

(assert (=> b!981272 m!908137))

(assert (=> b!981272 m!908131))

(declare-fun m!908139 () Bool)

(assert (=> b!981272 m!908139))

(declare-fun m!908141 () Bool)

(assert (=> b!981277 m!908141))

(assert (=> b!981271 m!908127))

(declare-fun m!908143 () Bool)

(assert (=> b!981271 m!908143))

(declare-fun m!908145 () Bool)

(assert (=> b!981271 m!908145))

(declare-fun m!908147 () Bool)

(assert (=> b!981271 m!908147))

(assert (=> b!981271 m!908143))

(assert (=> b!981271 m!908147))

(declare-fun m!908149 () Bool)

(assert (=> b!981271 m!908149))

(check-sat (not b!981280) (not b_next!19741) (not b!981271) (not start!83968) (not b!981277) (not mapNonEmpty!36212) (not b_lambda!14761) (not b!981272) b_and!31541 tp_is_empty!22789 (not b!981278))
(check-sat b_and!31541 (not b_next!19741))
