; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79392 () Bool)

(assert start!79392)

(declare-fun b_free!17579 () Bool)

(declare-fun b_next!17579 () Bool)

(assert (=> start!79392 (= b_free!17579 (not b_next!17579))))

(declare-fun tp!61181 () Bool)

(declare-fun b_and!28717 () Bool)

(assert (=> start!79392 (= tp!61181 b_and!28717)))

(declare-fun b!932855 () Bool)

(declare-fun res!628291 () Bool)

(declare-fun e!523844 () Bool)

(assert (=> b!932855 (=> (not res!628291) (not e!523844))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932855 (= res!628291 (validKeyInArray!0 k!1099))))

(declare-fun b!932856 () Bool)

(declare-fun res!628294 () Bool)

(assert (=> b!932856 (=> (not res!628294) (not e!523844))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932856 (= res!628294 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932857 () Bool)

(declare-fun res!628285 () Bool)

(declare-fun e!523845 () Bool)

(assert (=> b!932857 (=> (not res!628285) (not e!523845))))

(declare-datatypes ((array!56110 0))(
  ( (array!56111 (arr!26999 (Array (_ BitVec 32) (_ BitVec 64))) (size!27458 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56110)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56110 (_ BitVec 32)) Bool)

(assert (=> b!932857 (= res!628285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932858 () Bool)

(declare-fun e!523842 () Bool)

(assert (=> b!932858 (= e!523844 e!523842)))

(declare-fun res!628288 () Bool)

(assert (=> b!932858 (=> (not res!628288) (not e!523842))))

(declare-fun lt!420102 () (_ BitVec 64))

(assert (=> b!932858 (= res!628288 (validKeyInArray!0 lt!420102))))

(assert (=> b!932858 (= lt!420102 (select (arr!26999 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932859 () Bool)

(declare-fun res!628292 () Bool)

(assert (=> b!932859 (=> (not res!628292) (not e!523845))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31747 0))(
  ( (V!31748 (val!10094 Int)) )
))
(declare-datatypes ((ValueCell!9562 0))(
  ( (ValueCellFull!9562 (v!12613 V!31747)) (EmptyCell!9562) )
))
(declare-datatypes ((array!56112 0))(
  ( (array!56113 (arr!27000 (Array (_ BitVec 32) ValueCell!9562)) (size!27459 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56112)

(assert (=> b!932859 (= res!628292 (and (= (size!27459 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27458 _keys!1487) (size!27459 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932860 () Bool)

(declare-fun e!523847 () Bool)

(declare-fun e!523848 () Bool)

(declare-fun mapRes!31890 () Bool)

(assert (=> b!932860 (= e!523847 (and e!523848 mapRes!31890))))

(declare-fun condMapEmpty!31890 () Bool)

(declare-fun mapDefault!31890 () ValueCell!9562)

