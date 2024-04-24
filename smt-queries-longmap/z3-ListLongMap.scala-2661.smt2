; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39770 () Bool)

(assert start!39770)

(declare-fun b_free!10051 () Bool)

(declare-fun b_next!10051 () Bool)

(assert (=> start!39770 (= b_free!10051 (not b_next!10051))))

(declare-fun tp!35681 () Bool)

(declare-fun b_and!17775 () Bool)

(assert (=> start!39770 (= tp!35681 b_and!17775)))

(declare-fun b!428794 () Bool)

(declare-fun res!251781 () Bool)

(declare-fun e!254055 () Bool)

(assert (=> b!428794 (=> (not res!251781) (not e!254055))))

(declare-datatypes ((array!26246 0))(
  ( (array!26247 (arr!12572 (Array (_ BitVec 32) (_ BitVec 64))) (size!12924 (_ BitVec 32))) )
))
(declare-fun lt!195984 () array!26246)

(declare-datatypes ((List!7330 0))(
  ( (Nil!7327) (Cons!7326 (h!8182 (_ BitVec 64)) (t!12822 List!7330)) )
))
(declare-fun arrayNoDuplicates!0 (array!26246 (_ BitVec 32) List!7330) Bool)

(assert (=> b!428794 (= res!251781 (arrayNoDuplicates!0 lt!195984 #b00000000000000000000000000000000 Nil!7327))))

(declare-fun b!428795 () Bool)

(declare-fun res!251775 () Bool)

(declare-fun e!254059 () Bool)

(assert (=> b!428795 (=> (not res!251775) (not e!254059))))

(declare-fun _keys!709 () array!26246)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16043 0))(
  ( (V!16044 (val!5646 Int)) )
))
(declare-datatypes ((ValueCell!5258 0))(
  ( (ValueCellFull!5258 (v!7894 V!16043)) (EmptyCell!5258) )
))
(declare-datatypes ((array!26248 0))(
  ( (array!26249 (arr!12573 (Array (_ BitVec 32) ValueCell!5258)) (size!12925 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26248)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!428795 (= res!251775 (and (= (size!12925 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12924 _keys!709) (size!12925 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428796 () Bool)

(declare-fun res!251774 () Bool)

(assert (=> b!428796 (=> (not res!251774) (not e!254055))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428796 (= res!251774 (bvsle from!863 i!563))))

(declare-fun b!428797 () Bool)

(declare-fun res!251778 () Bool)

(assert (=> b!428797 (=> (not res!251778) (not e!254059))))

(assert (=> b!428797 (= res!251778 (or (= (select (arr!12572 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12572 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428798 () Bool)

(declare-fun res!251779 () Bool)

(assert (=> b!428798 (=> (not res!251779) (not e!254059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26246 (_ BitVec 32)) Bool)

(assert (=> b!428798 (= res!251779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428799 () Bool)

(assert (=> b!428799 (= e!254059 e!254055)))

(declare-fun res!251782 () Bool)

(assert (=> b!428799 (=> (not res!251782) (not e!254055))))

(assert (=> b!428799 (= res!251782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195984 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!428799 (= lt!195984 (array!26247 (store (arr!12572 _keys!709) i!563 k0!794) (size!12924 _keys!709)))))

(declare-fun b!428800 () Bool)

(declare-fun res!251780 () Bool)

(assert (=> b!428800 (=> (not res!251780) (not e!254059))))

(declare-fun arrayContainsKey!0 (array!26246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428800 (= res!251780 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428801 () Bool)

(declare-fun res!251777 () Bool)

(assert (=> b!428801 (=> (not res!251777) (not e!254059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428801 (= res!251777 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18426 () Bool)

(declare-fun mapRes!18426 () Bool)

(assert (=> mapIsEmpty!18426 mapRes!18426))

(declare-fun b!428802 () Bool)

(declare-fun res!251776 () Bool)

(assert (=> b!428802 (=> (not res!251776) (not e!254059))))

(assert (=> b!428802 (= res!251776 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12924 _keys!709))))))

(declare-fun b!428803 () Bool)

(declare-fun e!254051 () Bool)

(declare-fun e!254052 () Bool)

(assert (=> b!428803 (= e!254051 (not e!254052))))

(declare-fun res!251783 () Bool)

(assert (=> b!428803 (=> res!251783 e!254052)))

(assert (=> b!428803 (= res!251783 (not (validKeyInArray!0 (select (arr!12572 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7328 0))(
  ( (tuple2!7329 (_1!3675 (_ BitVec 64)) (_2!3675 V!16043)) )
))
(declare-datatypes ((List!7331 0))(
  ( (Nil!7328) (Cons!7327 (h!8183 tuple2!7328) (t!12823 List!7331)) )
))
(declare-datatypes ((ListLongMap!6243 0))(
  ( (ListLongMap!6244 (toList!3137 List!7331)) )
))
(declare-fun lt!195976 () ListLongMap!6243)

(declare-fun lt!195982 () ListLongMap!6243)

(assert (=> b!428803 (= lt!195976 lt!195982)))

(declare-fun lt!195975 () ListLongMap!6243)

(declare-fun v!412 () V!16043)

(declare-fun +!1349 (ListLongMap!6243 tuple2!7328) ListLongMap!6243)

(assert (=> b!428803 (= lt!195982 (+!1349 lt!195975 (tuple2!7329 k0!794 v!412)))))

(declare-fun lt!195978 () array!26248)

(declare-fun minValue!515 () V!16043)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16043)

(declare-fun getCurrentListMapNoExtraKeys!1382 (array!26246 array!26248 (_ BitVec 32) (_ BitVec 32) V!16043 V!16043 (_ BitVec 32) Int) ListLongMap!6243)

(assert (=> b!428803 (= lt!195976 (getCurrentListMapNoExtraKeys!1382 lt!195984 lt!195978 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428803 (= lt!195975 (getCurrentListMapNoExtraKeys!1382 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12579 0))(
  ( (Unit!12580) )
))
(declare-fun lt!195980 () Unit!12579)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!531 (array!26246 array!26248 (_ BitVec 32) (_ BitVec 32) V!16043 V!16043 (_ BitVec 32) (_ BitVec 64) V!16043 (_ BitVec 32) Int) Unit!12579)

(assert (=> b!428803 (= lt!195980 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!531 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428804 () Bool)

(declare-fun e!254053 () Unit!12579)

(declare-fun Unit!12581 () Unit!12579)

(assert (=> b!428804 (= e!254053 Unit!12581)))

(declare-fun b!428805 () Bool)

(assert (=> b!428805 (= e!254055 e!254051)))

(declare-fun res!251784 () Bool)

(assert (=> b!428805 (=> (not res!251784) (not e!254051))))

(assert (=> b!428805 (= res!251784 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195983 () ListLongMap!6243)

(assert (=> b!428805 (= lt!195983 (getCurrentListMapNoExtraKeys!1382 lt!195984 lt!195978 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428805 (= lt!195978 (array!26249 (store (arr!12573 _values!549) i!563 (ValueCellFull!5258 v!412)) (size!12925 _values!549)))))

(declare-fun lt!195979 () ListLongMap!6243)

(assert (=> b!428805 (= lt!195979 (getCurrentListMapNoExtraKeys!1382 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428806 () Bool)

(declare-fun e!254058 () Bool)

(declare-fun e!254057 () Bool)

(assert (=> b!428806 (= e!254058 (and e!254057 mapRes!18426))))

(declare-fun condMapEmpty!18426 () Bool)

(declare-fun mapDefault!18426 () ValueCell!5258)

(assert (=> b!428806 (= condMapEmpty!18426 (= (arr!12573 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5258)) mapDefault!18426)))))

(declare-fun b!428807 () Bool)

(declare-fun tp_is_empty!11203 () Bool)

(assert (=> b!428807 (= e!254057 tp_is_empty!11203)))

(declare-fun b!428808 () Bool)

(assert (=> b!428808 (= e!254052 true)))

(assert (=> b!428808 (not (= (select (arr!12572 _keys!709) from!863) k0!794))))

(declare-fun lt!195981 () Unit!12579)

(assert (=> b!428808 (= lt!195981 e!254053)))

(declare-fun c!55389 () Bool)

(assert (=> b!428808 (= c!55389 (= (select (arr!12572 _keys!709) from!863) k0!794))))

(declare-fun get!6234 (ValueCell!5258 V!16043) V!16043)

(declare-fun dynLambda!763 (Int (_ BitVec 64)) V!16043)

(assert (=> b!428808 (= lt!195983 (+!1349 lt!195982 (tuple2!7329 (select (arr!12572 _keys!709) from!863) (get!6234 (select (arr!12573 _values!549) from!863) (dynLambda!763 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428809 () Bool)

(declare-fun res!251787 () Bool)

(assert (=> b!428809 (=> (not res!251787) (not e!254059))))

(assert (=> b!428809 (= res!251787 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7327))))

(declare-fun mapNonEmpty!18426 () Bool)

(declare-fun tp!35682 () Bool)

(declare-fun e!254054 () Bool)

(assert (=> mapNonEmpty!18426 (= mapRes!18426 (and tp!35682 e!254054))))

(declare-fun mapRest!18426 () (Array (_ BitVec 32) ValueCell!5258))

(declare-fun mapValue!18426 () ValueCell!5258)

(declare-fun mapKey!18426 () (_ BitVec 32))

(assert (=> mapNonEmpty!18426 (= (arr!12573 _values!549) (store mapRest!18426 mapKey!18426 mapValue!18426))))

(declare-fun res!251786 () Bool)

(assert (=> start!39770 (=> (not res!251786) (not e!254059))))

(assert (=> start!39770 (= res!251786 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12924 _keys!709))))))

(assert (=> start!39770 e!254059))

(assert (=> start!39770 tp_is_empty!11203))

(assert (=> start!39770 tp!35681))

(assert (=> start!39770 true))

(declare-fun array_inv!9222 (array!26248) Bool)

(assert (=> start!39770 (and (array_inv!9222 _values!549) e!254058)))

(declare-fun array_inv!9223 (array!26246) Bool)

(assert (=> start!39770 (array_inv!9223 _keys!709)))

(declare-fun b!428810 () Bool)

(declare-fun res!251785 () Bool)

(assert (=> b!428810 (=> (not res!251785) (not e!254059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428810 (= res!251785 (validMask!0 mask!1025))))

(declare-fun b!428811 () Bool)

(assert (=> b!428811 (= e!254054 tp_is_empty!11203)))

(declare-fun b!428812 () Bool)

(declare-fun Unit!12582 () Unit!12579)

(assert (=> b!428812 (= e!254053 Unit!12582)))

(declare-fun lt!195977 () Unit!12579)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26246 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12579)

(assert (=> b!428812 (= lt!195977 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428812 false))

(assert (= (and start!39770 res!251786) b!428810))

(assert (= (and b!428810 res!251785) b!428795))

(assert (= (and b!428795 res!251775) b!428798))

(assert (= (and b!428798 res!251779) b!428809))

(assert (= (and b!428809 res!251787) b!428802))

(assert (= (and b!428802 res!251776) b!428801))

(assert (= (and b!428801 res!251777) b!428797))

(assert (= (and b!428797 res!251778) b!428800))

(assert (= (and b!428800 res!251780) b!428799))

(assert (= (and b!428799 res!251782) b!428794))

(assert (= (and b!428794 res!251781) b!428796))

(assert (= (and b!428796 res!251774) b!428805))

(assert (= (and b!428805 res!251784) b!428803))

(assert (= (and b!428803 (not res!251783)) b!428808))

(assert (= (and b!428808 c!55389) b!428812))

(assert (= (and b!428808 (not c!55389)) b!428804))

(assert (= (and b!428806 condMapEmpty!18426) mapIsEmpty!18426))

(assert (= (and b!428806 (not condMapEmpty!18426)) mapNonEmpty!18426))

(get-info :version)

(assert (= (and mapNonEmpty!18426 ((_ is ValueCellFull!5258) mapValue!18426)) b!428811))

(assert (= (and b!428806 ((_ is ValueCellFull!5258) mapDefault!18426)) b!428807))

(assert (= start!39770 b!428806))

(declare-fun b_lambda!9161 () Bool)

(assert (=> (not b_lambda!9161) (not b!428808)))

(declare-fun t!12821 () Bool)

(declare-fun tb!3449 () Bool)

(assert (=> (and start!39770 (= defaultEntry!557 defaultEntry!557) t!12821) tb!3449))

(declare-fun result!6433 () Bool)

(assert (=> tb!3449 (= result!6433 tp_is_empty!11203)))

(assert (=> b!428808 t!12821))

(declare-fun b_and!17777 () Bool)

(assert (= b_and!17775 (and (=> t!12821 result!6433) b_and!17777)))

(declare-fun m!417443 () Bool)

(assert (=> start!39770 m!417443))

(declare-fun m!417445 () Bool)

(assert (=> start!39770 m!417445))

(declare-fun m!417447 () Bool)

(assert (=> b!428801 m!417447))

(declare-fun m!417449 () Bool)

(assert (=> b!428800 m!417449))

(declare-fun m!417451 () Bool)

(assert (=> b!428803 m!417451))

(declare-fun m!417453 () Bool)

(assert (=> b!428803 m!417453))

(declare-fun m!417455 () Bool)

(assert (=> b!428803 m!417455))

(declare-fun m!417457 () Bool)

(assert (=> b!428803 m!417457))

(assert (=> b!428803 m!417451))

(declare-fun m!417459 () Bool)

(assert (=> b!428803 m!417459))

(declare-fun m!417461 () Bool)

(assert (=> b!428803 m!417461))

(assert (=> b!428808 m!417451))

(declare-fun m!417463 () Bool)

(assert (=> b!428808 m!417463))

(declare-fun m!417465 () Bool)

(assert (=> b!428808 m!417465))

(declare-fun m!417467 () Bool)

(assert (=> b!428808 m!417467))

(assert (=> b!428808 m!417465))

(assert (=> b!428808 m!417463))

(declare-fun m!417469 () Bool)

(assert (=> b!428808 m!417469))

(declare-fun m!417471 () Bool)

(assert (=> b!428797 m!417471))

(declare-fun m!417473 () Bool)

(assert (=> mapNonEmpty!18426 m!417473))

(declare-fun m!417475 () Bool)

(assert (=> b!428799 m!417475))

(declare-fun m!417477 () Bool)

(assert (=> b!428799 m!417477))

(declare-fun m!417479 () Bool)

(assert (=> b!428812 m!417479))

(declare-fun m!417481 () Bool)

(assert (=> b!428794 m!417481))

(declare-fun m!417483 () Bool)

(assert (=> b!428810 m!417483))

(declare-fun m!417485 () Bool)

(assert (=> b!428805 m!417485))

(declare-fun m!417487 () Bool)

(assert (=> b!428805 m!417487))

(declare-fun m!417489 () Bool)

(assert (=> b!428805 m!417489))

(declare-fun m!417491 () Bool)

(assert (=> b!428798 m!417491))

(declare-fun m!417493 () Bool)

(assert (=> b!428809 m!417493))

(check-sat (not b!428798) b_and!17777 (not b!428794) (not b!428808) (not b!428801) (not start!39770) (not b!428803) (not b!428800) (not b_lambda!9161) tp_is_empty!11203 (not b!428812) (not b!428799) (not b!428810) (not b_next!10051) (not b!428805) (not b!428809) (not mapNonEmpty!18426))
(check-sat b_and!17777 (not b_next!10051))
