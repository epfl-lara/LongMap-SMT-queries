; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95102 () Bool)

(assert start!95102)

(declare-fun b_free!22199 () Bool)

(declare-fun b_next!22199 () Bool)

(assert (=> start!95102 (= b_free!22199 (not b_next!22199))))

(declare-fun tp!78079 () Bool)

(declare-fun b_and!35119 () Bool)

(assert (=> start!95102 (= tp!78079 b_and!35119)))

(declare-fun b!1075087 () Bool)

(declare-fun res!716763 () Bool)

(declare-fun e!614389 () Bool)

(assert (=> b!1075087 (=> (not res!716763) (not e!614389))))

(declare-datatypes ((array!68985 0))(
  ( (array!68986 (arr!33180 (Array (_ BitVec 32) (_ BitVec 64))) (size!33716 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68985)

(declare-datatypes ((List!23168 0))(
  ( (Nil!23165) (Cons!23164 (h!24373 (_ BitVec 64)) (t!32517 List!23168)) )
))
(declare-fun arrayNoDuplicates!0 (array!68985 (_ BitVec 32) List!23168) Bool)

(assert (=> b!1075087 (= res!716763 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23165))))

(declare-fun res!716765 () Bool)

(assert (=> start!95102 (=> (not res!716765) (not e!614389))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95102 (= res!716765 (validMask!0 mask!1515))))

(assert (=> start!95102 e!614389))

(assert (=> start!95102 true))

(declare-fun tp_is_empty!26009 () Bool)

(assert (=> start!95102 tp_is_empty!26009))

(declare-datatypes ((V!39813 0))(
  ( (V!39814 (val!13055 Int)) )
))
(declare-datatypes ((ValueCell!12301 0))(
  ( (ValueCellFull!12301 (v!15678 V!39813)) (EmptyCell!12301) )
))
(declare-datatypes ((array!68987 0))(
  ( (array!68988 (arr!33181 (Array (_ BitVec 32) ValueCell!12301)) (size!33717 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68987)

(declare-fun e!614391 () Bool)

(declare-fun array_inv!25642 (array!68987) Bool)

(assert (=> start!95102 (and (array_inv!25642 _values!955) e!614391)))

(assert (=> start!95102 tp!78079))

(declare-fun array_inv!25643 (array!68985) Bool)

(assert (=> start!95102 (array_inv!25643 _keys!1163)))

(declare-fun mapNonEmpty!40744 () Bool)

(declare-fun mapRes!40744 () Bool)

(declare-fun tp!78080 () Bool)

(declare-fun e!614387 () Bool)

(assert (=> mapNonEmpty!40744 (= mapRes!40744 (and tp!78080 e!614387))))

(declare-fun mapKey!40744 () (_ BitVec 32))

(declare-fun mapValue!40744 () ValueCell!12301)

(declare-fun mapRest!40744 () (Array (_ BitVec 32) ValueCell!12301))

(assert (=> mapNonEmpty!40744 (= (arr!33181 _values!955) (store mapRest!40744 mapKey!40744 mapValue!40744))))

(declare-fun b!1075088 () Bool)

(declare-fun e!614386 () Bool)

(assert (=> b!1075088 (= e!614391 (and e!614386 mapRes!40744))))

(declare-fun condMapEmpty!40744 () Bool)

(declare-fun mapDefault!40744 () ValueCell!12301)

