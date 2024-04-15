; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38720 () Bool)

(assert start!38720)

(declare-fun b_free!9271 () Bool)

(declare-fun b_next!9271 () Bool)

(assert (=> start!38720 (= b_free!9271 (not b_next!9271))))

(declare-fun tp!32937 () Bool)

(declare-fun b_and!16631 () Bool)

(assert (=> start!38720 (= tp!32937 b_and!16631)))

(declare-fun b!403098 () Bool)

(declare-fun e!242674 () Bool)

(declare-fun tp_is_empty!10153 () Bool)

(assert (=> b!403098 (= e!242674 tp_is_empty!10153)))

(declare-fun b!403100 () Bool)

(declare-fun res!232327 () Bool)

(declare-fun e!242673 () Bool)

(assert (=> b!403100 (=> (not res!232327) (not e!242673))))

(declare-datatypes ((array!24187 0))(
  ( (array!24188 (arr!11543 (Array (_ BitVec 32) (_ BitVec 64))) (size!11896 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24187)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14643 0))(
  ( (V!14644 (val!5121 Int)) )
))
(declare-datatypes ((ValueCell!4733 0))(
  ( (ValueCellFull!4733 (v!7362 V!14643)) (EmptyCell!4733) )
))
(declare-datatypes ((array!24189 0))(
  ( (array!24190 (arr!11544 (Array (_ BitVec 32) ValueCell!4733)) (size!11897 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24189)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!403100 (= res!232327 (and (= (size!11897 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11896 _keys!709) (size!11897 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403101 () Bool)

(declare-fun res!232329 () Bool)

(assert (=> b!403101 (=> (not res!232329) (not e!242673))))

(declare-datatypes ((List!6694 0))(
  ( (Nil!6691) (Cons!6690 (h!7546 (_ BitVec 64)) (t!11859 List!6694)) )
))
(declare-fun arrayNoDuplicates!0 (array!24187 (_ BitVec 32) List!6694) Bool)

(assert (=> b!403101 (= res!232329 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6691))))

(declare-fun b!403102 () Bool)

(declare-fun res!232321 () Bool)

(assert (=> b!403102 (=> (not res!232321) (not e!242673))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403102 (= res!232321 (validKeyInArray!0 k0!794))))

(declare-fun b!403103 () Bool)

(declare-fun e!242677 () Bool)

(declare-datatypes ((tuple2!6790 0))(
  ( (tuple2!6791 (_1!3406 (_ BitVec 64)) (_2!3406 V!14643)) )
))
(declare-datatypes ((List!6695 0))(
  ( (Nil!6692) (Cons!6691 (h!7547 tuple2!6790) (t!11860 List!6695)) )
))
(declare-datatypes ((ListLongMap!5693 0))(
  ( (ListLongMap!5694 (toList!2862 List!6695)) )
))
(declare-fun call!28452 () ListLongMap!5693)

(declare-fun call!28453 () ListLongMap!5693)

(assert (=> b!403103 (= e!242677 (= call!28452 call!28453))))

(declare-fun b!403104 () Bool)

(declare-fun res!232323 () Bool)

(assert (=> b!403104 (=> (not res!232323) (not e!242673))))

(declare-fun arrayContainsKey!0 (array!24187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403104 (= res!232323 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!232332 () Bool)

(assert (=> start!38720 (=> (not res!232332) (not e!242673))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38720 (= res!232332 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11896 _keys!709))))))

(assert (=> start!38720 e!242673))

(assert (=> start!38720 tp_is_empty!10153))

(assert (=> start!38720 tp!32937))

(assert (=> start!38720 true))

(declare-fun e!242675 () Bool)

(declare-fun array_inv!8466 (array!24189) Bool)

(assert (=> start!38720 (and (array_inv!8466 _values!549) e!242675)))

(declare-fun array_inv!8467 (array!24187) Bool)

(assert (=> start!38720 (array_inv!8467 _keys!709)))

(declare-fun b!403099 () Bool)

(declare-fun e!242679 () Bool)

(assert (=> b!403099 (= e!242673 e!242679)))

(declare-fun res!232324 () Bool)

(assert (=> b!403099 (=> (not res!232324) (not e!242679))))

(declare-fun lt!187804 () array!24187)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24187 (_ BitVec 32)) Bool)

(assert (=> b!403099 (= res!232324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187804 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403099 (= lt!187804 (array!24188 (store (arr!11543 _keys!709) i!563 k0!794) (size!11896 _keys!709)))))

(declare-fun b!403105 () Bool)

(declare-fun v!412 () V!14643)

(declare-fun +!1165 (ListLongMap!5693 tuple2!6790) ListLongMap!5693)

(assert (=> b!403105 (= e!242677 (= call!28453 (+!1165 call!28452 (tuple2!6791 k0!794 v!412))))))

(declare-fun b!403106 () Bool)

(declare-fun res!232331 () Bool)

(assert (=> b!403106 (=> (not res!232331) (not e!242679))))

(assert (=> b!403106 (= res!232331 (arrayNoDuplicates!0 lt!187804 #b00000000000000000000000000000000 Nil!6691))))

(declare-fun b!403107 () Bool)

(declare-fun e!242676 () Bool)

(assert (=> b!403107 (= e!242676 tp_is_empty!10153)))

(declare-fun b!403108 () Bool)

(declare-fun mapRes!16851 () Bool)

(assert (=> b!403108 (= e!242675 (and e!242674 mapRes!16851))))

(declare-fun condMapEmpty!16851 () Bool)

(declare-fun mapDefault!16851 () ValueCell!4733)

(assert (=> b!403108 (= condMapEmpty!16851 (= (arr!11544 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4733)) mapDefault!16851)))))

(declare-fun bm!28449 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14643)

(declare-fun minValue!515 () V!14643)

(declare-fun c!54792 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1078 (array!24187 array!24189 (_ BitVec 32) (_ BitVec 32) V!14643 V!14643 (_ BitVec 32) Int) ListLongMap!5693)

(assert (=> bm!28449 (= call!28453 (getCurrentListMapNoExtraKeys!1078 (ite c!54792 lt!187804 _keys!709) (ite c!54792 (array!24190 (store (arr!11544 _values!549) i!563 (ValueCellFull!4733 v!412)) (size!11897 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28450 () Bool)

(assert (=> bm!28450 (= call!28452 (getCurrentListMapNoExtraKeys!1078 (ite c!54792 _keys!709 lt!187804) (ite c!54792 _values!549 (array!24190 (store (arr!11544 _values!549) i!563 (ValueCellFull!4733 v!412)) (size!11897 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16851 () Bool)

(assert (=> mapIsEmpty!16851 mapRes!16851))

(declare-fun b!403109 () Bool)

(declare-fun res!232326 () Bool)

(assert (=> b!403109 (=> (not res!232326) (not e!242673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403109 (= res!232326 (validMask!0 mask!1025))))

(declare-fun b!403110 () Bool)

(assert (=> b!403110 (= e!242679 (not true))))

(assert (=> b!403110 e!242677))

(assert (=> b!403110 (= c!54792 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12172 0))(
  ( (Unit!12173) )
))
(declare-fun lt!187805 () Unit!12172)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!349 (array!24187 array!24189 (_ BitVec 32) (_ BitVec 32) V!14643 V!14643 (_ BitVec 32) (_ BitVec 64) V!14643 (_ BitVec 32) Int) Unit!12172)

(assert (=> b!403110 (= lt!187805 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!349 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403111 () Bool)

(declare-fun res!232325 () Bool)

(assert (=> b!403111 (=> (not res!232325) (not e!242673))))

(assert (=> b!403111 (= res!232325 (or (= (select (arr!11543 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11543 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403112 () Bool)

(declare-fun res!232328 () Bool)

(assert (=> b!403112 (=> (not res!232328) (not e!242679))))

(assert (=> b!403112 (= res!232328 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11896 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403113 () Bool)

(declare-fun res!232322 () Bool)

(assert (=> b!403113 (=> (not res!232322) (not e!242673))))

(assert (=> b!403113 (= res!232322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16851 () Bool)

(declare-fun tp!32936 () Bool)

(assert (=> mapNonEmpty!16851 (= mapRes!16851 (and tp!32936 e!242676))))

(declare-fun mapKey!16851 () (_ BitVec 32))

(declare-fun mapRest!16851 () (Array (_ BitVec 32) ValueCell!4733))

(declare-fun mapValue!16851 () ValueCell!4733)

(assert (=> mapNonEmpty!16851 (= (arr!11544 _values!549) (store mapRest!16851 mapKey!16851 mapValue!16851))))

(declare-fun b!403114 () Bool)

(declare-fun res!232330 () Bool)

(assert (=> b!403114 (=> (not res!232330) (not e!242673))))

(assert (=> b!403114 (= res!232330 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11896 _keys!709))))))

(assert (= (and start!38720 res!232332) b!403109))

(assert (= (and b!403109 res!232326) b!403100))

(assert (= (and b!403100 res!232327) b!403113))

(assert (= (and b!403113 res!232322) b!403101))

(assert (= (and b!403101 res!232329) b!403114))

(assert (= (and b!403114 res!232330) b!403102))

(assert (= (and b!403102 res!232321) b!403111))

(assert (= (and b!403111 res!232325) b!403104))

(assert (= (and b!403104 res!232323) b!403099))

(assert (= (and b!403099 res!232324) b!403106))

(assert (= (and b!403106 res!232331) b!403112))

(assert (= (and b!403112 res!232328) b!403110))

(assert (= (and b!403110 c!54792) b!403105))

(assert (= (and b!403110 (not c!54792)) b!403103))

(assert (= (or b!403105 b!403103) bm!28449))

(assert (= (or b!403105 b!403103) bm!28450))

(assert (= (and b!403108 condMapEmpty!16851) mapIsEmpty!16851))

(assert (= (and b!403108 (not condMapEmpty!16851)) mapNonEmpty!16851))

(get-info :version)

(assert (= (and mapNonEmpty!16851 ((_ is ValueCellFull!4733) mapValue!16851)) b!403107))

(assert (= (and b!403108 ((_ is ValueCellFull!4733) mapDefault!16851)) b!403098))

(assert (= start!38720 b!403108))

(declare-fun m!395859 () Bool)

(assert (=> b!403099 m!395859))

(declare-fun m!395861 () Bool)

(assert (=> b!403099 m!395861))

(declare-fun m!395863 () Bool)

(assert (=> start!38720 m!395863))

(declare-fun m!395865 () Bool)

(assert (=> start!38720 m!395865))

(declare-fun m!395867 () Bool)

(assert (=> b!403104 m!395867))

(declare-fun m!395869 () Bool)

(assert (=> b!403106 m!395869))

(declare-fun m!395871 () Bool)

(assert (=> b!403109 m!395871))

(declare-fun m!395873 () Bool)

(assert (=> b!403110 m!395873))

(declare-fun m!395875 () Bool)

(assert (=> b!403105 m!395875))

(declare-fun m!395877 () Bool)

(assert (=> b!403102 m!395877))

(declare-fun m!395879 () Bool)

(assert (=> b!403101 m!395879))

(declare-fun m!395881 () Bool)

(assert (=> mapNonEmpty!16851 m!395881))

(declare-fun m!395883 () Bool)

(assert (=> b!403111 m!395883))

(declare-fun m!395885 () Bool)

(assert (=> b!403113 m!395885))

(declare-fun m!395887 () Bool)

(assert (=> bm!28450 m!395887))

(declare-fun m!395889 () Bool)

(assert (=> bm!28450 m!395889))

(assert (=> bm!28449 m!395887))

(declare-fun m!395891 () Bool)

(assert (=> bm!28449 m!395891))

(check-sat (not b!403106) (not bm!28449) (not mapNonEmpty!16851) (not b!403104) (not b_next!9271) (not b!403105) b_and!16631 (not b!403113) (not bm!28450) (not start!38720) (not b!403109) (not b!403110) (not b!403101) (not b!403099) tp_is_empty!10153 (not b!403102))
(check-sat b_and!16631 (not b_next!9271))
