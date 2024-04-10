; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42144 () Bool)

(assert start!42144)

(declare-fun b_free!11677 () Bool)

(declare-fun b_next!11677 () Bool)

(assert (=> start!42144 (= b_free!11677 (not b_next!11677))))

(declare-fun tp!41052 () Bool)

(declare-fun b_and!20099 () Bool)

(assert (=> start!42144 (= tp!41052 b_and!20099)))

(declare-fun b!470489 () Bool)

(declare-fun res!281129 () Bool)

(declare-fun e!275633 () Bool)

(assert (=> b!470489 (=> (not res!281129) (not e!275633))))

(declare-datatypes ((array!29981 0))(
  ( (array!29982 (arr!14414 (Array (_ BitVec 32) (_ BitVec 64))) (size!14766 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29981)

(declare-datatypes ((List!8771 0))(
  ( (Nil!8768) (Cons!8767 (h!9623 (_ BitVec 64)) (t!14733 List!8771)) )
))
(declare-fun arrayNoDuplicates!0 (array!29981 (_ BitVec 32) List!8771) Bool)

(assert (=> b!470489 (= res!281129 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8768))))

(declare-fun res!281128 () Bool)

(assert (=> start!42144 (=> (not res!281128) (not e!275633))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42144 (= res!281128 (validMask!0 mask!1365))))

(assert (=> start!42144 e!275633))

(declare-fun tp_is_empty!13105 () Bool)

(assert (=> start!42144 tp_is_empty!13105))

(assert (=> start!42144 tp!41052))

(assert (=> start!42144 true))

(declare-fun array_inv!10402 (array!29981) Bool)

(assert (=> start!42144 (array_inv!10402 _keys!1025)))

(declare-datatypes ((V!18579 0))(
  ( (V!18580 (val!6597 Int)) )
))
(declare-datatypes ((ValueCell!6209 0))(
  ( (ValueCellFull!6209 (v!8888 V!18579)) (EmptyCell!6209) )
))
(declare-datatypes ((array!29983 0))(
  ( (array!29984 (arr!14415 (Array (_ BitVec 32) ValueCell!6209)) (size!14767 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29983)

(declare-fun e!275631 () Bool)

(declare-fun array_inv!10403 (array!29983) Bool)

(assert (=> start!42144 (and (array_inv!10403 _values!833) e!275631)))

(declare-fun b!470490 () Bool)

(declare-fun e!275634 () Bool)

(assert (=> b!470490 (= e!275634 tp_is_empty!13105)))

(declare-fun mapNonEmpty!21358 () Bool)

(declare-fun mapRes!21358 () Bool)

(declare-fun tp!41053 () Bool)

(declare-fun e!275635 () Bool)

(assert (=> mapNonEmpty!21358 (= mapRes!21358 (and tp!41053 e!275635))))

(declare-fun mapValue!21358 () ValueCell!6209)

(declare-fun mapKey!21358 () (_ BitVec 32))

(declare-fun mapRest!21358 () (Array (_ BitVec 32) ValueCell!6209))

(assert (=> mapNonEmpty!21358 (= (arr!14415 _values!833) (store mapRest!21358 mapKey!21358 mapValue!21358))))

(declare-fun b!470491 () Bool)

(assert (=> b!470491 (= e!275635 tp_is_empty!13105)))

(declare-fun b!470492 () Bool)

(assert (=> b!470492 (= e!275631 (and e!275634 mapRes!21358))))

(declare-fun condMapEmpty!21358 () Bool)

(declare-fun mapDefault!21358 () ValueCell!6209)

