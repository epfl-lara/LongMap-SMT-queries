; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40386 () Bool)

(assert start!40386)

(declare-fun mapIsEmpty!19305 () Bool)

(declare-fun mapRes!19305 () Bool)

(assert (=> mapIsEmpty!19305 mapRes!19305))

(declare-fun mapNonEmpty!19305 () Bool)

(declare-fun tp!37287 () Bool)

(declare-fun e!261210 () Bool)

(assert (=> mapNonEmpty!19305 (= mapRes!19305 (and tp!37287 e!261210))))

(declare-fun mapKey!19305 () (_ BitVec 32))

(declare-datatypes ((V!16819 0))(
  ( (V!16820 (val!5937 Int)) )
))
(declare-datatypes ((ValueCell!5549 0))(
  ( (ValueCellFull!5549 (v!8189 V!16819)) (EmptyCell!5549) )
))
(declare-fun mapRest!19305 () (Array (_ BitVec 32) ValueCell!5549))

(declare-fun mapValue!19305 () ValueCell!5549)

(declare-datatypes ((array!27384 0))(
  ( (array!27385 (arr!13139 (Array (_ BitVec 32) ValueCell!5549)) (size!13491 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27384)

(assert (=> mapNonEmpty!19305 (= (arr!13139 _values!549) (store mapRest!19305 mapKey!19305 mapValue!19305))))

(declare-fun b!444097 () Bool)

(declare-fun res!263316 () Bool)

(declare-fun e!261209 () Bool)

(assert (=> b!444097 (=> (not res!263316) (not e!261209))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444097 (= res!263316 (validMask!0 mask!1025))))

(declare-fun b!444098 () Bool)

(declare-fun e!261206 () Bool)

(declare-fun tp_is_empty!11785 () Bool)

(assert (=> b!444098 (= e!261206 tp_is_empty!11785)))

(declare-fun b!444100 () Bool)

(declare-fun res!263309 () Bool)

(assert (=> b!444100 (=> (not res!263309) (not e!261209))))

(declare-datatypes ((array!27386 0))(
  ( (array!27387 (arr!13140 (Array (_ BitVec 32) (_ BitVec 64))) (size!13492 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27386)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27386 (_ BitVec 32)) Bool)

(assert (=> b!444100 (= res!263309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444101 () Bool)

(declare-fun res!263311 () Bool)

(assert (=> b!444101 (=> (not res!263311) (not e!261209))))

(declare-datatypes ((List!7778 0))(
  ( (Nil!7775) (Cons!7774 (h!8630 (_ BitVec 64)) (t!13528 List!7778)) )
))
(declare-fun arrayNoDuplicates!0 (array!27386 (_ BitVec 32) List!7778) Bool)

(assert (=> b!444101 (= res!263311 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7775))))

(declare-fun b!444102 () Bool)

(declare-fun res!263308 () Bool)

(assert (=> b!444102 (=> (not res!263308) (not e!261209))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444102 (= res!263308 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13492 _keys!709))))))

(declare-fun b!444103 () Bool)

(declare-fun res!263312 () Bool)

(assert (=> b!444103 (=> (not res!263312) (not e!261209))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444103 (= res!263312 (validKeyInArray!0 k0!794))))

(declare-fun b!444104 () Bool)

(declare-fun res!263314 () Bool)

(assert (=> b!444104 (=> (not res!263314) (not e!261209))))

(declare-fun arrayContainsKey!0 (array!27386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444104 (= res!263314 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444105 () Bool)

(assert (=> b!444105 (= e!261210 tp_is_empty!11785)))

(declare-fun b!444106 () Bool)

(declare-fun e!261207 () Bool)

(assert (=> b!444106 (= e!261207 (and e!261206 mapRes!19305))))

(declare-fun condMapEmpty!19305 () Bool)

(declare-fun mapDefault!19305 () ValueCell!5549)

(assert (=> b!444106 (= condMapEmpty!19305 (= (arr!13139 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5549)) mapDefault!19305)))))

(declare-fun b!444107 () Bool)

(declare-fun res!263317 () Bool)

(assert (=> b!444107 (=> (not res!263317) (not e!261209))))

(assert (=> b!444107 (= res!263317 (or (= (select (arr!13140 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13140 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444108 () Bool)

(declare-fun res!263315 () Bool)

(assert (=> b!444108 (=> (not res!263315) (not e!261209))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444108 (= res!263315 (and (= (size!13491 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13492 _keys!709) (size!13491 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444109 () Bool)

(declare-fun e!261205 () Bool)

(assert (=> b!444109 (= e!261205 false)))

(declare-fun lt!203465 () Bool)

(declare-fun lt!203466 () array!27386)

(assert (=> b!444109 (= lt!203465 (arrayNoDuplicates!0 lt!203466 #b00000000000000000000000000000000 Nil!7775))))

(declare-fun res!263313 () Bool)

(assert (=> start!40386 (=> (not res!263313) (not e!261209))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40386 (= res!263313 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13492 _keys!709))))))

(assert (=> start!40386 e!261209))

(assert (=> start!40386 true))

(declare-fun array_inv!9602 (array!27384) Bool)

(assert (=> start!40386 (and (array_inv!9602 _values!549) e!261207)))

(declare-fun array_inv!9603 (array!27386) Bool)

(assert (=> start!40386 (array_inv!9603 _keys!709)))

(declare-fun b!444099 () Bool)

(assert (=> b!444099 (= e!261209 e!261205)))

(declare-fun res!263310 () Bool)

(assert (=> b!444099 (=> (not res!263310) (not e!261205))))

(assert (=> b!444099 (= res!263310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203466 mask!1025))))

(assert (=> b!444099 (= lt!203466 (array!27387 (store (arr!13140 _keys!709) i!563 k0!794) (size!13492 _keys!709)))))

(assert (= (and start!40386 res!263313) b!444097))

(assert (= (and b!444097 res!263316) b!444108))

(assert (= (and b!444108 res!263315) b!444100))

(assert (= (and b!444100 res!263309) b!444101))

(assert (= (and b!444101 res!263311) b!444102))

(assert (= (and b!444102 res!263308) b!444103))

(assert (= (and b!444103 res!263312) b!444107))

(assert (= (and b!444107 res!263317) b!444104))

(assert (= (and b!444104 res!263314) b!444099))

(assert (= (and b!444099 res!263310) b!444109))

(assert (= (and b!444106 condMapEmpty!19305) mapIsEmpty!19305))

(assert (= (and b!444106 (not condMapEmpty!19305)) mapNonEmpty!19305))

(get-info :version)

(assert (= (and mapNonEmpty!19305 ((_ is ValueCellFull!5549) mapValue!19305)) b!444105))

(assert (= (and b!444106 ((_ is ValueCellFull!5549) mapDefault!19305)) b!444098))

(assert (= start!40386 b!444106))

(declare-fun m!430359 () Bool)

(assert (=> b!444097 m!430359))

(declare-fun m!430361 () Bool)

(assert (=> b!444107 m!430361))

(declare-fun m!430363 () Bool)

(assert (=> b!444101 m!430363))

(declare-fun m!430365 () Bool)

(assert (=> start!40386 m!430365))

(declare-fun m!430367 () Bool)

(assert (=> start!40386 m!430367))

(declare-fun m!430369 () Bool)

(assert (=> b!444103 m!430369))

(declare-fun m!430371 () Bool)

(assert (=> mapNonEmpty!19305 m!430371))

(declare-fun m!430373 () Bool)

(assert (=> b!444099 m!430373))

(declare-fun m!430375 () Bool)

(assert (=> b!444099 m!430375))

(declare-fun m!430377 () Bool)

(assert (=> b!444100 m!430377))

(declare-fun m!430379 () Bool)

(assert (=> b!444104 m!430379))

(declare-fun m!430381 () Bool)

(assert (=> b!444109 m!430381))

(check-sat (not b!444099) (not mapNonEmpty!19305) (not b!444101) (not b!444100) (not start!40386) tp_is_empty!11785 (not b!444103) (not b!444109) (not b!444097) (not b!444104))
(check-sat)
