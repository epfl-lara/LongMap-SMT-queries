; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40792 () Bool)

(assert start!40792)

(declare-fun b_free!10795 () Bool)

(declare-fun b_next!10795 () Bool)

(assert (=> start!40792 (= b_free!10795 (not b_next!10795))))

(declare-fun tp!38207 () Bool)

(declare-fun b_and!18851 () Bool)

(assert (=> start!40792 (= tp!38207 b_and!18851)))

(declare-fun b!452554 () Bool)

(declare-fun res!269638 () Bool)

(declare-fun e!264919 () Bool)

(assert (=> b!452554 (=> (not res!269638) (not e!264919))))

(declare-datatypes ((array!28063 0))(
  ( (array!28064 (arr!13476 (Array (_ BitVec 32) (_ BitVec 64))) (size!13829 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28063)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452554 (= res!269638 (or (= (select (arr!13476 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13476 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452555 () Bool)

(declare-fun e!264917 () Bool)

(declare-fun e!264914 () Bool)

(declare-fun mapRes!19836 () Bool)

(assert (=> b!452555 (= e!264917 (and e!264914 mapRes!19836))))

(declare-fun condMapEmpty!19836 () Bool)

(declare-datatypes ((V!17283 0))(
  ( (V!17284 (val!6111 Int)) )
))
(declare-datatypes ((ValueCell!5723 0))(
  ( (ValueCellFull!5723 (v!8364 V!17283)) (EmptyCell!5723) )
))
(declare-datatypes ((array!28065 0))(
  ( (array!28066 (arr!13477 (Array (_ BitVec 32) ValueCell!5723)) (size!13830 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28065)

(declare-fun mapDefault!19836 () ValueCell!5723)

(assert (=> b!452555 (= condMapEmpty!19836 (= (arr!13477 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5723)) mapDefault!19836)))))

(declare-fun b!452556 () Bool)

(declare-fun e!264920 () Bool)

(declare-datatypes ((tuple2!8054 0))(
  ( (tuple2!8055 (_1!4038 (_ BitVec 64)) (_2!4038 V!17283)) )
))
(declare-datatypes ((List!8113 0))(
  ( (Nil!8110) (Cons!8109 (h!8965 tuple2!8054) (t!13922 List!8113)) )
))
(declare-datatypes ((ListLongMap!6957 0))(
  ( (ListLongMap!6958 (toList!3494 List!8113)) )
))
(declare-fun call!29973 () ListLongMap!6957)

(declare-fun call!29974 () ListLongMap!6957)

(assert (=> b!452556 (= e!264920 (= call!29973 call!29974))))

(declare-fun b!452557 () Bool)

(declare-fun res!269636 () Bool)

(assert (=> b!452557 (=> (not res!269636) (not e!264919))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452557 (= res!269636 (validMask!0 mask!1025))))

(declare-fun b!452558 () Bool)

(declare-fun res!269637 () Bool)

(assert (=> b!452558 (=> (not res!269637) (not e!264919))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452558 (= res!269637 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452559 () Bool)

(declare-fun res!269629 () Bool)

(assert (=> b!452559 (=> (not res!269629) (not e!264919))))

(declare-datatypes ((List!8114 0))(
  ( (Nil!8111) (Cons!8110 (h!8966 (_ BitVec 64)) (t!13923 List!8114)) )
))
(declare-fun arrayNoDuplicates!0 (array!28063 (_ BitVec 32) List!8114) Bool)

(assert (=> b!452559 (= res!269629 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8111))))

(declare-fun b!452560 () Bool)

(declare-fun e!264918 () Bool)

(declare-fun tp_is_empty!12133 () Bool)

(assert (=> b!452560 (= e!264918 tp_is_empty!12133)))

(declare-fun b!452561 () Bool)

(declare-fun e!264912 () Bool)

(assert (=> b!452561 (= e!264919 e!264912)))

(declare-fun res!269639 () Bool)

(assert (=> b!452561 (=> (not res!269639) (not e!264912))))

(declare-fun lt!205221 () array!28063)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28063 (_ BitVec 32)) Bool)

(assert (=> b!452561 (= res!269639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205221 mask!1025))))

(assert (=> b!452561 (= lt!205221 (array!28064 (store (arr!13476 _keys!709) i!563 k0!794) (size!13829 _keys!709)))))

(declare-fun b!452562 () Bool)

(declare-fun res!269640 () Bool)

(assert (=> b!452562 (=> (not res!269640) (not e!264919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452562 (= res!269640 (validKeyInArray!0 k0!794))))

(declare-fun b!452564 () Bool)

(declare-fun res!269635 () Bool)

(assert (=> b!452564 (=> (not res!269635) (not e!264919))))

(assert (=> b!452564 (= res!269635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452565 () Bool)

(declare-fun e!264913 () Bool)

(assert (=> b!452565 (= e!264912 e!264913)))

(declare-fun res!269633 () Bool)

(assert (=> b!452565 (=> (not res!269633) (not e!264913))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!452565 (= res!269633 (= from!863 i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17283)

(declare-fun lt!205220 () ListLongMap!6957)

(declare-fun minValue!515 () V!17283)

(declare-fun lt!205229 () array!28065)

(declare-fun getCurrentListMapNoExtraKeys!1690 (array!28063 array!28065 (_ BitVec 32) (_ BitVec 32) V!17283 V!17283 (_ BitVec 32) Int) ListLongMap!6957)

(assert (=> b!452565 (= lt!205220 (getCurrentListMapNoExtraKeys!1690 lt!205221 lt!205229 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17283)

(assert (=> b!452565 (= lt!205229 (array!28066 (store (arr!13477 _values!549) i!563 (ValueCellFull!5723 v!412)) (size!13830 _values!549)))))

(declare-fun lt!205225 () ListLongMap!6957)

(assert (=> b!452565 (= lt!205225 (getCurrentListMapNoExtraKeys!1690 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun c!56070 () Bool)

(declare-fun bm!29970 () Bool)

(assert (=> bm!29970 (= call!29973 (getCurrentListMapNoExtraKeys!1690 (ite c!56070 _keys!709 lt!205221) (ite c!56070 _values!549 lt!205229) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29971 () Bool)

(assert (=> bm!29971 (= call!29974 (getCurrentListMapNoExtraKeys!1690 (ite c!56070 lt!205221 _keys!709) (ite c!56070 lt!205229 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19836 () Bool)

(assert (=> mapIsEmpty!19836 mapRes!19836))

(declare-fun b!452566 () Bool)

(declare-fun res!269631 () Bool)

(assert (=> b!452566 (=> (not res!269631) (not e!264912))))

(assert (=> b!452566 (= res!269631 (bvsle from!863 i!563))))

(declare-fun b!452567 () Bool)

(declare-fun res!269641 () Bool)

(assert (=> b!452567 (=> (not res!269641) (not e!264919))))

(assert (=> b!452567 (= res!269641 (and (= (size!13830 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13829 _keys!709) (size!13830 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452568 () Bool)

(declare-fun e!264915 () Bool)

(assert (=> b!452568 (= e!264913 (not e!264915))))

(declare-fun res!269632 () Bool)

(assert (=> b!452568 (=> res!269632 e!264915)))

(assert (=> b!452568 (= res!269632 (validKeyInArray!0 (select (arr!13476 _keys!709) from!863)))))

(assert (=> b!452568 e!264920))

(assert (=> b!452568 (= c!56070 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13207 0))(
  ( (Unit!13208) )
))
(declare-fun lt!205224 () Unit!13207)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!730 (array!28063 array!28065 (_ BitVec 32) (_ BitVec 32) V!17283 V!17283 (_ BitVec 32) (_ BitVec 64) V!17283 (_ BitVec 32) Int) Unit!13207)

(assert (=> b!452568 (= lt!205224 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!730 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452569 () Bool)

(declare-fun res!269630 () Bool)

(assert (=> b!452569 (=> (not res!269630) (not e!264919))))

(assert (=> b!452569 (= res!269630 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13829 _keys!709))))))

(declare-fun b!452570 () Bool)

(assert (=> b!452570 (= e!264914 tp_is_empty!12133)))

(declare-fun b!452571 () Bool)

(declare-fun +!1591 (ListLongMap!6957 tuple2!8054) ListLongMap!6957)

(assert (=> b!452571 (= e!264920 (= call!29974 (+!1591 call!29973 (tuple2!8055 k0!794 v!412))))))

(declare-fun res!269642 () Bool)

(assert (=> start!40792 (=> (not res!269642) (not e!264919))))

(assert (=> start!40792 (= res!269642 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13829 _keys!709))))))

(assert (=> start!40792 e!264919))

(assert (=> start!40792 tp_is_empty!12133))

(assert (=> start!40792 tp!38207))

(assert (=> start!40792 true))

(declare-fun array_inv!9822 (array!28065) Bool)

(assert (=> start!40792 (and (array_inv!9822 _values!549) e!264917)))

(declare-fun array_inv!9823 (array!28063) Bool)

(assert (=> start!40792 (array_inv!9823 _keys!709)))

(declare-fun b!452563 () Bool)

(declare-fun res!269634 () Bool)

(assert (=> b!452563 (=> (not res!269634) (not e!264912))))

(assert (=> b!452563 (= res!269634 (arrayNoDuplicates!0 lt!205221 #b00000000000000000000000000000000 Nil!8111))))

(declare-fun mapNonEmpty!19836 () Bool)

(declare-fun tp!38208 () Bool)

(assert (=> mapNonEmpty!19836 (= mapRes!19836 (and tp!38208 e!264918))))

(declare-fun mapRest!19836 () (Array (_ BitVec 32) ValueCell!5723))

(declare-fun mapValue!19836 () ValueCell!5723)

(declare-fun mapKey!19836 () (_ BitVec 32))

(assert (=> mapNonEmpty!19836 (= (arr!13477 _values!549) (store mapRest!19836 mapKey!19836 mapValue!19836))))

(declare-fun b!452572 () Bool)

(assert (=> b!452572 (= e!264915 true)))

(declare-fun lt!205219 () V!17283)

(declare-fun lt!205223 () ListLongMap!6957)

(declare-fun lt!205228 () tuple2!8054)

(assert (=> b!452572 (= (+!1591 lt!205223 lt!205228) (+!1591 (+!1591 lt!205223 (tuple2!8055 k0!794 lt!205219)) lt!205228))))

(declare-fun lt!205222 () V!17283)

(assert (=> b!452572 (= lt!205228 (tuple2!8055 k0!794 lt!205222))))

(declare-fun lt!205226 () Unit!13207)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!87 (ListLongMap!6957 (_ BitVec 64) V!17283 V!17283) Unit!13207)

(assert (=> b!452572 (= lt!205226 (addSameAsAddTwiceSameKeyDiffValues!87 lt!205223 k0!794 lt!205219 lt!205222))))

(declare-fun lt!205227 () V!17283)

(declare-fun get!6646 (ValueCell!5723 V!17283) V!17283)

(assert (=> b!452572 (= lt!205219 (get!6646 (select (arr!13477 _values!549) from!863) lt!205227))))

(assert (=> b!452572 (= lt!205220 (+!1591 lt!205223 (tuple2!8055 (select (arr!13476 lt!205221) from!863) lt!205222)))))

(assert (=> b!452572 (= lt!205222 (get!6646 (select (store (arr!13477 _values!549) i!563 (ValueCellFull!5723 v!412)) from!863) lt!205227))))

(declare-fun dynLambda!866 (Int (_ BitVec 64)) V!17283)

(assert (=> b!452572 (= lt!205227 (dynLambda!866 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452572 (= lt!205223 (getCurrentListMapNoExtraKeys!1690 lt!205221 lt!205229 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40792 res!269642) b!452557))

(assert (= (and b!452557 res!269636) b!452567))

(assert (= (and b!452567 res!269641) b!452564))

(assert (= (and b!452564 res!269635) b!452559))

(assert (= (and b!452559 res!269629) b!452569))

(assert (= (and b!452569 res!269630) b!452562))

(assert (= (and b!452562 res!269640) b!452554))

(assert (= (and b!452554 res!269638) b!452558))

(assert (= (and b!452558 res!269637) b!452561))

(assert (= (and b!452561 res!269639) b!452563))

(assert (= (and b!452563 res!269634) b!452566))

(assert (= (and b!452566 res!269631) b!452565))

(assert (= (and b!452565 res!269633) b!452568))

(assert (= (and b!452568 c!56070) b!452571))

(assert (= (and b!452568 (not c!56070)) b!452556))

(assert (= (or b!452571 b!452556) bm!29971))

(assert (= (or b!452571 b!452556) bm!29970))

(assert (= (and b!452568 (not res!269632)) b!452572))

(assert (= (and b!452555 condMapEmpty!19836) mapIsEmpty!19836))

(assert (= (and b!452555 (not condMapEmpty!19836)) mapNonEmpty!19836))

(get-info :version)

(assert (= (and mapNonEmpty!19836 ((_ is ValueCellFull!5723) mapValue!19836)) b!452560))

(assert (= (and b!452555 ((_ is ValueCellFull!5723) mapDefault!19836)) b!452570))

(assert (= start!40792 b!452555))

(declare-fun b_lambda!9555 () Bool)

(assert (=> (not b_lambda!9555) (not b!452572)))

(declare-fun t!13921 () Bool)

(declare-fun tb!3767 () Bool)

(assert (=> (and start!40792 (= defaultEntry!557 defaultEntry!557) t!13921) tb!3767))

(declare-fun result!7079 () Bool)

(assert (=> tb!3767 (= result!7079 tp_is_empty!12133)))

(assert (=> b!452572 t!13921))

(declare-fun b_and!18853 () Bool)

(assert (= b_and!18851 (and (=> t!13921 result!7079) b_and!18853)))

(declare-fun m!435855 () Bool)

(assert (=> b!452571 m!435855))

(declare-fun m!435857 () Bool)

(assert (=> b!452557 m!435857))

(declare-fun m!435859 () Bool)

(assert (=> start!40792 m!435859))

(declare-fun m!435861 () Bool)

(assert (=> start!40792 m!435861))

(declare-fun m!435863 () Bool)

(assert (=> b!452559 m!435863))

(declare-fun m!435865 () Bool)

(assert (=> b!452558 m!435865))

(declare-fun m!435867 () Bool)

(assert (=> bm!29971 m!435867))

(declare-fun m!435869 () Bool)

(assert (=> b!452554 m!435869))

(declare-fun m!435871 () Bool)

(assert (=> b!452568 m!435871))

(assert (=> b!452568 m!435871))

(declare-fun m!435873 () Bool)

(assert (=> b!452568 m!435873))

(declare-fun m!435875 () Bool)

(assert (=> b!452568 m!435875))

(declare-fun m!435877 () Bool)

(assert (=> b!452572 m!435877))

(declare-fun m!435879 () Bool)

(assert (=> b!452572 m!435879))

(declare-fun m!435881 () Bool)

(assert (=> b!452572 m!435881))

(declare-fun m!435883 () Bool)

(assert (=> b!452572 m!435883))

(declare-fun m!435885 () Bool)

(assert (=> b!452572 m!435885))

(declare-fun m!435887 () Bool)

(assert (=> b!452572 m!435887))

(assert (=> b!452572 m!435877))

(declare-fun m!435889 () Bool)

(assert (=> b!452572 m!435889))

(declare-fun m!435891 () Bool)

(assert (=> b!452572 m!435891))

(declare-fun m!435893 () Bool)

(assert (=> b!452572 m!435893))

(assert (=> b!452572 m!435891))

(declare-fun m!435895 () Bool)

(assert (=> b!452572 m!435895))

(declare-fun m!435897 () Bool)

(assert (=> b!452572 m!435897))

(assert (=> b!452572 m!435885))

(declare-fun m!435899 () Bool)

(assert (=> b!452572 m!435899))

(declare-fun m!435901 () Bool)

(assert (=> b!452572 m!435901))

(declare-fun m!435903 () Bool)

(assert (=> b!452565 m!435903))

(assert (=> b!452565 m!435881))

(declare-fun m!435905 () Bool)

(assert (=> b!452565 m!435905))

(declare-fun m!435907 () Bool)

(assert (=> mapNonEmpty!19836 m!435907))

(declare-fun m!435909 () Bool)

(assert (=> b!452561 m!435909))

(declare-fun m!435911 () Bool)

(assert (=> b!452561 m!435911))

(declare-fun m!435913 () Bool)

(assert (=> bm!29970 m!435913))

(declare-fun m!435915 () Bool)

(assert (=> b!452563 m!435915))

(declare-fun m!435917 () Bool)

(assert (=> b!452562 m!435917))

(declare-fun m!435919 () Bool)

(assert (=> b!452564 m!435919))

(check-sat tp_is_empty!12133 (not start!40792) (not b!452568) (not b_next!10795) (not b!452564) (not b!452558) (not bm!29971) (not b_lambda!9555) (not b!452565) (not b!452563) (not b!452559) (not bm!29970) b_and!18853 (not b!452557) (not b!452561) (not b!452572) (not mapNonEmpty!19836) (not b!452571) (not b!452562))
(check-sat b_and!18853 (not b_next!10795))
