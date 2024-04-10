; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3824 () Bool)

(assert start!3824)

(declare-fun b_free!779 () Bool)

(declare-fun b_next!779 () Bool)

(assert (=> start!3824 (= b_free!779 (not b_next!779))))

(declare-fun tp!3748 () Bool)

(declare-fun b_and!1583 () Bool)

(assert (=> start!3824 (= tp!3748 b_and!1583)))

(declare-fun b!26771 () Bool)

(declare-fun res!15875 () Bool)

(declare-fun e!17471 () Bool)

(assert (=> b!26771 (=> (not res!15875) (not e!17471))))

(declare-datatypes ((array!1507 0))(
  ( (array!1508 (arr!710 (Array (_ BitVec 32) (_ BitVec 64))) (size!811 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1507)

(declare-datatypes ((List!602 0))(
  ( (Nil!599) (Cons!598 (h!1165 (_ BitVec 64)) (t!3289 List!602)) )
))
(declare-fun arrayNoDuplicates!0 (array!1507 (_ BitVec 32) List!602) Bool)

(assert (=> b!26771 (= res!15875 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!599))))

(declare-fun b!26772 () Bool)

(declare-fun e!17468 () Bool)

(declare-fun e!17470 () Bool)

(declare-fun mapRes!1219 () Bool)

(assert (=> b!26772 (= e!17468 (and e!17470 mapRes!1219))))

(declare-fun condMapEmpty!1219 () Bool)

(declare-datatypes ((V!1335 0))(
  ( (V!1336 (val!593 Int)) )
))
(declare-datatypes ((ValueCell!367 0))(
  ( (ValueCellFull!367 (v!1679 V!1335)) (EmptyCell!367) )
))
(declare-datatypes ((array!1509 0))(
  ( (array!1510 (arr!711 (Array (_ BitVec 32) ValueCell!367)) (size!812 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1509)

(declare-fun mapDefault!1219 () ValueCell!367)

