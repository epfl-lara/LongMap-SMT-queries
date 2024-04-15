; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39122 () Bool)

(assert start!39122)

(declare-fun b_free!9403 () Bool)

(declare-fun b_next!9403 () Bool)

(assert (=> start!39122 (= b_free!9403 (not b_next!9403))))

(declare-fun tp!33737 () Bool)

(declare-fun b_and!16763 () Bool)

(assert (=> start!39122 (= tp!33737 b_and!16763)))

(declare-fun b!411401 () Bool)

(declare-fun e!246328 () Bool)

(declare-fun e!246325 () Bool)

(declare-fun mapRes!17454 () Bool)

(assert (=> b!411401 (= e!246328 (and e!246325 mapRes!17454))))

(declare-fun condMapEmpty!17454 () Bool)

(declare-datatypes ((V!15179 0))(
  ( (V!15180 (val!5322 Int)) )
))
(declare-datatypes ((ValueCell!4934 0))(
  ( (ValueCellFull!4934 (v!7563 V!15179)) (EmptyCell!4934) )
))
(declare-datatypes ((array!24965 0))(
  ( (array!24966 (arr!11932 (Array (_ BitVec 32) ValueCell!4934)) (size!12285 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24965)

(declare-fun mapDefault!17454 () ValueCell!4934)

(assert (=> b!411401 (= condMapEmpty!17454 (= (arr!11932 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4934)) mapDefault!17454)))))

(declare-fun b!411402 () Bool)

(declare-fun res!238749 () Bool)

(declare-fun e!246330 () Bool)

(assert (=> b!411402 (=> (not res!238749) (not e!246330))))

(declare-datatypes ((array!24967 0))(
  ( (array!24968 (arr!11933 (Array (_ BitVec 32) (_ BitVec 64))) (size!12286 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24967)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411402 (= res!238749 (or (= (select (arr!11933 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11933 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17454 () Bool)

(assert (=> mapIsEmpty!17454 mapRes!17454))

(declare-fun b!411403 () Bool)

(declare-fun res!238755 () Bool)

(assert (=> b!411403 (=> (not res!238755) (not e!246330))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!411403 (= res!238755 (and (= (size!12285 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12286 _keys!709) (size!12285 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411404 () Bool)

(declare-fun res!238754 () Bool)

(assert (=> b!411404 (=> (not res!238754) (not e!246330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24967 (_ BitVec 32)) Bool)

(assert (=> b!411404 (= res!238754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411405 () Bool)

(declare-fun res!238757 () Bool)

(assert (=> b!411405 (=> (not res!238757) (not e!246330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411405 (= res!238757 (validMask!0 mask!1025))))

(declare-fun b!411406 () Bool)

(declare-fun res!238753 () Bool)

(declare-fun e!246326 () Bool)

(assert (=> b!411406 (=> (not res!238753) (not e!246326))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!411406 (= res!238753 (bvsle from!863 i!563))))

(declare-fun b!411407 () Bool)

(declare-fun res!238758 () Bool)

(assert (=> b!411407 (=> (not res!238758) (not e!246330))))

(assert (=> b!411407 (= res!238758 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12286 _keys!709))))))

(declare-fun b!411408 () Bool)

(assert (=> b!411408 (= e!246326 false)))

(declare-fun minValue!515 () V!15179)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!189095 () array!24967)

(declare-fun zeroValue!515 () V!15179)

(declare-datatypes ((tuple2!6894 0))(
  ( (tuple2!6895 (_1!3458 (_ BitVec 64)) (_2!3458 V!15179)) )
))
(declare-datatypes ((List!6906 0))(
  ( (Nil!6903) (Cons!6902 (h!7758 tuple2!6894) (t!12071 List!6906)) )
))
(declare-datatypes ((ListLongMap!5797 0))(
  ( (ListLongMap!5798 (toList!2914 List!6906)) )
))
(declare-fun lt!189093 () ListLongMap!5797)

(declare-fun v!412 () V!15179)

(declare-fun getCurrentListMapNoExtraKeys!1128 (array!24967 array!24965 (_ BitVec 32) (_ BitVec 32) V!15179 V!15179 (_ BitVec 32) Int) ListLongMap!5797)

(assert (=> b!411408 (= lt!189093 (getCurrentListMapNoExtraKeys!1128 lt!189095 (array!24966 (store (arr!11932 _values!549) i!563 (ValueCellFull!4934 v!412)) (size!12285 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189094 () ListLongMap!5797)

(assert (=> b!411408 (= lt!189094 (getCurrentListMapNoExtraKeys!1128 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411409 () Bool)

(declare-fun e!246329 () Bool)

(declare-fun tp_is_empty!10555 () Bool)

(assert (=> b!411409 (= e!246329 tp_is_empty!10555)))

(declare-fun b!411410 () Bool)

(declare-fun res!238752 () Bool)

(assert (=> b!411410 (=> (not res!238752) (not e!246330))))

(declare-datatypes ((List!6907 0))(
  ( (Nil!6904) (Cons!6903 (h!7759 (_ BitVec 64)) (t!12072 List!6907)) )
))
(declare-fun arrayNoDuplicates!0 (array!24967 (_ BitVec 32) List!6907) Bool)

(assert (=> b!411410 (= res!238752 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6904))))

(declare-fun mapNonEmpty!17454 () Bool)

(declare-fun tp!33738 () Bool)

(assert (=> mapNonEmpty!17454 (= mapRes!17454 (and tp!33738 e!246329))))

(declare-fun mapRest!17454 () (Array (_ BitVec 32) ValueCell!4934))

(declare-fun mapValue!17454 () ValueCell!4934)

(declare-fun mapKey!17454 () (_ BitVec 32))

(assert (=> mapNonEmpty!17454 (= (arr!11932 _values!549) (store mapRest!17454 mapKey!17454 mapValue!17454))))

(declare-fun res!238747 () Bool)

(assert (=> start!39122 (=> (not res!238747) (not e!246330))))

(assert (=> start!39122 (= res!238747 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12286 _keys!709))))))

(assert (=> start!39122 e!246330))

(assert (=> start!39122 tp_is_empty!10555))

(assert (=> start!39122 tp!33737))

(assert (=> start!39122 true))

(declare-fun array_inv!8758 (array!24965) Bool)

(assert (=> start!39122 (and (array_inv!8758 _values!549) e!246328)))

(declare-fun array_inv!8759 (array!24967) Bool)

(assert (=> start!39122 (array_inv!8759 _keys!709)))

(declare-fun b!411411 () Bool)

(assert (=> b!411411 (= e!246325 tp_is_empty!10555)))

(declare-fun b!411412 () Bool)

(declare-fun res!238748 () Bool)

(assert (=> b!411412 (=> (not res!238748) (not e!246330))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411412 (= res!238748 (validKeyInArray!0 k0!794))))

(declare-fun b!411413 () Bool)

(assert (=> b!411413 (= e!246330 e!246326)))

(declare-fun res!238756 () Bool)

(assert (=> b!411413 (=> (not res!238756) (not e!246326))))

(assert (=> b!411413 (= res!238756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189095 mask!1025))))

(assert (=> b!411413 (= lt!189095 (array!24968 (store (arr!11933 _keys!709) i!563 k0!794) (size!12286 _keys!709)))))

(declare-fun b!411414 () Bool)

(declare-fun res!238751 () Bool)

(assert (=> b!411414 (=> (not res!238751) (not e!246326))))

(assert (=> b!411414 (= res!238751 (arrayNoDuplicates!0 lt!189095 #b00000000000000000000000000000000 Nil!6904))))

(declare-fun b!411415 () Bool)

(declare-fun res!238750 () Bool)

(assert (=> b!411415 (=> (not res!238750) (not e!246330))))

(declare-fun arrayContainsKey!0 (array!24967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411415 (= res!238750 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39122 res!238747) b!411405))

(assert (= (and b!411405 res!238757) b!411403))

(assert (= (and b!411403 res!238755) b!411404))

(assert (= (and b!411404 res!238754) b!411410))

(assert (= (and b!411410 res!238752) b!411407))

(assert (= (and b!411407 res!238758) b!411412))

(assert (= (and b!411412 res!238748) b!411402))

(assert (= (and b!411402 res!238749) b!411415))

(assert (= (and b!411415 res!238750) b!411413))

(assert (= (and b!411413 res!238756) b!411414))

(assert (= (and b!411414 res!238751) b!411406))

(assert (= (and b!411406 res!238753) b!411408))

(assert (= (and b!411401 condMapEmpty!17454) mapIsEmpty!17454))

(assert (= (and b!411401 (not condMapEmpty!17454)) mapNonEmpty!17454))

(get-info :version)

(assert (= (and mapNonEmpty!17454 ((_ is ValueCellFull!4934) mapValue!17454)) b!411409))

(assert (= (and b!411401 ((_ is ValueCellFull!4934) mapDefault!17454)) b!411411))

(assert (= start!39122 b!411401))

(declare-fun m!401019 () Bool)

(assert (=> b!411412 m!401019))

(declare-fun m!401021 () Bool)

(assert (=> b!411402 m!401021))

(declare-fun m!401023 () Bool)

(assert (=> b!411414 m!401023))

(declare-fun m!401025 () Bool)

(assert (=> b!411408 m!401025))

(declare-fun m!401027 () Bool)

(assert (=> b!411408 m!401027))

(declare-fun m!401029 () Bool)

(assert (=> b!411408 m!401029))

(declare-fun m!401031 () Bool)

(assert (=> b!411404 m!401031))

(declare-fun m!401033 () Bool)

(assert (=> b!411410 m!401033))

(declare-fun m!401035 () Bool)

(assert (=> b!411413 m!401035))

(declare-fun m!401037 () Bool)

(assert (=> b!411413 m!401037))

(declare-fun m!401039 () Bool)

(assert (=> start!39122 m!401039))

(declare-fun m!401041 () Bool)

(assert (=> start!39122 m!401041))

(declare-fun m!401043 () Bool)

(assert (=> b!411405 m!401043))

(declare-fun m!401045 () Bool)

(assert (=> mapNonEmpty!17454 m!401045))

(declare-fun m!401047 () Bool)

(assert (=> b!411415 m!401047))

(check-sat (not b!411404) (not b!411414) b_and!16763 (not b!411415) (not mapNonEmpty!17454) (not b!411405) (not b!411408) (not b!411413) (not b!411410) (not start!39122) (not b_next!9403) (not b!411412) tp_is_empty!10555)
(check-sat b_and!16763 (not b_next!9403))
