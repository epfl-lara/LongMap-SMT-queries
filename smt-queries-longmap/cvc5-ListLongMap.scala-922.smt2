; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20628 () Bool)

(assert start!20628)

(declare-fun b_free!5287 () Bool)

(declare-fun b_next!5287 () Bool)

(assert (=> start!20628 (= b_free!5287 (not b_next!5287))))

(declare-fun tp!18892 () Bool)

(declare-fun b_and!12033 () Bool)

(assert (=> start!20628 (= tp!18892 b_and!12033)))

(declare-fun b!205812 () Bool)

(declare-fun res!99536 () Bool)

(declare-fun e!134565 () Bool)

(assert (=> b!205812 (=> (not res!99536) (not e!134565))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9497 0))(
  ( (array!9498 (arr!4499 (Array (_ BitVec 32) (_ BitVec 64))) (size!4824 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9497)

(assert (=> b!205812 (= res!99536 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4824 _keys!825))))))

(declare-fun b!205813 () Bool)

(declare-fun res!99537 () Bool)

(assert (=> b!205813 (=> (not res!99537) (not e!134565))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6505 0))(
  ( (V!6506 (val!2616 Int)) )
))
(declare-datatypes ((ValueCell!2228 0))(
  ( (ValueCellFull!2228 (v!4586 V!6505)) (EmptyCell!2228) )
))
(declare-datatypes ((array!9499 0))(
  ( (array!9500 (arr!4500 (Array (_ BitVec 32) ValueCell!2228)) (size!4825 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9499)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205813 (= res!99537 (and (= (size!4825 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4824 _keys!825) (size!4825 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205814 () Bool)

(declare-fun e!134564 () Bool)

(declare-fun e!134561 () Bool)

(declare-fun mapRes!8783 () Bool)

(assert (=> b!205814 (= e!134564 (and e!134561 mapRes!8783))))

(declare-fun condMapEmpty!8783 () Bool)

(declare-fun mapDefault!8783 () ValueCell!2228)

