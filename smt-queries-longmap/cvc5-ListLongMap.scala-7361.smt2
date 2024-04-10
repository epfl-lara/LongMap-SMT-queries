; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93870 () Bool)

(assert start!93870)

(declare-fun b_free!21343 () Bool)

(declare-fun b_next!21343 () Bool)

(assert (=> start!93870 (= b_free!21343 (not b_next!21343))))

(declare-fun tp!75452 () Bool)

(declare-fun b_and!34057 () Bool)

(assert (=> start!93870 (= tp!75452 b_and!34057)))

(declare-fun res!708950 () Bool)

(declare-fun e!604607 () Bool)

(assert (=> start!93870 (=> (not res!708950) (not e!604607))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93870 (= res!708950 (validMask!0 mask!1515))))

(assert (=> start!93870 e!604607))

(assert (=> start!93870 true))

(declare-fun tp_is_empty!25153 () Bool)

(assert (=> start!93870 tp_is_empty!25153))

(declare-datatypes ((V!38673 0))(
  ( (V!38674 (val!12627 Int)) )
))
(declare-datatypes ((ValueCell!11873 0))(
  ( (ValueCellFull!11873 (v!15237 V!38673)) (EmptyCell!11873) )
))
(declare-datatypes ((array!67309 0))(
  ( (array!67310 (arr!32362 (Array (_ BitVec 32) ValueCell!11873)) (size!32898 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67309)

(declare-fun e!604608 () Bool)

(declare-fun array_inv!25074 (array!67309) Bool)

(assert (=> start!93870 (and (array_inv!25074 _values!955) e!604608)))

(assert (=> start!93870 tp!75452))

(declare-datatypes ((array!67311 0))(
  ( (array!67312 (arr!32363 (Array (_ BitVec 32) (_ BitVec 64))) (size!32899 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67311)

(declare-fun array_inv!25075 (array!67311) Bool)

(assert (=> start!93870 (array_inv!25075 _keys!1163)))

(declare-fun b!1061663 () Bool)

(declare-fun e!604605 () Bool)

(declare-fun mapRes!39400 () Bool)

(assert (=> b!1061663 (= e!604608 (and e!604605 mapRes!39400))))

(declare-fun condMapEmpty!39400 () Bool)

(declare-fun mapDefault!39400 () ValueCell!11873)

