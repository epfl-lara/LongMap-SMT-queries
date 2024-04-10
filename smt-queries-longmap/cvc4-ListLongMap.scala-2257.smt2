; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37008 () Bool)

(assert start!37008)

(declare-fun b_free!8135 () Bool)

(declare-fun b_next!8135 () Bool)

(assert (=> start!37008 (= b_free!8135 (not b_next!8135))))

(declare-fun tp!29120 () Bool)

(declare-fun b_and!15377 () Bool)

(assert (=> start!37008 (= tp!29120 b_and!15377)))

(declare-fun res!208973 () Bool)

(declare-fun e!226825 () Bool)

(assert (=> start!37008 (=> (not res!208973) (not e!226825))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37008 (= res!208973 (validMask!0 mask!970))))

(assert (=> start!37008 e!226825))

(declare-datatypes ((V!12815 0))(
  ( (V!12816 (val!4436 Int)) )
))
(declare-datatypes ((ValueCell!4048 0))(
  ( (ValueCellFull!4048 (v!6633 V!12815)) (EmptyCell!4048) )
))
(declare-datatypes ((array!21507 0))(
  ( (array!21508 (arr!10222 (Array (_ BitVec 32) ValueCell!4048)) (size!10574 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21507)

(declare-fun e!226828 () Bool)

(declare-fun array_inv!7546 (array!21507) Bool)

(assert (=> start!37008 (and (array_inv!7546 _values!506) e!226828)))

(assert (=> start!37008 tp!29120))

(assert (=> start!37008 true))

(declare-fun tp_is_empty!8783 () Bool)

(assert (=> start!37008 tp_is_empty!8783))

(declare-datatypes ((array!21509 0))(
  ( (array!21510 (arr!10223 (Array (_ BitVec 32) (_ BitVec 64))) (size!10575 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21509)

(declare-fun array_inv!7547 (array!21509) Bool)

(assert (=> start!37008 (array_inv!7547 _keys!658)))

(declare-fun b!371672 () Bool)

(declare-fun e!226827 () Bool)

(assert (=> b!371672 (= e!226825 e!226827)))

(declare-fun res!208977 () Bool)

(assert (=> b!371672 (=> (not res!208977) (not e!226827))))

(declare-fun lt!170375 () array!21509)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21509 (_ BitVec 32)) Bool)

(assert (=> b!371672 (= res!208977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170375 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371672 (= lt!170375 (array!21510 (store (arr!10223 _keys!658) i!548 k!778) (size!10575 _keys!658)))))

(declare-fun b!371673 () Bool)

(declare-fun e!226826 () Bool)

(assert (=> b!371673 (= e!226826 tp_is_empty!8783)))

(declare-fun b!371674 () Bool)

(declare-fun res!208976 () Bool)

(assert (=> b!371674 (=> (not res!208976) (not e!226825))))

(assert (=> b!371674 (= res!208976 (or (= (select (arr!10223 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10223 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14739 () Bool)

(declare-fun mapRes!14739 () Bool)

(assert (=> mapIsEmpty!14739 mapRes!14739))

(declare-fun b!371675 () Bool)

(declare-fun res!208979 () Bool)

(assert (=> b!371675 (=> (not res!208979) (not e!226827))))

(declare-datatypes ((List!5726 0))(
  ( (Nil!5723) (Cons!5722 (h!6578 (_ BitVec 64)) (t!10876 List!5726)) )
))
(declare-fun arrayNoDuplicates!0 (array!21509 (_ BitVec 32) List!5726) Bool)

(assert (=> b!371675 (= res!208979 (arrayNoDuplicates!0 lt!170375 #b00000000000000000000000000000000 Nil!5723))))

(declare-fun b!371676 () Bool)

(declare-fun e!226829 () Bool)

(assert (=> b!371676 (= e!226829 tp_is_empty!8783)))

(declare-fun b!371677 () Bool)

(declare-fun res!208971 () Bool)

(assert (=> b!371677 (=> (not res!208971) (not e!226825))))

(assert (=> b!371677 (= res!208971 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10575 _keys!658))))))

(declare-fun b!371678 () Bool)

(declare-fun res!208972 () Bool)

(assert (=> b!371678 (=> (not res!208972) (not e!226825))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371678 (= res!208972 (and (= (size!10574 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10575 _keys!658) (size!10574 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371679 () Bool)

(assert (=> b!371679 (= e!226827 (not true))))

(declare-datatypes ((tuple2!5886 0))(
  ( (tuple2!5887 (_1!2954 (_ BitVec 64)) (_2!2954 V!12815)) )
))
(declare-datatypes ((List!5727 0))(
  ( (Nil!5724) (Cons!5723 (h!6579 tuple2!5886) (t!10877 List!5727)) )
))
(declare-datatypes ((ListLongMap!4799 0))(
  ( (ListLongMap!4800 (toList!2415 List!5727)) )
))
(declare-fun lt!170379 () ListLongMap!4799)

(declare-fun lt!170378 () ListLongMap!4799)

(assert (=> b!371679 (and (= lt!170379 lt!170378) (= lt!170378 lt!170379))))

(declare-fun v!373 () V!12815)

(declare-fun lt!170377 () ListLongMap!4799)

(declare-fun +!761 (ListLongMap!4799 tuple2!5886) ListLongMap!4799)

(assert (=> b!371679 (= lt!170378 (+!761 lt!170377 (tuple2!5887 k!778 v!373)))))

(declare-fun zeroValue!472 () V!12815)

(declare-datatypes ((Unit!11428 0))(
  ( (Unit!11429) )
))
(declare-fun lt!170376 () Unit!11428)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!12815)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!16 (array!21509 array!21507 (_ BitVec 32) (_ BitVec 32) V!12815 V!12815 (_ BitVec 32) (_ BitVec 64) V!12815 (_ BitVec 32) Int) Unit!11428)

(assert (=> b!371679 (= lt!170376 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!16 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!692 (array!21509 array!21507 (_ BitVec 32) (_ BitVec 32) V!12815 V!12815 (_ BitVec 32) Int) ListLongMap!4799)

(assert (=> b!371679 (= lt!170379 (getCurrentListMapNoExtraKeys!692 lt!170375 (array!21508 (store (arr!10222 _values!506) i!548 (ValueCellFull!4048 v!373)) (size!10574 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371679 (= lt!170377 (getCurrentListMapNoExtraKeys!692 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371680 () Bool)

(declare-fun res!208974 () Bool)

(assert (=> b!371680 (=> (not res!208974) (not e!226825))))

(assert (=> b!371680 (= res!208974 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5723))))

(declare-fun b!371681 () Bool)

(assert (=> b!371681 (= e!226828 (and e!226826 mapRes!14739))))

(declare-fun condMapEmpty!14739 () Bool)

(declare-fun mapDefault!14739 () ValueCell!4048)

