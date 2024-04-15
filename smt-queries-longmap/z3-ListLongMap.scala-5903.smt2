; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76314 () Bool)

(assert start!76314)

(declare-fun b!895500 () Bool)

(declare-fun b_free!15919 () Bool)

(declare-fun b_next!15919 () Bool)

(assert (=> b!895500 (= b_free!15919 (not b_next!15919))))

(declare-fun tp!55773 () Bool)

(declare-fun b_and!26185 () Bool)

(assert (=> b!895500 (= tp!55773 b_and!26185)))

(declare-fun b!895494 () Bool)

(declare-fun e!500372 () Bool)

(declare-fun e!500371 () Bool)

(assert (=> b!895494 (= e!500372 e!500371)))

(declare-fun res!605737 () Bool)

(assert (=> b!895494 (=> (not res!605737) (not e!500371))))

(declare-datatypes ((array!52483 0))(
  ( (array!52484 (arr!25235 (Array (_ BitVec 32) (_ BitVec 64))) (size!25687 (_ BitVec 32))) )
))
(declare-datatypes ((V!29295 0))(
  ( (V!29296 (val!9174 Int)) )
))
(declare-datatypes ((ValueCell!8642 0))(
  ( (ValueCellFull!8642 (v!11661 V!29295)) (EmptyCell!8642) )
))
(declare-datatypes ((array!52485 0))(
  ( (array!52486 (arr!25236 (Array (_ BitVec 32) ValueCell!8642)) (size!25688 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4300 0))(
  ( (LongMapFixedSize!4301 (defaultEntry!5362 Int) (mask!25964 (_ BitVec 32)) (extraKeys!5058 (_ BitVec 32)) (zeroValue!5162 V!29295) (minValue!5162 V!29295) (_size!2205 (_ BitVec 32)) (_keys!10076 array!52483) (_values!5349 array!52485) (_vacant!2205 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4300)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895494 (= res!605737 (validMask!0 (mask!25964 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8889 0))(
  ( (MissingZero!8889 (index!37927 (_ BitVec 32))) (Found!8889 (index!37928 (_ BitVec 32))) (Intermediate!8889 (undefined!9701 Bool) (index!37929 (_ BitVec 32)) (x!76228 (_ BitVec 32))) (Undefined!8889) (MissingVacant!8889 (index!37930 (_ BitVec 32))) )
))
(declare-fun lt!404357 () SeekEntryResult!8889)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52483 (_ BitVec 32)) SeekEntryResult!8889)

(assert (=> b!895494 (= lt!404357 (seekEntry!0 key!785 (_keys!10076 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun mapNonEmpty!28972 () Bool)

(declare-fun mapRes!28972 () Bool)

(declare-fun tp!55774 () Bool)

(declare-fun e!500369 () Bool)

(assert (=> mapNonEmpty!28972 (= mapRes!28972 (and tp!55774 e!500369))))

(declare-fun mapRest!28972 () (Array (_ BitVec 32) ValueCell!8642))

(declare-fun mapValue!28972 () ValueCell!8642)

(declare-fun mapKey!28972 () (_ BitVec 32))

(assert (=> mapNonEmpty!28972 (= (arr!25236 (_values!5349 thiss!1181)) (store mapRest!28972 mapKey!28972 mapValue!28972))))

(declare-fun b!895495 () Bool)

(declare-fun e!500368 () Bool)

(declare-fun e!500370 () Bool)

(assert (=> b!895495 (= e!500368 (and e!500370 mapRes!28972))))

(declare-fun condMapEmpty!28972 () Bool)

(declare-fun mapDefault!28972 () ValueCell!8642)

(assert (=> b!895495 (= condMapEmpty!28972 (= (arr!25236 (_values!5349 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8642)) mapDefault!28972)))))

(declare-fun b!895496 () Bool)

(declare-fun res!605738 () Bool)

(assert (=> b!895496 (=> (not res!605738) (not e!500371))))

(assert (=> b!895496 (= res!605738 (and (= (size!25688 (_values!5349 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25964 thiss!1181))) (= (size!25687 (_keys!10076 thiss!1181)) (size!25688 (_values!5349 thiss!1181))) (bvsge (mask!25964 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5058 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5058 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!895497 () Bool)

(declare-fun res!605739 () Bool)

(assert (=> b!895497 (=> (not res!605739) (not e!500371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52483 (_ BitVec 32)) Bool)

(assert (=> b!895497 (= res!605739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10076 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun b!895498 () Bool)

(declare-fun res!605736 () Bool)

(assert (=> b!895498 (=> (not res!605736) (not e!500371))))

(declare-datatypes ((List!17824 0))(
  ( (Nil!17821) (Cons!17820 (h!18957 (_ BitVec 64)) (t!25154 List!17824)) )
))
(declare-fun arrayNoDuplicates!0 (array!52483 (_ BitVec 32) List!17824) Bool)

(assert (=> b!895498 (= res!605736 (arrayNoDuplicates!0 (_keys!10076 thiss!1181) #b00000000000000000000000000000000 Nil!17821))))

(declare-fun res!605734 () Bool)

(assert (=> start!76314 (=> (not res!605734) (not e!500372))))

(declare-fun valid!1665 (LongMapFixedSize!4300) Bool)

(assert (=> start!76314 (= res!605734 (valid!1665 thiss!1181))))

(assert (=> start!76314 e!500372))

(declare-fun e!500373 () Bool)

(assert (=> start!76314 e!500373))

(assert (=> start!76314 true))

(declare-fun mapIsEmpty!28972 () Bool)

(assert (=> mapIsEmpty!28972 mapRes!28972))

(declare-fun b!895499 () Bool)

(declare-fun tp_is_empty!18247 () Bool)

(assert (=> b!895499 (= e!500369 tp_is_empty!18247)))

(declare-fun array_inv!19864 (array!52483) Bool)

(declare-fun array_inv!19865 (array!52485) Bool)

(assert (=> b!895500 (= e!500373 (and tp!55773 tp_is_empty!18247 (array_inv!19864 (_keys!10076 thiss!1181)) (array_inv!19865 (_values!5349 thiss!1181)) e!500368))))

(declare-fun b!895501 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895501 (= e!500371 (not (validKeyInArray!0 key!785)))))

(declare-fun b!895502 () Bool)

(declare-fun res!605735 () Bool)

(assert (=> b!895502 (=> (not res!605735) (not e!500372))))

(assert (=> b!895502 (= res!605735 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895503 () Bool)

(assert (=> b!895503 (= e!500370 tp_is_empty!18247)))

(assert (= (and start!76314 res!605734) b!895502))

(assert (= (and b!895502 res!605735) b!895494))

(assert (= (and b!895494 res!605737) b!895496))

(assert (= (and b!895496 res!605738) b!895497))

(assert (= (and b!895497 res!605739) b!895498))

(assert (= (and b!895498 res!605736) b!895501))

(assert (= (and b!895495 condMapEmpty!28972) mapIsEmpty!28972))

(assert (= (and b!895495 (not condMapEmpty!28972)) mapNonEmpty!28972))

(get-info :version)

(assert (= (and mapNonEmpty!28972 ((_ is ValueCellFull!8642) mapValue!28972)) b!895499))

(assert (= (and b!895495 ((_ is ValueCellFull!8642) mapDefault!28972)) b!895503))

(assert (= b!895500 b!895495))

(assert (= start!76314 b!895500))

(declare-fun m!832423 () Bool)

(assert (=> b!895497 m!832423))

(declare-fun m!832425 () Bool)

(assert (=> mapNonEmpty!28972 m!832425))

(declare-fun m!832427 () Bool)

(assert (=> b!895500 m!832427))

(declare-fun m!832429 () Bool)

(assert (=> b!895500 m!832429))

(declare-fun m!832431 () Bool)

(assert (=> b!895498 m!832431))

(declare-fun m!832433 () Bool)

(assert (=> start!76314 m!832433))

(declare-fun m!832435 () Bool)

(assert (=> b!895494 m!832435))

(declare-fun m!832437 () Bool)

(assert (=> b!895494 m!832437))

(declare-fun m!832439 () Bool)

(assert (=> b!895501 m!832439))

(check-sat (not mapNonEmpty!28972) (not b!895501) (not b!895498) tp_is_empty!18247 (not b!895494) (not b!895500) (not b!895497) (not start!76314) b_and!26185 (not b_next!15919))
(check-sat b_and!26185 (not b_next!15919))
(get-model)

(declare-fun b!895574 () Bool)

(declare-fun e!500426 () Bool)

(declare-fun call!39740 () Bool)

(assert (=> b!895574 (= e!500426 call!39740)))

(declare-fun b!895575 () Bool)

(declare-fun e!500427 () Bool)

(declare-fun contains!4369 (List!17824 (_ BitVec 64)) Bool)

(assert (=> b!895575 (= e!500427 (contains!4369 Nil!17821 (select (arr!25235 (_keys!10076 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39737 () Bool)

(declare-fun c!94539 () Bool)

(assert (=> bm!39737 (= call!39740 (arrayNoDuplicates!0 (_keys!10076 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94539 (Cons!17820 (select (arr!25235 (_keys!10076 thiss!1181)) #b00000000000000000000000000000000) Nil!17821) Nil!17821)))))

(declare-fun b!895576 () Bool)

(declare-fun e!500428 () Bool)

(assert (=> b!895576 (= e!500428 e!500426)))

(assert (=> b!895576 (= c!94539 (validKeyInArray!0 (select (arr!25235 (_keys!10076 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895577 () Bool)

(declare-fun e!500425 () Bool)

(assert (=> b!895577 (= e!500425 e!500428)))

(declare-fun res!605782 () Bool)

(assert (=> b!895577 (=> (not res!605782) (not e!500428))))

(assert (=> b!895577 (= res!605782 (not e!500427))))

(declare-fun res!605784 () Bool)

(assert (=> b!895577 (=> (not res!605784) (not e!500427))))

(assert (=> b!895577 (= res!605784 (validKeyInArray!0 (select (arr!25235 (_keys!10076 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110615 () Bool)

(declare-fun res!605783 () Bool)

(assert (=> d!110615 (=> res!605783 e!500425)))

(assert (=> d!110615 (= res!605783 (bvsge #b00000000000000000000000000000000 (size!25687 (_keys!10076 thiss!1181))))))

(assert (=> d!110615 (= (arrayNoDuplicates!0 (_keys!10076 thiss!1181) #b00000000000000000000000000000000 Nil!17821) e!500425)))

(declare-fun b!895578 () Bool)

(assert (=> b!895578 (= e!500426 call!39740)))

(assert (= (and d!110615 (not res!605783)) b!895577))

(assert (= (and b!895577 res!605784) b!895575))

(assert (= (and b!895577 res!605782) b!895576))

(assert (= (and b!895576 c!94539) b!895578))

(assert (= (and b!895576 (not c!94539)) b!895574))

(assert (= (or b!895578 b!895574) bm!39737))

(declare-fun m!832477 () Bool)

(assert (=> b!895575 m!832477))

(assert (=> b!895575 m!832477))

(declare-fun m!832479 () Bool)

(assert (=> b!895575 m!832479))

(assert (=> bm!39737 m!832477))

(declare-fun m!832481 () Bool)

(assert (=> bm!39737 m!832481))

(assert (=> b!895576 m!832477))

(assert (=> b!895576 m!832477))

(declare-fun m!832483 () Bool)

(assert (=> b!895576 m!832483))

(assert (=> b!895577 m!832477))

(assert (=> b!895577 m!832477))

(assert (=> b!895577 m!832483))

(assert (=> b!895498 d!110615))

(declare-fun d!110617 () Bool)

(assert (=> d!110617 (= (validMask!0 (mask!25964 thiss!1181)) (and (or (= (mask!25964 thiss!1181) #b00000000000000000000000000000111) (= (mask!25964 thiss!1181) #b00000000000000000000000000001111) (= (mask!25964 thiss!1181) #b00000000000000000000000000011111) (= (mask!25964 thiss!1181) #b00000000000000000000000000111111) (= (mask!25964 thiss!1181) #b00000000000000000000000001111111) (= (mask!25964 thiss!1181) #b00000000000000000000000011111111) (= (mask!25964 thiss!1181) #b00000000000000000000000111111111) (= (mask!25964 thiss!1181) #b00000000000000000000001111111111) (= (mask!25964 thiss!1181) #b00000000000000000000011111111111) (= (mask!25964 thiss!1181) #b00000000000000000000111111111111) (= (mask!25964 thiss!1181) #b00000000000000000001111111111111) (= (mask!25964 thiss!1181) #b00000000000000000011111111111111) (= (mask!25964 thiss!1181) #b00000000000000000111111111111111) (= (mask!25964 thiss!1181) #b00000000000000001111111111111111) (= (mask!25964 thiss!1181) #b00000000000000011111111111111111) (= (mask!25964 thiss!1181) #b00000000000000111111111111111111) (= (mask!25964 thiss!1181) #b00000000000001111111111111111111) (= (mask!25964 thiss!1181) #b00000000000011111111111111111111) (= (mask!25964 thiss!1181) #b00000000000111111111111111111111) (= (mask!25964 thiss!1181) #b00000000001111111111111111111111) (= (mask!25964 thiss!1181) #b00000000011111111111111111111111) (= (mask!25964 thiss!1181) #b00000000111111111111111111111111) (= (mask!25964 thiss!1181) #b00000001111111111111111111111111) (= (mask!25964 thiss!1181) #b00000011111111111111111111111111) (= (mask!25964 thiss!1181) #b00000111111111111111111111111111) (= (mask!25964 thiss!1181) #b00001111111111111111111111111111) (= (mask!25964 thiss!1181) #b00011111111111111111111111111111) (= (mask!25964 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25964 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895494 d!110617))

(declare-fun b!895591 () Bool)

(declare-fun c!94546 () Bool)

(declare-fun lt!404374 () (_ BitVec 64))

(assert (=> b!895591 (= c!94546 (= lt!404374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500437 () SeekEntryResult!8889)

(declare-fun e!500436 () SeekEntryResult!8889)

(assert (=> b!895591 (= e!500437 e!500436)))

(declare-fun b!895592 () Bool)

(declare-fun lt!404375 () SeekEntryResult!8889)

(assert (=> b!895592 (= e!500436 (MissingZero!8889 (index!37929 lt!404375)))))

(declare-fun b!895593 () Bool)

(declare-fun e!500435 () SeekEntryResult!8889)

(assert (=> b!895593 (= e!500435 Undefined!8889)))

(declare-fun b!895594 () Bool)

(assert (=> b!895594 (= e!500435 e!500437)))

(assert (=> b!895594 (= lt!404374 (select (arr!25235 (_keys!10076 thiss!1181)) (index!37929 lt!404375)))))

(declare-fun c!94548 () Bool)

(assert (=> b!895594 (= c!94548 (= lt!404374 key!785))))

(declare-fun d!110619 () Bool)

(declare-fun lt!404373 () SeekEntryResult!8889)

(assert (=> d!110619 (and (or ((_ is MissingVacant!8889) lt!404373) (not ((_ is Found!8889) lt!404373)) (and (bvsge (index!37928 lt!404373) #b00000000000000000000000000000000) (bvslt (index!37928 lt!404373) (size!25687 (_keys!10076 thiss!1181))))) (not ((_ is MissingVacant!8889) lt!404373)) (or (not ((_ is Found!8889) lt!404373)) (= (select (arr!25235 (_keys!10076 thiss!1181)) (index!37928 lt!404373)) key!785)))))

(assert (=> d!110619 (= lt!404373 e!500435)))

(declare-fun c!94547 () Bool)

(assert (=> d!110619 (= c!94547 (and ((_ is Intermediate!8889) lt!404375) (undefined!9701 lt!404375)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52483 (_ BitVec 32)) SeekEntryResult!8889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110619 (= lt!404375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25964 thiss!1181)) key!785 (_keys!10076 thiss!1181) (mask!25964 thiss!1181)))))

(assert (=> d!110619 (validMask!0 (mask!25964 thiss!1181))))

(assert (=> d!110619 (= (seekEntry!0 key!785 (_keys!10076 thiss!1181) (mask!25964 thiss!1181)) lt!404373)))

(declare-fun b!895595 () Bool)

(declare-fun lt!404372 () SeekEntryResult!8889)

(assert (=> b!895595 (= e!500436 (ite ((_ is MissingVacant!8889) lt!404372) (MissingZero!8889 (index!37930 lt!404372)) lt!404372))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52483 (_ BitVec 32)) SeekEntryResult!8889)

(assert (=> b!895595 (= lt!404372 (seekKeyOrZeroReturnVacant!0 (x!76228 lt!404375) (index!37929 lt!404375) (index!37929 lt!404375) key!785 (_keys!10076 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun b!895596 () Bool)

(assert (=> b!895596 (= e!500437 (Found!8889 (index!37929 lt!404375)))))

(assert (= (and d!110619 c!94547) b!895593))

(assert (= (and d!110619 (not c!94547)) b!895594))

(assert (= (and b!895594 c!94548) b!895596))

(assert (= (and b!895594 (not c!94548)) b!895591))

(assert (= (and b!895591 c!94546) b!895592))

(assert (= (and b!895591 (not c!94546)) b!895595))

(declare-fun m!832485 () Bool)

(assert (=> b!895594 m!832485))

(declare-fun m!832487 () Bool)

(assert (=> d!110619 m!832487))

(declare-fun m!832489 () Bool)

(assert (=> d!110619 m!832489))

(assert (=> d!110619 m!832489))

(declare-fun m!832491 () Bool)

(assert (=> d!110619 m!832491))

(assert (=> d!110619 m!832435))

(declare-fun m!832493 () Bool)

(assert (=> b!895595 m!832493))

(assert (=> b!895494 d!110619))

(declare-fun d!110621 () Bool)

(assert (=> d!110621 (= (validKeyInArray!0 key!785) (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!895501 d!110621))

(declare-fun bm!39740 () Bool)

(declare-fun call!39743 () Bool)

(assert (=> bm!39740 (= call!39743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10076 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun d!110623 () Bool)

(declare-fun res!605790 () Bool)

(declare-fun e!500445 () Bool)

(assert (=> d!110623 (=> res!605790 e!500445)))

(assert (=> d!110623 (= res!605790 (bvsge #b00000000000000000000000000000000 (size!25687 (_keys!10076 thiss!1181))))))

(assert (=> d!110623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10076 thiss!1181) (mask!25964 thiss!1181)) e!500445)))

(declare-fun b!895605 () Bool)

(declare-fun e!500444 () Bool)

(assert (=> b!895605 (= e!500445 e!500444)))

(declare-fun c!94551 () Bool)

(assert (=> b!895605 (= c!94551 (validKeyInArray!0 (select (arr!25235 (_keys!10076 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895606 () Bool)

(assert (=> b!895606 (= e!500444 call!39743)))

(declare-fun b!895607 () Bool)

(declare-fun e!500446 () Bool)

(assert (=> b!895607 (= e!500446 call!39743)))

(declare-fun b!895608 () Bool)

(assert (=> b!895608 (= e!500444 e!500446)))

(declare-fun lt!404383 () (_ BitVec 64))

(assert (=> b!895608 (= lt!404383 (select (arr!25235 (_keys!10076 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30410 0))(
  ( (Unit!30411) )
))
(declare-fun lt!404382 () Unit!30410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52483 (_ BitVec 64) (_ BitVec 32)) Unit!30410)

(assert (=> b!895608 (= lt!404382 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10076 thiss!1181) lt!404383 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895608 (arrayContainsKey!0 (_keys!10076 thiss!1181) lt!404383 #b00000000000000000000000000000000)))

(declare-fun lt!404384 () Unit!30410)

(assert (=> b!895608 (= lt!404384 lt!404382)))

(declare-fun res!605789 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52483 (_ BitVec 32)) SeekEntryResult!8889)

(assert (=> b!895608 (= res!605789 (= (seekEntryOrOpen!0 (select (arr!25235 (_keys!10076 thiss!1181)) #b00000000000000000000000000000000) (_keys!10076 thiss!1181) (mask!25964 thiss!1181)) (Found!8889 #b00000000000000000000000000000000)))))

(assert (=> b!895608 (=> (not res!605789) (not e!500446))))

(assert (= (and d!110623 (not res!605790)) b!895605))

(assert (= (and b!895605 c!94551) b!895608))

(assert (= (and b!895605 (not c!94551)) b!895606))

(assert (= (and b!895608 res!605789) b!895607))

(assert (= (or b!895607 b!895606) bm!39740))

(declare-fun m!832495 () Bool)

(assert (=> bm!39740 m!832495))

(assert (=> b!895605 m!832477))

(assert (=> b!895605 m!832477))

(assert (=> b!895605 m!832483))

(assert (=> b!895608 m!832477))

(declare-fun m!832497 () Bool)

(assert (=> b!895608 m!832497))

(declare-fun m!832499 () Bool)

(assert (=> b!895608 m!832499))

(assert (=> b!895608 m!832477))

(declare-fun m!832501 () Bool)

(assert (=> b!895608 m!832501))

(assert (=> b!895497 d!110623))

(declare-fun d!110625 () Bool)

(assert (=> d!110625 (= (array_inv!19864 (_keys!10076 thiss!1181)) (bvsge (size!25687 (_keys!10076 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895500 d!110625))

(declare-fun d!110627 () Bool)

(assert (=> d!110627 (= (array_inv!19865 (_values!5349 thiss!1181)) (bvsge (size!25688 (_values!5349 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895500 d!110627))

(declare-fun d!110629 () Bool)

(declare-fun res!605797 () Bool)

(declare-fun e!500449 () Bool)

(assert (=> d!110629 (=> (not res!605797) (not e!500449))))

(declare-fun simpleValid!308 (LongMapFixedSize!4300) Bool)

(assert (=> d!110629 (= res!605797 (simpleValid!308 thiss!1181))))

(assert (=> d!110629 (= (valid!1665 thiss!1181) e!500449)))

(declare-fun b!895615 () Bool)

(declare-fun res!605798 () Bool)

(assert (=> b!895615 (=> (not res!605798) (not e!500449))))

(declare-fun arrayCountValidKeys!0 (array!52483 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895615 (= res!605798 (= (arrayCountValidKeys!0 (_keys!10076 thiss!1181) #b00000000000000000000000000000000 (size!25687 (_keys!10076 thiss!1181))) (_size!2205 thiss!1181)))))

(declare-fun b!895616 () Bool)

(declare-fun res!605799 () Bool)

(assert (=> b!895616 (=> (not res!605799) (not e!500449))))

(assert (=> b!895616 (= res!605799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10076 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun b!895617 () Bool)

(assert (=> b!895617 (= e!500449 (arrayNoDuplicates!0 (_keys!10076 thiss!1181) #b00000000000000000000000000000000 Nil!17821))))

(assert (= (and d!110629 res!605797) b!895615))

(assert (= (and b!895615 res!605798) b!895616))

(assert (= (and b!895616 res!605799) b!895617))

(declare-fun m!832503 () Bool)

(assert (=> d!110629 m!832503))

(declare-fun m!832505 () Bool)

(assert (=> b!895615 m!832505))

(assert (=> b!895616 m!832423))

(assert (=> b!895617 m!832431))

(assert (=> start!76314 d!110629))

(declare-fun mapNonEmpty!28981 () Bool)

(declare-fun mapRes!28981 () Bool)

(declare-fun tp!55789 () Bool)

(declare-fun e!500454 () Bool)

(assert (=> mapNonEmpty!28981 (= mapRes!28981 (and tp!55789 e!500454))))

(declare-fun mapRest!28981 () (Array (_ BitVec 32) ValueCell!8642))

(declare-fun mapValue!28981 () ValueCell!8642)

(declare-fun mapKey!28981 () (_ BitVec 32))

(assert (=> mapNonEmpty!28981 (= mapRest!28972 (store mapRest!28981 mapKey!28981 mapValue!28981))))

(declare-fun condMapEmpty!28981 () Bool)

(declare-fun mapDefault!28981 () ValueCell!8642)

(assert (=> mapNonEmpty!28972 (= condMapEmpty!28981 (= mapRest!28972 ((as const (Array (_ BitVec 32) ValueCell!8642)) mapDefault!28981)))))

(declare-fun e!500455 () Bool)

(assert (=> mapNonEmpty!28972 (= tp!55774 (and e!500455 mapRes!28981))))

(declare-fun b!895624 () Bool)

(assert (=> b!895624 (= e!500454 tp_is_empty!18247)))

(declare-fun b!895625 () Bool)

(assert (=> b!895625 (= e!500455 tp_is_empty!18247)))

(declare-fun mapIsEmpty!28981 () Bool)

(assert (=> mapIsEmpty!28981 mapRes!28981))

(assert (= (and mapNonEmpty!28972 condMapEmpty!28981) mapIsEmpty!28981))

(assert (= (and mapNonEmpty!28972 (not condMapEmpty!28981)) mapNonEmpty!28981))

(assert (= (and mapNonEmpty!28981 ((_ is ValueCellFull!8642) mapValue!28981)) b!895624))

(assert (= (and mapNonEmpty!28972 ((_ is ValueCellFull!8642) mapDefault!28981)) b!895625))

(declare-fun m!832507 () Bool)

(assert (=> mapNonEmpty!28981 m!832507))

(check-sat (not mapNonEmpty!28981) (not b!895576) (not d!110619) (not b!895575) (not b!895616) (not d!110629) (not b!895608) (not b!895617) (not b!895615) (not bm!39740) b_and!26185 (not b!895605) tp_is_empty!18247 (not b!895577) (not b!895595) (not bm!39737) (not b_next!15919))
(check-sat b_and!26185 (not b_next!15919))
