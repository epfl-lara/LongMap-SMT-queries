; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93944 () Bool)

(assert start!93944)

(declare-fun b_free!21403 () Bool)

(declare-fun b_next!21403 () Bool)

(assert (=> start!93944 (= b_free!21403 (not b_next!21403))))

(declare-fun tp!75635 () Bool)

(declare-fun b_and!34125 () Bool)

(assert (=> start!93944 (= tp!75635 b_and!34125)))

(declare-fun b!1062517 () Bool)

(declare-fun res!709482 () Bool)

(declare-fun e!605248 () Bool)

(assert (=> b!1062517 (=> (not res!709482) (not e!605248))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38753 0))(
  ( (V!38754 (val!12657 Int)) )
))
(declare-datatypes ((ValueCell!11903 0))(
  ( (ValueCellFull!11903 (v!15267 V!38753)) (EmptyCell!11903) )
))
(declare-datatypes ((array!67429 0))(
  ( (array!67430 (arr!32421 (Array (_ BitVec 32) ValueCell!11903)) (size!32957 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67429)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67431 0))(
  ( (array!67432 (arr!32422 (Array (_ BitVec 32) (_ BitVec 64))) (size!32958 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67431)

(assert (=> b!1062517 (= res!709482 (and (= (size!32957 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32958 _keys!1163) (size!32957 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062518 () Bool)

(declare-fun e!605249 () Bool)

(declare-fun tp_is_empty!25213 () Bool)

(assert (=> b!1062518 (= e!605249 tp_is_empty!25213)))

(declare-fun b!1062519 () Bool)

(declare-fun e!605251 () Bool)

(assert (=> b!1062519 (= e!605251 true)))

(declare-datatypes ((tuple2!16014 0))(
  ( (tuple2!16015 (_1!8018 (_ BitVec 64)) (_2!8018 V!38753)) )
))
(declare-datatypes ((List!22596 0))(
  ( (Nil!22593) (Cons!22592 (h!23801 tuple2!16014) (t!31907 List!22596)) )
))
(declare-datatypes ((ListLongMap!13983 0))(
  ( (ListLongMap!13984 (toList!7007 List!22596)) )
))
(declare-fun lt!468145 () ListLongMap!13983)

(declare-fun -!571 (ListLongMap!13983 (_ BitVec 64)) ListLongMap!13983)

(assert (=> b!1062519 (= (-!571 lt!468145 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468145)))

(declare-datatypes ((Unit!34812 0))(
  ( (Unit!34813) )
))
(declare-fun lt!468143 () Unit!34812)

(declare-fun removeNotPresentStillSame!18 (ListLongMap!13983 (_ BitVec 64)) Unit!34812)

(assert (=> b!1062519 (= lt!468143 (removeNotPresentStillSame!18 lt!468145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062520 () Bool)

(declare-fun res!709483 () Bool)

(assert (=> b!1062520 (=> (not res!709483) (not e!605248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67431 (_ BitVec 32)) Bool)

(assert (=> b!1062520 (= res!709483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39493 () Bool)

(declare-fun mapRes!39493 () Bool)

(assert (=> mapIsEmpty!39493 mapRes!39493))

(declare-fun mapNonEmpty!39493 () Bool)

(declare-fun tp!75634 () Bool)

(declare-fun e!605252 () Bool)

(assert (=> mapNonEmpty!39493 (= mapRes!39493 (and tp!75634 e!605252))))

(declare-fun mapValue!39493 () ValueCell!11903)

(declare-fun mapRest!39493 () (Array (_ BitVec 32) ValueCell!11903))

(declare-fun mapKey!39493 () (_ BitVec 32))

(assert (=> mapNonEmpty!39493 (= (arr!32421 _values!955) (store mapRest!39493 mapKey!39493 mapValue!39493))))

(declare-fun res!709481 () Bool)

(assert (=> start!93944 (=> (not res!709481) (not e!605248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93944 (= res!709481 (validMask!0 mask!1515))))

(assert (=> start!93944 e!605248))

(assert (=> start!93944 true))

(assert (=> start!93944 tp_is_empty!25213))

(declare-fun e!605253 () Bool)

(declare-fun array_inv!25116 (array!67429) Bool)

(assert (=> start!93944 (and (array_inv!25116 _values!955) e!605253)))

(assert (=> start!93944 tp!75635))

(declare-fun array_inv!25117 (array!67431) Bool)

(assert (=> start!93944 (array_inv!25117 _keys!1163)))

(declare-fun b!1062521 () Bool)

(assert (=> b!1062521 (= e!605253 (and e!605249 mapRes!39493))))

(declare-fun condMapEmpty!39493 () Bool)

(declare-fun mapDefault!39493 () ValueCell!11903)

