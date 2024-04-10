; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34580 () Bool)

(assert start!34580)

(declare-fun b_free!7465 () Bool)

(declare-fun b_next!7465 () Bool)

(assert (=> start!34580 (= b_free!7465 (not b_next!7465))))

(declare-fun tp!25947 () Bool)

(declare-fun b_and!14677 () Bool)

(assert (=> start!34580 (= tp!25947 b_and!14677)))

(declare-fun b!345595 () Bool)

(declare-fun e!211818 () Bool)

(declare-fun tp_is_empty!7417 () Bool)

(assert (=> b!345595 (= e!211818 tp_is_empty!7417)))

(declare-fun b!345596 () Bool)

(declare-fun res!191185 () Bool)

(declare-fun e!211820 () Bool)

(assert (=> b!345596 (=> (not res!191185) (not e!211820))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10867 0))(
  ( (V!10868 (val!3753 Int)) )
))
(declare-fun zeroValue!1467 () V!10867)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3365 0))(
  ( (ValueCellFull!3365 (v!5931 V!10867)) (EmptyCell!3365) )
))
(declare-datatypes ((array!18421 0))(
  ( (array!18422 (arr!8725 (Array (_ BitVec 32) ValueCell!3365)) (size!9077 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18421)

(declare-datatypes ((array!18423 0))(
  ( (array!18424 (arr!8726 (Array (_ BitVec 32) (_ BitVec 64))) (size!9078 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18423)

(declare-fun minValue!1467 () V!10867)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5426 0))(
  ( (tuple2!5427 (_1!2724 (_ BitVec 64)) (_2!2724 V!10867)) )
))
(declare-datatypes ((List!5050 0))(
  ( (Nil!5047) (Cons!5046 (h!5902 tuple2!5426) (t!10170 List!5050)) )
))
(declare-datatypes ((ListLongMap!4339 0))(
  ( (ListLongMap!4340 (toList!2185 List!5050)) )
))
(declare-fun contains!2245 (ListLongMap!4339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1706 (array!18423 array!18421 (_ BitVec 32) (_ BitVec 32) V!10867 V!10867 (_ BitVec 32) Int) ListLongMap!4339)

(assert (=> b!345596 (= res!191185 (not (contains!2245 (getCurrentListMap!1706 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!345597 () Bool)

(declare-fun res!191181 () Bool)

(assert (=> b!345597 (=> (not res!191181) (not e!211820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18423 (_ BitVec 32)) Bool)

(assert (=> b!345597 (= res!191181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12570 () Bool)

(declare-fun mapRes!12570 () Bool)

(assert (=> mapIsEmpty!12570 mapRes!12570))

(declare-fun b!345598 () Bool)

(declare-fun res!191186 () Bool)

(assert (=> b!345598 (=> (not res!191186) (not e!211820))))

(assert (=> b!345598 (= res!191186 (and (= (size!9077 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9078 _keys!1895) (size!9077 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345599 () Bool)

(declare-fun res!191183 () Bool)

(assert (=> b!345599 (=> (not res!191183) (not e!211820))))

(declare-datatypes ((List!5051 0))(
  ( (Nil!5048) (Cons!5047 (h!5903 (_ BitVec 64)) (t!10171 List!5051)) )
))
(declare-fun arrayNoDuplicates!0 (array!18423 (_ BitVec 32) List!5051) Bool)

(assert (=> b!345599 (= res!191183 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5048))))

(declare-fun b!345594 () Bool)

(declare-datatypes ((SeekEntryResult!3363 0))(
  ( (MissingZero!3363 (index!15631 (_ BitVec 32))) (Found!3363 (index!15632 (_ BitVec 32))) (Intermediate!3363 (undefined!4175 Bool) (index!15633 (_ BitVec 32)) (x!34433 (_ BitVec 32))) (Undefined!3363) (MissingVacant!3363 (index!15634 (_ BitVec 32))) )
))
(declare-fun lt!162964 () SeekEntryResult!3363)

(assert (=> b!345594 (= e!211820 (and (is-Found!3363 lt!162964) (or (bvslt (index!15632 lt!162964) #b00000000000000000000000000000000) (bvsge (index!15632 lt!162964) (size!9078 _keys!1895)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18423 (_ BitVec 32)) SeekEntryResult!3363)

(assert (=> b!345594 (= lt!162964 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!191182 () Bool)

(assert (=> start!34580 (=> (not res!191182) (not e!211820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34580 (= res!191182 (validMask!0 mask!2385))))

(assert (=> start!34580 e!211820))

(assert (=> start!34580 true))

(assert (=> start!34580 tp_is_empty!7417))

(assert (=> start!34580 tp!25947))

(declare-fun e!211821 () Bool)

(declare-fun array_inv!6458 (array!18421) Bool)

(assert (=> start!34580 (and (array_inv!6458 _values!1525) e!211821)))

(declare-fun array_inv!6459 (array!18423) Bool)

(assert (=> start!34580 (array_inv!6459 _keys!1895)))

(declare-fun b!345600 () Bool)

(declare-fun res!191184 () Bool)

(assert (=> b!345600 (=> (not res!191184) (not e!211820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345600 (= res!191184 (validKeyInArray!0 k!1348))))

(declare-fun b!345601 () Bool)

(assert (=> b!345601 (= e!211821 (and e!211818 mapRes!12570))))

(declare-fun condMapEmpty!12570 () Bool)

(declare-fun mapDefault!12570 () ValueCell!3365)

