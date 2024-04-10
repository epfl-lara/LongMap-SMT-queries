; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112522 () Bool)

(assert start!112522)

(declare-fun b_free!30917 () Bool)

(declare-fun b_next!30917 () Bool)

(assert (=> start!112522 (= b_free!30917 (not b_next!30917))))

(declare-fun tp!108387 () Bool)

(declare-fun b_and!49825 () Bool)

(assert (=> start!112522 (= tp!108387 b_and!49825)))

(declare-fun b!1334718 () Bool)

(declare-fun e!760162 () Bool)

(declare-fun tp_is_empty!36827 () Bool)

(assert (=> b!1334718 (= e!760162 tp_is_empty!36827)))

(declare-fun mapIsEmpty!56914 () Bool)

(declare-fun mapRes!56914 () Bool)

(assert (=> mapIsEmpty!56914 mapRes!56914))

(declare-fun mapNonEmpty!56914 () Bool)

(declare-fun tp!108388 () Bool)

(assert (=> mapNonEmpty!56914 (= mapRes!56914 (and tp!108388 e!760162))))

(declare-datatypes ((V!54205 0))(
  ( (V!54206 (val!18488 Int)) )
))
(declare-datatypes ((ValueCell!17515 0))(
  ( (ValueCellFull!17515 (v!21125 V!54205)) (EmptyCell!17515) )
))
(declare-datatypes ((array!90518 0))(
  ( (array!90519 (arr!43725 (Array (_ BitVec 32) ValueCell!17515)) (size!44275 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90518)

(declare-fun mapRest!56914 () (Array (_ BitVec 32) ValueCell!17515))

(declare-fun mapValue!56914 () ValueCell!17515)

(declare-fun mapKey!56914 () (_ BitVec 32))

(assert (=> mapNonEmpty!56914 (= (arr!43725 _values!1320) (store mapRest!56914 mapKey!56914 mapValue!56914))))

(declare-fun b!1334719 () Bool)

(declare-fun e!760158 () Bool)

(declare-fun e!760161 () Bool)

(assert (=> b!1334719 (= e!760158 (and e!760161 mapRes!56914))))

(declare-fun condMapEmpty!56914 () Bool)

(declare-fun mapDefault!56914 () ValueCell!17515)

