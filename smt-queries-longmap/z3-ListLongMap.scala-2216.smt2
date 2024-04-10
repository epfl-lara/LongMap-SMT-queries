; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36760 () Bool)

(assert start!36760)

(declare-fun res!205308 () Bool)

(declare-fun e!224595 () Bool)

(assert (=> start!36760 (=> (not res!205308) (not e!224595))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36760 (= res!205308 (validMask!0 mask!970))))

(assert (=> start!36760 e!224595))

(assert (=> start!36760 true))

(declare-datatypes ((V!12485 0))(
  ( (V!12486 (val!4312 Int)) )
))
(declare-datatypes ((ValueCell!3924 0))(
  ( (ValueCellFull!3924 (v!6509 V!12485)) (EmptyCell!3924) )
))
(declare-datatypes ((array!21029 0))(
  ( (array!21030 (arr!9983 (Array (_ BitVec 32) ValueCell!3924)) (size!10335 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21029)

(declare-fun e!224593 () Bool)

(declare-fun array_inv!7384 (array!21029) Bool)

(assert (=> start!36760 (and (array_inv!7384 _values!506) e!224593)))

(declare-datatypes ((array!21031 0))(
  ( (array!21032 (arr!9984 (Array (_ BitVec 32) (_ BitVec 64))) (size!10336 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21031)

(declare-fun array_inv!7385 (array!21031) Bool)

(assert (=> start!36760 (array_inv!7385 _keys!658)))

(declare-fun b!366894 () Bool)

(declare-fun e!224594 () Bool)

(declare-fun tp_is_empty!8535 () Bool)

(assert (=> b!366894 (= e!224594 tp_is_empty!8535)))

(declare-fun b!366895 () Bool)

(declare-fun e!224596 () Bool)

(assert (=> b!366895 (= e!224595 e!224596)))

(declare-fun res!205314 () Bool)

(assert (=> b!366895 (=> (not res!205314) (not e!224596))))

(declare-fun lt!169293 () array!21031)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21031 (_ BitVec 32)) Bool)

(assert (=> b!366895 (= res!205314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169293 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366895 (= lt!169293 (array!21032 (store (arr!9984 _keys!658) i!548 k0!778) (size!10336 _keys!658)))))

(declare-fun b!366896 () Bool)

(declare-fun res!205315 () Bool)

(assert (=> b!366896 (=> (not res!205315) (not e!224595))))

(declare-fun arrayContainsKey!0 (array!21031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366896 (= res!205315 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14367 () Bool)

(declare-fun mapRes!14367 () Bool)

(assert (=> mapIsEmpty!14367 mapRes!14367))

(declare-fun b!366897 () Bool)

(declare-fun res!205311 () Bool)

(assert (=> b!366897 (=> (not res!205311) (not e!224595))))

(assert (=> b!366897 (= res!205311 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10336 _keys!658))))))

(declare-fun b!366898 () Bool)

(declare-fun res!205316 () Bool)

(assert (=> b!366898 (=> (not res!205316) (not e!224595))))

(assert (=> b!366898 (= res!205316 (or (= (select (arr!9984 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9984 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366899 () Bool)

(declare-fun res!205313 () Bool)

(assert (=> b!366899 (=> (not res!205313) (not e!224595))))

(assert (=> b!366899 (= res!205313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366900 () Bool)

(declare-fun res!205312 () Bool)

(assert (=> b!366900 (=> (not res!205312) (not e!224595))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366900 (= res!205312 (and (= (size!10335 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10336 _keys!658) (size!10335 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366901 () Bool)

(declare-fun e!224592 () Bool)

(assert (=> b!366901 (= e!224592 tp_is_empty!8535)))

(declare-fun b!366902 () Bool)

(assert (=> b!366902 (= e!224593 (and e!224594 mapRes!14367))))

(declare-fun condMapEmpty!14367 () Bool)

(declare-fun mapDefault!14367 () ValueCell!3924)

(assert (=> b!366902 (= condMapEmpty!14367 (= (arr!9983 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3924)) mapDefault!14367)))))

(declare-fun b!366903 () Bool)

(assert (=> b!366903 (= e!224596 false)))

(declare-fun lt!169292 () Bool)

(declare-datatypes ((List!5555 0))(
  ( (Nil!5552) (Cons!5551 (h!6407 (_ BitVec 64)) (t!10705 List!5555)) )
))
(declare-fun arrayNoDuplicates!0 (array!21031 (_ BitVec 32) List!5555) Bool)

(assert (=> b!366903 (= lt!169292 (arrayNoDuplicates!0 lt!169293 #b00000000000000000000000000000000 Nil!5552))))

(declare-fun b!366904 () Bool)

(declare-fun res!205310 () Bool)

(assert (=> b!366904 (=> (not res!205310) (not e!224595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366904 (= res!205310 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14367 () Bool)

(declare-fun tp!28443 () Bool)

(assert (=> mapNonEmpty!14367 (= mapRes!14367 (and tp!28443 e!224592))))

(declare-fun mapValue!14367 () ValueCell!3924)

(declare-fun mapRest!14367 () (Array (_ BitVec 32) ValueCell!3924))

(declare-fun mapKey!14367 () (_ BitVec 32))

(assert (=> mapNonEmpty!14367 (= (arr!9983 _values!506) (store mapRest!14367 mapKey!14367 mapValue!14367))))

(declare-fun b!366905 () Bool)

(declare-fun res!205309 () Bool)

(assert (=> b!366905 (=> (not res!205309) (not e!224595))))

(assert (=> b!366905 (= res!205309 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5552))))

(assert (= (and start!36760 res!205308) b!366900))

(assert (= (and b!366900 res!205312) b!366899))

(assert (= (and b!366899 res!205313) b!366905))

(assert (= (and b!366905 res!205309) b!366897))

(assert (= (and b!366897 res!205311) b!366904))

(assert (= (and b!366904 res!205310) b!366898))

(assert (= (and b!366898 res!205316) b!366896))

(assert (= (and b!366896 res!205315) b!366895))

(assert (= (and b!366895 res!205314) b!366903))

(assert (= (and b!366902 condMapEmpty!14367) mapIsEmpty!14367))

(assert (= (and b!366902 (not condMapEmpty!14367)) mapNonEmpty!14367))

(get-info :version)

(assert (= (and mapNonEmpty!14367 ((_ is ValueCellFull!3924) mapValue!14367)) b!366901))

(assert (= (and b!366902 ((_ is ValueCellFull!3924) mapDefault!14367)) b!366894))

(assert (= start!36760 b!366902))

(declare-fun m!364059 () Bool)

(assert (=> b!366898 m!364059))

(declare-fun m!364061 () Bool)

(assert (=> b!366904 m!364061))

(declare-fun m!364063 () Bool)

(assert (=> b!366903 m!364063))

(declare-fun m!364065 () Bool)

(assert (=> b!366896 m!364065))

(declare-fun m!364067 () Bool)

(assert (=> b!366895 m!364067))

(declare-fun m!364069 () Bool)

(assert (=> b!366895 m!364069))

(declare-fun m!364071 () Bool)

(assert (=> mapNonEmpty!14367 m!364071))

(declare-fun m!364073 () Bool)

(assert (=> b!366905 m!364073))

(declare-fun m!364075 () Bool)

(assert (=> start!36760 m!364075))

(declare-fun m!364077 () Bool)

(assert (=> start!36760 m!364077))

(declare-fun m!364079 () Bool)

(assert (=> start!36760 m!364079))

(declare-fun m!364081 () Bool)

(assert (=> b!366899 m!364081))

(check-sat (not b!366899) (not b!366905) (not b!366896) (not b!366903) tp_is_empty!8535 (not b!366904) (not b!366895) (not mapNonEmpty!14367) (not start!36760))
(check-sat)
