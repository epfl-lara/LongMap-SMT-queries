; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94296 () Bool)

(assert start!94296)

(declare-fun b_free!21659 () Bool)

(declare-fun b_next!21659 () Bool)

(assert (=> start!94296 (= b_free!21659 (not b_next!21659))))

(declare-fun tp!76418 () Bool)

(declare-fun b_and!34431 () Bool)

(assert (=> start!94296 (= tp!76418 b_and!34431)))

(declare-fun mapIsEmpty!39892 () Bool)

(declare-fun mapRes!39892 () Bool)

(assert (=> mapIsEmpty!39892 mapRes!39892))

(declare-fun b!1066345 () Bool)

(declare-fun res!711721 () Bool)

(declare-fun e!608048 () Bool)

(assert (=> b!1066345 (=> (not res!711721) (not e!608048))))

(declare-datatypes ((array!67923 0))(
  ( (array!67924 (arr!32663 (Array (_ BitVec 32) (_ BitVec 64))) (size!33199 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67923)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67923 (_ BitVec 32)) Bool)

(assert (=> b!1066345 (= res!711721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066346 () Bool)

(declare-fun res!711718 () Bool)

(assert (=> b!1066346 (=> (not res!711718) (not e!608048))))

(declare-datatypes ((V!39093 0))(
  ( (V!39094 (val!12785 Int)) )
))
(declare-datatypes ((ValueCell!12031 0))(
  ( (ValueCellFull!12031 (v!15398 V!39093)) (EmptyCell!12031) )
))
(declare-datatypes ((array!67925 0))(
  ( (array!67926 (arr!32664 (Array (_ BitVec 32) ValueCell!12031)) (size!33200 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67925)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066346 (= res!711718 (and (= (size!33200 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33199 _keys!1163) (size!33200 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711719 () Bool)

(assert (=> start!94296 (=> (not res!711719) (not e!608048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94296 (= res!711719 (validMask!0 mask!1515))))

(assert (=> start!94296 e!608048))

(assert (=> start!94296 true))

(declare-fun tp_is_empty!25469 () Bool)

(assert (=> start!94296 tp_is_empty!25469))

(declare-fun e!608047 () Bool)

(declare-fun array_inv!25290 (array!67925) Bool)

(assert (=> start!94296 (and (array_inv!25290 _values!955) e!608047)))

(assert (=> start!94296 tp!76418))

(declare-fun array_inv!25291 (array!67923) Bool)

(assert (=> start!94296 (array_inv!25291 _keys!1163)))

(declare-fun b!1066347 () Bool)

(declare-fun e!608050 () Bool)

(assert (=> b!1066347 (= e!608050 tp_is_empty!25469)))

(declare-fun b!1066348 () Bool)

(declare-fun e!608045 () Bool)

(assert (=> b!1066348 (= e!608047 (and e!608045 mapRes!39892))))

(declare-fun condMapEmpty!39892 () Bool)

(declare-fun mapDefault!39892 () ValueCell!12031)

