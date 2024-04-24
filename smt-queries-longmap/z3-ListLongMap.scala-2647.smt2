; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39686 () Bool)

(assert start!39686)

(declare-fun b_free!9967 () Bool)

(declare-fun b_next!9967 () Bool)

(assert (=> start!39686 (= b_free!9967 (not b_next!9967))))

(declare-fun tp!35429 () Bool)

(declare-fun b_and!17637 () Bool)

(assert (=> start!39686 (= tp!35429 b_and!17637)))

(declare-fun b!426574 () Bool)

(declare-fun res!250055 () Bool)

(declare-fun e!253051 () Bool)

(assert (=> b!426574 (=> (not res!250055) (not e!253051))))

(declare-datatypes ((array!26084 0))(
  ( (array!26085 (arr!12491 (Array (_ BitVec 32) (_ BitVec 64))) (size!12843 (_ BitVec 32))) )
))
(declare-fun lt!195041 () array!26084)

(declare-datatypes ((List!7269 0))(
  ( (Nil!7266) (Cons!7265 (h!8121 (_ BitVec 64)) (t!12705 List!7269)) )
))
(declare-fun arrayNoDuplicates!0 (array!26084 (_ BitVec 32) List!7269) Bool)

(assert (=> b!426574 (= res!250055 (arrayNoDuplicates!0 lt!195041 #b00000000000000000000000000000000 Nil!7266))))

(declare-fun b!426575 () Bool)

(declare-fun res!250053 () Bool)

(declare-fun e!253054 () Bool)

(assert (=> b!426575 (=> (not res!250053) (not e!253054))))

(declare-fun _keys!709 () array!26084)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426575 (= res!250053 (or (= (select (arr!12491 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12491 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426576 () Bool)

(declare-fun res!250056 () Bool)

(assert (=> b!426576 (=> (not res!250056) (not e!253054))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426576 (= res!250056 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426577 () Bool)

(declare-fun res!250051 () Bool)

(assert (=> b!426577 (=> (not res!250051) (not e!253054))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26084 (_ BitVec 32)) Bool)

(assert (=> b!426577 (= res!250051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426578 () Bool)

(declare-fun res!250046 () Bool)

(assert (=> b!426578 (=> (not res!250046) (not e!253054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426578 (= res!250046 (validKeyInArray!0 k0!794))))

(declare-fun b!426579 () Bool)

(declare-fun e!253053 () Bool)

(assert (=> b!426579 (= e!253053 (not true))))

(declare-datatypes ((V!15931 0))(
  ( (V!15932 (val!5604 Int)) )
))
(declare-fun minValue!515 () V!15931)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5216 0))(
  ( (ValueCellFull!5216 (v!7852 V!15931)) (EmptyCell!5216) )
))
(declare-datatypes ((array!26086 0))(
  ( (array!26087 (arr!12492 (Array (_ BitVec 32) ValueCell!5216)) (size!12844 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26086)

(declare-fun zeroValue!515 () V!15931)

(declare-fun lt!195040 () array!26086)

(declare-fun v!412 () V!15931)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7264 0))(
  ( (tuple2!7265 (_1!3643 (_ BitVec 64)) (_2!3643 V!15931)) )
))
(declare-datatypes ((List!7270 0))(
  ( (Nil!7267) (Cons!7266 (h!8122 tuple2!7264) (t!12706 List!7270)) )
))
(declare-datatypes ((ListLongMap!6179 0))(
  ( (ListLongMap!6180 (toList!3105 List!7270)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1351 (array!26084 array!26086 (_ BitVec 32) (_ BitVec 32) V!15931 V!15931 (_ BitVec 32) Int) ListLongMap!6179)

(declare-fun +!1318 (ListLongMap!6179 tuple2!7264) ListLongMap!6179)

(assert (=> b!426579 (= (getCurrentListMapNoExtraKeys!1351 lt!195041 lt!195040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1318 (getCurrentListMapNoExtraKeys!1351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7265 k0!794 v!412)))))

(declare-datatypes ((Unit!12511 0))(
  ( (Unit!12512) )
))
(declare-fun lt!195042 () Unit!12511)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!502 (array!26084 array!26086 (_ BitVec 32) (_ BitVec 32) V!15931 V!15931 (_ BitVec 32) (_ BitVec 64) V!15931 (_ BitVec 32) Int) Unit!12511)

(assert (=> b!426579 (= lt!195042 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!502 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426580 () Bool)

(declare-fun res!250047 () Bool)

(assert (=> b!426580 (=> (not res!250047) (not e!253054))))

(assert (=> b!426580 (= res!250047 (and (= (size!12844 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12843 _keys!709) (size!12844 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426581 () Bool)

(declare-fun res!250054 () Bool)

(assert (=> b!426581 (=> (not res!250054) (not e!253051))))

(assert (=> b!426581 (= res!250054 (bvsle from!863 i!563))))

(declare-fun b!426582 () Bool)

(assert (=> b!426582 (= e!253051 e!253053)))

(declare-fun res!250048 () Bool)

(assert (=> b!426582 (=> (not res!250048) (not e!253053))))

(assert (=> b!426582 (= res!250048 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195039 () ListLongMap!6179)

(assert (=> b!426582 (= lt!195039 (getCurrentListMapNoExtraKeys!1351 lt!195041 lt!195040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!426582 (= lt!195040 (array!26087 (store (arr!12492 _values!549) i!563 (ValueCellFull!5216 v!412)) (size!12844 _values!549)))))

(declare-fun lt!195038 () ListLongMap!6179)

(assert (=> b!426582 (= lt!195038 (getCurrentListMapNoExtraKeys!1351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426583 () Bool)

(assert (=> b!426583 (= e!253054 e!253051)))

(declare-fun res!250045 () Bool)

(assert (=> b!426583 (=> (not res!250045) (not e!253051))))

(assert (=> b!426583 (= res!250045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195041 mask!1025))))

(assert (=> b!426583 (= lt!195041 (array!26085 (store (arr!12491 _keys!709) i!563 k0!794) (size!12843 _keys!709)))))

(declare-fun mapNonEmpty!18300 () Bool)

(declare-fun mapRes!18300 () Bool)

(declare-fun tp!35430 () Bool)

(declare-fun e!253049 () Bool)

(assert (=> mapNonEmpty!18300 (= mapRes!18300 (and tp!35430 e!253049))))

(declare-fun mapRest!18300 () (Array (_ BitVec 32) ValueCell!5216))

(declare-fun mapValue!18300 () ValueCell!5216)

(declare-fun mapKey!18300 () (_ BitVec 32))

(assert (=> mapNonEmpty!18300 (= (arr!12492 _values!549) (store mapRest!18300 mapKey!18300 mapValue!18300))))

(declare-fun b!426585 () Bool)

(declare-fun e!253048 () Bool)

(declare-fun tp_is_empty!11119 () Bool)

(assert (=> b!426585 (= e!253048 tp_is_empty!11119)))

(declare-fun b!426586 () Bool)

(declare-fun res!250044 () Bool)

(assert (=> b!426586 (=> (not res!250044) (not e!253054))))

(assert (=> b!426586 (= res!250044 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7266))))

(declare-fun b!426587 () Bool)

(declare-fun e!253052 () Bool)

(assert (=> b!426587 (= e!253052 (and e!253048 mapRes!18300))))

(declare-fun condMapEmpty!18300 () Bool)

(declare-fun mapDefault!18300 () ValueCell!5216)

(assert (=> b!426587 (= condMapEmpty!18300 (= (arr!12492 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5216)) mapDefault!18300)))))

(declare-fun b!426588 () Bool)

(declare-fun res!250052 () Bool)

(assert (=> b!426588 (=> (not res!250052) (not e!253054))))

(assert (=> b!426588 (= res!250052 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12843 _keys!709))))))

(declare-fun b!426584 () Bool)

(assert (=> b!426584 (= e!253049 tp_is_empty!11119)))

(declare-fun res!250050 () Bool)

(assert (=> start!39686 (=> (not res!250050) (not e!253054))))

(assert (=> start!39686 (= res!250050 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12843 _keys!709))))))

(assert (=> start!39686 e!253054))

(assert (=> start!39686 tp_is_empty!11119))

(assert (=> start!39686 tp!35429))

(assert (=> start!39686 true))

(declare-fun array_inv!9172 (array!26086) Bool)

(assert (=> start!39686 (and (array_inv!9172 _values!549) e!253052)))

(declare-fun array_inv!9173 (array!26084) Bool)

(assert (=> start!39686 (array_inv!9173 _keys!709)))

(declare-fun b!426589 () Bool)

(declare-fun res!250049 () Bool)

(assert (=> b!426589 (=> (not res!250049) (not e!253054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426589 (= res!250049 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18300 () Bool)

(assert (=> mapIsEmpty!18300 mapRes!18300))

(assert (= (and start!39686 res!250050) b!426589))

(assert (= (and b!426589 res!250049) b!426580))

(assert (= (and b!426580 res!250047) b!426577))

(assert (= (and b!426577 res!250051) b!426586))

(assert (= (and b!426586 res!250044) b!426588))

(assert (= (and b!426588 res!250052) b!426578))

(assert (= (and b!426578 res!250046) b!426575))

(assert (= (and b!426575 res!250053) b!426576))

(assert (= (and b!426576 res!250056) b!426583))

(assert (= (and b!426583 res!250045) b!426574))

(assert (= (and b!426574 res!250055) b!426581))

(assert (= (and b!426581 res!250054) b!426582))

(assert (= (and b!426582 res!250048) b!426579))

(assert (= (and b!426587 condMapEmpty!18300) mapIsEmpty!18300))

(assert (= (and b!426587 (not condMapEmpty!18300)) mapNonEmpty!18300))

(get-info :version)

(assert (= (and mapNonEmpty!18300 ((_ is ValueCellFull!5216) mapValue!18300)) b!426584))

(assert (= (and b!426587 ((_ is ValueCellFull!5216) mapDefault!18300)) b!426585))

(assert (= start!39686 b!426587))

(declare-fun m!415493 () Bool)

(assert (=> start!39686 m!415493))

(declare-fun m!415495 () Bool)

(assert (=> start!39686 m!415495))

(declare-fun m!415497 () Bool)

(assert (=> b!426582 m!415497))

(declare-fun m!415499 () Bool)

(assert (=> b!426582 m!415499))

(declare-fun m!415501 () Bool)

(assert (=> b!426582 m!415501))

(declare-fun m!415503 () Bool)

(assert (=> b!426576 m!415503))

(declare-fun m!415505 () Bool)

(assert (=> b!426583 m!415505))

(declare-fun m!415507 () Bool)

(assert (=> b!426583 m!415507))

(declare-fun m!415509 () Bool)

(assert (=> b!426574 m!415509))

(declare-fun m!415511 () Bool)

(assert (=> b!426577 m!415511))

(declare-fun m!415513 () Bool)

(assert (=> b!426579 m!415513))

(declare-fun m!415515 () Bool)

(assert (=> b!426579 m!415515))

(assert (=> b!426579 m!415515))

(declare-fun m!415517 () Bool)

(assert (=> b!426579 m!415517))

(declare-fun m!415519 () Bool)

(assert (=> b!426579 m!415519))

(declare-fun m!415521 () Bool)

(assert (=> b!426586 m!415521))

(declare-fun m!415523 () Bool)

(assert (=> mapNonEmpty!18300 m!415523))

(declare-fun m!415525 () Bool)

(assert (=> b!426589 m!415525))

(declare-fun m!415527 () Bool)

(assert (=> b!426575 m!415527))

(declare-fun m!415529 () Bool)

(assert (=> b!426578 m!415529))

(check-sat (not start!39686) (not b!426579) (not b!426577) (not b!426583) (not b_next!9967) (not b!426589) (not b!426574) (not b!426586) (not b!426582) tp_is_empty!11119 (not b!426576) (not b!426578) (not mapNonEmpty!18300) b_and!17637)
(check-sat b_and!17637 (not b_next!9967))
