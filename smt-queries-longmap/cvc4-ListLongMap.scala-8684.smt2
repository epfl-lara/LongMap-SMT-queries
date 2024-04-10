; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105506 () Bool)

(assert start!105506)

(declare-fun b_free!27143 () Bool)

(declare-fun b_next!27143 () Bool)

(assert (=> start!105506 (= b_free!27143 (not b_next!27143))))

(declare-fun tp!94945 () Bool)

(declare-fun b_and!44999 () Bool)

(assert (=> start!105506 (= tp!94945 b_and!44999)))

(declare-fun b!1257004 () Bool)

(declare-fun e!714702 () Bool)

(declare-fun tp_is_empty!32045 () Bool)

(assert (=> b!1257004 (= e!714702 tp_is_empty!32045)))

(declare-fun b!1257005 () Bool)

(declare-fun e!714697 () Bool)

(declare-fun mapRes!49855 () Bool)

(assert (=> b!1257005 (= e!714697 (and e!714702 mapRes!49855))))

(declare-fun condMapEmpty!49855 () Bool)

(declare-datatypes ((V!48091 0))(
  ( (V!48092 (val!16085 Int)) )
))
(declare-datatypes ((ValueCell!15259 0))(
  ( (ValueCellFull!15259 (v!18786 V!48091)) (EmptyCell!15259) )
))
(declare-datatypes ((array!81726 0))(
  ( (array!81727 (arr!39421 (Array (_ BitVec 32) ValueCell!15259)) (size!39957 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81726)

(declare-fun mapDefault!49855 () ValueCell!15259)

