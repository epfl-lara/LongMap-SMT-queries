; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93810 () Bool)

(assert start!93810)

(declare-fun b_free!21283 () Bool)

(declare-fun b_next!21283 () Bool)

(assert (=> start!93810 (= b_free!21283 (not b_next!21283))))

(declare-fun tp!75272 () Bool)

(declare-fun b_and!33997 () Bool)

(assert (=> start!93810 (= tp!75272 b_and!33997)))

(declare-fun b!1061033 () Bool)

(declare-fun e!604156 () Bool)

(assert (=> b!1061033 (= e!604156 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38593 0))(
  ( (V!38594 (val!12597 Int)) )
))
(declare-datatypes ((ValueCell!11843 0))(
  ( (ValueCellFull!11843 (v!15207 V!38593)) (EmptyCell!11843) )
))
(declare-datatypes ((array!67195 0))(
  ( (array!67196 (arr!32305 (Array (_ BitVec 32) ValueCell!11843)) (size!32841 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67195)

(declare-datatypes ((tuple2!15918 0))(
  ( (tuple2!15919 (_1!7970 (_ BitVec 64)) (_2!7970 V!38593)) )
))
(declare-datatypes ((List!22505 0))(
  ( (Nil!22502) (Cons!22501 (h!23710 tuple2!15918) (t!31814 List!22505)) )
))
(declare-datatypes ((ListLongMap!13887 0))(
  ( (ListLongMap!13888 (toList!6959 List!22505)) )
))
(declare-fun lt!467448 () ListLongMap!13887)

(declare-fun minValue!907 () V!38593)

(declare-datatypes ((array!67197 0))(
  ( (array!67198 (arr!32306 (Array (_ BitVec 32) (_ BitVec 64))) (size!32842 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67197)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38593)

(declare-fun getCurrentListMapNoExtraKeys!3561 (array!67197 array!67195 (_ BitVec 32) (_ BitVec 32) V!38593 V!38593 (_ BitVec 32) Int) ListLongMap!13887)

(assert (=> b!1061033 (= lt!467448 (getCurrentListMapNoExtraKeys!3561 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38593)

(declare-fun lt!467449 () ListLongMap!13887)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061033 (= lt!467449 (getCurrentListMapNoExtraKeys!3561 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!708590 () Bool)

(assert (=> start!93810 (=> (not res!708590) (not e!604156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93810 (= res!708590 (validMask!0 mask!1515))))

(assert (=> start!93810 e!604156))

(assert (=> start!93810 true))

(declare-fun tp_is_empty!25093 () Bool)

(assert (=> start!93810 tp_is_empty!25093))

(declare-fun e!604154 () Bool)

(declare-fun array_inv!25036 (array!67195) Bool)

(assert (=> start!93810 (and (array_inv!25036 _values!955) e!604154)))

(assert (=> start!93810 tp!75272))

(declare-fun array_inv!25037 (array!67197) Bool)

(assert (=> start!93810 (array_inv!25037 _keys!1163)))

(declare-fun mapIsEmpty!39310 () Bool)

(declare-fun mapRes!39310 () Bool)

(assert (=> mapIsEmpty!39310 mapRes!39310))

(declare-fun b!1061034 () Bool)

(declare-fun e!604157 () Bool)

(assert (=> b!1061034 (= e!604157 tp_is_empty!25093)))

(declare-fun b!1061035 () Bool)

(declare-fun res!708591 () Bool)

(assert (=> b!1061035 (=> (not res!708591) (not e!604156))))

(declare-datatypes ((List!22506 0))(
  ( (Nil!22503) (Cons!22502 (h!23711 (_ BitVec 64)) (t!31815 List!22506)) )
))
(declare-fun arrayNoDuplicates!0 (array!67197 (_ BitVec 32) List!22506) Bool)

(assert (=> b!1061035 (= res!708591 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22503))))

(declare-fun b!1061036 () Bool)

(declare-fun res!708589 () Bool)

(assert (=> b!1061036 (=> (not res!708589) (not e!604156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67197 (_ BitVec 32)) Bool)

(assert (=> b!1061036 (= res!708589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061037 () Bool)

(assert (=> b!1061037 (= e!604154 (and e!604157 mapRes!39310))))

(declare-fun condMapEmpty!39310 () Bool)

(declare-fun mapDefault!39310 () ValueCell!11843)

