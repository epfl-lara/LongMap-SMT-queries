; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42430 () Bool)

(assert start!42430)

(declare-fun b_free!11905 () Bool)

(declare-fun b_next!11905 () Bool)

(assert (=> start!42430 (= b_free!11905 (not b_next!11905))))

(declare-fun tp!41748 () Bool)

(declare-fun b_and!20361 () Bool)

(assert (=> start!42430 (= tp!41748 b_and!20361)))

(declare-fun b!473432 () Bool)

(declare-fun e!277746 () Bool)

(declare-fun tp_is_empty!13333 () Bool)

(assert (=> b!473432 (= e!277746 tp_is_empty!13333)))

(declare-fun mapIsEmpty!21712 () Bool)

(declare-fun mapRes!21712 () Bool)

(assert (=> mapIsEmpty!21712 mapRes!21712))

(declare-fun mapNonEmpty!21712 () Bool)

(declare-fun tp!41749 () Bool)

(declare-fun e!277748 () Bool)

(assert (=> mapNonEmpty!21712 (= mapRes!21712 (and tp!41749 e!277748))))

(declare-fun mapKey!21712 () (_ BitVec 32))

(declare-datatypes ((V!18883 0))(
  ( (V!18884 (val!6711 Int)) )
))
(declare-datatypes ((ValueCell!6323 0))(
  ( (ValueCellFull!6323 (v!9002 V!18883)) (EmptyCell!6323) )
))
(declare-fun mapRest!21712 () (Array (_ BitVec 32) ValueCell!6323))

(declare-fun mapValue!21712 () ValueCell!6323)

(declare-datatypes ((array!30423 0))(
  ( (array!30424 (arr!14631 (Array (_ BitVec 32) ValueCell!6323)) (size!14983 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30423)

(assert (=> mapNonEmpty!21712 (= (arr!14631 _values!833) (store mapRest!21712 mapKey!21712 mapValue!21712))))

(declare-fun b!473433 () Bool)

(declare-fun e!277750 () Bool)

(assert (=> b!473433 (= e!277750 (and e!277746 mapRes!21712))))

(declare-fun condMapEmpty!21712 () Bool)

(declare-fun mapDefault!21712 () ValueCell!6323)

