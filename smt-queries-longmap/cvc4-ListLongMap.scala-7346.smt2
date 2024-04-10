; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93784 () Bool)

(assert start!93784)

(declare-fun b_free!21257 () Bool)

(declare-fun b_next!21257 () Bool)

(assert (=> start!93784 (= b_free!21257 (not b_next!21257))))

(declare-fun tp!75193 () Bool)

(declare-fun b_and!33971 () Bool)

(assert (=> start!93784 (= tp!75193 b_and!33971)))

(declare-fun b!1060760 () Bool)

(declare-fun res!708434 () Bool)

(declare-fun e!603960 () Bool)

(assert (=> b!1060760 (=> (not res!708434) (not e!603960))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38557 0))(
  ( (V!38558 (val!12584 Int)) )
))
(declare-datatypes ((ValueCell!11830 0))(
  ( (ValueCellFull!11830 (v!15194 V!38557)) (EmptyCell!11830) )
))
(declare-datatypes ((array!67147 0))(
  ( (array!67148 (arr!32281 (Array (_ BitVec 32) ValueCell!11830)) (size!32817 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67147)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67149 0))(
  ( (array!67150 (arr!32282 (Array (_ BitVec 32) (_ BitVec 64))) (size!32818 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67149)

(assert (=> b!1060760 (= res!708434 (and (= (size!32817 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32818 _keys!1163) (size!32817 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060761 () Bool)

(assert (=> b!1060761 (= e!603960 false)))

(declare-datatypes ((tuple2!15902 0))(
  ( (tuple2!15903 (_1!7962 (_ BitVec 64)) (_2!7962 V!38557)) )
))
(declare-datatypes ((List!22488 0))(
  ( (Nil!22485) (Cons!22484 (h!23693 tuple2!15902) (t!31797 List!22488)) )
))
(declare-datatypes ((ListLongMap!13871 0))(
  ( (ListLongMap!13872 (toList!6951 List!22488)) )
))
(declare-fun lt!467371 () ListLongMap!13871)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38557)

(declare-fun minValue!907 () V!38557)

(declare-fun getCurrentListMapNoExtraKeys!3553 (array!67149 array!67147 (_ BitVec 32) (_ BitVec 32) V!38557 V!38557 (_ BitVec 32) Int) ListLongMap!13871)

(assert (=> b!1060761 (= lt!467371 (getCurrentListMapNoExtraKeys!3553 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38557)

(declare-fun lt!467370 () ListLongMap!13871)

(assert (=> b!1060761 (= lt!467370 (getCurrentListMapNoExtraKeys!3553 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060762 () Bool)

(declare-fun res!708435 () Bool)

(assert (=> b!1060762 (=> (not res!708435) (not e!603960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67149 (_ BitVec 32)) Bool)

(assert (=> b!1060762 (= res!708435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708436 () Bool)

(assert (=> start!93784 (=> (not res!708436) (not e!603960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93784 (= res!708436 (validMask!0 mask!1515))))

(assert (=> start!93784 e!603960))

(assert (=> start!93784 true))

(declare-fun tp_is_empty!25067 () Bool)

(assert (=> start!93784 tp_is_empty!25067))

(declare-fun e!603959 () Bool)

(declare-fun array_inv!25014 (array!67147) Bool)

(assert (=> start!93784 (and (array_inv!25014 _values!955) e!603959)))

(assert (=> start!93784 tp!75193))

(declare-fun array_inv!25015 (array!67149) Bool)

(assert (=> start!93784 (array_inv!25015 _keys!1163)))

(declare-fun b!1060763 () Bool)

(declare-fun e!603963 () Bool)

(assert (=> b!1060763 (= e!603963 tp_is_empty!25067)))

(declare-fun mapIsEmpty!39271 () Bool)

(declare-fun mapRes!39271 () Bool)

(assert (=> mapIsEmpty!39271 mapRes!39271))

(declare-fun mapNonEmpty!39271 () Bool)

(declare-fun tp!75194 () Bool)

(declare-fun e!603962 () Bool)

(assert (=> mapNonEmpty!39271 (= mapRes!39271 (and tp!75194 e!603962))))

(declare-fun mapValue!39271 () ValueCell!11830)

(declare-fun mapKey!39271 () (_ BitVec 32))

(declare-fun mapRest!39271 () (Array (_ BitVec 32) ValueCell!11830))

(assert (=> mapNonEmpty!39271 (= (arr!32281 _values!955) (store mapRest!39271 mapKey!39271 mapValue!39271))))

(declare-fun b!1060764 () Bool)

(declare-fun res!708433 () Bool)

(assert (=> b!1060764 (=> (not res!708433) (not e!603960))))

(declare-datatypes ((List!22489 0))(
  ( (Nil!22486) (Cons!22485 (h!23694 (_ BitVec 64)) (t!31798 List!22489)) )
))
(declare-fun arrayNoDuplicates!0 (array!67149 (_ BitVec 32) List!22489) Bool)

(assert (=> b!1060764 (= res!708433 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22486))))

(declare-fun b!1060765 () Bool)

(assert (=> b!1060765 (= e!603962 tp_is_empty!25067)))

(declare-fun b!1060766 () Bool)

(assert (=> b!1060766 (= e!603959 (and e!603963 mapRes!39271))))

(declare-fun condMapEmpty!39271 () Bool)

(declare-fun mapDefault!39271 () ValueCell!11830)

