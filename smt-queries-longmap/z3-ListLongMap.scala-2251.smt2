; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36954 () Bool)

(assert start!36954)

(declare-fun b_free!8095 () Bool)

(declare-fun b_next!8095 () Bool)

(assert (=> start!36954 (= b_free!8095 (not b_next!8095))))

(declare-fun tp!29000 () Bool)

(declare-fun b_and!15351 () Bool)

(assert (=> start!36954 (= tp!29000 b_and!15351)))

(declare-fun b!370843 () Bool)

(declare-fun e!226433 () Bool)

(assert (=> b!370843 (= e!226433 (not true))))

(declare-datatypes ((V!12763 0))(
  ( (V!12764 (val!4416 Int)) )
))
(declare-datatypes ((tuple2!5758 0))(
  ( (tuple2!5759 (_1!2890 (_ BitVec 64)) (_2!2890 V!12763)) )
))
(declare-datatypes ((List!5594 0))(
  ( (Nil!5591) (Cons!5590 (h!6446 tuple2!5758) (t!10736 List!5594)) )
))
(declare-datatypes ((ListLongMap!4673 0))(
  ( (ListLongMap!4674 (toList!2352 List!5594)) )
))
(declare-fun lt!170096 () ListLongMap!4673)

(declare-fun lt!170098 () ListLongMap!4673)

(assert (=> b!370843 (and (= lt!170096 lt!170098) (= lt!170098 lt!170096))))

(declare-fun v!373 () V!12763)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!170097 () ListLongMap!4673)

(declare-fun +!748 (ListLongMap!4673 tuple2!5758) ListLongMap!4673)

(assert (=> b!370843 (= lt!170098 (+!748 lt!170097 (tuple2!5759 k0!778 v!373)))))

(declare-datatypes ((ValueCell!4028 0))(
  ( (ValueCellFull!4028 (v!6614 V!12763)) (EmptyCell!4028) )
))
(declare-datatypes ((array!21412 0))(
  ( (array!21413 (arr!10174 (Array (_ BitVec 32) ValueCell!4028)) (size!10526 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21412)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12763)

(declare-datatypes ((array!21414 0))(
  ( (array!21415 (arr!10175 (Array (_ BitVec 32) (_ BitVec 64))) (size!10527 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21414)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((Unit!11387 0))(
  ( (Unit!11388) )
))
(declare-fun lt!170095 () Unit!11387)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12763)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!1 (array!21414 array!21412 (_ BitVec 32) (_ BitVec 32) V!12763 V!12763 (_ BitVec 32) (_ BitVec 64) V!12763 (_ BitVec 32) Int) Unit!11387)

(assert (=> b!370843 (= lt!170095 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!1 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170094 () array!21414)

(declare-fun getCurrentListMapNoExtraKeys!661 (array!21414 array!21412 (_ BitVec 32) (_ BitVec 32) V!12763 V!12763 (_ BitVec 32) Int) ListLongMap!4673)

(assert (=> b!370843 (= lt!170096 (getCurrentListMapNoExtraKeys!661 lt!170094 (array!21413 (store (arr!10174 _values!506) i!548 (ValueCellFull!4028 v!373)) (size!10526 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!370843 (= lt!170097 (getCurrentListMapNoExtraKeys!661 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370844 () Bool)

(declare-fun res!208368 () Bool)

(declare-fun e!226434 () Bool)

(assert (=> b!370844 (=> (not res!208368) (not e!226434))))

(assert (=> b!370844 (= res!208368 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10527 _keys!658))))))

(declare-fun b!370845 () Bool)

(declare-fun res!208371 () Bool)

(assert (=> b!370845 (=> (not res!208371) (not e!226433))))

(declare-datatypes ((List!5595 0))(
  ( (Nil!5592) (Cons!5591 (h!6447 (_ BitVec 64)) (t!10737 List!5595)) )
))
(declare-fun arrayNoDuplicates!0 (array!21414 (_ BitVec 32) List!5595) Bool)

(assert (=> b!370845 (= res!208371 (arrayNoDuplicates!0 lt!170094 #b00000000000000000000000000000000 Nil!5592))))

(declare-fun b!370846 () Bool)

(declare-fun res!208376 () Bool)

(assert (=> b!370846 (=> (not res!208376) (not e!226434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370846 (= res!208376 (validKeyInArray!0 k0!778))))

(declare-fun b!370847 () Bool)

(declare-fun res!208370 () Bool)

(assert (=> b!370847 (=> (not res!208370) (not e!226434))))

(assert (=> b!370847 (= res!208370 (or (= (select (arr!10175 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10175 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370848 () Bool)

(declare-fun res!208367 () Bool)

(assert (=> b!370848 (=> (not res!208367) (not e!226434))))

(assert (=> b!370848 (= res!208367 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5592))))

(declare-fun b!370849 () Bool)

(declare-fun res!208373 () Bool)

(assert (=> b!370849 (=> (not res!208373) (not e!226434))))

(declare-fun arrayContainsKey!0 (array!21414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370849 (= res!208373 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14679 () Bool)

(declare-fun mapRes!14679 () Bool)

(declare-fun tp!29001 () Bool)

(declare-fun e!226436 () Bool)

(assert (=> mapNonEmpty!14679 (= mapRes!14679 (and tp!29001 e!226436))))

(declare-fun mapKey!14679 () (_ BitVec 32))

(declare-fun mapRest!14679 () (Array (_ BitVec 32) ValueCell!4028))

(declare-fun mapValue!14679 () ValueCell!4028)

(assert (=> mapNonEmpty!14679 (= (arr!10174 _values!506) (store mapRest!14679 mapKey!14679 mapValue!14679))))

(declare-fun b!370850 () Bool)

(declare-fun res!208375 () Bool)

(assert (=> b!370850 (=> (not res!208375) (not e!226434))))

(assert (=> b!370850 (= res!208375 (and (= (size!10526 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10527 _keys!658) (size!10526 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370852 () Bool)

(declare-fun res!208374 () Bool)

(assert (=> b!370852 (=> (not res!208374) (not e!226434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21414 (_ BitVec 32)) Bool)

(assert (=> b!370852 (= res!208374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14679 () Bool)

(assert (=> mapIsEmpty!14679 mapRes!14679))

(declare-fun b!370853 () Bool)

(declare-fun e!226437 () Bool)

(declare-fun e!226435 () Bool)

(assert (=> b!370853 (= e!226437 (and e!226435 mapRes!14679))))

(declare-fun condMapEmpty!14679 () Bool)

(declare-fun mapDefault!14679 () ValueCell!4028)

(assert (=> b!370853 (= condMapEmpty!14679 (= (arr!10174 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4028)) mapDefault!14679)))))

(declare-fun res!208372 () Bool)

(assert (=> start!36954 (=> (not res!208372) (not e!226434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36954 (= res!208372 (validMask!0 mask!970))))

(assert (=> start!36954 e!226434))

(declare-fun array_inv!7546 (array!21412) Bool)

(assert (=> start!36954 (and (array_inv!7546 _values!506) e!226437)))

(assert (=> start!36954 tp!29000))

(assert (=> start!36954 true))

(declare-fun tp_is_empty!8743 () Bool)

(assert (=> start!36954 tp_is_empty!8743))

(declare-fun array_inv!7547 (array!21414) Bool)

(assert (=> start!36954 (array_inv!7547 _keys!658)))

(declare-fun b!370851 () Bool)

(assert (=> b!370851 (= e!226434 e!226433)))

(declare-fun res!208369 () Bool)

(assert (=> b!370851 (=> (not res!208369) (not e!226433))))

(assert (=> b!370851 (= res!208369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170094 mask!970))))

(assert (=> b!370851 (= lt!170094 (array!21415 (store (arr!10175 _keys!658) i!548 k0!778) (size!10527 _keys!658)))))

(declare-fun b!370854 () Bool)

(assert (=> b!370854 (= e!226436 tp_is_empty!8743)))

(declare-fun b!370855 () Bool)

(assert (=> b!370855 (= e!226435 tp_is_empty!8743)))

(assert (= (and start!36954 res!208372) b!370850))

(assert (= (and b!370850 res!208375) b!370852))

(assert (= (and b!370852 res!208374) b!370848))

(assert (= (and b!370848 res!208367) b!370844))

(assert (= (and b!370844 res!208368) b!370846))

(assert (= (and b!370846 res!208376) b!370847))

(assert (= (and b!370847 res!208370) b!370849))

(assert (= (and b!370849 res!208373) b!370851))

(assert (= (and b!370851 res!208369) b!370845))

(assert (= (and b!370845 res!208371) b!370843))

(assert (= (and b!370853 condMapEmpty!14679) mapIsEmpty!14679))

(assert (= (and b!370853 (not condMapEmpty!14679)) mapNonEmpty!14679))

(get-info :version)

(assert (= (and mapNonEmpty!14679 ((_ is ValueCellFull!4028) mapValue!14679)) b!370854))

(assert (= (and b!370853 ((_ is ValueCellFull!4028) mapDefault!14679)) b!370855))

(assert (= start!36954 b!370853))

(declare-fun m!367163 () Bool)

(assert (=> b!370852 m!367163))

(declare-fun m!367165 () Bool)

(assert (=> b!370851 m!367165))

(declare-fun m!367167 () Bool)

(assert (=> b!370851 m!367167))

(declare-fun m!367169 () Bool)

(assert (=> b!370847 m!367169))

(declare-fun m!367171 () Bool)

(assert (=> b!370849 m!367171))

(declare-fun m!367173 () Bool)

(assert (=> b!370846 m!367173))

(declare-fun m!367175 () Bool)

(assert (=> start!36954 m!367175))

(declare-fun m!367177 () Bool)

(assert (=> start!36954 m!367177))

(declare-fun m!367179 () Bool)

(assert (=> start!36954 m!367179))

(declare-fun m!367181 () Bool)

(assert (=> b!370843 m!367181))

(declare-fun m!367183 () Bool)

(assert (=> b!370843 m!367183))

(declare-fun m!367185 () Bool)

(assert (=> b!370843 m!367185))

(declare-fun m!367187 () Bool)

(assert (=> b!370843 m!367187))

(declare-fun m!367189 () Bool)

(assert (=> b!370843 m!367189))

(declare-fun m!367191 () Bool)

(assert (=> mapNonEmpty!14679 m!367191))

(declare-fun m!367193 () Bool)

(assert (=> b!370848 m!367193))

(declare-fun m!367195 () Bool)

(assert (=> b!370845 m!367195))

(check-sat (not start!36954) (not mapNonEmpty!14679) (not b!370845) b_and!15351 (not b!370843) (not b_next!8095) (not b!370848) (not b!370849) (not b!370852) tp_is_empty!8743 (not b!370851) (not b!370846))
(check-sat b_and!15351 (not b_next!8095))
