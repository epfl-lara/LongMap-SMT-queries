; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33636 () Bool)

(assert start!33636)

(declare-fun b_free!6871 () Bool)

(declare-fun b_next!6871 () Bool)

(assert (=> start!33636 (= b_free!6871 (not b_next!6871))))

(declare-fun tp!24116 () Bool)

(declare-fun b_and!14051 () Bool)

(assert (=> start!33636 (= tp!24116 b_and!14051)))

(declare-fun b!333876 () Bool)

(declare-fun e!204990 () Bool)

(declare-fun e!204988 () Bool)

(declare-fun mapRes!11631 () Bool)

(assert (=> b!333876 (= e!204990 (and e!204988 mapRes!11631))))

(declare-fun condMapEmpty!11631 () Bool)

(declare-datatypes ((V!10075 0))(
  ( (V!10076 (val!3456 Int)) )
))
(declare-datatypes ((ValueCell!3068 0))(
  ( (ValueCellFull!3068 (v!5618 V!10075)) (EmptyCell!3068) )
))
(declare-datatypes ((array!17241 0))(
  ( (array!17242 (arr!8151 (Array (_ BitVec 32) ValueCell!3068)) (size!8503 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17241)

(declare-fun mapDefault!11631 () ValueCell!3068)

