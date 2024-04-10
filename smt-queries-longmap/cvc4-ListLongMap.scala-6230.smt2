; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79656 () Bool)

(assert start!79656)

(declare-fun b_free!17705 () Bool)

(declare-fun b_next!17705 () Bool)

(assert (=> start!79656 (= b_free!17705 (not b_next!17705))))

(declare-fun tp!61570 () Bool)

(declare-fun b_and!29001 () Bool)

(assert (=> start!79656 (= tp!61570 b_and!29001)))

(declare-fun b!936588 () Bool)

(declare-fun e!525900 () Bool)

(assert (=> b!936588 (= e!525900 false)))

(declare-datatypes ((Unit!31596 0))(
  ( (Unit!31597) )
))
(declare-fun lt!422341 () Unit!31596)

(declare-fun e!525901 () Unit!31596)

(assert (=> b!936588 (= lt!422341 e!525901)))

(declare-fun c!97423 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936588 (= c!97423 (validKeyInArray!0 k!1099))))

(declare-fun b!936589 () Bool)

(declare-fun e!525899 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936589 (= e!525899 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936590 () Bool)

(declare-fun res!630598 () Bool)

(declare-fun e!525902 () Bool)

(assert (=> b!936590 (=> (not res!630598) (not e!525902))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56366 0))(
  ( (array!56367 (arr!27123 (Array (_ BitVec 32) (_ BitVec 64))) (size!27582 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56366)

(assert (=> b!936590 (= res!630598 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27582 _keys!1487))))))

(declare-fun b!936591 () Bool)

(declare-fun e!525897 () Bool)

(assert (=> b!936591 (= e!525902 e!525897)))

(declare-fun res!630595 () Bool)

(assert (=> b!936591 (=> (not res!630595) (not e!525897))))

(declare-datatypes ((V!31915 0))(
  ( (V!31916 (val!10157 Int)) )
))
(declare-datatypes ((tuple2!13338 0))(
  ( (tuple2!13339 (_1!6680 (_ BitVec 64)) (_2!6680 V!31915)) )
))
(declare-datatypes ((List!19118 0))(
  ( (Nil!19115) (Cons!19114 (h!20260 tuple2!13338) (t!27367 List!19118)) )
))
(declare-datatypes ((ListLongMap!12035 0))(
  ( (ListLongMap!12036 (toList!6033 List!19118)) )
))
(declare-fun lt!422348 () ListLongMap!12035)

(declare-fun contains!5093 (ListLongMap!12035 (_ BitVec 64)) Bool)

(assert (=> b!936591 (= res!630595 (contains!5093 lt!422348 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9625 0))(
  ( (ValueCellFull!9625 (v!12682 V!31915)) (EmptyCell!9625) )
))
(declare-datatypes ((array!56368 0))(
  ( (array!56369 (arr!27124 (Array (_ BitVec 32) ValueCell!9625)) (size!27583 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56368)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31915)

(declare-fun minValue!1173 () V!31915)

(declare-fun getCurrentListMap!3269 (array!56366 array!56368 (_ BitVec 32) (_ BitVec 32) V!31915 V!31915 (_ BitVec 32) Int) ListLongMap!12035)

(assert (=> b!936591 (= lt!422348 (getCurrentListMap!3269 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936592 () Bool)

(declare-fun e!525906 () Bool)

(declare-fun tp_is_empty!20213 () Bool)

(assert (=> b!936592 (= e!525906 tp_is_empty!20213)))

(declare-fun b!936593 () Bool)

(assert (=> b!936593 (= e!525897 e!525900)))

(declare-fun res!630600 () Bool)

(assert (=> b!936593 (=> (not res!630600) (not e!525900))))

(declare-fun v!791 () V!31915)

(declare-fun lt!422339 () V!31915)

(assert (=> b!936593 (= res!630600 (and (= lt!422339 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!835 (ListLongMap!12035 (_ BitVec 64)) V!31915)

(assert (=> b!936593 (= lt!422339 (apply!835 lt!422348 k!1099))))

(declare-fun b!936594 () Bool)

(declare-fun e!525898 () Bool)

(declare-fun mapRes!32091 () Bool)

(assert (=> b!936594 (= e!525898 (and e!525906 mapRes!32091))))

(declare-fun condMapEmpty!32091 () Bool)

(declare-fun mapDefault!32091 () ValueCell!9625)

