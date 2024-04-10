; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77944 () Bool)

(assert start!77944)

(declare-fun b_free!16487 () Bool)

(declare-fun b_next!16487 () Bool)

(assert (=> start!77944 (= b_free!16487 (not b_next!16487))))

(declare-fun tp!57728 () Bool)

(declare-fun b_and!27057 () Bool)

(assert (=> start!77944 (= tp!57728 b_and!27057)))

(declare-fun mapIsEmpty!30076 () Bool)

(declare-fun mapRes!30076 () Bool)

(assert (=> mapIsEmpty!30076 mapRes!30076))

(declare-fun res!614123 () Bool)

(declare-fun e!510165 () Bool)

(assert (=> start!77944 (=> (not res!614123) (not e!510165))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77944 (= res!614123 (validMask!0 mask!1756))))

(assert (=> start!77944 e!510165))

(declare-datatypes ((V!30171 0))(
  ( (V!30172 (val!9503 Int)) )
))
(declare-datatypes ((ValueCell!8971 0))(
  ( (ValueCellFull!8971 (v!12011 V!30171)) (EmptyCell!8971) )
))
(declare-datatypes ((array!53832 0))(
  ( (array!53833 (arr!25873 (Array (_ BitVec 32) ValueCell!8971)) (size!26332 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53832)

(declare-fun e!510168 () Bool)

(declare-fun array_inv!20236 (array!53832) Bool)

(assert (=> start!77944 (and (array_inv!20236 _values!1152) e!510168)))

(assert (=> start!77944 tp!57728))

(assert (=> start!77944 true))

(declare-fun tp_is_empty!18905 () Bool)

(assert (=> start!77944 tp_is_empty!18905))

(declare-datatypes ((array!53834 0))(
  ( (array!53835 (arr!25874 (Array (_ BitVec 32) (_ BitVec 64))) (size!26333 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53834)

(declare-fun array_inv!20237 (array!53834) Bool)

(assert (=> start!77944 (array_inv!20237 _keys!1386)))

(declare-fun b!910001 () Bool)

(declare-fun res!614121 () Bool)

(assert (=> b!910001 (=> (not res!614121) (not e!510165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53834 (_ BitVec 32)) Bool)

(assert (=> b!910001 (= res!614121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910002 () Bool)

(declare-fun e!510166 () Bool)

(assert (=> b!910002 (= e!510168 (and e!510166 mapRes!30076))))

(declare-fun condMapEmpty!30076 () Bool)

(declare-fun mapDefault!30076 () ValueCell!8971)

