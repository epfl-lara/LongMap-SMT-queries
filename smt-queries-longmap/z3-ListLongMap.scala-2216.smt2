; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36744 () Bool)

(assert start!36744)

(declare-fun b!366587 () Bool)

(declare-fun res!205157 () Bool)

(declare-fun e!224401 () Bool)

(assert (=> b!366587 (=> (not res!205157) (not e!224401))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21011 0))(
  ( (array!21012 (arr!9974 (Array (_ BitVec 32) (_ BitVec 64))) (size!10327 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21011)

(assert (=> b!366587 (= res!205157 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10327 _keys!658))))))

(declare-fun b!366588 () Bool)

(declare-fun res!205160 () Bool)

(assert (=> b!366588 (=> (not res!205160) (not e!224401))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366588 (= res!205160 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366589 () Bool)

(declare-fun res!205156 () Bool)

(assert (=> b!366589 (=> (not res!205156) (not e!224401))))

(assert (=> b!366589 (= res!205156 (or (= (select (arr!9974 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9974 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366590 () Bool)

(declare-fun e!224405 () Bool)

(assert (=> b!366590 (= e!224401 e!224405)))

(declare-fun res!205158 () Bool)

(assert (=> b!366590 (=> (not res!205158) (not e!224405))))

(declare-fun lt!169052 () array!21011)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21011 (_ BitVec 32)) Bool)

(assert (=> b!366590 (= res!205158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169052 mask!970))))

(assert (=> b!366590 (= lt!169052 (array!21012 (store (arr!9974 _keys!658) i!548 k0!778) (size!10327 _keys!658)))))

(declare-fun mapNonEmpty!14364 () Bool)

(declare-fun mapRes!14364 () Bool)

(declare-fun tp!28440 () Bool)

(declare-fun e!224400 () Bool)

(assert (=> mapNonEmpty!14364 (= mapRes!14364 (and tp!28440 e!224400))))

(declare-datatypes ((V!12483 0))(
  ( (V!12484 (val!4311 Int)) )
))
(declare-datatypes ((ValueCell!3923 0))(
  ( (ValueCellFull!3923 (v!6502 V!12483)) (EmptyCell!3923) )
))
(declare-datatypes ((array!21013 0))(
  ( (array!21014 (arr!9975 (Array (_ BitVec 32) ValueCell!3923)) (size!10328 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21013)

(declare-fun mapKey!14364 () (_ BitVec 32))

(declare-fun mapRest!14364 () (Array (_ BitVec 32) ValueCell!3923))

(declare-fun mapValue!14364 () ValueCell!3923)

(assert (=> mapNonEmpty!14364 (= (arr!9975 _values!506) (store mapRest!14364 mapKey!14364 mapValue!14364))))

(declare-fun mapIsEmpty!14364 () Bool)

(assert (=> mapIsEmpty!14364 mapRes!14364))

(declare-fun b!366591 () Bool)

(declare-fun res!205154 () Bool)

(assert (=> b!366591 (=> (not res!205154) (not e!224401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366591 (= res!205154 (validKeyInArray!0 k0!778))))

(declare-fun b!366592 () Bool)

(declare-fun res!205155 () Bool)

(assert (=> b!366592 (=> (not res!205155) (not e!224401))))

(assert (=> b!366592 (= res!205155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366593 () Bool)

(declare-fun e!224404 () Bool)

(declare-fun e!224403 () Bool)

(assert (=> b!366593 (= e!224404 (and e!224403 mapRes!14364))))

(declare-fun condMapEmpty!14364 () Bool)

(declare-fun mapDefault!14364 () ValueCell!3923)

(assert (=> b!366593 (= condMapEmpty!14364 (= (arr!9975 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3923)) mapDefault!14364)))))

(declare-fun b!366594 () Bool)

(assert (=> b!366594 (= e!224405 false)))

(declare-fun lt!169053 () Bool)

(declare-datatypes ((List!5519 0))(
  ( (Nil!5516) (Cons!5515 (h!6371 (_ BitVec 64)) (t!10660 List!5519)) )
))
(declare-fun arrayNoDuplicates!0 (array!21011 (_ BitVec 32) List!5519) Bool)

(assert (=> b!366594 (= lt!169053 (arrayNoDuplicates!0 lt!169052 #b00000000000000000000000000000000 Nil!5516))))

(declare-fun b!366595 () Bool)

(declare-fun tp_is_empty!8533 () Bool)

(assert (=> b!366595 (= e!224400 tp_is_empty!8533)))

(declare-fun b!366596 () Bool)

(declare-fun res!205159 () Bool)

(assert (=> b!366596 (=> (not res!205159) (not e!224401))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366596 (= res!205159 (and (= (size!10328 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10327 _keys!658) (size!10328 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366597 () Bool)

(assert (=> b!366597 (= e!224403 tp_is_empty!8533)))

(declare-fun res!205152 () Bool)

(assert (=> start!36744 (=> (not res!205152) (not e!224401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36744 (= res!205152 (validMask!0 mask!970))))

(assert (=> start!36744 e!224401))

(assert (=> start!36744 true))

(declare-fun array_inv!7392 (array!21013) Bool)

(assert (=> start!36744 (and (array_inv!7392 _values!506) e!224404)))

(declare-fun array_inv!7393 (array!21011) Bool)

(assert (=> start!36744 (array_inv!7393 _keys!658)))

(declare-fun b!366598 () Bool)

(declare-fun res!205153 () Bool)

(assert (=> b!366598 (=> (not res!205153) (not e!224401))))

(assert (=> b!366598 (= res!205153 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5516))))

(assert (= (and start!36744 res!205152) b!366596))

(assert (= (and b!366596 res!205159) b!366592))

(assert (= (and b!366592 res!205155) b!366598))

(assert (= (and b!366598 res!205153) b!366587))

(assert (= (and b!366587 res!205157) b!366591))

(assert (= (and b!366591 res!205154) b!366589))

(assert (= (and b!366589 res!205156) b!366588))

(assert (= (and b!366588 res!205160) b!366590))

(assert (= (and b!366590 res!205158) b!366594))

(assert (= (and b!366593 condMapEmpty!14364) mapIsEmpty!14364))

(assert (= (and b!366593 (not condMapEmpty!14364)) mapNonEmpty!14364))

(get-info :version)

(assert (= (and mapNonEmpty!14364 ((_ is ValueCellFull!3923) mapValue!14364)) b!366595))

(assert (= (and b!366593 ((_ is ValueCellFull!3923) mapDefault!14364)) b!366597))

(assert (= start!36744 b!366593))

(declare-fun m!363311 () Bool)

(assert (=> mapNonEmpty!14364 m!363311))

(declare-fun m!363313 () Bool)

(assert (=> b!366591 m!363313))

(declare-fun m!363315 () Bool)

(assert (=> start!36744 m!363315))

(declare-fun m!363317 () Bool)

(assert (=> start!36744 m!363317))

(declare-fun m!363319 () Bool)

(assert (=> start!36744 m!363319))

(declare-fun m!363321 () Bool)

(assert (=> b!366589 m!363321))

(declare-fun m!363323 () Bool)

(assert (=> b!366592 m!363323))

(declare-fun m!363325 () Bool)

(assert (=> b!366588 m!363325))

(declare-fun m!363327 () Bool)

(assert (=> b!366590 m!363327))

(declare-fun m!363329 () Bool)

(assert (=> b!366590 m!363329))

(declare-fun m!363331 () Bool)

(assert (=> b!366594 m!363331))

(declare-fun m!363333 () Bool)

(assert (=> b!366598 m!363333))

(check-sat (not b!366591) (not start!36744) (not b!366594) (not b!366592) (not mapNonEmpty!14364) tp_is_empty!8533 (not b!366590) (not b!366598) (not b!366588))
(check-sat)
