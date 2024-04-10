; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36768 () Bool)

(assert start!36768)

(declare-fun b!367038 () Bool)

(declare-fun res!205421 () Bool)

(declare-fun e!224665 () Bool)

(assert (=> b!367038 (=> (not res!205421) (not e!224665))))

(declare-datatypes ((array!21045 0))(
  ( (array!21046 (arr!9991 (Array (_ BitVec 32) (_ BitVec 64))) (size!10343 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21045)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367038 (= res!205421 (or (= (select (arr!9991 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9991 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367039 () Bool)

(declare-fun res!205424 () Bool)

(assert (=> b!367039 (=> (not res!205424) (not e!224665))))

(declare-datatypes ((List!5559 0))(
  ( (Nil!5556) (Cons!5555 (h!6411 (_ BitVec 64)) (t!10709 List!5559)) )
))
(declare-fun arrayNoDuplicates!0 (array!21045 (_ BitVec 32) List!5559) Bool)

(assert (=> b!367039 (= res!205424 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5556))))

(declare-fun b!367040 () Bool)

(declare-fun e!224664 () Bool)

(assert (=> b!367040 (= e!224665 e!224664)))

(declare-fun res!205417 () Bool)

(assert (=> b!367040 (=> (not res!205417) (not e!224664))))

(declare-fun lt!169316 () array!21045)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21045 (_ BitVec 32)) Bool)

(assert (=> b!367040 (= res!205417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169316 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!367040 (= lt!169316 (array!21046 (store (arr!9991 _keys!658) i!548 k!778) (size!10343 _keys!658)))))

(declare-fun mapNonEmpty!14379 () Bool)

(declare-fun mapRes!14379 () Bool)

(declare-fun tp!28455 () Bool)

(declare-fun e!224667 () Bool)

(assert (=> mapNonEmpty!14379 (= mapRes!14379 (and tp!28455 e!224667))))

(declare-datatypes ((V!12495 0))(
  ( (V!12496 (val!4316 Int)) )
))
(declare-datatypes ((ValueCell!3928 0))(
  ( (ValueCellFull!3928 (v!6513 V!12495)) (EmptyCell!3928) )
))
(declare-datatypes ((array!21047 0))(
  ( (array!21048 (arr!9992 (Array (_ BitVec 32) ValueCell!3928)) (size!10344 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21047)

(declare-fun mapKey!14379 () (_ BitVec 32))

(declare-fun mapRest!14379 () (Array (_ BitVec 32) ValueCell!3928))

(declare-fun mapValue!14379 () ValueCell!3928)

(assert (=> mapNonEmpty!14379 (= (arr!9992 _values!506) (store mapRest!14379 mapKey!14379 mapValue!14379))))

(declare-fun b!367041 () Bool)

(declare-fun e!224669 () Bool)

(declare-fun e!224666 () Bool)

(assert (=> b!367041 (= e!224669 (and e!224666 mapRes!14379))))

(declare-fun condMapEmpty!14379 () Bool)

(declare-fun mapDefault!14379 () ValueCell!3928)

