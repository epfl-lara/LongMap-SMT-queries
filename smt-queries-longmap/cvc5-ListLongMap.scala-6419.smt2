; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82310 () Bool)

(assert start!82310)

(declare-fun b!959626 () Bool)

(declare-fun res!642365 () Bool)

(declare-fun e!540944 () Bool)

(assert (=> b!959626 (=> (not res!642365) (not e!540944))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33369 0))(
  ( (V!33370 (val!10695 Int)) )
))
(declare-datatypes ((ValueCell!10163 0))(
  ( (ValueCellFull!10163 (v!13252 V!33369)) (EmptyCell!10163) )
))
(declare-datatypes ((array!58669 0))(
  ( (array!58670 (arr!28208 (Array (_ BitVec 32) ValueCell!10163)) (size!28687 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58669)

(declare-datatypes ((array!58671 0))(
  ( (array!58672 (arr!28209 (Array (_ BitVec 32) (_ BitVec 64))) (size!28688 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58671)

(assert (=> b!959626 (= res!642365 (and (= (size!28687 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28688 _keys!1668) (size!28687 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959627 () Bool)

(declare-fun e!540943 () Bool)

(declare-fun e!540942 () Bool)

(declare-fun mapRes!33913 () Bool)

(assert (=> b!959627 (= e!540943 (and e!540942 mapRes!33913))))

(declare-fun condMapEmpty!33913 () Bool)

(declare-fun mapDefault!33913 () ValueCell!10163)

