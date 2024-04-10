; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81924 () Bool)

(assert start!81924)

(declare-fun b_free!18419 () Bool)

(declare-fun b_next!18419 () Bool)

(assert (=> start!81924 (= b_free!18419 (not b_next!18419))))

(declare-fun tp!63956 () Bool)

(declare-fun b_and!29905 () Bool)

(assert (=> start!81924 (= tp!63956 b_and!29905)))

(declare-fun b!955587 () Bool)

(declare-fun e!538332 () Bool)

(declare-fun tp_is_empty!20963 () Bool)

(assert (=> b!955587 (= e!538332 tp_is_empty!20963)))

(declare-fun mapNonEmpty!33406 () Bool)

(declare-fun mapRes!33406 () Bool)

(declare-fun tp!63957 () Bool)

(assert (=> mapNonEmpty!33406 (= mapRes!33406 (and tp!63957 e!538332))))

(declare-datatypes ((V!32933 0))(
  ( (V!32934 (val!10532 Int)) )
))
(declare-datatypes ((ValueCell!10000 0))(
  ( (ValueCellFull!10000 (v!13087 V!32933)) (EmptyCell!10000) )
))
(declare-fun mapValue!33406 () ValueCell!10000)

(declare-fun mapRest!33406 () (Array (_ BitVec 32) ValueCell!10000))

(declare-fun mapKey!33406 () (_ BitVec 32))

(declare-datatypes ((array!58031 0))(
  ( (array!58032 (arr!27895 (Array (_ BitVec 32) ValueCell!10000)) (size!28374 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58031)

(assert (=> mapNonEmpty!33406 (= (arr!27895 _values!1197) (store mapRest!33406 mapKey!33406 mapValue!33406))))

(declare-fun b!955588 () Bool)

(declare-fun res!639918 () Bool)

(declare-fun e!538331 () Bool)

(assert (=> b!955588 (=> (not res!639918) (not e!538331))))

(declare-datatypes ((array!58033 0))(
  ( (array!58034 (arr!27896 (Array (_ BitVec 32) (_ BitVec 64))) (size!28375 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58033)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955588 (= res!639918 (validKeyInArray!0 (select (arr!27896 _keys!1441) i!735)))))

(declare-fun b!955589 () Bool)

(declare-fun res!639923 () Bool)

(assert (=> b!955589 (=> (not res!639923) (not e!538331))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955589 (= res!639923 (and (= (size!28374 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28375 _keys!1441) (size!28374 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955590 () Bool)

(declare-fun res!639919 () Bool)

(assert (=> b!955590 (=> (not res!639919) (not e!538331))))

(declare-datatypes ((List!19443 0))(
  ( (Nil!19440) (Cons!19439 (h!20601 (_ BitVec 64)) (t!27804 List!19443)) )
))
(declare-fun arrayNoDuplicates!0 (array!58033 (_ BitVec 32) List!19443) Bool)

(assert (=> b!955590 (= res!639919 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19440))))

(declare-fun b!955591 () Bool)

(declare-fun e!538329 () Bool)

(declare-fun e!538333 () Bool)

(assert (=> b!955591 (= e!538329 (and e!538333 mapRes!33406))))

(declare-fun condMapEmpty!33406 () Bool)

(declare-fun mapDefault!33406 () ValueCell!10000)

