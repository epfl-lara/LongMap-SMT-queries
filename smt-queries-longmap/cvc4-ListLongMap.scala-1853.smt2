; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33490 () Bool)

(assert start!33490)

(declare-fun mapNonEmpty!11499 () Bool)

(declare-fun mapRes!11499 () Bool)

(declare-fun tp!23874 () Bool)

(declare-fun e!204107 () Bool)

(assert (=> mapNonEmpty!11499 (= mapRes!11499 (and tp!23874 e!204107))))

(declare-fun mapKey!11499 () (_ BitVec 32))

(declare-datatypes ((V!9967 0))(
  ( (V!9968 (val!3416 Int)) )
))
(declare-datatypes ((ValueCell!3028 0))(
  ( (ValueCellFull!3028 (v!5575 V!9967)) (EmptyCell!3028) )
))
(declare-fun mapValue!11499 () ValueCell!3028)

(declare-fun mapRest!11499 () (Array (_ BitVec 32) ValueCell!3028))

(declare-datatypes ((array!17081 0))(
  ( (array!17082 (arr!8075 (Array (_ BitVec 32) ValueCell!3028)) (size!8427 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17081)

(assert (=> mapNonEmpty!11499 (= (arr!8075 _values!1525) (store mapRest!11499 mapKey!11499 mapValue!11499))))

(declare-fun b!332397 () Bool)

(declare-fun res!183113 () Bool)

(declare-fun e!204111 () Bool)

(assert (=> b!332397 (=> (not res!183113) (not e!204111))))

(declare-datatypes ((array!17083 0))(
  ( (array!17084 (arr!8076 (Array (_ BitVec 32) (_ BitVec 64))) (size!8428 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17083)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17083 (_ BitVec 32)) Bool)

(assert (=> b!332397 (= res!183113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183112 () Bool)

(assert (=> start!33490 (=> (not res!183112) (not e!204111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33490 (= res!183112 (validMask!0 mask!2385))))

(assert (=> start!33490 e!204111))

(assert (=> start!33490 true))

(declare-fun e!204108 () Bool)

(declare-fun array_inv!6016 (array!17081) Bool)

(assert (=> start!33490 (and (array_inv!6016 _values!1525) e!204108)))

(declare-fun array_inv!6017 (array!17083) Bool)

(assert (=> start!33490 (array_inv!6017 _keys!1895)))

(declare-fun b!332398 () Bool)

(declare-fun e!204110 () Bool)

(assert (=> b!332398 (= e!204108 (and e!204110 mapRes!11499))))

(declare-fun condMapEmpty!11499 () Bool)

(declare-fun mapDefault!11499 () ValueCell!3028)

