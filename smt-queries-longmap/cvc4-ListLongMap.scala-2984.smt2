; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42198 () Bool)

(assert start!42198)

(declare-fun b_free!11717 () Bool)

(declare-fun b_next!11717 () Bool)

(assert (=> start!42198 (= b_free!11717 (not b_next!11717))))

(declare-fun tp!41175 () Bool)

(declare-fun b_and!20147 () Bool)

(assert (=> start!42198 (= tp!41175 b_and!20147)))

(declare-fun mapNonEmpty!21421 () Bool)

(declare-fun mapRes!21421 () Bool)

(declare-fun tp!41176 () Bool)

(declare-fun e!275988 () Bool)

(assert (=> mapNonEmpty!21421 (= mapRes!21421 (and tp!41176 e!275988))))

(declare-datatypes ((V!18631 0))(
  ( (V!18632 (val!6617 Int)) )
))
(declare-datatypes ((ValueCell!6229 0))(
  ( (ValueCellFull!6229 (v!8908 V!18631)) (EmptyCell!6229) )
))
(declare-datatypes ((array!30059 0))(
  ( (array!30060 (arr!14452 (Array (_ BitVec 32) ValueCell!6229)) (size!14804 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30059)

(declare-fun mapKey!21421 () (_ BitVec 32))

(declare-fun mapValue!21421 () ValueCell!6229)

(declare-fun mapRest!21421 () (Array (_ BitVec 32) ValueCell!6229))

(assert (=> mapNonEmpty!21421 (= (arr!14452 _values!833) (store mapRest!21421 mapKey!21421 mapValue!21421))))

(declare-fun b!470994 () Bool)

(declare-fun e!275989 () Bool)

(declare-fun e!275987 () Bool)

(assert (=> b!470994 (= e!275989 (and e!275987 mapRes!21421))))

(declare-fun condMapEmpty!21421 () Bool)

(declare-fun mapDefault!21421 () ValueCell!6229)

