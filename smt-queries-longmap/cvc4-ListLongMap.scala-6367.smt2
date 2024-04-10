; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81942 () Bool)

(assert start!81942)

(declare-fun b_free!18437 () Bool)

(declare-fun b_next!18437 () Bool)

(assert (=> start!81942 (= b_free!18437 (not b_next!18437))))

(declare-fun tp!64011 () Bool)

(declare-fun b_and!29923 () Bool)

(assert (=> start!81942 (= tp!64011 b_and!29923)))

(declare-fun b!955857 () Bool)

(declare-fun res!640111 () Bool)

(declare-fun e!538468 () Bool)

(assert (=> b!955857 (=> (not res!640111) (not e!538468))))

(declare-datatypes ((array!58065 0))(
  ( (array!58066 (arr!27912 (Array (_ BitVec 32) (_ BitVec 64))) (size!28391 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58065)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955857 (= res!640111 (validKeyInArray!0 (select (arr!27912 _keys!1441) i!735)))))

(declare-fun b!955858 () Bool)

(declare-fun res!640107 () Bool)

(assert (=> b!955858 (=> (not res!640107) (not e!538468))))

(assert (=> b!955858 (= res!640107 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28391 _keys!1441))))))

(declare-fun b!955859 () Bool)

(declare-fun e!538465 () Bool)

(declare-fun tp_is_empty!20981 () Bool)

(assert (=> b!955859 (= e!538465 tp_is_empty!20981)))

(declare-fun b!955860 () Bool)

(declare-fun res!640109 () Bool)

(assert (=> b!955860 (=> (not res!640109) (not e!538468))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32957 0))(
  ( (V!32958 (val!10541 Int)) )
))
(declare-datatypes ((ValueCell!10009 0))(
  ( (ValueCellFull!10009 (v!13096 V!32957)) (EmptyCell!10009) )
))
(declare-datatypes ((array!58067 0))(
  ( (array!58068 (arr!27913 (Array (_ BitVec 32) ValueCell!10009)) (size!28392 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58067)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955860 (= res!640109 (and (= (size!28392 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28391 _keys!1441) (size!28392 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33433 () Bool)

(declare-fun mapRes!33433 () Bool)

(assert (=> mapIsEmpty!33433 mapRes!33433))

(declare-fun b!955862 () Bool)

(assert (=> b!955862 (= e!538468 (not (bvsle #b00000000000000000000000000000000 (size!28391 _keys!1441))))))

(declare-fun zeroValue!1139 () V!32957)

(declare-fun minValue!1139 () V!32957)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13684 0))(
  ( (tuple2!13685 (_1!6853 (_ BitVec 64)) (_2!6853 V!32957)) )
))
(declare-datatypes ((List!19457 0))(
  ( (Nil!19454) (Cons!19453 (h!20615 tuple2!13684) (t!27818 List!19457)) )
))
(declare-datatypes ((ListLongMap!12381 0))(
  ( (ListLongMap!12382 (toList!6206 List!19457)) )
))
(declare-fun contains!5304 (ListLongMap!12381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3439 (array!58065 array!58067 (_ BitVec 32) (_ BitVec 32) V!32957 V!32957 (_ BitVec 32) Int) ListLongMap!12381)

(assert (=> b!955862 (contains!5304 (getCurrentListMap!3439 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27912 _keys!1441) i!735))))

(declare-datatypes ((Unit!32133 0))(
  ( (Unit!32134) )
))
(declare-fun lt!430049 () Unit!32133)

(declare-fun lemmaInListMapFromThenFromZero!21 (array!58065 array!58067 (_ BitVec 32) (_ BitVec 32) V!32957 V!32957 (_ BitVec 32) (_ BitVec 32) Int) Unit!32133)

(assert (=> b!955862 (= lt!430049 (lemmaInListMapFromThenFromZero!21 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955863 () Bool)

(declare-fun res!640112 () Bool)

(assert (=> b!955863 (=> (not res!640112) (not e!538468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58065 (_ BitVec 32)) Bool)

(assert (=> b!955863 (= res!640112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33433 () Bool)

(declare-fun tp!64010 () Bool)

(assert (=> mapNonEmpty!33433 (= mapRes!33433 (and tp!64010 e!538465))))

(declare-fun mapKey!33433 () (_ BitVec 32))

(declare-fun mapRest!33433 () (Array (_ BitVec 32) ValueCell!10009))

(declare-fun mapValue!33433 () ValueCell!10009)

(assert (=> mapNonEmpty!33433 (= (arr!27913 _values!1197) (store mapRest!33433 mapKey!33433 mapValue!33433))))

(declare-fun b!955864 () Bool)

(declare-fun res!640113 () Bool)

(assert (=> b!955864 (=> (not res!640113) (not e!538468))))

(declare-datatypes ((List!19458 0))(
  ( (Nil!19455) (Cons!19454 (h!20616 (_ BitVec 64)) (t!27819 List!19458)) )
))
(declare-fun arrayNoDuplicates!0 (array!58065 (_ BitVec 32) List!19458) Bool)

(assert (=> b!955864 (= res!640113 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19455))))

(declare-fun res!640110 () Bool)

(assert (=> start!81942 (=> (not res!640110) (not e!538468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81942 (= res!640110 (validMask!0 mask!1823))))

(assert (=> start!81942 e!538468))

(assert (=> start!81942 true))

(assert (=> start!81942 tp_is_empty!20981))

(declare-fun array_inv!21659 (array!58065) Bool)

(assert (=> start!81942 (array_inv!21659 _keys!1441)))

(declare-fun e!538464 () Bool)

(declare-fun array_inv!21660 (array!58067) Bool)

(assert (=> start!81942 (and (array_inv!21660 _values!1197) e!538464)))

(assert (=> start!81942 tp!64011))

(declare-fun b!955861 () Bool)

(declare-fun res!640108 () Bool)

(assert (=> b!955861 (=> (not res!640108) (not e!538468))))

(assert (=> b!955861 (= res!640108 (contains!5304 (getCurrentListMap!3439 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27912 _keys!1441) i!735)))))

(declare-fun b!955865 () Bool)

(declare-fun e!538466 () Bool)

(assert (=> b!955865 (= e!538466 tp_is_empty!20981)))

(declare-fun b!955866 () Bool)

(assert (=> b!955866 (= e!538464 (and e!538466 mapRes!33433))))

(declare-fun condMapEmpty!33433 () Bool)

(declare-fun mapDefault!33433 () ValueCell!10009)

