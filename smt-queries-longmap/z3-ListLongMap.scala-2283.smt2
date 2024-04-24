; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37146 () Bool)

(assert start!37146)

(declare-fun b_free!8287 () Bool)

(declare-fun b_next!8287 () Bool)

(assert (=> start!37146 (= b_free!8287 (not b_next!8287))))

(declare-fun tp!29577 () Bool)

(declare-fun b_and!15543 () Bool)

(assert (=> start!37146 (= tp!29577 b_and!15543)))

(declare-fun b!374843 () Bool)

(declare-fun res!211512 () Bool)

(declare-fun e!228412 () Bool)

(assert (=> b!374843 (=> (not res!211512) (not e!228412))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13019 0))(
  ( (V!13020 (val!4512 Int)) )
))
(declare-datatypes ((ValueCell!4124 0))(
  ( (ValueCellFull!4124 (v!6710 V!13019)) (EmptyCell!4124) )
))
(declare-datatypes ((array!21790 0))(
  ( (array!21791 (arr!10363 (Array (_ BitVec 32) ValueCell!4124)) (size!10715 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21790)

(declare-datatypes ((array!21792 0))(
  ( (array!21793 (arr!10364 (Array (_ BitVec 32) (_ BitVec 64))) (size!10716 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21792)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!374843 (= res!211512 (and (= (size!10715 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10716 _keys!658) (size!10715 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374844 () Bool)

(declare-fun res!211513 () Bool)

(assert (=> b!374844 (=> (not res!211513) (not e!228412))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374844 (= res!211513 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10716 _keys!658))))))

(declare-fun b!374845 () Bool)

(declare-fun res!211506 () Bool)

(assert (=> b!374845 (=> (not res!211506) (not e!228412))))

(assert (=> b!374845 (= res!211506 (or (= (select (arr!10364 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10364 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374846 () Bool)

(declare-fun e!228411 () Bool)

(assert (=> b!374846 (= e!228411 true)))

(declare-datatypes ((tuple2!5906 0))(
  ( (tuple2!5907 (_1!2964 (_ BitVec 64)) (_2!2964 V!13019)) )
))
(declare-datatypes ((List!5749 0))(
  ( (Nil!5746) (Cons!5745 (h!6601 tuple2!5906) (t!10891 List!5749)) )
))
(declare-datatypes ((ListLongMap!4821 0))(
  ( (ListLongMap!4822 (toList!2426 List!5749)) )
))
(declare-fun lt!173152 () ListLongMap!4821)

(declare-fun lt!173156 () ListLongMap!4821)

(declare-fun lt!173147 () tuple2!5906)

(declare-fun lt!173154 () tuple2!5906)

(declare-fun +!822 (ListLongMap!4821 tuple2!5906) ListLongMap!4821)

(assert (=> b!374846 (= (+!822 lt!173156 lt!173154) (+!822 lt!173152 lt!173147))))

(declare-fun v!373 () V!13019)

(declare-fun lt!173157 () ListLongMap!4821)

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11533 0))(
  ( (Unit!11534) )
))
(declare-fun lt!173153 () Unit!11533)

(declare-fun minValue!472 () V!13019)

(declare-fun addCommutativeForDiffKeys!250 (ListLongMap!4821 (_ BitVec 64) V!13019 (_ BitVec 64) V!13019) Unit!11533)

(assert (=> b!374846 (= lt!173153 (addCommutativeForDiffKeys!250 lt!173157 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374847 () Bool)

(declare-fun e!228410 () Bool)

(declare-fun e!228414 () Bool)

(assert (=> b!374847 (= e!228410 (not e!228414))))

(declare-fun res!211505 () Bool)

(assert (=> b!374847 (=> res!211505 e!228414)))

(assert (=> b!374847 (= res!211505 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13019)

(declare-fun lt!173158 () ListLongMap!4821)

(declare-fun getCurrentListMap!1883 (array!21792 array!21790 (_ BitVec 32) (_ BitVec 32) V!13019 V!13019 (_ BitVec 32) Int) ListLongMap!4821)

(assert (=> b!374847 (= lt!173158 (getCurrentListMap!1883 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173143 () array!21792)

(declare-fun lt!173144 () array!21790)

(declare-fun lt!173151 () ListLongMap!4821)

(assert (=> b!374847 (= lt!173151 (getCurrentListMap!1883 lt!173143 lt!173144 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173146 () ListLongMap!4821)

(declare-fun lt!173155 () ListLongMap!4821)

(assert (=> b!374847 (and (= lt!173146 lt!173155) (= lt!173155 lt!173146))))

(declare-fun lt!173142 () ListLongMap!4821)

(assert (=> b!374847 (= lt!173155 (+!822 lt!173142 lt!173147))))

(assert (=> b!374847 (= lt!173147 (tuple2!5907 k0!778 v!373))))

(declare-fun lt!173148 () Unit!11533)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!70 (array!21792 array!21790 (_ BitVec 32) (_ BitVec 32) V!13019 V!13019 (_ BitVec 32) (_ BitVec 64) V!13019 (_ BitVec 32) Int) Unit!11533)

(assert (=> b!374847 (= lt!173148 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!70 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!730 (array!21792 array!21790 (_ BitVec 32) (_ BitVec 32) V!13019 V!13019 (_ BitVec 32) Int) ListLongMap!4821)

(assert (=> b!374847 (= lt!173146 (getCurrentListMapNoExtraKeys!730 lt!173143 lt!173144 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374847 (= lt!173144 (array!21791 (store (arr!10363 _values!506) i!548 (ValueCellFull!4124 v!373)) (size!10715 _values!506)))))

(assert (=> b!374847 (= lt!173142 (getCurrentListMapNoExtraKeys!730 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!211511 () Bool)

(assert (=> start!37146 (=> (not res!211511) (not e!228412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37146 (= res!211511 (validMask!0 mask!970))))

(assert (=> start!37146 e!228412))

(declare-fun e!228409 () Bool)

(declare-fun array_inv!7692 (array!21790) Bool)

(assert (=> start!37146 (and (array_inv!7692 _values!506) e!228409)))

(assert (=> start!37146 tp!29577))

(assert (=> start!37146 true))

(declare-fun tp_is_empty!8935 () Bool)

(assert (=> start!37146 tp_is_empty!8935))

(declare-fun array_inv!7693 (array!21792) Bool)

(assert (=> start!37146 (array_inv!7693 _keys!658)))

(declare-fun b!374848 () Bool)

(declare-fun e!228407 () Bool)

(assert (=> b!374848 (= e!228407 tp_is_empty!8935)))

(declare-fun b!374849 () Bool)

(declare-fun res!211507 () Bool)

(assert (=> b!374849 (=> (not res!211507) (not e!228412))))

(declare-fun arrayContainsKey!0 (array!21792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374849 (= res!211507 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374850 () Bool)

(declare-fun res!211510 () Bool)

(assert (=> b!374850 (=> (not res!211510) (not e!228412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374850 (= res!211510 (validKeyInArray!0 k0!778))))

(declare-fun b!374851 () Bool)

(declare-fun e!228408 () Bool)

(assert (=> b!374851 (= e!228408 tp_is_empty!8935)))

(declare-fun mapNonEmpty!14967 () Bool)

(declare-fun mapRes!14967 () Bool)

(declare-fun tp!29576 () Bool)

(assert (=> mapNonEmpty!14967 (= mapRes!14967 (and tp!29576 e!228407))))

(declare-fun mapRest!14967 () (Array (_ BitVec 32) ValueCell!4124))

(declare-fun mapKey!14967 () (_ BitVec 32))

(declare-fun mapValue!14967 () ValueCell!4124)

(assert (=> mapNonEmpty!14967 (= (arr!10363 _values!506) (store mapRest!14967 mapKey!14967 mapValue!14967))))

(declare-fun b!374852 () Bool)

(declare-fun res!211509 () Bool)

(assert (=> b!374852 (=> (not res!211509) (not e!228410))))

(declare-datatypes ((List!5750 0))(
  ( (Nil!5747) (Cons!5746 (h!6602 (_ BitVec 64)) (t!10892 List!5750)) )
))
(declare-fun arrayNoDuplicates!0 (array!21792 (_ BitVec 32) List!5750) Bool)

(assert (=> b!374852 (= res!211509 (arrayNoDuplicates!0 lt!173143 #b00000000000000000000000000000000 Nil!5747))))

(declare-fun b!374853 () Bool)

(declare-fun res!211504 () Bool)

(assert (=> b!374853 (=> (not res!211504) (not e!228412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21792 (_ BitVec 32)) Bool)

(assert (=> b!374853 (= res!211504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374854 () Bool)

(declare-fun res!211503 () Bool)

(assert (=> b!374854 (=> (not res!211503) (not e!228412))))

(assert (=> b!374854 (= res!211503 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5747))))

(declare-fun mapIsEmpty!14967 () Bool)

(assert (=> mapIsEmpty!14967 mapRes!14967))

(declare-fun b!374855 () Bool)

(assert (=> b!374855 (= e!228409 (and e!228408 mapRes!14967))))

(declare-fun condMapEmpty!14967 () Bool)

(declare-fun mapDefault!14967 () ValueCell!4124)

(assert (=> b!374855 (= condMapEmpty!14967 (= (arr!10363 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4124)) mapDefault!14967)))))

(declare-fun b!374856 () Bool)

(assert (=> b!374856 (= e!228414 e!228411)))

(declare-fun res!211508 () Bool)

(assert (=> b!374856 (=> res!211508 e!228411)))

(assert (=> b!374856 (= res!211508 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173145 () ListLongMap!4821)

(assert (=> b!374856 (= lt!173145 lt!173156)))

(assert (=> b!374856 (= lt!173156 (+!822 lt!173157 lt!173147))))

(declare-fun lt!173150 () Unit!11533)

(assert (=> b!374856 (= lt!173150 (addCommutativeForDiffKeys!250 lt!173142 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374856 (= lt!173151 (+!822 lt!173145 lt!173154))))

(declare-fun lt!173149 () tuple2!5906)

(assert (=> b!374856 (= lt!173145 (+!822 lt!173155 lt!173149))))

(assert (=> b!374856 (= lt!173158 lt!173152)))

(assert (=> b!374856 (= lt!173152 (+!822 lt!173157 lt!173154))))

(assert (=> b!374856 (= lt!173157 (+!822 lt!173142 lt!173149))))

(assert (=> b!374856 (= lt!173151 (+!822 (+!822 lt!173146 lt!173149) lt!173154))))

(assert (=> b!374856 (= lt!173154 (tuple2!5907 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374856 (= lt!173149 (tuple2!5907 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374857 () Bool)

(assert (=> b!374857 (= e!228412 e!228410)))

(declare-fun res!211514 () Bool)

(assert (=> b!374857 (=> (not res!211514) (not e!228410))))

(assert (=> b!374857 (= res!211514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173143 mask!970))))

(assert (=> b!374857 (= lt!173143 (array!21793 (store (arr!10364 _keys!658) i!548 k0!778) (size!10716 _keys!658)))))

(assert (= (and start!37146 res!211511) b!374843))

(assert (= (and b!374843 res!211512) b!374853))

(assert (= (and b!374853 res!211504) b!374854))

(assert (= (and b!374854 res!211503) b!374844))

(assert (= (and b!374844 res!211513) b!374850))

(assert (= (and b!374850 res!211510) b!374845))

(assert (= (and b!374845 res!211506) b!374849))

(assert (= (and b!374849 res!211507) b!374857))

(assert (= (and b!374857 res!211514) b!374852))

(assert (= (and b!374852 res!211509) b!374847))

(assert (= (and b!374847 (not res!211505)) b!374856))

(assert (= (and b!374856 (not res!211508)) b!374846))

(assert (= (and b!374855 condMapEmpty!14967) mapIsEmpty!14967))

(assert (= (and b!374855 (not condMapEmpty!14967)) mapNonEmpty!14967))

(get-info :version)

(assert (= (and mapNonEmpty!14967 ((_ is ValueCellFull!4124) mapValue!14967)) b!374848))

(assert (= (and b!374855 ((_ is ValueCellFull!4124) mapDefault!14967)) b!374851))

(assert (= start!37146 b!374855))

(declare-fun m!371525 () Bool)

(assert (=> b!374854 m!371525))

(declare-fun m!371527 () Bool)

(assert (=> b!374852 m!371527))

(declare-fun m!371529 () Bool)

(assert (=> mapNonEmpty!14967 m!371529))

(declare-fun m!371531 () Bool)

(assert (=> b!374856 m!371531))

(declare-fun m!371533 () Bool)

(assert (=> b!374856 m!371533))

(declare-fun m!371535 () Bool)

(assert (=> b!374856 m!371535))

(declare-fun m!371537 () Bool)

(assert (=> b!374856 m!371537))

(declare-fun m!371539 () Bool)

(assert (=> b!374856 m!371539))

(declare-fun m!371541 () Bool)

(assert (=> b!374856 m!371541))

(assert (=> b!374856 m!371539))

(declare-fun m!371543 () Bool)

(assert (=> b!374856 m!371543))

(declare-fun m!371545 () Bool)

(assert (=> b!374856 m!371545))

(declare-fun m!371547 () Bool)

(assert (=> b!374846 m!371547))

(declare-fun m!371549 () Bool)

(assert (=> b!374846 m!371549))

(declare-fun m!371551 () Bool)

(assert (=> b!374846 m!371551))

(declare-fun m!371553 () Bool)

(assert (=> b!374849 m!371553))

(declare-fun m!371555 () Bool)

(assert (=> b!374850 m!371555))

(declare-fun m!371557 () Bool)

(assert (=> b!374857 m!371557))

(declare-fun m!371559 () Bool)

(assert (=> b!374857 m!371559))

(declare-fun m!371561 () Bool)

(assert (=> b!374847 m!371561))

(declare-fun m!371563 () Bool)

(assert (=> b!374847 m!371563))

(declare-fun m!371565 () Bool)

(assert (=> b!374847 m!371565))

(declare-fun m!371567 () Bool)

(assert (=> b!374847 m!371567))

(declare-fun m!371569 () Bool)

(assert (=> b!374847 m!371569))

(declare-fun m!371571 () Bool)

(assert (=> b!374847 m!371571))

(declare-fun m!371573 () Bool)

(assert (=> b!374847 m!371573))

(declare-fun m!371575 () Bool)

(assert (=> start!37146 m!371575))

(declare-fun m!371577 () Bool)

(assert (=> start!37146 m!371577))

(declare-fun m!371579 () Bool)

(assert (=> start!37146 m!371579))

(declare-fun m!371581 () Bool)

(assert (=> b!374845 m!371581))

(declare-fun m!371583 () Bool)

(assert (=> b!374853 m!371583))

(check-sat (not b_next!8287) b_and!15543 (not b!374857) (not mapNonEmpty!14967) tp_is_empty!8935 (not b!374853) (not b!374850) (not b!374852) (not b!374854) (not b!374846) (not b!374849) (not start!37146) (not b!374856) (not b!374847))
(check-sat b_and!15543 (not b_next!8287))
