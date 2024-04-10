; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105910 () Bool)

(assert start!105910)

(declare-fun b_free!27451 () Bool)

(declare-fun b_next!27451 () Bool)

(assert (=> start!105910 (= b_free!27451 (not b_next!27451))))

(declare-fun tp!95885 () Bool)

(declare-fun b_and!45359 () Bool)

(assert (=> start!105910 (= tp!95885 b_and!45359)))

(declare-fun mapIsEmpty!50332 () Bool)

(declare-fun mapRes!50332 () Bool)

(assert (=> mapIsEmpty!50332 mapRes!50332))

(declare-fun b!1261483 () Bool)

(declare-fun e!717976 () Bool)

(declare-fun tp_is_empty!32353 () Bool)

(assert (=> b!1261483 (= e!717976 tp_is_empty!32353)))

(declare-fun mapNonEmpty!50332 () Bool)

(declare-fun tp!95884 () Bool)

(assert (=> mapNonEmpty!50332 (= mapRes!50332 (and tp!95884 e!717976))))

(declare-fun mapKey!50332 () (_ BitVec 32))

(declare-datatypes ((V!48503 0))(
  ( (V!48504 (val!16239 Int)) )
))
(declare-datatypes ((ValueCell!15413 0))(
  ( (ValueCellFull!15413 (v!18943 V!48503)) (EmptyCell!15413) )
))
(declare-fun mapValue!50332 () ValueCell!15413)

(declare-fun mapRest!50332 () (Array (_ BitVec 32) ValueCell!15413))

(declare-datatypes ((array!82320 0))(
  ( (array!82321 (arr!39713 (Array (_ BitVec 32) ValueCell!15413)) (size!40249 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82320)

(assert (=> mapNonEmpty!50332 (= (arr!39713 _values!914) (store mapRest!50332 mapKey!50332 mapValue!50332))))

(declare-fun b!1261484 () Bool)

(declare-fun res!840600 () Bool)

(declare-fun e!717979 () Bool)

(assert (=> b!1261484 (=> (not res!840600) (not e!717979))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82322 0))(
  ( (array!82323 (arr!39714 (Array (_ BitVec 32) (_ BitVec 64))) (size!40250 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82322)

(assert (=> b!1261484 (= res!840600 (and (= (size!40249 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40250 _keys!1118) (size!40249 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261485 () Bool)

(declare-fun res!840598 () Bool)

(assert (=> b!1261485 (=> (not res!840598) (not e!717979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82322 (_ BitVec 32)) Bool)

(assert (=> b!1261485 (= res!840598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261487 () Bool)

(declare-fun e!717977 () Bool)

(assert (=> b!1261487 (= e!717977 tp_is_empty!32353)))

(declare-fun b!1261486 () Bool)

(declare-fun e!717980 () Bool)

(assert (=> b!1261486 (= e!717980 (and e!717977 mapRes!50332))))

(declare-fun condMapEmpty!50332 () Bool)

(declare-fun mapDefault!50332 () ValueCell!15413)

