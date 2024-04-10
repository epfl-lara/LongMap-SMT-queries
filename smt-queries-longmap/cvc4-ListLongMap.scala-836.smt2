; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20116 () Bool)

(assert start!20116)

(declare-fun b_free!4775 () Bool)

(declare-fun b_next!4775 () Bool)

(assert (=> start!20116 (= b_free!4775 (not b_next!4775))))

(declare-fun tp!17356 () Bool)

(declare-fun b_and!11521 () Bool)

(assert (=> start!20116 (= tp!17356 b_and!11521)))

(declare-fun b!197174 () Bool)

(declare-fun res!93204 () Bool)

(declare-fun e!129794 () Bool)

(assert (=> b!197174 (=> (not res!93204) (not e!129794))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8515 0))(
  ( (array!8516 (arr!4008 (Array (_ BitVec 32) (_ BitVec 64))) (size!4333 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8515)

(assert (=> b!197174 (= res!93204 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4333 _keys!825))))))

(declare-fun b!197175 () Bool)

(declare-fun e!129791 () Bool)

(declare-fun tp_is_empty!4631 () Bool)

(assert (=> b!197175 (= e!129791 tp_is_empty!4631)))

(declare-fun b!197176 () Bool)

(declare-fun res!93206 () Bool)

(assert (=> b!197176 (=> (not res!93206) (not e!129794))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8515 (_ BitVec 32)) Bool)

(assert (=> b!197176 (= res!93206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197177 () Bool)

(declare-fun e!129793 () Bool)

(declare-fun e!129792 () Bool)

(declare-fun mapRes!8015 () Bool)

(assert (=> b!197177 (= e!129793 (and e!129792 mapRes!8015))))

(declare-fun condMapEmpty!8015 () Bool)

(declare-datatypes ((V!5821 0))(
  ( (V!5822 (val!2360 Int)) )
))
(declare-datatypes ((ValueCell!1972 0))(
  ( (ValueCellFull!1972 (v!4330 V!5821)) (EmptyCell!1972) )
))
(declare-datatypes ((array!8517 0))(
  ( (array!8518 (arr!4009 (Array (_ BitVec 32) ValueCell!1972)) (size!4334 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8517)

(declare-fun mapDefault!8015 () ValueCell!1972)

