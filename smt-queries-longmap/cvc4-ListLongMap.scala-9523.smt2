; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113004 () Bool)

(assert start!113004)

(declare-fun b!1339409 () Bool)

(declare-fun e!762889 () Bool)

(declare-fun tp_is_empty!37055 () Bool)

(assert (=> b!1339409 (= e!762889 tp_is_empty!37055)))

(declare-fun mapIsEmpty!57289 () Bool)

(declare-fun mapRes!57289 () Bool)

(assert (=> mapIsEmpty!57289 mapRes!57289))

(declare-fun b!1339410 () Bool)

(declare-fun e!762891 () Bool)

(declare-fun e!762892 () Bool)

(assert (=> b!1339410 (= e!762891 (and e!762892 mapRes!57289))))

(declare-fun condMapEmpty!57289 () Bool)

(declare-datatypes ((V!54509 0))(
  ( (V!54510 (val!18602 Int)) )
))
(declare-datatypes ((ValueCell!17629 0))(
  ( (ValueCellFull!17629 (v!21250 V!54509)) (EmptyCell!17629) )
))
(declare-datatypes ((array!90968 0))(
  ( (array!90969 (arr!43940 (Array (_ BitVec 32) ValueCell!17629)) (size!44490 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90968)

(declare-fun mapDefault!57289 () ValueCell!17629)

