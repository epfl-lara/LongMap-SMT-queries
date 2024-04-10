; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!848 () Bool)

(assert start!848)

(declare-fun b_free!241 () Bool)

(declare-fun b_next!241 () Bool)

(assert (=> start!848 (= b_free!241 (not b_next!241))))

(declare-fun tp!953 () Bool)

(declare-fun b_and!387 () Bool)

(assert (=> start!848 (= tp!953 b_and!387)))

(declare-fun b!6871 () Bool)

(declare-fun e!3800 () Bool)

(declare-fun tp_is_empty!319 () Bool)

(assert (=> b!6871 (= e!3800 tp_is_empty!319)))

(declare-fun res!7088 () Bool)

(declare-fun e!3798 () Bool)

(assert (=> start!848 (=> (not res!7088) (not e!3798))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!848 (= res!7088 (validMask!0 mask!2250))))

(assert (=> start!848 e!3798))

(assert (=> start!848 tp!953))

(assert (=> start!848 true))

(declare-datatypes ((V!603 0))(
  ( (V!604 (val!165 Int)) )
))
(declare-datatypes ((ValueCell!143 0))(
  ( (ValueCellFull!143 (v!1256 V!603)) (EmptyCell!143) )
))
(declare-datatypes ((array!569 0))(
  ( (array!570 (arr!273 (Array (_ BitVec 32) ValueCell!143)) (size!335 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!569)

(declare-fun e!3797 () Bool)

(declare-fun array_inv!199 (array!569) Bool)

(assert (=> start!848 (and (array_inv!199 _values!1492) e!3797)))

(assert (=> start!848 tp_is_empty!319))

(declare-datatypes ((array!571 0))(
  ( (array!572 (arr!274 (Array (_ BitVec 32) (_ BitVec 64))) (size!336 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!571)

(declare-fun array_inv!200 (array!571) Bool)

(assert (=> start!848 (array_inv!200 _keys!1806)))

(declare-fun b!6872 () Bool)

(declare-fun e!3796 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6872 (= e!3796 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6873 () Bool)

(declare-fun res!7091 () Bool)

(assert (=> b!6873 (=> (not res!7091) (not e!3798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6873 (= res!7091 (validKeyInArray!0 k!1278))))

(declare-fun b!6874 () Bool)

(declare-fun res!7096 () Bool)

(assert (=> b!6874 (=> (not res!7096) (not e!3798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!571 (_ BitVec 32)) Bool)

(assert (=> b!6874 (= res!7096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6875 () Bool)

(declare-fun mapRes!449 () Bool)

(assert (=> b!6875 (= e!3797 (and e!3800 mapRes!449))))

(declare-fun condMapEmpty!449 () Bool)

(declare-fun mapDefault!449 () ValueCell!143)

