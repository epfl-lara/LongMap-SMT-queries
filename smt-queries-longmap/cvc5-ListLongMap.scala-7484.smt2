; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94852 () Bool)

(assert start!94852)

(declare-fun b_free!22081 () Bool)

(declare-fun b_next!22081 () Bool)

(assert (=> start!94852 (= b_free!22081 (not b_next!22081))))

(declare-fun tp!77705 () Bool)

(declare-fun b_and!34923 () Bool)

(assert (=> start!94852 (= tp!77705 b_and!34923)))

(declare-fun b!1072592 () Bool)

(declare-fun res!715472 () Bool)

(declare-fun e!612670 () Bool)

(assert (=> b!1072592 (=> (not res!715472) (not e!612670))))

(declare-datatypes ((array!68749 0))(
  ( (array!68750 (arr!33069 (Array (_ BitVec 32) (_ BitVec 64))) (size!33605 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68749)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68749 (_ BitVec 32)) Bool)

(assert (=> b!1072592 (= res!715472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072594 () Bool)

(declare-fun e!612664 () Bool)

(assert (=> b!1072594 (= e!612664 (bvsle #b00000000000000000000000000000000 (size!33605 _keys!1163)))))

(declare-fun b!1072595 () Bool)

(declare-fun e!612667 () Bool)

(declare-fun e!612669 () Bool)

(declare-fun mapRes!40546 () Bool)

(assert (=> b!1072595 (= e!612667 (and e!612669 mapRes!40546))))

(declare-fun condMapEmpty!40546 () Bool)

(declare-datatypes ((V!39657 0))(
  ( (V!39658 (val!12996 Int)) )
))
(declare-datatypes ((ValueCell!12242 0))(
  ( (ValueCellFull!12242 (v!15613 V!39657)) (EmptyCell!12242) )
))
(declare-datatypes ((array!68751 0))(
  ( (array!68752 (arr!33070 (Array (_ BitVec 32) ValueCell!12242)) (size!33606 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68751)

(declare-fun mapDefault!40546 () ValueCell!12242)

