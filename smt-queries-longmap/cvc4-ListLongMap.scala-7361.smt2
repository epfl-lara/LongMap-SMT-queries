; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93874 () Bool)

(assert start!93874)

(declare-fun b_free!21347 () Bool)

(declare-fun b_next!21347 () Bool)

(assert (=> start!93874 (= b_free!21347 (not b_next!21347))))

(declare-fun tp!75464 () Bool)

(declare-fun b_and!34061 () Bool)

(assert (=> start!93874 (= tp!75464 b_and!34061)))

(declare-fun b!1061705 () Bool)

(declare-fun e!604635 () Bool)

(assert (=> b!1061705 (= e!604635 (not true))))

(declare-datatypes ((V!38677 0))(
  ( (V!38678 (val!12629 Int)) )
))
(declare-datatypes ((tuple2!15964 0))(
  ( (tuple2!15965 (_1!7993 (_ BitVec 64)) (_2!7993 V!38677)) )
))
(declare-datatypes ((List!22549 0))(
  ( (Nil!22546) (Cons!22545 (h!23754 tuple2!15964) (t!31858 List!22549)) )
))
(declare-datatypes ((ListLongMap!13933 0))(
  ( (ListLongMap!13934 (toList!6982 List!22549)) )
))
(declare-fun lt!467711 () ListLongMap!13933)

(declare-fun lt!467713 () ListLongMap!13933)

(assert (=> b!1061705 (= lt!467711 lt!467713)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38677)

(declare-datatypes ((ValueCell!11875 0))(
  ( (ValueCellFull!11875 (v!15239 V!38677)) (EmptyCell!11875) )
))
(declare-datatypes ((array!67317 0))(
  ( (array!67318 (arr!32366 (Array (_ BitVec 32) ValueCell!11875)) (size!32902 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67317)

(declare-fun minValue!907 () V!38677)

(declare-datatypes ((Unit!34766 0))(
  ( (Unit!34767) )
))
(declare-fun lt!467712 () Unit!34766)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38677)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67319 0))(
  ( (array!67320 (arr!32367 (Array (_ BitVec 32) (_ BitVec 64))) (size!32903 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67319)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!621 (array!67319 array!67317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38677 V!38677 V!38677 V!38677 (_ BitVec 32) Int) Unit!34766)

(assert (=> b!1061705 (= lt!467712 (lemmaNoChangeToArrayThenSameMapNoExtras!621 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3584 (array!67319 array!67317 (_ BitVec 32) (_ BitVec 32) V!38677 V!38677 (_ BitVec 32) Int) ListLongMap!13933)

(assert (=> b!1061705 (= lt!467713 (getCurrentListMapNoExtraKeys!3584 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061705 (= lt!467711 (getCurrentListMapNoExtraKeys!3584 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061706 () Bool)

(declare-fun res!708973 () Bool)

(assert (=> b!1061706 (=> (not res!708973) (not e!604635))))

(declare-datatypes ((List!22550 0))(
  ( (Nil!22547) (Cons!22546 (h!23755 (_ BitVec 64)) (t!31859 List!22550)) )
))
(declare-fun arrayNoDuplicates!0 (array!67319 (_ BitVec 32) List!22550) Bool)

(assert (=> b!1061706 (= res!708973 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22547))))

(declare-fun res!708975 () Bool)

(assert (=> start!93874 (=> (not res!708975) (not e!604635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93874 (= res!708975 (validMask!0 mask!1515))))

(assert (=> start!93874 e!604635))

(assert (=> start!93874 true))

(declare-fun tp_is_empty!25157 () Bool)

(assert (=> start!93874 tp_is_empty!25157))

(declare-fun e!604636 () Bool)

(declare-fun array_inv!25078 (array!67317) Bool)

(assert (=> start!93874 (and (array_inv!25078 _values!955) e!604636)))

(assert (=> start!93874 tp!75464))

(declare-fun array_inv!25079 (array!67319) Bool)

(assert (=> start!93874 (array_inv!25079 _keys!1163)))

(declare-fun mapNonEmpty!39406 () Bool)

(declare-fun mapRes!39406 () Bool)

(declare-fun tp!75463 () Bool)

(declare-fun e!604634 () Bool)

(assert (=> mapNonEmpty!39406 (= mapRes!39406 (and tp!75463 e!604634))))

(declare-fun mapKey!39406 () (_ BitVec 32))

(declare-fun mapRest!39406 () (Array (_ BitVec 32) ValueCell!11875))

(declare-fun mapValue!39406 () ValueCell!11875)

(assert (=> mapNonEmpty!39406 (= (arr!32366 _values!955) (store mapRest!39406 mapKey!39406 mapValue!39406))))

(declare-fun mapIsEmpty!39406 () Bool)

(assert (=> mapIsEmpty!39406 mapRes!39406))

(declare-fun b!1061707 () Bool)

(declare-fun e!604637 () Bool)

(assert (=> b!1061707 (= e!604637 tp_is_empty!25157)))

(declare-fun b!1061708 () Bool)

(declare-fun res!708974 () Bool)

(assert (=> b!1061708 (=> (not res!708974) (not e!604635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67319 (_ BitVec 32)) Bool)

(assert (=> b!1061708 (= res!708974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061709 () Bool)

(assert (=> b!1061709 (= e!604634 tp_is_empty!25157)))

(declare-fun b!1061710 () Bool)

(assert (=> b!1061710 (= e!604636 (and e!604637 mapRes!39406))))

(declare-fun condMapEmpty!39406 () Bool)

(declare-fun mapDefault!39406 () ValueCell!11875)

