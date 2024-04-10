; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108480 () Bool)

(assert start!108480)

(declare-fun b_free!28027 () Bool)

(declare-fun b_next!28027 () Bool)

(assert (=> start!108480 (= b_free!28027 (not b_next!28027))))

(declare-fun tp!99190 () Bool)

(declare-fun b_and!46087 () Bool)

(assert (=> start!108480 (= tp!99190 b_and!46087)))

(declare-fun b!1280337 () Bool)

(declare-fun e!731567 () Bool)

(declare-fun tp_is_empty!33667 () Bool)

(assert (=> b!1280337 (= e!731567 tp_is_empty!33667)))

(declare-fun res!850475 () Bool)

(declare-fun e!731569 () Bool)

(assert (=> start!108480 (=> (not res!850475) (not e!731569))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108480 (= res!850475 (validMask!0 mask!2175))))

(assert (=> start!108480 e!731569))

(assert (=> start!108480 tp_is_empty!33667))

(assert (=> start!108480 true))

(declare-datatypes ((V!49993 0))(
  ( (V!49994 (val!16908 Int)) )
))
(declare-datatypes ((ValueCell!15935 0))(
  ( (ValueCellFull!15935 (v!19508 V!49993)) (EmptyCell!15935) )
))
(declare-datatypes ((array!84412 0))(
  ( (array!84413 (arr!40710 (Array (_ BitVec 32) ValueCell!15935)) (size!41260 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84412)

(declare-fun e!731566 () Bool)

(declare-fun array_inv!30899 (array!84412) Bool)

(assert (=> start!108480 (and (array_inv!30899 _values!1445) e!731566)))

(declare-datatypes ((array!84414 0))(
  ( (array!84415 (arr!40711 (Array (_ BitVec 32) (_ BitVec 64))) (size!41261 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84414)

(declare-fun array_inv!30900 (array!84414) Bool)

(assert (=> start!108480 (array_inv!30900 _keys!1741)))

(assert (=> start!108480 tp!99190))

(declare-fun mapIsEmpty!52052 () Bool)

(declare-fun mapRes!52052 () Bool)

(assert (=> mapIsEmpty!52052 mapRes!52052))

(declare-fun b!1280338 () Bool)

(declare-fun res!850471 () Bool)

(assert (=> b!1280338 (=> (not res!850471) (not e!731569))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280338 (= res!850471 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41261 _keys!1741))))))

(declare-fun b!1280339 () Bool)

(assert (=> b!1280339 (= e!731566 (and e!731567 mapRes!52052))))

(declare-fun condMapEmpty!52052 () Bool)

(declare-fun mapDefault!52052 () ValueCell!15935)

