; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94458 () Bool)

(assert start!94458)

(declare-fun b_free!21785 () Bool)

(declare-fun b_next!21785 () Bool)

(assert (=> start!94458 (= b_free!21785 (not b_next!21785))))

(declare-fun tp!76802 () Bool)

(declare-fun b_and!34577 () Bool)

(assert (=> start!94458 (= tp!76802 b_and!34577)))

(declare-fun res!712752 () Bool)

(declare-fun e!609331 () Bool)

(assert (=> start!94458 (=> (not res!712752) (not e!609331))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94458 (= res!712752 (validMask!0 mask!1515))))

(assert (=> start!94458 e!609331))

(assert (=> start!94458 true))

(declare-fun tp_is_empty!25595 () Bool)

(assert (=> start!94458 tp_is_empty!25595))

(declare-datatypes ((V!39261 0))(
  ( (V!39262 (val!12848 Int)) )
))
(declare-datatypes ((ValueCell!12094 0))(
  ( (ValueCellFull!12094 (v!15462 V!39261)) (EmptyCell!12094) )
))
(declare-datatypes ((array!68173 0))(
  ( (array!68174 (arr!32786 (Array (_ BitVec 32) ValueCell!12094)) (size!33322 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68173)

(declare-fun e!609326 () Bool)

(declare-fun array_inv!25382 (array!68173) Bool)

(assert (=> start!94458 (and (array_inv!25382 _values!955) e!609326)))

(assert (=> start!94458 tp!76802))

(declare-datatypes ((array!68175 0))(
  ( (array!68176 (arr!32787 (Array (_ BitVec 32) (_ BitVec 64))) (size!33323 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68175)

(declare-fun array_inv!25383 (array!68175) Bool)

(assert (=> start!94458 (array_inv!25383 _keys!1163)))

(declare-fun b!1068098 () Bool)

(declare-fun e!609330 () Bool)

(assert (=> b!1068098 (= e!609330 true)))

(declare-datatypes ((tuple2!16316 0))(
  ( (tuple2!16317 (_1!8169 (_ BitVec 64)) (_2!8169 V!39261)) )
))
(declare-datatypes ((List!22869 0))(
  ( (Nil!22866) (Cons!22865 (h!24074 tuple2!16316) (t!32194 List!22869)) )
))
(declare-datatypes ((ListLongMap!14285 0))(
  ( (ListLongMap!14286 (toList!7158 List!22869)) )
))
(declare-fun lt!471801 () ListLongMap!14285)

(declare-fun -!642 (ListLongMap!14285 (_ BitVec 64)) ListLongMap!14285)

(assert (=> b!1068098 (= (-!642 lt!471801 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471801)))

(declare-datatypes ((Unit!35113 0))(
  ( (Unit!35114) )
))
(declare-fun lt!471800 () Unit!35113)

(declare-fun removeNotPresentStillSame!52 (ListLongMap!14285 (_ BitVec 64)) Unit!35113)

(assert (=> b!1068098 (= lt!471800 (removeNotPresentStillSame!52 lt!471801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068099 () Bool)

(declare-fun res!712749 () Bool)

(assert (=> b!1068099 (=> (not res!712749) (not e!609331))))

(declare-datatypes ((List!22870 0))(
  ( (Nil!22867) (Cons!22866 (h!24075 (_ BitVec 64)) (t!32195 List!22870)) )
))
(declare-fun arrayNoDuplicates!0 (array!68175 (_ BitVec 32) List!22870) Bool)

(assert (=> b!1068099 (= res!712749 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22867))))

(declare-fun b!1068100 () Bool)

(declare-fun e!609325 () Bool)

(assert (=> b!1068100 (= e!609325 e!609330)))

(declare-fun res!712748 () Bool)

(assert (=> b!1068100 (=> res!712748 e!609330)))

(declare-fun contains!6291 (ListLongMap!14285 (_ BitVec 64)) Bool)

(assert (=> b!1068100 (= res!712748 (contains!6291 lt!471801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39261)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39261)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4088 (array!68175 array!68173 (_ BitVec 32) (_ BitVec 32) V!39261 V!39261 (_ BitVec 32) Int) ListLongMap!14285)

(assert (=> b!1068100 (= lt!471801 (getCurrentListMap!4088 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068101 () Bool)

(declare-fun res!712750 () Bool)

(assert (=> b!1068101 (=> (not res!712750) (not e!609331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68175 (_ BitVec 32)) Bool)

(assert (=> b!1068101 (= res!712750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068102 () Bool)

(assert (=> b!1068102 (= e!609331 (not e!609325))))

(declare-fun res!712747 () Bool)

(assert (=> b!1068102 (=> res!712747 e!609325)))

(assert (=> b!1068102 (= res!712747 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471799 () ListLongMap!14285)

(declare-fun lt!471802 () ListLongMap!14285)

(assert (=> b!1068102 (= lt!471799 lt!471802)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lt!471798 () Unit!35113)

(declare-fun zeroValueAfter!47 () V!39261)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!775 (array!68175 array!68173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39261 V!39261 V!39261 V!39261 (_ BitVec 32) Int) Unit!35113)

(assert (=> b!1068102 (= lt!471798 (lemmaNoChangeToArrayThenSameMapNoExtras!775 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3738 (array!68175 array!68173 (_ BitVec 32) (_ BitVec 32) V!39261 V!39261 (_ BitVec 32) Int) ListLongMap!14285)

(assert (=> b!1068102 (= lt!471802 (getCurrentListMapNoExtraKeys!3738 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068102 (= lt!471799 (getCurrentListMapNoExtraKeys!3738 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068103 () Bool)

(declare-fun e!609328 () Bool)

(assert (=> b!1068103 (= e!609328 tp_is_empty!25595)))

(declare-fun b!1068104 () Bool)

(declare-fun mapRes!40087 () Bool)

(assert (=> b!1068104 (= e!609326 (and e!609328 mapRes!40087))))

(declare-fun condMapEmpty!40087 () Bool)

(declare-fun mapDefault!40087 () ValueCell!12094)

