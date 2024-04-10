; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3916 () Bool)

(assert start!3916)

(declare-fun b_free!821 () Bool)

(declare-fun b_next!821 () Bool)

(assert (=> start!3916 (= b_free!821 (not b_next!821))))

(declare-fun tp!3883 () Bool)

(declare-fun b_and!1631 () Bool)

(assert (=> start!3916 (= tp!3883 b_and!1631)))

(declare-fun b!27696 () Bool)

(declare-fun res!16420 () Bool)

(declare-fun e!18005 () Bool)

(assert (=> b!27696 (=> (not res!16420) (not e!18005))))

(declare-datatypes ((V!1391 0))(
  ( (V!1392 (val!614 Int)) )
))
(declare-datatypes ((ValueCell!388 0))(
  ( (ValueCellFull!388 (v!1703 V!1391)) (EmptyCell!388) )
))
(declare-datatypes ((array!1591 0))(
  ( (array!1592 (arr!749 (Array (_ BitVec 32) ValueCell!388)) (size!850 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1591)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1593 0))(
  ( (array!1594 (arr!750 (Array (_ BitVec 32) (_ BitVec 64))) (size!851 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1593)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!27696 (= res!16420 (and (= (size!850 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!851 _keys!1833) (size!850 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27697 () Bool)

(declare-fun e!18004 () Bool)

(declare-fun e!18006 () Bool)

(declare-fun mapRes!1291 () Bool)

(assert (=> b!27697 (= e!18004 (and e!18006 mapRes!1291))))

(declare-fun condMapEmpty!1291 () Bool)

(declare-fun mapDefault!1291 () ValueCell!388)

