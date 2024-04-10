; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94384 () Bool)

(assert start!94384)

(declare-fun b_free!21725 () Bool)

(declare-fun b_next!21725 () Bool)

(assert (=> start!94384 (= b_free!21725 (not b_next!21725))))

(declare-fun tp!76619 () Bool)

(declare-fun b_and!34509 () Bool)

(assert (=> start!94384 (= tp!76619 b_and!34509)))

(declare-fun b!1067268 () Bool)

(declare-fun res!712244 () Bool)

(declare-fun e!608708 () Bool)

(assert (=> b!1067268 (=> (not res!712244) (not e!608708))))

(declare-datatypes ((array!68053 0))(
  ( (array!68054 (arr!32727 (Array (_ BitVec 32) (_ BitVec 64))) (size!33263 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68053)

(declare-datatypes ((List!22822 0))(
  ( (Nil!22819) (Cons!22818 (h!24027 (_ BitVec 64)) (t!32145 List!22822)) )
))
(declare-fun arrayNoDuplicates!0 (array!68053 (_ BitVec 32) List!22822) Bool)

(assert (=> b!1067268 (= res!712244 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22819))))

(declare-fun b!1067269 () Bool)

(declare-fun e!608705 () Bool)

(declare-fun e!608706 () Bool)

(declare-fun mapRes!39994 () Bool)

(assert (=> b!1067269 (= e!608705 (and e!608706 mapRes!39994))))

(declare-fun condMapEmpty!39994 () Bool)

(declare-datatypes ((V!39181 0))(
  ( (V!39182 (val!12818 Int)) )
))
(declare-datatypes ((ValueCell!12064 0))(
  ( (ValueCellFull!12064 (v!15432 V!39181)) (EmptyCell!12064) )
))
(declare-datatypes ((array!68055 0))(
  ( (array!68056 (arr!32728 (Array (_ BitVec 32) ValueCell!12064)) (size!33264 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68055)

(declare-fun mapDefault!39994 () ValueCell!12064)

