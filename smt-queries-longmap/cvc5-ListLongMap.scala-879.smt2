; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20370 () Bool)

(assert start!20370)

(declare-fun b_free!5029 () Bool)

(declare-fun b_next!5029 () Bool)

(assert (=> start!20370 (= b_free!5029 (not b_next!5029))))

(declare-fun tp!18118 () Bool)

(declare-fun b_and!11775 () Bool)

(assert (=> start!20370 (= tp!18118 b_and!11775)))

(declare-fun res!96041 () Bool)

(declare-fun e!131852 () Bool)

(assert (=> start!20370 (=> (not res!96041) (not e!131852))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20370 (= res!96041 (validMask!0 mask!1149))))

(assert (=> start!20370 e!131852))

(declare-datatypes ((V!6161 0))(
  ( (V!6162 (val!2487 Int)) )
))
(declare-datatypes ((ValueCell!2099 0))(
  ( (ValueCellFull!2099 (v!4457 V!6161)) (EmptyCell!2099) )
))
(declare-datatypes ((array!8999 0))(
  ( (array!9000 (arr!4250 (Array (_ BitVec 32) ValueCell!2099)) (size!4575 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8999)

(declare-fun e!131854 () Bool)

(declare-fun array_inv!2799 (array!8999) Bool)

(assert (=> start!20370 (and (array_inv!2799 _values!649) e!131854)))

(assert (=> start!20370 true))

(declare-fun tp_is_empty!4885 () Bool)

(assert (=> start!20370 tp_is_empty!4885))

(declare-datatypes ((array!9001 0))(
  ( (array!9002 (arr!4251 (Array (_ BitVec 32) (_ BitVec 64))) (size!4576 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9001)

(declare-fun array_inv!2800 (array!9001) Bool)

(assert (=> start!20370 (array_inv!2800 _keys!825)))

(assert (=> start!20370 tp!18118))

(declare-fun b!201150 () Bool)

(declare-fun e!131856 () Bool)

(declare-fun mapRes!8396 () Bool)

(assert (=> b!201150 (= e!131854 (and e!131856 mapRes!8396))))

(declare-fun condMapEmpty!8396 () Bool)

(declare-fun mapDefault!8396 () ValueCell!2099)

