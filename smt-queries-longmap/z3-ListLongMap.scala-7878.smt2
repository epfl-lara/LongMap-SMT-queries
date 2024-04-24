; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98248 () Bool)

(assert start!98248)

(declare-fun b_free!23713 () Bool)

(declare-fun b_next!23713 () Bool)

(assert (=> start!98248 (= b_free!23713 (not b_next!23713))))

(declare-fun tp!83843 () Bool)

(declare-fun b_and!38219 () Bool)

(assert (=> start!98248 (= tp!83843 b_and!38219)))

(declare-fun b!1125777 () Bool)

(declare-fun e!640970 () Bool)

(assert (=> b!1125777 (= e!640970 true)))

(declare-datatypes ((V!42785 0))(
  ( (V!42786 (val!14178 Int)) )
))
(declare-datatypes ((tuple2!17824 0))(
  ( (tuple2!17825 (_1!8923 (_ BitVec 64)) (_2!8923 V!42785)) )
))
(declare-datatypes ((List!24614 0))(
  ( (Nil!24611) (Cons!24610 (h!25828 tuple2!17824) (t!35311 List!24614)) )
))
(declare-datatypes ((ListLongMap!15801 0))(
  ( (ListLongMap!15802 (toList!7916 List!24614)) )
))
(declare-fun lt!499984 () ListLongMap!15801)

(declare-fun zeroValue!944 () V!42785)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6470 (ListLongMap!15801 (_ BitVec 64)) Bool)

(declare-fun +!3448 (ListLongMap!15801 tuple2!17824) ListLongMap!15801)

(assert (=> b!1125777 (contains!6470 (+!3448 lt!499984 (tuple2!17825 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-datatypes ((Unit!36855 0))(
  ( (Unit!36856) )
))
(declare-fun lt!499987 () Unit!36855)

(declare-fun addStillContains!674 (ListLongMap!15801 (_ BitVec 64) V!42785 (_ BitVec 64)) Unit!36855)

(assert (=> b!1125777 (= lt!499987 (addStillContains!674 lt!499984 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125778 () Bool)

(declare-fun res!751829 () Bool)

(declare-fun e!640964 () Bool)

(assert (=> b!1125778 (=> (not res!751829) (not e!640964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125778 (= res!751829 (validKeyInArray!0 k0!934))))

(declare-fun b!1125779 () Bool)

(declare-fun e!640968 () Bool)

(assert (=> b!1125779 (= e!640968 e!640970)))

(declare-fun res!751828 () Bool)

(assert (=> b!1125779 (=> res!751828 e!640970)))

(assert (=> b!1125779 (= res!751828 (not (contains!6470 lt!499984 k0!934)))))

(declare-datatypes ((array!73399 0))(
  ( (array!73400 (arr!35346 (Array (_ BitVec 32) (_ BitVec 64))) (size!35883 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73399)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13412 0))(
  ( (ValueCellFull!13412 (v!16807 V!42785)) (EmptyCell!13412) )
))
(declare-datatypes ((array!73401 0))(
  ( (array!73402 (arr!35347 (Array (_ BitVec 32) ValueCell!13412)) (size!35884 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73401)

(declare-fun minValue!944 () V!42785)

(declare-fun getCurrentListMapNoExtraKeys!4442 (array!73399 array!73401 (_ BitVec 32) (_ BitVec 32) V!42785 V!42785 (_ BitVec 32) Int) ListLongMap!15801)

(assert (=> b!1125779 (= lt!499984 (getCurrentListMapNoExtraKeys!4442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125780 () Bool)

(declare-fun res!751830 () Bool)

(assert (=> b!1125780 (=> res!751830 e!640970)))

(assert (=> b!1125780 (= res!751830 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125781 () Bool)

(declare-fun e!640963 () Bool)

(declare-fun call!47489 () ListLongMap!15801)

(declare-fun call!47488 () ListLongMap!15801)

(assert (=> b!1125781 (= e!640963 (= call!47489 call!47488))))

(declare-fun bm!47485 () Bool)

(assert (=> bm!47485 (= call!47488 (getCurrentListMapNoExtraKeys!4442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125782 () Bool)

(declare-fun res!751837 () Bool)

(assert (=> b!1125782 (=> (not res!751837) (not e!640964))))

(assert (=> b!1125782 (= res!751837 (and (= (size!35884 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35883 _keys!1208) (size!35884 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125783 () Bool)

(declare-fun e!640966 () Bool)

(declare-fun tp_is_empty!28243 () Bool)

(assert (=> b!1125783 (= e!640966 tp_is_empty!28243)))

(declare-fun b!1125784 () Bool)

(declare-fun -!1103 (ListLongMap!15801 (_ BitVec 64)) ListLongMap!15801)

(assert (=> b!1125784 (= e!640963 (= call!47489 (-!1103 call!47488 k0!934)))))

(declare-fun mapIsEmpty!44182 () Bool)

(declare-fun mapRes!44182 () Bool)

(assert (=> mapIsEmpty!44182 mapRes!44182))

(declare-fun b!1125785 () Bool)

(declare-fun e!640969 () Bool)

(assert (=> b!1125785 (= e!640969 e!640968)))

(declare-fun res!751836 () Bool)

(assert (=> b!1125785 (=> res!751836 e!640968)))

(assert (=> b!1125785 (= res!751836 (not (= (select (arr!35346 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125785 e!640963))

(declare-fun c!109970 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125785 (= c!109970 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499982 () Unit!36855)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!366 (array!73399 array!73401 (_ BitVec 32) (_ BitVec 32) V!42785 V!42785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36855)

(assert (=> b!1125785 (= lt!499982 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125786 () Bool)

(declare-fun res!751833 () Bool)

(assert (=> b!1125786 (=> (not res!751833) (not e!640964))))

(declare-datatypes ((List!24615 0))(
  ( (Nil!24612) (Cons!24611 (h!25829 (_ BitVec 64)) (t!35312 List!24615)) )
))
(declare-fun arrayNoDuplicates!0 (array!73399 (_ BitVec 32) List!24615) Bool)

(assert (=> b!1125786 (= res!751833 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24612))))

(declare-fun b!1125787 () Bool)

(declare-fun res!751824 () Bool)

(assert (=> b!1125787 (=> (not res!751824) (not e!640964))))

(assert (=> b!1125787 (= res!751824 (= (select (arr!35346 _keys!1208) i!673) k0!934))))

(declare-fun b!1125788 () Bool)

(declare-fun e!640967 () Bool)

(declare-fun e!640971 () Bool)

(assert (=> b!1125788 (= e!640967 (not e!640971))))

(declare-fun res!751831 () Bool)

(assert (=> b!1125788 (=> res!751831 e!640971)))

(assert (=> b!1125788 (= res!751831 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125788 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499983 () Unit!36855)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73399 (_ BitVec 64) (_ BitVec 32)) Unit!36855)

(assert (=> b!1125788 (= lt!499983 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!751827 () Bool)

(assert (=> start!98248 (=> (not res!751827) (not e!640964))))

(assert (=> start!98248 (= res!751827 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35883 _keys!1208))))))

(assert (=> start!98248 e!640964))

(assert (=> start!98248 tp_is_empty!28243))

(declare-fun array_inv!27192 (array!73399) Bool)

(assert (=> start!98248 (array_inv!27192 _keys!1208)))

(assert (=> start!98248 true))

(assert (=> start!98248 tp!83843))

(declare-fun e!640961 () Bool)

(declare-fun array_inv!27193 (array!73401) Bool)

(assert (=> start!98248 (and (array_inv!27193 _values!996) e!640961)))

(declare-fun b!1125789 () Bool)

(assert (=> b!1125789 (= e!640971 e!640969)))

(declare-fun res!751825 () Bool)

(assert (=> b!1125789 (=> res!751825 e!640969)))

(assert (=> b!1125789 (= res!751825 (not (= from!1455 i!673)))))

(declare-fun lt!499985 () array!73401)

(declare-fun lt!499981 () ListLongMap!15801)

(declare-fun lt!499980 () array!73399)

(assert (=> b!1125789 (= lt!499981 (getCurrentListMapNoExtraKeys!4442 lt!499980 lt!499985 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2520 (Int (_ BitVec 64)) V!42785)

(assert (=> b!1125789 (= lt!499985 (array!73402 (store (arr!35347 _values!996) i!673 (ValueCellFull!13412 (dynLambda!2520 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35884 _values!996)))))

(declare-fun lt!499986 () ListLongMap!15801)

(assert (=> b!1125789 (= lt!499986 (getCurrentListMapNoExtraKeys!4442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47486 () Bool)

(assert (=> bm!47486 (= call!47489 (getCurrentListMapNoExtraKeys!4442 lt!499980 lt!499985 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125790 () Bool)

(assert (=> b!1125790 (= e!640961 (and e!640966 mapRes!44182))))

(declare-fun condMapEmpty!44182 () Bool)

(declare-fun mapDefault!44182 () ValueCell!13412)

(assert (=> b!1125790 (= condMapEmpty!44182 (= (arr!35347 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13412)) mapDefault!44182)))))

(declare-fun b!1125791 () Bool)

(declare-fun res!751826 () Bool)

(assert (=> b!1125791 (=> (not res!751826) (not e!640964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125791 (= res!751826 (validMask!0 mask!1564))))

(declare-fun b!1125792 () Bool)

(declare-fun res!751834 () Bool)

(assert (=> b!1125792 (=> (not res!751834) (not e!640967))))

(assert (=> b!1125792 (= res!751834 (arrayNoDuplicates!0 lt!499980 #b00000000000000000000000000000000 Nil!24612))))

(declare-fun b!1125793 () Bool)

(assert (=> b!1125793 (= e!640964 e!640967)))

(declare-fun res!751823 () Bool)

(assert (=> b!1125793 (=> (not res!751823) (not e!640967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73399 (_ BitVec 32)) Bool)

(assert (=> b!1125793 (= res!751823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499980 mask!1564))))

(assert (=> b!1125793 (= lt!499980 (array!73400 (store (arr!35346 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35883 _keys!1208)))))

(declare-fun b!1125794 () Bool)

(declare-fun res!751832 () Bool)

(assert (=> b!1125794 (=> (not res!751832) (not e!640964))))

(assert (=> b!1125794 (= res!751832 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35883 _keys!1208))))))

(declare-fun mapNonEmpty!44182 () Bool)

(declare-fun tp!83842 () Bool)

(declare-fun e!640962 () Bool)

(assert (=> mapNonEmpty!44182 (= mapRes!44182 (and tp!83842 e!640962))))

(declare-fun mapRest!44182 () (Array (_ BitVec 32) ValueCell!13412))

(declare-fun mapValue!44182 () ValueCell!13412)

(declare-fun mapKey!44182 () (_ BitVec 32))

(assert (=> mapNonEmpty!44182 (= (arr!35347 _values!996) (store mapRest!44182 mapKey!44182 mapValue!44182))))

(declare-fun b!1125795 () Bool)

(declare-fun res!751835 () Bool)

(assert (=> b!1125795 (=> (not res!751835) (not e!640964))))

(assert (=> b!1125795 (= res!751835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125796 () Bool)

(assert (=> b!1125796 (= e!640962 tp_is_empty!28243)))

(assert (= (and start!98248 res!751827) b!1125791))

(assert (= (and b!1125791 res!751826) b!1125782))

(assert (= (and b!1125782 res!751837) b!1125795))

(assert (= (and b!1125795 res!751835) b!1125786))

(assert (= (and b!1125786 res!751833) b!1125794))

(assert (= (and b!1125794 res!751832) b!1125778))

(assert (= (and b!1125778 res!751829) b!1125787))

(assert (= (and b!1125787 res!751824) b!1125793))

(assert (= (and b!1125793 res!751823) b!1125792))

(assert (= (and b!1125792 res!751834) b!1125788))

(assert (= (and b!1125788 (not res!751831)) b!1125789))

(assert (= (and b!1125789 (not res!751825)) b!1125785))

(assert (= (and b!1125785 c!109970) b!1125784))

(assert (= (and b!1125785 (not c!109970)) b!1125781))

(assert (= (or b!1125784 b!1125781) bm!47486))

(assert (= (or b!1125784 b!1125781) bm!47485))

(assert (= (and b!1125785 (not res!751836)) b!1125779))

(assert (= (and b!1125779 (not res!751828)) b!1125780))

(assert (= (and b!1125780 (not res!751830)) b!1125777))

(assert (= (and b!1125790 condMapEmpty!44182) mapIsEmpty!44182))

(assert (= (and b!1125790 (not condMapEmpty!44182)) mapNonEmpty!44182))

(get-info :version)

(assert (= (and mapNonEmpty!44182 ((_ is ValueCellFull!13412) mapValue!44182)) b!1125796))

(assert (= (and b!1125790 ((_ is ValueCellFull!13412) mapDefault!44182)) b!1125783))

(assert (= start!98248 b!1125790))

(declare-fun b_lambda!18693 () Bool)

(assert (=> (not b_lambda!18693) (not b!1125789)))

(declare-fun t!35310 () Bool)

(declare-fun tb!8517 () Bool)

(assert (=> (and start!98248 (= defaultEntry!1004 defaultEntry!1004) t!35310) tb!8517))

(declare-fun result!17603 () Bool)

(assert (=> tb!8517 (= result!17603 tp_is_empty!28243)))

(assert (=> b!1125789 t!35310))

(declare-fun b_and!38221 () Bool)

(assert (= b_and!38219 (and (=> t!35310 result!17603) b_and!38221)))

(declare-fun m!1040417 () Bool)

(assert (=> b!1125777 m!1040417))

(assert (=> b!1125777 m!1040417))

(declare-fun m!1040419 () Bool)

(assert (=> b!1125777 m!1040419))

(declare-fun m!1040421 () Bool)

(assert (=> b!1125777 m!1040421))

(declare-fun m!1040423 () Bool)

(assert (=> b!1125789 m!1040423))

(declare-fun m!1040425 () Bool)

(assert (=> b!1125789 m!1040425))

(declare-fun m!1040427 () Bool)

(assert (=> b!1125789 m!1040427))

(declare-fun m!1040429 () Bool)

(assert (=> b!1125789 m!1040429))

(declare-fun m!1040431 () Bool)

(assert (=> b!1125784 m!1040431))

(declare-fun m!1040433 () Bool)

(assert (=> start!98248 m!1040433))

(declare-fun m!1040435 () Bool)

(assert (=> start!98248 m!1040435))

(declare-fun m!1040437 () Bool)

(assert (=> b!1125793 m!1040437))

(declare-fun m!1040439 () Bool)

(assert (=> b!1125793 m!1040439))

(declare-fun m!1040441 () Bool)

(assert (=> b!1125785 m!1040441))

(declare-fun m!1040443 () Bool)

(assert (=> b!1125785 m!1040443))

(declare-fun m!1040445 () Bool)

(assert (=> bm!47486 m!1040445))

(declare-fun m!1040447 () Bool)

(assert (=> b!1125787 m!1040447))

(declare-fun m!1040449 () Bool)

(assert (=> b!1125788 m!1040449))

(declare-fun m!1040451 () Bool)

(assert (=> b!1125788 m!1040451))

(declare-fun m!1040453 () Bool)

(assert (=> mapNonEmpty!44182 m!1040453))

(declare-fun m!1040455 () Bool)

(assert (=> b!1125779 m!1040455))

(declare-fun m!1040457 () Bool)

(assert (=> b!1125779 m!1040457))

(declare-fun m!1040459 () Bool)

(assert (=> b!1125786 m!1040459))

(declare-fun m!1040461 () Bool)

(assert (=> b!1125792 m!1040461))

(declare-fun m!1040463 () Bool)

(assert (=> b!1125795 m!1040463))

(assert (=> bm!47485 m!1040457))

(declare-fun m!1040465 () Bool)

(assert (=> b!1125791 m!1040465))

(declare-fun m!1040467 () Bool)

(assert (=> b!1125778 m!1040467))

(check-sat (not b_lambda!18693) (not b!1125777) (not b!1125786) (not b!1125792) (not start!98248) tp_is_empty!28243 (not b!1125791) (not bm!47486) (not b!1125788) (not b!1125785) (not bm!47485) (not b!1125789) (not b!1125778) (not mapNonEmpty!44182) (not b!1125793) b_and!38221 (not b!1125784) (not b_next!23713) (not b!1125779) (not b!1125795))
(check-sat b_and!38221 (not b_next!23713))
