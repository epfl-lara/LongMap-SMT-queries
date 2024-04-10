; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93726 () Bool)

(assert start!93726)

(declare-fun b_free!21211 () Bool)

(declare-fun b_next!21211 () Bool)

(assert (=> start!93726 (= b_free!21211 (not b_next!21211))))

(declare-fun tp!75053 () Bool)

(declare-fun b_and!33921 () Bool)

(assert (=> start!93726 (= tp!75053 b_and!33921)))

(declare-fun res!708133 () Bool)

(declare-fun e!603569 () Bool)

(assert (=> start!93726 (=> (not res!708133) (not e!603569))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93726 (= res!708133 (validMask!0 mask!1515))))

(assert (=> start!93726 e!603569))

(assert (=> start!93726 true))

(declare-fun tp_is_empty!25021 () Bool)

(assert (=> start!93726 tp_is_empty!25021))

(declare-datatypes ((V!38497 0))(
  ( (V!38498 (val!12561 Int)) )
))
(declare-datatypes ((ValueCell!11807 0))(
  ( (ValueCellFull!11807 (v!15171 V!38497)) (EmptyCell!11807) )
))
(declare-datatypes ((array!67063 0))(
  ( (array!67064 (arr!32240 (Array (_ BitVec 32) ValueCell!11807)) (size!32776 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67063)

(declare-fun e!603567 () Bool)

(declare-fun array_inv!24986 (array!67063) Bool)

(assert (=> start!93726 (and (array_inv!24986 _values!955) e!603567)))

(assert (=> start!93726 tp!75053))

(declare-datatypes ((array!67065 0))(
  ( (array!67066 (arr!32241 (Array (_ BitVec 32) (_ BitVec 64))) (size!32777 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67065)

(declare-fun array_inv!24987 (array!67065) Bool)

(assert (=> start!93726 (array_inv!24987 _keys!1163)))

(declare-fun mapNonEmpty!39199 () Bool)

(declare-fun mapRes!39199 () Bool)

(declare-fun tp!75052 () Bool)

(declare-fun e!603568 () Bool)

(assert (=> mapNonEmpty!39199 (= mapRes!39199 (and tp!75052 e!603568))))

(declare-fun mapRest!39199 () (Array (_ BitVec 32) ValueCell!11807))

(declare-fun mapKey!39199 () (_ BitVec 32))

(declare-fun mapValue!39199 () ValueCell!11807)

(assert (=> mapNonEmpty!39199 (= (arr!32240 _values!955) (store mapRest!39199 mapKey!39199 mapValue!39199))))

(declare-fun b!1060204 () Bool)

(declare-fun e!603566 () Bool)

(assert (=> b!1060204 (= e!603566 tp_is_empty!25021)))

(declare-fun b!1060205 () Bool)

(declare-fun res!708130 () Bool)

(assert (=> b!1060205 (=> (not res!708130) (not e!603569))))

(declare-datatypes ((List!22463 0))(
  ( (Nil!22460) (Cons!22459 (h!23668 (_ BitVec 64)) (t!31770 List!22463)) )
))
(declare-fun arrayNoDuplicates!0 (array!67065 (_ BitVec 32) List!22463) Bool)

(assert (=> b!1060205 (= res!708130 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22460))))

(declare-fun b!1060206 () Bool)

(assert (=> b!1060206 (= e!603567 (and e!603566 mapRes!39199))))

(declare-fun condMapEmpty!39199 () Bool)

(declare-fun mapDefault!39199 () ValueCell!11807)

