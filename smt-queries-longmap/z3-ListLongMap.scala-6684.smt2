; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84244 () Bool)

(assert start!84244)

(declare-fun b_free!19831 () Bool)

(declare-fun b_next!19831 () Bool)

(assert (=> start!84244 (= b_free!19831 (not b_next!19831))))

(declare-fun tp!69016 () Bool)

(declare-fun b_and!31755 () Bool)

(assert (=> start!84244 (= tp!69016 b_and!31755)))

(declare-fun b!983987 () Bool)

(declare-fun res!658233 () Bool)

(declare-fun e!554712 () Bool)

(assert (=> b!983987 (=> (not res!658233) (not e!554712))))

(declare-datatypes ((array!61784 0))(
  ( (array!61785 (arr!29745 (Array (_ BitVec 32) (_ BitVec 64))) (size!30225 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61784)

(declare-datatypes ((List!20613 0))(
  ( (Nil!20610) (Cons!20609 (h!21777 (_ BitVec 64)) (t!29386 List!20613)) )
))
(declare-fun arrayNoDuplicates!0 (array!61784 (_ BitVec 32) List!20613) Bool)

(assert (=> b!983987 (= res!658233 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20610))))

(declare-fun b!983988 () Bool)

(declare-fun e!554708 () Bool)

(declare-fun e!554709 () Bool)

(declare-fun mapRes!36347 () Bool)

(assert (=> b!983988 (= e!554708 (and e!554709 mapRes!36347))))

(declare-fun condMapEmpty!36347 () Bool)

(declare-datatypes ((V!35489 0))(
  ( (V!35490 (val!11490 Int)) )
))
(declare-datatypes ((ValueCell!10958 0))(
  ( (ValueCellFull!10958 (v!14049 V!35489)) (EmptyCell!10958) )
))
(declare-datatypes ((array!61786 0))(
  ( (array!61787 (arr!29746 (Array (_ BitVec 32) ValueCell!10958)) (size!30226 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61786)

(declare-fun mapDefault!36347 () ValueCell!10958)

(assert (=> b!983988 (= condMapEmpty!36347 (= (arr!29746 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10958)) mapDefault!36347)))))

(declare-fun b!983989 () Bool)

(declare-fun e!554707 () Bool)

(assert (=> b!983989 (= e!554712 e!554707)))

(declare-fun res!658228 () Bool)

(assert (=> b!983989 (=> (not res!658228) (not e!554707))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983989 (= res!658228 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29745 _keys!1544) from!1932))))))

(declare-fun lt!436774 () V!35489)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15460 (ValueCell!10958 V!35489) V!35489)

(declare-fun dynLambda!1835 (Int (_ BitVec 64)) V!35489)

(assert (=> b!983989 (= lt!436774 (get!15460 (select (arr!29746 _values!1278) from!1932) (dynLambda!1835 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35489)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14740 0))(
  ( (tuple2!14741 (_1!7381 (_ BitVec 64)) (_2!7381 V!35489)) )
))
(declare-datatypes ((List!20614 0))(
  ( (Nil!20611) (Cons!20610 (h!21778 tuple2!14740) (t!29387 List!20614)) )
))
(declare-datatypes ((ListLongMap!13439 0))(
  ( (ListLongMap!13440 (toList!6735 List!20614)) )
))
(declare-fun lt!436775 () ListLongMap!13439)

(declare-fun zeroValue!1220 () V!35489)

(declare-fun getCurrentListMapNoExtraKeys!3476 (array!61784 array!61786 (_ BitVec 32) (_ BitVec 32) V!35489 V!35489 (_ BitVec 32) Int) ListLongMap!13439)

(assert (=> b!983989 (= lt!436775 (getCurrentListMapNoExtraKeys!3476 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36347 () Bool)

(assert (=> mapIsEmpty!36347 mapRes!36347))

(declare-fun b!983990 () Bool)

(assert (=> b!983990 (= e!554707 (not true))))

(declare-fun lt!436773 () tuple2!14740)

(declare-fun lt!436776 () tuple2!14740)

(declare-fun +!3041 (ListLongMap!13439 tuple2!14740) ListLongMap!13439)

(assert (=> b!983990 (= (+!3041 (+!3041 lt!436775 lt!436773) lt!436776) (+!3041 (+!3041 lt!436775 lt!436776) lt!436773))))

(assert (=> b!983990 (= lt!436776 (tuple2!14741 (select (arr!29745 _keys!1544) from!1932) lt!436774))))

(assert (=> b!983990 (= lt!436773 (tuple2!14741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32662 0))(
  ( (Unit!32663) )
))
(declare-fun lt!436772 () Unit!32662)

(declare-fun addCommutativeForDiffKeys!648 (ListLongMap!13439 (_ BitVec 64) V!35489 (_ BitVec 64) V!35489) Unit!32662)

(assert (=> b!983990 (= lt!436772 (addCommutativeForDiffKeys!648 lt!436775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29745 _keys!1544) from!1932) lt!436774))))

(declare-fun b!983991 () Bool)

(declare-fun res!658234 () Bool)

(assert (=> b!983991 (=> (not res!658234) (not e!554712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983991 (= res!658234 (validKeyInArray!0 (select (arr!29745 _keys!1544) from!1932)))))

(declare-fun b!983992 () Bool)

(declare-fun tp_is_empty!22879 () Bool)

(assert (=> b!983992 (= e!554709 tp_is_empty!22879)))

(declare-fun b!983993 () Bool)

(declare-fun res!658227 () Bool)

(assert (=> b!983993 (=> (not res!658227) (not e!554712))))

(assert (=> b!983993 (= res!658227 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30225 _keys!1544))))))

(declare-fun b!983994 () Bool)

(declare-fun res!658229 () Bool)

(assert (=> b!983994 (=> (not res!658229) (not e!554712))))

(assert (=> b!983994 (= res!658229 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983995 () Bool)

(declare-fun e!554711 () Bool)

(assert (=> b!983995 (= e!554711 tp_is_empty!22879)))

(declare-fun b!983996 () Bool)

(declare-fun res!658230 () Bool)

(assert (=> b!983996 (=> (not res!658230) (not e!554712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61784 (_ BitVec 32)) Bool)

(assert (=> b!983996 (= res!658230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36347 () Bool)

(declare-fun tp!69017 () Bool)

(assert (=> mapNonEmpty!36347 (= mapRes!36347 (and tp!69017 e!554711))))

(declare-fun mapRest!36347 () (Array (_ BitVec 32) ValueCell!10958))

(declare-fun mapValue!36347 () ValueCell!10958)

(declare-fun mapKey!36347 () (_ BitVec 32))

(assert (=> mapNonEmpty!36347 (= (arr!29746 _values!1278) (store mapRest!36347 mapKey!36347 mapValue!36347))))

(declare-fun res!658232 () Bool)

(assert (=> start!84244 (=> (not res!658232) (not e!554712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84244 (= res!658232 (validMask!0 mask!1948))))

(assert (=> start!84244 e!554712))

(assert (=> start!84244 true))

(assert (=> start!84244 tp_is_empty!22879))

(declare-fun array_inv!23017 (array!61786) Bool)

(assert (=> start!84244 (and (array_inv!23017 _values!1278) e!554708)))

(assert (=> start!84244 tp!69016))

(declare-fun array_inv!23018 (array!61784) Bool)

(assert (=> start!84244 (array_inv!23018 _keys!1544)))

(declare-fun b!983997 () Bool)

(declare-fun res!658231 () Bool)

(assert (=> b!983997 (=> (not res!658231) (not e!554712))))

(assert (=> b!983997 (= res!658231 (and (= (size!30226 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30225 _keys!1544) (size!30226 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84244 res!658232) b!983997))

(assert (= (and b!983997 res!658231) b!983996))

(assert (= (and b!983996 res!658230) b!983987))

(assert (= (and b!983987 res!658233) b!983993))

(assert (= (and b!983993 res!658227) b!983991))

(assert (= (and b!983991 res!658234) b!983994))

(assert (= (and b!983994 res!658229) b!983989))

(assert (= (and b!983989 res!658228) b!983990))

(assert (= (and b!983988 condMapEmpty!36347) mapIsEmpty!36347))

(assert (= (and b!983988 (not condMapEmpty!36347)) mapNonEmpty!36347))

(get-info :version)

(assert (= (and mapNonEmpty!36347 ((_ is ValueCellFull!10958) mapValue!36347)) b!983995))

(assert (= (and b!983988 ((_ is ValueCellFull!10958) mapDefault!36347)) b!983992))

(assert (= start!84244 b!983988))

(declare-fun b_lambda!14883 () Bool)

(assert (=> (not b_lambda!14883) (not b!983989)))

(declare-fun t!29385 () Bool)

(declare-fun tb!6623 () Bool)

(assert (=> (and start!84244 (= defaultEntry!1281 defaultEntry!1281) t!29385) tb!6623))

(declare-fun result!13243 () Bool)

(assert (=> tb!6623 (= result!13243 tp_is_empty!22879)))

(assert (=> b!983989 t!29385))

(declare-fun b_and!31757 () Bool)

(assert (= b_and!31755 (and (=> t!29385 result!13243) b_and!31757)))

(declare-fun m!911699 () Bool)

(assert (=> b!983990 m!911699))

(declare-fun m!911701 () Bool)

(assert (=> b!983990 m!911701))

(declare-fun m!911703 () Bool)

(assert (=> b!983990 m!911703))

(declare-fun m!911705 () Bool)

(assert (=> b!983990 m!911705))

(assert (=> b!983990 m!911703))

(assert (=> b!983990 m!911701))

(declare-fun m!911707 () Bool)

(assert (=> b!983990 m!911707))

(assert (=> b!983990 m!911699))

(declare-fun m!911709 () Bool)

(assert (=> b!983990 m!911709))

(assert (=> b!983989 m!911699))

(declare-fun m!911711 () Bool)

(assert (=> b!983989 m!911711))

(declare-fun m!911713 () Bool)

(assert (=> b!983989 m!911713))

(declare-fun m!911715 () Bool)

(assert (=> b!983989 m!911715))

(assert (=> b!983989 m!911711))

(assert (=> b!983989 m!911715))

(declare-fun m!911717 () Bool)

(assert (=> b!983989 m!911717))

(declare-fun m!911719 () Bool)

(assert (=> b!983996 m!911719))

(declare-fun m!911721 () Bool)

(assert (=> b!983987 m!911721))

(declare-fun m!911723 () Bool)

(assert (=> mapNonEmpty!36347 m!911723))

(assert (=> b!983991 m!911699))

(assert (=> b!983991 m!911699))

(declare-fun m!911725 () Bool)

(assert (=> b!983991 m!911725))

(declare-fun m!911727 () Bool)

(assert (=> start!84244 m!911727))

(declare-fun m!911729 () Bool)

(assert (=> start!84244 m!911729))

(declare-fun m!911731 () Bool)

(assert (=> start!84244 m!911731))

(check-sat b_and!31757 (not b!983987) (not start!84244) (not b!983990) (not mapNonEmpty!36347) (not b!983991) (not b!983989) (not b_lambda!14883) tp_is_empty!22879 (not b!983996) (not b_next!19831))
(check-sat b_and!31757 (not b_next!19831))
