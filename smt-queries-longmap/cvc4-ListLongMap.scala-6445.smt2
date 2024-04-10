; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82514 () Bool)

(assert start!82514)

(declare-fun b!961604 () Bool)

(declare-fun e!542239 () Bool)

(declare-fun tp_is_empty!21449 () Bool)

(assert (=> b!961604 (= e!542239 tp_is_empty!21449)))

(declare-fun mapIsEmpty!34168 () Bool)

(declare-fun mapRes!34168 () Bool)

(assert (=> mapIsEmpty!34168 mapRes!34168))

(declare-fun b!961606 () Bool)

(declare-fun res!643558 () Bool)

(declare-fun e!542236 () Bool)

(assert (=> b!961606 (=> (not res!643558) (not e!542236))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33581 0))(
  ( (V!33582 (val!10775 Int)) )
))
(declare-datatypes ((ValueCell!10243 0))(
  ( (ValueCellFull!10243 (v!13333 V!33581)) (EmptyCell!10243) )
))
(declare-datatypes ((array!58995 0))(
  ( (array!58996 (arr!28366 (Array (_ BitVec 32) ValueCell!10243)) (size!28845 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58995)

(declare-datatypes ((array!58997 0))(
  ( (array!58998 (arr!28367 (Array (_ BitVec 32) (_ BitVec 64))) (size!28846 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58997)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961606 (= res!643558 (and (= (size!28845 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28846 _keys!1686) (size!28845 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34168 () Bool)

(declare-fun tp!65097 () Bool)

(declare-fun e!542237 () Bool)

(assert (=> mapNonEmpty!34168 (= mapRes!34168 (and tp!65097 e!542237))))

(declare-fun mapValue!34168 () ValueCell!10243)

(declare-fun mapKey!34168 () (_ BitVec 32))

(declare-fun mapRest!34168 () (Array (_ BitVec 32) ValueCell!10243))

(assert (=> mapNonEmpty!34168 (= (arr!28366 _values!1400) (store mapRest!34168 mapKey!34168 mapValue!34168))))

(declare-fun b!961607 () Bool)

(assert (=> b!961607 (= e!542236 false)))

(declare-fun lt!430783 () Bool)

(declare-datatypes ((List!19696 0))(
  ( (Nil!19693) (Cons!19692 (h!20854 (_ BitVec 64)) (t!28059 List!19696)) )
))
(declare-fun arrayNoDuplicates!0 (array!58997 (_ BitVec 32) List!19696) Bool)

(assert (=> b!961607 (= lt!430783 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19693))))

(declare-fun res!643557 () Bool)

(assert (=> start!82514 (=> (not res!643557) (not e!542236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82514 (= res!643557 (validMask!0 mask!2110))))

(assert (=> start!82514 e!542236))

(assert (=> start!82514 true))

(declare-fun e!542238 () Bool)

(declare-fun array_inv!21983 (array!58995) Bool)

(assert (=> start!82514 (and (array_inv!21983 _values!1400) e!542238)))

(declare-fun array_inv!21984 (array!58997) Bool)

(assert (=> start!82514 (array_inv!21984 _keys!1686)))

(declare-fun b!961605 () Bool)

(assert (=> b!961605 (= e!542238 (and e!542239 mapRes!34168))))

(declare-fun condMapEmpty!34168 () Bool)

(declare-fun mapDefault!34168 () ValueCell!10243)

