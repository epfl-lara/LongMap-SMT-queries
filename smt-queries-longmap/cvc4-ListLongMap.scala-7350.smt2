; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93808 () Bool)

(assert start!93808)

(declare-fun b_free!21281 () Bool)

(declare-fun b_next!21281 () Bool)

(assert (=> start!93808 (= b_free!21281 (not b_next!21281))))

(declare-fun tp!75265 () Bool)

(declare-fun b_and!33995 () Bool)

(assert (=> start!93808 (= tp!75265 b_and!33995)))

(declare-fun mapNonEmpty!39307 () Bool)

(declare-fun mapRes!39307 () Bool)

(declare-fun tp!75266 () Bool)

(declare-fun e!604140 () Bool)

(assert (=> mapNonEmpty!39307 (= mapRes!39307 (and tp!75266 e!604140))))

(declare-datatypes ((V!38589 0))(
  ( (V!38590 (val!12596 Int)) )
))
(declare-datatypes ((ValueCell!11842 0))(
  ( (ValueCellFull!11842 (v!15206 V!38589)) (EmptyCell!11842) )
))
(declare-fun mapRest!39307 () (Array (_ BitVec 32) ValueCell!11842))

(declare-datatypes ((array!67191 0))(
  ( (array!67192 (arr!32303 (Array (_ BitVec 32) ValueCell!11842)) (size!32839 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67191)

(declare-fun mapValue!39307 () ValueCell!11842)

(declare-fun mapKey!39307 () (_ BitVec 32))

(assert (=> mapNonEmpty!39307 (= (arr!32303 _values!955) (store mapRest!39307 mapKey!39307 mapValue!39307))))

(declare-fun mapIsEmpty!39307 () Bool)

(assert (=> mapIsEmpty!39307 mapRes!39307))

(declare-fun b!1061012 () Bool)

(declare-fun e!604141 () Bool)

(declare-fun tp_is_empty!25091 () Bool)

(assert (=> b!1061012 (= e!604141 tp_is_empty!25091)))

(declare-fun res!708577 () Bool)

(declare-fun e!604139 () Bool)

(assert (=> start!93808 (=> (not res!708577) (not e!604139))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93808 (= res!708577 (validMask!0 mask!1515))))

(assert (=> start!93808 e!604139))

(assert (=> start!93808 true))

(assert (=> start!93808 tp_is_empty!25091))

(declare-fun e!604142 () Bool)

(declare-fun array_inv!25034 (array!67191) Bool)

(assert (=> start!93808 (and (array_inv!25034 _values!955) e!604142)))

(assert (=> start!93808 tp!75265))

(declare-datatypes ((array!67193 0))(
  ( (array!67194 (arr!32304 (Array (_ BitVec 32) (_ BitVec 64))) (size!32840 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67193)

(declare-fun array_inv!25035 (array!67193) Bool)

(assert (=> start!93808 (array_inv!25035 _keys!1163)))

(declare-fun b!1061013 () Bool)

(assert (=> b!1061013 (= e!604140 tp_is_empty!25091)))

(declare-fun b!1061014 () Bool)

(declare-fun res!708580 () Bool)

(assert (=> b!1061014 (=> (not res!708580) (not e!604139))))

(declare-datatypes ((List!22503 0))(
  ( (Nil!22500) (Cons!22499 (h!23708 (_ BitVec 64)) (t!31812 List!22503)) )
))
(declare-fun arrayNoDuplicates!0 (array!67193 (_ BitVec 32) List!22503) Bool)

(assert (=> b!1061014 (= res!708580 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22500))))

(declare-fun b!1061015 () Bool)

(assert (=> b!1061015 (= e!604139 false)))

(declare-datatypes ((tuple2!15916 0))(
  ( (tuple2!15917 (_1!7969 (_ BitVec 64)) (_2!7969 V!38589)) )
))
(declare-datatypes ((List!22504 0))(
  ( (Nil!22501) (Cons!22500 (h!23709 tuple2!15916) (t!31813 List!22504)) )
))
(declare-datatypes ((ListLongMap!13885 0))(
  ( (ListLongMap!13886 (toList!6958 List!22504)) )
))
(declare-fun lt!467443 () ListLongMap!13885)

(declare-fun minValue!907 () V!38589)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38589)

(declare-fun getCurrentListMapNoExtraKeys!3560 (array!67193 array!67191 (_ BitVec 32) (_ BitVec 32) V!38589 V!38589 (_ BitVec 32) Int) ListLongMap!13885)

(assert (=> b!1061015 (= lt!467443 (getCurrentListMapNoExtraKeys!3560 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!467442 () ListLongMap!13885)

(declare-fun zeroValueBefore!47 () V!38589)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061015 (= lt!467442 (getCurrentListMapNoExtraKeys!3560 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061016 () Bool)

(declare-fun res!708579 () Bool)

(assert (=> b!1061016 (=> (not res!708579) (not e!604139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67193 (_ BitVec 32)) Bool)

(assert (=> b!1061016 (= res!708579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061017 () Bool)

(declare-fun res!708578 () Bool)

(assert (=> b!1061017 (=> (not res!708578) (not e!604139))))

(assert (=> b!1061017 (= res!708578 (and (= (size!32839 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32840 _keys!1163) (size!32839 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061018 () Bool)

(assert (=> b!1061018 (= e!604142 (and e!604141 mapRes!39307))))

(declare-fun condMapEmpty!39307 () Bool)

(declare-fun mapDefault!39307 () ValueCell!11842)

