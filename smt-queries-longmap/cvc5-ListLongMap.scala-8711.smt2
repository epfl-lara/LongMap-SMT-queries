; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105716 () Bool)

(assert start!105716)

(declare-fun b_free!27301 () Bool)

(declare-fun b_next!27301 () Bool)

(assert (=> start!105716 (= b_free!27301 (not b_next!27301))))

(declare-fun tp!95429 () Bool)

(declare-fun b_and!45185 () Bool)

(assert (=> start!105716 (= tp!95429 b_and!45185)))

(declare-fun b!1259284 () Bool)

(declare-fun res!839281 () Bool)

(declare-fun e!716366 () Bool)

(assert (=> b!1259284 (=> (not res!839281) (not e!716366))))

(declare-datatypes ((array!82024 0))(
  ( (array!82025 (arr!39567 (Array (_ BitVec 32) (_ BitVec 64))) (size!40103 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82024)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82024 (_ BitVec 32)) Bool)

(assert (=> b!1259284 (= res!839281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259285 () Bool)

(declare-fun res!839279 () Bool)

(assert (=> b!1259285 (=> (not res!839279) (not e!716366))))

(declare-datatypes ((List!28100 0))(
  ( (Nil!28097) (Cons!28096 (h!29305 (_ BitVec 64)) (t!41595 List!28100)) )
))
(declare-fun arrayNoDuplicates!0 (array!82024 (_ BitVec 32) List!28100) Bool)

(assert (=> b!1259285 (= res!839279 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28097))))

(declare-fun b!1259286 () Bool)

(declare-fun e!716364 () Bool)

(declare-fun e!716361 () Bool)

(declare-fun mapRes!50101 () Bool)

(assert (=> b!1259286 (= e!716364 (and e!716361 mapRes!50101))))

(declare-fun condMapEmpty!50101 () Bool)

(declare-datatypes ((V!48303 0))(
  ( (V!48304 (val!16164 Int)) )
))
(declare-datatypes ((ValueCell!15338 0))(
  ( (ValueCellFull!15338 (v!18866 V!48303)) (EmptyCell!15338) )
))
(declare-datatypes ((array!82026 0))(
  ( (array!82027 (arr!39568 (Array (_ BitVec 32) ValueCell!15338)) (size!40104 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82026)

(declare-fun mapDefault!50101 () ValueCell!15338)

