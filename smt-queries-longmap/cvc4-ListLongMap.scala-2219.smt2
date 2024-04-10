; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36780 () Bool)

(assert start!36780)

(declare-fun b!367254 () Bool)

(declare-fun res!205583 () Bool)

(declare-fun e!224772 () Bool)

(assert (=> b!367254 (=> (not res!205583) (not e!224772))))

(declare-datatypes ((array!21069 0))(
  ( (array!21070 (arr!10003 (Array (_ BitVec 32) (_ BitVec 64))) (size!10355 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21069)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367254 (= res!205583 (or (= (select (arr!10003 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10003 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367256 () Bool)

(declare-fun res!205585 () Bool)

(assert (=> b!367256 (=> (not res!205585) (not e!224772))))

(declare-datatypes ((V!12511 0))(
  ( (V!12512 (val!4322 Int)) )
))
(declare-datatypes ((ValueCell!3934 0))(
  ( (ValueCellFull!3934 (v!6519 V!12511)) (EmptyCell!3934) )
))
(declare-datatypes ((array!21071 0))(
  ( (array!21072 (arr!10004 (Array (_ BitVec 32) ValueCell!3934)) (size!10356 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21071)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367256 (= res!205585 (and (= (size!10356 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10355 _keys!658) (size!10356 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14397 () Bool)

(declare-fun mapRes!14397 () Bool)

(declare-fun tp!28473 () Bool)

(declare-fun e!224775 () Bool)

(assert (=> mapNonEmpty!14397 (= mapRes!14397 (and tp!28473 e!224775))))

(declare-fun mapKey!14397 () (_ BitVec 32))

(declare-fun mapRest!14397 () (Array (_ BitVec 32) ValueCell!3934))

(declare-fun mapValue!14397 () ValueCell!3934)

(assert (=> mapNonEmpty!14397 (= (arr!10004 _values!506) (store mapRest!14397 mapKey!14397 mapValue!14397))))

(declare-fun b!367257 () Bool)

(declare-fun e!224776 () Bool)

(assert (=> b!367257 (= e!224772 e!224776)))

(declare-fun res!205586 () Bool)

(assert (=> b!367257 (=> (not res!205586) (not e!224776))))

(declare-fun lt!169352 () array!21069)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21069 (_ BitVec 32)) Bool)

(assert (=> b!367257 (= res!205586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169352 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!367257 (= lt!169352 (array!21070 (store (arr!10003 _keys!658) i!548 k!778) (size!10355 _keys!658)))))

(declare-fun b!367258 () Bool)

(declare-fun res!205582 () Bool)

(assert (=> b!367258 (=> (not res!205582) (not e!224772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367258 (= res!205582 (validKeyInArray!0 k!778))))

(declare-fun b!367259 () Bool)

(declare-fun res!205580 () Bool)

(assert (=> b!367259 (=> (not res!205580) (not e!224772))))

(declare-datatypes ((List!5564 0))(
  ( (Nil!5561) (Cons!5560 (h!6416 (_ BitVec 64)) (t!10714 List!5564)) )
))
(declare-fun arrayNoDuplicates!0 (array!21069 (_ BitVec 32) List!5564) Bool)

(assert (=> b!367259 (= res!205580 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5561))))

(declare-fun b!367260 () Bool)

(declare-fun res!205578 () Bool)

(assert (=> b!367260 (=> (not res!205578) (not e!224772))))

(assert (=> b!367260 (= res!205578 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10355 _keys!658))))))

(declare-fun b!367261 () Bool)

(declare-fun res!205581 () Bool)

(assert (=> b!367261 (=> (not res!205581) (not e!224772))))

(assert (=> b!367261 (= res!205581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!205579 () Bool)

(assert (=> start!36780 (=> (not res!205579) (not e!224772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36780 (= res!205579 (validMask!0 mask!970))))

(assert (=> start!36780 e!224772))

(assert (=> start!36780 true))

(declare-fun e!224777 () Bool)

(declare-fun array_inv!7396 (array!21071) Bool)

(assert (=> start!36780 (and (array_inv!7396 _values!506) e!224777)))

(declare-fun array_inv!7397 (array!21069) Bool)

(assert (=> start!36780 (array_inv!7397 _keys!658)))

(declare-fun b!367255 () Bool)

(assert (=> b!367255 (= e!224776 false)))

(declare-fun lt!169353 () Bool)

(assert (=> b!367255 (= lt!169353 (arrayNoDuplicates!0 lt!169352 #b00000000000000000000000000000000 Nil!5561))))

(declare-fun b!367262 () Bool)

(declare-fun res!205584 () Bool)

(assert (=> b!367262 (=> (not res!205584) (not e!224772))))

(declare-fun arrayContainsKey!0 (array!21069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367262 (= res!205584 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!367263 () Bool)

(declare-fun e!224773 () Bool)

(assert (=> b!367263 (= e!224777 (and e!224773 mapRes!14397))))

(declare-fun condMapEmpty!14397 () Bool)

(declare-fun mapDefault!14397 () ValueCell!3934)

