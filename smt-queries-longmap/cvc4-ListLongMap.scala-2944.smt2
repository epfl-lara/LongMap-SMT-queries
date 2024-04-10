; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41874 () Bool)

(assert start!41874)

(declare-fun b_free!11477 () Bool)

(declare-fun b_next!11477 () Bool)

(assert (=> start!41874 (= b_free!11477 (not b_next!11477))))

(declare-fun tp!40440 () Bool)

(declare-fun b_and!19857 () Bool)

(assert (=> start!41874 (= tp!40440 b_and!19857)))

(declare-fun b!467555 () Bool)

(declare-fun e!273516 () Bool)

(declare-fun tp_is_empty!12905 () Bool)

(assert (=> b!467555 (= e!273516 tp_is_empty!12905)))

(declare-fun b!467556 () Bool)

(declare-fun res!279443 () Bool)

(declare-fun e!273515 () Bool)

(assert (=> b!467556 (=> (not res!279443) (not e!273515))))

(declare-datatypes ((array!29585 0))(
  ( (array!29586 (arr!14220 (Array (_ BitVec 32) (_ BitVec 64))) (size!14572 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29585)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29585 (_ BitVec 32)) Bool)

(assert (=> b!467556 (= res!279443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467557 () Bool)

(declare-fun e!273519 () Bool)

(declare-fun mapRes!21046 () Bool)

(assert (=> b!467557 (= e!273519 (and e!273516 mapRes!21046))))

(declare-fun condMapEmpty!21046 () Bool)

(declare-datatypes ((V!18311 0))(
  ( (V!18312 (val!6497 Int)) )
))
(declare-datatypes ((ValueCell!6109 0))(
  ( (ValueCellFull!6109 (v!8786 V!18311)) (EmptyCell!6109) )
))
(declare-datatypes ((array!29587 0))(
  ( (array!29588 (arr!14221 (Array (_ BitVec 32) ValueCell!6109)) (size!14573 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29587)

(declare-fun mapDefault!21046 () ValueCell!6109)

