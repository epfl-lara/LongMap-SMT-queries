; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84340 () Bool)

(assert start!84340)

(declare-fun b_free!19873 () Bool)

(declare-fun b_next!19873 () Bool)

(assert (=> start!84340 (= b_free!19873 (not b_next!19873))))

(declare-fun tp!69223 () Bool)

(declare-fun b_and!31833 () Bool)

(assert (=> start!84340 (= tp!69223 b_and!31833)))

(declare-fun b!985220 () Bool)

(declare-fun res!658996 () Bool)

(declare-fun e!555482 () Bool)

(assert (=> b!985220 (=> (not res!658996) (not e!555482))))

(declare-datatypes ((array!61970 0))(
  ( (array!61971 (arr!29838 (Array (_ BitVec 32) (_ BitVec 64))) (size!30318 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61970)

(declare-datatypes ((List!20660 0))(
  ( (Nil!20657) (Cons!20656 (h!21824 (_ BitVec 64)) (t!29469 List!20660)) )
))
(declare-fun arrayNoDuplicates!0 (array!61970 (_ BitVec 32) List!20660) Bool)

(assert (=> b!985220 (= res!658996 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20657))))

(declare-fun b!985221 () Bool)

(declare-fun e!555481 () Bool)

(assert (=> b!985221 (= e!555482 e!555481)))

(declare-fun res!658992 () Bool)

(assert (=> b!985221 (=> (not res!658992) (not e!555481))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985221 (= res!658992 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29838 _keys!1544) from!1932))))))

(declare-datatypes ((V!35617 0))(
  ( (V!35618 (val!11538 Int)) )
))
(declare-datatypes ((ValueCell!11006 0))(
  ( (ValueCellFull!11006 (v!14097 V!35617)) (EmptyCell!11006) )
))
(declare-datatypes ((array!61972 0))(
  ( (array!61973 (arr!29839 (Array (_ BitVec 32) ValueCell!11006)) (size!30319 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61972)

(declare-fun lt!437126 () V!35617)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15504 (ValueCell!11006 V!35617) V!35617)

(declare-fun dynLambda!1847 (Int (_ BitVec 64)) V!35617)

(assert (=> b!985221 (= lt!437126 (get!15504 (select (arr!29839 _values!1278) from!1932) (dynLambda!1847 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35617)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14780 0))(
  ( (tuple2!14781 (_1!7401 (_ BitVec 64)) (_2!7401 V!35617)) )
))
(declare-datatypes ((List!20661 0))(
  ( (Nil!20658) (Cons!20657 (h!21825 tuple2!14780) (t!29470 List!20661)) )
))
(declare-datatypes ((ListLongMap!13479 0))(
  ( (ListLongMap!13480 (toList!6755 List!20661)) )
))
(declare-fun lt!437125 () ListLongMap!13479)

(declare-fun zeroValue!1220 () V!35617)

(declare-fun getCurrentListMapNoExtraKeys!3490 (array!61970 array!61972 (_ BitVec 32) (_ BitVec 32) V!35617 V!35617 (_ BitVec 32) Int) ListLongMap!13479)

(assert (=> b!985221 (= lt!437125 (getCurrentListMapNoExtraKeys!3490 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985222 () Bool)

(declare-fun res!658999 () Bool)

(assert (=> b!985222 (=> (not res!658999) (not e!555482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985222 (= res!658999 (validKeyInArray!0 (select (arr!29838 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36491 () Bool)

(declare-fun mapRes!36491 () Bool)

(declare-fun tp!69224 () Bool)

(declare-fun e!555484 () Bool)

(assert (=> mapNonEmpty!36491 (= mapRes!36491 (and tp!69224 e!555484))))

(declare-fun mapKey!36491 () (_ BitVec 32))

(declare-fun mapRest!36491 () (Array (_ BitVec 32) ValueCell!11006))

(declare-fun mapValue!36491 () ValueCell!11006)

(assert (=> mapNonEmpty!36491 (= (arr!29839 _values!1278) (store mapRest!36491 mapKey!36491 mapValue!36491))))

(declare-fun b!985223 () Bool)

(declare-fun res!658998 () Bool)

(assert (=> b!985223 (=> (not res!658998) (not e!555482))))

(assert (=> b!985223 (= res!658998 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985224 () Bool)

(declare-fun tp_is_empty!22975 () Bool)

(assert (=> b!985224 (= e!555484 tp_is_empty!22975)))

(declare-fun res!658995 () Bool)

(assert (=> start!84340 (=> (not res!658995) (not e!555482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84340 (= res!658995 (validMask!0 mask!1948))))

(assert (=> start!84340 e!555482))

(assert (=> start!84340 true))

(assert (=> start!84340 tp_is_empty!22975))

(declare-fun e!555486 () Bool)

(declare-fun array_inv!23087 (array!61972) Bool)

(assert (=> start!84340 (and (array_inv!23087 _values!1278) e!555486)))

(assert (=> start!84340 tp!69223))

(declare-fun array_inv!23088 (array!61970) Bool)

(assert (=> start!84340 (array_inv!23088 _keys!1544)))

(declare-fun mapIsEmpty!36491 () Bool)

(assert (=> mapIsEmpty!36491 mapRes!36491))

(declare-fun b!985225 () Bool)

(declare-fun e!555483 () Bool)

(assert (=> b!985225 (= e!555486 (and e!555483 mapRes!36491))))

(declare-fun condMapEmpty!36491 () Bool)

(declare-fun mapDefault!36491 () ValueCell!11006)

(assert (=> b!985225 (= condMapEmpty!36491 (= (arr!29839 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11006)) mapDefault!36491)))))

(declare-fun b!985226 () Bool)

(declare-fun res!658993 () Bool)

(assert (=> b!985226 (=> (not res!658993) (not e!555482))))

(assert (=> b!985226 (= res!658993 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30318 _keys!1544))))))

(declare-fun b!985227 () Bool)

(assert (=> b!985227 (= e!555481 (not true))))

(declare-fun lt!437127 () tuple2!14780)

(declare-fun lt!437123 () tuple2!14780)

(declare-fun +!3058 (ListLongMap!13479 tuple2!14780) ListLongMap!13479)

(assert (=> b!985227 (= (+!3058 (+!3058 lt!437125 lt!437127) lt!437123) (+!3058 (+!3058 lt!437125 lt!437123) lt!437127))))

(assert (=> b!985227 (= lt!437123 (tuple2!14781 (select (arr!29838 _keys!1544) from!1932) lt!437126))))

(assert (=> b!985227 (= lt!437127 (tuple2!14781 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32696 0))(
  ( (Unit!32697) )
))
(declare-fun lt!437124 () Unit!32696)

(declare-fun addCommutativeForDiffKeys!665 (ListLongMap!13479 (_ BitVec 64) V!35617 (_ BitVec 64) V!35617) Unit!32696)

(assert (=> b!985227 (= lt!437124 (addCommutativeForDiffKeys!665 lt!437125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29838 _keys!1544) from!1932) lt!437126))))

(declare-fun b!985228 () Bool)

(declare-fun res!658997 () Bool)

(assert (=> b!985228 (=> (not res!658997) (not e!555482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61970 (_ BitVec 32)) Bool)

(assert (=> b!985228 (= res!658997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985229 () Bool)

(declare-fun res!658994 () Bool)

(assert (=> b!985229 (=> (not res!658994) (not e!555482))))

(assert (=> b!985229 (= res!658994 (and (= (size!30319 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30318 _keys!1544) (size!30319 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985230 () Bool)

(assert (=> b!985230 (= e!555483 tp_is_empty!22975)))

(assert (= (and start!84340 res!658995) b!985229))

(assert (= (and b!985229 res!658994) b!985228))

(assert (= (and b!985228 res!658997) b!985220))

(assert (= (and b!985220 res!658996) b!985226))

(assert (= (and b!985226 res!658993) b!985222))

(assert (= (and b!985222 res!658999) b!985223))

(assert (= (and b!985223 res!658998) b!985221))

(assert (= (and b!985221 res!658992) b!985227))

(assert (= (and b!985225 condMapEmpty!36491) mapIsEmpty!36491))

(assert (= (and b!985225 (not condMapEmpty!36491)) mapNonEmpty!36491))

(get-info :version)

(assert (= (and mapNonEmpty!36491 ((_ is ValueCellFull!11006) mapValue!36491)) b!985224))

(assert (= (and b!985225 ((_ is ValueCellFull!11006) mapDefault!36491)) b!985230))

(assert (= start!84340 b!985225))

(declare-fun b_lambda!14919 () Bool)

(assert (=> (not b_lambda!14919) (not b!985221)))

(declare-fun t!29468 () Bool)

(declare-fun tb!6659 () Bool)

(assert (=> (and start!84340 (= defaultEntry!1281 defaultEntry!1281) t!29468) tb!6659))

(declare-fun result!13315 () Bool)

(assert (=> tb!6659 (= result!13315 tp_is_empty!22975)))

(assert (=> b!985221 t!29468))

(declare-fun b_and!31835 () Bool)

(assert (= b_and!31833 (and (=> t!29468 result!13315) b_and!31835)))

(declare-fun m!912701 () Bool)

(assert (=> b!985227 m!912701))

(declare-fun m!912703 () Bool)

(assert (=> b!985227 m!912703))

(declare-fun m!912705 () Bool)

(assert (=> b!985227 m!912705))

(assert (=> b!985227 m!912705))

(declare-fun m!912707 () Bool)

(assert (=> b!985227 m!912707))

(assert (=> b!985227 m!912701))

(declare-fun m!912709 () Bool)

(assert (=> b!985227 m!912709))

(assert (=> b!985227 m!912709))

(declare-fun m!912711 () Bool)

(assert (=> b!985227 m!912711))

(assert (=> b!985221 m!912705))

(declare-fun m!912713 () Bool)

(assert (=> b!985221 m!912713))

(declare-fun m!912715 () Bool)

(assert (=> b!985221 m!912715))

(declare-fun m!912717 () Bool)

(assert (=> b!985221 m!912717))

(assert (=> b!985221 m!912713))

(assert (=> b!985221 m!912717))

(declare-fun m!912719 () Bool)

(assert (=> b!985221 m!912719))

(declare-fun m!912721 () Bool)

(assert (=> b!985220 m!912721))

(declare-fun m!912723 () Bool)

(assert (=> b!985228 m!912723))

(declare-fun m!912725 () Bool)

(assert (=> start!84340 m!912725))

(declare-fun m!912727 () Bool)

(assert (=> start!84340 m!912727))

(declare-fun m!912729 () Bool)

(assert (=> start!84340 m!912729))

(assert (=> b!985222 m!912705))

(assert (=> b!985222 m!912705))

(declare-fun m!912731 () Bool)

(assert (=> b!985222 m!912731))

(declare-fun m!912733 () Bool)

(assert (=> mapNonEmpty!36491 m!912733))

(check-sat (not b!985227) (not b!985220) tp_is_empty!22975 (not start!84340) (not mapNonEmpty!36491) (not b!985221) (not b_lambda!14919) b_and!31835 (not b!985228) (not b!985222) (not b_next!19873))
(check-sat b_and!31835 (not b_next!19873))
