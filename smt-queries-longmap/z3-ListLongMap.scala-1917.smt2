; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34096 () Bool)

(assert start!34096)

(declare-fun b_free!7171 () Bool)

(declare-fun b_next!7171 () Bool)

(assert (=> start!34096 (= b_free!7171 (not b_next!7171))))

(declare-fun tp!25040 () Bool)

(declare-fun b_and!14341 () Bool)

(assert (=> start!34096 (= tp!25040 b_and!14341)))

(declare-fun b!339662 () Bool)

(declare-fun e!208371 () Bool)

(declare-fun e!208372 () Bool)

(declare-fun mapRes!12105 () Bool)

(assert (=> b!339662 (= e!208371 (and e!208372 mapRes!12105))))

(declare-fun condMapEmpty!12105 () Bool)

(declare-datatypes ((V!10475 0))(
  ( (V!10476 (val!3606 Int)) )
))
(declare-datatypes ((ValueCell!3218 0))(
  ( (ValueCellFull!3218 (v!5770 V!10475)) (EmptyCell!3218) )
))
(declare-datatypes ((array!17823 0))(
  ( (array!17824 (arr!8434 (Array (_ BitVec 32) ValueCell!3218)) (size!8787 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17823)

(declare-fun mapDefault!12105 () ValueCell!3218)

(assert (=> b!339662 (= condMapEmpty!12105 (= (arr!8434 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3218)) mapDefault!12105)))))

(declare-fun b!339663 () Bool)

(declare-fun e!208374 () Bool)

(declare-fun tp_is_empty!7123 () Bool)

(assert (=> b!339663 (= e!208374 tp_is_empty!7123)))

(declare-fun b!339664 () Bool)

(declare-fun e!208375 () Bool)

(declare-datatypes ((SeekEntryResult!3253 0))(
  ( (MissingZero!3253 (index!15191 (_ BitVec 32))) (Found!3253 (index!15192 (_ BitVec 32))) (Intermediate!3253 (undefined!4065 Bool) (index!15193 (_ BitVec 32)) (x!33846 (_ BitVec 32))) (Undefined!3253) (MissingVacant!3253 (index!15194 (_ BitVec 32))) )
))
(declare-fun lt!161136 () SeekEntryResult!3253)

(declare-datatypes ((array!17825 0))(
  ( (array!17826 (arr!8435 (Array (_ BitVec 32) (_ BitVec 64))) (size!8788 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17825)

(get-info :version)

(assert (=> b!339664 (= e!208375 (and (not ((_ is Found!3253) lt!161136)) (not ((_ is MissingZero!3253) lt!161136)) ((_ is MissingVacant!3253) lt!161136) (bvslt #b00000000000000000000000000000000 (size!8788 _keys!1895)) (bvsge (size!8788 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17825 (_ BitVec 32)) SeekEntryResult!3253)

(assert (=> b!339664 (= lt!161136 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339665 () Bool)

(assert (=> b!339665 (= e!208372 tp_is_empty!7123)))

(declare-fun b!339666 () Bool)

(declare-fun res!187637 () Bool)

(assert (=> b!339666 (=> (not res!187637) (not e!208375))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339666 (= res!187637 (and (= (size!8787 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8788 _keys!1895) (size!8787 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339667 () Bool)

(declare-fun res!187635 () Bool)

(assert (=> b!339667 (=> (not res!187635) (not e!208375))))

(declare-fun zeroValue!1467 () V!10475)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10475)

(declare-datatypes ((tuple2!5178 0))(
  ( (tuple2!5179 (_1!2600 (_ BitVec 64)) (_2!2600 V!10475)) )
))
(declare-datatypes ((List!4802 0))(
  ( (Nil!4799) (Cons!4798 (h!5654 tuple2!5178) (t!9897 List!4802)) )
))
(declare-datatypes ((ListLongMap!4081 0))(
  ( (ListLongMap!4082 (toList!2056 List!4802)) )
))
(declare-fun contains!2119 (ListLongMap!4081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1562 (array!17825 array!17823 (_ BitVec 32) (_ BitVec 32) V!10475 V!10475 (_ BitVec 32) Int) ListLongMap!4081)

(assert (=> b!339667 (= res!187635 (not (contains!2119 (getCurrentListMap!1562 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339668 () Bool)

(declare-fun res!187633 () Bool)

(assert (=> b!339668 (=> (not res!187633) (not e!208375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339668 (= res!187633 (validKeyInArray!0 k0!1348))))

(declare-fun b!339669 () Bool)

(declare-fun res!187634 () Bool)

(assert (=> b!339669 (=> (not res!187634) (not e!208375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17825 (_ BitVec 32)) Bool)

(assert (=> b!339669 (= res!187634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12105 () Bool)

(declare-fun tp!25041 () Bool)

(assert (=> mapNonEmpty!12105 (= mapRes!12105 (and tp!25041 e!208374))))

(declare-fun mapRest!12105 () (Array (_ BitVec 32) ValueCell!3218))

(declare-fun mapValue!12105 () ValueCell!3218)

(declare-fun mapKey!12105 () (_ BitVec 32))

(assert (=> mapNonEmpty!12105 (= (arr!8434 _values!1525) (store mapRest!12105 mapKey!12105 mapValue!12105))))

(declare-fun res!187632 () Bool)

(assert (=> start!34096 (=> (not res!187632) (not e!208375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34096 (= res!187632 (validMask!0 mask!2385))))

(assert (=> start!34096 e!208375))

(assert (=> start!34096 true))

(assert (=> start!34096 tp_is_empty!7123))

(assert (=> start!34096 tp!25040))

(declare-fun array_inv!6282 (array!17823) Bool)

(assert (=> start!34096 (and (array_inv!6282 _values!1525) e!208371)))

(declare-fun array_inv!6283 (array!17825) Bool)

(assert (=> start!34096 (array_inv!6283 _keys!1895)))

(declare-fun b!339670 () Bool)

(declare-fun res!187636 () Bool)

(assert (=> b!339670 (=> (not res!187636) (not e!208375))))

(declare-datatypes ((List!4803 0))(
  ( (Nil!4800) (Cons!4799 (h!5655 (_ BitVec 64)) (t!9898 List!4803)) )
))
(declare-fun arrayNoDuplicates!0 (array!17825 (_ BitVec 32) List!4803) Bool)

(assert (=> b!339670 (= res!187636 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4800))))

(declare-fun mapIsEmpty!12105 () Bool)

(assert (=> mapIsEmpty!12105 mapRes!12105))

(assert (= (and start!34096 res!187632) b!339666))

(assert (= (and b!339666 res!187637) b!339669))

(assert (= (and b!339669 res!187634) b!339670))

(assert (= (and b!339670 res!187636) b!339668))

(assert (= (and b!339668 res!187633) b!339667))

(assert (= (and b!339667 res!187635) b!339664))

(assert (= (and b!339662 condMapEmpty!12105) mapIsEmpty!12105))

(assert (= (and b!339662 (not condMapEmpty!12105)) mapNonEmpty!12105))

(assert (= (and mapNonEmpty!12105 ((_ is ValueCellFull!3218) mapValue!12105)) b!339663))

(assert (= (and b!339662 ((_ is ValueCellFull!3218) mapDefault!12105)) b!339665))

(assert (= start!34096 b!339662))

(declare-fun m!342053 () Bool)

(assert (=> b!339667 m!342053))

(assert (=> b!339667 m!342053))

(declare-fun m!342055 () Bool)

(assert (=> b!339667 m!342055))

(declare-fun m!342057 () Bool)

(assert (=> b!339664 m!342057))

(declare-fun m!342059 () Bool)

(assert (=> b!339668 m!342059))

(declare-fun m!342061 () Bool)

(assert (=> b!339670 m!342061))

(declare-fun m!342063 () Bool)

(assert (=> mapNonEmpty!12105 m!342063))

(declare-fun m!342065 () Bool)

(assert (=> b!339669 m!342065))

(declare-fun m!342067 () Bool)

(assert (=> start!34096 m!342067))

(declare-fun m!342069 () Bool)

(assert (=> start!34096 m!342069))

(declare-fun m!342071 () Bool)

(assert (=> start!34096 m!342071))

(check-sat (not b!339668) (not b!339669) (not b!339670) tp_is_empty!7123 (not start!34096) (not b_next!7171) (not b!339667) (not b!339664) b_and!14341 (not mapNonEmpty!12105))
(check-sat b_and!14341 (not b_next!7171))
(get-model)

(declare-fun b!339735 () Bool)

(declare-fun e!208414 () Bool)

(declare-fun contains!2121 (List!4803 (_ BitVec 64)) Bool)

(assert (=> b!339735 (= e!208414 (contains!2121 Nil!4800 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339736 () Bool)

(declare-fun e!208417 () Bool)

(declare-fun e!208416 () Bool)

(assert (=> b!339736 (= e!208417 e!208416)))

(declare-fun c!52541 () Bool)

(assert (=> b!339736 (= c!52541 (validKeyInArray!0 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26486 () Bool)

(declare-fun call!26489 () Bool)

(assert (=> bm!26486 (= call!26489 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52541 (Cons!4799 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000) Nil!4800) Nil!4800)))))

(declare-fun d!70681 () Bool)

(declare-fun res!187681 () Bool)

(declare-fun e!208415 () Bool)

(assert (=> d!70681 (=> res!187681 e!208415)))

(assert (=> d!70681 (= res!187681 (bvsge #b00000000000000000000000000000000 (size!8788 _keys!1895)))))

(assert (=> d!70681 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4800) e!208415)))

(declare-fun b!339737 () Bool)

(assert (=> b!339737 (= e!208415 e!208417)))

(declare-fun res!187680 () Bool)

(assert (=> b!339737 (=> (not res!187680) (not e!208417))))

(assert (=> b!339737 (= res!187680 (not e!208414))))

(declare-fun res!187682 () Bool)

(assert (=> b!339737 (=> (not res!187682) (not e!208414))))

(assert (=> b!339737 (= res!187682 (validKeyInArray!0 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339738 () Bool)

(assert (=> b!339738 (= e!208416 call!26489)))

(declare-fun b!339739 () Bool)

(assert (=> b!339739 (= e!208416 call!26489)))

(assert (= (and d!70681 (not res!187681)) b!339737))

(assert (= (and b!339737 res!187682) b!339735))

(assert (= (and b!339737 res!187680) b!339736))

(assert (= (and b!339736 c!52541) b!339738))

(assert (= (and b!339736 (not c!52541)) b!339739))

(assert (= (or b!339738 b!339739) bm!26486))

(declare-fun m!342113 () Bool)

(assert (=> b!339735 m!342113))

(assert (=> b!339735 m!342113))

(declare-fun m!342115 () Bool)

(assert (=> b!339735 m!342115))

(assert (=> b!339736 m!342113))

(assert (=> b!339736 m!342113))

(declare-fun m!342117 () Bool)

(assert (=> b!339736 m!342117))

(assert (=> bm!26486 m!342113))

(declare-fun m!342119 () Bool)

(assert (=> bm!26486 m!342119))

(assert (=> b!339737 m!342113))

(assert (=> b!339737 m!342113))

(assert (=> b!339737 m!342117))

(assert (=> b!339670 d!70681))

(declare-fun d!70683 () Bool)

(declare-fun lt!161150 () SeekEntryResult!3253)

(assert (=> d!70683 (and (or ((_ is Undefined!3253) lt!161150) (not ((_ is Found!3253) lt!161150)) (and (bvsge (index!15192 lt!161150) #b00000000000000000000000000000000) (bvslt (index!15192 lt!161150) (size!8788 _keys!1895)))) (or ((_ is Undefined!3253) lt!161150) ((_ is Found!3253) lt!161150) (not ((_ is MissingZero!3253) lt!161150)) (and (bvsge (index!15191 lt!161150) #b00000000000000000000000000000000) (bvslt (index!15191 lt!161150) (size!8788 _keys!1895)))) (or ((_ is Undefined!3253) lt!161150) ((_ is Found!3253) lt!161150) ((_ is MissingZero!3253) lt!161150) (not ((_ is MissingVacant!3253) lt!161150)) (and (bvsge (index!15194 lt!161150) #b00000000000000000000000000000000) (bvslt (index!15194 lt!161150) (size!8788 _keys!1895)))) (or ((_ is Undefined!3253) lt!161150) (ite ((_ is Found!3253) lt!161150) (= (select (arr!8435 _keys!1895) (index!15192 lt!161150)) k0!1348) (ite ((_ is MissingZero!3253) lt!161150) (= (select (arr!8435 _keys!1895) (index!15191 lt!161150)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3253) lt!161150) (= (select (arr!8435 _keys!1895) (index!15194 lt!161150)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!208425 () SeekEntryResult!3253)

(assert (=> d!70683 (= lt!161150 e!208425)))

(declare-fun c!52549 () Bool)

(declare-fun lt!161149 () SeekEntryResult!3253)

(assert (=> d!70683 (= c!52549 (and ((_ is Intermediate!3253) lt!161149) (undefined!4065 lt!161149)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17825 (_ BitVec 32)) SeekEntryResult!3253)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70683 (= lt!161149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70683 (validMask!0 mask!2385)))

(assert (=> d!70683 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161150)))

(declare-fun b!339752 () Bool)

(declare-fun e!208426 () SeekEntryResult!3253)

(assert (=> b!339752 (= e!208426 (Found!3253 (index!15193 lt!161149)))))

(declare-fun b!339753 () Bool)

(declare-fun c!52548 () Bool)

(declare-fun lt!161151 () (_ BitVec 64))

(assert (=> b!339753 (= c!52548 (= lt!161151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!208424 () SeekEntryResult!3253)

(assert (=> b!339753 (= e!208426 e!208424)))

(declare-fun b!339754 () Bool)

(assert (=> b!339754 (= e!208425 e!208426)))

(assert (=> b!339754 (= lt!161151 (select (arr!8435 _keys!1895) (index!15193 lt!161149)))))

(declare-fun c!52550 () Bool)

(assert (=> b!339754 (= c!52550 (= lt!161151 k0!1348))))

(declare-fun b!339755 () Bool)

(assert (=> b!339755 (= e!208424 (MissingZero!3253 (index!15193 lt!161149)))))

(declare-fun b!339756 () Bool)

(assert (=> b!339756 (= e!208425 Undefined!3253)))

(declare-fun b!339757 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17825 (_ BitVec 32)) SeekEntryResult!3253)

(assert (=> b!339757 (= e!208424 (seekKeyOrZeroReturnVacant!0 (x!33846 lt!161149) (index!15193 lt!161149) (index!15193 lt!161149) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!70683 c!52549) b!339756))

(assert (= (and d!70683 (not c!52549)) b!339754))

(assert (= (and b!339754 c!52550) b!339752))

(assert (= (and b!339754 (not c!52550)) b!339753))

(assert (= (and b!339753 c!52548) b!339755))

(assert (= (and b!339753 (not c!52548)) b!339757))

(declare-fun m!342121 () Bool)

(assert (=> d!70683 m!342121))

(declare-fun m!342123 () Bool)

(assert (=> d!70683 m!342123))

(declare-fun m!342125 () Bool)

(assert (=> d!70683 m!342125))

(assert (=> d!70683 m!342067))

(assert (=> d!70683 m!342123))

(declare-fun m!342127 () Bool)

(assert (=> d!70683 m!342127))

(declare-fun m!342129 () Bool)

(assert (=> d!70683 m!342129))

(declare-fun m!342131 () Bool)

(assert (=> b!339754 m!342131))

(declare-fun m!342133 () Bool)

(assert (=> b!339757 m!342133))

(assert (=> b!339664 d!70683))

(declare-fun d!70685 () Bool)

(declare-fun res!187687 () Bool)

(declare-fun e!208435 () Bool)

(assert (=> d!70685 (=> res!187687 e!208435)))

(assert (=> d!70685 (= res!187687 (bvsge #b00000000000000000000000000000000 (size!8788 _keys!1895)))))

(assert (=> d!70685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208435)))

(declare-fun b!339766 () Bool)

(declare-fun e!208433 () Bool)

(declare-fun call!26492 () Bool)

(assert (=> b!339766 (= e!208433 call!26492)))

(declare-fun bm!26489 () Bool)

(assert (=> bm!26489 (= call!26492 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!339767 () Bool)

(assert (=> b!339767 (= e!208435 e!208433)))

(declare-fun c!52553 () Bool)

(assert (=> b!339767 (= c!52553 (validKeyInArray!0 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339768 () Bool)

(declare-fun e!208434 () Bool)

(assert (=> b!339768 (= e!208433 e!208434)))

(declare-fun lt!161160 () (_ BitVec 64))

(assert (=> b!339768 (= lt!161160 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10562 0))(
  ( (Unit!10563) )
))
(declare-fun lt!161159 () Unit!10562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17825 (_ BitVec 64) (_ BitVec 32)) Unit!10562)

(assert (=> b!339768 (= lt!161159 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161160 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339768 (arrayContainsKey!0 _keys!1895 lt!161160 #b00000000000000000000000000000000)))

(declare-fun lt!161158 () Unit!10562)

(assert (=> b!339768 (= lt!161158 lt!161159)))

(declare-fun res!187688 () Bool)

(assert (=> b!339768 (= res!187688 (= (seekEntryOrOpen!0 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3253 #b00000000000000000000000000000000)))))

(assert (=> b!339768 (=> (not res!187688) (not e!208434))))

(declare-fun b!339769 () Bool)

(assert (=> b!339769 (= e!208434 call!26492)))

(assert (= (and d!70685 (not res!187687)) b!339767))

(assert (= (and b!339767 c!52553) b!339768))

(assert (= (and b!339767 (not c!52553)) b!339766))

(assert (= (and b!339768 res!187688) b!339769))

(assert (= (or b!339769 b!339766) bm!26489))

(declare-fun m!342135 () Bool)

(assert (=> bm!26489 m!342135))

(assert (=> b!339767 m!342113))

(assert (=> b!339767 m!342113))

(assert (=> b!339767 m!342117))

(assert (=> b!339768 m!342113))

(declare-fun m!342137 () Bool)

(assert (=> b!339768 m!342137))

(declare-fun m!342139 () Bool)

(assert (=> b!339768 m!342139))

(assert (=> b!339768 m!342113))

(declare-fun m!342141 () Bool)

(assert (=> b!339768 m!342141))

(assert (=> b!339669 d!70685))

(declare-fun d!70687 () Bool)

(assert (=> d!70687 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339668 d!70687))

(declare-fun d!70689 () Bool)

(assert (=> d!70689 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34096 d!70689))

(declare-fun d!70691 () Bool)

(assert (=> d!70691 (= (array_inv!6282 _values!1525) (bvsge (size!8787 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34096 d!70691))

(declare-fun d!70693 () Bool)

(assert (=> d!70693 (= (array_inv!6283 _keys!1895) (bvsge (size!8788 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34096 d!70693))

(declare-fun d!70695 () Bool)

(declare-fun e!208441 () Bool)

(assert (=> d!70695 e!208441))

(declare-fun res!187691 () Bool)

(assert (=> d!70695 (=> res!187691 e!208441)))

(declare-fun lt!161170 () Bool)

(assert (=> d!70695 (= res!187691 (not lt!161170))))

(declare-fun lt!161172 () Bool)

(assert (=> d!70695 (= lt!161170 lt!161172)))

(declare-fun lt!161169 () Unit!10562)

(declare-fun e!208440 () Unit!10562)

(assert (=> d!70695 (= lt!161169 e!208440)))

(declare-fun c!52556 () Bool)

(assert (=> d!70695 (= c!52556 lt!161172)))

(declare-fun containsKey!322 (List!4802 (_ BitVec 64)) Bool)

(assert (=> d!70695 (= lt!161172 (containsKey!322 (toList!2056 (getCurrentListMap!1562 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70695 (= (contains!2119 (getCurrentListMap!1562 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161170)))

(declare-fun b!339776 () Bool)

(declare-fun lt!161171 () Unit!10562)

(assert (=> b!339776 (= e!208440 lt!161171)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!271 (List!4802 (_ BitVec 64)) Unit!10562)

(assert (=> b!339776 (= lt!161171 (lemmaContainsKeyImpliesGetValueByKeyDefined!271 (toList!2056 (getCurrentListMap!1562 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!336 0))(
  ( (Some!335 (v!5773 V!10475)) (None!334) )
))
(declare-fun isDefined!272 (Option!336) Bool)

(declare-fun getValueByKey!330 (List!4802 (_ BitVec 64)) Option!336)

(assert (=> b!339776 (isDefined!272 (getValueByKey!330 (toList!2056 (getCurrentListMap!1562 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!339777 () Bool)

(declare-fun Unit!10564 () Unit!10562)

(assert (=> b!339777 (= e!208440 Unit!10564)))

(declare-fun b!339778 () Bool)

(assert (=> b!339778 (= e!208441 (isDefined!272 (getValueByKey!330 (toList!2056 (getCurrentListMap!1562 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70695 c!52556) b!339776))

(assert (= (and d!70695 (not c!52556)) b!339777))

(assert (= (and d!70695 (not res!187691)) b!339778))

(declare-fun m!342143 () Bool)

(assert (=> d!70695 m!342143))

(declare-fun m!342145 () Bool)

(assert (=> b!339776 m!342145))

(declare-fun m!342147 () Bool)

(assert (=> b!339776 m!342147))

(assert (=> b!339776 m!342147))

(declare-fun m!342149 () Bool)

(assert (=> b!339776 m!342149))

(assert (=> b!339778 m!342147))

(assert (=> b!339778 m!342147))

(assert (=> b!339778 m!342149))

(assert (=> b!339667 d!70695))

(declare-fun bm!26504 () Bool)

(declare-fun call!26508 () ListLongMap!4081)

(declare-fun getCurrentListMapNoExtraKeys!590 (array!17825 array!17823 (_ BitVec 32) (_ BitVec 32) V!10475 V!10475 (_ BitVec 32) Int) ListLongMap!4081)

(assert (=> bm!26504 (= call!26508 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!339821 () Bool)

(declare-fun e!208478 () Bool)

(declare-fun lt!161223 () ListLongMap!4081)

(declare-fun apply!274 (ListLongMap!4081 (_ BitVec 64)) V!10475)

(assert (=> b!339821 (= e!208478 (= (apply!274 lt!161223 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!339822 () Bool)

(declare-fun e!208471 () Bool)

(declare-fun e!208479 () Bool)

(assert (=> b!339822 (= e!208471 e!208479)))

(declare-fun res!187715 () Bool)

(declare-fun call!26509 () Bool)

(assert (=> b!339822 (= res!187715 call!26509)))

(assert (=> b!339822 (=> (not res!187715) (not e!208479))))

(declare-fun e!208477 () Bool)

(declare-fun b!339823 () Bool)

(declare-fun get!4588 (ValueCell!3218 V!10475) V!10475)

(declare-fun dynLambda!608 (Int (_ BitVec 64)) V!10475)

(assert (=> b!339823 (= e!208477 (= (apply!274 lt!161223 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000)) (get!4588 (select (arr!8434 _values!1525) #b00000000000000000000000000000000) (dynLambda!608 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339823 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8787 _values!1525)))))

(assert (=> b!339823 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8788 _keys!1895)))))

(declare-fun bm!26505 () Bool)

(declare-fun call!26511 () ListLongMap!4081)

(declare-fun call!26510 () ListLongMap!4081)

(assert (=> bm!26505 (= call!26511 call!26510)))

(declare-fun b!339824 () Bool)

(declare-fun e!208468 () Bool)

(assert (=> b!339824 (= e!208468 (validKeyInArray!0 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339825 () Bool)

(declare-fun e!208470 () Bool)

(declare-fun e!208469 () Bool)

(assert (=> b!339825 (= e!208470 e!208469)))

(declare-fun c!52571 () Bool)

(assert (=> b!339825 (= c!52571 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!339826 () Bool)

(declare-fun e!208472 () Bool)

(assert (=> b!339826 (= e!208472 (validKeyInArray!0 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26506 () Bool)

(declare-fun call!26507 () Bool)

(assert (=> bm!26506 (= call!26507 (contains!2119 lt!161223 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339827 () Bool)

(declare-fun e!208475 () ListLongMap!4081)

(declare-fun e!208474 () ListLongMap!4081)

(assert (=> b!339827 (= e!208475 e!208474)))

(declare-fun c!52574 () Bool)

(assert (=> b!339827 (= c!52574 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!339828 () Bool)

(assert (=> b!339828 (= e!208471 (not call!26509))))

(declare-fun b!339829 () Bool)

(declare-fun c!52572 () Bool)

(assert (=> b!339829 (= c!52572 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!208476 () ListLongMap!4081)

(assert (=> b!339829 (= e!208474 e!208476)))

(declare-fun bm!26507 () Bool)

(declare-fun call!26512 () ListLongMap!4081)

(declare-fun call!26513 () ListLongMap!4081)

(assert (=> bm!26507 (= call!26512 call!26513)))

(declare-fun b!339830 () Bool)

(assert (=> b!339830 (= e!208474 call!26512)))

(declare-fun b!339831 () Bool)

(declare-fun res!187717 () Bool)

(assert (=> b!339831 (=> (not res!187717) (not e!208470))))

(assert (=> b!339831 (= res!187717 e!208471)))

(declare-fun c!52569 () Bool)

(assert (=> b!339831 (= c!52569 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!339832 () Bool)

(declare-fun e!208480 () Unit!10562)

(declare-fun lt!161234 () Unit!10562)

(assert (=> b!339832 (= e!208480 lt!161234)))

(declare-fun lt!161226 () ListLongMap!4081)

(assert (=> b!339832 (= lt!161226 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161220 () (_ BitVec 64))

(assert (=> b!339832 (= lt!161220 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161217 () (_ BitVec 64))

(assert (=> b!339832 (= lt!161217 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161225 () Unit!10562)

(declare-fun addStillContains!250 (ListLongMap!4081 (_ BitVec 64) V!10475 (_ BitVec 64)) Unit!10562)

(assert (=> b!339832 (= lt!161225 (addStillContains!250 lt!161226 lt!161220 zeroValue!1467 lt!161217))))

(declare-fun +!727 (ListLongMap!4081 tuple2!5178) ListLongMap!4081)

(assert (=> b!339832 (contains!2119 (+!727 lt!161226 (tuple2!5179 lt!161220 zeroValue!1467)) lt!161217)))

(declare-fun lt!161231 () Unit!10562)

(assert (=> b!339832 (= lt!161231 lt!161225)))

(declare-fun lt!161224 () ListLongMap!4081)

(assert (=> b!339832 (= lt!161224 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161227 () (_ BitVec 64))

(assert (=> b!339832 (= lt!161227 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161222 () (_ BitVec 64))

(assert (=> b!339832 (= lt!161222 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161229 () Unit!10562)

(declare-fun addApplyDifferent!250 (ListLongMap!4081 (_ BitVec 64) V!10475 (_ BitVec 64)) Unit!10562)

(assert (=> b!339832 (= lt!161229 (addApplyDifferent!250 lt!161224 lt!161227 minValue!1467 lt!161222))))

(assert (=> b!339832 (= (apply!274 (+!727 lt!161224 (tuple2!5179 lt!161227 minValue!1467)) lt!161222) (apply!274 lt!161224 lt!161222))))

(declare-fun lt!161218 () Unit!10562)

(assert (=> b!339832 (= lt!161218 lt!161229)))

(declare-fun lt!161236 () ListLongMap!4081)

(assert (=> b!339832 (= lt!161236 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161219 () (_ BitVec 64))

(assert (=> b!339832 (= lt!161219 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161237 () (_ BitVec 64))

(assert (=> b!339832 (= lt!161237 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161235 () Unit!10562)

(assert (=> b!339832 (= lt!161235 (addApplyDifferent!250 lt!161236 lt!161219 zeroValue!1467 lt!161237))))

(assert (=> b!339832 (= (apply!274 (+!727 lt!161236 (tuple2!5179 lt!161219 zeroValue!1467)) lt!161237) (apply!274 lt!161236 lt!161237))))

(declare-fun lt!161221 () Unit!10562)

(assert (=> b!339832 (= lt!161221 lt!161235)))

(declare-fun lt!161228 () ListLongMap!4081)

(assert (=> b!339832 (= lt!161228 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161230 () (_ BitVec 64))

(assert (=> b!339832 (= lt!161230 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161232 () (_ BitVec 64))

(assert (=> b!339832 (= lt!161232 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!339832 (= lt!161234 (addApplyDifferent!250 lt!161228 lt!161230 minValue!1467 lt!161232))))

(assert (=> b!339832 (= (apply!274 (+!727 lt!161228 (tuple2!5179 lt!161230 minValue!1467)) lt!161232) (apply!274 lt!161228 lt!161232))))

(declare-fun bm!26508 () Bool)

(assert (=> bm!26508 (= call!26509 (contains!2119 lt!161223 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339833 () Bool)

(assert (=> b!339833 (= e!208469 e!208478)))

(declare-fun res!187718 () Bool)

(assert (=> b!339833 (= res!187718 call!26507)))

(assert (=> b!339833 (=> (not res!187718) (not e!208478))))

(declare-fun b!339834 () Bool)

(assert (=> b!339834 (= e!208476 call!26512)))

(declare-fun b!339835 () Bool)

(assert (=> b!339835 (= e!208476 call!26511)))

(declare-fun b!339836 () Bool)

(declare-fun Unit!10565 () Unit!10562)

(assert (=> b!339836 (= e!208480 Unit!10565)))

(declare-fun bm!26509 () Bool)

(declare-fun c!52573 () Bool)

(assert (=> bm!26509 (= call!26513 (+!727 (ite c!52573 call!26508 (ite c!52574 call!26510 call!26511)) (ite (or c!52573 c!52574) (tuple2!5179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!339837 () Bool)

(assert (=> b!339837 (= e!208479 (= (apply!274 lt!161223 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun d!70697 () Bool)

(assert (=> d!70697 e!208470))

(declare-fun res!187710 () Bool)

(assert (=> d!70697 (=> (not res!187710) (not e!208470))))

(assert (=> d!70697 (= res!187710 (or (bvsge #b00000000000000000000000000000000 (size!8788 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8788 _keys!1895)))))))

(declare-fun lt!161233 () ListLongMap!4081)

(assert (=> d!70697 (= lt!161223 lt!161233)))

(declare-fun lt!161238 () Unit!10562)

(assert (=> d!70697 (= lt!161238 e!208480)))

(declare-fun c!52570 () Bool)

(assert (=> d!70697 (= c!52570 e!208472)))

(declare-fun res!187716 () Bool)

(assert (=> d!70697 (=> (not res!187716) (not e!208472))))

(assert (=> d!70697 (= res!187716 (bvslt #b00000000000000000000000000000000 (size!8788 _keys!1895)))))

(assert (=> d!70697 (= lt!161233 e!208475)))

(assert (=> d!70697 (= c!52573 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70697 (validMask!0 mask!2385)))

(assert (=> d!70697 (= (getCurrentListMap!1562 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161223)))

(declare-fun b!339838 () Bool)

(assert (=> b!339838 (= e!208469 (not call!26507))))

(declare-fun bm!26510 () Bool)

(assert (=> bm!26510 (= call!26510 call!26508)))

(declare-fun b!339839 () Bool)

(assert (=> b!339839 (= e!208475 (+!727 call!26513 (tuple2!5179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!339840 () Bool)

(declare-fun res!187714 () Bool)

(assert (=> b!339840 (=> (not res!187714) (not e!208470))))

(declare-fun e!208473 () Bool)

(assert (=> b!339840 (= res!187714 e!208473)))

(declare-fun res!187713 () Bool)

(assert (=> b!339840 (=> res!187713 e!208473)))

(assert (=> b!339840 (= res!187713 (not e!208468))))

(declare-fun res!187712 () Bool)

(assert (=> b!339840 (=> (not res!187712) (not e!208468))))

(assert (=> b!339840 (= res!187712 (bvslt #b00000000000000000000000000000000 (size!8788 _keys!1895)))))

(declare-fun b!339841 () Bool)

(assert (=> b!339841 (= e!208473 e!208477)))

(declare-fun res!187711 () Bool)

(assert (=> b!339841 (=> (not res!187711) (not e!208477))))

(assert (=> b!339841 (= res!187711 (contains!2119 lt!161223 (select (arr!8435 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!339841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8788 _keys!1895)))))

(assert (= (and d!70697 c!52573) b!339839))

(assert (= (and d!70697 (not c!52573)) b!339827))

(assert (= (and b!339827 c!52574) b!339830))

(assert (= (and b!339827 (not c!52574)) b!339829))

(assert (= (and b!339829 c!52572) b!339834))

(assert (= (and b!339829 (not c!52572)) b!339835))

(assert (= (or b!339834 b!339835) bm!26505))

(assert (= (or b!339830 bm!26505) bm!26510))

(assert (= (or b!339830 b!339834) bm!26507))

(assert (= (or b!339839 bm!26510) bm!26504))

(assert (= (or b!339839 bm!26507) bm!26509))

(assert (= (and d!70697 res!187716) b!339826))

(assert (= (and d!70697 c!52570) b!339832))

(assert (= (and d!70697 (not c!52570)) b!339836))

(assert (= (and d!70697 res!187710) b!339840))

(assert (= (and b!339840 res!187712) b!339824))

(assert (= (and b!339840 (not res!187713)) b!339841))

(assert (= (and b!339841 res!187711) b!339823))

(assert (= (and b!339840 res!187714) b!339831))

(assert (= (and b!339831 c!52569) b!339822))

(assert (= (and b!339831 (not c!52569)) b!339828))

(assert (= (and b!339822 res!187715) b!339837))

(assert (= (or b!339822 b!339828) bm!26508))

(assert (= (and b!339831 res!187717) b!339825))

(assert (= (and b!339825 c!52571) b!339833))

(assert (= (and b!339825 (not c!52571)) b!339838))

(assert (= (and b!339833 res!187718) b!339821))

(assert (= (or b!339833 b!339838) bm!26506))

(declare-fun b_lambda!8417 () Bool)

(assert (=> (not b_lambda!8417) (not b!339823)))

(declare-fun t!9902 () Bool)

(declare-fun tb!3055 () Bool)

(assert (=> (and start!34096 (= defaultEntry!1528 defaultEntry!1528) t!9902) tb!3055))

(declare-fun result!5511 () Bool)

(assert (=> tb!3055 (= result!5511 tp_is_empty!7123)))

(assert (=> b!339823 t!9902))

(declare-fun b_and!14347 () Bool)

(assert (= b_and!14341 (and (=> t!9902 result!5511) b_and!14347)))

(assert (=> b!339826 m!342113))

(assert (=> b!339826 m!342113))

(assert (=> b!339826 m!342117))

(declare-fun m!342151 () Bool)

(assert (=> b!339821 m!342151))

(assert (=> b!339823 m!342113))

(declare-fun m!342153 () Bool)

(assert (=> b!339823 m!342153))

(assert (=> b!339823 m!342153))

(declare-fun m!342155 () Bool)

(assert (=> b!339823 m!342155))

(declare-fun m!342157 () Bool)

(assert (=> b!339823 m!342157))

(assert (=> b!339823 m!342113))

(declare-fun m!342159 () Bool)

(assert (=> b!339823 m!342159))

(assert (=> b!339823 m!342155))

(declare-fun m!342161 () Bool)

(assert (=> bm!26506 m!342161))

(assert (=> b!339824 m!342113))

(assert (=> b!339824 m!342113))

(assert (=> b!339824 m!342117))

(declare-fun m!342163 () Bool)

(assert (=> b!339839 m!342163))

(declare-fun m!342165 () Bool)

(assert (=> bm!26504 m!342165))

(assert (=> b!339841 m!342113))

(assert (=> b!339841 m!342113))

(declare-fun m!342167 () Bool)

(assert (=> b!339841 m!342167))

(declare-fun m!342169 () Bool)

(assert (=> b!339832 m!342169))

(declare-fun m!342171 () Bool)

(assert (=> b!339832 m!342171))

(declare-fun m!342173 () Bool)

(assert (=> b!339832 m!342173))

(declare-fun m!342175 () Bool)

(assert (=> b!339832 m!342175))

(declare-fun m!342177 () Bool)

(assert (=> b!339832 m!342177))

(declare-fun m!342179 () Bool)

(assert (=> b!339832 m!342179))

(declare-fun m!342181 () Bool)

(assert (=> b!339832 m!342181))

(declare-fun m!342183 () Bool)

(assert (=> b!339832 m!342183))

(declare-fun m!342185 () Bool)

(assert (=> b!339832 m!342185))

(declare-fun m!342187 () Bool)

(assert (=> b!339832 m!342187))

(declare-fun m!342189 () Bool)

(assert (=> b!339832 m!342189))

(assert (=> b!339832 m!342181))

(assert (=> b!339832 m!342177))

(assert (=> b!339832 m!342165))

(assert (=> b!339832 m!342185))

(declare-fun m!342191 () Bool)

(assert (=> b!339832 m!342191))

(assert (=> b!339832 m!342113))

(declare-fun m!342193 () Bool)

(assert (=> b!339832 m!342193))

(declare-fun m!342195 () Bool)

(assert (=> b!339832 m!342195))

(assert (=> b!339832 m!342173))

(declare-fun m!342197 () Bool)

(assert (=> b!339832 m!342197))

(assert (=> d!70697 m!342067))

(declare-fun m!342199 () Bool)

(assert (=> b!339837 m!342199))

(declare-fun m!342201 () Bool)

(assert (=> bm!26508 m!342201))

(declare-fun m!342203 () Bool)

(assert (=> bm!26509 m!342203))

(assert (=> b!339667 d!70697))

(declare-fun b!339851 () Bool)

(declare-fun e!208486 () Bool)

(assert (=> b!339851 (= e!208486 tp_is_empty!7123)))

(declare-fun condMapEmpty!12114 () Bool)

(declare-fun mapDefault!12114 () ValueCell!3218)

(assert (=> mapNonEmpty!12105 (= condMapEmpty!12114 (= mapRest!12105 ((as const (Array (_ BitVec 32) ValueCell!3218)) mapDefault!12114)))))

(declare-fun mapRes!12114 () Bool)

(assert (=> mapNonEmpty!12105 (= tp!25041 (and e!208486 mapRes!12114))))

(declare-fun mapNonEmpty!12114 () Bool)

(declare-fun tp!25056 () Bool)

(declare-fun e!208485 () Bool)

(assert (=> mapNonEmpty!12114 (= mapRes!12114 (and tp!25056 e!208485))))

(declare-fun mapRest!12114 () (Array (_ BitVec 32) ValueCell!3218))

(declare-fun mapKey!12114 () (_ BitVec 32))

(declare-fun mapValue!12114 () ValueCell!3218)

(assert (=> mapNonEmpty!12114 (= mapRest!12105 (store mapRest!12114 mapKey!12114 mapValue!12114))))

(declare-fun b!339850 () Bool)

(assert (=> b!339850 (= e!208485 tp_is_empty!7123)))

(declare-fun mapIsEmpty!12114 () Bool)

(assert (=> mapIsEmpty!12114 mapRes!12114))

(assert (= (and mapNonEmpty!12105 condMapEmpty!12114) mapIsEmpty!12114))

(assert (= (and mapNonEmpty!12105 (not condMapEmpty!12114)) mapNonEmpty!12114))

(assert (= (and mapNonEmpty!12114 ((_ is ValueCellFull!3218) mapValue!12114)) b!339850))

(assert (= (and mapNonEmpty!12105 ((_ is ValueCellFull!3218) mapDefault!12114)) b!339851))

(declare-fun m!342205 () Bool)

(assert (=> mapNonEmpty!12114 m!342205))

(declare-fun b_lambda!8419 () Bool)

(assert (= b_lambda!8417 (or (and start!34096 b_free!7171) b_lambda!8419)))

(check-sat (not b!339736) (not b!339735) (not bm!26506) (not bm!26509) (not mapNonEmpty!12114) (not bm!26508) (not bm!26489) tp_is_empty!7123 (not b!339824) (not b!339826) (not b!339832) b_and!14347 (not d!70695) (not b!339821) (not b!339839) (not bm!26504) (not b!339767) (not b!339737) (not b!339778) (not b!339841) (not b!339823) (not b_lambda!8419) (not b!339768) (not b_next!7171) (not bm!26486) (not d!70683) (not b!339776) (not d!70697) (not b!339757) (not b!339837))
(check-sat b_and!14347 (not b_next!7171))
