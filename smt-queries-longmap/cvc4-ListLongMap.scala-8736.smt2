; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105914 () Bool)

(assert start!105914)

(declare-fun b_free!27455 () Bool)

(declare-fun b_next!27455 () Bool)

(assert (=> start!105914 (= b_free!27455 (not b_next!27455))))

(declare-fun tp!95896 () Bool)

(declare-fun b_and!45363 () Bool)

(assert (=> start!105914 (= tp!95896 b_and!45363)))

(declare-fun b!1261525 () Bool)

(declare-fun res!840623 () Bool)

(declare-fun e!718006 () Bool)

(assert (=> b!1261525 (=> (not res!840623) (not e!718006))))

(declare-datatypes ((array!82328 0))(
  ( (array!82329 (arr!39717 (Array (_ BitVec 32) (_ BitVec 64))) (size!40253 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82328)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82328 (_ BitVec 32)) Bool)

(assert (=> b!1261525 (= res!840623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261526 () Bool)

(declare-fun e!718010 () Bool)

(declare-fun e!718008 () Bool)

(declare-fun mapRes!50338 () Bool)

(assert (=> b!1261526 (= e!718010 (and e!718008 mapRes!50338))))

(declare-fun condMapEmpty!50338 () Bool)

(declare-datatypes ((V!48507 0))(
  ( (V!48508 (val!16241 Int)) )
))
(declare-datatypes ((ValueCell!15415 0))(
  ( (ValueCellFull!15415 (v!18945 V!48507)) (EmptyCell!15415) )
))
(declare-datatypes ((array!82330 0))(
  ( (array!82331 (arr!39718 (Array (_ BitVec 32) ValueCell!15415)) (size!40254 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82330)

(declare-fun mapDefault!50338 () ValueCell!15415)

