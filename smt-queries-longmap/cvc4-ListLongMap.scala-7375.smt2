; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93994 () Bool)

(assert start!93994)

(declare-fun b_free!21431 () Bool)

(declare-fun b_next!21431 () Bool)

(assert (=> start!93994 (= b_free!21431 (not b_next!21431))))

(declare-fun tp!75722 () Bool)

(declare-fun b_and!34163 () Bool)

(assert (=> start!93994 (= tp!75722 b_and!34163)))

(declare-fun b!1063052 () Bool)

(declare-fun e!605643 () Bool)

(declare-fun e!605648 () Bool)

(declare-fun mapRes!39538 () Bool)

(assert (=> b!1063052 (= e!605643 (and e!605648 mapRes!39538))))

(declare-fun condMapEmpty!39538 () Bool)

(declare-datatypes ((V!38789 0))(
  ( (V!38790 (val!12671 Int)) )
))
(declare-datatypes ((ValueCell!11917 0))(
  ( (ValueCellFull!11917 (v!15282 V!38789)) (EmptyCell!11917) )
))
(declare-datatypes ((array!67483 0))(
  ( (array!67484 (arr!32447 (Array (_ BitVec 32) ValueCell!11917)) (size!32983 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67483)

(declare-fun mapDefault!39538 () ValueCell!11917)

