; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36786 () Bool)

(assert start!36786)

(declare-fun b!367362 () Bool)

(declare-fun res!205660 () Bool)

(declare-fun e!224827 () Bool)

(assert (=> b!367362 (=> (not res!205660) (not e!224827))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12519 0))(
  ( (V!12520 (val!4325 Int)) )
))
(declare-datatypes ((ValueCell!3937 0))(
  ( (ValueCellFull!3937 (v!6522 V!12519)) (EmptyCell!3937) )
))
(declare-datatypes ((array!21081 0))(
  ( (array!21082 (arr!10009 (Array (_ BitVec 32) ValueCell!3937)) (size!10361 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21081)

(declare-datatypes ((array!21083 0))(
  ( (array!21084 (arr!10010 (Array (_ BitVec 32) (_ BitVec 64))) (size!10362 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21083)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367362 (= res!205660 (and (= (size!10361 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10362 _keys!658) (size!10361 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367363 () Bool)

(declare-fun res!205666 () Bool)

(assert (=> b!367363 (=> (not res!205666) (not e!224827))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367363 (= res!205666 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10362 _keys!658))))))

(declare-fun b!367364 () Bool)

(declare-fun e!224831 () Bool)

(declare-fun tp_is_empty!8561 () Bool)

(assert (=> b!367364 (= e!224831 tp_is_empty!8561)))

(declare-fun mapIsEmpty!14406 () Bool)

(declare-fun mapRes!14406 () Bool)

(assert (=> mapIsEmpty!14406 mapRes!14406))

(declare-fun b!367365 () Bool)

(declare-fun e!224828 () Bool)

(declare-fun e!224826 () Bool)

(assert (=> b!367365 (= e!224828 (and e!224826 mapRes!14406))))

(declare-fun condMapEmpty!14406 () Bool)

(declare-fun mapDefault!14406 () ValueCell!3937)

