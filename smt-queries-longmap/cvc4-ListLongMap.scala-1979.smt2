; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34740 () Bool)

(assert start!34740)

(declare-fun b_free!7547 () Bool)

(declare-fun b_next!7547 () Bool)

(assert (=> start!34740 (= b_free!7547 (not b_next!7547))))

(declare-fun tp!26205 () Bool)

(declare-fun b_and!14767 () Bool)

(assert (=> start!34740 (= tp!26205 b_and!14767)))

(declare-fun b!347441 () Bool)

(declare-fun res!192337 () Bool)

(declare-fun e!212881 () Bool)

(assert (=> b!347441 (=> (not res!192337) (not e!212881))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10975 0))(
  ( (V!10976 (val!3794 Int)) )
))
(declare-datatypes ((ValueCell!3406 0))(
  ( (ValueCellFull!3406 (v!5976 V!10975)) (EmptyCell!3406) )
))
(declare-datatypes ((array!18589 0))(
  ( (array!18590 (arr!8805 (Array (_ BitVec 32) ValueCell!3406)) (size!9157 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18589)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((array!18591 0))(
  ( (array!18592 (arr!8806 (Array (_ BitVec 32) (_ BitVec 64))) (size!9158 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18591)

(assert (=> b!347441 (= res!192337 (and (= (size!9157 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9158 _keys!1895) (size!9157 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347442 () Bool)

(declare-fun res!192334 () Bool)

(assert (=> b!347442 (=> (not res!192334) (not e!212881))))

(declare-datatypes ((List!5114 0))(
  ( (Nil!5111) (Cons!5110 (h!5966 (_ BitVec 64)) (t!10242 List!5114)) )
))
(declare-fun arrayNoDuplicates!0 (array!18591 (_ BitVec 32) List!5114) Bool)

(assert (=> b!347442 (= res!192334 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5111))))

(declare-fun mapIsEmpty!12705 () Bool)

(declare-fun mapRes!12705 () Bool)

(assert (=> mapIsEmpty!12705 mapRes!12705))

(declare-fun mapNonEmpty!12705 () Bool)

(declare-fun tp!26204 () Bool)

(declare-fun e!212882 () Bool)

(assert (=> mapNonEmpty!12705 (= mapRes!12705 (and tp!26204 e!212882))))

(declare-fun mapRest!12705 () (Array (_ BitVec 32) ValueCell!3406))

(declare-fun mapValue!12705 () ValueCell!3406)

(declare-fun mapKey!12705 () (_ BitVec 32))

(assert (=> mapNonEmpty!12705 (= (arr!8805 _values!1525) (store mapRest!12705 mapKey!12705 mapValue!12705))))

(declare-fun b!347443 () Bool)

(declare-fun res!192332 () Bool)

(assert (=> b!347443 (=> (not res!192332) (not e!212881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18591 (_ BitVec 32)) Bool)

(assert (=> b!347443 (= res!192332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347444 () Bool)

(declare-fun e!212886 () Bool)

(declare-fun e!212885 () Bool)

(assert (=> b!347444 (= e!212886 (and e!212885 mapRes!12705))))

(declare-fun condMapEmpty!12705 () Bool)

(declare-fun mapDefault!12705 () ValueCell!3406)

