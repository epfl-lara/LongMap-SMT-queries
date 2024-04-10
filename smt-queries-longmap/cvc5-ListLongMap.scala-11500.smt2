; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133834 () Bool)

(assert start!133834)

(declare-fun b!1564741 () Bool)

(declare-fun e!872143 () Bool)

(declare-fun tp_is_empty!38881 () Bool)

(assert (=> b!1564741 (= e!872143 tp_is_empty!38881)))

(declare-fun b!1564742 () Bool)

(declare-fun e!872141 () Bool)

(assert (=> b!1564742 (= e!872141 tp_is_empty!38881)))

(declare-fun mapNonEmpty!59704 () Bool)

(declare-fun mapRes!59704 () Bool)

(declare-fun tp!113629 () Bool)

(assert (=> mapNonEmpty!59704 (= mapRes!59704 (and tp!113629 e!872141))))

(declare-datatypes ((V!60049 0))(
  ( (V!60050 (val!19524 Int)) )
))
(declare-datatypes ((ValueCell!18410 0))(
  ( (ValueCellFull!18410 (v!22278 V!60049)) (EmptyCell!18410) )
))
(declare-fun mapRest!59704 () (Array (_ BitVec 32) ValueCell!18410))

(declare-fun mapKey!59704 () (_ BitVec 32))

(declare-datatypes ((array!104452 0))(
  ( (array!104453 (arr!50416 (Array (_ BitVec 32) ValueCell!18410)) (size!50966 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104452)

(declare-fun mapValue!59704 () ValueCell!18410)

(assert (=> mapNonEmpty!59704 (= (arr!50416 _values!487) (store mapRest!59704 mapKey!59704 mapValue!59704))))

(declare-fun b!1564743 () Bool)

(declare-fun e!872142 () Bool)

(assert (=> b!1564743 (= e!872142 (and e!872143 mapRes!59704))))

(declare-fun condMapEmpty!59704 () Bool)

(declare-fun mapDefault!59704 () ValueCell!18410)

