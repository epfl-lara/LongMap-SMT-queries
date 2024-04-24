; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40094 () Bool)

(assert start!40094)

(declare-fun b_free!10375 () Bool)

(declare-fun b_next!10375 () Bool)

(assert (=> start!40094 (= b_free!10375 (not b_next!10375))))

(declare-fun tp!36654 () Bool)

(declare-fun b_and!18357 () Bool)

(assert (=> start!40094 (= tp!36654 b_and!18357)))

(declare-fun b!438307 () Bool)

(declare-fun res!258802 () Bool)

(declare-fun e!258547 () Bool)

(assert (=> b!438307 (=> (not res!258802) (not e!258547))))

(declare-datatypes ((array!26876 0))(
  ( (array!26877 (arr!12887 (Array (_ BitVec 32) (_ BitVec 64))) (size!13239 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26876)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438307 (= res!258802 (or (= (select (arr!12887 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12887 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438308 () Bool)

(declare-fun e!258548 () Bool)

(declare-fun tp_is_empty!11527 () Bool)

(assert (=> b!438308 (= e!258548 tp_is_empty!11527)))

(declare-fun b!438309 () Bool)

(declare-fun e!258550 () Bool)

(declare-fun e!258552 () Bool)

(assert (=> b!438309 (= e!258550 e!258552)))

(declare-fun res!258807 () Bool)

(assert (=> b!438309 (=> (not res!258807) (not e!258552))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!438309 (= res!258807 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16475 0))(
  ( (V!16476 (val!5808 Int)) )
))
(declare-fun minValue!515 () V!16475)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5420 0))(
  ( (ValueCellFull!5420 (v!8056 V!16475)) (EmptyCell!5420) )
))
(declare-datatypes ((array!26878 0))(
  ( (array!26879 (arr!12888 (Array (_ BitVec 32) ValueCell!5420)) (size!13240 (_ BitVec 32))) )
))
(declare-fun lt!201951 () array!26878)

(declare-fun zeroValue!515 () V!16475)

(declare-datatypes ((tuple2!7610 0))(
  ( (tuple2!7611 (_1!3816 (_ BitVec 64)) (_2!3816 V!16475)) )
))
(declare-datatypes ((List!7597 0))(
  ( (Nil!7594) (Cons!7593 (h!8449 tuple2!7610) (t!13345 List!7597)) )
))
(declare-datatypes ((ListLongMap!6525 0))(
  ( (ListLongMap!6526 (toList!3278 List!7597)) )
))
(declare-fun lt!201953 () ListLongMap!6525)

(declare-fun lt!201950 () array!26876)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1511 (array!26876 array!26878 (_ BitVec 32) (_ BitVec 32) V!16475 V!16475 (_ BitVec 32) Int) ListLongMap!6525)

(assert (=> b!438309 (= lt!201953 (getCurrentListMapNoExtraKeys!1511 lt!201950 lt!201951 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26878)

(declare-fun v!412 () V!16475)

(assert (=> b!438309 (= lt!201951 (array!26879 (store (arr!12888 _values!549) i!563 (ValueCellFull!5420 v!412)) (size!13240 _values!549)))))

(declare-fun lt!201952 () ListLongMap!6525)

(assert (=> b!438309 (= lt!201952 (getCurrentListMapNoExtraKeys!1511 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438310 () Bool)

(declare-fun res!258801 () Bool)

(assert (=> b!438310 (=> (not res!258801) (not e!258550))))

(declare-datatypes ((List!7598 0))(
  ( (Nil!7595) (Cons!7594 (h!8450 (_ BitVec 64)) (t!13346 List!7598)) )
))
(declare-fun arrayNoDuplicates!0 (array!26876 (_ BitVec 32) List!7598) Bool)

(assert (=> b!438310 (= res!258801 (arrayNoDuplicates!0 lt!201950 #b00000000000000000000000000000000 Nil!7595))))

(declare-fun b!438311 () Bool)

(declare-fun res!258804 () Bool)

(assert (=> b!438311 (=> (not res!258804) (not e!258547))))

(assert (=> b!438311 (= res!258804 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7595))))

(declare-fun b!438312 () Bool)

(assert (=> b!438312 (= e!258547 e!258550)))

(declare-fun res!258813 () Bool)

(assert (=> b!438312 (=> (not res!258813) (not e!258550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26876 (_ BitVec 32)) Bool)

(assert (=> b!438312 (= res!258813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201950 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!438312 (= lt!201950 (array!26877 (store (arr!12887 _keys!709) i!563 k0!794) (size!13239 _keys!709)))))

(declare-fun b!438313 () Bool)

(declare-fun res!258806 () Bool)

(assert (=> b!438313 (=> (not res!258806) (not e!258547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438313 (= res!258806 (validMask!0 mask!1025))))

(declare-fun res!258805 () Bool)

(assert (=> start!40094 (=> (not res!258805) (not e!258547))))

(assert (=> start!40094 (= res!258805 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13239 _keys!709))))))

(assert (=> start!40094 e!258547))

(assert (=> start!40094 tp_is_empty!11527))

(assert (=> start!40094 tp!36654))

(assert (=> start!40094 true))

(declare-fun e!258553 () Bool)

(declare-fun array_inv!9426 (array!26878) Bool)

(assert (=> start!40094 (and (array_inv!9426 _values!549) e!258553)))

(declare-fun array_inv!9427 (array!26876) Bool)

(assert (=> start!40094 (array_inv!9427 _keys!709)))

(declare-fun b!438314 () Bool)

(assert (=> b!438314 (= e!258552 (not true))))

(declare-fun +!1475 (ListLongMap!6525 tuple2!7610) ListLongMap!6525)

(assert (=> b!438314 (= (getCurrentListMapNoExtraKeys!1511 lt!201950 lt!201951 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1475 (getCurrentListMapNoExtraKeys!1511 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7611 k0!794 v!412)))))

(declare-datatypes ((Unit!13025 0))(
  ( (Unit!13026) )
))
(declare-fun lt!201954 () Unit!13025)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!635 (array!26876 array!26878 (_ BitVec 32) (_ BitVec 32) V!16475 V!16475 (_ BitVec 32) (_ BitVec 64) V!16475 (_ BitVec 32) Int) Unit!13025)

(assert (=> b!438314 (= lt!201954 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!635 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438315 () Bool)

(declare-fun res!258810 () Bool)

(assert (=> b!438315 (=> (not res!258810) (not e!258547))))

(declare-fun arrayContainsKey!0 (array!26876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438315 (= res!258810 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18912 () Bool)

(declare-fun mapRes!18912 () Bool)

(declare-fun tp!36653 () Bool)

(assert (=> mapNonEmpty!18912 (= mapRes!18912 (and tp!36653 e!258548))))

(declare-fun mapKey!18912 () (_ BitVec 32))

(declare-fun mapRest!18912 () (Array (_ BitVec 32) ValueCell!5420))

(declare-fun mapValue!18912 () ValueCell!5420)

(assert (=> mapNonEmpty!18912 (= (arr!12888 _values!549) (store mapRest!18912 mapKey!18912 mapValue!18912))))

(declare-fun b!438316 () Bool)

(declare-fun res!258803 () Bool)

(assert (=> b!438316 (=> (not res!258803) (not e!258547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438316 (= res!258803 (validKeyInArray!0 k0!794))))

(declare-fun b!438317 () Bool)

(declare-fun e!258549 () Bool)

(assert (=> b!438317 (= e!258553 (and e!258549 mapRes!18912))))

(declare-fun condMapEmpty!18912 () Bool)

(declare-fun mapDefault!18912 () ValueCell!5420)

(assert (=> b!438317 (= condMapEmpty!18912 (= (arr!12888 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5420)) mapDefault!18912)))))

(declare-fun mapIsEmpty!18912 () Bool)

(assert (=> mapIsEmpty!18912 mapRes!18912))

(declare-fun b!438318 () Bool)

(declare-fun res!258808 () Bool)

(assert (=> b!438318 (=> (not res!258808) (not e!258547))))

(assert (=> b!438318 (= res!258808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438319 () Bool)

(declare-fun res!258812 () Bool)

(assert (=> b!438319 (=> (not res!258812) (not e!258550))))

(assert (=> b!438319 (= res!258812 (bvsle from!863 i!563))))

(declare-fun b!438320 () Bool)

(assert (=> b!438320 (= e!258549 tp_is_empty!11527)))

(declare-fun b!438321 () Bool)

(declare-fun res!258811 () Bool)

(assert (=> b!438321 (=> (not res!258811) (not e!258547))))

(assert (=> b!438321 (= res!258811 (and (= (size!13240 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13239 _keys!709) (size!13240 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438322 () Bool)

(declare-fun res!258809 () Bool)

(assert (=> b!438322 (=> (not res!258809) (not e!258547))))

(assert (=> b!438322 (= res!258809 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13239 _keys!709))))))

(assert (= (and start!40094 res!258805) b!438313))

(assert (= (and b!438313 res!258806) b!438321))

(assert (= (and b!438321 res!258811) b!438318))

(assert (= (and b!438318 res!258808) b!438311))

(assert (= (and b!438311 res!258804) b!438322))

(assert (= (and b!438322 res!258809) b!438316))

(assert (= (and b!438316 res!258803) b!438307))

(assert (= (and b!438307 res!258802) b!438315))

(assert (= (and b!438315 res!258810) b!438312))

(assert (= (and b!438312 res!258813) b!438310))

(assert (= (and b!438310 res!258801) b!438319))

(assert (= (and b!438319 res!258812) b!438309))

(assert (= (and b!438309 res!258807) b!438314))

(assert (= (and b!438317 condMapEmpty!18912) mapIsEmpty!18912))

(assert (= (and b!438317 (not condMapEmpty!18912)) mapNonEmpty!18912))

(get-info :version)

(assert (= (and mapNonEmpty!18912 ((_ is ValueCellFull!5420) mapValue!18912)) b!438308))

(assert (= (and b!438317 ((_ is ValueCellFull!5420) mapDefault!18912)) b!438320))

(assert (= start!40094 b!438317))

(declare-fun m!426053 () Bool)

(assert (=> b!438309 m!426053))

(declare-fun m!426055 () Bool)

(assert (=> b!438309 m!426055))

(declare-fun m!426057 () Bool)

(assert (=> b!438309 m!426057))

(declare-fun m!426059 () Bool)

(assert (=> mapNonEmpty!18912 m!426059))

(declare-fun m!426061 () Bool)

(assert (=> b!438312 m!426061))

(declare-fun m!426063 () Bool)

(assert (=> b!438312 m!426063))

(declare-fun m!426065 () Bool)

(assert (=> b!438316 m!426065))

(declare-fun m!426067 () Bool)

(assert (=> b!438315 m!426067))

(declare-fun m!426069 () Bool)

(assert (=> b!438311 m!426069))

(declare-fun m!426071 () Bool)

(assert (=> b!438310 m!426071))

(declare-fun m!426073 () Bool)

(assert (=> b!438307 m!426073))

(declare-fun m!426075 () Bool)

(assert (=> b!438318 m!426075))

(declare-fun m!426077 () Bool)

(assert (=> b!438313 m!426077))

(declare-fun m!426079 () Bool)

(assert (=> start!40094 m!426079))

(declare-fun m!426081 () Bool)

(assert (=> start!40094 m!426081))

(declare-fun m!426083 () Bool)

(assert (=> b!438314 m!426083))

(declare-fun m!426085 () Bool)

(assert (=> b!438314 m!426085))

(assert (=> b!438314 m!426085))

(declare-fun m!426087 () Bool)

(assert (=> b!438314 m!426087))

(declare-fun m!426089 () Bool)

(assert (=> b!438314 m!426089))

(check-sat (not b!438312) tp_is_empty!11527 (not b!438314) (not b!438309) (not b!438311) (not b!438318) b_and!18357 (not b!438315) (not b!438316) (not b!438310) (not b_next!10375) (not start!40094) (not b!438313) (not mapNonEmpty!18912))
(check-sat b_and!18357 (not b_next!10375))
