; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94000 () Bool)

(assert start!94000)

(declare-fun b_free!21437 () Bool)

(declare-fun b_next!21437 () Bool)

(assert (=> start!94000 (= b_free!21437 (not b_next!21437))))

(declare-fun tp!75739 () Bool)

(declare-fun b_and!34169 () Bool)

(assert (=> start!94000 (= tp!75739 b_and!34169)))

(declare-fun b!1063133 () Bool)

(declare-fun e!605710 () Bool)

(declare-fun tp_is_empty!25247 () Bool)

(assert (=> b!1063133 (= e!605710 tp_is_empty!25247)))

(declare-fun b!1063134 () Bool)

(declare-fun res!709850 () Bool)

(declare-fun e!605707 () Bool)

(assert (=> b!1063134 (=> (not res!709850) (not e!605707))))

(declare-datatypes ((array!67493 0))(
  ( (array!67494 (arr!32452 (Array (_ BitVec 32) (_ BitVec 64))) (size!32988 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67493)

(declare-datatypes ((List!22618 0))(
  ( (Nil!22615) (Cons!22614 (h!23823 (_ BitVec 64)) (t!31931 List!22618)) )
))
(declare-fun arrayNoDuplicates!0 (array!67493 (_ BitVec 32) List!22618) Bool)

(assert (=> b!1063134 (= res!709850 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22615))))

(declare-fun b!1063135 () Bool)

(declare-fun e!605705 () Bool)

(declare-fun e!605709 () Bool)

(assert (=> b!1063135 (= e!605705 e!605709)))

(declare-fun res!709848 () Bool)

(assert (=> b!1063135 (=> res!709848 e!605709)))

(declare-datatypes ((V!38797 0))(
  ( (V!38798 (val!12674 Int)) )
))
(declare-datatypes ((tuple2!16038 0))(
  ( (tuple2!16039 (_1!8030 (_ BitVec 64)) (_2!8030 V!38797)) )
))
(declare-datatypes ((List!22619 0))(
  ( (Nil!22616) (Cons!22615 (h!23824 tuple2!16038) (t!31932 List!22619)) )
))
(declare-datatypes ((ListLongMap!14007 0))(
  ( (ListLongMap!14008 (toList!7019 List!22619)) )
))
(declare-fun lt!468522 () ListLongMap!14007)

(declare-fun contains!6250 (ListLongMap!14007 (_ BitVec 64)) Bool)

(assert (=> b!1063135 (= res!709848 (contains!6250 lt!468522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38797)

(declare-datatypes ((ValueCell!11920 0))(
  ( (ValueCellFull!11920 (v!15285 V!38797)) (EmptyCell!11920) )
))
(declare-datatypes ((array!67495 0))(
  ( (array!67496 (arr!32453 (Array (_ BitVec 32) ValueCell!11920)) (size!32989 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67495)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38797)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4002 (array!67493 array!67495 (_ BitVec 32) (_ BitVec 32) V!38797 V!38797 (_ BitVec 32) Int) ListLongMap!14007)

(assert (=> b!1063135 (= lt!468522 (getCurrentListMap!4002 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709851 () Bool)

(assert (=> start!94000 (=> (not res!709851) (not e!605707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94000 (= res!709851 (validMask!0 mask!1515))))

(assert (=> start!94000 e!605707))

(assert (=> start!94000 true))

(assert (=> start!94000 tp_is_empty!25247))

(declare-fun e!605711 () Bool)

(declare-fun array_inv!25138 (array!67495) Bool)

(assert (=> start!94000 (and (array_inv!25138 _values!955) e!605711)))

(assert (=> start!94000 tp!75739))

(declare-fun array_inv!25139 (array!67493) Bool)

(assert (=> start!94000 (array_inv!25139 _keys!1163)))

(declare-fun b!1063136 () Bool)

(declare-fun e!605708 () Bool)

(declare-fun mapRes!39547 () Bool)

(assert (=> b!1063136 (= e!605711 (and e!605708 mapRes!39547))))

(declare-fun condMapEmpty!39547 () Bool)

(declare-fun mapDefault!39547 () ValueCell!11920)

