; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4642 () Bool)

(assert start!4642)

(declare-fun b_free!1289 () Bool)

(declare-fun b_next!1289 () Bool)

(assert (=> start!4642 (= b_free!1289 (not b_next!1289))))

(declare-fun tp!5318 () Bool)

(declare-fun b_and!2123 () Bool)

(assert (=> start!4642 (= tp!5318 b_and!2123)))

(declare-fun b!36282 () Bool)

(declare-fun res!21959 () Bool)

(declare-fun e!22914 () Bool)

(assert (=> b!36282 (=> (not res!21959) (not e!22914))))

(declare-datatypes ((array!2503 0))(
  ( (array!2504 (arr!1195 (Array (_ BitVec 32) (_ BitVec 64))) (size!1296 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2503)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2503 (_ BitVec 32)) Bool)

(assert (=> b!36282 (= res!21959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!2024 () Bool)

(declare-fun mapRes!2024 () Bool)

(declare-fun tp!5317 () Bool)

(declare-fun e!22913 () Bool)

(assert (=> mapNonEmpty!2024 (= mapRes!2024 (and tp!5317 e!22913))))

(declare-datatypes ((V!2015 0))(
  ( (V!2016 (val!848 Int)) )
))
(declare-datatypes ((ValueCell!622 0))(
  ( (ValueCellFull!622 (v!1948 V!2015)) (EmptyCell!622) )
))
(declare-fun mapRest!2024 () (Array (_ BitVec 32) ValueCell!622))

(declare-datatypes ((array!2505 0))(
  ( (array!2506 (arr!1196 (Array (_ BitVec 32) ValueCell!622)) (size!1297 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2505)

(declare-fun mapValue!2024 () ValueCell!622)

(declare-fun mapKey!2024 () (_ BitVec 32))

(assert (=> mapNonEmpty!2024 (= (arr!1196 _values!1501) (store mapRest!2024 mapKey!2024 mapValue!2024))))

(declare-fun b!36283 () Bool)

(declare-fun res!21958 () Bool)

(assert (=> b!36283 (=> (not res!21958) (not e!22914))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!36283 (= res!21958 (and (= (size!1297 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1296 _keys!1833) (size!1297 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!36284 () Bool)

(declare-fun res!21957 () Bool)

(assert (=> b!36284 (=> (not res!21957) (not e!22914))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!36284 (= res!21957 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!2024 () Bool)

(assert (=> mapIsEmpty!2024 mapRes!2024))

(declare-fun b!36286 () Bool)

(declare-fun tp_is_empty!1643 () Bool)

(assert (=> b!36286 (= e!22913 tp_is_empty!1643)))

(declare-fun b!36287 () Bool)

(declare-fun e!22915 () Bool)

(declare-fun e!22911 () Bool)

(assert (=> b!36287 (= e!22915 (and e!22911 mapRes!2024))))

(declare-fun condMapEmpty!2024 () Bool)

(declare-fun mapDefault!2024 () ValueCell!622)

