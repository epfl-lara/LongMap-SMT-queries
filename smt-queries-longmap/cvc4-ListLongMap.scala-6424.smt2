; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82344 () Bool)

(assert start!82344)

(declare-fun b_free!18611 () Bool)

(declare-fun b_next!18611 () Bool)

(assert (=> start!82344 (= b_free!18611 (not b_next!18611))))

(declare-fun tp!64803 () Bool)

(declare-fun b_and!30099 () Bool)

(assert (=> start!82344 (= tp!64803 b_and!30099)))

(declare-fun res!642658 () Bool)

(declare-fun e!541200 () Bool)

(assert (=> start!82344 (=> (not res!642658) (not e!541200))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82344 (= res!642658 (validMask!0 mask!2088))))

(assert (=> start!82344 e!541200))

(assert (=> start!82344 true))

(declare-fun tp_is_empty!21323 () Bool)

(assert (=> start!82344 tp_is_empty!21323))

(declare-datatypes ((array!58737 0))(
  ( (array!58738 (arr!28242 (Array (_ BitVec 32) (_ BitVec 64))) (size!28721 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58737)

(declare-fun array_inv!21883 (array!58737) Bool)

(assert (=> start!82344 (array_inv!21883 _keys!1668)))

(declare-datatypes ((V!33413 0))(
  ( (V!33414 (val!10712 Int)) )
))
(declare-datatypes ((ValueCell!10180 0))(
  ( (ValueCellFull!10180 (v!13269 V!33413)) (EmptyCell!10180) )
))
(declare-datatypes ((array!58739 0))(
  ( (array!58740 (arr!28243 (Array (_ BitVec 32) ValueCell!10180)) (size!28722 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58739)

(declare-fun e!541196 () Bool)

(declare-fun array_inv!21884 (array!58739) Bool)

(assert (=> start!82344 (and (array_inv!21884 _values!1386) e!541196)))

(assert (=> start!82344 tp!64803))

(declare-fun b!960071 () Bool)

(declare-fun res!642657 () Bool)

(assert (=> b!960071 (=> (not res!642657) (not e!541200))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960071 (= res!642657 (and (= (size!28722 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28721 _keys!1668) (size!28722 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960072 () Bool)

(declare-fun res!642654 () Bool)

(assert (=> b!960072 (=> (not res!642654) (not e!541200))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960072 (= res!642654 (validKeyInArray!0 (select (arr!28242 _keys!1668) i!793)))))

(declare-fun b!960073 () Bool)

(declare-fun e!541198 () Bool)

(declare-fun mapRes!33964 () Bool)

(assert (=> b!960073 (= e!541196 (and e!541198 mapRes!33964))))

(declare-fun condMapEmpty!33964 () Bool)

(declare-fun mapDefault!33964 () ValueCell!10180)

