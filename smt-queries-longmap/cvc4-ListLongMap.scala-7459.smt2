; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94666 () Bool)

(assert start!94666)

(declare-fun b_free!21935 () Bool)

(declare-fun b_next!21935 () Bool)

(assert (=> start!94666 (= b_free!21935 (not b_next!21935))))

(declare-fun tp!77261 () Bool)

(declare-fun b_and!34755 () Bool)

(assert (=> start!94666 (= tp!77261 b_and!34755)))

(declare-fun b!1070325 () Bool)

(declare-fun res!714057 () Bool)

(declare-fun e!610962 () Bool)

(assert (=> b!1070325 (=> (not res!714057) (not e!610962))))

(declare-datatypes ((array!68465 0))(
  ( (array!68466 (arr!32929 (Array (_ BitVec 32) (_ BitVec 64))) (size!33465 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68465)

(declare-datatypes ((List!22973 0))(
  ( (Nil!22970) (Cons!22969 (h!24178 (_ BitVec 64)) (t!32304 List!22973)) )
))
(declare-fun arrayNoDuplicates!0 (array!68465 (_ BitVec 32) List!22973) Bool)

(assert (=> b!1070325 (= res!714057 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22970))))

(declare-fun b!1070326 () Bool)

(declare-fun res!714053 () Bool)

(assert (=> b!1070326 (=> (not res!714053) (not e!610962))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68465 (_ BitVec 32)) Bool)

(assert (=> b!1070326 (= res!714053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40321 () Bool)

(declare-fun mapRes!40321 () Bool)

(declare-fun tp!77260 () Bool)

(declare-fun e!610961 () Bool)

(assert (=> mapNonEmpty!40321 (= mapRes!40321 (and tp!77260 e!610961))))

(declare-fun mapKey!40321 () (_ BitVec 32))

(declare-datatypes ((V!39461 0))(
  ( (V!39462 (val!12923 Int)) )
))
(declare-datatypes ((ValueCell!12169 0))(
  ( (ValueCellFull!12169 (v!15539 V!39461)) (EmptyCell!12169) )
))
(declare-fun mapRest!40321 () (Array (_ BitVec 32) ValueCell!12169))

(declare-datatypes ((array!68467 0))(
  ( (array!68468 (arr!32930 (Array (_ BitVec 32) ValueCell!12169)) (size!33466 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68467)

(declare-fun mapValue!40321 () ValueCell!12169)

(assert (=> mapNonEmpty!40321 (= (arr!32930 _values!955) (store mapRest!40321 mapKey!40321 mapValue!40321))))

(declare-fun b!1070327 () Bool)

(declare-fun tp_is_empty!25745 () Bool)

(assert (=> b!1070327 (= e!610961 tp_is_empty!25745)))

(declare-fun mapIsEmpty!40321 () Bool)

(assert (=> mapIsEmpty!40321 mapRes!40321))

(declare-fun b!1070328 () Bool)

(declare-fun e!610960 () Bool)

(declare-fun e!610963 () Bool)

(assert (=> b!1070328 (= e!610960 (and e!610963 mapRes!40321))))

(declare-fun condMapEmpty!40321 () Bool)

(declare-fun mapDefault!40321 () ValueCell!12169)

