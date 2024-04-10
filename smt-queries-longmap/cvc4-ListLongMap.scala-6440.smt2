; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82472 () Bool)

(assert start!82472)

(declare-fun b!961297 () Bool)

(declare-fun res!643401 () Bool)

(declare-fun e!541982 () Bool)

(assert (=> b!961297 (=> (not res!643401) (not e!541982))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!58933 0))(
  ( (array!58934 (arr!28336 (Array (_ BitVec 32) (_ BitVec 64))) (size!28815 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58933)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-datatypes ((V!33541 0))(
  ( (V!33542 (val!10760 Int)) )
))
(declare-datatypes ((ValueCell!10228 0))(
  ( (ValueCellFull!10228 (v!13317 V!33541)) (EmptyCell!10228) )
))
(declare-datatypes ((array!58935 0))(
  ( (array!58936 (arr!28337 (Array (_ BitVec 32) ValueCell!10228)) (size!28816 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58935)

(assert (=> b!961297 (= res!643401 (and (= (size!28816 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28815 _keys!1686) (size!28816 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961298 () Bool)

(declare-fun res!643403 () Bool)

(assert (=> b!961298 (=> (not res!643403) (not e!541982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58933 (_ BitVec 32)) Bool)

(assert (=> b!961298 (= res!643403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961299 () Bool)

(declare-fun e!541986 () Bool)

(assert (=> b!961299 (= e!541982 e!541986)))

(declare-fun res!643402 () Bool)

(assert (=> b!961299 (=> res!643402 e!541986)))

(declare-datatypes ((List!19686 0))(
  ( (Nil!19683) (Cons!19682 (h!20844 (_ BitVec 64)) (t!28049 List!19686)) )
))
(declare-fun contains!5395 (List!19686 (_ BitVec 64)) Bool)

(assert (=> b!961299 (= res!643402 (contains!5395 Nil!19683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!961300 () Bool)

(declare-fun res!643399 () Bool)

(assert (=> b!961300 (=> (not res!643399) (not e!541982))))

(declare-fun noDuplicate!1369 (List!19686) Bool)

(assert (=> b!961300 (= res!643399 (noDuplicate!1369 Nil!19683))))

(declare-fun mapNonEmpty!34120 () Bool)

(declare-fun mapRes!34120 () Bool)

(declare-fun tp!65049 () Bool)

(declare-fun e!541981 () Bool)

(assert (=> mapNonEmpty!34120 (= mapRes!34120 (and tp!65049 e!541981))))

(declare-fun mapKey!34120 () (_ BitVec 32))

(declare-fun mapRest!34120 () (Array (_ BitVec 32) ValueCell!10228))

(declare-fun mapValue!34120 () ValueCell!10228)

(assert (=> mapNonEmpty!34120 (= (arr!28337 _values!1400) (store mapRest!34120 mapKey!34120 mapValue!34120))))

(declare-fun res!643398 () Bool)

(assert (=> start!82472 (=> (not res!643398) (not e!541982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82472 (= res!643398 (validMask!0 mask!2110))))

(assert (=> start!82472 e!541982))

(assert (=> start!82472 true))

(declare-fun e!541983 () Bool)

(declare-fun array_inv!21957 (array!58935) Bool)

(assert (=> start!82472 (and (array_inv!21957 _values!1400) e!541983)))

(declare-fun array_inv!21958 (array!58933) Bool)

(assert (=> start!82472 (array_inv!21958 _keys!1686)))

(declare-fun b!961301 () Bool)

(declare-fun e!541985 () Bool)

(assert (=> b!961301 (= e!541983 (and e!541985 mapRes!34120))))

(declare-fun condMapEmpty!34120 () Bool)

(declare-fun mapDefault!34120 () ValueCell!10228)

