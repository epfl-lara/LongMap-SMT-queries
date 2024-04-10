; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70010 () Bool)

(assert start!70010)

(declare-fun b_free!12431 () Bool)

(declare-fun b_next!12431 () Bool)

(assert (=> start!70010 (= b_free!12431 (not b_next!12431))))

(declare-fun tp!44008 () Bool)

(declare-fun b_and!21203 () Bool)

(assert (=> start!70010 (= tp!44008 b_and!21203)))

(declare-fun b!813680 () Bool)

(declare-fun e!450914 () Bool)

(declare-fun tp_is_empty!14141 () Bool)

(assert (=> b!813680 (= e!450914 tp_is_empty!14141)))

(declare-fun b!813681 () Bool)

(declare-fun e!450916 () Bool)

(assert (=> b!813681 (= e!450916 false)))

(declare-datatypes ((V!23855 0))(
  ( (V!23856 (val!7118 Int)) )
))
(declare-datatypes ((tuple2!9324 0))(
  ( (tuple2!9325 (_1!4673 (_ BitVec 64)) (_2!4673 V!23855)) )
))
(declare-datatypes ((List!15155 0))(
  ( (Nil!15152) (Cons!15151 (h!16280 tuple2!9324) (t!21472 List!15155)) )
))
(declare-datatypes ((ListLongMap!8147 0))(
  ( (ListLongMap!8148 (toList!4089 List!15155)) )
))
(declare-fun lt!364365 () ListLongMap!8147)

(declare-datatypes ((array!44490 0))(
  ( (array!44491 (arr!21305 (Array (_ BitVec 32) (_ BitVec 64))) (size!21726 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44490)

(declare-fun zeroValueAfter!34 () V!23855)

(declare-fun minValue!754 () V!23855)

(declare-datatypes ((ValueCell!6655 0))(
  ( (ValueCellFull!6655 (v!9545 V!23855)) (EmptyCell!6655) )
))
(declare-datatypes ((array!44492 0))(
  ( (array!44493 (arr!21306 (Array (_ BitVec 32) ValueCell!6655)) (size!21727 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44492)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2139 (array!44490 array!44492 (_ BitVec 32) (_ BitVec 32) V!23855 V!23855 (_ BitVec 32) Int) ListLongMap!8147)

(assert (=> b!813681 (= lt!364365 (getCurrentListMapNoExtraKeys!2139 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23855)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364364 () ListLongMap!8147)

(assert (=> b!813681 (= lt!364364 (getCurrentListMapNoExtraKeys!2139 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813682 () Bool)

(declare-fun res!555844 () Bool)

(assert (=> b!813682 (=> (not res!555844) (not e!450916))))

(declare-datatypes ((List!15156 0))(
  ( (Nil!15153) (Cons!15152 (h!16281 (_ BitVec 64)) (t!21473 List!15156)) )
))
(declare-fun arrayNoDuplicates!0 (array!44490 (_ BitVec 32) List!15156) Bool)

(assert (=> b!813682 (= res!555844 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15153))))

(declare-fun b!813683 () Bool)

(declare-fun res!555843 () Bool)

(assert (=> b!813683 (=> (not res!555843) (not e!450916))))

(assert (=> b!813683 (= res!555843 (and (= (size!21727 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21726 _keys!976) (size!21727 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813684 () Bool)

(declare-fun res!555845 () Bool)

(assert (=> b!813684 (=> (not res!555845) (not e!450916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44490 (_ BitVec 32)) Bool)

(assert (=> b!813684 (= res!555845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22792 () Bool)

(declare-fun mapRes!22792 () Bool)

(assert (=> mapIsEmpty!22792 mapRes!22792))

(declare-fun res!555846 () Bool)

(assert (=> start!70010 (=> (not res!555846) (not e!450916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70010 (= res!555846 (validMask!0 mask!1312))))

(assert (=> start!70010 e!450916))

(assert (=> start!70010 tp_is_empty!14141))

(declare-fun array_inv!17061 (array!44490) Bool)

(assert (=> start!70010 (array_inv!17061 _keys!976)))

(assert (=> start!70010 true))

(declare-fun e!450917 () Bool)

(declare-fun array_inv!17062 (array!44492) Bool)

(assert (=> start!70010 (and (array_inv!17062 _values!788) e!450917)))

(assert (=> start!70010 tp!44008))

(declare-fun mapNonEmpty!22792 () Bool)

(declare-fun tp!44007 () Bool)

(declare-fun e!450915 () Bool)

(assert (=> mapNonEmpty!22792 (= mapRes!22792 (and tp!44007 e!450915))))

(declare-fun mapRest!22792 () (Array (_ BitVec 32) ValueCell!6655))

(declare-fun mapValue!22792 () ValueCell!6655)

(declare-fun mapKey!22792 () (_ BitVec 32))

(assert (=> mapNonEmpty!22792 (= (arr!21306 _values!788) (store mapRest!22792 mapKey!22792 mapValue!22792))))

(declare-fun b!813685 () Bool)

(assert (=> b!813685 (= e!450915 tp_is_empty!14141)))

(declare-fun b!813686 () Bool)

(assert (=> b!813686 (= e!450917 (and e!450914 mapRes!22792))))

(declare-fun condMapEmpty!22792 () Bool)

(declare-fun mapDefault!22792 () ValueCell!6655)

