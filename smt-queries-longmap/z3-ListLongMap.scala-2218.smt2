; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36772 () Bool)

(assert start!36772)

(declare-fun b!367110 () Bool)

(declare-fun res!205470 () Bool)

(declare-fun e!224701 () Bool)

(assert (=> b!367110 (=> (not res!205470) (not e!224701))))

(declare-datatypes ((array!21053 0))(
  ( (array!21054 (arr!9995 (Array (_ BitVec 32) (_ BitVec 64))) (size!10347 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21053)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367110 (= res!205470 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367111 () Bool)

(declare-fun e!224704 () Bool)

(assert (=> b!367111 (= e!224701 e!224704)))

(declare-fun res!205478 () Bool)

(assert (=> b!367111 (=> (not res!205478) (not e!224704))))

(declare-fun lt!169328 () array!21053)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21053 (_ BitVec 32)) Bool)

(assert (=> b!367111 (= res!205478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169328 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367111 (= lt!169328 (array!21054 (store (arr!9995 _keys!658) i!548 k0!778) (size!10347 _keys!658)))))

(declare-fun b!367112 () Bool)

(declare-fun res!205475 () Bool)

(assert (=> b!367112 (=> (not res!205475) (not e!224701))))

(assert (=> b!367112 (= res!205475 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10347 _keys!658))))))

(declare-fun mapNonEmpty!14385 () Bool)

(declare-fun mapRes!14385 () Bool)

(declare-fun tp!28461 () Bool)

(declare-fun e!224702 () Bool)

(assert (=> mapNonEmpty!14385 (= mapRes!14385 (and tp!28461 e!224702))))

(declare-datatypes ((V!12501 0))(
  ( (V!12502 (val!4318 Int)) )
))
(declare-datatypes ((ValueCell!3930 0))(
  ( (ValueCellFull!3930 (v!6515 V!12501)) (EmptyCell!3930) )
))
(declare-datatypes ((array!21055 0))(
  ( (array!21056 (arr!9996 (Array (_ BitVec 32) ValueCell!3930)) (size!10348 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21055)

(declare-fun mapKey!14385 () (_ BitVec 32))

(declare-fun mapRest!14385 () (Array (_ BitVec 32) ValueCell!3930))

(declare-fun mapValue!14385 () ValueCell!3930)

(assert (=> mapNonEmpty!14385 (= (arr!9996 _values!506) (store mapRest!14385 mapKey!14385 mapValue!14385))))

(declare-fun b!367113 () Bool)

(declare-fun res!205471 () Bool)

(assert (=> b!367113 (=> (not res!205471) (not e!224701))))

(assert (=> b!367113 (= res!205471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367114 () Bool)

(declare-fun tp_is_empty!8547 () Bool)

(assert (=> b!367114 (= e!224702 tp_is_empty!8547)))

(declare-fun res!205476 () Bool)

(assert (=> start!36772 (=> (not res!205476) (not e!224701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36772 (= res!205476 (validMask!0 mask!970))))

(assert (=> start!36772 e!224701))

(assert (=> start!36772 true))

(declare-fun e!224700 () Bool)

(declare-fun array_inv!7390 (array!21055) Bool)

(assert (=> start!36772 (and (array_inv!7390 _values!506) e!224700)))

(declare-fun array_inv!7391 (array!21053) Bool)

(assert (=> start!36772 (array_inv!7391 _keys!658)))

(declare-fun b!367115 () Bool)

(declare-fun e!224703 () Bool)

(assert (=> b!367115 (= e!224703 tp_is_empty!8547)))

(declare-fun b!367116 () Bool)

(declare-fun res!205477 () Bool)

(assert (=> b!367116 (=> (not res!205477) (not e!224701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367116 (= res!205477 (validKeyInArray!0 k0!778))))

(declare-fun b!367117 () Bool)

(assert (=> b!367117 (= e!224700 (and e!224703 mapRes!14385))))

(declare-fun condMapEmpty!14385 () Bool)

(declare-fun mapDefault!14385 () ValueCell!3930)

(assert (=> b!367117 (= condMapEmpty!14385 (= (arr!9996 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3930)) mapDefault!14385)))))

(declare-fun b!367118 () Bool)

(assert (=> b!367118 (= e!224704 false)))

(declare-fun lt!169329 () Bool)

(declare-datatypes ((List!5561 0))(
  ( (Nil!5558) (Cons!5557 (h!6413 (_ BitVec 64)) (t!10711 List!5561)) )
))
(declare-fun arrayNoDuplicates!0 (array!21053 (_ BitVec 32) List!5561) Bool)

(assert (=> b!367118 (= lt!169329 (arrayNoDuplicates!0 lt!169328 #b00000000000000000000000000000000 Nil!5558))))

(declare-fun b!367119 () Bool)

(declare-fun res!205474 () Bool)

(assert (=> b!367119 (=> (not res!205474) (not e!224701))))

(assert (=> b!367119 (= res!205474 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5558))))

(declare-fun b!367120 () Bool)

(declare-fun res!205472 () Bool)

(assert (=> b!367120 (=> (not res!205472) (not e!224701))))

(assert (=> b!367120 (= res!205472 (or (= (select (arr!9995 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9995 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367121 () Bool)

(declare-fun res!205473 () Bool)

(assert (=> b!367121 (=> (not res!205473) (not e!224701))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367121 (= res!205473 (and (= (size!10348 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10347 _keys!658) (size!10348 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14385 () Bool)

(assert (=> mapIsEmpty!14385 mapRes!14385))

(assert (= (and start!36772 res!205476) b!367121))

(assert (= (and b!367121 res!205473) b!367113))

(assert (= (and b!367113 res!205471) b!367119))

(assert (= (and b!367119 res!205474) b!367112))

(assert (= (and b!367112 res!205475) b!367116))

(assert (= (and b!367116 res!205477) b!367120))

(assert (= (and b!367120 res!205472) b!367110))

(assert (= (and b!367110 res!205470) b!367111))

(assert (= (and b!367111 res!205478) b!367118))

(assert (= (and b!367117 condMapEmpty!14385) mapIsEmpty!14385))

(assert (= (and b!367117 (not condMapEmpty!14385)) mapNonEmpty!14385))

(get-info :version)

(assert (= (and mapNonEmpty!14385 ((_ is ValueCellFull!3930) mapValue!14385)) b!367114))

(assert (= (and b!367117 ((_ is ValueCellFull!3930) mapDefault!14385)) b!367115))

(assert (= start!36772 b!367117))

(declare-fun m!364203 () Bool)

(assert (=> b!367120 m!364203))

(declare-fun m!364205 () Bool)

(assert (=> start!36772 m!364205))

(declare-fun m!364207 () Bool)

(assert (=> start!36772 m!364207))

(declare-fun m!364209 () Bool)

(assert (=> start!36772 m!364209))

(declare-fun m!364211 () Bool)

(assert (=> b!367110 m!364211))

(declare-fun m!364213 () Bool)

(assert (=> b!367111 m!364213))

(declare-fun m!364215 () Bool)

(assert (=> b!367111 m!364215))

(declare-fun m!364217 () Bool)

(assert (=> b!367118 m!364217))

(declare-fun m!364219 () Bool)

(assert (=> b!367119 m!364219))

(declare-fun m!364221 () Bool)

(assert (=> mapNonEmpty!14385 m!364221))

(declare-fun m!364223 () Bool)

(assert (=> b!367113 m!364223))

(declare-fun m!364225 () Bool)

(assert (=> b!367116 m!364225))

(check-sat (not b!367119) (not b!367111) (not mapNonEmpty!14385) (not start!36772) (not b!367113) (not b!367110) (not b!367118) tp_is_empty!8547 (not b!367116))
(check-sat)
