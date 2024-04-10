; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79300 () Bool)

(assert start!79300)

(declare-fun b_free!17513 () Bool)

(declare-fun b_next!17513 () Bool)

(assert (=> start!79300 (= b_free!17513 (not b_next!17513))))

(declare-fun tp!60980 () Bool)

(declare-fun b_and!28579 () Bool)

(assert (=> start!79300 (= tp!60980 b_and!28579)))

(declare-fun b!931338 () Bool)

(declare-fun res!627228 () Bool)

(declare-fun e!523044 () Bool)

(assert (=> b!931338 (=> (not res!627228) (not e!523044))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55982 0))(
  ( (array!55983 (arr!26936 (Array (_ BitVec 32) (_ BitVec 64))) (size!27395 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55982)

(assert (=> b!931338 (= res!627228 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27395 _keys!1487))))))

(declare-fun mapIsEmpty!31788 () Bool)

(declare-fun mapRes!31788 () Bool)

(assert (=> mapIsEmpty!31788 mapRes!31788))

(declare-fun b!931339 () Bool)

(declare-fun e!523043 () Bool)

(declare-fun e!523045 () Bool)

(assert (=> b!931339 (= e!523043 (and e!523045 mapRes!31788))))

(declare-fun condMapEmpty!31788 () Bool)

(declare-datatypes ((V!31659 0))(
  ( (V!31660 (val!10061 Int)) )
))
(declare-datatypes ((ValueCell!9529 0))(
  ( (ValueCellFull!9529 (v!12579 V!31659)) (EmptyCell!9529) )
))
(declare-datatypes ((array!55984 0))(
  ( (array!55985 (arr!26937 (Array (_ BitVec 32) ValueCell!9529)) (size!27396 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55984)

(declare-fun mapDefault!31788 () ValueCell!9529)

