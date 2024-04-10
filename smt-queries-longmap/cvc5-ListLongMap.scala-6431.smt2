; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82382 () Bool)

(assert start!82382)

(declare-fun b_free!18649 () Bool)

(declare-fun b_next!18649 () Bool)

(assert (=> start!82382 (= b_free!18649 (not b_next!18649))))

(declare-fun tp!64916 () Bool)

(declare-fun b_and!30137 () Bool)

(assert (=> start!82382 (= tp!64916 b_and!30137)))

(declare-fun mapNonEmpty!34021 () Bool)

(declare-fun mapRes!34021 () Bool)

(declare-fun tp!64917 () Bool)

(declare-fun e!541485 () Bool)

(assert (=> mapNonEmpty!34021 (= mapRes!34021 (and tp!64917 e!541485))))

(declare-datatypes ((V!33465 0))(
  ( (V!33466 (val!10731 Int)) )
))
(declare-datatypes ((ValueCell!10199 0))(
  ( (ValueCellFull!10199 (v!13288 V!33465)) (EmptyCell!10199) )
))
(declare-fun mapRest!34021 () (Array (_ BitVec 32) ValueCell!10199))

(declare-fun mapKey!34021 () (_ BitVec 32))

(declare-datatypes ((array!58811 0))(
  ( (array!58812 (arr!28279 (Array (_ BitVec 32) ValueCell!10199)) (size!28758 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58811)

(declare-fun mapValue!34021 () ValueCell!10199)

(assert (=> mapNonEmpty!34021 (= (arr!28279 _values!1386) (store mapRest!34021 mapKey!34021 mapValue!34021))))

(declare-fun b!960584 () Bool)

(declare-fun res!642997 () Bool)

(declare-fun e!541484 () Bool)

(assert (=> b!960584 (=> (not res!642997) (not e!541484))))

(declare-datatypes ((array!58813 0))(
  ( (array!58814 (arr!28280 (Array (_ BitVec 32) (_ BitVec 64))) (size!28759 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58813)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960584 (= res!642997 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28759 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28759 _keys!1668))))))

(declare-fun b!960585 () Bool)

(declare-fun res!643001 () Bool)

(assert (=> b!960585 (=> (not res!643001) (not e!541484))))

(declare-datatypes ((List!19663 0))(
  ( (Nil!19660) (Cons!19659 (h!20821 (_ BitVec 64)) (t!28026 List!19663)) )
))
(declare-fun arrayNoDuplicates!0 (array!58813 (_ BitVec 32) List!19663) Bool)

(assert (=> b!960585 (= res!643001 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19660))))

(declare-fun b!960586 () Bool)

(declare-fun e!541482 () Bool)

(declare-fun e!541483 () Bool)

(assert (=> b!960586 (= e!541482 (and e!541483 mapRes!34021))))

(declare-fun condMapEmpty!34021 () Bool)

(declare-fun mapDefault!34021 () ValueCell!10199)

