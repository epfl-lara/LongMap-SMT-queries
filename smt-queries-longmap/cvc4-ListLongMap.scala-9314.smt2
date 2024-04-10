; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111324 () Bool)

(assert start!111324)

(declare-fun b!1317357 () Bool)

(declare-fun e!751696 () Bool)

(declare-fun tp_is_empty!35801 () Bool)

(assert (=> b!1317357 (= e!751696 tp_is_empty!35801)))

(declare-fun mapIsEmpty!55349 () Bool)

(declare-fun mapRes!55349 () Bool)

(assert (=> mapIsEmpty!55349 mapRes!55349))

(declare-fun mapNonEmpty!55349 () Bool)

(declare-fun tp!105455 () Bool)

(declare-fun e!751699 () Bool)

(assert (=> mapNonEmpty!55349 (= mapRes!55349 (and tp!105455 e!751699))))

(declare-datatypes ((V!52837 0))(
  ( (V!52838 (val!17975 Int)) )
))
(declare-datatypes ((ValueCell!17002 0))(
  ( (ValueCellFull!17002 (v!20605 V!52837)) (EmptyCell!17002) )
))
(declare-datatypes ((array!88560 0))(
  ( (array!88561 (arr!42754 (Array (_ BitVec 32) ValueCell!17002)) (size!43304 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88560)

(declare-fun mapRest!55349 () (Array (_ BitVec 32) ValueCell!17002))

(declare-fun mapKey!55349 () (_ BitVec 32))

(declare-fun mapValue!55349 () ValueCell!17002)

(assert (=> mapNonEmpty!55349 (= (arr!42754 _values!1337) (store mapRest!55349 mapKey!55349 mapValue!55349))))

(declare-fun b!1317358 () Bool)

(declare-fun res!874341 () Bool)

(declare-fun e!751695 () Bool)

(assert (=> b!1317358 (=> (not res!874341) (not e!751695))))

(declare-datatypes ((array!88562 0))(
  ( (array!88563 (arr!42755 (Array (_ BitVec 32) (_ BitVec 64))) (size!43305 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88562)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88562 (_ BitVec 32)) Bool)

(assert (=> b!1317358 (= res!874341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317359 () Bool)

(declare-fun e!751697 () Bool)

(assert (=> b!1317359 (= e!751697 (and e!751696 mapRes!55349))))

(declare-fun condMapEmpty!55349 () Bool)

(declare-fun mapDefault!55349 () ValueCell!17002)

