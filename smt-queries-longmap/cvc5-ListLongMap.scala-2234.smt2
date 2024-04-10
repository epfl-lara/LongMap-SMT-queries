; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36866 () Bool)

(assert start!36866)

(declare-fun b_free!7993 () Bool)

(declare-fun b_next!7993 () Bool)

(assert (=> start!36866 (= b_free!7993 (not b_next!7993))))

(declare-fun tp!28694 () Bool)

(declare-fun b_and!15235 () Bool)

(assert (=> start!36866 (= tp!28694 b_and!15235)))

(declare-fun b!368903 () Bool)

(declare-fun res!206849 () Bool)

(declare-fun e!225548 () Bool)

(assert (=> b!368903 (=> (not res!206849) (not e!225548))))

(declare-datatypes ((array!21235 0))(
  ( (array!21236 (arr!10086 (Array (_ BitVec 32) (_ BitVec 64))) (size!10438 (_ BitVec 32))) )
))
(declare-fun lt!169614 () array!21235)

(declare-datatypes ((List!5620 0))(
  ( (Nil!5617) (Cons!5616 (h!6472 (_ BitVec 64)) (t!10770 List!5620)) )
))
(declare-fun arrayNoDuplicates!0 (array!21235 (_ BitVec 32) List!5620) Bool)

(assert (=> b!368903 (= res!206849 (arrayNoDuplicates!0 lt!169614 #b00000000000000000000000000000000 Nil!5617))))

(declare-fun b!368904 () Bool)

(declare-fun res!206844 () Bool)

(declare-fun e!225549 () Bool)

(assert (=> b!368904 (=> (not res!206844) (not e!225549))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368904 (= res!206844 (validKeyInArray!0 k!778))))

(declare-fun b!368905 () Bool)

(declare-fun res!206848 () Bool)

(assert (=> b!368905 (=> (not res!206848) (not e!225549))))

(declare-fun _keys!658 () array!21235)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21235 (_ BitVec 32)) Bool)

(assert (=> b!368905 (= res!206848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368906 () Bool)

(declare-fun res!206842 () Bool)

(assert (=> b!368906 (=> (not res!206842) (not e!225549))))

(declare-fun arrayContainsKey!0 (array!21235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368906 (= res!206842 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368907 () Bool)

(assert (=> b!368907 (= e!225549 e!225548)))

(declare-fun res!206843 () Bool)

(assert (=> b!368907 (=> (not res!206843) (not e!225548))))

(assert (=> b!368907 (= res!206843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169614 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368907 (= lt!169614 (array!21236 (store (arr!10086 _keys!658) i!548 k!778) (size!10438 _keys!658)))))

(declare-fun b!368908 () Bool)

(declare-fun e!225547 () Bool)

(declare-fun tp_is_empty!8641 () Bool)

(assert (=> b!368908 (= e!225547 tp_is_empty!8641)))

(declare-fun b!368909 () Bool)

(declare-fun e!225551 () Bool)

(declare-fun mapRes!14526 () Bool)

(assert (=> b!368909 (= e!225551 (and e!225547 mapRes!14526))))

(declare-fun condMapEmpty!14526 () Bool)

(declare-datatypes ((V!12627 0))(
  ( (V!12628 (val!4365 Int)) )
))
(declare-datatypes ((ValueCell!3977 0))(
  ( (ValueCellFull!3977 (v!6562 V!12627)) (EmptyCell!3977) )
))
(declare-datatypes ((array!21237 0))(
  ( (array!21238 (arr!10087 (Array (_ BitVec 32) ValueCell!3977)) (size!10439 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21237)

(declare-fun mapDefault!14526 () ValueCell!3977)

