; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82498 () Bool)

(assert start!82498)

(declare-fun b!961460 () Bool)

(declare-fun e!542118 () Bool)

(declare-fun tp_is_empty!21433 () Bool)

(assert (=> b!961460 (= e!542118 tp_is_empty!21433)))

(declare-fun b!961461 () Bool)

(declare-fun e!542120 () Bool)

(assert (=> b!961461 (= e!542120 tp_is_empty!21433)))

(declare-fun mapNonEmpty!34144 () Bool)

(declare-fun mapRes!34144 () Bool)

(declare-fun tp!65073 () Bool)

(assert (=> mapNonEmpty!34144 (= mapRes!34144 (and tp!65073 e!542120))))

(declare-datatypes ((V!33561 0))(
  ( (V!33562 (val!10767 Int)) )
))
(declare-datatypes ((ValueCell!10235 0))(
  ( (ValueCellFull!10235 (v!13325 V!33561)) (EmptyCell!10235) )
))
(declare-fun mapRest!34144 () (Array (_ BitVec 32) ValueCell!10235))

(declare-datatypes ((array!58963 0))(
  ( (array!58964 (arr!28350 (Array (_ BitVec 32) ValueCell!10235)) (size!28829 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58963)

(declare-fun mapKey!34144 () (_ BitVec 32))

(declare-fun mapValue!34144 () ValueCell!10235)

(assert (=> mapNonEmpty!34144 (= (arr!28350 _values!1400) (store mapRest!34144 mapKey!34144 mapValue!34144))))

(declare-fun b!961462 () Bool)

(declare-fun res!643486 () Bool)

(declare-fun e!542116 () Bool)

(assert (=> b!961462 (=> (not res!643486) (not e!542116))))

(declare-datatypes ((array!58965 0))(
  ( (array!58966 (arr!28351 (Array (_ BitVec 32) (_ BitVec 64))) (size!28830 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58965)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58965 (_ BitVec 32)) Bool)

(assert (=> b!961462 (= res!643486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34144 () Bool)

(assert (=> mapIsEmpty!34144 mapRes!34144))

(declare-fun res!643485 () Bool)

(assert (=> start!82498 (=> (not res!643485) (not e!542116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82498 (= res!643485 (validMask!0 mask!2110))))

(assert (=> start!82498 e!542116))

(assert (=> start!82498 true))

(declare-fun e!542117 () Bool)

(declare-fun array_inv!21969 (array!58963) Bool)

(assert (=> start!82498 (and (array_inv!21969 _values!1400) e!542117)))

(declare-fun array_inv!21970 (array!58965) Bool)

(assert (=> start!82498 (array_inv!21970 _keys!1686)))

(declare-fun b!961463 () Bool)

(assert (=> b!961463 (= e!542116 false)))

(declare-fun lt!430759 () Bool)

(declare-datatypes ((List!19691 0))(
  ( (Nil!19688) (Cons!19687 (h!20849 (_ BitVec 64)) (t!28054 List!19691)) )
))
(declare-fun arrayNoDuplicates!0 (array!58965 (_ BitVec 32) List!19691) Bool)

(assert (=> b!961463 (= lt!430759 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19688))))

(declare-fun b!961464 () Bool)

(assert (=> b!961464 (= e!542117 (and e!542118 mapRes!34144))))

(declare-fun condMapEmpty!34144 () Bool)

(declare-fun mapDefault!34144 () ValueCell!10235)

