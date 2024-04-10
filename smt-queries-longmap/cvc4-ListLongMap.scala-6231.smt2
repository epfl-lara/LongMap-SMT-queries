; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79662 () Bool)

(assert start!79662)

(declare-fun b_free!17711 () Bool)

(declare-fun b_next!17711 () Bool)

(assert (=> start!79662 (= b_free!17711 (not b_next!17711))))

(declare-fun tp!61588 () Bool)

(declare-fun b_and!29013 () Bool)

(assert (=> start!79662 (= tp!61588 b_and!29013)))

(declare-fun b!936738 () Bool)

(declare-fun e!525987 () Bool)

(declare-fun e!525992 () Bool)

(assert (=> b!936738 (= e!525987 e!525992)))

(declare-fun res!630662 () Bool)

(assert (=> b!936738 (=> (not res!630662) (not e!525992))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31923 0))(
  ( (V!31924 (val!10160 Int)) )
))
(declare-fun v!791 () V!31923)

(declare-fun lt!422458 () V!31923)

(assert (=> b!936738 (= res!630662 (and (= lt!422458 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13344 0))(
  ( (tuple2!13345 (_1!6683 (_ BitVec 64)) (_2!6683 V!31923)) )
))
(declare-datatypes ((List!19123 0))(
  ( (Nil!19120) (Cons!19119 (h!20265 tuple2!13344) (t!27378 List!19123)) )
))
(declare-datatypes ((ListLongMap!12041 0))(
  ( (ListLongMap!12042 (toList!6036 List!19123)) )
))
(declare-fun lt!422459 () ListLongMap!12041)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!838 (ListLongMap!12041 (_ BitVec 64)) V!31923)

(assert (=> b!936738 (= lt!422458 (apply!838 lt!422459 k!1099))))

(declare-fun b!936739 () Bool)

(declare-fun res!630664 () Bool)

(declare-fun e!525991 () Bool)

(assert (=> b!936739 (=> (not res!630664) (not e!525991))))

(declare-datatypes ((array!56378 0))(
  ( (array!56379 (arr!27129 (Array (_ BitVec 32) (_ BitVec 64))) (size!27588 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56378)

(declare-datatypes ((List!19124 0))(
  ( (Nil!19121) (Cons!19120 (h!20266 (_ BitVec 64)) (t!27379 List!19124)) )
))
(declare-fun arrayNoDuplicates!0 (array!56378 (_ BitVec 32) List!19124) Bool)

(assert (=> b!936739 (= res!630664 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19121))))

(declare-fun b!936740 () Bool)

(declare-datatypes ((Unit!31606 0))(
  ( (Unit!31607) )
))
(declare-fun e!525990 () Unit!31606)

(declare-fun Unit!31608 () Unit!31606)

(assert (=> b!936740 (= e!525990 Unit!31608)))

(declare-fun b!936741 () Bool)

(declare-fun e!525995 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936741 (= e!525995 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936742 () Bool)

(declare-fun e!525994 () Bool)

(declare-fun e!525988 () Bool)

(declare-fun mapRes!32100 () Bool)

(assert (=> b!936742 (= e!525994 (and e!525988 mapRes!32100))))

(declare-fun condMapEmpty!32100 () Bool)

(declare-datatypes ((ValueCell!9628 0))(
  ( (ValueCellFull!9628 (v!12685 V!31923)) (EmptyCell!9628) )
))
(declare-datatypes ((array!56380 0))(
  ( (array!56381 (arr!27130 (Array (_ BitVec 32) ValueCell!9628)) (size!27589 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56380)

(declare-fun mapDefault!32100 () ValueCell!9628)

