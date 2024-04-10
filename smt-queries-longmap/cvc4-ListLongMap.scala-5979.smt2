; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77704 () Bool)

(assert start!77704)

(declare-fun b_free!16289 () Bool)

(declare-fun b_next!16289 () Bool)

(assert (=> start!77704 (= b_free!16289 (not b_next!16289))))

(declare-fun tp!57128 () Bool)

(declare-fun b_and!26731 () Bool)

(assert (=> start!77704 (= tp!57128 b_and!26731)))

(declare-fun b!906435 () Bool)

(declare-fun res!611723 () Bool)

(declare-fun e!507965 () Bool)

(assert (=> b!906435 (=> (not res!611723) (not e!507965))))

(declare-datatypes ((array!53456 0))(
  ( (array!53457 (arr!25687 (Array (_ BitVec 32) (_ BitVec 64))) (size!26146 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53456)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53456 (_ BitVec 32)) Bool)

(assert (=> b!906435 (= res!611723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906436 () Bool)

(declare-fun e!507966 () Bool)

(declare-fun tp_is_empty!18707 () Bool)

(assert (=> b!906436 (= e!507966 tp_is_empty!18707)))

(declare-fun b!906437 () Bool)

(declare-fun e!507969 () Bool)

(assert (=> b!906437 (= e!507969 tp_is_empty!18707)))

(declare-fun b!906439 () Bool)

(declare-fun res!611720 () Bool)

(assert (=> b!906439 (=> (not res!611720) (not e!507965))))

(declare-datatypes ((List!18047 0))(
  ( (Nil!18044) (Cons!18043 (h!19189 (_ BitVec 64)) (t!25508 List!18047)) )
))
(declare-fun arrayNoDuplicates!0 (array!53456 (_ BitVec 32) List!18047) Bool)

(assert (=> b!906439 (= res!611720 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18044))))

(declare-fun b!906440 () Bool)

(declare-fun e!507968 () Bool)

(declare-fun mapRes!29773 () Bool)

(assert (=> b!906440 (= e!507968 (and e!507969 mapRes!29773))))

(declare-fun condMapEmpty!29773 () Bool)

(declare-datatypes ((V!29907 0))(
  ( (V!29908 (val!9404 Int)) )
))
(declare-datatypes ((ValueCell!8872 0))(
  ( (ValueCellFull!8872 (v!11909 V!29907)) (EmptyCell!8872) )
))
(declare-datatypes ((array!53458 0))(
  ( (array!53459 (arr!25688 (Array (_ BitVec 32) ValueCell!8872)) (size!26147 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53458)

(declare-fun mapDefault!29773 () ValueCell!8872)

