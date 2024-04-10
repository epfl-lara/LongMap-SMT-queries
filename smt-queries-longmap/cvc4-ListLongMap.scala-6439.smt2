; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82456 () Bool)

(assert start!82456)

(declare-fun b!961192 () Bool)

(declare-fun res!643337 () Bool)

(declare-fun e!541907 () Bool)

(assert (=> b!961192 (=> (not res!643337) (not e!541907))))

(declare-datatypes ((array!58919 0))(
  ( (array!58920 (arr!28330 (Array (_ BitVec 32) (_ BitVec 64))) (size!28809 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58919)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58919 (_ BitVec 32)) Bool)

(assert (=> b!961192 (= res!643337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961193 () Bool)

(declare-fun res!643334 () Bool)

(assert (=> b!961193 (=> (not res!643334) (not e!541907))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33533 0))(
  ( (V!33534 (val!10757 Int)) )
))
(declare-datatypes ((ValueCell!10225 0))(
  ( (ValueCellFull!10225 (v!13314 V!33533)) (EmptyCell!10225) )
))
(declare-datatypes ((array!58921 0))(
  ( (array!58922 (arr!28331 (Array (_ BitVec 32) ValueCell!10225)) (size!28810 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58921)

(assert (=> b!961193 (= res!643334 (and (= (size!28810 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28809 _keys!1686) (size!28810 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961194 () Bool)

(declare-fun e!541909 () Bool)

(declare-fun tp_is_empty!21413 () Bool)

(assert (=> b!961194 (= e!541909 tp_is_empty!21413)))

(declare-fun b!961195 () Bool)

(declare-fun e!541908 () Bool)

(assert (=> b!961195 (= e!541908 tp_is_empty!21413)))

(declare-fun b!961196 () Bool)

(declare-datatypes ((List!19683 0))(
  ( (Nil!19680) (Cons!19679 (h!20841 (_ BitVec 64)) (t!28046 List!19683)) )
))
(declare-fun noDuplicate!1367 (List!19683) Bool)

(assert (=> b!961196 (= e!541907 (not (noDuplicate!1367 Nil!19680)))))

(declare-fun res!643336 () Bool)

(assert (=> start!82456 (=> (not res!643336) (not e!541907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82456 (= res!643336 (validMask!0 mask!2110))))

(assert (=> start!82456 e!541907))

(assert (=> start!82456 true))

(declare-fun e!541910 () Bool)

(declare-fun array_inv!21953 (array!58921) Bool)

(assert (=> start!82456 (and (array_inv!21953 _values!1400) e!541910)))

(declare-fun array_inv!21954 (array!58919) Bool)

(assert (=> start!82456 (array_inv!21954 _keys!1686)))

(declare-fun b!961197 () Bool)

(declare-fun res!643335 () Bool)

(assert (=> b!961197 (=> (not res!643335) (not e!541907))))

(assert (=> b!961197 (= res!643335 (and (bvsle #b00000000000000000000000000000000 (size!28809 _keys!1686)) (bvslt (size!28809 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun b!961198 () Bool)

(declare-fun mapRes!34108 () Bool)

(assert (=> b!961198 (= e!541910 (and e!541909 mapRes!34108))))

(declare-fun condMapEmpty!34108 () Bool)

(declare-fun mapDefault!34108 () ValueCell!10225)

