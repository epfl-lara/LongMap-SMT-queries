; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83886 () Bool)

(assert start!83886)

(declare-fun b_free!19695 () Bool)

(declare-fun b_next!19695 () Bool)

(assert (=> start!83886 (= b_free!19695 (not b_next!19695))))

(declare-fun tp!68527 () Bool)

(declare-fun b_and!31479 () Bool)

(assert (=> start!83886 (= tp!68527 b_and!31479)))

(declare-fun mapNonEmpty!36062 () Bool)

(declare-fun mapRes!36062 () Bool)

(declare-fun tp!68526 () Bool)

(declare-fun e!552508 () Bool)

(assert (=> mapNonEmpty!36062 (= mapRes!36062 (and tp!68526 e!552508))))

(declare-datatypes ((V!35235 0))(
  ( (V!35236 (val!11395 Int)) )
))
(declare-datatypes ((ValueCell!10863 0))(
  ( (ValueCellFull!10863 (v!13957 V!35235)) (EmptyCell!10863) )
))
(declare-fun mapRest!36062 () (Array (_ BitVec 32) ValueCell!10863))

(declare-datatypes ((array!61387 0))(
  ( (array!61388 (arr!29551 (Array (_ BitVec 32) ValueCell!10863)) (size!30030 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61387)

(declare-fun mapKey!36062 () (_ BitVec 32))

(declare-fun mapValue!36062 () ValueCell!10863)

(assert (=> mapNonEmpty!36062 (= (arr!29551 _values!1278) (store mapRest!36062 mapKey!36062 mapValue!36062))))

(declare-fun b!980206 () Bool)

(declare-fun res!655992 () Bool)

(declare-fun e!552506 () Bool)

(assert (=> b!980206 (=> (not res!655992) (not e!552506))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980206 (= res!655992 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980207 () Bool)

(declare-fun res!655997 () Bool)

(assert (=> b!980207 (=> (not res!655997) (not e!552506))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61389 0))(
  ( (array!61390 (arr!29552 (Array (_ BitVec 32) (_ BitVec 64))) (size!30031 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61389)

(assert (=> b!980207 (= res!655997 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30031 _keys!1544))))))

(declare-fun b!980208 () Bool)

(declare-fun e!552507 () Bool)

(assert (=> b!980208 (= e!552507 true)))

(declare-datatypes ((tuple2!14616 0))(
  ( (tuple2!14617 (_1!7319 (_ BitVec 64)) (_2!7319 V!35235)) )
))
(declare-datatypes ((List!20483 0))(
  ( (Nil!20480) (Cons!20479 (h!21641 tuple2!14616) (t!29134 List!20483)) )
))
(declare-datatypes ((ListLongMap!13313 0))(
  ( (ListLongMap!13314 (toList!6672 List!20483)) )
))
(declare-fun lt!435113 () ListLongMap!13313)

(declare-fun lt!435112 () tuple2!14616)

(declare-fun lt!435119 () tuple2!14616)

(declare-fun lt!435116 () ListLongMap!13313)

(declare-fun +!2977 (ListLongMap!13313 tuple2!14616) ListLongMap!13313)

(assert (=> b!980208 (= lt!435113 (+!2977 (+!2977 lt!435116 lt!435119) lt!435112))))

(declare-fun zeroValue!1220 () V!35235)

(declare-datatypes ((Unit!32593 0))(
  ( (Unit!32594) )
))
(declare-fun lt!435118 () Unit!32593)

(declare-fun lt!435110 () V!35235)

(declare-fun addCommutativeForDiffKeys!605 (ListLongMap!13313 (_ BitVec 64) V!35235 (_ BitVec 64) V!35235) Unit!32593)

(assert (=> b!980208 (= lt!435118 (addCommutativeForDiffKeys!605 lt!435116 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29552 _keys!1544) from!1932) lt!435110))))

(declare-fun b!980209 () Bool)

(declare-fun res!655993 () Bool)

(assert (=> b!980209 (=> (not res!655993) (not e!552506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980209 (= res!655993 (validKeyInArray!0 (select (arr!29552 _keys!1544) from!1932)))))

(declare-fun b!980210 () Bool)

(declare-fun e!552505 () Bool)

(declare-fun tp_is_empty!22689 () Bool)

(assert (=> b!980210 (= e!552505 tp_is_empty!22689)))

(declare-fun mapIsEmpty!36062 () Bool)

(assert (=> mapIsEmpty!36062 mapRes!36062))

(declare-fun b!980211 () Bool)

(declare-fun res!655994 () Bool)

(assert (=> b!980211 (=> (not res!655994) (not e!552506))))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!980211 (= res!655994 (and (= (size!30030 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30031 _keys!1544) (size!30030 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!655990 () Bool)

(assert (=> start!83886 (=> (not res!655990) (not e!552506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83886 (= res!655990 (validMask!0 mask!1948))))

(assert (=> start!83886 e!552506))

(assert (=> start!83886 true))

(assert (=> start!83886 tp_is_empty!22689))

(declare-fun e!552509 () Bool)

(declare-fun array_inv!22847 (array!61387) Bool)

(assert (=> start!83886 (and (array_inv!22847 _values!1278) e!552509)))

(assert (=> start!83886 tp!68527))

(declare-fun array_inv!22848 (array!61389) Bool)

(assert (=> start!83886 (array_inv!22848 _keys!1544)))

(declare-fun b!980212 () Bool)

(declare-fun res!655995 () Bool)

(assert (=> b!980212 (=> (not res!655995) (not e!552506))))

(declare-datatypes ((List!20484 0))(
  ( (Nil!20481) (Cons!20480 (h!21642 (_ BitVec 64)) (t!29135 List!20484)) )
))
(declare-fun arrayNoDuplicates!0 (array!61389 (_ BitVec 32) List!20484) Bool)

(assert (=> b!980212 (= res!655995 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20481))))

(declare-fun b!980213 () Bool)

(assert (=> b!980213 (= e!552509 (and e!552505 mapRes!36062))))

(declare-fun condMapEmpty!36062 () Bool)

(declare-fun mapDefault!36062 () ValueCell!10863)

(assert (=> b!980213 (= condMapEmpty!36062 (= (arr!29551 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10863)) mapDefault!36062)))))

(declare-fun b!980214 () Bool)

(declare-fun res!655991 () Bool)

(assert (=> b!980214 (=> (not res!655991) (not e!552506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61389 (_ BitVec 32)) Bool)

(assert (=> b!980214 (= res!655991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980215 () Bool)

(assert (=> b!980215 (= e!552506 (not e!552507))))

(declare-fun res!655996 () Bool)

(assert (=> b!980215 (=> res!655996 e!552507)))

(assert (=> b!980215 (= res!655996 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29552 _keys!1544) from!1932)))))

(declare-fun lt!435115 () tuple2!14616)

(declare-fun lt!435114 () ListLongMap!13313)

(assert (=> b!980215 (= (+!2977 lt!435114 lt!435119) (+!2977 lt!435113 lt!435115))))

(declare-fun lt!435117 () ListLongMap!13313)

(assert (=> b!980215 (= lt!435113 (+!2977 lt!435117 lt!435119))))

(assert (=> b!980215 (= lt!435119 (tuple2!14617 (select (arr!29552 _keys!1544) from!1932) lt!435110))))

(assert (=> b!980215 (= lt!435114 (+!2977 lt!435117 lt!435115))))

(declare-fun minValue!1220 () V!35235)

(assert (=> b!980215 (= lt!435115 (tuple2!14617 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435111 () Unit!32593)

(assert (=> b!980215 (= lt!435111 (addCommutativeForDiffKeys!605 lt!435117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29552 _keys!1544) from!1932) lt!435110))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15320 (ValueCell!10863 V!35235) V!35235)

(declare-fun dynLambda!1763 (Int (_ BitVec 64)) V!35235)

(assert (=> b!980215 (= lt!435110 (get!15320 (select (arr!29551 _values!1278) from!1932) (dynLambda!1763 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980215 (= lt!435117 (+!2977 lt!435116 lt!435112))))

(assert (=> b!980215 (= lt!435112 (tuple2!14617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3377 (array!61389 array!61387 (_ BitVec 32) (_ BitVec 32) V!35235 V!35235 (_ BitVec 32) Int) ListLongMap!13313)

(assert (=> b!980215 (= lt!435116 (getCurrentListMapNoExtraKeys!3377 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980216 () Bool)

(assert (=> b!980216 (= e!552508 tp_is_empty!22689)))

(assert (= (and start!83886 res!655990) b!980211))

(assert (= (and b!980211 res!655994) b!980214))

(assert (= (and b!980214 res!655991) b!980212))

(assert (= (and b!980212 res!655995) b!980207))

(assert (= (and b!980207 res!655997) b!980209))

(assert (= (and b!980209 res!655993) b!980206))

(assert (= (and b!980206 res!655992) b!980215))

(assert (= (and b!980215 (not res!655996)) b!980208))

(assert (= (and b!980213 condMapEmpty!36062) mapIsEmpty!36062))

(assert (= (and b!980213 (not condMapEmpty!36062)) mapNonEmpty!36062))

(get-info :version)

(assert (= (and mapNonEmpty!36062 ((_ is ValueCellFull!10863) mapValue!36062)) b!980216))

(assert (= (and b!980213 ((_ is ValueCellFull!10863) mapDefault!36062)) b!980210))

(assert (= start!83886 b!980213))

(declare-fun b_lambda!14739 () Bool)

(assert (=> (not b_lambda!14739) (not b!980215)))

(declare-fun t!29133 () Bool)

(declare-fun tb!6501 () Bool)

(assert (=> (and start!83886 (= defaultEntry!1281 defaultEntry!1281) t!29133) tb!6501))

(declare-fun result!12991 () Bool)

(assert (=> tb!6501 (= result!12991 tp_is_empty!22689)))

(assert (=> b!980215 t!29133))

(declare-fun b_and!31481 () Bool)

(assert (= b_and!31479 (and (=> t!29133 result!12991) b_and!31481)))

(declare-fun m!907669 () Bool)

(assert (=> b!980208 m!907669))

(assert (=> b!980208 m!907669))

(declare-fun m!907671 () Bool)

(assert (=> b!980208 m!907671))

(declare-fun m!907673 () Bool)

(assert (=> b!980208 m!907673))

(assert (=> b!980208 m!907673))

(declare-fun m!907675 () Bool)

(assert (=> b!980208 m!907675))

(declare-fun m!907677 () Bool)

(assert (=> b!980214 m!907677))

(declare-fun m!907679 () Bool)

(assert (=> mapNonEmpty!36062 m!907679))

(assert (=> b!980209 m!907673))

(assert (=> b!980209 m!907673))

(declare-fun m!907681 () Bool)

(assert (=> b!980209 m!907681))

(declare-fun m!907683 () Bool)

(assert (=> b!980212 m!907683))

(declare-fun m!907685 () Bool)

(assert (=> start!83886 m!907685))

(declare-fun m!907687 () Bool)

(assert (=> start!83886 m!907687))

(declare-fun m!907689 () Bool)

(assert (=> start!83886 m!907689))

(assert (=> b!980215 m!907673))

(declare-fun m!907691 () Bool)

(assert (=> b!980215 m!907691))

(assert (=> b!980215 m!907673))

(declare-fun m!907693 () Bool)

(assert (=> b!980215 m!907693))

(declare-fun m!907695 () Bool)

(assert (=> b!980215 m!907695))

(declare-fun m!907697 () Bool)

(assert (=> b!980215 m!907697))

(declare-fun m!907699 () Bool)

(assert (=> b!980215 m!907699))

(declare-fun m!907701 () Bool)

(assert (=> b!980215 m!907701))

(declare-fun m!907703 () Bool)

(assert (=> b!980215 m!907703))

(declare-fun m!907705 () Bool)

(assert (=> b!980215 m!907705))

(declare-fun m!907707 () Bool)

(assert (=> b!980215 m!907707))

(assert (=> b!980215 m!907691))

(assert (=> b!980215 m!907707))

(declare-fun m!907709 () Bool)

(assert (=> b!980215 m!907709))

(check-sat (not b_next!19695) b_and!31481 (not start!83886) tp_is_empty!22689 (not b!980212) (not b_lambda!14739) (not b!980208) (not b!980215) (not b!980214) (not b!980209) (not mapNonEmpty!36062))
(check-sat b_and!31481 (not b_next!19695))
