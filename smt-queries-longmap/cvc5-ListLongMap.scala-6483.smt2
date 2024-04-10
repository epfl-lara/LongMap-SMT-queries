; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82738 () Bool)

(assert start!82738)

(declare-fun b_free!18871 () Bool)

(declare-fun b_next!18871 () Bool)

(assert (=> start!82738 (= b_free!18871 (not b_next!18871))))

(declare-fun tp!65733 () Bool)

(declare-fun b_and!30359 () Bool)

(assert (=> start!82738 (= tp!65733 b_and!30359)))

(declare-fun res!645951 () Bool)

(declare-fun e!543999 () Bool)

(assert (=> start!82738 (=> (not res!645951) (not e!543999))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82738 (= res!645951 (validMask!0 mask!2110))))

(assert (=> start!82738 e!543999))

(assert (=> start!82738 true))

(declare-datatypes ((V!33881 0))(
  ( (V!33882 (val!10887 Int)) )
))
(declare-datatypes ((ValueCell!10355 0))(
  ( (ValueCellFull!10355 (v!13445 V!33881)) (EmptyCell!10355) )
))
(declare-datatypes ((array!59431 0))(
  ( (array!59432 (arr!28584 (Array (_ BitVec 32) ValueCell!10355)) (size!29063 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59431)

(declare-fun e!544001 () Bool)

(declare-fun array_inv!22133 (array!59431) Bool)

(assert (=> start!82738 (and (array_inv!22133 _values!1400) e!544001)))

(declare-datatypes ((array!59433 0))(
  ( (array!59434 (arr!28585 (Array (_ BitVec 32) (_ BitVec 64))) (size!29064 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59433)

(declare-fun array_inv!22134 (array!59433) Bool)

(assert (=> start!82738 (array_inv!22134 _keys!1686)))

(assert (=> start!82738 tp!65733))

(declare-fun tp_is_empty!21673 () Bool)

(assert (=> start!82738 tp_is_empty!21673))

(declare-fun mapIsEmpty!34504 () Bool)

(declare-fun mapRes!34504 () Bool)

(assert (=> mapIsEmpty!34504 mapRes!34504))

(declare-fun b!965003 () Bool)

(declare-fun e!544000 () Bool)

(assert (=> b!965003 (= e!544001 (and e!544000 mapRes!34504))))

(declare-fun condMapEmpty!34504 () Bool)

(declare-fun mapDefault!34504 () ValueCell!10355)

