; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79650 () Bool)

(assert start!79650)

(declare-fun b_free!17699 () Bool)

(declare-fun b_next!17699 () Bool)

(assert (=> start!79650 (= b_free!17699 (not b_next!17699))))

(declare-fun tp!61553 () Bool)

(declare-fun b_and!28989 () Bool)

(assert (=> start!79650 (= tp!61553 b_and!28989)))

(declare-fun mapNonEmpty!32082 () Bool)

(declare-fun mapRes!32082 () Bool)

(declare-fun tp!61552 () Bool)

(declare-fun e!525813 () Bool)

(assert (=> mapNonEmpty!32082 (= mapRes!32082 (and tp!61552 e!525813))))

(declare-fun mapKey!32082 () (_ BitVec 32))

(declare-datatypes ((V!31907 0))(
  ( (V!31908 (val!10154 Int)) )
))
(declare-datatypes ((ValueCell!9622 0))(
  ( (ValueCellFull!9622 (v!12679 V!31907)) (EmptyCell!9622) )
))
(declare-fun mapRest!32082 () (Array (_ BitVec 32) ValueCell!9622))

(declare-datatypes ((array!56356 0))(
  ( (array!56357 (arr!27118 (Array (_ BitVec 32) ValueCell!9622)) (size!27577 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56356)

(declare-fun mapValue!32082 () ValueCell!9622)

(assert (=> mapNonEmpty!32082 (= (arr!27118 _values!1231) (store mapRest!32082 mapKey!32082 mapValue!32082))))

(declare-fun b!936438 () Bool)

(declare-fun e!525808 () Bool)

(declare-fun e!525809 () Bool)

(assert (=> b!936438 (= e!525808 (and e!525809 mapRes!32082))))

(declare-fun condMapEmpty!32082 () Bool)

(declare-fun mapDefault!32082 () ValueCell!9622)

