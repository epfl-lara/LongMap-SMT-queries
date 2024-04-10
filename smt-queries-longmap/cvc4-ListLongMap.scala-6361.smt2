; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81906 () Bool)

(assert start!81906)

(declare-fun b_free!18401 () Bool)

(declare-fun b_next!18401 () Bool)

(assert (=> start!81906 (= b_free!18401 (not b_next!18401))))

(declare-fun tp!63903 () Bool)

(declare-fun b_and!29887 () Bool)

(assert (=> start!81906 (= tp!63903 b_and!29887)))

(declare-fun b!955317 () Bool)

(declare-fun res!639732 () Bool)

(declare-fun e!538195 () Bool)

(assert (=> b!955317 (=> (not res!639732) (not e!538195))))

(declare-datatypes ((array!57995 0))(
  ( (array!57996 (arr!27877 (Array (_ BitVec 32) (_ BitVec 64))) (size!28356 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57995)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57995 (_ BitVec 32)) Bool)

(assert (=> b!955317 (= res!639732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955318 () Bool)

(declare-fun e!538198 () Bool)

(declare-fun e!538196 () Bool)

(declare-fun mapRes!33379 () Bool)

(assert (=> b!955318 (= e!538198 (and e!538196 mapRes!33379))))

(declare-fun condMapEmpty!33379 () Bool)

(declare-datatypes ((V!32909 0))(
  ( (V!32910 (val!10523 Int)) )
))
(declare-datatypes ((ValueCell!9991 0))(
  ( (ValueCellFull!9991 (v!13078 V!32909)) (EmptyCell!9991) )
))
(declare-datatypes ((array!57997 0))(
  ( (array!57998 (arr!27878 (Array (_ BitVec 32) ValueCell!9991)) (size!28357 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57997)

(declare-fun mapDefault!33379 () ValueCell!9991)

