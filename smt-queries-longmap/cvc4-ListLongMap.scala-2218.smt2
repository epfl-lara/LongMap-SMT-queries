; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36774 () Bool)

(assert start!36774)

(declare-fun b!367146 () Bool)

(declare-fun res!205500 () Bool)

(declare-fun e!224721 () Bool)

(assert (=> b!367146 (=> (not res!205500) (not e!224721))))

(declare-datatypes ((array!21057 0))(
  ( (array!21058 (arr!9997 (Array (_ BitVec 32) (_ BitVec 64))) (size!10349 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21057)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367146 (= res!205500 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!367147 () Bool)

(declare-fun res!205503 () Bool)

(assert (=> b!367147 (=> (not res!205503) (not e!224721))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12503 0))(
  ( (V!12504 (val!4319 Int)) )
))
(declare-datatypes ((ValueCell!3931 0))(
  ( (ValueCellFull!3931 (v!6516 V!12503)) (EmptyCell!3931) )
))
(declare-datatypes ((array!21059 0))(
  ( (array!21060 (arr!9998 (Array (_ BitVec 32) ValueCell!3931)) (size!10350 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21059)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367147 (= res!205503 (and (= (size!10350 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10349 _keys!658) (size!10350 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367148 () Bool)

(declare-fun res!205498 () Bool)

(assert (=> b!367148 (=> (not res!205498) (not e!224721))))

(declare-datatypes ((List!5562 0))(
  ( (Nil!5559) (Cons!5558 (h!6414 (_ BitVec 64)) (t!10712 List!5562)) )
))
(declare-fun arrayNoDuplicates!0 (array!21057 (_ BitVec 32) List!5562) Bool)

(assert (=> b!367148 (= res!205498 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5559))))

(declare-fun mapIsEmpty!14388 () Bool)

(declare-fun mapRes!14388 () Bool)

(assert (=> mapIsEmpty!14388 mapRes!14388))

(declare-fun res!205504 () Bool)

(assert (=> start!36774 (=> (not res!205504) (not e!224721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36774 (= res!205504 (validMask!0 mask!970))))

(assert (=> start!36774 e!224721))

(assert (=> start!36774 true))

(declare-fun e!224720 () Bool)

(declare-fun array_inv!7392 (array!21059) Bool)

(assert (=> start!36774 (and (array_inv!7392 _values!506) e!224720)))

(declare-fun array_inv!7393 (array!21057) Bool)

(assert (=> start!36774 (array_inv!7393 _keys!658)))

(declare-fun b!367149 () Bool)

(declare-fun e!224723 () Bool)

(declare-fun tp_is_empty!8549 () Bool)

(assert (=> b!367149 (= e!224723 tp_is_empty!8549)))

(declare-fun b!367150 () Bool)

(declare-fun res!205501 () Bool)

(assert (=> b!367150 (=> (not res!205501) (not e!224721))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367150 (= res!205501 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10349 _keys!658))))))

(declare-fun b!367151 () Bool)

(declare-fun res!205502 () Bool)

(assert (=> b!367151 (=> (not res!205502) (not e!224721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367151 (= res!205502 (validKeyInArray!0 k!778))))

(declare-fun b!367152 () Bool)

(declare-fun e!224718 () Bool)

(assert (=> b!367152 (= e!224718 false)))

(declare-fun lt!169334 () Bool)

(declare-fun lt!169335 () array!21057)

(assert (=> b!367152 (= lt!169334 (arrayNoDuplicates!0 lt!169335 #b00000000000000000000000000000000 Nil!5559))))

(declare-fun b!367153 () Bool)

(declare-fun e!224722 () Bool)

(assert (=> b!367153 (= e!224722 tp_is_empty!8549)))

(declare-fun b!367154 () Bool)

(declare-fun res!205497 () Bool)

(assert (=> b!367154 (=> (not res!205497) (not e!224721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21057 (_ BitVec 32)) Bool)

(assert (=> b!367154 (= res!205497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14388 () Bool)

(declare-fun tp!28464 () Bool)

(assert (=> mapNonEmpty!14388 (= mapRes!14388 (and tp!28464 e!224723))))

(declare-fun mapRest!14388 () (Array (_ BitVec 32) ValueCell!3931))

(declare-fun mapValue!14388 () ValueCell!3931)

(declare-fun mapKey!14388 () (_ BitVec 32))

(assert (=> mapNonEmpty!14388 (= (arr!9998 _values!506) (store mapRest!14388 mapKey!14388 mapValue!14388))))

(declare-fun b!367155 () Bool)

(declare-fun res!205505 () Bool)

(assert (=> b!367155 (=> (not res!205505) (not e!224721))))

(assert (=> b!367155 (= res!205505 (or (= (select (arr!9997 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9997 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367156 () Bool)

(assert (=> b!367156 (= e!224720 (and e!224722 mapRes!14388))))

(declare-fun condMapEmpty!14388 () Bool)

(declare-fun mapDefault!14388 () ValueCell!3931)

