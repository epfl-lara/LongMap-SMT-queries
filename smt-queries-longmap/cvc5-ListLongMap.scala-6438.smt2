; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82438 () Bool)

(assert start!82438)

(declare-fun res!643276 () Bool)

(declare-fun e!541819 () Bool)

(assert (=> start!82438 (=> (not res!643276) (not e!541819))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82438 (= res!643276 (validMask!0 mask!2110))))

(assert (=> start!82438 e!541819))

(assert (=> start!82438 true))

(declare-datatypes ((V!33521 0))(
  ( (V!33522 (val!10752 Int)) )
))
(declare-datatypes ((ValueCell!10220 0))(
  ( (ValueCellFull!10220 (v!13309 V!33521)) (EmptyCell!10220) )
))
(declare-datatypes ((array!58897 0))(
  ( (array!58898 (arr!28320 (Array (_ BitVec 32) ValueCell!10220)) (size!28799 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58897)

(declare-fun e!541821 () Bool)

(declare-fun array_inv!21945 (array!58897) Bool)

(assert (=> start!82438 (and (array_inv!21945 _values!1400) e!541821)))

(declare-datatypes ((array!58899 0))(
  ( (array!58900 (arr!28321 (Array (_ BitVec 32) (_ BitVec 64))) (size!28800 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58899)

(declare-fun array_inv!21946 (array!58899) Bool)

(assert (=> start!82438 (array_inv!21946 _keys!1686)))

(declare-fun b!961074 () Bool)

(declare-fun res!643275 () Bool)

(assert (=> b!961074 (=> (not res!643275) (not e!541819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58899 (_ BitVec 32)) Bool)

(assert (=> b!961074 (= res!643275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961075 () Bool)

(declare-fun e!541817 () Bool)

(declare-fun tp_is_empty!21403 () Bool)

(assert (=> b!961075 (= e!541817 tp_is_empty!21403)))

(declare-fun mapIsEmpty!34090 () Bool)

(declare-fun mapRes!34090 () Bool)

(assert (=> mapIsEmpty!34090 mapRes!34090))

(declare-fun b!961076 () Bool)

(declare-fun e!541820 () Bool)

(assert (=> b!961076 (= e!541820 tp_is_empty!21403)))

(declare-fun b!961077 () Bool)

(assert (=> b!961077 (= e!541821 (and e!541820 mapRes!34090))))

(declare-fun condMapEmpty!34090 () Bool)

(declare-fun mapDefault!34090 () ValueCell!10220)

