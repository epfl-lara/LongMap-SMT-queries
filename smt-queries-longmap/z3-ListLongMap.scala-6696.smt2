; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84316 () Bool)

(assert start!84316)

(declare-fun b_free!19849 () Bool)

(declare-fun b_next!19849 () Bool)

(assert (=> start!84316 (= b_free!19849 (not b_next!19849))))

(declare-fun tp!69151 () Bool)

(declare-fun b_and!31785 () Bool)

(assert (=> start!84316 (= tp!69151 b_and!31785)))

(declare-fun b!984800 () Bool)

(declare-fun res!658708 () Bool)

(declare-fun e!555265 () Bool)

(assert (=> b!984800 (=> (not res!658708) (not e!555265))))

(declare-datatypes ((array!61922 0))(
  ( (array!61923 (arr!29814 (Array (_ BitVec 32) (_ BitVec 64))) (size!30294 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61922)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984800 (= res!658708 (validKeyInArray!0 (select (arr!29814 _keys!1544) from!1932)))))

(declare-fun b!984801 () Bool)

(declare-fun e!555267 () Bool)

(assert (=> b!984801 (= e!555267 (not true))))

(declare-datatypes ((V!35585 0))(
  ( (V!35586 (val!11526 Int)) )
))
(declare-datatypes ((tuple2!14756 0))(
  ( (tuple2!14757 (_1!7389 (_ BitVec 64)) (_2!7389 V!35585)) )
))
(declare-datatypes ((List!20642 0))(
  ( (Nil!20639) (Cons!20638 (h!21806 tuple2!14756) (t!29427 List!20642)) )
))
(declare-datatypes ((ListLongMap!13455 0))(
  ( (ListLongMap!13456 (toList!6743 List!20642)) )
))
(declare-fun lt!436944 () ListLongMap!13455)

(declare-fun lt!436943 () tuple2!14756)

(declare-fun lt!436946 () tuple2!14756)

(declare-fun +!3047 (ListLongMap!13455 tuple2!14756) ListLongMap!13455)

(assert (=> b!984801 (= (+!3047 (+!3047 lt!436944 lt!436943) lt!436946) (+!3047 (+!3047 lt!436944 lt!436946) lt!436943))))

(declare-fun lt!436947 () V!35585)

(assert (=> b!984801 (= lt!436946 (tuple2!14757 (select (arr!29814 _keys!1544) from!1932) lt!436947))))

(declare-fun minValue!1220 () V!35585)

(assert (=> b!984801 (= lt!436943 (tuple2!14757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32674 0))(
  ( (Unit!32675) )
))
(declare-fun lt!436945 () Unit!32674)

(declare-fun addCommutativeForDiffKeys!654 (ListLongMap!13455 (_ BitVec 64) V!35585 (_ BitVec 64) V!35585) Unit!32674)

(assert (=> b!984801 (= lt!436945 (addCommutativeForDiffKeys!654 lt!436944 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29814 _keys!1544) from!1932) lt!436947))))

(declare-fun b!984802 () Bool)

(declare-fun res!658706 () Bool)

(assert (=> b!984802 (=> (not res!658706) (not e!555265))))

(declare-datatypes ((List!20643 0))(
  ( (Nil!20640) (Cons!20639 (h!21807 (_ BitVec 64)) (t!29428 List!20643)) )
))
(declare-fun arrayNoDuplicates!0 (array!61922 (_ BitVec 32) List!20643) Bool)

(assert (=> b!984802 (= res!658706 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20640))))

(declare-fun res!658709 () Bool)

(assert (=> start!84316 (=> (not res!658709) (not e!555265))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84316 (= res!658709 (validMask!0 mask!1948))))

(assert (=> start!84316 e!555265))

(assert (=> start!84316 true))

(declare-fun tp_is_empty!22951 () Bool)

(assert (=> start!84316 tp_is_empty!22951))

(declare-datatypes ((ValueCell!10994 0))(
  ( (ValueCellFull!10994 (v!14085 V!35585)) (EmptyCell!10994) )
))
(declare-datatypes ((array!61924 0))(
  ( (array!61925 (arr!29815 (Array (_ BitVec 32) ValueCell!10994)) (size!30295 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61924)

(declare-fun e!555268 () Bool)

(declare-fun array_inv!23067 (array!61924) Bool)

(assert (=> start!84316 (and (array_inv!23067 _values!1278) e!555268)))

(assert (=> start!84316 tp!69151))

(declare-fun array_inv!23068 (array!61922) Bool)

(assert (=> start!84316 (array_inv!23068 _keys!1544)))

(declare-fun b!984803 () Bool)

(declare-fun res!658710 () Bool)

(assert (=> b!984803 (=> (not res!658710) (not e!555265))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984803 (= res!658710 (and (= (size!30295 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30294 _keys!1544) (size!30295 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984804 () Bool)

(declare-fun e!555270 () Bool)

(declare-fun mapRes!36455 () Bool)

(assert (=> b!984804 (= e!555268 (and e!555270 mapRes!36455))))

(declare-fun condMapEmpty!36455 () Bool)

(declare-fun mapDefault!36455 () ValueCell!10994)

(assert (=> b!984804 (= condMapEmpty!36455 (= (arr!29815 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10994)) mapDefault!36455)))))

(declare-fun b!984805 () Bool)

(declare-fun e!555269 () Bool)

(assert (=> b!984805 (= e!555269 tp_is_empty!22951)))

(declare-fun b!984806 () Bool)

(declare-fun res!658711 () Bool)

(assert (=> b!984806 (=> (not res!658711) (not e!555265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61922 (_ BitVec 32)) Bool)

(assert (=> b!984806 (= res!658711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984807 () Bool)

(assert (=> b!984807 (= e!555265 e!555267)))

(declare-fun res!658704 () Bool)

(assert (=> b!984807 (=> (not res!658704) (not e!555267))))

(assert (=> b!984807 (= res!658704 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29814 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15488 (ValueCell!10994 V!35585) V!35585)

(declare-fun dynLambda!1839 (Int (_ BitVec 64)) V!35585)

(assert (=> b!984807 (= lt!436947 (get!15488 (select (arr!29815 _values!1278) from!1932) (dynLambda!1839 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35585)

(declare-fun getCurrentListMapNoExtraKeys!3482 (array!61922 array!61924 (_ BitVec 32) (_ BitVec 32) V!35585 V!35585 (_ BitVec 32) Int) ListLongMap!13455)

(assert (=> b!984807 (= lt!436944 (getCurrentListMapNoExtraKeys!3482 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984808 () Bool)

(assert (=> b!984808 (= e!555270 tp_is_empty!22951)))

(declare-fun b!984809 () Bool)

(declare-fun res!658705 () Bool)

(assert (=> b!984809 (=> (not res!658705) (not e!555265))))

(assert (=> b!984809 (= res!658705 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36455 () Bool)

(assert (=> mapIsEmpty!36455 mapRes!36455))

(declare-fun mapNonEmpty!36455 () Bool)

(declare-fun tp!69152 () Bool)

(assert (=> mapNonEmpty!36455 (= mapRes!36455 (and tp!69152 e!555269))))

(declare-fun mapRest!36455 () (Array (_ BitVec 32) ValueCell!10994))

(declare-fun mapKey!36455 () (_ BitVec 32))

(declare-fun mapValue!36455 () ValueCell!10994)

(assert (=> mapNonEmpty!36455 (= (arr!29815 _values!1278) (store mapRest!36455 mapKey!36455 mapValue!36455))))

(declare-fun b!984810 () Bool)

(declare-fun res!658707 () Bool)

(assert (=> b!984810 (=> (not res!658707) (not e!555265))))

(assert (=> b!984810 (= res!658707 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30294 _keys!1544))))))

(assert (= (and start!84316 res!658709) b!984803))

(assert (= (and b!984803 res!658710) b!984806))

(assert (= (and b!984806 res!658711) b!984802))

(assert (= (and b!984802 res!658706) b!984810))

(assert (= (and b!984810 res!658707) b!984800))

(assert (= (and b!984800 res!658708) b!984809))

(assert (= (and b!984809 res!658705) b!984807))

(assert (= (and b!984807 res!658704) b!984801))

(assert (= (and b!984804 condMapEmpty!36455) mapIsEmpty!36455))

(assert (= (and b!984804 (not condMapEmpty!36455)) mapNonEmpty!36455))

(get-info :version)

(assert (= (and mapNonEmpty!36455 ((_ is ValueCellFull!10994) mapValue!36455)) b!984805))

(assert (= (and b!984804 ((_ is ValueCellFull!10994) mapDefault!36455)) b!984808))

(assert (= start!84316 b!984804))

(declare-fun b_lambda!14895 () Bool)

(assert (=> (not b_lambda!14895) (not b!984807)))

(declare-fun t!29426 () Bool)

(declare-fun tb!6635 () Bool)

(assert (=> (and start!84316 (= defaultEntry!1281 defaultEntry!1281) t!29426) tb!6635))

(declare-fun result!13267 () Bool)

(assert (=> tb!6635 (= result!13267 tp_is_empty!22951)))

(assert (=> b!984807 t!29426))

(declare-fun b_and!31787 () Bool)

(assert (= b_and!31785 (and (=> t!29426 result!13267) b_and!31787)))

(declare-fun m!912293 () Bool)

(assert (=> b!984802 m!912293))

(declare-fun m!912295 () Bool)

(assert (=> b!984801 m!912295))

(declare-fun m!912297 () Bool)

(assert (=> b!984801 m!912297))

(assert (=> b!984801 m!912295))

(declare-fun m!912299 () Bool)

(assert (=> b!984801 m!912299))

(declare-fun m!912301 () Bool)

(assert (=> b!984801 m!912301))

(assert (=> b!984801 m!912301))

(declare-fun m!912303 () Bool)

(assert (=> b!984801 m!912303))

(assert (=> b!984801 m!912299))

(declare-fun m!912305 () Bool)

(assert (=> b!984801 m!912305))

(declare-fun m!912307 () Bool)

(assert (=> b!984806 m!912307))

(declare-fun m!912309 () Bool)

(assert (=> start!84316 m!912309))

(declare-fun m!912311 () Bool)

(assert (=> start!84316 m!912311))

(declare-fun m!912313 () Bool)

(assert (=> start!84316 m!912313))

(assert (=> b!984800 m!912295))

(assert (=> b!984800 m!912295))

(declare-fun m!912315 () Bool)

(assert (=> b!984800 m!912315))

(assert (=> b!984807 m!912295))

(declare-fun m!912317 () Bool)

(assert (=> b!984807 m!912317))

(declare-fun m!912319 () Bool)

(assert (=> b!984807 m!912319))

(declare-fun m!912321 () Bool)

(assert (=> b!984807 m!912321))

(assert (=> b!984807 m!912317))

(assert (=> b!984807 m!912321))

(declare-fun m!912323 () Bool)

(assert (=> b!984807 m!912323))

(declare-fun m!912325 () Bool)

(assert (=> mapNonEmpty!36455 m!912325))

(check-sat (not b!984801) (not b_lambda!14895) (not b!984806) b_and!31787 (not b!984800) (not start!84316) (not b_next!19849) tp_is_empty!22951 (not b!984807) (not b!984802) (not mapNonEmpty!36455))
(check-sat b_and!31787 (not b_next!19849))
