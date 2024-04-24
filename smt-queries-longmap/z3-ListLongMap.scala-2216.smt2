; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36744 () Bool)

(assert start!36744)

(declare-fun b!366809 () Bool)

(declare-fun e!224546 () Bool)

(declare-fun e!224543 () Bool)

(declare-fun mapRes!14364 () Bool)

(assert (=> b!366809 (= e!224546 (and e!224543 mapRes!14364))))

(declare-fun condMapEmpty!14364 () Bool)

(declare-datatypes ((V!12483 0))(
  ( (V!12484 (val!4311 Int)) )
))
(declare-datatypes ((ValueCell!3923 0))(
  ( (ValueCellFull!3923 (v!6509 V!12483)) (EmptyCell!3923) )
))
(declare-datatypes ((array!21010 0))(
  ( (array!21011 (arr!9973 (Array (_ BitVec 32) ValueCell!3923)) (size!10325 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21010)

(declare-fun mapDefault!14364 () ValueCell!3923)

(assert (=> b!366809 (= condMapEmpty!14364 (= (arr!9973 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3923)) mapDefault!14364)))))

(declare-fun res!205280 () Bool)

(declare-fun e!224542 () Bool)

(assert (=> start!36744 (=> (not res!205280) (not e!224542))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36744 (= res!205280 (validMask!0 mask!970))))

(assert (=> start!36744 e!224542))

(assert (=> start!36744 true))

(declare-fun array_inv!7414 (array!21010) Bool)

(assert (=> start!36744 (and (array_inv!7414 _values!506) e!224546)))

(declare-datatypes ((array!21012 0))(
  ( (array!21013 (arr!9974 (Array (_ BitVec 32) (_ BitVec 64))) (size!10326 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21012)

(declare-fun array_inv!7415 (array!21012) Bool)

(assert (=> start!36744 (array_inv!7415 _keys!658)))

(declare-fun b!366810 () Bool)

(declare-fun res!205286 () Bool)

(assert (=> b!366810 (=> (not res!205286) (not e!224542))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366810 (= res!205286 (and (= (size!10325 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10326 _keys!658) (size!10325 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366811 () Bool)

(declare-fun tp_is_empty!8533 () Bool)

(assert (=> b!366811 (= e!224543 tp_is_empty!8533)))

(declare-fun b!366812 () Bool)

(declare-fun res!205281 () Bool)

(assert (=> b!366812 (=> (not res!205281) (not e!224542))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366812 (= res!205281 (or (= (select (arr!9974 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9974 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366813 () Bool)

(declare-fun res!205278 () Bool)

(assert (=> b!366813 (=> (not res!205278) (not e!224542))))

(assert (=> b!366813 (= res!205278 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10326 _keys!658))))))

(declare-fun b!366814 () Bool)

(declare-fun res!205284 () Bool)

(assert (=> b!366814 (=> (not res!205284) (not e!224542))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366814 (= res!205284 (validKeyInArray!0 k0!778))))

(declare-fun b!366815 () Bool)

(declare-fun res!205285 () Bool)

(assert (=> b!366815 (=> (not res!205285) (not e!224542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21012 (_ BitVec 32)) Bool)

(assert (=> b!366815 (= res!205285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366816 () Bool)

(declare-fun res!205279 () Bool)

(assert (=> b!366816 (=> (not res!205279) (not e!224542))))

(declare-fun arrayContainsKey!0 (array!21012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366816 (= res!205279 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366817 () Bool)

(declare-fun e!224544 () Bool)

(assert (=> b!366817 (= e!224544 false)))

(declare-fun lt!169305 () Bool)

(declare-fun lt!169306 () array!21012)

(declare-datatypes ((List!5462 0))(
  ( (Nil!5459) (Cons!5458 (h!6314 (_ BitVec 64)) (t!10604 List!5462)) )
))
(declare-fun arrayNoDuplicates!0 (array!21012 (_ BitVec 32) List!5462) Bool)

(assert (=> b!366817 (= lt!169305 (arrayNoDuplicates!0 lt!169306 #b00000000000000000000000000000000 Nil!5459))))

(declare-fun mapNonEmpty!14364 () Bool)

(declare-fun tp!28440 () Bool)

(declare-fun e!224547 () Bool)

(assert (=> mapNonEmpty!14364 (= mapRes!14364 (and tp!28440 e!224547))))

(declare-fun mapRest!14364 () (Array (_ BitVec 32) ValueCell!3923))

(declare-fun mapKey!14364 () (_ BitVec 32))

(declare-fun mapValue!14364 () ValueCell!3923)

(assert (=> mapNonEmpty!14364 (= (arr!9973 _values!506) (store mapRest!14364 mapKey!14364 mapValue!14364))))

(declare-fun b!366818 () Bool)

(declare-fun res!205283 () Bool)

(assert (=> b!366818 (=> (not res!205283) (not e!224542))))

(assert (=> b!366818 (= res!205283 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5459))))

(declare-fun mapIsEmpty!14364 () Bool)

(assert (=> mapIsEmpty!14364 mapRes!14364))

(declare-fun b!366819 () Bool)

(assert (=> b!366819 (= e!224542 e!224544)))

(declare-fun res!205282 () Bool)

(assert (=> b!366819 (=> (not res!205282) (not e!224544))))

(assert (=> b!366819 (= res!205282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169306 mask!970))))

(assert (=> b!366819 (= lt!169306 (array!21013 (store (arr!9974 _keys!658) i!548 k0!778) (size!10326 _keys!658)))))

(declare-fun b!366820 () Bool)

(assert (=> b!366820 (= e!224547 tp_is_empty!8533)))

(assert (= (and start!36744 res!205280) b!366810))

(assert (= (and b!366810 res!205286) b!366815))

(assert (= (and b!366815 res!205285) b!366818))

(assert (= (and b!366818 res!205283) b!366813))

(assert (= (and b!366813 res!205278) b!366814))

(assert (= (and b!366814 res!205284) b!366812))

(assert (= (and b!366812 res!205281) b!366816))

(assert (= (and b!366816 res!205279) b!366819))

(assert (= (and b!366819 res!205282) b!366817))

(assert (= (and b!366809 condMapEmpty!14364) mapIsEmpty!14364))

(assert (= (and b!366809 (not condMapEmpty!14364)) mapNonEmpty!14364))

(get-info :version)

(assert (= (and mapNonEmpty!14364 ((_ is ValueCellFull!3923) mapValue!14364)) b!366820))

(assert (= (and b!366809 ((_ is ValueCellFull!3923) mapDefault!14364)) b!366811))

(assert (= start!36744 b!366809))

(declare-fun m!364265 () Bool)

(assert (=> mapNonEmpty!14364 m!364265))

(declare-fun m!364267 () Bool)

(assert (=> b!366814 m!364267))

(declare-fun m!364269 () Bool)

(assert (=> b!366818 m!364269))

(declare-fun m!364271 () Bool)

(assert (=> b!366815 m!364271))

(declare-fun m!364273 () Bool)

(assert (=> b!366817 m!364273))

(declare-fun m!364275 () Bool)

(assert (=> b!366819 m!364275))

(declare-fun m!364277 () Bool)

(assert (=> b!366819 m!364277))

(declare-fun m!364279 () Bool)

(assert (=> b!366812 m!364279))

(declare-fun m!364281 () Bool)

(assert (=> start!36744 m!364281))

(declare-fun m!364283 () Bool)

(assert (=> start!36744 m!364283))

(declare-fun m!364285 () Bool)

(assert (=> start!36744 m!364285))

(declare-fun m!364287 () Bool)

(assert (=> b!366816 m!364287))

(check-sat (not mapNonEmpty!14364) (not b!366815) tp_is_empty!8533 (not start!36744) (not b!366818) (not b!366814) (not b!366819) (not b!366816) (not b!366817))
(check-sat)
