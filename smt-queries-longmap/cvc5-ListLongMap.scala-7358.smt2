; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93852 () Bool)

(assert start!93852)

(declare-fun b_free!21325 () Bool)

(declare-fun b_next!21325 () Bool)

(assert (=> start!93852 (= b_free!21325 (not b_next!21325))))

(declare-fun tp!75397 () Bool)

(declare-fun b_and!34039 () Bool)

(assert (=> start!93852 (= tp!75397 b_and!34039)))

(declare-fun b!1061474 () Bool)

(declare-fun res!708844 () Bool)

(declare-fun e!604470 () Bool)

(assert (=> b!1061474 (=> (not res!708844) (not e!604470))))

(declare-datatypes ((array!67273 0))(
  ( (array!67274 (arr!32344 (Array (_ BitVec 32) (_ BitVec 64))) (size!32880 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67273)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67273 (_ BitVec 32)) Bool)

(assert (=> b!1061474 (= res!708844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708843 () Bool)

(assert (=> start!93852 (=> (not res!708843) (not e!604470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93852 (= res!708843 (validMask!0 mask!1515))))

(assert (=> start!93852 e!604470))

(assert (=> start!93852 true))

(declare-fun tp_is_empty!25135 () Bool)

(assert (=> start!93852 tp_is_empty!25135))

(declare-datatypes ((V!38649 0))(
  ( (V!38650 (val!12618 Int)) )
))
(declare-datatypes ((ValueCell!11864 0))(
  ( (ValueCellFull!11864 (v!15228 V!38649)) (EmptyCell!11864) )
))
(declare-datatypes ((array!67275 0))(
  ( (array!67276 (arr!32345 (Array (_ BitVec 32) ValueCell!11864)) (size!32881 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67275)

(declare-fun e!604469 () Bool)

(declare-fun array_inv!25062 (array!67275) Bool)

(assert (=> start!93852 (and (array_inv!25062 _values!955) e!604469)))

(assert (=> start!93852 tp!75397))

(declare-fun array_inv!25063 (array!67273) Bool)

(assert (=> start!93852 (array_inv!25063 _keys!1163)))

(declare-fun b!1061475 () Bool)

(declare-fun e!604471 () Bool)

(assert (=> b!1061475 (= e!604471 tp_is_empty!25135)))

(declare-fun mapIsEmpty!39373 () Bool)

(declare-fun mapRes!39373 () Bool)

(assert (=> mapIsEmpty!39373 mapRes!39373))

(declare-fun mapNonEmpty!39373 () Bool)

(declare-fun tp!75398 () Bool)

(declare-fun e!604472 () Bool)

(assert (=> mapNonEmpty!39373 (= mapRes!39373 (and tp!75398 e!604472))))

(declare-fun mapKey!39373 () (_ BitVec 32))

(declare-fun mapRest!39373 () (Array (_ BitVec 32) ValueCell!11864))

(declare-fun mapValue!39373 () ValueCell!11864)

(assert (=> mapNonEmpty!39373 (= (arr!32345 _values!955) (store mapRest!39373 mapKey!39373 mapValue!39373))))

(declare-fun b!1061476 () Bool)

(assert (=> b!1061476 (= e!604469 (and e!604471 mapRes!39373))))

(declare-fun condMapEmpty!39373 () Bool)

(declare-fun mapDefault!39373 () ValueCell!11864)

