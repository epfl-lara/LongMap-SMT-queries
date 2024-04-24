; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41088 () Bool)

(assert start!41088)

(declare-fun b_free!10993 () Bool)

(declare-fun b_next!10993 () Bool)

(assert (=> start!41088 (= b_free!10993 (not b_next!10993))))

(declare-fun tp!38811 () Bool)

(declare-fun b_and!19219 () Bool)

(assert (=> start!41088 (= tp!38811 b_and!19219)))

(declare-fun b!458442 () Bool)

(declare-fun res!273913 () Bool)

(declare-fun e!267651 () Bool)

(assert (=> b!458442 (=> (not res!273913) (not e!267651))))

(declare-datatypes ((array!28454 0))(
  ( (array!28455 (arr!13668 (Array (_ BitVec 32) (_ BitVec 64))) (size!14020 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28454)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458442 (= res!273913 (or (= (select (arr!13668 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13668 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20143 () Bool)

(declare-fun mapRes!20143 () Bool)

(assert (=> mapIsEmpty!20143 mapRes!20143))

(declare-fun b!458443 () Bool)

(declare-fun res!273915 () Bool)

(assert (=> b!458443 (=> (not res!273915) (not e!267651))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28454 (_ BitVec 32)) Bool)

(assert (=> b!458443 (= res!273915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458444 () Bool)

(declare-fun res!273917 () Bool)

(assert (=> b!458444 (=> (not res!273917) (not e!267651))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458444 (= res!273917 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20143 () Bool)

(declare-fun tp!38812 () Bool)

(declare-fun e!267652 () Bool)

(assert (=> mapNonEmpty!20143 (= mapRes!20143 (and tp!38812 e!267652))))

(declare-datatypes ((V!17547 0))(
  ( (V!17548 (val!6210 Int)) )
))
(declare-datatypes ((ValueCell!5822 0))(
  ( (ValueCellFull!5822 (v!8485 V!17547)) (EmptyCell!5822) )
))
(declare-datatypes ((array!28456 0))(
  ( (array!28457 (arr!13669 (Array (_ BitVec 32) ValueCell!5822)) (size!14021 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28456)

(declare-fun mapKey!20143 () (_ BitVec 32))

(declare-fun mapValue!20143 () ValueCell!5822)

(declare-fun mapRest!20143 () (Array (_ BitVec 32) ValueCell!5822))

(assert (=> mapNonEmpty!20143 (= (arr!13669 _values!549) (store mapRest!20143 mapKey!20143 mapValue!20143))))

(declare-fun b!458446 () Bool)

(declare-fun e!267646 () Bool)

(declare-fun e!267648 () Bool)

(assert (=> b!458446 (= e!267646 e!267648)))

(declare-fun res!273907 () Bool)

(assert (=> b!458446 (=> (not res!273907) (not e!267648))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!458446 (= res!273907 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17547)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!207415 () array!28456)

(declare-datatypes ((tuple2!8102 0))(
  ( (tuple2!8103 (_1!4062 (_ BitVec 64)) (_2!4062 V!17547)) )
))
(declare-datatypes ((List!8174 0))(
  ( (Nil!8171) (Cons!8170 (h!9026 tuple2!8102) (t!14038 List!8174)) )
))
(declare-datatypes ((ListLongMap!7017 0))(
  ( (ListLongMap!7018 (toList!3524 List!8174)) )
))
(declare-fun lt!207414 () ListLongMap!7017)

(declare-fun zeroValue!515 () V!17547)

(declare-fun lt!207421 () array!28454)

(declare-fun getCurrentListMapNoExtraKeys!1753 (array!28454 array!28456 (_ BitVec 32) (_ BitVec 32) V!17547 V!17547 (_ BitVec 32) Int) ListLongMap!7017)

(assert (=> b!458446 (= lt!207414 (getCurrentListMapNoExtraKeys!1753 lt!207421 lt!207415 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17547)

(assert (=> b!458446 (= lt!207415 (array!28457 (store (arr!13669 _values!549) i!563 (ValueCellFull!5822 v!412)) (size!14021 _values!549)))))

(declare-fun lt!207416 () ListLongMap!7017)

(assert (=> b!458446 (= lt!207416 (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458447 () Bool)

(declare-fun e!267649 () Bool)

(declare-fun e!267645 () Bool)

(assert (=> b!458447 (= e!267649 (and e!267645 mapRes!20143))))

(declare-fun condMapEmpty!20143 () Bool)

(declare-fun mapDefault!20143 () ValueCell!5822)

(assert (=> b!458447 (= condMapEmpty!20143 (= (arr!13669 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5822)) mapDefault!20143)))))

(declare-fun b!458448 () Bool)

(declare-fun res!273919 () Bool)

(assert (=> b!458448 (=> (not res!273919) (not e!267646))))

(declare-datatypes ((List!8175 0))(
  ( (Nil!8172) (Cons!8171 (h!9027 (_ BitVec 64)) (t!14039 List!8175)) )
))
(declare-fun arrayNoDuplicates!0 (array!28454 (_ BitVec 32) List!8175) Bool)

(assert (=> b!458448 (= res!273919 (arrayNoDuplicates!0 lt!207421 #b00000000000000000000000000000000 Nil!8172))))

(declare-fun b!458449 () Bool)

(declare-fun e!267650 () Bool)

(assert (=> b!458449 (= e!267648 (not e!267650))))

(declare-fun res!273912 () Bool)

(assert (=> b!458449 (=> res!273912 e!267650)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458449 (= res!273912 (not (validKeyInArray!0 (select (arr!13668 _keys!709) from!863))))))

(declare-fun lt!207419 () ListLongMap!7017)

(declare-fun lt!207417 () ListLongMap!7017)

(assert (=> b!458449 (= lt!207419 lt!207417)))

(declare-fun lt!207420 () ListLongMap!7017)

(declare-fun +!1606 (ListLongMap!7017 tuple2!8102) ListLongMap!7017)

(assert (=> b!458449 (= lt!207417 (+!1606 lt!207420 (tuple2!8103 k0!794 v!412)))))

(assert (=> b!458449 (= lt!207419 (getCurrentListMapNoExtraKeys!1753 lt!207421 lt!207415 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458449 (= lt!207420 (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13311 0))(
  ( (Unit!13312) )
))
(declare-fun lt!207418 () Unit!13311)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!763 (array!28454 array!28456 (_ BitVec 32) (_ BitVec 32) V!17547 V!17547 (_ BitVec 32) (_ BitVec 64) V!17547 (_ BitVec 32) Int) Unit!13311)

(assert (=> b!458449 (= lt!207418 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!763 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458450 () Bool)

(declare-fun res!273911 () Bool)

(assert (=> b!458450 (=> (not res!273911) (not e!267651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458450 (= res!273911 (validMask!0 mask!1025))))

(declare-fun b!458451 () Bool)

(declare-fun res!273921 () Bool)

(assert (=> b!458451 (=> (not res!273921) (not e!267651))))

(assert (=> b!458451 (= res!273921 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8172))))

(declare-fun b!458445 () Bool)

(declare-fun res!273918 () Bool)

(assert (=> b!458445 (=> (not res!273918) (not e!267651))))

(assert (=> b!458445 (= res!273918 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14020 _keys!709))))))

(declare-fun res!273914 () Bool)

(assert (=> start!41088 (=> (not res!273914) (not e!267651))))

(assert (=> start!41088 (= res!273914 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14020 _keys!709))))))

(assert (=> start!41088 e!267651))

(declare-fun tp_is_empty!12331 () Bool)

(assert (=> start!41088 tp_is_empty!12331))

(assert (=> start!41088 tp!38811))

(assert (=> start!41088 true))

(declare-fun array_inv!9972 (array!28456) Bool)

(assert (=> start!41088 (and (array_inv!9972 _values!549) e!267649)))

(declare-fun array_inv!9973 (array!28454) Bool)

(assert (=> start!41088 (array_inv!9973 _keys!709)))

(declare-fun b!458452 () Bool)

(assert (=> b!458452 (= e!267652 tp_is_empty!12331)))

(declare-fun b!458453 () Bool)

(assert (=> b!458453 (= e!267645 tp_is_empty!12331)))

(declare-fun b!458454 () Bool)

(declare-fun e!267653 () Bool)

(assert (=> b!458454 (= e!267653 (arrayContainsKey!0 _keys!709 k0!794 from!863))))

(declare-fun b!458455 () Bool)

(declare-fun res!273916 () Bool)

(assert (=> b!458455 (=> (not res!273916) (not e!267651))))

(assert (=> b!458455 (= res!273916 (validKeyInArray!0 k0!794))))

(declare-fun b!458456 () Bool)

(declare-fun res!273908 () Bool)

(assert (=> b!458456 (=> (not res!273908) (not e!267651))))

(assert (=> b!458456 (= res!273908 (and (= (size!14021 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14020 _keys!709) (size!14021 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458457 () Bool)

(declare-fun res!273910 () Bool)

(assert (=> b!458457 (=> (not res!273910) (not e!267646))))

(assert (=> b!458457 (= res!273910 (bvsle from!863 i!563))))

(declare-fun b!458458 () Bool)

(assert (=> b!458458 (= e!267651 e!267646)))

(declare-fun res!273920 () Bool)

(assert (=> b!458458 (=> (not res!273920) (not e!267646))))

(assert (=> b!458458 (= res!273920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207421 mask!1025))))

(assert (=> b!458458 (= lt!207421 (array!28455 (store (arr!13668 _keys!709) i!563 k0!794) (size!14020 _keys!709)))))

(declare-fun b!458459 () Bool)

(assert (=> b!458459 (= e!267650 e!267653)))

(declare-fun res!273909 () Bool)

(assert (=> b!458459 (=> res!273909 e!267653)))

(assert (=> b!458459 (= res!273909 (or (not (= (select (arr!13668 _keys!709) from!863) k0!794)) (bvsge from!863 (size!14020 _keys!709)) (bvsge (size!14020 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun get!6744 (ValueCell!5822 V!17547) V!17547)

(declare-fun dynLambda!888 (Int (_ BitVec 64)) V!17547)

(assert (=> b!458459 (= lt!207414 (+!1606 lt!207417 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!41088 res!273914) b!458450))

(assert (= (and b!458450 res!273911) b!458456))

(assert (= (and b!458456 res!273908) b!458443))

(assert (= (and b!458443 res!273915) b!458451))

(assert (= (and b!458451 res!273921) b!458445))

(assert (= (and b!458445 res!273918) b!458455))

(assert (= (and b!458455 res!273916) b!458442))

(assert (= (and b!458442 res!273913) b!458444))

(assert (= (and b!458444 res!273917) b!458458))

(assert (= (and b!458458 res!273920) b!458448))

(assert (= (and b!458448 res!273919) b!458457))

(assert (= (and b!458457 res!273910) b!458446))

(assert (= (and b!458446 res!273907) b!458449))

(assert (= (and b!458449 (not res!273912)) b!458459))

(assert (= (and b!458459 (not res!273909)) b!458454))

(assert (= (and b!458447 condMapEmpty!20143) mapIsEmpty!20143))

(assert (= (and b!458447 (not condMapEmpty!20143)) mapNonEmpty!20143))

(get-info :version)

(assert (= (and mapNonEmpty!20143 ((_ is ValueCellFull!5822) mapValue!20143)) b!458452))

(assert (= (and b!458447 ((_ is ValueCellFull!5822) mapDefault!20143)) b!458453))

(assert (= start!41088 b!458447))

(declare-fun b_lambda!9807 () Bool)

(assert (=> (not b_lambda!9807) (not b!458459)))

(declare-fun t!14037 () Bool)

(declare-fun tb!3821 () Bool)

(assert (=> (and start!41088 (= defaultEntry!557 defaultEntry!557) t!14037) tb!3821))

(declare-fun result!7193 () Bool)

(assert (=> tb!3821 (= result!7193 tp_is_empty!12331)))

(assert (=> b!458459 t!14037))

(declare-fun b_and!19221 () Bool)

(assert (= b_and!19219 (and (=> t!14037 result!7193) b_and!19221)))

(declare-fun m!442017 () Bool)

(assert (=> b!458446 m!442017))

(declare-fun m!442019 () Bool)

(assert (=> b!458446 m!442019))

(declare-fun m!442021 () Bool)

(assert (=> b!458446 m!442021))

(declare-fun m!442023 () Bool)

(assert (=> b!458448 m!442023))

(declare-fun m!442025 () Bool)

(assert (=> b!458443 m!442025))

(declare-fun m!442027 () Bool)

(assert (=> b!458455 m!442027))

(declare-fun m!442029 () Bool)

(assert (=> start!41088 m!442029))

(declare-fun m!442031 () Bool)

(assert (=> start!41088 m!442031))

(declare-fun m!442033 () Bool)

(assert (=> b!458454 m!442033))

(declare-fun m!442035 () Bool)

(assert (=> b!458444 m!442035))

(declare-fun m!442037 () Bool)

(assert (=> b!458459 m!442037))

(declare-fun m!442039 () Bool)

(assert (=> b!458459 m!442039))

(declare-fun m!442041 () Bool)

(assert (=> b!458459 m!442041))

(declare-fun m!442043 () Bool)

(assert (=> b!458459 m!442043))

(assert (=> b!458459 m!442043))

(assert (=> b!458459 m!442039))

(declare-fun m!442045 () Bool)

(assert (=> b!458459 m!442045))

(declare-fun m!442047 () Bool)

(assert (=> mapNonEmpty!20143 m!442047))

(declare-fun m!442049 () Bool)

(assert (=> b!458442 m!442049))

(assert (=> b!458449 m!442037))

(declare-fun m!442051 () Bool)

(assert (=> b!458449 m!442051))

(declare-fun m!442053 () Bool)

(assert (=> b!458449 m!442053))

(declare-fun m!442055 () Bool)

(assert (=> b!458449 m!442055))

(assert (=> b!458449 m!442037))

(declare-fun m!442057 () Bool)

(assert (=> b!458449 m!442057))

(declare-fun m!442059 () Bool)

(assert (=> b!458449 m!442059))

(declare-fun m!442061 () Bool)

(assert (=> b!458458 m!442061))

(declare-fun m!442063 () Bool)

(assert (=> b!458458 m!442063))

(declare-fun m!442065 () Bool)

(assert (=> b!458451 m!442065))

(declare-fun m!442067 () Bool)

(assert (=> b!458450 m!442067))

(check-sat (not b!458446) (not b!458449) tp_is_empty!12331 (not b!458454) (not b!458448) (not b!458443) (not mapNonEmpty!20143) (not b!458450) (not b!458455) (not b!458459) (not b!458451) (not b_next!10993) (not b_lambda!9807) (not b!458444) (not start!41088) (not b!458458) b_and!19221)
(check-sat b_and!19221 (not b_next!10993))
(get-model)

(declare-fun b_lambda!9813 () Bool)

(assert (= b_lambda!9807 (or (and start!41088 b_free!10993) b_lambda!9813)))

(check-sat (not b!458446) (not b_lambda!9813) (not b!458449) tp_is_empty!12331 (not b!458454) (not b_next!10993) (not b!458448) (not b!458443) (not mapNonEmpty!20143) (not b!458450) (not b!458455) (not b!458459) (not b!458451) (not b!458444) (not start!41088) (not b!458458) b_and!19221)
(check-sat b_and!19221 (not b_next!10993))
(get-model)

(declare-fun d!74777 () Bool)

(assert (=> d!74777 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458455 d!74777))

(declare-fun d!74779 () Bool)

(declare-fun res!274016 () Bool)

(declare-fun e!267712 () Bool)

(assert (=> d!74779 (=> res!274016 e!267712)))

(assert (=> d!74779 (= res!274016 (= (select (arr!13668 _keys!709) from!863) k0!794))))

(assert (=> d!74779 (= (arrayContainsKey!0 _keys!709 k0!794 from!863) e!267712)))

(declare-fun b!458578 () Bool)

(declare-fun e!267713 () Bool)

(assert (=> b!458578 (= e!267712 e!267713)))

(declare-fun res!274017 () Bool)

(assert (=> b!458578 (=> (not res!274017) (not e!267713))))

(assert (=> b!458578 (= res!274017 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!14020 _keys!709)))))

(declare-fun b!458579 () Bool)

(assert (=> b!458579 (= e!267713 (arrayContainsKey!0 _keys!709 k0!794 (bvadd from!863 #b00000000000000000000000000000001)))))

(assert (= (and d!74779 (not res!274016)) b!458578))

(assert (= (and b!458578 res!274017) b!458579))

(assert (=> d!74779 m!442037))

(declare-fun m!442173 () Bool)

(assert (=> b!458579 m!442173))

(assert (=> b!458454 d!74779))

(declare-fun d!74781 () Bool)

(declare-fun res!274018 () Bool)

(declare-fun e!267714 () Bool)

(assert (=> d!74781 (=> res!274018 e!267714)))

(assert (=> d!74781 (= res!274018 (= (select (arr!13668 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74781 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!267714)))

(declare-fun b!458580 () Bool)

(declare-fun e!267715 () Bool)

(assert (=> b!458580 (= e!267714 e!267715)))

(declare-fun res!274019 () Bool)

(assert (=> b!458580 (=> (not res!274019) (not e!267715))))

(assert (=> b!458580 (= res!274019 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14020 _keys!709)))))

(declare-fun b!458581 () Bool)

(assert (=> b!458581 (= e!267715 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74781 (not res!274018)) b!458580))

(assert (= (and b!458580 res!274019) b!458581))

(declare-fun m!442175 () Bool)

(assert (=> d!74781 m!442175))

(declare-fun m!442177 () Bool)

(assert (=> b!458581 m!442177))

(assert (=> b!458444 d!74781))

(declare-fun bm!30117 () Bool)

(declare-fun call!30120 () Bool)

(assert (=> bm!30117 (= call!30120 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!458590 () Bool)

(declare-fun e!267722 () Bool)

(declare-fun e!267724 () Bool)

(assert (=> b!458590 (= e!267722 e!267724)))

(declare-fun c!56391 () Bool)

(assert (=> b!458590 (= c!56391 (validKeyInArray!0 (select (arr!13668 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74783 () Bool)

(declare-fun res!274025 () Bool)

(assert (=> d!74783 (=> res!274025 e!267722)))

(assert (=> d!74783 (= res!274025 (bvsge #b00000000000000000000000000000000 (size!14020 _keys!709)))))

(assert (=> d!74783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!267722)))

(declare-fun b!458591 () Bool)

(declare-fun e!267723 () Bool)

(assert (=> b!458591 (= e!267724 e!267723)))

(declare-fun lt!207478 () (_ BitVec 64))

(assert (=> b!458591 (= lt!207478 (select (arr!13668 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!207477 () Unit!13311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28454 (_ BitVec 64) (_ BitVec 32)) Unit!13311)

(assert (=> b!458591 (= lt!207477 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!207478 #b00000000000000000000000000000000))))

(assert (=> b!458591 (arrayContainsKey!0 _keys!709 lt!207478 #b00000000000000000000000000000000)))

(declare-fun lt!207476 () Unit!13311)

(assert (=> b!458591 (= lt!207476 lt!207477)))

(declare-fun res!274024 () Bool)

(declare-datatypes ((SeekEntryResult!3484 0))(
  ( (MissingZero!3484 (index!16115 (_ BitVec 32))) (Found!3484 (index!16116 (_ BitVec 32))) (Intermediate!3484 (undefined!4296 Bool) (index!16117 (_ BitVec 32)) (x!42751 (_ BitVec 32))) (Undefined!3484) (MissingVacant!3484 (index!16118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28454 (_ BitVec 32)) SeekEntryResult!3484)

(assert (=> b!458591 (= res!274024 (= (seekEntryOrOpen!0 (select (arr!13668 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3484 #b00000000000000000000000000000000)))))

(assert (=> b!458591 (=> (not res!274024) (not e!267723))))

(declare-fun b!458592 () Bool)

(assert (=> b!458592 (= e!267723 call!30120)))

(declare-fun b!458593 () Bool)

(assert (=> b!458593 (= e!267724 call!30120)))

(assert (= (and d!74783 (not res!274025)) b!458590))

(assert (= (and b!458590 c!56391) b!458591))

(assert (= (and b!458590 (not c!56391)) b!458593))

(assert (= (and b!458591 res!274024) b!458592))

(assert (= (or b!458592 b!458593) bm!30117))

(declare-fun m!442179 () Bool)

(assert (=> bm!30117 m!442179))

(assert (=> b!458590 m!442175))

(assert (=> b!458590 m!442175))

(declare-fun m!442181 () Bool)

(assert (=> b!458590 m!442181))

(assert (=> b!458591 m!442175))

(declare-fun m!442183 () Bool)

(assert (=> b!458591 m!442183))

(declare-fun m!442185 () Bool)

(assert (=> b!458591 m!442185))

(assert (=> b!458591 m!442175))

(declare-fun m!442187 () Bool)

(assert (=> b!458591 m!442187))

(assert (=> b!458443 d!74783))

(declare-fun bm!30120 () Bool)

(declare-fun call!30123 () Bool)

(declare-fun c!56394 () Bool)

(assert (=> bm!30120 (= call!30123 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56394 (Cons!8171 (select (arr!13668 _keys!709) #b00000000000000000000000000000000) Nil!8172) Nil!8172)))))

(declare-fun b!458604 () Bool)

(declare-fun e!267733 () Bool)

(assert (=> b!458604 (= e!267733 call!30123)))

(declare-fun b!458605 () Bool)

(declare-fun e!267736 () Bool)

(assert (=> b!458605 (= e!267736 e!267733)))

(assert (=> b!458605 (= c!56394 (validKeyInArray!0 (select (arr!13668 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458606 () Bool)

(declare-fun e!267734 () Bool)

(assert (=> b!458606 (= e!267734 e!267736)))

(declare-fun res!274034 () Bool)

(assert (=> b!458606 (=> (not res!274034) (not e!267736))))

(declare-fun e!267735 () Bool)

(assert (=> b!458606 (= res!274034 (not e!267735))))

(declare-fun res!274032 () Bool)

(assert (=> b!458606 (=> (not res!274032) (not e!267735))))

(assert (=> b!458606 (= res!274032 (validKeyInArray!0 (select (arr!13668 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458607 () Bool)

(assert (=> b!458607 (= e!267733 call!30123)))

(declare-fun b!458608 () Bool)

(declare-fun contains!2486 (List!8175 (_ BitVec 64)) Bool)

(assert (=> b!458608 (= e!267735 (contains!2486 Nil!8172 (select (arr!13668 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74785 () Bool)

(declare-fun res!274033 () Bool)

(assert (=> d!74785 (=> res!274033 e!267734)))

(assert (=> d!74785 (= res!274033 (bvsge #b00000000000000000000000000000000 (size!14020 _keys!709)))))

(assert (=> d!74785 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8172) e!267734)))

(assert (= (and d!74785 (not res!274033)) b!458606))

(assert (= (and b!458606 res!274032) b!458608))

(assert (= (and b!458606 res!274034) b!458605))

(assert (= (and b!458605 c!56394) b!458607))

(assert (= (and b!458605 (not c!56394)) b!458604))

(assert (= (or b!458607 b!458604) bm!30120))

(assert (=> bm!30120 m!442175))

(declare-fun m!442189 () Bool)

(assert (=> bm!30120 m!442189))

(assert (=> b!458605 m!442175))

(assert (=> b!458605 m!442175))

(assert (=> b!458605 m!442181))

(assert (=> b!458606 m!442175))

(assert (=> b!458606 m!442175))

(assert (=> b!458606 m!442181))

(assert (=> b!458608 m!442175))

(assert (=> b!458608 m!442175))

(declare-fun m!442191 () Bool)

(assert (=> b!458608 m!442191))

(assert (=> b!458451 d!74785))

(declare-fun d!74787 () Bool)

(assert (=> d!74787 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!458450 d!74787))

(declare-fun b!458633 () Bool)

(declare-fun e!267755 () Bool)

(declare-fun lt!207499 () ListLongMap!7017)

(assert (=> b!458633 (= e!267755 (= lt!207499 (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458634 () Bool)

(declare-fun isEmpty!569 (ListLongMap!7017) Bool)

(assert (=> b!458634 (= e!267755 (isEmpty!569 lt!207499))))

(declare-fun b!458635 () Bool)

(declare-fun e!267754 () Bool)

(declare-fun e!267757 () Bool)

(assert (=> b!458635 (= e!267754 e!267757)))

(declare-fun c!56404 () Bool)

(declare-fun e!267753 () Bool)

(assert (=> b!458635 (= c!56404 e!267753)))

(declare-fun res!274044 () Bool)

(assert (=> b!458635 (=> (not res!274044) (not e!267753))))

(assert (=> b!458635 (= res!274044 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14020 _keys!709)))))

(declare-fun b!458636 () Bool)

(declare-fun e!267752 () ListLongMap!7017)

(assert (=> b!458636 (= e!267752 (ListLongMap!7018 Nil!8171))))

(declare-fun b!458638 () Bool)

(declare-fun e!267751 () Bool)

(assert (=> b!458638 (= e!267757 e!267751)))

(assert (=> b!458638 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14020 _keys!709)))))

(declare-fun res!274045 () Bool)

(declare-fun contains!2487 (ListLongMap!7017 (_ BitVec 64)) Bool)

(assert (=> b!458638 (= res!274045 (contains!2487 lt!207499 (select (arr!13668 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458638 (=> (not res!274045) (not e!267751))))

(declare-fun b!458639 () Bool)

(declare-fun e!267756 () ListLongMap!7017)

(declare-fun call!30126 () ListLongMap!7017)

(assert (=> b!458639 (= e!267756 call!30126)))

(declare-fun b!458640 () Bool)

(assert (=> b!458640 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14020 _keys!709)))))

(assert (=> b!458640 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14021 _values!549)))))

(declare-fun apply!316 (ListLongMap!7017 (_ BitVec 64)) V!17547)

(assert (=> b!458640 (= e!267751 (= (apply!316 lt!207499 (select (arr!13668 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6744 (select (arr!13669 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30123 () Bool)

(assert (=> bm!30123 (= call!30126 (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458641 () Bool)

(declare-fun lt!207496 () Unit!13311)

(declare-fun lt!207493 () Unit!13311)

(assert (=> b!458641 (= lt!207496 lt!207493)))

(declare-fun lt!207497 () (_ BitVec 64))

(declare-fun lt!207494 () (_ BitVec 64))

(declare-fun lt!207498 () V!17547)

(declare-fun lt!207495 () ListLongMap!7017)

(assert (=> b!458641 (not (contains!2487 (+!1606 lt!207495 (tuple2!8103 lt!207494 lt!207498)) lt!207497))))

(declare-fun addStillNotContains!151 (ListLongMap!7017 (_ BitVec 64) V!17547 (_ BitVec 64)) Unit!13311)

(assert (=> b!458641 (= lt!207493 (addStillNotContains!151 lt!207495 lt!207494 lt!207498 lt!207497))))

(assert (=> b!458641 (= lt!207497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458641 (= lt!207498 (get!6744 (select (arr!13669 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458641 (= lt!207494 (select (arr!13668 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458641 (= lt!207495 call!30126)))

(assert (=> b!458641 (= e!267756 (+!1606 call!30126 (tuple2!8103 (select (arr!13668 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6744 (select (arr!13669 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458642 () Bool)

(declare-fun res!274043 () Bool)

(assert (=> b!458642 (=> (not res!274043) (not e!267754))))

(assert (=> b!458642 (= res!274043 (not (contains!2487 lt!207499 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458643 () Bool)

(assert (=> b!458643 (= e!267752 e!267756)))

(declare-fun c!56405 () Bool)

(assert (=> b!458643 (= c!56405 (validKeyInArray!0 (select (arr!13668 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458644 () Bool)

(assert (=> b!458644 (= e!267753 (validKeyInArray!0 (select (arr!13668 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458644 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458637 () Bool)

(assert (=> b!458637 (= e!267757 e!267755)))

(declare-fun c!56403 () Bool)

(assert (=> b!458637 (= c!56403 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14020 _keys!709)))))

(declare-fun d!74789 () Bool)

(assert (=> d!74789 e!267754))

(declare-fun res!274046 () Bool)

(assert (=> d!74789 (=> (not res!274046) (not e!267754))))

(assert (=> d!74789 (= res!274046 (not (contains!2487 lt!207499 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74789 (= lt!207499 e!267752)))

(declare-fun c!56406 () Bool)

(assert (=> d!74789 (= c!56406 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14020 _keys!709)))))

(assert (=> d!74789 (validMask!0 mask!1025)))

(assert (=> d!74789 (= (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207499)))

(assert (= (and d!74789 c!56406) b!458636))

(assert (= (and d!74789 (not c!56406)) b!458643))

(assert (= (and b!458643 c!56405) b!458641))

(assert (= (and b!458643 (not c!56405)) b!458639))

(assert (= (or b!458641 b!458639) bm!30123))

(assert (= (and d!74789 res!274046) b!458642))

(assert (= (and b!458642 res!274043) b!458635))

(assert (= (and b!458635 res!274044) b!458644))

(assert (= (and b!458635 c!56404) b!458638))

(assert (= (and b!458635 (not c!56404)) b!458637))

(assert (= (and b!458638 res!274045) b!458640))

(assert (= (and b!458637 c!56403) b!458633))

(assert (= (and b!458637 (not c!56403)) b!458634))

(declare-fun b_lambda!9815 () Bool)

(assert (=> (not b_lambda!9815) (not b!458640)))

(assert (=> b!458640 t!14037))

(declare-fun b_and!19231 () Bool)

(assert (= b_and!19221 (and (=> t!14037 result!7193) b_and!19231)))

(declare-fun b_lambda!9817 () Bool)

(assert (=> (not b_lambda!9817) (not b!458641)))

(assert (=> b!458641 t!14037))

(declare-fun b_and!19233 () Bool)

(assert (= b_and!19231 (and (=> t!14037 result!7193) b_and!19233)))

(declare-fun m!442193 () Bool)

(assert (=> b!458634 m!442193))

(declare-fun m!442195 () Bool)

(assert (=> d!74789 m!442195))

(assert (=> d!74789 m!442067))

(declare-fun m!442197 () Bool)

(assert (=> b!458638 m!442197))

(assert (=> b!458638 m!442197))

(declare-fun m!442199 () Bool)

(assert (=> b!458638 m!442199))

(assert (=> b!458644 m!442197))

(assert (=> b!458644 m!442197))

(declare-fun m!442201 () Bool)

(assert (=> b!458644 m!442201))

(declare-fun m!442203 () Bool)

(assert (=> b!458640 m!442203))

(assert (=> b!458640 m!442197))

(assert (=> b!458640 m!442203))

(assert (=> b!458640 m!442039))

(declare-fun m!442205 () Bool)

(assert (=> b!458640 m!442205))

(assert (=> b!458640 m!442039))

(assert (=> b!458640 m!442197))

(declare-fun m!442207 () Bool)

(assert (=> b!458640 m!442207))

(declare-fun m!442209 () Bool)

(assert (=> b!458633 m!442209))

(assert (=> b!458643 m!442197))

(assert (=> b!458643 m!442197))

(assert (=> b!458643 m!442201))

(declare-fun m!442211 () Bool)

(assert (=> b!458642 m!442211))

(assert (=> bm!30123 m!442209))

(assert (=> b!458641 m!442203))

(assert (=> b!458641 m!442197))

(assert (=> b!458641 m!442203))

(assert (=> b!458641 m!442039))

(assert (=> b!458641 m!442205))

(declare-fun m!442213 () Bool)

(assert (=> b!458641 m!442213))

(declare-fun m!442215 () Bool)

(assert (=> b!458641 m!442215))

(declare-fun m!442217 () Bool)

(assert (=> b!458641 m!442217))

(declare-fun m!442219 () Bool)

(assert (=> b!458641 m!442219))

(assert (=> b!458641 m!442213))

(assert (=> b!458641 m!442039))

(assert (=> b!458449 d!74789))

(declare-fun d!74791 () Bool)

(declare-fun e!267760 () Bool)

(assert (=> d!74791 e!267760))

(declare-fun res!274051 () Bool)

(assert (=> d!74791 (=> (not res!274051) (not e!267760))))

(declare-fun lt!207509 () ListLongMap!7017)

(assert (=> d!74791 (= res!274051 (contains!2487 lt!207509 (_1!4062 (tuple2!8103 k0!794 v!412))))))

(declare-fun lt!207510 () List!8174)

(assert (=> d!74791 (= lt!207509 (ListLongMap!7018 lt!207510))))

(declare-fun lt!207511 () Unit!13311)

(declare-fun lt!207508 () Unit!13311)

(assert (=> d!74791 (= lt!207511 lt!207508)))

(declare-datatypes ((Option!380 0))(
  ( (Some!379 (v!8491 V!17547)) (None!378) )
))
(declare-fun getValueByKey!374 (List!8174 (_ BitVec 64)) Option!380)

(assert (=> d!74791 (= (getValueByKey!374 lt!207510 (_1!4062 (tuple2!8103 k0!794 v!412))) (Some!379 (_2!4062 (tuple2!8103 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!196 (List!8174 (_ BitVec 64) V!17547) Unit!13311)

(assert (=> d!74791 (= lt!207508 (lemmaContainsTupThenGetReturnValue!196 lt!207510 (_1!4062 (tuple2!8103 k0!794 v!412)) (_2!4062 (tuple2!8103 k0!794 v!412))))))

(declare-fun insertStrictlySorted!199 (List!8174 (_ BitVec 64) V!17547) List!8174)

(assert (=> d!74791 (= lt!207510 (insertStrictlySorted!199 (toList!3524 lt!207420) (_1!4062 (tuple2!8103 k0!794 v!412)) (_2!4062 (tuple2!8103 k0!794 v!412))))))

(assert (=> d!74791 (= (+!1606 lt!207420 (tuple2!8103 k0!794 v!412)) lt!207509)))

(declare-fun b!458649 () Bool)

(declare-fun res!274052 () Bool)

(assert (=> b!458649 (=> (not res!274052) (not e!267760))))

(assert (=> b!458649 (= res!274052 (= (getValueByKey!374 (toList!3524 lt!207509) (_1!4062 (tuple2!8103 k0!794 v!412))) (Some!379 (_2!4062 (tuple2!8103 k0!794 v!412)))))))

(declare-fun b!458650 () Bool)

(declare-fun contains!2488 (List!8174 tuple2!8102) Bool)

(assert (=> b!458650 (= e!267760 (contains!2488 (toList!3524 lt!207509) (tuple2!8103 k0!794 v!412)))))

(assert (= (and d!74791 res!274051) b!458649))

(assert (= (and b!458649 res!274052) b!458650))

(declare-fun m!442221 () Bool)

(assert (=> d!74791 m!442221))

(declare-fun m!442223 () Bool)

(assert (=> d!74791 m!442223))

(declare-fun m!442225 () Bool)

(assert (=> d!74791 m!442225))

(declare-fun m!442227 () Bool)

(assert (=> d!74791 m!442227))

(declare-fun m!442229 () Bool)

(assert (=> b!458649 m!442229))

(declare-fun m!442231 () Bool)

(assert (=> b!458650 m!442231))

(assert (=> b!458449 d!74791))

(declare-fun lt!207518 () ListLongMap!7017)

(declare-fun e!267765 () Bool)

(declare-fun b!458651 () Bool)

(assert (=> b!458651 (= e!267765 (= lt!207518 (getCurrentListMapNoExtraKeys!1753 lt!207421 lt!207415 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458652 () Bool)

(assert (=> b!458652 (= e!267765 (isEmpty!569 lt!207518))))

(declare-fun b!458653 () Bool)

(declare-fun e!267764 () Bool)

(declare-fun e!267767 () Bool)

(assert (=> b!458653 (= e!267764 e!267767)))

(declare-fun c!56408 () Bool)

(declare-fun e!267763 () Bool)

(assert (=> b!458653 (= c!56408 e!267763)))

(declare-fun res!274054 () Bool)

(assert (=> b!458653 (=> (not res!274054) (not e!267763))))

(assert (=> b!458653 (= res!274054 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14020 lt!207421)))))

(declare-fun b!458654 () Bool)

(declare-fun e!267762 () ListLongMap!7017)

(assert (=> b!458654 (= e!267762 (ListLongMap!7018 Nil!8171))))

(declare-fun b!458656 () Bool)

(declare-fun e!267761 () Bool)

(assert (=> b!458656 (= e!267767 e!267761)))

(assert (=> b!458656 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14020 lt!207421)))))

(declare-fun res!274055 () Bool)

(assert (=> b!458656 (= res!274055 (contains!2487 lt!207518 (select (arr!13668 lt!207421) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458656 (=> (not res!274055) (not e!267761))))

(declare-fun b!458657 () Bool)

(declare-fun e!267766 () ListLongMap!7017)

(declare-fun call!30127 () ListLongMap!7017)

(assert (=> b!458657 (= e!267766 call!30127)))

(declare-fun b!458658 () Bool)

(assert (=> b!458658 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14020 lt!207421)))))

(assert (=> b!458658 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14021 lt!207415)))))

(assert (=> b!458658 (= e!267761 (= (apply!316 lt!207518 (select (arr!13668 lt!207421) (bvadd #b00000000000000000000000000000001 from!863))) (get!6744 (select (arr!13669 lt!207415) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30124 () Bool)

(assert (=> bm!30124 (= call!30127 (getCurrentListMapNoExtraKeys!1753 lt!207421 lt!207415 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458659 () Bool)

(declare-fun lt!207515 () Unit!13311)

(declare-fun lt!207512 () Unit!13311)

(assert (=> b!458659 (= lt!207515 lt!207512)))

(declare-fun lt!207513 () (_ BitVec 64))

(declare-fun lt!207517 () V!17547)

(declare-fun lt!207514 () ListLongMap!7017)

(declare-fun lt!207516 () (_ BitVec 64))

(assert (=> b!458659 (not (contains!2487 (+!1606 lt!207514 (tuple2!8103 lt!207513 lt!207517)) lt!207516))))

(assert (=> b!458659 (= lt!207512 (addStillNotContains!151 lt!207514 lt!207513 lt!207517 lt!207516))))

(assert (=> b!458659 (= lt!207516 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458659 (= lt!207517 (get!6744 (select (arr!13669 lt!207415) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458659 (= lt!207513 (select (arr!13668 lt!207421) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458659 (= lt!207514 call!30127)))

(assert (=> b!458659 (= e!267766 (+!1606 call!30127 (tuple2!8103 (select (arr!13668 lt!207421) (bvadd #b00000000000000000000000000000001 from!863)) (get!6744 (select (arr!13669 lt!207415) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458660 () Bool)

(declare-fun res!274053 () Bool)

(assert (=> b!458660 (=> (not res!274053) (not e!267764))))

(assert (=> b!458660 (= res!274053 (not (contains!2487 lt!207518 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458661 () Bool)

(assert (=> b!458661 (= e!267762 e!267766)))

(declare-fun c!56409 () Bool)

(assert (=> b!458661 (= c!56409 (validKeyInArray!0 (select (arr!13668 lt!207421) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458662 () Bool)

(assert (=> b!458662 (= e!267763 (validKeyInArray!0 (select (arr!13668 lt!207421) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458662 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458655 () Bool)

(assert (=> b!458655 (= e!267767 e!267765)))

(declare-fun c!56407 () Bool)

(assert (=> b!458655 (= c!56407 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14020 lt!207421)))))

(declare-fun d!74793 () Bool)

(assert (=> d!74793 e!267764))

(declare-fun res!274056 () Bool)

(assert (=> d!74793 (=> (not res!274056) (not e!267764))))

(assert (=> d!74793 (= res!274056 (not (contains!2487 lt!207518 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74793 (= lt!207518 e!267762)))

(declare-fun c!56410 () Bool)

(assert (=> d!74793 (= c!56410 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14020 lt!207421)))))

(assert (=> d!74793 (validMask!0 mask!1025)))

(assert (=> d!74793 (= (getCurrentListMapNoExtraKeys!1753 lt!207421 lt!207415 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207518)))

(assert (= (and d!74793 c!56410) b!458654))

(assert (= (and d!74793 (not c!56410)) b!458661))

(assert (= (and b!458661 c!56409) b!458659))

(assert (= (and b!458661 (not c!56409)) b!458657))

(assert (= (or b!458659 b!458657) bm!30124))

(assert (= (and d!74793 res!274056) b!458660))

(assert (= (and b!458660 res!274053) b!458653))

(assert (= (and b!458653 res!274054) b!458662))

(assert (= (and b!458653 c!56408) b!458656))

(assert (= (and b!458653 (not c!56408)) b!458655))

(assert (= (and b!458656 res!274055) b!458658))

(assert (= (and b!458655 c!56407) b!458651))

(assert (= (and b!458655 (not c!56407)) b!458652))

(declare-fun b_lambda!9819 () Bool)

(assert (=> (not b_lambda!9819) (not b!458658)))

(assert (=> b!458658 t!14037))

(declare-fun b_and!19235 () Bool)

(assert (= b_and!19233 (and (=> t!14037 result!7193) b_and!19235)))

(declare-fun b_lambda!9821 () Bool)

(assert (=> (not b_lambda!9821) (not b!458659)))

(assert (=> b!458659 t!14037))

(declare-fun b_and!19237 () Bool)

(assert (= b_and!19235 (and (=> t!14037 result!7193) b_and!19237)))

(declare-fun m!442233 () Bool)

(assert (=> b!458652 m!442233))

(declare-fun m!442235 () Bool)

(assert (=> d!74793 m!442235))

(assert (=> d!74793 m!442067))

(declare-fun m!442237 () Bool)

(assert (=> b!458656 m!442237))

(assert (=> b!458656 m!442237))

(declare-fun m!442239 () Bool)

(assert (=> b!458656 m!442239))

(assert (=> b!458662 m!442237))

(assert (=> b!458662 m!442237))

(declare-fun m!442241 () Bool)

(assert (=> b!458662 m!442241))

(declare-fun m!442243 () Bool)

(assert (=> b!458658 m!442243))

(assert (=> b!458658 m!442237))

(assert (=> b!458658 m!442243))

(assert (=> b!458658 m!442039))

(declare-fun m!442245 () Bool)

(assert (=> b!458658 m!442245))

(assert (=> b!458658 m!442039))

(assert (=> b!458658 m!442237))

(declare-fun m!442247 () Bool)

(assert (=> b!458658 m!442247))

(declare-fun m!442249 () Bool)

(assert (=> b!458651 m!442249))

(assert (=> b!458661 m!442237))

(assert (=> b!458661 m!442237))

(assert (=> b!458661 m!442241))

(declare-fun m!442251 () Bool)

(assert (=> b!458660 m!442251))

(assert (=> bm!30124 m!442249))

(assert (=> b!458659 m!442243))

(assert (=> b!458659 m!442237))

(assert (=> b!458659 m!442243))

(assert (=> b!458659 m!442039))

(assert (=> b!458659 m!442245))

(declare-fun m!442253 () Bool)

(assert (=> b!458659 m!442253))

(declare-fun m!442255 () Bool)

(assert (=> b!458659 m!442255))

(declare-fun m!442257 () Bool)

(assert (=> b!458659 m!442257))

(declare-fun m!442259 () Bool)

(assert (=> b!458659 m!442259))

(assert (=> b!458659 m!442253))

(assert (=> b!458659 m!442039))

(assert (=> b!458449 d!74793))

(declare-fun d!74795 () Bool)

(assert (=> d!74795 (= (validKeyInArray!0 (select (arr!13668 _keys!709) from!863)) (and (not (= (select (arr!13668 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13668 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458449 d!74795))

(declare-fun call!30132 () ListLongMap!7017)

(declare-fun call!30133 () ListLongMap!7017)

(declare-fun b!458669 () Bool)

(declare-fun e!267772 () Bool)

(assert (=> b!458669 (= e!267772 (= call!30132 (+!1606 call!30133 (tuple2!8103 k0!794 v!412))))))

(declare-fun d!74797 () Bool)

(declare-fun e!267773 () Bool)

(assert (=> d!74797 e!267773))

(declare-fun res!274059 () Bool)

(assert (=> d!74797 (=> (not res!274059) (not e!267773))))

(assert (=> d!74797 (= res!274059 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14020 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14021 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14020 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14021 _values!549))))))))

(declare-fun lt!207521 () Unit!13311)

(declare-fun choose!1340 (array!28454 array!28456 (_ BitVec 32) (_ BitVec 32) V!17547 V!17547 (_ BitVec 32) (_ BitVec 64) V!17547 (_ BitVec 32) Int) Unit!13311)

(assert (=> d!74797 (= lt!207521 (choose!1340 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74797 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14020 _keys!709)))))

(assert (=> d!74797 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!763 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207521)))

(declare-fun bm!30129 () Bool)

(assert (=> bm!30129 (= call!30133 (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458670 () Bool)

(assert (=> b!458670 (= e!267772 (= call!30132 call!30133))))

(declare-fun bm!30130 () Bool)

(assert (=> bm!30130 (= call!30132 (getCurrentListMapNoExtraKeys!1753 (array!28455 (store (arr!13668 _keys!709) i!563 k0!794) (size!14020 _keys!709)) (array!28457 (store (arr!13669 _values!549) i!563 (ValueCellFull!5822 v!412)) (size!14021 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458671 () Bool)

(assert (=> b!458671 (= e!267773 e!267772)))

(declare-fun c!56413 () Bool)

(assert (=> b!458671 (= c!56413 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (= (and d!74797 res!274059) b!458671))

(assert (= (and b!458671 c!56413) b!458669))

(assert (= (and b!458671 (not c!56413)) b!458670))

(assert (= (or b!458669 b!458670) bm!30129))

(assert (= (or b!458669 b!458670) bm!30130))

(declare-fun m!442261 () Bool)

(assert (=> b!458669 m!442261))

(declare-fun m!442263 () Bool)

(assert (=> d!74797 m!442263))

(assert (=> bm!30129 m!442055))

(assert (=> bm!30130 m!442063))

(assert (=> bm!30130 m!442019))

(declare-fun m!442265 () Bool)

(assert (=> bm!30130 m!442265))

(assert (=> b!458449 d!74797))

(declare-fun bm!30131 () Bool)

(declare-fun call!30134 () Bool)

(declare-fun c!56414 () Bool)

(assert (=> bm!30131 (= call!30134 (arrayNoDuplicates!0 lt!207421 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56414 (Cons!8171 (select (arr!13668 lt!207421) #b00000000000000000000000000000000) Nil!8172) Nil!8172)))))

(declare-fun b!458672 () Bool)

(declare-fun e!267774 () Bool)

(assert (=> b!458672 (= e!267774 call!30134)))

(declare-fun b!458673 () Bool)

(declare-fun e!267777 () Bool)

(assert (=> b!458673 (= e!267777 e!267774)))

(assert (=> b!458673 (= c!56414 (validKeyInArray!0 (select (arr!13668 lt!207421) #b00000000000000000000000000000000)))))

(declare-fun b!458674 () Bool)

(declare-fun e!267775 () Bool)

(assert (=> b!458674 (= e!267775 e!267777)))

(declare-fun res!274062 () Bool)

(assert (=> b!458674 (=> (not res!274062) (not e!267777))))

(declare-fun e!267776 () Bool)

(assert (=> b!458674 (= res!274062 (not e!267776))))

(declare-fun res!274060 () Bool)

(assert (=> b!458674 (=> (not res!274060) (not e!267776))))

(assert (=> b!458674 (= res!274060 (validKeyInArray!0 (select (arr!13668 lt!207421) #b00000000000000000000000000000000)))))

(declare-fun b!458675 () Bool)

(assert (=> b!458675 (= e!267774 call!30134)))

(declare-fun b!458676 () Bool)

(assert (=> b!458676 (= e!267776 (contains!2486 Nil!8172 (select (arr!13668 lt!207421) #b00000000000000000000000000000000)))))

(declare-fun d!74799 () Bool)

(declare-fun res!274061 () Bool)

(assert (=> d!74799 (=> res!274061 e!267775)))

(assert (=> d!74799 (= res!274061 (bvsge #b00000000000000000000000000000000 (size!14020 lt!207421)))))

(assert (=> d!74799 (= (arrayNoDuplicates!0 lt!207421 #b00000000000000000000000000000000 Nil!8172) e!267775)))

(assert (= (and d!74799 (not res!274061)) b!458674))

(assert (= (and b!458674 res!274060) b!458676))

(assert (= (and b!458674 res!274062) b!458673))

(assert (= (and b!458673 c!56414) b!458675))

(assert (= (and b!458673 (not c!56414)) b!458672))

(assert (= (or b!458675 b!458672) bm!30131))

(declare-fun m!442267 () Bool)

(assert (=> bm!30131 m!442267))

(declare-fun m!442269 () Bool)

(assert (=> bm!30131 m!442269))

(assert (=> b!458673 m!442267))

(assert (=> b!458673 m!442267))

(declare-fun m!442271 () Bool)

(assert (=> b!458673 m!442271))

(assert (=> b!458674 m!442267))

(assert (=> b!458674 m!442267))

(assert (=> b!458674 m!442271))

(assert (=> b!458676 m!442267))

(assert (=> b!458676 m!442267))

(declare-fun m!442273 () Bool)

(assert (=> b!458676 m!442273))

(assert (=> b!458448 d!74799))

(declare-fun d!74801 () Bool)

(declare-fun e!267778 () Bool)

(assert (=> d!74801 e!267778))

(declare-fun res!274063 () Bool)

(assert (=> d!74801 (=> (not res!274063) (not e!267778))))

(declare-fun lt!207523 () ListLongMap!7017)

(assert (=> d!74801 (= res!274063 (contains!2487 lt!207523 (_1!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207524 () List!8174)

(assert (=> d!74801 (= lt!207523 (ListLongMap!7018 lt!207524))))

(declare-fun lt!207525 () Unit!13311)

(declare-fun lt!207522 () Unit!13311)

(assert (=> d!74801 (= lt!207525 lt!207522)))

(assert (=> d!74801 (= (getValueByKey!374 lt!207524 (_1!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!379 (_2!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74801 (= lt!207522 (lemmaContainsTupThenGetReturnValue!196 lt!207524 (_1!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74801 (= lt!207524 (insertStrictlySorted!199 (toList!3524 lt!207417) (_1!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74801 (= (+!1606 lt!207417 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!207523)))

(declare-fun b!458677 () Bool)

(declare-fun res!274064 () Bool)

(assert (=> b!458677 (=> (not res!274064) (not e!267778))))

(assert (=> b!458677 (= res!274064 (= (getValueByKey!374 (toList!3524 lt!207523) (_1!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!379 (_2!4062 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!458678 () Bool)

(assert (=> b!458678 (= e!267778 (contains!2488 (toList!3524 lt!207523) (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74801 res!274063) b!458677))

(assert (= (and b!458677 res!274064) b!458678))

(declare-fun m!442275 () Bool)

(assert (=> d!74801 m!442275))

(declare-fun m!442277 () Bool)

(assert (=> d!74801 m!442277))

(declare-fun m!442279 () Bool)

(assert (=> d!74801 m!442279))

(declare-fun m!442281 () Bool)

(assert (=> d!74801 m!442281))

(declare-fun m!442283 () Bool)

(assert (=> b!458677 m!442283))

(declare-fun m!442285 () Bool)

(assert (=> b!458678 m!442285))

(assert (=> b!458459 d!74801))

(declare-fun d!74803 () Bool)

(declare-fun c!56417 () Bool)

(assert (=> d!74803 (= c!56417 ((_ is ValueCellFull!5822) (select (arr!13669 _values!549) from!863)))))

(declare-fun e!267781 () V!17547)

(assert (=> d!74803 (= (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!267781)))

(declare-fun b!458683 () Bool)

(declare-fun get!6745 (ValueCell!5822 V!17547) V!17547)

(assert (=> b!458683 (= e!267781 (get!6745 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458684 () Bool)

(declare-fun get!6746 (ValueCell!5822 V!17547) V!17547)

(assert (=> b!458684 (= e!267781 (get!6746 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74803 c!56417) b!458683))

(assert (= (and d!74803 (not c!56417)) b!458684))

(assert (=> b!458683 m!442043))

(assert (=> b!458683 m!442039))

(declare-fun m!442287 () Bool)

(assert (=> b!458683 m!442287))

(assert (=> b!458684 m!442043))

(assert (=> b!458684 m!442039))

(declare-fun m!442289 () Bool)

(assert (=> b!458684 m!442289))

(assert (=> b!458459 d!74803))

(declare-fun bm!30132 () Bool)

(declare-fun call!30135 () Bool)

(assert (=> bm!30132 (= call!30135 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!207421 mask!1025))))

(declare-fun b!458685 () Bool)

(declare-fun e!267782 () Bool)

(declare-fun e!267784 () Bool)

(assert (=> b!458685 (= e!267782 e!267784)))

(declare-fun c!56418 () Bool)

(assert (=> b!458685 (= c!56418 (validKeyInArray!0 (select (arr!13668 lt!207421) #b00000000000000000000000000000000)))))

(declare-fun d!74805 () Bool)

(declare-fun res!274066 () Bool)

(assert (=> d!74805 (=> res!274066 e!267782)))

(assert (=> d!74805 (= res!274066 (bvsge #b00000000000000000000000000000000 (size!14020 lt!207421)))))

(assert (=> d!74805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207421 mask!1025) e!267782)))

(declare-fun b!458686 () Bool)

(declare-fun e!267783 () Bool)

(assert (=> b!458686 (= e!267784 e!267783)))

(declare-fun lt!207528 () (_ BitVec 64))

(assert (=> b!458686 (= lt!207528 (select (arr!13668 lt!207421) #b00000000000000000000000000000000))))

(declare-fun lt!207527 () Unit!13311)

(assert (=> b!458686 (= lt!207527 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!207421 lt!207528 #b00000000000000000000000000000000))))

(assert (=> b!458686 (arrayContainsKey!0 lt!207421 lt!207528 #b00000000000000000000000000000000)))

(declare-fun lt!207526 () Unit!13311)

(assert (=> b!458686 (= lt!207526 lt!207527)))

(declare-fun res!274065 () Bool)

(assert (=> b!458686 (= res!274065 (= (seekEntryOrOpen!0 (select (arr!13668 lt!207421) #b00000000000000000000000000000000) lt!207421 mask!1025) (Found!3484 #b00000000000000000000000000000000)))))

(assert (=> b!458686 (=> (not res!274065) (not e!267783))))

(declare-fun b!458687 () Bool)

(assert (=> b!458687 (= e!267783 call!30135)))

(declare-fun b!458688 () Bool)

(assert (=> b!458688 (= e!267784 call!30135)))

(assert (= (and d!74805 (not res!274066)) b!458685))

(assert (= (and b!458685 c!56418) b!458686))

(assert (= (and b!458685 (not c!56418)) b!458688))

(assert (= (and b!458686 res!274065) b!458687))

(assert (= (or b!458687 b!458688) bm!30132))

(declare-fun m!442291 () Bool)

(assert (=> bm!30132 m!442291))

(assert (=> b!458685 m!442267))

(assert (=> b!458685 m!442267))

(assert (=> b!458685 m!442271))

(assert (=> b!458686 m!442267))

(declare-fun m!442293 () Bool)

(assert (=> b!458686 m!442293))

(declare-fun m!442295 () Bool)

(assert (=> b!458686 m!442295))

(assert (=> b!458686 m!442267))

(declare-fun m!442297 () Bool)

(assert (=> b!458686 m!442297))

(assert (=> b!458458 d!74805))

(declare-fun d!74807 () Bool)

(assert (=> d!74807 (= (array_inv!9972 _values!549) (bvsge (size!14021 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41088 d!74807))

(declare-fun d!74809 () Bool)

(assert (=> d!74809 (= (array_inv!9973 _keys!709) (bvsge (size!14020 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41088 d!74809))

(declare-fun lt!207535 () ListLongMap!7017)

(declare-fun e!267789 () Bool)

(declare-fun b!458689 () Bool)

(assert (=> b!458689 (= e!267789 (= lt!207535 (getCurrentListMapNoExtraKeys!1753 lt!207421 lt!207415 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458690 () Bool)

(assert (=> b!458690 (= e!267789 (isEmpty!569 lt!207535))))

(declare-fun b!458691 () Bool)

(declare-fun e!267788 () Bool)

(declare-fun e!267791 () Bool)

(assert (=> b!458691 (= e!267788 e!267791)))

(declare-fun c!56420 () Bool)

(declare-fun e!267787 () Bool)

(assert (=> b!458691 (= c!56420 e!267787)))

(declare-fun res!274068 () Bool)

(assert (=> b!458691 (=> (not res!274068) (not e!267787))))

(assert (=> b!458691 (= res!274068 (bvslt from!863 (size!14020 lt!207421)))))

(declare-fun b!458692 () Bool)

(declare-fun e!267786 () ListLongMap!7017)

(assert (=> b!458692 (= e!267786 (ListLongMap!7018 Nil!8171))))

(declare-fun b!458694 () Bool)

(declare-fun e!267785 () Bool)

(assert (=> b!458694 (= e!267791 e!267785)))

(assert (=> b!458694 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14020 lt!207421)))))

(declare-fun res!274069 () Bool)

(assert (=> b!458694 (= res!274069 (contains!2487 lt!207535 (select (arr!13668 lt!207421) from!863)))))

(assert (=> b!458694 (=> (not res!274069) (not e!267785))))

(declare-fun b!458695 () Bool)

(declare-fun e!267790 () ListLongMap!7017)

(declare-fun call!30136 () ListLongMap!7017)

(assert (=> b!458695 (= e!267790 call!30136)))

(declare-fun b!458696 () Bool)

(assert (=> b!458696 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14020 lt!207421)))))

(assert (=> b!458696 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14021 lt!207415)))))

(assert (=> b!458696 (= e!267785 (= (apply!316 lt!207535 (select (arr!13668 lt!207421) from!863)) (get!6744 (select (arr!13669 lt!207415) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30133 () Bool)

(assert (=> bm!30133 (= call!30136 (getCurrentListMapNoExtraKeys!1753 lt!207421 lt!207415 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458697 () Bool)

(declare-fun lt!207532 () Unit!13311)

(declare-fun lt!207529 () Unit!13311)

(assert (=> b!458697 (= lt!207532 lt!207529)))

(declare-fun lt!207533 () (_ BitVec 64))

(declare-fun lt!207530 () (_ BitVec 64))

(declare-fun lt!207531 () ListLongMap!7017)

(declare-fun lt!207534 () V!17547)

(assert (=> b!458697 (not (contains!2487 (+!1606 lt!207531 (tuple2!8103 lt!207530 lt!207534)) lt!207533))))

(assert (=> b!458697 (= lt!207529 (addStillNotContains!151 lt!207531 lt!207530 lt!207534 lt!207533))))

(assert (=> b!458697 (= lt!207533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458697 (= lt!207534 (get!6744 (select (arr!13669 lt!207415) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458697 (= lt!207530 (select (arr!13668 lt!207421) from!863))))

(assert (=> b!458697 (= lt!207531 call!30136)))

(assert (=> b!458697 (= e!267790 (+!1606 call!30136 (tuple2!8103 (select (arr!13668 lt!207421) from!863) (get!6744 (select (arr!13669 lt!207415) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458698 () Bool)

(declare-fun res!274067 () Bool)

(assert (=> b!458698 (=> (not res!274067) (not e!267788))))

(assert (=> b!458698 (= res!274067 (not (contains!2487 lt!207535 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458699 () Bool)

(assert (=> b!458699 (= e!267786 e!267790)))

(declare-fun c!56421 () Bool)

(assert (=> b!458699 (= c!56421 (validKeyInArray!0 (select (arr!13668 lt!207421) from!863)))))

(declare-fun b!458700 () Bool)

(assert (=> b!458700 (= e!267787 (validKeyInArray!0 (select (arr!13668 lt!207421) from!863)))))

(assert (=> b!458700 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458693 () Bool)

(assert (=> b!458693 (= e!267791 e!267789)))

(declare-fun c!56419 () Bool)

(assert (=> b!458693 (= c!56419 (bvslt from!863 (size!14020 lt!207421)))))

(declare-fun d!74811 () Bool)

(assert (=> d!74811 e!267788))

(declare-fun res!274070 () Bool)

(assert (=> d!74811 (=> (not res!274070) (not e!267788))))

(assert (=> d!74811 (= res!274070 (not (contains!2487 lt!207535 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74811 (= lt!207535 e!267786)))

(declare-fun c!56422 () Bool)

(assert (=> d!74811 (= c!56422 (bvsge from!863 (size!14020 lt!207421)))))

(assert (=> d!74811 (validMask!0 mask!1025)))

(assert (=> d!74811 (= (getCurrentListMapNoExtraKeys!1753 lt!207421 lt!207415 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207535)))

(assert (= (and d!74811 c!56422) b!458692))

(assert (= (and d!74811 (not c!56422)) b!458699))

(assert (= (and b!458699 c!56421) b!458697))

(assert (= (and b!458699 (not c!56421)) b!458695))

(assert (= (or b!458697 b!458695) bm!30133))

(assert (= (and d!74811 res!274070) b!458698))

(assert (= (and b!458698 res!274067) b!458691))

(assert (= (and b!458691 res!274068) b!458700))

(assert (= (and b!458691 c!56420) b!458694))

(assert (= (and b!458691 (not c!56420)) b!458693))

(assert (= (and b!458694 res!274069) b!458696))

(assert (= (and b!458693 c!56419) b!458689))

(assert (= (and b!458693 (not c!56419)) b!458690))

(declare-fun b_lambda!9823 () Bool)

(assert (=> (not b_lambda!9823) (not b!458696)))

(assert (=> b!458696 t!14037))

(declare-fun b_and!19239 () Bool)

(assert (= b_and!19237 (and (=> t!14037 result!7193) b_and!19239)))

(declare-fun b_lambda!9825 () Bool)

(assert (=> (not b_lambda!9825) (not b!458697)))

(assert (=> b!458697 t!14037))

(declare-fun b_and!19241 () Bool)

(assert (= b_and!19239 (and (=> t!14037 result!7193) b_and!19241)))

(declare-fun m!442299 () Bool)

(assert (=> b!458690 m!442299))

(declare-fun m!442301 () Bool)

(assert (=> d!74811 m!442301))

(assert (=> d!74811 m!442067))

(declare-fun m!442303 () Bool)

(assert (=> b!458694 m!442303))

(assert (=> b!458694 m!442303))

(declare-fun m!442305 () Bool)

(assert (=> b!458694 m!442305))

(assert (=> b!458700 m!442303))

(assert (=> b!458700 m!442303))

(declare-fun m!442307 () Bool)

(assert (=> b!458700 m!442307))

(declare-fun m!442309 () Bool)

(assert (=> b!458696 m!442309))

(assert (=> b!458696 m!442303))

(assert (=> b!458696 m!442309))

(assert (=> b!458696 m!442039))

(declare-fun m!442311 () Bool)

(assert (=> b!458696 m!442311))

(assert (=> b!458696 m!442039))

(assert (=> b!458696 m!442303))

(declare-fun m!442313 () Bool)

(assert (=> b!458696 m!442313))

(declare-fun m!442315 () Bool)

(assert (=> b!458689 m!442315))

(assert (=> b!458699 m!442303))

(assert (=> b!458699 m!442303))

(assert (=> b!458699 m!442307))

(declare-fun m!442317 () Bool)

(assert (=> b!458698 m!442317))

(assert (=> bm!30133 m!442315))

(assert (=> b!458697 m!442309))

(assert (=> b!458697 m!442303))

(assert (=> b!458697 m!442309))

(assert (=> b!458697 m!442039))

(assert (=> b!458697 m!442311))

(declare-fun m!442319 () Bool)

(assert (=> b!458697 m!442319))

(declare-fun m!442321 () Bool)

(assert (=> b!458697 m!442321))

(declare-fun m!442323 () Bool)

(assert (=> b!458697 m!442323))

(declare-fun m!442325 () Bool)

(assert (=> b!458697 m!442325))

(assert (=> b!458697 m!442319))

(assert (=> b!458697 m!442039))

(assert (=> b!458446 d!74811))

(declare-fun lt!207542 () ListLongMap!7017)

(declare-fun e!267796 () Bool)

(declare-fun b!458701 () Bool)

(assert (=> b!458701 (= e!267796 (= lt!207542 (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458702 () Bool)

(assert (=> b!458702 (= e!267796 (isEmpty!569 lt!207542))))

(declare-fun b!458703 () Bool)

(declare-fun e!267795 () Bool)

(declare-fun e!267798 () Bool)

(assert (=> b!458703 (= e!267795 e!267798)))

(declare-fun c!56424 () Bool)

(declare-fun e!267794 () Bool)

(assert (=> b!458703 (= c!56424 e!267794)))

(declare-fun res!274072 () Bool)

(assert (=> b!458703 (=> (not res!274072) (not e!267794))))

(assert (=> b!458703 (= res!274072 (bvslt from!863 (size!14020 _keys!709)))))

(declare-fun b!458704 () Bool)

(declare-fun e!267793 () ListLongMap!7017)

(assert (=> b!458704 (= e!267793 (ListLongMap!7018 Nil!8171))))

(declare-fun b!458706 () Bool)

(declare-fun e!267792 () Bool)

(assert (=> b!458706 (= e!267798 e!267792)))

(assert (=> b!458706 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14020 _keys!709)))))

(declare-fun res!274073 () Bool)

(assert (=> b!458706 (= res!274073 (contains!2487 lt!207542 (select (arr!13668 _keys!709) from!863)))))

(assert (=> b!458706 (=> (not res!274073) (not e!267792))))

(declare-fun b!458707 () Bool)

(declare-fun e!267797 () ListLongMap!7017)

(declare-fun call!30137 () ListLongMap!7017)

(assert (=> b!458707 (= e!267797 call!30137)))

(declare-fun b!458708 () Bool)

(assert (=> b!458708 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14020 _keys!709)))))

(assert (=> b!458708 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14021 _values!549)))))

(assert (=> b!458708 (= e!267792 (= (apply!316 lt!207542 (select (arr!13668 _keys!709) from!863)) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30134 () Bool)

(assert (=> bm!30134 (= call!30137 (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458709 () Bool)

(declare-fun lt!207539 () Unit!13311)

(declare-fun lt!207536 () Unit!13311)

(assert (=> b!458709 (= lt!207539 lt!207536)))

(declare-fun lt!207540 () (_ BitVec 64))

(declare-fun lt!207541 () V!17547)

(declare-fun lt!207537 () (_ BitVec 64))

(declare-fun lt!207538 () ListLongMap!7017)

(assert (=> b!458709 (not (contains!2487 (+!1606 lt!207538 (tuple2!8103 lt!207537 lt!207541)) lt!207540))))

(assert (=> b!458709 (= lt!207536 (addStillNotContains!151 lt!207538 lt!207537 lt!207541 lt!207540))))

(assert (=> b!458709 (= lt!207540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458709 (= lt!207541 (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458709 (= lt!207537 (select (arr!13668 _keys!709) from!863))))

(assert (=> b!458709 (= lt!207538 call!30137)))

(assert (=> b!458709 (= e!267797 (+!1606 call!30137 (tuple2!8103 (select (arr!13668 _keys!709) from!863) (get!6744 (select (arr!13669 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458710 () Bool)

(declare-fun res!274071 () Bool)

(assert (=> b!458710 (=> (not res!274071) (not e!267795))))

(assert (=> b!458710 (= res!274071 (not (contains!2487 lt!207542 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458711 () Bool)

(assert (=> b!458711 (= e!267793 e!267797)))

(declare-fun c!56425 () Bool)

(assert (=> b!458711 (= c!56425 (validKeyInArray!0 (select (arr!13668 _keys!709) from!863)))))

(declare-fun b!458712 () Bool)

(assert (=> b!458712 (= e!267794 (validKeyInArray!0 (select (arr!13668 _keys!709) from!863)))))

(assert (=> b!458712 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458705 () Bool)

(assert (=> b!458705 (= e!267798 e!267796)))

(declare-fun c!56423 () Bool)

(assert (=> b!458705 (= c!56423 (bvslt from!863 (size!14020 _keys!709)))))

(declare-fun d!74813 () Bool)

(assert (=> d!74813 e!267795))

(declare-fun res!274074 () Bool)

(assert (=> d!74813 (=> (not res!274074) (not e!267795))))

(assert (=> d!74813 (= res!274074 (not (contains!2487 lt!207542 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74813 (= lt!207542 e!267793)))

(declare-fun c!56426 () Bool)

(assert (=> d!74813 (= c!56426 (bvsge from!863 (size!14020 _keys!709)))))

(assert (=> d!74813 (validMask!0 mask!1025)))

(assert (=> d!74813 (= (getCurrentListMapNoExtraKeys!1753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207542)))

(assert (= (and d!74813 c!56426) b!458704))

(assert (= (and d!74813 (not c!56426)) b!458711))

(assert (= (and b!458711 c!56425) b!458709))

(assert (= (and b!458711 (not c!56425)) b!458707))

(assert (= (or b!458709 b!458707) bm!30134))

(assert (= (and d!74813 res!274074) b!458710))

(assert (= (and b!458710 res!274071) b!458703))

(assert (= (and b!458703 res!274072) b!458712))

(assert (= (and b!458703 c!56424) b!458706))

(assert (= (and b!458703 (not c!56424)) b!458705))

(assert (= (and b!458706 res!274073) b!458708))

(assert (= (and b!458705 c!56423) b!458701))

(assert (= (and b!458705 (not c!56423)) b!458702))

(declare-fun b_lambda!9827 () Bool)

(assert (=> (not b_lambda!9827) (not b!458708)))

(assert (=> b!458708 t!14037))

(declare-fun b_and!19243 () Bool)

(assert (= b_and!19241 (and (=> t!14037 result!7193) b_and!19243)))

(declare-fun b_lambda!9829 () Bool)

(assert (=> (not b_lambda!9829) (not b!458709)))

(assert (=> b!458709 t!14037))

(declare-fun b_and!19245 () Bool)

(assert (= b_and!19243 (and (=> t!14037 result!7193) b_and!19245)))

(declare-fun m!442327 () Bool)

(assert (=> b!458702 m!442327))

(declare-fun m!442329 () Bool)

(assert (=> d!74813 m!442329))

(assert (=> d!74813 m!442067))

(assert (=> b!458706 m!442037))

(assert (=> b!458706 m!442037))

(declare-fun m!442331 () Bool)

(assert (=> b!458706 m!442331))

(assert (=> b!458712 m!442037))

(assert (=> b!458712 m!442037))

(assert (=> b!458712 m!442057))

(assert (=> b!458708 m!442043))

(assert (=> b!458708 m!442037))

(assert (=> b!458708 m!442043))

(assert (=> b!458708 m!442039))

(assert (=> b!458708 m!442045))

(assert (=> b!458708 m!442039))

(assert (=> b!458708 m!442037))

(declare-fun m!442333 () Bool)

(assert (=> b!458708 m!442333))

(declare-fun m!442335 () Bool)

(assert (=> b!458701 m!442335))

(assert (=> b!458711 m!442037))

(assert (=> b!458711 m!442037))

(assert (=> b!458711 m!442057))

(declare-fun m!442337 () Bool)

(assert (=> b!458710 m!442337))

(assert (=> bm!30134 m!442335))

(assert (=> b!458709 m!442043))

(assert (=> b!458709 m!442037))

(assert (=> b!458709 m!442043))

(assert (=> b!458709 m!442039))

(assert (=> b!458709 m!442045))

(declare-fun m!442339 () Bool)

(assert (=> b!458709 m!442339))

(declare-fun m!442341 () Bool)

(assert (=> b!458709 m!442341))

(declare-fun m!442343 () Bool)

(assert (=> b!458709 m!442343))

(declare-fun m!442345 () Bool)

(assert (=> b!458709 m!442345))

(assert (=> b!458709 m!442339))

(assert (=> b!458709 m!442039))

(assert (=> b!458446 d!74813))

(declare-fun mapIsEmpty!20152 () Bool)

(declare-fun mapRes!20152 () Bool)

(assert (=> mapIsEmpty!20152 mapRes!20152))

(declare-fun mapNonEmpty!20152 () Bool)

(declare-fun tp!38827 () Bool)

(declare-fun e!267803 () Bool)

(assert (=> mapNonEmpty!20152 (= mapRes!20152 (and tp!38827 e!267803))))

(declare-fun mapRest!20152 () (Array (_ BitVec 32) ValueCell!5822))

(declare-fun mapValue!20152 () ValueCell!5822)

(declare-fun mapKey!20152 () (_ BitVec 32))

(assert (=> mapNonEmpty!20152 (= mapRest!20143 (store mapRest!20152 mapKey!20152 mapValue!20152))))

(declare-fun b!458719 () Bool)

(assert (=> b!458719 (= e!267803 tp_is_empty!12331)))

(declare-fun b!458720 () Bool)

(declare-fun e!267804 () Bool)

(assert (=> b!458720 (= e!267804 tp_is_empty!12331)))

(declare-fun condMapEmpty!20152 () Bool)

(declare-fun mapDefault!20152 () ValueCell!5822)

(assert (=> mapNonEmpty!20143 (= condMapEmpty!20152 (= mapRest!20143 ((as const (Array (_ BitVec 32) ValueCell!5822)) mapDefault!20152)))))

(assert (=> mapNonEmpty!20143 (= tp!38812 (and e!267804 mapRes!20152))))

(assert (= (and mapNonEmpty!20143 condMapEmpty!20152) mapIsEmpty!20152))

(assert (= (and mapNonEmpty!20143 (not condMapEmpty!20152)) mapNonEmpty!20152))

(assert (= (and mapNonEmpty!20152 ((_ is ValueCellFull!5822) mapValue!20152)) b!458719))

(assert (= (and mapNonEmpty!20143 ((_ is ValueCellFull!5822) mapDefault!20152)) b!458720))

(declare-fun m!442347 () Bool)

(assert (=> mapNonEmpty!20152 m!442347))

(declare-fun b_lambda!9831 () Bool)

(assert (= b_lambda!9827 (or (and start!41088 b_free!10993) b_lambda!9831)))

(declare-fun b_lambda!9833 () Bool)

(assert (= b_lambda!9821 (or (and start!41088 b_free!10993) b_lambda!9833)))

(declare-fun b_lambda!9835 () Bool)

(assert (= b_lambda!9825 (or (and start!41088 b_free!10993) b_lambda!9835)))

(declare-fun b_lambda!9837 () Bool)

(assert (= b_lambda!9815 (or (and start!41088 b_free!10993) b_lambda!9837)))

(declare-fun b_lambda!9839 () Bool)

(assert (= b_lambda!9819 (or (and start!41088 b_free!10993) b_lambda!9839)))

(declare-fun b_lambda!9841 () Bool)

(assert (= b_lambda!9817 (or (and start!41088 b_free!10993) b_lambda!9841)))

(declare-fun b_lambda!9843 () Bool)

(assert (= b_lambda!9829 (or (and start!41088 b_free!10993) b_lambda!9843)))

(declare-fun b_lambda!9845 () Bool)

(assert (= b_lambda!9823 (or (and start!41088 b_free!10993) b_lambda!9845)))

(check-sat (not b!458669) (not b_lambda!9837) (not b!458660) (not b!458649) (not b!458605) (not b!458678) (not b_lambda!9833) (not b!458686) (not b!458606) (not b!458696) (not b!458658) (not b!458641) (not b!458633) (not b!458644) (not d!74811) (not bm!30130) (not bm!30124) (not b!458659) (not b!458699) (not b_lambda!9831) (not b!458579) (not b_lambda!9813) (not b!458683) (not bm!30129) (not b!458674) (not d!74789) (not b!458673) b_and!19245 (not b!458652) (not b!458608) (not b!458634) (not b!458702) (not bm!30132) (not b!458662) (not b!458698) (not b!458690) tp_is_empty!12331 (not bm!30117) (not b_lambda!9845) (not b!458711) (not b_lambda!9839) (not b!458709) (not b!458642) (not d!74797) (not b_lambda!9843) (not b!458676) (not b!458677) (not b!458643) (not b_next!10993) (not mapNonEmpty!20152) (not bm!30123) (not b!458684) (not b!458640) (not d!74793) (not b!458651) (not bm!30131) (not b!458590) (not bm!30134) (not b_lambda!9835) (not b!458661) (not b!458685) (not b!458694) (not b!458701) (not bm!30120) (not b!458638) (not b!458689) (not d!74813) (not b!458700) (not bm!30133) (not b!458650) (not b!458591) (not b!458708) (not b!458581) (not b!458656) (not b!458697) (not d!74791) (not b_lambda!9841) (not b!458706) (not b!458712) (not d!74801) (not b!458710))
(check-sat b_and!19245 (not b_next!10993))
