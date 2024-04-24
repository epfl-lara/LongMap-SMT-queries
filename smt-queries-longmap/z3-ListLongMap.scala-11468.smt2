; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134018 () Bool)

(assert start!134018)

(declare-fun b_free!32023 () Bool)

(declare-fun b_next!32023 () Bool)

(assert (=> start!134018 (= b_free!32023 (not b_next!32023))))

(declare-fun tp!113193 () Bool)

(declare-fun b_and!51559 () Bool)

(assert (=> start!134018 (= tp!113193 b_and!51559)))

(declare-fun b!1564554 () Bool)

(declare-fun e!872015 () Bool)

(declare-fun e!872017 () Bool)

(declare-fun mapRes!59409 () Bool)

(assert (=> b!1564554 (= e!872015 (and e!872017 mapRes!59409))))

(declare-fun condMapEmpty!59409 () Bool)

(declare-datatypes ((V!59793 0))(
  ( (V!59794 (val!19428 Int)) )
))
(declare-datatypes ((ValueCell!18314 0))(
  ( (ValueCellFull!18314 (v!22172 V!59793)) (EmptyCell!18314) )
))
(declare-datatypes ((array!104210 0))(
  ( (array!104211 (arr!50290 (Array (_ BitVec 32) ValueCell!18314)) (size!50841 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104210)

(declare-fun mapDefault!59409 () ValueCell!18314)

(assert (=> b!1564554 (= condMapEmpty!59409 (= (arr!50290 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18314)) mapDefault!59409)))))

(declare-fun b!1564555 () Bool)

(declare-fun e!872016 () Bool)

(assert (=> b!1564555 (= e!872016 (not true))))

(declare-fun lt!672405 () Bool)

(declare-datatypes ((tuple2!25162 0))(
  ( (tuple2!25163 (_1!12592 (_ BitVec 64)) (_2!12592 V!59793)) )
))
(declare-datatypes ((List!36501 0))(
  ( (Nil!36498) (Cons!36497 (h!37961 tuple2!25162) (t!51306 List!36501)) )
))
(declare-datatypes ((ListLongMap!22605 0))(
  ( (ListLongMap!22606 (toList!11318 List!36501)) )
))
(declare-fun lt!672404 () ListLongMap!22605)

(declare-fun contains!10319 (ListLongMap!22605 (_ BitVec 64)) Bool)

(assert (=> b!1564555 (= lt!672405 (contains!10319 lt!672404 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564555 (not (contains!10319 lt!672404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672406 () ListLongMap!22605)

(declare-datatypes ((array!104212 0))(
  ( (array!104213 (arr!50291 (Array (_ BitVec 32) (_ BitVec 64))) (size!50842 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104212)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!672403 () V!59793)

(declare-fun +!5094 (ListLongMap!22605 tuple2!25162) ListLongMap!22605)

(assert (=> b!1564555 (= lt!672404 (+!5094 lt!672406 (tuple2!25163 (select (arr!50291 _keys!637) from!782) lt!672403)))))

(declare-datatypes ((Unit!51873 0))(
  ( (Unit!51874) )
))
(declare-fun lt!672407 () Unit!51873)

(declare-fun addStillNotContains!545 (ListLongMap!22605 (_ BitVec 64) V!59793 (_ BitVec 64)) Unit!51873)

(assert (=> b!1564555 (= lt!672407 (addStillNotContains!545 lt!672406 (select (arr!50291 _keys!637) from!782) lt!672403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26280 (ValueCell!18314 V!59793) V!59793)

(declare-fun dynLambda!3892 (Int (_ BitVec 64)) V!59793)

(assert (=> b!1564555 (= lt!672403 (get!26280 (select (arr!50290 _values!487) from!782) (dynLambda!3892 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59793)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59793)

(declare-fun getCurrentListMapNoExtraKeys!6717 (array!104212 array!104210 (_ BitVec 32) (_ BitVec 32) V!59793 V!59793 (_ BitVec 32) Int) ListLongMap!22605)

(assert (=> b!1564555 (= lt!672406 (getCurrentListMapNoExtraKeys!6717 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564556 () Bool)

(declare-fun res!1068912 () Bool)

(assert (=> b!1564556 (=> (not res!1068912) (not e!872016))))

(assert (=> b!1564556 (= res!1068912 (and (= (size!50841 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50842 _keys!637) (size!50841 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564557 () Bool)

(declare-fun res!1068913 () Bool)

(assert (=> b!1564557 (=> (not res!1068913) (not e!872016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564557 (= res!1068913 (validKeyInArray!0 (select (arr!50291 _keys!637) from!782)))))

(declare-fun b!1564558 () Bool)

(declare-fun res!1068911 () Bool)

(assert (=> b!1564558 (=> (not res!1068911) (not e!872016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104212 (_ BitVec 32)) Bool)

(assert (=> b!1564558 (= res!1068911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1068914 () Bool)

(assert (=> start!134018 (=> (not res!1068914) (not e!872016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134018 (= res!1068914 (validMask!0 mask!947))))

(assert (=> start!134018 e!872016))

(assert (=> start!134018 tp!113193))

(declare-fun tp_is_empty!38689 () Bool)

(assert (=> start!134018 tp_is_empty!38689))

(assert (=> start!134018 true))

(declare-fun array_inv!39339 (array!104212) Bool)

(assert (=> start!134018 (array_inv!39339 _keys!637)))

(declare-fun array_inv!39340 (array!104210) Bool)

(assert (=> start!134018 (and (array_inv!39340 _values!487) e!872015)))

(declare-fun mapNonEmpty!59409 () Bool)

(declare-fun tp!113192 () Bool)

(declare-fun e!872013 () Bool)

(assert (=> mapNonEmpty!59409 (= mapRes!59409 (and tp!113192 e!872013))))

(declare-fun mapRest!59409 () (Array (_ BitVec 32) ValueCell!18314))

(declare-fun mapKey!59409 () (_ BitVec 32))

(declare-fun mapValue!59409 () ValueCell!18314)

(assert (=> mapNonEmpty!59409 (= (arr!50290 _values!487) (store mapRest!59409 mapKey!59409 mapValue!59409))))

(declare-fun b!1564559 () Bool)

(declare-fun res!1068909 () Bool)

(assert (=> b!1564559 (=> (not res!1068909) (not e!872016))))

(declare-datatypes ((List!36502 0))(
  ( (Nil!36499) (Cons!36498 (h!37962 (_ BitVec 64)) (t!51307 List!36502)) )
))
(declare-fun arrayNoDuplicates!0 (array!104212 (_ BitVec 32) List!36502) Bool)

(assert (=> b!1564559 (= res!1068909 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36499))))

(declare-fun b!1564560 () Bool)

(assert (=> b!1564560 (= e!872017 tp_is_empty!38689)))

(declare-fun b!1564561 () Bool)

(declare-fun res!1068910 () Bool)

(assert (=> b!1564561 (=> (not res!1068910) (not e!872016))))

(assert (=> b!1564561 (= res!1068910 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50842 _keys!637)) (bvslt from!782 (size!50842 _keys!637))))))

(declare-fun mapIsEmpty!59409 () Bool)

(assert (=> mapIsEmpty!59409 mapRes!59409))

(declare-fun b!1564562 () Bool)

(assert (=> b!1564562 (= e!872013 tp_is_empty!38689)))

(assert (= (and start!134018 res!1068914) b!1564556))

(assert (= (and b!1564556 res!1068912) b!1564558))

(assert (= (and b!1564558 res!1068911) b!1564559))

(assert (= (and b!1564559 res!1068909) b!1564561))

(assert (= (and b!1564561 res!1068910) b!1564557))

(assert (= (and b!1564557 res!1068913) b!1564555))

(assert (= (and b!1564554 condMapEmpty!59409) mapIsEmpty!59409))

(assert (= (and b!1564554 (not condMapEmpty!59409)) mapNonEmpty!59409))

(get-info :version)

(assert (= (and mapNonEmpty!59409 ((_ is ValueCellFull!18314) mapValue!59409)) b!1564562))

(assert (= (and b!1564554 ((_ is ValueCellFull!18314) mapDefault!59409)) b!1564560))

(assert (= start!134018 b!1564554))

(declare-fun b_lambda!24891 () Bool)

(assert (=> (not b_lambda!24891) (not b!1564555)))

(declare-fun t!51305 () Bool)

(declare-fun tb!12559 () Bool)

(assert (=> (and start!134018 (= defaultEntry!495 defaultEntry!495) t!51305) tb!12559))

(declare-fun result!26407 () Bool)

(assert (=> tb!12559 (= result!26407 tp_is_empty!38689)))

(assert (=> b!1564555 t!51305))

(declare-fun b_and!51561 () Bool)

(assert (= b_and!51559 (and (=> t!51305 result!26407) b_and!51561)))

(declare-fun m!1440099 () Bool)

(assert (=> b!1564559 m!1440099))

(declare-fun m!1440101 () Bool)

(assert (=> b!1564558 m!1440101))

(declare-fun m!1440103 () Bool)

(assert (=> start!134018 m!1440103))

(declare-fun m!1440105 () Bool)

(assert (=> start!134018 m!1440105))

(declare-fun m!1440107 () Bool)

(assert (=> start!134018 m!1440107))

(declare-fun m!1440109 () Bool)

(assert (=> mapNonEmpty!59409 m!1440109))

(declare-fun m!1440111 () Bool)

(assert (=> b!1564557 m!1440111))

(assert (=> b!1564557 m!1440111))

(declare-fun m!1440113 () Bool)

(assert (=> b!1564557 m!1440113))

(declare-fun m!1440115 () Bool)

(assert (=> b!1564555 m!1440115))

(declare-fun m!1440117 () Bool)

(assert (=> b!1564555 m!1440117))

(declare-fun m!1440119 () Bool)

(assert (=> b!1564555 m!1440119))

(assert (=> b!1564555 m!1440115))

(declare-fun m!1440121 () Bool)

(assert (=> b!1564555 m!1440121))

(declare-fun m!1440123 () Bool)

(assert (=> b!1564555 m!1440123))

(declare-fun m!1440125 () Bool)

(assert (=> b!1564555 m!1440125))

(assert (=> b!1564555 m!1440111))

(declare-fun m!1440127 () Bool)

(assert (=> b!1564555 m!1440127))

(assert (=> b!1564555 m!1440117))

(assert (=> b!1564555 m!1440111))

(declare-fun m!1440129 () Bool)

(assert (=> b!1564555 m!1440129))

(check-sat tp_is_empty!38689 (not b!1564558) (not start!134018) (not b!1564557) (not b!1564559) (not b!1564555) (not b_next!32023) (not mapNonEmpty!59409) (not b_lambda!24891) b_and!51561)
(check-sat b_and!51561 (not b_next!32023))
