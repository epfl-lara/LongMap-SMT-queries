; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20104 () Bool)

(assert start!20104)

(declare-fun b_free!4763 () Bool)

(declare-fun b_next!4763 () Bool)

(assert (=> start!20104 (= b_free!4763 (not b_next!4763))))

(declare-fun tp!17321 () Bool)

(declare-fun b_and!11509 () Bool)

(assert (=> start!20104 (= tp!17321 b_and!11509)))

(declare-fun mapIsEmpty!7997 () Bool)

(declare-fun mapRes!7997 () Bool)

(assert (=> mapIsEmpty!7997 mapRes!7997))

(declare-fun res!93078 () Bool)

(declare-fun e!129703 () Bool)

(assert (=> start!20104 (=> (not res!93078) (not e!129703))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20104 (= res!93078 (validMask!0 mask!1149))))

(assert (=> start!20104 e!129703))

(declare-datatypes ((V!5805 0))(
  ( (V!5806 (val!2354 Int)) )
))
(declare-datatypes ((ValueCell!1966 0))(
  ( (ValueCellFull!1966 (v!4324 V!5805)) (EmptyCell!1966) )
))
(declare-datatypes ((array!8493 0))(
  ( (array!8494 (arr!3997 (Array (_ BitVec 32) ValueCell!1966)) (size!4322 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8493)

(declare-fun e!129700 () Bool)

(declare-fun array_inv!2609 (array!8493) Bool)

(assert (=> start!20104 (and (array_inv!2609 _values!649) e!129700)))

(assert (=> start!20104 true))

(declare-fun tp_is_empty!4619 () Bool)

(assert (=> start!20104 tp_is_empty!4619))

(declare-datatypes ((array!8495 0))(
  ( (array!8496 (arr!3998 (Array (_ BitVec 32) (_ BitVec 64))) (size!4323 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8495)

(declare-fun array_inv!2610 (array!8495) Bool)

(assert (=> start!20104 (array_inv!2610 _keys!825)))

(assert (=> start!20104 tp!17321))

(declare-fun b!196994 () Bool)

(declare-fun e!129702 () Bool)

(assert (=> b!196994 (= e!129700 (and e!129702 mapRes!7997))))

(declare-fun condMapEmpty!7997 () Bool)

(declare-fun mapDefault!7997 () ValueCell!1966)

