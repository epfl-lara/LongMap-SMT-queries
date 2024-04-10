; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42346 () Bool)

(assert start!42346)

(declare-fun b_free!11837 () Bool)

(declare-fun b_next!11837 () Bool)

(assert (=> start!42346 (= b_free!11837 (not b_next!11837))))

(declare-fun tp!41542 () Bool)

(declare-fun b_and!20283 () Bool)

(assert (=> start!42346 (= tp!41542 b_and!20283)))

(declare-fun b!472468 () Bool)

(declare-fun res!282225 () Bool)

(declare-fun e!277043 () Bool)

(assert (=> b!472468 (=> (not res!282225) (not e!277043))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30287 0))(
  ( (array!30288 (arr!14564 (Array (_ BitVec 32) (_ BitVec 64))) (size!14916 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30287)

(declare-datatypes ((V!18791 0))(
  ( (V!18792 (val!6677 Int)) )
))
(declare-datatypes ((ValueCell!6289 0))(
  ( (ValueCellFull!6289 (v!8968 V!18791)) (EmptyCell!6289) )
))
(declare-datatypes ((array!30289 0))(
  ( (array!30290 (arr!14565 (Array (_ BitVec 32) ValueCell!6289)) (size!14917 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30289)

(assert (=> b!472468 (= res!282225 (and (= (size!14917 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14916 _keys!1025) (size!14917 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472469 () Bool)

(declare-fun res!282227 () Bool)

(assert (=> b!472469 (=> (not res!282227) (not e!277043))))

(declare-datatypes ((List!8877 0))(
  ( (Nil!8874) (Cons!8873 (h!9729 (_ BitVec 64)) (t!14845 List!8877)) )
))
(declare-fun arrayNoDuplicates!0 (array!30287 (_ BitVec 32) List!8877) Bool)

(assert (=> b!472469 (= res!282227 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8874))))

(declare-fun b!472470 () Bool)

(declare-fun e!277045 () Bool)

(declare-fun e!277042 () Bool)

(declare-fun mapRes!21607 () Bool)

(assert (=> b!472470 (= e!277045 (and e!277042 mapRes!21607))))

(declare-fun condMapEmpty!21607 () Bool)

(declare-fun mapDefault!21607 () ValueCell!6289)

