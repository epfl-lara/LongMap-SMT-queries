; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36754 () Bool)

(assert start!36754)

(declare-fun b!366786 () Bool)

(declare-fun e!224543 () Bool)

(assert (=> b!366786 (= e!224543 false)))

(declare-fun lt!169274 () Bool)

(declare-datatypes ((array!21017 0))(
  ( (array!21018 (arr!9977 (Array (_ BitVec 32) (_ BitVec 64))) (size!10329 (_ BitVec 32))) )
))
(declare-fun lt!169275 () array!21017)

(declare-datatypes ((List!5553 0))(
  ( (Nil!5550) (Cons!5549 (h!6405 (_ BitVec 64)) (t!10703 List!5553)) )
))
(declare-fun arrayNoDuplicates!0 (array!21017 (_ BitVec 32) List!5553) Bool)

(assert (=> b!366786 (= lt!169274 (arrayNoDuplicates!0 lt!169275 #b00000000000000000000000000000000 Nil!5550))))

(declare-fun b!366787 () Bool)

(declare-fun res!205230 () Bool)

(declare-fun e!224540 () Bool)

(assert (=> b!366787 (=> (not res!205230) (not e!224540))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366787 (= res!205230 (validKeyInArray!0 k0!778))))

(declare-fun b!366788 () Bool)

(declare-fun e!224539 () Bool)

(declare-fun e!224541 () Bool)

(declare-fun mapRes!14358 () Bool)

(assert (=> b!366788 (= e!224539 (and e!224541 mapRes!14358))))

(declare-fun condMapEmpty!14358 () Bool)

(declare-datatypes ((V!12477 0))(
  ( (V!12478 (val!4309 Int)) )
))
(declare-datatypes ((ValueCell!3921 0))(
  ( (ValueCellFull!3921 (v!6506 V!12477)) (EmptyCell!3921) )
))
(declare-datatypes ((array!21019 0))(
  ( (array!21020 (arr!9978 (Array (_ BitVec 32) ValueCell!3921)) (size!10330 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21019)

(declare-fun mapDefault!14358 () ValueCell!3921)

(assert (=> b!366788 (= condMapEmpty!14358 (= (arr!9978 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3921)) mapDefault!14358)))))

(declare-fun b!366789 () Bool)

(declare-fun e!224538 () Bool)

(declare-fun tp_is_empty!8529 () Bool)

(assert (=> b!366789 (= e!224538 tp_is_empty!8529)))

(declare-fun b!366790 () Bool)

(declare-fun res!205234 () Bool)

(assert (=> b!366790 (=> (not res!205234) (not e!224540))))

(declare-fun _keys!658 () array!21017)

(declare-fun arrayContainsKey!0 (array!21017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366790 (= res!205234 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366791 () Bool)

(declare-fun res!205233 () Bool)

(assert (=> b!366791 (=> (not res!205233) (not e!224540))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366791 (= res!205233 (or (= (select (arr!9977 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9977 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366792 () Bool)

(declare-fun res!205235 () Bool)

(assert (=> b!366792 (=> (not res!205235) (not e!224540))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!366792 (= res!205235 (and (= (size!10330 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10329 _keys!658) (size!10330 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366793 () Bool)

(declare-fun res!205231 () Bool)

(assert (=> b!366793 (=> (not res!205231) (not e!224540))))

(assert (=> b!366793 (= res!205231 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10329 _keys!658))))))

(declare-fun b!366794 () Bool)

(assert (=> b!366794 (= e!224541 tp_is_empty!8529)))

(declare-fun b!366795 () Bool)

(declare-fun res!205229 () Bool)

(assert (=> b!366795 (=> (not res!205229) (not e!224540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21017 (_ BitVec 32)) Bool)

(assert (=> b!366795 (= res!205229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!205227 () Bool)

(assert (=> start!36754 (=> (not res!205227) (not e!224540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36754 (= res!205227 (validMask!0 mask!970))))

(assert (=> start!36754 e!224540))

(assert (=> start!36754 true))

(declare-fun array_inv!7380 (array!21019) Bool)

(assert (=> start!36754 (and (array_inv!7380 _values!506) e!224539)))

(declare-fun array_inv!7381 (array!21017) Bool)

(assert (=> start!36754 (array_inv!7381 _keys!658)))

(declare-fun mapIsEmpty!14358 () Bool)

(assert (=> mapIsEmpty!14358 mapRes!14358))

(declare-fun mapNonEmpty!14358 () Bool)

(declare-fun tp!28434 () Bool)

(assert (=> mapNonEmpty!14358 (= mapRes!14358 (and tp!28434 e!224538))))

(declare-fun mapRest!14358 () (Array (_ BitVec 32) ValueCell!3921))

(declare-fun mapValue!14358 () ValueCell!3921)

(declare-fun mapKey!14358 () (_ BitVec 32))

(assert (=> mapNonEmpty!14358 (= (arr!9978 _values!506) (store mapRest!14358 mapKey!14358 mapValue!14358))))

(declare-fun b!366796 () Bool)

(assert (=> b!366796 (= e!224540 e!224543)))

(declare-fun res!205228 () Bool)

(assert (=> b!366796 (=> (not res!205228) (not e!224543))))

(assert (=> b!366796 (= res!205228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169275 mask!970))))

(assert (=> b!366796 (= lt!169275 (array!21018 (store (arr!9977 _keys!658) i!548 k0!778) (size!10329 _keys!658)))))

(declare-fun b!366797 () Bool)

(declare-fun res!205232 () Bool)

(assert (=> b!366797 (=> (not res!205232) (not e!224540))))

(assert (=> b!366797 (= res!205232 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5550))))

(assert (= (and start!36754 res!205227) b!366792))

(assert (= (and b!366792 res!205235) b!366795))

(assert (= (and b!366795 res!205229) b!366797))

(assert (= (and b!366797 res!205232) b!366793))

(assert (= (and b!366793 res!205231) b!366787))

(assert (= (and b!366787 res!205230) b!366791))

(assert (= (and b!366791 res!205233) b!366790))

(assert (= (and b!366790 res!205234) b!366796))

(assert (= (and b!366796 res!205228) b!366786))

(assert (= (and b!366788 condMapEmpty!14358) mapIsEmpty!14358))

(assert (= (and b!366788 (not condMapEmpty!14358)) mapNonEmpty!14358))

(get-info :version)

(assert (= (and mapNonEmpty!14358 ((_ is ValueCellFull!3921) mapValue!14358)) b!366789))

(assert (= (and b!366788 ((_ is ValueCellFull!3921) mapDefault!14358)) b!366794))

(assert (= start!36754 b!366788))

(declare-fun m!363987 () Bool)

(assert (=> start!36754 m!363987))

(declare-fun m!363989 () Bool)

(assert (=> start!36754 m!363989))

(declare-fun m!363991 () Bool)

(assert (=> start!36754 m!363991))

(declare-fun m!363993 () Bool)

(assert (=> mapNonEmpty!14358 m!363993))

(declare-fun m!363995 () Bool)

(assert (=> b!366795 m!363995))

(declare-fun m!363997 () Bool)

(assert (=> b!366796 m!363997))

(declare-fun m!363999 () Bool)

(assert (=> b!366796 m!363999))

(declare-fun m!364001 () Bool)

(assert (=> b!366790 m!364001))

(declare-fun m!364003 () Bool)

(assert (=> b!366787 m!364003))

(declare-fun m!364005 () Bool)

(assert (=> b!366786 m!364005))

(declare-fun m!364007 () Bool)

(assert (=> b!366797 m!364007))

(declare-fun m!364009 () Bool)

(assert (=> b!366791 m!364009))

(check-sat (not b!366795) (not start!36754) (not b!366787) (not b!366786) (not b!366796) (not b!366790) (not mapNonEmpty!14358) tp_is_empty!8529 (not b!366797))
(check-sat)
