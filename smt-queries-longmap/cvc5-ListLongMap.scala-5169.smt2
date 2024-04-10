; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70000 () Bool)

(assert start!70000)

(declare-fun b_free!12421 () Bool)

(declare-fun b_next!12421 () Bool)

(assert (=> start!70000 (= b_free!12421 (not b_next!12421))))

(declare-fun tp!43977 () Bool)

(declare-fun b_and!21193 () Bool)

(assert (=> start!70000 (= tp!43977 b_and!21193)))

(declare-fun res!555783 () Bool)

(declare-fun e!450841 () Bool)

(assert (=> start!70000 (=> (not res!555783) (not e!450841))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70000 (= res!555783 (validMask!0 mask!1312))))

(assert (=> start!70000 e!450841))

(declare-fun tp_is_empty!14131 () Bool)

(assert (=> start!70000 tp_is_empty!14131))

(declare-datatypes ((array!44470 0))(
  ( (array!44471 (arr!21295 (Array (_ BitVec 32) (_ BitVec 64))) (size!21716 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44470)

(declare-fun array_inv!17055 (array!44470) Bool)

(assert (=> start!70000 (array_inv!17055 _keys!976)))

(assert (=> start!70000 true))

(declare-datatypes ((V!23843 0))(
  ( (V!23844 (val!7113 Int)) )
))
(declare-datatypes ((ValueCell!6650 0))(
  ( (ValueCellFull!6650 (v!9540 V!23843)) (EmptyCell!6650) )
))
(declare-datatypes ((array!44472 0))(
  ( (array!44473 (arr!21296 (Array (_ BitVec 32) ValueCell!6650)) (size!21717 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44472)

(declare-fun e!450839 () Bool)

(declare-fun array_inv!17056 (array!44472) Bool)

(assert (=> start!70000 (and (array_inv!17056 _values!788) e!450839)))

(assert (=> start!70000 tp!43977))

(declare-fun b!813575 () Bool)

(declare-fun e!450843 () Bool)

(assert (=> b!813575 (= e!450843 tp_is_empty!14131)))

(declare-fun b!813576 () Bool)

(assert (=> b!813576 (= e!450841 false)))

(declare-fun zeroValueAfter!34 () V!23843)

(declare-fun minValue!754 () V!23843)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9314 0))(
  ( (tuple2!9315 (_1!4668 (_ BitVec 64)) (_2!4668 V!23843)) )
))
(declare-datatypes ((List!15146 0))(
  ( (Nil!15143) (Cons!15142 (h!16271 tuple2!9314) (t!21463 List!15146)) )
))
(declare-datatypes ((ListLongMap!8137 0))(
  ( (ListLongMap!8138 (toList!4084 List!15146)) )
))
(declare-fun lt!364334 () ListLongMap!8137)

(declare-fun getCurrentListMapNoExtraKeys!2134 (array!44470 array!44472 (_ BitVec 32) (_ BitVec 32) V!23843 V!23843 (_ BitVec 32) Int) ListLongMap!8137)

(assert (=> b!813576 (= lt!364334 (getCurrentListMapNoExtraKeys!2134 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23843)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364335 () ListLongMap!8137)

(assert (=> b!813576 (= lt!364335 (getCurrentListMapNoExtraKeys!2134 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813577 () Bool)

(declare-fun res!555784 () Bool)

(assert (=> b!813577 (=> (not res!555784) (not e!450841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44470 (_ BitVec 32)) Bool)

(assert (=> b!813577 (= res!555784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813578 () Bool)

(declare-fun res!555785 () Bool)

(assert (=> b!813578 (=> (not res!555785) (not e!450841))))

(assert (=> b!813578 (= res!555785 (and (= (size!21717 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21716 _keys!976) (size!21717 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813579 () Bool)

(declare-fun res!555786 () Bool)

(assert (=> b!813579 (=> (not res!555786) (not e!450841))))

(declare-datatypes ((List!15147 0))(
  ( (Nil!15144) (Cons!15143 (h!16272 (_ BitVec 64)) (t!21464 List!15147)) )
))
(declare-fun arrayNoDuplicates!0 (array!44470 (_ BitVec 32) List!15147) Bool)

(assert (=> b!813579 (= res!555786 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15144))))

(declare-fun b!813580 () Bool)

(declare-fun e!450840 () Bool)

(assert (=> b!813580 (= e!450840 tp_is_empty!14131)))

(declare-fun b!813581 () Bool)

(declare-fun mapRes!22777 () Bool)

(assert (=> b!813581 (= e!450839 (and e!450843 mapRes!22777))))

(declare-fun condMapEmpty!22777 () Bool)

(declare-fun mapDefault!22777 () ValueCell!6650)

