; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42212 () Bool)

(assert start!42212)

(declare-fun b_free!11731 () Bool)

(declare-fun b_next!11731 () Bool)

(assert (=> start!42212 (= b_free!11731 (not b_next!11731))))

(declare-fun tp!41217 () Bool)

(declare-fun b_and!20161 () Bool)

(assert (=> start!42212 (= tp!41217 b_and!20161)))

(declare-fun b!471141 () Bool)

(declare-fun res!281483 () Bool)

(declare-fun e!276095 () Bool)

(assert (=> b!471141 (=> (not res!281483) (not e!276095))))

(declare-datatypes ((array!30083 0))(
  ( (array!30084 (arr!14464 (Array (_ BitVec 32) (_ BitVec 64))) (size!14816 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30083)

(declare-datatypes ((List!8803 0))(
  ( (Nil!8800) (Cons!8799 (h!9655 (_ BitVec 64)) (t!14767 List!8803)) )
))
(declare-fun arrayNoDuplicates!0 (array!30083 (_ BitVec 32) List!8803) Bool)

(assert (=> b!471141 (= res!281483 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8800))))

(declare-fun b!471142 () Bool)

(declare-fun res!281485 () Bool)

(assert (=> b!471142 (=> (not res!281485) (not e!276095))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30083 (_ BitVec 32)) Bool)

(assert (=> b!471142 (= res!281485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471143 () Bool)

(declare-fun e!276093 () Bool)

(declare-fun e!276094 () Bool)

(declare-fun mapRes!21442 () Bool)

(assert (=> b!471143 (= e!276093 (and e!276094 mapRes!21442))))

(declare-fun condMapEmpty!21442 () Bool)

(declare-datatypes ((V!18651 0))(
  ( (V!18652 (val!6624 Int)) )
))
(declare-datatypes ((ValueCell!6236 0))(
  ( (ValueCellFull!6236 (v!8915 V!18651)) (EmptyCell!6236) )
))
(declare-datatypes ((array!30085 0))(
  ( (array!30086 (arr!14465 (Array (_ BitVec 32) ValueCell!6236)) (size!14817 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30085)

(declare-fun mapDefault!21442 () ValueCell!6236)

