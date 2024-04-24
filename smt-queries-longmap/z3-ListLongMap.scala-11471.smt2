; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134036 () Bool)

(assert start!134036)

(declare-fun b_free!32041 () Bool)

(declare-fun b_next!32041 () Bool)

(assert (=> start!134036 (= b_free!32041 (not b_next!32041))))

(declare-fun tp!113246 () Bool)

(declare-fun b_and!51595 () Bool)

(assert (=> start!134036 (= tp!113246 b_and!51595)))

(declare-fun b!1564815 () Bool)

(declare-fun res!1069076 () Bool)

(declare-fun e!872149 () Bool)

(assert (=> b!1564815 (=> (not res!1069076) (not e!872149))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104244 0))(
  ( (array!104245 (arr!50307 (Array (_ BitVec 32) (_ BitVec 64))) (size!50858 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104244)

(declare-datatypes ((V!59817 0))(
  ( (V!59818 (val!19437 Int)) )
))
(declare-datatypes ((ValueCell!18323 0))(
  ( (ValueCellFull!18323 (v!22181 V!59817)) (EmptyCell!18323) )
))
(declare-datatypes ((array!104246 0))(
  ( (array!104247 (arr!50308 (Array (_ BitVec 32) ValueCell!18323)) (size!50859 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104246)

(assert (=> b!1564815 (= res!1069076 (and (= (size!50859 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50858 _keys!637) (size!50859 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564816 () Bool)

(declare-fun res!1069072 () Bool)

(assert (=> b!1564816 (=> (not res!1069072) (not e!872149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104244 (_ BitVec 32)) Bool)

(assert (=> b!1564816 (= res!1069072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1069073 () Bool)

(assert (=> start!134036 (=> (not res!1069073) (not e!872149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134036 (= res!1069073 (validMask!0 mask!947))))

(assert (=> start!134036 e!872149))

(assert (=> start!134036 tp!113246))

(declare-fun tp_is_empty!38707 () Bool)

(assert (=> start!134036 tp_is_empty!38707))

(assert (=> start!134036 true))

(declare-fun array_inv!39351 (array!104244) Bool)

(assert (=> start!134036 (array_inv!39351 _keys!637)))

(declare-fun e!872152 () Bool)

(declare-fun array_inv!39352 (array!104246) Bool)

(assert (=> start!134036 (and (array_inv!39352 _values!487) e!872152)))

(declare-fun b!1564817 () Bool)

(declare-fun res!1069075 () Bool)

(assert (=> b!1564817 (=> (not res!1069075) (not e!872149))))

(declare-datatypes ((List!36513 0))(
  ( (Nil!36510) (Cons!36509 (h!37973 (_ BitVec 64)) (t!51336 List!36513)) )
))
(declare-fun arrayNoDuplicates!0 (array!104244 (_ BitVec 32) List!36513) Bool)

(assert (=> b!1564817 (= res!1069075 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36510))))

(declare-fun b!1564818 () Bool)

(declare-fun e!872148 () Bool)

(assert (=> b!1564818 (= e!872148 tp_is_empty!38707)))

(declare-fun b!1564819 () Bool)

(declare-fun res!1069071 () Bool)

(assert (=> b!1564819 (=> (not res!1069071) (not e!872149))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564819 (= res!1069071 (validKeyInArray!0 (select (arr!50307 _keys!637) from!782)))))

(declare-fun b!1564820 () Bool)

(assert (=> b!1564820 (= e!872149 (not true))))

(declare-fun lt!672540 () Bool)

(declare-datatypes ((tuple2!25172 0))(
  ( (tuple2!25173 (_1!12597 (_ BitVec 64)) (_2!12597 V!59817)) )
))
(declare-datatypes ((List!36514 0))(
  ( (Nil!36511) (Cons!36510 (h!37974 tuple2!25172) (t!51337 List!36514)) )
))
(declare-datatypes ((ListLongMap!22615 0))(
  ( (ListLongMap!22616 (toList!11323 List!36514)) )
))
(declare-fun lt!672541 () ListLongMap!22615)

(declare-fun contains!10324 (ListLongMap!22615 (_ BitVec 64)) Bool)

(assert (=> b!1564820 (= lt!672540 (contains!10324 lt!672541 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564820 (not (contains!10324 lt!672541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672539 () ListLongMap!22615)

(declare-fun lt!672538 () V!59817)

(declare-fun +!5099 (ListLongMap!22615 tuple2!25172) ListLongMap!22615)

(assert (=> b!1564820 (= lt!672541 (+!5099 lt!672539 (tuple2!25173 (select (arr!50307 _keys!637) from!782) lt!672538)))))

(declare-datatypes ((Unit!51883 0))(
  ( (Unit!51884) )
))
(declare-fun lt!672542 () Unit!51883)

(declare-fun addStillNotContains!550 (ListLongMap!22615 (_ BitVec 64) V!59817 (_ BitVec 64)) Unit!51883)

(assert (=> b!1564820 (= lt!672542 (addStillNotContains!550 lt!672539 (select (arr!50307 _keys!637) from!782) lt!672538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26291 (ValueCell!18323 V!59817) V!59817)

(declare-fun dynLambda!3897 (Int (_ BitVec 64)) V!59817)

(assert (=> b!1564820 (= lt!672538 (get!26291 (select (arr!50308 _values!487) from!782) (dynLambda!3897 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59817)

(declare-fun minValue!453 () V!59817)

(declare-fun getCurrentListMapNoExtraKeys!6722 (array!104244 array!104246 (_ BitVec 32) (_ BitVec 32) V!59817 V!59817 (_ BitVec 32) Int) ListLongMap!22615)

(assert (=> b!1564820 (= lt!672539 (getCurrentListMapNoExtraKeys!6722 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564821 () Bool)

(declare-fun mapRes!59436 () Bool)

(assert (=> b!1564821 (= e!872152 (and e!872148 mapRes!59436))))

(declare-fun condMapEmpty!59436 () Bool)

(declare-fun mapDefault!59436 () ValueCell!18323)

(assert (=> b!1564821 (= condMapEmpty!59436 (= (arr!50308 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18323)) mapDefault!59436)))))

(declare-fun b!1564822 () Bool)

(declare-fun res!1069074 () Bool)

(assert (=> b!1564822 (=> (not res!1069074) (not e!872149))))

(assert (=> b!1564822 (= res!1069074 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50858 _keys!637)) (bvslt from!782 (size!50858 _keys!637))))))

(declare-fun mapNonEmpty!59436 () Bool)

(declare-fun tp!113247 () Bool)

(declare-fun e!872150 () Bool)

(assert (=> mapNonEmpty!59436 (= mapRes!59436 (and tp!113247 e!872150))))

(declare-fun mapKey!59436 () (_ BitVec 32))

(declare-fun mapRest!59436 () (Array (_ BitVec 32) ValueCell!18323))

(declare-fun mapValue!59436 () ValueCell!18323)

(assert (=> mapNonEmpty!59436 (= (arr!50308 _values!487) (store mapRest!59436 mapKey!59436 mapValue!59436))))

(declare-fun b!1564823 () Bool)

(assert (=> b!1564823 (= e!872150 tp_is_empty!38707)))

(declare-fun mapIsEmpty!59436 () Bool)

(assert (=> mapIsEmpty!59436 mapRes!59436))

(assert (= (and start!134036 res!1069073) b!1564815))

(assert (= (and b!1564815 res!1069076) b!1564816))

(assert (= (and b!1564816 res!1069072) b!1564817))

(assert (= (and b!1564817 res!1069075) b!1564822))

(assert (= (and b!1564822 res!1069074) b!1564819))

(assert (= (and b!1564819 res!1069071) b!1564820))

(assert (= (and b!1564821 condMapEmpty!59436) mapIsEmpty!59436))

(assert (= (and b!1564821 (not condMapEmpty!59436)) mapNonEmpty!59436))

(get-info :version)

(assert (= (and mapNonEmpty!59436 ((_ is ValueCellFull!18323) mapValue!59436)) b!1564823))

(assert (= (and b!1564821 ((_ is ValueCellFull!18323) mapDefault!59436)) b!1564818))

(assert (= start!134036 b!1564821))

(declare-fun b_lambda!24909 () Bool)

(assert (=> (not b_lambda!24909) (not b!1564820)))

(declare-fun t!51335 () Bool)

(declare-fun tb!12577 () Bool)

(assert (=> (and start!134036 (= defaultEntry!495 defaultEntry!495) t!51335) tb!12577))

(declare-fun result!26443 () Bool)

(assert (=> tb!12577 (= result!26443 tp_is_empty!38707)))

(assert (=> b!1564820 t!51335))

(declare-fun b_and!51597 () Bool)

(assert (= b_and!51595 (and (=> t!51335 result!26443) b_and!51597)))

(declare-fun m!1440387 () Bool)

(assert (=> b!1564820 m!1440387))

(declare-fun m!1440389 () Bool)

(assert (=> b!1564820 m!1440389))

(declare-fun m!1440391 () Bool)

(assert (=> b!1564820 m!1440391))

(assert (=> b!1564820 m!1440387))

(declare-fun m!1440393 () Bool)

(assert (=> b!1564820 m!1440393))

(declare-fun m!1440395 () Bool)

(assert (=> b!1564820 m!1440395))

(declare-fun m!1440397 () Bool)

(assert (=> b!1564820 m!1440397))

(declare-fun m!1440399 () Bool)

(assert (=> b!1564820 m!1440399))

(declare-fun m!1440401 () Bool)

(assert (=> b!1564820 m!1440401))

(assert (=> b!1564820 m!1440391))

(assert (=> b!1564820 m!1440395))

(declare-fun m!1440403 () Bool)

(assert (=> b!1564820 m!1440403))

(assert (=> b!1564819 m!1440387))

(assert (=> b!1564819 m!1440387))

(declare-fun m!1440405 () Bool)

(assert (=> b!1564819 m!1440405))

(declare-fun m!1440407 () Bool)

(assert (=> b!1564817 m!1440407))

(declare-fun m!1440409 () Bool)

(assert (=> b!1564816 m!1440409))

(declare-fun m!1440411 () Bool)

(assert (=> mapNonEmpty!59436 m!1440411))

(declare-fun m!1440413 () Bool)

(assert (=> start!134036 m!1440413))

(declare-fun m!1440415 () Bool)

(assert (=> start!134036 m!1440415))

(declare-fun m!1440417 () Bool)

(assert (=> start!134036 m!1440417))

(check-sat b_and!51597 (not b_lambda!24909) (not b!1564817) (not b!1564819) tp_is_empty!38707 (not b!1564820) (not start!134036) (not b_next!32041) (not b!1564816) (not mapNonEmpty!59436))
(check-sat b_and!51597 (not b_next!32041))
