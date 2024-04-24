; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98062 () Bool)

(assert start!98062)

(declare-fun b_free!23527 () Bool)

(declare-fun b_next!23527 () Bool)

(assert (=> start!98062 (= b_free!23527 (not b_next!23527))))

(declare-fun tp!83285 () Bool)

(declare-fun b_and!37847 () Bool)

(assert (=> start!98062 (= tp!83285 b_and!37847)))

(declare-fun b!1120845 () Bool)

(declare-fun res!748336 () Bool)

(declare-fun e!638424 () Bool)

(assert (=> b!1120845 (=> (not res!748336) (not e!638424))))

(declare-datatypes ((array!73045 0))(
  ( (array!73046 (arr!35169 (Array (_ BitVec 32) (_ BitVec 64))) (size!35706 (_ BitVec 32))) )
))
(declare-fun lt!498291 () array!73045)

(declare-datatypes ((List!24476 0))(
  ( (Nil!24473) (Cons!24472 (h!25690 (_ BitVec 64)) (t!34987 List!24476)) )
))
(declare-fun arrayNoDuplicates!0 (array!73045 (_ BitVec 32) List!24476) Bool)

(assert (=> b!1120845 (= res!748336 (arrayNoDuplicates!0 lt!498291 #b00000000000000000000000000000000 Nil!24473))))

(declare-fun b!1120846 () Bool)

(declare-fun res!748339 () Bool)

(declare-fun e!638426 () Bool)

(assert (=> b!1120846 (=> (not res!748339) (not e!638426))))

(declare-fun _keys!1208 () array!73045)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42537 0))(
  ( (V!42538 (val!14085 Int)) )
))
(declare-datatypes ((ValueCell!13319 0))(
  ( (ValueCellFull!13319 (v!16714 V!42537)) (EmptyCell!13319) )
))
(declare-datatypes ((array!73047 0))(
  ( (array!73048 (arr!35170 (Array (_ BitVec 32) ValueCell!13319)) (size!35707 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73047)

(assert (=> b!1120846 (= res!748339 (and (= (size!35707 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35706 _keys!1208) (size!35707 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120847 () Bool)

(declare-fun res!748333 () Bool)

(assert (=> b!1120847 (=> (not res!748333) (not e!638426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73045 (_ BitVec 32)) Bool)

(assert (=> b!1120847 (= res!748333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43903 () Bool)

(declare-fun mapRes!43903 () Bool)

(assert (=> mapIsEmpty!43903 mapRes!43903))

(declare-fun b!1120848 () Bool)

(declare-fun res!748338 () Bool)

(assert (=> b!1120848 (=> (not res!748338) (not e!638426))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120848 (= res!748338 (validKeyInArray!0 k0!934))))

(declare-fun b!1120849 () Bool)

(declare-fun e!638427 () Bool)

(assert (=> b!1120849 (= e!638427 true)))

(declare-fun zeroValue!944 () V!42537)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17684 0))(
  ( (tuple2!17685 (_1!8853 (_ BitVec 64)) (_2!8853 V!42537)) )
))
(declare-datatypes ((List!24477 0))(
  ( (Nil!24474) (Cons!24473 (h!25691 tuple2!17684) (t!34988 List!24477)) )
))
(declare-datatypes ((ListLongMap!15661 0))(
  ( (ListLongMap!15662 (toList!7846 List!24477)) )
))
(declare-fun lt!498292 () ListLongMap!15661)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42537)

(declare-fun getCurrentListMapNoExtraKeys!4376 (array!73045 array!73047 (_ BitVec 32) (_ BitVec 32) V!42537 V!42537 (_ BitVec 32) Int) ListLongMap!15661)

(declare-fun dynLambda!2465 (Int (_ BitVec 64)) V!42537)

(assert (=> b!1120849 (= lt!498292 (getCurrentListMapNoExtraKeys!4376 lt!498291 (array!73048 (store (arr!35170 _values!996) i!673 (ValueCellFull!13319 (dynLambda!2465 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35707 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498290 () ListLongMap!15661)

(assert (=> b!1120849 (= lt!498290 (getCurrentListMapNoExtraKeys!4376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!43903 () Bool)

(declare-fun tp!83284 () Bool)

(declare-fun e!638425 () Bool)

(assert (=> mapNonEmpty!43903 (= mapRes!43903 (and tp!83284 e!638425))))

(declare-fun mapKey!43903 () (_ BitVec 32))

(declare-fun mapValue!43903 () ValueCell!13319)

(declare-fun mapRest!43903 () (Array (_ BitVec 32) ValueCell!13319))

(assert (=> mapNonEmpty!43903 (= (arr!35170 _values!996) (store mapRest!43903 mapKey!43903 mapValue!43903))))

(declare-fun b!1120850 () Bool)

(declare-fun tp_is_empty!28057 () Bool)

(assert (=> b!1120850 (= e!638425 tp_is_empty!28057)))

(declare-fun b!1120851 () Bool)

(declare-fun e!638429 () Bool)

(declare-fun e!638428 () Bool)

(assert (=> b!1120851 (= e!638429 (and e!638428 mapRes!43903))))

(declare-fun condMapEmpty!43903 () Bool)

(declare-fun mapDefault!43903 () ValueCell!13319)

(assert (=> b!1120851 (= condMapEmpty!43903 (= (arr!35170 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13319)) mapDefault!43903)))))

(declare-fun b!1120852 () Bool)

(declare-fun res!748342 () Bool)

(assert (=> b!1120852 (=> (not res!748342) (not e!638426))))

(assert (=> b!1120852 (= res!748342 (= (select (arr!35169 _keys!1208) i!673) k0!934))))

(declare-fun b!1120853 () Bool)

(assert (=> b!1120853 (= e!638424 (not e!638427))))

(declare-fun res!748340 () Bool)

(assert (=> b!1120853 (=> res!748340 e!638427)))

(assert (=> b!1120853 (= res!748340 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120853 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36721 0))(
  ( (Unit!36722) )
))
(declare-fun lt!498289 () Unit!36721)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73045 (_ BitVec 64) (_ BitVec 32)) Unit!36721)

(assert (=> b!1120853 (= lt!498289 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120854 () Bool)

(assert (=> b!1120854 (= e!638426 e!638424)))

(declare-fun res!748335 () Bool)

(assert (=> b!1120854 (=> (not res!748335) (not e!638424))))

(assert (=> b!1120854 (= res!748335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498291 mask!1564))))

(assert (=> b!1120854 (= lt!498291 (array!73046 (store (arr!35169 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35706 _keys!1208)))))

(declare-fun b!1120855 () Bool)

(declare-fun res!748337 () Bool)

(assert (=> b!1120855 (=> (not res!748337) (not e!638426))))

(assert (=> b!1120855 (= res!748337 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35706 _keys!1208))))))

(declare-fun b!1120856 () Bool)

(assert (=> b!1120856 (= e!638428 tp_is_empty!28057)))

(declare-fun b!1120857 () Bool)

(declare-fun res!748332 () Bool)

(assert (=> b!1120857 (=> (not res!748332) (not e!638426))))

(assert (=> b!1120857 (= res!748332 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24473))))

(declare-fun res!748341 () Bool)

(assert (=> start!98062 (=> (not res!748341) (not e!638426))))

(assert (=> start!98062 (= res!748341 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35706 _keys!1208))))))

(assert (=> start!98062 e!638426))

(assert (=> start!98062 tp_is_empty!28057))

(declare-fun array_inv!27076 (array!73045) Bool)

(assert (=> start!98062 (array_inv!27076 _keys!1208)))

(assert (=> start!98062 true))

(assert (=> start!98062 tp!83285))

(declare-fun array_inv!27077 (array!73047) Bool)

(assert (=> start!98062 (and (array_inv!27077 _values!996) e!638429)))

(declare-fun b!1120858 () Bool)

(declare-fun res!748334 () Bool)

(assert (=> b!1120858 (=> (not res!748334) (not e!638426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120858 (= res!748334 (validMask!0 mask!1564))))

(assert (= (and start!98062 res!748341) b!1120858))

(assert (= (and b!1120858 res!748334) b!1120846))

(assert (= (and b!1120846 res!748339) b!1120847))

(assert (= (and b!1120847 res!748333) b!1120857))

(assert (= (and b!1120857 res!748332) b!1120855))

(assert (= (and b!1120855 res!748337) b!1120848))

(assert (= (and b!1120848 res!748338) b!1120852))

(assert (= (and b!1120852 res!748342) b!1120854))

(assert (= (and b!1120854 res!748335) b!1120845))

(assert (= (and b!1120845 res!748336) b!1120853))

(assert (= (and b!1120853 (not res!748340)) b!1120849))

(assert (= (and b!1120851 condMapEmpty!43903) mapIsEmpty!43903))

(assert (= (and b!1120851 (not condMapEmpty!43903)) mapNonEmpty!43903))

(get-info :version)

(assert (= (and mapNonEmpty!43903 ((_ is ValueCellFull!13319) mapValue!43903)) b!1120850))

(assert (= (and b!1120851 ((_ is ValueCellFull!13319) mapDefault!43903)) b!1120856))

(assert (= start!98062 b!1120851))

(declare-fun b_lambda!18507 () Bool)

(assert (=> (not b_lambda!18507) (not b!1120849)))

(declare-fun t!34986 () Bool)

(declare-fun tb!8331 () Bool)

(assert (=> (and start!98062 (= defaultEntry!1004 defaultEntry!1004) t!34986) tb!8331))

(declare-fun result!17231 () Bool)

(assert (=> tb!8331 (= result!17231 tp_is_empty!28057)))

(assert (=> b!1120849 t!34986))

(declare-fun b_and!37849 () Bool)

(assert (= b_and!37847 (and (=> t!34986 result!17231) b_and!37849)))

(declare-fun m!1036455 () Bool)

(assert (=> b!1120858 m!1036455))

(declare-fun m!1036457 () Bool)

(assert (=> b!1120857 m!1036457))

(declare-fun m!1036459 () Bool)

(assert (=> b!1120853 m!1036459))

(declare-fun m!1036461 () Bool)

(assert (=> b!1120853 m!1036461))

(declare-fun m!1036463 () Bool)

(assert (=> b!1120852 m!1036463))

(declare-fun m!1036465 () Bool)

(assert (=> b!1120847 m!1036465))

(declare-fun m!1036467 () Bool)

(assert (=> b!1120854 m!1036467))

(declare-fun m!1036469 () Bool)

(assert (=> b!1120854 m!1036469))

(declare-fun m!1036471 () Bool)

(assert (=> start!98062 m!1036471))

(declare-fun m!1036473 () Bool)

(assert (=> start!98062 m!1036473))

(declare-fun m!1036475 () Bool)

(assert (=> b!1120848 m!1036475))

(declare-fun m!1036477 () Bool)

(assert (=> b!1120845 m!1036477))

(declare-fun m!1036479 () Bool)

(assert (=> mapNonEmpty!43903 m!1036479))

(declare-fun m!1036481 () Bool)

(assert (=> b!1120849 m!1036481))

(declare-fun m!1036483 () Bool)

(assert (=> b!1120849 m!1036483))

(declare-fun m!1036485 () Bool)

(assert (=> b!1120849 m!1036485))

(declare-fun m!1036487 () Bool)

(assert (=> b!1120849 m!1036487))

(check-sat (not b!1120845) tp_is_empty!28057 (not b!1120849) (not b!1120853) (not b_lambda!18507) b_and!37849 (not b_next!23527) (not b!1120857) (not b!1120854) (not b!1120847) (not b!1120858) (not start!98062) (not mapNonEmpty!43903) (not b!1120848))
(check-sat b_and!37849 (not b_next!23527))
