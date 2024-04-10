; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39696 () Bool)

(assert start!39696)

(declare-fun b_free!9963 () Bool)

(declare-fun b_next!9963 () Bool)

(assert (=> start!39696 (= b_free!9963 (not b_next!9963))))

(declare-fun tp!35417 () Bool)

(declare-fun b_and!17619 () Bool)

(assert (=> start!39696 (= tp!35417 b_and!17619)))

(declare-fun b!426527 () Bool)

(declare-fun e!253040 () Bool)

(declare-fun e!253038 () Bool)

(assert (=> b!426527 (= e!253040 e!253038)))

(declare-fun res!249974 () Bool)

(assert (=> b!426527 (=> (not res!249974) (not e!253038))))

(declare-datatypes ((array!26069 0))(
  ( (array!26070 (arr!12484 (Array (_ BitVec 32) (_ BitVec 64))) (size!12836 (_ BitVec 32))) )
))
(declare-fun lt!194989 () array!26069)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26069 (_ BitVec 32)) Bool)

(assert (=> b!426527 (= res!249974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194989 mask!1025))))

(declare-fun _keys!709 () array!26069)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426527 (= lt!194989 (array!26070 (store (arr!12484 _keys!709) i!563 k0!794) (size!12836 _keys!709)))))

(declare-fun b!426528 () Bool)

(declare-fun e!253044 () Bool)

(assert (=> b!426528 (= e!253038 e!253044)))

(declare-fun res!249980 () Bool)

(assert (=> b!426528 (=> (not res!249980) (not e!253044))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!426528 (= res!249980 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15925 0))(
  ( (V!15926 (val!5602 Int)) )
))
(declare-datatypes ((tuple2!7362 0))(
  ( (tuple2!7363 (_1!3692 (_ BitVec 64)) (_2!3692 V!15925)) )
))
(declare-datatypes ((List!7376 0))(
  ( (Nil!7373) (Cons!7372 (h!8228 tuple2!7362) (t!12820 List!7376)) )
))
(declare-datatypes ((ListLongMap!6275 0))(
  ( (ListLongMap!6276 (toList!3153 List!7376)) )
))
(declare-fun lt!194990 () ListLongMap!6275)

(declare-fun minValue!515 () V!15925)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15925)

(declare-datatypes ((ValueCell!5214 0))(
  ( (ValueCellFull!5214 (v!7849 V!15925)) (EmptyCell!5214) )
))
(declare-datatypes ((array!26071 0))(
  ( (array!26072 (arr!12485 (Array (_ BitVec 32) ValueCell!5214)) (size!12837 (_ BitVec 32))) )
))
(declare-fun lt!194992 () array!26071)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1357 (array!26069 array!26071 (_ BitVec 32) (_ BitVec 32) V!15925 V!15925 (_ BitVec 32) Int) ListLongMap!6275)

(assert (=> b!426528 (= lt!194990 (getCurrentListMapNoExtraKeys!1357 lt!194989 lt!194992 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26071)

(declare-fun v!412 () V!15925)

(assert (=> b!426528 (= lt!194992 (array!26072 (store (arr!12485 _values!549) i!563 (ValueCellFull!5214 v!412)) (size!12837 _values!549)))))

(declare-fun lt!194991 () ListLongMap!6275)

(assert (=> b!426528 (= lt!194991 (getCurrentListMapNoExtraKeys!1357 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426529 () Bool)

(declare-fun res!249971 () Bool)

(assert (=> b!426529 (=> (not res!249971) (not e!253040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426529 (= res!249971 (validMask!0 mask!1025))))

(declare-fun b!426530 () Bool)

(declare-fun res!249978 () Bool)

(assert (=> b!426530 (=> (not res!249978) (not e!253040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426530 (= res!249978 (validKeyInArray!0 k0!794))))

(declare-fun b!426532 () Bool)

(declare-fun res!249977 () Bool)

(assert (=> b!426532 (=> (not res!249977) (not e!253040))))

(declare-datatypes ((List!7377 0))(
  ( (Nil!7374) (Cons!7373 (h!8229 (_ BitVec 64)) (t!12821 List!7377)) )
))
(declare-fun arrayNoDuplicates!0 (array!26069 (_ BitVec 32) List!7377) Bool)

(assert (=> b!426532 (= res!249977 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7374))))

(declare-fun b!426533 () Bool)

(declare-fun res!249969 () Bool)

(assert (=> b!426533 (=> (not res!249969) (not e!253040))))

(declare-fun arrayContainsKey!0 (array!26069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426533 (= res!249969 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18294 () Bool)

(declare-fun mapRes!18294 () Bool)

(assert (=> mapIsEmpty!18294 mapRes!18294))

(declare-fun b!426534 () Bool)

(declare-fun res!249981 () Bool)

(assert (=> b!426534 (=> (not res!249981) (not e!253038))))

(assert (=> b!426534 (= res!249981 (arrayNoDuplicates!0 lt!194989 #b00000000000000000000000000000000 Nil!7374))))

(declare-fun b!426535 () Bool)

(declare-fun res!249970 () Bool)

(assert (=> b!426535 (=> (not res!249970) (not e!253040))))

(assert (=> b!426535 (= res!249970 (or (= (select (arr!12484 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12484 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426536 () Bool)

(declare-fun res!249972 () Bool)

(assert (=> b!426536 (=> (not res!249972) (not e!253040))))

(assert (=> b!426536 (= res!249972 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12836 _keys!709))))))

(declare-fun b!426537 () Bool)

(declare-fun res!249973 () Bool)

(assert (=> b!426537 (=> (not res!249973) (not e!253040))))

(assert (=> b!426537 (= res!249973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426538 () Bool)

(declare-fun res!249979 () Bool)

(assert (=> b!426538 (=> (not res!249979) (not e!253040))))

(assert (=> b!426538 (= res!249979 (and (= (size!12837 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12836 _keys!709) (size!12837 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!249976 () Bool)

(assert (=> start!39696 (=> (not res!249976) (not e!253040))))

(assert (=> start!39696 (= res!249976 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12836 _keys!709))))))

(assert (=> start!39696 e!253040))

(declare-fun tp_is_empty!11115 () Bool)

(assert (=> start!39696 tp_is_empty!11115))

(assert (=> start!39696 tp!35417))

(assert (=> start!39696 true))

(declare-fun e!253041 () Bool)

(declare-fun array_inv!9102 (array!26071) Bool)

(assert (=> start!39696 (and (array_inv!9102 _values!549) e!253041)))

(declare-fun array_inv!9103 (array!26069) Bool)

(assert (=> start!39696 (array_inv!9103 _keys!709)))

(declare-fun b!426531 () Bool)

(declare-fun e!253043 () Bool)

(assert (=> b!426531 (= e!253043 tp_is_empty!11115)))

(declare-fun b!426539 () Bool)

(assert (=> b!426539 (= e!253041 (and e!253043 mapRes!18294))))

(declare-fun condMapEmpty!18294 () Bool)

(declare-fun mapDefault!18294 () ValueCell!5214)

(assert (=> b!426539 (= condMapEmpty!18294 (= (arr!12485 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5214)) mapDefault!18294)))))

(declare-fun b!426540 () Bool)

(declare-fun res!249975 () Bool)

(assert (=> b!426540 (=> (not res!249975) (not e!253038))))

(assert (=> b!426540 (= res!249975 (bvsle from!863 i!563))))

(declare-fun b!426541 () Bool)

(assert (=> b!426541 (= e!253044 (not true))))

(declare-fun +!1311 (ListLongMap!6275 tuple2!7362) ListLongMap!6275)

(assert (=> b!426541 (= (getCurrentListMapNoExtraKeys!1357 lt!194989 lt!194992 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1311 (getCurrentListMapNoExtraKeys!1357 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7363 k0!794 v!412)))))

(declare-datatypes ((Unit!12524 0))(
  ( (Unit!12525) )
))
(declare-fun lt!194993 () Unit!12524)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!506 (array!26069 array!26071 (_ BitVec 32) (_ BitVec 32) V!15925 V!15925 (_ BitVec 32) (_ BitVec 64) V!15925 (_ BitVec 32) Int) Unit!12524)

(assert (=> b!426541 (= lt!194993 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!506 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426542 () Bool)

(declare-fun e!253039 () Bool)

(assert (=> b!426542 (= e!253039 tp_is_empty!11115)))

(declare-fun mapNonEmpty!18294 () Bool)

(declare-fun tp!35418 () Bool)

(assert (=> mapNonEmpty!18294 (= mapRes!18294 (and tp!35418 e!253039))))

(declare-fun mapRest!18294 () (Array (_ BitVec 32) ValueCell!5214))

(declare-fun mapKey!18294 () (_ BitVec 32))

(declare-fun mapValue!18294 () ValueCell!5214)

(assert (=> mapNonEmpty!18294 (= (arr!12485 _values!549) (store mapRest!18294 mapKey!18294 mapValue!18294))))

(assert (= (and start!39696 res!249976) b!426529))

(assert (= (and b!426529 res!249971) b!426538))

(assert (= (and b!426538 res!249979) b!426537))

(assert (= (and b!426537 res!249973) b!426532))

(assert (= (and b!426532 res!249977) b!426536))

(assert (= (and b!426536 res!249972) b!426530))

(assert (= (and b!426530 res!249978) b!426535))

(assert (= (and b!426535 res!249970) b!426533))

(assert (= (and b!426533 res!249969) b!426527))

(assert (= (and b!426527 res!249974) b!426534))

(assert (= (and b!426534 res!249981) b!426540))

(assert (= (and b!426540 res!249975) b!426528))

(assert (= (and b!426528 res!249980) b!426541))

(assert (= (and b!426539 condMapEmpty!18294) mapIsEmpty!18294))

(assert (= (and b!426539 (not condMapEmpty!18294)) mapNonEmpty!18294))

(get-info :version)

(assert (= (and mapNonEmpty!18294 ((_ is ValueCellFull!5214) mapValue!18294)) b!426542))

(assert (= (and b!426539 ((_ is ValueCellFull!5214) mapDefault!18294)) b!426531))

(assert (= start!39696 b!426539))

(declare-fun m!415199 () Bool)

(assert (=> b!426532 m!415199))

(declare-fun m!415201 () Bool)

(assert (=> b!426533 m!415201))

(declare-fun m!415203 () Bool)

(assert (=> mapNonEmpty!18294 m!415203))

(declare-fun m!415205 () Bool)

(assert (=> b!426528 m!415205))

(declare-fun m!415207 () Bool)

(assert (=> b!426528 m!415207))

(declare-fun m!415209 () Bool)

(assert (=> b!426528 m!415209))

(declare-fun m!415211 () Bool)

(assert (=> b!426537 m!415211))

(declare-fun m!415213 () Bool)

(assert (=> b!426541 m!415213))

(declare-fun m!415215 () Bool)

(assert (=> b!426541 m!415215))

(assert (=> b!426541 m!415215))

(declare-fun m!415217 () Bool)

(assert (=> b!426541 m!415217))

(declare-fun m!415219 () Bool)

(assert (=> b!426541 m!415219))

(declare-fun m!415221 () Bool)

(assert (=> b!426535 m!415221))

(declare-fun m!415223 () Bool)

(assert (=> b!426529 m!415223))

(declare-fun m!415225 () Bool)

(assert (=> b!426530 m!415225))

(declare-fun m!415227 () Bool)

(assert (=> b!426527 m!415227))

(declare-fun m!415229 () Bool)

(assert (=> b!426527 m!415229))

(declare-fun m!415231 () Bool)

(assert (=> b!426534 m!415231))

(declare-fun m!415233 () Bool)

(assert (=> start!39696 m!415233))

(declare-fun m!415235 () Bool)

(assert (=> start!39696 m!415235))

(check-sat (not b!426527) (not start!39696) b_and!17619 (not b!426537) (not b!426533) (not b!426528) (not mapNonEmpty!18294) (not b!426530) (not b_next!9963) (not b!426534) (not b!426529) tp_is_empty!11115 (not b!426541) (not b!426532))
(check-sat b_and!17619 (not b_next!9963))
