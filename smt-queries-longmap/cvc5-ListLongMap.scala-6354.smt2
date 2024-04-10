; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81860 () Bool)

(assert start!81860)

(declare-fun b_free!18355 () Bool)

(declare-fun b_next!18355 () Bool)

(assert (=> start!81860 (= b_free!18355 (not b_next!18355))))

(declare-fun tp!63764 () Bool)

(declare-fun b_and!29841 () Bool)

(assert (=> start!81860 (= tp!63764 b_and!29841)))

(declare-fun b!954670 () Bool)

(declare-fun res!639289 () Bool)

(declare-fun e!537849 () Bool)

(assert (=> b!954670 (=> (not res!639289) (not e!537849))))

(declare-datatypes ((array!57909 0))(
  ( (array!57910 (arr!27834 (Array (_ BitVec 32) (_ BitVec 64))) (size!28313 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57909)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57909 (_ BitVec 32)) Bool)

(assert (=> b!954670 (= res!639289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954671 () Bool)

(declare-fun e!537853 () Bool)

(declare-fun e!537851 () Bool)

(declare-fun mapRes!33310 () Bool)

(assert (=> b!954671 (= e!537853 (and e!537851 mapRes!33310))))

(declare-fun condMapEmpty!33310 () Bool)

(declare-datatypes ((V!32849 0))(
  ( (V!32850 (val!10500 Int)) )
))
(declare-datatypes ((ValueCell!9968 0))(
  ( (ValueCellFull!9968 (v!13055 V!32849)) (EmptyCell!9968) )
))
(declare-datatypes ((array!57911 0))(
  ( (array!57912 (arr!27835 (Array (_ BitVec 32) ValueCell!9968)) (size!28314 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57911)

(declare-fun mapDefault!33310 () ValueCell!9968)

