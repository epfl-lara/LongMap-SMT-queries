; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35034 () Bool)

(assert start!35034)

(declare-fun b_free!7723 () Bool)

(declare-fun b_next!7723 () Bool)

(assert (=> start!35034 (= b_free!7723 (not b_next!7723))))

(declare-fun tp!26748 () Bool)

(declare-fun b_and!14953 () Bool)

(assert (=> start!35034 (= tp!26748 b_and!14953)))

(declare-fun b!351173 () Bool)

(declare-fun e!215065 () Bool)

(assert (=> b!351173 (= e!215065 false)))

(declare-fun lt!164715 () (_ BitVec 32))

(declare-datatypes ((array!18937 0))(
  ( (array!18938 (arr!8974 (Array (_ BitVec 32) (_ BitVec 64))) (size!9326 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18937)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18937 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351173 (= lt!164715 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12984 () Bool)

(declare-fun mapRes!12984 () Bool)

(assert (=> mapIsEmpty!12984 mapRes!12984))

(declare-fun b!351174 () Bool)

(declare-fun e!215060 () Bool)

(declare-fun e!215064 () Bool)

(assert (=> b!351174 (= e!215060 (and e!215064 mapRes!12984))))

(declare-fun condMapEmpty!12984 () Bool)

(declare-datatypes ((V!11211 0))(
  ( (V!11212 (val!3882 Int)) )
))
(declare-datatypes ((ValueCell!3494 0))(
  ( (ValueCellFull!3494 (v!6069 V!11211)) (EmptyCell!3494) )
))
(declare-datatypes ((array!18939 0))(
  ( (array!18940 (arr!8975 (Array (_ BitVec 32) ValueCell!3494)) (size!9327 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18939)

(declare-fun mapDefault!12984 () ValueCell!3494)

