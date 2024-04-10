; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104720 () Bool)

(assert start!104720)

(declare-fun b_free!26537 () Bool)

(declare-fun b_next!26537 () Bool)

(assert (=> start!104720 (= b_free!26537 (not b_next!26537))))

(declare-fun tp!93098 () Bool)

(declare-fun b_and!44301 () Bool)

(assert (=> start!104720 (= tp!93098 b_and!44301)))

(declare-fun mapNonEmpty!48916 () Bool)

(declare-fun mapRes!48916 () Bool)

(declare-fun tp!93097 () Bool)

(declare-fun e!708437 () Bool)

(assert (=> mapNonEmpty!48916 (= mapRes!48916 (and tp!93097 e!708437))))

(declare-datatypes ((V!47283 0))(
  ( (V!47284 (val!15782 Int)) )
))
(declare-datatypes ((ValueCell!14956 0))(
  ( (ValueCellFull!14956 (v!18478 V!47283)) (EmptyCell!14956) )
))
(declare-fun mapValue!48916 () ValueCell!14956)

(declare-fun mapRest!48916 () (Array (_ BitVec 32) ValueCell!14956))

(declare-fun mapKey!48916 () (_ BitVec 32))

(declare-datatypes ((array!80568 0))(
  ( (array!80569 (arr!38852 (Array (_ BitVec 32) ValueCell!14956)) (size!39388 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80568)

(assert (=> mapNonEmpty!48916 (= (arr!38852 _values!914) (store mapRest!48916 mapKey!48916 mapValue!48916))))

(declare-fun b!1248455 () Bool)

(declare-fun e!708435 () Bool)

(declare-fun tp_is_empty!31439 () Bool)

(assert (=> b!1248455 (= e!708435 tp_is_empty!31439)))

(declare-fun b!1248456 () Bool)

(assert (=> b!1248456 (= e!708437 tp_is_empty!31439)))

(declare-fun res!832920 () Bool)

(declare-fun e!708436 () Bool)

(assert (=> start!104720 (=> (not res!832920) (not e!708436))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104720 (= res!832920 (validMask!0 mask!1466))))

(assert (=> start!104720 e!708436))

(assert (=> start!104720 true))

(assert (=> start!104720 tp!93098))

(assert (=> start!104720 tp_is_empty!31439))

(declare-datatypes ((array!80570 0))(
  ( (array!80571 (arr!38853 (Array (_ BitVec 32) (_ BitVec 64))) (size!39389 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80570)

(declare-fun array_inv!29653 (array!80570) Bool)

(assert (=> start!104720 (array_inv!29653 _keys!1118)))

(declare-fun e!708439 () Bool)

(declare-fun array_inv!29654 (array!80568) Bool)

(assert (=> start!104720 (and (array_inv!29654 _values!914) e!708439)))

(declare-fun b!1248457 () Bool)

(assert (=> b!1248457 (= e!708439 (and e!708435 mapRes!48916))))

(declare-fun condMapEmpty!48916 () Bool)

(declare-fun mapDefault!48916 () ValueCell!14956)

