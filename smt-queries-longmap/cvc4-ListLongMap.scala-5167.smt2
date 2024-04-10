; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69980 () Bool)

(assert start!69980)

(declare-fun b_free!12413 () Bool)

(declare-fun b_next!12413 () Bool)

(assert (=> start!69980 (= b_free!12413 (not b_next!12413))))

(declare-fun tp!43950 () Bool)

(declare-fun b_and!21181 () Bool)

(assert (=> start!69980 (= tp!43950 b_and!21181)))

(declare-fun b!813418 () Bool)

(declare-fun res!555711 () Bool)

(declare-fun e!450733 () Bool)

(assert (=> b!813418 (=> (not res!555711) (not e!450733))))

(declare-datatypes ((array!44454 0))(
  ( (array!44455 (arr!21288 (Array (_ BitVec 32) (_ BitVec 64))) (size!21709 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44454)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44454 (_ BitVec 32)) Bool)

(assert (=> b!813418 (= res!555711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22762 () Bool)

(declare-fun mapRes!22762 () Bool)

(assert (=> mapIsEmpty!22762 mapRes!22762))

(declare-fun res!555709 () Bool)

(assert (=> start!69980 (=> (not res!555709) (not e!450733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69980 (= res!555709 (validMask!0 mask!1312))))

(assert (=> start!69980 e!450733))

(declare-fun tp_is_empty!14123 () Bool)

(assert (=> start!69980 tp_is_empty!14123))

(declare-fun array_inv!17049 (array!44454) Bool)

(assert (=> start!69980 (array_inv!17049 _keys!976)))

(assert (=> start!69980 true))

(declare-datatypes ((V!23831 0))(
  ( (V!23832 (val!7109 Int)) )
))
(declare-datatypes ((ValueCell!6646 0))(
  ( (ValueCellFull!6646 (v!9536 V!23831)) (EmptyCell!6646) )
))
(declare-datatypes ((array!44456 0))(
  ( (array!44457 (arr!21289 (Array (_ BitVec 32) ValueCell!6646)) (size!21710 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44456)

(declare-fun e!450732 () Bool)

(declare-fun array_inv!17050 (array!44456) Bool)

(assert (=> start!69980 (and (array_inv!17050 _values!788) e!450732)))

(assert (=> start!69980 tp!43950))

(declare-fun b!813419 () Bool)

(declare-fun e!450734 () Bool)

(assert (=> b!813419 (= e!450734 tp_is_empty!14123)))

(declare-fun mapNonEmpty!22762 () Bool)

(declare-fun tp!43951 () Bool)

(assert (=> mapNonEmpty!22762 (= mapRes!22762 (and tp!43951 e!450734))))

(declare-fun mapValue!22762 () ValueCell!6646)

(declare-fun mapKey!22762 () (_ BitVec 32))

(declare-fun mapRest!22762 () (Array (_ BitVec 32) ValueCell!6646))

(assert (=> mapNonEmpty!22762 (= (arr!21289 _values!788) (store mapRest!22762 mapKey!22762 mapValue!22762))))

(declare-fun b!813420 () Bool)

(assert (=> b!813420 (= e!450733 (bvsgt #b00000000000000000000000000000000 (size!21709 _keys!976)))))

(declare-fun zeroValueBefore!34 () V!23831)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23831)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9308 0))(
  ( (tuple2!9309 (_1!4665 (_ BitVec 64)) (_2!4665 V!23831)) )
))
(declare-datatypes ((List!15141 0))(
  ( (Nil!15138) (Cons!15137 (h!16266 tuple2!9308) (t!21456 List!15141)) )
))
(declare-datatypes ((ListLongMap!8131 0))(
  ( (ListLongMap!8132 (toList!4081 List!15141)) )
))
(declare-fun lt!364281 () ListLongMap!8131)

(declare-fun getCurrentListMapNoExtraKeys!2131 (array!44454 array!44456 (_ BitVec 32) (_ BitVec 32) V!23831 V!23831 (_ BitVec 32) Int) ListLongMap!8131)

(assert (=> b!813420 (= lt!364281 (getCurrentListMapNoExtraKeys!2131 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813421 () Bool)

(declare-fun e!450731 () Bool)

(assert (=> b!813421 (= e!450732 (and e!450731 mapRes!22762))))

(declare-fun condMapEmpty!22762 () Bool)

(declare-fun mapDefault!22762 () ValueCell!6646)

