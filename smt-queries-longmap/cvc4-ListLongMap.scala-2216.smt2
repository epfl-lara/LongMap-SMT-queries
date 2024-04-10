; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36762 () Bool)

(assert start!36762)

(declare-fun b!366930 () Bool)

(declare-fun res!205335 () Bool)

(declare-fun e!224611 () Bool)

(assert (=> b!366930 (=> (not res!205335) (not e!224611))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12487 0))(
  ( (V!12488 (val!4313 Int)) )
))
(declare-datatypes ((ValueCell!3925 0))(
  ( (ValueCellFull!3925 (v!6510 V!12487)) (EmptyCell!3925) )
))
(declare-datatypes ((array!21033 0))(
  ( (array!21034 (arr!9985 (Array (_ BitVec 32) ValueCell!3925)) (size!10337 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21033)

(declare-datatypes ((array!21035 0))(
  ( (array!21036 (arr!9986 (Array (_ BitVec 32) (_ BitVec 64))) (size!10338 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21035)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!366930 (= res!205335 (and (= (size!10337 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10338 _keys!658) (size!10337 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366931 () Bool)

(declare-fun res!205341 () Bool)

(assert (=> b!366931 (=> (not res!205341) (not e!224611))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366931 (= res!205341 (validKeyInArray!0 k!778))))

(declare-fun b!366932 () Bool)

(declare-fun res!205342 () Bool)

(assert (=> b!366932 (=> (not res!205342) (not e!224611))))

(declare-fun arrayContainsKey!0 (array!21035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366932 (= res!205342 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!366933 () Bool)

(declare-fun e!224613 () Bool)

(assert (=> b!366933 (= e!224613 false)))

(declare-fun lt!169299 () Bool)

(declare-fun lt!169298 () array!21035)

(declare-datatypes ((List!5556 0))(
  ( (Nil!5553) (Cons!5552 (h!6408 (_ BitVec 64)) (t!10706 List!5556)) )
))
(declare-fun arrayNoDuplicates!0 (array!21035 (_ BitVec 32) List!5556) Bool)

(assert (=> b!366933 (= lt!169299 (arrayNoDuplicates!0 lt!169298 #b00000000000000000000000000000000 Nil!5553))))

(declare-fun b!366934 () Bool)

(declare-fun res!205338 () Bool)

(assert (=> b!366934 (=> (not res!205338) (not e!224611))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366934 (= res!205338 (or (= (select (arr!9986 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9986 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!205343 () Bool)

(assert (=> start!36762 (=> (not res!205343) (not e!224611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36762 (= res!205343 (validMask!0 mask!970))))

(assert (=> start!36762 e!224611))

(assert (=> start!36762 true))

(declare-fun e!224615 () Bool)

(declare-fun array_inv!7386 (array!21033) Bool)

(assert (=> start!36762 (and (array_inv!7386 _values!506) e!224615)))

(declare-fun array_inv!7387 (array!21035) Bool)

(assert (=> start!36762 (array_inv!7387 _keys!658)))

(declare-fun b!366935 () Bool)

(declare-fun e!224612 () Bool)

(declare-fun tp_is_empty!8537 () Bool)

(assert (=> b!366935 (= e!224612 tp_is_empty!8537)))

(declare-fun b!366936 () Bool)

(declare-fun res!205340 () Bool)

(assert (=> b!366936 (=> (not res!205340) (not e!224611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21035 (_ BitVec 32)) Bool)

(assert (=> b!366936 (= res!205340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366937 () Bool)

(assert (=> b!366937 (= e!224611 e!224613)))

(declare-fun res!205339 () Bool)

(assert (=> b!366937 (=> (not res!205339) (not e!224613))))

(assert (=> b!366937 (= res!205339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169298 mask!970))))

(assert (=> b!366937 (= lt!169298 (array!21036 (store (arr!9986 _keys!658) i!548 k!778) (size!10338 _keys!658)))))

(declare-fun b!366938 () Bool)

(declare-fun mapRes!14370 () Bool)

(assert (=> b!366938 (= e!224615 (and e!224612 mapRes!14370))))

(declare-fun condMapEmpty!14370 () Bool)

(declare-fun mapDefault!14370 () ValueCell!3925)

