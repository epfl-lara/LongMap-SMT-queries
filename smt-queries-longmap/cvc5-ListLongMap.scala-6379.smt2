; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82010 () Bool)

(assert start!82010)

(declare-fun res!640417 () Bool)

(declare-fun e!538977 () Bool)

(assert (=> start!82010 (=> (not res!640417) (not e!538977))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82010 (= res!640417 (validMask!0 mask!1823))))

(assert (=> start!82010 e!538977))

(assert (=> start!82010 true))

(declare-datatypes ((V!33049 0))(
  ( (V!33050 (val!10575 Int)) )
))
(declare-datatypes ((ValueCell!10043 0))(
  ( (ValueCellFull!10043 (v!13130 V!33049)) (EmptyCell!10043) )
))
(declare-datatypes ((array!58195 0))(
  ( (array!58196 (arr!27977 (Array (_ BitVec 32) ValueCell!10043)) (size!28456 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58195)

(declare-fun e!538975 () Bool)

(declare-fun array_inv!21707 (array!58195) Bool)

(assert (=> start!82010 (and (array_inv!21707 _values!1197) e!538975)))

(declare-datatypes ((array!58197 0))(
  ( (array!58198 (arr!27978 (Array (_ BitVec 32) (_ BitVec 64))) (size!28457 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58197)

(declare-fun array_inv!21708 (array!58197) Bool)

(assert (=> start!82010 (array_inv!21708 _keys!1441)))

(declare-fun b!956473 () Bool)

(declare-fun res!640418 () Bool)

(assert (=> b!956473 (=> (not res!640418) (not e!538977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58197 (_ BitVec 32)) Bool)

(assert (=> b!956473 (= res!640418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956474 () Bool)

(assert (=> b!956474 (= e!538977 false)))

(declare-fun lt!430151 () Bool)

(declare-datatypes ((List!19483 0))(
  ( (Nil!19480) (Cons!19479 (h!20641 (_ BitVec 64)) (t!27844 List!19483)) )
))
(declare-fun arrayNoDuplicates!0 (array!58197 (_ BitVec 32) List!19483) Bool)

(assert (=> b!956474 (= lt!430151 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19480))))

(declare-fun b!956475 () Bool)

(declare-fun e!538978 () Bool)

(declare-fun mapRes!33535 () Bool)

(assert (=> b!956475 (= e!538975 (and e!538978 mapRes!33535))))

(declare-fun condMapEmpty!33535 () Bool)

(declare-fun mapDefault!33535 () ValueCell!10043)

