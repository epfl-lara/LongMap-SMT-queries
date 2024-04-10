; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39714 () Bool)

(assert start!39714)

(declare-fun b_free!9981 () Bool)

(declare-fun b_next!9981 () Bool)

(assert (=> start!39714 (= b_free!9981 (not b_next!9981))))

(declare-fun tp!35472 () Bool)

(declare-fun b_and!17637 () Bool)

(assert (=> start!39714 (= tp!35472 b_and!17637)))

(declare-fun mapNonEmpty!18321 () Bool)

(declare-fun mapRes!18321 () Bool)

(declare-fun tp!35471 () Bool)

(declare-fun e!253232 () Bool)

(assert (=> mapNonEmpty!18321 (= mapRes!18321 (and tp!35471 e!253232))))

(declare-fun mapKey!18321 () (_ BitVec 32))

(declare-datatypes ((V!15949 0))(
  ( (V!15950 (val!5611 Int)) )
))
(declare-datatypes ((ValueCell!5223 0))(
  ( (ValueCellFull!5223 (v!7858 V!15949)) (EmptyCell!5223) )
))
(declare-datatypes ((array!26105 0))(
  ( (array!26106 (arr!12502 (Array (_ BitVec 32) ValueCell!5223)) (size!12854 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26105)

(declare-fun mapValue!18321 () ValueCell!5223)

(declare-fun mapRest!18321 () (Array (_ BitVec 32) ValueCell!5223))

(assert (=> mapNonEmpty!18321 (= (arr!12502 _values!549) (store mapRest!18321 mapKey!18321 mapValue!18321))))

(declare-fun b!426959 () Bool)

(declare-fun e!253229 () Bool)

(assert (=> b!426959 (= e!253229 (not true))))

(declare-fun lt!195125 () array!26105)

(declare-fun minValue!515 () V!15949)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15949)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26107 0))(
  ( (array!26108 (arr!12503 (Array (_ BitVec 32) (_ BitVec 64))) (size!12855 (_ BitVec 32))) )
))
(declare-fun lt!195128 () array!26107)

(declare-fun v!412 () V!15949)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26107)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7372 0))(
  ( (tuple2!7373 (_1!3697 (_ BitVec 64)) (_2!3697 V!15949)) )
))
(declare-datatypes ((List!7389 0))(
  ( (Nil!7386) (Cons!7385 (h!8241 tuple2!7372) (t!12833 List!7389)) )
))
(declare-datatypes ((ListLongMap!6285 0))(
  ( (ListLongMap!6286 (toList!3158 List!7389)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1362 (array!26107 array!26105 (_ BitVec 32) (_ BitVec 32) V!15949 V!15949 (_ BitVec 32) Int) ListLongMap!6285)

(declare-fun +!1315 (ListLongMap!6285 tuple2!7372) ListLongMap!6285)

(assert (=> b!426959 (= (getCurrentListMapNoExtraKeys!1362 lt!195128 lt!195125 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1315 (getCurrentListMapNoExtraKeys!1362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7373 k0!794 v!412)))))

(declare-datatypes ((Unit!12532 0))(
  ( (Unit!12533) )
))
(declare-fun lt!195126 () Unit!12532)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!510 (array!26107 array!26105 (_ BitVec 32) (_ BitVec 32) V!15949 V!15949 (_ BitVec 32) (_ BitVec 64) V!15949 (_ BitVec 32) Int) Unit!12532)

(assert (=> b!426959 (= lt!195126 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!510 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18321 () Bool)

(assert (=> mapIsEmpty!18321 mapRes!18321))

(declare-fun b!426960 () Bool)

(declare-fun res!250320 () Bool)

(declare-fun e!253228 () Bool)

(assert (=> b!426960 (=> (not res!250320) (not e!253228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26107 (_ BitVec 32)) Bool)

(assert (=> b!426960 (= res!250320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426961 () Bool)

(declare-fun e!253227 () Bool)

(assert (=> b!426961 (= e!253228 e!253227)))

(declare-fun res!250330 () Bool)

(assert (=> b!426961 (=> (not res!250330) (not e!253227))))

(assert (=> b!426961 (= res!250330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195128 mask!1025))))

(assert (=> b!426961 (= lt!195128 (array!26108 (store (arr!12503 _keys!709) i!563 k0!794) (size!12855 _keys!709)))))

(declare-fun b!426962 () Bool)

(declare-fun res!250325 () Bool)

(assert (=> b!426962 (=> (not res!250325) (not e!253228))))

(declare-datatypes ((List!7390 0))(
  ( (Nil!7387) (Cons!7386 (h!8242 (_ BitVec 64)) (t!12834 List!7390)) )
))
(declare-fun arrayNoDuplicates!0 (array!26107 (_ BitVec 32) List!7390) Bool)

(assert (=> b!426962 (= res!250325 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7387))))

(declare-fun b!426963 () Bool)

(declare-fun res!250327 () Bool)

(assert (=> b!426963 (=> (not res!250327) (not e!253228))))

(assert (=> b!426963 (= res!250327 (and (= (size!12854 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12855 _keys!709) (size!12854 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426964 () Bool)

(declare-fun res!250331 () Bool)

(assert (=> b!426964 (=> (not res!250331) (not e!253227))))

(assert (=> b!426964 (= res!250331 (arrayNoDuplicates!0 lt!195128 #b00000000000000000000000000000000 Nil!7387))))

(declare-fun b!426966 () Bool)

(declare-fun e!253230 () Bool)

(declare-fun tp_is_empty!11133 () Bool)

(assert (=> b!426966 (= e!253230 tp_is_empty!11133)))

(declare-fun b!426967 () Bool)

(assert (=> b!426967 (= e!253232 tp_is_empty!11133)))

(declare-fun b!426968 () Bool)

(declare-fun res!250329 () Bool)

(assert (=> b!426968 (=> (not res!250329) (not e!253227))))

(assert (=> b!426968 (= res!250329 (bvsle from!863 i!563))))

(declare-fun b!426969 () Bool)

(declare-fun res!250322 () Bool)

(assert (=> b!426969 (=> (not res!250322) (not e!253228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426969 (= res!250322 (validKeyInArray!0 k0!794))))

(declare-fun b!426970 () Bool)

(declare-fun res!250321 () Bool)

(assert (=> b!426970 (=> (not res!250321) (not e!253228))))

(assert (=> b!426970 (= res!250321 (or (= (select (arr!12503 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12503 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426971 () Bool)

(declare-fun res!250328 () Bool)

(assert (=> b!426971 (=> (not res!250328) (not e!253228))))

(declare-fun arrayContainsKey!0 (array!26107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426971 (= res!250328 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426972 () Bool)

(declare-fun res!250323 () Bool)

(assert (=> b!426972 (=> (not res!250323) (not e!253228))))

(assert (=> b!426972 (= res!250323 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12855 _keys!709))))))

(declare-fun b!426965 () Bool)

(assert (=> b!426965 (= e!253227 e!253229)))

(declare-fun res!250326 () Bool)

(assert (=> b!426965 (=> (not res!250326) (not e!253229))))

(assert (=> b!426965 (= res!250326 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195127 () ListLongMap!6285)

(assert (=> b!426965 (= lt!195127 (getCurrentListMapNoExtraKeys!1362 lt!195128 lt!195125 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!426965 (= lt!195125 (array!26106 (store (arr!12502 _values!549) i!563 (ValueCellFull!5223 v!412)) (size!12854 _values!549)))))

(declare-fun lt!195124 () ListLongMap!6285)

(assert (=> b!426965 (= lt!195124 (getCurrentListMapNoExtraKeys!1362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!250332 () Bool)

(assert (=> start!39714 (=> (not res!250332) (not e!253228))))

(assert (=> start!39714 (= res!250332 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12855 _keys!709))))))

(assert (=> start!39714 e!253228))

(assert (=> start!39714 tp_is_empty!11133))

(assert (=> start!39714 tp!35472))

(assert (=> start!39714 true))

(declare-fun e!253231 () Bool)

(declare-fun array_inv!9110 (array!26105) Bool)

(assert (=> start!39714 (and (array_inv!9110 _values!549) e!253231)))

(declare-fun array_inv!9111 (array!26107) Bool)

(assert (=> start!39714 (array_inv!9111 _keys!709)))

(declare-fun b!426973 () Bool)

(assert (=> b!426973 (= e!253231 (and e!253230 mapRes!18321))))

(declare-fun condMapEmpty!18321 () Bool)

(declare-fun mapDefault!18321 () ValueCell!5223)

(assert (=> b!426973 (= condMapEmpty!18321 (= (arr!12502 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5223)) mapDefault!18321)))))

(declare-fun b!426974 () Bool)

(declare-fun res!250324 () Bool)

(assert (=> b!426974 (=> (not res!250324) (not e!253228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426974 (= res!250324 (validMask!0 mask!1025))))

(assert (= (and start!39714 res!250332) b!426974))

(assert (= (and b!426974 res!250324) b!426963))

(assert (= (and b!426963 res!250327) b!426960))

(assert (= (and b!426960 res!250320) b!426962))

(assert (= (and b!426962 res!250325) b!426972))

(assert (= (and b!426972 res!250323) b!426969))

(assert (= (and b!426969 res!250322) b!426970))

(assert (= (and b!426970 res!250321) b!426971))

(assert (= (and b!426971 res!250328) b!426961))

(assert (= (and b!426961 res!250330) b!426964))

(assert (= (and b!426964 res!250331) b!426968))

(assert (= (and b!426968 res!250329) b!426965))

(assert (= (and b!426965 res!250326) b!426959))

(assert (= (and b!426973 condMapEmpty!18321) mapIsEmpty!18321))

(assert (= (and b!426973 (not condMapEmpty!18321)) mapNonEmpty!18321))

(get-info :version)

(assert (= (and mapNonEmpty!18321 ((_ is ValueCellFull!5223) mapValue!18321)) b!426967))

(assert (= (and b!426973 ((_ is ValueCellFull!5223) mapDefault!18321)) b!426966))

(assert (= start!39714 b!426973))

(declare-fun m!415541 () Bool)

(assert (=> b!426974 m!415541))

(declare-fun m!415543 () Bool)

(assert (=> b!426965 m!415543))

(declare-fun m!415545 () Bool)

(assert (=> b!426965 m!415545))

(declare-fun m!415547 () Bool)

(assert (=> b!426965 m!415547))

(declare-fun m!415549 () Bool)

(assert (=> b!426969 m!415549))

(declare-fun m!415551 () Bool)

(assert (=> b!426971 m!415551))

(declare-fun m!415553 () Bool)

(assert (=> b!426962 m!415553))

(declare-fun m!415555 () Bool)

(assert (=> start!39714 m!415555))

(declare-fun m!415557 () Bool)

(assert (=> start!39714 m!415557))

(declare-fun m!415559 () Bool)

(assert (=> b!426964 m!415559))

(declare-fun m!415561 () Bool)

(assert (=> b!426961 m!415561))

(declare-fun m!415563 () Bool)

(assert (=> b!426961 m!415563))

(declare-fun m!415565 () Bool)

(assert (=> mapNonEmpty!18321 m!415565))

(declare-fun m!415567 () Bool)

(assert (=> b!426960 m!415567))

(declare-fun m!415569 () Bool)

(assert (=> b!426970 m!415569))

(declare-fun m!415571 () Bool)

(assert (=> b!426959 m!415571))

(declare-fun m!415573 () Bool)

(assert (=> b!426959 m!415573))

(assert (=> b!426959 m!415573))

(declare-fun m!415575 () Bool)

(assert (=> b!426959 m!415575))

(declare-fun m!415577 () Bool)

(assert (=> b!426959 m!415577))

(check-sat (not b!426965) (not b!426974) (not b!426971) (not mapNonEmpty!18321) (not b!426960) (not b!426959) b_and!17637 (not b!426969) (not b!426961) (not b!426964) tp_is_empty!11133 (not b_next!9981) (not b!426962) (not start!39714))
(check-sat b_and!17637 (not b_next!9981))
