; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84150 () Bool)

(assert start!84150)

(declare-fun b_free!19851 () Bool)

(declare-fun b_next!19851 () Bool)

(assert (=> start!84150 (= b_free!19851 (not b_next!19851))))

(declare-fun tp!69156 () Bool)

(declare-fun b_and!31779 () Bool)

(assert (=> start!84150 (= tp!69156 b_and!31779)))

(declare-fun b!983932 () Bool)

(declare-fun e!554703 () Bool)

(assert (=> b!983932 (= e!554703 (not true))))

(declare-datatypes ((V!35587 0))(
  ( (V!35588 (val!11527 Int)) )
))
(declare-datatypes ((tuple2!14738 0))(
  ( (tuple2!14739 (_1!7380 (_ BitVec 64)) (_2!7380 V!35587)) )
))
(declare-datatypes ((List!20630 0))(
  ( (Nil!20627) (Cons!20626 (h!21788 tuple2!14738) (t!29425 List!20630)) )
))
(declare-datatypes ((ListLongMap!13435 0))(
  ( (ListLongMap!13436 (toList!6733 List!20630)) )
))
(declare-fun lt!436600 () ListLongMap!13435)

(declare-fun lt!436599 () tuple2!14738)

(declare-fun lt!436597 () tuple2!14738)

(declare-fun +!3026 (ListLongMap!13435 tuple2!14738) ListLongMap!13435)

(assert (=> b!983932 (= (+!3026 (+!3026 lt!436600 lt!436599) lt!436597) (+!3026 (+!3026 lt!436600 lt!436597) lt!436599))))

(declare-fun lt!436598 () V!35587)

(declare-datatypes ((array!61887 0))(
  ( (array!61888 (arr!29801 (Array (_ BitVec 32) (_ BitVec 64))) (size!30280 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61887)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983932 (= lt!436597 (tuple2!14739 (select (arr!29801 _keys!1544) from!1932) lt!436598))))

(declare-fun minValue!1220 () V!35587)

(assert (=> b!983932 (= lt!436599 (tuple2!14739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32691 0))(
  ( (Unit!32692) )
))
(declare-fun lt!436601 () Unit!32691)

(declare-fun addCommutativeForDiffKeys!654 (ListLongMap!13435 (_ BitVec 64) V!35587 (_ BitVec 64) V!35587) Unit!32691)

(assert (=> b!983932 (= lt!436601 (addCommutativeForDiffKeys!654 lt!436600 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29801 _keys!1544) from!1932) lt!436598))))

(declare-fun mapIsEmpty!36458 () Bool)

(declare-fun mapRes!36458 () Bool)

(assert (=> mapIsEmpty!36458 mapRes!36458))

(declare-fun b!983933 () Bool)

(declare-fun res!658390 () Bool)

(declare-fun e!554705 () Bool)

(assert (=> b!983933 (=> (not res!658390) (not e!554705))))

(assert (=> b!983933 (= res!658390 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30280 _keys!1544))))))

(declare-fun res!658384 () Bool)

(assert (=> start!84150 (=> (not res!658384) (not e!554705))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84150 (= res!658384 (validMask!0 mask!1948))))

(assert (=> start!84150 e!554705))

(assert (=> start!84150 true))

(declare-fun tp_is_empty!22953 () Bool)

(assert (=> start!84150 tp_is_empty!22953))

(declare-datatypes ((ValueCell!10995 0))(
  ( (ValueCellFull!10995 (v!14089 V!35587)) (EmptyCell!10995) )
))
(declare-datatypes ((array!61889 0))(
  ( (array!61890 (arr!29802 (Array (_ BitVec 32) ValueCell!10995)) (size!30281 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61889)

(declare-fun e!554706 () Bool)

(declare-fun array_inv!23043 (array!61889) Bool)

(assert (=> start!84150 (and (array_inv!23043 _values!1278) e!554706)))

(assert (=> start!84150 tp!69156))

(declare-fun array_inv!23044 (array!61887) Bool)

(assert (=> start!84150 (array_inv!23044 _keys!1544)))

(declare-fun b!983934 () Bool)

(declare-fun e!554702 () Bool)

(assert (=> b!983934 (= e!554702 tp_is_empty!22953)))

(declare-fun b!983935 () Bool)

(declare-fun res!658385 () Bool)

(assert (=> b!983935 (=> (not res!658385) (not e!554705))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983935 (= res!658385 (and (= (size!30281 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30280 _keys!1544) (size!30281 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983936 () Bool)

(declare-fun res!658386 () Bool)

(assert (=> b!983936 (=> (not res!658386) (not e!554705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61887 (_ BitVec 32)) Bool)

(assert (=> b!983936 (= res!658386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983937 () Bool)

(declare-fun e!554701 () Bool)

(assert (=> b!983937 (= e!554701 tp_is_empty!22953)))

(declare-fun b!983938 () Bool)

(declare-fun res!658389 () Bool)

(assert (=> b!983938 (=> (not res!658389) (not e!554705))))

(assert (=> b!983938 (= res!658389 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!983939 () Bool)

(assert (=> b!983939 (= e!554706 (and e!554701 mapRes!36458))))

(declare-fun condMapEmpty!36458 () Bool)

(declare-fun mapDefault!36458 () ValueCell!10995)

(assert (=> b!983939 (= condMapEmpty!36458 (= (arr!29802 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10995)) mapDefault!36458)))))

(declare-fun mapNonEmpty!36458 () Bool)

(declare-fun tp!69157 () Bool)

(assert (=> mapNonEmpty!36458 (= mapRes!36458 (and tp!69157 e!554702))))

(declare-fun mapKey!36458 () (_ BitVec 32))

(declare-fun mapRest!36458 () (Array (_ BitVec 32) ValueCell!10995))

(declare-fun mapValue!36458 () ValueCell!10995)

(assert (=> mapNonEmpty!36458 (= (arr!29802 _values!1278) (store mapRest!36458 mapKey!36458 mapValue!36458))))

(declare-fun b!983940 () Bool)

(assert (=> b!983940 (= e!554705 e!554703)))

(declare-fun res!658391 () Bool)

(assert (=> b!983940 (=> (not res!658391) (not e!554703))))

(assert (=> b!983940 (= res!658391 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29801 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15453 (ValueCell!10995 V!35587) V!35587)

(declare-fun dynLambda!1808 (Int (_ BitVec 64)) V!35587)

(assert (=> b!983940 (= lt!436598 (get!15453 (select (arr!29802 _values!1278) from!1932) (dynLambda!1808 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35587)

(declare-fun getCurrentListMapNoExtraKeys!3428 (array!61887 array!61889 (_ BitVec 32) (_ BitVec 32) V!35587 V!35587 (_ BitVec 32) Int) ListLongMap!13435)

(assert (=> b!983940 (= lt!436600 (getCurrentListMapNoExtraKeys!3428 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983941 () Bool)

(declare-fun res!658388 () Bool)

(assert (=> b!983941 (=> (not res!658388) (not e!554705))))

(declare-datatypes ((List!20631 0))(
  ( (Nil!20628) (Cons!20627 (h!21789 (_ BitVec 64)) (t!29426 List!20631)) )
))
(declare-fun arrayNoDuplicates!0 (array!61887 (_ BitVec 32) List!20631) Bool)

(assert (=> b!983941 (= res!658388 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20628))))

(declare-fun b!983942 () Bool)

(declare-fun res!658387 () Bool)

(assert (=> b!983942 (=> (not res!658387) (not e!554705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983942 (= res!658387 (validKeyInArray!0 (select (arr!29801 _keys!1544) from!1932)))))

(assert (= (and start!84150 res!658384) b!983935))

(assert (= (and b!983935 res!658385) b!983936))

(assert (= (and b!983936 res!658386) b!983941))

(assert (= (and b!983941 res!658388) b!983933))

(assert (= (and b!983933 res!658390) b!983942))

(assert (= (and b!983942 res!658387) b!983938))

(assert (= (and b!983938 res!658389) b!983940))

(assert (= (and b!983940 res!658391) b!983932))

(assert (= (and b!983939 condMapEmpty!36458) mapIsEmpty!36458))

(assert (= (and b!983939 (not condMapEmpty!36458)) mapNonEmpty!36458))

(get-info :version)

(assert (= (and mapNonEmpty!36458 ((_ is ValueCellFull!10995) mapValue!36458)) b!983934))

(assert (= (and b!983939 ((_ is ValueCellFull!10995) mapDefault!36458)) b!983937))

(assert (= start!84150 b!983939))

(declare-fun b_lambda!14883 () Bool)

(assert (=> (not b_lambda!14883) (not b!983940)))

(declare-fun t!29424 () Bool)

(declare-fun tb!6645 () Bool)

(assert (=> (and start!84150 (= defaultEntry!1281 defaultEntry!1281) t!29424) tb!6645))

(declare-fun result!13279 () Bool)

(assert (=> tb!6645 (= result!13279 tp_is_empty!22953)))

(assert (=> b!983940 t!29424))

(declare-fun b_and!31781 () Bool)

(assert (= b_and!31779 (and (=> t!29424 result!13279) b_and!31781)))

(declare-fun m!911033 () Bool)

(assert (=> b!983940 m!911033))

(declare-fun m!911035 () Bool)

(assert (=> b!983940 m!911035))

(declare-fun m!911037 () Bool)

(assert (=> b!983940 m!911037))

(declare-fun m!911039 () Bool)

(assert (=> b!983940 m!911039))

(assert (=> b!983940 m!911035))

(assert (=> b!983940 m!911039))

(declare-fun m!911041 () Bool)

(assert (=> b!983940 m!911041))

(declare-fun m!911043 () Bool)

(assert (=> b!983936 m!911043))

(declare-fun m!911045 () Bool)

(assert (=> b!983932 m!911045))

(declare-fun m!911047 () Bool)

(assert (=> b!983932 m!911047))

(declare-fun m!911049 () Bool)

(assert (=> b!983932 m!911049))

(assert (=> b!983932 m!911033))

(declare-fun m!911051 () Bool)

(assert (=> b!983932 m!911051))

(assert (=> b!983932 m!911049))

(declare-fun m!911053 () Bool)

(assert (=> b!983932 m!911053))

(assert (=> b!983932 m!911033))

(assert (=> b!983932 m!911045))

(assert (=> b!983942 m!911033))

(assert (=> b!983942 m!911033))

(declare-fun m!911055 () Bool)

(assert (=> b!983942 m!911055))

(declare-fun m!911057 () Bool)

(assert (=> mapNonEmpty!36458 m!911057))

(declare-fun m!911059 () Bool)

(assert (=> b!983941 m!911059))

(declare-fun m!911061 () Bool)

(assert (=> start!84150 m!911061))

(declare-fun m!911063 () Bool)

(assert (=> start!84150 m!911063))

(declare-fun m!911065 () Bool)

(assert (=> start!84150 m!911065))

(check-sat (not start!84150) tp_is_empty!22953 (not b!983932) (not b!983936) (not b_next!19851) (not b!983942) (not b!983940) (not b!983941) b_and!31781 (not b_lambda!14883) (not mapNonEmpty!36458))
(check-sat b_and!31781 (not b_next!19851))
