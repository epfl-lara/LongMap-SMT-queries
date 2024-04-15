; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37002 () Bool)

(assert start!37002)

(declare-fun b_free!8143 () Bool)

(declare-fun b_next!8143 () Bool)

(assert (=> start!37002 (= b_free!8143 (not b_next!8143))))

(declare-fun tp!29144 () Bool)

(declare-fun b_and!15359 () Bool)

(assert (=> start!37002 (= tp!29144 b_and!15359)))

(declare-fun b!371557 () Bool)

(declare-fun res!208964 () Bool)

(declare-fun e!226722 () Bool)

(assert (=> b!371557 (=> (not res!208964) (not e!226722))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12827 0))(
  ( (V!12828 (val!4440 Int)) )
))
(declare-datatypes ((ValueCell!4052 0))(
  ( (ValueCellFull!4052 (v!6631 V!12827)) (EmptyCell!4052) )
))
(declare-datatypes ((array!21507 0))(
  ( (array!21508 (arr!10222 (Array (_ BitVec 32) ValueCell!4052)) (size!10575 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21507)

(declare-datatypes ((array!21509 0))(
  ( (array!21510 (arr!10223 (Array (_ BitVec 32) (_ BitVec 64))) (size!10576 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21509)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!371557 (= res!208964 (and (= (size!10575 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10576 _keys!658) (size!10575 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14751 () Bool)

(declare-fun mapRes!14751 () Bool)

(assert (=> mapIsEmpty!14751 mapRes!14751))

(declare-fun res!208968 () Bool)

(assert (=> start!37002 (=> (not res!208968) (not e!226722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37002 (= res!208968 (validMask!0 mask!970))))

(assert (=> start!37002 e!226722))

(declare-fun e!226727 () Bool)

(declare-fun array_inv!7552 (array!21507) Bool)

(assert (=> start!37002 (and (array_inv!7552 _values!506) e!226727)))

(assert (=> start!37002 tp!29144))

(assert (=> start!37002 true))

(declare-fun tp_is_empty!8791 () Bool)

(assert (=> start!37002 tp_is_empty!8791))

(declare-fun array_inv!7553 (array!21509) Bool)

(assert (=> start!37002 (array_inv!7553 _keys!658)))

(declare-fun b!371558 () Bool)

(declare-fun e!226724 () Bool)

(assert (=> b!371558 (= e!226724 tp_is_empty!8791)))

(declare-fun b!371559 () Bool)

(declare-fun res!208962 () Bool)

(declare-fun e!226723 () Bool)

(assert (=> b!371559 (=> (not res!208962) (not e!226723))))

(declare-fun lt!170202 () array!21509)

(declare-datatypes ((List!5700 0))(
  ( (Nil!5697) (Cons!5696 (h!6552 (_ BitVec 64)) (t!10841 List!5700)) )
))
(declare-fun arrayNoDuplicates!0 (array!21509 (_ BitVec 32) List!5700) Bool)

(assert (=> b!371559 (= res!208962 (arrayNoDuplicates!0 lt!170202 #b00000000000000000000000000000000 Nil!5697))))

(declare-fun b!371560 () Bool)

(declare-fun res!208970 () Bool)

(assert (=> b!371560 (=> (not res!208970) (not e!226722))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371560 (= res!208970 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371561 () Bool)

(declare-fun e!226726 () Bool)

(assert (=> b!371561 (= e!226726 tp_is_empty!8791)))

(declare-fun b!371562 () Bool)

(assert (=> b!371562 (= e!226722 e!226723)))

(declare-fun res!208969 () Bool)

(assert (=> b!371562 (=> (not res!208969) (not e!226723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21509 (_ BitVec 32)) Bool)

(assert (=> b!371562 (= res!208969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170202 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371562 (= lt!170202 (array!21510 (store (arr!10223 _keys!658) i!548 k0!778) (size!10576 _keys!658)))))

(declare-fun b!371563 () Bool)

(assert (=> b!371563 (= e!226727 (and e!226726 mapRes!14751))))

(declare-fun condMapEmpty!14751 () Bool)

(declare-fun mapDefault!14751 () ValueCell!4052)

(assert (=> b!371563 (= condMapEmpty!14751 (= (arr!10222 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4052)) mapDefault!14751)))))

(declare-fun b!371564 () Bool)

(declare-fun res!208965 () Bool)

(assert (=> b!371564 (=> (not res!208965) (not e!226722))))

(assert (=> b!371564 (= res!208965 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5697))))

(declare-fun mapNonEmpty!14751 () Bool)

(declare-fun tp!29145 () Bool)

(assert (=> mapNonEmpty!14751 (= mapRes!14751 (and tp!29145 e!226724))))

(declare-fun mapKey!14751 () (_ BitVec 32))

(declare-fun mapRest!14751 () (Array (_ BitVec 32) ValueCell!4052))

(declare-fun mapValue!14751 () ValueCell!4052)

(assert (=> mapNonEmpty!14751 (= (arr!10222 _values!506) (store mapRest!14751 mapKey!14751 mapValue!14751))))

(declare-fun b!371565 () Bool)

(declare-fun res!208966 () Bool)

(assert (=> b!371565 (=> (not res!208966) (not e!226722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371565 (= res!208966 (validKeyInArray!0 k0!778))))

(declare-fun b!371566 () Bool)

(declare-fun res!208967 () Bool)

(assert (=> b!371566 (=> (not res!208967) (not e!226722))))

(assert (=> b!371566 (= res!208967 (or (= (select (arr!10223 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10223 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371567 () Bool)

(assert (=> b!371567 (= e!226723 (not (bvsle #b00000000000000000000000000000000 (size!10576 _keys!658))))))

(declare-datatypes ((tuple2!5864 0))(
  ( (tuple2!5865 (_1!2943 (_ BitVec 64)) (_2!2943 V!12827)) )
))
(declare-datatypes ((List!5701 0))(
  ( (Nil!5698) (Cons!5697 (h!6553 tuple2!5864) (t!10842 List!5701)) )
))
(declare-datatypes ((ListLongMap!4767 0))(
  ( (ListLongMap!4768 (toList!2399 List!5701)) )
))
(declare-fun lt!170205 () ListLongMap!4767)

(declare-fun lt!170204 () ListLongMap!4767)

(assert (=> b!371567 (and (= lt!170205 lt!170204) (= lt!170204 lt!170205))))

(declare-fun v!373 () V!12827)

(declare-fun lt!170201 () ListLongMap!4767)

(declare-fun +!767 (ListLongMap!4767 tuple2!5864) ListLongMap!4767)

(assert (=> b!371567 (= lt!170204 (+!767 lt!170201 (tuple2!5865 k0!778 v!373)))))

(declare-datatypes ((Unit!11410 0))(
  ( (Unit!11411) )
))
(declare-fun lt!170203 () Unit!11410)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12827)

(declare-fun minValue!472 () V!12827)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!18 (array!21509 array!21507 (_ BitVec 32) (_ BitVec 32) V!12827 V!12827 (_ BitVec 32) (_ BitVec 64) V!12827 (_ BitVec 32) Int) Unit!11410)

(assert (=> b!371567 (= lt!170203 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!18 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!690 (array!21509 array!21507 (_ BitVec 32) (_ BitVec 32) V!12827 V!12827 (_ BitVec 32) Int) ListLongMap!4767)

(assert (=> b!371567 (= lt!170205 (getCurrentListMapNoExtraKeys!690 lt!170202 (array!21508 (store (arr!10222 _values!506) i!548 (ValueCellFull!4052 v!373)) (size!10575 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371567 (= lt!170201 (getCurrentListMapNoExtraKeys!690 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371568 () Bool)

(declare-fun res!208963 () Bool)

(assert (=> b!371568 (=> (not res!208963) (not e!226722))))

(assert (=> b!371568 (= res!208963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371569 () Bool)

(declare-fun res!208961 () Bool)

(assert (=> b!371569 (=> (not res!208961) (not e!226722))))

(assert (=> b!371569 (= res!208961 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10576 _keys!658))))))

(assert (= (and start!37002 res!208968) b!371557))

(assert (= (and b!371557 res!208964) b!371568))

(assert (= (and b!371568 res!208963) b!371564))

(assert (= (and b!371564 res!208965) b!371569))

(assert (= (and b!371569 res!208961) b!371565))

(assert (= (and b!371565 res!208966) b!371566))

(assert (= (and b!371566 res!208967) b!371560))

(assert (= (and b!371560 res!208970) b!371562))

(assert (= (and b!371562 res!208969) b!371559))

(assert (= (and b!371559 res!208962) b!371567))

(assert (= (and b!371563 condMapEmpty!14751) mapIsEmpty!14751))

(assert (= (and b!371563 (not condMapEmpty!14751)) mapNonEmpty!14751))

(get-info :version)

(assert (= (and mapNonEmpty!14751 ((_ is ValueCellFull!4052) mapValue!14751)) b!371558))

(assert (= (and b!371563 ((_ is ValueCellFull!4052) mapDefault!14751)) b!371561))

(assert (= start!37002 b!371563))

(declare-fun m!367025 () Bool)

(assert (=> b!371568 m!367025))

(declare-fun m!367027 () Bool)

(assert (=> start!37002 m!367027))

(declare-fun m!367029 () Bool)

(assert (=> start!37002 m!367029))

(declare-fun m!367031 () Bool)

(assert (=> start!37002 m!367031))

(declare-fun m!367033 () Bool)

(assert (=> b!371560 m!367033))

(declare-fun m!367035 () Bool)

(assert (=> b!371559 m!367035))

(declare-fun m!367037 () Bool)

(assert (=> b!371567 m!367037))

(declare-fun m!367039 () Bool)

(assert (=> b!371567 m!367039))

(declare-fun m!367041 () Bool)

(assert (=> b!371567 m!367041))

(declare-fun m!367043 () Bool)

(assert (=> b!371567 m!367043))

(declare-fun m!367045 () Bool)

(assert (=> b!371567 m!367045))

(declare-fun m!367047 () Bool)

(assert (=> mapNonEmpty!14751 m!367047))

(declare-fun m!367049 () Bool)

(assert (=> b!371562 m!367049))

(declare-fun m!367051 () Bool)

(assert (=> b!371562 m!367051))

(declare-fun m!367053 () Bool)

(assert (=> b!371564 m!367053))

(declare-fun m!367055 () Bool)

(assert (=> b!371566 m!367055))

(declare-fun m!367057 () Bool)

(assert (=> b!371565 m!367057))

(check-sat tp_is_empty!8791 (not b!371564) (not b!371567) (not b!371565) (not start!37002) (not b!371560) (not b!371568) (not b!371559) (not mapNonEmpty!14751) b_and!15359 (not b_next!8143) (not b!371562))
(check-sat b_and!15359 (not b_next!8143))
