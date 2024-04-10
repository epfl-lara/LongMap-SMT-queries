; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74688 () Bool)

(assert start!74688)

(declare-fun b_free!15337 () Bool)

(declare-fun b_next!15337 () Bool)

(assert (=> start!74688 (= b_free!15337 (not b_next!15337))))

(declare-fun tp!53699 () Bool)

(declare-fun b_and!25293 () Bool)

(assert (=> start!74688 (= tp!53699 b_and!25293)))

(declare-fun b!880426 () Bool)

(declare-fun e!489952 () Bool)

(declare-fun e!489954 () Bool)

(declare-fun mapRes!27993 () Bool)

(assert (=> b!880426 (= e!489952 (and e!489954 mapRes!27993))))

(declare-fun condMapEmpty!27993 () Bool)

(declare-datatypes ((V!28489 0))(
  ( (V!28490 (val!8838 Int)) )
))
(declare-datatypes ((ValueCell!8351 0))(
  ( (ValueCellFull!8351 (v!11286 V!28489)) (EmptyCell!8351) )
))
(declare-datatypes ((array!51290 0))(
  ( (array!51291 (arr!24669 (Array (_ BitVec 32) ValueCell!8351)) (size!25109 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51290)

(declare-fun mapDefault!27993 () ValueCell!8351)

