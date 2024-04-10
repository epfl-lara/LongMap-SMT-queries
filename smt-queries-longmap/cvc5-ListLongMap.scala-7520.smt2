; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95360 () Bool)

(assert start!95360)

(declare-fun mapIsEmpty!40879 () Bool)

(declare-fun mapRes!40879 () Bool)

(assert (=> mapIsEmpty!40879 mapRes!40879))

(declare-fun b!1077202 () Bool)

(declare-fun e!615888 () Bool)

(declare-fun tp_is_empty!26095 () Bool)

(assert (=> b!1077202 (= e!615888 tp_is_empty!26095)))

(declare-fun res!717785 () Bool)

(declare-fun e!615885 () Bool)

(assert (=> start!95360 (=> (not res!717785) (not e!615885))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95360 (= res!717785 (validMask!0 mask!1414))))

(assert (=> start!95360 e!615885))

(assert (=> start!95360 true))

(declare-datatypes ((V!39921 0))(
  ( (V!39922 (val!13104 Int)) )
))
(declare-datatypes ((ValueCell!12338 0))(
  ( (ValueCellFull!12338 (v!15723 V!39921)) (EmptyCell!12338) )
))
(declare-datatypes ((array!69139 0))(
  ( (array!69140 (arr!33249 (Array (_ BitVec 32) ValueCell!12338)) (size!33785 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69139)

(declare-fun e!615887 () Bool)

(declare-fun array_inv!25686 (array!69139) Bool)

(assert (=> start!95360 (and (array_inv!25686 _values!874) e!615887)))

(declare-datatypes ((array!69141 0))(
  ( (array!69142 (arr!33250 (Array (_ BitVec 32) (_ BitVec 64))) (size!33786 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69141)

(declare-fun array_inv!25687 (array!69141) Bool)

(assert (=> start!95360 (array_inv!25687 _keys!1070)))

(declare-fun b!1077203 () Bool)

(declare-fun res!717786 () Bool)

(assert (=> b!1077203 (=> (not res!717786) (not e!615885))))

(assert (=> b!1077203 (= res!717786 (and (bvsle #b00000000000000000000000000000000 (size!33786 _keys!1070)) (bvslt (size!33786 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077204 () Bool)

(declare-fun e!615884 () Bool)

(assert (=> b!1077204 (= e!615887 (and e!615884 mapRes!40879))))

(declare-fun condMapEmpty!40879 () Bool)

(declare-fun mapDefault!40879 () ValueCell!12338)

