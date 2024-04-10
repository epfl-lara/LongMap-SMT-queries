; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82492 () Bool)

(assert start!82492)

(declare-fun res!643458 () Bool)

(declare-fun e!542075 () Bool)

(assert (=> start!82492 (=> (not res!643458) (not e!542075))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82492 (= res!643458 (validMask!0 mask!2110))))

(assert (=> start!82492 e!542075))

(assert (=> start!82492 true))

(declare-datatypes ((V!33553 0))(
  ( (V!33554 (val!10764 Int)) )
))
(declare-datatypes ((ValueCell!10232 0))(
  ( (ValueCellFull!10232 (v!13322 V!33553)) (EmptyCell!10232) )
))
(declare-datatypes ((array!58951 0))(
  ( (array!58952 (arr!28344 (Array (_ BitVec 32) ValueCell!10232)) (size!28823 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58951)

(declare-fun e!542072 () Bool)

(declare-fun array_inv!21963 (array!58951) Bool)

(assert (=> start!82492 (and (array_inv!21963 _values!1400) e!542072)))

(declare-datatypes ((array!58953 0))(
  ( (array!58954 (arr!28345 (Array (_ BitVec 32) (_ BitVec 64))) (size!28824 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58953)

(declare-fun array_inv!21964 (array!58953) Bool)

(assert (=> start!82492 (array_inv!21964 _keys!1686)))

(declare-fun b!961406 () Bool)

(declare-fun e!542074 () Bool)

(declare-fun tp_is_empty!21427 () Bool)

(assert (=> b!961406 (= e!542074 tp_is_empty!21427)))

(declare-fun mapIsEmpty!34135 () Bool)

(declare-fun mapRes!34135 () Bool)

(assert (=> mapIsEmpty!34135 mapRes!34135))

(declare-fun b!961407 () Bool)

(declare-fun res!643459 () Bool)

(assert (=> b!961407 (=> (not res!643459) (not e!542075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58953 (_ BitVec 32)) Bool)

(assert (=> b!961407 (= res!643459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34135 () Bool)

(declare-fun tp!65064 () Bool)

(assert (=> mapNonEmpty!34135 (= mapRes!34135 (and tp!65064 e!542074))))

(declare-fun mapKey!34135 () (_ BitVec 32))

(declare-fun mapRest!34135 () (Array (_ BitVec 32) ValueCell!10232))

(declare-fun mapValue!34135 () ValueCell!10232)

(assert (=> mapNonEmpty!34135 (= (arr!28344 _values!1400) (store mapRest!34135 mapKey!34135 mapValue!34135))))

(declare-fun b!961408 () Bool)

(declare-fun e!542071 () Bool)

(assert (=> b!961408 (= e!542071 tp_is_empty!21427)))

(declare-fun b!961409 () Bool)

(declare-fun res!643457 () Bool)

(assert (=> b!961409 (=> (not res!643457) (not e!542075))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961409 (= res!643457 (and (= (size!28823 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28824 _keys!1686) (size!28823 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961410 () Bool)

(assert (=> b!961410 (= e!542075 false)))

(declare-fun lt!430750 () Bool)

(declare-datatypes ((List!19689 0))(
  ( (Nil!19686) (Cons!19685 (h!20847 (_ BitVec 64)) (t!28052 List!19689)) )
))
(declare-fun arrayNoDuplicates!0 (array!58953 (_ BitVec 32) List!19689) Bool)

(assert (=> b!961410 (= lt!430750 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19686))))

(declare-fun b!961411 () Bool)

(assert (=> b!961411 (= e!542072 (and e!542071 mapRes!34135))))

(declare-fun condMapEmpty!34135 () Bool)

(declare-fun mapDefault!34135 () ValueCell!10232)

