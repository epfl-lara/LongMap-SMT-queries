; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41192 () Bool)

(assert start!41192)

(declare-fun b_free!11061 () Bool)

(declare-fun b_next!11061 () Bool)

(assert (=> start!41192 (= b_free!11061 (not b_next!11061))))

(declare-fun tp!39018 () Bool)

(declare-fun b_and!19361 () Bool)

(assert (=> start!41192 (= tp!39018 b_and!19361)))

(declare-fun b!460681 () Bool)

(declare-fun e!268742 () Bool)

(declare-fun tp_is_empty!12399 () Bool)

(assert (=> b!460681 (= e!268742 tp_is_empty!12399)))

(declare-fun b!460682 () Bool)

(declare-fun res!275463 () Bool)

(declare-fun e!268747 () Bool)

(assert (=> b!460682 (=> (not res!275463) (not e!268747))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460682 (= res!275463 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!20248 () Bool)

(declare-fun mapRes!20248 () Bool)

(assert (=> mapIsEmpty!20248 mapRes!20248))

(declare-fun b!460683 () Bool)

(declare-fun res!275467 () Bool)

(assert (=> b!460683 (=> (not res!275467) (not e!268747))))

(declare-datatypes ((array!28597 0))(
  ( (array!28598 (arr!13739 (Array (_ BitVec 32) (_ BitVec 64))) (size!14091 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28597)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17637 0))(
  ( (V!17638 (val!6244 Int)) )
))
(declare-datatypes ((ValueCell!5856 0))(
  ( (ValueCellFull!5856 (v!8522 V!17637)) (EmptyCell!5856) )
))
(declare-datatypes ((array!28599 0))(
  ( (array!28600 (arr!13740 (Array (_ BitVec 32) ValueCell!5856)) (size!14092 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28599)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!460683 (= res!275467 (and (= (size!14092 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14091 _keys!709) (size!14092 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460684 () Bool)

(declare-fun res!275475 () Bool)

(declare-fun e!268744 () Bool)

(assert (=> b!460684 (=> (not res!275475) (not e!268744))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460684 (= res!275475 (bvsle from!863 i!563))))

(declare-fun b!460685 () Bool)

(declare-fun res!275472 () Bool)

(assert (=> b!460685 (=> (not res!275472) (not e!268744))))

(declare-fun lt!208678 () array!28597)

(declare-datatypes ((List!8309 0))(
  ( (Nil!8306) (Cons!8305 (h!9161 (_ BitVec 64)) (t!14249 List!8309)) )
))
(declare-fun arrayNoDuplicates!0 (array!28597 (_ BitVec 32) List!8309) Bool)

(assert (=> b!460685 (= res!275472 (arrayNoDuplicates!0 lt!208678 #b00000000000000000000000000000000 Nil!8306))))

(declare-fun b!460686 () Bool)

(declare-fun res!275470 () Bool)

(assert (=> b!460686 (=> (not res!275470) (not e!268747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28597 (_ BitVec 32)) Bool)

(assert (=> b!460686 (= res!275470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460687 () Bool)

(declare-fun res!275469 () Bool)

(assert (=> b!460687 (=> (not res!275469) (not e!268747))))

(assert (=> b!460687 (= res!275469 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8306))))

(declare-fun b!460688 () Bool)

(declare-datatypes ((Unit!13416 0))(
  ( (Unit!13417) )
))
(declare-fun e!268741 () Unit!13416)

(declare-fun Unit!13418 () Unit!13416)

(assert (=> b!460688 (= e!268741 Unit!13418)))

(declare-fun res!275466 () Bool)

(assert (=> start!41192 (=> (not res!275466) (not e!268747))))

(assert (=> start!41192 (= res!275466 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14091 _keys!709))))))

(assert (=> start!41192 e!268747))

(assert (=> start!41192 tp_is_empty!12399))

(assert (=> start!41192 tp!39018))

(assert (=> start!41192 true))

(declare-fun e!268746 () Bool)

(declare-fun array_inv!9936 (array!28599) Bool)

(assert (=> start!41192 (and (array_inv!9936 _values!549) e!268746)))

(declare-fun array_inv!9937 (array!28597) Bool)

(assert (=> start!41192 (array_inv!9937 _keys!709)))

(declare-fun b!460689 () Bool)

(declare-fun res!275464 () Bool)

(assert (=> b!460689 (=> (not res!275464) (not e!268747))))

(assert (=> b!460689 (= res!275464 (or (= (select (arr!13739 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13739 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20248 () Bool)

(declare-fun tp!39019 () Bool)

(assert (=> mapNonEmpty!20248 (= mapRes!20248 (and tp!39019 e!268742))))

(declare-fun mapValue!20248 () ValueCell!5856)

(declare-fun mapKey!20248 () (_ BitVec 32))

(declare-fun mapRest!20248 () (Array (_ BitVec 32) ValueCell!5856))

(assert (=> mapNonEmpty!20248 (= (arr!13740 _values!549) (store mapRest!20248 mapKey!20248 mapValue!20248))))

(declare-fun b!460690 () Bool)

(declare-fun res!275476 () Bool)

(assert (=> b!460690 (=> (not res!275476) (not e!268747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460690 (= res!275476 (validMask!0 mask!1025))))

(declare-fun b!460691 () Bool)

(declare-fun e!268749 () Bool)

(declare-fun e!268748 () Bool)

(assert (=> b!460691 (= e!268749 (not e!268748))))

(declare-fun res!275473 () Bool)

(assert (=> b!460691 (=> res!275473 e!268748)))

(assert (=> b!460691 (= res!275473 (not (validKeyInArray!0 (select (arr!13739 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8238 0))(
  ( (tuple2!8239 (_1!4130 (_ BitVec 64)) (_2!4130 V!17637)) )
))
(declare-datatypes ((List!8310 0))(
  ( (Nil!8307) (Cons!8306 (h!9162 tuple2!8238) (t!14250 List!8310)) )
))
(declare-datatypes ((ListLongMap!7151 0))(
  ( (ListLongMap!7152 (toList!3591 List!8310)) )
))
(declare-fun lt!208684 () ListLongMap!7151)

(declare-fun lt!208688 () ListLongMap!7151)

(assert (=> b!460691 (= lt!208684 lt!208688)))

(declare-fun lt!208691 () ListLongMap!7151)

(declare-fun lt!208690 () tuple2!8238)

(declare-fun +!1627 (ListLongMap!7151 tuple2!8238) ListLongMap!7151)

(assert (=> b!460691 (= lt!208688 (+!1627 lt!208691 lt!208690))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17637)

(declare-fun minValue!515 () V!17637)

(declare-fun lt!208683 () array!28599)

(declare-fun getCurrentListMapNoExtraKeys!1771 (array!28597 array!28599 (_ BitVec 32) (_ BitVec 32) V!17637 V!17637 (_ BitVec 32) Int) ListLongMap!7151)

(assert (=> b!460691 (= lt!208684 (getCurrentListMapNoExtraKeys!1771 lt!208678 lt!208683 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!17637)

(assert (=> b!460691 (= lt!208690 (tuple2!8239 k0!794 v!412))))

(assert (=> b!460691 (= lt!208691 (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208677 () Unit!13416)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!783 (array!28597 array!28599 (_ BitVec 32) (_ BitVec 32) V!17637 V!17637 (_ BitVec 32) (_ BitVec 64) V!17637 (_ BitVec 32) Int) Unit!13416)

(assert (=> b!460691 (= lt!208677 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!783 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460692 () Bool)

(declare-fun res!275474 () Bool)

(assert (=> b!460692 (=> (not res!275474) (not e!268747))))

(declare-fun arrayContainsKey!0 (array!28597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460692 (= res!275474 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460693 () Bool)

(assert (=> b!460693 (= e!268747 e!268744)))

(declare-fun res!275468 () Bool)

(assert (=> b!460693 (=> (not res!275468) (not e!268744))))

(assert (=> b!460693 (= res!275468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208678 mask!1025))))

(assert (=> b!460693 (= lt!208678 (array!28598 (store (arr!13739 _keys!709) i!563 k0!794) (size!14091 _keys!709)))))

(declare-fun b!460694 () Bool)

(declare-fun e!268745 () Bool)

(assert (=> b!460694 (= e!268746 (and e!268745 mapRes!20248))))

(declare-fun condMapEmpty!20248 () Bool)

(declare-fun mapDefault!20248 () ValueCell!5856)

(assert (=> b!460694 (= condMapEmpty!20248 (= (arr!13740 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5856)) mapDefault!20248)))))

(declare-fun b!460695 () Bool)

(declare-fun e!268743 () Bool)

(assert (=> b!460695 (= e!268748 e!268743)))

(declare-fun res!275471 () Bool)

(assert (=> b!460695 (=> res!275471 e!268743)))

(assert (=> b!460695 (= res!275471 (= k0!794 (select (arr!13739 _keys!709) from!863)))))

(assert (=> b!460695 (not (= (select (arr!13739 _keys!709) from!863) k0!794))))

(declare-fun lt!208680 () Unit!13416)

(assert (=> b!460695 (= lt!208680 e!268741)))

(declare-fun c!56540 () Bool)

(assert (=> b!460695 (= c!56540 (= (select (arr!13739 _keys!709) from!863) k0!794))))

(declare-fun lt!208687 () ListLongMap!7151)

(declare-fun lt!208689 () ListLongMap!7151)

(assert (=> b!460695 (= lt!208687 lt!208689)))

(declare-fun lt!208685 () tuple2!8238)

(assert (=> b!460695 (= lt!208689 (+!1627 lt!208688 lt!208685))))

(declare-fun lt!208681 () V!17637)

(assert (=> b!460695 (= lt!208685 (tuple2!8239 (select (arr!13739 _keys!709) from!863) lt!208681))))

(declare-fun get!6784 (ValueCell!5856 V!17637) V!17637)

(declare-fun dynLambda!910 (Int (_ BitVec 64)) V!17637)

(assert (=> b!460695 (= lt!208681 (get!6784 (select (arr!13740 _values!549) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460696 () Bool)

(assert (=> b!460696 (= e!268745 tp_is_empty!12399)))

(declare-fun b!460697 () Bool)

(declare-fun res!275465 () Bool)

(assert (=> b!460697 (=> (not res!275465) (not e!268747))))

(assert (=> b!460697 (= res!275465 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14091 _keys!709))))))

(declare-fun b!460698 () Bool)

(declare-fun Unit!13419 () Unit!13416)

(assert (=> b!460698 (= e!268741 Unit!13419)))

(declare-fun lt!208679 () Unit!13416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28597 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13416)

(assert (=> b!460698 (= lt!208679 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460698 false))

(declare-fun b!460699 () Bool)

(assert (=> b!460699 (= e!268744 e!268749)))

(declare-fun res!275462 () Bool)

(assert (=> b!460699 (=> (not res!275462) (not e!268749))))

(assert (=> b!460699 (= res!275462 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!460699 (= lt!208687 (getCurrentListMapNoExtraKeys!1771 lt!208678 lt!208683 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460699 (= lt!208683 (array!28600 (store (arr!13740 _values!549) i!563 (ValueCellFull!5856 v!412)) (size!14092 _values!549)))))

(declare-fun lt!208686 () ListLongMap!7151)

(assert (=> b!460699 (= lt!208686 (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460700 () Bool)

(assert (=> b!460700 (= e!268743 (= lt!208687 (+!1627 lt!208686 lt!208690)))))

(assert (=> b!460700 (= lt!208689 (+!1627 (+!1627 lt!208691 lt!208685) lt!208690))))

(declare-fun lt!208682 () Unit!13416)

(declare-fun addCommutativeForDiffKeys!435 (ListLongMap!7151 (_ BitVec 64) V!17637 (_ BitVec 64) V!17637) Unit!13416)

(assert (=> b!460700 (= lt!208682 (addCommutativeForDiffKeys!435 lt!208691 k0!794 v!412 (select (arr!13739 _keys!709) from!863) lt!208681))))

(assert (= (and start!41192 res!275466) b!460690))

(assert (= (and b!460690 res!275476) b!460683))

(assert (= (and b!460683 res!275467) b!460686))

(assert (= (and b!460686 res!275470) b!460687))

(assert (= (and b!460687 res!275469) b!460697))

(assert (= (and b!460697 res!275465) b!460682))

(assert (= (and b!460682 res!275463) b!460689))

(assert (= (and b!460689 res!275464) b!460692))

(assert (= (and b!460692 res!275474) b!460693))

(assert (= (and b!460693 res!275468) b!460685))

(assert (= (and b!460685 res!275472) b!460684))

(assert (= (and b!460684 res!275475) b!460699))

(assert (= (and b!460699 res!275462) b!460691))

(assert (= (and b!460691 (not res!275473)) b!460695))

(assert (= (and b!460695 c!56540) b!460698))

(assert (= (and b!460695 (not c!56540)) b!460688))

(assert (= (and b!460695 (not res!275471)) b!460700))

(assert (= (and b!460694 condMapEmpty!20248) mapIsEmpty!20248))

(assert (= (and b!460694 (not condMapEmpty!20248)) mapNonEmpty!20248))

(get-info :version)

(assert (= (and mapNonEmpty!20248 ((_ is ValueCellFull!5856) mapValue!20248)) b!460681))

(assert (= (and b!460694 ((_ is ValueCellFull!5856) mapDefault!20248)) b!460696))

(assert (= start!41192 b!460694))

(declare-fun b_lambda!9895 () Bool)

(assert (=> (not b_lambda!9895) (not b!460695)))

(declare-fun t!14248 () Bool)

(declare-fun tb!3897 () Bool)

(assert (=> (and start!41192 (= defaultEntry!557 defaultEntry!557) t!14248) tb!3897))

(declare-fun result!7339 () Bool)

(assert (=> tb!3897 (= result!7339 tp_is_empty!12399)))

(assert (=> b!460695 t!14248))

(declare-fun b_and!19363 () Bool)

(assert (= b_and!19361 (and (=> t!14248 result!7339) b_and!19363)))

(declare-fun m!443859 () Bool)

(assert (=> b!460691 m!443859))

(declare-fun m!443861 () Bool)

(assert (=> b!460691 m!443861))

(declare-fun m!443863 () Bool)

(assert (=> b!460691 m!443863))

(declare-fun m!443865 () Bool)

(assert (=> b!460691 m!443865))

(declare-fun m!443867 () Bool)

(assert (=> b!460691 m!443867))

(assert (=> b!460691 m!443859))

(declare-fun m!443869 () Bool)

(assert (=> b!460691 m!443869))

(declare-fun m!443871 () Bool)

(assert (=> b!460693 m!443871))

(declare-fun m!443873 () Bool)

(assert (=> b!460693 m!443873))

(declare-fun m!443875 () Bool)

(assert (=> b!460682 m!443875))

(assert (=> b!460700 m!443859))

(declare-fun m!443877 () Bool)

(assert (=> b!460700 m!443877))

(declare-fun m!443879 () Bool)

(assert (=> b!460700 m!443879))

(declare-fun m!443881 () Bool)

(assert (=> b!460700 m!443881))

(assert (=> b!460700 m!443859))

(declare-fun m!443883 () Bool)

(assert (=> b!460700 m!443883))

(assert (=> b!460700 m!443879))

(declare-fun m!443885 () Bool)

(assert (=> b!460686 m!443885))

(declare-fun m!443887 () Bool)

(assert (=> b!460692 m!443887))

(declare-fun m!443889 () Bool)

(assert (=> mapNonEmpty!20248 m!443889))

(declare-fun m!443891 () Bool)

(assert (=> start!41192 m!443891))

(declare-fun m!443893 () Bool)

(assert (=> start!41192 m!443893))

(assert (=> b!460695 m!443859))

(declare-fun m!443895 () Bool)

(assert (=> b!460695 m!443895))

(declare-fun m!443897 () Bool)

(assert (=> b!460695 m!443897))

(declare-fun m!443899 () Bool)

(assert (=> b!460695 m!443899))

(assert (=> b!460695 m!443899))

(assert (=> b!460695 m!443895))

(declare-fun m!443901 () Bool)

(assert (=> b!460695 m!443901))

(declare-fun m!443903 () Bool)

(assert (=> b!460690 m!443903))

(declare-fun m!443905 () Bool)

(assert (=> b!460685 m!443905))

(declare-fun m!443907 () Bool)

(assert (=> b!460687 m!443907))

(declare-fun m!443909 () Bool)

(assert (=> b!460689 m!443909))

(declare-fun m!443911 () Bool)

(assert (=> b!460699 m!443911))

(declare-fun m!443913 () Bool)

(assert (=> b!460699 m!443913))

(declare-fun m!443915 () Bool)

(assert (=> b!460699 m!443915))

(declare-fun m!443917 () Bool)

(assert (=> b!460698 m!443917))

(check-sat tp_is_empty!12399 (not start!41192) (not b!460691) (not b!460690) (not b!460686) (not b!460699) (not b_next!11061) (not b!460693) (not mapNonEmpty!20248) (not b!460692) (not b!460685) b_and!19363 (not b!460695) (not b!460700) (not b!460682) (not b_lambda!9895) (not b!460698) (not b!460687))
(check-sat b_and!19363 (not b_next!11061))
(get-model)

(declare-fun b_lambda!9899 () Bool)

(assert (= b_lambda!9895 (or (and start!41192 b_free!11061) b_lambda!9899)))

(check-sat tp_is_empty!12399 (not start!41192) (not b!460691) (not b!460690) (not b!460686) (not b!460699) (not b_next!11061) (not b!460682) (not b!460693) (not mapNonEmpty!20248) (not b!460685) b_and!19363 (not b!460695) (not b!460700) (not b!460698) (not b!460687) (not b_lambda!9899) (not b!460692))
(check-sat b_and!19363 (not b_next!11061))
(get-model)

(declare-fun d!74809 () Bool)

(declare-fun e!268782 () Bool)

(assert (=> d!74809 e!268782))

(declare-fun res!275526 () Bool)

(assert (=> d!74809 (=> (not res!275526) (not e!268782))))

(declare-fun lt!208745 () ListLongMap!7151)

(declare-fun contains!2509 (ListLongMap!7151 (_ BitVec 64)) Bool)

(assert (=> d!74809 (= res!275526 (contains!2509 lt!208745 (_1!4130 lt!208685)))))

(declare-fun lt!208748 () List!8310)

(assert (=> d!74809 (= lt!208745 (ListLongMap!7152 lt!208748))))

(declare-fun lt!208746 () Unit!13416)

(declare-fun lt!208747 () Unit!13416)

(assert (=> d!74809 (= lt!208746 lt!208747)))

(declare-datatypes ((Option!380 0))(
  ( (Some!379 (v!8527 V!17637)) (None!378) )
))
(declare-fun getValueByKey!374 (List!8310 (_ BitVec 64)) Option!380)

(assert (=> d!74809 (= (getValueByKey!374 lt!208748 (_1!4130 lt!208685)) (Some!379 (_2!4130 lt!208685)))))

(declare-fun lemmaContainsTupThenGetReturnValue!196 (List!8310 (_ BitVec 64) V!17637) Unit!13416)

(assert (=> d!74809 (= lt!208747 (lemmaContainsTupThenGetReturnValue!196 lt!208748 (_1!4130 lt!208685) (_2!4130 lt!208685)))))

(declare-fun insertStrictlySorted!199 (List!8310 (_ BitVec 64) V!17637) List!8310)

(assert (=> d!74809 (= lt!208748 (insertStrictlySorted!199 (toList!3591 lt!208688) (_1!4130 lt!208685) (_2!4130 lt!208685)))))

(assert (=> d!74809 (= (+!1627 lt!208688 lt!208685) lt!208745)))

(declare-fun b!460769 () Bool)

(declare-fun res!275527 () Bool)

(assert (=> b!460769 (=> (not res!275527) (not e!268782))))

(assert (=> b!460769 (= res!275527 (= (getValueByKey!374 (toList!3591 lt!208745) (_1!4130 lt!208685)) (Some!379 (_2!4130 lt!208685))))))

(declare-fun b!460770 () Bool)

(declare-fun contains!2510 (List!8310 tuple2!8238) Bool)

(assert (=> b!460770 (= e!268782 (contains!2510 (toList!3591 lt!208745) lt!208685))))

(assert (= (and d!74809 res!275526) b!460769))

(assert (= (and b!460769 res!275527) b!460770))

(declare-fun m!443979 () Bool)

(assert (=> d!74809 m!443979))

(declare-fun m!443981 () Bool)

(assert (=> d!74809 m!443981))

(declare-fun m!443983 () Bool)

(assert (=> d!74809 m!443983))

(declare-fun m!443985 () Bool)

(assert (=> d!74809 m!443985))

(declare-fun m!443987 () Bool)

(assert (=> b!460769 m!443987))

(declare-fun m!443989 () Bool)

(assert (=> b!460770 m!443989))

(assert (=> b!460695 d!74809))

(declare-fun d!74811 () Bool)

(declare-fun c!56546 () Bool)

(assert (=> d!74811 (= c!56546 ((_ is ValueCellFull!5856) (select (arr!13740 _values!549) from!863)))))

(declare-fun e!268785 () V!17637)

(assert (=> d!74811 (= (get!6784 (select (arr!13740 _values!549) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!268785)))

(declare-fun b!460775 () Bool)

(declare-fun get!6785 (ValueCell!5856 V!17637) V!17637)

(assert (=> b!460775 (= e!268785 (get!6785 (select (arr!13740 _values!549) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460776 () Bool)

(declare-fun get!6786 (ValueCell!5856 V!17637) V!17637)

(assert (=> b!460776 (= e!268785 (get!6786 (select (arr!13740 _values!549) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74811 c!56546) b!460775))

(assert (= (and d!74811 (not c!56546)) b!460776))

(assert (=> b!460775 m!443899))

(assert (=> b!460775 m!443895))

(declare-fun m!443991 () Bool)

(assert (=> b!460775 m!443991))

(assert (=> b!460776 m!443899))

(assert (=> b!460776 m!443895))

(declare-fun m!443993 () Bool)

(assert (=> b!460776 m!443993))

(assert (=> b!460695 d!74811))

(declare-fun d!74813 () Bool)

(declare-fun res!275533 () Bool)

(declare-fun e!268793 () Bool)

(assert (=> d!74813 (=> res!275533 e!268793)))

(assert (=> d!74813 (= res!275533 (bvsge #b00000000000000000000000000000000 (size!14091 _keys!709)))))

(assert (=> d!74813 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!268793)))

(declare-fun b!460785 () Bool)

(declare-fun e!268792 () Bool)

(declare-fun call!30154 () Bool)

(assert (=> b!460785 (= e!268792 call!30154)))

(declare-fun b!460786 () Bool)

(declare-fun e!268794 () Bool)

(assert (=> b!460786 (= e!268792 e!268794)))

(declare-fun lt!208756 () (_ BitVec 64))

(assert (=> b!460786 (= lt!208756 (select (arr!13739 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!208757 () Unit!13416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28597 (_ BitVec 64) (_ BitVec 32)) Unit!13416)

(assert (=> b!460786 (= lt!208757 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!208756 #b00000000000000000000000000000000))))

(assert (=> b!460786 (arrayContainsKey!0 _keys!709 lt!208756 #b00000000000000000000000000000000)))

(declare-fun lt!208755 () Unit!13416)

(assert (=> b!460786 (= lt!208755 lt!208757)))

(declare-fun res!275532 () Bool)

(declare-datatypes ((SeekEntryResult!3536 0))(
  ( (MissingZero!3536 (index!16323 (_ BitVec 32))) (Found!3536 (index!16324 (_ BitVec 32))) (Intermediate!3536 (undefined!4348 Bool) (index!16325 (_ BitVec 32)) (x!42971 (_ BitVec 32))) (Undefined!3536) (MissingVacant!3536 (index!16326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28597 (_ BitVec 32)) SeekEntryResult!3536)

(assert (=> b!460786 (= res!275532 (= (seekEntryOrOpen!0 (select (arr!13739 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3536 #b00000000000000000000000000000000)))))

(assert (=> b!460786 (=> (not res!275532) (not e!268794))))

(declare-fun b!460787 () Bool)

(assert (=> b!460787 (= e!268793 e!268792)))

(declare-fun c!56549 () Bool)

(assert (=> b!460787 (= c!56549 (validKeyInArray!0 (select (arr!13739 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30151 () Bool)

(assert (=> bm!30151 (= call!30154 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!460788 () Bool)

(assert (=> b!460788 (= e!268794 call!30154)))

(assert (= (and d!74813 (not res!275533)) b!460787))

(assert (= (and b!460787 c!56549) b!460786))

(assert (= (and b!460787 (not c!56549)) b!460785))

(assert (= (and b!460786 res!275532) b!460788))

(assert (= (or b!460788 b!460785) bm!30151))

(declare-fun m!443995 () Bool)

(assert (=> b!460786 m!443995))

(declare-fun m!443997 () Bool)

(assert (=> b!460786 m!443997))

(declare-fun m!443999 () Bool)

(assert (=> b!460786 m!443999))

(assert (=> b!460786 m!443995))

(declare-fun m!444001 () Bool)

(assert (=> b!460786 m!444001))

(assert (=> b!460787 m!443995))

(assert (=> b!460787 m!443995))

(declare-fun m!444003 () Bool)

(assert (=> b!460787 m!444003))

(declare-fun m!444005 () Bool)

(assert (=> bm!30151 m!444005))

(assert (=> b!460686 d!74813))

(declare-fun b!460799 () Bool)

(declare-fun e!268805 () Bool)

(declare-fun call!30157 () Bool)

(assert (=> b!460799 (= e!268805 call!30157)))

(declare-fun bm!30154 () Bool)

(declare-fun c!56552 () Bool)

(assert (=> bm!30154 (= call!30157 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56552 (Cons!8305 (select (arr!13739 _keys!709) #b00000000000000000000000000000000) Nil!8306) Nil!8306)))))

(declare-fun b!460801 () Bool)

(assert (=> b!460801 (= e!268805 call!30157)))

(declare-fun b!460802 () Bool)

(declare-fun e!268804 () Bool)

(assert (=> b!460802 (= e!268804 e!268805)))

(assert (=> b!460802 (= c!56552 (validKeyInArray!0 (select (arr!13739 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!460803 () Bool)

(declare-fun e!268803 () Bool)

(assert (=> b!460803 (= e!268803 e!268804)))

(declare-fun res!275542 () Bool)

(assert (=> b!460803 (=> (not res!275542) (not e!268804))))

(declare-fun e!268806 () Bool)

(assert (=> b!460803 (= res!275542 (not e!268806))))

(declare-fun res!275541 () Bool)

(assert (=> b!460803 (=> (not res!275541) (not e!268806))))

(assert (=> b!460803 (= res!275541 (validKeyInArray!0 (select (arr!13739 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74815 () Bool)

(declare-fun res!275540 () Bool)

(assert (=> d!74815 (=> res!275540 e!268803)))

(assert (=> d!74815 (= res!275540 (bvsge #b00000000000000000000000000000000 (size!14091 _keys!709)))))

(assert (=> d!74815 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8306) e!268803)))

(declare-fun b!460800 () Bool)

(declare-fun contains!2511 (List!8309 (_ BitVec 64)) Bool)

(assert (=> b!460800 (= e!268806 (contains!2511 Nil!8306 (select (arr!13739 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74815 (not res!275540)) b!460803))

(assert (= (and b!460803 res!275541) b!460800))

(assert (= (and b!460803 res!275542) b!460802))

(assert (= (and b!460802 c!56552) b!460801))

(assert (= (and b!460802 (not c!56552)) b!460799))

(assert (= (or b!460801 b!460799) bm!30154))

(assert (=> bm!30154 m!443995))

(declare-fun m!444007 () Bool)

(assert (=> bm!30154 m!444007))

(assert (=> b!460802 m!443995))

(assert (=> b!460802 m!443995))

(assert (=> b!460802 m!444003))

(assert (=> b!460803 m!443995))

(assert (=> b!460803 m!443995))

(assert (=> b!460803 m!444003))

(assert (=> b!460800 m!443995))

(assert (=> b!460800 m!443995))

(declare-fun m!444009 () Bool)

(assert (=> b!460800 m!444009))

(assert (=> b!460687 d!74815))

(declare-fun d!74817 () Bool)

(assert (=> d!74817 (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))

(declare-fun lt!208760 () Unit!13416)

(declare-fun choose!114 (array!28597 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13416)

(assert (=> d!74817 (= lt!208760 (choose!114 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> d!74817 (bvsge from!863 #b00000000000000000000000000000000)))

(assert (=> d!74817 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000) lt!208760)))

(declare-fun bs!14545 () Bool)

(assert (= bs!14545 d!74817))

(assert (=> bs!14545 m!443887))

(declare-fun m!444011 () Bool)

(assert (=> bs!14545 m!444011))

(assert (=> b!460698 d!74817))

(declare-fun d!74819 () Bool)

(assert (=> d!74819 (= (array_inv!9936 _values!549) (bvsge (size!14092 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41192 d!74819))

(declare-fun d!74821 () Bool)

(assert (=> d!74821 (= (array_inv!9937 _keys!709) (bvsge (size!14091 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41192 d!74821))

(declare-fun b!460829 () Bool)

(declare-fun res!275551 () Bool)

(declare-fun e!268825 () Bool)

(assert (=> b!460829 (=> (not res!275551) (not e!268825))))

(declare-fun lt!208781 () ListLongMap!7151)

(assert (=> b!460829 (= res!275551 (not (contains!2509 lt!208781 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460830 () Bool)

(declare-fun e!268821 () Bool)

(declare-fun e!268822 () Bool)

(assert (=> b!460830 (= e!268821 e!268822)))

(assert (=> b!460830 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14091 lt!208678)))))

(declare-fun res!275554 () Bool)

(assert (=> b!460830 (= res!275554 (contains!2509 lt!208781 (select (arr!13739 lt!208678) from!863)))))

(assert (=> b!460830 (=> (not res!275554) (not e!268822))))

(declare-fun b!460831 () Bool)

(declare-fun e!268827 () ListLongMap!7151)

(declare-fun call!30160 () ListLongMap!7151)

(assert (=> b!460831 (= e!268827 call!30160)))

(declare-fun b!460832 () Bool)

(declare-fun e!268826 () ListLongMap!7151)

(assert (=> b!460832 (= e!268826 e!268827)))

(declare-fun c!56562 () Bool)

(assert (=> b!460832 (= c!56562 (validKeyInArray!0 (select (arr!13739 lt!208678) from!863)))))

(declare-fun b!460833 () Bool)

(assert (=> b!460833 (= e!268826 (ListLongMap!7152 Nil!8307))))

(declare-fun b!460834 () Bool)

(assert (=> b!460834 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14091 lt!208678)))))

(assert (=> b!460834 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14092 lt!208683)))))

(declare-fun apply!317 (ListLongMap!7151 (_ BitVec 64)) V!17637)

(assert (=> b!460834 (= e!268822 (= (apply!317 lt!208781 (select (arr!13739 lt!208678) from!863)) (get!6784 (select (arr!13740 lt!208683) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460835 () Bool)

(declare-fun e!268824 () Bool)

(assert (=> b!460835 (= e!268821 e!268824)))

(declare-fun c!56563 () Bool)

(assert (=> b!460835 (= c!56563 (bvslt from!863 (size!14091 lt!208678)))))

(declare-fun b!460836 () Bool)

(assert (=> b!460836 (= e!268824 (= lt!208781 (getCurrentListMapNoExtraKeys!1771 lt!208678 lt!208683 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!30157 () Bool)

(assert (=> bm!30157 (= call!30160 (getCurrentListMapNoExtraKeys!1771 lt!208678 lt!208683 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460837 () Bool)

(declare-fun e!268823 () Bool)

(assert (=> b!460837 (= e!268823 (validKeyInArray!0 (select (arr!13739 lt!208678) from!863)))))

(assert (=> b!460837 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!460828 () Bool)

(declare-fun isEmpty!564 (ListLongMap!7151) Bool)

(assert (=> b!460828 (= e!268824 (isEmpty!564 lt!208781))))

(declare-fun d!74823 () Bool)

(assert (=> d!74823 e!268825))

(declare-fun res!275553 () Bool)

(assert (=> d!74823 (=> (not res!275553) (not e!268825))))

(assert (=> d!74823 (= res!275553 (not (contains!2509 lt!208781 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74823 (= lt!208781 e!268826)))

(declare-fun c!56564 () Bool)

(assert (=> d!74823 (= c!56564 (bvsge from!863 (size!14091 lt!208678)))))

(assert (=> d!74823 (validMask!0 mask!1025)))

(assert (=> d!74823 (= (getCurrentListMapNoExtraKeys!1771 lt!208678 lt!208683 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!208781)))

(declare-fun b!460838 () Bool)

(declare-fun lt!208776 () Unit!13416)

(declare-fun lt!208778 () Unit!13416)

(assert (=> b!460838 (= lt!208776 lt!208778)))

(declare-fun lt!208775 () (_ BitVec 64))

(declare-fun lt!208779 () ListLongMap!7151)

(declare-fun lt!208780 () (_ BitVec 64))

(declare-fun lt!208777 () V!17637)

(assert (=> b!460838 (not (contains!2509 (+!1627 lt!208779 (tuple2!8239 lt!208780 lt!208777)) lt!208775))))

(declare-fun addStillNotContains!150 (ListLongMap!7151 (_ BitVec 64) V!17637 (_ BitVec 64)) Unit!13416)

(assert (=> b!460838 (= lt!208778 (addStillNotContains!150 lt!208779 lt!208780 lt!208777 lt!208775))))

(assert (=> b!460838 (= lt!208775 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460838 (= lt!208777 (get!6784 (select (arr!13740 lt!208683) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460838 (= lt!208780 (select (arr!13739 lt!208678) from!863))))

(assert (=> b!460838 (= lt!208779 call!30160)))

(assert (=> b!460838 (= e!268827 (+!1627 call!30160 (tuple2!8239 (select (arr!13739 lt!208678) from!863) (get!6784 (select (arr!13740 lt!208683) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460839 () Bool)

(assert (=> b!460839 (= e!268825 e!268821)))

(declare-fun c!56561 () Bool)

(assert (=> b!460839 (= c!56561 e!268823)))

(declare-fun res!275552 () Bool)

(assert (=> b!460839 (=> (not res!275552) (not e!268823))))

(assert (=> b!460839 (= res!275552 (bvslt from!863 (size!14091 lt!208678)))))

(assert (= (and d!74823 c!56564) b!460833))

(assert (= (and d!74823 (not c!56564)) b!460832))

(assert (= (and b!460832 c!56562) b!460838))

(assert (= (and b!460832 (not c!56562)) b!460831))

(assert (= (or b!460838 b!460831) bm!30157))

(assert (= (and d!74823 res!275553) b!460829))

(assert (= (and b!460829 res!275551) b!460839))

(assert (= (and b!460839 res!275552) b!460837))

(assert (= (and b!460839 c!56561) b!460830))

(assert (= (and b!460839 (not c!56561)) b!460835))

(assert (= (and b!460830 res!275554) b!460834))

(assert (= (and b!460835 c!56563) b!460836))

(assert (= (and b!460835 (not c!56563)) b!460828))

(declare-fun b_lambda!9901 () Bool)

(assert (=> (not b_lambda!9901) (not b!460834)))

(assert (=> b!460834 t!14248))

(declare-fun b_and!19369 () Bool)

(assert (= b_and!19363 (and (=> t!14248 result!7339) b_and!19369)))

(declare-fun b_lambda!9903 () Bool)

(assert (=> (not b_lambda!9903) (not b!460838)))

(assert (=> b!460838 t!14248))

(declare-fun b_and!19371 () Bool)

(assert (= b_and!19369 (and (=> t!14248 result!7339) b_and!19371)))

(declare-fun m!444013 () Bool)

(assert (=> b!460832 m!444013))

(assert (=> b!460832 m!444013))

(declare-fun m!444015 () Bool)

(assert (=> b!460832 m!444015))

(declare-fun m!444017 () Bool)

(assert (=> d!74823 m!444017))

(assert (=> d!74823 m!443903))

(declare-fun m!444019 () Bool)

(assert (=> b!460838 m!444019))

(assert (=> b!460838 m!443895))

(declare-fun m!444021 () Bool)

(assert (=> b!460838 m!444021))

(declare-fun m!444023 () Bool)

(assert (=> b!460838 m!444023))

(declare-fun m!444025 () Bool)

(assert (=> b!460838 m!444025))

(declare-fun m!444027 () Bool)

(assert (=> b!460838 m!444027))

(assert (=> b!460838 m!444025))

(declare-fun m!444029 () Bool)

(assert (=> b!460838 m!444029))

(assert (=> b!460838 m!444019))

(assert (=> b!460838 m!443895))

(assert (=> b!460838 m!444013))

(declare-fun m!444031 () Bool)

(assert (=> b!460829 m!444031))

(assert (=> b!460837 m!444013))

(assert (=> b!460837 m!444013))

(assert (=> b!460837 m!444015))

(assert (=> b!460834 m!444019))

(assert (=> b!460834 m!443895))

(assert (=> b!460834 m!444021))

(assert (=> b!460834 m!444013))

(declare-fun m!444033 () Bool)

(assert (=> b!460834 m!444033))

(assert (=> b!460834 m!444019))

(assert (=> b!460834 m!443895))

(assert (=> b!460834 m!444013))

(declare-fun m!444035 () Bool)

(assert (=> b!460836 m!444035))

(assert (=> b!460830 m!444013))

(assert (=> b!460830 m!444013))

(declare-fun m!444037 () Bool)

(assert (=> b!460830 m!444037))

(declare-fun m!444039 () Bool)

(assert (=> b!460828 m!444039))

(assert (=> bm!30157 m!444035))

(assert (=> b!460699 d!74823))

(declare-fun b!460841 () Bool)

(declare-fun res!275555 () Bool)

(declare-fun e!268832 () Bool)

(assert (=> b!460841 (=> (not res!275555) (not e!268832))))

(declare-fun lt!208788 () ListLongMap!7151)

(assert (=> b!460841 (= res!275555 (not (contains!2509 lt!208788 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460842 () Bool)

(declare-fun e!268828 () Bool)

(declare-fun e!268829 () Bool)

(assert (=> b!460842 (= e!268828 e!268829)))

(assert (=> b!460842 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14091 _keys!709)))))

(declare-fun res!275558 () Bool)

(assert (=> b!460842 (= res!275558 (contains!2509 lt!208788 (select (arr!13739 _keys!709) from!863)))))

(assert (=> b!460842 (=> (not res!275558) (not e!268829))))

(declare-fun b!460843 () Bool)

(declare-fun e!268834 () ListLongMap!7151)

(declare-fun call!30161 () ListLongMap!7151)

(assert (=> b!460843 (= e!268834 call!30161)))

(declare-fun b!460844 () Bool)

(declare-fun e!268833 () ListLongMap!7151)

(assert (=> b!460844 (= e!268833 e!268834)))

(declare-fun c!56566 () Bool)

(assert (=> b!460844 (= c!56566 (validKeyInArray!0 (select (arr!13739 _keys!709) from!863)))))

(declare-fun b!460845 () Bool)

(assert (=> b!460845 (= e!268833 (ListLongMap!7152 Nil!8307))))

(declare-fun b!460846 () Bool)

(assert (=> b!460846 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14091 _keys!709)))))

(assert (=> b!460846 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14092 _values!549)))))

(assert (=> b!460846 (= e!268829 (= (apply!317 lt!208788 (select (arr!13739 _keys!709) from!863)) (get!6784 (select (arr!13740 _values!549) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460847 () Bool)

(declare-fun e!268831 () Bool)

(assert (=> b!460847 (= e!268828 e!268831)))

(declare-fun c!56567 () Bool)

(assert (=> b!460847 (= c!56567 (bvslt from!863 (size!14091 _keys!709)))))

(declare-fun b!460848 () Bool)

(assert (=> b!460848 (= e!268831 (= lt!208788 (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!30158 () Bool)

(assert (=> bm!30158 (= call!30161 (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460849 () Bool)

(declare-fun e!268830 () Bool)

(assert (=> b!460849 (= e!268830 (validKeyInArray!0 (select (arr!13739 _keys!709) from!863)))))

(assert (=> b!460849 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!460840 () Bool)

(assert (=> b!460840 (= e!268831 (isEmpty!564 lt!208788))))

(declare-fun d!74825 () Bool)

(assert (=> d!74825 e!268832))

(declare-fun res!275557 () Bool)

(assert (=> d!74825 (=> (not res!275557) (not e!268832))))

(assert (=> d!74825 (= res!275557 (not (contains!2509 lt!208788 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74825 (= lt!208788 e!268833)))

(declare-fun c!56568 () Bool)

(assert (=> d!74825 (= c!56568 (bvsge from!863 (size!14091 _keys!709)))))

(assert (=> d!74825 (validMask!0 mask!1025)))

(assert (=> d!74825 (= (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!208788)))

(declare-fun b!460850 () Bool)

(declare-fun lt!208783 () Unit!13416)

(declare-fun lt!208785 () Unit!13416)

(assert (=> b!460850 (= lt!208783 lt!208785)))

(declare-fun lt!208782 () (_ BitVec 64))

(declare-fun lt!208786 () ListLongMap!7151)

(declare-fun lt!208787 () (_ BitVec 64))

(declare-fun lt!208784 () V!17637)

(assert (=> b!460850 (not (contains!2509 (+!1627 lt!208786 (tuple2!8239 lt!208787 lt!208784)) lt!208782))))

(assert (=> b!460850 (= lt!208785 (addStillNotContains!150 lt!208786 lt!208787 lt!208784 lt!208782))))

(assert (=> b!460850 (= lt!208782 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460850 (= lt!208784 (get!6784 (select (arr!13740 _values!549) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460850 (= lt!208787 (select (arr!13739 _keys!709) from!863))))

(assert (=> b!460850 (= lt!208786 call!30161)))

(assert (=> b!460850 (= e!268834 (+!1627 call!30161 (tuple2!8239 (select (arr!13739 _keys!709) from!863) (get!6784 (select (arr!13740 _values!549) from!863) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460851 () Bool)

(assert (=> b!460851 (= e!268832 e!268828)))

(declare-fun c!56565 () Bool)

(assert (=> b!460851 (= c!56565 e!268830)))

(declare-fun res!275556 () Bool)

(assert (=> b!460851 (=> (not res!275556) (not e!268830))))

(assert (=> b!460851 (= res!275556 (bvslt from!863 (size!14091 _keys!709)))))

(assert (= (and d!74825 c!56568) b!460845))

(assert (= (and d!74825 (not c!56568)) b!460844))

(assert (= (and b!460844 c!56566) b!460850))

(assert (= (and b!460844 (not c!56566)) b!460843))

(assert (= (or b!460850 b!460843) bm!30158))

(assert (= (and d!74825 res!275557) b!460841))

(assert (= (and b!460841 res!275555) b!460851))

(assert (= (and b!460851 res!275556) b!460849))

(assert (= (and b!460851 c!56565) b!460842))

(assert (= (and b!460851 (not c!56565)) b!460847))

(assert (= (and b!460842 res!275558) b!460846))

(assert (= (and b!460847 c!56567) b!460848))

(assert (= (and b!460847 (not c!56567)) b!460840))

(declare-fun b_lambda!9905 () Bool)

(assert (=> (not b_lambda!9905) (not b!460846)))

(assert (=> b!460846 t!14248))

(declare-fun b_and!19373 () Bool)

(assert (= b_and!19371 (and (=> t!14248 result!7339) b_and!19373)))

(declare-fun b_lambda!9907 () Bool)

(assert (=> (not b_lambda!9907) (not b!460850)))

(assert (=> b!460850 t!14248))

(declare-fun b_and!19375 () Bool)

(assert (= b_and!19373 (and (=> t!14248 result!7339) b_and!19375)))

(assert (=> b!460844 m!443859))

(assert (=> b!460844 m!443859))

(assert (=> b!460844 m!443869))

(declare-fun m!444041 () Bool)

(assert (=> d!74825 m!444041))

(assert (=> d!74825 m!443903))

(assert (=> b!460850 m!443899))

(assert (=> b!460850 m!443895))

(assert (=> b!460850 m!443901))

(declare-fun m!444043 () Bool)

(assert (=> b!460850 m!444043))

(declare-fun m!444045 () Bool)

(assert (=> b!460850 m!444045))

(declare-fun m!444047 () Bool)

(assert (=> b!460850 m!444047))

(assert (=> b!460850 m!444045))

(declare-fun m!444049 () Bool)

(assert (=> b!460850 m!444049))

(assert (=> b!460850 m!443899))

(assert (=> b!460850 m!443895))

(assert (=> b!460850 m!443859))

(declare-fun m!444051 () Bool)

(assert (=> b!460841 m!444051))

(assert (=> b!460849 m!443859))

(assert (=> b!460849 m!443859))

(assert (=> b!460849 m!443869))

(assert (=> b!460846 m!443899))

(assert (=> b!460846 m!443895))

(assert (=> b!460846 m!443901))

(assert (=> b!460846 m!443859))

(declare-fun m!444053 () Bool)

(assert (=> b!460846 m!444053))

(assert (=> b!460846 m!443899))

(assert (=> b!460846 m!443895))

(assert (=> b!460846 m!443859))

(declare-fun m!444055 () Bool)

(assert (=> b!460848 m!444055))

(assert (=> b!460842 m!443859))

(assert (=> b!460842 m!443859))

(declare-fun m!444057 () Bool)

(assert (=> b!460842 m!444057))

(declare-fun m!444059 () Bool)

(assert (=> b!460840 m!444059))

(assert (=> bm!30158 m!444055))

(assert (=> b!460699 d!74825))

(declare-fun d!74827 () Bool)

(declare-fun e!268835 () Bool)

(assert (=> d!74827 e!268835))

(declare-fun res!275559 () Bool)

(assert (=> d!74827 (=> (not res!275559) (not e!268835))))

(declare-fun lt!208789 () ListLongMap!7151)

(assert (=> d!74827 (= res!275559 (contains!2509 lt!208789 (_1!4130 lt!208690)))))

(declare-fun lt!208792 () List!8310)

(assert (=> d!74827 (= lt!208789 (ListLongMap!7152 lt!208792))))

(declare-fun lt!208790 () Unit!13416)

(declare-fun lt!208791 () Unit!13416)

(assert (=> d!74827 (= lt!208790 lt!208791)))

(assert (=> d!74827 (= (getValueByKey!374 lt!208792 (_1!4130 lt!208690)) (Some!379 (_2!4130 lt!208690)))))

(assert (=> d!74827 (= lt!208791 (lemmaContainsTupThenGetReturnValue!196 lt!208792 (_1!4130 lt!208690) (_2!4130 lt!208690)))))

(assert (=> d!74827 (= lt!208792 (insertStrictlySorted!199 (toList!3591 lt!208686) (_1!4130 lt!208690) (_2!4130 lt!208690)))))

(assert (=> d!74827 (= (+!1627 lt!208686 lt!208690) lt!208789)))

(declare-fun b!460852 () Bool)

(declare-fun res!275560 () Bool)

(assert (=> b!460852 (=> (not res!275560) (not e!268835))))

(assert (=> b!460852 (= res!275560 (= (getValueByKey!374 (toList!3591 lt!208789) (_1!4130 lt!208690)) (Some!379 (_2!4130 lt!208690))))))

(declare-fun b!460853 () Bool)

(assert (=> b!460853 (= e!268835 (contains!2510 (toList!3591 lt!208789) lt!208690))))

(assert (= (and d!74827 res!275559) b!460852))

(assert (= (and b!460852 res!275560) b!460853))

(declare-fun m!444061 () Bool)

(assert (=> d!74827 m!444061))

(declare-fun m!444063 () Bool)

(assert (=> d!74827 m!444063))

(declare-fun m!444065 () Bool)

(assert (=> d!74827 m!444065))

(declare-fun m!444067 () Bool)

(assert (=> d!74827 m!444067))

(declare-fun m!444069 () Bool)

(assert (=> b!460852 m!444069))

(declare-fun m!444071 () Bool)

(assert (=> b!460853 m!444071))

(assert (=> b!460700 d!74827))

(declare-fun d!74829 () Bool)

(declare-fun e!268836 () Bool)

(assert (=> d!74829 e!268836))

(declare-fun res!275561 () Bool)

(assert (=> d!74829 (=> (not res!275561) (not e!268836))))

(declare-fun lt!208793 () ListLongMap!7151)

(assert (=> d!74829 (= res!275561 (contains!2509 lt!208793 (_1!4130 lt!208690)))))

(declare-fun lt!208796 () List!8310)

(assert (=> d!74829 (= lt!208793 (ListLongMap!7152 lt!208796))))

(declare-fun lt!208794 () Unit!13416)

(declare-fun lt!208795 () Unit!13416)

(assert (=> d!74829 (= lt!208794 lt!208795)))

(assert (=> d!74829 (= (getValueByKey!374 lt!208796 (_1!4130 lt!208690)) (Some!379 (_2!4130 lt!208690)))))

(assert (=> d!74829 (= lt!208795 (lemmaContainsTupThenGetReturnValue!196 lt!208796 (_1!4130 lt!208690) (_2!4130 lt!208690)))))

(assert (=> d!74829 (= lt!208796 (insertStrictlySorted!199 (toList!3591 (+!1627 lt!208691 lt!208685)) (_1!4130 lt!208690) (_2!4130 lt!208690)))))

(assert (=> d!74829 (= (+!1627 (+!1627 lt!208691 lt!208685) lt!208690) lt!208793)))

(declare-fun b!460854 () Bool)

(declare-fun res!275562 () Bool)

(assert (=> b!460854 (=> (not res!275562) (not e!268836))))

(assert (=> b!460854 (= res!275562 (= (getValueByKey!374 (toList!3591 lt!208793) (_1!4130 lt!208690)) (Some!379 (_2!4130 lt!208690))))))

(declare-fun b!460855 () Bool)

(assert (=> b!460855 (= e!268836 (contains!2510 (toList!3591 lt!208793) lt!208690))))

(assert (= (and d!74829 res!275561) b!460854))

(assert (= (and b!460854 res!275562) b!460855))

(declare-fun m!444073 () Bool)

(assert (=> d!74829 m!444073))

(declare-fun m!444075 () Bool)

(assert (=> d!74829 m!444075))

(declare-fun m!444077 () Bool)

(assert (=> d!74829 m!444077))

(declare-fun m!444079 () Bool)

(assert (=> d!74829 m!444079))

(declare-fun m!444081 () Bool)

(assert (=> b!460854 m!444081))

(declare-fun m!444083 () Bool)

(assert (=> b!460855 m!444083))

(assert (=> b!460700 d!74829))

(declare-fun d!74831 () Bool)

(declare-fun e!268837 () Bool)

(assert (=> d!74831 e!268837))

(declare-fun res!275563 () Bool)

(assert (=> d!74831 (=> (not res!275563) (not e!268837))))

(declare-fun lt!208797 () ListLongMap!7151)

(assert (=> d!74831 (= res!275563 (contains!2509 lt!208797 (_1!4130 lt!208685)))))

(declare-fun lt!208800 () List!8310)

(assert (=> d!74831 (= lt!208797 (ListLongMap!7152 lt!208800))))

(declare-fun lt!208798 () Unit!13416)

(declare-fun lt!208799 () Unit!13416)

(assert (=> d!74831 (= lt!208798 lt!208799)))

(assert (=> d!74831 (= (getValueByKey!374 lt!208800 (_1!4130 lt!208685)) (Some!379 (_2!4130 lt!208685)))))

(assert (=> d!74831 (= lt!208799 (lemmaContainsTupThenGetReturnValue!196 lt!208800 (_1!4130 lt!208685) (_2!4130 lt!208685)))))

(assert (=> d!74831 (= lt!208800 (insertStrictlySorted!199 (toList!3591 lt!208691) (_1!4130 lt!208685) (_2!4130 lt!208685)))))

(assert (=> d!74831 (= (+!1627 lt!208691 lt!208685) lt!208797)))

(declare-fun b!460856 () Bool)

(declare-fun res!275564 () Bool)

(assert (=> b!460856 (=> (not res!275564) (not e!268837))))

(assert (=> b!460856 (= res!275564 (= (getValueByKey!374 (toList!3591 lt!208797) (_1!4130 lt!208685)) (Some!379 (_2!4130 lt!208685))))))

(declare-fun b!460857 () Bool)

(assert (=> b!460857 (= e!268837 (contains!2510 (toList!3591 lt!208797) lt!208685))))

(assert (= (and d!74831 res!275563) b!460856))

(assert (= (and b!460856 res!275564) b!460857))

(declare-fun m!444085 () Bool)

(assert (=> d!74831 m!444085))

(declare-fun m!444087 () Bool)

(assert (=> d!74831 m!444087))

(declare-fun m!444089 () Bool)

(assert (=> d!74831 m!444089))

(declare-fun m!444091 () Bool)

(assert (=> d!74831 m!444091))

(declare-fun m!444093 () Bool)

(assert (=> b!460856 m!444093))

(declare-fun m!444095 () Bool)

(assert (=> b!460857 m!444095))

(assert (=> b!460700 d!74831))

(declare-fun d!74833 () Bool)

(assert (=> d!74833 (= (+!1627 (+!1627 lt!208691 (tuple2!8239 k0!794 v!412)) (tuple2!8239 (select (arr!13739 _keys!709) from!863) lt!208681)) (+!1627 (+!1627 lt!208691 (tuple2!8239 (select (arr!13739 _keys!709) from!863) lt!208681)) (tuple2!8239 k0!794 v!412)))))

(declare-fun lt!208803 () Unit!13416)

(declare-fun choose!1334 (ListLongMap!7151 (_ BitVec 64) V!17637 (_ BitVec 64) V!17637) Unit!13416)

(assert (=> d!74833 (= lt!208803 (choose!1334 lt!208691 k0!794 v!412 (select (arr!13739 _keys!709) from!863) lt!208681))))

(assert (=> d!74833 (not (= k0!794 (select (arr!13739 _keys!709) from!863)))))

(assert (=> d!74833 (= (addCommutativeForDiffKeys!435 lt!208691 k0!794 v!412 (select (arr!13739 _keys!709) from!863) lt!208681) lt!208803)))

(declare-fun bs!14546 () Bool)

(assert (= bs!14546 d!74833))

(declare-fun m!444097 () Bool)

(assert (=> bs!14546 m!444097))

(declare-fun m!444099 () Bool)

(assert (=> bs!14546 m!444099))

(declare-fun m!444101 () Bool)

(assert (=> bs!14546 m!444101))

(assert (=> bs!14546 m!444099))

(assert (=> bs!14546 m!443859))

(declare-fun m!444103 () Bool)

(assert (=> bs!14546 m!444103))

(assert (=> bs!14546 m!444097))

(declare-fun m!444105 () Bool)

(assert (=> bs!14546 m!444105))

(assert (=> b!460700 d!74833))

(declare-fun d!74835 () Bool)

(assert (=> d!74835 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!460690 d!74835))

(declare-fun d!74837 () Bool)

(assert (=> d!74837 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!460682 d!74837))

(declare-fun b!460859 () Bool)

(declare-fun res!275565 () Bool)

(declare-fun e!268842 () Bool)

(assert (=> b!460859 (=> (not res!275565) (not e!268842))))

(declare-fun lt!208810 () ListLongMap!7151)

(assert (=> b!460859 (= res!275565 (not (contains!2509 lt!208810 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460860 () Bool)

(declare-fun e!268838 () Bool)

(declare-fun e!268839 () Bool)

(assert (=> b!460860 (= e!268838 e!268839)))

(assert (=> b!460860 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14091 _keys!709)))))

(declare-fun res!275568 () Bool)

(assert (=> b!460860 (= res!275568 (contains!2509 lt!208810 (select (arr!13739 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460860 (=> (not res!275568) (not e!268839))))

(declare-fun b!460861 () Bool)

(declare-fun e!268844 () ListLongMap!7151)

(declare-fun call!30162 () ListLongMap!7151)

(assert (=> b!460861 (= e!268844 call!30162)))

(declare-fun b!460862 () Bool)

(declare-fun e!268843 () ListLongMap!7151)

(assert (=> b!460862 (= e!268843 e!268844)))

(declare-fun c!56570 () Bool)

(assert (=> b!460862 (= c!56570 (validKeyInArray!0 (select (arr!13739 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!460863 () Bool)

(assert (=> b!460863 (= e!268843 (ListLongMap!7152 Nil!8307))))

(declare-fun b!460864 () Bool)

(assert (=> b!460864 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14091 _keys!709)))))

(assert (=> b!460864 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14092 _values!549)))))

(assert (=> b!460864 (= e!268839 (= (apply!317 lt!208810 (select (arr!13739 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6784 (select (arr!13740 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460865 () Bool)

(declare-fun e!268841 () Bool)

(assert (=> b!460865 (= e!268838 e!268841)))

(declare-fun c!56571 () Bool)

(assert (=> b!460865 (= c!56571 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14091 _keys!709)))))

(declare-fun b!460866 () Bool)

(assert (=> b!460866 (= e!268841 (= lt!208810 (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!30159 () Bool)

(assert (=> bm!30159 (= call!30162 (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460867 () Bool)

(declare-fun e!268840 () Bool)

(assert (=> b!460867 (= e!268840 (validKeyInArray!0 (select (arr!13739 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460867 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!460858 () Bool)

(assert (=> b!460858 (= e!268841 (isEmpty!564 lt!208810))))

(declare-fun d!74839 () Bool)

(assert (=> d!74839 e!268842))

(declare-fun res!275567 () Bool)

(assert (=> d!74839 (=> (not res!275567) (not e!268842))))

(assert (=> d!74839 (= res!275567 (not (contains!2509 lt!208810 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74839 (= lt!208810 e!268843)))

(declare-fun c!56572 () Bool)

(assert (=> d!74839 (= c!56572 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14091 _keys!709)))))

(assert (=> d!74839 (validMask!0 mask!1025)))

(assert (=> d!74839 (= (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208810)))

(declare-fun b!460868 () Bool)

(declare-fun lt!208805 () Unit!13416)

(declare-fun lt!208807 () Unit!13416)

(assert (=> b!460868 (= lt!208805 lt!208807)))

(declare-fun lt!208808 () ListLongMap!7151)

(declare-fun lt!208809 () (_ BitVec 64))

(declare-fun lt!208806 () V!17637)

(declare-fun lt!208804 () (_ BitVec 64))

(assert (=> b!460868 (not (contains!2509 (+!1627 lt!208808 (tuple2!8239 lt!208809 lt!208806)) lt!208804))))

(assert (=> b!460868 (= lt!208807 (addStillNotContains!150 lt!208808 lt!208809 lt!208806 lt!208804))))

(assert (=> b!460868 (= lt!208804 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460868 (= lt!208806 (get!6784 (select (arr!13740 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460868 (= lt!208809 (select (arr!13739 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!460868 (= lt!208808 call!30162)))

(assert (=> b!460868 (= e!268844 (+!1627 call!30162 (tuple2!8239 (select (arr!13739 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6784 (select (arr!13740 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460869 () Bool)

(assert (=> b!460869 (= e!268842 e!268838)))

(declare-fun c!56569 () Bool)

(assert (=> b!460869 (= c!56569 e!268840)))

(declare-fun res!275566 () Bool)

(assert (=> b!460869 (=> (not res!275566) (not e!268840))))

(assert (=> b!460869 (= res!275566 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14091 _keys!709)))))

(assert (= (and d!74839 c!56572) b!460863))

(assert (= (and d!74839 (not c!56572)) b!460862))

(assert (= (and b!460862 c!56570) b!460868))

(assert (= (and b!460862 (not c!56570)) b!460861))

(assert (= (or b!460868 b!460861) bm!30159))

(assert (= (and d!74839 res!275567) b!460859))

(assert (= (and b!460859 res!275565) b!460869))

(assert (= (and b!460869 res!275566) b!460867))

(assert (= (and b!460869 c!56569) b!460860))

(assert (= (and b!460869 (not c!56569)) b!460865))

(assert (= (and b!460860 res!275568) b!460864))

(assert (= (and b!460865 c!56571) b!460866))

(assert (= (and b!460865 (not c!56571)) b!460858))

(declare-fun b_lambda!9909 () Bool)

(assert (=> (not b_lambda!9909) (not b!460864)))

(assert (=> b!460864 t!14248))

(declare-fun b_and!19377 () Bool)

(assert (= b_and!19375 (and (=> t!14248 result!7339) b_and!19377)))

(declare-fun b_lambda!9911 () Bool)

(assert (=> (not b_lambda!9911) (not b!460868)))

(assert (=> b!460868 t!14248))

(declare-fun b_and!19379 () Bool)

(assert (= b_and!19377 (and (=> t!14248 result!7339) b_and!19379)))

(declare-fun m!444107 () Bool)

(assert (=> b!460862 m!444107))

(assert (=> b!460862 m!444107))

(declare-fun m!444109 () Bool)

(assert (=> b!460862 m!444109))

(declare-fun m!444111 () Bool)

(assert (=> d!74839 m!444111))

(assert (=> d!74839 m!443903))

(declare-fun m!444113 () Bool)

(assert (=> b!460868 m!444113))

(assert (=> b!460868 m!443895))

(declare-fun m!444115 () Bool)

(assert (=> b!460868 m!444115))

(declare-fun m!444117 () Bool)

(assert (=> b!460868 m!444117))

(declare-fun m!444119 () Bool)

(assert (=> b!460868 m!444119))

(declare-fun m!444121 () Bool)

(assert (=> b!460868 m!444121))

(assert (=> b!460868 m!444119))

(declare-fun m!444123 () Bool)

(assert (=> b!460868 m!444123))

(assert (=> b!460868 m!444113))

(assert (=> b!460868 m!443895))

(assert (=> b!460868 m!444107))

(declare-fun m!444125 () Bool)

(assert (=> b!460859 m!444125))

(assert (=> b!460867 m!444107))

(assert (=> b!460867 m!444107))

(assert (=> b!460867 m!444109))

(assert (=> b!460864 m!444113))

(assert (=> b!460864 m!443895))

(assert (=> b!460864 m!444115))

(assert (=> b!460864 m!444107))

(declare-fun m!444127 () Bool)

(assert (=> b!460864 m!444127))

(assert (=> b!460864 m!444113))

(assert (=> b!460864 m!443895))

(assert (=> b!460864 m!444107))

(declare-fun m!444129 () Bool)

(assert (=> b!460866 m!444129))

(assert (=> b!460860 m!444107))

(assert (=> b!460860 m!444107))

(declare-fun m!444131 () Bool)

(assert (=> b!460860 m!444131))

(declare-fun m!444133 () Bool)

(assert (=> b!460858 m!444133))

(assert (=> bm!30159 m!444129))

(assert (=> b!460691 d!74839))

(declare-fun d!74841 () Bool)

(declare-fun e!268845 () Bool)

(assert (=> d!74841 e!268845))

(declare-fun res!275569 () Bool)

(assert (=> d!74841 (=> (not res!275569) (not e!268845))))

(declare-fun lt!208811 () ListLongMap!7151)

(assert (=> d!74841 (= res!275569 (contains!2509 lt!208811 (_1!4130 lt!208690)))))

(declare-fun lt!208814 () List!8310)

(assert (=> d!74841 (= lt!208811 (ListLongMap!7152 lt!208814))))

(declare-fun lt!208812 () Unit!13416)

(declare-fun lt!208813 () Unit!13416)

(assert (=> d!74841 (= lt!208812 lt!208813)))

(assert (=> d!74841 (= (getValueByKey!374 lt!208814 (_1!4130 lt!208690)) (Some!379 (_2!4130 lt!208690)))))

(assert (=> d!74841 (= lt!208813 (lemmaContainsTupThenGetReturnValue!196 lt!208814 (_1!4130 lt!208690) (_2!4130 lt!208690)))))

(assert (=> d!74841 (= lt!208814 (insertStrictlySorted!199 (toList!3591 lt!208691) (_1!4130 lt!208690) (_2!4130 lt!208690)))))

(assert (=> d!74841 (= (+!1627 lt!208691 lt!208690) lt!208811)))

(declare-fun b!460870 () Bool)

(declare-fun res!275570 () Bool)

(assert (=> b!460870 (=> (not res!275570) (not e!268845))))

(assert (=> b!460870 (= res!275570 (= (getValueByKey!374 (toList!3591 lt!208811) (_1!4130 lt!208690)) (Some!379 (_2!4130 lt!208690))))))

(declare-fun b!460871 () Bool)

(assert (=> b!460871 (= e!268845 (contains!2510 (toList!3591 lt!208811) lt!208690))))

(assert (= (and d!74841 res!275569) b!460870))

(assert (= (and b!460870 res!275570) b!460871))

(declare-fun m!444135 () Bool)

(assert (=> d!74841 m!444135))

(declare-fun m!444137 () Bool)

(assert (=> d!74841 m!444137))

(declare-fun m!444139 () Bool)

(assert (=> d!74841 m!444139))

(declare-fun m!444141 () Bool)

(assert (=> d!74841 m!444141))

(declare-fun m!444143 () Bool)

(assert (=> b!460870 m!444143))

(declare-fun m!444145 () Bool)

(assert (=> b!460871 m!444145))

(assert (=> b!460691 d!74841))

(declare-fun d!74843 () Bool)

(assert (=> d!74843 (= (validKeyInArray!0 (select (arr!13739 _keys!709) from!863)) (and (not (= (select (arr!13739 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13739 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!460691 d!74843))

(declare-fun b!460873 () Bool)

(declare-fun res!275571 () Bool)

(declare-fun e!268850 () Bool)

(assert (=> b!460873 (=> (not res!275571) (not e!268850))))

(declare-fun lt!208821 () ListLongMap!7151)

(assert (=> b!460873 (= res!275571 (not (contains!2509 lt!208821 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460874 () Bool)

(declare-fun e!268846 () Bool)

(declare-fun e!268847 () Bool)

(assert (=> b!460874 (= e!268846 e!268847)))

(assert (=> b!460874 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14091 lt!208678)))))

(declare-fun res!275574 () Bool)

(assert (=> b!460874 (= res!275574 (contains!2509 lt!208821 (select (arr!13739 lt!208678) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460874 (=> (not res!275574) (not e!268847))))

(declare-fun b!460875 () Bool)

(declare-fun e!268852 () ListLongMap!7151)

(declare-fun call!30163 () ListLongMap!7151)

(assert (=> b!460875 (= e!268852 call!30163)))

(declare-fun b!460876 () Bool)

(declare-fun e!268851 () ListLongMap!7151)

(assert (=> b!460876 (= e!268851 e!268852)))

(declare-fun c!56574 () Bool)

(assert (=> b!460876 (= c!56574 (validKeyInArray!0 (select (arr!13739 lt!208678) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!460877 () Bool)

(assert (=> b!460877 (= e!268851 (ListLongMap!7152 Nil!8307))))

(declare-fun b!460878 () Bool)

(assert (=> b!460878 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14091 lt!208678)))))

(assert (=> b!460878 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14092 lt!208683)))))

(assert (=> b!460878 (= e!268847 (= (apply!317 lt!208821 (select (arr!13739 lt!208678) (bvadd #b00000000000000000000000000000001 from!863))) (get!6784 (select (arr!13740 lt!208683) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460879 () Bool)

(declare-fun e!268849 () Bool)

(assert (=> b!460879 (= e!268846 e!268849)))

(declare-fun c!56575 () Bool)

(assert (=> b!460879 (= c!56575 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14091 lt!208678)))))

(declare-fun b!460880 () Bool)

(assert (=> b!460880 (= e!268849 (= lt!208821 (getCurrentListMapNoExtraKeys!1771 lt!208678 lt!208683 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!30160 () Bool)

(assert (=> bm!30160 (= call!30163 (getCurrentListMapNoExtraKeys!1771 lt!208678 lt!208683 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460881 () Bool)

(declare-fun e!268848 () Bool)

(assert (=> b!460881 (= e!268848 (validKeyInArray!0 (select (arr!13739 lt!208678) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460881 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!460872 () Bool)

(assert (=> b!460872 (= e!268849 (isEmpty!564 lt!208821))))

(declare-fun d!74845 () Bool)

(assert (=> d!74845 e!268850))

(declare-fun res!275573 () Bool)

(assert (=> d!74845 (=> (not res!275573) (not e!268850))))

(assert (=> d!74845 (= res!275573 (not (contains!2509 lt!208821 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74845 (= lt!208821 e!268851)))

(declare-fun c!56576 () Bool)

(assert (=> d!74845 (= c!56576 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14091 lt!208678)))))

(assert (=> d!74845 (validMask!0 mask!1025)))

(assert (=> d!74845 (= (getCurrentListMapNoExtraKeys!1771 lt!208678 lt!208683 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208821)))

(declare-fun b!460882 () Bool)

(declare-fun lt!208816 () Unit!13416)

(declare-fun lt!208818 () Unit!13416)

(assert (=> b!460882 (= lt!208816 lt!208818)))

(declare-fun lt!208815 () (_ BitVec 64))

(declare-fun lt!208820 () (_ BitVec 64))

(declare-fun lt!208817 () V!17637)

(declare-fun lt!208819 () ListLongMap!7151)

(assert (=> b!460882 (not (contains!2509 (+!1627 lt!208819 (tuple2!8239 lt!208820 lt!208817)) lt!208815))))

(assert (=> b!460882 (= lt!208818 (addStillNotContains!150 lt!208819 lt!208820 lt!208817 lt!208815))))

(assert (=> b!460882 (= lt!208815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460882 (= lt!208817 (get!6784 (select (arr!13740 lt!208683) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460882 (= lt!208820 (select (arr!13739 lt!208678) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!460882 (= lt!208819 call!30163)))

(assert (=> b!460882 (= e!268852 (+!1627 call!30163 (tuple2!8239 (select (arr!13739 lt!208678) (bvadd #b00000000000000000000000000000001 from!863)) (get!6784 (select (arr!13740 lt!208683) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!910 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460883 () Bool)

(assert (=> b!460883 (= e!268850 e!268846)))

(declare-fun c!56573 () Bool)

(assert (=> b!460883 (= c!56573 e!268848)))

(declare-fun res!275572 () Bool)

(assert (=> b!460883 (=> (not res!275572) (not e!268848))))

(assert (=> b!460883 (= res!275572 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14091 lt!208678)))))

(assert (= (and d!74845 c!56576) b!460877))

(assert (= (and d!74845 (not c!56576)) b!460876))

(assert (= (and b!460876 c!56574) b!460882))

(assert (= (and b!460876 (not c!56574)) b!460875))

(assert (= (or b!460882 b!460875) bm!30160))

(assert (= (and d!74845 res!275573) b!460873))

(assert (= (and b!460873 res!275571) b!460883))

(assert (= (and b!460883 res!275572) b!460881))

(assert (= (and b!460883 c!56573) b!460874))

(assert (= (and b!460883 (not c!56573)) b!460879))

(assert (= (and b!460874 res!275574) b!460878))

(assert (= (and b!460879 c!56575) b!460880))

(assert (= (and b!460879 (not c!56575)) b!460872))

(declare-fun b_lambda!9913 () Bool)

(assert (=> (not b_lambda!9913) (not b!460878)))

(assert (=> b!460878 t!14248))

(declare-fun b_and!19381 () Bool)

(assert (= b_and!19379 (and (=> t!14248 result!7339) b_and!19381)))

(declare-fun b_lambda!9915 () Bool)

(assert (=> (not b_lambda!9915) (not b!460882)))

(assert (=> b!460882 t!14248))

(declare-fun b_and!19383 () Bool)

(assert (= b_and!19381 (and (=> t!14248 result!7339) b_and!19383)))

(declare-fun m!444147 () Bool)

(assert (=> b!460876 m!444147))

(assert (=> b!460876 m!444147))

(declare-fun m!444149 () Bool)

(assert (=> b!460876 m!444149))

(declare-fun m!444151 () Bool)

(assert (=> d!74845 m!444151))

(assert (=> d!74845 m!443903))

(declare-fun m!444153 () Bool)

(assert (=> b!460882 m!444153))

(assert (=> b!460882 m!443895))

(declare-fun m!444155 () Bool)

(assert (=> b!460882 m!444155))

(declare-fun m!444157 () Bool)

(assert (=> b!460882 m!444157))

(declare-fun m!444159 () Bool)

(assert (=> b!460882 m!444159))

(declare-fun m!444161 () Bool)

(assert (=> b!460882 m!444161))

(assert (=> b!460882 m!444159))

(declare-fun m!444163 () Bool)

(assert (=> b!460882 m!444163))

(assert (=> b!460882 m!444153))

(assert (=> b!460882 m!443895))

(assert (=> b!460882 m!444147))

(declare-fun m!444165 () Bool)

(assert (=> b!460873 m!444165))

(assert (=> b!460881 m!444147))

(assert (=> b!460881 m!444147))

(assert (=> b!460881 m!444149))

(assert (=> b!460878 m!444153))

(assert (=> b!460878 m!443895))

(assert (=> b!460878 m!444155))

(assert (=> b!460878 m!444147))

(declare-fun m!444167 () Bool)

(assert (=> b!460878 m!444167))

(assert (=> b!460878 m!444153))

(assert (=> b!460878 m!443895))

(assert (=> b!460878 m!444147))

(declare-fun m!444169 () Bool)

(assert (=> b!460880 m!444169))

(assert (=> b!460874 m!444147))

(assert (=> b!460874 m!444147))

(declare-fun m!444171 () Bool)

(assert (=> b!460874 m!444171))

(declare-fun m!444173 () Bool)

(assert (=> b!460872 m!444173))

(assert (=> bm!30160 m!444169))

(assert (=> b!460691 d!74845))

(declare-fun d!74847 () Bool)

(declare-fun e!268857 () Bool)

(assert (=> d!74847 e!268857))

(declare-fun res!275577 () Bool)

(assert (=> d!74847 (=> (not res!275577) (not e!268857))))

(assert (=> d!74847 (= res!275577 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14091 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14092 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14091 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14092 _values!549))))))))

(declare-fun lt!208824 () Unit!13416)

(declare-fun choose!1335 (array!28597 array!28599 (_ BitVec 32) (_ BitVec 32) V!17637 V!17637 (_ BitVec 32) (_ BitVec 64) V!17637 (_ BitVec 32) Int) Unit!13416)

(assert (=> d!74847 (= lt!208824 (choose!1335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74847 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14091 _keys!709)))))

(assert (=> d!74847 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!783 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208824)))

(declare-fun call!30168 () ListLongMap!7151)

(declare-fun b!460890 () Bool)

(declare-fun e!268858 () Bool)

(declare-fun call!30169 () ListLongMap!7151)

(assert (=> b!460890 (= e!268858 (= call!30169 (+!1627 call!30168 (tuple2!8239 k0!794 v!412))))))

(declare-fun bm!30165 () Bool)

(assert (=> bm!30165 (= call!30168 (getCurrentListMapNoExtraKeys!1771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460891 () Bool)

(assert (=> b!460891 (= e!268857 e!268858)))

(declare-fun c!56579 () Bool)

(assert (=> b!460891 (= c!56579 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun bm!30166 () Bool)

(assert (=> bm!30166 (= call!30169 (getCurrentListMapNoExtraKeys!1771 (array!28598 (store (arr!13739 _keys!709) i!563 k0!794) (size!14091 _keys!709)) (array!28600 (store (arr!13740 _values!549) i!563 (ValueCellFull!5856 v!412)) (size!14092 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460892 () Bool)

(assert (=> b!460892 (= e!268858 (= call!30169 call!30168))))

(assert (= (and d!74847 res!275577) b!460891))

(assert (= (and b!460891 c!56579) b!460890))

(assert (= (and b!460891 (not c!56579)) b!460892))

(assert (= (or b!460890 b!460892) bm!30165))

(assert (= (or b!460890 b!460892) bm!30166))

(declare-fun m!444175 () Bool)

(assert (=> d!74847 m!444175))

(declare-fun m!444177 () Bool)

(assert (=> b!460890 m!444177))

(assert (=> bm!30165 m!443863))

(assert (=> bm!30166 m!443873))

(assert (=> bm!30166 m!443913))

(declare-fun m!444179 () Bool)

(assert (=> bm!30166 m!444179))

(assert (=> b!460691 d!74847))

(declare-fun d!74849 () Bool)

(declare-fun res!275582 () Bool)

(declare-fun e!268863 () Bool)

(assert (=> d!74849 (=> res!275582 e!268863)))

(assert (=> d!74849 (= res!275582 (= (select (arr!13739 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74849 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!268863)))

(declare-fun b!460897 () Bool)

(declare-fun e!268864 () Bool)

(assert (=> b!460897 (= e!268863 e!268864)))

(declare-fun res!275583 () Bool)

(assert (=> b!460897 (=> (not res!275583) (not e!268864))))

(assert (=> b!460897 (= res!275583 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14091 _keys!709)))))

(declare-fun b!460898 () Bool)

(assert (=> b!460898 (= e!268864 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74849 (not res!275582)) b!460897))

(assert (= (and b!460897 res!275583) b!460898))

(assert (=> d!74849 m!443995))

(declare-fun m!444181 () Bool)

(assert (=> b!460898 m!444181))

(assert (=> b!460692 d!74849))

(declare-fun d!74851 () Bool)

(declare-fun res!275585 () Bool)

(declare-fun e!268866 () Bool)

(assert (=> d!74851 (=> res!275585 e!268866)))

(assert (=> d!74851 (= res!275585 (bvsge #b00000000000000000000000000000000 (size!14091 lt!208678)))))

(assert (=> d!74851 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208678 mask!1025) e!268866)))

(declare-fun b!460899 () Bool)

(declare-fun e!268865 () Bool)

(declare-fun call!30170 () Bool)

(assert (=> b!460899 (= e!268865 call!30170)))

(declare-fun b!460900 () Bool)

(declare-fun e!268867 () Bool)

(assert (=> b!460900 (= e!268865 e!268867)))

(declare-fun lt!208826 () (_ BitVec 64))

(assert (=> b!460900 (= lt!208826 (select (arr!13739 lt!208678) #b00000000000000000000000000000000))))

(declare-fun lt!208827 () Unit!13416)

(assert (=> b!460900 (= lt!208827 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!208678 lt!208826 #b00000000000000000000000000000000))))

(assert (=> b!460900 (arrayContainsKey!0 lt!208678 lt!208826 #b00000000000000000000000000000000)))

(declare-fun lt!208825 () Unit!13416)

(assert (=> b!460900 (= lt!208825 lt!208827)))

(declare-fun res!275584 () Bool)

(assert (=> b!460900 (= res!275584 (= (seekEntryOrOpen!0 (select (arr!13739 lt!208678) #b00000000000000000000000000000000) lt!208678 mask!1025) (Found!3536 #b00000000000000000000000000000000)))))

(assert (=> b!460900 (=> (not res!275584) (not e!268867))))

(declare-fun b!460901 () Bool)

(assert (=> b!460901 (= e!268866 e!268865)))

(declare-fun c!56580 () Bool)

(assert (=> b!460901 (= c!56580 (validKeyInArray!0 (select (arr!13739 lt!208678) #b00000000000000000000000000000000)))))

(declare-fun bm!30167 () Bool)

(assert (=> bm!30167 (= call!30170 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!208678 mask!1025))))

(declare-fun b!460902 () Bool)

(assert (=> b!460902 (= e!268867 call!30170)))

(assert (= (and d!74851 (not res!275585)) b!460901))

(assert (= (and b!460901 c!56580) b!460900))

(assert (= (and b!460901 (not c!56580)) b!460899))

(assert (= (and b!460900 res!275584) b!460902))

(assert (= (or b!460902 b!460899) bm!30167))

(declare-fun m!444183 () Bool)

(assert (=> b!460900 m!444183))

(declare-fun m!444185 () Bool)

(assert (=> b!460900 m!444185))

(declare-fun m!444187 () Bool)

(assert (=> b!460900 m!444187))

(assert (=> b!460900 m!444183))

(declare-fun m!444189 () Bool)

(assert (=> b!460900 m!444189))

(assert (=> b!460901 m!444183))

(assert (=> b!460901 m!444183))

(declare-fun m!444191 () Bool)

(assert (=> b!460901 m!444191))

(declare-fun m!444193 () Bool)

(assert (=> bm!30167 m!444193))

(assert (=> b!460693 d!74851))

(declare-fun b!460903 () Bool)

(declare-fun e!268870 () Bool)

(declare-fun call!30171 () Bool)

(assert (=> b!460903 (= e!268870 call!30171)))

(declare-fun bm!30168 () Bool)

(declare-fun c!56581 () Bool)

(assert (=> bm!30168 (= call!30171 (arrayNoDuplicates!0 lt!208678 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56581 (Cons!8305 (select (arr!13739 lt!208678) #b00000000000000000000000000000000) Nil!8306) Nil!8306)))))

(declare-fun b!460905 () Bool)

(assert (=> b!460905 (= e!268870 call!30171)))

(declare-fun b!460906 () Bool)

(declare-fun e!268869 () Bool)

(assert (=> b!460906 (= e!268869 e!268870)))

(assert (=> b!460906 (= c!56581 (validKeyInArray!0 (select (arr!13739 lt!208678) #b00000000000000000000000000000000)))))

(declare-fun b!460907 () Bool)

(declare-fun e!268868 () Bool)

(assert (=> b!460907 (= e!268868 e!268869)))

(declare-fun res!275588 () Bool)

(assert (=> b!460907 (=> (not res!275588) (not e!268869))))

(declare-fun e!268871 () Bool)

(assert (=> b!460907 (= res!275588 (not e!268871))))

(declare-fun res!275587 () Bool)

(assert (=> b!460907 (=> (not res!275587) (not e!268871))))

(assert (=> b!460907 (= res!275587 (validKeyInArray!0 (select (arr!13739 lt!208678) #b00000000000000000000000000000000)))))

(declare-fun d!74853 () Bool)

(declare-fun res!275586 () Bool)

(assert (=> d!74853 (=> res!275586 e!268868)))

(assert (=> d!74853 (= res!275586 (bvsge #b00000000000000000000000000000000 (size!14091 lt!208678)))))

(assert (=> d!74853 (= (arrayNoDuplicates!0 lt!208678 #b00000000000000000000000000000000 Nil!8306) e!268868)))

(declare-fun b!460904 () Bool)

(assert (=> b!460904 (= e!268871 (contains!2511 Nil!8306 (select (arr!13739 lt!208678) #b00000000000000000000000000000000)))))

(assert (= (and d!74853 (not res!275586)) b!460907))

(assert (= (and b!460907 res!275587) b!460904))

(assert (= (and b!460907 res!275588) b!460906))

(assert (= (and b!460906 c!56581) b!460905))

(assert (= (and b!460906 (not c!56581)) b!460903))

(assert (= (or b!460905 b!460903) bm!30168))

(assert (=> bm!30168 m!444183))

(declare-fun m!444195 () Bool)

(assert (=> bm!30168 m!444195))

(assert (=> b!460906 m!444183))

(assert (=> b!460906 m!444183))

(assert (=> b!460906 m!444191))

(assert (=> b!460907 m!444183))

(assert (=> b!460907 m!444183))

(assert (=> b!460907 m!444191))

(assert (=> b!460904 m!444183))

(assert (=> b!460904 m!444183))

(declare-fun m!444197 () Bool)

(assert (=> b!460904 m!444197))

(assert (=> b!460685 d!74853))

(declare-fun condMapEmpty!20254 () Bool)

(declare-fun mapDefault!20254 () ValueCell!5856)

(assert (=> mapNonEmpty!20248 (= condMapEmpty!20254 (= mapRest!20248 ((as const (Array (_ BitVec 32) ValueCell!5856)) mapDefault!20254)))))

(declare-fun e!268877 () Bool)

(declare-fun mapRes!20254 () Bool)

(assert (=> mapNonEmpty!20248 (= tp!39019 (and e!268877 mapRes!20254))))

(declare-fun mapNonEmpty!20254 () Bool)

(declare-fun tp!39028 () Bool)

(declare-fun e!268876 () Bool)

(assert (=> mapNonEmpty!20254 (= mapRes!20254 (and tp!39028 e!268876))))

(declare-fun mapRest!20254 () (Array (_ BitVec 32) ValueCell!5856))

(declare-fun mapValue!20254 () ValueCell!5856)

(declare-fun mapKey!20254 () (_ BitVec 32))

(assert (=> mapNonEmpty!20254 (= mapRest!20248 (store mapRest!20254 mapKey!20254 mapValue!20254))))

(declare-fun mapIsEmpty!20254 () Bool)

(assert (=> mapIsEmpty!20254 mapRes!20254))

(declare-fun b!460915 () Bool)

(assert (=> b!460915 (= e!268877 tp_is_empty!12399)))

(declare-fun b!460914 () Bool)

(assert (=> b!460914 (= e!268876 tp_is_empty!12399)))

(assert (= (and mapNonEmpty!20248 condMapEmpty!20254) mapIsEmpty!20254))

(assert (= (and mapNonEmpty!20248 (not condMapEmpty!20254)) mapNonEmpty!20254))

(assert (= (and mapNonEmpty!20254 ((_ is ValueCellFull!5856) mapValue!20254)) b!460914))

(assert (= (and mapNonEmpty!20248 ((_ is ValueCellFull!5856) mapDefault!20254)) b!460915))

(declare-fun m!444199 () Bool)

(assert (=> mapNonEmpty!20254 m!444199))

(declare-fun b_lambda!9917 () Bool)

(assert (= b_lambda!9907 (or (and start!41192 b_free!11061) b_lambda!9917)))

(declare-fun b_lambda!9919 () Bool)

(assert (= b_lambda!9911 (or (and start!41192 b_free!11061) b_lambda!9919)))

(declare-fun b_lambda!9921 () Bool)

(assert (= b_lambda!9903 (or (and start!41192 b_free!11061) b_lambda!9921)))

(declare-fun b_lambda!9923 () Bool)

(assert (= b_lambda!9901 (or (and start!41192 b_free!11061) b_lambda!9923)))

(declare-fun b_lambda!9925 () Bool)

(assert (= b_lambda!9905 (or (and start!41192 b_free!11061) b_lambda!9925)))

(declare-fun b_lambda!9927 () Bool)

(assert (= b_lambda!9909 (or (and start!41192 b_free!11061) b_lambda!9927)))

(declare-fun b_lambda!9929 () Bool)

(assert (= b_lambda!9913 (or (and start!41192 b_free!11061) b_lambda!9929)))

(declare-fun b_lambda!9931 () Bool)

(assert (= b_lambda!9915 (or (and start!41192 b_free!11061) b_lambda!9931)))

(check-sat (not b!460907) (not b!460802) (not b_lambda!9921) (not bm!30165) (not b_lambda!9931) (not b!460832) (not b!460848) (not b!460873) tp_is_empty!12399 (not b!460870) (not b_lambda!9925) (not bm!30158) (not b!460770) (not b!460867) (not d!74827) (not bm!30160) (not b!460904) (not b_lambda!9923) (not d!74831) (not b!460842) (not b!460898) (not b!460860) (not b!460854) (not b!460868) (not b!460836) (not b!460849) (not b!460837) (not b!460872) (not bm!30168) (not mapNonEmpty!20254) (not d!74829) (not b!460803) (not b!460852) (not d!74809) (not b!460775) (not d!74847) (not b!460906) (not d!74839) (not b!460834) (not bm!30159) (not b!460787) (not bm!30167) (not b!460876) (not d!74833) (not d!74845) (not b_next!11061) (not b!460856) (not b!460857) (not b!460830) (not b!460786) (not b!460878) (not b!460900) (not b!460853) (not b!460874) (not b!460850) (not b_lambda!9929) (not b!460871) (not b!460880) (not d!74817) (not b!460840) (not b!460890) b_and!19383 (not b!460855) (not b!460841) (not d!74825) (not b!460859) (not b_lambda!9919) (not b_lambda!9927) (not bm!30151) (not b!460846) (not d!74841) (not b_lambda!9899) (not b!460901) (not bm!30154) (not b!460862) (not b!460800) (not b!460829) (not b_lambda!9917) (not b!460858) (not bm!30166) (not b!460769) (not b!460882) (not b!460776) (not b!460864) (not b!460838) (not b!460881) (not bm!30157) (not d!74823) (not b!460866) (not b!460828) (not b!460844))
(check-sat b_and!19383 (not b_next!11061))
