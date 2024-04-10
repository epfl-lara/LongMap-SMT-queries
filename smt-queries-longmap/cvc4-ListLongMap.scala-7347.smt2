; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93790 () Bool)

(assert start!93790)

(declare-fun b_free!21263 () Bool)

(declare-fun b_next!21263 () Bool)

(assert (=> start!93790 (= b_free!21263 (not b_next!21263))))

(declare-fun tp!75212 () Bool)

(declare-fun b_and!33977 () Bool)

(assert (=> start!93790 (= tp!75212 b_and!33977)))

(declare-fun res!708470 () Bool)

(declare-fun e!604008 () Bool)

(assert (=> start!93790 (=> (not res!708470) (not e!604008))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93790 (= res!708470 (validMask!0 mask!1515))))

(assert (=> start!93790 e!604008))

(assert (=> start!93790 true))

(declare-fun tp_is_empty!25073 () Bool)

(assert (=> start!93790 tp_is_empty!25073))

(declare-datatypes ((V!38565 0))(
  ( (V!38566 (val!12587 Int)) )
))
(declare-datatypes ((ValueCell!11833 0))(
  ( (ValueCellFull!11833 (v!15197 V!38565)) (EmptyCell!11833) )
))
(declare-datatypes ((array!67157 0))(
  ( (array!67158 (arr!32286 (Array (_ BitVec 32) ValueCell!11833)) (size!32822 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67157)

(declare-fun e!604007 () Bool)

(declare-fun array_inv!25018 (array!67157) Bool)

(assert (=> start!93790 (and (array_inv!25018 _values!955) e!604007)))

(assert (=> start!93790 tp!75212))

(declare-datatypes ((array!67159 0))(
  ( (array!67160 (arr!32287 (Array (_ BitVec 32) (_ BitVec 64))) (size!32823 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67159)

(declare-fun array_inv!25019 (array!67159) Bool)

(assert (=> start!93790 (array_inv!25019 _keys!1163)))

(declare-fun b!1060823 () Bool)

(declare-fun e!604005 () Bool)

(assert (=> b!1060823 (= e!604005 tp_is_empty!25073)))

(declare-fun b!1060824 () Bool)

(declare-fun e!604004 () Bool)

(declare-fun mapRes!39280 () Bool)

(assert (=> b!1060824 (= e!604007 (and e!604004 mapRes!39280))))

(declare-fun condMapEmpty!39280 () Bool)

(declare-fun mapDefault!39280 () ValueCell!11833)

