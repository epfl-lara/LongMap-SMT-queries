; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39128 () Bool)

(assert start!39128)

(declare-fun b_free!9409 () Bool)

(declare-fun b_next!9409 () Bool)

(assert (=> start!39128 (= b_free!9409 (not b_next!9409))))

(declare-fun tp!33755 () Bool)

(declare-fun b_and!16769 () Bool)

(assert (=> start!39128 (= tp!33755 b_and!16769)))

(declare-fun b!411536 () Bool)

(declare-fun e!246383 () Bool)

(declare-fun tp_is_empty!10561 () Bool)

(assert (=> b!411536 (= e!246383 tp_is_empty!10561)))

(declare-fun b!411537 () Bool)

(declare-fun e!246381 () Bool)

(assert (=> b!411537 (= e!246381 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15187 0))(
  ( (V!15188 (val!5325 Int)) )
))
(declare-datatypes ((tuple2!6896 0))(
  ( (tuple2!6897 (_1!3459 (_ BitVec 64)) (_2!3459 V!15187)) )
))
(declare-datatypes ((List!6908 0))(
  ( (Nil!6905) (Cons!6904 (h!7760 tuple2!6896) (t!12073 List!6908)) )
))
(declare-datatypes ((ListLongMap!5799 0))(
  ( (ListLongMap!5800 (toList!2915 List!6908)) )
))
(declare-fun lt!189121 () ListLongMap!5799)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4937 0))(
  ( (ValueCellFull!4937 (v!7566 V!15187)) (EmptyCell!4937) )
))
(declare-datatypes ((array!24977 0))(
  ( (array!24978 (arr!11938 (Array (_ BitVec 32) ValueCell!4937)) (size!12291 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24977)

(declare-fun zeroValue!515 () V!15187)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24979 0))(
  ( (array!24980 (arr!11939 (Array (_ BitVec 32) (_ BitVec 64))) (size!12292 (_ BitVec 32))) )
))
(declare-fun lt!189122 () array!24979)

(declare-fun v!412 () V!15187)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15187)

(declare-fun getCurrentListMapNoExtraKeys!1129 (array!24979 array!24977 (_ BitVec 32) (_ BitVec 32) V!15187 V!15187 (_ BitVec 32) Int) ListLongMap!5799)

(assert (=> b!411537 (= lt!189121 (getCurrentListMapNoExtraKeys!1129 lt!189122 (array!24978 (store (arr!11938 _values!549) i!563 (ValueCellFull!4937 v!412)) (size!12291 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!24979)

(declare-fun lt!189120 () ListLongMap!5799)

(assert (=> b!411537 (= lt!189120 (getCurrentListMapNoExtraKeys!1129 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411538 () Bool)

(declare-fun res!238866 () Bool)

(assert (=> b!411538 (=> (not res!238866) (not e!246381))))

(declare-datatypes ((List!6909 0))(
  ( (Nil!6906) (Cons!6905 (h!7761 (_ BitVec 64)) (t!12074 List!6909)) )
))
(declare-fun arrayNoDuplicates!0 (array!24979 (_ BitVec 32) List!6909) Bool)

(assert (=> b!411538 (= res!238866 (arrayNoDuplicates!0 lt!189122 #b00000000000000000000000000000000 Nil!6906))))

(declare-fun b!411539 () Bool)

(declare-fun res!238862 () Bool)

(assert (=> b!411539 (=> (not res!238862) (not e!246381))))

(assert (=> b!411539 (= res!238862 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17463 () Bool)

(declare-fun mapRes!17463 () Bool)

(assert (=> mapIsEmpty!17463 mapRes!17463))

(declare-fun b!411540 () Bool)

(declare-fun res!238860 () Bool)

(declare-fun e!246380 () Bool)

(assert (=> b!411540 (=> (not res!238860) (not e!246380))))

(assert (=> b!411540 (= res!238860 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12292 _keys!709))))))

(declare-fun b!411541 () Bool)

(declare-fun e!246379 () Bool)

(assert (=> b!411541 (= e!246379 tp_is_empty!10561)))

(declare-fun b!411542 () Bool)

(declare-fun res!238865 () Bool)

(assert (=> b!411542 (=> (not res!238865) (not e!246380))))

(assert (=> b!411542 (= res!238865 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6906))))

(declare-fun b!411543 () Bool)

(declare-fun res!238857 () Bool)

(assert (=> b!411543 (=> (not res!238857) (not e!246380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411543 (= res!238857 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17463 () Bool)

(declare-fun tp!33756 () Bool)

(assert (=> mapNonEmpty!17463 (= mapRes!17463 (and tp!33756 e!246383))))

(declare-fun mapKey!17463 () (_ BitVec 32))

(declare-fun mapRest!17463 () (Array (_ BitVec 32) ValueCell!4937))

(declare-fun mapValue!17463 () ValueCell!4937)

(assert (=> mapNonEmpty!17463 (= (arr!11938 _values!549) (store mapRest!17463 mapKey!17463 mapValue!17463))))

(declare-fun b!411544 () Bool)

(assert (=> b!411544 (= e!246380 e!246381)))

(declare-fun res!238858 () Bool)

(assert (=> b!411544 (=> (not res!238858) (not e!246381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24979 (_ BitVec 32)) Bool)

(assert (=> b!411544 (= res!238858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189122 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!411544 (= lt!189122 (array!24980 (store (arr!11939 _keys!709) i!563 k0!794) (size!12292 _keys!709)))))

(declare-fun b!411545 () Bool)

(declare-fun res!238864 () Bool)

(assert (=> b!411545 (=> (not res!238864) (not e!246380))))

(declare-fun arrayContainsKey!0 (array!24979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411545 (= res!238864 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411546 () Bool)

(declare-fun res!238861 () Bool)

(assert (=> b!411546 (=> (not res!238861) (not e!246380))))

(assert (=> b!411546 (= res!238861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!238863 () Bool)

(assert (=> start!39128 (=> (not res!238863) (not e!246380))))

(assert (=> start!39128 (= res!238863 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12292 _keys!709))))))

(assert (=> start!39128 e!246380))

(assert (=> start!39128 tp_is_empty!10561))

(assert (=> start!39128 tp!33755))

(assert (=> start!39128 true))

(declare-fun e!246382 () Bool)

(declare-fun array_inv!8760 (array!24977) Bool)

(assert (=> start!39128 (and (array_inv!8760 _values!549) e!246382)))

(declare-fun array_inv!8761 (array!24979) Bool)

(assert (=> start!39128 (array_inv!8761 _keys!709)))

(declare-fun b!411547 () Bool)

(declare-fun res!238855 () Bool)

(assert (=> b!411547 (=> (not res!238855) (not e!246380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411547 (= res!238855 (validKeyInArray!0 k0!794))))

(declare-fun b!411548 () Bool)

(assert (=> b!411548 (= e!246382 (and e!246379 mapRes!17463))))

(declare-fun condMapEmpty!17463 () Bool)

(declare-fun mapDefault!17463 () ValueCell!4937)

(assert (=> b!411548 (= condMapEmpty!17463 (= (arr!11938 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4937)) mapDefault!17463)))))

(declare-fun b!411549 () Bool)

(declare-fun res!238859 () Bool)

(assert (=> b!411549 (=> (not res!238859) (not e!246380))))

(assert (=> b!411549 (= res!238859 (or (= (select (arr!11939 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11939 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411550 () Bool)

(declare-fun res!238856 () Bool)

(assert (=> b!411550 (=> (not res!238856) (not e!246380))))

(assert (=> b!411550 (= res!238856 (and (= (size!12291 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12292 _keys!709) (size!12291 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39128 res!238863) b!411543))

(assert (= (and b!411543 res!238857) b!411550))

(assert (= (and b!411550 res!238856) b!411546))

(assert (= (and b!411546 res!238861) b!411542))

(assert (= (and b!411542 res!238865) b!411540))

(assert (= (and b!411540 res!238860) b!411547))

(assert (= (and b!411547 res!238855) b!411549))

(assert (= (and b!411549 res!238859) b!411545))

(assert (= (and b!411545 res!238864) b!411544))

(assert (= (and b!411544 res!238858) b!411538))

(assert (= (and b!411538 res!238866) b!411539))

(assert (= (and b!411539 res!238862) b!411537))

(assert (= (and b!411548 condMapEmpty!17463) mapIsEmpty!17463))

(assert (= (and b!411548 (not condMapEmpty!17463)) mapNonEmpty!17463))

(get-info :version)

(assert (= (and mapNonEmpty!17463 ((_ is ValueCellFull!4937) mapValue!17463)) b!411536))

(assert (= (and b!411548 ((_ is ValueCellFull!4937) mapDefault!17463)) b!411541))

(assert (= start!39128 b!411548))

(declare-fun m!401109 () Bool)

(assert (=> b!411545 m!401109))

(declare-fun m!401111 () Bool)

(assert (=> b!411538 m!401111))

(declare-fun m!401113 () Bool)

(assert (=> start!39128 m!401113))

(declare-fun m!401115 () Bool)

(assert (=> start!39128 m!401115))

(declare-fun m!401117 () Bool)

(assert (=> b!411544 m!401117))

(declare-fun m!401119 () Bool)

(assert (=> b!411544 m!401119))

(declare-fun m!401121 () Bool)

(assert (=> b!411549 m!401121))

(declare-fun m!401123 () Bool)

(assert (=> b!411537 m!401123))

(declare-fun m!401125 () Bool)

(assert (=> b!411537 m!401125))

(declare-fun m!401127 () Bool)

(assert (=> b!411537 m!401127))

(declare-fun m!401129 () Bool)

(assert (=> mapNonEmpty!17463 m!401129))

(declare-fun m!401131 () Bool)

(assert (=> b!411547 m!401131))

(declare-fun m!401133 () Bool)

(assert (=> b!411543 m!401133))

(declare-fun m!401135 () Bool)

(assert (=> b!411546 m!401135))

(declare-fun m!401137 () Bool)

(assert (=> b!411542 m!401137))

(check-sat (not b!411544) (not b!411545) (not start!39128) (not b!411538) (not b_next!9409) (not b!411543) (not b!411546) b_and!16769 (not b!411542) (not mapNonEmpty!17463) tp_is_empty!10561 (not b!411537) (not b!411547))
(check-sat b_and!16769 (not b_next!9409))
