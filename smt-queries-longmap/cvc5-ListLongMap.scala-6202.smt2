; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79320 () Bool)

(assert start!79320)

(declare-fun b_free!17533 () Bool)

(declare-fun b_next!17533 () Bool)

(assert (=> start!79320 (= b_free!17533 (not b_next!17533))))

(declare-fun tp!61039 () Bool)

(declare-fun b_and!28617 () Bool)

(assert (=> start!79320 (= tp!61039 b_and!28617)))

(declare-fun b!931742 () Bool)

(declare-fun res!627528 () Bool)

(declare-fun e!523254 () Bool)

(assert (=> b!931742 (=> (not res!627528) (not e!523254))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56020 0))(
  ( (array!56021 (arr!26955 (Array (_ BitVec 32) (_ BitVec 64))) (size!27414 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56020)

(assert (=> b!931742 (= res!627528 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27414 _keys!1487))))))

(declare-fun b!931743 () Bool)

(declare-fun res!627527 () Bool)

(assert (=> b!931743 (=> (not res!627527) (not e!523254))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56020 (_ BitVec 32)) Bool)

(assert (=> b!931743 (= res!627527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931744 () Bool)

(declare-fun e!523251 () Bool)

(declare-fun e!523250 () Bool)

(declare-fun mapRes!31818 () Bool)

(assert (=> b!931744 (= e!523251 (and e!523250 mapRes!31818))))

(declare-fun condMapEmpty!31818 () Bool)

(declare-datatypes ((V!31687 0))(
  ( (V!31688 (val!10071 Int)) )
))
(declare-datatypes ((ValueCell!9539 0))(
  ( (ValueCellFull!9539 (v!12589 V!31687)) (EmptyCell!9539) )
))
(declare-datatypes ((array!56022 0))(
  ( (array!56023 (arr!26956 (Array (_ BitVec 32) ValueCell!9539)) (size!27415 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56022)

(declare-fun mapDefault!31818 () ValueCell!9539)

