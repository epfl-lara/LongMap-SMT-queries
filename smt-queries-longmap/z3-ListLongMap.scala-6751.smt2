; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84822 () Bool)

(assert start!84822)

(declare-fun b_free!20065 () Bool)

(declare-fun b_next!20065 () Bool)

(assert (=> start!84822 (= b_free!20065 (not b_next!20065))))

(declare-fun tp!69991 () Bool)

(declare-fun b_and!32211 () Bool)

(assert (=> start!84822 (= tp!69991 b_and!32211)))

(declare-fun res!662344 () Bool)

(declare-fun e!558816 () Bool)

(assert (=> start!84822 (=> (not res!662344) (not e!558816))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84822 (= res!662344 (validMask!0 mask!1948))))

(assert (=> start!84822 e!558816))

(assert (=> start!84822 true))

(declare-fun tp_is_empty!23281 () Bool)

(assert (=> start!84822 tp_is_empty!23281))

(declare-datatypes ((V!36025 0))(
  ( (V!36026 (val!11691 Int)) )
))
(declare-datatypes ((ValueCell!11159 0))(
  ( (ValueCellFull!11159 (v!14258 V!36025)) (EmptyCell!11159) )
))
(declare-datatypes ((array!62568 0))(
  ( (array!62569 (arr!30131 (Array (_ BitVec 32) ValueCell!11159)) (size!30611 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62568)

(declare-fun e!558814 () Bool)

(declare-fun array_inv!23303 (array!62568) Bool)

(assert (=> start!84822 (and (array_inv!23303 _values!1278) e!558814)))

(assert (=> start!84822 tp!69991))

(declare-datatypes ((array!62570 0))(
  ( (array!62571 (arr!30132 (Array (_ BitVec 32) (_ BitVec 64))) (size!30612 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62570)

(declare-fun array_inv!23304 (array!62570) Bool)

(assert (=> start!84822 (array_inv!23304 _keys!1544)))

(declare-fun b!990893 () Bool)

(declare-fun e!558818 () Bool)

(assert (=> b!990893 (= e!558816 e!558818)))

(declare-fun res!662340 () Bool)

(assert (=> b!990893 (=> (not res!662340) (not e!558818))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!990893 (= res!662340 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30132 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!439527 () V!36025)

(declare-fun get!15665 (ValueCell!11159 V!36025) V!36025)

(declare-fun dynLambda!1898 (Int (_ BitVec 64)) V!36025)

(assert (=> b!990893 (= lt!439527 (get!15665 (select (arr!30131 _values!1278) from!1932) (dynLambda!1898 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!36025)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14922 0))(
  ( (tuple2!14923 (_1!7472 (_ BitVec 64)) (_2!7472 V!36025)) )
))
(declare-datatypes ((List!20830 0))(
  ( (Nil!20827) (Cons!20826 (h!21994 tuple2!14922) (t!29783 List!20830)) )
))
(declare-datatypes ((ListLongMap!13621 0))(
  ( (ListLongMap!13622 (toList!6826 List!20830)) )
))
(declare-fun lt!439528 () ListLongMap!13621)

(declare-fun zeroValue!1220 () V!36025)

(declare-fun getCurrentListMapNoExtraKeys!3554 (array!62570 array!62568 (_ BitVec 32) (_ BitVec 32) V!36025 V!36025 (_ BitVec 32) Int) ListLongMap!13621)

(assert (=> b!990893 (= lt!439528 (getCurrentListMapNoExtraKeys!3554 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36970 () Bool)

(declare-fun mapRes!36970 () Bool)

(assert (=> mapIsEmpty!36970 mapRes!36970))

(declare-fun b!990894 () Bool)

(declare-fun res!662342 () Bool)

(assert (=> b!990894 (=> (not res!662342) (not e!558816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990894 (= res!662342 (validKeyInArray!0 (select (arr!30132 _keys!1544) from!1932)))))

(declare-fun b!990895 () Bool)

(declare-fun res!662339 () Bool)

(assert (=> b!990895 (=> (not res!662339) (not e!558816))))

(assert (=> b!990895 (= res!662339 (and (= (size!30611 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30612 _keys!1544) (size!30611 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990896 () Bool)

(declare-fun res!662345 () Bool)

(assert (=> b!990896 (=> (not res!662345) (not e!558816))))

(assert (=> b!990896 (= res!662345 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30612 _keys!1544))))))

(declare-fun b!990897 () Bool)

(declare-fun res!662341 () Bool)

(assert (=> b!990897 (=> (not res!662341) (not e!558816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62570 (_ BitVec 32)) Bool)

(assert (=> b!990897 (= res!662341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!990898 () Bool)

(declare-fun res!662343 () Bool)

(assert (=> b!990898 (=> (not res!662343) (not e!558816))))

(declare-datatypes ((List!20831 0))(
  ( (Nil!20828) (Cons!20827 (h!21995 (_ BitVec 64)) (t!29784 List!20831)) )
))
(declare-fun arrayNoDuplicates!0 (array!62570 (_ BitVec 32) List!20831) Bool)

(assert (=> b!990898 (= res!662343 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20828))))

(declare-fun b!990899 () Bool)

(declare-fun res!662338 () Bool)

(assert (=> b!990899 (=> (not res!662338) (not e!558816))))

(assert (=> b!990899 (= res!662338 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!990900 () Bool)

(assert (=> b!990900 (= e!558818 (not true))))

(declare-fun lt!439531 () ListLongMap!13621)

(declare-fun getCurrentListMap!3874 (array!62570 array!62568 (_ BitVec 32) (_ BitVec 32) V!36025 V!36025 (_ BitVec 32) Int) ListLongMap!13621)

(assert (=> b!990900 (= lt!439531 (getCurrentListMap!3874 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439529 () tuple2!14922)

(declare-fun lt!439530 () tuple2!14922)

(declare-fun +!3115 (ListLongMap!13621 tuple2!14922) ListLongMap!13621)

(assert (=> b!990900 (= (+!3115 (+!3115 lt!439528 lt!439529) lt!439530) (+!3115 (+!3115 lt!439528 lt!439530) lt!439529))))

(assert (=> b!990900 (= lt!439530 (tuple2!14923 (select (arr!30132 _keys!1544) from!1932) lt!439527))))

(assert (=> b!990900 (= lt!439529 (tuple2!14923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32845 0))(
  ( (Unit!32846) )
))
(declare-fun lt!439526 () Unit!32845)

(declare-fun addCommutativeForDiffKeys!716 (ListLongMap!13621 (_ BitVec 64) V!36025 (_ BitVec 64) V!36025) Unit!32845)

(assert (=> b!990900 (= lt!439526 (addCommutativeForDiffKeys!716 lt!439528 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30132 _keys!1544) from!1932) lt!439527))))

(declare-fun b!990901 () Bool)

(declare-fun e!558815 () Bool)

(assert (=> b!990901 (= e!558815 tp_is_empty!23281)))

(declare-fun b!990902 () Bool)

(declare-fun e!558819 () Bool)

(assert (=> b!990902 (= e!558819 tp_is_empty!23281)))

(declare-fun mapNonEmpty!36970 () Bool)

(declare-fun tp!69990 () Bool)

(assert (=> mapNonEmpty!36970 (= mapRes!36970 (and tp!69990 e!558815))))

(declare-fun mapValue!36970 () ValueCell!11159)

(declare-fun mapRest!36970 () (Array (_ BitVec 32) ValueCell!11159))

(declare-fun mapKey!36970 () (_ BitVec 32))

(assert (=> mapNonEmpty!36970 (= (arr!30131 _values!1278) (store mapRest!36970 mapKey!36970 mapValue!36970))))

(declare-fun b!990903 () Bool)

(assert (=> b!990903 (= e!558814 (and e!558819 mapRes!36970))))

(declare-fun condMapEmpty!36970 () Bool)

(declare-fun mapDefault!36970 () ValueCell!11159)

(assert (=> b!990903 (= condMapEmpty!36970 (= (arr!30131 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11159)) mapDefault!36970)))))

(assert (= (and start!84822 res!662344) b!990895))

(assert (= (and b!990895 res!662339) b!990897))

(assert (= (and b!990897 res!662341) b!990898))

(assert (= (and b!990898 res!662343) b!990896))

(assert (= (and b!990896 res!662345) b!990894))

(assert (= (and b!990894 res!662342) b!990899))

(assert (= (and b!990899 res!662338) b!990893))

(assert (= (and b!990893 res!662340) b!990900))

(assert (= (and b!990903 condMapEmpty!36970) mapIsEmpty!36970))

(assert (= (and b!990903 (not condMapEmpty!36970)) mapNonEmpty!36970))

(get-info :version)

(assert (= (and mapNonEmpty!36970 ((_ is ValueCellFull!11159) mapValue!36970)) b!990901))

(assert (= (and b!990903 ((_ is ValueCellFull!11159) mapDefault!36970)) b!990902))

(assert (= start!84822 b!990903))

(declare-fun b_lambda!15159 () Bool)

(assert (=> (not b_lambda!15159) (not b!990893)))

(declare-fun t!29782 () Bool)

(declare-fun tb!6803 () Bool)

(assert (=> (and start!84822 (= defaultEntry!1281 defaultEntry!1281) t!29782) tb!6803))

(declare-fun result!13615 () Bool)

(assert (=> tb!6803 (= result!13615 tp_is_empty!23281)))

(assert (=> b!990893 t!29782))

(declare-fun b_and!32213 () Bool)

(assert (= b_and!32211 (and (=> t!29782 result!13615) b_and!32213)))

(declare-fun m!918681 () Bool)

(assert (=> mapNonEmpty!36970 m!918681))

(declare-fun m!918683 () Bool)

(assert (=> b!990894 m!918683))

(assert (=> b!990894 m!918683))

(declare-fun m!918685 () Bool)

(assert (=> b!990894 m!918685))

(declare-fun m!918687 () Bool)

(assert (=> start!84822 m!918687))

(declare-fun m!918689 () Bool)

(assert (=> start!84822 m!918689))

(declare-fun m!918691 () Bool)

(assert (=> start!84822 m!918691))

(assert (=> b!990900 m!918683))

(declare-fun m!918693 () Bool)

(assert (=> b!990900 m!918693))

(assert (=> b!990900 m!918693))

(declare-fun m!918695 () Bool)

(assert (=> b!990900 m!918695))

(declare-fun m!918697 () Bool)

(assert (=> b!990900 m!918697))

(declare-fun m!918699 () Bool)

(assert (=> b!990900 m!918699))

(declare-fun m!918701 () Bool)

(assert (=> b!990900 m!918701))

(assert (=> b!990900 m!918683))

(declare-fun m!918703 () Bool)

(assert (=> b!990900 m!918703))

(assert (=> b!990900 m!918697))

(declare-fun m!918705 () Bool)

(assert (=> b!990898 m!918705))

(assert (=> b!990893 m!918683))

(declare-fun m!918707 () Bool)

(assert (=> b!990893 m!918707))

(declare-fun m!918709 () Bool)

(assert (=> b!990893 m!918709))

(declare-fun m!918711 () Bool)

(assert (=> b!990893 m!918711))

(assert (=> b!990893 m!918707))

(assert (=> b!990893 m!918711))

(declare-fun m!918713 () Bool)

(assert (=> b!990893 m!918713))

(declare-fun m!918715 () Bool)

(assert (=> b!990897 m!918715))

(check-sat (not b!990894) (not start!84822) (not b_next!20065) (not b!990900) (not b!990897) (not b!990898) tp_is_empty!23281 (not b!990893) (not mapNonEmpty!36970) (not b_lambda!15159) b_and!32213)
(check-sat b_and!32213 (not b_next!20065))
