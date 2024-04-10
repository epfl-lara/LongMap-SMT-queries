; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93942 () Bool)

(assert start!93942)

(declare-fun b_free!21401 () Bool)

(declare-fun b_next!21401 () Bool)

(assert (=> start!93942 (= b_free!21401 (not b_next!21401))))

(declare-fun tp!75628 () Bool)

(declare-fun b_and!34123 () Bool)

(assert (=> start!93942 (= tp!75628 b_and!34123)))

(declare-fun b!1062490 () Bool)

(declare-fun e!605231 () Bool)

(declare-fun e!605227 () Bool)

(assert (=> b!1062490 (= e!605231 (not e!605227))))

(declare-fun res!709463 () Bool)

(assert (=> b!1062490 (=> res!709463 e!605227)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062490 (= res!709463 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38749 0))(
  ( (V!38750 (val!12656 Int)) )
))
(declare-datatypes ((tuple2!16012 0))(
  ( (tuple2!16013 (_1!8017 (_ BitVec 64)) (_2!8017 V!38749)) )
))
(declare-datatypes ((List!22595 0))(
  ( (Nil!22592) (Cons!22591 (h!23800 tuple2!16012) (t!31906 List!22595)) )
))
(declare-datatypes ((ListLongMap!13981 0))(
  ( (ListLongMap!13982 (toList!7006 List!22595)) )
))
(declare-fun lt!468127 () ListLongMap!13981)

(declare-fun lt!468130 () ListLongMap!13981)

(assert (=> b!1062490 (= lt!468127 lt!468130)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38749)

(declare-datatypes ((Unit!34810 0))(
  ( (Unit!34811) )
))
(declare-fun lt!468128 () Unit!34810)

(declare-datatypes ((ValueCell!11902 0))(
  ( (ValueCellFull!11902 (v!15266 V!38749)) (EmptyCell!11902) )
))
(declare-datatypes ((array!67425 0))(
  ( (array!67426 (arr!32419 (Array (_ BitVec 32) ValueCell!11902)) (size!32955 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67425)

(declare-fun minValue!907 () V!38749)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38749)

(declare-datatypes ((array!67427 0))(
  ( (array!67428 (arr!32420 (Array (_ BitVec 32) (_ BitVec 64))) (size!32956 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67427)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!639 (array!67427 array!67425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38749 V!38749 V!38749 V!38749 (_ BitVec 32) Int) Unit!34810)

(assert (=> b!1062490 (= lt!468128 (lemmaNoChangeToArrayThenSameMapNoExtras!639 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3602 (array!67427 array!67425 (_ BitVec 32) (_ BitVec 32) V!38749 V!38749 (_ BitVec 32) Int) ListLongMap!13981)

(assert (=> b!1062490 (= lt!468130 (getCurrentListMapNoExtraKeys!3602 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062490 (= lt!468127 (getCurrentListMapNoExtraKeys!3602 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062491 () Bool)

(declare-fun e!605229 () Bool)

(declare-fun tp_is_empty!25211 () Bool)

(assert (=> b!1062491 (= e!605229 tp_is_empty!25211)))

(declare-fun b!1062492 () Bool)

(declare-fun e!605233 () Bool)

(assert (=> b!1062492 (= e!605233 tp_is_empty!25211)))

(declare-fun b!1062493 () Bool)

(declare-fun e!605228 () Bool)

(assert (=> b!1062493 (= e!605228 true)))

(declare-fun lt!468131 () ListLongMap!13981)

(declare-fun -!570 (ListLongMap!13981 (_ BitVec 64)) ListLongMap!13981)

(assert (=> b!1062493 (= (-!570 lt!468131 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468131)))

(declare-fun lt!468129 () Unit!34810)

(declare-fun removeNotPresentStillSame!17 (ListLongMap!13981 (_ BitVec 64)) Unit!34810)

(assert (=> b!1062493 (= lt!468129 (removeNotPresentStillSame!17 lt!468131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!39490 () Bool)

(declare-fun mapRes!39490 () Bool)

(declare-fun tp!75629 () Bool)

(assert (=> mapNonEmpty!39490 (= mapRes!39490 (and tp!75629 e!605229))))

(declare-fun mapValue!39490 () ValueCell!11902)

(declare-fun mapKey!39490 () (_ BitVec 32))

(declare-fun mapRest!39490 () (Array (_ BitVec 32) ValueCell!11902))

(assert (=> mapNonEmpty!39490 (= (arr!32419 _values!955) (store mapRest!39490 mapKey!39490 mapValue!39490))))

(declare-fun b!1062494 () Bool)

(declare-fun res!709465 () Bool)

(assert (=> b!1062494 (=> (not res!709465) (not e!605231))))

(assert (=> b!1062494 (= res!709465 (and (= (size!32955 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32956 _keys!1163) (size!32955 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709464 () Bool)

(assert (=> start!93942 (=> (not res!709464) (not e!605231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93942 (= res!709464 (validMask!0 mask!1515))))

(assert (=> start!93942 e!605231))

(assert (=> start!93942 true))

(assert (=> start!93942 tp_is_empty!25211))

(declare-fun e!605232 () Bool)

(declare-fun array_inv!25114 (array!67425) Bool)

(assert (=> start!93942 (and (array_inv!25114 _values!955) e!605232)))

(assert (=> start!93942 tp!75628))

(declare-fun array_inv!25115 (array!67427) Bool)

(assert (=> start!93942 (array_inv!25115 _keys!1163)))

(declare-fun mapIsEmpty!39490 () Bool)

(assert (=> mapIsEmpty!39490 mapRes!39490))

(declare-fun b!1062495 () Bool)

(declare-fun res!709462 () Bool)

(assert (=> b!1062495 (=> (not res!709462) (not e!605231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67427 (_ BitVec 32)) Bool)

(assert (=> b!1062495 (= res!709462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062496 () Bool)

(assert (=> b!1062496 (= e!605227 e!605228)))

(declare-fun res!709461 () Bool)

(assert (=> b!1062496 (=> res!709461 e!605228)))

(declare-fun contains!6238 (ListLongMap!13981 (_ BitVec 64)) Bool)

(assert (=> b!1062496 (= res!709461 (contains!6238 lt!468131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3991 (array!67427 array!67425 (_ BitVec 32) (_ BitVec 32) V!38749 V!38749 (_ BitVec 32) Int) ListLongMap!13981)

(assert (=> b!1062496 (= lt!468131 (getCurrentListMap!3991 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062497 () Bool)

(assert (=> b!1062497 (= e!605232 (and e!605233 mapRes!39490))))

(declare-fun condMapEmpty!39490 () Bool)

(declare-fun mapDefault!39490 () ValueCell!11902)

