; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84190 () Bool)

(assert start!84190)

(declare-fun b_free!19909 () Bool)

(declare-fun b_next!19909 () Bool)

(assert (=> start!84190 (= b_free!19909 (not b_next!19909))))

(declare-fun tp!69331 () Bool)

(declare-fun b_and!31869 () Bool)

(assert (=> start!84190 (= tp!69331 b_and!31869)))

(declare-fun mapIsEmpty!36545 () Bool)

(declare-fun mapRes!36545 () Bool)

(assert (=> mapIsEmpty!36545 mapRes!36545))

(declare-fun res!658972 () Bool)

(declare-fun e!555076 () Bool)

(assert (=> start!84190 (=> (not res!658972) (not e!555076))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84190 (= res!658972 (validMask!0 mask!1948))))

(assert (=> start!84190 e!555076))

(assert (=> start!84190 true))

(declare-fun tp_is_empty!23011 () Bool)

(assert (=> start!84190 tp_is_empty!23011))

(declare-datatypes ((V!35665 0))(
  ( (V!35666 (val!11556 Int)) )
))
(declare-datatypes ((ValueCell!11024 0))(
  ( (ValueCellFull!11024 (v!14117 V!35665)) (EmptyCell!11024) )
))
(declare-datatypes ((array!61928 0))(
  ( (array!61929 (arr!29822 (Array (_ BitVec 32) ValueCell!11024)) (size!30303 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61928)

(declare-fun e!555078 () Bool)

(declare-fun array_inv!23055 (array!61928) Bool)

(assert (=> start!84190 (and (array_inv!23055 _values!1278) e!555078)))

(assert (=> start!84190 tp!69331))

(declare-datatypes ((array!61930 0))(
  ( (array!61931 (arr!29823 (Array (_ BitVec 32) (_ BitVec 64))) (size!30304 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61930)

(declare-fun array_inv!23056 (array!61930) Bool)

(assert (=> start!84190 (array_inv!23056 _keys!1544)))

(declare-fun b!984708 () Bool)

(declare-fun e!555077 () Bool)

(assert (=> b!984708 (= e!555076 e!555077)))

(declare-fun res!658976 () Bool)

(assert (=> b!984708 (=> (not res!658976) (not e!555077))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984708 (= res!658976 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29823 _keys!1544) from!1932))))))

(declare-fun lt!436796 () V!35665)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15493 (ValueCell!11024 V!35665) V!35665)

(declare-fun dynLambda!1823 (Int (_ BitVec 64)) V!35665)

(assert (=> b!984708 (= lt!436796 (get!15493 (select (arr!29822 _values!1278) from!1932) (dynLambda!1823 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35665)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14862 0))(
  ( (tuple2!14863 (_1!7442 (_ BitVec 64)) (_2!7442 V!35665)) )
))
(declare-datatypes ((List!20712 0))(
  ( (Nil!20709) (Cons!20708 (h!21870 tuple2!14862) (t!29556 List!20712)) )
))
(declare-datatypes ((ListLongMap!13549 0))(
  ( (ListLongMap!13550 (toList!6790 List!20712)) )
))
(declare-fun lt!436798 () ListLongMap!13549)

(declare-fun zeroValue!1220 () V!35665)

(declare-fun getCurrentListMapNoExtraKeys!3495 (array!61930 array!61928 (_ BitVec 32) (_ BitVec 32) V!35665 V!35665 (_ BitVec 32) Int) ListLongMap!13549)

(assert (=> b!984708 (= lt!436798 (getCurrentListMapNoExtraKeys!3495 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984709 () Bool)

(declare-fun res!658975 () Bool)

(assert (=> b!984709 (=> (not res!658975) (not e!555076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984709 (= res!658975 (validKeyInArray!0 (select (arr!29823 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36545 () Bool)

(declare-fun tp!69332 () Bool)

(declare-fun e!555075 () Bool)

(assert (=> mapNonEmpty!36545 (= mapRes!36545 (and tp!69332 e!555075))))

(declare-fun mapValue!36545 () ValueCell!11024)

(declare-fun mapKey!36545 () (_ BitVec 32))

(declare-fun mapRest!36545 () (Array (_ BitVec 32) ValueCell!11024))

(assert (=> mapNonEmpty!36545 (= (arr!29822 _values!1278) (store mapRest!36545 mapKey!36545 mapValue!36545))))

(declare-fun b!984710 () Bool)

(declare-fun e!555080 () Bool)

(assert (=> b!984710 (= e!555080 tp_is_empty!23011)))

(declare-fun b!984711 () Bool)

(assert (=> b!984711 (= e!555075 tp_is_empty!23011)))

(declare-fun b!984712 () Bool)

(declare-fun res!658973 () Bool)

(assert (=> b!984712 (=> (not res!658973) (not e!555076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61930 (_ BitVec 32)) Bool)

(assert (=> b!984712 (= res!658973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984713 () Bool)

(declare-fun res!658974 () Bool)

(assert (=> b!984713 (=> (not res!658974) (not e!555076))))

(assert (=> b!984713 (= res!658974 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30304 _keys!1544))))))

(declare-fun b!984714 () Bool)

(assert (=> b!984714 (= e!555077 (not true))))

(declare-fun lt!436800 () tuple2!14862)

(declare-fun lt!436799 () tuple2!14862)

(declare-fun +!3069 (ListLongMap!13549 tuple2!14862) ListLongMap!13549)

(assert (=> b!984714 (= (+!3069 (+!3069 lt!436798 lt!436800) lt!436799) (+!3069 (+!3069 lt!436798 lt!436799) lt!436800))))

(assert (=> b!984714 (= lt!436799 (tuple2!14863 (select (arr!29823 _keys!1544) from!1932) lt!436796))))

(assert (=> b!984714 (= lt!436800 (tuple2!14863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32604 0))(
  ( (Unit!32605) )
))
(declare-fun lt!436797 () Unit!32604)

(declare-fun addCommutativeForDiffKeys!673 (ListLongMap!13549 (_ BitVec 64) V!35665 (_ BitVec 64) V!35665) Unit!32604)

(assert (=> b!984714 (= lt!436797 (addCommutativeForDiffKeys!673 lt!436798 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29823 _keys!1544) from!1932) lt!436796))))

(declare-fun b!984715 () Bool)

(declare-fun res!658971 () Bool)

(assert (=> b!984715 (=> (not res!658971) (not e!555076))))

(declare-datatypes ((List!20713 0))(
  ( (Nil!20710) (Cons!20709 (h!21871 (_ BitVec 64)) (t!29557 List!20713)) )
))
(declare-fun arrayNoDuplicates!0 (array!61930 (_ BitVec 32) List!20713) Bool)

(assert (=> b!984715 (= res!658971 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20710))))

(declare-fun b!984716 () Bool)

(declare-fun res!658970 () Bool)

(assert (=> b!984716 (=> (not res!658970) (not e!555076))))

(assert (=> b!984716 (= res!658970 (and (= (size!30303 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30304 _keys!1544) (size!30303 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984717 () Bool)

(assert (=> b!984717 (= e!555078 (and e!555080 mapRes!36545))))

(declare-fun condMapEmpty!36545 () Bool)

(declare-fun mapDefault!36545 () ValueCell!11024)

(assert (=> b!984717 (= condMapEmpty!36545 (= (arr!29822 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11024)) mapDefault!36545)))))

(declare-fun b!984718 () Bool)

(declare-fun res!658977 () Bool)

(assert (=> b!984718 (=> (not res!658977) (not e!555076))))

(assert (=> b!984718 (= res!658977 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!84190 res!658972) b!984716))

(assert (= (and b!984716 res!658970) b!984712))

(assert (= (and b!984712 res!658973) b!984715))

(assert (= (and b!984715 res!658971) b!984713))

(assert (= (and b!984713 res!658974) b!984709))

(assert (= (and b!984709 res!658975) b!984718))

(assert (= (and b!984718 res!658977) b!984708))

(assert (= (and b!984708 res!658976) b!984714))

(assert (= (and b!984717 condMapEmpty!36545) mapIsEmpty!36545))

(assert (= (and b!984717 (not condMapEmpty!36545)) mapNonEmpty!36545))

(get-info :version)

(assert (= (and mapNonEmpty!36545 ((_ is ValueCellFull!11024) mapValue!36545)) b!984711))

(assert (= (and b!984717 ((_ is ValueCellFull!11024) mapDefault!36545)) b!984710))

(assert (= start!84190 b!984717))

(declare-fun b_lambda!14923 () Bool)

(assert (=> (not b_lambda!14923) (not b!984708)))

(declare-fun t!29555 () Bool)

(declare-fun tb!6695 () Bool)

(assert (=> (and start!84190 (= defaultEntry!1281 defaultEntry!1281) t!29555) tb!6695))

(declare-fun result!13387 () Bool)

(assert (=> tb!6695 (= result!13387 tp_is_empty!23011)))

(assert (=> b!984708 t!29555))

(declare-fun b_and!31871 () Bool)

(assert (= b_and!31869 (and (=> t!29555 result!13387) b_and!31871)))

(declare-fun m!911261 () Bool)

(assert (=> b!984709 m!911261))

(assert (=> b!984709 m!911261))

(declare-fun m!911263 () Bool)

(assert (=> b!984709 m!911263))

(declare-fun m!911265 () Bool)

(assert (=> b!984712 m!911265))

(declare-fun m!911267 () Bool)

(assert (=> mapNonEmpty!36545 m!911267))

(assert (=> b!984708 m!911261))

(declare-fun m!911269 () Bool)

(assert (=> b!984708 m!911269))

(declare-fun m!911271 () Bool)

(assert (=> b!984708 m!911271))

(declare-fun m!911273 () Bool)

(assert (=> b!984708 m!911273))

(assert (=> b!984708 m!911269))

(assert (=> b!984708 m!911273))

(declare-fun m!911275 () Bool)

(assert (=> b!984708 m!911275))

(assert (=> b!984714 m!911261))

(declare-fun m!911277 () Bool)

(assert (=> b!984714 m!911277))

(declare-fun m!911279 () Bool)

(assert (=> b!984714 m!911279))

(assert (=> b!984714 m!911261))

(declare-fun m!911281 () Bool)

(assert (=> b!984714 m!911281))

(declare-fun m!911283 () Bool)

(assert (=> b!984714 m!911283))

(assert (=> b!984714 m!911277))

(assert (=> b!984714 m!911283))

(declare-fun m!911285 () Bool)

(assert (=> b!984714 m!911285))

(declare-fun m!911287 () Bool)

(assert (=> start!84190 m!911287))

(declare-fun m!911289 () Bool)

(assert (=> start!84190 m!911289))

(declare-fun m!911291 () Bool)

(assert (=> start!84190 m!911291))

(declare-fun m!911293 () Bool)

(assert (=> b!984715 m!911293))

(check-sat (not b!984712) tp_is_empty!23011 (not start!84190) (not b!984708) b_and!31871 (not b!984715) (not b_lambda!14923) (not b!984709) (not b_next!19909) (not mapNonEmpty!36545) (not b!984714))
(check-sat b_and!31871 (not b_next!19909))
