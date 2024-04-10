; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95548 () Bool)

(assert start!95548)

(declare-fun mapIsEmpty!41059 () Bool)

(declare-fun mapRes!41059 () Bool)

(assert (=> mapIsEmpty!41059 mapRes!41059))

(declare-fun b!1079133 () Bool)

(declare-fun e!616989 () Bool)

(declare-fun e!616991 () Bool)

(assert (=> b!1079133 (= e!616989 (and e!616991 mapRes!41059))))

(declare-fun condMapEmpty!41059 () Bool)

(declare-datatypes ((V!40065 0))(
  ( (V!40066 (val!13158 Int)) )
))
(declare-datatypes ((ValueCell!12392 0))(
  ( (ValueCellFull!12392 (v!15779 V!40065)) (EmptyCell!12392) )
))
(declare-datatypes ((array!69363 0))(
  ( (array!69364 (arr!33355 (Array (_ BitVec 32) ValueCell!12392)) (size!33891 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69363)

(declare-fun mapDefault!41059 () ValueCell!12392)

