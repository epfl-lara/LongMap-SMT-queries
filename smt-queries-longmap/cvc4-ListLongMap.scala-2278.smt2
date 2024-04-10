; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37134 () Bool)

(assert start!37134)

(declare-fun b_free!8261 () Bool)

(declare-fun b_next!8261 () Bool)

(assert (=> start!37134 (= b_free!8261 (not b_next!8261))))

(declare-fun tp!29498 () Bool)

(declare-fun b_and!15503 () Bool)

(assert (=> start!37134 (= tp!29498 b_and!15503)))

(declare-fun b!374307 () Bool)

(declare-fun e!228129 () Bool)

(declare-fun e!228131 () Bool)

(assert (=> b!374307 (= e!228129 (not e!228131))))

(declare-fun res!211042 () Bool)

(assert (=> b!374307 (=> res!211042 e!228131)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374307 (= res!211042 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!12983 0))(
  ( (V!12984 (val!4499 Int)) )
))
(declare-datatypes ((tuple2!5980 0))(
  ( (tuple2!5981 (_1!3001 (_ BitVec 64)) (_2!3001 V!12983)) )
))
(declare-datatypes ((List!5826 0))(
  ( (Nil!5823) (Cons!5822 (h!6678 tuple2!5980) (t!10976 List!5826)) )
))
(declare-datatypes ((ListLongMap!4893 0))(
  ( (ListLongMap!4894 (toList!2462 List!5826)) )
))
(declare-fun lt!172470 () ListLongMap!4893)

(declare-datatypes ((ValueCell!4111 0))(
  ( (ValueCellFull!4111 (v!6696 V!12983)) (EmptyCell!4111) )
))
(declare-datatypes ((array!21757 0))(
  ( (array!21758 (arr!10347 (Array (_ BitVec 32) ValueCell!4111)) (size!10699 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21757)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12983)

(declare-datatypes ((array!21759 0))(
  ( (array!21760 (arr!10348 (Array (_ BitVec 32) (_ BitVec 64))) (size!10700 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21759)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12983)

(declare-fun getCurrentListMap!1900 (array!21759 array!21757 (_ BitVec 32) (_ BitVec 32) V!12983 V!12983 (_ BitVec 32) Int) ListLongMap!4893)

(assert (=> b!374307 (= lt!172470 (getCurrentListMap!1900 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172476 () array!21759)

(declare-fun lt!172468 () array!21757)

(declare-fun lt!172461 () ListLongMap!4893)

(assert (=> b!374307 (= lt!172461 (getCurrentListMap!1900 lt!172476 lt!172468 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172472 () ListLongMap!4893)

(declare-fun lt!172475 () ListLongMap!4893)

(assert (=> b!374307 (and (= lt!172472 lt!172475) (= lt!172475 lt!172472))))

(declare-fun lt!172471 () ListLongMap!4893)

(declare-fun lt!172474 () tuple2!5980)

(declare-fun +!808 (ListLongMap!4893 tuple2!5980) ListLongMap!4893)

(assert (=> b!374307 (= lt!172475 (+!808 lt!172471 lt!172474))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!12983)

(assert (=> b!374307 (= lt!172474 (tuple2!5981 k!778 v!373))))

(declare-datatypes ((Unit!11522 0))(
  ( (Unit!11523) )
))
(declare-fun lt!172464 () Unit!11522)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!58 (array!21759 array!21757 (_ BitVec 32) (_ BitVec 32) V!12983 V!12983 (_ BitVec 32) (_ BitVec 64) V!12983 (_ BitVec 32) Int) Unit!11522)

(assert (=> b!374307 (= lt!172464 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!58 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!734 (array!21759 array!21757 (_ BitVec 32) (_ BitVec 32) V!12983 V!12983 (_ BitVec 32) Int) ListLongMap!4893)

(assert (=> b!374307 (= lt!172472 (getCurrentListMapNoExtraKeys!734 lt!172476 lt!172468 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374307 (= lt!172468 (array!21758 (store (arr!10347 _values!506) i!548 (ValueCellFull!4111 v!373)) (size!10699 _values!506)))))

(assert (=> b!374307 (= lt!172471 (getCurrentListMapNoExtraKeys!734 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!211043 () Bool)

(declare-fun e!228127 () Bool)

(assert (=> start!37134 (=> (not res!211043) (not e!228127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37134 (= res!211043 (validMask!0 mask!970))))

(assert (=> start!37134 e!228127))

(declare-fun e!228134 () Bool)

(declare-fun array_inv!7630 (array!21757) Bool)

(assert (=> start!37134 (and (array_inv!7630 _values!506) e!228134)))

(assert (=> start!37134 tp!29498))

(assert (=> start!37134 true))

(declare-fun tp_is_empty!8909 () Bool)

(assert (=> start!37134 tp_is_empty!8909))

(declare-fun array_inv!7631 (array!21759) Bool)

(assert (=> start!37134 (array_inv!7631 _keys!658)))

(declare-fun b!374308 () Bool)

(declare-fun res!211048 () Bool)

(assert (=> b!374308 (=> (not res!211048) (not e!228127))))

(assert (=> b!374308 (= res!211048 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10700 _keys!658))))))

(declare-fun b!374309 () Bool)

(declare-fun e!228133 () Bool)

(assert (=> b!374309 (= e!228133 true)))

(declare-fun lt!172463 () tuple2!5980)

(declare-fun lt!172473 () ListLongMap!4893)

(declare-fun lt!172469 () ListLongMap!4893)

(assert (=> b!374309 (= (+!808 lt!172473 lt!172463) (+!808 lt!172469 lt!172474))))

(declare-fun lt!172465 () ListLongMap!4893)

(declare-fun lt!172462 () Unit!11522)

(declare-fun addCommutativeForDiffKeys!232 (ListLongMap!4893 (_ BitVec 64) V!12983 (_ BitVec 64) V!12983) Unit!11522)

(assert (=> b!374309 (= lt!172462 (addCommutativeForDiffKeys!232 lt!172465 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374310 () Bool)

(declare-fun res!211046 () Bool)

(assert (=> b!374310 (=> (not res!211046) (not e!228127))))

(declare-fun arrayContainsKey!0 (array!21759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374310 (= res!211046 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14928 () Bool)

(declare-fun mapRes!14928 () Bool)

(assert (=> mapIsEmpty!14928 mapRes!14928))

(declare-fun mapNonEmpty!14928 () Bool)

(declare-fun tp!29499 () Bool)

(declare-fun e!228130 () Bool)

(assert (=> mapNonEmpty!14928 (= mapRes!14928 (and tp!29499 e!228130))))

(declare-fun mapValue!14928 () ValueCell!4111)

(declare-fun mapRest!14928 () (Array (_ BitVec 32) ValueCell!4111))

(declare-fun mapKey!14928 () (_ BitVec 32))

(assert (=> mapNonEmpty!14928 (= (arr!10347 _values!506) (store mapRest!14928 mapKey!14928 mapValue!14928))))

(declare-fun b!374311 () Bool)

(assert (=> b!374311 (= e!228131 e!228133)))

(declare-fun res!211040 () Bool)

(assert (=> b!374311 (=> res!211040 e!228133)))

(assert (=> b!374311 (= res!211040 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172467 () ListLongMap!4893)

(assert (=> b!374311 (= lt!172467 lt!172473)))

(assert (=> b!374311 (= lt!172473 (+!808 lt!172465 lt!172474))))

(declare-fun lt!172466 () Unit!11522)

(assert (=> b!374311 (= lt!172466 (addCommutativeForDiffKeys!232 lt!172471 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374311 (= lt!172461 (+!808 lt!172467 lt!172463))))

(declare-fun lt!172460 () tuple2!5980)

(assert (=> b!374311 (= lt!172467 (+!808 lt!172475 lt!172460))))

(assert (=> b!374311 (= lt!172470 lt!172469)))

(assert (=> b!374311 (= lt!172469 (+!808 lt!172465 lt!172463))))

(assert (=> b!374311 (= lt!172465 (+!808 lt!172471 lt!172460))))

(assert (=> b!374311 (= lt!172461 (+!808 (+!808 lt!172472 lt!172460) lt!172463))))

(assert (=> b!374311 (= lt!172463 (tuple2!5981 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374311 (= lt!172460 (tuple2!5981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374312 () Bool)

(declare-fun res!211049 () Bool)

(assert (=> b!374312 (=> (not res!211049) (not e!228127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21759 (_ BitVec 32)) Bool)

(assert (=> b!374312 (= res!211049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374313 () Bool)

(declare-fun res!211044 () Bool)

(assert (=> b!374313 (=> (not res!211044) (not e!228127))))

(assert (=> b!374313 (= res!211044 (and (= (size!10699 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10700 _keys!658) (size!10699 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374314 () Bool)

(declare-fun res!211038 () Bool)

(assert (=> b!374314 (=> (not res!211038) (not e!228127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374314 (= res!211038 (validKeyInArray!0 k!778))))

(declare-fun b!374315 () Bool)

(declare-fun e!228132 () Bool)

(assert (=> b!374315 (= e!228134 (and e!228132 mapRes!14928))))

(declare-fun condMapEmpty!14928 () Bool)

(declare-fun mapDefault!14928 () ValueCell!4111)

