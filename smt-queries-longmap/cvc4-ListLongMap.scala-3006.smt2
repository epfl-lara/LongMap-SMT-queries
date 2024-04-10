; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42358 () Bool)

(assert start!42358)

(declare-fun b_free!11849 () Bool)

(declare-fun b_next!11849 () Bool)

(assert (=> start!42358 (= b_free!11849 (not b_next!11849))))

(declare-fun tp!41577 () Bool)

(declare-fun b_and!20295 () Bool)

(assert (=> start!42358 (= tp!41577 b_and!20295)))

(declare-fun mapIsEmpty!21625 () Bool)

(declare-fun mapRes!21625 () Bool)

(assert (=> mapIsEmpty!21625 mapRes!21625))

(declare-fun b!472612 () Bool)

(declare-fun res!282318 () Bool)

(declare-fun e!277152 () Bool)

(assert (=> b!472612 (=> (not res!282318) (not e!277152))))

(declare-datatypes ((array!30311 0))(
  ( (array!30312 (arr!14576 (Array (_ BitVec 32) (_ BitVec 64))) (size!14928 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30311)

(declare-datatypes ((List!8884 0))(
  ( (Nil!8881) (Cons!8880 (h!9736 (_ BitVec 64)) (t!14852 List!8884)) )
))
(declare-fun arrayNoDuplicates!0 (array!30311 (_ BitVec 32) List!8884) Bool)

(assert (=> b!472612 (= res!282318 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8881))))

(declare-fun res!282314 () Bool)

(assert (=> start!42358 (=> (not res!282314) (not e!277152))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42358 (= res!282314 (validMask!0 mask!1365))))

(assert (=> start!42358 e!277152))

(declare-fun tp_is_empty!13277 () Bool)

(assert (=> start!42358 tp_is_empty!13277))

(assert (=> start!42358 tp!41577))

(assert (=> start!42358 true))

(declare-fun array_inv!10510 (array!30311) Bool)

(assert (=> start!42358 (array_inv!10510 _keys!1025)))

(declare-datatypes ((V!18807 0))(
  ( (V!18808 (val!6683 Int)) )
))
(declare-datatypes ((ValueCell!6295 0))(
  ( (ValueCellFull!6295 (v!8974 V!18807)) (EmptyCell!6295) )
))
(declare-datatypes ((array!30313 0))(
  ( (array!30314 (arr!14577 (Array (_ BitVec 32) ValueCell!6295)) (size!14929 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30313)

(declare-fun e!277150 () Bool)

(declare-fun array_inv!10511 (array!30313) Bool)

(assert (=> start!42358 (and (array_inv!10511 _values!833) e!277150)))

(declare-fun b!472613 () Bool)

(declare-fun e!277149 () Bool)

(assert (=> b!472613 (= e!277149 tp_is_empty!13277)))

(declare-fun b!472614 () Bool)

(declare-fun res!282317 () Bool)

(assert (=> b!472614 (=> (not res!282317) (not e!277152))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472614 (= res!282317 (and (= (size!14929 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14928 _keys!1025) (size!14929 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472615 () Bool)

(assert (=> b!472615 (= e!277150 (and e!277149 mapRes!21625))))

(declare-fun condMapEmpty!21625 () Bool)

(declare-fun mapDefault!21625 () ValueCell!6295)

