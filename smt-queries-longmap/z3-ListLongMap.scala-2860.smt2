; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41176 () Bool)

(assert start!41176)

(declare-fun b_free!11059 () Bool)

(declare-fun b_next!11059 () Bool)

(assert (=> start!41176 (= b_free!11059 (not b_next!11059))))

(declare-fun tp!39012 () Bool)

(declare-fun b_and!19367 () Bool)

(assert (=> start!41176 (= tp!39012 b_and!19367)))

(declare-fun b!460558 () Bool)

(declare-fun e!268678 () Bool)

(declare-fun e!268674 () Bool)

(assert (=> b!460558 (= e!268678 (not e!268674))))

(declare-fun res!275416 () Bool)

(assert (=> b!460558 (=> res!275416 e!268674)))

(declare-datatypes ((array!28588 0))(
  ( (array!28589 (arr!13734 (Array (_ BitVec 32) (_ BitVec 64))) (size!14086 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28588)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460558 (= res!275416 (not (validKeyInArray!0 (select (arr!13734 _keys!709) from!863))))))

(declare-datatypes ((V!17635 0))(
  ( (V!17636 (val!6243 Int)) )
))
(declare-datatypes ((tuple2!8164 0))(
  ( (tuple2!8165 (_1!4093 (_ BitVec 64)) (_2!4093 V!17635)) )
))
(declare-datatypes ((List!8228 0))(
  ( (Nil!8225) (Cons!8224 (h!9080 tuple2!8164) (t!14158 List!8228)) )
))
(declare-datatypes ((ListLongMap!7079 0))(
  ( (ListLongMap!7080 (toList!3555 List!8228)) )
))
(declare-fun lt!208655 () ListLongMap!7079)

(declare-fun lt!208645 () ListLongMap!7079)

(assert (=> b!460558 (= lt!208655 lt!208645)))

(declare-fun lt!208648 () ListLongMap!7079)

(declare-fun lt!208652 () tuple2!8164)

(declare-fun +!1630 (ListLongMap!7079 tuple2!8164) ListLongMap!7079)

(assert (=> b!460558 (= lt!208645 (+!1630 lt!208648 lt!208652))))

(declare-fun lt!208654 () array!28588)

(declare-fun minValue!515 () V!17635)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17635)

(declare-datatypes ((ValueCell!5855 0))(
  ( (ValueCellFull!5855 (v!8522 V!17635)) (EmptyCell!5855) )
))
(declare-datatypes ((array!28590 0))(
  ( (array!28591 (arr!13735 (Array (_ BitVec 32) ValueCell!5855)) (size!14087 (_ BitVec 32))) )
))
(declare-fun lt!208646 () array!28590)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1782 (array!28588 array!28590 (_ BitVec 32) (_ BitVec 32) V!17635 V!17635 (_ BitVec 32) Int) ListLongMap!7079)

(assert (=> b!460558 (= lt!208655 (getCurrentListMapNoExtraKeys!1782 lt!208654 lt!208646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17635)

(assert (=> b!460558 (= lt!208652 (tuple2!8165 k0!794 v!412))))

(declare-fun _values!549 () array!28590)

(assert (=> b!460558 (= lt!208648 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13399 0))(
  ( (Unit!13400) )
))
(declare-fun lt!208657 () Unit!13399)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!784 (array!28588 array!28590 (_ BitVec 32) (_ BitVec 32) V!17635 V!17635 (_ BitVec 32) (_ BitVec 64) V!17635 (_ BitVec 32) Int) Unit!13399)

(assert (=> b!460558 (= lt!208657 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!784 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460559 () Bool)

(declare-fun e!268679 () Bool)

(declare-fun e!268671 () Bool)

(assert (=> b!460559 (= e!268679 e!268671)))

(declare-fun res!275415 () Bool)

(assert (=> b!460559 (=> (not res!275415) (not e!268671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28588 (_ BitVec 32)) Bool)

(assert (=> b!460559 (= res!275415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208654 mask!1025))))

(assert (=> b!460559 (= lt!208654 (array!28589 (store (arr!13734 _keys!709) i!563 k0!794) (size!14086 _keys!709)))))

(declare-fun b!460560 () Bool)

(declare-fun res!275420 () Bool)

(assert (=> b!460560 (=> (not res!275420) (not e!268679))))

(declare-datatypes ((List!8229 0))(
  ( (Nil!8226) (Cons!8225 (h!9081 (_ BitVec 64)) (t!14159 List!8229)) )
))
(declare-fun arrayNoDuplicates!0 (array!28588 (_ BitVec 32) List!8229) Bool)

(assert (=> b!460560 (= res!275420 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8226))))

(declare-fun b!460561 () Bool)

(declare-fun res!275410 () Bool)

(assert (=> b!460561 (=> (not res!275410) (not e!268679))))

(assert (=> b!460561 (= res!275410 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14086 _keys!709))))))

(declare-fun b!460562 () Bool)

(declare-fun res!275422 () Bool)

(assert (=> b!460562 (=> (not res!275422) (not e!268679))))

(assert (=> b!460562 (= res!275422 (validKeyInArray!0 k0!794))))

(declare-fun b!460563 () Bool)

(declare-fun res!275413 () Bool)

(assert (=> b!460563 (=> (not res!275413) (not e!268679))))

(assert (=> b!460563 (= res!275413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460564 () Bool)

(declare-fun e!268680 () Bool)

(assert (=> b!460564 (= e!268674 e!268680)))

(declare-fun res!275423 () Bool)

(assert (=> b!460564 (=> res!275423 e!268680)))

(assert (=> b!460564 (= res!275423 (= k0!794 (select (arr!13734 _keys!709) from!863)))))

(assert (=> b!460564 (not (= (select (arr!13734 _keys!709) from!863) k0!794))))

(declare-fun lt!208651 () Unit!13399)

(declare-fun e!268675 () Unit!13399)

(assert (=> b!460564 (= lt!208651 e!268675)))

(declare-fun c!56510 () Bool)

(assert (=> b!460564 (= c!56510 (= (select (arr!13734 _keys!709) from!863) k0!794))))

(declare-fun lt!208650 () ListLongMap!7079)

(declare-fun lt!208653 () ListLongMap!7079)

(assert (=> b!460564 (= lt!208650 lt!208653)))

(declare-fun lt!208649 () tuple2!8164)

(assert (=> b!460564 (= lt!208653 (+!1630 lt!208645 lt!208649))))

(declare-fun lt!208644 () V!17635)

(assert (=> b!460564 (= lt!208649 (tuple2!8165 (select (arr!13734 _keys!709) from!863) lt!208644))))

(declare-fun get!6785 (ValueCell!5855 V!17635) V!17635)

(declare-fun dynLambda!905 (Int (_ BitVec 64)) V!17635)

(assert (=> b!460564 (= lt!208644 (get!6785 (select (arr!13735 _values!549) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460565 () Bool)

(declare-fun res!275411 () Bool)

(assert (=> b!460565 (=> (not res!275411) (not e!268679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460565 (= res!275411 (validMask!0 mask!1025))))

(declare-fun b!460566 () Bool)

(declare-fun Unit!13401 () Unit!13399)

(assert (=> b!460566 (= e!268675 Unit!13401)))

(declare-fun lt!208647 () ListLongMap!7079)

(declare-fun b!460567 () Bool)

(assert (=> b!460567 (= e!268680 (= lt!208650 (+!1630 lt!208647 lt!208652)))))

(assert (=> b!460567 (= lt!208653 (+!1630 (+!1630 lt!208648 lt!208649) lt!208652))))

(declare-fun lt!208656 () Unit!13399)

(declare-fun addCommutativeForDiffKeys!427 (ListLongMap!7079 (_ BitVec 64) V!17635 (_ BitVec 64) V!17635) Unit!13399)

(assert (=> b!460567 (= lt!208656 (addCommutativeForDiffKeys!427 lt!208648 k0!794 v!412 (select (arr!13734 _keys!709) from!863) lt!208644))))

(declare-fun mapNonEmpty!20245 () Bool)

(declare-fun mapRes!20245 () Bool)

(declare-fun tp!39013 () Bool)

(declare-fun e!268672 () Bool)

(assert (=> mapNonEmpty!20245 (= mapRes!20245 (and tp!39013 e!268672))))

(declare-fun mapKey!20245 () (_ BitVec 32))

(declare-fun mapRest!20245 () (Array (_ BitVec 32) ValueCell!5855))

(declare-fun mapValue!20245 () ValueCell!5855)

(assert (=> mapNonEmpty!20245 (= (arr!13735 _values!549) (store mapRest!20245 mapKey!20245 mapValue!20245))))

(declare-fun res!275418 () Bool)

(assert (=> start!41176 (=> (not res!275418) (not e!268679))))

(assert (=> start!41176 (= res!275418 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14086 _keys!709))))))

(assert (=> start!41176 e!268679))

(declare-fun tp_is_empty!12397 () Bool)

(assert (=> start!41176 tp_is_empty!12397))

(assert (=> start!41176 tp!39012))

(assert (=> start!41176 true))

(declare-fun e!268677 () Bool)

(declare-fun array_inv!10014 (array!28590) Bool)

(assert (=> start!41176 (and (array_inv!10014 _values!549) e!268677)))

(declare-fun array_inv!10015 (array!28588) Bool)

(assert (=> start!41176 (array_inv!10015 _keys!709)))

(declare-fun b!460568 () Bool)

(declare-fun e!268673 () Bool)

(assert (=> b!460568 (= e!268677 (and e!268673 mapRes!20245))))

(declare-fun condMapEmpty!20245 () Bool)

(declare-fun mapDefault!20245 () ValueCell!5855)

(assert (=> b!460568 (= condMapEmpty!20245 (= (arr!13735 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5855)) mapDefault!20245)))))

(declare-fun b!460569 () Bool)

(declare-fun res!275412 () Bool)

(assert (=> b!460569 (=> (not res!275412) (not e!268679))))

(assert (=> b!460569 (= res!275412 (or (= (select (arr!13734 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13734 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460570 () Bool)

(assert (=> b!460570 (= e!268673 tp_is_empty!12397)))

(declare-fun b!460571 () Bool)

(declare-fun res!275421 () Bool)

(assert (=> b!460571 (=> (not res!275421) (not e!268679))))

(assert (=> b!460571 (= res!275421 (and (= (size!14087 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14086 _keys!709) (size!14087 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460572 () Bool)

(assert (=> b!460572 (= e!268671 e!268678)))

(declare-fun res!275424 () Bool)

(assert (=> b!460572 (=> (not res!275424) (not e!268678))))

(assert (=> b!460572 (= res!275424 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!460572 (= lt!208650 (getCurrentListMapNoExtraKeys!1782 lt!208654 lt!208646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460572 (= lt!208646 (array!28591 (store (arr!13735 _values!549) i!563 (ValueCellFull!5855 v!412)) (size!14087 _values!549)))))

(assert (=> b!460572 (= lt!208647 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460573 () Bool)

(assert (=> b!460573 (= e!268672 tp_is_empty!12397)))

(declare-fun b!460574 () Bool)

(declare-fun res!275414 () Bool)

(assert (=> b!460574 (=> (not res!275414) (not e!268671))))

(assert (=> b!460574 (= res!275414 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20245 () Bool)

(assert (=> mapIsEmpty!20245 mapRes!20245))

(declare-fun b!460575 () Bool)

(declare-fun res!275419 () Bool)

(assert (=> b!460575 (=> (not res!275419) (not e!268671))))

(assert (=> b!460575 (= res!275419 (arrayNoDuplicates!0 lt!208654 #b00000000000000000000000000000000 Nil!8226))))

(declare-fun b!460576 () Bool)

(declare-fun Unit!13402 () Unit!13399)

(assert (=> b!460576 (= e!268675 Unit!13402)))

(declare-fun lt!208658 () Unit!13399)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28588 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13399)

(assert (=> b!460576 (= lt!208658 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460576 false))

(declare-fun b!460577 () Bool)

(declare-fun res!275417 () Bool)

(assert (=> b!460577 (=> (not res!275417) (not e!268679))))

(declare-fun arrayContainsKey!0 (array!28588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460577 (= res!275417 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!41176 res!275418) b!460565))

(assert (= (and b!460565 res!275411) b!460571))

(assert (= (and b!460571 res!275421) b!460563))

(assert (= (and b!460563 res!275413) b!460560))

(assert (= (and b!460560 res!275420) b!460561))

(assert (= (and b!460561 res!275410) b!460562))

(assert (= (and b!460562 res!275422) b!460569))

(assert (= (and b!460569 res!275412) b!460577))

(assert (= (and b!460577 res!275417) b!460559))

(assert (= (and b!460559 res!275415) b!460575))

(assert (= (and b!460575 res!275419) b!460574))

(assert (= (and b!460574 res!275414) b!460572))

(assert (= (and b!460572 res!275424) b!460558))

(assert (= (and b!460558 (not res!275416)) b!460564))

(assert (= (and b!460564 c!56510) b!460576))

(assert (= (and b!460564 (not c!56510)) b!460566))

(assert (= (and b!460564 (not res!275423)) b!460567))

(assert (= (and b!460568 condMapEmpty!20245) mapIsEmpty!20245))

(assert (= (and b!460568 (not condMapEmpty!20245)) mapNonEmpty!20245))

(get-info :version)

(assert (= (and mapNonEmpty!20245 ((_ is ValueCellFull!5855) mapValue!20245)) b!460573))

(assert (= (and b!460568 ((_ is ValueCellFull!5855) mapDefault!20245)) b!460570))

(assert (= start!41176 b!460568))

(declare-fun b_lambda!9907 () Bool)

(assert (=> (not b_lambda!9907) (not b!460564)))

(declare-fun t!14157 () Bool)

(declare-fun tb!3887 () Bool)

(assert (=> (and start!41176 (= defaultEntry!557 defaultEntry!557) t!14157) tb!3887))

(declare-fun result!7327 () Bool)

(assert (=> tb!3887 (= result!7327 tp_is_empty!12397)))

(assert (=> b!460564 t!14157))

(declare-fun b_and!19369 () Bool)

(assert (= b_and!19367 (and (=> t!14157 result!7327) b_and!19369)))

(declare-fun m!443981 () Bool)

(assert (=> b!460575 m!443981))

(declare-fun m!443983 () Bool)

(assert (=> b!460569 m!443983))

(declare-fun m!443985 () Bool)

(assert (=> b!460565 m!443985))

(declare-fun m!443987 () Bool)

(assert (=> b!460563 m!443987))

(declare-fun m!443989 () Bool)

(assert (=> b!460558 m!443989))

(declare-fun m!443991 () Bool)

(assert (=> b!460558 m!443991))

(declare-fun m!443993 () Bool)

(assert (=> b!460558 m!443993))

(declare-fun m!443995 () Bool)

(assert (=> b!460558 m!443995))

(assert (=> b!460558 m!443989))

(declare-fun m!443997 () Bool)

(assert (=> b!460558 m!443997))

(declare-fun m!443999 () Bool)

(assert (=> b!460558 m!443999))

(declare-fun m!444001 () Bool)

(assert (=> b!460562 m!444001))

(assert (=> b!460564 m!443989))

(declare-fun m!444003 () Bool)

(assert (=> b!460564 m!444003))

(declare-fun m!444005 () Bool)

(assert (=> b!460564 m!444005))

(declare-fun m!444007 () Bool)

(assert (=> b!460564 m!444007))

(assert (=> b!460564 m!444007))

(assert (=> b!460564 m!444005))

(declare-fun m!444009 () Bool)

(assert (=> b!460564 m!444009))

(declare-fun m!444011 () Bool)

(assert (=> b!460559 m!444011))

(declare-fun m!444013 () Bool)

(assert (=> b!460559 m!444013))

(declare-fun m!444015 () Bool)

(assert (=> start!41176 m!444015))

(declare-fun m!444017 () Bool)

(assert (=> start!41176 m!444017))

(assert (=> b!460567 m!443989))

(assert (=> b!460567 m!443989))

(declare-fun m!444019 () Bool)

(assert (=> b!460567 m!444019))

(declare-fun m!444021 () Bool)

(assert (=> b!460567 m!444021))

(declare-fun m!444023 () Bool)

(assert (=> b!460567 m!444023))

(assert (=> b!460567 m!444021))

(declare-fun m!444025 () Bool)

(assert (=> b!460567 m!444025))

(declare-fun m!444027 () Bool)

(assert (=> b!460572 m!444027))

(declare-fun m!444029 () Bool)

(assert (=> b!460572 m!444029))

(declare-fun m!444031 () Bool)

(assert (=> b!460572 m!444031))

(declare-fun m!444033 () Bool)

(assert (=> b!460576 m!444033))

(declare-fun m!444035 () Bool)

(assert (=> b!460577 m!444035))

(declare-fun m!444037 () Bool)

(assert (=> b!460560 m!444037))

(declare-fun m!444039 () Bool)

(assert (=> mapNonEmpty!20245 m!444039))

(check-sat b_and!19369 (not b!460560) (not b!460562) (not mapNonEmpty!20245) (not start!41176) (not b!460577) (not b_lambda!9907) (not b!460564) (not b!460558) (not b!460575) (not b!460576) (not b!460567) (not b!460559) (not b_next!11059) (not b!460572) tp_is_empty!12397 (not b!460563) (not b!460565))
(check-sat b_and!19369 (not b_next!11059))
(get-model)

(declare-fun b_lambda!9913 () Bool)

(assert (= b_lambda!9907 (or (and start!41176 b_free!11059) b_lambda!9913)))

(check-sat (not b!460560) (not b!460562) (not mapNonEmpty!20245) (not start!41176) (not b!460577) (not b!460564) (not b!460558) (not b!460575) (not b!460576) (not b!460567) (not b!460559) (not b_next!11059) (not b_lambda!9913) b_and!19369 (not b!460572) tp_is_empty!12397 (not b!460563) (not b!460565))
(check-sat b_and!19369 (not b_next!11059))
(get-model)

(declare-fun d!74837 () Bool)

(declare-fun e!268743 () Bool)

(assert (=> d!74837 e!268743))

(declare-fun res!275520 () Bool)

(assert (=> d!74837 (=> (not res!275520) (not e!268743))))

(declare-fun lt!208760 () ListLongMap!7079)

(declare-fun contains!2489 (ListLongMap!7079 (_ BitVec 64)) Bool)

(assert (=> d!74837 (= res!275520 (contains!2489 lt!208760 (_1!4093 lt!208649)))))

(declare-fun lt!208759 () List!8228)

(assert (=> d!74837 (= lt!208760 (ListLongMap!7080 lt!208759))))

(declare-fun lt!208757 () Unit!13399)

(declare-fun lt!208758 () Unit!13399)

(assert (=> d!74837 (= lt!208757 lt!208758)))

(declare-datatypes ((Option!381 0))(
  ( (Some!380 (v!8528 V!17635)) (None!379) )
))
(declare-fun getValueByKey!375 (List!8228 (_ BitVec 64)) Option!381)

(assert (=> d!74837 (= (getValueByKey!375 lt!208759 (_1!4093 lt!208649)) (Some!380 (_2!4093 lt!208649)))))

(declare-fun lemmaContainsTupThenGetReturnValue!197 (List!8228 (_ BitVec 64) V!17635) Unit!13399)

(assert (=> d!74837 (= lt!208758 (lemmaContainsTupThenGetReturnValue!197 lt!208759 (_1!4093 lt!208649) (_2!4093 lt!208649)))))

(declare-fun insertStrictlySorted!200 (List!8228 (_ BitVec 64) V!17635) List!8228)

(assert (=> d!74837 (= lt!208759 (insertStrictlySorted!200 (toList!3555 lt!208645) (_1!4093 lt!208649) (_2!4093 lt!208649)))))

(assert (=> d!74837 (= (+!1630 lt!208645 lt!208649) lt!208760)))

(declare-fun b!460708 () Bool)

(declare-fun res!275519 () Bool)

(assert (=> b!460708 (=> (not res!275519) (not e!268743))))

(assert (=> b!460708 (= res!275519 (= (getValueByKey!375 (toList!3555 lt!208760) (_1!4093 lt!208649)) (Some!380 (_2!4093 lt!208649))))))

(declare-fun b!460709 () Bool)

(declare-fun contains!2490 (List!8228 tuple2!8164) Bool)

(assert (=> b!460709 (= e!268743 (contains!2490 (toList!3555 lt!208760) lt!208649))))

(assert (= (and d!74837 res!275520) b!460708))

(assert (= (and b!460708 res!275519) b!460709))

(declare-fun m!444161 () Bool)

(assert (=> d!74837 m!444161))

(declare-fun m!444163 () Bool)

(assert (=> d!74837 m!444163))

(declare-fun m!444165 () Bool)

(assert (=> d!74837 m!444165))

(declare-fun m!444167 () Bool)

(assert (=> d!74837 m!444167))

(declare-fun m!444169 () Bool)

(assert (=> b!460708 m!444169))

(declare-fun m!444171 () Bool)

(assert (=> b!460709 m!444171))

(assert (=> b!460564 d!74837))

(declare-fun d!74839 () Bool)

(declare-fun c!56519 () Bool)

(assert (=> d!74839 (= c!56519 ((_ is ValueCellFull!5855) (select (arr!13735 _values!549) from!863)))))

(declare-fun e!268746 () V!17635)

(assert (=> d!74839 (= (get!6785 (select (arr!13735 _values!549) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!268746)))

(declare-fun b!460714 () Bool)

(declare-fun get!6788 (ValueCell!5855 V!17635) V!17635)

(assert (=> b!460714 (= e!268746 (get!6788 (select (arr!13735 _values!549) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460715 () Bool)

(declare-fun get!6789 (ValueCell!5855 V!17635) V!17635)

(assert (=> b!460715 (= e!268746 (get!6789 (select (arr!13735 _values!549) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74839 c!56519) b!460714))

(assert (= (and d!74839 (not c!56519)) b!460715))

(assert (=> b!460714 m!444007))

(assert (=> b!460714 m!444005))

(declare-fun m!444173 () Bool)

(assert (=> b!460714 m!444173))

(assert (=> b!460715 m!444007))

(assert (=> b!460715 m!444005))

(declare-fun m!444175 () Bool)

(assert (=> b!460715 m!444175))

(assert (=> b!460564 d!74839))

(declare-fun d!74841 () Bool)

(assert (=> d!74841 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!460565 d!74841))

(declare-fun d!74843 () Bool)

(assert (=> d!74843 (= (array_inv!10014 _values!549) (bvsge (size!14087 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41176 d!74843))

(declare-fun d!74845 () Bool)

(assert (=> d!74845 (= (array_inv!10015 _keys!709) (bvsge (size!14086 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41176 d!74845))

(declare-fun d!74847 () Bool)

(declare-fun e!268747 () Bool)

(assert (=> d!74847 e!268747))

(declare-fun res!275522 () Bool)

(assert (=> d!74847 (=> (not res!275522) (not e!268747))))

(declare-fun lt!208764 () ListLongMap!7079)

(assert (=> d!74847 (= res!275522 (contains!2489 lt!208764 (_1!4093 lt!208652)))))

(declare-fun lt!208763 () List!8228)

(assert (=> d!74847 (= lt!208764 (ListLongMap!7080 lt!208763))))

(declare-fun lt!208761 () Unit!13399)

(declare-fun lt!208762 () Unit!13399)

(assert (=> d!74847 (= lt!208761 lt!208762)))

(assert (=> d!74847 (= (getValueByKey!375 lt!208763 (_1!4093 lt!208652)) (Some!380 (_2!4093 lt!208652)))))

(assert (=> d!74847 (= lt!208762 (lemmaContainsTupThenGetReturnValue!197 lt!208763 (_1!4093 lt!208652) (_2!4093 lt!208652)))))

(assert (=> d!74847 (= lt!208763 (insertStrictlySorted!200 (toList!3555 lt!208647) (_1!4093 lt!208652) (_2!4093 lt!208652)))))

(assert (=> d!74847 (= (+!1630 lt!208647 lt!208652) lt!208764)))

(declare-fun b!460716 () Bool)

(declare-fun res!275521 () Bool)

(assert (=> b!460716 (=> (not res!275521) (not e!268747))))

(assert (=> b!460716 (= res!275521 (= (getValueByKey!375 (toList!3555 lt!208764) (_1!4093 lt!208652)) (Some!380 (_2!4093 lt!208652))))))

(declare-fun b!460717 () Bool)

(assert (=> b!460717 (= e!268747 (contains!2490 (toList!3555 lt!208764) lt!208652))))

(assert (= (and d!74847 res!275522) b!460716))

(assert (= (and b!460716 res!275521) b!460717))

(declare-fun m!444177 () Bool)

(assert (=> d!74847 m!444177))

(declare-fun m!444179 () Bool)

(assert (=> d!74847 m!444179))

(declare-fun m!444181 () Bool)

(assert (=> d!74847 m!444181))

(declare-fun m!444183 () Bool)

(assert (=> d!74847 m!444183))

(declare-fun m!444185 () Bool)

(assert (=> b!460716 m!444185))

(declare-fun m!444187 () Bool)

(assert (=> b!460717 m!444187))

(assert (=> b!460567 d!74847))

(declare-fun d!74849 () Bool)

(declare-fun e!268748 () Bool)

(assert (=> d!74849 e!268748))

(declare-fun res!275524 () Bool)

(assert (=> d!74849 (=> (not res!275524) (not e!268748))))

(declare-fun lt!208768 () ListLongMap!7079)

(assert (=> d!74849 (= res!275524 (contains!2489 lt!208768 (_1!4093 lt!208652)))))

(declare-fun lt!208767 () List!8228)

(assert (=> d!74849 (= lt!208768 (ListLongMap!7080 lt!208767))))

(declare-fun lt!208765 () Unit!13399)

(declare-fun lt!208766 () Unit!13399)

(assert (=> d!74849 (= lt!208765 lt!208766)))

(assert (=> d!74849 (= (getValueByKey!375 lt!208767 (_1!4093 lt!208652)) (Some!380 (_2!4093 lt!208652)))))

(assert (=> d!74849 (= lt!208766 (lemmaContainsTupThenGetReturnValue!197 lt!208767 (_1!4093 lt!208652) (_2!4093 lt!208652)))))

(assert (=> d!74849 (= lt!208767 (insertStrictlySorted!200 (toList!3555 (+!1630 lt!208648 lt!208649)) (_1!4093 lt!208652) (_2!4093 lt!208652)))))

(assert (=> d!74849 (= (+!1630 (+!1630 lt!208648 lt!208649) lt!208652) lt!208768)))

(declare-fun b!460718 () Bool)

(declare-fun res!275523 () Bool)

(assert (=> b!460718 (=> (not res!275523) (not e!268748))))

(assert (=> b!460718 (= res!275523 (= (getValueByKey!375 (toList!3555 lt!208768) (_1!4093 lt!208652)) (Some!380 (_2!4093 lt!208652))))))

(declare-fun b!460719 () Bool)

(assert (=> b!460719 (= e!268748 (contains!2490 (toList!3555 lt!208768) lt!208652))))

(assert (= (and d!74849 res!275524) b!460718))

(assert (= (and b!460718 res!275523) b!460719))

(declare-fun m!444189 () Bool)

(assert (=> d!74849 m!444189))

(declare-fun m!444191 () Bool)

(assert (=> d!74849 m!444191))

(declare-fun m!444193 () Bool)

(assert (=> d!74849 m!444193))

(declare-fun m!444195 () Bool)

(assert (=> d!74849 m!444195))

(declare-fun m!444197 () Bool)

(assert (=> b!460718 m!444197))

(declare-fun m!444199 () Bool)

(assert (=> b!460719 m!444199))

(assert (=> b!460567 d!74849))

(declare-fun d!74851 () Bool)

(declare-fun e!268749 () Bool)

(assert (=> d!74851 e!268749))

(declare-fun res!275526 () Bool)

(assert (=> d!74851 (=> (not res!275526) (not e!268749))))

(declare-fun lt!208772 () ListLongMap!7079)

(assert (=> d!74851 (= res!275526 (contains!2489 lt!208772 (_1!4093 lt!208649)))))

(declare-fun lt!208771 () List!8228)

(assert (=> d!74851 (= lt!208772 (ListLongMap!7080 lt!208771))))

(declare-fun lt!208769 () Unit!13399)

(declare-fun lt!208770 () Unit!13399)

(assert (=> d!74851 (= lt!208769 lt!208770)))

(assert (=> d!74851 (= (getValueByKey!375 lt!208771 (_1!4093 lt!208649)) (Some!380 (_2!4093 lt!208649)))))

(assert (=> d!74851 (= lt!208770 (lemmaContainsTupThenGetReturnValue!197 lt!208771 (_1!4093 lt!208649) (_2!4093 lt!208649)))))

(assert (=> d!74851 (= lt!208771 (insertStrictlySorted!200 (toList!3555 lt!208648) (_1!4093 lt!208649) (_2!4093 lt!208649)))))

(assert (=> d!74851 (= (+!1630 lt!208648 lt!208649) lt!208772)))

(declare-fun b!460720 () Bool)

(declare-fun res!275525 () Bool)

(assert (=> b!460720 (=> (not res!275525) (not e!268749))))

(assert (=> b!460720 (= res!275525 (= (getValueByKey!375 (toList!3555 lt!208772) (_1!4093 lt!208649)) (Some!380 (_2!4093 lt!208649))))))

(declare-fun b!460721 () Bool)

(assert (=> b!460721 (= e!268749 (contains!2490 (toList!3555 lt!208772) lt!208649))))

(assert (= (and d!74851 res!275526) b!460720))

(assert (= (and b!460720 res!275525) b!460721))

(declare-fun m!444201 () Bool)

(assert (=> d!74851 m!444201))

(declare-fun m!444203 () Bool)

(assert (=> d!74851 m!444203))

(declare-fun m!444205 () Bool)

(assert (=> d!74851 m!444205))

(declare-fun m!444207 () Bool)

(assert (=> d!74851 m!444207))

(declare-fun m!444209 () Bool)

(assert (=> b!460720 m!444209))

(declare-fun m!444211 () Bool)

(assert (=> b!460721 m!444211))

(assert (=> b!460567 d!74851))

(declare-fun d!74853 () Bool)

(assert (=> d!74853 (= (+!1630 (+!1630 lt!208648 (tuple2!8165 k0!794 v!412)) (tuple2!8165 (select (arr!13734 _keys!709) from!863) lt!208644)) (+!1630 (+!1630 lt!208648 (tuple2!8165 (select (arr!13734 _keys!709) from!863) lt!208644)) (tuple2!8165 k0!794 v!412)))))

(declare-fun lt!208775 () Unit!13399)

(declare-fun choose!1341 (ListLongMap!7079 (_ BitVec 64) V!17635 (_ BitVec 64) V!17635) Unit!13399)

(assert (=> d!74853 (= lt!208775 (choose!1341 lt!208648 k0!794 v!412 (select (arr!13734 _keys!709) from!863) lt!208644))))

(assert (=> d!74853 (not (= k0!794 (select (arr!13734 _keys!709) from!863)))))

(assert (=> d!74853 (= (addCommutativeForDiffKeys!427 lt!208648 k0!794 v!412 (select (arr!13734 _keys!709) from!863) lt!208644) lt!208775)))

(declare-fun bs!14561 () Bool)

(assert (= bs!14561 d!74853))

(declare-fun m!444213 () Bool)

(assert (=> bs!14561 m!444213))

(assert (=> bs!14561 m!443989))

(declare-fun m!444215 () Bool)

(assert (=> bs!14561 m!444215))

(declare-fun m!444217 () Bool)

(assert (=> bs!14561 m!444217))

(declare-fun m!444219 () Bool)

(assert (=> bs!14561 m!444219))

(assert (=> bs!14561 m!444213))

(declare-fun m!444221 () Bool)

(assert (=> bs!14561 m!444221))

(assert (=> bs!14561 m!444217))

(assert (=> b!460567 d!74853))

(declare-fun d!74855 () Bool)

(declare-fun res!275533 () Bool)

(declare-fun e!268761 () Bool)

(assert (=> d!74855 (=> res!275533 e!268761)))

(assert (=> d!74855 (= res!275533 (bvsge #b00000000000000000000000000000000 (size!14086 lt!208654)))))

(assert (=> d!74855 (= (arrayNoDuplicates!0 lt!208654 #b00000000000000000000000000000000 Nil!8226) e!268761)))

(declare-fun b!460732 () Bool)

(declare-fun e!268759 () Bool)

(declare-fun contains!2491 (List!8229 (_ BitVec 64)) Bool)

(assert (=> b!460732 (= e!268759 (contains!2491 Nil!8226 (select (arr!13734 lt!208654) #b00000000000000000000000000000000)))))

(declare-fun b!460733 () Bool)

(declare-fun e!268758 () Bool)

(declare-fun call!30140 () Bool)

(assert (=> b!460733 (= e!268758 call!30140)))

(declare-fun b!460734 () Bool)

(declare-fun e!268760 () Bool)

(assert (=> b!460734 (= e!268760 e!268758)))

(declare-fun c!56522 () Bool)

(assert (=> b!460734 (= c!56522 (validKeyInArray!0 (select (arr!13734 lt!208654) #b00000000000000000000000000000000)))))

(declare-fun b!460735 () Bool)

(assert (=> b!460735 (= e!268761 e!268760)))

(declare-fun res!275535 () Bool)

(assert (=> b!460735 (=> (not res!275535) (not e!268760))))

(assert (=> b!460735 (= res!275535 (not e!268759))))

(declare-fun res!275534 () Bool)

(assert (=> b!460735 (=> (not res!275534) (not e!268759))))

(assert (=> b!460735 (= res!275534 (validKeyInArray!0 (select (arr!13734 lt!208654) #b00000000000000000000000000000000)))))

(declare-fun b!460736 () Bool)

(assert (=> b!460736 (= e!268758 call!30140)))

(declare-fun bm!30137 () Bool)

(assert (=> bm!30137 (= call!30140 (arrayNoDuplicates!0 lt!208654 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56522 (Cons!8225 (select (arr!13734 lt!208654) #b00000000000000000000000000000000) Nil!8226) Nil!8226)))))

(assert (= (and d!74855 (not res!275533)) b!460735))

(assert (= (and b!460735 res!275534) b!460732))

(assert (= (and b!460735 res!275535) b!460734))

(assert (= (and b!460734 c!56522) b!460736))

(assert (= (and b!460734 (not c!56522)) b!460733))

(assert (= (or b!460736 b!460733) bm!30137))

(declare-fun m!444223 () Bool)

(assert (=> b!460732 m!444223))

(assert (=> b!460732 m!444223))

(declare-fun m!444225 () Bool)

(assert (=> b!460732 m!444225))

(assert (=> b!460734 m!444223))

(assert (=> b!460734 m!444223))

(declare-fun m!444227 () Bool)

(assert (=> b!460734 m!444227))

(assert (=> b!460735 m!444223))

(assert (=> b!460735 m!444223))

(assert (=> b!460735 m!444227))

(assert (=> bm!30137 m!444223))

(declare-fun m!444229 () Bool)

(assert (=> bm!30137 m!444229))

(assert (=> b!460575 d!74855))

(declare-fun d!74857 () Bool)

(declare-fun res!275540 () Bool)

(declare-fun e!268766 () Bool)

(assert (=> d!74857 (=> res!275540 e!268766)))

(assert (=> d!74857 (= res!275540 (= (select (arr!13734 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74857 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!268766)))

(declare-fun b!460741 () Bool)

(declare-fun e!268767 () Bool)

(assert (=> b!460741 (= e!268766 e!268767)))

(declare-fun res!275541 () Bool)

(assert (=> b!460741 (=> (not res!275541) (not e!268767))))

(assert (=> b!460741 (= res!275541 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14086 _keys!709)))))

(declare-fun b!460742 () Bool)

(assert (=> b!460742 (= e!268767 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74857 (not res!275540)) b!460741))

(assert (= (and b!460741 res!275541) b!460742))

(declare-fun m!444231 () Bool)

(assert (=> d!74857 m!444231))

(declare-fun m!444233 () Bool)

(assert (=> b!460742 m!444233))

(assert (=> b!460577 d!74857))

(declare-fun d!74859 () Bool)

(assert (=> d!74859 (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))

(declare-fun lt!208778 () Unit!13399)

(declare-fun choose!114 (array!28588 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13399)

(assert (=> d!74859 (= lt!208778 (choose!114 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> d!74859 (bvsge from!863 #b00000000000000000000000000000000)))

(assert (=> d!74859 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000) lt!208778)))

(declare-fun bs!14562 () Bool)

(assert (= bs!14562 d!74859))

(assert (=> bs!14562 m!444035))

(declare-fun m!444235 () Bool)

(assert (=> bs!14562 m!444235))

(assert (=> b!460576 d!74859))

(declare-fun b!460751 () Bool)

(declare-fun e!268774 () Bool)

(declare-fun e!268775 () Bool)

(assert (=> b!460751 (= e!268774 e!268775)))

(declare-fun lt!208785 () (_ BitVec 64))

(assert (=> b!460751 (= lt!208785 (select (arr!13734 lt!208654) #b00000000000000000000000000000000))))

(declare-fun lt!208787 () Unit!13399)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28588 (_ BitVec 64) (_ BitVec 32)) Unit!13399)

(assert (=> b!460751 (= lt!208787 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!208654 lt!208785 #b00000000000000000000000000000000))))

(assert (=> b!460751 (arrayContainsKey!0 lt!208654 lt!208785 #b00000000000000000000000000000000)))

(declare-fun lt!208786 () Unit!13399)

(assert (=> b!460751 (= lt!208786 lt!208787)))

(declare-fun res!275546 () Bool)

(declare-datatypes ((SeekEntryResult!3485 0))(
  ( (MissingZero!3485 (index!16119 (_ BitVec 32))) (Found!3485 (index!16120 (_ BitVec 32))) (Intermediate!3485 (undefined!4297 Bool) (index!16121 (_ BitVec 32)) (x!42917 (_ BitVec 32))) (Undefined!3485) (MissingVacant!3485 (index!16122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28588 (_ BitVec 32)) SeekEntryResult!3485)

(assert (=> b!460751 (= res!275546 (= (seekEntryOrOpen!0 (select (arr!13734 lt!208654) #b00000000000000000000000000000000) lt!208654 mask!1025) (Found!3485 #b00000000000000000000000000000000)))))

(assert (=> b!460751 (=> (not res!275546) (not e!268775))))

(declare-fun b!460752 () Bool)

(declare-fun call!30143 () Bool)

(assert (=> b!460752 (= e!268774 call!30143)))

(declare-fun bm!30140 () Bool)

(assert (=> bm!30140 (= call!30143 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!208654 mask!1025))))

(declare-fun b!460753 () Bool)

(assert (=> b!460753 (= e!268775 call!30143)))

(declare-fun d!74861 () Bool)

(declare-fun res!275547 () Bool)

(declare-fun e!268776 () Bool)

(assert (=> d!74861 (=> res!275547 e!268776)))

(assert (=> d!74861 (= res!275547 (bvsge #b00000000000000000000000000000000 (size!14086 lt!208654)))))

(assert (=> d!74861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208654 mask!1025) e!268776)))

(declare-fun b!460754 () Bool)

(assert (=> b!460754 (= e!268776 e!268774)))

(declare-fun c!56525 () Bool)

(assert (=> b!460754 (= c!56525 (validKeyInArray!0 (select (arr!13734 lt!208654) #b00000000000000000000000000000000)))))

(assert (= (and d!74861 (not res!275547)) b!460754))

(assert (= (and b!460754 c!56525) b!460751))

(assert (= (and b!460754 (not c!56525)) b!460752))

(assert (= (and b!460751 res!275546) b!460753))

(assert (= (or b!460753 b!460752) bm!30140))

(assert (=> b!460751 m!444223))

(declare-fun m!444237 () Bool)

(assert (=> b!460751 m!444237))

(declare-fun m!444239 () Bool)

(assert (=> b!460751 m!444239))

(assert (=> b!460751 m!444223))

(declare-fun m!444241 () Bool)

(assert (=> b!460751 m!444241))

(declare-fun m!444243 () Bool)

(assert (=> bm!30140 m!444243))

(assert (=> b!460754 m!444223))

(assert (=> b!460754 m!444223))

(assert (=> b!460754 m!444227))

(assert (=> b!460559 d!74861))

(declare-fun b!460779 () Bool)

(assert (=> b!460779 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14086 _keys!709)))))

(assert (=> b!460779 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14087 _values!549)))))

(declare-fun lt!208804 () ListLongMap!7079)

(declare-fun e!268792 () Bool)

(declare-fun apply!317 (ListLongMap!7079 (_ BitVec 64)) V!17635)

(assert (=> b!460779 (= e!268792 (= (apply!317 lt!208804 (select (arr!13734 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6785 (select (arr!13735 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460780 () Bool)

(declare-fun e!268791 () Bool)

(assert (=> b!460780 (= e!268791 (validKeyInArray!0 (select (arr!13734 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460780 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!460781 () Bool)

(declare-fun e!268797 () Bool)

(assert (=> b!460781 (= e!268797 e!268792)))

(assert (=> b!460781 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14086 _keys!709)))))

(declare-fun res!275557 () Bool)

(assert (=> b!460781 (= res!275557 (contains!2489 lt!208804 (select (arr!13734 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460781 (=> (not res!275557) (not e!268792))))

(declare-fun b!460782 () Bool)

(declare-fun res!275559 () Bool)

(declare-fun e!268794 () Bool)

(assert (=> b!460782 (=> (not res!275559) (not e!268794))))

(assert (=> b!460782 (= res!275559 (not (contains!2489 lt!208804 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460783 () Bool)

(declare-fun e!268795 () ListLongMap!7079)

(declare-fun e!268793 () ListLongMap!7079)

(assert (=> b!460783 (= e!268795 e!268793)))

(declare-fun c!56537 () Bool)

(assert (=> b!460783 (= c!56537 (validKeyInArray!0 (select (arr!13734 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!460784 () Bool)

(declare-fun e!268796 () Bool)

(declare-fun isEmpty!570 (ListLongMap!7079) Bool)

(assert (=> b!460784 (= e!268796 (isEmpty!570 lt!208804))))

(declare-fun d!74863 () Bool)

(assert (=> d!74863 e!268794))

(declare-fun res!275556 () Bool)

(assert (=> d!74863 (=> (not res!275556) (not e!268794))))

(assert (=> d!74863 (= res!275556 (not (contains!2489 lt!208804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74863 (= lt!208804 e!268795)))

(declare-fun c!56535 () Bool)

(assert (=> d!74863 (= c!56535 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14086 _keys!709)))))

(assert (=> d!74863 (validMask!0 mask!1025)))

(assert (=> d!74863 (= (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208804)))

(declare-fun b!460785 () Bool)

(declare-fun lt!208806 () Unit!13399)

(declare-fun lt!208803 () Unit!13399)

(assert (=> b!460785 (= lt!208806 lt!208803)))

(declare-fun lt!208807 () ListLongMap!7079)

(declare-fun lt!208808 () (_ BitVec 64))

(declare-fun lt!208805 () (_ BitVec 64))

(declare-fun lt!208802 () V!17635)

(assert (=> b!460785 (not (contains!2489 (+!1630 lt!208807 (tuple2!8165 lt!208808 lt!208802)) lt!208805))))

(declare-fun addStillNotContains!152 (ListLongMap!7079 (_ BitVec 64) V!17635 (_ BitVec 64)) Unit!13399)

(assert (=> b!460785 (= lt!208803 (addStillNotContains!152 lt!208807 lt!208808 lt!208802 lt!208805))))

(assert (=> b!460785 (= lt!208805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460785 (= lt!208802 (get!6785 (select (arr!13735 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460785 (= lt!208808 (select (arr!13734 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30146 () ListLongMap!7079)

(assert (=> b!460785 (= lt!208807 call!30146)))

(assert (=> b!460785 (= e!268793 (+!1630 call!30146 (tuple2!8165 (select (arr!13734 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6785 (select (arr!13735 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460786 () Bool)

(assert (=> b!460786 (= e!268797 e!268796)))

(declare-fun c!56536 () Bool)

(assert (=> b!460786 (= c!56536 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14086 _keys!709)))))

(declare-fun b!460787 () Bool)

(assert (=> b!460787 (= e!268793 call!30146)))

(declare-fun b!460788 () Bool)

(assert (=> b!460788 (= e!268794 e!268797)))

(declare-fun c!56534 () Bool)

(assert (=> b!460788 (= c!56534 e!268791)))

(declare-fun res!275558 () Bool)

(assert (=> b!460788 (=> (not res!275558) (not e!268791))))

(assert (=> b!460788 (= res!275558 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14086 _keys!709)))))

(declare-fun b!460789 () Bool)

(assert (=> b!460789 (= e!268795 (ListLongMap!7080 Nil!8225))))

(declare-fun bm!30143 () Bool)

(assert (=> bm!30143 (= call!30146 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460790 () Bool)

(assert (=> b!460790 (= e!268796 (= lt!208804 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74863 c!56535) b!460789))

(assert (= (and d!74863 (not c!56535)) b!460783))

(assert (= (and b!460783 c!56537) b!460785))

(assert (= (and b!460783 (not c!56537)) b!460787))

(assert (= (or b!460785 b!460787) bm!30143))

(assert (= (and d!74863 res!275556) b!460782))

(assert (= (and b!460782 res!275559) b!460788))

(assert (= (and b!460788 res!275558) b!460780))

(assert (= (and b!460788 c!56534) b!460781))

(assert (= (and b!460788 (not c!56534)) b!460786))

(assert (= (and b!460781 res!275557) b!460779))

(assert (= (and b!460786 c!56536) b!460790))

(assert (= (and b!460786 (not c!56536)) b!460784))

(declare-fun b_lambda!9915 () Bool)

(assert (=> (not b_lambda!9915) (not b!460779)))

(assert (=> b!460779 t!14157))

(declare-fun b_and!19379 () Bool)

(assert (= b_and!19369 (and (=> t!14157 result!7327) b_and!19379)))

(declare-fun b_lambda!9917 () Bool)

(assert (=> (not b_lambda!9917) (not b!460785)))

(assert (=> b!460785 t!14157))

(declare-fun b_and!19381 () Bool)

(assert (= b_and!19379 (and (=> t!14157 result!7327) b_and!19381)))

(declare-fun m!444245 () Bool)

(assert (=> b!460782 m!444245))

(declare-fun m!444247 () Bool)

(assert (=> b!460790 m!444247))

(declare-fun m!444249 () Bool)

(assert (=> b!460779 m!444249))

(assert (=> b!460779 m!444005))

(declare-fun m!444251 () Bool)

(assert (=> b!460779 m!444251))

(assert (=> b!460779 m!444005))

(declare-fun m!444253 () Bool)

(assert (=> b!460779 m!444253))

(declare-fun m!444255 () Bool)

(assert (=> b!460779 m!444255))

(assert (=> b!460779 m!444253))

(assert (=> b!460779 m!444249))

(declare-fun m!444257 () Bool)

(assert (=> d!74863 m!444257))

(assert (=> d!74863 m!443985))

(assert (=> bm!30143 m!444247))

(declare-fun m!444259 () Bool)

(assert (=> b!460784 m!444259))

(assert (=> b!460783 m!444253))

(assert (=> b!460783 m!444253))

(declare-fun m!444261 () Bool)

(assert (=> b!460783 m!444261))

(assert (=> b!460780 m!444253))

(assert (=> b!460780 m!444253))

(assert (=> b!460780 m!444261))

(assert (=> b!460781 m!444253))

(assert (=> b!460781 m!444253))

(declare-fun m!444263 () Bool)

(assert (=> b!460781 m!444263))

(declare-fun m!444265 () Bool)

(assert (=> b!460785 m!444265))

(declare-fun m!444267 () Bool)

(assert (=> b!460785 m!444267))

(assert (=> b!460785 m!444249))

(assert (=> b!460785 m!444005))

(assert (=> b!460785 m!444251))

(assert (=> b!460785 m!444005))

(assert (=> b!460785 m!444253))

(assert (=> b!460785 m!444249))

(declare-fun m!444269 () Bool)

(assert (=> b!460785 m!444269))

(assert (=> b!460785 m!444269))

(declare-fun m!444271 () Bool)

(assert (=> b!460785 m!444271))

(assert (=> b!460558 d!74863))

(declare-fun b!460791 () Bool)

(assert (=> b!460791 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14086 lt!208654)))))

(assert (=> b!460791 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14087 lt!208646)))))

(declare-fun e!268799 () Bool)

(declare-fun lt!208811 () ListLongMap!7079)

(assert (=> b!460791 (= e!268799 (= (apply!317 lt!208811 (select (arr!13734 lt!208654) (bvadd #b00000000000000000000000000000001 from!863))) (get!6785 (select (arr!13735 lt!208646) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460792 () Bool)

(declare-fun e!268798 () Bool)

(assert (=> b!460792 (= e!268798 (validKeyInArray!0 (select (arr!13734 lt!208654) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460792 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!460793 () Bool)

(declare-fun e!268804 () Bool)

(assert (=> b!460793 (= e!268804 e!268799)))

(assert (=> b!460793 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14086 lt!208654)))))

(declare-fun res!275561 () Bool)

(assert (=> b!460793 (= res!275561 (contains!2489 lt!208811 (select (arr!13734 lt!208654) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460793 (=> (not res!275561) (not e!268799))))

(declare-fun b!460794 () Bool)

(declare-fun res!275563 () Bool)

(declare-fun e!268801 () Bool)

(assert (=> b!460794 (=> (not res!275563) (not e!268801))))

(assert (=> b!460794 (= res!275563 (not (contains!2489 lt!208811 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460795 () Bool)

(declare-fun e!268802 () ListLongMap!7079)

(declare-fun e!268800 () ListLongMap!7079)

(assert (=> b!460795 (= e!268802 e!268800)))

(declare-fun c!56541 () Bool)

(assert (=> b!460795 (= c!56541 (validKeyInArray!0 (select (arr!13734 lt!208654) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!460796 () Bool)

(declare-fun e!268803 () Bool)

(assert (=> b!460796 (= e!268803 (isEmpty!570 lt!208811))))

(declare-fun d!74865 () Bool)

(assert (=> d!74865 e!268801))

(declare-fun res!275560 () Bool)

(assert (=> d!74865 (=> (not res!275560) (not e!268801))))

(assert (=> d!74865 (= res!275560 (not (contains!2489 lt!208811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74865 (= lt!208811 e!268802)))

(declare-fun c!56539 () Bool)

(assert (=> d!74865 (= c!56539 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14086 lt!208654)))))

(assert (=> d!74865 (validMask!0 mask!1025)))

(assert (=> d!74865 (= (getCurrentListMapNoExtraKeys!1782 lt!208654 lt!208646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208811)))

(declare-fun b!460797 () Bool)

(declare-fun lt!208813 () Unit!13399)

(declare-fun lt!208810 () Unit!13399)

(assert (=> b!460797 (= lt!208813 lt!208810)))

(declare-fun lt!208809 () V!17635)

(declare-fun lt!208812 () (_ BitVec 64))

(declare-fun lt!208814 () ListLongMap!7079)

(declare-fun lt!208815 () (_ BitVec 64))

(assert (=> b!460797 (not (contains!2489 (+!1630 lt!208814 (tuple2!8165 lt!208815 lt!208809)) lt!208812))))

(assert (=> b!460797 (= lt!208810 (addStillNotContains!152 lt!208814 lt!208815 lt!208809 lt!208812))))

(assert (=> b!460797 (= lt!208812 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460797 (= lt!208809 (get!6785 (select (arr!13735 lt!208646) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460797 (= lt!208815 (select (arr!13734 lt!208654) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30147 () ListLongMap!7079)

(assert (=> b!460797 (= lt!208814 call!30147)))

(assert (=> b!460797 (= e!268800 (+!1630 call!30147 (tuple2!8165 (select (arr!13734 lt!208654) (bvadd #b00000000000000000000000000000001 from!863)) (get!6785 (select (arr!13735 lt!208646) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460798 () Bool)

(assert (=> b!460798 (= e!268804 e!268803)))

(declare-fun c!56540 () Bool)

(assert (=> b!460798 (= c!56540 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14086 lt!208654)))))

(declare-fun b!460799 () Bool)

(assert (=> b!460799 (= e!268800 call!30147)))

(declare-fun b!460800 () Bool)

(assert (=> b!460800 (= e!268801 e!268804)))

(declare-fun c!56538 () Bool)

(assert (=> b!460800 (= c!56538 e!268798)))

(declare-fun res!275562 () Bool)

(assert (=> b!460800 (=> (not res!275562) (not e!268798))))

(assert (=> b!460800 (= res!275562 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14086 lt!208654)))))

(declare-fun b!460801 () Bool)

(assert (=> b!460801 (= e!268802 (ListLongMap!7080 Nil!8225))))

(declare-fun bm!30144 () Bool)

(assert (=> bm!30144 (= call!30147 (getCurrentListMapNoExtraKeys!1782 lt!208654 lt!208646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460802 () Bool)

(assert (=> b!460802 (= e!268803 (= lt!208811 (getCurrentListMapNoExtraKeys!1782 lt!208654 lt!208646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74865 c!56539) b!460801))

(assert (= (and d!74865 (not c!56539)) b!460795))

(assert (= (and b!460795 c!56541) b!460797))

(assert (= (and b!460795 (not c!56541)) b!460799))

(assert (= (or b!460797 b!460799) bm!30144))

(assert (= (and d!74865 res!275560) b!460794))

(assert (= (and b!460794 res!275563) b!460800))

(assert (= (and b!460800 res!275562) b!460792))

(assert (= (and b!460800 c!56538) b!460793))

(assert (= (and b!460800 (not c!56538)) b!460798))

(assert (= (and b!460793 res!275561) b!460791))

(assert (= (and b!460798 c!56540) b!460802))

(assert (= (and b!460798 (not c!56540)) b!460796))

(declare-fun b_lambda!9919 () Bool)

(assert (=> (not b_lambda!9919) (not b!460791)))

(assert (=> b!460791 t!14157))

(declare-fun b_and!19383 () Bool)

(assert (= b_and!19381 (and (=> t!14157 result!7327) b_and!19383)))

(declare-fun b_lambda!9921 () Bool)

(assert (=> (not b_lambda!9921) (not b!460797)))

(assert (=> b!460797 t!14157))

(declare-fun b_and!19385 () Bool)

(assert (= b_and!19383 (and (=> t!14157 result!7327) b_and!19385)))

(declare-fun m!444273 () Bool)

(assert (=> b!460794 m!444273))

(declare-fun m!444275 () Bool)

(assert (=> b!460802 m!444275))

(declare-fun m!444277 () Bool)

(assert (=> b!460791 m!444277))

(assert (=> b!460791 m!444005))

(declare-fun m!444279 () Bool)

(assert (=> b!460791 m!444279))

(assert (=> b!460791 m!444005))

(declare-fun m!444281 () Bool)

(assert (=> b!460791 m!444281))

(declare-fun m!444283 () Bool)

(assert (=> b!460791 m!444283))

(assert (=> b!460791 m!444281))

(assert (=> b!460791 m!444277))

(declare-fun m!444285 () Bool)

(assert (=> d!74865 m!444285))

(assert (=> d!74865 m!443985))

(assert (=> bm!30144 m!444275))

(declare-fun m!444287 () Bool)

(assert (=> b!460796 m!444287))

(assert (=> b!460795 m!444281))

(assert (=> b!460795 m!444281))

(declare-fun m!444289 () Bool)

(assert (=> b!460795 m!444289))

(assert (=> b!460792 m!444281))

(assert (=> b!460792 m!444281))

(assert (=> b!460792 m!444289))

(assert (=> b!460793 m!444281))

(assert (=> b!460793 m!444281))

(declare-fun m!444291 () Bool)

(assert (=> b!460793 m!444291))

(declare-fun m!444293 () Bool)

(assert (=> b!460797 m!444293))

(declare-fun m!444295 () Bool)

(assert (=> b!460797 m!444295))

(assert (=> b!460797 m!444277))

(assert (=> b!460797 m!444005))

(assert (=> b!460797 m!444279))

(assert (=> b!460797 m!444005))

(assert (=> b!460797 m!444281))

(assert (=> b!460797 m!444277))

(declare-fun m!444297 () Bool)

(assert (=> b!460797 m!444297))

(assert (=> b!460797 m!444297))

(declare-fun m!444299 () Bool)

(assert (=> b!460797 m!444299))

(assert (=> b!460558 d!74865))

(declare-fun d!74867 () Bool)

(assert (=> d!74867 (= (validKeyInArray!0 (select (arr!13734 _keys!709) from!863)) (and (not (= (select (arr!13734 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13734 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!460558 d!74867))

(declare-fun d!74869 () Bool)

(declare-fun e!268805 () Bool)

(assert (=> d!74869 e!268805))

(declare-fun res!275565 () Bool)

(assert (=> d!74869 (=> (not res!275565) (not e!268805))))

(declare-fun lt!208819 () ListLongMap!7079)

(assert (=> d!74869 (= res!275565 (contains!2489 lt!208819 (_1!4093 lt!208652)))))

(declare-fun lt!208818 () List!8228)

(assert (=> d!74869 (= lt!208819 (ListLongMap!7080 lt!208818))))

(declare-fun lt!208816 () Unit!13399)

(declare-fun lt!208817 () Unit!13399)

(assert (=> d!74869 (= lt!208816 lt!208817)))

(assert (=> d!74869 (= (getValueByKey!375 lt!208818 (_1!4093 lt!208652)) (Some!380 (_2!4093 lt!208652)))))

(assert (=> d!74869 (= lt!208817 (lemmaContainsTupThenGetReturnValue!197 lt!208818 (_1!4093 lt!208652) (_2!4093 lt!208652)))))

(assert (=> d!74869 (= lt!208818 (insertStrictlySorted!200 (toList!3555 lt!208648) (_1!4093 lt!208652) (_2!4093 lt!208652)))))

(assert (=> d!74869 (= (+!1630 lt!208648 lt!208652) lt!208819)))

(declare-fun b!460803 () Bool)

(declare-fun res!275564 () Bool)

(assert (=> b!460803 (=> (not res!275564) (not e!268805))))

(assert (=> b!460803 (= res!275564 (= (getValueByKey!375 (toList!3555 lt!208819) (_1!4093 lt!208652)) (Some!380 (_2!4093 lt!208652))))))

(declare-fun b!460804 () Bool)

(assert (=> b!460804 (= e!268805 (contains!2490 (toList!3555 lt!208819) lt!208652))))

(assert (= (and d!74869 res!275565) b!460803))

(assert (= (and b!460803 res!275564) b!460804))

(declare-fun m!444301 () Bool)

(assert (=> d!74869 m!444301))

(declare-fun m!444303 () Bool)

(assert (=> d!74869 m!444303))

(declare-fun m!444305 () Bool)

(assert (=> d!74869 m!444305))

(declare-fun m!444307 () Bool)

(assert (=> d!74869 m!444307))

(declare-fun m!444309 () Bool)

(assert (=> b!460803 m!444309))

(declare-fun m!444311 () Bool)

(assert (=> b!460804 m!444311))

(assert (=> b!460558 d!74869))

(declare-fun bm!30149 () Bool)

(declare-fun call!30153 () ListLongMap!7079)

(assert (=> bm!30149 (= call!30153 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!30150 () Bool)

(declare-fun call!30152 () ListLongMap!7079)

(assert (=> bm!30150 (= call!30152 (getCurrentListMapNoExtraKeys!1782 (array!28589 (store (arr!13734 _keys!709) i!563 k0!794) (size!14086 _keys!709)) (array!28591 (store (arr!13735 _values!549) i!563 (ValueCellFull!5855 v!412)) (size!14087 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460811 () Bool)

(declare-fun e!268811 () Bool)

(assert (=> b!460811 (= e!268811 (= call!30152 (+!1630 call!30153 (tuple2!8165 k0!794 v!412))))))

(declare-fun d!74871 () Bool)

(declare-fun e!268810 () Bool)

(assert (=> d!74871 e!268810))

(declare-fun res!275568 () Bool)

(assert (=> d!74871 (=> (not res!275568) (not e!268810))))

(assert (=> d!74871 (= res!275568 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14086 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14087 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14086 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14087 _values!549))))))))

(declare-fun lt!208822 () Unit!13399)

(declare-fun choose!1342 (array!28588 array!28590 (_ BitVec 32) (_ BitVec 32) V!17635 V!17635 (_ BitVec 32) (_ BitVec 64) V!17635 (_ BitVec 32) Int) Unit!13399)

(assert (=> d!74871 (= lt!208822 (choose!1342 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74871 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14086 _keys!709)))))

(assert (=> d!74871 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!784 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208822)))

(declare-fun b!460812 () Bool)

(assert (=> b!460812 (= e!268811 (= call!30152 call!30153))))

(declare-fun b!460813 () Bool)

(assert (=> b!460813 (= e!268810 e!268811)))

(declare-fun c!56544 () Bool)

(assert (=> b!460813 (= c!56544 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (= (and d!74871 res!275568) b!460813))

(assert (= (and b!460813 c!56544) b!460811))

(assert (= (and b!460813 (not c!56544)) b!460812))

(assert (= (or b!460811 b!460812) bm!30149))

(assert (= (or b!460811 b!460812) bm!30150))

(assert (=> bm!30149 m!443993))

(assert (=> bm!30150 m!444013))

(assert (=> bm!30150 m!444029))

(declare-fun m!444313 () Bool)

(assert (=> bm!30150 m!444313))

(declare-fun m!444315 () Bool)

(assert (=> b!460811 m!444315))

(declare-fun m!444317 () Bool)

(assert (=> d!74871 m!444317))

(assert (=> b!460558 d!74871))

(declare-fun d!74873 () Bool)

(declare-fun res!275569 () Bool)

(declare-fun e!268815 () Bool)

(assert (=> d!74873 (=> res!275569 e!268815)))

(assert (=> d!74873 (= res!275569 (bvsge #b00000000000000000000000000000000 (size!14086 _keys!709)))))

(assert (=> d!74873 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8226) e!268815)))

(declare-fun b!460814 () Bool)

(declare-fun e!268813 () Bool)

(assert (=> b!460814 (= e!268813 (contains!2491 Nil!8226 (select (arr!13734 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!460815 () Bool)

(declare-fun e!268812 () Bool)

(declare-fun call!30154 () Bool)

(assert (=> b!460815 (= e!268812 call!30154)))

(declare-fun b!460816 () Bool)

(declare-fun e!268814 () Bool)

(assert (=> b!460816 (= e!268814 e!268812)))

(declare-fun c!56545 () Bool)

(assert (=> b!460816 (= c!56545 (validKeyInArray!0 (select (arr!13734 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!460817 () Bool)

(assert (=> b!460817 (= e!268815 e!268814)))

(declare-fun res!275571 () Bool)

(assert (=> b!460817 (=> (not res!275571) (not e!268814))))

(assert (=> b!460817 (= res!275571 (not e!268813))))

(declare-fun res!275570 () Bool)

(assert (=> b!460817 (=> (not res!275570) (not e!268813))))

(assert (=> b!460817 (= res!275570 (validKeyInArray!0 (select (arr!13734 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!460818 () Bool)

(assert (=> b!460818 (= e!268812 call!30154)))

(declare-fun bm!30151 () Bool)

(assert (=> bm!30151 (= call!30154 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56545 (Cons!8225 (select (arr!13734 _keys!709) #b00000000000000000000000000000000) Nil!8226) Nil!8226)))))

(assert (= (and d!74873 (not res!275569)) b!460817))

(assert (= (and b!460817 res!275570) b!460814))

(assert (= (and b!460817 res!275571) b!460816))

(assert (= (and b!460816 c!56545) b!460818))

(assert (= (and b!460816 (not c!56545)) b!460815))

(assert (= (or b!460818 b!460815) bm!30151))

(assert (=> b!460814 m!444231))

(assert (=> b!460814 m!444231))

(declare-fun m!444319 () Bool)

(assert (=> b!460814 m!444319))

(assert (=> b!460816 m!444231))

(assert (=> b!460816 m!444231))

(declare-fun m!444321 () Bool)

(assert (=> b!460816 m!444321))

(assert (=> b!460817 m!444231))

(assert (=> b!460817 m!444231))

(assert (=> b!460817 m!444321))

(assert (=> bm!30151 m!444231))

(declare-fun m!444323 () Bool)

(assert (=> bm!30151 m!444323))

(assert (=> b!460560 d!74873))

(declare-fun b!460819 () Bool)

(declare-fun e!268816 () Bool)

(declare-fun e!268817 () Bool)

(assert (=> b!460819 (= e!268816 e!268817)))

(declare-fun lt!208823 () (_ BitVec 64))

(assert (=> b!460819 (= lt!208823 (select (arr!13734 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!208825 () Unit!13399)

(assert (=> b!460819 (= lt!208825 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!208823 #b00000000000000000000000000000000))))

(assert (=> b!460819 (arrayContainsKey!0 _keys!709 lt!208823 #b00000000000000000000000000000000)))

(declare-fun lt!208824 () Unit!13399)

(assert (=> b!460819 (= lt!208824 lt!208825)))

(declare-fun res!275572 () Bool)

(assert (=> b!460819 (= res!275572 (= (seekEntryOrOpen!0 (select (arr!13734 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3485 #b00000000000000000000000000000000)))))

(assert (=> b!460819 (=> (not res!275572) (not e!268817))))

(declare-fun b!460820 () Bool)

(declare-fun call!30155 () Bool)

(assert (=> b!460820 (= e!268816 call!30155)))

(declare-fun bm!30152 () Bool)

(assert (=> bm!30152 (= call!30155 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!460821 () Bool)

(assert (=> b!460821 (= e!268817 call!30155)))

(declare-fun d!74875 () Bool)

(declare-fun res!275573 () Bool)

(declare-fun e!268818 () Bool)

(assert (=> d!74875 (=> res!275573 e!268818)))

(assert (=> d!74875 (= res!275573 (bvsge #b00000000000000000000000000000000 (size!14086 _keys!709)))))

(assert (=> d!74875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!268818)))

(declare-fun b!460822 () Bool)

(assert (=> b!460822 (= e!268818 e!268816)))

(declare-fun c!56546 () Bool)

(assert (=> b!460822 (= c!56546 (validKeyInArray!0 (select (arr!13734 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74875 (not res!275573)) b!460822))

(assert (= (and b!460822 c!56546) b!460819))

(assert (= (and b!460822 (not c!56546)) b!460820))

(assert (= (and b!460819 res!275572) b!460821))

(assert (= (or b!460821 b!460820) bm!30152))

(assert (=> b!460819 m!444231))

(declare-fun m!444325 () Bool)

(assert (=> b!460819 m!444325))

(declare-fun m!444327 () Bool)

(assert (=> b!460819 m!444327))

(assert (=> b!460819 m!444231))

(declare-fun m!444329 () Bool)

(assert (=> b!460819 m!444329))

(declare-fun m!444331 () Bool)

(assert (=> bm!30152 m!444331))

(assert (=> b!460822 m!444231))

(assert (=> b!460822 m!444231))

(assert (=> b!460822 m!444321))

(assert (=> b!460563 d!74875))

(declare-fun d!74877 () Bool)

(assert (=> d!74877 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!460562 d!74877))

(declare-fun b!460823 () Bool)

(assert (=> b!460823 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14086 lt!208654)))))

(assert (=> b!460823 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14087 lt!208646)))))

(declare-fun lt!208828 () ListLongMap!7079)

(declare-fun e!268820 () Bool)

(assert (=> b!460823 (= e!268820 (= (apply!317 lt!208828 (select (arr!13734 lt!208654) from!863)) (get!6785 (select (arr!13735 lt!208646) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460824 () Bool)

(declare-fun e!268819 () Bool)

(assert (=> b!460824 (= e!268819 (validKeyInArray!0 (select (arr!13734 lt!208654) from!863)))))

(assert (=> b!460824 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!460825 () Bool)

(declare-fun e!268825 () Bool)

(assert (=> b!460825 (= e!268825 e!268820)))

(assert (=> b!460825 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14086 lt!208654)))))

(declare-fun res!275575 () Bool)

(assert (=> b!460825 (= res!275575 (contains!2489 lt!208828 (select (arr!13734 lt!208654) from!863)))))

(assert (=> b!460825 (=> (not res!275575) (not e!268820))))

(declare-fun b!460826 () Bool)

(declare-fun res!275577 () Bool)

(declare-fun e!268822 () Bool)

(assert (=> b!460826 (=> (not res!275577) (not e!268822))))

(assert (=> b!460826 (= res!275577 (not (contains!2489 lt!208828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460827 () Bool)

(declare-fun e!268823 () ListLongMap!7079)

(declare-fun e!268821 () ListLongMap!7079)

(assert (=> b!460827 (= e!268823 e!268821)))

(declare-fun c!56550 () Bool)

(assert (=> b!460827 (= c!56550 (validKeyInArray!0 (select (arr!13734 lt!208654) from!863)))))

(declare-fun b!460828 () Bool)

(declare-fun e!268824 () Bool)

(assert (=> b!460828 (= e!268824 (isEmpty!570 lt!208828))))

(declare-fun d!74879 () Bool)

(assert (=> d!74879 e!268822))

(declare-fun res!275574 () Bool)

(assert (=> d!74879 (=> (not res!275574) (not e!268822))))

(assert (=> d!74879 (= res!275574 (not (contains!2489 lt!208828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74879 (= lt!208828 e!268823)))

(declare-fun c!56548 () Bool)

(assert (=> d!74879 (= c!56548 (bvsge from!863 (size!14086 lt!208654)))))

(assert (=> d!74879 (validMask!0 mask!1025)))

(assert (=> d!74879 (= (getCurrentListMapNoExtraKeys!1782 lt!208654 lt!208646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!208828)))

(declare-fun b!460829 () Bool)

(declare-fun lt!208830 () Unit!13399)

(declare-fun lt!208827 () Unit!13399)

(assert (=> b!460829 (= lt!208830 lt!208827)))

(declare-fun lt!208826 () V!17635)

(declare-fun lt!208829 () (_ BitVec 64))

(declare-fun lt!208832 () (_ BitVec 64))

(declare-fun lt!208831 () ListLongMap!7079)

(assert (=> b!460829 (not (contains!2489 (+!1630 lt!208831 (tuple2!8165 lt!208832 lt!208826)) lt!208829))))

(assert (=> b!460829 (= lt!208827 (addStillNotContains!152 lt!208831 lt!208832 lt!208826 lt!208829))))

(assert (=> b!460829 (= lt!208829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460829 (= lt!208826 (get!6785 (select (arr!13735 lt!208646) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460829 (= lt!208832 (select (arr!13734 lt!208654) from!863))))

(declare-fun call!30156 () ListLongMap!7079)

(assert (=> b!460829 (= lt!208831 call!30156)))

(assert (=> b!460829 (= e!268821 (+!1630 call!30156 (tuple2!8165 (select (arr!13734 lt!208654) from!863) (get!6785 (select (arr!13735 lt!208646) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460830 () Bool)

(assert (=> b!460830 (= e!268825 e!268824)))

(declare-fun c!56549 () Bool)

(assert (=> b!460830 (= c!56549 (bvslt from!863 (size!14086 lt!208654)))))

(declare-fun b!460831 () Bool)

(assert (=> b!460831 (= e!268821 call!30156)))

(declare-fun b!460832 () Bool)

(assert (=> b!460832 (= e!268822 e!268825)))

(declare-fun c!56547 () Bool)

(assert (=> b!460832 (= c!56547 e!268819)))

(declare-fun res!275576 () Bool)

(assert (=> b!460832 (=> (not res!275576) (not e!268819))))

(assert (=> b!460832 (= res!275576 (bvslt from!863 (size!14086 lt!208654)))))

(declare-fun b!460833 () Bool)

(assert (=> b!460833 (= e!268823 (ListLongMap!7080 Nil!8225))))

(declare-fun bm!30153 () Bool)

(assert (=> bm!30153 (= call!30156 (getCurrentListMapNoExtraKeys!1782 lt!208654 lt!208646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460834 () Bool)

(assert (=> b!460834 (= e!268824 (= lt!208828 (getCurrentListMapNoExtraKeys!1782 lt!208654 lt!208646 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74879 c!56548) b!460833))

(assert (= (and d!74879 (not c!56548)) b!460827))

(assert (= (and b!460827 c!56550) b!460829))

(assert (= (and b!460827 (not c!56550)) b!460831))

(assert (= (or b!460829 b!460831) bm!30153))

(assert (= (and d!74879 res!275574) b!460826))

(assert (= (and b!460826 res!275577) b!460832))

(assert (= (and b!460832 res!275576) b!460824))

(assert (= (and b!460832 c!56547) b!460825))

(assert (= (and b!460832 (not c!56547)) b!460830))

(assert (= (and b!460825 res!275575) b!460823))

(assert (= (and b!460830 c!56549) b!460834))

(assert (= (and b!460830 (not c!56549)) b!460828))

(declare-fun b_lambda!9923 () Bool)

(assert (=> (not b_lambda!9923) (not b!460823)))

(assert (=> b!460823 t!14157))

(declare-fun b_and!19387 () Bool)

(assert (= b_and!19385 (and (=> t!14157 result!7327) b_and!19387)))

(declare-fun b_lambda!9925 () Bool)

(assert (=> (not b_lambda!9925) (not b!460829)))

(assert (=> b!460829 t!14157))

(declare-fun b_and!19389 () Bool)

(assert (= b_and!19387 (and (=> t!14157 result!7327) b_and!19389)))

(declare-fun m!444333 () Bool)

(assert (=> b!460826 m!444333))

(declare-fun m!444335 () Bool)

(assert (=> b!460834 m!444335))

(declare-fun m!444337 () Bool)

(assert (=> b!460823 m!444337))

(assert (=> b!460823 m!444005))

(declare-fun m!444339 () Bool)

(assert (=> b!460823 m!444339))

(assert (=> b!460823 m!444005))

(declare-fun m!444341 () Bool)

(assert (=> b!460823 m!444341))

(declare-fun m!444343 () Bool)

(assert (=> b!460823 m!444343))

(assert (=> b!460823 m!444341))

(assert (=> b!460823 m!444337))

(declare-fun m!444345 () Bool)

(assert (=> d!74879 m!444345))

(assert (=> d!74879 m!443985))

(assert (=> bm!30153 m!444335))

(declare-fun m!444347 () Bool)

(assert (=> b!460828 m!444347))

(assert (=> b!460827 m!444341))

(assert (=> b!460827 m!444341))

(declare-fun m!444349 () Bool)

(assert (=> b!460827 m!444349))

(assert (=> b!460824 m!444341))

(assert (=> b!460824 m!444341))

(assert (=> b!460824 m!444349))

(assert (=> b!460825 m!444341))

(assert (=> b!460825 m!444341))

(declare-fun m!444351 () Bool)

(assert (=> b!460825 m!444351))

(declare-fun m!444353 () Bool)

(assert (=> b!460829 m!444353))

(declare-fun m!444355 () Bool)

(assert (=> b!460829 m!444355))

(assert (=> b!460829 m!444337))

(assert (=> b!460829 m!444005))

(assert (=> b!460829 m!444339))

(assert (=> b!460829 m!444005))

(assert (=> b!460829 m!444341))

(assert (=> b!460829 m!444337))

(declare-fun m!444357 () Bool)

(assert (=> b!460829 m!444357))

(assert (=> b!460829 m!444357))

(declare-fun m!444359 () Bool)

(assert (=> b!460829 m!444359))

(assert (=> b!460572 d!74879))

(declare-fun b!460835 () Bool)

(assert (=> b!460835 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14086 _keys!709)))))

(assert (=> b!460835 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14087 _values!549)))))

(declare-fun lt!208835 () ListLongMap!7079)

(declare-fun e!268827 () Bool)

(assert (=> b!460835 (= e!268827 (= (apply!317 lt!208835 (select (arr!13734 _keys!709) from!863)) (get!6785 (select (arr!13735 _values!549) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460836 () Bool)

(declare-fun e!268826 () Bool)

(assert (=> b!460836 (= e!268826 (validKeyInArray!0 (select (arr!13734 _keys!709) from!863)))))

(assert (=> b!460836 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!460837 () Bool)

(declare-fun e!268832 () Bool)

(assert (=> b!460837 (= e!268832 e!268827)))

(assert (=> b!460837 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14086 _keys!709)))))

(declare-fun res!275579 () Bool)

(assert (=> b!460837 (= res!275579 (contains!2489 lt!208835 (select (arr!13734 _keys!709) from!863)))))

(assert (=> b!460837 (=> (not res!275579) (not e!268827))))

(declare-fun b!460838 () Bool)

(declare-fun res!275581 () Bool)

(declare-fun e!268829 () Bool)

(assert (=> b!460838 (=> (not res!275581) (not e!268829))))

(assert (=> b!460838 (= res!275581 (not (contains!2489 lt!208835 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460839 () Bool)

(declare-fun e!268830 () ListLongMap!7079)

(declare-fun e!268828 () ListLongMap!7079)

(assert (=> b!460839 (= e!268830 e!268828)))

(declare-fun c!56554 () Bool)

(assert (=> b!460839 (= c!56554 (validKeyInArray!0 (select (arr!13734 _keys!709) from!863)))))

(declare-fun b!460840 () Bool)

(declare-fun e!268831 () Bool)

(assert (=> b!460840 (= e!268831 (isEmpty!570 lt!208835))))

(declare-fun d!74881 () Bool)

(assert (=> d!74881 e!268829))

(declare-fun res!275578 () Bool)

(assert (=> d!74881 (=> (not res!275578) (not e!268829))))

(assert (=> d!74881 (= res!275578 (not (contains!2489 lt!208835 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74881 (= lt!208835 e!268830)))

(declare-fun c!56552 () Bool)

(assert (=> d!74881 (= c!56552 (bvsge from!863 (size!14086 _keys!709)))))

(assert (=> d!74881 (validMask!0 mask!1025)))

(assert (=> d!74881 (= (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!208835)))

(declare-fun b!460841 () Bool)

(declare-fun lt!208837 () Unit!13399)

(declare-fun lt!208834 () Unit!13399)

(assert (=> b!460841 (= lt!208837 lt!208834)))

(declare-fun lt!208838 () ListLongMap!7079)

(declare-fun lt!208839 () (_ BitVec 64))

(declare-fun lt!208833 () V!17635)

(declare-fun lt!208836 () (_ BitVec 64))

(assert (=> b!460841 (not (contains!2489 (+!1630 lt!208838 (tuple2!8165 lt!208839 lt!208833)) lt!208836))))

(assert (=> b!460841 (= lt!208834 (addStillNotContains!152 lt!208838 lt!208839 lt!208833 lt!208836))))

(assert (=> b!460841 (= lt!208836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460841 (= lt!208833 (get!6785 (select (arr!13735 _values!549) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460841 (= lt!208839 (select (arr!13734 _keys!709) from!863))))

(declare-fun call!30157 () ListLongMap!7079)

(assert (=> b!460841 (= lt!208838 call!30157)))

(assert (=> b!460841 (= e!268828 (+!1630 call!30157 (tuple2!8165 (select (arr!13734 _keys!709) from!863) (get!6785 (select (arr!13735 _values!549) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460842 () Bool)

(assert (=> b!460842 (= e!268832 e!268831)))

(declare-fun c!56553 () Bool)

(assert (=> b!460842 (= c!56553 (bvslt from!863 (size!14086 _keys!709)))))

(declare-fun b!460843 () Bool)

(assert (=> b!460843 (= e!268828 call!30157)))

(declare-fun b!460844 () Bool)

(assert (=> b!460844 (= e!268829 e!268832)))

(declare-fun c!56551 () Bool)

(assert (=> b!460844 (= c!56551 e!268826)))

(declare-fun res!275580 () Bool)

(assert (=> b!460844 (=> (not res!275580) (not e!268826))))

(assert (=> b!460844 (= res!275580 (bvslt from!863 (size!14086 _keys!709)))))

(declare-fun b!460845 () Bool)

(assert (=> b!460845 (= e!268830 (ListLongMap!7080 Nil!8225))))

(declare-fun bm!30154 () Bool)

(assert (=> bm!30154 (= call!30157 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460846 () Bool)

(assert (=> b!460846 (= e!268831 (= lt!208835 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74881 c!56552) b!460845))

(assert (= (and d!74881 (not c!56552)) b!460839))

(assert (= (and b!460839 c!56554) b!460841))

(assert (= (and b!460839 (not c!56554)) b!460843))

(assert (= (or b!460841 b!460843) bm!30154))

(assert (= (and d!74881 res!275578) b!460838))

(assert (= (and b!460838 res!275581) b!460844))

(assert (= (and b!460844 res!275580) b!460836))

(assert (= (and b!460844 c!56551) b!460837))

(assert (= (and b!460844 (not c!56551)) b!460842))

(assert (= (and b!460837 res!275579) b!460835))

(assert (= (and b!460842 c!56553) b!460846))

(assert (= (and b!460842 (not c!56553)) b!460840))

(declare-fun b_lambda!9927 () Bool)

(assert (=> (not b_lambda!9927) (not b!460835)))

(assert (=> b!460835 t!14157))

(declare-fun b_and!19391 () Bool)

(assert (= b_and!19389 (and (=> t!14157 result!7327) b_and!19391)))

(declare-fun b_lambda!9929 () Bool)

(assert (=> (not b_lambda!9929) (not b!460841)))

(assert (=> b!460841 t!14157))

(declare-fun b_and!19393 () Bool)

(assert (= b_and!19391 (and (=> t!14157 result!7327) b_and!19393)))

(declare-fun m!444361 () Bool)

(assert (=> b!460838 m!444361))

(declare-fun m!444363 () Bool)

(assert (=> b!460846 m!444363))

(assert (=> b!460835 m!444007))

(assert (=> b!460835 m!444005))

(assert (=> b!460835 m!444009))

(assert (=> b!460835 m!444005))

(assert (=> b!460835 m!443989))

(declare-fun m!444365 () Bool)

(assert (=> b!460835 m!444365))

(assert (=> b!460835 m!443989))

(assert (=> b!460835 m!444007))

(declare-fun m!444367 () Bool)

(assert (=> d!74881 m!444367))

(assert (=> d!74881 m!443985))

(assert (=> bm!30154 m!444363))

(declare-fun m!444369 () Bool)

(assert (=> b!460840 m!444369))

(assert (=> b!460839 m!443989))

(assert (=> b!460839 m!443989))

(assert (=> b!460839 m!443997))

(assert (=> b!460836 m!443989))

(assert (=> b!460836 m!443989))

(assert (=> b!460836 m!443997))

(assert (=> b!460837 m!443989))

(assert (=> b!460837 m!443989))

(declare-fun m!444371 () Bool)

(assert (=> b!460837 m!444371))

(declare-fun m!444373 () Bool)

(assert (=> b!460841 m!444373))

(declare-fun m!444375 () Bool)

(assert (=> b!460841 m!444375))

(assert (=> b!460841 m!444007))

(assert (=> b!460841 m!444005))

(assert (=> b!460841 m!444009))

(assert (=> b!460841 m!444005))

(assert (=> b!460841 m!443989))

(assert (=> b!460841 m!444007))

(declare-fun m!444377 () Bool)

(assert (=> b!460841 m!444377))

(assert (=> b!460841 m!444377))

(declare-fun m!444379 () Bool)

(assert (=> b!460841 m!444379))

(assert (=> b!460572 d!74881))

(declare-fun condMapEmpty!20254 () Bool)

(declare-fun mapDefault!20254 () ValueCell!5855)

(assert (=> mapNonEmpty!20245 (= condMapEmpty!20254 (= mapRest!20245 ((as const (Array (_ BitVec 32) ValueCell!5855)) mapDefault!20254)))))

(declare-fun e!268838 () Bool)

(declare-fun mapRes!20254 () Bool)

(assert (=> mapNonEmpty!20245 (= tp!39013 (and e!268838 mapRes!20254))))

(declare-fun b!460853 () Bool)

(declare-fun e!268837 () Bool)

(assert (=> b!460853 (= e!268837 tp_is_empty!12397)))

(declare-fun b!460854 () Bool)

(assert (=> b!460854 (= e!268838 tp_is_empty!12397)))

(declare-fun mapIsEmpty!20254 () Bool)

(assert (=> mapIsEmpty!20254 mapRes!20254))

(declare-fun mapNonEmpty!20254 () Bool)

(declare-fun tp!39028 () Bool)

(assert (=> mapNonEmpty!20254 (= mapRes!20254 (and tp!39028 e!268837))))

(declare-fun mapRest!20254 () (Array (_ BitVec 32) ValueCell!5855))

(declare-fun mapKey!20254 () (_ BitVec 32))

(declare-fun mapValue!20254 () ValueCell!5855)

(assert (=> mapNonEmpty!20254 (= mapRest!20245 (store mapRest!20254 mapKey!20254 mapValue!20254))))

(assert (= (and mapNonEmpty!20245 condMapEmpty!20254) mapIsEmpty!20254))

(assert (= (and mapNonEmpty!20245 (not condMapEmpty!20254)) mapNonEmpty!20254))

(assert (= (and mapNonEmpty!20254 ((_ is ValueCellFull!5855) mapValue!20254)) b!460853))

(assert (= (and mapNonEmpty!20245 ((_ is ValueCellFull!5855) mapDefault!20254)) b!460854))

(declare-fun m!444381 () Bool)

(assert (=> mapNonEmpty!20254 m!444381))

(declare-fun b_lambda!9931 () Bool)

(assert (= b_lambda!9919 (or (and start!41176 b_free!11059) b_lambda!9931)))

(declare-fun b_lambda!9933 () Bool)

(assert (= b_lambda!9923 (or (and start!41176 b_free!11059) b_lambda!9933)))

(declare-fun b_lambda!9935 () Bool)

(assert (= b_lambda!9915 (or (and start!41176 b_free!11059) b_lambda!9935)))

(declare-fun b_lambda!9937 () Bool)

(assert (= b_lambda!9927 (or (and start!41176 b_free!11059) b_lambda!9937)))

(declare-fun b_lambda!9939 () Bool)

(assert (= b_lambda!9917 (or (and start!41176 b_free!11059) b_lambda!9939)))

(declare-fun b_lambda!9941 () Bool)

(assert (= b_lambda!9929 (or (and start!41176 b_free!11059) b_lambda!9941)))

(declare-fun b_lambda!9943 () Bool)

(assert (= b_lambda!9921 (or (and start!41176 b_free!11059) b_lambda!9943)))

(declare-fun b_lambda!9945 () Bool)

(assert (= b_lambda!9925 (or (and start!41176 b_free!11059) b_lambda!9945)))

(check-sat (not b!460718) (not b!460751) (not bm!30151) (not bm!30152) (not b_lambda!9939) (not b!460782) (not b!460797) (not d!74863) (not b!460840) (not b!460793) (not bm!30150) (not b!460817) (not b!460779) (not b!460720) (not b!460816) (not b_lambda!9943) (not b_next!11059) (not d!74865) (not b!460804) (not b!460790) (not b!460784) (not b!460802) (not b!460834) (not b_lambda!9913) (not b!460846) (not d!74859) (not b!460837) (not d!74847) (not b!460735) (not bm!30149) b_and!19393 (not bm!30143) (not b!460825) (not b!460791) (not b!460826) (not b!460785) (not d!74851) (not b!460709) (not bm!30153) (not bm!30144) (not b!460824) (not b!460794) (not d!74853) (not b!460780) (not b!460732) (not b!460829) (not b_lambda!9941) (not b!460835) (not b!460717) (not b!460719) (not bm!30137) (not mapNonEmpty!20254) (not d!74869) (not b!460742) (not b!460708) (not b!460841) (not b!460796) (not b!460811) (not b!460754) tp_is_empty!12397 (not d!74849) (not b!460823) (not b!460714) (not b!460795) (not d!74881) (not b_lambda!9937) (not b!460783) (not b!460819) (not b!460836) (not b_lambda!9945) (not b!460827) (not d!74879) (not b!460716) (not b!460822) (not b!460839) (not b!460792) (not b_lambda!9935) (not b!460828) (not d!74837) (not bm!30154) (not b_lambda!9933) (not bm!30140) (not b!460838) (not b!460734) (not b!460715) (not b!460814) (not d!74871) (not b_lambda!9931) (not b!460803) (not b!460721) (not b!460781))
(check-sat b_and!19393 (not b_next!11059))
