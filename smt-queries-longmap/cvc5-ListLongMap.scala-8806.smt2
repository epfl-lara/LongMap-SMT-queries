; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107060 () Bool)

(assert start!107060)

(declare-fun b_free!27565 () Bool)

(declare-fun b_next!27565 () Bool)

(assert (=> start!107060 (= b_free!27565 (not b_next!27565))))

(declare-fun tp!96922 () Bool)

(declare-fun b_and!45597 () Bool)

(assert (=> start!107060 (= tp!96922 b_and!45597)))

(declare-fun b!1269315 () Bool)

(declare-fun res!844726 () Bool)

(declare-fun e!723451 () Bool)

(assert (=> b!1269315 (=> (not res!844726) (not e!723451))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82762 0))(
  ( (array!82763 (arr!39918 (Array (_ BitVec 32) (_ BitVec 64))) (size!40454 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82762)

(assert (=> b!1269315 (= res!844726 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40454 _keys!1364)) (bvslt from!1698 (size!40454 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269316 () Bool)

(declare-fun e!723452 () Bool)

(declare-fun tp_is_empty!32749 () Bool)

(assert (=> b!1269316 (= e!723452 tp_is_empty!32749)))

(declare-fun mapIsEmpty!50704 () Bool)

(declare-fun mapRes!50704 () Bool)

(assert (=> mapIsEmpty!50704 mapRes!50704))

(declare-fun b!1269317 () Bool)

(declare-fun e!723453 () Bool)

(assert (=> b!1269317 (= e!723453 tp_is_empty!32749)))

(declare-fun b!1269318 () Bool)

(declare-fun e!723450 () Bool)

(assert (=> b!1269318 (= e!723450 (and e!723452 mapRes!50704))))

(declare-fun condMapEmpty!50704 () Bool)

(declare-datatypes ((V!48859 0))(
  ( (V!48860 (val!16449 Int)) )
))
(declare-datatypes ((ValueCell!15521 0))(
  ( (ValueCellFull!15521 (v!19086 V!48859)) (EmptyCell!15521) )
))
(declare-datatypes ((array!82764 0))(
  ( (array!82765 (arr!39919 (Array (_ BitVec 32) ValueCell!15521)) (size!40455 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82764)

(declare-fun mapDefault!50704 () ValueCell!15521)

