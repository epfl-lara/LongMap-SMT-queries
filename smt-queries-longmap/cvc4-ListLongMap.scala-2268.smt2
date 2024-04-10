; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37074 () Bool)

(assert start!37074)

(declare-fun b_free!8201 () Bool)

(declare-fun b_next!8201 () Bool)

(assert (=> start!37074 (= b_free!8201 (not b_next!8201))))

(declare-fun tp!29318 () Bool)

(declare-fun b_and!15443 () Bool)

(assert (=> start!37074 (= tp!29318 b_and!15443)))

(declare-fun b!372959 () Bool)

(declare-fun e!227420 () Bool)

(declare-datatypes ((array!21639 0))(
  ( (array!21640 (arr!10288 (Array (_ BitVec 32) (_ BitVec 64))) (size!10640 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21639)

(assert (=> b!372959 (= e!227420 (not (bvsle #b00000000000000000000000000000000 (size!10640 _keys!658))))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!12903 0))(
  ( (V!12904 (val!4469 Int)) )
))
(declare-datatypes ((ValueCell!4081 0))(
  ( (ValueCellFull!4081 (v!6666 V!12903)) (EmptyCell!4081) )
))
(declare-datatypes ((array!21641 0))(
  ( (array!21642 (arr!10289 (Array (_ BitVec 32) ValueCell!4081)) (size!10641 (_ BitVec 32))) )
))
(declare-fun lt!171036 () array!21641)

(declare-fun zeroValue!472 () V!12903)

(declare-datatypes ((tuple2!5926 0))(
  ( (tuple2!5927 (_1!2974 (_ BitVec 64)) (_2!2974 V!12903)) )
))
(declare-datatypes ((List!5772 0))(
  ( (Nil!5769) (Cons!5768 (h!6624 tuple2!5926) (t!10922 List!5772)) )
))
(declare-datatypes ((ListLongMap!4839 0))(
  ( (ListLongMap!4840 (toList!2435 List!5772)) )
))
(declare-fun lt!171032 () ListLongMap!4839)

(declare-fun lt!171030 () array!21639)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12903)

(declare-fun getCurrentListMap!1878 (array!21639 array!21641 (_ BitVec 32) (_ BitVec 32) V!12903 V!12903 (_ BitVec 32) Int) ListLongMap!4839)

(assert (=> b!372959 (= lt!171032 (getCurrentListMap!1878 lt!171030 lt!171036 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171033 () ListLongMap!4839)

(declare-fun lt!171035 () ListLongMap!4839)

(assert (=> b!372959 (and (= lt!171033 lt!171035) (= lt!171035 lt!171033))))

(declare-fun lt!171034 () ListLongMap!4839)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!12903)

(declare-fun +!781 (ListLongMap!4839 tuple2!5926) ListLongMap!4839)

(assert (=> b!372959 (= lt!171035 (+!781 lt!171034 (tuple2!5927 k!778 v!373)))))

(declare-fun _values!506 () array!21641)

(declare-datatypes ((Unit!11468 0))(
  ( (Unit!11469) )
))
(declare-fun lt!171031 () Unit!11468)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!36 (array!21639 array!21641 (_ BitVec 32) (_ BitVec 32) V!12903 V!12903 (_ BitVec 32) (_ BitVec 64) V!12903 (_ BitVec 32) Int) Unit!11468)

(assert (=> b!372959 (= lt!171031 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!36 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!712 (array!21639 array!21641 (_ BitVec 32) (_ BitVec 32) V!12903 V!12903 (_ BitVec 32) Int) ListLongMap!4839)

(assert (=> b!372959 (= lt!171033 (getCurrentListMapNoExtraKeys!712 lt!171030 lt!171036 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372959 (= lt!171036 (array!21642 (store (arr!10289 _values!506) i!548 (ValueCellFull!4081 v!373)) (size!10641 _values!506)))))

(assert (=> b!372959 (= lt!171034 (getCurrentListMapNoExtraKeys!712 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14838 () Bool)

(declare-fun mapRes!14838 () Bool)

(declare-fun tp!29319 () Bool)

(declare-fun e!227423 () Bool)

(assert (=> mapNonEmpty!14838 (= mapRes!14838 (and tp!29319 e!227423))))

(declare-fun mapRest!14838 () (Array (_ BitVec 32) ValueCell!4081))

(declare-fun mapKey!14838 () (_ BitVec 32))

(declare-fun mapValue!14838 () ValueCell!4081)

(assert (=> mapNonEmpty!14838 (= (arr!10289 _values!506) (store mapRest!14838 mapKey!14838 mapValue!14838))))

(declare-fun b!372960 () Bool)

(declare-fun tp_is_empty!8849 () Bool)

(assert (=> b!372960 (= e!227423 tp_is_empty!8849)))

(declare-fun b!372961 () Bool)

(declare-fun res!209962 () Bool)

(assert (=> b!372961 (=> (not res!209962) (not e!227420))))

(declare-datatypes ((List!5773 0))(
  ( (Nil!5770) (Cons!5769 (h!6625 (_ BitVec 64)) (t!10923 List!5773)) )
))
(declare-fun arrayNoDuplicates!0 (array!21639 (_ BitVec 32) List!5773) Bool)

(assert (=> b!372961 (= res!209962 (arrayNoDuplicates!0 lt!171030 #b00000000000000000000000000000000 Nil!5770))))

(declare-fun b!372962 () Bool)

(declare-fun res!209968 () Bool)

(declare-fun e!227419 () Bool)

(assert (=> b!372962 (=> (not res!209968) (not e!227419))))

(declare-fun arrayContainsKey!0 (array!21639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372962 (= res!209968 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!372963 () Bool)

(declare-fun res!209966 () Bool)

(assert (=> b!372963 (=> (not res!209966) (not e!227419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21639 (_ BitVec 32)) Bool)

(assert (=> b!372963 (= res!209966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372965 () Bool)

(declare-fun res!209960 () Bool)

(assert (=> b!372965 (=> (not res!209960) (not e!227419))))

(assert (=> b!372965 (= res!209960 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10640 _keys!658))))))

(declare-fun b!372966 () Bool)

(declare-fun res!209967 () Bool)

(assert (=> b!372966 (=> (not res!209967) (not e!227419))))

(assert (=> b!372966 (= res!209967 (and (= (size!10641 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10640 _keys!658) (size!10641 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372967 () Bool)

(assert (=> b!372967 (= e!227419 e!227420)))

(declare-fun res!209965 () Bool)

(assert (=> b!372967 (=> (not res!209965) (not e!227420))))

(assert (=> b!372967 (= res!209965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171030 mask!970))))

(assert (=> b!372967 (= lt!171030 (array!21640 (store (arr!10288 _keys!658) i!548 k!778) (size!10640 _keys!658)))))

(declare-fun b!372968 () Bool)

(declare-fun res!209964 () Bool)

(assert (=> b!372968 (=> (not res!209964) (not e!227419))))

(assert (=> b!372968 (= res!209964 (or (= (select (arr!10288 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10288 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!209969 () Bool)

(assert (=> start!37074 (=> (not res!209969) (not e!227419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37074 (= res!209969 (validMask!0 mask!970))))

(assert (=> start!37074 e!227419))

(declare-fun e!227422 () Bool)

(declare-fun array_inv!7586 (array!21641) Bool)

(assert (=> start!37074 (and (array_inv!7586 _values!506) e!227422)))

(assert (=> start!37074 tp!29318))

(assert (=> start!37074 true))

(assert (=> start!37074 tp_is_empty!8849))

(declare-fun array_inv!7587 (array!21639) Bool)

(assert (=> start!37074 (array_inv!7587 _keys!658)))

(declare-fun b!372964 () Bool)

(declare-fun e!227418 () Bool)

(assert (=> b!372964 (= e!227418 tp_is_empty!8849)))

(declare-fun b!372969 () Bool)

(declare-fun res!209961 () Bool)

(assert (=> b!372969 (=> (not res!209961) (not e!227419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372969 (= res!209961 (validKeyInArray!0 k!778))))

(declare-fun b!372970 () Bool)

(assert (=> b!372970 (= e!227422 (and e!227418 mapRes!14838))))

(declare-fun condMapEmpty!14838 () Bool)

(declare-fun mapDefault!14838 () ValueCell!4081)

