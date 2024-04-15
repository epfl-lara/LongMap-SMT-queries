; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84208 () Bool)

(assert start!84208)

(declare-fun b_free!19927 () Bool)

(declare-fun b_next!19927 () Bool)

(assert (=> start!84208 (= b_free!19927 (not b_next!19927))))

(declare-fun tp!69385 () Bool)

(declare-fun b_and!31905 () Bool)

(assert (=> start!84208 (= tp!69385 b_and!31905)))

(declare-fun mapIsEmpty!36572 () Bool)

(declare-fun mapRes!36572 () Bool)

(assert (=> mapIsEmpty!36572 mapRes!36572))

(declare-fun mapNonEmpty!36572 () Bool)

(declare-fun tp!69386 () Bool)

(declare-fun e!555241 () Bool)

(assert (=> mapNonEmpty!36572 (= mapRes!36572 (and tp!69386 e!555241))))

(declare-fun mapKey!36572 () (_ BitVec 32))

(declare-datatypes ((V!35689 0))(
  ( (V!35690 (val!11565 Int)) )
))
(declare-datatypes ((ValueCell!11033 0))(
  ( (ValueCellFull!11033 (v!14126 V!35689)) (EmptyCell!11033) )
))
(declare-datatypes ((array!61962 0))(
  ( (array!61963 (arr!29839 (Array (_ BitVec 32) ValueCell!11033)) (size!30320 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61962)

(declare-fun mapRest!36572 () (Array (_ BitVec 32) ValueCell!11033))

(declare-fun mapValue!36572 () ValueCell!11033)

(assert (=> mapNonEmpty!36572 (= (arr!29839 _values!1278) (store mapRest!36572 mapKey!36572 mapValue!36572))))

(declare-fun b!985024 () Bool)

(declare-fun res!659192 () Bool)

(declare-fun e!555242 () Bool)

(assert (=> b!985024 (=> (not res!659192) (not e!555242))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985024 (= res!659192 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985025 () Bool)

(declare-fun res!659186 () Bool)

(assert (=> b!985025 (=> (not res!659186) (not e!555242))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((array!61964 0))(
  ( (array!61965 (arr!29840 (Array (_ BitVec 32) (_ BitVec 64))) (size!30321 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61964)

(assert (=> b!985025 (= res!659186 (and (= (size!30320 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30321 _keys!1544) (size!30320 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985026 () Bool)

(declare-fun tp_is_empty!23029 () Bool)

(assert (=> b!985026 (= e!555241 tp_is_empty!23029)))

(declare-fun b!985027 () Bool)

(declare-fun e!555239 () Bool)

(assert (=> b!985027 (= e!555239 (not true))))

(declare-datatypes ((tuple2!14878 0))(
  ( (tuple2!14879 (_1!7450 (_ BitVec 64)) (_2!7450 V!35689)) )
))
(declare-datatypes ((List!20726 0))(
  ( (Nil!20723) (Cons!20722 (h!21884 tuple2!14878) (t!29588 List!20726)) )
))
(declare-datatypes ((ListLongMap!13565 0))(
  ( (ListLongMap!13566 (toList!6798 List!20726)) )
))
(declare-fun lt!436932 () ListLongMap!13565)

(declare-fun lt!436935 () tuple2!14878)

(declare-fun lt!436934 () tuple2!14878)

(declare-fun +!3075 (ListLongMap!13565 tuple2!14878) ListLongMap!13565)

(assert (=> b!985027 (= (+!3075 (+!3075 lt!436932 lt!436935) lt!436934) (+!3075 (+!3075 lt!436932 lt!436934) lt!436935))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!436931 () V!35689)

(assert (=> b!985027 (= lt!436934 (tuple2!14879 (select (arr!29840 _keys!1544) from!1932) lt!436931))))

(declare-fun minValue!1220 () V!35689)

(assert (=> b!985027 (= lt!436935 (tuple2!14879 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32616 0))(
  ( (Unit!32617) )
))
(declare-fun lt!436933 () Unit!32616)

(declare-fun addCommutativeForDiffKeys!679 (ListLongMap!13565 (_ BitVec 64) V!35689 (_ BitVec 64) V!35689) Unit!32616)

(assert (=> b!985027 (= lt!436933 (addCommutativeForDiffKeys!679 lt!436932 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29840 _keys!1544) from!1932) lt!436931))))

(declare-fun b!985028 () Bool)

(declare-fun res!659187 () Bool)

(assert (=> b!985028 (=> (not res!659187) (not e!555242))))

(assert (=> b!985028 (= res!659187 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30321 _keys!1544))))))

(declare-fun b!985029 () Bool)

(declare-fun res!659190 () Bool)

(assert (=> b!985029 (=> (not res!659190) (not e!555242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985029 (= res!659190 (validKeyInArray!0 (select (arr!29840 _keys!1544) from!1932)))))

(declare-fun b!985030 () Bool)

(declare-fun e!555240 () Bool)

(assert (=> b!985030 (= e!555240 tp_is_empty!23029)))

(declare-fun b!985031 () Bool)

(assert (=> b!985031 (= e!555242 e!555239)))

(declare-fun res!659193 () Bool)

(assert (=> b!985031 (=> (not res!659193) (not e!555239))))

(assert (=> b!985031 (= res!659193 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29840 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15507 (ValueCell!11033 V!35689) V!35689)

(declare-fun dynLambda!1831 (Int (_ BitVec 64)) V!35689)

(assert (=> b!985031 (= lt!436931 (get!15507 (select (arr!29839 _values!1278) from!1932) (dynLambda!1831 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35689)

(declare-fun getCurrentListMapNoExtraKeys!3503 (array!61964 array!61962 (_ BitVec 32) (_ BitVec 32) V!35689 V!35689 (_ BitVec 32) Int) ListLongMap!13565)

(assert (=> b!985031 (= lt!436932 (getCurrentListMapNoExtraKeys!3503 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985023 () Bool)

(declare-fun res!659188 () Bool)

(assert (=> b!985023 (=> (not res!659188) (not e!555242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61964 (_ BitVec 32)) Bool)

(assert (=> b!985023 (= res!659188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!659191 () Bool)

(assert (=> start!84208 (=> (not res!659191) (not e!555242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84208 (= res!659191 (validMask!0 mask!1948))))

(assert (=> start!84208 e!555242))

(assert (=> start!84208 true))

(assert (=> start!84208 tp_is_empty!23029))

(declare-fun e!555238 () Bool)

(declare-fun array_inv!23069 (array!61962) Bool)

(assert (=> start!84208 (and (array_inv!23069 _values!1278) e!555238)))

(assert (=> start!84208 tp!69385))

(declare-fun array_inv!23070 (array!61964) Bool)

(assert (=> start!84208 (array_inv!23070 _keys!1544)))

(declare-fun b!985032 () Bool)

(declare-fun res!659189 () Bool)

(assert (=> b!985032 (=> (not res!659189) (not e!555242))))

(declare-datatypes ((List!20727 0))(
  ( (Nil!20724) (Cons!20723 (h!21885 (_ BitVec 64)) (t!29589 List!20727)) )
))
(declare-fun arrayNoDuplicates!0 (array!61964 (_ BitVec 32) List!20727) Bool)

(assert (=> b!985032 (= res!659189 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20724))))

(declare-fun b!985033 () Bool)

(assert (=> b!985033 (= e!555238 (and e!555240 mapRes!36572))))

(declare-fun condMapEmpty!36572 () Bool)

(declare-fun mapDefault!36572 () ValueCell!11033)

(assert (=> b!985033 (= condMapEmpty!36572 (= (arr!29839 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11033)) mapDefault!36572)))))

(assert (= (and start!84208 res!659191) b!985025))

(assert (= (and b!985025 res!659186) b!985023))

(assert (= (and b!985023 res!659188) b!985032))

(assert (= (and b!985032 res!659189) b!985028))

(assert (= (and b!985028 res!659187) b!985029))

(assert (= (and b!985029 res!659190) b!985024))

(assert (= (and b!985024 res!659192) b!985031))

(assert (= (and b!985031 res!659193) b!985027))

(assert (= (and b!985033 condMapEmpty!36572) mapIsEmpty!36572))

(assert (= (and b!985033 (not condMapEmpty!36572)) mapNonEmpty!36572))

(get-info :version)

(assert (= (and mapNonEmpty!36572 ((_ is ValueCellFull!11033) mapValue!36572)) b!985026))

(assert (= (and b!985033 ((_ is ValueCellFull!11033) mapDefault!36572)) b!985030))

(assert (= start!84208 b!985033))

(declare-fun b_lambda!14941 () Bool)

(assert (=> (not b_lambda!14941) (not b!985031)))

(declare-fun t!29587 () Bool)

(declare-fun tb!6713 () Bool)

(assert (=> (and start!84208 (= defaultEntry!1281 defaultEntry!1281) t!29587) tb!6713))

(declare-fun result!13423 () Bool)

(assert (=> tb!6713 (= result!13423 tp_is_empty!23029)))

(assert (=> b!985031 t!29587))

(declare-fun b_and!31907 () Bool)

(assert (= b_and!31905 (and (=> t!29587 result!13423) b_and!31907)))

(declare-fun m!911567 () Bool)

(assert (=> mapNonEmpty!36572 m!911567))

(declare-fun m!911569 () Bool)

(assert (=> b!985023 m!911569))

(declare-fun m!911571 () Bool)

(assert (=> b!985032 m!911571))

(declare-fun m!911573 () Bool)

(assert (=> b!985031 m!911573))

(declare-fun m!911575 () Bool)

(assert (=> b!985031 m!911575))

(declare-fun m!911577 () Bool)

(assert (=> b!985031 m!911577))

(declare-fun m!911579 () Bool)

(assert (=> b!985031 m!911579))

(assert (=> b!985031 m!911575))

(assert (=> b!985031 m!911579))

(declare-fun m!911581 () Bool)

(assert (=> b!985031 m!911581))

(declare-fun m!911583 () Bool)

(assert (=> start!84208 m!911583))

(declare-fun m!911585 () Bool)

(assert (=> start!84208 m!911585))

(declare-fun m!911587 () Bool)

(assert (=> start!84208 m!911587))

(assert (=> b!985029 m!911573))

(assert (=> b!985029 m!911573))

(declare-fun m!911589 () Bool)

(assert (=> b!985029 m!911589))

(declare-fun m!911591 () Bool)

(assert (=> b!985027 m!911591))

(assert (=> b!985027 m!911573))

(declare-fun m!911593 () Bool)

(assert (=> b!985027 m!911593))

(assert (=> b!985027 m!911591))

(declare-fun m!911595 () Bool)

(assert (=> b!985027 m!911595))

(declare-fun m!911597 () Bool)

(assert (=> b!985027 m!911597))

(assert (=> b!985027 m!911597))

(declare-fun m!911599 () Bool)

(assert (=> b!985027 m!911599))

(assert (=> b!985027 m!911573))

(check-sat (not b!985029) (not b_lambda!14941) (not b!985027) (not b!985032) tp_is_empty!23029 (not b_next!19927) (not start!84208) (not mapNonEmpty!36572) b_and!31907 (not b!985031) (not b!985023))
(check-sat b_and!31907 (not b_next!19927))
