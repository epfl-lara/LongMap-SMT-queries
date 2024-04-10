; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36690 () Bool)

(assert start!36690)

(declare-fun res!204886 () Bool)

(declare-fun e!224277 () Bool)

(assert (=> start!36690 (=> (not res!204886) (not e!224277))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36690 (= res!204886 (validMask!0 mask!970))))

(assert (=> start!36690 e!224277))

(assert (=> start!36690 true))

(declare-datatypes ((V!12455 0))(
  ( (V!12456 (val!4301 Int)) )
))
(declare-datatypes ((ValueCell!3913 0))(
  ( (ValueCellFull!3913 (v!6497 V!12455)) (EmptyCell!3913) )
))
(declare-datatypes ((array!20979 0))(
  ( (array!20980 (arr!9961 (Array (_ BitVec 32) ValueCell!3913)) (size!10313 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20979)

(declare-fun e!224278 () Bool)

(declare-fun array_inv!7368 (array!20979) Bool)

(assert (=> start!36690 (and (array_inv!7368 _values!506) e!224278)))

(declare-datatypes ((array!20981 0))(
  ( (array!20982 (arr!9962 (Array (_ BitVec 32) (_ BitVec 64))) (size!10314 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20981)

(declare-fun array_inv!7369 (array!20981) Bool)

(assert (=> start!36690 (array_inv!7369 _keys!658)))

(declare-fun b!366307 () Bool)

(declare-fun res!204889 () Bool)

(assert (=> b!366307 (=> (not res!204889) (not e!224277))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366307 (= res!204889 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!366308 () Bool)

(declare-fun res!204893 () Bool)

(assert (=> b!366308 (=> (not res!204893) (not e!224277))))

(declare-datatypes ((List!5547 0))(
  ( (Nil!5544) (Cons!5543 (h!6399 (_ BitVec 64)) (t!10697 List!5547)) )
))
(declare-fun arrayNoDuplicates!0 (array!20981 (_ BitVec 32) List!5547) Bool)

(assert (=> b!366308 (= res!204893 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5544))))

(declare-fun b!366309 () Bool)

(declare-fun res!204887 () Bool)

(assert (=> b!366309 (=> (not res!204887) (not e!224277))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366309 (= res!204887 (and (= (size!10313 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10314 _keys!658) (size!10313 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366310 () Bool)

(declare-fun e!224280 () Bool)

(declare-fun tp_is_empty!8513 () Bool)

(assert (=> b!366310 (= e!224280 tp_is_empty!8513)))

(declare-fun b!366311 () Bool)

(assert (=> b!366311 (= e!224277 (and (bvsle #b00000000000000000000000000000000 (size!10314 _keys!658)) (bvsge (size!10314 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!366312 () Bool)

(declare-fun e!224279 () Bool)

(assert (=> b!366312 (= e!224279 tp_is_empty!8513)))

(declare-fun mapIsEmpty!14325 () Bool)

(declare-fun mapRes!14325 () Bool)

(assert (=> mapIsEmpty!14325 mapRes!14325))

(declare-fun b!366313 () Bool)

(declare-fun res!204894 () Bool)

(assert (=> b!366313 (=> (not res!204894) (not e!224277))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20981 (_ BitVec 32)) Bool)

(assert (=> b!366313 (= res!204894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20982 (store (arr!9962 _keys!658) i!548 k!778) (size!10314 _keys!658)) mask!970))))

(declare-fun b!366314 () Bool)

(declare-fun res!204890 () Bool)

(assert (=> b!366314 (=> (not res!204890) (not e!224277))))

(assert (=> b!366314 (= res!204890 (or (= (select (arr!9962 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9962 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366315 () Bool)

(declare-fun res!204891 () Bool)

(assert (=> b!366315 (=> (not res!204891) (not e!224277))))

(assert (=> b!366315 (= res!204891 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10314 _keys!658))))))

(declare-fun b!366316 () Bool)

(declare-fun res!204888 () Bool)

(assert (=> b!366316 (=> (not res!204888) (not e!224277))))

(assert (=> b!366316 (= res!204888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366317 () Bool)

(assert (=> b!366317 (= e!224278 (and e!224280 mapRes!14325))))

(declare-fun condMapEmpty!14325 () Bool)

(declare-fun mapDefault!14325 () ValueCell!3913)

