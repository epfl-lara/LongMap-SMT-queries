; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81888 () Bool)

(assert start!81888)

(declare-fun b_free!18383 () Bool)

(declare-fun b_next!18383 () Bool)

(assert (=> start!81888 (= b_free!18383 (not b_next!18383))))

(declare-fun tp!63849 () Bool)

(declare-fun b_and!29869 () Bool)

(assert (=> start!81888 (= tp!63849 b_and!29869)))

(declare-fun b!955048 () Bool)

(declare-fun res!639545 () Bool)

(declare-fun e!538059 () Bool)

(assert (=> b!955048 (=> (not res!639545) (not e!538059))))

(declare-datatypes ((array!57961 0))(
  ( (array!57962 (arr!27860 (Array (_ BitVec 32) (_ BitVec 64))) (size!28339 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57961)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57961 (_ BitVec 32)) Bool)

(assert (=> b!955048 (= res!639545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33352 () Bool)

(declare-fun mapRes!33352 () Bool)

(assert (=> mapIsEmpty!33352 mapRes!33352))

(declare-fun b!955049 () Bool)

(declare-fun res!639542 () Bool)

(assert (=> b!955049 (=> (not res!639542) (not e!538059))))

(declare-datatypes ((List!19418 0))(
  ( (Nil!19415) (Cons!19414 (h!20576 (_ BitVec 64)) (t!27779 List!19418)) )
))
(declare-fun arrayNoDuplicates!0 (array!57961 (_ BitVec 32) List!19418) Bool)

(assert (=> b!955049 (= res!639542 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19415))))

(declare-fun b!955050 () Bool)

(assert (=> b!955050 (= e!538059 false)))

(declare-fun lt!429968 () Bool)

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32885 0))(
  ( (V!32886 (val!10514 Int)) )
))
(declare-fun zeroValue!1139 () V!32885)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9982 0))(
  ( (ValueCellFull!9982 (v!13069 V!32885)) (EmptyCell!9982) )
))
(declare-datatypes ((array!57963 0))(
  ( (array!57964 (arr!27861 (Array (_ BitVec 32) ValueCell!9982)) (size!28340 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57963)

(declare-fun minValue!1139 () V!32885)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13642 0))(
  ( (tuple2!13643 (_1!6832 (_ BitVec 64)) (_2!6832 V!32885)) )
))
(declare-datatypes ((List!19419 0))(
  ( (Nil!19416) (Cons!19415 (h!20577 tuple2!13642) (t!27780 List!19419)) )
))
(declare-datatypes ((ListLongMap!12339 0))(
  ( (ListLongMap!12340 (toList!6185 List!19419)) )
))
(declare-fun contains!5283 (ListLongMap!12339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3418 (array!57961 array!57963 (_ BitVec 32) (_ BitVec 32) V!32885 V!32885 (_ BitVec 32) Int) ListLongMap!12339)

(assert (=> b!955050 (= lt!429968 (contains!5283 (getCurrentListMap!3418 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27860 _keys!1441) i!735)))))

(declare-fun b!955051 () Bool)

(declare-fun res!639541 () Bool)

(assert (=> b!955051 (=> (not res!639541) (not e!538059))))

(assert (=> b!955051 (= res!639541 (and (= (size!28340 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28339 _keys!1441) (size!28340 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955052 () Bool)

(declare-fun e!538061 () Bool)

(declare-fun tp_is_empty!20927 () Bool)

(assert (=> b!955052 (= e!538061 tp_is_empty!20927)))

(declare-fun b!955053 () Bool)

(declare-fun res!639544 () Bool)

(assert (=> b!955053 (=> (not res!639544) (not e!538059))))

(assert (=> b!955053 (= res!639544 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28339 _keys!1441))))))

(declare-fun b!955054 () Bool)

(declare-fun e!538060 () Bool)

(declare-fun e!538062 () Bool)

(assert (=> b!955054 (= e!538060 (and e!538062 mapRes!33352))))

(declare-fun condMapEmpty!33352 () Bool)

(declare-fun mapDefault!33352 () ValueCell!9982)

