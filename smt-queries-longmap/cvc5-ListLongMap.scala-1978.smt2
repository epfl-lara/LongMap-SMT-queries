; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34730 () Bool)

(assert start!34730)

(declare-fun b_free!7537 () Bool)

(declare-fun b_next!7537 () Bool)

(assert (=> start!34730 (= b_free!7537 (not b_next!7537))))

(declare-fun tp!26175 () Bool)

(declare-fun b_and!14757 () Bool)

(assert (=> start!34730 (= tp!26175 b_and!14757)))

(declare-fun b!347276 () Bool)

(declare-fun res!192215 () Bool)

(declare-fun e!212796 () Bool)

(assert (=> b!347276 (=> (not res!192215) (not e!212796))))

(declare-datatypes ((array!18569 0))(
  ( (array!18570 (arr!8795 (Array (_ BitVec 32) (_ BitVec 64))) (size!9147 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18569)

(declare-datatypes ((List!5106 0))(
  ( (Nil!5103) (Cons!5102 (h!5958 (_ BitVec 64)) (t!10234 List!5106)) )
))
(declare-fun arrayNoDuplicates!0 (array!18569 (_ BitVec 32) List!5106) Bool)

(assert (=> b!347276 (= res!192215 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5103))))

(declare-fun b!347277 () Bool)

(declare-fun res!192212 () Bool)

(assert (=> b!347277 (=> (not res!192212) (not e!212796))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10963 0))(
  ( (V!10964 (val!3789 Int)) )
))
(declare-datatypes ((ValueCell!3401 0))(
  ( (ValueCellFull!3401 (v!5971 V!10963)) (EmptyCell!3401) )
))
(declare-datatypes ((array!18571 0))(
  ( (array!18572 (arr!8796 (Array (_ BitVec 32) ValueCell!3401)) (size!9148 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18571)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347277 (= res!192212 (and (= (size!9148 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9147 _keys!1895) (size!9148 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347278 () Bool)

(declare-fun e!212792 () Bool)

(assert (=> b!347278 (= e!212796 e!212792)))

(declare-fun res!192213 () Bool)

(assert (=> b!347278 (=> (not res!192213) (not e!212792))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3393 0))(
  ( (MissingZero!3393 (index!15751 (_ BitVec 32))) (Found!3393 (index!15752 (_ BitVec 32))) (Intermediate!3393 (undefined!4205 Bool) (index!15753 (_ BitVec 32)) (x!34599 (_ BitVec 32))) (Undefined!3393) (MissingVacant!3393 (index!15754 (_ BitVec 32))) )
))
(declare-fun lt!163521 () SeekEntryResult!3393)

(assert (=> b!347278 (= res!192213 (and (is-Found!3393 lt!163521) (= (select (arr!8795 _keys!1895) (index!15752 lt!163521)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18569 (_ BitVec 32)) SeekEntryResult!3393)

(assert (=> b!347278 (= lt!163521 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!192214 () Bool)

(assert (=> start!34730 (=> (not res!192214) (not e!212796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34730 (= res!192214 (validMask!0 mask!2385))))

(assert (=> start!34730 e!212796))

(assert (=> start!34730 true))

(declare-fun tp_is_empty!7489 () Bool)

(assert (=> start!34730 tp_is_empty!7489))

(assert (=> start!34730 tp!26175))

(declare-fun e!212791 () Bool)

(declare-fun array_inv!6512 (array!18571) Bool)

(assert (=> start!34730 (and (array_inv!6512 _values!1525) e!212791)))

(declare-fun array_inv!6513 (array!18569) Bool)

(assert (=> start!34730 (array_inv!6513 _keys!1895)))

(declare-fun b!347279 () Bool)

(declare-fun e!212793 () Bool)

(declare-fun mapRes!12690 () Bool)

(assert (=> b!347279 (= e!212791 (and e!212793 mapRes!12690))))

(declare-fun condMapEmpty!12690 () Bool)

(declare-fun mapDefault!12690 () ValueCell!3401)

