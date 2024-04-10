; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112530 () Bool)

(assert start!112530)

(declare-fun b_free!30925 () Bool)

(declare-fun b_next!30925 () Bool)

(assert (=> start!112530 (= b_free!30925 (not b_next!30925))))

(declare-fun tp!108411 () Bool)

(declare-fun b_and!49833 () Bool)

(assert (=> start!112530 (= tp!108411 b_and!49833)))

(declare-fun mapIsEmpty!56926 () Bool)

(declare-fun mapRes!56926 () Bool)

(assert (=> mapIsEmpty!56926 mapRes!56926))

(declare-fun b!1334814 () Bool)

(declare-fun e!760222 () Bool)

(declare-fun tp_is_empty!36835 () Bool)

(assert (=> b!1334814 (= e!760222 tp_is_empty!36835)))

(declare-fun b!1334815 () Bool)

(declare-fun res!885893 () Bool)

(declare-fun e!760220 () Bool)

(assert (=> b!1334815 (=> (not res!885893) (not e!760220))))

(declare-datatypes ((array!90532 0))(
  ( (array!90533 (arr!43732 (Array (_ BitVec 32) (_ BitVec 64))) (size!44282 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90532)

(declare-datatypes ((List!30982 0))(
  ( (Nil!30979) (Cons!30978 (h!32187 (_ BitVec 64)) (t!45246 List!30982)) )
))
(declare-fun arrayNoDuplicates!0 (array!90532 (_ BitVec 32) List!30982) Bool)

(assert (=> b!1334815 (= res!885893 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30979))))

(declare-fun b!1334816 () Bool)

(declare-fun e!760218 () Bool)

(assert (=> b!1334816 (= e!760218 tp_is_empty!36835)))

(declare-fun b!1334817 () Bool)

(declare-fun e!760221 () Bool)

(assert (=> b!1334817 (= e!760221 (and e!760218 mapRes!56926))))

(declare-fun condMapEmpty!56926 () Bool)

(declare-datatypes ((V!54217 0))(
  ( (V!54218 (val!18492 Int)) )
))
(declare-datatypes ((ValueCell!17519 0))(
  ( (ValueCellFull!17519 (v!21129 V!54217)) (EmptyCell!17519) )
))
(declare-datatypes ((array!90534 0))(
  ( (array!90535 (arr!43733 (Array (_ BitVec 32) ValueCell!17519)) (size!44283 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90534)

(declare-fun mapDefault!56926 () ValueCell!17519)

