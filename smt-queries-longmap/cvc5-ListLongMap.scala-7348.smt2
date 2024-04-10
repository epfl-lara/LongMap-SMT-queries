; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93792 () Bool)

(assert start!93792)

(declare-fun b_free!21265 () Bool)

(declare-fun b_next!21265 () Bool)

(assert (=> start!93792 (= b_free!21265 (not b_next!21265))))

(declare-fun tp!75218 () Bool)

(declare-fun b_and!33979 () Bool)

(assert (=> start!93792 (= tp!75218 b_and!33979)))

(declare-fun b!1060844 () Bool)

(declare-fun res!708483 () Bool)

(declare-fun e!604021 () Bool)

(assert (=> b!1060844 (=> (not res!708483) (not e!604021))))

(declare-datatypes ((array!67161 0))(
  ( (array!67162 (arr!32288 (Array (_ BitVec 32) (_ BitVec 64))) (size!32824 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67161)

(declare-datatypes ((List!22492 0))(
  ( (Nil!22489) (Cons!22488 (h!23697 (_ BitVec 64)) (t!31801 List!22492)) )
))
(declare-fun arrayNoDuplicates!0 (array!67161 (_ BitVec 32) List!22492) Bool)

(assert (=> b!1060844 (= res!708483 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22489))))

(declare-fun b!1060845 () Bool)

(declare-fun e!604022 () Bool)

(declare-fun tp_is_empty!25075 () Bool)

(assert (=> b!1060845 (= e!604022 tp_is_empty!25075)))

(declare-fun b!1060846 () Bool)

(declare-fun res!708484 () Bool)

(assert (=> b!1060846 (=> (not res!708484) (not e!604021))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67161 (_ BitVec 32)) Bool)

(assert (=> b!1060846 (= res!708484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39283 () Bool)

(declare-fun mapRes!39283 () Bool)

(assert (=> mapIsEmpty!39283 mapRes!39283))

(declare-fun mapNonEmpty!39283 () Bool)

(declare-fun tp!75217 () Bool)

(declare-fun e!604023 () Bool)

(assert (=> mapNonEmpty!39283 (= mapRes!39283 (and tp!75217 e!604023))))

(declare-datatypes ((V!38569 0))(
  ( (V!38570 (val!12588 Int)) )
))
(declare-datatypes ((ValueCell!11834 0))(
  ( (ValueCellFull!11834 (v!15198 V!38569)) (EmptyCell!11834) )
))
(declare-fun mapRest!39283 () (Array (_ BitVec 32) ValueCell!11834))

(declare-fun mapKey!39283 () (_ BitVec 32))

(declare-datatypes ((array!67163 0))(
  ( (array!67164 (arr!32289 (Array (_ BitVec 32) ValueCell!11834)) (size!32825 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67163)

(declare-fun mapValue!39283 () ValueCell!11834)

(assert (=> mapNonEmpty!39283 (= (arr!32289 _values!955) (store mapRest!39283 mapKey!39283 mapValue!39283))))

(declare-fun b!1060847 () Bool)

(assert (=> b!1060847 (= e!604023 tp_is_empty!25075)))

(declare-fun res!708481 () Bool)

(assert (=> start!93792 (=> (not res!708481) (not e!604021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93792 (= res!708481 (validMask!0 mask!1515))))

(assert (=> start!93792 e!604021))

(assert (=> start!93792 true))

(assert (=> start!93792 tp_is_empty!25075))

(declare-fun e!604019 () Bool)

(declare-fun array_inv!25020 (array!67163) Bool)

(assert (=> start!93792 (and (array_inv!25020 _values!955) e!604019)))

(assert (=> start!93792 tp!75218))

(declare-fun array_inv!25021 (array!67161) Bool)

(assert (=> start!93792 (array_inv!25021 _keys!1163)))

(declare-fun b!1060848 () Bool)

(declare-fun res!708482 () Bool)

(assert (=> b!1060848 (=> (not res!708482) (not e!604021))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060848 (= res!708482 (and (= (size!32825 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32824 _keys!1163) (size!32825 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060849 () Bool)

(assert (=> b!1060849 (= e!604019 (and e!604022 mapRes!39283))))

(declare-fun condMapEmpty!39283 () Bool)

(declare-fun mapDefault!39283 () ValueCell!11834)

