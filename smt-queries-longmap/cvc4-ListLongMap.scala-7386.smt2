; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94082 () Bool)

(assert start!94082)

(declare-fun b_free!21497 () Bool)

(declare-fun b_next!21497 () Bool)

(assert (=> start!94082 (= b_free!21497 (not b_next!21497))))

(declare-fun tp!75922 () Bool)

(declare-fun b_and!34239 () Bool)

(assert (=> start!94082 (= tp!75922 b_and!34239)))

(declare-fun b!1064012 () Bool)

(declare-fun e!606350 () Bool)

(declare-fun tp_is_empty!25307 () Bool)

(assert (=> b!1064012 (= e!606350 tp_is_empty!25307)))

(declare-fun b!1064013 () Bool)

(declare-fun e!606347 () Bool)

(assert (=> b!1064013 (= e!606347 tp_is_empty!25307)))

(declare-fun mapIsEmpty!39640 () Bool)

(declare-fun mapRes!39640 () Bool)

(assert (=> mapIsEmpty!39640 mapRes!39640))

(declare-fun b!1064014 () Bool)

(declare-fun res!710360 () Bool)

(declare-fun e!606349 () Bool)

(assert (=> b!1064014 (=> (not res!710360) (not e!606349))))

(declare-datatypes ((array!67611 0))(
  ( (array!67612 (arr!32510 (Array (_ BitVec 32) (_ BitVec 64))) (size!33046 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67611)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67611 (_ BitVec 32)) Bool)

(assert (=> b!1064014 (= res!710360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!710359 () Bool)

(assert (=> start!94082 (=> (not res!710359) (not e!606349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94082 (= res!710359 (validMask!0 mask!1515))))

(assert (=> start!94082 e!606349))

(assert (=> start!94082 true))

(assert (=> start!94082 tp_is_empty!25307))

(declare-datatypes ((V!38877 0))(
  ( (V!38878 (val!12704 Int)) )
))
(declare-datatypes ((ValueCell!11950 0))(
  ( (ValueCellFull!11950 (v!15316 V!38877)) (EmptyCell!11950) )
))
(declare-datatypes ((array!67613 0))(
  ( (array!67614 (arr!32511 (Array (_ BitVec 32) ValueCell!11950)) (size!33047 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67613)

(declare-fun e!606351 () Bool)

(declare-fun array_inv!25178 (array!67613) Bool)

(assert (=> start!94082 (and (array_inv!25178 _values!955) e!606351)))

(assert (=> start!94082 tp!75922))

(declare-fun array_inv!25179 (array!67611) Bool)

(assert (=> start!94082 (array_inv!25179 _keys!1163)))

(declare-fun b!1064015 () Bool)

(assert (=> b!1064015 (= e!606351 (and e!606347 mapRes!39640))))

(declare-fun condMapEmpty!39640 () Bool)

(declare-fun mapDefault!39640 () ValueCell!11950)

