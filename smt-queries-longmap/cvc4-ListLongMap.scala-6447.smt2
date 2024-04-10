; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82526 () Bool)

(assert start!82526)

(declare-fun mapIsEmpty!34186 () Bool)

(declare-fun mapRes!34186 () Bool)

(assert (=> mapIsEmpty!34186 mapRes!34186))

(declare-fun mapNonEmpty!34186 () Bool)

(declare-fun tp!65115 () Bool)

(declare-fun e!542329 () Bool)

(assert (=> mapNonEmpty!34186 (= mapRes!34186 (and tp!65115 e!542329))))

(declare-datatypes ((V!33597 0))(
  ( (V!33598 (val!10781 Int)) )
))
(declare-datatypes ((ValueCell!10249 0))(
  ( (ValueCellFull!10249 (v!13339 V!33597)) (EmptyCell!10249) )
))
(declare-fun mapRest!34186 () (Array (_ BitVec 32) ValueCell!10249))

(declare-datatypes ((array!59019 0))(
  ( (array!59020 (arr!28378 (Array (_ BitVec 32) ValueCell!10249)) (size!28857 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59019)

(declare-fun mapValue!34186 () ValueCell!10249)

(declare-fun mapKey!34186 () (_ BitVec 32))

(assert (=> mapNonEmpty!34186 (= (arr!28378 _values!1400) (store mapRest!34186 mapKey!34186 mapValue!34186))))

(declare-fun res!643612 () Bool)

(declare-fun e!542328 () Bool)

(assert (=> start!82526 (=> (not res!643612) (not e!542328))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82526 (= res!643612 (validMask!0 mask!2110))))

(assert (=> start!82526 e!542328))

(assert (=> start!82526 true))

(declare-fun e!542330 () Bool)

(declare-fun array_inv!21993 (array!59019) Bool)

(assert (=> start!82526 (and (array_inv!21993 _values!1400) e!542330)))

(declare-datatypes ((array!59021 0))(
  ( (array!59022 (arr!28379 (Array (_ BitVec 32) (_ BitVec 64))) (size!28858 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59021)

(declare-fun array_inv!21994 (array!59021) Bool)

(assert (=> start!82526 (array_inv!21994 _keys!1686)))

(declare-fun b!961712 () Bool)

(declare-fun tp_is_empty!21461 () Bool)

(assert (=> b!961712 (= e!542329 tp_is_empty!21461)))

(declare-fun b!961713 () Bool)

(declare-fun res!643610 () Bool)

(assert (=> b!961713 (=> (not res!643610) (not e!542328))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961713 (= res!643610 (and (= (size!28857 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28858 _keys!1686) (size!28857 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961714 () Bool)

(declare-fun e!542326 () Bool)

(assert (=> b!961714 (= e!542330 (and e!542326 mapRes!34186))))

(declare-fun condMapEmpty!34186 () Bool)

(declare-fun mapDefault!34186 () ValueCell!10249)

