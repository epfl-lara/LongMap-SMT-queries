; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105558 () Bool)

(assert start!105558)

(declare-fun b_free!27173 () Bool)

(declare-fun b_next!27173 () Bool)

(assert (=> start!105558 (= b_free!27173 (not b_next!27173))))

(declare-fun tp!95039 () Bool)

(declare-fun b_and!45039 () Bool)

(assert (=> start!105558 (= tp!95039 b_and!45039)))

(declare-fun b!1257532 () Bool)

(declare-fun e!715079 () Bool)

(declare-fun e!715080 () Bool)

(declare-fun mapRes!49903 () Bool)

(assert (=> b!1257532 (= e!715079 (and e!715080 mapRes!49903))))

(declare-fun condMapEmpty!49903 () Bool)

(declare-datatypes ((V!48131 0))(
  ( (V!48132 (val!16100 Int)) )
))
(declare-datatypes ((ValueCell!15274 0))(
  ( (ValueCellFull!15274 (v!18802 V!48131)) (EmptyCell!15274) )
))
(declare-datatypes ((array!81786 0))(
  ( (array!81787 (arr!39450 (Array (_ BitVec 32) ValueCell!15274)) (size!39986 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81786)

(declare-fun mapDefault!49903 () ValueCell!15274)

