; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93990 () Bool)

(assert start!93990)

(declare-fun b_free!21427 () Bool)

(declare-fun b_next!21427 () Bool)

(assert (=> start!93990 (= b_free!21427 (not b_next!21427))))

(declare-fun tp!75709 () Bool)

(declare-fun b_and!34159 () Bool)

(assert (=> start!93990 (= tp!75709 b_and!34159)))

(declare-fun mapNonEmpty!39532 () Bool)

(declare-fun mapRes!39532 () Bool)

(declare-fun tp!75710 () Bool)

(declare-fun e!605601 () Bool)

(assert (=> mapNonEmpty!39532 (= mapRes!39532 (and tp!75710 e!605601))))

(declare-fun mapKey!39532 () (_ BitVec 32))

(declare-datatypes ((V!38785 0))(
  ( (V!38786 (val!12669 Int)) )
))
(declare-datatypes ((ValueCell!11915 0))(
  ( (ValueCellFull!11915 (v!15280 V!38785)) (EmptyCell!11915) )
))
(declare-datatypes ((array!67475 0))(
  ( (array!67476 (arr!32443 (Array (_ BitVec 32) ValueCell!11915)) (size!32979 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67475)

(declare-fun mapValue!39532 () ValueCell!11915)

(declare-fun mapRest!39532 () (Array (_ BitVec 32) ValueCell!11915))

(assert (=> mapNonEmpty!39532 (= (arr!32443 _values!955) (store mapRest!39532 mapKey!39532 mapValue!39532))))

(declare-fun res!709756 () Bool)

(declare-fun e!605604 () Bool)

(assert (=> start!93990 (=> (not res!709756) (not e!605604))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93990 (= res!709756 (validMask!0 mask!1515))))

(assert (=> start!93990 e!605604))

(assert (=> start!93990 true))

(declare-fun tp_is_empty!25237 () Bool)

(assert (=> start!93990 tp_is_empty!25237))

(declare-fun e!605606 () Bool)

(declare-fun array_inv!25132 (array!67475) Bool)

(assert (=> start!93990 (and (array_inv!25132 _values!955) e!605606)))

(assert (=> start!93990 tp!75709))

(declare-datatypes ((array!67477 0))(
  ( (array!67478 (arr!32444 (Array (_ BitVec 32) (_ BitVec 64))) (size!32980 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67477)

(declare-fun array_inv!25133 (array!67477) Bool)

(assert (=> start!93990 (array_inv!25133 _keys!1163)))

(declare-fun b!1062998 () Bool)

(declare-fun e!605600 () Bool)

(assert (=> b!1062998 (= e!605604 (not e!605600))))

(declare-fun res!709760 () Bool)

(assert (=> b!1062998 (=> res!709760 e!605600)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062998 (= res!709760 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16032 0))(
  ( (tuple2!16033 (_1!8027 (_ BitVec 64)) (_2!8027 V!38785)) )
))
(declare-datatypes ((List!22613 0))(
  ( (Nil!22610) (Cons!22609 (h!23818 tuple2!16032) (t!31926 List!22613)) )
))
(declare-datatypes ((ListLongMap!14001 0))(
  ( (ListLongMap!14002 (toList!7016 List!22613)) )
))
(declare-fun lt!468448 () ListLongMap!14001)

(declare-fun lt!468447 () ListLongMap!14001)

(assert (=> b!1062998 (= lt!468448 lt!468447)))

(declare-fun zeroValueBefore!47 () V!38785)

(declare-datatypes ((Unit!34832 0))(
  ( (Unit!34833) )
))
(declare-fun lt!468449 () Unit!34832)

(declare-fun minValue!907 () V!38785)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38785)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!646 (array!67477 array!67475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38785 V!38785 V!38785 V!38785 (_ BitVec 32) Int) Unit!34832)

(assert (=> b!1062998 (= lt!468449 (lemmaNoChangeToArrayThenSameMapNoExtras!646 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3609 (array!67477 array!67475 (_ BitVec 32) (_ BitVec 32) V!38785 V!38785 (_ BitVec 32) Int) ListLongMap!14001)

(assert (=> b!1062998 (= lt!468447 (getCurrentListMapNoExtraKeys!3609 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062998 (= lt!468448 (getCurrentListMapNoExtraKeys!3609 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39532 () Bool)

(assert (=> mapIsEmpty!39532 mapRes!39532))

(declare-fun b!1062999 () Bool)

(declare-fun res!709758 () Bool)

(assert (=> b!1062999 (=> (not res!709758) (not e!605604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67477 (_ BitVec 32)) Bool)

(assert (=> b!1062999 (= res!709758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063000 () Bool)

(declare-fun e!605605 () Bool)

(assert (=> b!1063000 (= e!605605 true)))

(declare-fun lt!468450 () ListLongMap!14001)

(declare-fun -!579 (ListLongMap!14001 (_ BitVec 64)) ListLongMap!14001)

(assert (=> b!1063000 (= (-!579 lt!468450 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468450)))

(declare-fun lt!468446 () Unit!34832)

(declare-fun removeNotPresentStillSame!26 (ListLongMap!14001 (_ BitVec 64)) Unit!34832)

(assert (=> b!1063000 (= lt!468446 (removeNotPresentStillSame!26 lt!468450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063001 () Bool)

(declare-fun e!605603 () Bool)

(assert (=> b!1063001 (= e!605606 (and e!605603 mapRes!39532))))

(declare-fun condMapEmpty!39532 () Bool)

(declare-fun mapDefault!39532 () ValueCell!11915)

