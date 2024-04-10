; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41720 () Bool)

(assert start!41720)

(declare-fun b_free!11359 () Bool)

(declare-fun b_next!11359 () Bool)

(assert (=> start!41720 (= b_free!11359 (not b_next!11359))))

(declare-fun tp!40081 () Bool)

(declare-fun b_and!19715 () Bool)

(assert (=> start!41720 (= tp!40081 b_and!19715)))

(declare-fun b!465842 () Bool)

(declare-fun res!278467 () Bool)

(declare-fun e!272305 () Bool)

(assert (=> b!465842 (=> (not res!278467) (not e!272305))))

(declare-datatypes ((array!29355 0))(
  ( (array!29356 (arr!14107 (Array (_ BitVec 32) (_ BitVec 64))) (size!14459 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29355)

(declare-datatypes ((List!8527 0))(
  ( (Nil!8524) (Cons!8523 (h!9379 (_ BitVec 64)) (t!14477 List!8527)) )
))
(declare-fun arrayNoDuplicates!0 (array!29355 (_ BitVec 32) List!8527) Bool)

(assert (=> b!465842 (= res!278467 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8524))))

(declare-fun mapNonEmpty!20863 () Bool)

(declare-fun mapRes!20863 () Bool)

(declare-fun tp!40080 () Bool)

(declare-fun e!272309 () Bool)

(assert (=> mapNonEmpty!20863 (= mapRes!20863 (and tp!40080 e!272309))))

(declare-datatypes ((V!18155 0))(
  ( (V!18156 (val!6438 Int)) )
))
(declare-datatypes ((ValueCell!6050 0))(
  ( (ValueCellFull!6050 (v!8725 V!18155)) (EmptyCell!6050) )
))
(declare-datatypes ((array!29357 0))(
  ( (array!29358 (arr!14108 (Array (_ BitVec 32) ValueCell!6050)) (size!14460 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29357)

(declare-fun mapRest!20863 () (Array (_ BitVec 32) ValueCell!6050))

(declare-fun mapKey!20863 () (_ BitVec 32))

(declare-fun mapValue!20863 () ValueCell!6050)

(assert (=> mapNonEmpty!20863 (= (arr!14108 _values!833) (store mapRest!20863 mapKey!20863 mapValue!20863))))

(declare-fun b!465843 () Bool)

(declare-fun res!278463 () Bool)

(assert (=> b!465843 (=> (not res!278463) (not e!272305))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29355 (_ BitVec 32)) Bool)

(assert (=> b!465843 (= res!278463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465844 () Bool)

(declare-fun e!272307 () Bool)

(declare-fun e!272306 () Bool)

(assert (=> b!465844 (= e!272307 (and e!272306 mapRes!20863))))

(declare-fun condMapEmpty!20863 () Bool)

(declare-fun mapDefault!20863 () ValueCell!6050)

