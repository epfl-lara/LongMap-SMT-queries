; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105502 () Bool)

(assert start!105502)

(declare-fun b_free!27139 () Bool)

(declare-fun b_next!27139 () Bool)

(assert (=> start!105502 (= b_free!27139 (not b_next!27139))))

(declare-fun tp!94933 () Bool)

(declare-fun b_and!44995 () Bool)

(assert (=> start!105502 (= tp!94933 b_and!44995)))

(declare-fun b!1256950 () Bool)

(declare-fun e!714657 () Bool)

(declare-fun tp_is_empty!32041 () Bool)

(assert (=> b!1256950 (= e!714657 tp_is_empty!32041)))

(declare-fun b!1256951 () Bool)

(declare-fun e!714660 () Bool)

(declare-fun mapRes!49849 () Bool)

(assert (=> b!1256951 (= e!714660 (and e!714657 mapRes!49849))))

(declare-fun condMapEmpty!49849 () Bool)

(declare-datatypes ((V!48087 0))(
  ( (V!48088 (val!16083 Int)) )
))
(declare-datatypes ((ValueCell!15257 0))(
  ( (ValueCellFull!15257 (v!18784 V!48087)) (EmptyCell!15257) )
))
(declare-datatypes ((array!81720 0))(
  ( (array!81721 (arr!39418 (Array (_ BitVec 32) ValueCell!15257)) (size!39954 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81720)

(declare-fun mapDefault!49849 () ValueCell!15257)

