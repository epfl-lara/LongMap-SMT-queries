; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76200 () Bool)

(assert start!76200)

(declare-fun b!894737 () Bool)

(declare-fun b_free!15889 () Bool)

(declare-fun b_next!15889 () Bool)

(assert (=> b!894737 (= b_free!15889 (not b_next!15889))))

(declare-fun tp!55666 () Bool)

(declare-fun b_and!26155 () Bool)

(assert (=> b!894737 (= tp!55666 b_and!26155)))

(declare-fun b!894736 () Bool)

(declare-fun e!499827 () Bool)

(declare-fun tp_is_empty!18217 () Bool)

(assert (=> b!894736 (= e!499827 tp_is_empty!18217)))

(declare-datatypes ((array!52413 0))(
  ( (array!52414 (arr!25205 (Array (_ BitVec 32) (_ BitVec 64))) (size!25655 (_ BitVec 32))) )
))
(declare-datatypes ((V!29255 0))(
  ( (V!29256 (val!9159 Int)) )
))
(declare-datatypes ((ValueCell!8627 0))(
  ( (ValueCellFull!8627 (v!11646 V!29255)) (EmptyCell!8627) )
))
(declare-datatypes ((array!52415 0))(
  ( (array!52416 (arr!25206 (Array (_ BitVec 32) ValueCell!8627)) (size!25656 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4270 0))(
  ( (LongMapFixedSize!4271 (defaultEntry!5347 Int) (mask!25919 (_ BitVec 32)) (extraKeys!5043 (_ BitVec 32)) (zeroValue!5147 V!29255) (minValue!5147 V!29255) (_size!2190 (_ BitVec 32)) (_keys!10048 array!52413) (_values!5334 array!52415) (_vacant!2190 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4270)

(declare-fun e!499823 () Bool)

(declare-fun e!499822 () Bool)

(declare-fun array_inv!19844 (array!52413) Bool)

(declare-fun array_inv!19845 (array!52415) Bool)

(assert (=> b!894737 (= e!499823 (and tp!55666 tp_is_empty!18217 (array_inv!19844 (_keys!10048 thiss!1181)) (array_inv!19845 (_values!5334 thiss!1181)) e!499822))))

(declare-fun mapNonEmpty!28910 () Bool)

(declare-fun mapRes!28910 () Bool)

(declare-fun tp!55667 () Bool)

(declare-fun e!499825 () Bool)

(assert (=> mapNonEmpty!28910 (= mapRes!28910 (and tp!55667 e!499825))))

(declare-fun mapKey!28910 () (_ BitVec 32))

(declare-fun mapRest!28910 () (Array (_ BitVec 32) ValueCell!8627))

(declare-fun mapValue!28910 () ValueCell!8627)

(assert (=> mapNonEmpty!28910 (= (arr!25206 (_values!5334 thiss!1181)) (store mapRest!28910 mapKey!28910 mapValue!28910))))

(declare-fun b!894738 () Bool)

(declare-fun e!499821 () Bool)

(declare-fun e!499824 () Bool)

(assert (=> b!894738 (= e!499821 e!499824)))

(declare-fun res!605427 () Bool)

(assert (=> b!894738 (=> (not res!605427) (not e!499824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894738 (= res!605427 (validMask!0 (mask!25919 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8878 0))(
  ( (MissingZero!8878 (index!37883 (_ BitVec 32))) (Found!8878 (index!37884 (_ BitVec 32))) (Intermediate!8878 (undefined!9690 Bool) (index!37885 (_ BitVec 32)) (x!76119 (_ BitVec 32))) (Undefined!8878) (MissingVacant!8878 (index!37886 (_ BitVec 32))) )
))
(declare-fun lt!404174 () SeekEntryResult!8878)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52413 (_ BitVec 32)) SeekEntryResult!8878)

(assert (=> b!894738 (= lt!404174 (seekEntry!0 key!785 (_keys!10048 thiss!1181) (mask!25919 thiss!1181)))))

(declare-fun b!894739 () Bool)

(declare-fun res!605428 () Bool)

(assert (=> b!894739 (=> (not res!605428) (not e!499821))))

(assert (=> b!894739 (= res!605428 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894740 () Bool)

(assert (=> b!894740 (= e!499824 (and (= (size!25656 (_values!5334 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25919 thiss!1181))) (= (size!25655 (_keys!10048 thiss!1181)) (size!25656 (_values!5334 thiss!1181))) (bvslt (mask!25919 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!28910 () Bool)

(assert (=> mapIsEmpty!28910 mapRes!28910))

(declare-fun res!605426 () Bool)

(assert (=> start!76200 (=> (not res!605426) (not e!499821))))

(declare-fun valid!1658 (LongMapFixedSize!4270) Bool)

(assert (=> start!76200 (= res!605426 (valid!1658 thiss!1181))))

(assert (=> start!76200 e!499821))

(assert (=> start!76200 e!499823))

(assert (=> start!76200 true))

(declare-fun b!894741 () Bool)

(assert (=> b!894741 (= e!499822 (and e!499827 mapRes!28910))))

(declare-fun condMapEmpty!28910 () Bool)

(declare-fun mapDefault!28910 () ValueCell!8627)

(assert (=> b!894741 (= condMapEmpty!28910 (= (arr!25206 (_values!5334 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8627)) mapDefault!28910)))))

(declare-fun b!894742 () Bool)

(assert (=> b!894742 (= e!499825 tp_is_empty!18217)))

(assert (= (and start!76200 res!605426) b!894739))

(assert (= (and b!894739 res!605428) b!894738))

(assert (= (and b!894738 res!605427) b!894740))

(assert (= (and b!894741 condMapEmpty!28910) mapIsEmpty!28910))

(assert (= (and b!894741 (not condMapEmpty!28910)) mapNonEmpty!28910))

(get-info :version)

(assert (= (and mapNonEmpty!28910 ((_ is ValueCellFull!8627) mapValue!28910)) b!894742))

(assert (= (and b!894741 ((_ is ValueCellFull!8627) mapDefault!28910)) b!894736))

(assert (= b!894737 b!894741))

(assert (= start!76200 b!894737))

(declare-fun m!832027 () Bool)

(assert (=> b!894737 m!832027))

(declare-fun m!832029 () Bool)

(assert (=> b!894737 m!832029))

(declare-fun m!832031 () Bool)

(assert (=> mapNonEmpty!28910 m!832031))

(declare-fun m!832033 () Bool)

(assert (=> b!894738 m!832033))

(declare-fun m!832035 () Bool)

(assert (=> b!894738 m!832035))

(declare-fun m!832037 () Bool)

(assert (=> start!76200 m!832037))

(check-sat (not start!76200) (not b!894738) (not mapNonEmpty!28910) (not b!894737) tp_is_empty!18217 (not b_next!15889) b_and!26155)
(check-sat b_and!26155 (not b_next!15889))
(get-model)

(declare-fun d!110521 () Bool)

(assert (=> d!110521 (= (array_inv!19844 (_keys!10048 thiss!1181)) (bvsge (size!25655 (_keys!10048 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894737 d!110521))

(declare-fun d!110523 () Bool)

(assert (=> d!110523 (= (array_inv!19845 (_values!5334 thiss!1181)) (bvsge (size!25656 (_values!5334 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894737 d!110523))

(declare-fun d!110525 () Bool)

(declare-fun res!605453 () Bool)

(declare-fun e!499872 () Bool)

(assert (=> d!110525 (=> (not res!605453) (not e!499872))))

(declare-fun simpleValid!303 (LongMapFixedSize!4270) Bool)

(assert (=> d!110525 (= res!605453 (simpleValid!303 thiss!1181))))

(assert (=> d!110525 (= (valid!1658 thiss!1181) e!499872)))

(declare-fun b!894791 () Bool)

(declare-fun res!605454 () Bool)

(assert (=> b!894791 (=> (not res!605454) (not e!499872))))

(declare-fun arrayCountValidKeys!0 (array!52413 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894791 (= res!605454 (= (arrayCountValidKeys!0 (_keys!10048 thiss!1181) #b00000000000000000000000000000000 (size!25655 (_keys!10048 thiss!1181))) (_size!2190 thiss!1181)))))

(declare-fun b!894792 () Bool)

(declare-fun res!605455 () Bool)

(assert (=> b!894792 (=> (not res!605455) (not e!499872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52413 (_ BitVec 32)) Bool)

(assert (=> b!894792 (= res!605455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10048 thiss!1181) (mask!25919 thiss!1181)))))

(declare-fun b!894793 () Bool)

(declare-datatypes ((List!17818 0))(
  ( (Nil!17815) (Cons!17814 (h!18949 (_ BitVec 64)) (t!25148 List!17818)) )
))
(declare-fun arrayNoDuplicates!0 (array!52413 (_ BitVec 32) List!17818) Bool)

(assert (=> b!894793 (= e!499872 (arrayNoDuplicates!0 (_keys!10048 thiss!1181) #b00000000000000000000000000000000 Nil!17815))))

(assert (= (and d!110525 res!605453) b!894791))

(assert (= (and b!894791 res!605454) b!894792))

(assert (= (and b!894792 res!605455) b!894793))

(declare-fun m!832063 () Bool)

(assert (=> d!110525 m!832063))

(declare-fun m!832065 () Bool)

(assert (=> b!894791 m!832065))

(declare-fun m!832067 () Bool)

(assert (=> b!894792 m!832067))

(declare-fun m!832069 () Bool)

(assert (=> b!894793 m!832069))

(assert (=> start!76200 d!110525))

(declare-fun d!110527 () Bool)

(assert (=> d!110527 (= (validMask!0 (mask!25919 thiss!1181)) (and (or (= (mask!25919 thiss!1181) #b00000000000000000000000000000111) (= (mask!25919 thiss!1181) #b00000000000000000000000000001111) (= (mask!25919 thiss!1181) #b00000000000000000000000000011111) (= (mask!25919 thiss!1181) #b00000000000000000000000000111111) (= (mask!25919 thiss!1181) #b00000000000000000000000001111111) (= (mask!25919 thiss!1181) #b00000000000000000000000011111111) (= (mask!25919 thiss!1181) #b00000000000000000000000111111111) (= (mask!25919 thiss!1181) #b00000000000000000000001111111111) (= (mask!25919 thiss!1181) #b00000000000000000000011111111111) (= (mask!25919 thiss!1181) #b00000000000000000000111111111111) (= (mask!25919 thiss!1181) #b00000000000000000001111111111111) (= (mask!25919 thiss!1181) #b00000000000000000011111111111111) (= (mask!25919 thiss!1181) #b00000000000000000111111111111111) (= (mask!25919 thiss!1181) #b00000000000000001111111111111111) (= (mask!25919 thiss!1181) #b00000000000000011111111111111111) (= (mask!25919 thiss!1181) #b00000000000000111111111111111111) (= (mask!25919 thiss!1181) #b00000000000001111111111111111111) (= (mask!25919 thiss!1181) #b00000000000011111111111111111111) (= (mask!25919 thiss!1181) #b00000000000111111111111111111111) (= (mask!25919 thiss!1181) #b00000000001111111111111111111111) (= (mask!25919 thiss!1181) #b00000000011111111111111111111111) (= (mask!25919 thiss!1181) #b00000000111111111111111111111111) (= (mask!25919 thiss!1181) #b00000001111111111111111111111111) (= (mask!25919 thiss!1181) #b00000011111111111111111111111111) (= (mask!25919 thiss!1181) #b00000111111111111111111111111111) (= (mask!25919 thiss!1181) #b00001111111111111111111111111111) (= (mask!25919 thiss!1181) #b00011111111111111111111111111111) (= (mask!25919 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25919 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!894738 d!110527))

(declare-fun d!110529 () Bool)

(declare-fun lt!404192 () SeekEntryResult!8878)

(assert (=> d!110529 (and (or ((_ is MissingVacant!8878) lt!404192) (not ((_ is Found!8878) lt!404192)) (and (bvsge (index!37884 lt!404192) #b00000000000000000000000000000000) (bvslt (index!37884 lt!404192) (size!25655 (_keys!10048 thiss!1181))))) (not ((_ is MissingVacant!8878) lt!404192)) (or (not ((_ is Found!8878) lt!404192)) (= (select (arr!25205 (_keys!10048 thiss!1181)) (index!37884 lt!404192)) key!785)))))

(declare-fun e!499880 () SeekEntryResult!8878)

(assert (=> d!110529 (= lt!404192 e!499880)))

(declare-fun c!94430 () Bool)

(declare-fun lt!404189 () SeekEntryResult!8878)

(assert (=> d!110529 (= c!94430 (and ((_ is Intermediate!8878) lt!404189) (undefined!9690 lt!404189)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52413 (_ BitVec 32)) SeekEntryResult!8878)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110529 (= lt!404189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25919 thiss!1181)) key!785 (_keys!10048 thiss!1181) (mask!25919 thiss!1181)))))

(assert (=> d!110529 (validMask!0 (mask!25919 thiss!1181))))

(assert (=> d!110529 (= (seekEntry!0 key!785 (_keys!10048 thiss!1181) (mask!25919 thiss!1181)) lt!404192)))

(declare-fun b!894806 () Bool)

(assert (=> b!894806 (= e!499880 Undefined!8878)))

(declare-fun b!894807 () Bool)

(declare-fun c!94431 () Bool)

(declare-fun lt!404190 () (_ BitVec 64))

(assert (=> b!894807 (= c!94431 (= lt!404190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499879 () SeekEntryResult!8878)

(declare-fun e!499881 () SeekEntryResult!8878)

(assert (=> b!894807 (= e!499879 e!499881)))

(declare-fun b!894808 () Bool)

(declare-fun lt!404191 () SeekEntryResult!8878)

(assert (=> b!894808 (= e!499881 (ite ((_ is MissingVacant!8878) lt!404191) (MissingZero!8878 (index!37886 lt!404191)) lt!404191))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52413 (_ BitVec 32)) SeekEntryResult!8878)

(assert (=> b!894808 (= lt!404191 (seekKeyOrZeroReturnVacant!0 (x!76119 lt!404189) (index!37885 lt!404189) (index!37885 lt!404189) key!785 (_keys!10048 thiss!1181) (mask!25919 thiss!1181)))))

(declare-fun b!894809 () Bool)

(assert (=> b!894809 (= e!499879 (Found!8878 (index!37885 lt!404189)))))

(declare-fun b!894810 () Bool)

(assert (=> b!894810 (= e!499881 (MissingZero!8878 (index!37885 lt!404189)))))

(declare-fun b!894811 () Bool)

(assert (=> b!894811 (= e!499880 e!499879)))

(assert (=> b!894811 (= lt!404190 (select (arr!25205 (_keys!10048 thiss!1181)) (index!37885 lt!404189)))))

(declare-fun c!94429 () Bool)

(assert (=> b!894811 (= c!94429 (= lt!404190 key!785))))

(assert (= (and d!110529 c!94430) b!894806))

(assert (= (and d!110529 (not c!94430)) b!894811))

(assert (= (and b!894811 c!94429) b!894809))

(assert (= (and b!894811 (not c!94429)) b!894807))

(assert (= (and b!894807 c!94431) b!894810))

(assert (= (and b!894807 (not c!94431)) b!894808))

(declare-fun m!832071 () Bool)

(assert (=> d!110529 m!832071))

(declare-fun m!832073 () Bool)

(assert (=> d!110529 m!832073))

(assert (=> d!110529 m!832073))

(declare-fun m!832075 () Bool)

(assert (=> d!110529 m!832075))

(assert (=> d!110529 m!832033))

(declare-fun m!832077 () Bool)

(assert (=> b!894808 m!832077))

(declare-fun m!832079 () Bool)

(assert (=> b!894811 m!832079))

(assert (=> b!894738 d!110529))

(declare-fun mapNonEmpty!28919 () Bool)

(declare-fun mapRes!28919 () Bool)

(declare-fun tp!55682 () Bool)

(declare-fun e!499886 () Bool)

(assert (=> mapNonEmpty!28919 (= mapRes!28919 (and tp!55682 e!499886))))

(declare-fun mapRest!28919 () (Array (_ BitVec 32) ValueCell!8627))

(declare-fun mapKey!28919 () (_ BitVec 32))

(declare-fun mapValue!28919 () ValueCell!8627)

(assert (=> mapNonEmpty!28919 (= mapRest!28910 (store mapRest!28919 mapKey!28919 mapValue!28919))))

(declare-fun mapIsEmpty!28919 () Bool)

(assert (=> mapIsEmpty!28919 mapRes!28919))

(declare-fun b!894818 () Bool)

(assert (=> b!894818 (= e!499886 tp_is_empty!18217)))

(declare-fun b!894819 () Bool)

(declare-fun e!499887 () Bool)

(assert (=> b!894819 (= e!499887 tp_is_empty!18217)))

(declare-fun condMapEmpty!28919 () Bool)

(declare-fun mapDefault!28919 () ValueCell!8627)

(assert (=> mapNonEmpty!28910 (= condMapEmpty!28919 (= mapRest!28910 ((as const (Array (_ BitVec 32) ValueCell!8627)) mapDefault!28919)))))

(assert (=> mapNonEmpty!28910 (= tp!55667 (and e!499887 mapRes!28919))))

(assert (= (and mapNonEmpty!28910 condMapEmpty!28919) mapIsEmpty!28919))

(assert (= (and mapNonEmpty!28910 (not condMapEmpty!28919)) mapNonEmpty!28919))

(assert (= (and mapNonEmpty!28919 ((_ is ValueCellFull!8627) mapValue!28919)) b!894818))

(assert (= (and mapNonEmpty!28910 ((_ is ValueCellFull!8627) mapDefault!28919)) b!894819))

(declare-fun m!832081 () Bool)

(assert (=> mapNonEmpty!28919 m!832081))

(check-sat (not d!110525) (not mapNonEmpty!28919) (not b!894792) (not d!110529) (not b!894791) (not b!894808) (not b!894793) tp_is_empty!18217 (not b_next!15889) b_and!26155)
(check-sat b_and!26155 (not b_next!15889))
