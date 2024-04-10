; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93930 () Bool)

(assert start!93930)

(declare-fun b_free!21389 () Bool)

(declare-fun b_next!21389 () Bool)

(assert (=> start!93930 (= b_free!21389 (not b_next!21389))))

(declare-fun tp!75593 () Bool)

(declare-fun b_and!34111 () Bool)

(assert (=> start!93930 (= tp!75593 b_and!34111)))

(declare-fun b!1062328 () Bool)

(declare-fun res!709354 () Bool)

(declare-fun e!605101 () Bool)

(assert (=> b!1062328 (=> (not res!709354) (not e!605101))))

(declare-datatypes ((array!67401 0))(
  ( (array!67402 (arr!32407 (Array (_ BitVec 32) (_ BitVec 64))) (size!32943 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67401)

(declare-datatypes ((List!22583 0))(
  ( (Nil!22580) (Cons!22579 (h!23788 (_ BitVec 64)) (t!31894 List!22583)) )
))
(declare-fun arrayNoDuplicates!0 (array!67401 (_ BitVec 32) List!22583) Bool)

(assert (=> b!1062328 (= res!709354 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22580))))

(declare-fun b!1062329 () Bool)

(declare-fun e!605104 () Bool)

(declare-fun e!605103 () Bool)

(assert (=> b!1062329 (= e!605104 e!605103)))

(declare-fun res!709353 () Bool)

(assert (=> b!1062329 (=> res!709353 e!605103)))

(declare-datatypes ((V!38733 0))(
  ( (V!38734 (val!12650 Int)) )
))
(declare-datatypes ((tuple2!16000 0))(
  ( (tuple2!16001 (_1!8011 (_ BitVec 64)) (_2!8011 V!38733)) )
))
(declare-datatypes ((List!22584 0))(
  ( (Nil!22581) (Cons!22580 (h!23789 tuple2!16000) (t!31895 List!22584)) )
))
(declare-datatypes ((ListLongMap!13969 0))(
  ( (ListLongMap!13970 (toList!7000 List!22584)) )
))
(declare-fun lt!468040 () ListLongMap!13969)

(declare-fun contains!6233 (ListLongMap!13969 (_ BitVec 64)) Bool)

(assert (=> b!1062329 (= res!709353 (contains!6233 lt!468040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38733)

(declare-datatypes ((ValueCell!11896 0))(
  ( (ValueCellFull!11896 (v!15260 V!38733)) (EmptyCell!11896) )
))
(declare-datatypes ((array!67403 0))(
  ( (array!67404 (arr!32408 (Array (_ BitVec 32) ValueCell!11896)) (size!32944 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67403)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38733)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3986 (array!67401 array!67403 (_ BitVec 32) (_ BitVec 32) V!38733 V!38733 (_ BitVec 32) Int) ListLongMap!13969)

(assert (=> b!1062329 (= lt!468040 (getCurrentListMap!3986 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062330 () Bool)

(declare-fun e!605105 () Bool)

(declare-fun e!605106 () Bool)

(declare-fun mapRes!39472 () Bool)

(assert (=> b!1062330 (= e!605105 (and e!605106 mapRes!39472))))

(declare-fun condMapEmpty!39472 () Bool)

(declare-fun mapDefault!39472 () ValueCell!11896)

