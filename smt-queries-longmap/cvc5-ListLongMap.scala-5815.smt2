; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74992 () Bool)

(assert start!74992)

(declare-fun b_free!15481 () Bool)

(declare-fun b_next!15481 () Bool)

(assert (=> start!74992 (= b_free!15481 (not b_next!15481))))

(declare-fun tp!54148 () Bool)

(declare-fun b_and!25671 () Bool)

(assert (=> start!74992 (= tp!54148 b_and!25671)))

(declare-fun b!884639 () Bool)

(declare-fun e!492314 () Bool)

(declare-fun e!492312 () Bool)

(declare-fun mapRes!28227 () Bool)

(assert (=> b!884639 (= e!492314 (and e!492312 mapRes!28227))))

(declare-fun condMapEmpty!28227 () Bool)

(declare-datatypes ((V!28681 0))(
  ( (V!28682 (val!8910 Int)) )
))
(declare-datatypes ((ValueCell!8423 0))(
  ( (ValueCellFull!8423 (v!11383 V!28681)) (EmptyCell!8423) )
))
(declare-datatypes ((array!51576 0))(
  ( (array!51577 (arr!24806 (Array (_ BitVec 32) ValueCell!8423)) (size!25246 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51576)

(declare-fun mapDefault!28227 () ValueCell!8423)

