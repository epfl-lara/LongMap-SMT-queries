; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36834 () Bool)

(assert start!36834)

(declare-fun b_free!7975 () Bool)

(declare-fun b_next!7975 () Bool)

(assert (=> start!36834 (= b_free!7975 (not b_next!7975))))

(declare-fun tp!28641 () Bool)

(declare-fun b_and!15191 () Bool)

(assert (=> start!36834 (= tp!28641 b_and!15191)))

(declare-fun b!368281 () Bool)

(declare-fun res!206450 () Bool)

(declare-fun e!225213 () Bool)

(assert (=> b!368281 (=> (not res!206450) (not e!225213))))

(declare-datatypes ((array!21183 0))(
  ( (array!21184 (arr!10060 (Array (_ BitVec 32) (_ BitVec 64))) (size!10413 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21183)

(declare-datatypes ((List!5572 0))(
  ( (Nil!5569) (Cons!5568 (h!6424 (_ BitVec 64)) (t!10713 List!5572)) )
))
(declare-fun arrayNoDuplicates!0 (array!21183 (_ BitVec 32) List!5572) Bool)

(assert (=> b!368281 (= res!206450 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5569))))

(declare-fun b!368282 () Bool)

(declare-fun e!225215 () Bool)

(declare-fun e!225212 () Bool)

(declare-fun mapRes!14499 () Bool)

(assert (=> b!368282 (= e!225215 (and e!225212 mapRes!14499))))

(declare-fun condMapEmpty!14499 () Bool)

(declare-datatypes ((V!12603 0))(
  ( (V!12604 (val!4356 Int)) )
))
(declare-datatypes ((ValueCell!3968 0))(
  ( (ValueCellFull!3968 (v!6547 V!12603)) (EmptyCell!3968) )
))
(declare-datatypes ((array!21185 0))(
  ( (array!21186 (arr!10061 (Array (_ BitVec 32) ValueCell!3968)) (size!10414 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21185)

(declare-fun mapDefault!14499 () ValueCell!3968)

(assert (=> b!368282 (= condMapEmpty!14499 (= (arr!10061 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3968)) mapDefault!14499)))))

(declare-fun b!368283 () Bool)

(declare-fun e!225211 () Bool)

(assert (=> b!368283 (= e!225211 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5744 0))(
  ( (tuple2!5745 (_1!2883 (_ BitVec 64)) (_2!2883 V!12603)) )
))
(declare-datatypes ((List!5573 0))(
  ( (Nil!5570) (Cons!5569 (h!6425 tuple2!5744) (t!10714 List!5573)) )
))
(declare-datatypes ((ListLongMap!4647 0))(
  ( (ListLongMap!4648 (toList!2339 List!5573)) )
))
(declare-fun lt!169313 () ListLongMap!4647)

(declare-fun zeroValue!472 () V!12603)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12603)

(declare-fun getCurrentListMapNoExtraKeys!630 (array!21183 array!21185 (_ BitVec 32) (_ BitVec 32) V!12603 V!12603 (_ BitVec 32) Int) ListLongMap!4647)

(assert (=> b!368283 (= lt!169313 (getCurrentListMapNoExtraKeys!630 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368284 () Bool)

(declare-fun res!206442 () Bool)

(assert (=> b!368284 (=> (not res!206442) (not e!225211))))

(declare-fun lt!169314 () array!21183)

(assert (=> b!368284 (= res!206442 (arrayNoDuplicates!0 lt!169314 #b00000000000000000000000000000000 Nil!5569))))

(declare-fun b!368285 () Bool)

(declare-fun res!206447 () Bool)

(assert (=> b!368285 (=> (not res!206447) (not e!225213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21183 (_ BitVec 32)) Bool)

(assert (=> b!368285 (= res!206447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368286 () Bool)

(declare-fun res!206446 () Bool)

(assert (=> b!368286 (=> (not res!206446) (not e!225213))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368286 (= res!206446 (validKeyInArray!0 k0!778))))

(declare-fun b!368287 () Bool)

(declare-fun res!206449 () Bool)

(assert (=> b!368287 (=> (not res!206449) (not e!225213))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368287 (= res!206449 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10413 _keys!658))))))

(declare-fun mapIsEmpty!14499 () Bool)

(assert (=> mapIsEmpty!14499 mapRes!14499))

(declare-fun b!368288 () Bool)

(declare-fun tp_is_empty!8623 () Bool)

(assert (=> b!368288 (= e!225212 tp_is_empty!8623)))

(declare-fun b!368289 () Bool)

(assert (=> b!368289 (= e!225213 e!225211)))

(declare-fun res!206445 () Bool)

(assert (=> b!368289 (=> (not res!206445) (not e!225211))))

(assert (=> b!368289 (= res!206445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169314 mask!970))))

(assert (=> b!368289 (= lt!169314 (array!21184 (store (arr!10060 _keys!658) i!548 k0!778) (size!10413 _keys!658)))))

(declare-fun res!206448 () Bool)

(assert (=> start!36834 (=> (not res!206448) (not e!225213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36834 (= res!206448 (validMask!0 mask!970))))

(assert (=> start!36834 e!225213))

(assert (=> start!36834 true))

(declare-fun array_inv!7452 (array!21185) Bool)

(assert (=> start!36834 (and (array_inv!7452 _values!506) e!225215)))

(assert (=> start!36834 tp!28641))

(assert (=> start!36834 tp_is_empty!8623))

(declare-fun array_inv!7453 (array!21183) Bool)

(assert (=> start!36834 (array_inv!7453 _keys!658)))

(declare-fun b!368290 () Bool)

(declare-fun e!225210 () Bool)

(assert (=> b!368290 (= e!225210 tp_is_empty!8623)))

(declare-fun b!368291 () Bool)

(declare-fun res!206441 () Bool)

(assert (=> b!368291 (=> (not res!206441) (not e!225213))))

(assert (=> b!368291 (= res!206441 (and (= (size!10414 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10413 _keys!658) (size!10414 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368292 () Bool)

(declare-fun res!206443 () Bool)

(assert (=> b!368292 (=> (not res!206443) (not e!225213))))

(declare-fun arrayContainsKey!0 (array!21183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368292 (= res!206443 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368293 () Bool)

(declare-fun res!206444 () Bool)

(assert (=> b!368293 (=> (not res!206444) (not e!225213))))

(assert (=> b!368293 (= res!206444 (or (= (select (arr!10060 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10060 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14499 () Bool)

(declare-fun tp!28640 () Bool)

(assert (=> mapNonEmpty!14499 (= mapRes!14499 (and tp!28640 e!225210))))

(declare-fun mapRest!14499 () (Array (_ BitVec 32) ValueCell!3968))

(declare-fun mapKey!14499 () (_ BitVec 32))

(declare-fun mapValue!14499 () ValueCell!3968)

(assert (=> mapNonEmpty!14499 (= (arr!10061 _values!506) (store mapRest!14499 mapKey!14499 mapValue!14499))))

(assert (= (and start!36834 res!206448) b!368291))

(assert (= (and b!368291 res!206441) b!368285))

(assert (= (and b!368285 res!206447) b!368281))

(assert (= (and b!368281 res!206450) b!368287))

(assert (= (and b!368287 res!206449) b!368286))

(assert (= (and b!368286 res!206446) b!368293))

(assert (= (and b!368293 res!206444) b!368292))

(assert (= (and b!368292 res!206443) b!368289))

(assert (= (and b!368289 res!206445) b!368284))

(assert (= (and b!368284 res!206442) b!368283))

(assert (= (and b!368282 condMapEmpty!14499) mapIsEmpty!14499))

(assert (= (and b!368282 (not condMapEmpty!14499)) mapNonEmpty!14499))

(get-info :version)

(assert (= (and mapNonEmpty!14499 ((_ is ValueCellFull!3968) mapValue!14499)) b!368290))

(assert (= (and b!368282 ((_ is ValueCellFull!3968) mapDefault!14499)) b!368288))

(assert (= start!36834 b!368282))

(declare-fun m!364433 () Bool)

(assert (=> b!368285 m!364433))

(declare-fun m!364435 () Bool)

(assert (=> b!368281 m!364435))

(declare-fun m!364437 () Bool)

(assert (=> b!368286 m!364437))

(declare-fun m!364439 () Bool)

(assert (=> b!368292 m!364439))

(declare-fun m!364441 () Bool)

(assert (=> b!368293 m!364441))

(declare-fun m!364443 () Bool)

(assert (=> b!368284 m!364443))

(declare-fun m!364445 () Bool)

(assert (=> b!368283 m!364445))

(declare-fun m!364447 () Bool)

(assert (=> start!36834 m!364447))

(declare-fun m!364449 () Bool)

(assert (=> start!36834 m!364449))

(declare-fun m!364451 () Bool)

(assert (=> start!36834 m!364451))

(declare-fun m!364453 () Bool)

(assert (=> b!368289 m!364453))

(declare-fun m!364455 () Bool)

(assert (=> b!368289 m!364455))

(declare-fun m!364457 () Bool)

(assert (=> mapNonEmpty!14499 m!364457))

(check-sat (not b_next!7975) (not b!368286) (not mapNonEmpty!14499) b_and!15191 (not b!368285) (not b!368281) (not b!368292) tp_is_empty!8623 (not b!368284) (not b!368283) (not b!368289) (not start!36834))
(check-sat b_and!15191 (not b_next!7975))
