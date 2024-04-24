; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76386 () Bool)

(assert start!76386)

(declare-fun b!895882 () Bool)

(declare-fun b_free!15889 () Bool)

(declare-fun b_next!15889 () Bool)

(assert (=> b!895882 (= b_free!15889 (not b_next!15889))))

(declare-fun tp!55667 () Bool)

(declare-fun b_and!26191 () Bool)

(assert (=> b!895882 (= tp!55667 b_and!26191)))

(declare-fun b!895878 () Bool)

(declare-fun e!500556 () Bool)

(declare-fun e!500555 () Bool)

(declare-fun mapRes!28910 () Bool)

(assert (=> b!895878 (= e!500556 (and e!500555 mapRes!28910))))

(declare-fun condMapEmpty!28910 () Bool)

(declare-datatypes ((array!52469 0))(
  ( (array!52470 (arr!25228 (Array (_ BitVec 32) (_ BitVec 64))) (size!25677 (_ BitVec 32))) )
))
(declare-datatypes ((V!29255 0))(
  ( (V!29256 (val!9159 Int)) )
))
(declare-datatypes ((ValueCell!8627 0))(
  ( (ValueCellFull!8627 (v!11646 V!29255)) (EmptyCell!8627) )
))
(declare-datatypes ((array!52471 0))(
  ( (array!52472 (arr!25229 (Array (_ BitVec 32) ValueCell!8627)) (size!25678 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4270 0))(
  ( (LongMapFixedSize!4271 (defaultEntry!5347 Int) (mask!25969 (_ BitVec 32)) (extraKeys!5043 (_ BitVec 32)) (zeroValue!5147 V!29255) (minValue!5147 V!29255) (_size!2190 (_ BitVec 32)) (_keys!10081 array!52469) (_values!5334 array!52471) (_vacant!2190 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4270)

(declare-fun mapDefault!28910 () ValueCell!8627)

(assert (=> b!895878 (= condMapEmpty!28910 (= (arr!25229 (_values!5334 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8627)) mapDefault!28910)))))

(declare-fun mapNonEmpty!28910 () Bool)

(declare-fun tp!55666 () Bool)

(declare-fun e!500557 () Bool)

(assert (=> mapNonEmpty!28910 (= mapRes!28910 (and tp!55666 e!500557))))

(declare-fun mapRest!28910 () (Array (_ BitVec 32) ValueCell!8627))

(declare-fun mapValue!28910 () ValueCell!8627)

(declare-fun mapKey!28910 () (_ BitVec 32))

(assert (=> mapNonEmpty!28910 (= (arr!25229 (_values!5334 thiss!1181)) (store mapRest!28910 mapKey!28910 mapValue!28910))))

(declare-fun mapIsEmpty!28910 () Bool)

(assert (=> mapIsEmpty!28910 mapRes!28910))

(declare-fun b!895879 () Bool)

(declare-fun e!500554 () Bool)

(assert (=> b!895879 (= e!500554 (and (= (size!25678 (_values!5334 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25969 thiss!1181))) (= (size!25677 (_keys!10081 thiss!1181)) (size!25678 (_values!5334 thiss!1181))) (bvslt (mask!25969 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!895880 () Bool)

(declare-fun tp_is_empty!18217 () Bool)

(assert (=> b!895880 (= e!500557 tp_is_empty!18217)))

(declare-fun b!895881 () Bool)

(declare-fun res!605880 () Bool)

(declare-fun e!500551 () Bool)

(assert (=> b!895881 (=> (not res!605880) (not e!500551))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895881 (= res!605880 (not (= key!785 (bvneg key!785))))))

(declare-fun e!500553 () Bool)

(declare-fun array_inv!19854 (array!52469) Bool)

(declare-fun array_inv!19855 (array!52471) Bool)

(assert (=> b!895882 (= e!500553 (and tp!55667 tp_is_empty!18217 (array_inv!19854 (_keys!10081 thiss!1181)) (array_inv!19855 (_values!5334 thiss!1181)) e!500556))))

(declare-fun res!605882 () Bool)

(assert (=> start!76386 (=> (not res!605882) (not e!500551))))

(declare-fun valid!1661 (LongMapFixedSize!4270) Bool)

(assert (=> start!76386 (= res!605882 (valid!1661 thiss!1181))))

(assert (=> start!76386 e!500551))

(assert (=> start!76386 e!500553))

(assert (=> start!76386 true))

(declare-fun b!895883 () Bool)

(assert (=> b!895883 (= e!500555 tp_is_empty!18217)))

(declare-fun b!895884 () Bool)

(assert (=> b!895884 (= e!500551 e!500554)))

(declare-fun res!605881 () Bool)

(assert (=> b!895884 (=> (not res!605881) (not e!500554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895884 (= res!605881 (validMask!0 (mask!25969 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8827 0))(
  ( (MissingZero!8827 (index!37679 (_ BitVec 32))) (Found!8827 (index!37680 (_ BitVec 32))) (Intermediate!8827 (undefined!9639 Bool) (index!37681 (_ BitVec 32)) (x!76087 (_ BitVec 32))) (Undefined!8827) (MissingVacant!8827 (index!37682 (_ BitVec 32))) )
))
(declare-fun lt!404771 () SeekEntryResult!8827)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52469 (_ BitVec 32)) SeekEntryResult!8827)

(assert (=> b!895884 (= lt!404771 (seekEntry!0 key!785 (_keys!10081 thiss!1181) (mask!25969 thiss!1181)))))

(assert (= (and start!76386 res!605882) b!895881))

(assert (= (and b!895881 res!605880) b!895884))

(assert (= (and b!895884 res!605881) b!895879))

(assert (= (and b!895878 condMapEmpty!28910) mapIsEmpty!28910))

(assert (= (and b!895878 (not condMapEmpty!28910)) mapNonEmpty!28910))

(get-info :version)

(assert (= (and mapNonEmpty!28910 ((_ is ValueCellFull!8627) mapValue!28910)) b!895880))

(assert (= (and b!895878 ((_ is ValueCellFull!8627) mapDefault!28910)) b!895883))

(assert (= b!895882 b!895878))

(assert (= start!76386 b!895882))

(declare-fun m!834079 () Bool)

(assert (=> mapNonEmpty!28910 m!834079))

(declare-fun m!834081 () Bool)

(assert (=> b!895882 m!834081))

(declare-fun m!834083 () Bool)

(assert (=> b!895882 m!834083))

(declare-fun m!834085 () Bool)

(assert (=> start!76386 m!834085))

(declare-fun m!834087 () Bool)

(assert (=> b!895884 m!834087))

(declare-fun m!834089 () Bool)

(assert (=> b!895884 m!834089))

(check-sat b_and!26191 (not mapNonEmpty!28910) (not b_next!15889) (not b!895882) (not start!76386) (not b!895884) tp_is_empty!18217)
(check-sat b_and!26191 (not b_next!15889))
(get-model)

(declare-fun d!111041 () Bool)

(assert (=> d!111041 (= (array_inv!19854 (_keys!10081 thiss!1181)) (bvsge (size!25677 (_keys!10081 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895882 d!111041))

(declare-fun d!111043 () Bool)

(assert (=> d!111043 (= (array_inv!19855 (_values!5334 thiss!1181)) (bvsge (size!25678 (_values!5334 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895882 d!111043))

(declare-fun d!111045 () Bool)

(declare-fun res!605907 () Bool)

(declare-fun e!500602 () Bool)

(assert (=> d!111045 (=> (not res!605907) (not e!500602))))

(declare-fun simpleValid!303 (LongMapFixedSize!4270) Bool)

(assert (=> d!111045 (= res!605907 (simpleValid!303 thiss!1181))))

(assert (=> d!111045 (= (valid!1661 thiss!1181) e!500602)))

(declare-fun b!895933 () Bool)

(declare-fun res!605908 () Bool)

(assert (=> b!895933 (=> (not res!605908) (not e!500602))))

(declare-fun arrayCountValidKeys!0 (array!52469 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895933 (= res!605908 (= (arrayCountValidKeys!0 (_keys!10081 thiss!1181) #b00000000000000000000000000000000 (size!25677 (_keys!10081 thiss!1181))) (_size!2190 thiss!1181)))))

(declare-fun b!895934 () Bool)

(declare-fun res!605909 () Bool)

(assert (=> b!895934 (=> (not res!605909) (not e!500602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52469 (_ BitVec 32)) Bool)

(assert (=> b!895934 (= res!605909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10081 thiss!1181) (mask!25969 thiss!1181)))))

(declare-fun b!895935 () Bool)

(declare-datatypes ((List!17762 0))(
  ( (Nil!17759) (Cons!17758 (h!18899 (_ BitVec 64)) (t!25093 List!17762)) )
))
(declare-fun arrayNoDuplicates!0 (array!52469 (_ BitVec 32) List!17762) Bool)

(assert (=> b!895935 (= e!500602 (arrayNoDuplicates!0 (_keys!10081 thiss!1181) #b00000000000000000000000000000000 Nil!17759))))

(assert (= (and d!111045 res!605907) b!895933))

(assert (= (and b!895933 res!605908) b!895934))

(assert (= (and b!895934 res!605909) b!895935))

(declare-fun m!834115 () Bool)

(assert (=> d!111045 m!834115))

(declare-fun m!834117 () Bool)

(assert (=> b!895933 m!834117))

(declare-fun m!834119 () Bool)

(assert (=> b!895934 m!834119))

(declare-fun m!834121 () Bool)

(assert (=> b!895935 m!834121))

(assert (=> start!76386 d!111045))

(declare-fun d!111047 () Bool)

(assert (=> d!111047 (= (validMask!0 (mask!25969 thiss!1181)) (and (or (= (mask!25969 thiss!1181) #b00000000000000000000000000000111) (= (mask!25969 thiss!1181) #b00000000000000000000000000001111) (= (mask!25969 thiss!1181) #b00000000000000000000000000011111) (= (mask!25969 thiss!1181) #b00000000000000000000000000111111) (= (mask!25969 thiss!1181) #b00000000000000000000000001111111) (= (mask!25969 thiss!1181) #b00000000000000000000000011111111) (= (mask!25969 thiss!1181) #b00000000000000000000000111111111) (= (mask!25969 thiss!1181) #b00000000000000000000001111111111) (= (mask!25969 thiss!1181) #b00000000000000000000011111111111) (= (mask!25969 thiss!1181) #b00000000000000000000111111111111) (= (mask!25969 thiss!1181) #b00000000000000000001111111111111) (= (mask!25969 thiss!1181) #b00000000000000000011111111111111) (= (mask!25969 thiss!1181) #b00000000000000000111111111111111) (= (mask!25969 thiss!1181) #b00000000000000001111111111111111) (= (mask!25969 thiss!1181) #b00000000000000011111111111111111) (= (mask!25969 thiss!1181) #b00000000000000111111111111111111) (= (mask!25969 thiss!1181) #b00000000000001111111111111111111) (= (mask!25969 thiss!1181) #b00000000000011111111111111111111) (= (mask!25969 thiss!1181) #b00000000000111111111111111111111) (= (mask!25969 thiss!1181) #b00000000001111111111111111111111) (= (mask!25969 thiss!1181) #b00000000011111111111111111111111) (= (mask!25969 thiss!1181) #b00000000111111111111111111111111) (= (mask!25969 thiss!1181) #b00000001111111111111111111111111) (= (mask!25969 thiss!1181) #b00000011111111111111111111111111) (= (mask!25969 thiss!1181) #b00000111111111111111111111111111) (= (mask!25969 thiss!1181) #b00001111111111111111111111111111) (= (mask!25969 thiss!1181) #b00011111111111111111111111111111) (= (mask!25969 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25969 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895884 d!111047))

(declare-fun b!895948 () Bool)

(declare-fun e!500609 () SeekEntryResult!8827)

(declare-fun lt!404788 () SeekEntryResult!8827)

(assert (=> b!895948 (= e!500609 (ite ((_ is MissingVacant!8827) lt!404788) (MissingZero!8827 (index!37682 lt!404788)) lt!404788))))

(declare-fun lt!404786 () SeekEntryResult!8827)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52469 (_ BitVec 32)) SeekEntryResult!8827)

(assert (=> b!895948 (= lt!404788 (seekKeyOrZeroReturnVacant!0 (x!76087 lt!404786) (index!37681 lt!404786) (index!37681 lt!404786) key!785 (_keys!10081 thiss!1181) (mask!25969 thiss!1181)))))

(declare-fun b!895949 () Bool)

(declare-fun e!500610 () SeekEntryResult!8827)

(assert (=> b!895949 (= e!500610 Undefined!8827)))

(declare-fun b!895950 () Bool)

(declare-fun c!94778 () Bool)

(declare-fun lt!404789 () (_ BitVec 64))

(assert (=> b!895950 (= c!94778 (= lt!404789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500611 () SeekEntryResult!8827)

(assert (=> b!895950 (= e!500611 e!500609)))

(declare-fun b!895951 () Bool)

(assert (=> b!895951 (= e!500609 (MissingZero!8827 (index!37681 lt!404786)))))

(declare-fun b!895952 () Bool)

(assert (=> b!895952 (= e!500610 e!500611)))

(assert (=> b!895952 (= lt!404789 (select (arr!25228 (_keys!10081 thiss!1181)) (index!37681 lt!404786)))))

(declare-fun c!94777 () Bool)

(assert (=> b!895952 (= c!94777 (= lt!404789 key!785))))

(declare-fun b!895953 () Bool)

(assert (=> b!895953 (= e!500611 (Found!8827 (index!37681 lt!404786)))))

(declare-fun d!111049 () Bool)

(declare-fun lt!404787 () SeekEntryResult!8827)

(assert (=> d!111049 (and (or ((_ is MissingVacant!8827) lt!404787) (not ((_ is Found!8827) lt!404787)) (and (bvsge (index!37680 lt!404787) #b00000000000000000000000000000000) (bvslt (index!37680 lt!404787) (size!25677 (_keys!10081 thiss!1181))))) (not ((_ is MissingVacant!8827) lt!404787)) (or (not ((_ is Found!8827) lt!404787)) (= (select (arr!25228 (_keys!10081 thiss!1181)) (index!37680 lt!404787)) key!785)))))

(assert (=> d!111049 (= lt!404787 e!500610)))

(declare-fun c!94776 () Bool)

(assert (=> d!111049 (= c!94776 (and ((_ is Intermediate!8827) lt!404786) (undefined!9639 lt!404786)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52469 (_ BitVec 32)) SeekEntryResult!8827)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111049 (= lt!404786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25969 thiss!1181)) key!785 (_keys!10081 thiss!1181) (mask!25969 thiss!1181)))))

(assert (=> d!111049 (validMask!0 (mask!25969 thiss!1181))))

(assert (=> d!111049 (= (seekEntry!0 key!785 (_keys!10081 thiss!1181) (mask!25969 thiss!1181)) lt!404787)))

(assert (= (and d!111049 c!94776) b!895949))

(assert (= (and d!111049 (not c!94776)) b!895952))

(assert (= (and b!895952 c!94777) b!895953))

(assert (= (and b!895952 (not c!94777)) b!895950))

(assert (= (and b!895950 c!94778) b!895951))

(assert (= (and b!895950 (not c!94778)) b!895948))

(declare-fun m!834123 () Bool)

(assert (=> b!895948 m!834123))

(declare-fun m!834125 () Bool)

(assert (=> b!895952 m!834125))

(declare-fun m!834127 () Bool)

(assert (=> d!111049 m!834127))

(declare-fun m!834129 () Bool)

(assert (=> d!111049 m!834129))

(assert (=> d!111049 m!834129))

(declare-fun m!834131 () Bool)

(assert (=> d!111049 m!834131))

(assert (=> d!111049 m!834087))

(assert (=> b!895884 d!111049))

(declare-fun b!895960 () Bool)

(declare-fun e!500617 () Bool)

(assert (=> b!895960 (= e!500617 tp_is_empty!18217)))

(declare-fun mapNonEmpty!28919 () Bool)

(declare-fun mapRes!28919 () Bool)

(declare-fun tp!55682 () Bool)

(assert (=> mapNonEmpty!28919 (= mapRes!28919 (and tp!55682 e!500617))))

(declare-fun mapKey!28919 () (_ BitVec 32))

(declare-fun mapValue!28919 () ValueCell!8627)

(declare-fun mapRest!28919 () (Array (_ BitVec 32) ValueCell!8627))

(assert (=> mapNonEmpty!28919 (= mapRest!28910 (store mapRest!28919 mapKey!28919 mapValue!28919))))

(declare-fun mapIsEmpty!28919 () Bool)

(assert (=> mapIsEmpty!28919 mapRes!28919))

(declare-fun b!895961 () Bool)

(declare-fun e!500616 () Bool)

(assert (=> b!895961 (= e!500616 tp_is_empty!18217)))

(declare-fun condMapEmpty!28919 () Bool)

(declare-fun mapDefault!28919 () ValueCell!8627)

(assert (=> mapNonEmpty!28910 (= condMapEmpty!28919 (= mapRest!28910 ((as const (Array (_ BitVec 32) ValueCell!8627)) mapDefault!28919)))))

(assert (=> mapNonEmpty!28910 (= tp!55666 (and e!500616 mapRes!28919))))

(assert (= (and mapNonEmpty!28910 condMapEmpty!28919) mapIsEmpty!28919))

(assert (= (and mapNonEmpty!28910 (not condMapEmpty!28919)) mapNonEmpty!28919))

(assert (= (and mapNonEmpty!28919 ((_ is ValueCellFull!8627) mapValue!28919)) b!895960))

(assert (= (and mapNonEmpty!28910 ((_ is ValueCellFull!8627) mapDefault!28919)) b!895961))

(declare-fun m!834133 () Bool)

(assert (=> mapNonEmpty!28919 m!834133))

(check-sat b_and!26191 tp_is_empty!18217 (not d!111045) (not d!111049) (not b!895933) (not b!895948) (not b_next!15889) (not mapNonEmpty!28919) (not b!895934) (not b!895935))
(check-sat b_and!26191 (not b_next!15889))
