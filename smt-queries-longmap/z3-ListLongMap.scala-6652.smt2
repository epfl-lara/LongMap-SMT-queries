; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83866 () Bool)

(assert start!83866)

(declare-fun b_free!19693 () Bool)

(declare-fun b_next!19693 () Bool)

(assert (=> start!83866 (= b_free!19693 (not b_next!19693))))

(declare-fun tp!68522 () Bool)

(declare-fun b_and!31449 () Bool)

(assert (=> start!83866 (= tp!68522 b_and!31449)))

(declare-fun b!979932 () Bool)

(declare-fun res!655856 () Bool)

(declare-fun e!552339 () Bool)

(assert (=> b!979932 (=> (not res!655856) (not e!552339))))

(declare-datatypes ((array!61310 0))(
  ( (array!61311 (arr!29513 (Array (_ BitVec 32) (_ BitVec 64))) (size!29994 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61310)

(declare-datatypes ((List!20511 0))(
  ( (Nil!20508) (Cons!20507 (h!21669 (_ BitVec 64)) (t!29151 List!20511)) )
))
(declare-fun arrayNoDuplicates!0 (array!61310 (_ BitVec 32) List!20511) Bool)

(assert (=> b!979932 (= res!655856 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20508))))

(declare-fun b!979933 () Bool)

(declare-fun e!552344 () Bool)

(declare-fun tp_is_empty!22687 () Bool)

(assert (=> b!979933 (= e!552344 tp_is_empty!22687)))

(declare-fun b!979934 () Bool)

(declare-fun res!655862 () Bool)

(assert (=> b!979934 (=> (not res!655862) (not e!552339))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61310 (_ BitVec 32)) Bool)

(assert (=> b!979934 (= res!655862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979935 () Bool)

(declare-fun e!552341 () Bool)

(assert (=> b!979935 (= e!552341 true)))

(declare-datatypes ((V!35233 0))(
  ( (V!35234 (val!11394 Int)) )
))
(declare-datatypes ((tuple2!14688 0))(
  ( (tuple2!14689 (_1!7355 (_ BitVec 64)) (_2!7355 V!35233)) )
))
(declare-fun lt!434849 () tuple2!14688)

(declare-datatypes ((List!20512 0))(
  ( (Nil!20509) (Cons!20508 (h!21670 tuple2!14688) (t!29152 List!20512)) )
))
(declare-datatypes ((ListLongMap!13375 0))(
  ( (ListLongMap!13376 (toList!6703 List!20512)) )
))
(declare-fun lt!434848 () ListLongMap!13375)

(declare-fun lt!434850 () ListLongMap!13375)

(declare-fun lt!434845 () tuple2!14688)

(declare-fun +!3003 (ListLongMap!13375 tuple2!14688) ListLongMap!13375)

(assert (=> b!979935 (= lt!434848 (+!3003 (+!3003 lt!434850 lt!434849) lt!434845))))

(declare-fun zeroValue!1220 () V!35233)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!434844 () V!35233)

(declare-datatypes ((Unit!32472 0))(
  ( (Unit!32473) )
))
(declare-fun lt!434847 () Unit!32472)

(declare-fun addCommutativeForDiffKeys!607 (ListLongMap!13375 (_ BitVec 64) V!35233 (_ BitVec 64) V!35233) Unit!32472)

(assert (=> b!979935 (= lt!434847 (addCommutativeForDiffKeys!607 lt!434850 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29513 _keys!1544) from!1932) lt!434844))))

(declare-fun b!979936 () Bool)

(declare-fun res!655857 () Bool)

(assert (=> b!979936 (=> (not res!655857) (not e!552339))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979936 (= res!655857 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!655861 () Bool)

(assert (=> start!83866 (=> (not res!655861) (not e!552339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83866 (= res!655861 (validMask!0 mask!1948))))

(assert (=> start!83866 e!552339))

(assert (=> start!83866 true))

(assert (=> start!83866 tp_is_empty!22687))

(declare-datatypes ((ValueCell!10862 0))(
  ( (ValueCellFull!10862 (v!13955 V!35233)) (EmptyCell!10862) )
))
(declare-datatypes ((array!61312 0))(
  ( (array!61313 (arr!29514 (Array (_ BitVec 32) ValueCell!10862)) (size!29995 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61312)

(declare-fun e!552342 () Bool)

(declare-fun array_inv!22845 (array!61312) Bool)

(assert (=> start!83866 (and (array_inv!22845 _values!1278) e!552342)))

(assert (=> start!83866 tp!68522))

(declare-fun array_inv!22846 (array!61310) Bool)

(assert (=> start!83866 (array_inv!22846 _keys!1544)))

(declare-fun b!979937 () Bool)

(declare-fun res!655860 () Bool)

(assert (=> b!979937 (=> (not res!655860) (not e!552339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979937 (= res!655860 (validKeyInArray!0 (select (arr!29513 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36059 () Bool)

(declare-fun mapRes!36059 () Bool)

(assert (=> mapIsEmpty!36059 mapRes!36059))

(declare-fun b!979938 () Bool)

(assert (=> b!979938 (= e!552339 (not e!552341))))

(declare-fun res!655858 () Bool)

(assert (=> b!979938 (=> res!655858 e!552341)))

(assert (=> b!979938 (= res!655858 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29513 _keys!1544) from!1932)))))

(declare-fun lt!434846 () ListLongMap!13375)

(declare-fun lt!434853 () tuple2!14688)

(assert (=> b!979938 (= (+!3003 lt!434846 lt!434849) (+!3003 lt!434848 lt!434853))))

(declare-fun lt!434852 () ListLongMap!13375)

(assert (=> b!979938 (= lt!434848 (+!3003 lt!434852 lt!434849))))

(assert (=> b!979938 (= lt!434849 (tuple2!14689 (select (arr!29513 _keys!1544) from!1932) lt!434844))))

(assert (=> b!979938 (= lt!434846 (+!3003 lt!434852 lt!434853))))

(declare-fun minValue!1220 () V!35233)

(assert (=> b!979938 (= lt!434853 (tuple2!14689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434851 () Unit!32472)

(assert (=> b!979938 (= lt!434851 (addCommutativeForDiffKeys!607 lt!434852 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29513 _keys!1544) from!1932) lt!434844))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15311 (ValueCell!10862 V!35233) V!35233)

(declare-fun dynLambda!1749 (Int (_ BitVec 64)) V!35233)

(assert (=> b!979938 (= lt!434844 (get!15311 (select (arr!29514 _values!1278) from!1932) (dynLambda!1749 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979938 (= lt!434852 (+!3003 lt!434850 lt!434845))))

(assert (=> b!979938 (= lt!434845 (tuple2!14689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3416 (array!61310 array!61312 (_ BitVec 32) (_ BitVec 32) V!35233 V!35233 (_ BitVec 32) Int) ListLongMap!13375)

(assert (=> b!979938 (= lt!434850 (getCurrentListMapNoExtraKeys!3416 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979939 () Bool)

(declare-fun e!552340 () Bool)

(assert (=> b!979939 (= e!552340 tp_is_empty!22687)))

(declare-fun b!979940 () Bool)

(assert (=> b!979940 (= e!552342 (and e!552340 mapRes!36059))))

(declare-fun condMapEmpty!36059 () Bool)

(declare-fun mapDefault!36059 () ValueCell!10862)

(assert (=> b!979940 (= condMapEmpty!36059 (= (arr!29514 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10862)) mapDefault!36059)))))

(declare-fun b!979941 () Bool)

(declare-fun res!655863 () Bool)

(assert (=> b!979941 (=> (not res!655863) (not e!552339))))

(assert (=> b!979941 (= res!655863 (and (= (size!29995 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29994 _keys!1544) (size!29995 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36059 () Bool)

(declare-fun tp!68521 () Bool)

(assert (=> mapNonEmpty!36059 (= mapRes!36059 (and tp!68521 e!552344))))

(declare-fun mapRest!36059 () (Array (_ BitVec 32) ValueCell!10862))

(declare-fun mapKey!36059 () (_ BitVec 32))

(declare-fun mapValue!36059 () ValueCell!10862)

(assert (=> mapNonEmpty!36059 (= (arr!29514 _values!1278) (store mapRest!36059 mapKey!36059 mapValue!36059))))

(declare-fun b!979942 () Bool)

(declare-fun res!655859 () Bool)

(assert (=> b!979942 (=> (not res!655859) (not e!552339))))

(assert (=> b!979942 (= res!655859 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29994 _keys!1544))))))

(assert (= (and start!83866 res!655861) b!979941))

(assert (= (and b!979941 res!655863) b!979934))

(assert (= (and b!979934 res!655862) b!979932))

(assert (= (and b!979932 res!655856) b!979942))

(assert (= (and b!979942 res!655859) b!979937))

(assert (= (and b!979937 res!655860) b!979936))

(assert (= (and b!979936 res!655857) b!979938))

(assert (= (and b!979938 (not res!655858)) b!979935))

(assert (= (and b!979940 condMapEmpty!36059) mapIsEmpty!36059))

(assert (= (and b!979940 (not condMapEmpty!36059)) mapNonEmpty!36059))

(get-info :version)

(assert (= (and mapNonEmpty!36059 ((_ is ValueCellFull!10862) mapValue!36059)) b!979933))

(assert (= (and b!979940 ((_ is ValueCellFull!10862) mapDefault!36059)) b!979939))

(assert (= start!83866 b!979940))

(declare-fun b_lambda!14719 () Bool)

(assert (=> (not b_lambda!14719) (not b!979938)))

(declare-fun t!29150 () Bool)

(declare-fun tb!6491 () Bool)

(assert (=> (and start!83866 (= defaultEntry!1281 defaultEntry!1281) t!29150) tb!6491))

(declare-fun result!12979 () Bool)

(assert (=> tb!6491 (= result!12979 tp_is_empty!22687)))

(assert (=> b!979938 t!29150))

(declare-fun b_and!31451 () Bool)

(assert (= b_and!31449 (and (=> t!29150 result!12979) b_and!31451)))

(declare-fun m!906869 () Bool)

(assert (=> b!979935 m!906869))

(assert (=> b!979935 m!906869))

(declare-fun m!906871 () Bool)

(assert (=> b!979935 m!906871))

(declare-fun m!906873 () Bool)

(assert (=> b!979935 m!906873))

(assert (=> b!979935 m!906873))

(declare-fun m!906875 () Bool)

(assert (=> b!979935 m!906875))

(declare-fun m!906877 () Bool)

(assert (=> start!83866 m!906877))

(declare-fun m!906879 () Bool)

(assert (=> start!83866 m!906879))

(declare-fun m!906881 () Bool)

(assert (=> start!83866 m!906881))

(declare-fun m!906883 () Bool)

(assert (=> b!979938 m!906883))

(assert (=> b!979938 m!906873))

(declare-fun m!906885 () Bool)

(assert (=> b!979938 m!906885))

(declare-fun m!906887 () Bool)

(assert (=> b!979938 m!906887))

(declare-fun m!906889 () Bool)

(assert (=> b!979938 m!906889))

(assert (=> b!979938 m!906873))

(declare-fun m!906891 () Bool)

(assert (=> b!979938 m!906891))

(declare-fun m!906893 () Bool)

(assert (=> b!979938 m!906893))

(declare-fun m!906895 () Bool)

(assert (=> b!979938 m!906895))

(declare-fun m!906897 () Bool)

(assert (=> b!979938 m!906897))

(declare-fun m!906899 () Bool)

(assert (=> b!979938 m!906899))

(assert (=> b!979938 m!906895))

(assert (=> b!979938 m!906899))

(declare-fun m!906901 () Bool)

(assert (=> b!979938 m!906901))

(declare-fun m!906903 () Bool)

(assert (=> b!979934 m!906903))

(declare-fun m!906905 () Bool)

(assert (=> mapNonEmpty!36059 m!906905))

(declare-fun m!906907 () Bool)

(assert (=> b!979932 m!906907))

(assert (=> b!979937 m!906873))

(assert (=> b!979937 m!906873))

(declare-fun m!906909 () Bool)

(assert (=> b!979937 m!906909))

(check-sat b_and!31451 (not b!979932) tp_is_empty!22687 (not b!979934) (not start!83866) (not b!979938) (not b_next!19693) (not mapNonEmpty!36059) (not b!979935) (not b!979937) (not b_lambda!14719))
(check-sat b_and!31451 (not b_next!19693))
