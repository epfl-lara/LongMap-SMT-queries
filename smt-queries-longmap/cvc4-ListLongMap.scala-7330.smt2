; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93666 () Bool)

(assert start!93666)

(declare-fun b!1059663 () Bool)

(declare-fun e!603164 () Bool)

(declare-fun tp_is_empty!24971 () Bool)

(assert (=> b!1059663 (= e!603164 tp_is_empty!24971)))

(declare-fun b!1059664 () Bool)

(declare-fun res!707836 () Bool)

(declare-fun e!603167 () Bool)

(assert (=> b!1059664 (=> (not res!707836) (not e!603167))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38429 0))(
  ( (V!38430 (val!12536 Int)) )
))
(declare-datatypes ((ValueCell!11782 0))(
  ( (ValueCellFull!11782 (v!15146 V!38429)) (EmptyCell!11782) )
))
(declare-datatypes ((array!66969 0))(
  ( (array!66970 (arr!32194 (Array (_ BitVec 32) ValueCell!11782)) (size!32730 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66969)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66971 0))(
  ( (array!66972 (arr!32195 (Array (_ BitVec 32) (_ BitVec 64))) (size!32731 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66971)

(assert (=> b!1059664 (= res!707836 (and (= (size!32730 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32731 _keys!1163) (size!32730 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059665 () Bool)

(declare-fun e!603168 () Bool)

(assert (=> b!1059665 (= e!603168 tp_is_empty!24971)))

(declare-fun b!1059666 () Bool)

(declare-fun res!707835 () Bool)

(assert (=> b!1059666 (=> (not res!707835) (not e!603167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66971 (_ BitVec 32)) Bool)

(assert (=> b!1059666 (= res!707835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!707834 () Bool)

(assert (=> start!93666 (=> (not res!707834) (not e!603167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93666 (= res!707834 (validMask!0 mask!1515))))

(assert (=> start!93666 e!603167))

(assert (=> start!93666 true))

(declare-fun e!603166 () Bool)

(declare-fun array_inv!24956 (array!66969) Bool)

(assert (=> start!93666 (and (array_inv!24956 _values!955) e!603166)))

(declare-fun array_inv!24957 (array!66971) Bool)

(assert (=> start!93666 (array_inv!24957 _keys!1163)))

(declare-fun mapNonEmpty!39121 () Bool)

(declare-fun mapRes!39121 () Bool)

(declare-fun tp!74927 () Bool)

(assert (=> mapNonEmpty!39121 (= mapRes!39121 (and tp!74927 e!603164))))

(declare-fun mapRest!39121 () (Array (_ BitVec 32) ValueCell!11782))

(declare-fun mapValue!39121 () ValueCell!11782)

(declare-fun mapKey!39121 () (_ BitVec 32))

(assert (=> mapNonEmpty!39121 (= (arr!32194 _values!955) (store mapRest!39121 mapKey!39121 mapValue!39121))))

(declare-fun b!1059667 () Bool)

(assert (=> b!1059667 (= e!603167 false)))

(declare-fun lt!467161 () Bool)

(declare-datatypes ((List!22438 0))(
  ( (Nil!22435) (Cons!22434 (h!23643 (_ BitVec 64)) (t!31745 List!22438)) )
))
(declare-fun arrayNoDuplicates!0 (array!66971 (_ BitVec 32) List!22438) Bool)

(assert (=> b!1059667 (= lt!467161 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22435))))

(declare-fun b!1059668 () Bool)

(assert (=> b!1059668 (= e!603166 (and e!603168 mapRes!39121))))

(declare-fun condMapEmpty!39121 () Bool)

(declare-fun mapDefault!39121 () ValueCell!11782)

