; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105448 () Bool)

(assert start!105448)

(declare-fun b_free!27107 () Bool)

(declare-fun b_next!27107 () Bool)

(assert (=> start!105448 (= b_free!27107 (not b_next!27107))))

(declare-fun tp!94835 () Bool)

(declare-fun b_and!44953 () Bool)

(assert (=> start!105448 (= tp!94835 b_and!44953)))

(declare-fun b!1256361 () Bool)

(declare-fun e!714224 () Bool)

(declare-fun e!714223 () Bool)

(declare-fun mapRes!49798 () Bool)

(assert (=> b!1256361 (= e!714224 (and e!714223 mapRes!49798))))

(declare-fun condMapEmpty!49798 () Bool)

(declare-datatypes ((V!48043 0))(
  ( (V!48044 (val!16067 Int)) )
))
(declare-datatypes ((ValueCell!15241 0))(
  ( (ValueCellFull!15241 (v!18767 V!48043)) (EmptyCell!15241) )
))
(declare-datatypes ((array!81658 0))(
  ( (array!81659 (arr!39388 (Array (_ BitVec 32) ValueCell!15241)) (size!39924 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81658)

(declare-fun mapDefault!49798 () ValueCell!15241)

