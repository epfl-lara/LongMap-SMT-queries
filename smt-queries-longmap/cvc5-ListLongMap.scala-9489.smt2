; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112542 () Bool)

(assert start!112542)

(declare-fun b_free!30937 () Bool)

(declare-fun b_next!30937 () Bool)

(assert (=> start!112542 (= b_free!30937 (not b_next!30937))))

(declare-fun tp!108447 () Bool)

(declare-fun b_and!49845 () Bool)

(assert (=> start!112542 (= tp!108447 b_and!49845)))

(declare-fun b!1334958 () Bool)

(declare-fun e!760311 () Bool)

(declare-fun e!760312 () Bool)

(declare-fun mapRes!56944 () Bool)

(assert (=> b!1334958 (= e!760311 (and e!760312 mapRes!56944))))

(declare-fun condMapEmpty!56944 () Bool)

(declare-datatypes ((V!54233 0))(
  ( (V!54234 (val!18498 Int)) )
))
(declare-datatypes ((ValueCell!17525 0))(
  ( (ValueCellFull!17525 (v!21135 V!54233)) (EmptyCell!17525) )
))
(declare-datatypes ((array!90556 0))(
  ( (array!90557 (arr!43744 (Array (_ BitVec 32) ValueCell!17525)) (size!44294 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90556)

(declare-fun mapDefault!56944 () ValueCell!17525)

