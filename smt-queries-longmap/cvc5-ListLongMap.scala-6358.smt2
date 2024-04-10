; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81884 () Bool)

(assert start!81884)

(declare-fun b_free!18379 () Bool)

(declare-fun b_next!18379 () Bool)

(assert (=> start!81884 (= b_free!18379 (not b_next!18379))))

(declare-fun tp!63836 () Bool)

(declare-fun b_and!29865 () Bool)

(assert (=> start!81884 (= tp!63836 b_and!29865)))

(declare-fun b!954994 () Bool)

(declare-fun res!639510 () Bool)

(declare-fun e!538033 () Bool)

(assert (=> b!954994 (=> (not res!639510) (not e!538033))))

(declare-datatypes ((array!57953 0))(
  ( (array!57954 (arr!27856 (Array (_ BitVec 32) (_ BitVec 64))) (size!28335 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57953)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954994 (= res!639510 (validKeyInArray!0 (select (arr!27856 _keys!1441) i!735)))))

(declare-fun b!954995 () Bool)

(declare-fun res!639508 () Bool)

(assert (=> b!954995 (=> (not res!639508) (not e!538033))))

(declare-datatypes ((List!19415 0))(
  ( (Nil!19412) (Cons!19411 (h!20573 (_ BitVec 64)) (t!27776 List!19415)) )
))
(declare-fun arrayNoDuplicates!0 (array!57953 (_ BitVec 32) List!19415) Bool)

(assert (=> b!954995 (= res!639508 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19412))))

(declare-fun b!954996 () Bool)

(declare-fun e!538032 () Bool)

(declare-fun e!538030 () Bool)

(declare-fun mapRes!33346 () Bool)

(assert (=> b!954996 (= e!538032 (and e!538030 mapRes!33346))))

(declare-fun condMapEmpty!33346 () Bool)

(declare-datatypes ((V!32881 0))(
  ( (V!32882 (val!10512 Int)) )
))
(declare-datatypes ((ValueCell!9980 0))(
  ( (ValueCellFull!9980 (v!13067 V!32881)) (EmptyCell!9980) )
))
(declare-datatypes ((array!57955 0))(
  ( (array!57956 (arr!27857 (Array (_ BitVec 32) ValueCell!9980)) (size!28336 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57955)

(declare-fun mapDefault!33346 () ValueCell!9980)

