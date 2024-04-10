; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94368 () Bool)

(assert start!94368)

(declare-fun b_free!21709 () Bool)

(declare-fun b_next!21709 () Bool)

(assert (=> start!94368 (= b_free!21709 (not b_next!21709))))

(declare-fun tp!76571 () Bool)

(declare-fun b_and!34493 () Bool)

(assert (=> start!94368 (= tp!76571 b_and!34493)))

(declare-fun res!712145 () Bool)

(declare-fun e!608585 () Bool)

(assert (=> start!94368 (=> (not res!712145) (not e!608585))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94368 (= res!712145 (validMask!0 mask!1515))))

(assert (=> start!94368 e!608585))

(assert (=> start!94368 true))

(declare-fun tp_is_empty!25519 () Bool)

(assert (=> start!94368 tp_is_empty!25519))

(declare-datatypes ((V!39161 0))(
  ( (V!39162 (val!12810 Int)) )
))
(declare-datatypes ((ValueCell!12056 0))(
  ( (ValueCellFull!12056 (v!15424 V!39161)) (EmptyCell!12056) )
))
(declare-datatypes ((array!68023 0))(
  ( (array!68024 (arr!32712 (Array (_ BitVec 32) ValueCell!12056)) (size!33248 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68023)

(declare-fun e!608586 () Bool)

(declare-fun array_inv!25326 (array!68023) Bool)

(assert (=> start!94368 (and (array_inv!25326 _values!955) e!608586)))

(assert (=> start!94368 tp!76571))

(declare-datatypes ((array!68025 0))(
  ( (array!68026 (arr!32713 (Array (_ BitVec 32) (_ BitVec 64))) (size!33249 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68025)

(declare-fun array_inv!25327 (array!68025) Bool)

(assert (=> start!94368 (array_inv!25327 _keys!1163)))

(declare-fun mapIsEmpty!39970 () Bool)

(declare-fun mapRes!39970 () Bool)

(assert (=> mapIsEmpty!39970 mapRes!39970))

(declare-fun b!1067100 () Bool)

(declare-fun e!608587 () Bool)

(assert (=> b!1067100 (= e!608586 (and e!608587 mapRes!39970))))

(declare-fun condMapEmpty!39970 () Bool)

(declare-fun mapDefault!39970 () ValueCell!12056)

