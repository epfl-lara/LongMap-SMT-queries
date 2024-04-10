; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112504 () Bool)

(assert start!112504)

(declare-fun b_free!30899 () Bool)

(declare-fun b_next!30899 () Bool)

(assert (=> start!112504 (= b_free!30899 (not b_next!30899))))

(declare-fun tp!108333 () Bool)

(declare-fun b_and!49799 () Bool)

(assert (=> start!112504 (= tp!108333 b_and!49799)))

(declare-fun b!1334434 () Bool)

(declare-fun res!885642 () Bool)

(declare-fun e!760016 () Bool)

(assert (=> b!1334434 (=> (not res!885642) (not e!760016))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90484 0))(
  ( (array!90485 (arr!43708 (Array (_ BitVec 32) (_ BitVec 64))) (size!44258 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90484)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1334434 (= res!885642 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44258 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334435 () Bool)

(declare-fun e!760017 () Bool)

(declare-fun tp_is_empty!36809 () Bool)

(assert (=> b!1334435 (= e!760017 tp_is_empty!36809)))

(declare-fun mapIsEmpty!56887 () Bool)

(declare-fun mapRes!56887 () Bool)

(assert (=> mapIsEmpty!56887 mapRes!56887))

(declare-fun b!1334436 () Bool)

(declare-fun e!760013 () Bool)

(assert (=> b!1334436 (= e!760013 (and e!760017 mapRes!56887))))

(declare-fun condMapEmpty!56887 () Bool)

(declare-datatypes ((V!54181 0))(
  ( (V!54182 (val!18479 Int)) )
))
(declare-datatypes ((ValueCell!17506 0))(
  ( (ValueCellFull!17506 (v!21116 V!54181)) (EmptyCell!17506) )
))
(declare-datatypes ((array!90486 0))(
  ( (array!90487 (arr!43709 (Array (_ BitVec 32) ValueCell!17506)) (size!44259 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90486)

(declare-fun mapDefault!56887 () ValueCell!17506)

